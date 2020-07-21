Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E602288C1
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 21:07:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxxbW-0004eV-0X; Tue, 21 Jul 2020 19:07:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8efX=BA=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jxxbU-0004d0-GC
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 19:07:04 +0000
X-Inumbo-ID: 5c74bf78-cb85-11ea-85a6-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c74bf78-cb85-11ea-85a6-bc764e2007e4;
 Tue, 21 Jul 2020 19:07:03 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jxxDa-0001u7-I0; Tue, 21 Jul 2020 19:42:22 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 12/14] duration_estimator: Return job column in first
 query
Date: Tue, 21 Jul 2020 19:42:03 +0100
Message-Id: <20200721184205.15232-13-ian.jackson@eu.citrix.com>
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
index ee1bf07e..8e8b3d33 100644
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


