Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD91234586
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:13:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1TuY-0004MN-Dr; Fri, 31 Jul 2020 12:13:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nr0X=BK=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k1TuW-0004Ac-VG
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:13:16 +0000
X-Inumbo-ID: 33015f95-d327-11ea-8e2c-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33015f95-d327-11ea-8e2c-bc764e2007e4;
 Fri, 31 Jul 2020 12:13:10 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k1TN0-0001W4-Th; Fri, 31 Jul 2020 12:38:39 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH v2 29/41] sg-report-host-history: Drop a redundznt AND
 clause
Date: Fri, 31 Jul 2020 12:38:08 +0100
Message-Id: <20200731113820.5765-30-ian.jackson@eu.citrix.com>
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

This condition is the same as $flightcond.  (This has no effect on the
db performance since the query planner figures it out, but it is
confusing.)

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-host-history | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sg-report-host-history b/sg-report-host-history
index 2ca0e235..f4352fc3 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -175,13 +175,12 @@ sub mainquery ($) {
 	   AND val = ?
 	   AND $flightcond
            AND $restrictflight_cond
-           AND flight > ?
 	 ORDER BY flight DESC
          LIMIT $limit * 2
 END
 
     print DEBUG "MAINQUERY $host...\n";
-    $runvarq->execute($host, $minflight);
+    $runvarq->execute($host);
 
     $hosts{$host} = $runvarq->fetchall_arrayref({});
     print DEBUG "MAINQUERY $host got ".(scalar @{ $hosts{$host} })."\n";
-- 
2.20.1


