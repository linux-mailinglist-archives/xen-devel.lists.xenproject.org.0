Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2B17F75E9
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 15:05:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640737.999419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6WnY-0006aj-6p; Fri, 24 Nov 2023 14:04:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640737.999419; Fri, 24 Nov 2023 14:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6WnY-0006VD-1t; Fri, 24 Nov 2023 14:04:48 +0000
Received: by outflank-mailman (input) for mailman id 640737;
 Fri, 24 Nov 2023 14:04:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wuqv=HF=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r6WnW-0005N0-2S
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 14:04:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6beddff9-8ad2-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 15:04:45 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.161.237.167])
 by support.bugseng.com (Postfix) with ESMTPSA id 6F9B94EE0C97;
 Fri, 24 Nov 2023 15:04:44 +0100 (CET)
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
X-Inumbo-ID: 6beddff9-8ad2-11ee-98e2-6d05b1d4d9a1
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
Subject: [XEN PATCH 06/11] xen/notifier: address violations of MISRA C:2012 Rule 8.2
Date: Fri, 24 Nov 2023 15:03:21 +0100
Message-Id: <cdd613a0570b9376eee058e399e4e0cc08ed7df2.1700832962.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700832962.git.federico.serafini@bugseng.com>
References: <cover.1700832962.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/include/xen/notifier.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/include/xen/notifier.h b/xen/include/xen/notifier.h
index 51453c1552..2a952484df 100644
--- a/xen/include/xen/notifier.h
+++ b/xen/include/xen/notifier.h
@@ -23,7 +23,8 @@
  */
 
 struct notifier_block {
-    int (*notifier_call)(struct notifier_block *, unsigned long, void *);
+    int (*notifier_call)(struct notifier_block *nfb, unsigned long action,
+                         void *hcpu);
     struct list_head chain;
     int priority;
 };
-- 
2.34.1


