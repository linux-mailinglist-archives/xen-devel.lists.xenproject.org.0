Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFD26B4BE1
	for <lists+xen-devel@lfdr.de>; Fri, 10 Mar 2023 17:03:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508518.783245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pafCo-0000yo-7R; Fri, 10 Mar 2023 16:02:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508518.783245; Fri, 10 Mar 2023 16:02:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pafCo-0000wh-3J; Fri, 10 Mar 2023 16:02:54 +0000
Received: by outflank-mailman (input) for mailman id 508518;
 Fri, 10 Mar 2023 16:02:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cIIN=7C=citrix.com=prvs=426914f36=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pafCm-0000Sh-E4
 for xen-devel@lists.xenproject.org; Fri, 10 Mar 2023 16:02:52 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 016eb0d4-bf5d-11ed-87f5-c1b5be75604c;
 Fri, 10 Mar 2023 17:02:51 +0100 (CET)
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
X-Inumbo-ID: 016eb0d4-bf5d-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678464171;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hxDuuASBYhC3lgjPMhX5Vo2Fmk3Cotqg6TNgoc6+qJE=;
  b=hqj1VhyzMJNJnj2MiY+0/h2gELVNvZXxCVNt+ltukyPzYEcn50ADuNC7
   HJTMHXToBN1o+MKIb6tu2x0fC80dRTn26Hs6Xc/MAZ1fXpFs2CTNbb3bz
   Xpd+ILgN3eHG8FkYiwHl4cVF/a3Ff4LMV1YyoEWHQzbiKkZVsB08mHNUM
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 100246595
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:A/v9qKlc1A0J88r+9W3JEK3o5gyXJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbD2GOPqyMajCkL9ogaYTiphtS7Z7dmt41GQA5/CEzRSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5QeGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 eQJd20KcA7Eu+2/3+qbZtYznpojIMa+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglHWdTFCpU3Tjq0w+2XJlyR60aT3McqTcduPLSlQth/A/
 jiaoTmoX3n2MvSOwjbY9yuLl9XhgH64W4IWH4fhz+Bl1Qj7Kms7V0RNCArTTeOColG6c8JSL
 QoT4CVGhbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xJEIJUzpAY9wOr9ItSHoh0
 Vrhoj/yLWUx6vvPEyvbr+rK62roYkD5MFPuewccXFRY5Mf95708hw2XbvpcT7brjtH6TGSYL
 y+xkAAygLAajMgu3qq9/Ezajz/EmqUlXjLZ9S2MADv7s1oRiJqNItXxtAOFtaoowJOxFAHpg
 ZQSpySJAAni57mpnTfFfugCFarBCx2tYGyF2g4H83XMGl2QF5+fkWJ4umwWyKRBaJxsldrVj
 Kj76GtsCGd7ZifCUEOOS9vZ5z4W5abhD8/5cfvfc8BDZJN8HCfeon4+Ph7Ojji2zRdw+U3aB
 Xt8WZzxZUv29Iw9lGbmLwvj+eVDKt8CKZP7GsmgkkXPPUu2b3+JU7YVWGZinchghJ5oVD79q
 o4FX+PTkkU3bQELSnWPmWLlBQxQfCdT6FGfg5A/S9Nv1SI/RTBwVKGMn+x6E2Gn9owM/tr1E
 riGchcw4DLCabfvc21mtlgLhGvTYKtC
IronPort-HdrOrdr: A9a23:Gyi3hqN2wDsxecBcTs+jsMiBIKoaSvp037BL7SxMoHluGfBw+P
 rAoB1273HJYVQqOE3I6OrgBEDoexq1n/NICOIqTNSftWfdyQ6VBbAnwYz+wyDxXw3Sn9QtsZ
 uIqpIOauHNMQ==
X-IronPort-AV: E=Sophos;i="5.98,250,1673931600"; 
   d="scan'208";a="100246595"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] x86/spec-ctrl: Enumerations for DDP controls
Date: Fri, 10 Mar 2023 16:02:38 +0000
Message-ID: <20230310160238.1321765-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230310160238.1321765-1-andrew.cooper3@citrix.com>
References: <20230310160238.1321765-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/technical-documentation/data-dependent-prefetcher.html

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 tools/libs/light/libxl_cpuid.c              | 1 +
 tools/misc/xen-cpuid.c                      | 2 +-
 xen/arch/x86/include/asm/msr-index.h        | 1 +
 xen/include/public/arch-x86/cpufeatureset.h | 1 +
 4 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 1d4e8a6b0067..968635981086 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -242,6 +242,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
         {"intel-psfd",   0x00000007,  2, CPUID_REG_EDX,  0,  1},
         {"ipred-ctrl",   0x00000007,  2, CPUID_REG_EDX,  1,  1},
         {"rrsba-ctrl",   0x00000007,  2, CPUID_REG_EDX,  2,  1},
+        {"ddp-ctrl",     0x00000007,  2, CPUID_REG_EDX,  3,  1},
         {"bhi-ctrl",     0x00000007,  2, CPUID_REG_EDX,  4,  1},
         {"mcdt-no",      0x00000007,  2, CPUID_REG_EDX,  5,  1},
 
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 4f4261f4aa95..868054ab96a6 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -216,7 +216,7 @@ static const char *const str_7d1[32] =
 static const char *const str_7d2[32] =
 {
     [ 0] = "intel-psfd",    [ 1] = "ipred-ctrl",
-    [ 2] = "rrsba-ctrl",
+    [ 2] = "rrsba-ctrl",    [ 3] = "ddp-ctrl",
     [ 4] = "bhi-ctrl",      [ 5] = "mcdt-no",
 };
 
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 7615d8087f46..4e90b361eb08 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -41,6 +41,7 @@
 #define  SPEC_CTRL_RRSBA_DIS_U              (_AC(1, ULL) <<  5)
 #define  SPEC_CTRL_RRSBA_DIS_S              (_AC(1, ULL) <<  6)
 #define  SPEC_CTRL_PSFD                     (_AC(1, ULL) <<  7)
+#define  SPEC_CTRL_DDPU_D                   (_AC(1, ULL) <<  8)
 #define  SPEC_CTRL_BHI_DIS_S                (_AC(1, ULL) << 10)
 
 #define MSR_PRED_CMD                        0x00000049
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 336744b47119..4976a27690af 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -295,6 +295,7 @@ XEN_CPUFEATURE(INTEL_PSFD,         13*32+ 0) /*A  MSR_SPEC_CTRL.PSFD */
 XEN_CPUFEATURE(IPRED_CTRL,         13*32+ 1) /*   MSR_SPEC_CTRL.IPRED_DIS_* */
 XEN_CPUFEATURE(RRSBA_CTRL,         13*32+ 2) /*   MSR_SPEC_CTRL.RRSBA_DIS_* */
 XEN_CPUFEATURE(BHI_CTRL,           13*32+ 4) /*   MSR_SPEC_CTRL.BHI_DIS_S */
+XEN_CPUFEATURE(DDP_CTRL,           13*32+ 3) /*   MSR_SPEC_CTRL.DDPU_U */
 XEN_CPUFEATURE(MCDT_NO,            13*32+ 5) /*A  MCDT_NO */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.ecx, word 14 */
-- 
2.30.2


