Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A639B403B1F
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 16:01:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182067.329495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNy7U-0008S0-UH; Wed, 08 Sep 2021 14:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182067.329495; Wed, 08 Sep 2021 14:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNy7U-0008PI-Qv; Wed, 08 Sep 2021 14:00:08 +0000
Received: by outflank-mailman (input) for mailman id 182067;
 Wed, 08 Sep 2021 14:00:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hF9z=N6=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mNy7S-0008PC-Kd
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 14:00:06 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0613db5b-a467-40f5-863c-e88f1e595989;
 Wed, 08 Sep 2021 14:00:05 +0000 (UTC)
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
X-Inumbo-ID: 0613db5b-a467-40f5-863c-e88f1e595989
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631109605;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+YYk7/na8ZKjyFRiJk5MwAM2qU7Mj4JY+X17r6lSsPo=;
  b=HCq4xdLVMIoWP+pUo/6NWuFFVW6CTz7Y93rlT0Kg3Zvkw7ZmsKifVb2G
   Npi1VN6nn2Z3MdVRjJgskcDHIgBpF/7bcBaZEVXlpIYb0pgYfM/0Hmgcq
   kzBRukxPYSOD/uVz0HtLEY84akay+qmGRNMcHHperawOevAstt4/7BXvB
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: PljX3lcNJM/9o00BU7fNr85cO5dz7EjkwuLsH8Qt3mGGGm7WU6BNyWI+6EGqAKLZJY/zw06sLO
 CpJoELOi2qd0OqJiZ2YG0bmjHptKxxemfI+hf+k508+AVteRVP5NzFocCp5lbToJ4JZaSHTTAk
 IcE3vaP9dZqCKQ3dqxUSBSsX6p4GI3bK+wYRvUiUsfLMq608WGL/6X74jqAjxTC5sJulPp6KSC
 P0jH+U4sAd9IoMyUVbm6QOuq0S0dOG7l7PwxZiSXY7RoMDbRoau54bi3PwNSBQH13NzV4FA1yL
 rrLe5WOk9ehhTibK9pgDz7Jc
X-SBRS: 5.1
X-MesageID: 52271030
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:k72ItajlNszCTjTcBoe8ZjHSv3BQXtYji2hC6mlwRA09TySZ//
 rBoB19726StN9xYgBFpTnuAsm9qB/nmaKdgrNhWItKPjOW21dARbsKheCJrgEIcxeOkNK1vp
 0AT0ERMrLN5CBB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.85,278,1624334400"; 
   d="scan'208";a="52271030"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Pu Wen
	<puwen@hygon.cn>
Subject: [PATCH] x86/amd: Introduce and use X86_BUG_NULL_SEG
Date: Wed, 8 Sep 2021 14:59:31 +0100
Message-ID: <20210908135931.26275-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

AMD/Hygon processors before the Zen2 microarchitecture don't clear the base or
limit fields when loading a NULL segment.

Express the logic in terms of cpu_bug_null_seg, and adjust the workaround in
do_set_segment_base().

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Pu Wen <puwen@hygon.cn>

Since originally posted, most logic dependent on this workaround has been
reworked, but one still remains.  This form of the workaround is more flexible
if other impacted CPUs are discovered.
---
 xen/arch/x86/cpu/amd.c            | 7 +++++++
 xen/arch/x86/cpu/hygon.c          | 7 +++++++
 xen/arch/x86/pv/misc-hypercalls.c | 3 +--
 xen/include/asm-x86/cpufeature.h  | 1 +
 xen/include/asm-x86/cpufeatures.h | 1 +
 5 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index c4d84373a710..379ea1638ca6 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -801,6 +801,13 @@ static void init_amd(struct cpuinfo_x86 *c)
 	    c->x86 == 0x17)
 		detect_zen2_null_seg_behaviour();
 
+	/*
+	 * AMD CPUs before Zen2 don't clear segment bases/limits when loading
+	 * a NULL selector.
+	 */
+        if (c == &boot_cpu_data && !cpu_has_nscb)
+		setup_force_cpu_cap(X86_BUG_NULL_SEG);
+
 	/* MFENCE stops RDTSC speculation */
 	if (!cpu_has_lfence_dispatch)
 		__set_bit(X86_FEATURE_MFENCE_RDTSC, c->x86_capability);
diff --git a/xen/arch/x86/cpu/hygon.c b/xen/arch/x86/cpu/hygon.c
index 429d6601fc13..a2963036b389 100644
--- a/xen/arch/x86/cpu/hygon.c
+++ b/xen/arch/x86/cpu/hygon.c
@@ -40,6 +40,13 @@ static void init_hygon(struct cpuinfo_x86 *c)
 	    c->x86 == 0x18)
 		detect_zen2_null_seg_behaviour();
 
+	/*
+	 * Hygon CPUs before Zen2 don't clear segment bases/limits when
+	 * loading a NULL selector.
+	 */
+        if (c == &boot_cpu_data && !cpu_has_nscb)
+		setup_force_cpu_cap(X86_BUG_NULL_SEG);
+
 	/* MFENCE stops RDTSC speculation */
 	if (!cpu_has_lfence_dispatch)
 		__set_bit(X86_FEATURE_MFENCE_RDTSC, c->x86_capability);
diff --git a/xen/arch/x86/pv/misc-hypercalls.c b/xen/arch/x86/pv/misc-hypercalls.c
index 3a4e4aa4603e..5dade2472687 100644
--- a/xen/arch/x86/pv/misc-hypercalls.c
+++ b/xen/arch/x86/pv/misc-hypercalls.c
@@ -227,8 +227,7 @@ long do_set_segment_base(unsigned int which, unsigned long base)
         if ( sel > 3 )
             /* Fix up RPL for non-NUL selectors. */
             sel |= 3;
-        else if ( boot_cpu_data.x86_vendor &
-                  (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+        else if ( cpu_bug_null_seg )
             /* Work around NUL segment behaviour on AMD hardware. */
             asm volatile ( "mov %[sel], %%gs"
                            :: [sel] "r" (FLAT_USER_DS32) );
diff --git a/xen/include/asm-x86/cpufeature.h b/xen/include/asm-x86/cpufeature.h
index 94a485f99c22..802d9257b0bf 100644
--- a/xen/include/asm-x86/cpufeature.h
+++ b/xen/include/asm-x86/cpufeature.h
@@ -159,6 +159,7 @@
 
 /* Bugs. */
 #define cpu_bug_fpu_ptrs        boot_cpu_has(X86_BUG_FPU_PTRS)
+#define cpu_bug_null_seg        boot_cpu_has(X86_BUG_NULL_SEG)
 
 enum _cache_type {
     CACHE_TYPE_NULL = 0,
diff --git a/xen/include/asm-x86/cpufeatures.h b/xen/include/asm-x86/cpufeatures.h
index 6c8f432aee4f..72beb7babcce 100644
--- a/xen/include/asm-x86/cpufeatures.h
+++ b/xen/include/asm-x86/cpufeatures.h
@@ -45,6 +45,7 @@ XEN_CPUFEATURE(XEN_SHSTK,         X86_SYNTH(26)) /* Xen uses CET Shadow Stacks *
 #define X86_BUG(x) ((FSCAPINTS + X86_NR_SYNTH) * 32 + (x))
 
 #define X86_BUG_FPU_PTRS          X86_BUG( 0) /* (F)X{SAVE,RSTOR} doesn't save/restore FOP/FIP/FDP. */
+#define X86_BUG_NULL_SEG          X86_BUG( 1) /* NULL-ing a selector preserves the base and limit. */
 
 /* Total number of capability words, inc synth and bug words. */
 #define NCAPINTS (FSCAPINTS + X86_NR_SYNTH + X86_NR_BUG) /* N 32-bit words worth of info */
-- 
2.11.0


