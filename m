Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B2D45EEC7
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:08:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232890.404156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxf-0004db-Gt; Fri, 26 Nov 2021 13:08:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232890.404156; Fri, 26 Nov 2021 13:08:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxe-0004GU-5Q; Fri, 26 Nov 2021 13:08:18 +0000
Received: by outflank-mailman (input) for mailman id 232890;
 Fri, 26 Nov 2021 13:08:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqav5-0003W9-E8
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:05:39 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8aa86722-4eb9-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:05:35 +0100 (CET)
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
X-Inumbo-ID: 8aa86722-4eb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931935;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eytoyY1MzG0tl/bk0TOOzujLGnc7vJSPTvWtmGIYixE=;
  b=ZjNROnfUeYE/cW1nYFrzIvkp9Hs8liQdojrXHJWu9EhasijitfdC74t0
   lILn9e1fyDw5jPJX8D4hgYVDm3dlGpRASGFKkrBzfWESwKFtYuta49rDX
   vrhwrTOWGhIwWzMkMdv8gy/sToFwbotm0Yj2VN/Rg2Vokcoi9gMCTh+z0
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: kWN/RgKQoGE/jGDWqtw6TFykhPetduO7zsGvLarezDqHrxDktXpbGxm3fjA5AjcYCuQ6NkHZLZ
 ymYXwc7D6QJU7DP8DWNryqW1gdo662GNEIAgzYeFczjtJile9uyWqkBDFDotPXjUMjn8FvlWNQ
 pf894DprJP/Cmif3Iotl0OV0/NF6+afJZHqCh8BahcZ8RYRphmiaWqxe4eQDFYUlRJBmP1gBdJ
 UZnI6l2WmS9n5omnE0wYbsq+CnhMQGBHs4G9DxJBZpBl9ZDOyU1jQrNKD7QC/o81j9VFoaPT1Q
 Zyk6CSsTqjQyAJr7YGpOtO0A
X-SBRS: 5.1
X-MesageID: 58193821
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qKW+7qj6R8eNCXYsYWuGSrUsX161rRcKZh0ujC45NGQN5FlHY01je
 htvX22AP6qPYmH0fIh+Oom/9UsDu5XXytUxSgA9/n03FH4b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29cy34Dja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /18jt+SYDYGEZaWp/k5Ax0DFn11JJZJreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNauOP
 ptCOWA2BPjGSwRAF3VHF54XoMOt3Efdcg9elHi6hoNitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRIDsXKdiewjqt6W+3i6nEmiaTcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4ItZ5yii85YXvuTmEIjgAFTsdY8Udu5pjLdA17
 WOhk9TsDD1plbSaT3OB67uZxQ+P1TgpwXwqPnFdE1ZcizX3iMRq10+UEI4/eEKgpoStQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtQezARVodt/xory9U
 J4swJP2AAcmV8zlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRkybZZaJGC4P
 BGP4mu9AaO/2lPxNsebhKrrVqwXIVXIT4y5Bpg4kPISCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGLq9NOdg5TciBgbX00wuQOHtO+zsNdMDlJI5fsLXkJIeSJRoxZybXF+
 G+TQEhdxAatjHHLM1zSOHtidKnuTdB0qndiZX4gOlOh2n4CZ4ez7fhAK8trLOd/rOEzn+RpS
 /QletmbBqgdQDrw5DlAP4L2q5ZvdUr3iFvWbTalejU2Y7VpWxfNpo3/ZgLq+SRXVni3uMIyr
 qeOzATeRZZfFQ1uANyPMKCkzk+rvGhbk+V3BhOaLt5WcUTq0Y5rNy2u0aNnf5BScU3On2LI2
 RyXDBEUofj2j7U0qNSZ17qZq4qJEvdlGhYIFWfs8rvrZzLR+XCuwNEcXb/QLyzdTm795I6re
 f5Rk6PnKPQCkVtH79h8HrJswf5s7tfjveYHnAFtHXGNZFW3ELJwZHKB2JAX5KFKw7ZYvyqwW
 16OpYYGaenYZpu9HQ5DPhchY8SCyeoQy2vb4vkCKUnn4DN6oeicWkJIMhjQ0CFQIdOZ6m/+L
 TvNbCLO1zGCtw==
IronPort-HdrOrdr: A9a23:kR7Rwq0zy0udtazHlimnjAqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoVj6faUskd2ZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOcOEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58193821"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 39/65] x86/mce: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:34:20 +0000
Message-ID: <20211126123446.32324-40-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
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
index f587018cd2d2..9f8b2865c206 100644
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


