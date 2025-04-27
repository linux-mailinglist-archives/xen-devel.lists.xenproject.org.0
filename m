Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE1EA9E171
	for <lists+xen-devel@lfdr.de>; Sun, 27 Apr 2025 11:22:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.969579.1358695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8yCe-0004JB-32; Sun, 27 Apr 2025 09:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 969579.1358695; Sun, 27 Apr 2025 09:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8yCd-00042a-Dt; Sun, 27 Apr 2025 09:21:35 +0000
Received: by outflank-mailman (input) for mailman id 969579;
 Sun, 27 Apr 2025 09:21:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hqWD=XN=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1u8yCZ-0001AF-PY
 for xen-devel@lists.xenproject.org; Sun, 27 Apr 2025 09:21:31 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 005a92c7-2349-11f0-9eb3-5ba50f476ded;
 Sun, 27 Apr 2025 11:21:30 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53R9KRSC1598826
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Sun, 27 Apr 2025 02:21:03 -0700
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
X-Inumbo-ID: 005a92c7-2349-11f0-9eb3-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53R9KRSC1598826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745745665;
	bh=iRLOK69Mef4+A+S2gj/43H5GwXdynIeVCT6ycfI9j18=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c1dcCL8yycJUuI1QDknvyiQoGu91h+bu3N+Rph9ep6kISU1bh63T/+FllB4DyX8UO
	 yyURbI4Y77d+dHN+Zqrhyou2De2xRRl3siSLfKXTUF8WX+bGVjOOWOt3Ei+rqBTkAq
	 VXY6Luh9+0YlsTHBhoxZZlIOsD7SvxBKxk686SsD3VhfWcsy1SECX5uMqX/8K6tRFC
	 Vm2IrEH/4mcXTZRnPbvEgOCcw7BD4EcMGVnELCpwLUmOlNCvQWs0VkCLF6QJ4f4SXv
	 Ji4EkwoQMvAMTShdrFoS/5wPxq7dMefQPYfDXCOLMRwWHuVFoadvhu7cCw7av2oDUu
	 J/L6YjvBl6/iQ==
From: "Xin Li (Intel)" <xin@zytor.com>
To: linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-hyperv@vger.kernel.org,
        virtualization@lists.linux.dev, linux-pm@vger.kernel.org,
        linux-edac@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org,
        netdev@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        acme@kernel.org, jgross@suse.com, andrew.cooper3@citrix.com,
        peterz@infradead.org, namhyung@kernel.org, mark.rutland@arm.com,
        alexander.shishkin@linux.intel.com, jolsa@kernel.org,
        irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com,
        wei.liu@kernel.org, ajay.kaher@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, tony.luck@intel.com,
        pbonzini@redhat.com, vkuznets@redhat.com, seanjc@google.com,
        luto@kernel.org, boris.ostrovsky@oracle.com, kys@microsoft.com,
        haiyangz@microsoft.com, decui@microsoft.com,
        dapeng1.mi@linux.intel.com, ilpo.jarvinen@linux.intel.com
Subject: [PATCH v4 15/15] x86/msr: Change the function type of native_read_msr_safe()
Date: Sun, 27 Apr 2025 02:20:27 -0700
Message-ID: <20250427092027.1598740-16-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250427092027.1598740-1-xin@zytor.com>
References: <20250427092027.1598740-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify the function type of native_read_msr_safe() to:

    int native_read_msr_safe(u32 msr, u64 *val)

This change makes the function return an error code instead of the
MSR value, aligning it with the type of native_write_msr_safe().
Consequently, their callers can check the results in the same way.

While at it, convert leftover MSR data type "unsigned int" to u32.

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/include/asm/msr.h            | 21 +++++++++++----------
 arch/x86/include/asm/paravirt.h       | 19 ++++++++-----------
 arch/x86/include/asm/paravirt_types.h |  6 +++---
 arch/x86/kvm/svm/svm.c                | 19 +++++++------------
 arch/x86/xen/enlighten_pv.c           | 13 ++++++++-----
 arch/x86/xen/pmu.c                    | 14 ++++++++------
 6 files changed, 45 insertions(+), 47 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 0392b9596107..e7ee51ccd82e 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -130,18 +130,22 @@ static inline u64 native_read_msr(u32 msr)
 	return val;
 }
 
-static inline u64 native_read_msr_safe(u32 msr, int *err)
+static inline int native_read_msr_safe(u32 msr, u64 *p)
 {
+	int err;
 	DECLARE_ARGS(val, low, high);
 
 	asm volatile("1: rdmsr ; xor %[err],%[err]\n"
 		     "2:\n\t"
 		     _ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_RDMSR_SAFE, %[err])
-		     : [err] "=r" (*err), EAX_EDX_RET(val, low, high)
+		     : [err] "=r" (err), EAX_EDX_RET(val, low, high)
 		     : "c" (msr));
 	if (tracepoint_enabled(read_msr))
-		do_trace_read_msr(msr, EAX_EDX_VAL(val, low, high), *err);
-	return EAX_EDX_VAL(val, low, high);
+		do_trace_read_msr(msr, EAX_EDX_VAL(val, low, high), err);
+
+	*p = EAX_EDX_VAL(val, low, high);
+
+	return err;
 }
 
 /* Can be uninlined because referenced by paravirt */
@@ -221,8 +225,8 @@ static inline int wrmsrq_safe(u32 msr, u64 val)
 /* rdmsr with exception handling */
 #define rdmsr_safe(msr, low, high)				\
 ({								\
-	int __err;						\
-	u64 __val = native_read_msr_safe((msr), &__err);	\
+	u64 __val;						\
+	int __err = native_read_msr_safe((msr), &__val);	\
 	(*low) = (u32)__val;					\
 	(*high) = (u32)(__val >> 32);				\
 	__err;							\
@@ -230,10 +234,7 @@ static inline int wrmsrq_safe(u32 msr, u64 val)
 
 static inline int rdmsrq_safe(u32 msr, u64 *p)
 {
-	int err;
-
-	*p = native_read_msr_safe(msr, &err);
-	return err;
+	return native_read_msr_safe(msr, p);
 }
 
 static __always_inline u64 rdpmc(int counter)
diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index edf23bde367e..03f680d1057a 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -175,7 +175,7 @@ static inline void __write_cr4(unsigned long x)
 	PVOP_VCALL1(cpu.write_cr4, x);
 }
 
-static inline u64 paravirt_read_msr(unsigned msr)
+static inline u64 paravirt_read_msr(u32 msr)
 {
 	return PVOP_CALL1(u64, cpu.read_msr, msr);
 }
@@ -185,9 +185,9 @@ static inline void paravirt_write_msr(u32 msr, u64 val)
 	PVOP_VCALL2(cpu.write_msr, msr, val);
 }
 
-static inline u64 paravirt_read_msr_safe(unsigned msr, int *err)
+static inline int paravirt_read_msr_safe(u32 msr, u64 *val)
 {
-	return PVOP_CALL2(u64, cpu.read_msr_safe, msr, err);
+	return PVOP_CALL2(int, cpu.read_msr_safe, msr, val);
 }
 
 static inline int paravirt_write_msr_safe(u32 msr, u64 val)
@@ -225,19 +225,16 @@ static inline int wrmsrq_safe(u32 msr, u64 val)
 /* rdmsr with exception handling */
 #define rdmsr_safe(msr, a, b)				\
 ({							\
-	int _err;					\
-	u64 _l = paravirt_read_msr_safe(msr, &_err);	\
+	u64 _l;						\
+	int _err = paravirt_read_msr_safe((msr), &_l);	\
 	(*a) = (u32)_l;					\
-	(*b) = _l >> 32;				\
+	(*b) = (u32)(_l >> 32);				\
 	_err;						\
 })
 
-static inline int rdmsrq_safe(unsigned msr, u64 *p)
+static __always_inline int rdmsrq_safe(u32 msr, u64 *p)
 {
-	int err;
-
-	*p = paravirt_read_msr_safe(msr, &err);
-	return err;
+	return paravirt_read_msr_safe(msr, p);
 }
 
 static __always_inline u64 rdpmc(int counter)
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 78777b78da12..b08b9d3122d6 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -91,14 +91,14 @@ struct pv_cpu_ops {
 		      unsigned int *ecx, unsigned int *edx);
 
 	/* Unsafe MSR operations.  These will warn or panic on failure. */
-	u64 (*read_msr)(unsigned int msr);
+	u64 (*read_msr)(u32 msr);
 	void (*write_msr)(u32 msr, u64 val);
 
 	/*
 	 * Safe MSR operations.
-	 * read sets err to 0 or -EIO.  write returns 0 or -EIO.
+	 * Returns 0 or -EIO.
 	 */
-	u64 (*read_msr_safe)(unsigned int msr, int *err);
+	int (*read_msr_safe)(u32 msr, u64 *val);
 	int (*write_msr_safe)(u32 msr, u64 val);
 
 	u64 (*read_pmc)(int counter);
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 4ef9978dce70..838606f784c9 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -475,15 +475,13 @@ static void svm_inject_exception(struct kvm_vcpu *vcpu)
 
 static void svm_init_erratum_383(void)
 {
-	int err;
 	u64 val;
 
 	if (!static_cpu_has_bug(X86_BUG_AMD_TLB_MMATCH))
 		return;
 
 	/* Use _safe variants to not break nested virtualization */
-	val = native_read_msr_safe(MSR_AMD64_DC_CFG, &err);
-	if (err)
+	if (native_read_msr_safe(MSR_AMD64_DC_CFG, &val))
 		return;
 
 	val |= (1ULL << 47);
@@ -648,13 +646,12 @@ static int svm_enable_virtualization_cpu(void)
 	 * erratum is present everywhere).
 	 */
 	if (cpu_has(&boot_cpu_data, X86_FEATURE_OSVW)) {
-		uint64_t len, status = 0;
+		u64 len, status = 0;
 		int err;
 
-		len = native_read_msr_safe(MSR_AMD64_OSVW_ID_LENGTH, &err);
+		err = native_read_msr_safe(MSR_AMD64_OSVW_ID_LENGTH, &len);
 		if (!err)
-			status = native_read_msr_safe(MSR_AMD64_OSVW_STATUS,
-						      &err);
+			err = native_read_msr_safe(MSR_AMD64_OSVW_STATUS, &status);
 
 		if (err)
 			osvw_status = osvw_len = 0;
@@ -2145,14 +2142,13 @@ static int ac_interception(struct kvm_vcpu *vcpu)
 
 static bool is_erratum_383(void)
 {
-	int err, i;
+	int i;
 	u64 value;
 
 	if (!erratum_383_found)
 		return false;
 
-	value = native_read_msr_safe(MSR_IA32_MC0_STATUS, &err);
-	if (err)
+	if (native_read_msr_safe(MSR_IA32_MC0_STATUS, &value))
 		return false;
 
 	/* Bit 62 may or may not be set for this mce */
@@ -2165,8 +2161,7 @@ static bool is_erratum_383(void)
 	for (i = 0; i < 6; ++i)
 		native_write_msr_safe(MSR_IA32_MCx_STATUS(i), 0);
 
-	value = native_read_msr_safe(MSR_IA32_MCG_STATUS, &err);
-	if (!err) {
+	if (!native_read_msr_safe(MSR_IA32_MCG_STATUS, &value)) {
 		value &= ~(1ULL << 2);
 		native_write_msr_safe(MSR_IA32_MCG_STATUS, value);
 	}
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index c067d1e8a39c..0b2f5e679026 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1086,7 +1086,7 @@ static void xen_write_cr4(unsigned long cr4)
 	native_write_cr4(cr4);
 }
 
-static u64 xen_do_read_msr(unsigned int msr, int *err)
+static u64 xen_do_read_msr(u32 msr, int *err)
 {
 	u64 val = 0;	/* Avoid uninitialized value for safe variant. */
 
@@ -1094,7 +1094,7 @@ static u64 xen_do_read_msr(unsigned int msr, int *err)
 		return val;
 
 	if (err)
-		val = native_read_msr_safe(msr, err);
+		*err = native_read_msr_safe(msr, &val);
 	else
 		val = native_read_msr(msr);
 
@@ -1159,9 +1159,12 @@ static void xen_do_write_msr(u32 msr, u64 val, int *err)
 	}
 }
 
-static u64 xen_read_msr_safe(unsigned int msr, int *err)
+static int xen_read_msr_safe(u32 msr, u64 *val)
 {
-	return xen_do_read_msr(msr, err);
+	int err;
+
+	*val = xen_do_read_msr(msr, &err);
+	return err;
 }
 
 static int xen_write_msr_safe(u32 msr, u64 val)
@@ -1173,7 +1176,7 @@ static int xen_write_msr_safe(u32 msr, u64 val)
 	return err;
 }
 
-static u64 xen_read_msr(unsigned int msr)
+static u64 xen_read_msr(u32 msr)
 {
 	int err;
 
diff --git a/arch/x86/xen/pmu.c b/arch/x86/xen/pmu.c
index 5f3d2a6c70f1..d308147cd368 100644
--- a/arch/x86/xen/pmu.c
+++ b/arch/x86/xen/pmu.c
@@ -318,11 +318,12 @@ static u64 xen_amd_read_pmc(int counter)
 	uint8_t xenpmu_flags = get_xenpmu_flags();
 
 	if (!xenpmu_data || !(xenpmu_flags & XENPMU_IRQ_PROCESSING)) {
-		uint32_t msr;
-		int err;
+		u32 msr;
+		u64 val;
 
 		msr = amd_counters_base + (counter * amd_msr_step);
-		return native_read_msr_safe(msr, &err);
+		native_read_msr_safe(msr, &val);
+		return val;
 	}
 
 	ctxt = &xenpmu_data->pmu.c.amd;
@@ -339,15 +340,16 @@ static u64 xen_intel_read_pmc(int counter)
 	uint8_t xenpmu_flags = get_xenpmu_flags();
 
 	if (!xenpmu_data || !(xenpmu_flags & XENPMU_IRQ_PROCESSING)) {
-		uint32_t msr;
-		int err;
+		u32 msr;
+		u64 val;
 
 		if (counter & (1 << INTEL_PMC_TYPE_SHIFT))
 			msr = MSR_CORE_PERF_FIXED_CTR0 + (counter & 0xffff);
 		else
 			msr = MSR_IA32_PERFCTR0 + counter;
 
-		return native_read_msr_safe(msr, &err);
+		native_read_msr_safe(msr, &val);
+		return val;
 	}
 
 	ctxt = &xenpmu_data->pmu.c.intel;
-- 
2.49.0


