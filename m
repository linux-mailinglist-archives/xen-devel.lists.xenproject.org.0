Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3BA49105A
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 19:35:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258222.444462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Wq9-0004jT-Mu; Mon, 17 Jan 2022 18:34:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258222.444462; Mon, 17 Jan 2022 18:34:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Wq9-0004gU-Jv; Mon, 17 Jan 2022 18:34:49 +0000
Received: by outflank-mailman (input) for mailman id 258222;
 Mon, 17 Jan 2022 18:34:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PnDA=SB=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1n9Wq7-0004g5-D6
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 18:34:47 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22e155d3-77c4-11ec-a115-11989b9578b4;
 Mon, 17 Jan 2022 19:34:44 +0100 (CET)
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
X-Inumbo-ID: 22e155d3-77c4-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642444484;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HJvhAnanEqe+CxbLx0yf9TQAJKilHOHk3YDJCg2zxCg=;
  b=Hwgxf5jvdJQqp5UDJ/WmQLlr+AZyV1nTr/S1K0Nv4nmKKXdf9ixNNhaH
   NjKyaHwBcwdwYeP555X9ShyiGtWYLBq8xZUZwRFbn79SlqLQYS2nxWOy+
   mcki+/AK/81pZZgArcq4v3Ruf6PxTYK9Zri7vitLU2KmXDMtf1e93V/0f
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: TB2XcwXV2wc3RobzdhHqcIalrDSepoqgFBepUAmWtUovaWdo/iWfmCLvgM4YxjqM1r1wpjFGjP
 N5VVoPLRuzr7/KXgPlnutWFLCRi/QMPdgh0HFja9X96JD06gy3lqJkBKVcrX5hTgEN5QuCDkld
 qgZGIsSjUAAG9m26+dQY66lm20cbmZfL3UEZy2jab/oz6Jo3v/ApaKBlObEfgrySTWZUZ51xeC
 sjHOch7sez0ykeit8OTNl+StdjXBhpI7iiJmZkxcoYI2jNaK2+7Yj+sO6ePnp2a4ZCHM2EdNr+
 VuJ5+rgUlHSUBiMOtoaOBHcD
X-SBRS: 5.2
X-MesageID: 62085888
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:cKW+JK7Wh512NJP8x6kEQwxRtL3AchMFZxGqfqrLsTDasY5as4F+v
 mJOD2/VO/ffNjb0c9BxaoXg8U1VvpXQyodnSANqrS8xHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZg29Ew27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zk
 pZTkcSsERoVIYLowtU5UD4CDQZ7MvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQR66OO
 ppJOVKDajzue0R0ZgYdFagfp+Clgj7wKCZ1skCa8P9fD2/7k1UqjemF3MDuUt6XQ4NTl0WRp
 GPD9kz4BA0XMJqUzj/t2nGhmO7J2z/6UYQ6Fbuk+/osi1qWrkQMDDUGWF39puO24mauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O88Q5RyJy6HUyx2EHWVCRTlEAOHKr+dvG2Zsj
 AXQ2Yq0W3o/69V5VE5x6J/O7i2WYTRNMFMdSgtefC8GxIP9h4Q820enoslYLIa5idj8GDfVy
 j+MrTQji7h7sfPnx5lX7nic3Wvy+8Ghohodo1yOAzn7tl8RiJuNPtTwsTDmAeB8wJF1p7Vrl
 FwNgICg4e8HFvlhfwTdEbxWTNlFCxtoWQAwYGKD/bF8rVxBGFb5JOi8BQ2Swm8zaK7onhezM
 SfuVft5vsM7AZdTRfYfj3iNI8or17P8Mt/uS+rZaNFDCrAoKlPdp3w+Ph7Mgz69+KTJrU3ZE
 c3GGSpLJSxLYZmLMRLsH7tNuVPV7n1WKZzvqWDTkE38jOv2iI+9QrYZKlqeBt3VH4vfyDg5B
 +13bpPQoz0GCbWWSnCOreY7cA5WRVBmW8Geg5EHJ4arf1s9cEl8WqC5/F/UU9E/90ijvr2Wr
 ijVt44x4AeXuEAr3i3ROy8zM+2+DM8vxZ/5VAR1VWuVN7EYSd7HxM8im1EfJ9HLLcRvkqx5S
 ecrYcKFDqgdQzjL4W1FP5L8sJZjZFKgggfXZ3ipZz02fphBQQ3V+4C7IluzpXdWVifn59Ejp
 7CA1x/ARcZRTQpVE8uLOumkyEm8vCZBlbsqDVfIONRaZG7l7JNud37qlvYyLsxVcUfDyzKW2
 hy4GxAdoeWR8YY5/MOQ3fKPrpuzEvs4FU1fRjGJ4bGzPCjc32yi3Y4fD7rYIWGDDDv5ofzwa
 /9UwvfwNOw8sGxL64csQax2ya8e5sf0o+MIxApTA3iWPU+gDaltIyfa0JAX5LFN3LJQpSC/R
 lmLpotBIbyMNc7oTAwRKQ4iYrjR3P0YgGCPv/E8IUG87y5r5ruXF05VOkDU2iBaKbJ0NqIjw
 Psg55FKu1Du1EJyP4bUlD1Q+kSNMmcEAvcuuZwtCYP2jhYmlwNZapvGBy6quJyCZr2g6KXxz
 uN4UEYau4lh+w==
IronPort-HdrOrdr: A9a23:Rau5CaNQvUNKXsBcTvmjsMiBIKoaSvp037Eqv3oedfUzSL3gqy
 nOpoV86faaslYssR0b9exofZPwJE80lqQFhrX5X43SPzUO0VHAROoJgLcKgQeQfxEWntQtrZ
 uIGJIeNDSfNzdHZL7BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.88,296,1635220800"; 
   d="scan'208";a="62085888"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v2 1/4] x86/guest: Introduce {get,set}_reg() infrastructure
Date: Mon, 17 Jan 2022 18:34:12 +0000
Message-ID: <20220117183415.11150-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220117183415.11150-1-andrew.cooper3@citrix.com>
References: <20220117183415.11150-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Various registers have per-guest-type or per-vendor locations or access
requirements.  To support their use from common code, provide accessors which
allow for per-guest-type behaviour.

For now, just infrastructure handling default cases and expectations.
Subsequent patches will start handling registers using this infrastructure.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>

It is deliberately {get,set}_reg() because in the fullness of time, it will
handle more than just MSRs.  There's loads of space in the MSR index range
which we can reuse for non-MSRs.

v2:
 * New
---
 xen/arch/x86/hvm/hvm.c               | 22 ++++++++++++++++++++++
 xen/arch/x86/hvm/svm/svm.c           | 30 ++++++++++++++++++++++++++++++
 xen/arch/x86/hvm/vmx/vmx.c           | 31 +++++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/hvm/hvm.h   | 24 ++++++++++++++++++++++++
 xen/arch/x86/include/asm/pv/domain.h | 13 +++++++++++++
 xen/arch/x86/pv/emulate.c            | 31 +++++++++++++++++++++++++++++++
 6 files changed, 151 insertions(+)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 3b87506ac4b3..b530e986e86c 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3744,6 +3744,28 @@ int hvm_msr_write_intercept(unsigned int msr, uint64_t msr_content,
     return X86EMUL_EXCEPTION;
 }
 
+uint64_t hvm_get_reg(struct vcpu *v, unsigned int reg)
+{
+    ASSERT(v == current || !vcpu_runnable(v));
+
+    switch ( reg )
+    {
+    default:
+        return alternative_call(hvm_funcs.get_reg, v, reg);
+    }
+}
+
+void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
+{
+    ASSERT(v == current || !vcpu_runnable(v));
+
+    switch ( reg )
+    {
+    default:
+        return alternative_vcall(hvm_funcs.set_reg, v, reg, val);
+    }
+}
+
 static bool is_sysdesc_access(const struct x86_emulate_state *state,
                               const struct x86_emulate_ctxt *ctxt)
 {
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index fae39c4b4cbd..bb6b8e560a9f 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2469,6 +2469,33 @@ static bool svm_get_pending_event(struct vcpu *v, struct x86_event *info)
     return true;
 }
 
+static uint64_t svm_get_reg(struct vcpu *v, unsigned int reg)
+{
+    struct domain *d = v->domain;
+
+    switch ( reg )
+    {
+    default:
+        printk(XENLOG_G_ERR "%s(%pv, 0x%08x) Bad register\n",
+               __func__, v, reg);
+        domain_crash(d);
+        return 0;
+    }
+}
+
+static void svm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
+{
+    struct domain *d = v->domain;
+
+    switch ( reg )
+    {
+    default:
+        printk(XENLOG_G_ERR "%s(%pv, 0x%08x, 0x%016"PRIx64") Bad register\n",
+               __func__, v, reg, val);
+        domain_crash(d);
+    }
+}
+
 static struct hvm_function_table __initdata svm_function_table = {
     .name                 = "SVM",
     .cpu_up_prepare       = svm_cpu_up_prepare,
@@ -2518,6 +2545,9 @@ static struct hvm_function_table __initdata svm_function_table = {
     .nhvm_intr_blocked = nsvm_intr_blocked,
     .nhvm_hap_walk_L1_p2m = nsvm_hap_walk_L1_p2m,
 
+    .get_reg = svm_get_reg,
+    .set_reg = svm_set_reg,
+
     .tsc_scaling = {
         .max_ratio = ~TSC_RATIO_RSVD_BITS,
     },
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index a7a0d662342a..4ff92ab4e94e 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2404,6 +2404,33 @@ static int vmtrace_reset(struct vcpu *v)
     return 0;
 }
 
+static uint64_t vmx_get_reg(struct vcpu *v, unsigned int reg)
+{
+    struct domain *d = v->domain;
+
+    switch ( reg )
+    {
+    default:
+        printk(XENLOG_G_ERR "%s(%pv, 0x%08x) Bad register\n",
+               __func__, v, reg);
+        domain_crash(d);
+        return 0;
+    }
+}
+
+static void vmx_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
+{
+    struct domain *d = v->domain;
+
+    switch ( reg )
+    {
+    default:
+        printk(XENLOG_G_ERR "%s(%pv, 0x%08x, 0x%016"PRIx64") Bad register\n",
+               __func__, v, reg, val);
+        domain_crash(d);
+    }
+}
+
 static struct hvm_function_table __initdata vmx_function_table = {
     .name                 = "VMX",
     .cpu_up_prepare       = vmx_cpu_up_prepare,
@@ -2464,6 +2491,10 @@ static struct hvm_function_table __initdata vmx_function_table = {
     .vmtrace_set_option = vmtrace_set_option,
     .vmtrace_get_option = vmtrace_get_option,
     .vmtrace_reset = vmtrace_reset,
+
+    .get_reg = vmx_get_reg,
+    .set_reg = vmx_set_reg,
+
     .tsc_scaling = {
         .max_ratio = VMX_TSC_MULTIPLIER_MAX,
     },
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index b26302d9e769..c8b62b514b42 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -223,6 +223,9 @@ struct hvm_function_table {
     int (*vmtrace_get_option)(struct vcpu *v, uint64_t key, uint64_t *value);
     int (*vmtrace_reset)(struct vcpu *v);
 
+    uint64_t (*get_reg)(struct vcpu *v, unsigned int reg);
+    void (*set_reg)(struct vcpu *v, unsigned int reg, uint64_t val);
+
     /*
      * Parameters and callbacks for hardware-assisted TSC scaling,
      * which are valid only when the hardware feature is available.
@@ -730,6 +733,18 @@ static inline int hvm_vmtrace_reset(struct vcpu *v)
 }
 
 /*
+ * Accessors for registers which have per-guest-type or per-vendor locations
+ * (e.g. VMCS, msr load/save lists, VMCB, VMLOAD lazy, etc).
+ *
+ * The caller is responsible for all auditing - these accessors do not fail,
+ * but do use domain_crash() for usage errors.
+ *
+ * Must cope with being called in non-current context.
+ */
+uint64_t hvm_get_reg(struct vcpu *v, unsigned int reg);
+void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val);
+
+/*
  * This must be defined as a macro instead of an inline function,
  * because it uses 'struct vcpu' and 'struct domain' which have
  * not been defined yet.
@@ -852,6 +867,15 @@ static inline int hvm_vmtrace_get_option(
     return -EOPNOTSUPP;
 }
 
+static inline uint64_t pv_get_reg(struct vcpu *v, unsigned int reg)
+{
+    ASSERT_UNREACHABLE();
+}
+static inline void pv_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
+{
+    ASSERT_UNREACHABLE();
+}
+
 #define is_viridian_domain(d) ((void)(d), false)
 #define is_viridian_vcpu(v) ((void)(v), false)
 #define has_viridian_time_ref_count(d) ((void)(d), false)
diff --git a/xen/arch/x86/include/asm/pv/domain.h b/xen/arch/x86/include/asm/pv/domain.h
index df9716ff26a8..5fbf4043e0d9 100644
--- a/xen/arch/x86/include/asm/pv/domain.h
+++ b/xen/arch/x86/include/asm/pv/domain.h
@@ -72,6 +72,10 @@ int pv_vcpu_initialise(struct vcpu *v);
 void pv_domain_destroy(struct domain *d);
 int pv_domain_initialise(struct domain *d);
 
+/* See hvm_{get,set}_reg() for description. */
+uint64_t pv_get_reg(struct vcpu *v, unsigned int reg);
+void pv_set_reg(struct vcpu *v, unsigned int reg, uint64_t val);
+
 /*
  * Bits which a PV guest can toggle in its view of cr4.  Some are loaded into
  * hardware, while some are fully emulated.
@@ -100,6 +104,15 @@ static inline int pv_vcpu_initialise(struct vcpu *v) { return -EOPNOTSUPP; }
 static inline void pv_domain_destroy(struct domain *d) {}
 static inline int pv_domain_initialise(struct domain *d) { return -EOPNOTSUPP; }
 
+static inline uint64_t pv_get_reg(struct vcpu *v, unsigned int reg)
+{
+    ASSERT_UNREACHABLE();
+}
+static inline void pv_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
+{
+    ASSERT_UNREACHABLE();
+}
+
 static inline unsigned long pv_make_cr4(const struct vcpu *v) { return ~0ul; }
 
 #endif	/* CONFIG_PV */
diff --git a/xen/arch/x86/pv/emulate.c b/xen/arch/x86/pv/emulate.c
index e8bb326efdfe..ae049b60f2fc 100644
--- a/xen/arch/x86/pv/emulate.c
+++ b/xen/arch/x86/pv/emulate.c
@@ -90,6 +90,37 @@ void pv_emul_instruction_done(struct cpu_user_regs *regs, unsigned long rip)
     }
 }
 
+uint64_t pv_get_reg(struct vcpu *v, unsigned int reg)
+{
+    struct domain *d = v->domain;
+
+    ASSERT(v == current || !vcpu_runnable(v));
+
+    switch ( reg )
+    {
+    default:
+        printk(XENLOG_G_ERR "%s(%pv, 0x%08x) Bad register\n",
+               __func__, v, reg);
+        domain_crash(d);
+        return 0;
+    }
+}
+
+void pv_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
+{
+    struct domain *d = v->domain;
+
+    ASSERT(v == current || !vcpu_runnable(v));
+
+    switch ( reg )
+    {
+    default:
+        printk(XENLOG_G_ERR "%s(%pv, 0x%08x, 0x%016"PRIx64") Bad register\n",
+               __func__, v, reg, val);
+        domain_crash(d);
+    }
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.11.0


