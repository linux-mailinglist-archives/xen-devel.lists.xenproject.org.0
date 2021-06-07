Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7AE39E011
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 17:16:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138037.255645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqGzM-0005aH-BO; Mon, 07 Jun 2021 15:16:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138037.255645; Mon, 07 Jun 2021 15:16:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqGzM-0005Ww-3D; Mon, 07 Jun 2021 15:16:28 +0000
Received: by outflank-mailman (input) for mailman id 138037;
 Mon, 07 Jun 2021 15:16:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lqGzL-0005Tl-2l
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 15:16:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lqGzL-0002b3-23
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 15:16:27 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lqGzL-0001kl-0z
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 15:16:27 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1lqGzJ-0000i8-Bp; Mon, 07 Jun 2021 16:16:25 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=JHUIEH7NL3PT02iIBi/javiAsHyQsQsZlPsWHQfpTwc=; b=AfvlUeN9i4JTYE/cd5S6QYv3+5
	DGpFb5Ie4Zet/scfwVduvHCSe6Sw5STd2LtM2C8an4nHyUl8I97/+43pNWZc2zrzyhGHz2wigaldz
	lk6WWZEHSqM2iP6cuWTF0fTHDw/fbCFuh2sc8NNyW+4mdUcUbjKSJK7pCFRaUKvBtroU=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 3/3] host allocation: Avoid starving out failing tests
Date: Mon,  7 Jun 2021 16:16:14 +0100
Message-Id: <20210607151614.14132-3-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607151614.14132-1-iwj@xenproject.org>
References: <20210607151614.14132-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This can result in bad pushes.  Better to wait.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 ts-hosts-allocate-Executive | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/ts-hosts-allocate-Executive b/ts-hosts-allocate-Executive
index 849bc97b..4dfcd0cd 100755
--- a/ts-hosts-allocate-Executive
+++ b/ts-hosts-allocate-Executive
@@ -704,6 +704,7 @@ sub hid_recurse ($$) {
 	    Selections => [ map { $_->{Selected} } @hids ],
 	    Start => $start_time,
 	    Duration => $duration,
+	    PrevFail => ($previously_failed || $previously_failed_equiv),
 	};
     }
 }
@@ -951,7 +952,11 @@ sub attempt_allocation {
 	    }
 	    $starvation_q->finish();
 	    if ($all_starving) {
-		return $alloc_starved_r;
+		if (!$best->{PrevFail}) {
+		    return $alloc_starved_r;
+		} else {
+		    logm "starving, but previously failed, so continue...";
+		}
 	    }
 	}
     }
-- 
2.20.1


