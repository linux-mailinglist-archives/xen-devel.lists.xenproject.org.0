Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFB03EEE88
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 16:30:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167905.306569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mG06t-0006Gw-2P; Tue, 17 Aug 2021 14:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167905.306569; Tue, 17 Aug 2021 14:30:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mG06s-0006Eh-VD; Tue, 17 Aug 2021 14:30:34 +0000
Received: by outflank-mailman (input) for mailman id 167905;
 Tue, 17 Aug 2021 14:30:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSHW=NI=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mG06r-0005xM-G9
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 14:30:33 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c2e31b0-1b19-4f7d-9dd6-62d4ef5f4e36;
 Tue, 17 Aug 2021 14:30:32 +0000 (UTC)
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
X-Inumbo-ID: 0c2e31b0-1b19-4f7d-9dd6-62d4ef5f4e36
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629210632;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CwPEY11jKBjTwYDG78a/S8NdZCFVyFcp3aHlBMgwn68=;
  b=Fz/xyuPxdwDoM7BXlBqT7TXMardpdtEyK9LTYeD8EepBP3fPCtu9Q0QG
   AFNDrysYEvWC/DCtnrfcogBVb1xVH9IuzeBm8c8+6Wu2Bt591eanZYJpk
   2eRehsyLDEmsGwApYzKnqjRBfnORCEkn3Ffk66P3opT+ZmKz9qEmS2FH/
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +zfpUIN/3CMbW8KqFZl1IaUvrZUaK8HrnCY4fdc9eGQIZ5a2Oc/YkORdGE9m/NPAubn4TIkHr9
 7cc3n0fL/NBh2Xdjgu/ZmZfGnSEby1nFDZhdpygShaZk78whZpxFiLCOHnTJ24Z7+tD+5qLCKn
 bS67DD8FruVh60HAswrJXXwXv3kPdJ8A2QNZusHU5dRqn6z+H4eEJdNc7CP5nIMFLFS61/0bD1
 5ZowYb3sV1Mq/lnnM6/Hm4UKCbkkKbdAW/IBWYhLCfbjyYz11O1VyuWxfqi7q/4pBdQjB5DnGW
 bHkwObD747m87X3XoRPatBAd
X-SBRS: 5.1
X-MesageID: 50642786
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:TkRFvKE8UCi5xR0ApLqFXpHXdLJyesId70hD6qkoc20zTiX5rb
 HsoB1p726xtN9xYgBmpTnuAtjifZqxz/JICMwqTNOftWrdySuVxeNZnOnfKlTbckWUnINgPO
 VbAs1D4bbLY2SS+Pyb3ODOKbcdKbe8n5xAzt2uqUuFBTsaEp2JaGxCe0Om+pkcfngFObMpUJ
 Wb/cZJvDymZDAeadm6HGAMW6zZq8TMj4+OW290Ozc3rA2FyS+u6KbnH3Gjr2Ajuh50sMYfGF
 L+4nzED2SYwoyG4w6Z03WW44VdmdPnxNcGDMuQitINIjGpjgqzfoxuV7CLoThw+YiUmSMXuc
 iJpw1lM9V46nvXcG3wqRzx2xP42DJr73P501eXjXbqvMS8TjMnDMhKg55fb3LimjgdlcA51L
 gO03OStpJRAx+FlCPh58LQXxUvjUawqWpKq59ss1VPFY8FLLNBp40W+01YVJ0aGjjh9YwhGO
 5ySMnB+fdfazqhHjnkl3gqxMbpUmU4Hx+ATERHsNeSySJKkHdwyFZdzNADn20H6Ik2R/B/lq
 z52u0BrsACcidhBZgNSNvob6CMeyPwqVOlChPYHbyRfJt3cU4ki/XMkfsIDSGRCeM1JOhbou
 WBbLp8jx9HR6vDM7z04HR7yGGwfIzmZ0WU9ih33ekChlX/LICbRxG+dA==
X-IronPort-AV: E=Sophos;i="5.84,329,1620705600"; 
   d="scan'208";a="50642786"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/3] x86/amd: Use newer SSBD mechanisms if they exist
Date: Tue, 17 Aug 2021 15:30:06 +0100
Message-ID: <20210817143006.2821-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210817143006.2821-1-andrew.cooper3@citrix.com>
References: <20210817143006.2821-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The opencoded legacy Memory Disambiguation logic in init_amd() neglected
Fam19h for the Zen3 microarchitecture.

In practice, all Zen2 based system (AMD Fam17h Model >= 0x30 and Hygon Fam18h
Model >= 0x4) have the architectural MSR_SPEC_CTRL and the SSBD bit within it.

Implement the algorithm given in AMD's SSBD whitepaper, and leave a
printk_once() behind in the case that no controls can be found.

This now means that a user choosing `spec-ctrl=no-ssb` will actually turn off
Memory Disambiguation on Fam19h/Zen3 systems.

This still remains a single system-wide setting (for now), and is not context
switched between vCPUs.  As such, it doesn't interact with Intel's use of
MSR_SPEC_CTRL and default_xen_spec_ctrl (yet).

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wei.liu2@citrix.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/amd.c   | 69 +++++++++++++++++++++++++++++++++++-------------
 xen/arch/x86/cpu/cpu.h   |  1 +
 xen/arch/x86/cpu/hygon.c | 10 +------
 xen/arch/x86/spec_ctrl.c |  5 +++-
 4 files changed, 57 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 2260eef3aab5..567565199373 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -681,6 +681,56 @@ void amd_init_lfence(struct cpuinfo_x86 *c)
 			  c->x86_capability);
 }
 
+/*
+ * Refer to the AMD Speculative Store Bypass whitepaper:
+ * https://developer.amd.com/wp-content/resources/124441_AMD64_SpeculativeStoreBypassDisable_Whitepaper_final.pdf
+ */
+void amd_init_ssbd(const struct cpuinfo_x86 *c)
+{
+	int bit = -1;
+
+	if (cpu_has_ssb_no)
+		return;
+
+	if (cpu_has_amd_ssbd) {
+		wrmsrl(MSR_SPEC_CTRL, opt_ssbd ? SPEC_CTRL_SSBD : 0);
+		return;
+	}
+
+	if (cpu_has_virt_ssbd) {
+		wrmsrl(MSR_VIRT_SPEC_CTRL, opt_ssbd ? SPEC_CTRL_SSBD : 0);
+		return;
+	}
+
+	switch (c->x86) {
+	case 0x15: bit = 54; break;
+	case 0x16: bit = 33; break;
+	case 0x17:
+	case 0x18: bit = 10; break;
+	}
+
+	if (bit >= 0) {
+		uint64_t val, mask = 1ull << bit;
+
+		if (rdmsr_safe(MSR_AMD64_LS_CFG, val) ||
+		    ({
+			    val &= ~mask;
+			    if ( opt_ssbd )
+				    val |= mask;
+			    false;
+		    }) ||
+		    wrmsr_safe(MSR_AMD64_LS_CFG, val) ||
+		    ({
+			    rdmsrl(MSR_AMD64_LS_CFG, val);
+			    (val & mask) != (opt_ssbd * mask);
+		    }))
+			bit = -1;
+	}
+
+	if (bit < 0)
+		printk_once(XENLOG_ERR "No SSBD controls available\n");
+}
+
 static void init_amd(struct cpuinfo_x86 *c)
 {
 	u32 l, h;
@@ -731,24 +781,7 @@ static void init_amd(struct cpuinfo_x86 *c)
 	else /* Implicily "== 0x10 || >= 0x12" by being 64bit. */
 		amd_init_lfence(c);
 
-	/*
-	 * If the user has explicitly chosen to disable Memory Disambiguation
-	 * to mitigiate Speculative Store Bypass, poke the appropriate MSR.
-	 */
-	if (opt_ssbd) {
-		int bit = -1;
-
-		switch (c->x86) {
-		case 0x15: bit = 54; break;
-		case 0x16: bit = 33; break;
-		case 0x17: bit = 10; break;
-		}
-
-		if (bit >= 0 && !rdmsr_safe(MSR_AMD64_LS_CFG, value)) {
-			value |= 1ull << bit;
-			wrmsr_safe(MSR_AMD64_LS_CFG, value);
-		}
-	}
+	amd_init_ssbd(c);
 
 	/* MFENCE stops RDTSC speculation */
 	if (!cpu_has_lfence_dispatch)
diff --git a/xen/arch/x86/cpu/cpu.h b/xen/arch/x86/cpu/cpu.h
index 1ac3b2867a04..1a5b3918b37e 100644
--- a/xen/arch/x86/cpu/cpu.h
+++ b/xen/arch/x86/cpu/cpu.h
@@ -21,3 +21,4 @@ extern bool detect_extended_topology(struct cpuinfo_x86 *c);
 void early_init_amd(struct cpuinfo_x86 *c);
 void amd_log_freq(const struct cpuinfo_x86 *c);
 void amd_init_lfence(struct cpuinfo_x86 *c);
+void amd_init_ssbd(const struct cpuinfo_x86 *c);
diff --git a/xen/arch/x86/cpu/hygon.c b/xen/arch/x86/cpu/hygon.c
index 67e23c5df9e3..56792146739e 100644
--- a/xen/arch/x86/cpu/hygon.c
+++ b/xen/arch/x86/cpu/hygon.c
@@ -33,15 +33,7 @@ static void init_hygon(struct cpuinfo_x86 *c)
 	unsigned long long value;
 
 	amd_init_lfence(c);
-
-	/*
-	 * If the user has explicitly chosen to disable Memory Disambiguation
-	 * to mitigiate Speculative Store Bypass, poke the appropriate MSR.
-	 */
-	if (opt_ssbd && !rdmsr_safe(MSR_AMD64_LS_CFG, value)) {
-		value |= 1ull << 10;
-		wrmsr_safe(MSR_AMD64_LS_CFG, value);
-	}
+	amd_init_ssbd(c);
 
 	/* MFENCE stops RDTSC speculation */
 	if (!cpu_has_lfence_dispatch)
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 9bf0fbf99813..0850afc09358 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -326,20 +326,23 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
            (caps & ARCH_CAPS_IBRS_ALL)                       ? " IBRS_ALL"       : "",
            (caps & ARCH_CAPS_RSBA)                           ? " RSBA"           : "",
            (caps & ARCH_CAPS_SKIP_L1DFL)                     ? " SKIP_L1DFL"     : "",
+           (e8b  & cpufeat_mask(X86_FEATURE_SSB_NO)) ||
            (caps & ARCH_CAPS_SSB_NO)                         ? " SSB_NO"         : "",
            (caps & ARCH_CAPS_MDS_NO)                         ? " MDS_NO"         : "",
            (caps & ARCH_CAPS_TAA_NO)                         ? " TAA_NO"         : "");
 
     /* Hardware features which need driving to mitigate issues. */
-    printk("  Hardware features:%s%s%s%s%s%s%s%s\n",
+    printk("  Hardware features:%s%s%s%s%s%s%s%s%s\n",
            (e8b  & cpufeat_mask(X86_FEATURE_IBPB)) ||
            (_7d0 & cpufeat_mask(X86_FEATURE_IBRSB))          ? " IBPB"           : "",
            (_7d0 & cpufeat_mask(X86_FEATURE_IBRSB))          ? " IBRS"           : "",
            (_7d0 & cpufeat_mask(X86_FEATURE_STIBP))          ? " STIBP"          : "",
+           (e8b  & cpufeat_mask(X86_FEATURE_AMD_SSBD)) ||
            (_7d0 & cpufeat_mask(X86_FEATURE_SSBD))           ? " SSBD"           : "",
            (_7d0 & cpufeat_mask(X86_FEATURE_L1D_FLUSH))      ? " L1D_FLUSH"      : "",
            (_7d0 & cpufeat_mask(X86_FEATURE_MD_CLEAR))       ? " MD_CLEAR"       : "",
            (_7d0 & cpufeat_mask(X86_FEATURE_SRBDS_CTRL))     ? " SRBDS_CTRL"     : "",
+           (e8b  & cpufeat_mask(X86_FEATURE_VIRT_SSBD))      ? " VIRT_SSBD"      : "",
            (caps & ARCH_CAPS_TSX_CTRL)                       ? " TSX_CTRL"       : "");
 
     /* Compiled-in support which pertains to mitigations. */
-- 
2.11.0


