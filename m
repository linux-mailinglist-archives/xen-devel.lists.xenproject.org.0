Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E10042C0D84
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 15:32:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34492.65596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCsv-0000NA-PJ; Mon, 23 Nov 2020 14:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34492.65596; Mon, 23 Nov 2020 14:32:05 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCsv-0000Mk-LW; Mon, 23 Nov 2020 14:32:05 +0000
Received: by outflank-mailman (input) for mailman id 34492;
 Mon, 23 Nov 2020 14:32:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khCsu-0000Ma-AR
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:32:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2efc230-2365-4696-8c19-d6b22003b213;
 Mon, 23 Nov 2020 14:32:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8CE42AC23;
 Mon, 23 Nov 2020 14:32:02 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khCsu-0000Ma-AR
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:32:04 +0000
X-Inumbo-ID: f2efc230-2365-4696-8c19-d6b22003b213
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f2efc230-2365-4696-8c19-d6b22003b213;
	Mon, 23 Nov 2020 14:32:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606141922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C/br/wr1vs+jHb0x3GkA7iy/FWtl0oeRJ/XrBSDPWX4=;
	b=RYldOfDTrJG4kDD9DBVRUMeZ15TD7Kb42zNBgJWfT7PiW5bCU8aKw8miOwPLVPiTT+pJhk
	gcvMOtZB6oOfEldfRSiLRmP0YivGRBCy50GMZmFhPJ0j3/zSWw99jSErv7x0p/YLJgQtzB
	YdWuIvZzK9QquxX0tZWsCoGKx1CqXNE=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8CE42AC23;
	Mon, 23 Nov 2020 14:32:02 +0000 (UTC)
Subject: [PATCH v2 10/17] x86/xstate: enable AMX components
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
Message-ID: <5490ecab-8fe1-aa46-95e0-4ad6c6318879@suse.com>
Date: Mon, 23 Nov 2020 15:32:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

These being controlled by XCR0, enabling support is relatively
straightforward. Note however that there won't be any use of them until
their dependent ISA extension CPUID flags get exposed, not the least due
to the way recalculate_xstate() handles the dependencies in kind of a
reverse manner.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -219,6 +219,9 @@ int libxl_cpuid_parse_config(libxl_cpuid
         {"md-clear",     0x00000007,  0, CPUID_REG_EDX, 10,  1},
         {"serialize",    0x00000007,  0, CPUID_REG_EDX, 14,  1},
         {"cet-ibt",      0x00000007,  0, CPUID_REG_EDX, 20,  1},
+        {"amx-bf16",     0x00000007,  0, CPUID_REG_EDX, 22,  1},
+        {"amx-tile",     0x00000007,  0, CPUID_REG_EDX, 24,  1},
+        {"amx-int8",     0x00000007,  0, CPUID_REG_EDX, 25,  1},
         {"ibrsb",        0x00000007,  0, CPUID_REG_EDX, 26,  1},
         {"stibp",        0x00000007,  0, CPUID_REG_EDX, 27,  1},
         {"l1d-flush",    0x00000007,  0, CPUID_REG_EDX, 28,  1},
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -167,7 +167,8 @@ static const char *const str_7d0[32] =
 
     [18] = "pconfig",
     [20] = "cet-ibt",
-
+    [22] = "amx-bf16",
+    [24] = "amx-tile",      [25] = "amx-int8",
     [26] = "ibrsb",         [27] = "stibp",
     [28] = "l1d-flush",     [29] = "arch-caps",
     [30] = "core-caps",     [31] = "ssbd",
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -195,6 +195,14 @@ static void recalculate_xstate(struct cp
                           xstate_size(X86_XCR0_PKRU_POS));
     }
 
+    if ( p->feat.amx_tile )
+    {
+        xstates |= X86_XCR0_TILECFG | X86_XCR0_TILEDATA;
+        xstate_size = max(xstate_size,
+                          xstate_offset(X86_XCR0_TILEDATA_POS) +
+                          xstate_size(X86_XCR0_TILEDATA_POS));
+    }
+
     p->xstate.max_size  =  xstate_size;
     p->xstate.xcr0_low  =  xstates & ~XSTATE_XSAVES_ONLY;
     p->xstate.xcr0_high = (xstates & ~XSTATE_XSAVES_ONLY) >> 32;
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -642,6 +642,10 @@ static bool valid_xcr0(uint64_t xcr0)
     if ( !(xcr0 & X86_XCR0_BNDREGS) != !(xcr0 & X86_XCR0_BNDCSR) )
         return false;
 
+    /* TILECFG and TILEDATA must be the same. */
+    if ( !(xcr0 & X86_XCR0_TILECFG) != !(xcr0 & X86_XCR0_TILEDATA) )
+        return false;
+
     return true;
 }
 
--- a/xen/include/asm-x86/x86-defns.h
+++ b/xen/include/asm-x86/x86-defns.h
@@ -96,6 +96,10 @@
 #define X86_XCR0_HI_ZMM           (1ULL << X86_XCR0_HI_ZMM_POS)
 #define X86_XCR0_PKRU_POS         9
 #define X86_XCR0_PKRU             (1ULL << X86_XCR0_PKRU_POS)
+#define X86_XCR0_TILECFG_POS      17
+#define X86_XCR0_TILECFG          (1ULL << X86_XCR0_TILECFG_POS)
+#define X86_XCR0_TILEDATA_POS     18
+#define X86_XCR0_TILEDATA         (1ULL << X86_XCR0_TILEDATA_POS)
 #define X86_XCR0_LWP_POS          62
 #define X86_XCR0_LWP              (1ULL << X86_XCR0_LWP_POS)
 
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -265,6 +265,9 @@ XEN_CPUFEATURE(MD_CLEAR,      9*32+10) /
 XEN_CPUFEATURE(TSX_FORCE_ABORT, 9*32+13) /* MSR_TSX_FORCE_ABORT.RTM_ABORT */
 XEN_CPUFEATURE(SERIALIZE,     9*32+14) /*a  SERIALIZE insn */
 XEN_CPUFEATURE(CET_IBT,       9*32+20) /*   CET - Indirect Branch Tracking */
+XEN_CPUFEATURE(AMX_BF16,      9*32+22) /*   AMX BFloat16 instructions */
+XEN_CPUFEATURE(AMX_TILE,      9*32+24) /*   AMX tile architecture */
+XEN_CPUFEATURE(AMX_INT8,      9*32+25) /*   AMX 8-bit integer instructions */
 XEN_CPUFEATURE(IBRSB,         9*32+26) /*A  IBRS and IBPB support (used by Intel) */
 XEN_CPUFEATURE(STIBP,         9*32+27) /*A  STIBP */
 XEN_CPUFEATURE(L1D_FLUSH,     9*32+28) /*S  MSR_FLUSH_CMD and L1D flush. */
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -222,7 +222,7 @@ def crunch_numbers(state):
         # instruction groups which are specified to require XSAVE for state
         # management.
         XSAVE: [XSAVEOPT, XSAVEC, XGETBV1, XSAVES,
-                AVX, MPX, PKU, LWP],
+                AVX, MPX, PKU, AMX_TILE, LWP],
 
         # AVX is taken to mean hardware support for 256bit registers (which in
         # practice depends on the VEX prefix to encode), and the instructions
@@ -288,6 +288,11 @@ def crunch_numbers(state):
 
         # In principle the TSXLDTRK insns could also be considered independent.
         RTM: [TSXLDTRK],
+
+        # AMX-TILE means hardware support for tile registers and general non-
+        # computational instructions.  All further AMX features are built on top
+        # of AMX-TILE.
+        AMX_TILE: [AMX_BF16, AMX_INT8],
     }
 
     deep_features = tuple(sorted(deps.keys()))


