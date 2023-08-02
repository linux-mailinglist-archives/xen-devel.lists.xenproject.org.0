Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5386776D03C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 16:38:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574978.900686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRCzu-00086O-0H; Wed, 02 Aug 2023 14:38:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574978.900686; Wed, 02 Aug 2023 14:38:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRCzt-0007vk-LZ; Wed, 02 Aug 2023 14:38:45 +0000
Received: by outflank-mailman (input) for mailman id 574978;
 Wed, 02 Aug 2023 14:38:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YIS5=DT=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qRCzr-0006bO-QZ
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 14:38:43 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 473a13cb-3142-11ee-b260-6b7b168915f2;
 Wed, 02 Aug 2023 16:38:42 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id EE2194EE073F;
 Wed,  2 Aug 2023 16:38:41 +0200 (CEST)
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
X-Inumbo-ID: 473a13cb-3142-11ee-b260-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 07/11] xen: address MISRA C:2012 Rule 2.1
Date: Wed,  2 Aug 2023 16:38:13 +0200
Message-Id: <7f8cbd8c8ad64cd3a0d099f31cb4d3fad48aa63b.1690985045.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690985045.git.nicola.vetrini@bugseng.com>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 2.1 states: "A project shall not contain unreachable code".

The functions
- machine_halt
- maybe_reboot
- machine_restart
are not supposed to return, hence the following break statement
is marked as intentionally unreachable with the ASSERT_UNREACHABLE()
macro to justify the violation of the rule.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/common/shutdown.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/xen/common/shutdown.c b/xen/common/shutdown.c
index a933ee001e..88f735a30e 100644
--- a/xen/common/shutdown.c
+++ b/xen/common/shutdown.c
@@ -38,39 +38,45 @@ void hwdom_shutdown(u8 reason)
         printk("Hardware Dom%u halted: halting machine\n",
                hardware_domain->domain_id);
         machine_halt();
-        break; /* not reached */
+        ASSERT_UNREACHABLE();
+        break;
 
     case SHUTDOWN_crash:
         debugger_trap_immediate();
         printk("Hardware Dom%u crashed: ", hardware_domain->domain_id);
         kexec_crash(CRASHREASON_HWDOM);
         maybe_reboot();
-        break; /* not reached */
+        ASSERT_UNREACHABLE();
+        break;
 
     case SHUTDOWN_reboot:
         printk("Hardware Dom%u shutdown: rebooting machine\n",
                hardware_domain->domain_id);
         machine_restart(0);
-        break; /* not reached */
+        ASSERT_UNREACHABLE();
+        break;
 
     case SHUTDOWN_watchdog:
         printk("Hardware Dom%u shutdown: watchdog rebooting machine\n",
                hardware_domain->domain_id);
         kexec_crash(CRASHREASON_WATCHDOG);
         machine_restart(0);
-        break; /* not reached */
+        ASSERT_UNREACHABLE();
+        break;
 
     case SHUTDOWN_soft_reset:
         printk("Hardware domain %d did unsupported soft reset, rebooting.\n",
                hardware_domain->domain_id);
         machine_restart(0);
-        break; /* not reached */
+        ASSERT_UNREACHABLE();
+        break;
 
     default:
         printk("Hardware Dom%u shutdown (unknown reason %u): ",
                hardware_domain->domain_id, reason);
         maybe_reboot();
-        break; /* not reached */
+        ASSERT_UNREACHABLE();
+        break;
     }
 }  
 
-- 
2.34.1


