Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 157D8A76178
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 10:24:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931997.1334222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzARE-0002tU-MC; Mon, 31 Mar 2025 08:24:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931997.1334222; Mon, 31 Mar 2025 08:24:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzARE-0002q3-FK; Mon, 31 Mar 2025 08:24:08 +0000
Received: by outflank-mailman (input) for mailman id 931997;
 Mon, 31 Mar 2025 08:24:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=orDG=WS=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1tzARC-0001u1-0K
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 08:24:06 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fd71d91-0e09-11f0-9ea7-5ba50f476ded;
 Mon, 31 Mar 2025 10:24:02 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52V8Mp083171319
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 31 Mar 2025 01:23:14 -0700
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
X-Inumbo-ID: 7fd71d91-0e09-11f0-9ea7-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52V8Mp083171319
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1743409396;
	bh=LUf6J4OHKn6Yqz/cuiPFW5gyz7UWQzJR/hPRWef8Heg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jg4QkVHWmuNxTSaNr3aLQCDAx0pfc5MzZ6zHM+wqM8DSTcQ3v/RsKHxoUQpqWtNbJ
	 m458JdmtvOkoM5D9ageqtKl9oHpcXzkGBie1zx4Z64jnAGFmPZKoyTrDoCRBO1dSLT
	 mR0rsGe9H8URcFY2CBgpai+T0h9txzTfzfHRjKd6U95Ungph1Kwv+yEPzL4fhScW5l
	 Ab8OKE5fJ02Tagt2yFWbB7GGJh/377QIshI1xuLWxMSYTo8yAwJfG0LGkBemhVlVjc
	 tTZHvLjVyjNvdRXxd7vUQNm4YDAIWKVIT4qPZoTRRR4mD09RG0QuehmydgeXZydpxd
	 2Z/C61/mQ2MUw==
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
Subject: [RFC PATCH v1 08/15] x86/cpufeatures: Add a CPU feature bit for MSR immediate form instructions
Date: Mon, 31 Mar 2025 01:22:44 -0700
Message-ID: <20250331082251.3171276-9-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331082251.3171276-1-xin@zytor.com>
References: <20250331082251.3171276-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The immediate form of MSR access instructions are primarily motivated
by performance, not code size: by having the MSR number in an immediate,
it is available *much* earlier in the pipeline, which allows the
hardware much more leeway about how a particular MSR is handled.

Use a scattered CPU feature bit for MSR immediate form instructions.

Suggested-by: Borislav Petkov <bp@alien8.de>
Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---
 arch/x86/include/asm/cpufeatures.h | 19 ++++++++++---------
 arch/x86/kernel/cpu/scattered.c    |  1 +
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 6c2c152d8a67..a742a3d34712 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -472,15 +472,16 @@
  *
  * Reuse free bits when adding new feature flags!
  */
-#define X86_FEATURE_AMD_LBR_PMC_FREEZE	(21*32+ 0) /* "amd_lbr_pmc_freeze" AMD LBR and PMC Freeze */
-#define X86_FEATURE_CLEAR_BHB_LOOP	(21*32+ 1) /* Clear branch history at syscall entry using SW loop */
-#define X86_FEATURE_BHI_CTRL		(21*32+ 2) /* BHI_DIS_S HW control available */
-#define X86_FEATURE_CLEAR_BHB_HW	(21*32+ 3) /* BHI_DIS_S HW control enabled */
-#define X86_FEATURE_CLEAR_BHB_LOOP_ON_VMEXIT (21*32+ 4) /* Clear branch history at vmexit using SW loop */
-#define X86_FEATURE_AMD_FAST_CPPC	(21*32 + 5) /* Fast CPPC */
-#define X86_FEATURE_AMD_HETEROGENEOUS_CORES (21*32 + 6) /* Heterogeneous Core Topology */
-#define X86_FEATURE_AMD_WORKLOAD_CLASS	(21*32 + 7) /* Workload Classification */
-#define X86_FEATURE_PREFER_YMM		(21*32 + 8) /* Avoid ZMM registers due to downclocking */
+#define X86_FEATURE_AMD_LBR_PMC_FREEZE		(21*32+ 0) /* "amd_lbr_pmc_freeze" AMD LBR and PMC Freeze */
+#define X86_FEATURE_CLEAR_BHB_LOOP		(21*32+ 1) /* Clear branch history at syscall entry using SW loop */
+#define X86_FEATURE_BHI_CTRL			(21*32+ 2) /* BHI_DIS_S HW control available */
+#define X86_FEATURE_CLEAR_BHB_HW		(21*32+ 3) /* BHI_DIS_S HW control enabled */
+#define X86_FEATURE_CLEAR_BHB_LOOP_ON_VMEXIT	(21*32+ 4) /* Clear branch history at vmexit using SW loop */
+#define X86_FEATURE_AMD_FAST_CPPC		(21*32+ 5) /* Fast CPPC */
+#define X86_FEATURE_AMD_HETEROGENEOUS_CORES	(21*32+ 6) /* Heterogeneous Core Topology */
+#define X86_FEATURE_AMD_WORKLOAD_CLASS		(21*32+ 7) /* Workload Classification */
+#define X86_FEATURE_PREFER_YMM			(21*32+ 8) /* Avoid ZMM registers due to downclocking */
+#define X86_FEATURE_MSR_IMM			(21*32+ 9) /* MSR immediate form instructions */
 
 /*
  * BUG word(s)
diff --git a/arch/x86/kernel/cpu/scattered.c b/arch/x86/kernel/cpu/scattered.c
index 16f3ca30626a..9eda656e9793 100644
--- a/arch/x86/kernel/cpu/scattered.c
+++ b/arch/x86/kernel/cpu/scattered.c
@@ -27,6 +27,7 @@ static const struct cpuid_bit cpuid_bits[] = {
 	{ X86_FEATURE_APERFMPERF,		CPUID_ECX,  0, 0x00000006, 0 },
 	{ X86_FEATURE_EPB,			CPUID_ECX,  3, 0x00000006, 0 },
 	{ X86_FEATURE_INTEL_PPIN,		CPUID_EBX,  0, 0x00000007, 1 },
+	{ X86_FEATURE_MSR_IMM,			CPUID_ECX,  5, 0x00000007, 1 },
 	{ X86_FEATURE_RRSBA_CTRL,		CPUID_EDX,  2, 0x00000007, 2 },
 	{ X86_FEATURE_BHI_CTRL,			CPUID_EDX,  4, 0x00000007, 2 },
 	{ X86_FEATURE_CQM_LLC,			CPUID_EDX,  1, 0x0000000f, 0 },
-- 
2.49.0


