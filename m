Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC759234505
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:01:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Tio-0001Rg-32; Fri, 31 Jul 2020 12:01:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nr0X=BK=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k1Tim-0001R9-5A
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:01:08 +0000
X-Inumbo-ID: 83774e7d-d325-11ea-8e2b-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83774e7d-d325-11ea-8e2b-bc764e2007e4;
 Fri, 31 Jul 2020 12:01:07 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k1TMu-0001W4-4C; Fri, 31 Jul 2020 12:38:32 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH v2 16/41] duration_estimator: Return job column in
 first query
Date: Fri, 31 Jul 2020 12:37:55 +0100
Message-Id: <20200731113820.5765-17-ian.jackson@eu.citrix.com>
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Right now this is pointless since the Perl code doesn't need it.  But
this row is going to be part of a WITH clause soon.

No functional change.

Diffs to two example queries (from the Perl DBI trace):

            SELECT f.flight AS flight,
+                   j.job AS job,
                   f.started AS started,
                    j.status AS status
                     FROM flights f
                     JOIN jobs j USING (flight)
                     JOIN runvars r
                             ON  f.flight=r.flight
                            AND  r.name=?
                    WHERE  j.job=r.job
                      AND  f.blessing=?
                      AND  f.branch=?
                      AND  j.job=?
                      AND  r.val=?
                      AND  (j.status='pass' OR j.status='fail'
                           OR j.status='truncated'!)
                      AND  f.started IS NOT NULL
                       AND  f.started >= ?
                  ORDER BY f.started DESC

            SELECT f.flight AS flight,
+                   s.job AS job,
                    NULL as started,
                    NULL as status,
                    max(s.finished) AS max_finished
                      FROM steps s JOIN flights f
                        ON s.flight=f.flight
                     WHERE s.job=? AND f.blessing=? AND f.branch=?
                        AND s.finished IS NOT NULL
                        AND f.started IS NOT NULL
                        AND f.started >= ?
-                     GROUP BY f.flight
+                     GROUP BY f.flight, s.job
                      ORDER BY max_finished DESC

CC: George Dunlap <George.Dunlap@citrix.com>
Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Executive.pm | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Osstest/Executive.pm b/Osstest/Executive.pm
index d45d6557..359120c0 100644
--- a/Osstest/Executive.pm
+++ b/Osstest/Executive.pm
@@ -1148,6 +1148,7 @@ sub duration_estimator ($$;$$) {
     }
     my $recentflights_qtxt= <<END;
             SELECT f.flight AS flight,
+                   j.job AS job,
 		   f.started AS started,
                    j.status AS status
 		     FROM flights f
@@ -1169,6 +1170,7 @@ END
 
     my $duration_anyref_qtxt= <<END;
             SELECT f.flight AS flight,
+                   s.job AS job,
                    NULL as started,
                    NULL as status,
                    max(s.finished) AS max_finished
@@ -1178,7 +1180,7 @@ END
                        AND s.finished IS NOT NULL
                        AND f.started IS NOT NULL
                        AND f.started >= ?
-                     GROUP BY f.flight
+                     GROUP BY f.flight, s.job
                      ORDER BY max_finished DESC
 END
     # s J J J # fix perl-mode
-- 
2.20.1


