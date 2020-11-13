Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA7E2B22AC
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 18:40:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26834.55349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdd3J-0004z8-Qg; Fri, 13 Nov 2020 17:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26834.55349; Fri, 13 Nov 2020 17:40:01 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdd3J-0004xq-NE; Fri, 13 Nov 2020 17:40:01 +0000
Received: by outflank-mailman (input) for mailman id 26834;
 Fri, 13 Nov 2020 17:40:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kdd3I-0004xl-S9
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 17:40:00 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kdd3I-0003on-MU
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 17:40:00 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kdd3G-0001i3-Q2; Fri, 13 Nov 2020 17:39:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kdd3I-0004xl-S9
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 17:40:00 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kdd3I-0003on-MU
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 17:40:00 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kdd3G-0001i3-Q2; Fri, 13 Nov 2020 17:39:58 +0000
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH] cr-daily-branch: Sort out retest build reuse
Date: Fri, 13 Nov 2020 17:39:52 +0000
Message-Id: <20201113173952.29800-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Retest flights ought to reuse precisely the builds from the flight
which prompts the retests.

mg-adjust-flight-makexrefs is the wrong tool for this job.  It can
often leave the retry flights with no build jobs and no references to
the main flights' build jobs, so the results are just broken jobs.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 cr-daily-branch | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/cr-daily-branch b/cr-daily-branch
index e54ca227..6ec3aa62 100755
--- a/cr-daily-branch
+++ b/cr-daily-branch
@@ -529,9 +529,8 @@ END
 			$retry_jobs
 	)
 
-	./mg-adjust-flight-makexrefs -v $rflight \
-		--branch=$branch --revision-osstest=$narness_rev \
-		'^build-*' --debug --blessings=real
+	./cs-adjust-flight -D $rflight \
+			runvar-build-set . . "^$rflight\\." $flight.
 
 	if [ "${OSSTEST_SIMULATE_FAIL_RETRY+y}" = y ]; then
 		export OSSTEST_SIMULATE_FAIL="${OSSTEST_SIMULATE_FAIL_RETRY}"
-- 
2.20.1


