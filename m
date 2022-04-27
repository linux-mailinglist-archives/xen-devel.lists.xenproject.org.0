Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B30ED51146E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 11:50:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314682.532894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njeJ7-0000aF-RK; Wed, 27 Apr 2022 09:50:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314682.532894; Wed, 27 Apr 2022 09:50:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njeJ7-0000Wc-JJ; Wed, 27 Apr 2022 09:50:01 +0000
Received: by outflank-mailman (input) for mailman id 314682;
 Wed, 27 Apr 2022 09:49:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XTRx=VF=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1njeJ5-0008Li-Eh
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 09:49:59 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 6648801b-c60f-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 11:49:58 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 187241480;
 Wed, 27 Apr 2022 02:49:58 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.13.174])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23F0F3F774;
 Wed, 27 Apr 2022 02:49:55 -0700 (PDT)
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
X-Inumbo-ID: 6648801b-c60f-11ec-8fc2-03012f2f19d4
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 3/8] gnttab: Remove unused-but-set variable
Date: Wed, 27 Apr 2022 11:49:36 +0200
Message-Id: <20220427094941.291554-4-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427094941.291554-1-michal.orzel@arm.com>
References: <20220427094941.291554-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function unmap_common_complete defines and sets a variable ld that is
later on passed to a macro gnttab_host_mapping_get_page_type. On arm
this macro does not make use of any arguments causing a compiler to
warn about unused-but-set variable (when -Wunused-but-set-variable is
enabled). Fix this by removing ld and directly passing current->domain
to gnttab_host_mapping_get_page_type.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/common/grant_table.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index febbe12eab..71b1107999 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1556,7 +1556,7 @@ unmap_common(
 static void
 unmap_common_complete(struct gnttab_unmap_common *op)
 {
-    struct domain *ld, *rd = op->rd;
+    struct domain *rd = op->rd;
     struct grant_table *rgt;
     struct active_grant_entry *act;
     grant_entry_header_t *sha;
@@ -1569,8 +1569,6 @@ unmap_common_complete(struct gnttab_unmap_common *op)
         return;
     }
 
-    ld = current->domain;
-
     rcu_lock_domain(rd);
     rgt = rd->grant_table;
 
@@ -1608,7 +1606,7 @@ unmap_common_complete(struct gnttab_unmap_common *op)
         if ( pg )
         {
             if ( gnttab_host_mapping_get_page_type(op->done & GNTMAP_readonly,
-                                                   ld, rd) )
+                                                   current->domain, rd) )
                 put_page_type(pg);
             put_page(pg);
         }
-- 
2.25.1


