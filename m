Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE0D1CAB78
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 14:44:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jX2M1-0002zo-7V; Fri, 08 May 2020 12:43:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t3Kb=6W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jX2Lz-0002zj-7Z
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 12:43:47 +0000
X-Inumbo-ID: 8dc88ee2-9129-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8dc88ee2-9129-11ea-9887-bc764e2007e4;
 Fri, 08 May 2020 12:43:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9DCE1ACC2;
 Fri,  8 May 2020 12:43:46 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PVH: PHYSDEVOP_pci_mmcfg_reserved should not blindly
 register a region
Message-ID: <2ee1a3cb-3b40-6e6d-5308-1cdf9f6c521e@suse.com>
Date: Fri, 8 May 2020 14:43:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The op has a register/unregister flag, and hence registration shouldn't
happen unilaterally. Introduce unregister_vpci_mmcfg_handler() to handle
this case.

Fixes: eb3dd90e4089 ("x86/physdev: enable PHYSDEVOP_pci_mmcfg_reserved for PVH Dom0")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/io.c
+++ b/xen/arch/x86/hvm/io.c
@@ -558,6 +558,47 @@ int register_vpci_mmcfg_handler(struct d
     return 0;
 }
 
+int unregister_vpci_mmcfg_handler(struct domain *d, paddr_t addr,
+                                  unsigned int start_bus, unsigned int end_bus,
+                                  unsigned int seg)
+{
+    struct hvm_mmcfg *mmcfg;
+    int rc = -ENOENT;
+
+    ASSERT(is_hardware_domain(d));
+
+    if ( start_bus > end_bus )
+        return -EINVAL;
+
+    write_lock(&d->arch.hvm.mmcfg_lock);
+
+    list_for_each_entry ( mmcfg, &d->arch.hvm.mmcfg_regions, next )
+        if ( mmcfg->addr == addr + (start_bus << 20) &&
+             mmcfg->segment == seg &&
+             mmcfg->start_bus == start_bus &&
+             mmcfg->size == ((end_bus - start_bus + 1) << 20) )
+        {
+            list_del(&mmcfg->next);
+            if ( !list_empty(&d->arch.hvm.mmcfg_regions) )
+                xfree(mmcfg);
+            else
+            {
+                /*
+                 * Cannot unregister the MMIO handler - leave a fake entry
+                 * on the list.
+                 */
+                memset(mmcfg, 0, sizeof(*mmcfg));
+                list_add(&mmcfg->next, &d->arch.hvm.mmcfg_regions);
+            }
+            rc = 0;
+            break;
+        }
+
+    write_unlock(&d->arch.hvm.mmcfg_lock);
+
+    return rc;
+}
+
 void destroy_vpci_mmcfg(struct domain *d)
 {
     struct list_head *mmcfg_regions = &d->arch.hvm.mmcfg_regions;
--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -559,12 +559,18 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
         if ( !ret && has_vpci(currd) )
         {
             /*
-             * For HVM (PVH) domains try to add the newly found MMCFG to the
-             * domain.
+             * For HVM (PVH) domains try to add/remove the reported MMCFG
+             * to/from the domain.
              */
-            ret = register_vpci_mmcfg_handler(currd, info.address,
-                                              info.start_bus, info.end_bus,
-                                              info.segment);
+            if ( info.flags & XEN_PCI_MMCFG_RESERVED )
+                ret = register_vpci_mmcfg_handler(currd, info.address,
+                                                  info.start_bus, info.end_bus,
+                                                  info.segment);
+            else
+                ret = unregister_vpci_mmcfg_handler(currd, info.address,
+                                                    info.start_bus,
+                                                    info.end_bus,
+                                                    info.segment);
         }
 
         break;
--- a/xen/include/asm-x86/hvm/io.h
+++ b/xen/include/asm-x86/hvm/io.h
@@ -178,6 +178,9 @@ void register_vpci_portio_handler(struct
 int register_vpci_mmcfg_handler(struct domain *d, paddr_t addr,
                                 unsigned int start_bus, unsigned int end_bus,
                                 unsigned int seg);
+int unregister_vpci_mmcfg_handler(struct domain *d, paddr_t addr,
+                                  unsigned int start_bus, unsigned int end_bus,
+                                  unsigned int seg);
 /* Destroy tracked MMCFG areas. */
 void destroy_vpci_mmcfg(struct domain *d);
 

