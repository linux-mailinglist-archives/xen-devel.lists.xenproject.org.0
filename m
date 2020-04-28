Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E54B31BBD72
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 14:22:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTPFJ-0002Wd-97; Tue, 28 Apr 2020 12:21:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/MZc=6M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jTPFH-0002WW-Ia
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 12:21:51 +0000
X-Inumbo-ID: d659f13d-894a-11ea-9851-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d659f13d-894a-11ea-9851-12813bfff9fa;
 Tue, 28 Apr 2020 12:21:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 360C1ABC2;
 Tue, 28 Apr 2020 12:21:49 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/pass-through: avoid double IRQ unbind during domain
 cleanup
Message-ID: <6fddc420-b582-cb2f-92ce-b3e067c420c4@suse.com>
Date: Tue, 28 Apr 2020 14:21:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Varad Gautam <vrd@amazon.de>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

XEN_DOMCTL_destroydomain creates a continuation if domain_kill -ERESTARTs.
In that scenario, it is possible to receive multiple _pirq_guest_unbind
calls for the same pirq from domain_kill, if the pirq has not yet been
removed from the domain's pirq_tree, as:
  domain_kill()
    -> domain_relinquish_resources()
      -> pci_release_devices()
        -> pci_clean_dpci_irq()
          -> pirq_guest_unbind()
            -> __pirq_guest_unbind()

Avoid recurring invocations of pirq_guest_unbind() by removing the pIRQ
from the tree being iterated after the first call there. In case such a
removed entry still has a softirq outstanding, record it and re-check
upon re-invocation.

Reported-by: Varad Gautam <vrd@amazon.de>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Tested-by: Varad Gautam <vrd@amazon.de>

--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -1323,7 +1323,7 @@ void (pirq_cleanup_check)(struct pirq *p
     }
 
     if ( radix_tree_delete(&d->pirq_tree, pirq->pirq) != pirq )
-        BUG();
+        BUG_ON(!d->is_dying);
 }
 
 /* Flush all ready EOIs from the top of this CPU's pending-EOI stack. */
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -873,7 +873,14 @@ static int pci_clean_dpci_irq(struct dom
         xfree(digl);
     }
 
-    return pt_pirq_softirq_active(pirq_dpci) ? -ERESTART : 0;
+    radix_tree_delete(&d->pirq_tree, dpci_pirq(pirq_dpci)->pirq);
+
+    if ( !pt_pirq_softirq_active(pirq_dpci) )
+        return 0;
+
+    domain_get_irq_dpci(d)->pending_pirq_dpci = pirq_dpci;
+
+    return -ERESTART;
 }
 
 static int pci_clean_dpci_irqs(struct domain *d)
@@ -890,8 +897,18 @@ static int pci_clean_dpci_irqs(struct do
     hvm_irq_dpci = domain_get_irq_dpci(d);
     if ( hvm_irq_dpci != NULL )
     {
-        int ret = pt_pirq_iterate(d, pci_clean_dpci_irq, NULL);
+        int ret = 0;
+
+        if ( hvm_irq_dpci->pending_pirq_dpci )
+        {
+            if ( pt_pirq_softirq_active(hvm_irq_dpci->pending_pirq_dpci) )
+                 ret = -ERESTART;
+            else
+                 hvm_irq_dpci->pending_pirq_dpci = NULL;
+        }
 
+        if ( !ret )
+            ret = pt_pirq_iterate(d, pci_clean_dpci_irq, NULL);
         if ( ret )
         {
             spin_unlock(&d->event_lock);
--- a/xen/include/asm-x86/hvm/irq.h
+++ b/xen/include/asm-x86/hvm/irq.h
@@ -158,6 +158,8 @@ struct hvm_irq_dpci {
     DECLARE_BITMAP(isairq_map, NR_ISAIRQS);
     /* Record of mapped Links */
     uint8_t link_cnt[NR_LINK];
+    /* Clean up: Entry with a softirq invocation pending / in progress. */
+    struct hvm_pirq_dpci *pending_pirq_dpci;
 };
 
 /* Machine IRQ to guest device/intx mapping. */

