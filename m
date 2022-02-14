Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8970D4B50FE
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:05:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271642.466184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb29-00009D-53; Mon, 14 Feb 2022 13:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271642.466184; Mon, 14 Feb 2022 13:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb28-00007B-UL; Mon, 14 Feb 2022 13:04:48 +0000
Received: by outflank-mailman (input) for mailman id 271642;
 Mon, 14 Feb 2022 13:04:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb27-0008IH-3M
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:04:47 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae7b14de-8d96-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:04:45 +0100 (CET)
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
X-Inumbo-ID: ae7b14de-8d96-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843885;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=e92OCL5JW96cE+yF15zAo6mkF0e29pgcSSh3YdFWn/0=;
  b=KOwSP+S7PBX11G4DlPNpJYuku9QogWmZwyvy0Ok88/zSyv+2O1UlHhCG
   +RZzxebWCcEgAgfeCrOfzFzAGMfmm14g9wACFMpVkqas4sTjvS4IOuKe5
   szYUy3uV7iDiX/c57PTWsqA/NAjMHpTywhtzMkY8lOsqFCMdlfA56WSl0
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: rQcdzzGVT9+6Jr1mdg/nHbkZS/dqgRwSrlYb3CNg3PlPpzmkbmRD7LtGnH/db0gppo6wneDbNH
 Y3477CXvYxfIQOu1w4SrnJCi9mm/oyfb+zfln9g9XcJaXO6k1cHXU9oFrTgMTwumZil+Vh6N2u
 x0KtuFZlni5d3pg/mKgFTCtKaTclr3TO88gKduDAthTOFL062ja0px35Iz6hgLLqcE5zFL9vGb
 2nfOHa1gwmJkwEy/owP718rwA9I1XsxYnpPBIn1Cek7g0JilQJ/7FMGWws2Zn4ZAOwEGnXZ1af
 lQBTeCeexUWKjt8UhUOI4B6l
X-SBRS: 5.1
X-MesageID: 64050482
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ccKvm69ZwnNm15vLh4rODrUDnnmTJUtcMsCJ2f8bNWPcYEJGY0x3y
 WVJWWCHOa3eYzf2e9Fzbdvn9xxVupXWx9RrSVQ+/Hg8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rg3tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh3w
 94W9rCdWDt3L67jyOMSXjd/H3xxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4SRauGO
 5pDAdZpREjCZAAUeUw3MZ4vlvu6hHK4SGx1q03A8MLb5ECMlVcsgdABKuH9atGMAMlYgEucj
 mbH5HjiRAEXMsSFzjiI+W7qgfXA9R4XQ6pLSuf+rKQzxgTOmCpDU3X6SGdXv9G/gUXlGP5yO
 nBK6ykB/a89+WKMQoTyCkjQTGG/gjYQXN9ZEusf4Q6Ly7bJ7wvxOlXoXgKte/R96pZoGGVCO
 kuh2oqwWGcx6OH9pWe1q+/MxQ5eLxT5OoPricUsaQIeq+fur4go5v4kZoYySfXl5jEZ9NyZ/
 txrkMTcr+hJ5SLo///ilbwiv95LjsKXJjPZHi2NAgqYAvpRPeZJnbCA51nB9upnJ42EVFSHt
 3Vss5HAsLxRXcHQyXTUG79l8FSVCxGtamO0vLKSN8N5q2TFF4CLIei8Hw2S1G82a51ZKFcFk
 WfYuB9L5Y87AZdZRfQfXm5FMOxzlfKIPY28Dpj8N4MSCrAsJF7v1Hw/Pia4gjGy+HXAZIliY
 P93h+73Vi1EYUmmpRLrL9ogPUgDmHxvmzOLHcqjp/lluJLHDEOopX4+GAPmRogEAGms+W05K
 v5TaJmHzQtxSur7bnWF+IIfNwlSf3M6GYr3u4pccevaelhqH2QoCvnwx7I9etM6w/QJx7mQp
 nztCFVFzFffhGHcLVnYYH5Ud76yD410qmg2PHJwMA/wiWQje4um8IwWa4AzIes87OVmwPMtF
 6sFdsyMD+5hUDPC/zhBP5DxoJY7LEaghB6UPjrjaz86JsYySwvM897iXw3u6ChRUXbn6Zpg+
 +Wtj1qJT4ACSgJuCNftRMiul17h72IAnO9SXlfTJoUBckvb74U3eTf6ieU6Ip9QJEyblCeaz
 QufHTwRufLJ/90u6NDMiK2J89WpHu95EhYIFmXX9+/rZyzT/27lyo5cSueYOzvaUTqsqqmlY
 OxUydD6MeEGwwkW49YtTe4zwPJs/cbrqp9b0h9gTSfCYFmcA799JmWLgJtUvapXy74F4Qa7V
 ypjIDWB1Wll7C89LGMsGQ==
IronPort-HdrOrdr: A9a23:iy2Qaay9i3yZFZLBISe6KrPw1r1zdoMgy1knxilNoHxuH/BwWf
 rPoB17726RtN91YhsdcL+7V5VoLUmzyXcX2/h1AV7BZniEhILAFugLgbcKqweKJ8SUzJ8+6U
 4PSclD4N2bNykGsS75ijPIb+rJFrO8gd+VbeS19QYScelzAZsQiDuQkmygYzZLrA8tP+teKL
 OsovBpihCHYnotYsGyFhA+LpL+T42iruOeXfYebSRXkDWzsQ==
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64050482"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 43/70] x86/mce: CFI hardening
Date: Mon, 14 Feb 2022 12:51:00 +0000
Message-ID: <20220214125127.17985-44-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/cpu/mcheck/mce.c       |  8 ++++----
 xen/arch/x86/cpu/mcheck/mce.h       |  2 +-
 xen/arch/x86/cpu/mcheck/mce_amd.c   |  9 ++++----
 xen/arch/x86/cpu/mcheck/mce_amd.h   |  4 ++--
 xen/arch/x86/cpu/mcheck/mce_intel.c | 41 +++++++++++++++++--------------------
 5 files changed, 31 insertions(+), 33 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 3467e0f1a315..275c54be7c0f 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -75,7 +75,7 @@ static int __init cf_check mce_set_verbosity(const char *str)
 custom_param("mce_verbosity", mce_set_verbosity);
 
 /* Handle unconfigured int18 (should never happen) */
-static void unexpected_machine_check(const struct cpu_user_regs *regs)
+static void cf_check unexpected_machine_check(const struct cpu_user_regs *regs)
 {
     console_force_unlock();
     printk("Unexpected Machine Check Exception\n");
@@ -469,7 +469,7 @@ static int mce_urgent_action(const struct cpu_user_regs *regs,
 }
 
 /* Shared #MC handler. */
-void mcheck_cmn_handler(const struct cpu_user_regs *regs)
+void cf_check mcheck_cmn_handler(const struct cpu_user_regs *regs)
 {
     static DEFINE_MCE_BARRIER(mce_trap_bar);
     static atomic_t severity_cpu = ATOMIC_INIT(-1);
@@ -1684,7 +1684,7 @@ long cf_check do_mca(XEN_GUEST_HANDLE_PARAM(xen_mc_t) u_xen_mc)
 }
 
 int mcinfo_dumpped;
-static int x86_mcinfo_dump_panic(mctelem_cookie_t mctc)
+static int cf_check x86_mcinfo_dump_panic(mctelem_cookie_t mctc)
 {
     struct mc_info *mcip = mctelem_dataptr(mctc);
 
@@ -1801,7 +1801,7 @@ static enum mce_result mce_action(const struct cpu_user_regs *regs,
  * should be committed for dom0 consumption, 0 if it should be
  * dismissed.
  */
-static int mce_delayed_action(mctelem_cookie_t mctc)
+static int cf_check mce_delayed_action(mctelem_cookie_t mctc)
 {
     enum mce_result result;
     int ret = 0;
diff --git a/xen/arch/x86/cpu/mcheck/mce.h b/xen/arch/x86/cpu/mcheck/mce.h
index 195362691904..535d0abf8f9b 100644
--- a/xen/arch/x86/cpu/mcheck/mce.h
+++ b/xen/arch/x86/cpu/mcheck/mce.h
@@ -70,7 +70,7 @@ extern void x86_mce_vector_register(x86_mce_vector_t);
  * Common generic MCE handler that implementations may nominate
  * via x86_mce_vector_register.
  */
-extern void mcheck_cmn_handler(const struct cpu_user_regs *regs);
+void cf_check mcheck_cmn_handler(const struct cpu_user_regs *regs);
 
 /* Register a handler for judging whether mce is recoverable. */
 typedef bool (*mce_recoverable_t)(uint64_t status);
diff --git a/xen/arch/x86/cpu/mcheck/mce_amd.c b/xen/arch/x86/cpu/mcheck/mce_amd.c
index 279a8e6f122d..d7ae8919df77 100644
--- a/xen/arch/x86/cpu/mcheck/mce_amd.c
+++ b/xen/arch/x86/cpu/mcheck/mce_amd.c
@@ -113,7 +113,7 @@ mc_ec2type(uint16_t errorcode)
     return 0;
 }
 
-bool mc_amd_recoverable_scan(uint64_t status)
+bool cf_check mc_amd_recoverable_scan(uint64_t status)
 {
     bool ret = false;
     enum mc_ec_type ectype;
@@ -143,7 +143,7 @@ bool mc_amd_recoverable_scan(uint64_t status)
     return ret;
 }
 
-bool mc_amd_addrcheck(uint64_t status, uint64_t misc, int addrtype)
+bool cf_check mc_amd_addrcheck(uint64_t status, uint64_t misc, int addrtype)
 {
     enum mc_ec_type ectype;
     uint16_t errorcode;
@@ -216,7 +216,7 @@ static void mcequirk_amd_apply(enum mcequirk_amd_flags flags)
     }
 }
 
-static struct mcinfo_extended *
+static struct mcinfo_extended *cf_check
 amd_f10_handler(struct mc_info *mi, uint16_t bank, uint64_t status)
 {
     struct mcinfo_extended *mc_ext;
@@ -252,7 +252,8 @@ amd_f10_handler(struct mc_info *mi, uint16_t bank, uint64_t status)
     return mc_ext;
 }
 
-static bool amd_need_clearbank_scan(enum mca_source who, uint64_t status)
+static bool cf_check amd_need_clearbank_scan(
+    enum mca_source who, uint64_t status)
 {
     if ( who != MCA_MCE_SCAN )
         return true;
diff --git a/xen/arch/x86/cpu/mcheck/mce_amd.h b/xen/arch/x86/cpu/mcheck/mce_amd.h
index 67c45454707d..c12c25d74567 100644
--- a/xen/arch/x86/cpu/mcheck/mce_amd.h
+++ b/xen/arch/x86/cpu/mcheck/mce_amd.h
@@ -1,7 +1,7 @@
 #ifndef _MCHECK_AMD_H
 #define _MCHECK_AMD_H
 
-bool mc_amd_recoverable_scan(uint64_t status);
-bool mc_amd_addrcheck(uint64_t status, uint64_t misc, int addrtype);
+bool cf_check mc_amd_recoverable_scan(uint64_t status);
+bool cf_check mc_amd_addrcheck(uint64_t status, uint64_t misc, int addrtype);
 
 #endif
diff --git a/xen/arch/x86/cpu/mcheck/mce_intel.c b/xen/arch/x86/cpu/mcheck/mce_intel.c
index 7aaa56fd02eb..50198e0c295c 100644
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -271,12 +271,13 @@ static void intel_memerr_dhandler(
     mc_memerr_dhandler(binfo, result, regs);
 }
 
-static bool intel_srar_check(uint64_t status)
+static bool cf_check intel_srar_check(uint64_t status)
 {
     return (intel_check_mce_type(status) == intel_mce_ucr_srar);
 }
 
-static bool intel_checkaddr(uint64_t status, uint64_t misc, int addrtype)
+static bool cf_check intel_checkaddr(
+    uint64_t status, uint64_t misc, int addrtype)
 {
     if ( !(status & MCi_STATUS_ADDRV) ||
          !(status & MCi_STATUS_MISCV) ||
@@ -287,10 +288,9 @@ static bool intel_checkaddr(uint64_t status, uint64_t misc, int addrtype)
     return (addrtype == MC_ADDR_PHYSICAL);
 }
 
-static void intel_srar_dhandler(
-             struct mca_binfo *binfo,
-             enum mce_result *result,
-             const struct cpu_user_regs *regs)
+static void cf_check intel_srar_dhandler(
+    struct mca_binfo *binfo, enum mce_result *result,
+    const struct cpu_user_regs *regs)
 {
     uint64_t status = binfo->mib->mc_status;
 
@@ -306,15 +306,14 @@ static void intel_srar_dhandler(
     }
 }
 
-static bool intel_srao_check(uint64_t status)
+static bool cf_check intel_srao_check(uint64_t status)
 {
     return (intel_check_mce_type(status) == intel_mce_ucr_srao);
 }
 
-static void intel_srao_dhandler(
-             struct mca_binfo *binfo,
-             enum mce_result *result,
-             const struct cpu_user_regs *regs)
+static void cf_check intel_srao_dhandler(
+    struct mca_binfo *binfo, enum mce_result *result,
+    const struct cpu_user_regs *regs)
 {
     uint64_t status = binfo->mib->mc_status;
 
@@ -333,15 +332,14 @@ static void intel_srao_dhandler(
     }
 }
 
-static bool intel_default_check(uint64_t status)
+static bool cf_check intel_default_check(uint64_t status)
 {
     return true;
 }
 
-static void intel_default_mce_dhandler(
-             struct mca_binfo *binfo,
-             enum mce_result *result,
-             const struct cpu_user_regs * regs)
+static void cf_check intel_default_mce_dhandler(
+    struct mca_binfo *binfo, enum mce_result *result,
+    const struct cpu_user_regs * regs)
 {
     uint64_t status = binfo->mib->mc_status;
     enum intel_mce_type type;
@@ -360,10 +358,9 @@ static const struct mca_error_handler intel_mce_dhandlers[] = {
     {intel_default_check, intel_default_mce_dhandler}
 };
 
-static void intel_default_mce_uhandler(
-             struct mca_binfo *binfo,
-             enum mce_result *result,
-             const struct cpu_user_regs *regs)
+static void cf_check intel_default_mce_uhandler(
+    struct mca_binfo *binfo, enum mce_result *result,
+    const struct cpu_user_regs *regs)
 {
     uint64_t status = binfo->mib->mc_status;
     enum intel_mce_type type;
@@ -396,7 +393,7 @@ static const struct mca_error_handler intel_mce_uhandlers[] = {
  * 3) ser_support = 1, SRAO, UC = 1, S = 1, AR = 0, [EN = 1]
  */
 
-static bool intel_need_clearbank_scan(enum mca_source who, u64 status)
+static bool cf_check intel_need_clearbank_scan(enum mca_source who, u64 status)
 {
     if ( who == MCA_CMCI_HANDLER )
     {
@@ -453,7 +450,7 @@ static bool intel_need_clearbank_scan(enum mca_source who, u64 status)
  * 4) SRAO ser_support = 1, PCC = 0, S = 1, AR = 0, EN = 1 [UC = 1]
  * 5) UCNA ser_support = 1, OVER = 0, EN = 1, PCC = 0, S = 0, AR = 0, [UC = 1]
  */
-static bool intel_recoverable_scan(uint64_t status)
+static bool cf_check intel_recoverable_scan(uint64_t status)
 {
 
     if ( !(status & MCi_STATUS_UC ) )
-- 
2.11.0


