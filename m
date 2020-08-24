Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC5924FDE8
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 14:34:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kABfv-0004vQ-PC; Mon, 24 Aug 2020 12:34:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kABft-0004vJ-PZ
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 12:34:09 +0000
X-Inumbo-ID: 52ffa2c0-2c1e-40e4-9d54-cdda31966811
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 52ffa2c0-2c1e-40e4-9d54-cdda31966811;
 Mon, 24 Aug 2020 12:34:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 37AC0AFD1;
 Mon, 24 Aug 2020 12:34:38 +0000 (UTC)
Subject: [PATCH v2 1/5] x86: convert set_gpfn_from_mfn() to a function
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <5d456607-b36b-9802-1021-2e6d01d7f158@suse.com>
Message-ID: <27a76f08-6ce4-71aa-a528-ee2633287576@suse.com>
Date: Mon, 24 Aug 2020 14:34:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <5d456607-b36b-9802-1021-2e6d01d7f158@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

It is already a little too heavy for a macro, and more logic is about to
get added to it.

This also allows reducing the scope of compat_machine_to_phys_mapping.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -40,6 +40,8 @@ EMIT_FILE;
 #include <asm/mem_sharing.h>
 #include <public/memory.h>
 
+#define compat_machine_to_phys_mapping ((unsigned int *)RDWR_COMPAT_MPT_VIRT_START)
+
 unsigned int __read_mostly m2p_compat_vstart = __HYPERVISOR_COMPAT_VIRT_START;
 
 l2_pgentry_t *compat_idle_pg_table_l2;
@@ -1454,6 +1456,20 @@ destroy_frametable:
     return ret;
 }
 
+void set_gpfn_from_mfn(unsigned long mfn, unsigned long pfn)
+{
+    const struct domain *d = page_get_owner(mfn_to_page(_mfn(mfn)));
+    unsigned long entry = (d && (d == dom_cow)) ? SHARED_M2P_ENTRY : pfn;
+
+    if ( unlikely(!machine_to_phys_mapping_valid) )
+        return;
+
+    if ( mfn < (RDWR_COMPAT_MPT_VIRT_END - RDWR_COMPAT_MPT_VIRT_START) / 4 )
+        compat_machine_to_phys_mapping[mfn] = entry;
+
+    machine_to_phys_mapping[mfn] = entry;
+}
+
 #include "compat/mm.c"
 
 /*
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -494,25 +494,13 @@ extern paddr_t mem_hotplug;
 #define SHARED_M2P_ENTRY         (~0UL - 1UL)
 #define SHARED_M2P(_e)           ((_e) == SHARED_M2P_ENTRY)
 
-#define compat_machine_to_phys_mapping ((unsigned int *)RDWR_COMPAT_MPT_VIRT_START)
-#define _set_gpfn_from_mfn(mfn, pfn) ({                        \
-    struct domain *d = page_get_owner(mfn_to_page(_mfn(mfn))); \
-    unsigned long entry = (d && (d == dom_cow)) ?              \
-        SHARED_M2P_ENTRY : (pfn);                              \
-    ((void)((mfn) >= (RDWR_COMPAT_MPT_VIRT_END - RDWR_COMPAT_MPT_VIRT_START) / 4 || \
-            (compat_machine_to_phys_mapping[(mfn)] = (unsigned int)(entry))), \
-     machine_to_phys_mapping[(mfn)] = (entry));                \
-    })
-
 /*
  * Disable some users of set_gpfn_from_mfn() (e.g., free_heap_pages()) until
  * the machine_to_phys_mapping is actually set up.
  */
 extern bool machine_to_phys_mapping_valid;
-#define set_gpfn_from_mfn(mfn, pfn) do {        \
-    if ( machine_to_phys_mapping_valid )        \
-        _set_gpfn_from_mfn(mfn, pfn);           \
-} while (0)
+
+void set_gpfn_from_mfn(unsigned long mfn, unsigned long pfn);
 
 extern struct rangeset *mmio_ro_ranges;
 


