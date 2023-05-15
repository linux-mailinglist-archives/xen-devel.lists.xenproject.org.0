Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BB470304C
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 16:43:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534776.832119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyZPq-0000EV-5h; Mon, 15 May 2023 14:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534776.832119; Mon, 15 May 2023 14:43:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyZPq-0000Ck-0P; Mon, 15 May 2023 14:43:10 +0000
Received: by outflank-mailman (input) for mailman id 534776;
 Mon, 15 May 2023 14:43:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uWdz=BE=citrix.com=prvs=492993889=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pyZPo-0000CT-7R
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 14:43:08 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc62e9d9-f32e-11ed-b229-6b7b168915f2;
 Mon, 15 May 2023 16:43:05 +0200 (CEST)
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
X-Inumbo-ID: cc62e9d9-f32e-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684161785;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hdj4U+pjxuDMgcyNg1EIZzudfZrVmDvOhSwPysOSv2Q=;
  b=XOlEqfhB8CBcu5aalFX6QukLzEIFyx3lpnGS/STph0molDoWg0uO7LMB
   wJFr/srSlmLNwwlefcZezt24vCWQ+ldD73r6vUKpcIpxCe8DHvWHe8gdz
   x2g+ATFudrZIMIr2bNu61Y1UApte/Ky0zEjdmBkGulVT1352r/pfwwQix
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 108969382
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:ABMLR6zXuSKm1d3KBtx6t+c/xirEfRIJ4+MujC+fZmUNrF6WrkVVy
 mYfXWjXaKqNYzehfN5xboqw9EtU6J6Dz9VlSQVr+CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UIHUMja4mtC5QRjPK0T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXpV2
 r82cS8vUk6kucGa3qC7UMJMg+12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZwNzhfG9
 zmWpQwVBDk6C/W95iis6UmRh8n2kT7ECNMWS52Ro6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0efBdDuk74wGl0bfP7kCSAW1sZiFFQMwrsokxXzNC6
 7OSt4q3X3o16uTTEC/DsO7O9lteJBT5M0cZfgBHY1IaweW9h78QogzdTsxIMKuc24id9S7L/
 xiGqy03hrM2hMEN1rmm8V2vvw9AtqQlXSZuuFyJAzvNAhdRIdf8Otf2sQSzAeNodt7xc7WXg
 JQTdyFyBsgqBIrFqiGCSf5l8FqBt6fca220bbKC8vAcG9WRF5yLJ9o4DNJWfh0B3iM4ldjBP
 ifuVft5vsM7AZdTRfYfj3iNI8or17P8Mt/uS+rZaNFDCrAoKl/bpHE/PxHLjzu1+KTJrU3YE
 cbzTCpRJSxCVfQPIMSeHY/xLoPHNghhnDiOFPgXPjys0KaEZW79dIrpxGCmN7hjhIvd+VW9z
 jqqH5fSo/mpeLGkM3a/HE96BQxiEEXX8ris9p0GK7DZc1Y+cIzjYteIqY4cl0Vet/w9vo/1E
 ruVBye0FHKXaaX7FDi3
IronPort-HdrOrdr: A9a23:zwjuKaoFE+xkGG4B+kZz5ggaV5pFeYIsimQD101hICG9E/b4qy
 nApp8mPHPP4gr5O0tPpTnjAsW9qBrnnPZICOIqUotKMjOKhFeV
X-Talos-CUID: =?us-ascii?q?9a23=3AGtx3GGmQ3u8TWWJ7mAkFNG3DgjbXOWbG4zT+elC?=
 =?us-ascii?q?aNThOdp65V02Q4ohEluM7zg=3D=3D?=
X-Talos-MUID: 9a23:enawMgnx4pXPe7X2UOnednpCC+5KzLaHE3swkLM/t9S7ZX10ZBe02WE=
X-IronPort-AV: E=Sophos;i="5.99,276,1677560400"; 
   d="scan'208";a="108969382"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 4/6] x86/cpu-policy: MSR_ARCH_CAPS feature names
Date: Mon, 15 May 2023 15:42:57 +0100
Message-ID: <20230515144259.1009245-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
References: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Seed the default visibility from the dom0 special case, which for the most
part just exposes the *_NO bits.  Insert a block dependency from the ARCH_CAPS
CPUID bit to the entire content of the MSR.

The overall CPUID bit is still max-only, so all of MSR_ARCH_CAPS is hidden in
the default policies.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

There is no libxl logic because libxl still uses the older xend format which
is specific to CPUID data.  That is going to need untangling at some other
point.
---
 tools/misc/xen-cpuid.c                      | 13 ++++++++++++
 xen/include/public/arch-x86/cpufeatureset.h | 23 +++++++++++++++++++++
 xen/tools/gen-cpuid.py                      |  3 +++
 3 files changed, 39 insertions(+)

diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 258584aafb9f..5b717f3f0091 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -228,6 +228,19 @@ static const char *const str_7d2[32] =
 
 static const char *const str_10Al[32] =
 {
+    [ 0] = "rdcl-no",             [ 1] = "eibrs",
+    [ 2] = "rsba",                [ 3] = "skip-l1dfl",
+    [ 4] = "intel-ssb-no",        [ 5] = "mds-no",
+    [ 6] = "if-pschange-mc-no",   [ 7] = "tsx-ctrl",
+    [ 8] = "taa-no",              [ 9] = "mcu-ctrl",
+    [10] = "misc-pkg-ctrl",       [11] = "energy-ctrl",
+    [12] = "doitm",               [13] = "sbdr-ssdp-no",
+    [14] = "fbsdp-no",            [15] = "psdp-no",
+    /* 16 */                      [17] = "fb-clear",
+    [18] = "fb-clear-ctrl",       [19] = "rrsba",
+    [20] = "bhi-no",              [21] = "xapic-status",
+    /* 22 */                      [23] = "ovrclk-status",
+    [24] = "pbrsb-no",
 };
 
 static const char *const str_10Ah[32] =
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 032cec3ccba2..3cfdc71df92b 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -308,6 +308,29 @@ XEN_CPUFEATURE(AVX_NE_CONVERT,     15*32+ 5) /*A  AVX-NE-CONVERT Instructions */
 XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks safe to use */
 
 /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.eax, word 16 */
+XEN_CPUFEATURE(RDCL_NO,            16*32+ 0) /*A  No Rogue Data Cache Load (Meltdown) */
+XEN_CPUFEATURE(EIBRS,              16*32+ 1) /*A  Enhanced IBRS */
+XEN_CPUFEATURE(RSBA,               16*32+ 2) /*!A RSB Alternative (Retpoline not safe) */
+XEN_CPUFEATURE(SKIP_L1DFL,         16*32+ 3) /*A  Don't need to flush L1D on VMEntry */
+XEN_CPUFEATURE(INTEL_SSB_NO,       16*32+ 4) /*A  No Speculative Store Bypass */
+XEN_CPUFEATURE(MDS_NO,             16*32+ 5) /*A  No Microarchitectural Data Sampling */
+XEN_CPUFEATURE(IF_PSCHANGE_MC_NO,  16*32+ 6) /*A  No Instruction fetch #MC */
+XEN_CPUFEATURE(TSX_CTRL,           16*32+ 7) /*   MSR_TSX_CTRL */
+XEN_CPUFEATURE(TAA_NO,             16*32+ 8) /*A  No TSX Async Abort */
+XEN_CPUFEATURE(MCU_CTRL,           16*32+ 9) /*   MSR_MCU_CTRL */
+XEN_CPUFEATURE(MISC_PKG_CTRL,      16*32+10) /*   MSR_MISC_PKG_CTRL */
+XEN_CPUFEATURE(ENERGY_FILTERING,   16*32+11) /*   MSR_MISC_PKG_CTRL.ENERGY_FILTERING */
+XEN_CPUFEATURE(DOITM,              16*32+12) /*   Data Operand Invariant Timing Mode */
+XEN_CPUFEATURE(SBDR_SSBD_NO,       16*32+13) /*A  No Shared Buffer Data Read or Sideband Stale Data Propagation */
+XEN_CPUFEATURE(FBDSP_NO,           16*32+14) /*A  No Fill Buffer Stale Data Propagation */
+XEN_CPUFEATURE(PSDP_NO,            16*32+15) /*A  No Primary Stale Data Propagation */
+XEN_CPUFEATURE(FB_CLEAR,           16*32+17) /*A  Fill Buffers cleared by VERW */
+XEN_CPUFEATURE(FB_CLEAR_CTRL,      16*32+18) /*   MSR_OPT_CPU_CTRL.FB_CLEAR_DIS */
+XEN_CPUFEATURE(RRSBA,              16*32+19) /*!A Restricted RSB Alternative */
+XEN_CPUFEATURE(BHI_NO,             16*32+20) /*A  No Branch History Injection  */
+XEN_CPUFEATURE(XAPIC_STATUS,       16*32+21) /*   MSR_XAPIC_DISABLE_STATUS */
+XEN_CPUFEATURE(OVRCLK_STATUS,      16*32+23) /*   MSR_OVERCLOCKING_STATUS */
+XEN_CPUFEATURE(PBRSB_NO,           16*32+24) /*A  No Post-Barrier RSB predictions */
 
 /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.edx, word 17 */
 
diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index 86d00bb3c273..f28ff708a2fc 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -325,6 +325,9 @@ def crunch_numbers(state):
 
         # In principle the TSXLDTRK insns could also be considered independent.
         RTM: [TSXLDTRK],
+
+        # The ARCH_CAPS CPUID bit enumerates the availability of the whole register.
+        ARCH_CAPS: list(range(RDCL_NO, RDCL_NO + 64)),
     }
 
     deep_features = tuple(sorted(deps.keys()))
-- 
2.30.2


