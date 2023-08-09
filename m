Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 336457759C1
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 13:03:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580901.909421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgxx-0000AN-Lc; Wed, 09 Aug 2023 11:03:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580901.909421; Wed, 09 Aug 2023 11:03:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgxx-0008Vv-ER; Wed, 09 Aug 2023 11:03:01 +0000
Received: by outflank-mailman (input) for mailman id 580901;
 Wed, 09 Aug 2023 11:03:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hYF7=D2=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qTgxw-0007K6-2X
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 11:03:00 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ca83da8-36a4-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 13:02:58 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id B0A884EE0745;
 Wed,  9 Aug 2023 13:02:57 +0200 (CEST)
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
X-Inumbo-ID: 4ca83da8-36a4-11ee-8613-37d641c3527e
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
Subject: [XEN PATCH 5/8] x86: address MISRA C:2012 Rule 8.4
Date: Wed,  9 Aug 2023 13:02:38 +0200
Message-Id: <4a07e7bb893f3d96e007ef6ccb645eee0d730489.1691575243.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691575243.git.nicola.vetrini@bugseng.com>
References: <cover.1691575243.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions and variables touched by this commit can be static,
as they are only used within the same unit. This in turn addresses
the absence of declarations that violates Rule 8.4.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/cpu/mcheck/mce.c     | 2 +-
 xen/arch/x86/cpu/mcheck/mce_amd.c | 2 +-
 xen/arch/x86/cpu/microcode/core.c | 2 +-
 xen/arch/x86/nmi.c                | 2 +-
 xen/arch/x86/spec_ctrl.c          | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 57e1eb221e..6141b7eb9c 100644
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
index adc36522cc..72f3feeaee 100644
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
index bec8b55db2..9fcb9c1c3a 100644
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
index c5c28300b0..104e366bd3 100644
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
index ebe56a96cd..9b8fdb5303 100644
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


