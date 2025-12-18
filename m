Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDE8CCCF7E
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 18:28:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190025.1510718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWHnf-0003Ei-Uj; Thu, 18 Dec 2025 17:28:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190025.1510718; Thu, 18 Dec 2025 17:28:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWHnf-0003Bk-PL; Thu, 18 Dec 2025 17:28:27 +0000
Received: by outflank-mailman (input) for mailman id 1190025;
 Thu, 18 Dec 2025 17:28:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YG3a=6Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vWHnd-0002iW-LF
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 17:28:25 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f396d9b5-dc36-11f0-9cce-f158ae23cfc8;
 Thu, 18 Dec 2025 18:28:22 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-64b791b5584so976104a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Dec 2025 09:28:22 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b585b53c1sm3209423a12.5.2025.12.18.09.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 09:28:20 -0800 (PST)
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
X-Inumbo-ID: f396d9b5-dc36-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766078901; x=1766683701; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X37iUX/x2wplHfGK7+yE6chFGRlh9LBuKxi0fvm1Lzc=;
        b=meaSwAxoqTmzTYzCe8yY+uVKqtpnmR0ZdJKmEdmSu6af8k3lHkZRmXJqwhHOpqS8nD
         w74lTMnNC20ho+yWEDE2yPx36QD2pCy/fMS2jpMyHB272ewVFqIkWzPll+Zrwb9KIJTt
         cZql72O31EPb1knJtNO+fXFgi2u/WBTnSdaVn48J6Z2wzHtMqB9w8/BAixR/eQpBkihS
         U435074ldHmGsVusWf5lVLF1uRFl3uayFLdqCAeLMyt11sBzDWctSPnKF0pbDQ061m9a
         yiuq2bU9eOPVBxz30gQZMLY/kedOfsvNzVgeiqzYY13sCUTlECtuwkwXEAnTS7lQNkZ9
         lX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766078901; x=1766683701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X37iUX/x2wplHfGK7+yE6chFGRlh9LBuKxi0fvm1Lzc=;
        b=UQK8oVUswEr3ag9dp8K4g3YCxEKpQB2QE5J6/DHCPcWowdXZ2trJ+QmiD0u3Nhlo8k
         8KqWnNbTtsKaaKf2ZQ6c8J5NSqptB5+4MHkMTXUKGvl/OoawkRS4dUc/u6DinqnKYXJY
         xT/X4tN/MV5AX8nol/EZdmdnMOZFSGBQxqTdv00BgnIrILq1w+/A9KzUnL/xU5UzoxNf
         B5l+3i/DBdCecV33vPauP99ac3hZp4E18W5ueuaptuQ9gigvJEVgavvLLWRd6ILMH8Kl
         sqE0oy4mA6GXXZiMgBykB1hK95H/NepTrIvfO/FMqGJ55KELxxkeP3WvEGEDeWLP5RJ4
         fQhg==
X-Gm-Message-State: AOJu0YwEBeQKSbfHE3D8JKdYl+6zWeFqG9beaGgfpQxkJ0GTESBF+014
	oFOq9/2exFZMqMs+Eec5tavlkKbiPtH4me4BiSfxeWTmpW/cP8lLLCFBuQ36yA==
X-Gm-Gg: AY/fxX4emM6JvO46t/j/VxNq8PVhdzURAgB+d6lPfhRIfFQq+6aKLG+a4ShJrrfKbPk
	8LgRZMqllKN+OF8f7YByb5XKqRNEpfzAPe7XNaKZbHl1n1j6bVKG2ycH0o/9UtYUfHvqkYwQa4J
	6Iv+YgGt7dP+QXofHeNG5MrSSOqM2DkHhtssWF5c/14Vi2g+1JGSR7MJjXz/MbqybbVSLFoMHkZ
	ZFA2xctPOZCccaBEmIrnDkuMBcgbhNp0hR1crKceQKsaQg6iqkw7aSkpdoNjUByDmo7cKRPl+B4
	u2+BRnvFkv8fUVbNBtgB0gT46rAc7rp4D3HH38FqPJfG5uryq5yxPeqUyxFKffSDKnshfIYnqK5
	CYLledbt/PS+9V5IdrnqENlXrJFqa0V5+SC/e67YuQYQ3nFZLncip2ZBWhwWiSqoHzwNwFEI47u
	y08MXEDLJARqd1c9wQhJlNYdhWUCZuIrsyXNMXekDsW2UmFDnlMXedcXE=
X-Google-Smtp-Source: AGHT+IEwmP+4VxWLFFaQRCJZiFCjrfKIjhRZtyV8js/Njronv6amib4KdMuR5ue/96Cl+YZ2/zUrVQ==
X-Received: by 2002:a05:6402:336:b0:649:9268:1f43 with SMTP id 4fb4d7f45d1cf-64b8ec6d9b0mr116127a12.21.1766078901228;
        Thu, 18 Dec 2025 09:28:21 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 1/4] xen/arm: optimize the size of struct vcpu
Date: Thu, 18 Dec 2025 18:28:06 +0100
Message-ID: <946a1c2cfaf4157074470a653bba5baa8561ebbf.1766053253.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1766053253.git.oleksii.kurochko@gmail.com>
References: <cover.1766053253.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When CONFIG_NEW_VGIC=y and CONFIG_ARM_64=y, the size of struct vcpu
exceeds one page, which requires allocating two pages and led to the
introduction of MAX_PAGES_PER_VCPU.

To remove the need for MAX_PAGES_PER_VCPU in a follow-up patch, the vgic
member of struct arch_vcpu is changed to a pointer to struct vgic_cpu.
As a result, the size of struct vcpu for Arm64 is reduced to 2048 bytes,
compared to 3840 bytes (without these changes and with CONFIG_ARM_64=y)
and 4736 bytes (without these changes and with both CONFIG_ARM_64=y and
CONFIG_NEW_VGIC=y).

Since the vgic member is now a pointer, vcpu_vgic_init() and
vcpu_vgic_free() are updated to allocate and free the struct vgic_cpu
instance dynamically.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - New patch.
---
 xen/arch/arm/gic-vgic.c           | 48 ++++++++++-----------
 xen/arch/arm/include/asm/domain.h |  2 +-
 xen/arch/arm/vgic-v3.c            | 34 +++++++--------
 xen/arch/arm/vgic.c               | 72 +++++++++++++++++--------------
 xen/arch/arm/vgic/vgic-init.c     | 10 ++++-
 xen/arch/arm/vgic/vgic-v2.c       |  4 +-
 xen/arch/arm/vgic/vgic.c          | 50 ++++++++++-----------
 7 files changed, 116 insertions(+), 104 deletions(-)

diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
index ea48c5375a..482b77c986 100644
--- a/xen/arch/arm/gic-vgic.c
+++ b/xen/arch/arm/gic-vgic.c
@@ -42,12 +42,12 @@ static inline void gic_add_to_lr_pending(struct vcpu *v, struct pending_irq *n)
 {
     struct pending_irq *iter;
 
-    ASSERT(spin_is_locked(&v->arch.vgic.lock));
+    ASSERT(spin_is_locked(&v->arch.vgic->lock));
 
     if ( !list_empty(&n->lr_queue) )
         return;
 
-    list_for_each_entry ( iter, &v->arch.vgic.lr_pending, lr_queue )
+    list_for_each_entry ( iter, &v->arch.vgic->lr_pending, lr_queue )
     {
         if ( iter->priority > n->priority )
         {
@@ -55,12 +55,12 @@ static inline void gic_add_to_lr_pending(struct vcpu *v, struct pending_irq *n)
             return;
         }
     }
-    list_add_tail(&n->lr_queue, &v->arch.vgic.lr_pending);
+    list_add_tail(&n->lr_queue, &v->arch.vgic->lr_pending);
 }
 
 void gic_remove_from_lr_pending(struct vcpu *v, struct pending_irq *p)
 {
-    ASSERT(spin_is_locked(&v->arch.vgic.lock));
+    ASSERT(spin_is_locked(&v->arch.vgic->lock));
 
     list_del_init(&p->lr_queue);
 }
@@ -73,7 +73,7 @@ void gic_raise_inflight_irq(struct vcpu *v, unsigned int virtual_irq)
     if ( unlikely(!n) )
         return;
 
-    ASSERT(spin_is_locked(&v->arch.vgic.lock));
+    ASSERT(spin_is_locked(&v->arch.vgic->lock));
 
     /* Don't try to update the LR if the interrupt is disabled */
     if ( !test_bit(GIC_IRQ_GUEST_ENABLED, &n->status) )
@@ -104,7 +104,7 @@ static unsigned int gic_find_unused_lr(struct vcpu *v,
 {
     uint64_t *lr_mask = &this_cpu(lr_mask);
 
-    ASSERT(spin_is_locked(&v->arch.vgic.lock));
+    ASSERT(spin_is_locked(&v->arch.vgic->lock));
 
     if ( unlikely(test_bit(GIC_IRQ_GUEST_PRISTINE_LPI, &p->status)) )
     {
@@ -130,13 +130,13 @@ void gic_raise_guest_irq(struct vcpu *v, unsigned int virtual_irq,
     unsigned int nr_lrs = gic_get_nr_lrs();
     struct pending_irq *p = irq_to_pending(v, virtual_irq);
 
-    ASSERT(spin_is_locked(&v->arch.vgic.lock));
+    ASSERT(spin_is_locked(&v->arch.vgic->lock));
 
     if ( unlikely(!p) )
         /* An unmapped LPI does not need to be raised. */
         return;
 
-    if ( v == current && list_empty(&v->arch.vgic.lr_pending) )
+    if ( v == current && list_empty(&v->arch.vgic->lr_pending) )
     {
         i = gic_find_unused_lr(v, p, 0);
 
@@ -156,7 +156,7 @@ static void gic_update_one_lr(struct vcpu *v, int i)
     int irq;
     struct gic_lr lr_val;
 
-    ASSERT(spin_is_locked(&v->arch.vgic.lock));
+    ASSERT(spin_is_locked(&v->arch.vgic->lock));
     ASSERT(!local_irq_is_enabled());
 
     gic_hw_ops->read_lr(i, &lr_val);
@@ -253,7 +253,7 @@ void vgic_sync_from_lrs(struct vcpu *v)
 
     gic_hw_ops->update_hcr_status(GICH_HCR_UIE, false);
 
-    spin_lock_irqsave(&v->arch.vgic.lock, flags);
+    spin_lock_irqsave(&v->arch.vgic->lock, flags);
 
     while ((i = find_next_bit((const unsigned long *) &this_cpu(lr_mask),
                               nr_lrs, i)) < nr_lrs ) {
@@ -261,7 +261,7 @@ void vgic_sync_from_lrs(struct vcpu *v)
         i++;
     }
 
-    spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
+    spin_unlock_irqrestore(&v->arch.vgic->lock, flags);
 }
 
 static void gic_restore_pending_irqs(struct vcpu *v)
@@ -274,13 +274,13 @@ static void gic_restore_pending_irqs(struct vcpu *v)
 
     ASSERT(!local_irq_is_enabled());
 
-    spin_lock(&v->arch.vgic.lock);
+    spin_lock(&v->arch.vgic->lock);
 
-    if ( list_empty(&v->arch.vgic.lr_pending) )
+    if ( list_empty(&v->arch.vgic->lr_pending) )
         goto out;
 
-    inflight_r = &v->arch.vgic.inflight_irqs;
-    list_for_each_entry_safe ( p, t, &v->arch.vgic.lr_pending, lr_queue )
+    inflight_r = &v->arch.vgic->inflight_irqs;
+    list_for_each_entry_safe ( p, t, &v->arch.vgic->lr_pending, lr_queue )
     {
         lr = gic_find_unused_lr(v, p, lr);
         if ( lr >= nr_lrs )
@@ -318,17 +318,17 @@ found:
     }
 
 out:
-    spin_unlock(&v->arch.vgic.lock);
+    spin_unlock(&v->arch.vgic->lock);
 }
 
 void gic_clear_pending_irqs(struct vcpu *v)
 {
     struct pending_irq *p, *t;
 
-    ASSERT(spin_is_locked(&v->arch.vgic.lock));
+    ASSERT(spin_is_locked(&v->arch.vgic->lock));
 
     v->arch.lr_mask = 0;
-    list_for_each_entry_safe ( p, t, &v->arch.vgic.lr_pending, lr_queue )
+    list_for_each_entry_safe ( p, t, &v->arch.vgic->lr_pending, lr_queue )
         gic_remove_from_lr_pending(v, p);
 }
 
@@ -357,14 +357,14 @@ int vgic_vcpu_pending_irq(struct vcpu *v)
     mask_priority = gic_hw_ops->read_vmcr_priority();
     active_priority = find_first_bit(&apr, 32);
 
-    spin_lock_irqsave(&v->arch.vgic.lock, flags);
+    spin_lock_irqsave(&v->arch.vgic->lock, flags);
 
     /* TODO: We order the guest irqs by priority, but we don't change
      * the priority of host irqs. */
 
     /* find the first enabled non-active irq, the queue is already
      * ordered by priority */
-    list_for_each_entry( p, &v->arch.vgic.inflight_irqs, inflight )
+    list_for_each_entry( p, &v->arch.vgic->inflight_irqs, inflight )
     {
         if ( GIC_PRI_TO_GUEST(p->priority) >= mask_priority )
             goto out;
@@ -378,7 +378,7 @@ int vgic_vcpu_pending_irq(struct vcpu *v)
     }
 
 out:
-    spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
+    spin_unlock_irqrestore(&v->arch.vgic->lock, flags);
     return rc;
 }
 
@@ -388,7 +388,7 @@ void vgic_sync_to_lrs(void)
 
     gic_restore_pending_irqs(current);
 
-    if ( !list_empty(&current->arch.vgic.lr_pending) && lr_all_full() )
+    if ( !list_empty(&current->arch.vgic->lr_pending) && lr_all_full() )
         gic_hw_ops->update_hcr_status(GICH_HCR_UIE, true);
 }
 
@@ -396,10 +396,10 @@ void gic_dump_vgic_info(struct vcpu *v)
 {
     struct pending_irq *p;
 
-    list_for_each_entry ( p, &v->arch.vgic.inflight_irqs, inflight )
+    list_for_each_entry ( p, &v->arch.vgic->inflight_irqs, inflight )
         printk("Inflight irq=%u lr=%u\n", p->irq, p->lr);
 
-    list_for_each_entry( p, &v->arch.vgic.lr_pending, lr_queue )
+    list_for_each_entry( p, &v->arch.vgic->lr_pending, lr_queue )
         printk("Pending irq=%d\n", p->irq);
 }
 
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 758ad807e4..6cfa793828 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -230,7 +230,7 @@ struct arch_vcpu
     union gic_state_data gic;
     uint64_t lr_mask;
 
-    struct vgic_cpu vgic;
+    struct vgic_cpu *vgic;
 
     /* Timer registers  */
     register_t cntkctl;
diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 77aab5c3c2..a9bb7e8906 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -162,10 +162,10 @@ static int __vgic_v3_rdistr_rd_mmio_read(struct vcpu *v, mmio_info_t *info,
             goto read_as_zero_32;
         if ( dabt.size != DABT_WORD ) goto bad_width;
 
-        spin_lock_irqsave(&v->arch.vgic.lock, flags);
-        *r = vreg_reg32_extract(!!(v->arch.vgic.flags & VGIC_V3_LPIS_ENABLED),
+        spin_lock_irqsave(&v->arch.vgic->lock, flags);
+        *r = vreg_reg32_extract(!!(v->arch.vgic->flags & VGIC_V3_LPIS_ENABLED),
                                 info);
-        spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
+        spin_unlock_irqrestore(&v->arch.vgic->lock, flags);
         return 1;
     }
 
@@ -195,7 +195,7 @@ static int __vgic_v3_rdistr_rd_mmio_read(struct vcpu *v, mmio_info_t *info,
         /* We use the VCPU ID as the redistributor ID in bits[23:8] */
         typer |= v->vcpu_id << GICR_TYPER_PROC_NUM_SHIFT;
 
-        if ( v->arch.vgic.flags & VGIC_V3_RDIST_LAST )
+        if ( v->arch.vgic->flags & VGIC_V3_RDIST_LAST )
             typer |= GICR_TYPER_LAST;
 
         if ( v->domain->arch.vgic.has_its )
@@ -249,7 +249,7 @@ static int __vgic_v3_rdistr_rd_mmio_read(struct vcpu *v, mmio_info_t *info,
             goto read_as_zero_64;
         if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
 
-        val = read_atomic(&v->arch.vgic.rdist_pendbase);
+        val = read_atomic(&v->arch.vgic->rdist_pendbase);
         val &= ~GICR_PENDBASER_PTZ;      /* WO, reads as 0 */
         *r = vreg_reg64_extract(val, info);
         return 1;
@@ -467,7 +467,7 @@ static void vgic_vcpu_enable_lpis(struct vcpu *v)
         smp_mb();
     }
 
-    v->arch.vgic.flags |= VGIC_V3_LPIS_ENABLED;
+    v->arch.vgic->flags |= VGIC_V3_LPIS_ENABLED;
 }
 
 static int __vgic_v3_rdistr_rd_mmio_write(struct vcpu *v, mmio_info_t *info,
@@ -488,14 +488,14 @@ static int __vgic_v3_rdistr_rd_mmio_write(struct vcpu *v, mmio_info_t *info,
         if ( dabt.size != DABT_WORD ) goto bad_width;
 
         vgic_lock(v);                   /* protects rdists_enabled */
-        spin_lock_irqsave(&v->arch.vgic.lock, flags);
+        spin_lock_irqsave(&v->arch.vgic->lock, flags);
 
         /* LPIs can only be enabled once, but never disabled again. */
         if ( (r & GICR_CTLR_ENABLE_LPIS) &&
-             !(v->arch.vgic.flags & VGIC_V3_LPIS_ENABLED) )
+             !(v->arch.vgic->flags & VGIC_V3_LPIS_ENABLED) )
             vgic_vcpu_enable_lpis(v);
 
-        spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
+        spin_unlock_irqrestore(&v->arch.vgic->lock, flags);
         vgic_unlock(v);
 
         return 1;
@@ -565,18 +565,18 @@ static int __vgic_v3_rdistr_rd_mmio_write(struct vcpu *v, mmio_info_t *info,
             goto write_ignore_64;
         if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
 
-        spin_lock_irqsave(&v->arch.vgic.lock, flags);
+        spin_lock_irqsave(&v->arch.vgic->lock, flags);
 
         /* Writing PENDBASER with LPIs enabled is UNPREDICTABLE. */
-        if ( !(v->arch.vgic.flags & VGIC_V3_LPIS_ENABLED) )
+        if ( !(v->arch.vgic->flags & VGIC_V3_LPIS_ENABLED) )
         {
-            reg = read_atomic(&v->arch.vgic.rdist_pendbase);
+            reg = read_atomic(&v->arch.vgic->rdist_pendbase);
             vreg_reg64_update(&reg, r, info);
             reg = sanitize_pendbaser(reg);
-            write_atomic(&v->arch.vgic.rdist_pendbase, reg);
+            write_atomic(&v->arch.vgic->rdist_pendbase, reg);
         }
 
-        spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
+        spin_unlock_irqrestore(&v->arch.vgic->lock, flags);
 
         return 1;
     }
@@ -1115,7 +1115,7 @@ static struct vcpu *get_vcpu_from_rdist(struct domain *d,
 
     v = d->vcpu[vcpu_id];
 
-    *offset = gpa - v->arch.vgic.rdist_base;
+    *offset = gpa - v->arch.vgic->rdist_base;
 
     return v;
 }
@@ -1745,7 +1745,7 @@ static int vgic_v3_vcpu_init(struct vcpu *v)
         return -EINVAL;
     }
 
-    v->arch.vgic.rdist_base = rdist_base;
+    v->arch.vgic->rdist_base = rdist_base;
 
     /*
      * If the redistributor is the last one of the
@@ -1756,7 +1756,7 @@ static int vgic_v3_vcpu_init(struct vcpu *v)
     last_cpu = (region->size / GICV3_GICR_SIZE) + region->first_cpu - 1;
 
     if ( v->vcpu_id == last_cpu || (v->vcpu_id == (d->max_vcpus - 1)) )
-        v->arch.vgic.flags |= VGIC_V3_RDIST_LAST;
+        v->arch.vgic->flags |= VGIC_V3_RDIST_LAST;
 
     return 0;
 }
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index 3ebdf9953f..8b17871b86 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -84,7 +84,7 @@ static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
                                                   unsigned int rank)
 {
     if ( rank == 0 )
-        return v->arch.vgic.private_irqs;
+        return v->arch.vgic->private_irqs;
     else if ( rank <= DOMAIN_NR_RANKS(v->domain) )
         return &v->domain->arch.vgic.shared_irqs[rank - 1];
     else if ( is_valid_espi_rank(v->domain, rank) )
@@ -370,29 +370,35 @@ int vcpu_vgic_init(struct vcpu *v)
 {
     int i;
 
-    v->arch.vgic.private_irqs = xzalloc(struct vgic_irq_rank);
-    if ( v->arch.vgic.private_irqs == NULL )
+    v->arch.vgic = xzalloc(struct vgic_cpu);
+    if ( v->arch.vgic == NULL )
+        return -ENOMEM;
+
+    v->arch.vgic->private_irqs = xzalloc(struct vgic_irq_rank);
+    if ( v->arch.vgic->private_irqs == NULL )
       return -ENOMEM;
 
     /* SGIs/PPIs are always routed to this VCPU */
-    vgic_rank_init(v->arch.vgic.private_irqs, 0, v->vcpu_id);
+    vgic_rank_init(v->arch.vgic->private_irqs, 0, v->vcpu_id);
 
     v->domain->arch.vgic.handler->vcpu_init(v);
 
-    memset(&v->arch.vgic.pending_irqs, 0, sizeof(v->arch.vgic.pending_irqs));
+    memset(&v->arch.vgic->pending_irqs, 0, sizeof(v->arch.vgic->pending_irqs));
     for (i = 0; i < 32; i++)
-        vgic_init_pending_irq(&v->arch.vgic.pending_irqs[i], i);
+        vgic_init_pending_irq(&v->arch.vgic->pending_irqs[i], i);
 
-    INIT_LIST_HEAD(&v->arch.vgic.inflight_irqs);
-    INIT_LIST_HEAD(&v->arch.vgic.lr_pending);
-    spin_lock_init(&v->arch.vgic.lock);
+    INIT_LIST_HEAD(&v->arch.vgic->inflight_irqs);
+    INIT_LIST_HEAD(&v->arch.vgic->lr_pending);
+    spin_lock_init(&v->arch.vgic->lock);
 
     return 0;
 }
 
 int vcpu_vgic_free(struct vcpu *v)
 {
-    xfree(v->arch.vgic.private_irqs);
+    xfree(v->arch.vgic->private_irqs);
+    xfree(v->arch.vgic);
+
     return 0;
 }
 
@@ -423,14 +429,14 @@ bool vgic_migrate_irq(struct vcpu *old, struct vcpu *new, unsigned int irq)
     /* This will never be called for an LPI, as we don't migrate them. */
     ASSERT(!is_lpi(irq));
 
-    spin_lock_irqsave(&old->arch.vgic.lock, flags);
+    spin_lock_irqsave(&old->arch.vgic->lock, flags);
 
     p = irq_to_pending(old, irq);
 
     /* nothing to do for virtual interrupts */
     if ( p->desc == NULL )
     {
-        spin_unlock_irqrestore(&old->arch.vgic.lock, flags);
+        spin_unlock_irqrestore(&old->arch.vgic->lock, flags);
         return true;
     }
 
@@ -438,7 +444,7 @@ bool vgic_migrate_irq(struct vcpu *old, struct vcpu *new, unsigned int irq)
     if ( test_bit(GIC_IRQ_GUEST_MIGRATING, &p->status) )
     {
         gprintk(XENLOG_WARNING, "irq %u migration failed: requested while in progress\n", irq);
-        spin_unlock_irqrestore(&old->arch.vgic.lock, flags);
+        spin_unlock_irqrestore(&old->arch.vgic->lock, flags);
         return false;
     }
 
@@ -447,7 +453,7 @@ bool vgic_migrate_irq(struct vcpu *old, struct vcpu *new, unsigned int irq)
     if ( list_empty(&p->inflight) )
     {
         irq_set_affinity(p->desc, cpumask_of(new->processor));
-        spin_unlock_irqrestore(&old->arch.vgic.lock, flags);
+        spin_unlock_irqrestore(&old->arch.vgic->lock, flags);
         return true;
     }
     /* If the IRQ is still lr_pending, re-inject it to the new vcpu */
@@ -455,7 +461,7 @@ bool vgic_migrate_irq(struct vcpu *old, struct vcpu *new, unsigned int irq)
     {
         vgic_remove_irq_from_queues(old, p);
         irq_set_affinity(p->desc, cpumask_of(new->processor));
-        spin_unlock_irqrestore(&old->arch.vgic.lock, flags);
+        spin_unlock_irqrestore(&old->arch.vgic->lock, flags);
         vgic_inject_irq(new->domain, new, irq, true);
         return true;
     }
@@ -464,7 +470,7 @@ bool vgic_migrate_irq(struct vcpu *old, struct vcpu *new, unsigned int irq)
     if ( !list_empty(&p->inflight) )
         set_bit(GIC_IRQ_GUEST_MIGRATING, &p->status);
 
-    spin_unlock_irqrestore(&old->arch.vgic.lock, flags);
+    spin_unlock_irqrestore(&old->arch.vgic->lock, flags);
     return true;
 }
 
@@ -516,12 +522,12 @@ void vgic_disable_irqs(struct vcpu *v, uint32_t r, unsigned int n)
         irq = i + (32 * n);
         v_target = vgic_get_target_vcpu(v, irq);
 
-        spin_lock_irqsave(&v_target->arch.vgic.lock, flags);
+        spin_lock_irqsave(&v_target->arch.vgic->lock, flags);
         p = irq_to_pending(v_target, irq);
         clear_bit(GIC_IRQ_GUEST_ENABLED, &p->status);
         gic_remove_from_lr_pending(v_target, p);
         desc = p->desc;
-        spin_unlock_irqrestore(&v_target->arch.vgic.lock, flags);
+        spin_unlock_irqrestore(&v_target->arch.vgic->lock, flags);
 
         if ( desc != NULL )
         {
@@ -567,12 +573,12 @@ void vgic_enable_irqs(struct vcpu *v, uint32_t r, unsigned int n)
     while ( (i = find_next_bit(&mask, 32, i)) < 32 ) {
         irq = i + (32 * n);
         v_target = vgic_get_target_vcpu(v, irq);
-        spin_lock_irqsave(&v_target->arch.vgic.lock, flags);
+        spin_lock_irqsave(&v_target->arch.vgic->lock, flags);
         p = irq_to_pending(v_target, irq);
         set_bit(GIC_IRQ_GUEST_ENABLED, &p->status);
         if ( !list_empty(&p->inflight) && !test_bit(GIC_IRQ_GUEST_VISIBLE, &p->status) )
             gic_raise_guest_irq(v_target, irq, p->priority);
-        spin_unlock_irqrestore(&v_target->arch.vgic.lock, flags);
+        spin_unlock_irqrestore(&v_target->arch.vgic->lock, flags);
         if ( p->desc != NULL )
         {
             irq_set_affinity(p->desc, cpumask_of(v_target->processor));
@@ -701,7 +707,7 @@ struct pending_irq *irq_to_pending(struct vcpu *v, unsigned int irq)
     /* Pending irqs allocation strategy: the first vgic.nr_spis irqs
      * are used for SPIs; the rests are used for per cpu irqs */
     if ( irq < 32 )
-        n = &v->arch.vgic.pending_irqs[irq];
+        n = &v->arch.vgic->pending_irqs[irq];
     else if ( is_lpi(irq) )
         n = v->domain->arch.vgic.handler->lpi_to_pending(v->domain, irq);
     else
@@ -734,16 +740,16 @@ void vgic_clear_pending_irqs(struct vcpu *v)
     struct pending_irq *p, *t;
     unsigned long flags;
 
-    spin_lock_irqsave(&v->arch.vgic.lock, flags);
-    list_for_each_entry_safe ( p, t, &v->arch.vgic.inflight_irqs, inflight )
+    spin_lock_irqsave(&v->arch.vgic->lock, flags);
+    list_for_each_entry_safe ( p, t, &v->arch.vgic->inflight_irqs, inflight )
         list_del_init(&p->inflight);
     gic_clear_pending_irqs(v);
-    spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
+    spin_unlock_irqrestore(&v->arch.vgic->lock, flags);
 }
 
 void vgic_remove_irq_from_queues(struct vcpu *v, struct pending_irq *p)
 {
-    ASSERT(spin_is_locked(&v->arch.vgic.lock));
+    ASSERT(spin_is_locked(&v->arch.vgic->lock));
 
     clear_bit(GIC_IRQ_GUEST_QUEUED, &p->status);
     list_del_init(&p->inflight);
@@ -772,20 +778,20 @@ void vgic_inject_irq(struct domain *d, struct vcpu *v, unsigned int virq,
         v = vgic_get_target_vcpu(d->vcpu[0], virq);
     };
 
-    spin_lock_irqsave(&v->arch.vgic.lock, flags);
+    spin_lock_irqsave(&v->arch.vgic->lock, flags);
 
     n = irq_to_pending(v, virq);
     /* If an LPI has been removed, there is nothing to inject here. */
     if ( unlikely(!n) )
     {
-        spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
+        spin_unlock_irqrestore(&v->arch.vgic->lock, flags);
         return;
     }
 
     /* vcpu offline */
     if ( test_bit(_VPF_down, &v->pause_flags) )
     {
-        spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
+        spin_unlock_irqrestore(&v->arch.vgic->lock, flags);
         return;
     }
 
@@ -804,7 +810,7 @@ void vgic_inject_irq(struct domain *d, struct vcpu *v, unsigned int virq,
     if ( test_bit(GIC_IRQ_GUEST_ENABLED, &n->status) )
         gic_raise_guest_irq(v, virq, priority);
 
-    list_for_each_entry ( iter, &v->arch.vgic.inflight_irqs, inflight )
+    list_for_each_entry ( iter, &v->arch.vgic->inflight_irqs, inflight )
     {
         if ( iter->priority > priority )
         {
@@ -812,9 +818,9 @@ void vgic_inject_irq(struct domain *d, struct vcpu *v, unsigned int virq,
             goto out;
         }
     }
-    list_add_tail(&n->inflight, &v->arch.vgic.inflight_irqs);
+    list_add_tail(&n->inflight, &v->arch.vgic->inflight_irqs);
 out:
-    spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
+    spin_unlock_irqrestore(&v->arch.vgic->lock, flags);
 
     /* we have a new higher priority irq, inject it into the guest */
     vcpu_kick(v);
@@ -924,7 +930,7 @@ void vgic_check_inflight_irqs_pending(struct vcpu *v, unsigned int rank, uint32_
 
         v_target = vgic_get_target_vcpu(v, irq);
 
-        spin_lock_irqsave(&v_target->arch.vgic.lock, flags);
+        spin_lock_irqsave(&v_target->arch.vgic->lock, flags);
 
         p = irq_to_pending(v_target, irq);
 
@@ -933,7 +939,7 @@ void vgic_check_inflight_irqs_pending(struct vcpu *v, unsigned int rank, uint32_
                    "%pv trying to clear pending interrupt %u.\n",
                    v, irq);
 
-        spin_unlock_irqrestore(&v_target->arch.vgic.lock, flags);
+        spin_unlock_irqrestore(&v_target->arch.vgic->lock, flags);
     }
 }
 
diff --git a/xen/arch/arm/vgic/vgic-init.c b/xen/arch/arm/vgic/vgic-init.c
index f8d7d3a226..67f297797f 100644
--- a/xen/arch/arm/vgic/vgic-init.c
+++ b/xen/arch/arm/vgic/vgic-init.c
@@ -57,7 +57,7 @@
  */
 static void vgic_vcpu_early_init(struct vcpu *vcpu)
 {
-    struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic;
+    struct vgic_cpu *vgic_cpu = vcpu->arch.vgic;
     unsigned int i;
 
     INIT_LIST_HEAD(&vgic_cpu->ap_list_head);
@@ -202,6 +202,10 @@ int vcpu_vgic_init(struct vcpu *v)
 {
     int ret = 0;
 
+    v->arch.vgic = xzalloc(struct vgic_cpu);
+    if ( v->arch.vgic == NULL )
+        return -ENOMEM;
+
     vgic_vcpu_early_init(v);
 
     if ( gic_hw_version() == GIC_V2 )
@@ -241,10 +245,12 @@ void domain_vgic_free(struct domain *d)
 
 int vcpu_vgic_free(struct vcpu *v)
 {
-    struct vgic_cpu *vgic_cpu = &v->arch.vgic;
+    struct vgic_cpu *vgic_cpu = v->arch.vgic;
 
     INIT_LIST_HEAD(&vgic_cpu->ap_list_head);
 
+    xfree(vgic_cpu);
+
     return 0;
 }
 
diff --git a/xen/arch/arm/vgic/vgic-v2.c b/xen/arch/arm/vgic/vgic-v2.c
index 6a558089c5..e64d681dd2 100644
--- a/xen/arch/arm/vgic/vgic-v2.c
+++ b/xen/arch/arm/vgic/vgic-v2.c
@@ -56,8 +56,8 @@ void vgic_v2_setup_hw(paddr_t dbase, paddr_t cbase, paddr_t csize,
  */
 void vgic_v2_fold_lr_state(struct vcpu *vcpu)
 {
-    struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic;
-    unsigned int used_lrs = vcpu->arch.vgic.used_lrs;
+    struct vgic_cpu *vgic_cpu = vcpu->arch.vgic;
+    unsigned int used_lrs = vcpu->arch.vgic->used_lrs;
     unsigned long flags;
     unsigned int lr;
 
diff --git a/xen/arch/arm/vgic/vgic.c b/xen/arch/arm/vgic/vgic.c
index b2c0e1873a..146bd124c3 100644
--- a/xen/arch/arm/vgic/vgic.c
+++ b/xen/arch/arm/vgic/vgic.c
@@ -40,8 +40,8 @@
  * When taking more than one ap_list_lock at the same time, always take the
  * lowest numbered VCPU's ap_list_lock first, so:
  *   vcpuX->vcpu_id < vcpuY->vcpu_id:
- *     spin_lock(vcpuX->arch.vgic.ap_list_lock);
- *     spin_lock(vcpuY->arch.vgic.ap_list_lock);
+ *     spin_lock(vcpuX->arch.vgic->ap_list_lock);
+ *     spin_lock(vcpuY->arch.vgic->ap_list_lock);
  *
  * Since the VGIC must support injecting virtual interrupts from ISRs, we have
  * to use the spin_lock_irqsave/spin_unlock_irqrestore versions of outer
@@ -102,7 +102,7 @@ struct vgic_irq *vgic_get_irq(struct domain *d, struct vcpu *vcpu,
 {
     /* SGIs and PPIs */
     if ( intid <= VGIC_MAX_PRIVATE )
-        return &vcpu->arch.vgic.private_irqs[intid];
+        return &vcpu->arch.vgic->private_irqs[intid];
 
     /* SPIs */
     if ( intid <= VGIC_MAX_SPI )
@@ -245,7 +245,7 @@ out:
 /* Must be called with the ap_list_lock held */
 static void vgic_sort_ap_list(struct vcpu *vcpu)
 {
-    struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic;
+    struct vgic_cpu *vgic_cpu = vcpu->arch.vgic;
 
     ASSERT(spin_is_locked(&vgic_cpu->ap_list_lock));
 
@@ -323,7 +323,7 @@ retry:
 
     /* someone can do stuff here, which we re-check below */
 
-    spin_lock_irqsave(&vcpu->arch.vgic.ap_list_lock, flags);
+    spin_lock_irqsave(&vcpu->arch.vgic->ap_list_lock, flags);
     spin_lock(&irq->irq_lock);
 
     /*
@@ -341,7 +341,7 @@ retry:
     if ( unlikely(irq->vcpu || vcpu != vgic_target_oracle(irq)) )
     {
         spin_unlock(&irq->irq_lock);
-        spin_unlock_irqrestore(&vcpu->arch.vgic.ap_list_lock, flags);
+        spin_unlock_irqrestore(&vcpu->arch.vgic->ap_list_lock, flags);
 
         spin_lock_irqsave(&irq->irq_lock, flags);
         goto retry;
@@ -352,11 +352,11 @@ retry:
      * now in the ap_list.
      */
     vgic_get_irq_kref(irq);
-    list_add_tail(&irq->ap_list, &vcpu->arch.vgic.ap_list_head);
+    list_add_tail(&irq->ap_list, &vcpu->arch.vgic->ap_list_head);
     irq->vcpu = vcpu;
 
     spin_unlock(&irq->irq_lock);
-    spin_unlock_irqrestore(&vcpu->arch.vgic.ap_list_lock, flags);
+    spin_unlock_irqrestore(&vcpu->arch.vgic->ap_list_lock, flags);
 
     vcpu_kick(vcpu);
 
@@ -422,7 +422,7 @@ void vgic_inject_irq(struct domain *d, struct vcpu *vcpu, unsigned int intid,
  */
 static void vgic_prune_ap_list(struct vcpu *vcpu)
 {
-    struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic;
+    struct vgic_cpu *vgic_cpu = vcpu->arch.vgic;
     struct vgic_irq *irq, *tmp;
     unsigned long flags;
 
@@ -487,8 +487,8 @@ retry:
             vcpuB = vcpu;
         }
 
-        spin_lock_irqsave(&vcpuA->arch.vgic.ap_list_lock, flags);
-        spin_lock(&vcpuB->arch.vgic.ap_list_lock);
+        spin_lock_irqsave(&vcpuA->arch.vgic->ap_list_lock, flags);
+        spin_lock(&vcpuB->arch.vgic->ap_list_lock);
         spin_lock(&irq->irq_lock);
 
         /*
@@ -502,7 +502,7 @@ retry:
          */
         if ( target_vcpu == vgic_target_oracle(irq) )
         {
-            struct vgic_cpu *new_cpu = &target_vcpu->arch.vgic;
+            struct vgic_cpu *new_cpu = target_vcpu->arch.vgic;
 
             list_del(&irq->ap_list);
             irq->vcpu = target_vcpu;
@@ -510,8 +510,8 @@ retry:
         }
 
         spin_unlock(&irq->irq_lock);
-        spin_unlock(&vcpuB->arch.vgic.ap_list_lock);
-        spin_unlock_irqrestore(&vcpuA->arch.vgic.ap_list_lock, flags);
+        spin_unlock(&vcpuB->arch.vgic->ap_list_lock);
+        spin_unlock_irqrestore(&vcpuA->arch.vgic->ap_list_lock, flags);
         goto retry;
     }
 
@@ -542,7 +542,7 @@ static void vgic_set_underflow(struct vcpu *vcpu)
 /* Requires the ap_list_lock to be held. */
 static int compute_ap_list_depth(struct vcpu *vcpu)
 {
-    struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic;
+    struct vgic_cpu *vgic_cpu = vcpu->arch.vgic;
     struct vgic_irq *irq;
     int count = 0;
 
@@ -557,7 +557,7 @@ static int compute_ap_list_depth(struct vcpu *vcpu)
 /* Requires the VCPU's ap_list_lock to be held. */
 static void vgic_flush_lr_state(struct vcpu *vcpu)
 {
-    struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic;
+    struct vgic_cpu *vgic_cpu = vcpu->arch.vgic;
     struct vgic_irq *irq;
     int count = 0;
 
@@ -583,7 +583,7 @@ static void vgic_flush_lr_state(struct vcpu *vcpu)
         }
     }
 
-    vcpu->arch.vgic.used_lrs = count;
+    vcpu->arch.vgic->used_lrs = count;
 }
 
 /**
@@ -600,7 +600,7 @@ static void vgic_flush_lr_state(struct vcpu *vcpu)
 void vgic_sync_from_lrs(struct vcpu *vcpu)
 {
     /* An empty ap_list_head implies used_lrs == 0 */
-    if ( list_empty(&vcpu->arch.vgic.ap_list_head) )
+    if ( list_empty(&vcpu->arch.vgic->ap_list_head) )
         return;
 
     vgic_fold_lr_state(vcpu);
@@ -628,14 +628,14 @@ void vgic_sync_to_lrs(void)
      * and introducing additional synchronization mechanism doesn't change
      * this.
      */
-    if ( list_empty(&current->arch.vgic.ap_list_head) )
+    if ( list_empty(&current->arch.vgic->ap_list_head) )
         return;
 
     ASSERT(!local_irq_is_enabled());
 
-    spin_lock(&current->arch.vgic.ap_list_lock);
+    spin_lock(&current->arch.vgic->ap_list_lock);
     vgic_flush_lr_state(current);
-    spin_unlock(&current->arch.vgic.ap_list_lock);
+    spin_unlock(&current->arch.vgic->ap_list_lock);
 
     gic_hw_ops->update_hcr_status(GICH_HCR_EN, 1);
 }
@@ -652,7 +652,7 @@ void vgic_sync_to_lrs(void)
  */
 int vgic_vcpu_pending_irq(struct vcpu *vcpu)
 {
-    struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic;
+    struct vgic_cpu *vgic_cpu = vcpu->arch.vgic;
     struct vgic_irq *irq;
     unsigned long flags;
     int ret = 0;
@@ -761,11 +761,11 @@ void vgic_free_virq(struct domain *d, unsigned int virq)
 
 void gic_dump_vgic_info(struct vcpu *v)
 {
-    struct vgic_cpu *vgic_cpu = &v->arch.vgic;
+    struct vgic_cpu *vgic_cpu = v->arch.vgic;
     struct vgic_irq *irq;
     unsigned long flags;
 
-    spin_lock_irqsave(&v->arch.vgic.ap_list_lock, flags);
+    spin_lock_irqsave(&v->arch.vgic->ap_list_lock, flags);
 
     if ( !list_empty(&vgic_cpu->ap_list_head) )
         printk("   active or pending interrupts queued:\n");
@@ -781,7 +781,7 @@ void gic_dump_vgic_info(struct vcpu *v)
         spin_unlock(&irq->irq_lock);
     }
 
-    spin_unlock_irqrestore(&v->arch.vgic.ap_list_lock, flags);
+    spin_unlock_irqrestore(&v->arch.vgic->ap_list_lock, flags);
 }
 
 void vgic_clear_pending_irqs(struct vcpu *v)
-- 
2.52.0


