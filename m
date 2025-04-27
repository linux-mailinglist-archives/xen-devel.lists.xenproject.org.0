Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 567B4A9E218
	for <lists+xen-devel@lfdr.de>; Sun, 27 Apr 2025 11:32:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.969782.1358729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8yNB-0004R8-Mx; Sun, 27 Apr 2025 09:32:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 969782.1358729; Sun, 27 Apr 2025 09:32:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8yNB-0004Oo-KS; Sun, 27 Apr 2025 09:32:29 +0000
Received: by outflank-mailman (input) for mailman id 969782;
 Sun, 27 Apr 2025 09:32:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hqWD=XN=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1u8yCf-0001A9-56
 for xen-devel@lists.xenproject.org; Sun, 27 Apr 2025 09:21:37 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa2031d8-2348-11f0-9ffb-bf95429c2676;
 Sun, 27 Apr 2025 11:21:20 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53R9KRRx1598826
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Sun, 27 Apr 2025 02:20:36 -0700
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
X-Inumbo-ID: fa2031d8-2348-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53R9KRRx1598826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745745637;
	bh=+pVPbNpNJhKlbxpDgv7RbZVuTFqKjEBhcRqOVxNg35M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VNmo3uiak1noYpKTG/jLw/iJPvxthCPJphOG7oNxfBB0fU/ujY4AM6rt1iCWNcVmB
	 PkVpItnEGcCeGnjVW5id6u8fewAPR6ih7c46JrOyu+ctmHJXDsx5VdOvDr14TGh/Lb
	 PgF26Pfs59jrRsEMvx/lql25UmR2CqpIshcSLlVH4fSW899RlSygMuGqkK3a74Z/tx
	 uGL4GxEX0OQ097TNxvCv7jEIzqA5H4lGqzh2IIybrBnLRjIlIfRghl6fcpAklhsDbS
	 7pEx8/ly1QrIWFMPItt5SnDpgkaS83vH3Hk/09/rsrMY16LPtDhd0EBO4KSIszK85N
	 GhEnY34L8vjHg==
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
Subject: [PATCH v4 02/15] x86/msr: Move rdtsc{,_ordered}() to <asm/tsc.h>
Date: Sun, 27 Apr 2025 02:20:14 -0700
Message-ID: <20250427092027.1598740-3-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250427092027.1598740-1-xin@zytor.com>
References: <20250427092027.1598740-1-xin@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For some reason, there are some TSC-related functions in the MSR
header even though there is a tsc.h header.

Relocate rdtsc{,_ordered}() from <asm/msr.h> to <asm/tsc.h>, and
subsequently remove the inclusion of <asm/msr.h> in <asm/tsc.h>.

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---

Change in v4:
*) Add missing includes in a different patch (Ilpo Järvinen).

Change in v3:
* Add a problem statement to the changelog (Dave Hansen).
---
 arch/x86/include/asm/msr.h | 54 ---------------------------
 arch/x86/include/asm/tsc.h | 76 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 75 insertions(+), 55 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 72a9ebc99078..2caa13830e11 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -170,60 +170,6 @@ native_write_msr_safe(u32 msr, u32 low, u32 high)
 extern int rdmsr_safe_regs(u32 regs[8]);
 extern int wrmsr_safe_regs(u32 regs[8]);
 
-/**
- * rdtsc() - returns the current TSC without ordering constraints
- *
- * rdtsc() returns the result of RDTSC as a 64-bit integer.  The
- * only ordering constraint it supplies is the ordering implied by
- * "asm volatile": it will put the RDTSC in the place you expect.  The
- * CPU can and will speculatively execute that RDTSC, though, so the
- * results can be non-monotonic if compared on different CPUs.
- */
-static __always_inline u64 rdtsc(void)
-{
-	DECLARE_ARGS(val, low, high);
-
-	asm volatile("rdtsc" : EAX_EDX_RET(val, low, high));
-
-	return EAX_EDX_VAL(val, low, high);
-}
-
-/**
- * rdtsc_ordered() - read the current TSC in program order
- *
- * rdtsc_ordered() returns the result of RDTSC as a 64-bit integer.
- * It is ordered like a load to a global in-memory counter.  It should
- * be impossible to observe non-monotonic rdtsc_unordered() behavior
- * across multiple CPUs as long as the TSC is synced.
- */
-static __always_inline u64 rdtsc_ordered(void)
-{
-	DECLARE_ARGS(val, low, high);
-
-	/*
-	 * The RDTSC instruction is not ordered relative to memory
-	 * access.  The Intel SDM and the AMD APM are both vague on this
-	 * point, but empirically an RDTSC instruction can be
-	 * speculatively executed before prior loads.  An RDTSC
-	 * immediately after an appropriate barrier appears to be
-	 * ordered as a normal load, that is, it provides the same
-	 * ordering guarantees as reading from a global memory location
-	 * that some other imaginary CPU is updating continuously with a
-	 * time stamp.
-	 *
-	 * Thus, use the preferred barrier on the respective CPU, aiming for
-	 * RDTSCP as the default.
-	 */
-	asm volatile(ALTERNATIVE_2("rdtsc",
-				   "lfence; rdtsc", X86_FEATURE_LFENCE_RDTSC,
-				   "rdtscp", X86_FEATURE_RDTSCP)
-			: EAX_EDX_RET(val, low, high)
-			/* RDTSCP clobbers ECX with MSR_TSC_AUX. */
-			:: "ecx");
-
-	return EAX_EDX_VAL(val, low, high);
-}
-
 static inline u64 native_read_pmc(int counter)
 {
 	DECLARE_ARGS(val, low, high);
diff --git a/arch/x86/include/asm/tsc.h b/arch/x86/include/asm/tsc.h
index 94408a784c8e..13335a130edf 100644
--- a/arch/x86/include/asm/tsc.h
+++ b/arch/x86/include/asm/tsc.h
@@ -7,7 +7,81 @@
 
 #include <asm/cpufeature.h>
 #include <asm/processor.h>
-#include <asm/msr.h>
+
+/*
+ * both i386 and x86_64 returns 64-bit value in edx:eax, but gcc's "A"
+ * constraint has different meanings. For i386, "A" means exactly
+ * edx:eax, while for x86_64 it doesn't mean rdx:rax or edx:eax. Instead,
+ * it means rax *or* rdx.
+ */
+#ifdef CONFIG_X86_64
+/* Using 64-bit values saves one instruction clearing the high half of low */
+#define DECLARE_ARGS(val, low, high)	unsigned long low, high
+#define EAX_EDX_VAL(val, low, high)	((low) | (high) << 32)
+#define EAX_EDX_RET(val, low, high)	"=a" (low), "=d" (high)
+#else
+#define DECLARE_ARGS(val, low, high)	u64 val
+#define EAX_EDX_VAL(val, low, high)	(val)
+#define EAX_EDX_RET(val, low, high)	"=A" (val)
+#endif
+
+/**
+ * rdtsc() - returns the current TSC without ordering constraints
+ *
+ * rdtsc() returns the result of RDTSC as a 64-bit integer.  The
+ * only ordering constraint it supplies is the ordering implied by
+ * "asm volatile": it will put the RDTSC in the place you expect.  The
+ * CPU can and will speculatively execute that RDTSC, though, so the
+ * results can be non-monotonic if compared on different CPUs.
+ */
+static __always_inline u64 rdtsc(void)
+{
+	DECLARE_ARGS(val, low, high);
+
+	asm volatile("rdtsc" : EAX_EDX_RET(val, low, high));
+
+	return EAX_EDX_VAL(val, low, high);
+}
+
+/**
+ * rdtsc_ordered() - read the current TSC in program order
+ *
+ * rdtsc_ordered() returns the result of RDTSC as a 64-bit integer.
+ * It is ordered like a load to a global in-memory counter.  It should
+ * be impossible to observe non-monotonic rdtsc_unordered() behavior
+ * across multiple CPUs as long as the TSC is synced.
+ */
+static __always_inline u64 rdtsc_ordered(void)
+{
+	DECLARE_ARGS(val, low, high);
+
+	/*
+	 * The RDTSC instruction is not ordered relative to memory
+	 * access.  The Intel SDM and the AMD APM are both vague on this
+	 * point, but empirically an RDTSC instruction can be
+	 * speculatively executed before prior loads.  An RDTSC
+	 * immediately after an appropriate barrier appears to be
+	 * ordered as a normal load, that is, it provides the same
+	 * ordering guarantees as reading from a global memory location
+	 * that some other imaginary CPU is updating continuously with a
+	 * time stamp.
+	 *
+	 * Thus, use the preferred barrier on the respective CPU, aiming for
+	 * RDTSCP as the default.
+	 */
+	asm volatile(ALTERNATIVE_2("rdtsc",
+				   "lfence; rdtsc", X86_FEATURE_LFENCE_RDTSC,
+				   "rdtscp", X86_FEATURE_RDTSCP)
+			: EAX_EDX_RET(val, low, high)
+			/* RDTSCP clobbers ECX with MSR_TSC_AUX. */
+			:: "ecx");
+
+	return EAX_EDX_VAL(val, low, high);
+}
+
+#undef DECLARE_ARGS
+#undef EAX_EDX_VAL
+#undef EAX_EDX_RET
 
 /*
  * Standard way to access the cycle counter.
-- 
2.49.0


