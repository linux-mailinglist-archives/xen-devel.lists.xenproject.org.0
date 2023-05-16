Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 121A270514D
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 16:54:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535261.832950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyw3h-0006S7-Dg; Tue, 16 May 2023 14:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535261.832950; Tue, 16 May 2023 14:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyw3h-0006P0-5n; Tue, 16 May 2023 14:53:49 +0000
Received: by outflank-mailman (input) for mailman id 535261;
 Tue, 16 May 2023 14:53:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7WEk=BF=citrix.com=prvs=493b78b38=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pyw3f-0006OC-Nj
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 14:53:47 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74c30a6d-f3f9-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 16:53:46 +0200 (CEST)
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
X-Inumbo-ID: 74c30a6d-f3f9-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684248826;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LZA9DiPzTWBX0eSgS7FnHPS/B/27DbsY3IexopoDr6Y=;
  b=AvgpE37ZbnVokSWYKFJ2qe26tIkMQHvnOeYMHZoff/W+J9akpAm8iOO3
   0uQAFz8o1uX1fdLKhW1FjS1hOZTtgV+IpDxAWKuUPp+a84H66puOa7zzP
   6uOPBH3pU8womLd4iRYUpvkuZ9gdPUYsz+TAwqiKGIkgRKTiVCz5Gr6Dm
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 109243519
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:hHoczq9imQHx+vMaQrs3DrUDv36TJUtcMsCJ2f8bNWPcYEJGY0x3n
 zAdWmGDb/2LZzH0fdtxbY++9E0EuJ/UndRkTQpsrSA8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI+1BjOkGlA5AdmOKkV5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklPy
 v4FGD8hRCupgtKsnunmUvIrq5QseZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0MxhfC+
 jmbpjWR7hcyaeCR0hTdzHyWhrHEuQ3pSp0KSa2y36s/6LGU7jNKU0BHPbehmtGmjmauVtQZL
 FYbkgIssK508kWoR9v8WhSQoXiYsxpaUN1Ve8U55R+MzOzI4g+fLmkCUjNFLtchsaceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDQcmZwYY59jooKkokwnCCN1kFcaIYsbdQG+qh
 WrQ9W5n2utV1JRQv0mmwbzZqzOTpIX5QSIf3S/Sbnj7tV5hf8mIN4P9vDA38s18BIqeS1CAu
 l0NlM6f8P0CAPmxqcCdfAkeNOr3vqjYaVUwlXYqRsB8rGr1pxZPaKgKuFlDyFFV3tHokNMDS
 Gvaoktv6ZBaJxNGhocnMtvqW6zGIUUNfOkJt8w4jPIUOvCdlyfdpkmCgHJ8OEiz+HXAaYllZ
 f+mnT+EVB7285hPwjusXPs62rQ23C04zm67bcmln0j+jufANSfJFu1t3L6yggcRvcu5TPj9q
 Y4DZ6NmNT0FOAEBXsUn2dFKdg1bRZTKLZv3t9ZWZoa+H+aSI0l4U6W56ep4K+RYc1F9yr+gE
 oeVBhUJlzISRBTvdW23V5yUQO2/Assv8S1iZkTB/z+AghAeXGpm149HH7NfQFXt3LULISJcJ
 xXdR/i9Pw==
IronPort-HdrOrdr: A9a23:u8L0iKqLY652xS2w1VZxeF0aV5uRL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossSkb6Ky90KnpewK5yXcH2/hvAV7CZniqhILMFuBfBOTZskXd8kHFh4xgPO
 JbAtVD4b7LfBRHZKTBkXKF+r8bqbHtms3J9ITjJjVWPHtXgslbnkFE422gYypLrXx9dOME/e
 2nl6x6TlSbCBEqh+2AdzY4dtmGg+eOuIPtYBYACRJiwhKJlymU5LnzFAXd9gsCUhtUqI1SsF
 Ttokjc3OGOovu7whjT2yv49JJNgubszdNFGYilltUVEDPxkQylDb4RG4Fq/QpF491H2mxa1e
 UkkC1Qe/ib3kmhPF1c5nPWqkfdOXgVmjjfIBSj8AXeSITCNUMH4ox69NpkWyqc0kI7pt1w7a
 NR2X6WtrxRNAjNmCTm68KgbWAyqqP8mwtTrccDy3NYSocQc7lXsMgW+15UCo4JGGbg5JkgC/
 QGNrCV2B/4SyLvU5n1hBgY/DWXZAV7Ij6WBkwZ/sCF2Tlfm350i0Me2cwEh38FsJYwUYNN6e
 jIOrlh0OgmdL5dUYttQOMaBcenAG3ERhzBdGqUPFT8DakCf3bAsYT+7rk57PyjPJYI0Jwxkp
 LcV04wjx94R6svM7z44HRmyGG5fIzmZ0Wf9ih33ekKhoHB
X-Talos-CUID: =?us-ascii?q?9a23=3ANY0Q0mjmxrZpR5c3un12WD3YOTJuc0Lf0UffD2W?=
 =?us-ascii?q?DI2NZUuPOFEeLv440nJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AOcCANg8BF75ysaasesJnxF6Qf5pU7b+AUH4Dq5V?=
 =?us-ascii?q?YsO2qJz5vI2qNhh3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,278,1677560400"; 
   d="scan'208";a="109243519"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH 2/4] x86/vtx: Remove opencoded MSR_ARCH_CAPS check
Date: Tue, 16 May 2023 15:53:32 +0100
Message-ID: <20230516145334.1271347-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230516145334.1271347-1-andrew.cooper3@citrix.com>
References: <20230516145334.1271347-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

MSR_ARCH_CAPS data is now included in featureset information.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
---
 xen/arch/x86/hvm/vmx/vmx.c            | 8 ++------
 xen/arch/x86/include/asm/cpufeature.h | 3 +++
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 096c69251d58..9dc16d0cc6b9 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2849,8 +2849,6 @@ static void __init ler_to_fixup_check(void);
  */
 static bool __init has_if_pschange_mc(void)
 {
-    uint64_t caps = 0;
-
     /*
      * If we are virtualised, there is nothing we can do.  Our EPT tables are
      * shadowed by our hypervisor, and not walked by hardware.
@@ -2858,10 +2856,8 @@ static bool __init has_if_pschange_mc(void)
     if ( cpu_has_hypervisor )
         return false;
 
-    if ( cpu_has_arch_caps )
-        rdmsrl(MSR_ARCH_CAPABILITIES, caps);
-
-    if ( caps & ARCH_CAPS_IF_PSCHANGE_MC_NO )
+    /* Hardware reports itself as fixed. */
+    if ( cpu_has_if_pschange_mc_no )
         return false;
 
     /*
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index 4f827cc6ff91..8446f98625f7 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -183,6 +183,9 @@ static inline bool boot_cpu_has(unsigned int feat)
 #define cpu_has_avx_vnni_int8   boot_cpu_has(X86_FEATURE_AVX_VNNI_INT8)
 #define cpu_has_avx_ne_convert  boot_cpu_has(X86_FEATURE_AVX_NE_CONVERT)
 
+/* MSR_ARCH_CAPS 10A */
+#define cpu_has_if_pschange_mc_no boot_cpu_has(X86_FEATURE_IF_PSCHANGE_MC_NO)
+
 /* Synthesized. */
 #define cpu_has_arch_perfmon    boot_cpu_has(X86_FEATURE_ARCH_PERFMON)
 #define cpu_has_cpuid_faulting  boot_cpu_has(X86_FEATURE_CPUID_FAULTING)
-- 
2.30.2


