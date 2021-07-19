Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEF13CD39E
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jul 2021 13:15:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158356.291563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5REj-0004WU-SY; Mon, 19 Jul 2021 11:15:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158356.291563; Mon, 19 Jul 2021 11:15:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5REj-0004TQ-P2; Mon, 19 Jul 2021 11:15:01 +0000
Received: by outflank-mailman (input) for mailman id 158356;
 Mon, 19 Jul 2021 11:15:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MZur=ML=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m5REi-0004TK-1x
 for xen-devel@lists.xenproject.org; Mon, 19 Jul 2021 11:15:00 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4da9183d-1fb9-41e9-be5f-269a387ba37f;
 Mon, 19 Jul 2021 11:14:58 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 4da9183d-1fb9-41e9-be5f-269a387ba37f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626693298;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vOax3+NH7v5YogFbZz9PxP5opgpSyJwGRAqiR/4lTDM=;
  b=J0J2FHQAHkDLZp+4AIzX0NYhq13kj55a+9Czvh2e8N9OnDDCuR7sRrFL
   fKJ3UN7h92mLMxRqANlreHa4sG0XQPIwSiaa8vpWUG0brczgYhy/H5rCc
   IoD4eqt6Gg71/HqGGUkRjc7pZppkOXeWC56vrY7/HUUaqOo+dOyWDro9s
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: dT0JMVsJCMbXIwje6y29gsCetd4Sq95HhqSLYkttjKlY8Wapf5Kr83ekJHCCMqpctTorRKf13g
 oMKJHQPXUGTseu9MDmpanTk8WugParkPzOOU3vSgNkJc46a5fteGEuAsQ+1d/uoKyp4a3F18Gv
 0KWhf+33A7CKOfa3OGwLg3u1Qs9fPtUNIr1u5bMkgCYTFqAziSd455+HRFGeSZ3eDwIYI3gYv2
 9CrLpZsSWey08kjQlifaGEpU9C85gzfqSPcVaXok5aziiwIX+XQHONvhSF11N7yy4J2Q1sXlDR
 rs9JlRHSorQcgvkRe2W7JUq1
X-SBRS: 5.1
X-MesageID: 48242883
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:BtZIm60jOjDB6HHXLmh0GwqjBLwkLtp133Aq2lEZdPRUGvb4qy
 nIpoV86faUskd3ZJhOo6HiBEDtexzhHP1OkO0s1NWZLWvbUQKTRekIh+aP/9SJIVyGygc378
 ddmsZFZuEYdWIK6PrH3A==
X-IronPort-AV: E=Sophos;i="5.84,252,1620705600"; 
   d="scan'208";a="48242883"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Igor Druzhinin
	<igor.druzhinin@citrix.com>
Subject: [PATCH] x86/hvm: Propagate real error information up through hvm_load()
Date: Mon, 19 Jul 2021 12:14:49 +0100
Message-ID: <20210719111449.21337-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

hvm_load() is currently a mix of -errno and -1 style error handling, which
aliases -EPERM.  This leads to the following confusing diagnostics:

From userspace:
  xc: info: Restoring domain
  xc: error: Unable to restore HVM context (1 = Operation not permitted): Internal error
  xc: error: Restore failed (1 = Operation not permitted): Internal error
  xc_domain_restore: [1] Restore failed (1 = Operation not permitted)

From Xen:
  (XEN) HVM10.0 restore: inconsistent xsave state (feat=0x2ff accum=0x21f xcr0=0x7 bv=0x3 err=-22)
  (XEN) HVM10 restore: failed to load entry 16/0

The actual error was a bad backport, but the -EINVAL got converted to -EPERM
on the way out of the hypercall.

The overwhelming majority of *_load() handlers already use -errno consistenty.
Fix up the rest to be consistent, and fix a few other errors noticed along the
way.

 * Failures of hvm_load_entry() indicate a truncated record or other bad data
   size.  Use -ENODATA.
 * Don't use {g,}dprintk().  Omitting diagnostics in release builds is rude,
   and almost everything uses unconditional printk()'s.
 * Switch some errors for more appropriate ones.

Reported-by: Igor Druzhinin <igor.druzhinin@citrix.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Igor Druzhinin <igor.druzhinin@citrix.com>
---
 xen/arch/x86/cpu/mcheck/vmce.c |  6 +++---
 xen/arch/x86/emul-i8254.c      |  9 +++++----
 xen/arch/x86/hvm/irq.c         |  6 +++---
 xen/arch/x86/hvm/save.c        | 25 ++++++++++++++-----------
 xen/arch/x86/hvm/vioapic.c     |  5 ++++-
 xen/arch/x86/hvm/vpic.c        |  2 +-
 6 files changed, 30 insertions(+), 23 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/vmce.c b/xen/arch/x86/cpu/mcheck/vmce.c
index b1df9e9efd66..eb6434a3ba20 100644
--- a/xen/arch/x86/cpu/mcheck/vmce.c
+++ b/xen/arch/x86/cpu/mcheck/vmce.c
@@ -82,11 +82,11 @@ int vmce_restore_vcpu(struct vcpu *v, const struct hvm_vmce_vcpu *ctxt)
 
     if ( ctxt->caps & ~guest_mcg_cap & ~MCG_CAP_COUNT & ~MCG_CTL_P )
     {
-        dprintk(XENLOG_G_ERR, "%s restore: unsupported MCA capabilities"
-                " %#" PRIx64 " for %pv (supported: %#Lx)\n",
+        printk(XENLOG_G_ERR
+               "%s restore: unsupported MCA capabilities %#"PRIx64" for %pv (supported: %#Lx)\n",
                 is_hvm_vcpu(v) ? "HVM" : "PV", ctxt->caps,
                 v, guest_mcg_cap & ~MCG_CAP_COUNT);
-        return -EPERM;
+        return -EINVAL;
     }
 
     v->arch.vmce.mcg_cap = ctxt->caps;
diff --git a/xen/arch/x86/emul-i8254.c b/xen/arch/x86/emul-i8254.c
index 73be4188ad41..83d7156799c8 100644
--- a/xen/arch/x86/emul-i8254.c
+++ b/xen/arch/x86/emul-i8254.c
@@ -412,7 +412,7 @@ static int pit_save(struct vcpu *v, hvm_domain_context_t *h)
 static int pit_load(struct domain *d, hvm_domain_context_t *h)
 {
     PITState *pit = domain_vpit(d);
-    int i;
+    int i, rc = 0;
 
     if ( !has_vpit(d) )
         return -ENODEV;
@@ -421,8 +421,8 @@ static int pit_load(struct domain *d, hvm_domain_context_t *h)
 
     if ( hvm_load_entry(PIT, h, &pit->hw) )
     {
-        spin_unlock(&pit->lock);
-        return 1;
+        rc = -ENODEV;
+        goto out;
     }
     
     /*
@@ -434,9 +434,10 @@ static int pit_load(struct domain *d, hvm_domain_context_t *h)
     for ( i = 0; i < 3; i++ )
         pit_load_count(pit, i, pit->hw.channels[i].count);
 
+ out:
     spin_unlock(&pit->lock);
 
-    return 0;
+    return rc;
 }
 
 HVM_REGISTER_SAVE_RESTORE(PIT, pit_save, pit_load, 1, HVMSR_PER_DOM);
diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 38ac5fb6c7c2..52aae4565f0c 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -773,9 +773,9 @@ static int irq_load_link(struct domain *d, hvm_domain_context_t *h)
     for ( link = 0; link < 4; link++ )
         if ( hvm_irq->pci_link.route[link] > 15 )
         {
-            gdprintk(XENLOG_ERR, 
-                     "HVM restore: PCI-ISA link %u out of range (%u)\n",
-                     link, hvm_irq->pci_link.route[link]);
+            printk(XENLOG_G_ERR
+                   "HVM restore: PCI-ISA link %u out of range (%u)\n",
+                   link, hvm_irq->pci_link.route[link]);
             return -EINVAL;
         }
 
diff --git a/xen/arch/x86/hvm/save.c b/xen/arch/x86/hvm/save.c
index 584620985bf5..86c82cbd7456 100644
--- a/xen/arch/x86/hvm/save.c
+++ b/xen/arch/x86/hvm/save.c
@@ -51,14 +51,14 @@ int arch_hvm_load(struct domain *d, struct hvm_save_header *hdr)
     {
         printk(XENLOG_G_ERR "HVM%d restore: bad magic number %#"PRIx32"\n",
                d->domain_id, hdr->magic);
-        return -1;
+        return -EINVAL;
     }
 
     if ( hdr->version != HVM_FILE_VERSION )
     {
         printk(XENLOG_G_ERR "HVM%d restore: unsupported version %u\n",
                d->domain_id, hdr->version);
-        return -1;
+        return -EINVAL;
     }
 
     cpuid(1, &eax, &ebx, &ecx, &edx);
@@ -294,16 +294,18 @@ int hvm_load(struct domain *d, hvm_domain_context_t *h)
     struct hvm_save_descriptor *desc;
     hvm_load_handler handler;
     struct vcpu *v;
+    int rc;
 
     if ( d->is_dying )
         return -EINVAL;
 
     /* Read the save header, which must be first */
     if ( hvm_load_entry(HEADER, h, &hdr) != 0 )
-        return -1;
+        return -ENODATA;
 
-    if ( arch_hvm_load(d, &hdr) )
-        return -1;
+    rc = arch_hvm_load(d, &hdr);
+    if ( rc )
+        return rc;
 
     /* Down all the vcpus: we only re-enable the ones that had state saved. */
     for_each_vcpu(d, v)
@@ -318,7 +320,7 @@ int hvm_load(struct domain *d, hvm_domain_context_t *h)
             printk(XENLOG_G_ERR
                    "HVM%d restore: save did not end with a null entry\n",
                    d->domain_id);
-            return -1;
+            return -ENODATA;
         }
 
         /* Read the typecode of the next entry  and check for the end-marker */
@@ -332,17 +334,18 @@ int hvm_load(struct domain *d, hvm_domain_context_t *h)
         {
             printk(XENLOG_G_ERR "HVM%d restore: unknown entry typecode %u\n",
                    d->domain_id, desc->typecode);
-            return -1;
+            return -EINVAL;
         }
 
         /* Load the entry */
         printk(XENLOG_G_INFO "HVM%d restore: %s %"PRIu16"\n", d->domain_id,
                hvm_sr_handlers[desc->typecode].name, desc->instance);
-        if ( handler(d, h) != 0 )
+        rc = handler(d, h);
+        if ( rc )
         {
-            printk(XENLOG_G_ERR "HVM%d restore: failed to load entry %u/%u\n",
-                   d->domain_id, desc->typecode, desc->instance);
-            return -1;
+            printk(XENLOG_G_ERR "HVM%d restore: failed to load entry %u/%u rc %d\n",
+                   d->domain_id, desc->typecode, desc->instance, rc);
+            return rc;
         }
         process_pending_softirqs();
     }
diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 87370dd4172b..553c0f76eff8 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -620,7 +620,10 @@ static int ioapic_load(struct domain *d, hvm_domain_context_t *h)
          d->arch.hvm.nr_vioapics != 1 )
         return -EOPNOTSUPP;
 
-    return hvm_load_entry(IOAPIC, h, &s->domU);
+    if ( hvm_load_entry(IOAPIC, h, &s->domU) )
+        return -ENODATA;
+
+    return 0;
 }
 
 HVM_REGISTER_SAVE_RESTORE(IOAPIC, ioapic_save, ioapic_load, 1, HVMSR_PER_DOM);
diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
index f465b7f9979a..af988a868c8a 100644
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -430,7 +430,7 @@ static int vpic_load(struct domain *d, hvm_domain_context_t *h)
 
     /* Which PIC is this? */
     if ( inst > 1 )
-        return -EINVAL;
+        return -ENOENT;
     s = &d->arch.hvm.vpic[inst];
 
     /* Load the state */
-- 
2.11.0


