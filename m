Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3201880C691
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 11:31:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651599.1017358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCdYg-0006BQ-1S; Mon, 11 Dec 2023 10:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651599.1017358; Mon, 11 Dec 2023 10:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCdYf-00064Z-RV; Mon, 11 Dec 2023 10:30:41 +0000
Received: by outflank-mailman (input) for mailman id 651599;
 Mon, 11 Dec 2023 10:30:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BtsV=HW=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rCdYe-0005Em-3t
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 10:30:40 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52e3650c-9810-11ee-9b0f-b553b5be7939;
 Mon, 11 Dec 2023 11:30:37 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 959214EE0740;
 Mon, 11 Dec 2023 11:30:36 +0100 (CET)
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
X-Inumbo-ID: 52e3650c-9810-11ee-9b0f-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH 5/7] xen/arm: traps: add ASSERT_UNREACHABLE() where needed
Date: Mon, 11 Dec 2023 11:30:26 +0100
Message-Id: <394b69b769f2dc2461d2ddb0c7e037f4794eb244.1702283415.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702283415.git.nicola.vetrini@bugseng.com>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The branches of the switch after a call to 'do_unexpected_trap'
cannot return, but there is one path that may return, hence
only some clauses are marked with ASSERT_UNREACHABLE().

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/arm/traps.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 3784e8276ef6..e7c920b043d2 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -2152,7 +2152,7 @@ void do_trap_hyp_sync(struct cpu_user_regs *regs)
     case HSR_EC_SVE:
         /* An SVE exception is a bug somewhere in hypervisor code */
         do_unexpected_trap("SVE trap at EL2", regs);
-        break;
+        ASSERT_UNREACHABLE();
 #endif
     case HSR_EC_DATA_ABORT_CURR_EL:
     case HSR_EC_INSTR_ABORT_CURR_EL:
@@ -2171,13 +2171,13 @@ void do_trap_hyp_sync(struct cpu_user_regs *regs)
             dump_hyp_walk(get_hfar(is_data));
 
         do_unexpected_trap(fault, regs);
-
-        break;
+        ASSERT_UNREACHABLE();
     }
     default:
         printk("Hypervisor Trap. HSR=%#"PRIregister" EC=0x%x IL=%x Syndrome=0x%"PRIx32"\n",
                hsr.bits, hsr.ec, hsr.len, hsr.iss);
         do_unexpected_trap("Hypervisor", regs);
+        ASSERT_UNREACHABLE();
     }
 }
 
-- 
2.34.1


