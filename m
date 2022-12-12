Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC163649B48
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 10:35:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459164.716851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fCW-0003KK-ME; Mon, 12 Dec 2022 09:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459164.716851; Mon, 12 Dec 2022 09:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fCW-0003Bu-Eo; Mon, 12 Dec 2022 09:34:20 +0000
Received: by outflank-mailman (input) for mailman id 459164;
 Mon, 12 Dec 2022 09:34:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p4fCU-00037u-SW
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 09:34:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fCU-0000nJ-M3; Mon, 12 Dec 2022 09:34:18 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fCU-0000rv-Ed; Mon, 12 Dec 2022 09:34:18 +0000
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
	bh=vNUJF6QyXHl8BfjlfL/Ywnys+XyjUZ6SAkslh1MkdS4=; b=vVwwV/EXAxhu0+gk9lZL9XxoE2
	/VaZD1ccF+DBCRFutnrEdEe+z+V8G7jLQ6viiQC+aV5+6tJV3Pn9I98n4np8IYr6xTS1ZtA4Ep1dB
	a5ZUuVaiDROVvnovS2IjbPVev37c+8YaaysBERUnpUHNa5451JrVsu6wqoUZofOYkdSk=;
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
Subject: [PATCH 4/8] docs/process: branching-checklist: Clarify steps to add the branch in osstest
Date: Mon, 12 Dec 2022 09:34:06 +0000
Message-Id: <20221212093410.36289-5-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212093410.36289-1-julien@xen.org>
References: <20221212093410.36289-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

The steps to add the new branch in osstest doesn't mention the change
should be committed.

Update the steps to clarify that. Take the opportunity to switch to
use $v instead hardcoded version.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 docs/process/branching-checklist.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/docs/process/branching-checklist.txt b/docs/process/branching-checklist.txt
index a98f6559ab1a..d1550385c96e 100644
--- a/docs/process/branching-checklist.txt
+++ b/docs/process/branching-checklist.txt
@@ -49,7 +49,9 @@ ov=4.0
     OSSTEST_CONFIG=production-config-cambridge ./mg-branch-setup qemu-upstream-$v-testing bisect
 
 * add branch to osstest
-    ie add both eg qemu-upstream-4.2-testing and xen-4.2-testing to BRANCHES in cr-for-branches
+    Add both qemu-upstream-$v-testing and xen-$v-testing to BRANCHES in cr-for-branches
+    git add -p
+    git commit -m "cr-for-branches: Add Xen and QEMU $v branch"
 
 * add to patchbot
     on xenbits
-- 
2.38.1


