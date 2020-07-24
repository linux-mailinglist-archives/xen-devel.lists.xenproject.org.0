Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B32EC22CC51
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 19:40:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jz1fk-0007nl-DT; Fri, 24 Jul 2020 17:39:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ulAu=BD=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jz1fj-0007ng-D9
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 17:39:51 +0000
X-Inumbo-ID: ac5af1e6-cdd4-11ea-8867-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac5af1e6-cdd4-11ea-8867-bc764e2007e4;
 Fri, 24 Jul 2020 17:39:50 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jz1Op-00021j-0g; Fri, 24 Jul 2020 18:22:23 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 10/11] sg-report-host-history: Drop a redundznt AND
 clause
Date: Fri, 24 Jul 2020 18:22:15 +0100
Message-Id: <20200724172216.28204-11-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200724172216.28204-1-ian.jackson@eu.citrix.com>
References: <20200724172216.28204-1-ian.jackson@eu.citrix.com>
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
index 1f5c14e1..787f7c5b 100755
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


