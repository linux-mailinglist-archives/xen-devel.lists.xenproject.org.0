Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DDFA8303D
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 21:17:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944607.1343017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2avI-0006my-W6; Wed, 09 Apr 2025 19:17:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944607.1343017; Wed, 09 Apr 2025 19:17:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2avI-0006kX-Rv; Wed, 09 Apr 2025 19:17:20 +0000
Received: by outflank-mailman (input) for mailman id 944607;
 Wed, 09 Apr 2025 19:17:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0lDW=W3=kernel.org=mingo@srs-se1.protection.inumbo.net>)
 id 1u2avG-0006kR-RB
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 19:17:18 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f4da463-1577-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 21:17:16 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0D6E46843B;
 Wed,  9 Apr 2025 19:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE2B7C4CEE2;
 Wed,  9 Apr 2025 19:17:05 +0000 (UTC)
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
X-Inumbo-ID: 3f4da463-1577-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744226234;
	bh=bF03VxvTsU+BqmHsQq0q+S9ppRrCc1/KlnD8PJitqk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qJI2/XoironzsJaz+i80e/WQ5Qp9VcugyrJtl/YBj3oj0+B7CR2sHsGtWpizK6yO4
	 VBHn2aUCKN25vPTBjtUJ5ErBpW2uZ0Nr7njrQYPiJXVIm5JOFP/Aa8E5gmKRCoJxm0
	 2vFvQqbHpIzkDxqkRul6nNrkQNGD3XqtCFeaHlXiWlZ71xy8f9NAVNkpTbM33mpsn2
	 gk6Zv+IScY5WaKqKDsrRvA4EyHwyJNofhELmFBXXaSUa90cRftnriGKZcCivNb5MT/
	 7CNvC3GIEekiFTO9pLOuthuuJFylF+HSeUIxKp18BpylKcbyjrBpuCpkk/cUVDn0Ei
	 6TKBITTbXPjew==
Date: Wed, 9 Apr 2025 21:17:02 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Xin Li <xin@zytor.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-hyperv@vger.kernel.org,
	virtualization@lists.linux.dev, linux-edac@vger.kernel.org,
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-ide@vger.kernel.org, linux-pm@vger.kernel.org,
	bpf@vger.kernel.org, llvm@lists.linux.dev, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, jgross@suse.com, andrew.cooper3@citrix.com,
	peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, wei.liu@kernel.org,
	ajay.kaher@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	tony.luck@intel.com, pbonzini@redhat.com, vkuznets@redhat.com,
	seanjc@google.com, luto@kernel.org, boris.ostrovsky@oracle.com,
	kys@microsoft.com, haiyangz@microsoft.com, decui@microsoft.com,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH] x86/msr: Standardize on 'u32' MSR indices in <asm/msr.h>
Message-ID: <Z_bHrjUKKWN28TX9@gmail.com>
References: <20250331082251.3171276-1-xin@zytor.com>
 <20250331082251.3171276-2-xin@zytor.com>
 <Z-pruogreCuU66wm@gmail.com>
 <9D15DE81-2E68-4FCD-A133-4963602E18C9@zytor.com>
 <Z-ubVFyoOzwKhI53@gmail.com>
 <c316a6c6-b97c-48b2-9598-d44e2ec72fbc@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c316a6c6-b97c-48b2-9598-d44e2ec72fbc@zytor.com>


* Xin Li <xin@zytor.com> wrote:

> On 4/1/2025 12:52 AM, Ingo Molnar wrote:
> > > Should we rename the *msrl() functions to *msrq() as part of this
> > > overhaul?
> > Yeah, that's a good idea, and because talk is cheap I just implemented
> > this in the tip:WIP.x86/msr branch with a couple of other cleanups in
> > this area (see the shortlog & diffstat below), but the churn is high:
> > 
> >    144 files changed, 1034 insertions(+), 1034 deletions(-)
> 
> Hi Ingo,
> 
> I noticed that you keep the type of MSR index in these patches as
> "unsigned int".
> 
> I'm thinking would it be better to standardize it as "u32"?
> 
> Because:
> 1) MSR index is placed in ECX to execute MSR instructions, and the
>    high-order 32 bits of RCX are ignored on 64-bit.
> 2) MSR index is encoded as a 32-bit immediate in the new immediate form
>    MSR instructions.

Makes sense - something like the attached patch?

Thanks,

	Ingo

=====================>
From: Ingo Molnar <mingo@kernel.org>
Date: Wed, 9 Apr 2025 21:12:39 +0200
Subject: [PATCH] x86/msr: Standardize on 'u32' MSR indices in <asm/msr.h>

This is the customary type used for hardware ABIs.

Suggested-by: Xin Li <xin@zytor.com>
Suggested-by: "H. Peter Anvin" <hpa@zytor.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/include/asm/msr.h | 29 ++++++++++++++---------------
 arch/x86/lib/msr.c         |  4 ++--
 2 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 4ee9ae734c08..20deb58308e5 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -63,12 +63,12 @@ struct saved_msrs {
 DECLARE_TRACEPOINT(read_msr);
 DECLARE_TRACEPOINT(write_msr);
 DECLARE_TRACEPOINT(rdpmc);
-extern void do_trace_write_msr(unsigned int msr, u64 val, int failed);
-extern void do_trace_read_msr(unsigned int msr, u64 val, int failed);
+extern void do_trace_write_msr(u32 msr, u64 val, int failed);
+extern void do_trace_read_msr(u32 msr, u64 val, int failed);
 extern void do_trace_rdpmc(u32 msr, u64 val, int failed);
 #else
-static inline void do_trace_write_msr(unsigned int msr, u64 val, int failed) {}
-static inline void do_trace_read_msr(unsigned int msr, u64 val, int failed) {}
+static inline void do_trace_write_msr(u32 msr, u64 val, int failed) {}
+static inline void do_trace_read_msr(u32 msr, u64 val, int failed) {}
 static inline void do_trace_rdpmc(u32 msr, u64 val, int failed) {}
 #endif
 
@@ -79,7 +79,7 @@ static inline void do_trace_rdpmc(u32 msr, u64 val, int failed) {}
  * think of extending them - you will be slapped with a stinking trout or a frozen
  * shark will reach you, wherever you are! You've been warned.
  */
-static __always_inline u64 __rdmsr(unsigned int msr)
+static __always_inline u64 __rdmsr(u32 msr)
 {
 	DECLARE_ARGS(val, low, high);
 
@@ -91,7 +91,7 @@ static __always_inline u64 __rdmsr(unsigned int msr)
 	return EAX_EDX_VAL(val, low, high);
 }
 
-static __always_inline void __wrmsr(unsigned int msr, u32 low, u32 high)
+static __always_inline void __wrmsr(u32 msr, u32 low, u32 high)
 {
 	asm volatile("1: wrmsr\n"
 		     "2:\n"
@@ -113,7 +113,7 @@ do {							\
 	__wrmsr((msr), (u32)((u64)(val)),		\
 		       (u32)((u64)(val) >> 32))
 
-static inline u64 native_read_msr(unsigned int msr)
+static inline u64 native_read_msr(u32 msr)
 {
 	u64 val;
 
@@ -125,8 +125,7 @@ static inline u64 native_read_msr(unsigned int msr)
 	return val;
 }
 
-static inline u64 native_read_msr_safe(unsigned int msr,
-						      int *err)
+static inline u64 native_read_msr_safe(u32 msr, int *err)
 {
 	DECLARE_ARGS(val, low, high);
 
@@ -142,7 +141,7 @@ static inline u64 native_read_msr_safe(unsigned int msr,
 
 /* Can be uninlined because referenced by paravirt */
 static inline void notrace
-native_write_msr(unsigned int msr, u32 low, u32 high)
+native_write_msr(u32 msr, u32 low, u32 high)
 {
 	__wrmsr(msr, low, high);
 
@@ -152,7 +151,7 @@ native_write_msr(unsigned int msr, u32 low, u32 high)
 
 /* Can be uninlined because referenced by paravirt */
 static inline int notrace
-native_write_msr_safe(unsigned int msr, u32 low, u32 high)
+native_write_msr_safe(u32 msr, u32 low, u32 high)
 {
 	int err;
 
@@ -251,7 +250,7 @@ do {								\
 	(void)((high) = (u32)(__val >> 32));			\
 } while (0)
 
-static inline void wrmsr(unsigned int msr, u32 low, u32 high)
+static inline void wrmsr(u32 msr, u32 low, u32 high)
 {
 	native_write_msr(msr, low, high);
 }
@@ -259,13 +258,13 @@ static inline void wrmsr(unsigned int msr, u32 low, u32 high)
 #define rdmsrq(msr, val)			\
 	((val) = native_read_msr((msr)))
 
-static inline void wrmsrq(unsigned int msr, u64 val)
+static inline void wrmsrq(u32 msr, u64 val)
 {
 	native_write_msr(msr, (u32)(val & 0xffffffffULL), (u32)(val >> 32));
 }
 
 /* wrmsr with exception handling */
-static inline int wrmsr_safe(unsigned int msr, u32 low, u32 high)
+static inline int wrmsr_safe(u32 msr, u32 low, u32 high)
 {
 	return native_write_msr_safe(msr, low, high);
 }
@@ -280,7 +279,7 @@ static inline int wrmsr_safe(unsigned int msr, u32 low, u32 high)
 	__err;							\
 })
 
-static inline int rdmsrq_safe(unsigned int msr, u64 *p)
+static inline int rdmsrq_safe(u32 msr, u64 *p)
 {
 	int err;
 
diff --git a/arch/x86/lib/msr.c b/arch/x86/lib/msr.c
index e18925899f13..4ef7c6dcbea6 100644
--- a/arch/x86/lib/msr.c
+++ b/arch/x86/lib/msr.c
@@ -122,14 +122,14 @@ int msr_clear_bit(u32 msr, u8 bit)
 EXPORT_SYMBOL_GPL(msr_clear_bit);
 
 #ifdef CONFIG_TRACEPOINTS
-void do_trace_write_msr(unsigned int msr, u64 val, int failed)
+void do_trace_write_msr(u32 msr, u64 val, int failed)
 {
 	trace_write_msr(msr, val, failed);
 }
 EXPORT_SYMBOL(do_trace_write_msr);
 EXPORT_TRACEPOINT_SYMBOL(write_msr);
 
-void do_trace_read_msr(unsigned int msr, u64 val, int failed)
+void do_trace_read_msr(u32 msr, u64 val, int failed)
 {
 	trace_read_msr(msr, val, failed);
 }

