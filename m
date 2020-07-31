Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A06234580
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:13:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Tu4-00048N-GD; Fri, 31 Jul 2020 12:12:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nr0X=BK=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k1Tu3-000489-Db
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:12:47 +0000
X-Inumbo-ID: 24dc3ab0-d327-11ea-8e2c-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24dc3ab0-d327-11ea-8e2c-bc764e2007e4;
 Fri, 31 Jul 2020 12:12:46 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k1TN3-0001W4-Pd; Fri, 31 Jul 2020 12:38:41 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH v2 36/41] cs-bisection-step: Use db_prepare a few
 times instead of ->do
Date: Fri, 31 Jul 2020 12:38:15 +0100
Message-Id: <20200731113820.5765-37-ian.jackson@eu.citrix.com>
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

With $dbh_tests->do(...), we can only get a debug trace of the queries
by using DBI_TRACE which produces voluminous output.  Using our own
db_prepare invokes our own debugging.

No functional change.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
v2: New patch.
---
 cs-bisection-step | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/cs-bisection-step b/cs-bisection-step
index ba0c6424..1c165b78 100755
--- a/cs-bisection-step
+++ b/cs-bisection-step
@@ -197,7 +197,7 @@ END
 END
     };
 
-    $dbh_tests->do(<<END, {});
+    db_prepare(<<END)->execute();
           CREATE TEMP TABLE tmp_build_info (
               use varchar NOT NULL,
               name varchar NOT NULL,
@@ -206,7 +206,7 @@ END
               )
 END
 
-        $dbh_tests->do(<<END, {}, $job, $flight);
+    db_prepare(<<END)->execute($job, $flight);
     
         INSERT INTO tmp_build_info
         SELECT t.name AS use,
@@ -230,7 +230,7 @@ END
                                END)
 END
 
-    $dbh_tests->do(<<END, {}, $job, $flight);
+    db_prepare(<<END)->execute($job, $flight);
 
         INSERT INTO tmp_build_info
 	    SELECT ''   AS use,
-- 
2.20.1


