Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3AA402CBF
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 18:19:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181207.328257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNdof-0002Bp-5l; Tue, 07 Sep 2021 16:19:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181207.328257; Tue, 07 Sep 2021 16:19:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNdof-00029P-2W; Tue, 07 Sep 2021 16:19:21 +0000
Received: by outflank-mailman (input) for mailman id 181207;
 Tue, 07 Sep 2021 16:19:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JcTc=N5=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mNdod-00029H-Dl
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 16:19:19 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 59a4fa94-0ff7-11ec-b110-12813bfff9fa;
 Tue, 07 Sep 2021 16:19:18 +0000 (UTC)
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
X-Inumbo-ID: 59a4fa94-0ff7-11ec-b110-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631031557;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bHhckMg4yqxP26r9jo3gv+1xllUSkTSk4o7gtf2dNXg=;
  b=I69MU90t1NVuh+/UcjLzymYbVwJdGWCnWaEx8qa+NEbRrxBTY3X8A/Gc
   ALc0bfRlkHOer5v8EWyhcJ3m+rz1/KaypHc7HNtSwUellrlL0mTfc9zN/
   Yf8y3vOSkKEadFs22Gv7CH75zzDYw9Qjo4eBVfzYB2wjB10vWc5rKAr1H
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 02+NUHQjLy+r/Kth1Kj2Zv6IvEIOeDUblDTTcOILZr3KkXssJY5oQY7q9+dyRxNfkj3Sdn6FXI
 QvbS1QIO4eWY5zQB7N6bm+ZaZcDs5apycj50VoNc41GgvdMr6gXJc2pZtNIYGS5yxR8iFQhNBq
 3iNUdh+GskCs/rkYdjZxanqsSt7L7oCphq8lY3PPoOYentAC0nOP44xzBqyD7P2xI57V7dsTVU
 RiP3JGaNic5+nm/yLld7USxCH34rAPzxTEFWOrpsyIYLS+/T1An5eG/a06UcyJv3W2IdVQ4fmy
 Nhb6IwibL1yWYonkAQe3XS7R
X-SBRS: 5.1
X-MesageID: 51777373
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:R1n+Dq7uy66rA6ji8wPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HWoB17726TtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QC5SWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.85,274,1624334400"; 
   d="scan'208";a="51777373"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 3/3] x86/amd: Use newer SSBD mechanisms if they exist
Date: Tue, 7 Sep 2021 17:19:08 +0100
Message-ID: <20210907161908.17402-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210817143006.2821-4-andrew.cooper3@citrix.com>
References: <20210817143006.2821-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The opencoded legacy Memory Disambiguation logic in init_amd() neglected
Fam19h for the Zen3 microarchitecture.  In practice, all Zen2 based system
have the architectural MSR_SPEC_CTRL and the SSBD bit within it.

Implement the algorithm given in AMD's SSBD whitepaper, and leave a
printk_once() behind in the case that no controls can be found.

This now means that a user explicitly choosing `spec-ctrl=ssbd` will properly
turn off Memory Disambiguation on Fam19h/Zen3 systems.

This still remains a single system-wide setting (for now), and is not context
switched between vCPUs.  As such, it doesn't interact with Intel's use of
MSR_SPEC_CTRL and default_xen_spec_ctrl (yet).

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wei.liu2@citrix.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Fix whitespace style in amd_init_ssbd()
 * Rewrite commit message with the correct command line syntax
---
 xen/arch/x86/cpu/amd.c   | 69 +++++++++++++++++++++++++++++++++++-------------
 xen/arch/x86/cpu/cpu.h   |  1 +
 xen/arch/x86/cpu/hygon.c | 10 +------
 xen/arch/x86/spec_ctrl.c |  5 +++-
 4 files changed, 57 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 2260eef3aab5..3f6a8e6aa3b9 100644
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
+			    if (opt_ssbd)
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
index c310a7f6ac96..f0c67d41b85f 100644
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


