Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3062387E905
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 12:54:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694612.1083521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmBZ7-0001wI-Mt; Mon, 18 Mar 2024 11:54:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694612.1083521; Mon, 18 Mar 2024 11:54:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmBZ7-0001qM-Io; Mon, 18 Mar 2024 11:54:05 +0000
Received: by outflank-mailman (input) for mailman id 694612;
 Mon, 18 Mar 2024 11:54:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QoDm=KY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rmBZ5-0001F2-R8
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 11:54:03 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 361da749-e51e-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 12:54:01 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 0C6044EE0746;
 Mon, 18 Mar 2024 12:54:01 +0100 (CET)
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
X-Inumbo-ID: 361da749-e51e-11ee-a1ee-f123f15fe8a2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH 04/10] xen/device_tree: address violations of MISRA C Rule 20.7
Date: Mon, 18 Mar 2024 12:53:47 +0100
Message-Id: <3845d2a318bdaab242a7fd67473b05198db1b111.1710762555.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710762555.git.nicola.vetrini@bugseng.com>
References: <cover.1710762555.git.nicola.vetrini@bugseng.com>
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
This patch uniforms the way these macros use parentheses, skipping the
already deviated cases of the lhs of an assignment. In principle, all
three could have the parentheses on the macro argument in the lhs added.
---
 xen/include/xen/device_tree.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 6fe2fa8b2123..e6287305a7b5 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -250,7 +250,7 @@ dt_find_interrupt_controller(const struct dt_device_match *matches);
     for ( pp = (dn)->properties; (pp) != NULL; pp = (pp)->next )
 
 #define dt_for_each_device_node(dt, dn)                     \
-    for ( dn = dt; (dn) != NULL; dn = (dn)->allnext )
+    for ( dn = (dt); (dn) != NULL; dn = (dn)->allnext )
 
 #define dt_for_each_child_node(dt, dn)                      \
     for ( dn = (dt)->child; (dn) != NULL; dn = (dn)->sibling )
-- 
2.34.1


