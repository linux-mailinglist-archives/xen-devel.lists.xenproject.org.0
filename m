Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC2B58DCAB
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 19:01:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383101.618230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLSbc-0004w7-Kd; Tue, 09 Aug 2022 17:01:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383101.618230; Tue, 09 Aug 2022 17:01:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLSbc-0004rO-Gb; Tue, 09 Aug 2022 17:01:24 +0000
Received: by outflank-mailman (input) for mailman id 383101;
 Tue, 09 Aug 2022 17:01:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=flEI=YN=citrix.com=prvs=213c446d4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oLSba-0003x4-Vy
 for xen-devel@lists.xenproject.org; Tue, 09 Aug 2022 17:01:23 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3606ba6-1804-11ed-bd2e-47488cf2e6aa;
 Tue, 09 Aug 2022 19:01:21 +0200 (CEST)
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
X-Inumbo-ID: e3606ba6-1804-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660064481;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BjsbhCrYHcz6DpzW2qJjo+cMWTneVBzlQHfGChbvUbI=;
  b=ZJSdRKFWQqNPeVZq28AmH/jeXscioh1+viSI4jMyRDGWB0j1KhHrjA6t
   GmBluLzaNi3ukchJaN0dc3qFF9FwIsH7AOKweEa9FJN7dUFtaRpjxpG1z
   rnK/3hTeKmToLioEc0sv2PtJ+NiFpW37bjAE4QCQ18XpGiW5pYPS9ukZq
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 80265504
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:b4UPeqwKDmcCgV6YSsd6t+dYxirEfRIJ4+MujC+fZmUNrF6WrkUBm
 GcYXDiAM/jbNzbxKY0kbYTlp0JV7ZKEn4MwGQM5+CAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv676yEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii8tjjMPR7zml4
 LsemOWCfg7+s9JIGjhMsfjb+Es+5K6aVA4w5TTSW9ga5DcyqFFNZH4vDfnZB2f1RIBSAtm7S
 47rpF1u1jqEl/uFIorNfofTKiXmcJaLVeS9oiM+t5yZqgpDvkQPPpMTb5LwX6v1ZwKhxLidw
 P0V3XC5pJxA0qfkwIzxWDEAe81y0DEvFBYq7hFTvOTKp3AqfUcAzN01C0x1I484oN9aJn9A5
 dU+FHMfVB+q0rfeLLKTEoGAh+wmJcjveogepmth3XfSCvNOrZLrGvuQo4UChXFp254ITa22i
 8kxMFKDaDzpZRFVN0hRI5U5hOqy3VH0ciFCqULTrq0yi4TW5FwpiuawbYKJEjCMbeFOt0GIi
 HLYwyfoEg4hLP2jxQCd7X3504cjmgukAdlPRdVU7MVCn1m71mEVThoMWjOTg9O0l0q/UNJ3M
 FEP92wlqq1a3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQA5oiVpMYJ88pVsHHpzi
 wHPz4iB6SFTXKO9EnWQtamWjWmLFA8LI38rQxNHXzEKyoy2yG0stS4jXuqPAYbs0IOtQWion
 m7TxMQtr+5N1JBWjs1X6XiC2mvx/caRE2bZ8y2NBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/5nzvp5pyBWG3TZS82AJrlxBAUKLc4FK+y1ZL0x0KMsCcjKBS
 BaN5FIAtMQDZST7M/cfj2eN5yMCnMDd+SnNDKiIPrKinLAoHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6RMJruMow+lWLeb7pMjtcWKtUWnzy7qWbTk0v6itJzpRe9Fd84Dbd5Rrlis/3Z/lmNr
 r6y9aKikn1ibQE3WQGPmaZ7ELzABShT6UzewyCPStO+Hw==
IronPort-HdrOrdr: A9a23:Sr5hZ6myQ8GBnryv3UkCa9jHLi7pDfIW3DAbv31ZSRFFG/Fxl6
 iV/cjzsiWE8Ar5OUtQ4OxoV5PwIk80maQb3WBVB8bHYOCEghrPEGgB1/qB/9SIIUSXnYQxuZ
 uIMZIOb+EYZWIK9voSizPZLz9P+re6GdiT9ILj80s=
X-IronPort-AV: E=Sophos;i="5.93,225,1654574400"; 
   d="scan'208";a="80265504"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] x86/spec-ctrl: Enumeration for PBRSB_NO
Date: Tue, 9 Aug 2022 18:00:15 +0100
Message-ID: <20220809170016.25148-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220809170016.25148-1-andrew.cooper3@citrix.com>
References: <20220809170016.25148-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The PBRSB_NO bit indicates that the CPU is not vulnerable to the Post-Barrier
RSB speculative vulnerability.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/include/asm/msr-index.h | 1 +
 xen/arch/x86/msr.c                   | 5 +++--
 xen/arch/x86/spec_ctrl.c             | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 1a928ea6af2f..0a8852f3c246 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -84,6 +84,7 @@
 #define  ARCH_CAPS_FB_CLEAR_CTRL            (_AC(1, ULL) << 18)
 #define  ARCH_CAPS_RRSBA                    (_AC(1, ULL) << 19)
 #define  ARCH_CAPS_BHI_NO                   (_AC(1, ULL) << 20)
+#define  ARCH_CAPS_PBRSB_NO                 (_AC(1, ULL) << 24)
 
 #define MSR_FLUSH_CMD                       0x0000010b
 #define  FLUSH_CMD_L1D                      (_AC(1, ULL) <<  0)
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 170f04179347..d2e2dc2a6b91 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -74,7 +74,8 @@ static void __init calculate_host_policy(void)
          ARCH_CAPS_SKIP_L1DFL | ARCH_CAPS_SSB_NO | ARCH_CAPS_MDS_NO |
          ARCH_CAPS_IF_PSCHANGE_MC_NO | ARCH_CAPS_TSX_CTRL | ARCH_CAPS_TAA_NO |
          ARCH_CAPS_SBDR_SSDP_NO | ARCH_CAPS_FBSDP_NO | ARCH_CAPS_PSDP_NO |
-         ARCH_CAPS_FB_CLEAR | ARCH_CAPS_RRSBA | ARCH_CAPS_BHI_NO);
+         ARCH_CAPS_FB_CLEAR | ARCH_CAPS_RRSBA | ARCH_CAPS_BHI_NO |
+         ARCH_CAPS_PBRSB_NO);
 }
 
 static void __init calculate_pv_max_policy(void)
@@ -166,7 +167,7 @@ int init_domain_msr_policy(struct domain *d)
              ARCH_CAPS_SSB_NO | ARCH_CAPS_MDS_NO | ARCH_CAPS_IF_PSCHANGE_MC_NO |
              ARCH_CAPS_TAA_NO | ARCH_CAPS_SBDR_SSDP_NO | ARCH_CAPS_FBSDP_NO |
              ARCH_CAPS_PSDP_NO | ARCH_CAPS_FB_CLEAR | ARCH_CAPS_RRSBA |
-             ARCH_CAPS_BHI_NO);
+             ARCH_CAPS_BHI_NO | ARCH_CAPS_PBRSB_NO);
     }
 
     d->arch.msr = mp;
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index d2cd5459739f..160cc68086c6 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -419,7 +419,7 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
      * Hardware read-only information, stating immunity to certain issues, or
      * suggestions of which mitigation to use.
      */
-    printk("  Hardware hints:%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
+    printk("  Hardware hints:%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
            (caps & ARCH_CAPS_RDCL_NO)                        ? " RDCL_NO"        : "",
            (caps & ARCH_CAPS_IBRS_ALL)                       ? " IBRS_ALL"       : "",
            (caps & ARCH_CAPS_RSBA)                           ? " RSBA"           : "",
@@ -431,6 +431,7 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
            (caps & ARCH_CAPS_SBDR_SSDP_NO)                   ? " SBDR_SSDP_NO"   : "",
            (caps & ARCH_CAPS_FBSDP_NO)                       ? " FBSDP_NO"       : "",
            (caps & ARCH_CAPS_PSDP_NO)                        ? " PSDP_NO"        : "",
+           (caps & ARCH_CAPS_PBRSB_NO)                       ? " PBRSB_NO"       : "",
            (e8b  & cpufeat_mask(X86_FEATURE_IBRS_ALWAYS))    ? " IBRS_ALWAYS"    : "",
            (e8b  & cpufeat_mask(X86_FEATURE_STIBP_ALWAYS))   ? " STIBP_ALWAYS"   : "",
            (e8b  & cpufeat_mask(X86_FEATURE_IBRS_FAST))      ? " IBRS_FAST"      : "",
-- 
2.11.0


