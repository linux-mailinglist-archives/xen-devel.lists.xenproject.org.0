Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A60A928671C
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:29:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3769.11313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEBL-0006fU-CW; Wed, 07 Oct 2020 18:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3769.11313; Wed, 07 Oct 2020 18:28:55 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEBL-0006eK-79; Wed, 07 Oct 2020 18:28:55 +0000
Received: by outflank-mailman (input) for mailman id 3769;
 Wed, 07 Oct 2020 18:28:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE48-00072Q-Ki
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:21:28 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb24c2a7-e8e3-4be2-80b3-d5f4e8342ecc;
 Wed, 07 Oct 2020 18:20:08 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDjz-0007CF-2x; Wed, 07 Oct 2020 19:00:39 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE48-00072Q-Ki
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:21:28 +0000
X-Inumbo-ID: eb24c2a7-e8e3-4be2-80b3-d5f4e8342ecc
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id eb24c2a7-e8e3-4be2-80b3-d5f4e8342ecc;
	Wed, 07 Oct 2020 18:20:08 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDjz-0007CF-2x; Wed, 07 Oct 2020 19:00:39 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <Ian.Jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 23/82] db_retry: Make the sleeps random and increasing
Date: Wed,  7 Oct 2020 18:59:25 +0100
Message-Id: <20201007180024.7932-24-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

When there's a thundering herd, this can run out of retries.

Signed-off-by: Ian Jackson <Ian.Jackson@eu.citrix.com>
---
 Osstest.pm | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Osstest.pm b/Osstest.pm
index 734c0ef6..809194f0 100644
--- a/Osstest.pm
+++ b/Osstest.pm
@@ -311,7 +311,8 @@ sub db_retry ($$$;$$) {
     my ($pre,$body) =
         (ref $code eq 'ARRAY') ? @$code : (sub { }, $code);
 
-    my $retries= 100;
+    my $max_retries= 100;
+    my $retry_count= 0;
     my $r;
     local $db_retry_stop;
     for (;;) {
@@ -339,10 +340,12 @@ sub db_retry ($$$;$$) {
 	};
 	last if !length $@;
 	die $@ unless $mjobdb->need_retry($dbh, $committing);
-        die "$dbh $body $@ ?" unless $retries-- > 0;
+        die "$dbh $body $@ GIVING UP ?" if ++$retry_count >= $max_retries;
 	eval { $dbh->rollback(); };
-	print STDERR "DB conflict (messages above may refer); retrying...\n";
-        sleep(1);
+	my $delay = rand $retry_count;
+	print STDERR "DB conflict (messages above may refer);".
+	    " retrying after $delay...\n";
+        sleep($delay);
     }
     return $r;
 }
-- 
2.20.1


