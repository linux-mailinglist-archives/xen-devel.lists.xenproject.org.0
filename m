Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBBC2866D1
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:19:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3650.10619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE2E-0007gD-71; Wed, 07 Oct 2020 18:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3650.10619; Wed, 07 Oct 2020 18:19:30 +0000
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
	id 1kQE2E-0007fV-2S; Wed, 07 Oct 2020 18:19:30 +0000
Received: by outflank-mailman (input) for mailman id 3650;
 Wed, 07 Oct 2020 18:19:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE2C-00072Q-Gs
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:19:28 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 989061d0-f358-42fb-b8df-8c1884493470;
 Wed, 07 Oct 2020 18:19:11 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDk6-0007CF-Qb; Wed, 07 Oct 2020 19:00:46 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE2C-00072Q-Gs
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:19:28 +0000
X-Inumbo-ID: 989061d0-f358-42fb-b8df-8c1884493470
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 989061d0-f358-42fb-b8df-8c1884493470;
	Wed, 07 Oct 2020 18:19:11 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDk6-0007CF-Qb; Wed, 07 Oct 2020 19:00:46 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 54/82] host reuse: Use literal for the hosts_infraprioritygroup runvar
Date: Wed,  7 Oct 2020 18:59:56 +0100
Message-Id: <20201007180024.7932-55-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

At some point this might make the database smarter about indexing.
It's certainly clearer.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/JobDB/Executive.pm | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Osstest/JobDB/Executive.pm b/Osstest/JobDB/Executive.pm
index 8c235d45..8fde2934 100644
--- a/Osstest/JobDB/Executive.pm
+++ b/Osstest/JobDB/Executive.pm
@@ -403,19 +403,19 @@ sub jobdb_set_hosts_infraprioritygroup ($$$$;$) { # method
                (job = ?) AS thisjob
           FROM runvars
          WHERE flight=?
-           AND name=?
+           AND name='$vn'
       ORDER BY thisjob DESC
 END
     my $insertq = $dbh_tests->prepare(<<END);
-        INSERT INTO runvars (flight,job, name,val, synth)
-                     VALUES (?,     ?,   ?,   ?,   't')
+        INSERT INTO runvars (flight,job, name,  val, synth)
+                     VALUES (?,     ?,   '$vn', ?,   't')
 END
 
     my $resulting;
     db_retry($dbh_tests,[],sub {
 	my $use = 1;
 	$resulting = undef;
-        $queryq->execute($job, $flight, $vn);
+        $queryq->execute($job, $flight);
 	while (my ($tjob, $tval, $thisjob) = $queryq->fetchrow_array()) {
 	    if ($thisjob) {
 		logm("$vn: job is already in group $tval");
@@ -431,7 +431,7 @@ END
 	}
 	$resulting = "$use:$group_key";
 	logm("$vn: inserting job into group $resulting");
-	$insertq->execute($flight,$job,$vn, $resulting);
+	$insertq->execute($flight,$job, $resulting);
     });
     $rref->{$vn} = $resulting if $rref && defined $resulting;
 }
-- 
2.20.1


