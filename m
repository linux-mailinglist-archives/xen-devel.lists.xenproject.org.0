Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7908472E5
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 16:17:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675079.1050282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVvHi-00073f-A2; Fri, 02 Feb 2024 15:16:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675079.1050282; Fri, 02 Feb 2024 15:16:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVvHi-00070O-6V; Fri, 02 Feb 2024 15:16:54 +0000
Received: by outflank-mailman (input) for mailman id 675079;
 Fri, 02 Feb 2024 15:16:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lYVL=JL=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rVvHg-0005mR-HE
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 15:16:52 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16da0948-c1de-11ee-98f5-efadbce2ee36;
 Fri, 02 Feb 2024 16:16:50 +0100 (CET)
Received: from beta.station (net-188-218-67-100.cust.vodafonedsl.it
 [188.218.67.100])
 by support.bugseng.com (Postfix) with ESMTPSA id 03D944EE0741;
 Fri,  2 Feb 2024 16:16:49 +0100 (CET)
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
X-Inumbo-ID: 16da0948-c1de-11ee-98f5-efadbce2ee36
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v4 3/4] xen/x86: address violations of MISRA C:2012 Rule 13.1
Date: Fri,  2 Feb 2024 16:16:04 +0100
Message-Id: <16bb514ac0a5fe0d6e9a2c95279a8200ff4495c6.1706886631.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706886631.git.simone.ballarin@bugseng.com>
References: <cover.1706886631.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 13.1: Initializer lists shall not contain persistent side effects

This patch moves expressions with side-effects into new variables before
the initializer lists.

No functional changes.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 xen/arch/x86/io_apic.c | 9 ++++++---
 xen/arch/x86/mpparse.c | 3 ++-
 xen/arch/x86/setup.c   | 3 ++-
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index b48a642465..4a6ab85689 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2559,9 +2559,12 @@ integer_param("max_gsi_irqs", max_gsi_irqs);
 
 static __init bool bad_ioapic_register(unsigned int idx)
 {
-    union IO_APIC_reg_00 reg_00 = { .raw = io_apic_read(idx, 0) };
-    union IO_APIC_reg_01 reg_01 = { .raw = io_apic_read(idx, 1) };
-    union IO_APIC_reg_02 reg_02 = { .raw = io_apic_read(idx, 2) };
+    uint32_t reg_00_raw = io_apic_read(idx, 0);
+    uint32_t reg_01_raw = io_apic_read(idx, 1);
+    uint32_t reg_02_raw = io_apic_read(idx, 2);
+    union IO_APIC_reg_00 reg_00 = { .raw = reg_00_raw };
+    union IO_APIC_reg_01 reg_01 = { .raw = reg_01_raw };
+    union IO_APIC_reg_02 reg_02 = { .raw = reg_02_raw };
 
     if ( reg_00.raw == -1 && reg_01.raw == -1 && reg_02.raw == -1 )
     {
diff --git a/xen/arch/x86/mpparse.c b/xen/arch/x86/mpparse.c
index d8ccab2449..81a819403b 100644
--- a/xen/arch/x86/mpparse.c
+++ b/xen/arch/x86/mpparse.c
@@ -798,11 +798,12 @@ void __init mp_register_lapic_address (
 
 int mp_register_lapic(u32 id, bool enabled, bool hotplug)
 {
+	u32 apic = apic_read(APIC_LVR);
 	struct mpc_config_processor processor = {
 		.mpc_type = MP_PROCESSOR,
 		/* Note: We don't fill in fields not consumed anywhere. */
 		.mpc_apicid = id,
-		.mpc_apicver = GET_APIC_VERSION(apic_read(APIC_LVR)),
+		.mpc_apicver = GET_APIC_VERSION(apic),
 		.mpc_cpuflag = (enabled ? CPU_ENABLED : 0) |
 			       (id == boot_cpu_physical_apicid ?
 				CPU_BOOTPROCESSOR : 0),
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index ee682dd136..886031d86a 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -885,13 +885,14 @@ static struct domain *__init create_dom0(const module_t *image,
 {
     static char __initdata cmdline[MAX_GUEST_CMDLINE];
 
+    unsigned int max_vcpus = dom0_max_vcpus();
     struct xen_domctl_createdomain dom0_cfg = {
         .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
         .max_evtchn_port = -1,
         .max_grant_frames = -1,
         .max_maptrack_frames = -1,
         .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
-        .max_vcpus = dom0_max_vcpus(),
+        .max_vcpus = max_vcpus,
         .arch = {
             .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
         },
-- 
2.34.1


