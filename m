Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C1B7B617C
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 08:55:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611899.951622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnZIz-0006iL-Dt; Tue, 03 Oct 2023 06:54:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611899.951622; Tue, 03 Oct 2023 06:54:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnZIy-0006UD-Fb; Tue, 03 Oct 2023 06:54:52 +0000
Received: by outflank-mailman (input) for mailman id 611899;
 Tue, 03 Oct 2023 06:54:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XwHy=FR=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qnZIu-00047B-Qi
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 06:54:48 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcddf705-61b9-11ee-9b0d-b553b5be7939;
 Tue, 03 Oct 2023 08:54:46 +0200 (CEST)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 23:54:40 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga005.fm.intel.com with ESMTP; 02 Oct 2023 23:54:39 -0700
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
X-Inumbo-ID: bcddf705-61b9-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696316086; x=1727852086;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aQdiRWsnt6AKxUkiRSvWlc5kg1W+wRYx8vYlgG3sGOg=;
  b=jQMHxIr1oVjfOZtw/8jMxocgpY2cAuYuyM/rAeFx3lUNmwBJXTexx4we
   aFWhbRCxnbLXKj9IpWB8Rt/jeY3cEwMcJCEaReVHG0PM6qThJ7dTR7Eip
   8uPf0E0dvvPQasuEMww97/okLMnLnuBitQddurSzwCeD/936bcgwhZhoC
   QMCdRWD7YaBQ1MwlZ28m8S3ksY0KYDKGX7IpjmwDdqrknVP2VGyqQ9ixN
   D2CTAFHgrwTbvVhMBW/3KqaRKlGCM7Vvmh3jeVGATlljOQdpzQlrb+pxh
   r3FEwotvAMX71fTkpFs5Tiz3kQ88GD6LdbRkx+xgAdykiWJ1Vd7PmD/fC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="367858016"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="367858016"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="1081900925"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="1081900925"
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
Subject: [PATCH v12 10/37] x86/fred: Disable FRED by default in its early stage
Date: Mon,  2 Oct 2023 23:24:31 -0700
Message-Id: <20231003062458.23552-11-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231003062458.23552-1-xin3.li@intel.com>
References: <20231003062458.23552-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To enable FRED, a new kernel command line option "fred" needs to be added.

Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 +++
 arch/x86/kernel/cpu/common.c                    | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 45e34be4ed56..ee939ea00458 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1525,6 +1525,9 @@
 			Warning: use of this parameter will taint the kernel
 			and may cause unknown problems.
 
+	fred		[X86-64]
+			Enable flexible return and event delivery
+
 	ftrace=[tracer]
 			[FTRACE] will set and start the specified tracer
 			as early as possible in order to facilitate early
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 7131074433f9..736d38abfc5a 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1502,6 +1502,9 @@ static void __init cpu_parse_early_param(void)
 	char *argptr = arg, *opt;
 	int arglen, taint = 0;
 
+	if (!cmdline_find_option_bool(boot_command_line, "fred"))
+		setup_clear_cpu_cap(X86_FEATURE_FRED);
+
 #ifdef CONFIG_X86_32
 	if (cmdline_find_option_bool(boot_command_line, "no387"))
 #ifdef CONFIG_MATH_EMULATION
-- 
2.34.1


