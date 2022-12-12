Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 475FC649B45
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 10:35:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459163.716843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fCW-0003C7-6p; Mon, 12 Dec 2022 09:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459163.716843; Mon, 12 Dec 2022 09:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fCW-00038h-2r; Mon, 12 Dec 2022 09:34:20 +0000
Received: by outflank-mailman (input) for mailman id 459163;
 Mon, 12 Dec 2022 09:34:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p4fCU-00035t-GW
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 09:34:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fCT-0000n6-Dn; Mon, 12 Dec 2022 09:34:17 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fCT-0000rv-6G; Mon, 12 Dec 2022 09:34:17 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=77lchHhwHcgImnrvL1V0yWzZRlmrrX3w/h3w2HMcLxw=; b=0DCaQv1+Epv9fygoRtsQSxoAcg
	x7CtuVwdpGkOYzZO0C3RMPn+Aet2Q8ORbZus7QYtDBOQ6B4SkQQLW2JfCcBKDYdX67yFNL2OjMxWu
	UFy5qYeCmztbQPE+EoM91yyhTCmoIJNwuDRePnjeSpwxkuk8PGAnI5jMIIQtq4hlgHvo=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 3/8] docs/process: branching-checklist: Remove reference to root
Date: Mon, 12 Dec 2022 09:34:05 +0000
Message-Id: <20221212093410.36289-4-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212093410.36289-1-julien@xen.org>
References: <20221212093410.36289-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

The steps to generate the documentation for the new branch requires
to ssh as root and then su to run with the user xendocs.

The release technician may not (and should not) have access to root.
So update the step to directly ssh as xendocs.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 docs/process/branching-checklist.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/docs/process/branching-checklist.txt b/docs/process/branching-checklist.txt
index b8101dd0e359..a98f6559ab1a 100644
--- a/docs/process/branching-checklist.txt
+++ b/docs/process/branching-checklist.txt
@@ -25,8 +25,7 @@ ov=4.0
 * make 13:37 <ijc> https://xenbits.xen.org/docs/4.2-testing/ is now live true
 #14:17 <ijc> HOWTO: login to xenbits. become "xendocs" . cd cronjobs . edit
 #            xenbits-docs-all.sh in the obvious way. git commit
-    ssh root@xenbits.xen.org
-    su - xendocs
+    ssh xendocs@xenbits.xen.org
     cd cronjobs
     ed xenbits-docs-all.sh
     /for branch
-- 
2.38.1


