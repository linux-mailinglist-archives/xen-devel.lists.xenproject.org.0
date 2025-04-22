Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E11DAA96102
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 10:23:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961790.1353213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u78uh-0007O1-Bb; Tue, 22 Apr 2025 08:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961790.1353213; Tue, 22 Apr 2025 08:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u78ug-0007Ed-Nv; Tue, 22 Apr 2025 08:23:30 +0000
Received: by outflank-mailman (input) for mailman id 961790;
 Tue, 22 Apr 2025 08:23:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qhpm=XI=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1u78ud-0004wM-5p
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 08:23:27 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d318768-1f53-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 10:23:22 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53M8MG9U1954391
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 22 Apr 2025 01:22:53 -0700
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
X-Inumbo-ID: 0d318768-1f53-11f0-9eb0-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53M8MG9U1954391
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745310174;
	bh=tKwShxS8SnH3+r0XrY4puuThpPUtqn9sxGzBAvLv2qE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XB6Bl9mXdDXZ6uItIj7HmLj7+SgdGBr4//8M02L9kJyhIy3nGwHmq06Q+9ILpfIlb
	 DSW1MBRBqfeODTFbogdeHWzIgmLXyURs0ZW2ugh2lPSGw0OKHOrvNKtbLD+nZ4lrTa
	 qIuGgzEaupHFGvAC+Tbg8gTVGMhiiY1uK2ST8DoPpunwIb7quo5Cjs7FvMp7lz3q7O
	 pE6XjV47oI+sHnWs9sPDeMj+IBucjeTvRUtGK5ilXHJsQnNbtPFggDyMZFoo2A4oNo
	 14+LS6Gf83CPkNWu/aX+A7mTB9LH5hngobXqbCOjg1NK53i/1WPuQwdrG5HQPub9ZJ
	 /825s1gxrDgXw==
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
        haiyangz@microsoft.com, decui@microsoft.com
Subject: [RFC PATCH v2 16/34] x86/msr: Change function type of native_read_msr_safe()
Date: Tue, 22 Apr 2025 01:21:57 -0700
Message-ID: <20250422082216.1954310-17-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422082216.1954310-1-xin@zytor.com>
References: <20250422082216.1954310-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change function type of native_read_msr_safe() to

    int native_read_msr_safe(u32 msr, u64 *val)

to make it the same as the type of native_write_msr_safe().

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---
 arch/x86/include/asm/msr.h            | 21 +++++++++++----------
 arch/x86/include/asm/paravirt_types.h |  4 ++--
 arch/x86/kvm/svm/svm.c                | 19 +++++++------------
 arch/x86/xen/enlighten_pv.c           |  9 ++++++---
 arch/x86/xen/pmu.c                    | 14 ++++++++------
 5 files changed, 34 insertions(+), 33 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index dd1114053173..c955339be9c9 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -135,18 +135,22 @@ static inline u64 native_read_msr(u32 msr)
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
@@ -242,8 +246,8 @@ static inline int wrmsrq_safe(u32 msr, u64 val)
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
@@ -251,10 +255,7 @@ static inline int wrmsrq_safe(u32 msr, u64 val)
 
 static inline int rdmsrq_safe(u32 msr, u64 *p)
 {
-	int err;
-
-	*p = native_read_msr_safe(msr, &err);
-	return err;
+	return native_read_msr_safe(msr, p);
 }
 #endif	/* !CONFIG_PARAVIRT_XXL */
 
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 91b3423d36ce..d2db38c32bc5 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -96,9 +96,9 @@ struct pv_cpu_ops {
 
 	/*
 	 * Safe MSR operations.
-	 * read sets err to 0 or -EIO.  write returns 0 or -EIO.
+	 * Returns 0 or -EIO.
 	 */
-	u64 (*read_msr_safe)(unsigned int msr, int *err);
+	int (*read_msr_safe)(unsigned int msr, u64 *val);
 	int (*write_msr_safe)(u32 msr, u64 val);
 
 	void (*start_context_switch)(struct task_struct *prev);
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
index 052f68c92111..195e6501a000 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1095,7 +1095,7 @@ static u64 xen_do_read_msr(unsigned int msr, int *err)
 		return val;
 
 	if (err)
-		val = native_read_msr_safe(msr, err);
+		*err = native_read_msr_safe(msr, &val);
 	else
 		val = native_read_msr(msr);
 
@@ -1162,9 +1162,12 @@ static void xen_do_write_msr(u32 msr, u64 val, int *err)
 	}
 }
 
-static u64 xen_read_msr_safe(unsigned int msr, int *err)
+static int xen_read_msr_safe(unsigned int msr, u64 *val)
 {
-	return xen_do_read_msr(msr, err);
+	int err;
+
+	*val = xen_do_read_msr(msr, &err);
+	return err;
 }
 
 static int xen_write_msr_safe(u32 msr, u64 val)
diff --git a/arch/x86/xen/pmu.c b/arch/x86/xen/pmu.c
index afb02f43ee3f..ee908dfcff48 100644
--- a/arch/x86/xen/pmu.c
+++ b/arch/x86/xen/pmu.c
@@ -319,11 +319,12 @@ static u64 xen_amd_read_pmc(int counter)
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
@@ -340,15 +341,16 @@ static u64 xen_intel_read_pmc(int counter)
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


