Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF26816ACE
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 11:17:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655807.1023644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFAh2-0006Qf-1g; Mon, 18 Dec 2023 10:17:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655807.1023644; Mon, 18 Dec 2023 10:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFAh1-0006GI-PQ; Mon, 18 Dec 2023 10:17:47 +0000
Received: by outflank-mailman (input) for mailman id 655807;
 Mon, 18 Dec 2023 10:17:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mejk=H5=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rFAh0-00055V-Fw
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 10:17:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id affa4c52-9d8e-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 11:17:46 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id A4D0C4EE0747;
 Mon, 18 Dec 2023 11:17:44 +0100 (CET)
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
X-Inumbo-ID: affa4c52-9d8e-11ee-98eb-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v2 6/7] xen/arm: vcpreg: address violation of MISRA C Rule 2.1
Date: Mon, 18 Dec 2023 11:17:32 +0100
Message-Id: <9816362a11aeb7b9618500dea9bbf32e4b5483a9.1702891792.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702891792.git.nicola.vetrini@bugseng.com>
References: <cover.1702891792.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no path that reaches the call to 'advance_pc', thus violating MISRA C
Rule 2.1.
A call to ASSERT_UNREACHABLE() is added after the switch, despite this being
useful to detect errors only in debug builds; if that marker is ever reached,
a domain crash is triggered, as a defensive coding measure.

No functional change.

Signed-off-by: Julien Grall <julien@xen.org>
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
The code changes (including the comment) were made by Julien in [1]; I added the
commit text and all other informations.

All the switch clauses, when expanded, end with a return statement
and the default clause has an unconditional return, therefore
advance_pc() is never reached.

However, it has been deemed safer to crash the domain if the switch is ever
exited.

[1] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2312151232580.3175268@ubuntu-linux-20-04-desktop/T/#maa91d8025532455a6317119a1e4affa00a99e1ce
---
 xen/arch/arm/vcpreg.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
index 39aeda9dab62..a2d050070473 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -707,8 +707,14 @@ void do_cp10(struct cpu_user_regs *regs, const union hsr hsr)
         inject_undef_exception(regs, hsr);
         return;
     }
-
-    advance_pc(regs, hsr);
+    
+    /*
+     * All the cases in the switch should return. If this is not the
+     * case, then something went wrong and it is best to crash the
+     * domain.
+     */
+    ASSERT_UNREACHABLE();
+    domain_crash(current->domain);
 }
 
 void do_cp(struct cpu_user_regs *regs, const union hsr hsr)
-- 
2.34.1

