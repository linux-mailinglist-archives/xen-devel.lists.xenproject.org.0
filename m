Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6392739E013
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 17:16:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138036.255640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqGzM-0005XH-1n; Mon, 07 Jun 2021 15:16:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138036.255640; Mon, 07 Jun 2021 15:16:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqGzL-0005UC-Q3; Mon, 07 Jun 2021 15:16:27 +0000
Received: by outflank-mailman (input) for mailman id 138036;
 Mon, 07 Jun 2021 15:16:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lqGzK-0005TN-JD
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 15:16:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lqGzK-0002az-IR
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 15:16:26 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lqGzK-0001kT-HE
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 15:16:26 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1lqGzI-0000i8-Sc; Mon, 07 Jun 2021 16:16:24 +0100
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
	Message-Id:Date:Subject:Cc:To:From;
	bh=GD3Qo7Umq5wiIJdpIbajB6oXYpu0bAtv9S8Selleh/I=; b=AhAWnSh297aJHkdksWgIWTAhq8
	WsbSlZ22pcx2XWjPI1csdR5bzRYhQbwtg/m+Wl3qSDG27qYzuPIf5UN7FZKAaNIvh2uXD8cTqJSZA
	uIi8zTkzLDDk+iT/Z3WkrbE17pd9MVTeWbrJMP68Ac0Oe2nHwmQtJUrqghEetM/R8cNU=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 1/3] host allocation: Prepare for further starvation check
Date: Mon,  7 Jun 2021 16:16:12 +0100
Message-Id: <20210607151614.14132-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* Add a new job pattern parameter to $starvation_q
* Add a new $thisclass parameter to starving
* Pass 0 for now.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 ts-hosts-allocate-Executive | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/ts-hosts-allocate-Executive b/ts-hosts-allocate-Executive
index 459b9215..9722ce12 100755
--- a/ts-hosts-allocate-Executive
+++ b/ts-hosts-allocate-Executive
@@ -162,6 +162,7 @@ END
      LEFT JOIN steps
          USING (flight,job)
          WHERE flight= ?
+           AND job LIKE ?
       GROUP BY job, jobs.status
 END
 
@@ -822,11 +823,12 @@ sub most_optimistic ($$$) {
     return $optimist->{Got};
 }
 
-sub starving ($$) {
-    my ($best_start_abs, $now) = @_;
+sub starving ($$$) {
+    my ($best_start_abs, $now, $thisclass) = @_;
     return (0, 'runvar says never give up') unless %$starvation_p;
     return (0, 'no estimate') unless defined $best_start_abs;
-    $starvation_q->execute($flight);
+    my $joblike = $thisclass ? ($job =~ s/(?:(-)|\W).*/$1\%/r) : '%';
+    $starvation_q->execute($flight, $joblike);
     my $d=0;
     my $w=0;
     my $maxfin=0;
@@ -935,7 +937,7 @@ sub attempt_allocation {
 	    }
 	} elsif (%$starvation_p) {
 	    my $est_abs = most_optimistic($best, $now, $starvation_p->{I});
-	    my ($starving, $m) = starving($est_abs, $now);
+	    my ($starving, $m) = starving($est_abs, $now, 0);
 	    $starvation_q->finish();
 	    if (!$starving) {
 		print DEBUG "not starving: $m\n";
-- 
2.20.1


