Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F283C88703B
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 17:02:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696955.1088234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnhLR-0001js-GA; Fri, 22 Mar 2024 16:02:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696955.1088234; Fri, 22 Mar 2024 16:02:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnhLR-0001gF-8G; Fri, 22 Mar 2024 16:02:13 +0000
Received: by outflank-mailman (input) for mailman id 696955;
 Fri, 22 Mar 2024 16:02:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kYs8=K4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rnhLP-0000W5-V7
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 16:02:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a331fa7-e865-11ee-a1ee-f123f15fe8a2;
 Fri, 22 Mar 2024 17:02:10 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id A7A714EE0C91;
 Fri, 22 Mar 2024 17:02:09 +0100 (CET)
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
X-Inumbo-ID: 8a331fa7-e865-11ee-a1ee-f123f15fe8a2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	George Dunlap <george.dunlap@citrix.com>
Subject: [XEN PATCH 05/11] xen: address MISRA C Rule 20.7 violation in generated hypercall
Date: Fri, 22 Mar 2024 17:01:54 +0100
Message-Id: <323c77d56f8dcbd6bf8f60c84aacff162265807e.1711118582.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1711118582.git.nicola.vetrini@bugseng.com>
References: <cover.1711118582.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.7 states: "Expressions resulting from the expansion
of macro parameters shall be enclosed in parentheses". Therefore, some
macro definitions should gain additional parentheses to ensure that all
current and future users will be safe with respect to expansions that
can possibly alter the semantics of the passed-in macro parameter.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/scripts/gen_hypercall.awk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/scripts/gen_hypercall.awk b/xen/scripts/gen_hypercall.awk
index 9f7cfa298a6d..1a7e051fde10 100644
--- a/xen/scripts/gen_hypercall.awk
+++ b/xen/scripts/gen_hypercall.awk
@@ -277,7 +277,7 @@ END {
                         if (call[i] == ca && call_prio[i] == p_list[pl]) {
                             fnd++;
                             if (fnd == 1)
-                                printf("        if ( num == __HYPERVISOR_%s ) \\\n", fn[call_fn[i]]);
+                                printf("        if ( (num) == __HYPERVISOR_%s ) \\\n", fn[call_fn[i]]);
                             else
                                 printf("        else \\\n");
                             do_call(call_fn[i], call_p[i]);
@@ -290,7 +290,7 @@ END {
             } else {
                 for (i = 1; i <= nc; i++)
                     if (call[i] == ca && call_prio[i] == p_list[pl]) {
-                        printf("if ( likely(num == __HYPERVISOR_%s) ) \\\n", fn[call_fn[i]]);
+                        printf("if ( likely((num) == __HYPERVISOR_%s) ) \\\n", fn[call_fn[i]]);
                         do_call(call_fn[i], call_p[i]);
                     }
             }
-- 
2.34.1


