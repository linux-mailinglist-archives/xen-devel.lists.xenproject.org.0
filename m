Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE480765856
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 18:10:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571222.894564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP3ZF-0008K9-P4; Thu, 27 Jul 2023 16:10:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571222.894564; Thu, 27 Jul 2023 16:10:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP3ZF-0008I4-MH; Thu, 27 Jul 2023 16:10:21 +0000
Received: by outflank-mailman (input) for mailman id 571222;
 Thu, 27 Jul 2023 16:10:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dT6+=DN=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qP3ZE-0008Hy-PB
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 16:10:20 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14c99a2c-2c98-11ee-b24a-6b7b168915f2;
 Thu, 27 Jul 2023 18:10:19 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.161.207.213])
 by support.bugseng.com (Postfix) with ESMTPSA id 99D754EE073F;
 Thu, 27 Jul 2023 18:10:17 +0200 (CEST)
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
X-Inumbo-ID: 14c99a2c-2c98-11ee-b24a-6b7b168915f2
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] xen/notifier: address violations of MISRA C:2012 Rule 8.3
Date: Thu, 27 Jul 2023 18:10:10 +0200
Message-Id: <d362ef56c8c31bcca47d71a430879f087d9a9d04.1690474136.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change parameter names in function declarations to be consistent with
the corresponding definitions. This addesses violations of MISRA C:2012
Rule 8.3: "All declarations of an object or function shall use the same
names and type qualifiers".

No functional changes.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/include/xen/notifier.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/xen/notifier.h b/xen/include/xen/notifier.h
index 3d6017d4f7..51453c1552 100644
--- a/xen/include/xen/notifier.h
+++ b/xen/include/xen/notifier.h
@@ -37,9 +37,9 @@ struct notifier_head {
 
 
 void notifier_chain_register(
-    struct notifier_head *nh, struct notifier_block *nb);
+    struct notifier_head *nh, struct notifier_block *n);
 void notifier_chain_unregister(
-    struct notifier_head *nh, struct notifier_block *nb);
+    struct notifier_head *nh, struct notifier_block *n);
 
 int notifier_call_chain(
     struct notifier_head *nh, unsigned long val, void *v,
-- 
2.34.1


