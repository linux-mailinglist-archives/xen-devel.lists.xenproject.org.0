Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B235C91213C
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 11:51:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745204.1152369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKavG-00038c-Bd; Fri, 21 Jun 2024 09:51:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745204.1152369; Fri, 21 Jun 2024 09:51:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKavG-000367-8K; Fri, 21 Jun 2024 09:51:10 +0000
Received: by outflank-mailman (input) for mailman id 745204;
 Fri, 21 Jun 2024 09:51:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UDhT=NX=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sKavE-00035y-As
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 09:51:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6c7413d-2fb3-11ef-90a3-e314d9c70b13;
 Fri, 21 Jun 2024 11:51:05 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.202])
 by support.bugseng.com (Postfix) with ESMTPSA id A00AB4EE0738;
 Fri, 21 Jun 2024 11:51:03 +0200 (CEST)
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
X-Inumbo-ID: c6c7413d-2fb3-11ef-90a3-e314d9c70b13
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
Subject: [RFC XEN PATCH] x86/mctelem: address violations of MISRA C: 2012 Rule 5.3
Date: Fri, 21 Jun 2024 11:50:59 +0200
Message-Id: <79eb2f12e521f96a53dd166eb7db485bb3d9d067.1718962824.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

This addresses violations of MISRA C:2012 Rule 5.3 which states as
following: An identifier declared in an inner scope shall not hide an
identifier declared in an outer scope. In this case the shadowing is between
local variables "mctctl" and the file-scope static struct variable with the
same name.

No functional change.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
RFC because I'm not 100% sure the semantics of the code is preserved.
I think so, and it passes gitlab pipelines [1], but there may be some missing
information.

[1] https://gitlab.com/xen-project/people/bugseng/xen/-/pipelines/134025883
---
 xen/arch/x86/cpu/mcheck/mctelem.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mctelem.c b/xen/arch/x86/cpu/mcheck/mctelem.c
index b8d0368a7d37..df1a31bffb61 100644
--- a/xen/arch/x86/cpu/mcheck/mctelem.c
+++ b/xen/arch/x86/cpu/mcheck/mctelem.c
@@ -168,14 +168,14 @@ static void mctelem_xchg_head(struct mctelem_ent **headp,
 void mctelem_defer(mctelem_cookie_t cookie, bool lmce)
 {
 	struct mctelem_ent *tep = COOKIE2MCTE(cookie);
-	struct mc_telem_cpu_ctl *mctctl = &this_cpu(mctctl);
+	struct mc_telem_cpu_ctl *mctctl_cpu = &this_cpu(mctctl);
 
-	ASSERT(mctctl->pending == NULL || mctctl->lmce_pending == NULL);
+	ASSERT(mctctl_cpu->pending == NULL || mctctl_cpu->lmce_pending == NULL);
 
-	if (mctctl->pending)
-		mctelem_xchg_head(&mctctl->pending, &tep->mcte_next, tep);
+	if (mctctl_cpu->pending)
+		mctelem_xchg_head(&mctctl_cpu->pending, &tep->mcte_next, tep);
 	else if (lmce)
-		mctelem_xchg_head(&mctctl->lmce_pending, &tep->mcte_next, tep);
+		mctelem_xchg_head(&mctctl_cpu->lmce_pending, &tep->mcte_next, tep);
 	else {
 		/*
 		 * LMCE is supported on Skylake-server and later CPUs, on
@@ -186,10 +186,10 @@ void mctelem_defer(mctelem_cookie_t cookie, bool lmce)
 		 * moment. As a result, the following two exchanges together
 		 * can be treated as atomic.
 		 */
-		if (mctctl->lmce_pending)
-			mctelem_xchg_head(&mctctl->lmce_pending,
-					  &mctctl->pending, NULL);
-		mctelem_xchg_head(&mctctl->pending, &tep->mcte_next, tep);
+		if (mctctl_cpu->lmce_pending)
+			mctelem_xchg_head(&mctctl_cpu->lmce_pending,
+					  &mctctl_cpu->pending, NULL);
+		mctelem_xchg_head(&mctctl_cpu->pending, &tep->mcte_next, tep);
 	}
 }
 
@@ -213,7 +213,7 @@ void mctelem_process_deferred(unsigned int cpu,
 {
 	struct mctelem_ent *tep;
 	struct mctelem_ent *head, *prev;
-	struct mc_telem_cpu_ctl *mctctl = &per_cpu(mctctl, cpu);
+	struct mc_telem_cpu_ctl *mctctl_cpu = &per_cpu(mctctl, cpu);
 	int ret;
 
 	/*
@@ -232,7 +232,7 @@ void mctelem_process_deferred(unsigned int cpu,
 	 * Any MC# occurring after the following atomic exchange will be
 	 * handled by another round of MCE softirq.
 	 */
-	mctelem_xchg_head(lmce ? &mctctl->lmce_pending : &mctctl->pending,
+	mctelem_xchg_head(lmce ? &mctctl_cpu->lmce_pending : &mctctl_cpu->pending,
 			  &this_cpu(mctctl.processing), NULL);
 
 	head = this_cpu(mctctl.processing);
-- 
2.34.1

