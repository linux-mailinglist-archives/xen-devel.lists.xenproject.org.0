Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99231748801
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 17:27:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559305.874198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH4PX-0001li-1O; Wed, 05 Jul 2023 15:27:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559305.874198; Wed, 05 Jul 2023 15:27:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH4PW-0001jt-Un; Wed, 05 Jul 2023 15:27:18 +0000
Received: by outflank-mailman (input) for mailman id 559305;
 Wed, 05 Jul 2023 15:27:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yX3c=CX=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qH4PT-0001UO-SK
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 15:27:15 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b61d52b-1b48-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 17:27:15 +0200 (CEST)
Received: from beta.bugseng.com (unknown [37.163.248.64])
 by support.bugseng.com (Postfix) with ESMTPSA id B058F4EE0C81;
 Wed,  5 Jul 2023 17:27:13 +0200 (CEST)
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
X-Inumbo-ID: 6b61d52b-1b48-11ee-b237-6b7b168915f2
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
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH v2 01/13] x86/cpufreq: fix violations of MISRA C:2012 Rule 7.2
Date: Wed,  5 Jul 2023 17:26:23 +0200
Message-Id: <7df9377d4cb218dd54646c2cb1b70327c8b44c96.1688559115.git.gianluca.luparini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688559115.git.gianluca.luparini@bugseng.com>
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
headline states:
"A 'u' or 'U' suffix shall be applied to all integer constants
that are represented in an unsigned type".

Add the 'U' suffix to integers literals with unsigned type and also to other
literals used in the same contexts or near violations, when their positive
nature is immediately clear. The latter changes are done for the sake of
uniformity.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
---
Changes in v2:
- change commit title to make it unique
- change commit message
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


