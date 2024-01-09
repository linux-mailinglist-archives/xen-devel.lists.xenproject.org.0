Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CCE828922
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 16:38:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664698.1034789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNEBe-00084V-Mr; Tue, 09 Jan 2024 15:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664698.1034789; Tue, 09 Jan 2024 15:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNEBe-00082m-K9; Tue, 09 Jan 2024 15:38:42 +0000
Received: by outflank-mailman (input) for mailman id 664698;
 Tue, 09 Jan 2024 15:38:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C4Q/=IT=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1rNEBd-00081L-D5
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 15:38:41 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2977078a-af05-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 16:38:40 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a271a28aeb4so320149766b.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 07:38:40 -0800 (PST)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 fi3-20020a170906da0300b00a2adb417051sm1153685ejb.216.2024.01.09.07.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 07:38:39 -0800 (PST)
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
X-Inumbo-ID: 2977078a-af05-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1704814719; x=1705419519; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VhSOpe56MpOWcnrNuJqvTnfUTnjkdLUXYQWxAJ3egc0=;
        b=hJRR61ooKW04RYi5R4qI/97kiqsnxrvOZSFq8yagC5EBDbXLPDTUwvI5CJQDNe6Wzq
         NB8DJ0CtWifJtdwDCQ6h2xDSYACVyzQ2mN+YeVPIjQjUmL365c4VELfv/eQqI2X8rR9+
         zI/NOSF4QcLIxrEZeRC+PO9Q7mZRdDeUB1Iag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704814719; x=1705419519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VhSOpe56MpOWcnrNuJqvTnfUTnjkdLUXYQWxAJ3egc0=;
        b=qfiiNeLl8AI4ocdg5qkh3craeIr/RzIy7ywP8/i1QAIbr7GDgdXmKEyQ5k9XJSa1vE
         U/iM6BllLCaz7qDWzQeRk0c9t3ZsXD0P4HbuHGj1CrzB/HAyIdd5SbgXFi2bnaEoj8d6
         CCfd5qgjwVWz+qARKi1uDj3/smjt3gkYEYabyMmiCA5WRdOu3qmW99QV7FAC5R+lXg85
         d7fT+EUCdPR1TjTGByZ/uEITpOL1aZztpm7JXkucZJhv0gt0rkI6RQpiRqgcW80xEJhx
         oCErUii50Pj77TVBfMxAKCKvGcRl2v91swoC4q3neu/m/ykVKuanmJTcx1cHg+fiwMK9
         W6Hw==
X-Gm-Message-State: AOJu0YxlKgxcorKd+FvaJfMo9D6gn/6bQ7sPqHaVtmdXrODUPxN+ISYU
	Vykx1bN9oplPuPlX9otZBCEq3OEYUsWagkP2a4ZhncSmOUI=
X-Google-Smtp-Source: AGHT+IEZfJpx4+I0TuLd3gyZSUgBkd00EGOddGMDLqfVylYXXAZ9UoHQiChxbzuG2kD+kJPN4VqWZQ==
X-Received: by 2002:a17:906:74c3:b0:a23:4b44:7dcc with SMTP id z3-20020a17090674c300b00a234b447dccmr790867ejl.33.1704814719495;
        Tue, 09 Jan 2024 07:38:39 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/6] xen/x86: Add initial x2APIC ID to the per-vLAPIC save area
Date: Tue,  9 Jan 2024 15:38:29 +0000
Message-Id: <20240109153834.4192-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
References: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
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
 xen/arch/x86/cpuid.c                   | 20 ++++---------------
 xen/arch/x86/domain.c                  |  3 +++
 xen/arch/x86/hvm/vlapic.c              | 27 ++++++++++++++++++++++++--
 xen/arch/x86/include/asm/hvm/vlapic.h  |  2 ++
 xen/include/public/arch-x86/hvm/save.h |  2 ++
 xen/include/xen/lib/x86/cpu-policy.h   |  9 +++++++++
 xen/lib/x86/policy.c                   | 11 +++++++++++
 7 files changed, 56 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 7290a979c6..6e259785d0 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -139,10 +139,9 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
         const struct cpu_user_regs *regs;
 
     case 0x1:
-        /* TODO: Rework topology logic. */
         res->b &= 0x00ffffffu;
         if ( is_hvm_domain(d) )
-            res->b |= (v->vcpu_id * 2) << 24;
+            res->b |= SET_xAPIC_ID(vlapic_x2apic_id(vcpu_vlapic(v)));
 
         /* TODO: Rework vPMU control in terms of toolstack choices. */
         if ( vpmu_available(v) &&
@@ -311,20 +310,9 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
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
-        {
-            *(uint8_t *)&res->c = subleaf;
-
-            /* Fix the x2APIC identifier. */
-            res->d = v->vcpu_id * 2;
-        }
+        /* ecx != 0 if the subleaf is implemented */
+        if ( res->c && p->basic.x2apic )
+            res->d = vlapic_x2apic_id(vcpu_vlapic(v));
         break;
 
     case XSTATE_CPUID:
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 8a31d18f69..e0c7ed8d5d 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -288,7 +288,10 @@ void update_guest_memory_policy(struct vcpu *v,
 static void cpu_policy_updated(struct vcpu *v)
 {
     if ( is_hvm_vcpu(v) )
+    {
         hvm_cpuid_policy_changed(v);
+        vlapic_cpu_policy_changed(v);
+    }
 }
 
 void domain_cpu_policy_changed(struct domain *d)
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index cdb69d9742..f500d66543 100644
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
+    struct cpu_policy *cp = v->domain->arch.cpu_policy;
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
 
@@ -1514,6 +1530,13 @@ static void lapic_load_fixup(struct vlapic *vlapic)
     const struct vcpu *v = vlapic_vcpu(vlapic);
     uint32_t good_ldr = x2apic_ldr_from_id(vlapic->loaded.id);
 
+    /*
+     * Guest with hardcoded assumptions about x2apic_id <-> vcpu_id
+     * mappings. Recreate the mapping it used to have in old host.
+     */
+    if ( !vlapic->hw.x2apic_id )
+        vlapic->hw.x2apic_id = v->vcpu_id * 2;
+
     /* Skip fixups on xAPIC mode, or if the x2APIC LDR is already correct */
     if ( !vlapic_x2apic_mode(vlapic) ||
          (vlapic->loaded.ldr == good_ldr) )
diff --git a/xen/arch/x86/include/asm/hvm/vlapic.h b/xen/arch/x86/include/asm/hvm/vlapic.h
index 88ef945243..e8d41313ab 100644
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
index 7ecacadde1..1c2ec669ff 100644
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
index d5e447e9dc..14724cedff 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -542,6 +542,15 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
                                     const struct cpu_policy *guest,
                                     struct cpu_policy_errors *err);
 
+/**
+ * Calculates the x2APIC ID of a vCPU given a CPU policy
+ *
+ * @param p          CPU policy of the domain.
+ * @param vcpu_id    vCPU ID of the vCPU.
+ * @returns x2APIC ID of the vCPU.
+ */
+uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t vcpu_id);
+
 #endif /* !XEN_LIB_X86_POLICIES_H */
 
 /*
diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
index f033d22785..a3b24e6879 100644
--- a/xen/lib/x86/policy.c
+++ b/xen/lib/x86/policy.c
@@ -2,6 +2,17 @@
 
 #include <xen/lib/x86/cpu-policy.h>
 
+uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t vcpu_id)
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


