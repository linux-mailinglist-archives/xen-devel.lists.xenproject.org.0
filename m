Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F5890A8D6
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 10:57:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.741920.1148621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ8B9-0005ro-MO; Mon, 17 Jun 2024 08:57:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 741920.1148621; Mon, 17 Jun 2024 08:57:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ8B9-0005gd-FH; Mon, 17 Jun 2024 08:57:31 +0000
Received: by outflank-mailman (input) for mailman id 741920;
 Mon, 17 Jun 2024 08:57:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UpZp=NT=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sJ8B7-0005Fj-H6
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 08:57:29 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f6f1f56-2c87-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 10:57:28 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 564B14EE075C;
 Mon, 17 Jun 2024 10:57:27 +0200 (CEST)
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
X-Inumbo-ID: 9f6f1f56-2c87-11ef-b4bb-af5377834399
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
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH v2 5/6][RESEND] x86/irq: address violations of MISRA C Rule 20.7
Date: Mon, 17 Jun 2024 10:57:17 +0200
Message-Id: <58b102b7c73c342aa4e2f54b0ab5188944d97450.1718378539.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718378539.git.nicola.vetrini@bugseng.com>
References: <cover.1718378539.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.7 states: "Expressions resulting from the expansion
of macro parameters shall be enclosed in parentheses". Therefore, some
macro definitions should gain additional parentheses to ensure that all
current and future users will be safe with respect to expansions that
can possibly alter the semantics of the passed-in macro parameter.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Note that the rule does not apply to f because that parameter
is not used as an expression in the macro, but rather as an identifier.
---
 xen/include/xen/irq.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
index adf33547d25f..0401f06c4fca 100644
--- a/xen/include/xen/irq.h
+++ b/xen/include/xen/irq.h
@@ -178,7 +178,7 @@ extern struct pirq *pirq_get_info(struct domain *d, int pirq);
 
 #define pirq_field(d, p, f, def) ({ \
     const struct pirq *__pi = pirq_info(d, p); \
-    __pi ? __pi->f : def; \
+    __pi ? __pi->f : (def); \
 })
 #define pirq_to_evtchn(d, pirq) pirq_field(d, pirq, evtchn, 0)
 #define pirq_masked(d, pirq) pirq_field(d, pirq, masked, 0)
-- 
2.34.1

