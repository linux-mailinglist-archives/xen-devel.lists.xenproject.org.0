Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 490034AE064
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 19:10:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268584.462447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHUwF-0003jv-6w; Tue, 08 Feb 2022 18:10:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268584.462447; Tue, 08 Feb 2022 18:10:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHUwE-0003cw-WE; Tue, 08 Feb 2022 18:10:03 +0000
Received: by outflank-mailman (input) for mailman id 268584;
 Tue, 08 Feb 2022 18:10:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1rHF=SX=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nHUwD-0003Sy-Nw
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 18:10:01 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53cc5cab-890a-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 19:09:59 +0100 (CET)
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
X-Inumbo-ID: 53cc5cab-890a-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644343799;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=r/2OFdLFluiUKzfzM+tz9rmzcXaHYU7oLqLx2nL9rWg=;
  b=R8p7jKxvXIXPwaBMIBxL727gZavS34k8oTK4+Keq2MUCWLRbuen/fP7F
   Nw0pN/1pZMPF1hgDyfviJGYGbUZnoKlvn/uEavu/G0KOhxLP6rKpMrM6C
   x2taxj6E9MeKQovUJQQWFOc2NK9XBNkf2PBt4SPmP3eJ4RPJejhf28DCC
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: dBJplvIeLSk9fTmGkAKUqYmm5dAHSWNBn6Kv+xz3DfUg5DNEpr/DdDX/3qVL8RBYJ1xezUkcW7
 gQe8ZEJv3ZQRqlvAN1i/tL19nMIWD4bnN/yLIvEUehwt4aSKdrSMY+he7sK+4W2+xz7vIthqBk
 fAcWZQDbfBaaex90OQ3qBzmkQgdhI9a1b+6wxtIMdBcETky/yhWoj3DFEaG5ybH1WTfbyGeHbs
 DmqAUFMl0SqgzUmSS76nT2XxzVH3nv2CFtxpqNkESLx46ZrzqWtMk0fQ8knc7Wy1KJbAWfMIC3
 JNwiKLNoXBct83X4iS6n63ZA
X-SBRS: 5.1
X-MesageID: 63762677
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lXjFbKqpOGFwu020/RowMy017dheBmI7YhIvgKrLsJaIsI4StFCzt
 garIBmGP/aLYmT8fdl0YYu/8h4B6MeDx99rQAM6+Hw3ESNDp5uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw24DpW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCncWZcQVyFZ3Nou86SxV7VHx0ZqB09bCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ZFGN2AxM0uojxtnCgpUBJAyudeS2VLcbxxzi3/KiJgs2j2GpOB2+Oe0a4eEEjCQfu1Fk0Ddq
 m/Y8mDRBhABKMfZ2TeD6mirhOLEgWX8Qo16KVGj3qc02hvJnDVVUUBIEwvgyRWktqKgc4t2E
 05P0Rovl6MV7ECICYT3BBCKrXHR63bwROFsO+E97QiMzI/d7ACYGnUIQ1Z9VTA2iCMlbWd0j
 wHUxrsFERQq6eTIEizFqt94uBvvYXB9EIMUWcMToeLpCfHHqZp7sB/AR80L/EWd3oysQmGYL
 9xnQUEDa1QvYSwjiv/TEbPv2WvESn31oukdvFS/Y45dxlklDLNJnqTxgbQh0d5OLZyCUn6Kt
 2Uels6V4YgmVM/RyHXcGbxTTevwvJ5p1QEwZnY1TvEcG8mFoSb/Lei8HhkiTKuWDir0UWCwO
 xKC0e+gzJRSIGGrfcdKj3GZUKwXIVzbPY29DJj8N4MWCrAoLVPv1Hw+NCa4gjG2+GBxwP5XE
 cnAK66EUy1FYZmLORLrHo/xJ5dwnXtgrY4SLLimpymaPU22PibKEOxYawvXNYjULsqs+W3oz
 jqWDOPSoz03bQE0SnO/HVc7IQ9YIH4lK4rxrsALJOePLhA/QDMqCuPLwKNncItgxvwHmuDN9
 3C7e0lZ1Fug2iGXdVTUMihuOOH1QJJyjXMnJihwb1ym7GcuPNS056AFepppIbR+rL5/zeR5R
 uUuctmbBqgdUSzO/jkQNMGvrIFreBmxqxiJOi6pPGo2c5J6HlSb8d74ZAr/siIJC3Pv58c5p
 rSh0CLdQIYCGFs+XJqHNqr3wgro73YHme90U0/ZGfVpeR3hoNpwNij8rv4rOMVQex/N8SSXi
 lSNChACqOiT/4JsqIvVhbqJppuCGvdlGhYIBHHS6Lu7OHWI/menxoMcAu+EcSqECTHx8aSmI
 +5U0+v9ILsMm1MT69hwFLNizKQf4drzpuAFklQ4TSuTN1n7WKl9JnSm3NVUsvwfz7BUjgK6R
 0aT94QIIr6OIs7kTAYcKQdNgj5vDh3Idu0+NcgIHXg=
IronPort-HdrOrdr: A9a23:a6ptG6nRYVai5PPNENCW9qc6MvXpDfIu3DAbv31ZSRFFG/Fxl6
 iV8sjztCWE8Qr5N0tBpTntAsW9qDbnhPtICOoqTNGftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAs9D4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.88,353,1635220800"; 
   d="scan'208";a="63762677"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 3/6] x86/tsx: Cope with TSX deprecation on WHL-R/CFL-R
Date: Tue, 8 Feb 2022 18:09:39 +0000
Message-ID: <20220208180942.14871-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220208180942.14871-1-andrew.cooper3@citrix.com>
References: <20220208180942.14871-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

The February 2022 microcode is formally de-featuring TSX on the TAA-impacted
client CPUs.  The backup TAA mitigation (VERW regaining its flushing side
effect) is being dropped, meaning that `smt=0 spec-ctrl=md-clear` no longer
protects against TAA on these parts.

The new functionality enumerates itself via the RTM_ALWAYS_ABORT CPUID
bit (the same as June 2021), but has its control in MSR_MCU_OPT_CTRL as
opposed to MSR_TSX_FORCE_ABORT.

TSX now defaults to being disabled on ucode load.  Furthermore, if SGX is
enabled in the BIOS, TSX is locked and cannot be re-enabled.  In this case,
override opt_tsx to 0, so the RTM/HLE CPUID bits get hidden by default.

While updating the command line documentation, take the opportunity to add a
paragraph explaining what TSX being disabled actually means, and how migration
compatibility works.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 docs/misc/xen-command-line.pandoc    | 25 +++++++++---
 xen/arch/x86/include/asm/msr-index.h |  2 +
 xen/arch/x86/spec_ctrl.c             |  7 +++-
 xen/arch/x86/tsx.c                   | 76 ++++++++++++++++++++++++++++++++++++
 4 files changed, 103 insertions(+), 7 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 6b3da6ddc16c..8e75e592e70a 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2387,7 +2387,9 @@ Several microcode updates are relevant:
    Introduced MSR_TSX_CTRL on all TSX-enabled MDS_NO parts to date,
    CLX/WHL-R/CFL-R, with the controls becoming architectural moving forward
    and formally retiring HLE from the architecture.  The user can disable TSX
-   to mitigate TAA, and elect to hide the HLE/RTM CPUID bits.
+   to mitigate TAA, and elect to hide the HLE/RTM CPUID bits.  Also causes
+   VERW to once-again flush the microarchiectural buffers in case a TAA
+   mitigation is wanted along with TSX being enabled.
 
  * June 2021, removing the workaround for March 2019 on client CPUs and
    formally de-featured TSX on SKL/KBL/WHL/CFL (Note: SKX still retains the
@@ -2395,19 +2397,32 @@ Several microcode updates are relevant:
    PCR3 works fine, and TSX is disabled by default, but the user can re-enable
    TSX at their own risk, accepting that the memory order erratum is unfixed.
 
+ * February 2022, removing the VERW flushing workaround from November 2019 on
+   client CPUs and formally de-featuring TSX on WHL-R/CFL-R (Note: CLX still
+   retains the VERW flushing workaround).  TSX defaults to disabled, and is
+   locked off when SGX is enabled in the BIOS.  When SGX is not enabled, TSX
+   can be re-enabled at the users own risk, as it reintroduces the TSX Async
+   Abort speculative vulnerability.
+
 On systems with the ability to configure TSX, this boolean offers system wide
 control of whether TSX is enabled or disabled.
 
+When TSX is disabled, transactions unconditionally abort.  This is compatible
+with the TSX spec, which requires software to have a non-transactional path as
+a fallback.  The RTM and HLE CPUID bits are hidden from VMs by default, but
+can be re-enabled if required.  This allows VMs which previously saw RTM/HLE
+to be migrated in, although any TSX-enabled software will run with reduced
+performance.
+
+ * When TSX is locked off by firmware, `tsx=` is ignored and treated as
+   `false`.
+
  * An explicit `tsx=` choice is honoured, even if it is `true` and would
    result in a vulnerable system.
 
  * When no explicit `tsx=` choice is given, parts vulnerable to TAA will be
    mitigated by disabling TSX, as this is the lowest overhead option.
 
-   If the use of TSX is important, the more expensive TAA mitigations can be
-   opted in to with `smt=0 spec-ctrl=md-clear`, at which point TSX will remain
-   active by default.
-
  * When no explicit `tsx=` option is given, parts susceptible to the memory
    ordering errata default to `true` to enable working TSX.  Alternatively,
    selecting `tsx=0` will disable TSX and restore PCR3 to a working state.
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index ab68ef2681a9..9df1959fe5a1 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -78,6 +78,8 @@
 
 #define MSR_MCU_OPT_CTRL                    0x00000123
 #define  MCU_OPT_CTRL_RNGDS_MITG_DIS        (_AC(1, ULL) <<  0)
+#define  MCU_OPT_CTRL_RTM_ALLOW             (_AC(1, ULL) <<  1)
+#define  MCU_OPT_CTRL_RTM_LOCKED            (_AC(1, ULL) <<  2)
 
 #define MSR_RTIT_OUTPUT_BASE                0x00000560
 #define MSR_RTIT_OUTPUT_MASK                0x00000561
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 3628b4b4154f..2b93468d396e 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -1233,11 +1233,14 @@ void __init init_speculation_mitigations(void)
      * the MDS mitigation of disabling HT and using VERW flushing.
      *
      * On CPUs which advertise MDS_NO, VERW has no flushing side effect until
-     * the TSX_CTRL microcode is loaded, despite the MD_CLEAR CPUID bit being
+     * the TSX_CTRL microcode (Nov 2019), despite the MD_CLEAR CPUID bit being
      * advertised, and there isn't a MD_CLEAR_2 flag to use...
      *
+     * Furthermore, the VERW flushing side effect is removed again on client
+     * parts with the Feb 2022 microcode.
+     *
      * If we're on affected hardware, able to do something about it (which
-     * implies that VERW now works), no explicit TSX choice and traditional
+     * implies that VERW might work), no explicit TSX choice and traditional
      * MDS mitigations (no-SMT, VERW) not obviosuly in use (someone might
      * plausibly value TSX higher than Hyperthreading...), disable TSX to
      * mitigate TAA.
diff --git a/xen/arch/x86/tsx.c b/xen/arch/x86/tsx.c
index c3b8a7ec0076..be89741a2f6d 100644
--- a/xen/arch/x86/tsx.c
+++ b/xen/arch/x86/tsx.c
@@ -14,6 +14,9 @@
  * This is arranged such that the bottom bit encodes whether TSX is actually
  * disabled, while identifying various explicit (>=0) and implicit (<0)
  * conditions.
+ *
+ * This option only has any effect on systems presenting a mechanism of
+ * controlling TSX behaviour, and where TSX isn't force-disabled by firmware.
  */
 int8_t __read_mostly opt_tsx = -1;
 int8_t __read_mostly cpu_has_tsx_ctrl = -1;
@@ -54,6 +57,66 @@ void tsx_init(void)
         cpu_has_tsx_ctrl = !!(caps & ARCH_CAPS_TSX_CTRL);
         has_rtm_always_abort = cpu_has_rtm_always_abort;
 
+        if ( cpu_has_tsx_ctrl && cpu_has_srbds_ctrl )
+        {
+            /*
+             * On a TAA-vulnerable or later part with at least the May 2020
+             * microcode mitigating SRBDS.
+             */
+            uint64_t val;
+
+            rdmsrl(MSR_MCU_OPT_CTRL, val);
+
+            /*
+             * Probe for the February 2022 microcode which de-features TSX on
+             * TAA-vulnerable client parts - WHL-R/CFL-R.
+             *
+             * RTM_ALWAYS_ABORT (read above) enumerates the new functionality,
+             * but is read as zero if MCU_OPT_CTRL.RTM_ALLOW has been set
+             * before we run.  Undo this.
+             */
+            if ( val & MCU_OPT_CTRL_RTM_ALLOW )
+                has_rtm_always_abort = true;
+
+            if ( has_rtm_always_abort )
+            {
+                if ( val & MCU_OPT_CTRL_RTM_LOCKED )
+                {
+                    /*
+                     * If RTM_LOCKED is set, TSX is disabled because SGX is
+                     * enabled, and there is nothing we can do.  Override with
+                     * tsx=0 so all other logic takes sensible actions.
+                     */
+                    printk(XENLOG_WARNING "TSX locked by firmware - disabling\n");
+                    opt_tsx = 0;
+                }
+                else
+                {
+                    /*
+                     * Otherwise, set RTM_ALLOW.  Not because we necessarily
+                     * intend to enable RTM, but it prevents
+                     * MSR_TSX_CTRL.RTM_DISABLE from being ignored, thus
+                     * allowing the rest of the TSX selection logic to work as
+                     * before.
+                     */
+                    val |= MCU_OPT_CTRL_RTM_ALLOW;
+                }
+
+                set_in_mcu_opt_ctrl(
+                    MCU_OPT_CTRL_RTM_LOCKED | MCU_OPT_CTRL_RTM_ALLOW, val);
+
+                /*
+                 * If no explicit tsx= option is provided, pick a default.
+                 *
+                 * With RTM_ALWAYS_ABORT, the default ucode behaviour is to
+                 * disable, so match that.  This does not override explicit user
+                 * choices, or implicit choices as a side effect of spec-ctrl=0.
+                 */
+                if ( opt_tsx == -1 )
+                    opt_tsx = 0;
+            }
+        }
+
         if ( cpu_has_tsx_force_abort )
         {
             /*
@@ -142,6 +205,19 @@ void tsx_init(void)
      */
     if ( cpu_has_tsx_ctrl )
     {
+        /*
+         * On a TAA-vulnerable part with at least the November 2019 microcode,
+         * or newer part with TAA fixed.
+         *
+         * Notes:
+         *  - With the February 2022 microcode, if SGX has caused TSX to be
+         *    locked off, opt_tsx is overridden to 0.  TSX_CTRL.RTM_DISABLE is
+         *    an ignored bit, but we write it such that it matches the
+         *    behaviour enforced by microcode.
+         *  - Otherwise, if SGX isn't enabled and TSX is available to be
+         *    controlled, we have or will set MSR_MCU_OPT_CTRL.RTM_ALLOW to
+         *    let TSX_CTRL.RTM_DISABLE be usable.
+         */
         uint32_t hi, lo;
 
         rdmsr(MSR_TSX_CTRL, lo, hi);
-- 
2.11.0


