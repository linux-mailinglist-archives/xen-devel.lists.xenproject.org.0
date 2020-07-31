Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F3E234510
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:02:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Tjk-00022R-Ud; Fri, 31 Jul 2020 12:02:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nr0X=BK=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k1Tjk-000224-5W
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:02:08 +0000
X-Inumbo-ID: a796ee7b-d325-11ea-8e2b-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a796ee7b-d325-11ea-8e2b-bc764e2007e4;
 Fri, 31 Jul 2020 12:02:07 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k1TMs-0001W4-9R; Fri, 31 Jul 2020 12:38:30 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH v2 11/41] sg-report-flight: Use the job row from the
 intitial query
Date: Fri, 31 Jul 2020 12:37:50 +0100
Message-Id: <20200731113820.5765-12-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200731113820.5765-1-ian.jackson@eu.citrix.com>
References: <20200731113820.5765-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

$jcheckq is redundant: we looked this up right at the start.

This is not expected to speed things up very much, but it makes things
somewhat cleaner and clearer.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-flight | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sg-report-flight b/sg-report-flight
index d218b24e..cb6b8174 100755
--- a/sg-report-flight
+++ b/sg-report-flight
@@ -160,10 +160,6 @@ sub findaflight ($$$$$) {
         return undef;
     }
 
-    my $jcheckq= db_prepare(<<END);
-        SELECT status FROM jobs WHERE flight=? AND job=?
-END
-
     my $checkq= db_prepare(<<END);
         SELECT status FROM steps WHERE flight=? AND job=? AND testid=?
                                    AND status!='skip'
@@ -263,7 +259,7 @@ $runvars_conds
             ORDER BY flight DESC
             LIMIT 1000
       )
-      SELECT *
+      SELECT flight, jobs.status
         FROM sub
 $flightsq_jobs_join
        WHERE (1=1)
@@ -304,7 +300,7 @@ END
                 WHERE flight=?
 END
 
-    while (my ($tflight) = $flightsq->fetchrow_array) {
+    while (my ($tflight, $tjstatus) = $flightsq->fetchrow_array) {
 	# Recurse from the starting flight looking for relevant build
 	# jobs.  We start with all jobs in $tflight, and for each job
 	# we also process any other jobs it refers to in *buildjob runvars.
@@ -407,8 +403,7 @@ END
             $checkq->execute($tflight, $job, $testid);
             ($chkst) = $checkq->fetchrow_array();
 	    if (!defined $chkst) {
-		$jcheckq->execute($tflight, $job);
-		my ($jchkst) = $jcheckq->fetchrow_array();
+		my $jchkst = $tflight->{status};
 		$chkst = $jchkst if $jchkst eq 'starved';
 	    }
         }
-- 
2.20.1


