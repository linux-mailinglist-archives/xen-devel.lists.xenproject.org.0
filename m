Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E30EBA96108
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 10:23:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961783.1353151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u78ub-0005tq-IT; Tue, 22 Apr 2025 08:23:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961783.1353151; Tue, 22 Apr 2025 08:23:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u78ub-0005ku-9L; Tue, 22 Apr 2025 08:23:25 +0000
Received: by outflank-mailman (input) for mailman id 961783;
 Tue, 22 Apr 2025 08:23:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qhpm=XI=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1u78uZ-0004wX-G5
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 08:23:23 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b2a1400-1f53-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 10:23:19 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53M8MG9S1954391
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 22 Apr 2025 01:22:49 -0700
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
X-Inumbo-ID: 0b2a1400-1f53-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53M8MG9S1954391
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745310171;
	bh=tgzUrlRfHVNmuhey2aHHRIY5ipoKFEwgpjfhEzZ9bZY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cSUq20FJ1es+IIhRb98fV1d5F5NvXSUm1EMpz1+tO0YnVvnuTJaFjsStronse55k5
	 YxZtOYxcfkDzQLV4kClq6Bh9fQSG39eicOmoWqumnSOinsUbwn6q998dOSYad0zsE1
	 XTVUr6fpYzuVa8qpsuccsUw3Ow+s/jyBTD5r2pg0D9UWVh301tVKqpsTK+wFXOiuaD
	 N0eQT6AhQXD63t318ErncqLrfB5Jcz79t3Isvxia9piGM6jDV7ZfMM3vN8awrIAAmE
	 baBmekkbHBPV6QEgBNF1TdwtwUqOlgXwgXJkAJ4oGprjAmWEMzvfq69Je187jfLeDB
	 aWRCULSzY6RQw==
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
Subject: [RFC PATCH v2 14/34] x86/msr: refactor pv_cpu_ops.write_msr{_safe}()
Date: Tue, 22 Apr 2025 01:21:55 -0700
Message-ID: <20250422082216.1954310-15-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422082216.1954310-1-xin@zytor.com>
References: <20250422082216.1954310-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An MSR value is represented as a 64-bit unsigned integer, with existing
MSR instructions storing it in EDX:EAX as two 32-bit segments.

The new immediate form MSR instructions, however, utilize a 64-bit
general-purpose register to store the MSR value.  To unify the usage of
all MSR instructions, let the default MSR access APIs accept an MSR
value as a single 64-bit argument instead of two 32-bit segments.

The dual 32-bit APIs are still available as convenient wrappers over the
APIs that handle an MSR value as a single 64-bit argument.

The following illustrates the updated derivation of the MSR write APIs:

                 __wrmsrq(u32 msr, u64 val)
                   /                  \
                  /                    \
           native_wrmsrq(msr, val)    native_wrmsr(msr, low, high)
                 |
                 |
           native_write_msr(msr, val)
                /          \
               /            \
       wrmsrq(msr, val)    wrmsr(msr, low, high)

When CONFIG_PARAVIRT is enabled, wrmsrq() and wrmsr() are defined on top
of paravirt_write_msr():

            paravirt_write_msr(u32 msr, u64 val)
               /             \
              /               \
          wrmsrq(msr, val)    wrmsr(msr, low, high)

paravirt_write_msr() invokes cpu.write_msr(msr, val), an indirect layer
of pv_ops MSR write call:

    If on native:

            cpu.write_msr = native_write_msr

    If on Xen:

            cpu.write_msr = xen_write_msr

Therefore, refactor pv_cpu_ops.write_msr{_safe}() to accept an MSR value
in a single u64 argument, replacing the current dual u32 arguments.

No functional change intended.

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---

Change in v2:
* Spell out the reason why use a single u64 argument to pass the MSR
  value in the lowest level APIs (Andrew Cooper).
---
 arch/x86/include/asm/msr.h            | 35 ++++++++++++---------------
 arch/x86/include/asm/paravirt.h       | 27 +++++++++++----------
 arch/x86/include/asm/paravirt_types.h |  4 +--
 arch/x86/kernel/kvmclock.c            |  2 +-
 arch/x86/kvm/svm/svm.c                | 15 +++---------
 arch/x86/xen/enlighten_pv.c           | 29 +++++++++-------------
 6 files changed, 46 insertions(+), 66 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 2ab8effea4cd..dd1114053173 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -97,12 +97,12 @@ static __always_inline u64 __rdmsr(u32 msr)
 	return EAX_EDX_VAL(val, low, high);
 }
 
-static __always_inline void __wrmsr(u32 msr, u32 low, u32 high)
+static __always_inline void __wrmsrq(u32 msr, u64 val)
 {
 	asm volatile("1: wrmsr\n"
 		     "2:\n"
 		     _ASM_EXTABLE_TYPE(1b, 2b, EX_TYPE_WRMSR)
-		     : : "c" (msr), "a"(low), "d" (high) : "memory");
+		     : : "c" (msr), "a" ((u32)val), "d" ((u32)(val >> 32)) : "memory");
 }
 
 #define native_rdmsr(msr, val1, val2)			\
@@ -118,11 +118,10 @@ static __always_inline u64 native_rdmsrq(u32 msr)
 }
 
 #define native_wrmsr(msr, low, high)			\
-	__wrmsr(msr, low, high)
+	__wrmsrq((msr), (u64)(high) << 32 | (low))
 
 #define native_wrmsrq(msr, val)				\
-	__wrmsr((msr), (u32)((u64)(val)),		\
-		       (u32)((u64)(val) >> 32))
+	__wrmsrq((msr), (val))
 
 static inline u64 native_read_msr(u32 msr)
 {
@@ -151,11 +150,8 @@ static inline u64 native_read_msr_safe(u32 msr, int *err)
 }
 
 /* Can be uninlined because referenced by paravirt */
-static inline void notrace
-native_write_msr(u32 msr, u32 low, u32 high)
+static inline void notrace native_write_msr(u32 msr, u64 val)
 {
-	u64 val = (u64)high << 32 | low;
-
 	native_wrmsrq(msr, val);
 
 	if (tracepoint_enabled(write_msr))
@@ -163,8 +159,7 @@ native_write_msr(u32 msr, u32 low, u32 high)
 }
 
 /* Can be uninlined because referenced by paravirt */
-static inline int notrace
-native_write_msr_safe(u32 msr, u32 low, u32 high)
+static inline int notrace native_write_msr_safe(u32 msr, u64 val)
 {
 	int err;
 
@@ -172,10 +167,10 @@ native_write_msr_safe(u32 msr, u32 low, u32 high)
 		     "2:\n\t"
 		     _ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_WRMSR_SAFE, %[err])
 		     : [err] "=a" (err)
-		     : "c" (msr), "0" (low), "d" (high)
+		     : "c" (msr), "0" ((u32)val), "d" ((u32)(val >> 32))
 		     : "memory");
 	if (tracepoint_enabled(write_msr))
-		do_trace_write_msr(msr, ((u64)high << 32 | low), err);
+		do_trace_write_msr(msr, val, err);
 	return err;
 }
 
@@ -227,7 +222,7 @@ do {								\
 
 static inline void wrmsr(u32 msr, u32 low, u32 high)
 {
-	native_write_msr(msr, low, high);
+	native_write_msr(msr, (u64)high << 32 | low);
 }
 
 #define rdmsrq(msr, val)			\
@@ -235,13 +230,13 @@ static inline void wrmsr(u32 msr, u32 low, u32 high)
 
 static inline void wrmsrq(u32 msr, u64 val)
 {
-	native_write_msr(msr, (u32)(val & 0xffffffffULL), (u32)(val >> 32));
+	native_write_msr(msr, val);
 }
 
 /* wrmsr with exception handling */
-static inline int wrmsr_safe(u32 msr, u32 low, u32 high)
+static inline int wrmsrq_safe(u32 msr, u64 val)
 {
-	return native_write_msr_safe(msr, low, high);
+	return native_write_msr_safe(msr, val);
 }
 
 /* rdmsr with exception handling */
@@ -279,11 +274,11 @@ static __always_inline void wrmsrns(u32 msr, u64 val)
 }
 
 /*
- * 64-bit version of wrmsr_safe():
+ * Dual u32 version of wrmsrq_safe():
  */
-static inline int wrmsrq_safe(u32 msr, u64 val)
+static inline int wrmsr_safe(u32 msr, u32 low, u32 high)
 {
-	return wrmsr_safe(msr, (u32)val,  (u32)(val >> 32));
+	return wrmsrq_safe(msr, (u64)high << 32 | low);
 }
 
 struct msr __percpu *msrs_alloc(void);
diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index c7689f5f70d6..1bd1dad8da5a 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -180,10 +180,9 @@ static inline u64 paravirt_read_msr(unsigned msr)
 	return PVOP_CALL1(u64, cpu.read_msr, msr);
 }
 
-static inline void paravirt_write_msr(unsigned msr,
-				      unsigned low, unsigned high)
+static inline void paravirt_write_msr(u32 msr, u64 val)
 {
-	PVOP_VCALL3(cpu.write_msr, msr, low, high);
+	PVOP_VCALL2(cpu.write_msr, msr, val);
 }
 
 static inline u64 paravirt_read_msr_safe(unsigned msr, int *err)
@@ -191,10 +190,9 @@ static inline u64 paravirt_read_msr_safe(unsigned msr, int *err)
 	return PVOP_CALL2(u64, cpu.read_msr_safe, msr, err);
 }
 
-static inline int paravirt_write_msr_safe(unsigned msr,
-					  unsigned low, unsigned high)
+static inline int paravirt_write_msr_safe(u32 msr, u64 val)
 {
-	return PVOP_CALL3(int, cpu.write_msr_safe, msr, low, high);
+	return PVOP_CALL2(int, cpu.write_msr_safe, msr, val);
 }
 
 #define rdmsr(msr, val1, val2)			\
@@ -204,22 +202,25 @@ do {						\
 	val2 = _l >> 32;			\
 } while (0)
 
-#define wrmsr(msr, val1, val2)			\
-do {						\
-	paravirt_write_msr(msr, val1, val2);	\
-} while (0)
+static __always_inline void wrmsr(u32 msr, u32 low, u32 high)
+{
+	paravirt_write_msr(msr, (u64)high << 32 | low);
+}
 
 #define rdmsrq(msr, val)			\
 do {						\
 	val = paravirt_read_msr(msr);		\
 } while (0)
 
-static inline void wrmsrq(unsigned msr, u64 val)
+static inline void wrmsrq(u32 msr, u64 val)
 {
-	wrmsr(msr, (u32)val, (u32)(val>>32));
+	paravirt_write_msr(msr, val);
 }
 
-#define wrmsr_safe(msr, a, b)	paravirt_write_msr_safe(msr, a, b)
+static inline int wrmsrq_safe(u32 msr, u64 val)
+{
+	return paravirt_write_msr_safe(msr, val)
+}
 
 /* rdmsr with exception handling */
 #define rdmsr_safe(msr, a, b)				\
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 475f508531d6..91b3423d36ce 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -92,14 +92,14 @@ struct pv_cpu_ops {
 
 	/* Unsafe MSR operations.  These will warn or panic on failure. */
 	u64 (*read_msr)(unsigned int msr);
-	void (*write_msr)(unsigned int msr, unsigned low, unsigned high);
+	void (*write_msr)(u32 msr, u64 val);
 
 	/*
 	 * Safe MSR operations.
 	 * read sets err to 0 or -EIO.  write returns 0 or -EIO.
 	 */
 	u64 (*read_msr_safe)(unsigned int msr, int *err);
-	int (*write_msr_safe)(unsigned int msr, unsigned low, unsigned high);
+	int (*write_msr_safe)(u32 msr, u64 val);
 
 	void (*start_context_switch)(struct task_struct *prev);
 	void (*end_context_switch)(struct task_struct *next);
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 0af797930ccb..ca0a49eeac4a 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -196,7 +196,7 @@ static void kvm_setup_secondary_clock(void)
 void kvmclock_disable(void)
 {
 	if (msr_kvm_system_time)
-		native_write_msr(msr_kvm_system_time, 0, 0);
+		native_write_msr(msr_kvm_system_time, 0);
 }
 
 static void __init kvmclock_init_mem(void)
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 67657b3a36ce..4ef9978dce70 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -475,7 +475,6 @@ static void svm_inject_exception(struct kvm_vcpu *vcpu)
 
 static void svm_init_erratum_383(void)
 {
-	u32 low, high;
 	int err;
 	u64 val;
 
@@ -489,10 +488,7 @@ static void svm_init_erratum_383(void)
 
 	val |= (1ULL << 47);
 
-	low  = lower_32_bits(val);
-	high = upper_32_bits(val);
-
-	native_write_msr_safe(MSR_AMD64_DC_CFG, low, high);
+	native_write_msr_safe(MSR_AMD64_DC_CFG, val);
 
 	erratum_383_found = true;
 }
@@ -2167,17 +2163,12 @@ static bool is_erratum_383(void)
 
 	/* Clear MCi_STATUS registers */
 	for (i = 0; i < 6; ++i)
-		native_write_msr_safe(MSR_IA32_MCx_STATUS(i), 0, 0);
+		native_write_msr_safe(MSR_IA32_MCx_STATUS(i), 0);
 
 	value = native_read_msr_safe(MSR_IA32_MCG_STATUS, &err);
 	if (!err) {
-		u32 low, high;
-
 		value &= ~(1ULL << 2);
-		low    = lower_32_bits(value);
-		high   = upper_32_bits(value);
-
-		native_write_msr_safe(MSR_IA32_MCG_STATUS, low, high);
+		native_write_msr_safe(MSR_IA32_MCG_STATUS, value);
 	}
 
 	/* Flush tlb to evict multi-match entries */
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 9a89cb29fa35..052f68c92111 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1111,10 +1111,8 @@ static u64 xen_do_read_msr(unsigned int msr, int *err)
 	return val;
 }
 
-static void set_seg(u32 which, u32 low, u32 high)
+static void set_seg(u32 which, u64 base)
 {
-	u64 base = ((u64)high << 32) | low;
-
 	if (HYPERVISOR_set_segment_base(which, base))
 		WARN(1, "Xen set_segment_base(%u, %llx) failed\n", which, base);
 }
@@ -1124,23 +1122,21 @@ static void set_seg(u32 which, u32 low, u32 high)
  * With err == NULL write_msr() semantics are selected.
  * Supplying an err pointer requires err to be pre-initialized with 0.
  */
-static void xen_do_write_msr(unsigned int msr, unsigned int low,
-			     unsigned int high, int *err)
+static void xen_do_write_msr(u32 msr, u64 val, int *err)
 {
-	u64 val;
 	bool emulated;
 
 	switch (msr) {
 	case MSR_FS_BASE:
-		set_seg(SEGBASE_FS, low, high);
+		set_seg(SEGBASE_FS, val);
 		break;
 
 	case MSR_KERNEL_GS_BASE:
-		set_seg(SEGBASE_GS_USER, low, high);
+		set_seg(SEGBASE_GS_USER, val);
 		break;
 
 	case MSR_GS_BASE:
-		set_seg(SEGBASE_GS_KERNEL, low, high);
+		set_seg(SEGBASE_GS_KERNEL, val);
 		break;
 
 	case MSR_STAR:
@@ -1156,15 +1152,13 @@ static void xen_do_write_msr(unsigned int msr, unsigned int low,
 		break;
 
 	default:
-		val = (u64)high << 32 | low;
-
 		if (pmu_msr_chk_emulated(msr, &val, false, &emulated) && emulated)
 			return;
 
 		if (err)
-			*err = native_write_msr_safe(msr, low, high);
+			*err = native_write_msr_safe(msr, val);
 		else
-			native_write_msr(msr, low, high);
+			native_write_msr(msr, val);
 	}
 }
 
@@ -1173,12 +1167,11 @@ static u64 xen_read_msr_safe(unsigned int msr, int *err)
 	return xen_do_read_msr(msr, err);
 }
 
-static int xen_write_msr_safe(unsigned int msr, unsigned int low,
-			      unsigned int high)
+static int xen_write_msr_safe(u32 msr, u64 val)
 {
 	int err = 0;
 
-	xen_do_write_msr(msr, low, high, &err);
+	xen_do_write_msr(msr, val, &err);
 
 	return err;
 }
@@ -1190,11 +1183,11 @@ static u64 xen_read_msr(unsigned int msr)
 	return xen_do_read_msr(msr, xen_msr_safe ? &err : NULL);
 }
 
-static void xen_write_msr(unsigned int msr, unsigned low, unsigned high)
+static void xen_write_msr(u32 msr, u64 val)
 {
 	int err;
 
-	xen_do_write_msr(msr, low, high, xen_msr_safe ? &err : NULL);
+	xen_do_write_msr(msr, val, xen_msr_safe ? &err : NULL);
 }
 
 /* This is called once we have the cpu_possible_mask */
-- 
2.49.0


