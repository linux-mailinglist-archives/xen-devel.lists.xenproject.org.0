Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B79228877
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 20:43:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxxEE-0002Ih-O8; Tue, 21 Jul 2020 18:43:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8efX=BA=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jxxED-0001xV-Nj
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 18:43:01 +0000
X-Inumbo-ID: e9bcdb94-cb81-11ea-85a2-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9bcdb94-cb81-11ea-85a2-bc764e2007e4;
 Tue, 21 Jul 2020 18:42:22 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jxxDZ-0001u7-MD; Tue, 21 Jul 2020 19:42:21 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 09/14] duration_estimator: Ignore truncated jobs
 unless we know the step
Date: Tue, 21 Jul 2020 19:42:00 +0100
Message-Id: <20200721184205.15232-10-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200721184205.15232-1-ian.jackson@eu.citrix.com>
References: <20200721184205.15232-1-ian.jackson@eu.citrix.com>
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

If we are looking for a particular step then we will ignore jobs
without that step, so any job which was truncated before it will be
ignored.

Otherwise we are looking for the whole job duration and a truncated
job is not a good representative.

This is a bugfix (to duration estimation), not a performance
improvement like the preceding and subsequent changes.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Executive.pm | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Osstest/Executive.pm b/Osstest/Executive.pm
index c272e9f2..3cd37c14 100644
--- a/Osstest/Executive.pm
+++ b/Osstest/Executive.pm
@@ -1142,6 +1142,10 @@ sub duration_estimator ($$;$$) {
     # estimated (and only jobs which contained that step will be
     # considered).
 
+    my $or_status_truncated = '';
+    if ($will_uptoincl_testid) {
+	$or_status_truncated = "OR j.status='truncated'!";
+    }
     my $recentflights_q= $dbh_tests->prepare(<<END);
             SELECT f.flight AS flight,
 		   f.started AS started,
@@ -1156,8 +1160,8 @@ sub duration_estimator ($$;$$) {
                       AND  f.branch=?
                       AND  j.job=?
                       AND  r.val=?
-		      AND  (j.status='pass' OR j.status='fail' OR
-                            j.status='truncated')
+		      AND  (j.status='pass' OR j.status='fail'
+                           $or_status_truncated)
                       AND  f.started IS NOT NULL
                       AND  f.started >= ?
                  ORDER BY f.started DESC
-- 
2.20.1


