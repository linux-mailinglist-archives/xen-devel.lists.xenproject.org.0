Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF30736A2F
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 13:01:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551537.861150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZ71-0008GE-VJ; Tue, 20 Jun 2023 11:01:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551537.861150; Tue, 20 Jun 2023 11:01:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZ71-000883-RA; Tue, 20 Jun 2023 11:01:27 +0000
Received: by outflank-mailman (input) for mailman id 551537;
 Tue, 20 Jun 2023 10:35:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ovpU=CI=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qBYhl-0004Ou-SB
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 10:35:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27934a7d-0f56-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 12:35:20 +0200 (CEST)
Received: from beta.bugseng.com (93-40-74-174.ip37.fastwebnet.it
 [93.40.74.174])
 by support.bugseng.com (Postfix) with ESMTPSA id BECA84EE074C;
 Tue, 20 Jun 2023 12:35:18 +0200 (CEST)
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
X-Inumbo-ID: 27934a7d-0f56-11ee-8611-37d641c3527e
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
	Ayan Kumar <ayan.kumar.halder@amd.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH 01/13] xen/x86: fixed violations of MISRA C:2012 Rule 7.2
Date: Tue, 20 Jun 2023 12:34:53 +0200
Message-Id: <5aa3a54af456b8faee681a1d737c361abe89296f.1687250177.git.gianluca.luparini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687250177.git.gianluca.luparini@bugseng.com>
References: <cover.1687250177.git.gianluca.luparini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contains violations of MISRA C:2012 Rule 7.2 whose headline states:
"A "u" or "U" suffix shall be applied to all integer constants that are represented in an unsigned type".

I propose to use "U" as a suffix to explicitly state when an integer constant is represented in an unsigned type.
For homogeneity, I also added the "U" suffix in some cases that the tool didn't report as violations.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 xen/arch/x86/acpi/cpufreq/powernow.c      | 14 +++++++-------
 xen/include/acpi/cpufreq/processor_perf.h |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/powernow.c b/xen/arch/x86/acpi/cpufreq/powernow.c
index d4c7dcd5d9..8e0784b69c 100644
--- a/xen/arch/x86/acpi/cpufreq/powernow.c
+++ b/xen/arch/x86/acpi/cpufreq/powernow.c
@@ -32,14 +32,14 @@
 #include <acpi/acpi.h>
 #include <acpi/cpufreq/cpufreq.h>
 
-#define HW_PSTATE_MASK          0x00000007
-#define HW_PSTATE_VALID_MASK    0x80000000
-#define HW_PSTATE_MAX_MASK      0x000000f0
+#define HW_PSTATE_MASK          0x00000007U
+#define HW_PSTATE_VALID_MASK    0x80000000U
+#define HW_PSTATE_MAX_MASK      0x000000f0U
 #define HW_PSTATE_MAX_SHIFT     4
-#define MSR_PSTATE_DEF_BASE     0xc0010064 /* base of Pstate MSRs */
-#define MSR_PSTATE_STATUS       0xc0010063 /* Pstate Status MSR */
-#define MSR_PSTATE_CTRL         0xc0010062 /* Pstate control MSR */
-#define MSR_PSTATE_CUR_LIMIT    0xc0010061 /* pstate current limit MSR */
+#define MSR_PSTATE_DEF_BASE     0xc0010064U /* base of Pstate MSRs */
+#define MSR_PSTATE_STATUS       0xc0010063U /* Pstate Status MSR */
+#define MSR_PSTATE_CTRL         0xc0010062U /* Pstate control MSR */
+#define MSR_PSTATE_CUR_LIMIT    0xc0010061U /* pstate current limit MSR */
 #define MSR_HWCR_CPBDIS_MASK    0x02000000ULL
 
 #define ARCH_CPU_FLAG_RESUME	1
diff --git a/xen/include/acpi/cpufreq/processor_perf.h b/xen/include/acpi/cpufreq/processor_perf.h
index d8a1ba68a6..8b5a1b9bde 100644
--- a/xen/include/acpi/cpufreq/processor_perf.h
+++ b/xen/include/acpi/cpufreq/processor_perf.h
@@ -5,7 +5,7 @@
 #include <public/sysctl.h>
 #include <xen/acpi.h>
 
-#define XEN_PX_INIT 0x80000000
+#define XEN_PX_INIT 0x80000000U
 
 int powernow_cpufreq_init(void);
 unsigned int powernow_register_driver(void);
-- 
2.41.0


