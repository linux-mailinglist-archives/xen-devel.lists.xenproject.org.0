Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D82D5594EB9
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 04:38:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387837.624313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNmSO-00087Y-Sw; Tue, 16 Aug 2022 02:37:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387837.624313; Tue, 16 Aug 2022 02:37:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNmSO-00085E-Oi; Tue, 16 Aug 2022 02:37:28 +0000
Received: by outflank-mailman (input) for mailman id 387837;
 Tue, 16 Aug 2022 02:37:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YdlV=YU=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oNmSO-0007FY-62
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 02:37:28 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 5df339fd-1d0c-11ed-924f-1f966e50362f;
 Tue, 16 Aug 2022 04:37:27 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91C27106F;
 Mon, 15 Aug 2022 19:37:27 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 677453F70D;
 Mon, 15 Aug 2022 19:37:23 -0700 (PDT)
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
X-Inumbo-ID: 5df339fd-1d0c-11ed-924f-1f966e50362f
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v10 3/9] xen: do not merge reserved pages in free_heap_pages()
Date: Tue, 16 Aug 2022 10:36:52 +0800
Message-Id: <20220816023658.3551936-4-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220816023658.3551936-1-Penny.Zheng@arm.com>
References: <20220816023658.3551936-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code in free_heap_pages() will try to merge pages with the
successor/predecessor if pages are suitably aligned. So if the pages
reserved are right next to the pages given to the heap allocator,
free_heap_pages() will merge them, and give the reserved pages to heap
allocator accidentally as a result.

So in order to avoid the above scenario, this commit updates free_heap_pages()
to check whether the predecessor and/or successor has PGC_static set,
when trying to merge the about-to-be-freed chunk with the predecessor
and/or successor.

Suggested-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
v10 changes:
- commit message typo fix
---
v9 changes:
- no change
---
v8 changes:
- no change
---
v7 changes:
- no change
---
v6 changes:
- adapt to PGC_static
---
v5 changes:
- change PGC_reserved to adapt to PGC_staticmem
---
v4 changes:
- no changes
---
v3 changes:
- no changes
---
v2 changes:
- new commit
---
 xen/common/page_alloc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 5e97dcaa26..1be7f671dc 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1483,6 +1483,7 @@ static void free_heap_pages(
             /* Merge with predecessor block? */
             if ( !mfn_valid(page_to_mfn(predecessor)) ||
                  !page_state_is(predecessor, free) ||
+                 (predecessor->count_info & PGC_static) ||
                  (PFN_ORDER(predecessor) != order) ||
                  (phys_to_nid(page_to_maddr(predecessor)) != node) )
                 break;
@@ -1506,6 +1507,7 @@ static void free_heap_pages(
             /* Merge with successor block? */
             if ( !mfn_valid(page_to_mfn(successor)) ||
                  !page_state_is(successor, free) ||
+                 (successor->count_info & PGC_static) ||
                  (PFN_ORDER(successor) != order) ||
                  (phys_to_nid(page_to_maddr(successor)) != node) )
                 break;
-- 
2.25.1


