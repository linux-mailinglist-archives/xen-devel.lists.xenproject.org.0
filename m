Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18627244DB6
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:27:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dUD-0005tg-TS; Fri, 14 Aug 2020 17:27:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dQd-00024H-0k
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:23:43 +0000
X-Inumbo-ID: 760e6777-aa2f-4a1a-a86d-ef4f670b4791
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 760e6777-aa2f-4a1a-a86d-ef4f670b4791;
 Fri, 14 Aug 2020 17:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425738;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=zLcHhKo1cmGICQ2dzNfIzPI8l1nwyFvOoh6iuMg7/JM=;
 b=bx2NKp19tbBnW4q0/AagMciZEdpWgUiet9wg5LeAZrUMhA9quBE+WMLk
 KzSrHr76JyeDhlfDLHVWj5XcTiByyOA8D2bEmm1v8NZxQ4iOXRxwCU+6e
 14avMiGeLqgnQVKntdc7AdjU+dHoy0wOymZxVY7oA5e46fyL2zr5gIvs2 4=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: VZVhd9rwqwtWKEI/K/ZXRLl7EVsrakjNSOWIcBpLpsx/jCDOZkn0BqdG8WFs+zCFYIBTlTukA0
 h7juCpDFUL/KX80J/DYcnhygLz85c0/ADnz8CNAp8ChooR4IyJhyPmgMPJqOiTSZeKlFGSxJoF
 oXoFf7hvZCFGbhzB9JwWvN4H/e2+8KJA9HOa9emrMyZqkcoNxmvH25IUeNJrJiyv22nIZCGX35
 vQVmyQT2Vis+KM7uYz8clDy31YmfNHWZrKS9QQWQcFoEDnJkUxZ/d8/Kyx8FhoRGLzOhTCxuj6
 ARY=
X-SBRS: 2.7
X-MesageID: 24725183
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24725183"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 32/60] sg-report-job-history: Prep for fork: Move
 $revisionsq query
Date: Fri, 14 Aug 2020 18:21:37 +0100
Message-ID: <20200814172205.9624-33-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
References: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

We will need to prepare this in add_revisions so that it works when we
do each (job,branch) in a different process.

It is OK that it is still global, becauswe we only call add_revisions
in the children.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-job-history | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sg-report-job-history b/sg-report-job-history
index 47fc7a62..424053f1 100755
--- a/sg-report-job-history
+++ b/sg-report-job-history
@@ -89,15 +89,16 @@ if (defined($flight)) {
     push @jobs, $job;
 }
 
-our $revisionsq= db_prepare(<<END);
+sub add_revisions ($$$$) {
+    my ($revmap, $flightnum, $j, $sfx) = @_;
+
+    our $revisionsq //= db_prepare(<<END);
         SELECT * FROM runvars
          WHERE flight=? AND job=?
            AND name LIKE 'built\\_revision\\_%'
 END
-# (We report on non-main-revision jobs just as for main-revision ones.)
+    # (We report on non-main-revision jobs just as for main-revision ones.)
 
-sub add_revisions ($$$$) {
-    my ($revmap, $flightnum, $j, $sfx) = @_;
     $revisionsq->execute($flightnum, $j);
     while (my $row= $revisionsq->fetchrow_hashref()) {
         my $n= $row->{name};
-- 
2.11.0


