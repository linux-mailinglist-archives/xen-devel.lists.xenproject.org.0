Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CE57ABFE5
	for <lists+xen-devel@lfdr.de>; Sat, 23 Sep 2023 12:12:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607090.945329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjzcA-0002Ze-Fl; Sat, 23 Sep 2023 10:11:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607090.945329; Sat, 23 Sep 2023 10:11:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjzcA-0002W2-8v; Sat, 23 Sep 2023 10:11:54 +0000
Received: by outflank-mailman (input) for mailman id 607090;
 Sat, 23 Sep 2023 10:11:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xNi6=FH=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qjzc8-0000Pn-5X
 for xen-devel@lists.xenproject.org; Sat, 23 Sep 2023 10:11:52 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a94ddf5-59f9-11ee-9b0d-b553b5be7939;
 Sat, 23 Sep 2023 12:11:47 +0200 (CEST)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2023 03:11:40 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga008.fm.intel.com with ESMTP; 23 Sep 2023 03:11:39 -0700
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
X-Inumbo-ID: 9a94ddf5-59f9-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695463907; x=1726999907;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZlGESG1ZjbxHp/2vGEpu7uzY2F9a0taEPQgxug8c1Qc=;
  b=mqWpm+ziSGBCxt1+XVJGIbKQqj3tDJ1a2SGdSpLugmodk6BV/jG2IYUG
   xDtt9PFMt9uvf/RzLxDtrFxjZntCctTxWGprivFHKaZ9sQhzLxCYa23MF
   pPtie+ZW2xpYX+5lfH+pjaYt1CPdsEbuTyt8m8RbWlUejErSbDxwu0eD+
   ZvgF3KH0yprB/KcBNsSrORn65VnxIOv1ioiNKImHBMlxwLnceONTO2zqM
   mndCHtt6BwRFhtKXRxvst/6O9yuwPbyVoVEzPbsPQf3feDmFA5CFrSjRK
   fi3yEC8GoD6dbItYBNGXzU7i///fO+pOuh90OAjqa9ARr9XuRgcVRYuGA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="447492168"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="447492168"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="813388128"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="813388128"
From: Xin Li <xin3.li@intel.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-edac@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Cc: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	luto@kernel.org,
	pbonzini@redhat.com,
	seanjc@google.com,
	peterz@infradead.org,
	jgross@suse.com,
	ravi.v.shankar@intel.com,
	mhiramat@kernel.org,
	andrew.cooper3@citrix.com,
	jiangshanlai@gmail.com,
	nik.borisov@suse.com
Subject: [PATCH v11 08/37] x86/cpufeatures: Add the cpu feature bit for FRED
Date: Sat, 23 Sep 2023 02:41:43 -0700
Message-Id: <20230923094212.26520-9-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230923094212.26520-1-xin3.li@intel.com>
References: <20230923094212.26520-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "H. Peter Anvin (Intel)" <hpa@zytor.com>

Any FRED CPU will always have the following features as its baseline:
  1) LKGS, load attributes of the GS segment but the base address into
     the IA32_KERNEL_GS_BASE MSR instead of the GS segment’s descriptor
     cache.
  2) WRMSRNS, non-serializing WRMSR for faster MSR writes.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---
 arch/x86/include/asm/cpufeatures.h       | 1 +
 arch/x86/kernel/cpu/cpuid-deps.c         | 2 ++
 tools/arch/x86/include/asm/cpufeatures.h | 1 +
 3 files changed, 4 insertions(+)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 330876d34b68..57ae93dc1e52 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -321,6 +321,7 @@
 #define X86_FEATURE_FZRM		(12*32+10) /* "" Fast zero-length REP MOVSB */
 #define X86_FEATURE_FSRS		(12*32+11) /* "" Fast short REP STOSB */
 #define X86_FEATURE_FSRC		(12*32+12) /* "" Fast short REP {CMPSB,SCASB} */
+#define X86_FEATURE_FRED		(12*32+17) /* Flexible Return and Event Delivery */
 #define X86_FEATURE_LKGS		(12*32+18) /* "" Load "kernel" (userspace) GS */
 #define X86_FEATURE_WRMSRNS		(12*32+19) /* "" Non-Serializing Write to Model Specific Register instruction */
 #define X86_FEATURE_AMX_FP16		(12*32+21) /* "" AMX fp16 Support */
diff --git a/arch/x86/kernel/cpu/cpuid-deps.c b/arch/x86/kernel/cpu/cpuid-deps.c
index e462c1d3800a..b7174209d855 100644
--- a/arch/x86/kernel/cpu/cpuid-deps.c
+++ b/arch/x86/kernel/cpu/cpuid-deps.c
@@ -82,6 +82,8 @@ static const struct cpuid_dep cpuid_deps[] = {
 	{ X86_FEATURE_XFD,			X86_FEATURE_XGETBV1   },
 	{ X86_FEATURE_AMX_TILE,			X86_FEATURE_XFD       },
 	{ X86_FEATURE_SHSTK,			X86_FEATURE_XSAVES    },
+	{ X86_FEATURE_FRED,			X86_FEATURE_LKGS      },
+	{ X86_FEATURE_FRED,			X86_FEATURE_WRMSRNS   },
 	{}
 };
 
diff --git a/tools/arch/x86/include/asm/cpufeatures.h b/tools/arch/x86/include/asm/cpufeatures.h
index 1b9d86ba5bc2..18bab7987d7f 100644
--- a/tools/arch/x86/include/asm/cpufeatures.h
+++ b/tools/arch/x86/include/asm/cpufeatures.h
@@ -317,6 +317,7 @@
 #define X86_FEATURE_FZRM		(12*32+10) /* "" Fast zero-length REP MOVSB */
 #define X86_FEATURE_FSRS		(12*32+11) /* "" Fast short REP STOSB */
 #define X86_FEATURE_FSRC		(12*32+12) /* "" Fast short REP {CMPSB,SCASB} */
+#define X86_FEATURE_FRED		(12*32+17) /* Flexible Return and Event Delivery */
 #define X86_FEATURE_LKGS		(12*32+18) /* "" Load "kernel" (userspace) GS */
 #define X86_FEATURE_WRMSRNS		(12*32+19) /* "" Non-Serializing Write to Model Specific Register instruction */
 #define X86_FEATURE_AMX_FP16		(12*32+21) /* "" AMX fp16 Support */
-- 
2.34.1


