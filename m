Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4A8768EE9
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 09:34:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572768.896811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQNQE-0008PF-86; Mon, 31 Jul 2023 07:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572768.896811; Mon, 31 Jul 2023 07:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQNQE-0008MP-4Y; Mon, 31 Jul 2023 07:34:30 +0000
Received: by outflank-mailman (input) for mailman id 572768;
 Mon, 31 Jul 2023 07:34:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wefb=DR=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qQNQC-000873-Cq
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 07:34:28 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adfdc37f-2f74-11ee-b254-6b7b168915f2;
 Mon, 31 Jul 2023 09:34:27 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 221384EE0741;
 Mon, 31 Jul 2023 09:34:26 +0200 (CEST)
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
X-Inumbo-ID: adfdc37f-2f74-11ee-b254-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 2/4] x86/mm: remove variable to avoid shadowing
Date: Mon, 31 Jul 2023 09:33:39 +0200
Message-Id: <734fa59e3f1ee384a5481fb9952f79c8751f04cc.1690788513.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690788513.git.nicola.vetrini@bugseng.com>
References: <cover.1690788513.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The local variable 'p2mt' shadows a declaration of the same variable
in the enclosing scope, but removing the inner declaration
does not alter the semantics ('p2mt' is an output for the get_gfn
call later on) and this resolves a violation of
MISRA C:2012 Rule 5.3.

Both variables were last introduced by commit
d4f699a0df6cea907c1de5c277500b98c0729685.

No functional changes.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Change in v2:
- removed the innermost p2mt instead of renaming it.
---
 xen/arch/x86/mm/p2m.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 714358f953..f6df35767a 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2439,8 +2439,6 @@ int xenmem_add_to_physmap_one(

     case XENMAPSPACE_gmfn:
     {
-        p2m_type_t p2mt;
-
         gfn = idx;
         mfn = get_gfn_unshare(d, gfn, &p2mt);
         /* If the page is still shared, exit early */
--
2.34.1

