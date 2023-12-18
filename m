Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B5B816ACF
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 11:17:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655805.1023630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFAh1-0006Ak-1e; Mon, 18 Dec 2023 10:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655805.1023630; Mon, 18 Dec 2023 10:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFAh0-00066l-UA; Mon, 18 Dec 2023 10:17:46 +0000
Received: by outflank-mailman (input) for mailman id 655805;
 Mon, 18 Dec 2023 10:17:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mejk=H5=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rFAgz-00055P-4s
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 10:17:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae7ffbaf-9d8e-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 11:17:43 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 674F14EE0C8D;
 Mon, 18 Dec 2023 11:17:42 +0100 (CET)
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
X-Inumbo-ID: ae7ffbaf-9d8e-11ee-9b0f-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v2 4/7] xen/arm: traps: add ASSERT_UNREACHABLE() where needed
Date: Mon, 18 Dec 2023 11:17:30 +0100
Message-Id: <02070d1bb4bfc0e88d548a529bef8bedab5b3488.1702891792.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702891792.git.nicola.vetrini@bugseng.com>
References: <cover.1702891792.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The statements after a call to the noreturn function 'do_unexpected_trap'
can't be reached, thus violating MISRA C:2012 Rule 2.1
("A project shall not contain unreachable code.").
ASSERT_UNREACHABLE() is used to signal that the unreachable break-s are used as
a defensive coding measure to prevent inadvertent fallthrough.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- Use ASSERT_UNREACHABLE() to prevent mistakes.
---
 xen/arch/arm/traps.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 3784e8276ef6..77220ba0927a 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -2152,6 +2152,7 @@ void do_trap_hyp_sync(struct cpu_user_regs *regs)
     case HSR_EC_SVE:
         /* An SVE exception is a bug somewhere in hypervisor code */
         do_unexpected_trap("SVE trap at EL2", regs);
+        ASSERT_UNREACHABLE();
         break;
 #endif
     case HSR_EC_DATA_ABORT_CURR_EL:
@@ -2171,7 +2172,7 @@ void do_trap_hyp_sync(struct cpu_user_regs *regs)
             dump_hyp_walk(get_hfar(is_data));
 
         do_unexpected_trap(fault, regs);
-
+        ASSERT_UNREACHABLE();
         break;
     }
     default:
-- 
2.34.1

