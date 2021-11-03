Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6254441DB
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 13:47:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220866.382289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miFfB-0007Cb-UR; Wed, 03 Nov 2021 12:46:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220866.382289; Wed, 03 Nov 2021 12:46:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miFfB-00079y-R5; Wed, 03 Nov 2021 12:46:45 +0000
Received: by outflank-mailman (input) for mailman id 220866;
 Wed, 03 Nov 2021 12:46:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1miFfA-00079s-9Z
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 12:46:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1miFfA-0000Dx-4t
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 12:46:44 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1miFfA-0004kl-3l
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 12:46:44 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>) id 1miFf7-0004FT-R7
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 12:46:41 +0000
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
	d=xenproject.org; s=20200302mail; h=Subject:To:Date:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=bNIUA9dwKv+xMM0ZEJqg8KAT93Z7eod3e2jfVLTn/2o=; b=YSDMh/n8O3+Zo27T0NBgqxaPWZ
	thaAtUPWktIFeQYPbmfiwDQDR1HxlbrCcXc2CbDB4PwdE5QnjF13EnloJoa7vCYPZ63ET9vaC5sto
	V14ZvqYZ61mCKAFao3tAGQ/XkZBeim9hPSmjzxd5ud9EvfXBC2g8zbRqVOk/EU7ePYD0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24962.33969.4127.546561@mariner.uk.xensource.com>
Date: Wed, 3 Nov 2021 12:46:41 +0000
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH] starvation: Only count "pass" and "fail" as done jobs

Release implications: I have eyeballed this again and the effect is to
treat some things as not starved as described.  This may make some
additional tests run but only in a good way.  So, formally:
Release-Acked-by: Ian Jackson <iwj@xenproject.org>

From 4a62c669ba9d7635caeac02b0a925bb05199f72a Mon Sep 17 00:00:00 2001
From: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH] starvation: Only count "pass" and "fail" as done jobs
Date: Tue, 12 Oct 2021 18:25:59 +0100

The main effect is to treat "broken" and "blocked" jobs as not part of
the flight for starvation calculations.

This is correct for commissioning flights and OK for other flights.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
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


