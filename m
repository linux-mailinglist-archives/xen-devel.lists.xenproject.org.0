Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D09B135C968
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 17:07:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109270.208575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVy9X-0003UM-5z; Mon, 12 Apr 2021 15:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109270.208575; Mon, 12 Apr 2021 15:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVy9X-0003Tx-2q; Mon, 12 Apr 2021 15:07:03 +0000
Received: by outflank-mailman (input) for mailman id 109270;
 Mon, 12 Apr 2021 15:07:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lFJS=JJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lVy9V-0003Ts-BP
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 15:07:01 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c4e29241-7a21-44ad-9e89-74432eb63413;
 Mon, 12 Apr 2021 15:06:59 +0000 (UTC)
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
X-Inumbo-ID: c4e29241-7a21-44ad-9e89-74432eb63413
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618240019;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=J8KUvwpSCGhcc3uERoRMi4Y05lThLZU10/kqpSRmeOQ=;
  b=cLkpZEy1wwM0/gUp0jb4z5Bw9nl1JJpEs7WmrFSnMj1jYbP+qKVMkJXZ
   g3tJPcPK/xVOQF3mwD7tVZ360U5TGhJT/pJekfqT1m98Vc2c059Ujc3YS
   UDlRJTIAe7sp3Sx6KQmGzSWiKdI5fAa8S1Kehi2MkoqqC0CmdtSxaMvHh
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: SqfyucxhZ8QZ8MpJaAe7YGKvUH1cahdaYbfR0jOBrbB5S92F2wn2pQ4YcewrZx8rwNzd16l24n
 hlVevdwo3p/lMpjaolewZQXUm271oe6ABl9fQb7HTW6U3o1eJcV+Hr3pZF5RPQV4YZc3uQcVNK
 KD3+JAVeOXX8jaQWjksIvNmlc1QdDF/JFx2dELf+uveid0cfpdfXPX6uf3lsHQ2HlxBpUOVb6y
 An5PuwB5lr76yM0O6N6HBEGNsIQIx7Vg6zIjIJw28tGIp0qzYQKRYU4VFnLuSJilX8DJ8kuSya
 Gek=
X-SBRS: 4.0
X-MesageID: 41784965
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:zijMX6tZhPxxCtgkmbqJJTY87skDkNV00zAX/kB9WHVpW+az/v
 rOoN0w0xjohDENHEw6kdebN6WaBV/a/5h54Y4eVI3SOjXOkm2uMY1k8M/e0yTtcheOkdJ1+K
 98f8FFeb7NJHdgi8KS2maFOvIB5PXCz6yyn+fZyB5WPGVXQoVt9R1wBAreMmAefnglObMDGJ
 CR5tVKqlObEBx9BKnWOlA/U/XevNqOrZr6YHc9dmcawTOThjCl4qOSKXil9yoZOgkg/Z4StU
 zMkwn0/cyYwpSG9iM=
X-IronPort-AV: E=Sophos;i="5.82,216,1613451600"; 
   d="scan'208";a="41784965"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2] x86/cpuid: Advertise no-lmsl unilaterally to hvm guests
Date: Mon, 12 Apr 2021 16:06:41 +0100
Message-ID: <20210412150641.24450-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

While part of the original AMD64 spec, Long Mode Segment Limit was a feature
not picked up by Intel, and therefore didn't see much adoption in software.
AMD have finally dropped the feature from hardware, and allocated a CPUID bit
to indicate its absence.

Xen has never supported the feature for guests, even when running on capable
hardware, so advertise the feature's absence unilaterally.

There is nothing specifically wrong with exposing this bit to PV guests, but
the PV ABI doesn't include a working concept of MSR_EFER in the first place,
so exposing it to PV guests would be out-of-place.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Discuss PV guests in the commit message.
 * Add a dependency on LM.
 * s/lmsle/lmsl/
---
 tools/libs/light/libxl_cpuid.c              | 1 +
 tools/misc/xen-cpuid.c                      | 1 +
 xen/arch/x86/cpuid.c                        | 6 ++++++
 xen/include/public/arch-x86/cpufeatureset.h | 1 +
 xen/tools/gen-cpuid.py                      | 4 +++-
 5 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 289c59c742..aee28b0430 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -270,6 +270,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
         {"rstr-fp-err-ptrs", 0x80000008, NA, CPUID_REG_EBX, 2, 1},
         {"wbnoinvd",     0x80000008, NA, CPUID_REG_EBX,  9,  1},
         {"ibpb",         0x80000008, NA, CPUID_REG_EBX, 12,  1},
+        {"no-lmsl",      0x80000008, NA, CPUID_REG_EBX, 20,  1},
         {"ppin",         0x80000008, NA, CPUID_REG_EBX, 23,  1},
 
         {"nc",           0x80000008, NA, CPUID_REG_ECX,  0,  8},
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 2d04162d8d..628e8f5aa2 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -152,6 +152,7 @@ static const char *const str_e8b[32] =
 
     [12] = "ibpb",
 
+    [20] = "no-lmsl",
     /* [22] */                 [23] = "ppin",
 };
 
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 18b08d9b87..050cd5713e 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -456,6 +456,12 @@ static void __init calculate_hvm_max_policy(void)
     __set_bit(X86_FEATURE_X2APIC, hvm_featureset);
 
     /*
+     * We don't support EFER.LMSLE at all.  AMD has dropped the feature from
+     * hardware and allocated a CPUID bit to indicate its absence.
+     */
+    __set_bit(X86_FEATURE_NO_LMSL, hvm_featureset);
+
+    /*
      * On AMD, PV guests are entirely unable to use SYSENTER as Xen runs in
      * long mode (and init_amd() has cleared it out of host capabilities), but
      * HVM guests are able if running in protected mode.
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index a501479820..42bc8d4279 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -255,6 +255,7 @@ XEN_CPUFEATURE(CLZERO,        8*32+ 0) /*A  CLZERO instruction */
 XEN_CPUFEATURE(RSTR_FP_ERR_PTRS, 8*32+ 2) /*A  (F)X{SAVE,RSTOR} always saves/restores FPU Error pointers */
 XEN_CPUFEATURE(WBNOINVD,      8*32+ 9) /*   WBNOINVD instruction */
 XEN_CPUFEATURE(IBPB,          8*32+12) /*A  IBPB support only (no IBRS, used by AMD) */
+XEN_CPUFEATURE(NO_LMSL,       8*32+20) /*S  EFER.LMSLE no longer supported. */
 XEN_CPUFEATURE(AMD_PPIN,      8*32+23) /*   Protected Processor Inventory Number */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:0.edx, word 9 */
diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index 36f67750e5..b953648b65 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -242,7 +242,9 @@ def crunch_numbers(state):
         # CX16 is only encodable in Long Mode.  LAHF_LM indicates that the
         # SAHF/LAHF instructions are reintroduced in Long Mode.  1GB
         # superpages, PCID and PKU are only available in 4 level paging.
-        LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU],
+        # NO_LMSL indicates the absense of Long Mode Segment Limits, which
+        # have been dropped in hardware.
+        LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL],
 
         # AMD K6-2+ and K6-III processors shipped with 3DNow+, beyond the
         # standard 3DNow in the earlier K6 processors.
-- 
2.11.0


