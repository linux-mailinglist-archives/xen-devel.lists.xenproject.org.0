Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0073A649B44
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 10:35:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459166.716876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fCZ-00040A-F1; Mon, 12 Dec 2022 09:34:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459166.716876; Mon, 12 Dec 2022 09:34:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fCZ-0003yI-AU; Mon, 12 Dec 2022 09:34:23 +0000
Received: by outflank-mailman (input) for mailman id 459166;
 Mon, 12 Dec 2022 09:34:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p4fCX-0003cE-Dn
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 09:34:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fCX-0000o8-6a; Mon, 12 Dec 2022 09:34:21 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fCW-0000rv-VV; Mon, 12 Dec 2022 09:34:21 +0000
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
	bh=s+r0ak95Oyabto+BT3ShctS2hTUt3mW96Cq2J4tzEj0=; b=H60Dc66q88ei40hlWMQKEDUhBV
	nf4zKtuSp54/esj9R+fQ4A5FVDtt6gYqKza5V4h9HIqoS6Z/bJgUZpWllnKQ6TybJRVFY7nsyVVFz
	49C6ZQMp0uI/Nq2z2ewR6PGOsASVPJ0lwZbuKRpQUGd8b0Un+IvcSZHPfGqdgoQjFrqA=;
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
Subject: [PATCH 6/8] docs/process: branching-checklist: Remove section about the cambridge colo
Date: Mon, 12 Dec 2022 09:34:08 +0000
Message-Id: <20221212093410.36289-7-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212093410.36289-1-julien@xen.org>
References: <20221212093410.36289-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

The cambridge colo was internal to Citrix (now Cloud) and hasn't been used
by the community for a while.

So remove the section.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 docs/process/branching-checklist.txt | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/docs/process/branching-checklist.txt b/docs/process/branching-checklist.txt
index 7004f16e8311..c63952886b50 100644
--- a/docs/process/branching-checklist.txt
+++ b/docs/process/branching-checklist.txt
@@ -42,12 +42,6 @@ ov=4.0
     OSSTEST_CONFIG=production-config ./mg-branch-setup xen-$v-testing bisect
     OSSTEST_CONFIG=production-config ./mg-branch-setup qemu-upstream-$v-testing bisect
 
-# make branches etc. in Cambridge osstest
-    ssh osstest@osstest.xs.citrite.net
-    cd testing.git
-    OSSTEST_CONFIG=production-config-cambridge ./mg-branch-setup xen-$v-testing bisect
-    OSSTEST_CONFIG=production-config-cambridge ./mg-branch-setup qemu-upstream-$v-testing bisect
-
 * add branch to osstest
     Add both qemu-upstream-$v-testing and xen-$v-testing to BRANCHES in cr-for-branches
     git add -p
-- 
2.38.1


