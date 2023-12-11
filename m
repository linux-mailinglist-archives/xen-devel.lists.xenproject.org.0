Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FCB80C696
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 11:31:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651595.1017320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCdYb-0005FZ-JM; Mon, 11 Dec 2023 10:30:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651595.1017320; Mon, 11 Dec 2023 10:30:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCdYb-0005D4-Ep; Mon, 11 Dec 2023 10:30:37 +0000
Received: by outflank-mailman (input) for mailman id 651595;
 Mon, 11 Dec 2023 10:30:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BtsV=HW=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rCdYZ-00059V-Ts
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 10:30:35 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 514714a9-9810-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 11:30:34 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 4478F4EE0741;
 Mon, 11 Dec 2023 11:30:33 +0100 (CET)
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
X-Inumbo-ID: 514714a9-9810-11ee-98e8-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 1/7] xen/shutdown: address MISRA C:2012 Rule 2.1
Date: Mon, 11 Dec 2023 11:30:22 +0100
Message-Id: <c0a8a12e39d688e101936d221af0f8eeefabe352.1702283415.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702283415.git.nicola.vetrini@bugseng.com>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Given that 'hwdom_shutdown' is a noreturn function, unreachable
breaks can be eliminated to resolve violations of Rule 2.1.
On the occasion, the type of its parameter is changed to uint8_t.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/common/shutdown.c      | 11 ++---------
 xen/include/xen/shutdown.h |  2 +-
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/xen/common/shutdown.c b/xen/common/shutdown.c
index 37901a4f3391..290f90d70fe1 100644
--- a/xen/common/shutdown.c
+++ b/xen/common/shutdown.c
@@ -30,7 +30,7 @@ static void noreturn maybe_reboot(void)
     }
 }
 
-void hwdom_shutdown(u8 reason)
+void hwdom_shutdown(uint8_t reason)
 {
     switch ( reason )
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
         maybe_reboot();
-        break; /* not reached */
 
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
         maybe_reboot();
-        break; /* not reached */
     }
-}  
-
+}
diff --git a/xen/include/xen/shutdown.h b/xen/include/xen/shutdown.h
index 668aed0be580..3537c30e0a1b 100644
--- a/xen/include/xen/shutdown.h
+++ b/xen/include/xen/shutdown.h
@@ -6,7 +6,7 @@
 /* opt_noreboot: If true, machine will need manual reset on error. */
 extern bool opt_noreboot;
 
-void noreturn hwdom_shutdown(u8 reason);
+void noreturn hwdom_shutdown(uint8_t reason);
 
 void noreturn machine_restart(unsigned int delay_millisecs);
 void noreturn machine_halt(void);
-- 
2.34.1


