Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E1E392F8C
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 15:25:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133375.248667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmG1B-0007Pn-A8; Thu, 27 May 2021 13:25:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133375.248667; Thu, 27 May 2021 13:25:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmG1B-0007Mu-5y; Thu, 27 May 2021 13:25:45 +0000
Received: by outflank-mailman (input) for mailman id 133375;
 Thu, 27 May 2021 13:25:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9d2D=KW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lmG19-0006Vp-Ai
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 13:25:43 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cf710b61-4d57-4556-b0a8-9d504384264d;
 Thu, 27 May 2021 13:25:34 +0000 (UTC)
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
X-Inumbo-ID: cf710b61-4d57-4556-b0a8-9d504384264d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1622121933;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hbSlZ0t4S9qZJpcVYcxxqV9AHueCrBm5p1+6QD2gkF4=;
  b=csYiggvlHewb61k3daWwtqDdhjw4KFDx9PFeGnnpHI6UfkzHLkd0UPOJ
   G0mQPlqcEXjzbPBZLxaKjIzWVUWO/fpssFFNyxb87fNQt+h1FcrQBXqFK
   kqi2XzBBTub5ShVWT4i/yaUoO0E2rn8hy+2ozVNlbq9ZDv3VkXEHRnV55
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ctaQJrHedHNfZbi6TXiP7BmYX0i1rU9TXyaIQ/8KlLN8FshKN2kUXpPMnC9bm7KSL/Pxc1gFpL
 /25S6z2vUk5qBFuqjpppiefS7ySJ6/FWs+0L0DcrRuKsMYY8XqO9nAbHvZHuoJBLq4EGG4p1gr
 Z6FLRC05zgQLO/7B5sVfZjDRlQOoZF6CFNuOFGTtjpBn5jfNPnfehX7hhfGpH0hNaYsQizx22v
 JXoJkfzWljgcev3I62BY2uGZhMpeLdSAeCZrvWYVBdafbJHC9vkbPYBn7Vp6J1jfa4fq4wwxnq
 Ptg=
X-SBRS: 5.1
X-MesageID: 44745603
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:VsOdxaGa6A9bvP6FpLqE0seALOsnbusQ8zAXP0AYc31om6uj5r
 iTdZUgpGbJYVkqKRIdcLy7V5VoBEmskaKdgrNhW4tKPjOW2ldARbsKheCJrlHd8m/Fh4lgPM
 9bAtND4bbLbWSS4/yV3ODBKadE/OW6
X-IronPort-AV: E=Sophos;i="5.82,334,1613451600"; 
   d="scan'208";a="44745603"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 3/3] x86/tsx: Deprecate vpmu=rtm-abort and use tsx=<bool> instead
Date: Thu, 27 May 2021 14:25:19 +0100
Message-ID: <20210527132519.21730-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210527132519.21730-1-andrew.cooper3@citrix.com>
References: <20210527132519.21730-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This reuses the rtm_disable infrastructure, so CPUID derivation works properly
when TSX is disabled in favour of working PCR3.

vpmu= is not a supported feature, and having this functionality under tsx=
centralises all TSX handling.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 docs/misc/xen-command-line.pandoc | 40 +++++++++++++++---------------
 xen/arch/x86/cpu/intel.c          |  3 ---
 xen/arch/x86/cpu/vpmu.c           |  4 +--
 xen/arch/x86/tsx.c                | 51 +++++++++++++++++++++++++++++++++++++--
 xen/include/asm-x86/vpmu.h        |  1 -
 5 files changed, 70 insertions(+), 29 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index c32a397a12..a6facc33ea 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2296,14 +2296,21 @@ pages) must also be specified via the tbuf_size parameter.
 
 Controls for the use of Transactional Synchronization eXtensions.
 
-On Intel parts released in Q3 2019 (with updated microcode), and future parts,
-a control has been introduced which allows TSX to be turned off.
+Several microcode updates are relevant:
 
-On systems with the ability to turn TSX off, this boolean offers system wide
-control of whether TSX is enabled or disabled.
+ * March 2019, fixing the TSX memory ordering errata on all TSX-enabled CPUs
+   to date.  Introduced MSR_TSX_FORCE_ABORT on SKL/SKX/KBL/WHL/CFL parts.  The
+   errata workaround uses Performance Counter 3, so the user can select
+   between working TSX and working perfcounters.
 
-On parts vulnerable to CVE-2019-11135 / TSX Asynchronous Abort, the following
-logic applies:
+ * November 2019, fixing the TSX Async Abort speculative vulnerability.
+   Introduced MSR_TSX_CTRL on all TSX-enabled MDS_NO parts to date,
+   CLX/WHL-R/CFL-R, with the controls becoming architectural moving forward
+   and formally retiring HLE from the architecture.  The user can disable TSX
+   to mitigate TAA, and elect to hide the HLE/RTM CPUID bits.
+
+On systems with the ability to disable TSX off, this boolean offers system
+wide control of whether TSX is enabled or disabled.
 
  * An explicit `tsx=` choice is honoured, even if it is `true` and would
    result in a vulnerable system.
@@ -2311,10 +2318,14 @@ logic applies:
  * When no explicit `tsx=` choice is given, parts vulnerable to TAA will be
    mitigated by disabling TSX, as this is the lowest overhead option.
 
- * If the use of TSX is important, the more expensive TAA mitigations can be
+   If the use of TSX is important, the more expensive TAA mitigations can be
    opted in to with `smt=0 spec-ctrl=md-clear`, at which point TSX will remain
    active by default.
 
+ * When no explicit `tsx=` option is given, parts susceptible to the memory
+   ordering errata default to `true` to enable working TSX.  Alternatively,
+   selecting `tsx=0` will disable TSX and restore PCR3 to a working state.
+
 ### ucode
 > `= List of [ <integer> | scan=<bool>, nmi=<bool>, allow-same=<bool> ]`
 
@@ -2456,20 +2467,7 @@ provide access to a wealth of low level processor information.
 
 *   The `arch` option allows access to the pre-defined architectural events.
 
-*   The `rtm-abort` boolean controls a trade-off between working Restricted
-    Transactional Memory, and working performance counters.
-
-    All processors released to date (Q1 2019) supporting Transactional Memory
-    Extensions suffer an erratum which has been addressed in microcode.
-
-    Processors based on the Skylake microarchitecture with up-to-date
-    microcode internally use performance counter 3 to work around the erratum.
-    A consequence is that the counter gets reprogrammed whenever an `XBEGIN`
-    instruction is executed.
-
-    An alternative mode exists where PCR3 behaves as before, at the cost of
-    `XBEGIN` unconditionally aborting.  Enabling `rtm-abort` mode will
-    activate this alternative mode.
+*   The `rtm-abort` boolean has been superseded.  Use `tsx=0` instead.
 
 *Warning:*
 As the virtualisation is not 100% safe, don't use the vpmu flag on
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 37439071d9..abf8e206d7 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -356,9 +356,6 @@ static void Intel_errata_workarounds(struct cpuinfo_x86 *c)
 	    (c->x86_model == 29 || c->x86_model == 46 || c->x86_model == 47))
 		__set_bit(X86_FEATURE_CLFLUSH_MONITOR, c->x86_capability);
 
-	if (cpu_has_tsx_force_abort && opt_rtm_abort)
-		wrmsrl(MSR_TSX_FORCE_ABORT, TSX_FORCE_ABORT_RTM);
-
 	probe_c3_errata(c);
 }
 
diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index d8659c63f8..16e91a3694 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -49,7 +49,6 @@ CHECK_pmu_params;
 static unsigned int __read_mostly opt_vpmu_enabled;
 unsigned int __read_mostly vpmu_mode = XENPMU_MODE_OFF;
 unsigned int __read_mostly vpmu_features = 0;
-bool __read_mostly opt_rtm_abort;
 
 static DEFINE_SPINLOCK(vpmu_lock);
 static unsigned vpmu_count;
@@ -79,7 +78,8 @@ static int __init parse_vpmu_params(const char *s)
         else if ( !cmdline_strcmp(s, "arch") )
             vpmu_features |= XENPMU_FEATURE_ARCH_ONLY;
         else if ( (val = parse_boolean("rtm-abort", s, ss)) >= 0 )
-            opt_rtm_abort = val;
+            printk(XENLOG_WARNING
+                   "'rtm-abort=<bool>' superseded.  Use 'tsx=<bool>' instead\n");
         else
             rc = -EINVAL;
 
diff --git a/xen/arch/x86/tsx.c b/xen/arch/x86/tsx.c
index 98ecb71a4a..338191df7f 100644
--- a/xen/arch/x86/tsx.c
+++ b/xen/arch/x86/tsx.c
@@ -6,7 +6,9 @@
  * Valid values:
  *   1 => Explicit tsx=1
  *   0 => Explicit tsx=0
- *  -1 => Default, implicit tsx=1, may change to 0 to mitigate TAA
+ *  -1 => Default, altered to 0/1 (if unspecified) by:
+ *                 - TAA heuristics/settings for speculative safety
+ *                 - "TSX vs PCR3" select for TSX memory ordering safety
  *  -3 => Implicit tsx=1 (feed-through from spec-ctrl=0)
  *
  * This is arranged such that the bottom bit encodes whether TSX is actually
@@ -50,6 +52,26 @@ void tsx_init(void)
 
         cpu_has_tsx_ctrl = !!(caps & ARCH_CAPS_TSX_CTRL);
 
+        if ( cpu_has_tsx_force_abort )
+        {
+            /*
+             * On an early TSX-enable Skylake part subject to the memory
+             * ordering erratum, with at least the March 2019 microcode.
+             */
+
+            /*
+             * If no explicit tsx= option is provided, pick a default.
+             *
+             * This deliberately overrides the implicit opt_tsx=-3 from
+             * `spec-ctrl=0` because:
+             * - parse_spec_ctrl() ran before any CPU details where know.
+             * - We now know we're running on a CPU not affected by TAA (as
+             *   TSX_FORCE_ABORT is enumerated).
+             */
+            if ( opt_tsx < 0 )
+                opt_tsx = 1;
+        }
+
         /*
          * The TSX features (HLE/RTM) are handled specially.  They both
          * enumerate features but, on certain parts, have mechanisms to be
@@ -75,6 +97,12 @@ void tsx_init(void)
         }
     }
 
+    /*
+     * Note: MSR_TSX_CTRL is enumerated on TSX-enabled MDS_NO and later parts.
+     * MSR_TSX_FORCE_ABORT is enumerated on TSX-enabled pre-MDS_NO Skylake
+     * parts only.  The two features are on a disjoint set of CPUs, and not
+     * offered to guests by hypervisors.
+     */
     if ( cpu_has_tsx_ctrl )
     {
         uint32_t hi, lo;
@@ -90,9 +118,28 @@ void tsx_init(void)
 
         wrmsr(MSR_TSX_CTRL, lo, hi);
     }
+    else if ( cpu_has_tsx_force_abort )
+    {
+        /*
+         * On an early TSX-enable Skylake part subject to the memory ordering
+         * erratum, with at least the March 2019 microcode.
+         */
+        uint32_t hi, lo;
+
+        rdmsr(MSR_TSX_FORCE_ABORT, lo, hi);
+
+        /* Check bottom bit only.  Higher bits are various sentinels. */
+        rtm_disabled = !(opt_tsx & 1);
+
+        lo &= ~TSX_FORCE_ABORT_RTM;
+        if ( rtm_disabled )
+            lo |= TSX_FORCE_ABORT_RTM;
+
+        wrmsr(MSR_TSX_FORCE_ABORT, lo, hi);
+    }
     else if ( opt_tsx >= 0 )
         printk_once(XENLOG_WARNING
-                    "MSR_TSX_CTRL not available - Ignoring tsx= setting\n");
+                    "TSX controls not available - Ignoring tsx= setting\n");
 }
 
 /*
diff --git a/xen/include/asm-x86/vpmu.h b/xen/include/asm-x86/vpmu.h
index 55f85ba00f..4b0a6ba3da 100644
--- a/xen/include/asm-x86/vpmu.h
+++ b/xen/include/asm-x86/vpmu.h
@@ -126,7 +126,6 @@ static inline int vpmu_do_rdmsr(unsigned int msr, uint64_t *msr_content)
 
 extern unsigned int vpmu_mode;
 extern unsigned int vpmu_features;
-extern bool opt_rtm_abort;
 
 /* Context switch */
 static inline void vpmu_switch_from(struct vcpu *prev)
-- 
2.11.0


