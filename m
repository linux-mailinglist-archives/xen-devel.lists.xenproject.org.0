Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 077B88D3950
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 16:33:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732083.1137917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCKMA-0000YH-JZ; Wed, 29 May 2024 14:32:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732083.1137917; Wed, 29 May 2024 14:32:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCKMA-0000Uj-Fd; Wed, 29 May 2024 14:32:46 +0000
Received: by outflank-mailman (input) for mailman id 732083;
 Wed, 29 May 2024 14:32:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ygCr=NA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sCKM9-0000Ev-LF
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 14:32:45 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 503a8b59-1dc8-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 16:32:45 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a59a352bbd9so2743066b.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 07:32:44 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a647b827400sm74614166b.69.2024.05.29.07.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 07:32:43 -0700 (PDT)
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
X-Inumbo-ID: 503a8b59-1dc8-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716993164; x=1717597964; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gvIO42hHDCq3AD6mYH6mrssGWU1hiwJplrDubSM8t74=;
        b=Lg+yacAcZPg5aPhU8PbBBA7eD6VdZuHVfSZjTmE8ZVinA4YdELZ0HYjP8mjv/XqX/9
         gcIC1nf6wETlau5OoQDvwzI/yJoJP5F+jRD/haPipriCjSY/hXKh8yiOa+zUdBYtNsNZ
         tshlBGhUFOvZEL4NNU1g8sKDITOLrtPBD1FxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716993164; x=1717597964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gvIO42hHDCq3AD6mYH6mrssGWU1hiwJplrDubSM8t74=;
        b=Pis9V+6qduTT+RUIVfP2AnEljj4Z/SYN5ij1MEiseCX0misqINkkfvMZFhy2GUjPET
         tZIVhahyt8k5AvygKwphz90QLaaac2+Q6Z1AJP0vsMWX21zMTt7owJ8bm0RDA7cmO9w9
         HwoC+7KXVOVab/veG1AeEweH/WX00v9fZvmzyZaqFdPVjb6g2yscr4JqM9r96iWDOqE8
         rvNRCgYc2PsTITfEydYJGiIEv9oAb3AiwrrVIZkJwCtoFyNMbVgO37Wr9IpXM/kxcgn2
         X31+MAfx094Ge9a63Vx7i+A9rXwH9hzhWacg6zraRHdMZvHbs0vkOYC0jjHTFe1IjKry
         /19Q==
X-Gm-Message-State: AOJu0YzMhiJPo4NUchhg+Yf1dOJufsx2P0sDcDR8leoSv15GLFYnbky8
	fXL0ZUVLDH2mtSDhG40/lm/qpRlBe6AWPko1jAuubiXJFevv8YKnESeHp17JmIzvp7JSiHU79Uk
	t
X-Google-Smtp-Source: AGHT+IGCDJIqKAXnBevXhyvx7XtqD/jOuMkVyGaO6Fhb1dyuw1DrLN5lXGDXAkLJhnzLaQ+P4T4SrQ==
X-Received: by 2002:a17:906:40c8:b0:a62:a48c:1123 with SMTP id a640c23a62f3a-a642d2775bamr207614566b.5.1716993164217;
        Wed, 29 May 2024 07:32:44 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 2/6] xen/x86: Add initial x2APIC ID to the per-vLAPIC save area
Date: Wed, 29 May 2024 15:32:31 +0100
Message-Id: <9912423b866ed696c375e0a51954d363c3706470.1716976271.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716976271.git.alejandro.vallejo@cloud.com>
References: <cover.1716976271.git.alejandro.vallejo@cloud.com>
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
v3:
  * Added rsvd_zero check to the check hook (introduced in v3/patch1).
  * Set APIC ID properly during policy update if the APIC is already
    in x2apic mode, ensuring its LDR is updated too in that case.
  * Fixed typo in variable for x86_x2apic_id_from_vcpu_id().
    * Missed due to being mid-series.
  * Rewrote the comment on CPUID leaf 0xb.
  * Rewrote the comment on x86_x2apic_id_from_vcpu_id()
---
 xen/arch/x86/cpuid.c                   | 14 ++++-----
 xen/arch/x86/hvm/vlapic.c              | 41 ++++++++++++++++++++++++--
 xen/arch/x86/include/asm/hvm/hvm.h     |  2 ++
 xen/arch/x86/include/asm/hvm/vlapic.h  |  2 ++
 xen/include/public/arch-x86/hvm/save.h |  2 ++
 xen/include/xen/lib/x86/cpu-policy.h   |  9 ++++++
 xen/lib/x86/policy.c                   | 11 +++++++
 7 files changed, 70 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 7a38e032146a..ebcdbc5cbc5d 100644
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
@@ -312,18 +311,15 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
 
     case 0xb:
         /*
-         * In principle, this leaf is Intel-only.  In practice, it is tightly
-         * coupled with x2apic, and we offer an x2apic-capable APIC emulation
-         * to guests on AMD hardware as well.
-         *
-         * TODO: Rework topology logic.
+         * Don't expose topology information to PV guests. Exposed on HVM
+         * along with x2APIC because they are tightly coupled.
          */
-        if ( p->basic.x2apic )
+        if ( is_hvm_domain(d) && p->basic.x2apic )
         {
             *(uint8_t *)&res->c = subleaf;
 
             /* Fix the x2APIC identifier. */
-            res->d = v->vcpu_id * 2;
+            res->d = vlapic_x2apic_id(vcpu_vlapic(v));
         }
         break;
 
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index a0df62b5ec0a..626a6258a4d4 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1072,7 +1072,7 @@ static uint32_t x2apic_ldr_from_id(uint32_t id)
 static void set_x2apic_id(struct vlapic *vlapic)
 {
     const struct vcpu *v = vlapic_vcpu(vlapic);
-    uint32_t apic_id = v->vcpu_id * 2;
+    uint32_t apic_id = vlapic->hw.x2apic_id;
     uint32_t apic_ldr = x2apic_ldr_from_id(apic_id);
 
     /*
@@ -1086,6 +1086,26 @@ static void set_x2apic_id(struct vlapic *vlapic)
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
+
+    if ( vlapic_x2apic_mode(vlapic) )
+        set_x2apic_id(vlapic); /* Set the APIC ID _and_ the LDR */
+    else
+        vlapic_set_reg(vlapic, APIC_ID, SET_xAPIC_ID(vlapic->hw.x2apic_id));
+}
+
 int guest_wrmsr_apic_base(struct vcpu *v, uint64_t val)
 {
     const struct cpu_policy *cp = v->domain->arch.cpu_policy;
@@ -1452,7 +1472,7 @@ void vlapic_reset(struct vlapic *vlapic)
     if ( v->vcpu_id == 0 )
         vlapic->hw.apic_base_msr |= APIC_BASE_BSP;
 
-    vlapic_set_reg(vlapic, APIC_ID, (v->vcpu_id * 2) << 24);
+    vlapic_set_reg(vlapic, APIC_ID, SET_xAPIC_ID(vlapic->hw.x2apic_id));
     vlapic_do_init(vlapic);
 }
 
@@ -1520,6 +1540,16 @@ static void lapic_load_fixup(struct vlapic *vlapic)
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
@@ -1588,6 +1618,13 @@ static int cf_check lapic_check_hidden(const struct domain *d,
          APIC_BASE_EXTD )
         return -EINVAL;
 
+    /*
+     * Fail migrations from newer versions of Xen where
+     * rsvd_zero is interpreted as something else.
+     */
+    if ( s.rsvd_zero )
+        return -EINVAL;
+
     return 0;
 }
 
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 1c01e22c8e62..746b4739f53f 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -16,6 +16,7 @@
 #include <asm/current.h>
 #include <asm/x86_emulate.h>
 #include <asm/hvm/asid.h>
+#include <asm/hvm/vlapic.h>
 
 struct pirq; /* needed by pi_update_irte */
 
@@ -448,6 +449,7 @@ static inline void hvm_update_guest_efer(struct vcpu *v)
 static inline void hvm_cpuid_policy_changed(struct vcpu *v)
 {
     alternative_vcall(hvm_funcs.cpuid_policy_changed, v);
+    vlapic_cpu_policy_changed(v);
 }
 
 static inline void hvm_set_tsc_offset(struct vcpu *v, uint64_t offset,
diff --git a/xen/arch/x86/include/asm/hvm/vlapic.h b/xen/arch/x86/include/asm/hvm/vlapic.h
index 2c4ff94ae7a8..34f23cd38a20 100644
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
index f033d22785be..b70b22d55fcf 100644
--- a/xen/lib/x86/policy.c
+++ b/xen/lib/x86/policy.c
@@ -2,6 +2,17 @@
 
 #include <xen/lib/x86/cpu-policy.h>
 
+uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t id)
+{
+    /*
+     * TODO: Derive x2APIC ID from the topology information inside `p`
+     *       rather than from the vCPU ID alone. This bodge is a temporary
+     *       measure until all infra is in place to retrieve or derive the
+     *       initial x2APIC ID from migrated domains.
+     */
+    return id * 2;
+}
+
 int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
                                     const struct cpu_policy *guest,
                                     struct cpu_policy_errors *err)
-- 
2.34.1


