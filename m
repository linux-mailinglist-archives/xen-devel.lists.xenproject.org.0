Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7085E8BFD51
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 14:39:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718778.1121296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4gaB-0003LU-GP; Wed, 08 May 2024 12:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718778.1121296; Wed, 08 May 2024 12:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4gaB-0003Io-Ai; Wed, 08 May 2024 12:39:39 +0000
Received: by outflank-mailman (input) for mailman id 718778;
 Wed, 08 May 2024 12:39:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6nIi=ML=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1s4ga9-0002bO-0s
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 12:39:37 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05c39b90-0d38-11ef-b4bb-af5377834399;
 Wed, 08 May 2024 14:39:34 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a59a0168c75so1133548366b.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 May 2024 05:39:33 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 uj4-20020a170907c98400b00a599f876c28sm5984439ejc.38.2024.05.08.05.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 05:39:32 -0700 (PDT)
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
X-Inumbo-ID: 05c39b90-0d38-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715171973; x=1715776773; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rt+Dpwuj06WuxiC7ieJ01ZuDEFxunnINhuSQIiORfm8=;
        b=BnbLM+com9EQbRs3rr8aKO/hO+jHeNe8qlkIMt8HllnArmrOWmC+t7Ndh9XnInzoK1
         cvAquPszSTCXmdpHFln7nfcxotUfYgQffWrpK4tU/H4H7p6OmlE199Yl/PcvFluHFgmm
         CIdt1Ff17yMipLQG3nuHBNaFoJYYBsEAsRtZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715171973; x=1715776773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rt+Dpwuj06WuxiC7ieJ01ZuDEFxunnINhuSQIiORfm8=;
        b=VDCmMYhOO/Nm65Qqm5CvSK6kLcqI7B1OwMXRMbF8MbcPkCEwvsLqpyF3kE8RuUFavR
         LpLxnVQLJYliCpqSBsWnA1F/ORdlcH+awevVFp0QffU+lWVfIFvdhM8jpt+R+GmtbTBG
         NQ7GHxzMqcwrV+qAMa0CCuOKHeGZlRBxHLk/oUNkWA5YUjx66W0i+dStPLGUhUmk1A/p
         4KWnUPWNVIesfJ2t6G+3Auj8K8EEaXIKj65LP4YHRiaJJU5t95LF1i/sRAZuJhc3txgn
         T96ynwWCznMJBlxivpka2R6rHFNUW6OmNNjhWzBi/fOw2DfGoZ0vDyrB/1tnFxEzBJdU
         YWQg==
X-Gm-Message-State: AOJu0YylppFUSqOJYs4al81mspX8Wpm8fLYhAWV//3nR1WR1a/trD4VE
	/kQaGqeNkMJgF8vnTjfFWvW79MBgraF+TAkUfUm6PwmyJqN9OEAUrYe8mu8aIl9OFT3e5k8cwOe
	1
X-Google-Smtp-Source: AGHT+IF3f0rpiBCbGK6d85BfHLVqHkydomk/mOPnkyuMz2szjNGaZF3xK+tRFQaovXxLP12m59c+Iw==
X-Received: by 2002:a17:907:6ea3:b0:a59:bc9d:a0ab with SMTP id a640c23a62f3a-a59fb9f3409mr169249366b.72.1715171972911;
        Wed, 08 May 2024 05:39:32 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 1/8] xen/x86: Add initial x2APIC ID to the per-vLAPIC save area
Date: Wed,  8 May 2024 13:39:20 +0100
Message-Id: <4095f31a88589ced2b620e8ebbb84cdc2fae8914.1715102098.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715102098.git.alejandro.vallejo@cloud.com>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows the initial x2APIC ID to be sent on the migration stream. The
hardcoded mapping x2apic_id=2*vcpu_id is maintained for the time being.
Given the vlapic data is zero-extended on restore, fix up migrations from
hosts without the field by setting it to the old convention if zero.

x2APIC IDs are calculated from the CPU policy where the guest topology is
defined. For the time being, the function simply returns the old
relationship, but will eventually return results consistent with the
topology.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2:
  * Removed usage of SET_xAPIC_ID().
  * Restored previous logic when exposing leaf 0xb, and gate it for HVM only.
  * Rewrote comment in lapic_load_fixup, including the implicit assumption.
  * Moved vlapic_cpu_policy_changed() into hvm_cpuid_policy_changed())
  * const-ified policy in vlapic_cpu_policy_changed()
---
 xen/arch/x86/cpuid.c                   | 15 ++++---------
 xen/arch/x86/hvm/vlapic.c              | 30 ++++++++++++++++++++++++--
 xen/arch/x86/include/asm/hvm/hvm.h     |  1 +
 xen/arch/x86/include/asm/hvm/vlapic.h  |  2 ++
 xen/include/public/arch-x86/hvm/save.h |  2 ++
 xen/include/xen/lib/x86/cpu-policy.h   |  9 ++++++++
 xen/lib/x86/policy.c                   | 11 ++++++++++
 7 files changed, 57 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 7a38e032146a..242c21ec5bb6 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -139,10 +139,9 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
         const struct cpu_user_regs *regs;
 
     case 0x1:
-        /* TODO: Rework topology logic. */
         res->b &= 0x00ffffffu;
         if ( is_hvm_domain(d) )
-            res->b |= (v->vcpu_id * 2) << 24;
+            res->b |= vlapic_x2apic_id(vcpu_vlapic(v)) << 24;
 
         /* TODO: Rework vPMU control in terms of toolstack choices. */
         if ( vpmu_available(v) &&
@@ -311,19 +310,13 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
         break;
 
     case 0xb:
-        /*
-         * In principle, this leaf is Intel-only.  In practice, it is tightly
-         * coupled with x2apic, and we offer an x2apic-capable APIC emulation
-         * to guests on AMD hardware as well.
-         *
-         * TODO: Rework topology logic.
-         */
-        if ( p->basic.x2apic )
+        /* Don't expose topology information to PV guests */
+        if ( is_hvm_domain(d) && p->basic.x2apic )
         {
             *(uint8_t *)&res->c = subleaf;
 
             /* Fix the x2APIC identifier. */
-            res->d = v->vcpu_id * 2;
+            res->d = vlapic_x2apic_id(vcpu_vlapic(v));
         }
         break;
 
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 05072a21bf38..61a96474006b 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1069,7 +1069,7 @@ static uint32_t x2apic_ldr_from_id(uint32_t id)
 static void set_x2apic_id(struct vlapic *vlapic)
 {
     const struct vcpu *v = vlapic_vcpu(vlapic);
-    uint32_t apic_id = v->vcpu_id * 2;
+    uint32_t apic_id = vlapic->hw.x2apic_id;
     uint32_t apic_ldr = x2apic_ldr_from_id(apic_id);
 
     /*
@@ -1083,6 +1083,22 @@ static void set_x2apic_id(struct vlapic *vlapic)
     vlapic_set_reg(vlapic, APIC_LDR, apic_ldr);
 }
 
+void vlapic_cpu_policy_changed(struct vcpu *v)
+{
+    struct vlapic *vlapic = vcpu_vlapic(v);
+    const struct cpu_policy *cp = v->domain->arch.cpu_policy;
+
+    /*
+     * Don't override the initial x2APIC ID if we have migrated it or
+     * if the domain doesn't have vLAPIC at all.
+     */
+    if ( !has_vlapic(v->domain) || vlapic->loaded.hw )
+        return;
+
+    vlapic->hw.x2apic_id = x86_x2apic_id_from_vcpu_id(cp, v->vcpu_id);
+    vlapic_set_reg(vlapic, APIC_ID, SET_xAPIC_ID(vlapic->hw.x2apic_id));
+}
+
 int guest_wrmsr_apic_base(struct vcpu *v, uint64_t val)
 {
     const struct cpu_policy *cp = v->domain->arch.cpu_policy;
@@ -1449,7 +1465,7 @@ void vlapic_reset(struct vlapic *vlapic)
     if ( v->vcpu_id == 0 )
         vlapic->hw.apic_base_msr |= APIC_BASE_BSP;
 
-    vlapic_set_reg(vlapic, APIC_ID, (v->vcpu_id * 2) << 24);
+    vlapic_set_reg(vlapic, APIC_ID, SET_xAPIC_ID(vlapic->hw.x2apic_id));
     vlapic_do_init(vlapic);
 }
 
@@ -1514,6 +1530,16 @@ static void lapic_load_fixup(struct vlapic *vlapic)
     const struct vcpu *v = vlapic_vcpu(vlapic);
     uint32_t good_ldr = x2apic_ldr_from_id(vlapic->loaded.id);
 
+    /*
+     * Loading record without hw.x2apic_id in the save stream, calculate using
+     * the traditional "vcpu_id * 2" relation. There's an implicit assumption
+     * that vCPU0 always has x2APIC0, which is true for the old relation, and
+     * still holds under the new x2APIC generation algorithm. While that case
+     * goes through the conditional it's benign because it still maps to zero.
+     */
+    if ( !vlapic->hw.x2apic_id )
+        vlapic->hw.x2apic_id = v->vcpu_id * 2;
+
     /* Skip fixups on xAPIC mode, or if the x2APIC LDR is already correct */
     if ( !vlapic_x2apic_mode(vlapic) ||
          (vlapic->loaded.ldr == good_ldr) )
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 0c9e6f15645d..e1f0585d75a9 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -448,6 +448,7 @@ static inline void hvm_update_guest_efer(struct vcpu *v)
 static inline void hvm_cpuid_policy_changed(struct vcpu *v)
 {
     alternative_vcall(hvm_funcs.cpuid_policy_changed, v);
+    vlapic_cpu_policy_changed(v);
 }
 
 static inline void hvm_set_tsc_offset(struct vcpu *v, uint64_t offset,
diff --git a/xen/arch/x86/include/asm/hvm/vlapic.h b/xen/arch/x86/include/asm/hvm/vlapic.h
index 88ef94524339..e8d41313abd3 100644
--- a/xen/arch/x86/include/asm/hvm/vlapic.h
+++ b/xen/arch/x86/include/asm/hvm/vlapic.h
@@ -44,6 +44,7 @@
 #define vlapic_xapic_mode(vlapic)                               \
     (!vlapic_hw_disabled(vlapic) && \
      !((vlapic)->hw.apic_base_msr & APIC_BASE_EXTD))
+#define vlapic_x2apic_id(vlapic) ((vlapic)->hw.x2apic_id)
 
 /*
  * Generic APIC bitmap vector update & search routines.
@@ -107,6 +108,7 @@ int vlapic_ack_pending_irq(struct vcpu *v, int vector, bool force_ack);
 
 int  vlapic_init(struct vcpu *v);
 void vlapic_destroy(struct vcpu *v);
+void vlapic_cpu_policy_changed(struct vcpu *v);
 
 void vlapic_reset(struct vlapic *vlapic);
 
diff --git a/xen/include/public/arch-x86/hvm/save.h b/xen/include/public/arch-x86/hvm/save.h
index 7ecacadde165..1c2ec669ffc9 100644
--- a/xen/include/public/arch-x86/hvm/save.h
+++ b/xen/include/public/arch-x86/hvm/save.h
@@ -394,6 +394,8 @@ struct hvm_hw_lapic {
     uint32_t             disabled; /* VLAPIC_xx_DISABLED */
     uint32_t             timer_divisor;
     uint64_t             tdt_msr;
+    uint32_t             x2apic_id;
+    uint32_t             rsvd_zero;
 };
 
 DECLARE_HVM_SAVE_TYPE(LAPIC, 5, struct hvm_hw_lapic);
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index d5e447e9dc06..392320b9adbe 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -542,6 +542,15 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
                                     const struct cpu_policy *guest,
                                     struct cpu_policy_errors *err);
 
+/**
+ * Calculates the x2APIC ID of a vCPU given a CPU policy
+ *
+ * @param p          CPU policy of the domain.
+ * @param id         vCPU ID of the vCPU.
+ * @returns x2APIC ID of the vCPU.
+ */
+uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t id);
+
 #endif /* !XEN_LIB_X86_POLICIES_H */
 
 /*
diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
index f033d22785be..4cef658feeb8 100644
--- a/xen/lib/x86/policy.c
+++ b/xen/lib/x86/policy.c
@@ -2,6 +2,17 @@
 
 #include <xen/lib/x86/cpu-policy.h>
 
+uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t id)
+{
+    /*
+     * TODO: Derive x2APIC ID from the topology information inside `p`
+     *       rather than from vCPU ID. This bodge is a temporary measure
+     *       until all infra is in place to retrieve or derive the initial
+     *       x2APIC ID from migrated domains.
+     */
+    return vcpu_id * 2;
+}
+
 int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
                                     const struct cpu_policy *guest,
                                     struct cpu_policy_errors *err)
-- 
2.34.1


