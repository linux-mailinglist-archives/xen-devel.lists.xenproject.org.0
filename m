Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60712A7617F
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 10:24:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932001.1334247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzARH-0003RA-A1; Mon, 31 Mar 2025 08:24:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932001.1334247; Mon, 31 Mar 2025 08:24:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzARG-0003Ga-Po; Mon, 31 Mar 2025 08:24:10 +0000
Received: by outflank-mailman (input) for mailman id 932001;
 Mon, 31 Mar 2025 08:24:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=orDG=WS=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1tzARE-0001u1-0k
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 08:24:08 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 800de34a-0e09-11f0-9ea7-5ba50f476ded;
 Mon, 31 Mar 2025 10:24:02 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52V8Mp043171319
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 31 Mar 2025 01:23:06 -0700
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
X-Inumbo-ID: 800de34a-0e09-11f0-9ea7-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52V8Mp043171319
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1743409388;
	bh=R5lkZK1BttlgoDRIcsGie/EvPC/1EsVxCj2GWRAyo+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cjtZINutBa+FD44rvEKBI/bQn/6JnE37jJg8UfQt76je9oer8CW+KU4+GASTM697n
	 43XgUKC7AUoEwu3/CB/moVDg2HKzbhmtehqO4aY0qEvC/qHCgIZb3cKa7RdsVrgwnl
	 AUil1g8TJnz5dWM5rTRr4QNzdiKcsuNrqQZvGQjKzzHfZaQiw5xA2m5iYN6sK7sImI
	 oREOYUP88D8O6Cp/ISnEuVJDEMudARxBOJb7gcgFfJ1/rgsxpmKmOjcw84nWzZkB3C
	 VsITyaqW7KXt9Q1SvVjBLyJNoLTgoCY1Ptdb7Cq8X9iccW9VZz7LSfWoqKxg9r1F67
	 TUz6F6A4Ni/IA==
From: "Xin Li (Intel)" <xin@zytor.com>
To: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
        linux-edac@vger.kernel.org, kvm@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-ide@vger.kernel.org,
        linux-pm@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        jgross@suse.com, andrew.cooper3@citrix.com, peterz@infradead.org,
        acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
        alexander.shishkin@linux.intel.com, jolsa@kernel.org,
        irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com,
        wei.liu@kernel.org, ajay.kaher@broadcom.com,
        alexey.amakhalov@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        tony.luck@intel.com, pbonzini@redhat.com, vkuznets@redhat.com,
        seanjc@google.com, luto@kernel.org, boris.ostrovsky@oracle.com,
        kys@microsoft.com, haiyangz@microsoft.com, decui@microsoft.com
Subject: [RFC PATCH v1 04/15] x86/msr: Let pv_cpu_ops.write_msr{_safe}() take an u64 instead of two u32
Date: Mon, 31 Mar 2025 01:22:40 -0700
Message-ID: <20250331082251.3171276-5-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331082251.3171276-1-xin@zytor.com>
References: <20250331082251.3171276-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor pv_cpu_ops.write_msr{_safe}() to take the input MSR value
in a single u64 argument, replacing the current dual u32 arguments.

No functional change intended.

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---
 arch/x86/include/asm/msr.h            | 33 ++++++++++++---------------
 arch/x86/include/asm/paravirt.h       | 10 ++++----
 arch/x86/include/asm/paravirt_types.h |  4 ++--
 arch/x86/kernel/kvmclock.c            |  2 +-
 arch/x86/kvm/svm/svm.c                | 15 +++---------
 arch/x86/xen/enlighten_pv.c           | 13 +++++------
 6 files changed, 30 insertions(+), 47 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index fb3d7c4cb774..121597fc5d41 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -91,12 +91,12 @@ static __always_inline unsigned long long __rdmsr(unsigned int msr)
 	return EAX_EDX_VAL(val, low, high);
 }
 
-static __always_inline void __wrmsr(unsigned int msr, u32 low, u32 high)
+static __always_inline void __wrmsr(u32 msr, u64 val)
 {
 	asm volatile("1: wrmsr\n"
 		     "2:\n"
 		     _ASM_EXTABLE_TYPE(1b, 2b, EX_TYPE_WRMSR)
-		     : : "c" (msr), "a"(low), "d" (high) : "memory");
+		     : : "c" (msr), "a"((u32)val), "d" ((u32)(val >> 32)) : "memory");
 }
 
 #define native_rdmsr(msr, val1, val2)			\
@@ -112,11 +112,10 @@ static __always_inline u64 native_rdmsrl(const u32 msr)
 }
 
 #define native_wrmsr(msr, low, high)			\
-	__wrmsr(msr, low, high)
+	__wrmsr((msr), ((u64)(high) << 32) | (low))
 
 #define native_wrmsrl(msr, val)				\
-	__wrmsr((msr), (u32)((u64)(val)),		\
-		       (u32)((u64)(val) >> 32))
+	__wrmsr((msr), (val))
 
 static inline unsigned long long native_read_msr(unsigned int msr)
 {
@@ -146,11 +145,8 @@ static inline unsigned long long native_read_msr_safe(unsigned int msr,
 }
 
 /* Can be uninlined because referenced by paravirt */
-static inline void notrace
-native_write_msr(unsigned int msr, u32 low, u32 high)
+static inline void notrace native_write_msr(u32 msr, u64 val)
 {
-	u64 val = (u64)high << 32 | low;
-
 	native_wrmsrl(msr, val);
 
 	if (tracepoint_enabled(write_msr))
@@ -158,8 +154,7 @@ native_write_msr(unsigned int msr, u32 low, u32 high)
 }
 
 /* Can be uninlined because referenced by paravirt */
-static inline int notrace
-native_write_msr_safe(unsigned int msr, u32 low, u32 high)
+static inline int notrace native_write_msr_safe(u32 msr, u64 val)
 {
 	int err;
 
@@ -167,10 +162,10 @@ native_write_msr_safe(unsigned int msr, u32 low, u32 high)
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
 
@@ -258,23 +253,23 @@ do {								\
 	(void)((high) = (u32)(__val >> 32));			\
 } while (0)
 
-static inline void wrmsr(unsigned int msr, u32 low, u32 high)
+static inline void wrmsr(u32 msr, u32 low, u32 high)
 {
-	native_write_msr(msr, low, high);
+	native_write_msr(msr, (u64)high << 32 | low);
 }
 
 #define rdmsrl(msr, val)			\
 	((val) = native_read_msr((msr)))
 
-static inline void wrmsrl(unsigned int msr, u64 val)
+static inline void wrmsrl(u32 msr, u64 val)
 {
-	native_write_msr(msr, (u32)(val & 0xffffffffULL), (u32)(val >> 32));
+	native_write_msr(msr, val);
 }
 
 /* wrmsr with exception handling */
-static inline int wrmsr_safe(unsigned int msr, u32 low, u32 high)
+static inline int wrmsr_safe(u32 msr, u32 low, u32 high)
 {
-	return native_write_msr_safe(msr, low, high);
+	return native_write_msr_safe(msr, (u64)high << 32 | low);
 }
 
 /* rdmsr with exception handling */
diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index c4c23190925c..f3d6e8394d38 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -180,10 +180,9 @@ static inline u64 paravirt_read_msr(unsigned msr)
 	return PVOP_CALL1(u64, cpu.read_msr, msr);
 }
 
-static inline void paravirt_write_msr(unsigned msr,
-				      unsigned low, unsigned high)
+static inline void paravirt_write_msr(u32 msr, u32 low, u32 high)
 {
-	PVOP_VCALL3(cpu.write_msr, msr, low, high);
+	PVOP_VCALL2(cpu.write_msr, msr, (u64)high << 32 | low);
 }
 
 static inline u64 paravirt_read_msr_safe(unsigned msr, int *err)
@@ -191,10 +190,9 @@ static inline u64 paravirt_read_msr_safe(unsigned msr, int *err)
 	return PVOP_CALL2(u64, cpu.read_msr_safe, msr, err);
 }
 
-static inline int paravirt_write_msr_safe(unsigned msr,
-					  unsigned low, unsigned high)
+static inline int paravirt_write_msr_safe(u32 msr, u32 low, u32 high)
 {
-	return PVOP_CALL3(int, cpu.write_msr_safe, msr, low, high);
+	return PVOP_CALL2(int, cpu.write_msr_safe, msr, (u64)high << 32 | low);
 }
 
 #define rdmsr(msr, val1, val2)			\
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 631c306ce1ff..78777b78da12 100644
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
 
 	u64 (*read_pmc)(int counter);
 
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 5b2c15214a6b..6b4102365ae5 100644
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
index d5d0c5c3300b..5cbc4ccb145c 100644
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
index 2bfe57469ac3..7401cce19939 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1165,9 +1165,9 @@ static void xen_do_write_msr(unsigned int msr, unsigned int low,
 
 		if (!pmu_msr_write(msr, val)) {
 			if (err)
-				*err = native_write_msr_safe(msr, low, high);
+				*err = native_write_msr_safe(msr, val);
 			else
-				native_write_msr(msr, low, high);
+				native_write_msr(msr, val);
 		}
 	}
 }
@@ -1177,12 +1177,11 @@ static u64 xen_read_msr_safe(unsigned int msr, int *err)
 	return xen_do_read_msr(msr, err);
 }
 
-static int xen_write_msr_safe(unsigned int msr, unsigned int low,
-			      unsigned int high)
+static int xen_write_msr_safe(u32 msr, u64 val)
 {
 	int err = 0;
 
-	xen_do_write_msr(msr, low, high, &err);
+	xen_do_write_msr(msr, val, (u32)(val >> 32), &err);
 
 	return err;
 }
@@ -1194,11 +1193,11 @@ static u64 xen_read_msr(unsigned int msr)
 	return xen_do_read_msr(msr, xen_msr_safe ? &err : NULL);
 }
 
-static void xen_write_msr(unsigned int msr, unsigned low, unsigned high)
+static void xen_write_msr(u32 msr, u64 val)
 {
 	int err;
 
-	xen_do_write_msr(msr, low, high, xen_msr_safe ? &err : NULL);
+	xen_do_write_msr(msr, val, (u32)(val >> 32), xen_msr_safe ? &err : NULL);
 }
 
 /* This is called once we have the cpu_possible_mask */
-- 
2.49.0


