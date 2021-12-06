Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9F446A3E3
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 19:19:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239730.415729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muIa8-0004Xy-OZ; Mon, 06 Dec 2021 18:19:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239730.415729; Mon, 06 Dec 2021 18:19:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muIa8-0004K5-20; Mon, 06 Dec 2021 18:19:20 +0000
Received: by outflank-mailman (input) for mailman id 239730;
 Mon, 06 Dec 2021 18:19:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1muIa4-00043e-Gn
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:19:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1muIa4-00042q-G1
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:19:16 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1muIa4-0004XL-FE
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:19:16 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1muIZb-0001ab-Lh; Mon, 06 Dec 2021 18:18:47 +0000
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
	bh=bqo9dp3bh1RBhH7U9oY8kFETe1MnW3DmvX4ubqZj5Mg=; b=N2UAcpaYQAmrzs4S0wzvHYUQ07
	enpFOaOdLCYB4IUgqM35kBDh/cM/kSGVI5EDJWeJ8frpq8ywJ3EYMgwIWUjuvXQm4xamKvsxGFzzZ
	oFyjtexfALV932EwD/lLUQ13U3ryLf+0rk8B9o993Wd2tNcFrnyY3OGGNwbPcZARt6SI=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 06/13] starvation: Only count "pass" and "fail" as done jobs
Date: Mon,  6 Dec 2021 18:18:32 +0000
Message-Id: <20211206181839.23463-7-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211206181839.23463-1-iwj@xenproject.org>
References: <20211206181839.23463-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The main effect is to treat "broken" and "blocked" jobs as not part of
the flight for starvation calculations.

This is correct for commissioning flights and OK for other flights.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>
---
 Osstest/Executive.pm        | 3 ++-
 ts-hosts-allocate-Executive | 5 ++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Osstest/Executive.pm b/Osstest/Executive.pm
index d95d848dc..9d7c71369 100644
--- a/Osstest/Executive.pm
+++ b/Osstest/Executive.pm
@@ -1148,7 +1148,8 @@ END
 #        to allow for slow jobs, compared to other jobs
 #    W   number of jobs waiting - strictly, jobs in states
 #          preparing queued running
-#    D   number of jobs done - strictly, other states
+#    D   number of jobs done - strictly, jobs in states
+#          pass fail
 #  tuning parameters:
 #    Xt  X when D=9 W=1, ie cancel one job out of ten
 #    Xh  X when D=1 W=1, ie cancel one job out of two
diff --git a/ts-hosts-allocate-Executive b/ts-hosts-allocate-Executive
index 4dfcd0cd1..19047d49e 100755
--- a/ts-hosts-allocate-Executive
+++ b/ts-hosts-allocate-Executive
@@ -846,11 +846,14 @@ sub starving ($$$) {
 	    # is indistinguishable from a flight which is at the head
 	    # of the queue for a small set of resources.
 	    return (0, "job $j status $st, don't give up just yet");
-	} else {
+	} elsif ($st eq 'pass' ||
+		 $st eq 'fail') {
 	    $d++;
 	    return (0, "job $j status $st but no step finished time!")
 		unless defined $fin;
 	    $maxfin = $fin if $fin > $maxfin;
+	} else {
+	    # disregard - neither W or D
 	}
     }
     # we quit if the total time from the start of the flight
-- 
2.20.1


