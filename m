Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 853EB9170E5
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 21:08:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748025.1155589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMBVo-0000YV-PC; Tue, 25 Jun 2024 19:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748025.1155589; Tue, 25 Jun 2024 19:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMBVo-0000RN-Ln; Tue, 25 Jun 2024 19:07:28 +0000
Received: by outflank-mailman (input) for mailman id 748025;
 Tue, 25 Jun 2024 19:07:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vmrN=N3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sMBVn-0000O1-6k
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 19:07:27 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2852989e-3326-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 21:07:25 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a724440f597so410896266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 12:07:25 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a725d7b190fsm180434766b.50.2024.06.25.12.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 12:07:22 -0700 (PDT)
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
X-Inumbo-ID: 2852989e-3326-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719342444; x=1719947244; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zh6GzkNpe3HYBwE75qQqYBx6PpXtyY7khMvFg+0XxIs=;
        b=gN058rqBlo4/Y6K7IwrubFPJtGl/WgjrGNfsYmfRfb8pKRAavOD6++4PQgmPso68cE
         jWuIiySHlqaTx3gZFWCZ8Wu82ISmb61ITVX5vCiHCnouUJq3gg8Em4hcjdEZimlZOv6A
         Q5BfJFtX45wFC0ShvzWReUkahXwwz1jfJY/gk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719342444; x=1719947244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zh6GzkNpe3HYBwE75qQqYBx6PpXtyY7khMvFg+0XxIs=;
        b=W9EF4G07Ql0MrdIB0WUgs6VcI6+tJ1PN/NrKNsTCDTZANvJbEswW8UjXuEUnriMHOW
         kLERTULvRGOcp4emXoz1LwUCW0sKe6MXdFBdWs3ERavKJVxE4xNeoyg3F/RSIBADuSlt
         e51gKm/l9jAwlK6amGAV/zWmSI02Fm4bJtwht8Mhzbt0vHB5BwyJA/Q8c0KL74U4JjBF
         Vg/7IdDIBhlicd6PIl6yfkV7OkGQGn9WRJ+fQOvlJVwevTEQiNe0AdLsrUAg7htOVMRn
         g4M9T+xEUAiygbFD5NtLzpWyD5VWLTigdQbGWBwSjaInD8tFVkBXkC1QBiopp48Aaspd
         hI/w==
X-Gm-Message-State: AOJu0Yx++9vFgxVUlITtLJdndQUnzT/1GUABGGcd5kxai61d1Facawj3
	knGUtCYqkdTh4606/cGKO+LwbuqcXeyILS1sKSGQ2jbEjPh3LNjqZGyYSprrjKv4T23gCrtsxoG
	JREQ=
X-Google-Smtp-Source: AGHT+IHNPmsdQcA9qz63VN59BMA3NWhmQaolVchErbzJapICKkMXgA60cQbG04cCvcrzQuppyr0mEA==
X-Received: by 2002:a17:906:11c7:b0:a6f:4a42:1976 with SMTP id a640c23a62f3a-a7245bacda1mr454843466b.37.1719342443907;
        Tue, 25 Jun 2024 12:07:23 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 2/6] xen/bitops: Rename for_each_set_bit() to bitmap_for_each()
Date: Tue, 25 Jun 2024 20:07:15 +0100
Message-Id: <20240625190719.788643-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240625190719.788643-1-andrew.cooper3@citrix.com>
References: <20240625190719.788643-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current implementation wants to take an in-memory bitmap.  However, all
ARM callers and all-but-1 x86 callers spill a scalar to the stack in order to
use the "generic arbitrary bitmap" helpers under the hood.

This functions, but it's far from ideal.

Rename the construct and move it into bitmap.h, because having an iterator for
an arbitrary bitmap is a useful thing.

This will allow us to re-implement for_each_set_bit() to be more appropriate
for scalar values.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/arm/gic-vgic.c          |  2 +-
 xen/arch/arm/vgic.c              |  6 +++---
 xen/arch/arm/vgic/vgic-mmio-v2.c |  2 +-
 xen/arch/arm/vgic/vgic-mmio.c    | 12 ++++++------
 xen/arch/x86/cpu-policy.c        |  8 ++++----
 xen/arch/x86/xstate.c            |  4 ++--
 xen/include/xen/bitmap.h         | 12 ++++++++++++
 xen/include/xen/bitops.h         | 11 -----------
 8 files changed, 29 insertions(+), 28 deletions(-)

diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
index b99e28722425..0dfff76a238e 100644
--- a/xen/arch/arm/gic-vgic.c
+++ b/xen/arch/arm/gic-vgic.c
@@ -111,7 +111,7 @@ static unsigned int gic_find_unused_lr(struct vcpu *v,
     {
         unsigned int used_lr;
 
-        for_each_set_bit(used_lr, lr_mask, nr_lrs)
+        bitmap_for_each(used_lr, lr_mask, nr_lrs)
         {
             gic_hw_ops->read_lr(used_lr, &lr_val);
             if ( lr_val.virq == p->irq )
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index c04fc4f83f96..57519e834d78 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -429,7 +429,7 @@ void vgic_set_irqs_pending(struct vcpu *v, uint32_t r, unsigned int rank)
     /* LPIs will never be set pending via this function */
     ASSERT(!is_lpi(32 * rank + 31));
 
-    for_each_set_bit( i, &mask, 32 )
+    bitmap_for_each( i, &mask, 32 )
     {
         unsigned int irq = i + 32 * rank;
 
@@ -483,7 +483,7 @@ bool vgic_to_sgi(struct vcpu *v, register_t sgir, enum gic_sgi_mode irqmode,
         perfc_incr(vgic_sgi_list);
         base = target->aff1 << 4;
         bitmap = target->list;
-        for_each_set_bit( i, &bitmap, sizeof(target->list) * 8 )
+        bitmap_for_each( i, &bitmap, sizeof(target->list) * 8 )
         {
             vcpuid = base + i;
             if ( vcpuid >= d->max_vcpus || d->vcpu[vcpuid] == NULL ||
@@ -728,7 +728,7 @@ void vgic_check_inflight_irqs_pending(struct domain *d, struct vcpu *v,
     const unsigned long mask = r;
     unsigned int i;
 
-    for_each_set_bit( i, &mask, 32 )
+    bitmap_for_each( i, &mask, 32 )
     {
         struct pending_irq *p;
         struct vcpu *v_target;
diff --git a/xen/arch/arm/vgic/vgic-mmio-v2.c b/xen/arch/arm/vgic/vgic-mmio-v2.c
index 2e507b10fed5..82d0c22b39fc 100644
--- a/xen/arch/arm/vgic/vgic-mmio-v2.c
+++ b/xen/arch/arm/vgic/vgic-mmio-v2.c
@@ -108,7 +108,7 @@ static void vgic_mmio_write_sgir(struct vcpu *source_vcpu,
         return;
     }
 
-    for_each_set_bit( vcpu_id, &targets, 8 )
+    bitmap_for_each( vcpu_id, &targets, 8 )
     {
         struct vcpu *vcpu = d->vcpu[vcpu_id];
         struct vgic_irq *irq = vgic_get_irq(d, vcpu, intid);
diff --git a/xen/arch/arm/vgic/vgic-mmio.c b/xen/arch/arm/vgic/vgic-mmio.c
index 5d935a73013e..b023ecc20066 100644
--- a/xen/arch/arm/vgic/vgic-mmio.c
+++ b/xen/arch/arm/vgic/vgic-mmio.c
@@ -71,7 +71,7 @@ void vgic_mmio_write_senable(struct vcpu *vcpu,
     uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
     unsigned int i;
 
-    for_each_set_bit( i, &val, len * 8 )
+    bitmap_for_each( i, &val, len * 8 )
     {
         struct vgic_irq *irq = vgic_get_irq(vcpu->domain, vcpu, intid + i);
         unsigned long flags;
@@ -116,7 +116,7 @@ void vgic_mmio_write_cenable(struct vcpu *vcpu,
     uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
     unsigned int i;
 
-    for_each_set_bit( i, &val, len * 8 )
+    bitmap_for_each( i, &val, len * 8 )
     {
         struct vgic_irq *irq;
         unsigned long flags;
@@ -186,7 +186,7 @@ void vgic_mmio_write_spending(struct vcpu *vcpu,
     unsigned long flags;
     irq_desc_t *desc;
 
-    for_each_set_bit( i, &val, len * 8 )
+    bitmap_for_each( i, &val, len * 8 )
     {
         struct vgic_irq *irq = vgic_get_irq(vcpu->domain, vcpu, intid + i);
 
@@ -234,7 +234,7 @@ void vgic_mmio_write_cpending(struct vcpu *vcpu,
     unsigned long flags;
     irq_desc_t *desc;
 
-    for_each_set_bit( i, &val, len * 8 )
+    bitmap_for_each( i, &val, len * 8 )
     {
         struct vgic_irq *irq = vgic_get_irq(vcpu->domain, vcpu, intid + i);
 
@@ -328,7 +328,7 @@ void vgic_mmio_write_cactive(struct vcpu *vcpu,
     uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
     unsigned int i;
 
-    for_each_set_bit( i, &val, len * 8 )
+    bitmap_for_each( i, &val, len * 8 )
     {
         struct vgic_irq *irq = vgic_get_irq(vcpu->domain, vcpu, intid + i);
 
@@ -358,7 +358,7 @@ void vgic_mmio_write_sactive(struct vcpu *vcpu,
     uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
     unsigned int i;
 
-    for_each_set_bit( i, &val, len * 8 )
+    bitmap_for_each( i, &val, len * 8 )
     {
         struct vgic_irq *irq = vgic_get_irq(vcpu->domain, vcpu, intid + i);
 
diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 304dc20cfab8..cd53bac777dc 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -157,7 +157,7 @@ static void zero_leaves(struct cpuid_leaf *l,
 
 static void sanitise_featureset(uint32_t *fs)
 {
-    /* for_each_set_bit() uses unsigned longs.  Extend with zeroes. */
+    /* bitmap_for_each() uses unsigned longs.  Extend with zeroes. */
     uint32_t disabled_features[
         ROUNDUP(FSCAPINTS, sizeof(unsigned long)/sizeof(uint32_t))] = {};
     unsigned int i;
@@ -174,8 +174,8 @@ static void sanitise_featureset(uint32_t *fs)
         disabled_features[i] = ~fs[i] & deep_features[i];
     }
 
-    for_each_set_bit(i, (void *)disabled_features,
-                     sizeof(disabled_features) * 8)
+    bitmap_for_each(i, (void *)disabled_features,
+                    sizeof(disabled_features) * 8)
     {
         const uint32_t *dfs = x86_cpu_policy_lookup_deep_deps(i);
         unsigned int j;
@@ -237,7 +237,7 @@ static void recalculate_xstate(struct cpu_policy *p)
     /* Subleafs 2+ */
     xstates &= ~XSTATE_FP_SSE;
     BUILD_BUG_ON(ARRAY_SIZE(p->xstate.comp) < 63);
-    for_each_set_bit ( i, &xstates, 63 )
+    bitmap_for_each ( i, &xstates, 63 )
     {
         /*
          * Pass through size (eax) and offset (ebx) directly.  Visbility of
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 68cdd8fcf021..da9053c0a262 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -606,7 +606,7 @@ unsigned int xstate_uncompressed_size(uint64_t xcr0)
      * with respect their index.
      */
     xcr0 &= ~(X86_XCR0_SSE | X86_XCR0_X87);
-    for_each_set_bit ( i, &xcr0, 63 )
+    bitmap_for_each ( i, &xcr0, 63 )
     {
         const struct xstate_component *c = &raw_cpu_policy.xstate.comp[i];
         unsigned int s = c->offset + c->size;
@@ -634,7 +634,7 @@ unsigned int xstate_compressed_size(uint64_t xstates)
      * componenets require aligning to 64 first.
      */
     xstates &= ~(X86_XCR0_SSE | X86_XCR0_X87);
-    for_each_set_bit ( i, &xstates, 63 )
+    bitmap_for_each ( i, &xstates, 63 )
     {
         const struct xstate_component *c = &raw_cpu_policy.xstate.comp[i];
 
diff --git a/xen/include/xen/bitmap.h b/xen/include/xen/bitmap.h
index b9f980e91930..5dd7db5be9e7 100644
--- a/xen/include/xen/bitmap.h
+++ b/xen/include/xen/bitmap.h
@@ -271,6 +271,18 @@ static inline void bitmap_clear(unsigned long *map, unsigned int start,
 #undef bitmap_switch
 #undef bitmap_bytes
 
+/**
+ * bitmap_for_each - iterate over every set bit in a memory region
+ * @iter: The integer iterator
+ * @addr: The address to base the search on
+ * @size: The maximum size to search
+ */
+#define bitmap_for_each(iter, addr, size)                        \
+    for ( (iter) = find_first_bit(addr, size);                   \
+          (iter) < (size);                                       \
+          (iter) = find_next_bit(addr, size, (iter) + 1) )
+
+
 struct xenctl_bitmap;
 int xenctl_bitmap_to_bitmap(unsigned long *bitmap,
                             const struct xenctl_bitmap *xenctl_bitmap,
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index 6a5e28730a25..24de0835b7ab 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -248,17 +248,6 @@ static inline __u32 ror32(__u32 word, unsigned int shift)
 #define __L16(x) (((x) & 0x0000ff00U) ? ( 8 + __L8( (x) >> 8))  : __L8( x))
 #define ilog2(x) (((x) & 0xffff0000U) ? (16 + __L16((x) >> 16)) : __L16(x))
 
-/**
- * for_each_set_bit - iterate over every set bit in a memory region
- * @bit: The integer iterator
- * @addr: The address to base the search on
- * @size: The maximum size to search
- */
-#define for_each_set_bit(bit, addr, size)               \
-    for ( (bit) = find_first_bit(addr, size);           \
-          (bit) < (size);                               \
-          (bit) = find_next_bit(addr, size, (bit) + 1) )
-
 #define BIT_WORD(nr) ((nr) / BITS_PER_LONG)
 
 #endif /* XEN_BITOPS_H */
-- 
2.39.2


