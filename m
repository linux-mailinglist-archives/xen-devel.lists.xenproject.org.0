Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8397127E6DD
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 12:41:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549.1869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNZYG-00012S-7s; Wed, 30 Sep 2020 10:41:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549.1869; Wed, 30 Sep 2020 10:41:36 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNZYF-00010Y-Q6; Wed, 30 Sep 2020 10:41:35 +0000
Received: by outflank-mailman (input) for mailman id 549;
 Wed, 30 Sep 2020 10:41:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=153E=DH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kNZYD-0000iF-TU
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:41:33 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69106dbb-003e-4fc1-a932-2ff73a249f3c;
 Wed, 30 Sep 2020 10:41:28 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=153E=DH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kNZYD-0000iF-TU
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:41:33 +0000
X-Inumbo-ID: 69106dbb-003e-4fc1-a932-2ff73a249f3c
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 69106dbb-003e-4fc1-a932-2ff73a249f3c;
	Wed, 30 Sep 2020 10:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601462488;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qWWnnw4nKqeB59UsimYiwSnUtGamxVFo5YVY8HDEpeQ=;
  b=T4rACLpq0FpJ/UEtZTnoTNIwKzwBTR735rQSa42cfuBHTx/R6XkIgSBu
   Oxmv9KGOQeJ+7TFhmKzWx1dXzZh0L8Bw5hccWWUR8NNANZqdnjrJAyiTt
   xG5Du7jkraeR+Tdkieg7XyTs78RuyUSkSHMuc1GuP6eXJxsWsRoDKPHQI
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: lkwkuh7J+v051oB/+0af56KTL7Yea/naDIiYCcPuR86KbIp9eHtmePtKTAYzrvtbcPKkSPGcdQ
 1eiBowB9EXGOc4MVXf4xe8shBp5ciQF+SVRuel3MvjZ3afQBkK49QpY6qJIofbGTk7Tprql2iN
 5V8d9VVMs8bpCQyCzDo3nrCmqS90vhsq+mQooPMgYvv5Zfz+p82CkuWAi2cQRnxnva2uogxbnB
 xRI4BVZibTawEBFfdMAHNW4Ue/Tvz/z2T1g7tvSnCOD2sD+ViA7uXji54wHAmKNBQldjb0S6hu
 SOs=
X-SBRS: None
X-MesageID: 28041979
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,322,1596513600"; 
   d="scan'208";a="28041979"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 06/11] x86/hvm: allowing registering EOI callbacks for GSIs
Date: Wed, 30 Sep 2020 12:41:03 +0200
Message-ID: <20200930104108.35969-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930104108.35969-1-roger.pau@citrix.com>
References: <20200930104108.35969-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Such callbacks will be executed once a EOI is performed by the guest,
regardless of whether the interrupts are injected from the vIO-APIC or
the vPIC, as ISA IRQs are translated to GSIs and then the
corresponding callback is executed at EOI.

The vIO-APIC infrastructure for handling EOIs is build on top of the
existing vlapic EOI callback functionality, while the vPIC one is
handled when writing to the vPIC EOI register.

Note that such callbacks need to be registered and de-registered, and
that a single GSI can have multiple callbacks associated. That's
because GSIs can be level triggered and shared, as that's the case
with legacy PCI interrupts shared between several devices.

Strictly speaking this is a non-functional change, since there are no
users of this new interface introduced by this change.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 xen/arch/x86/hvm/hvm.c        | 15 ++++++++-
 xen/arch/x86/hvm/irq.c        | 60 +++++++++++++++++++++++++++++++++++
 xen/arch/x86/hvm/vioapic.c    | 22 +++++++++----
 xen/arch/x86/hvm/vpic.c       |  5 +++
 xen/include/asm-x86/hvm/irq.h | 20 ++++++++++++
 5 files changed, 114 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 2dfda93e09..9636ac6bf1 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -608,7 +608,7 @@ static int hvm_print_line(
 
 int hvm_domain_initialise(struct domain *d)
 {
-    unsigned int nr_gsis;
+    unsigned int nr_gsis, i;
     int rc;
 
     if ( !hvm_enabled )
@@ -655,6 +655,14 @@ int hvm_domain_initialise(struct domain *d)
     BUILD_BUG_ON(NR_HVM_DOMU_IRQS < NR_ISAIRQS);
     ASSERT(hvm_domain_irq(d)->nr_gsis >= NR_ISAIRQS);
 
+    /* Initialize the EOI callback list. */
+    hvm_domain_irq(d)->gsi_callbacks = xmalloc_array(struct list_head, nr_gsis);
+    if ( !hvm_domain_irq(d)->gsi_callbacks )
+        goto fail1;
+    rwlock_init(&hvm_domain_irq(d)->gsi_callbacks_lock);
+    for ( i = 0; i < nr_gsis; i++ )
+        INIT_LIST_HEAD(&hvm_domain_irq(d)->gsi_callbacks[i]);
+
     /* need link to containing domain */
     d->arch.hvm.pl_time->domain = d;
 
@@ -714,6 +722,8 @@ int hvm_domain_initialise(struct domain *d)
  fail1:
     if ( is_hardware_domain(d) )
         xfree(d->arch.hvm.io_bitmap);
+    if ( hvm_domain_irq(d) )
+        XFREE(hvm_domain_irq(d)->gsi_callbacks);
     XFREE(d->arch.hvm.io_handler);
     XFREE(d->arch.hvm.params);
     XFREE(d->arch.hvm.pl_time);
@@ -776,6 +786,9 @@ void hvm_domain_destroy(struct domain *d)
     vioapic_deinit(d);
 
     XFREE(d->arch.hvm.pl_time);
+
+    if ( hvm_domain_irq(d) )
+        XFREE(hvm_domain_irq(d)->gsi_callbacks);
     XFREE(d->arch.hvm.irq);
 
     list_for_each_safe ( ioport_list, tmp, &d->arch.hvm.g2m_ioport_list )
diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 38ac5fb6c7..aedd390163 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -595,6 +595,66 @@ int hvm_local_events_need_delivery(struct vcpu *v)
     return !hvm_interrupt_blocked(v, intack);
 }
 
+int hvm_gsi_register_callback(struct domain *d, unsigned int gsi,
+                              struct hvm_gsi_eoi_callback *cb)
+{
+    if ( gsi >= hvm_domain_irq(d)->nr_gsis )
+    {
+        ASSERT_UNREACHABLE();
+        return -EINVAL;
+    }
+
+    write_lock(&hvm_domain_irq(d)->gsi_callbacks_lock);
+    list_add(&cb->list, &hvm_domain_irq(d)->gsi_callbacks[gsi]);
+    write_unlock(&hvm_domain_irq(d)->gsi_callbacks_lock);
+
+    return 0;
+}
+
+void hvm_gsi_unregister_callback(struct domain *d, unsigned int gsi,
+                                 struct hvm_gsi_eoi_callback *cb)
+{
+    struct list_head *tmp;
+
+    if ( gsi >= hvm_domain_irq(d)->nr_gsis )
+    {
+        ASSERT_UNREACHABLE();
+        return;
+    }
+
+    write_lock(&hvm_domain_irq(d)->gsi_callbacks_lock);
+    list_for_each ( tmp, &hvm_domain_irq(d)->gsi_callbacks[gsi] )
+        if ( tmp == &cb->list )
+        {
+            list_del(tmp);
+            break;
+        }
+    write_unlock(&hvm_domain_irq(d)->gsi_callbacks_lock);
+}
+
+void hvm_gsi_execute_callbacks(unsigned int gsi, void *data)
+{
+    struct domain *currd = current->domain;
+    struct hvm_gsi_eoi_callback *cb;
+
+    read_lock(&hvm_domain_irq(currd)->gsi_callbacks_lock);
+    list_for_each_entry ( cb, &hvm_domain_irq(currd)->gsi_callbacks[gsi],
+                          list )
+        cb->callback(gsi, cb->data ?: data);
+    read_unlock(&hvm_domain_irq(currd)->gsi_callbacks_lock);
+}
+
+bool hvm_gsi_has_callbacks(struct domain *d, unsigned int gsi)
+{
+    bool has_callbacks;
+
+    read_lock(&hvm_domain_irq(d)->gsi_callbacks_lock);
+    has_callbacks = !list_empty(&hvm_domain_irq(d)->gsi_callbacks[gsi]);
+    read_unlock(&hvm_domain_irq(d)->gsi_callbacks_lock);
+
+    return has_callbacks;
+}
+
 static void irq_dump(struct domain *d)
 {
     struct hvm_irq *hvm_irq = hvm_domain_irq(d);
diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index dce98b1479..03b1350c04 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -393,6 +393,7 @@ static void eoi_callback(unsigned int vector, void *data)
         for ( pin = 0; pin < vioapic->nr_pins; pin++ )
         {
             union vioapic_redir_entry *ent = &vioapic->redirtbl[pin];
+            unsigned int gsi = vioapic->base_gsi + pin;
 
             if ( ent->fields.vector != vector )
                 continue;
@@ -402,13 +403,17 @@ static void eoi_callback(unsigned int vector, void *data)
             if ( is_iommu_enabled(d) )
             {
                 spin_unlock(&d->arch.hvm.irq_lock);
-                hvm_dpci_eoi(vioapic->base_gsi + pin, ent);
+                hvm_dpci_eoi(gsi, ent);
                 spin_lock(&d->arch.hvm.irq_lock);
             }
 
+            spin_unlock(&d->arch.hvm.irq_lock);
+            hvm_gsi_execute_callbacks(gsi, ent);
+            spin_lock(&d->arch.hvm.irq_lock);
+
             if ( (ent->fields.trig_mode == VIOAPIC_LEVEL_TRIG) &&
                  !ent->fields.mask &&
-                 hvm_irq->gsi_assert_count[vioapic->base_gsi + pin] )
+                 hvm_irq->gsi_assert_count[gsi] )
             {
                 ent->fields.remote_irr = 1;
                 vioapic_deliver(vioapic, pin);
@@ -424,7 +429,8 @@ static void ioapic_inj_irq(
     struct vlapic *target,
     uint8_t vector,
     uint8_t trig_mode,
-    uint8_t delivery_mode)
+    uint8_t delivery_mode,
+    bool callback)
 {
     HVM_DBG_LOG(DBG_LEVEL_IOAPIC, "irq %d trig %d deliv %d",
                 vector, trig_mode, delivery_mode);
@@ -433,7 +439,7 @@ static void ioapic_inj_irq(
            (delivery_mode == dest_LowestPrio));
 
     vlapic_set_irq_callback(target, vector, trig_mode,
-                            trig_mode ? eoi_callback : NULL, NULL);
+                            callback ? eoi_callback : NULL, NULL);
 }
 
 static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
@@ -447,6 +453,7 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
     struct vlapic *target;
     struct vcpu *v;
     unsigned int irq = vioapic->base_gsi + pin;
+    bool callback = trig_mode || hvm_gsi_has_callbacks(d, irq);
 
     ASSERT(spin_is_locked(&d->arch.hvm.irq_lock));
 
@@ -473,7 +480,8 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
             target = vlapic_lowest_prio(d, NULL, 0, dest, dest_mode);
         if ( target != NULL )
         {
-            ioapic_inj_irq(vioapic, target, vector, trig_mode, delivery_mode);
+            ioapic_inj_irq(vioapic, target, vector, trig_mode, delivery_mode,
+                           callback);
         }
         else
         {
@@ -488,7 +496,7 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
         for_each_vcpu ( d, v )
             if ( vlapic_match_dest(vcpu_vlapic(v), NULL, 0, dest, dest_mode) )
                 ioapic_inj_irq(vioapic, vcpu_vlapic(v), vector, trig_mode,
-                               delivery_mode);
+                               delivery_mode, callback);
         break;
 
     case dest_NMI:
@@ -620,7 +628,7 @@ static int ioapic_load(struct domain *d, hvm_domain_context_t *h)
          * Add a callback for each possible vector injected by a redirection
          * entry.
          */
-        if ( vector < 16 || !ent->fields.remote_irr ||
+        if ( vector < 16 ||
              (delivery_mode != dest_LowestPrio && delivery_mode != dest_Fixed) )
             continue;
 
diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
index 26f74f4471..09c937c322 100644
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -262,9 +262,14 @@ static void vpic_ioport_write(
                 /* Release lock and EOI the physical interrupt (if any). */
                 vpic_update_int_output(vpic);
                 vpic_unlock(vpic);
+
+                hvm_gsi_execute_callbacks(
+                        hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin),
+                        NULL);
                 hvm_dpci_eoi(hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin),
                              NULL);
                 return; /* bail immediately */
+
             case 6: /* Set Priority                */
                 vpic->priority_add = (val + 1) & 7;
                 break;
diff --git a/xen/include/asm-x86/hvm/irq.h b/xen/include/asm-x86/hvm/irq.h
index 532880d497..db38c3e119 100644
--- a/xen/include/asm-x86/hvm/irq.h
+++ b/xen/include/asm-x86/hvm/irq.h
@@ -21,6 +21,7 @@
 #ifndef __ASM_X86_HVM_IRQ_H__
 #define __ASM_X86_HVM_IRQ_H__
 
+#include <xen/rwlock.h>
 #include <xen/timer.h>
 
 #include <asm/hvm/hvm.h>
@@ -79,6 +80,10 @@ struct hvm_irq {
 
     struct hvm_irq_dpci *dpci;
 
+    /* List of callbacks for GSI EOI events. Protected by irq_lock. */
+    struct list_head  *gsi_callbacks;
+    rwlock_t gsi_callbacks_lock;
+
     /*
      * Number of wires asserting each GSI.
      *
@@ -140,6 +145,13 @@ struct hvm_gmsi_info {
     bool posted; /* directly deliver to guest via VT-d PI? */
 };
 
+typedef void hvm_gsi_eoi_callback_t(unsigned int gsi, void *data);
+struct hvm_gsi_eoi_callback {
+    hvm_gsi_eoi_callback_t *callback;
+    void *data;
+    struct list_head list;
+};
+
 struct hvm_girq_dpci_mapping {
     struct list_head list;
     uint8_t bus;
@@ -230,4 +242,12 @@ void hvm_set_callback_via(struct domain *d, uint64_t via);
 struct pirq;
 bool hvm_domain_use_pirq(const struct domain *, const struct pirq *);
 
+int hvm_gsi_register_callback(struct domain *d, unsigned int gsi,
+                              struct hvm_gsi_eoi_callback *cb);
+void hvm_gsi_unregister_callback(struct domain *d, unsigned int gsi,
+                                 struct hvm_gsi_eoi_callback *cb);
+/* data is an opaque blob to pass to the callback if it has no private data. */
+void hvm_gsi_execute_callbacks(unsigned int gsi, void *data);
+bool hvm_gsi_has_callbacks(struct domain *d, unsigned int gsi);
+
 #endif /* __ASM_X86_HVM_IRQ_H__ */
-- 
2.28.0


