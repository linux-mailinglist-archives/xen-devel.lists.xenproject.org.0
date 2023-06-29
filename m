Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EABA7423B7
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 12:07:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556724.869474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEoYV-0001Qz-3G; Thu, 29 Jun 2023 10:07:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556724.869474; Thu, 29 Jun 2023 10:07:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEoYU-0001PM-V9; Thu, 29 Jun 2023 10:07:14 +0000
Received: by outflank-mailman (input) for mailman id 556724;
 Thu, 29 Jun 2023 10:07:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cHn5=CR=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qEoYT-0000mz-TN
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 10:07:13 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7dfd45c-1664-11ee-b237-6b7b168915f2;
 Thu, 29 Jun 2023 12:07:13 +0200 (CEST)
Received: from nico.bugseng.com (unknown [151.43.188.44])
 by support.bugseng.com (Postfix) with ESMTPSA id B76564EE0739;
 Thu, 29 Jun 2023 12:07:10 +0200 (CEST)
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
X-Inumbo-ID: b7dfd45c-1664-11ee-b237-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
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
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v3 3/3] xen: fix violations of MISRA C:2012 Rule 3.1
Date: Thu, 29 Jun 2023 12:06:17 +0200
Message-Id: <c9ff72160539cda49e726ac6ee1486be0d645180.1688032865.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688032865.git.nicola.vetrini@bugseng.com>
References: <cover.1688032865.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the files modified by this patch there are a few occurrences of nested '//'
character sequences inside C-style comment blocks, which violate Rule 3.1.
The patch aims to resolve those by removing the nested comments.

In the file 'xen/common/xmalloc_tlsf.c' the comment has been replaces by
an ASSERT, to ensure that the invariant in the comment is enforced.

In the file 'xen/include/xen/atomic.h' the nested comment has been removed,
since the code sample is already explained by the preceding comment.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Changes:
- Resending the patch with the right maintainers in CC.
Changes in V2:
- Split the patch into a series and reworked the fix;
- Apply the fix to the arm32 `flushtlb.h' file, for consistency.
Changes in V3:
- Replaced commmented-out 'if' with an ASSERT( *fl >= 0 ).
---
 xen/common/xmalloc_tlsf.c | 4 +---
 xen/include/xen/atomic.h  | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/xen/common/xmalloc_tlsf.c b/xen/common/xmalloc_tlsf.c
index 75bdf18c4e..95affcc571 100644
--- a/xen/common/xmalloc_tlsf.c
+++ b/xen/common/xmalloc_tlsf.c
@@ -140,9 +140,7 @@ static inline void MAPPING_SEARCH(unsigned long *r, int *fl, int *sl)
         *fl = flsl(*r) - 1;
         *sl = (*r >> (*fl - MAX_LOG2_SLI)) - MAX_SLI;
         *fl -= FLI_OFFSET;
-        /*if ((*fl -= FLI_OFFSET) < 0) // FL will be always >0!
-         *fl = *sl = 0;
-         */
+        ASSERT( *fl >= 0 );
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


