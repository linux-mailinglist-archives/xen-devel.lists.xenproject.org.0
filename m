Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E183254A8
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 18:42:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89893.169817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKeX-0006Dw-GZ; Thu, 25 Feb 2021 17:42:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89893.169817; Thu, 25 Feb 2021 17:42:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKeX-0006CT-8F; Thu, 25 Feb 2021 17:42:17 +0000
Received: by outflank-mailman (input) for mailman id 89893;
 Thu, 25 Feb 2021 17:42:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lFKeW-0006Bm-Aw
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 17:42:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFKeV-0005qz-Js; Thu, 25 Feb 2021 17:42:15 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFKeV-00032g-B9; Thu, 25 Feb 2021 17:42:15 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=Ouy6xY5aZ/aq/+pbqmrj55EhVefIirlCz92nwNMOsZA=; b=x+8bIRwILAv/nmOo1cc9xwPdm
	7qBOBZtcexmHlyNMvcxQsWnqcX9OqY/8HPnwk3AP1njlyD940IhnTQ7kfbGv7Sao2Ml4OJVzbK5Zt
	Uqi/WT+drUEonBHHtA1VUbCaEwWvKrEv2Iz5qTmpa6DZRSt17NnvoUaHxWuZF++9BLGnE=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk,
	iwj@xenproject.org,
	Julien Grall <jgrall@amazon.com>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.15 3/5] tools/xenstored: control: Store the save filename in lu_dump_state
Date: Thu, 25 Feb 2021 17:41:29 +0000
Message-Id: <20210225174131.10115-4-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210225174131.10115-1-julien@xen.org>
References: <20210225174131.10115-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

The function lu_close_dump_state() will use talloc_asprintf() without
checking whether the allocation succeeded. In the unlikely case we are
out of memory, we would dereference a NULL pointer.

As we already computed the filename in lu_get_dump_state(), we can store
the name in the lu_dump_state. This is avoiding to deal with memory file
in the close path and also reduce the risk to use the different
filename.

This bug was discovered and resolved using Coverity Static Analysis
Security Testing (SAST) by Synopsys, Inc.

Fixes: c0dc6a3e7c41 ("tools/xenstore: read internal state when doing live upgrade")
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_control.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 8eb57827765c..653890f2d9e0 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -16,6 +16,7 @@ Interactive commands for Xen Store Daemon.
     along with this program; If not, see <http://www.gnu.org/licenses/>.
 */
 
+#include <assert.h>
 #include <ctype.h>
 #include <errno.h>
 #include <stdarg.h>
@@ -74,6 +75,7 @@ struct lu_dump_state {
 	unsigned int size;
 #ifndef __MINIOS__
 	int fd;
+	char *filename;
 #endif
 };
 
@@ -399,17 +401,16 @@ static void lu_dump_close(FILE *fp)
 
 static void lu_get_dump_state(struct lu_dump_state *state)
 {
-	char *filename;
 	struct stat statbuf;
 
 	state->size = 0;
 
-	filename = talloc_asprintf(NULL, "%s/state_dump", xs_daemon_rootdir());
-	if (!filename)
+	state->filename = talloc_asprintf(NULL, "%s/state_dump",
+					  xs_daemon_rootdir());
+	if (!state->filename)
 		barf("Allocation failure");
 
-	state->fd = open(filename, O_RDONLY);
-	talloc_free(filename);
+	state->fd = open(state->filename, O_RDONLY);
 	if (state->fd < 0)
 		return;
 	if (fstat(state->fd, &statbuf) != 0)
@@ -431,14 +432,13 @@ static void lu_get_dump_state(struct lu_dump_state *state)
 
 static void lu_close_dump_state(struct lu_dump_state *state)
 {
-	char *filename;
+	assert(state->filename != NULL);
 
 	munmap(state->buf, state->size);
 	close(state->fd);
 
-	filename = talloc_asprintf(NULL, "%s/state_dump", xs_daemon_rootdir());
-	unlink(filename);
-	talloc_free(filename);
+	unlink(state->filename);
+	talloc_free(state->filename);
 }
 
 static char *lu_exec(const void *ctx, int argc, char **argv)
-- 
2.17.1


