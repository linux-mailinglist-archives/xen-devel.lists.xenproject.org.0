Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90151816ACD
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 11:17:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655802.1023601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFAgx-0005N1-5j; Mon, 18 Dec 2023 10:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655802.1023601; Mon, 18 Dec 2023 10:17:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFAgx-0005LD-1w; Mon, 18 Dec 2023 10:17:43 +0000
Received: by outflank-mailman (input) for mailman id 655802;
 Mon, 18 Dec 2023 10:17:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mejk=H5=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rFAgv-00055P-Ki
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 10:17:41 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac6cff72-9d8e-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 11:17:40 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 81AEE4EE0747;
 Mon, 18 Dec 2023 11:17:38 +0100 (CET)
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
X-Inumbo-ID: ac6cff72-9d8e-11ee-9b0f-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 1/7] xen/shutdown: address MISRA C:2012 Rule 2.1
Date: Mon, 18 Dec 2023 11:17:27 +0100
Message-Id: <22881ed8e7e28d66a730deb8812b6a4b7becc750.1702891792.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702891792.git.nicola.vetrini@bugseng.com>
References: <cover.1702891792.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Given that 'hwdom_shutdown' is a noreturn function, unreachable
breaks can be eliminated to resolve violations of Rule 2.1.

The rename s/maybe_reboot/reboot_or_halt/ is done to clarify
that the function is noreturn.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- rename maybe_reboot to reboot_or_halt.
---
 automation/eclair_analysis/ECLAIR/deviations.ecl |  2 +-
 xen/common/shutdown.c                            | 15 ++++-----------
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 683f2bbfe89b..85741a2c01a9 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -16,7 +16,7 @@ Constant expressions and unreachable branches of if and switch statements are ex
 
 -doc_begin="Unreachability caused by calls to the following functions or macros is deliberate and there is no risk of code being unexpectedly left out."
 -config=MC3R1.R2.1,statements+={deliberate,"macro(name(BUG||assert_failed))"}
--config=MC3R1.R2.1,statements+={deliberate, "call(decl(name(__builtin_unreachable||panic||do_unexpected_trap||machine_halt||machine_restart||maybe_reboot)))"}
+-config=MC3R1.R2.1,statements+={deliberate, "call(decl(name(__builtin_unreachable||panic||do_unexpected_trap||machine_halt||machine_restart||reboot_or_halt)))"}
 -doc_end
 
 -doc_begin="Unreachability inside an ASSERT_UNREACHABLE() and analogous macro calls is deliberate and safe."
diff --git a/xen/common/shutdown.c b/xen/common/shutdown.c
index 37901a4f3391..dfd5e41097e9 100644
--- a/xen/common/shutdown.c
+++ b/xen/common/shutdown.c
@@ -15,7 +15,7 @@
 bool __read_mostly opt_noreboot;
 boolean_param("noreboot", opt_noreboot);
 
-static void noreturn maybe_reboot(void)
+static void noreturn reboot_or_halt(void)
 {
     if ( opt_noreboot )
     {
@@ -38,39 +38,32 @@ void hwdom_shutdown(u8 reason)
         printk("Hardware Dom%u halted: halting machine\n",
                hardware_domain->domain_id);
         machine_halt();
-        break; /* not reached */
 
     case SHUTDOWN_crash:
         debugger_trap_immediate();
         printk("Hardware Dom%u crashed: ", hardware_domain->domain_id);
         kexec_crash(CRASHREASON_HWDOM);
-        maybe_reboot();
-        break; /* not reached */
+        reboot_or_halt();
 
     case SHUTDOWN_reboot:
         printk("Hardware Dom%u shutdown: rebooting machine\n",
                hardware_domain->domain_id);
         machine_restart(0);
-        break; /* not reached */
 
     case SHUTDOWN_watchdog:
         printk("Hardware Dom%u shutdown: watchdog rebooting machine\n",
                hardware_domain->domain_id);
         kexec_crash(CRASHREASON_WATCHDOG);
         machine_restart(0);
-        break; /* not reached */
 
     case SHUTDOWN_soft_reset:
         printk("Hardware domain %d did unsupported soft reset, rebooting.\n",
                hardware_domain->domain_id);
         machine_restart(0);
-        break; /* not reached */
 
     default:
         printk("Hardware Dom%u shutdown (unknown reason %u): ",
                hardware_domain->domain_id, reason);
-        maybe_reboot();
-        break; /* not reached */
+        reboot_or_halt();
     }
-}  
-
+}
-- 
2.34.1

