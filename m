Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9783139FD56
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jun 2021 19:14:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138777.256765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqfIz-0003Hm-Ia; Tue, 08 Jun 2021 17:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138777.256765; Tue, 08 Jun 2021 17:14:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqfIz-0003ER-FM; Tue, 08 Jun 2021 17:14:21 +0000
Received: by outflank-mailman (input) for mailman id 138777;
 Tue, 08 Jun 2021 17:14:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AOFJ=LC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lqfBR-0007tU-02
 for xen-devel@lists.xenproject.org; Tue, 08 Jun 2021 17:06:33 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c493c848-7ea8-4cf4-935c-541debdb2129;
 Tue, 08 Jun 2021 17:06:08 +0000 (UTC)
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
X-Inumbo-ID: c493c848-7ea8-4cf4-935c-541debdb2129
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623171968;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=p9D1XpGniGzTsG6kVwBc4O+31iz1OjOUWmwkSQYYvvs=;
  b=hGwpldey5Fuom+9gM277KYJZ1Y6RWlJQcgK2FGaUB/E0HttR1soEgaoT
   6ysPwideWdMWMGd1nNcIIm6Xb08jT+w4QZ43i4Djc0aDRC8TBK/nbRHmZ
   QLIpi9UI3U8Zat9GGU+nSejVtqObimcBVx6p33EjBXITNbprmof2CXf+J
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Ba2iTYZSYIiQZ/d6bvpB67JeR74Ow2yl4hL8BGUPv3NXvrawaCciq1JKOWQ/7YSbmC6g3WhiSA
 vLx+3IVA1S0lkJNgWW5L28HD5YRXf7Tehv7FnCB97vzkht6PUNaPdCexeMFHeCS84fKcZ6R1UZ
 2T4bT6PONwx+Vtsm0hogGL3azopsTP12wNYR9zOSPUf8Mg6PO6iOvIoH2n3TQ61AYFdRzzu2cO
 Jn0fKRcvmOSHIkYuHWmyLsXMfva04T1EjmRHnCZKLXU/ZOVldeDzu7ZZHOZ9xH5qd9aYAxNzvx
 PDs=
X-SBRS: 5.1
X-MesageID: 45405893
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:sWxaMKrAVumozaHEN7YV6QIaV5oleYIsimQD101hICG8cqSj9v
 xG+85rsyMc6QxhP03I9urwW5VoLUmyyXcX2/h0AV7BZniFhILAFugLhuGOrwEIcxeOj9K1vp
 0BT0ERMrPN5CBB/KPH3DU=
X-IronPort-AV: E=Sophos;i="5.83,258,1616472000"; 
   d="scan'208";a="45405893"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/tsx: Cope with TSX deprecation on SKL/KBL/CFL/WHL
Date: Tue, 8 Jun 2021 18:05:59 +0100
Message-ID: <20210608170559.6732-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The June 2021 microcode is formally de-featuring TSX on the older Skylake
client CPUs.  The workaround from the March 2019 microcode is being dropped,
and replaced with additions to MSR_TSX_FORCE_ABORT to hide the HLE/RTM CPUID
bits.

With this microcode in place, TSX is disabled by default on these CPUs.
Backwards compatibility is provided in the same way as for TAA - RTM force
aborts, rather than suffering #UD, and the CPUID bits can be hidden to recover
performance.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 docs/misc/xen-command-line.pandoc           | 13 +++++
 tools/misc/xen-cpuid.c                      |  2 +-
 xen/arch/x86/tsx.c                          | 76 +++++++++++++++++++++++++++--
 xen/include/asm-x86/cpufeature.h            |  1 +
 xen/include/asm-x86/msr-index.h             |  2 +
 xen/include/public/arch-x86/cpufeatureset.h |  1 +
 6 files changed, 89 insertions(+), 6 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 1fae872626..3ece83a427 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2309,6 +2309,12 @@ Several microcode updates are relevant:
    and formally retiring HLE from the architecture.  The user can disable TSX
    to mitigate TAA, and elect to hide the HLE/RTM CPUID bits.
 
+ * June 2021, removing the workaround for March 2019 on client CPUs and
+   formally de-featured TSX on SKL/KBL/WHL/CFL (Note: SKX still retains the
+   March 2019 fix).  Introduced the ability to hide the HLE/RTM CPUID bits.
+   PCR3 works fine, and TSX is disabled by default, but the user can re-enable
+   TSX at their own risk, accepting that the memory order erratum is unfixed.
+
 On systems with the ability to configure TSX, this boolean offers system wide
 control of whether TSX is enabled or disabled.
 
@@ -2326,6 +2332,13 @@ control of whether TSX is enabled or disabled.
    ordering errata default to `true` to enable working TSX.  Alternatively,
    selecting `tsx=0` will disable TSX and restore PCR3 to a working state.
 
+   SKX and SKL/KBL/WHL/CFL on pre-June 2021 microcode default to `true`.
+   Alternatively, selecting `tsx=0` will disable TSX and restore PCR3 to a
+   working state.
+
+   SKL/KBL/WHL/CFL on the June 2021 microcode or later default to `false`.
+   Alternatively, selecting `tsx=1` will re-enable TSX at the users own risk.
+
 ### ucode
 > `= List of [ <integer> | scan=<bool>, nmi=<bool>, allow-same=<bool> ]`
 
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index d4bc83d8c9..735bcf8f0e 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -162,7 +162,7 @@ static const char *const str_7d0[32] =
     [ 4] = "fsrm",
 
     [ 8] = "avx512-vp2intersect", [ 9] = "srbds-ctrl",
-    [10] = "md-clear",
+    [10] = "md-clear",            [11] = "rtm-always-abort",
     /* 12 */                [13] = "tsx-force-abort",
     [14] = "serialize",
 
diff --git a/xen/arch/x86/tsx.c b/xen/arch/x86/tsx.c
index 338191df7f..085f1c82a7 100644
--- a/xen/arch/x86/tsx.c
+++ b/xen/arch/x86/tsx.c
@@ -60,6 +60,38 @@ void tsx_init(void)
              */
 
             /*
+             * Probe for the June 2021 microcode which de-features TSX on
+             * client parts.  (Note - this is a subset of parts impacted by
+             * the memory ordering errata.)
+             *
+             * RTM_ALWAYS_ABORT enumerates the new functionality, but is also
+             * read as zero if TSX_FORCE_ABORT.ENABLE_RTM has been set before
+             * we run.
+             *
+             * Undo this behaviour in Xen's view of the world.
+             */
+            bool has_rtm_always_abort = cpu_has_rtm_always_abort;
+
+            if ( !has_rtm_always_abort )
+            {
+                uint64_t val;
+
+                rdmsrl(MSR_TSX_FORCE_ABORT, val);
+
+                if ( val & TSX_ENABLE_RTM )
+                    has_rtm_always_abort = true;
+            }
+
+            /*
+             * Always force RTM_ALWAYS_ABORT to be visibile, even if it
+             * currently is.  If the user explicitly opts to enable TSX, we'll
+             * set TSX_FORCE_ABORT.ENABLE_RTM and hide RTM_ALWAYS_ABORT from
+             * the general CPUID scan later.
+             */
+            if ( has_rtm_always_abort )
+                setup_force_cpu_cap(X86_FEATURE_RTM_ALWAYS_ABORT);
+
+            /*
              * If no explicit tsx= option is provided, pick a default.
              *
              * This deliberately overrides the implicit opt_tsx=-3 from
@@ -67,9 +99,16 @@ void tsx_init(void)
              * - parse_spec_ctrl() ran before any CPU details where know.
              * - We now know we're running on a CPU not affected by TAA (as
              *   TSX_FORCE_ABORT is enumerated).
+             * - When RTM_ALWAYS_ABORT is enumerated, TSX malfunctions, so we
+             *   only ever want it enabled by explicit user choice.
+             *
+             * Without RTM_ALWAYS_ABORT, leave TSX active.  In particular,
+             * this includes SKX where TSX is still supported.
+             *
+             * With RTM_ALWAYS_ABORT, disable TSX.
              */
             if ( opt_tsx < 0 )
-                opt_tsx = 1;
+                opt_tsx = !cpu_has_rtm_always_abort;
         }
 
         /*
@@ -90,7 +129,7 @@ void tsx_init(void)
          * Force the features to be visible in Xen's view if we see any of the
          * infrastructure capable of hiding them.
          */
-        if ( cpu_has_tsx_ctrl )
+        if ( cpu_has_tsx_ctrl || cpu_has_tsx_force_abort )
         {
             setup_force_cpu_cap(X86_FEATURE_HLE);
             setup_force_cpu_cap(X86_FEATURE_RTM);
@@ -131,9 +170,36 @@ void tsx_init(void)
         /* Check bottom bit only.  Higher bits are various sentinels. */
         rtm_disabled = !(opt_tsx & 1);
 
-        lo &= ~TSX_FORCE_ABORT_RTM;
-        if ( rtm_disabled )
-            lo |= TSX_FORCE_ABORT_RTM;
+        lo &= ~(TSX_FORCE_ABORT_RTM | TSX_CPUID_CLEAR | TSX_ENABLE_RTM);
+
+        if ( cpu_has_rtm_always_abort )
+        {
+            /*
+             * June 2021 microcode, on a client part with TSX de-featured:
+             *  - There are no mitigations for the TSX memory ordering errata.
+             *  - Performance counter 3 works.  (I.e. it isn't being used by
+             *    microcode to work around the memory ordering errata.)
+             *  - TSX_FORCE_ABORT.FORCE_ABORT_RTM is fixed read1/write-discard.
+             *  - TSX_FORCE_ABORT.TSX_CPUID_CLEAR can be used to hide the
+             *    HLE/RTM CPUID bits.
+             *  - TSX_FORCE_ABORT.ENABLE_RTM may be used to opt in to
+             *    re-enabling RTM, at the users own risk.
+             */
+            lo |= rtm_disabled ? TSX_CPUID_CLEAR : TSX_ENABLE_RTM;
+        }
+        else
+        {
+            /*
+             * Either a server part where TSX isn't de-featured, or pre-June
+             * 2021 microcode:
+             *  - By default, the TSX memory ordering errata is worked around
+             *    in microcode at the cost of Performance Counter 3.
+             *  - "Working TSX" vs "Working PCR3" can be selected by way of
+             *    setting TSX_FORCE_ABORT.FORCE_ABORT_RTM.
+             */
+            if ( rtm_disabled )
+                lo |= TSX_FORCE_ABORT_RTM;
+        }
 
         wrmsr(MSR_TSX_FORCE_ABORT, lo, hi);
     }
diff --git a/xen/include/asm-x86/cpufeature.h b/xen/include/asm-x86/cpufeature.h
index 9f5ae3aa0d..a539a4bacd 100644
--- a/xen/include/asm-x86/cpufeature.h
+++ b/xen/include/asm-x86/cpufeature.h
@@ -131,6 +131,7 @@
 #define cpu_has_avx512_4vnniw   boot_cpu_has(X86_FEATURE_AVX512_4VNNIW)
 #define cpu_has_avx512_4fmaps   boot_cpu_has(X86_FEATURE_AVX512_4FMAPS)
 #define cpu_has_avx512_vp2intersect boot_cpu_has(X86_FEATURE_AVX512_VP2INTERSECT)
+#define cpu_has_rtm_always_abort boot_cpu_has(X86_FEATURE_RTM_ALWAYS_ABORT)
 #define cpu_has_tsx_force_abort boot_cpu_has(X86_FEATURE_TSX_FORCE_ABORT)
 #define cpu_has_serialize       boot_cpu_has(X86_FEATURE_SERIALIZE)
 #define cpu_has_arch_caps       boot_cpu_has(X86_FEATURE_ARCH_CAPS)
diff --git a/xen/include/asm-x86/msr-index.h b/xen/include/asm-x86/msr-index.h
index bd3a3a1e7f..9a772c12b8 100644
--- a/xen/include/asm-x86/msr-index.h
+++ b/xen/include/asm-x86/msr-index.h
@@ -61,6 +61,8 @@
 
 #define MSR_TSX_FORCE_ABORT                 0x0000010f
 #define  TSX_FORCE_ABORT_RTM                (_AC(1, ULL) <<  0)
+#define  TSX_CPUID_CLEAR                    (_AC(1, ULL) <<  1)
+#define  TSX_ENABLE_RTM                     (_AC(1, ULL) <<  2)
 
 #define MSR_TSX_CTRL                        0x00000122
 #define  TSX_CTRL_RTM_DISABLE               (_AC(1, ULL) <<  0)
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index b65af42436..380b51b1b3 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -265,6 +265,7 @@ XEN_CPUFEATURE(FSRM,          9*32+ 4) /*A  Fast Short REP MOVS */
 XEN_CPUFEATURE(AVX512_VP2INTERSECT, 9*32+8) /*a  VP2INTERSECT{D,Q} insns */
 XEN_CPUFEATURE(SRBDS_CTRL,    9*32+ 9) /*   MSR_MCU_OPT_CTRL and RNGDS_MITG_DIS. */
 XEN_CPUFEATURE(MD_CLEAR,      9*32+10) /*A  VERW clears microarchitectural buffers */
+XEN_CPUFEATURE(RTM_ALWAYS_ABORT, 9*32+11) /*! June 2021 TSX defeaturing in microcode. */
 XEN_CPUFEATURE(TSX_FORCE_ABORT, 9*32+13) /* MSR_TSX_FORCE_ABORT.RTM_ABORT */
 XEN_CPUFEATURE(SERIALIZE,     9*32+14) /*a  SERIALIZE insn */
 XEN_CPUFEATURE(CET_IBT,       9*32+20) /*   CET - Indirect Branch Tracking */
-- 
2.11.0


