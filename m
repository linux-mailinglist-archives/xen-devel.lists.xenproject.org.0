Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED9E917EC6
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 12:48:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748739.1156560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMQCd-0005mm-0E; Wed, 26 Jun 2024 10:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748739.1156560; Wed, 26 Jun 2024 10:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMQCc-0005k0-SD; Wed, 26 Jun 2024 10:48:38 +0000
Received: by outflank-mailman (input) for mailman id 748739;
 Wed, 26 Jun 2024 10:48:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+tE4=N4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sMQCa-0005jc-Ow
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 10:48:36 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3722aee-33a9-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 12:48:35 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.214])
 by support.bugseng.com (Postfix) with ESMTPSA id 2E3584EE0738;
 Wed, 26 Jun 2024 12:48:34 +0200 (CEST)
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
X-Inumbo-ID: a3722aee-33a9-11ef-90a3-e314d9c70b13
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [XEN PATCH v2] x86/mctelem: address violations of MISRA C: 2012 Rule 5.3
Date: Wed, 26 Jun 2024 12:48:31 +0200
Message-Id: <94752f77597b05ef9b8a387bf29512b11c0d1e15.1719398571.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

This addresses violations of MISRA C:2012 Rule 5.3 which states as
following: An identifier declared in an inner scope shall not hide an
identifier declared in an outer scope.

In this case the gloabl variable being shadowed is the global static struct
mctctl in this file, therefore the local variables are renamed to avoid this.

No functional change.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- s/mctctl_cpu/ctl/ and amended file comment and commit message
---
 xen/arch/x86/cpu/mcheck/mctelem.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mctelem.c b/xen/arch/x86/cpu/mcheck/mctelem.c
index b8d0368a7d37..123e4102adca 100644
--- a/xen/arch/x86/cpu/mcheck/mctelem.c
+++ b/xen/arch/x86/cpu/mcheck/mctelem.c
@@ -168,28 +168,28 @@ static void mctelem_xchg_head(struct mctelem_ent **headp,
 void mctelem_defer(mctelem_cookie_t cookie, bool lmce)
 {
 	struct mctelem_ent *tep = COOKIE2MCTE(cookie);
-	struct mc_telem_cpu_ctl *mctctl = &this_cpu(mctctl);
+	struct mc_telem_cpu_ctl *ctl = &this_cpu(mctctl);
 
-	ASSERT(mctctl->pending == NULL || mctctl->lmce_pending == NULL);
+	ASSERT(ctl->pending == NULL || ctl->lmce_pending == NULL);
 
-	if (mctctl->pending)
-		mctelem_xchg_head(&mctctl->pending, &tep->mcte_next, tep);
+	if (ctl->pending)
+		mctelem_xchg_head(&ctl->pending, &tep->mcte_next, tep);
 	else if (lmce)
-		mctelem_xchg_head(&mctctl->lmce_pending, &tep->mcte_next, tep);
+		mctelem_xchg_head(&ctl->lmce_pending, &tep->mcte_next, tep);
 	else {
 		/*
 		 * LMCE is supported on Skylake-server and later CPUs, on
 		 * which mce_broadcast is always true. Therefore, non-empty
-		 * mctctl->lmce_pending in this branch implies a broadcasting
+		 * ctl->lmce_pending in this branch implies a broadcasting
 		 * MC# is being handled, every CPU is in the exception
-		 * context, and no one is consuming mctctl->pending at this
+		 * context, and no one is consuming ctl->pending at this
 		 * moment. As a result, the following two exchanges together
 		 * can be treated as atomic.
 		 */
-		if (mctctl->lmce_pending)
-			mctelem_xchg_head(&mctctl->lmce_pending,
-					  &mctctl->pending, NULL);
-		mctelem_xchg_head(&mctctl->pending, &tep->mcte_next, tep);
+		if (ctl->lmce_pending)
+			mctelem_xchg_head(&ctl->lmce_pending,
+					  &ctl->pending, NULL);
+		mctelem_xchg_head(&ctl->pending, &tep->mcte_next, tep);
 	}
 }
 
@@ -213,7 +213,7 @@ void mctelem_process_deferred(unsigned int cpu,
 {
 	struct mctelem_ent *tep;
 	struct mctelem_ent *head, *prev;
-	struct mc_telem_cpu_ctl *mctctl = &per_cpu(mctctl, cpu);
+	struct mc_telem_cpu_ctl *ctl = &per_cpu(mctctl, cpu);
 	int ret;
 
 	/*
@@ -232,7 +232,7 @@ void mctelem_process_deferred(unsigned int cpu,
 	 * Any MC# occurring after the following atomic exchange will be
 	 * handled by another round of MCE softirq.
 	 */
-	mctelem_xchg_head(lmce ? &mctctl->lmce_pending : &mctctl->pending,
+	mctelem_xchg_head(lmce ? &ctl->lmce_pending : &ctl->pending,
 			  &this_cpu(mctctl.processing), NULL);
 
 	head = this_cpu(mctctl.processing);
-- 
2.34.1

