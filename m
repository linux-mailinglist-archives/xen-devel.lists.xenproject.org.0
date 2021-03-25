Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E332B348EBE
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 12:13:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101376.193860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPNvO-0003vz-Qp; Thu, 25 Mar 2021 11:13:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101376.193860; Thu, 25 Mar 2021 11:13:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPNvO-0003vZ-NF; Thu, 25 Mar 2021 11:13:14 +0000
Received: by outflank-mailman (input) for mailman id 101376;
 Thu, 25 Mar 2021 11:13:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lPNvM-0003vL-OL
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 11:13:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lPNvL-0002Mn-CZ; Thu, 25 Mar 2021 11:13:11 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lPNvL-0002fE-0C; Thu, 25 Mar 2021 11:13:11 +0000
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
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=aOQI9Mr0Yo2TD1tNatsazTuCAXLpcS3ebRcXECoMhhw=; b=QG5KoAnmaAdnEe3OVNDsQPEB4g
	rEKBuSu/My5VuL6dh8yDf5xTv0L4Ghp0dyk4nvUHuKPHWWIOY5NW3Ud0L5m9hCp1/e4tVVtYaGG5b
	3O0X/YuM25ucfX993UFIV9PvD3MUmohDmRuxwdlZkZRqC1QS9wd9z0Y9TKpm9CthZo8I=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	raphning@gmail.com,
	edvin.torok@citrix.com,
	jgross@suse.com
Subject: [PATCH for-4.15?] docs/design: Update xenstore-migration.md
Date: Thu, 25 Mar 2021 11:12:55 +0000
Message-Id: <20210325111255.16330-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

It is not very clear the shared page adddress is not contained in the
connection record. Additionally, it is misleading to say the grant
will always point to the share paged as a domain is free to revoke the
permission. The restore code would need to make sure it doesn't
fail/crash if this is happening.

The sentence is now replaced with a paragraph explaining why the GFN is
not preserved and that the grant is not guarantee to exist during
restore.

Take the opportunity to replace "code" with "node" when description the
permission.

Reported-by: Raphael Ning <raphning@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>

---
Cc: raphning@gmail.com
Cc: edvin.torok@citrix.com
Cc: jgross@suse.com

Ian, would you still consider documentation update for 4.15?
---
 docs/designs/xenstore-migration.md | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/docs/designs/xenstore-migration.md b/docs/designs/xenstore-migration.md
index 1a5b94b31da8..5f1155273ec3 100644
--- a/docs/designs/xenstore-migration.md
+++ b/docs/designs/xenstore-migration.md
@@ -216,8 +216,10 @@ For `shared ring` connections it is as follows:
 |           | by xenstored to communicate with `domid`          |
 |           |                                                   |
 
-Since the ABI guarantees that entry 1 in `domid`'s grant table will always
-contain the GFN of the shared page.
+The GFN of the shared page is not preserved because the ABI reserves
+entry 1 in `domid`'s grant table to point to the xenstore shared page.
+Note there is no guarantee the page will still be valid at the time of
+the restore because a domain can revoke the permission.
 
 For `socket` connections it is as follows:
 
@@ -398,7 +400,7 @@ A node permission specifier has the following format:
 |         |                                                     |
 | `domid` | The domain-id to which the permission relates       |
 
-Note that perm1 defines the domain owning the code. See [4] for more
+Note that perm1 defines the domain owning the node. See [4] for more
 explanation of node permissions.
 
 * * *
-- 
2.17.1


