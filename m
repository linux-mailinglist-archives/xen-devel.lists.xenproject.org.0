Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCFE234501
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:00:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1TiR-0001KY-76; Fri, 31 Jul 2020 12:00:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nr0X=BK=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k1TiP-0001Jk-Jv
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:00:45 +0000
X-Inumbo-ID: 76268c7e-d325-11ea-8e2b-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 76268c7e-d325-11ea-8e2b-bc764e2007e4;
 Fri, 31 Jul 2020 12:00:44 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k1TN4-0001W4-8W; Fri, 31 Jul 2020 12:38:42 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH v2 37/41] cs-bisection-step: temporary table: Insert
 only rows we care about
Date: Fri, 31 Jul 2020 12:38:16 +0100
Message-Id: <20200731113820.5765-38-ian.jackson@eu.citrix.com>
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

Every use of this table has a WHERE or ON which invokes at least one
of these conditions.  So put only those rows into the table.

This provides a significant speedup (which I haven't properly
measured).

No overall functional change.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
v2: New patch.
---
 cs-bisection-step | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/cs-bisection-step b/cs-bisection-step
index 1c165b78..718c87b0 100755
--- a/cs-bisection-step
+++ b/cs-bisection-step
@@ -219,7 +219,9 @@ END
     
            WHERE t.job = ?
 	     AND t.flight = ?
-	     AND t.name LIKE '%buildjob'
+	     AND t.name LIKE '%buildjob' AND
+(@{ $qtxt_common_rev_ok->('b') } OR
+ @{ $qtxt_common_tree_ok->('b') })
 	     AND b.flight = (CASE WHEN t.val NOT LIKE '%.%'
                                   THEN t.flight
                                   ELSE cast(split_part(t.val, '.', 1) AS int)
@@ -239,7 +241,9 @@ END
 	           job  AS job
 	      FROM runvars
 	     WHERE job = ?
-	       AND flight = ?
+	       AND flight = ? AND
+(@{ $qtxt_common_rev_ok->('runvars') } OR
+ @{ $qtxt_common_tree_ok->('runvars') })
 END
 
     my $qtxt_common_results = <<END;
-- 
2.20.1


