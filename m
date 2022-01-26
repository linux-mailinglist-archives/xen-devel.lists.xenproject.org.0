Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 118AB49C57A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 09:45:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260721.450737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCdvd-0002Cy-4f; Wed, 26 Jan 2022 08:45:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260721.450737; Wed, 26 Jan 2022 08:45:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCdvc-00025r-JY; Wed, 26 Jan 2022 08:45:20 +0000
Received: by outflank-mailman (input) for mailman id 260721;
 Wed, 26 Jan 2022 08:45:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DU/T=SK=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nCdvZ-000088-BG
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 08:45:17 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47079ba9-7e84-11ec-8eb8-a37418f5ba1a;
 Wed, 26 Jan 2022 09:45:15 +0100 (CET)
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
X-Inumbo-ID: 47079ba9-7e84-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643186715;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a0Fglvy67xpQkp55jOY0hwXLJAWEyKSc9I0P5NSH1Gg=;
  b=MiDEGdMiSm69EHxI/5uqfAybdhoq+h5m31NK7T2cH3JFVga8fFCEWNrs
   xFQZLm93jivBv/kP+vDbme1uBvlkFJdcUeSAdg1z6Dvd1Qdm1Fxee2+cW
   nLoRgX3ZTQzH2NyGrvEY8q54qLrXsi8S5Ui+J2igf5S5dmUJXJ1SYMQAD
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: MJqODNEkvyfIXTBXrx+8YsdhBhbrtmynfikPZc8PZB1bPzf5VIotscMwrVN4zJx329A90fWNsz
 cIBnCK1uGLu+RSifgiQ1/WOeOEwGW45exdk4IJTq3ytZrdn0gRsDpjZagOPKwjk+0zGqK6VKMj
 qqP9NkqrtARUy535/x2vXwhpODd9K6UMlhnT5d9zIt6LslgegTpWCxapJRl3sHvnVmV1NDiiRg
 VLYoziFp0PdZ6qNvbluMVfmC9v2DI6efvRgkws+6NyG7gI44RKTxnf7gN26FQ6wJyz5xayUVCE
 1+2Fc/4sM7jFLCX7Hs7ezwMw
X-SBRS: 5.2
X-MesageID: 63189687
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:gMS+5aMLOp0Tk+fvrR1xkMFynXyQoLVcMsEvi/4bfWQNrUol0jcGx
 mEaXm3TPvzZZWWheYxyadu+/EIA6JOAmNBnHQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En150Eg9w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYo3aJkdxU0
 tphj8ShZCwAYLTQ2+8lfgYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgmxp1pEQTam2i
 8wxOCtwTDPCeBdzJWgwENEbkMyTj36vfGgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m66j
 G/b+2XyAjkBKceSjzGC9xqEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlbHvhAQfsBfP9di+Sym4/TN/0WSPkUbG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnE447eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl8oDGJGT9bxgbQ+0RqmBNzIJrVml
 CNc8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9IdsJu2wgeBs0YplsldrVj
 Kn741I5CHh7ZyPCUEOKS9jpV5RCIVbISLwJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2mHxW7T6NFPjTkkT2uZLDNSX9YepUbzOzghURsfnsTPP9q
 YgPbqNnCnx3DYXDX8Ug2ddDdA9RdSliW8meRg4+XrfrHzeK0VoJU5f5qY7NsaQ/90iMvuuXr
 Hy7RGFCz1/z2S/OJQmQMygxY7LzR5dv63k8OHV0b1qv3nEiZ6ep7bseKMRrLeV2qrQ7wK4mV
 eQBduWBHu9LFmbN9QMCYMSvt4dlbhmq216DZnL3fDglcpd8bAXV4du4LBD3/SwDA3Pv58szq
 rGtzC3BRp8HS1gwBcracqv3nViwoWIciKR5WE6Reotff0Dl8Y5LLS3tj6Bof5FQeEubnjbDj
 lSYGxYVo+XJsrQZytiRiPDWtZqtHst/AlFeQzvR44GpOHSI5WGk24JBDrqFJGiPSGPu9ay+T
 uxJ1PWgYuYflVNHvocgQbZmyaUyu4nmq7NAl1k2GXzKaxKgC696I2nA1s5K7/UfyrhcsAqwe
 0SO5tgFZunZZJK7SAYcdFg/c+CO9fAIgT2Dv/06LXLz6DJz4LfaA15ZOAOBiXAFIbZ4WG//L
 TzNZCLCB9SDtycX
IronPort-HdrOrdr: A9a23:UjvXPquNl1N0tKkqP9KLD+eN7skDTNV00zEX/kB9WHVpmszxra
 GTdZMgpGfJYVcqKQgdcL+7Scq9qB/nmqKdpLNhWYtKPzOW3ldATrsSj7cKqgeIc0aVm4JgPO
 VbAs9D4bXLfCNHZK3BgDVQfexP/DD+ytHMudvj
X-IronPort-AV: E=Sophos;i="5.88,317,1635220800"; 
   d="scan'208";a="63189687"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 8/8] x86/cpuid: Enable MSR_SPEC_CTRL in SVM guests by default
Date: Wed, 26 Jan 2022 08:44:52 +0000
Message-ID: <20220126084452.28975-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220126084452.28975-1-andrew.cooper3@citrix.com>
References: <20220126084452.28975-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

With all other pieces in place, MSR_SPEC_CTRL is fully working for HVM guests.

Update the CPUID derivation logic (both PV and HVM to avoid losing subtle
changes), and explicitly enable the CPUID bits for HVM guests.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

Given the adjustment to calculate_pv_max_policy(), we could use 'A' rather
than 'S' which would avoid a second same-sized diff to cpufeatureset.h, but
it's also a bit misleading to say 'A' when the PV side won't engage at all
yet.
---
 xen/arch/x86/cpuid.c                        | 16 ++++++++++++----
 xen/include/public/arch-x86/cpufeatureset.h | 18 +++++++++---------
 xen/tools/gen-cpuid.py                      |  5 +++++
 3 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index b5af48324aef..64570148c165 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -433,6 +433,8 @@ static void __init guest_common_feature_adjustments(uint32_t *fs)
      */
     if ( test_bit(X86_FEATURE_IBRSB, fs) )
         __set_bit(X86_FEATURE_STIBP, fs);
+    if ( test_bit(X86_FEATURE_IBRS, fs) )
+        __set_bit(X86_FEATURE_AMD_STIBP, fs);
 
     /*
      * On hardware which supports IBRS/IBPB, we can offer IBPB independently
@@ -456,11 +458,14 @@ static void __init calculate_pv_max_policy(void)
         pv_featureset[i] &= pv_max_featuremask[i];
 
     /*
-     * If Xen isn't virtualising MSR_SPEC_CTRL for PV guests because of
-     * administrator choice, hide the feature.
+     * If Xen isn't virtualising MSR_SPEC_CTRL for HVM guests (functional
+     * availability, or admin choice), hide the feature.
      */
     if ( !boot_cpu_has(X86_FEATURE_SC_MSR_PV) )
+    {
         __clear_bit(X86_FEATURE_IBRSB, pv_featureset);
+        __clear_bit(X86_FEATURE_IBRS, pv_featureset);
+    }
 
     guest_common_feature_adjustments(pv_featureset);
 
@@ -530,11 +535,14 @@ static void __init calculate_hvm_max_policy(void)
         __set_bit(X86_FEATURE_SEP, hvm_featureset);
 
     /*
-     * If Xen isn't virtualising MSR_SPEC_CTRL for HVM guests because of
-     * administrator choice, hide the feature.
+     * If Xen isn't virtualising MSR_SPEC_CTRL for HVM guests (functional
+     * availability, or admin choice), hide the feature.
      */
     if ( !boot_cpu_has(X86_FEATURE_SC_MSR_HVM) )
+    {
         __clear_bit(X86_FEATURE_IBRSB, hvm_featureset);
+        __clear_bit(X86_FEATURE_IBRS, hvm_featureset);
+    }
 
     /*
      * With VT-x, some features are only supported by Xen if dedicated
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 0b399375566f..dfbf25b9acb3 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -256,18 +256,18 @@ XEN_CPUFEATURE(CLZERO,        8*32+ 0) /*A  CLZERO instruction */
 XEN_CPUFEATURE(RSTR_FP_ERR_PTRS, 8*32+ 2) /*A  (F)X{SAVE,RSTOR} always saves/restores FPU Error pointers */
 XEN_CPUFEATURE(WBNOINVD,      8*32+ 9) /*   WBNOINVD instruction */
 XEN_CPUFEATURE(IBPB,          8*32+12) /*A  IBPB support only (no IBRS, used by AMD) */
-XEN_CPUFEATURE(IBRS,          8*32+14) /*   MSR_SPEC_CTRL.IBRS */
-XEN_CPUFEATURE(AMD_STIBP,     8*32+15) /*   MSR_SPEC_CTRL.STIBP */
-XEN_CPUFEATURE(IBRS_ALWAYS,   8*32+16) /*   IBRS preferred always on */
-XEN_CPUFEATURE(STIBP_ALWAYS,  8*32+17) /*   STIBP preferred always on */
-XEN_CPUFEATURE(IBRS_FAST,     8*32+18) /*   IBRS preferred over software options */
-XEN_CPUFEATURE(IBRS_SAME_MODE, 8*32+19) /*   IBRS provides same-mode protection */
+XEN_CPUFEATURE(IBRS,          8*32+14) /*S  MSR_SPEC_CTRL.IBRS */
+XEN_CPUFEATURE(AMD_STIBP,     8*32+15) /*S  MSR_SPEC_CTRL.STIBP */
+XEN_CPUFEATURE(IBRS_ALWAYS,   8*32+16) /*S  IBRS preferred always on */
+XEN_CPUFEATURE(STIBP_ALWAYS,  8*32+17) /*S  STIBP preferred always on */
+XEN_CPUFEATURE(IBRS_FAST,     8*32+18) /*S  IBRS preferred over software options */
+XEN_CPUFEATURE(IBRS_SAME_MODE, 8*32+19) /*S  IBRS provides same-mode protection */
 XEN_CPUFEATURE(NO_LMSL,       8*32+20) /*S  EFER.LMSLE no longer supported. */
 XEN_CPUFEATURE(AMD_PPIN,      8*32+23) /*   Protected Processor Inventory Number */
-XEN_CPUFEATURE(AMD_SSBD,      8*32+24) /*   MSR_SPEC_CTRL.SSBD available */
+XEN_CPUFEATURE(AMD_SSBD,      8*32+24) /*S  MSR_SPEC_CTRL.SSBD available */
 XEN_CPUFEATURE(VIRT_SSBD,     8*32+25) /*   MSR_VIRT_SPEC_CTRL.SSBD */
-XEN_CPUFEATURE(SSB_NO,        8*32+26) /*   Hardware not vulnerable to SSB */
-XEN_CPUFEATURE(PSFD,          8*32+28) /*   MSR_SPEC_CTRL.PSFD */
+XEN_CPUFEATURE(SSB_NO,        8*32+26) /*S  Hardware not vulnerable to SSB */
+XEN_CPUFEATURE(PSFD,          8*32+28) /*S  MSR_SPEC_CTRL.PSFD */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:0.edx, word 9 */
 XEN_CPUFEATURE(AVX512_4VNNIW, 9*32+ 2) /*A  AVX512 Neural Network Instructions */
diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index b953648b6572..e4915b5961aa 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -290,6 +290,11 @@ def crunch_numbers(state):
 
         # In principle the TSXLDTRK insns could also be considered independent.
         RTM: [TSXLDTRK],
+
+        # AMD speculative controls
+        IBRS: [AMD_STIBP, AMD_SSBD, PSFD,
+               IBRS_ALWAYS, IBRS_FAST, IBRS_SAME_MODE],
+        AMD_STIBP: [STIBP_ALWAYS],
     }
 
     deep_features = tuple(sorted(deps.keys()))
-- 
2.11.0


