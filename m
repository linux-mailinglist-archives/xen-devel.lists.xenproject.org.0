Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 732125B3158
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 10:10:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403911.646171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWZ5C-0002Mj-5c; Fri, 09 Sep 2022 08:09:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403911.646171; Fri, 09 Sep 2022 08:09:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWZ5C-0002JZ-2w; Fri, 09 Sep 2022 08:09:50 +0000
Received: by outflank-mailman (input) for mailman id 403911;
 Fri, 09 Sep 2022 08:09:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F8UZ=ZM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oWZ5A-0002JT-1O
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 08:09:48 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c482408d-3016-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 10:09:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DF9331F8ED;
 Fri,  9 Sep 2022 08:09:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 99222139D5;
 Fri,  9 Sep 2022 08:09:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zytxI8n0GmNwQAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 09 Sep 2022 08:09:45 +0000
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
X-Inumbo-ID: c482408d-3016-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662710985; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=C77PM0r5Nmstj5eEefW3kaBEN4SowKo/1tOewXmIhn0=;
	b=jdqbuTeZtPzEj3soICIcf1IvFtjNcsc4rbmzS2uF9ozUjVsURcKJmN5+fX4Z646U4xrxQg
	sTftlFpKYaYYI0kn9OmjyrGfRxGoBuGXomsGkLkVRGY9KUSPDUcM4d180DL9Vyx3wcM1P1
	7LPUVeH8Be7e7n7cC5QgfOxQ2RJjuHg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen/gnttab: fix gnttab_acquire_resource()
Date: Fri,  9 Sep 2022 10:09:44 +0200
Message-Id: <20220909080944.28559-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 9dc46386d89d ("gnttab: work around "may be used uninitialized"
warning") was wrong, as vaddr can legitimately be NULL in case
XENMEM_resource_grant_table_id_status was specified for a grant table
v1. This would result in crashes in debug builds due to
ASSERT_UNREACHABLE() triggering.

Basically revert said commit, but keep returning -ENODATA in that case.

Fixes: 9dc46386d89d ("gnttab: work around "may be used uninitialized" warning")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
Might be considered for 4.17 and for backporting
---
 xen/common/grant_table.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index ad773a6996..68e7f1df38 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -4125,7 +4125,10 @@ int gnttab_acquire_resource(
 
     case XENMEM_resource_grant_table_id_status:
         if ( gt->gt_version != 2 )
+        {
+            rc = -ENODATA;
             break;
+        }
 
         /* Check that void ** is a suitable representation for gt->status. */
         BUILD_BUG_ON(!__builtin_types_compatible_p(
@@ -4135,17 +4138,6 @@ int gnttab_acquire_resource(
         break;
     }
 
-    /*
-     * Some older toolchains can't spot that vaddrs won't remain uninitialized
-     * on non-error paths, and hence it needs setting to NULL at the top of the
-     * function.  Leave some runtime safety.
-     */
-    if ( !vaddrs )
-    {
-        ASSERT_UNREACHABLE();
-        rc = -ENODATA;
-    }
-
     /* Any errors?  Bad id, or from growing the table? */
     if ( rc )
         goto out;
-- 
2.35.3


