Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D905195D6F
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 19:18:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHtW2-00047I-Ev; Fri, 27 Mar 2020 18:15:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tAzE=5M=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jHtW1-000473-K5
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 18:15:33 +0000
X-Inumbo-ID: f29ec2da-7056-11ea-92cf-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f29ec2da-7056-11ea-92cf-bc764e2007e4;
 Fri, 27 Mar 2020 18:15:33 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jHtW0-0004UK-D8; Fri, 27 Mar 2020 18:15:32 +0000
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 27 Mar 2020 18:15:22 +0000
Message-Id: <20200327181526.19412-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200327181526.19412-1-ian.jackson@eu.citrix.com>
References: <20200327181526.19412-1-ian.jackson@eu.citrix.com>
Subject: [Xen-devel] [OSSTEST PATCH 2/6] ts-logs-capture: Introduce
 @allguests containing even non-running
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

Nothing looks at this yet.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 ts-logs-capture | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/ts-logs-capture b/ts-logs-capture
index d16372f2..88b19658 100755
--- a/ts-logs-capture
+++ b/ts-logs-capture
@@ -39,7 +39,7 @@ if (!$ho) {
     exit 0;
 }
 
-our @guests;
+our (@allguests, @guests);
 
 sub find_guests () {
     my $sth= $dbh_tests->prepare(<<END);
@@ -59,12 +59,13 @@ END
 	    1;
 	}) {
 	    logm("cannot find domid: $@");;
-	    next;
 	}
 
-	push @guests, $gho;
+	push @allguests, $gho;
     }
     $sth->finish();
+
+    @guests = grep { defined $_->{Domid} } @allguests;
 }
 
 sub try_fetch_logs ($$) {
-- 
2.11.0


