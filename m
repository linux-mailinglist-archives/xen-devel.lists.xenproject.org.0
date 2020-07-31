Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E121723451C
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:02:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Tk0-0002Cz-QW; Fri, 31 Jul 2020 12:02:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nr0X=BK=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k1Tjz-00026u-58
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:02:23 +0000
X-Inumbo-ID: af900828-d325-11ea-8e2b-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af900828-d325-11ea-8e2b-bc764e2007e4;
 Fri, 31 Jul 2020 12:02:20 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k1TN6-0001W4-2a; Fri, 31 Jul 2020 12:38:44 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH v2 40/41] cs-bisection-step: Lay out the revision
 tuple graph once
Date: Fri, 31 Jul 2020 12:38:19 +0100
Message-Id: <20200731113820.5765-41-ian.jackson@eu.citrix.com>
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

The graph layout algorithm is not very fast, particularly if the
revision graph is big.  In my test case this saves about 10s.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
v2: New patch.
---
 cs-bisection-step | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/cs-bisection-step b/cs-bisection-step
index 027032a1..8544bac0 100755
--- a/cs-bisection-step
+++ b/cs-bisection-step
@@ -1113,10 +1113,15 @@ END
         or die "$!";
 
     if (eval {
+	print DEBUG "RUNNING dot -Txdot\n";
+	system_checked("dot", "-Txdot", "-o$graphfile.xdot",
+		       "$graphfile.dot");
         foreach my $fmt (qw(ps png svg)) {
-	    print DEBUG "RUNNING dot -T$fmt\n";
-            system_checked("dot", "-T$fmt", "-o$graphfile.$fmt",
-			   "$graphfile.dot");
+	    # neato rather than dot, because neato just uses positions
+	    # etc. in the input whereas dot does (re)calculation work.
+	    print DEBUG "RUNNING neato -n2 -T$fmt\n";
+            system_checked("neato", "-n2", "-T$fmt", "-o$graphfile.$fmt",
+			   "$graphfile.xdot");
         }
 	open SVGI, "$graphfile.svg" or die "$graphfile.svg $!";
 	open SVGO, ">", "$graphfile.svg.new" or die "$graphfile.svg.new $!";
-- 
2.20.1


