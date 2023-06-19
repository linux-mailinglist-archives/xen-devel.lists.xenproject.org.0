Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF99073510A
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 11:56:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550924.860173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBBcw-0007Ra-Eg; Mon, 19 Jun 2023 09:56:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550924.860173; Mon, 19 Jun 2023 09:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBBcw-0007O4-BR; Mon, 19 Jun 2023 09:56:50 +0000
Received: by outflank-mailman (input) for mailman id 550924;
 Mon, 19 Jun 2023 09:56:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4BTp=CH=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qBBcv-0006UR-2H
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 09:56:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b3da1dc-0e87-11ee-b234-6b7b168915f2;
 Mon, 19 Jun 2023 11:56:48 +0200 (CEST)
Received: from nico.bugseng.com (unknown [151.44.138.43])
 by support.bugseng.com (Postfix) with ESMTPSA id D895A4EE0C8C;
 Mon, 19 Jun 2023 11:56:45 +0200 (CEST)
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
X-Inumbo-ID: 9b3da1dc-0e87-11ee-b234-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 3/3] xen: fix violations of MISRA C:2012 Rule 3.1
Date: Mon, 19 Jun 2023 11:56:13 +0200
Message-Id: <9c3c83c17cb3a4ee9cc1241cefc15840d23d107e.1687167502.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687167502.git.nicola.vetrini@bugseng.com>
References: <cover.1687167502.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the files modified by this patch there are a few occurrences of nested '//'
character sequences inside C-style comment blocks, which violate Rule 3.1.
The patch aims to resolve those by removing the nested comments.

In the file `xen/common/xmalloc_tlsf.c' the comment has been deleted,
following the suggestion of a review comment.

In the file `xen/include/xen/atomic.h' the nested comment has been removed,
since the code sample is already explained by the preceding comment.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com
Changes:
- Resending the patch with the right maintainers in CC.
Changes in V2:
- Split the patch into a series and reworked the fix.
- Apply the fix to the arm32 `flushtlb.h' file, for consistency
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/common/xmalloc_tlsf.c | 3 ---
 xen/include/xen/atomic.h  | 2 +-
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/xen/common/xmalloc_tlsf.c b/xen/common/xmalloc_tlsf.c
index 75bdf18c4e..4f9f60a39d 100644
--- a/xen/common/xmalloc_tlsf.c
+++ b/xen/common/xmalloc_tlsf.c
@@ -140,9 +140,6 @@ static inline void MAPPING_SEARCH(unsigned long *r, int *fl, int *sl)
         *fl = flsl(*r) - 1;
         *sl = (*r >> (*fl - MAX_LOG2_SLI)) - MAX_SLI;
         *fl -= FLI_OFFSET;
-        /*if ((*fl -= FLI_OFFSET) < 0) // FL will be always >0!
-         *fl = *sl = 0;
-         */
         *r &= ~t;
     }
 }
diff --git a/xen/include/xen/atomic.h b/xen/include/xen/atomic.h
index 529213ebbb..fa750a18ae 100644
--- a/xen/include/xen/atomic.h
+++ b/xen/include/xen/atomic.h
@@ -78,7 +78,7 @@ static inline void _atomic_set(atomic_t *v, int i);
  *      int old = atomic_read(&v);
  *      int new = old + 1;
  *      if ( likely(old == atomic_cmpxchg(&v, old, new)) )
- *          break; // success!
+ *          break;
  *  }
  */
 static inline int atomic_cmpxchg(atomic_t *v, int old, int new);
-- 
2.34.1


