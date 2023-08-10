Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F72777326
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 10:40:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581928.911442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU1DM-0006hh-AO; Thu, 10 Aug 2023 08:40:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581928.911442; Thu, 10 Aug 2023 08:40:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU1DM-0006W8-5E; Thu, 10 Aug 2023 08:40:16 +0000
Received: by outflank-mailman (input) for mailman id 581928;
 Thu, 10 Aug 2023 08:40:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MZIv=D3=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qU1DJ-0005Mc-Ll
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 08:40:13 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ef50389-3759-11ee-8613-37d641c3527e;
 Thu, 10 Aug 2023 10:40:01 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 491284EE0745;
 Thu, 10 Aug 2023 10:40:11 +0200 (CEST)
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
X-Inumbo-ID: 7ef50389-3759-11ee-8613-37d641c3527e
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 5/7] x86: make some functions and variables static rather than extern
Date: Thu, 10 Aug 2023 10:39:45 +0200
Message-Id: <b9c554bfb322912d294007958339cc40c9d5a876.1691655814.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691655814.git.nicola.vetrini@bugseng.com>
References: <cover.1691655814.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions and variables touched by this commit can be static,
as they are only used within the same unit. This in turn addresses
the absence of declarations that violates Rule 8.4.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Fixes: 741367e77d6c ("mce: Clean-up mcheck_init handler")
Fixes: 45f57813f646 ("x86/MCE: implement recoverscan for AMD")
Fixes: 155587481e39 ("x86/microcode: Scan the initramfs payload for microcode blob")
Fixes: af50dd63cf8d ("Pull nmi/traps changes from Linux 2.6.14.")
Fixes: fef244b179c0 ("x86/spec-ctrl: Knobs for STIBP and PSFD, and follow hardware STIBP hint")
---
Changes in v2:
- Revised commit message

I'm a bit uncertain about af50dd63cf8d, because it was done long ago and
it's not clear whether the variable could have been static since then.
---
 xen/arch/x86/cpu/mcheck/mce.c     | 2 +-
 xen/arch/x86/cpu/mcheck/mce_amd.c | 2 +-
 xen/arch/x86/cpu/microcode/core.c | 2 +-
 xen/arch/x86/nmi.c                | 2 +-
 xen/arch/x86/spec_ctrl.c          | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 57e1eb221e6b..6141b7eb9cf1 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -599,7 +599,7 @@ unsigned int mce_firstbank(struct cpuinfo_x86 *c)
            c->x86_vendor == X86_VENDOR_INTEL && c->x86_model < 0x1a;
 }
 
-int show_mca_info(int inited, struct cpuinfo_x86 *c)
+static int show_mca_info(int inited, struct cpuinfo_x86 *c)
 {
     static enum mcheck_type g_type = mcheck_unset;
 
diff --git a/xen/arch/x86/cpu/mcheck/mce_amd.c b/xen/arch/x86/cpu/mcheck/mce_amd.c
index adc36522cc27..72f3feeaeed8 100644
--- a/xen/arch/x86/cpu/mcheck/mce_amd.c
+++ b/xen/arch/x86/cpu/mcheck/mce_amd.c
@@ -87,7 +87,7 @@ enum mc_ec_type {
     MC_EC_BUS_TYPE = 0x0800,
 };
 
-enum mc_ec_type
+static enum mc_ec_type
 mc_ec2type(uint16_t errorcode)
 {
     if ( errorcode & MC_EC_BUS_TYPE )
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index bec8b55db256..9fcb9c1c3a90 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -149,7 +149,7 @@ static int __init cf_check parse_ucode(const char *s)
 }
 custom_param("ucode", parse_ucode);
 
-void __init microcode_scan_module(
+static void __init microcode_scan_module(
     unsigned long *module_map,
     const multiboot_info_t *mbi)
 {
diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index c5c28300b04d..104e366bd310 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -108,7 +108,7 @@ static unsigned int lapic_nmi_owner;
  *     be enabled
  * -1: the lapic NMI watchdog is disabled, but can be enabled
  */
-int nmi_active;
+static int nmi_active;
 
 #define K7_EVNTSEL_ENABLE	(1 << 22)
 #define K7_EVNTSEL_INT		(1 << 20)
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index ebe56a96cdca..9b8fdb5303ad 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -43,9 +43,9 @@ static enum ind_thunk {
 } opt_thunk __initdata = THUNK_DEFAULT;
 
 static int8_t __initdata opt_ibrs = -1;
-int8_t __initdata opt_stibp = -1;
+static int8_t __initdata opt_stibp = -1;
 bool __ro_after_init opt_ssbd;
-int8_t __initdata opt_psfd = -1;
+static int8_t __initdata opt_psfd = -1;
 
 int8_t __ro_after_init opt_ibpb_ctxt_switch = -1;
 int8_t __read_mostly opt_eager_fpu = -1;
-- 
2.34.1


