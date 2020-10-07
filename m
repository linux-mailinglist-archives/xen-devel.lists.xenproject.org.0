Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 914B82866E8
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:27:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3682.10762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE9S-0001HW-SF; Wed, 07 Oct 2020 18:26:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3682.10762; Wed, 07 Oct 2020 18:26:58 +0000
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
	id 1kQE9S-0001GC-OL; Wed, 07 Oct 2020 18:26:58 +0000
Received: by outflank-mailman (input) for mailman id 3682;
 Wed, 07 Oct 2020 18:26:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE4h-00072Q-M9
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:22:03 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e10c92d9-2c86-48a5-a857-634025a4b23d;
 Wed, 07 Oct 2020 18:20:26 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDkA-0007CF-6l; Wed, 07 Oct 2020 19:00:50 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE4h-00072Q-M9
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:22:03 +0000
X-Inumbo-ID: e10c92d9-2c86-48a5-a857-634025a4b23d
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e10c92d9-2c86-48a5-a857-634025a4b23d;
	Wed, 07 Oct 2020 18:20:26 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDkA-0007CF-6l; Wed, 07 Oct 2020 19:00:50 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 68/82] host lifecycle: Prevent referential integrity violation
Date: Wed,  7 Oct 2020 19:00:10 +0100
Message-Id: <20201007180024.7932-69-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

We can't use normal constraints for either of these, sadly.

We can make the constraints into a single query which says "OK".

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/JobDB/Executive.pm | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Osstest/JobDB/Executive.pm b/Osstest/JobDB/Executive.pm
index 3a8308e9..f69ce277 100644
--- a/Osstest/JobDB/Executive.pm
+++ b/Osstest/JobDB/Executive.pm
@@ -553,6 +553,28 @@ END
                ON h.taskid = t.taskid
             WHERE h.hostname = ?
          ORDER BY h.lcseq;
+END
+    # We simulate two foreign key constraints which can't be in the
+    # db schema, by checking the values we are going to insert.
+    #
+    # For "resources" we would need a foreign key constraint
+    # with a literal value as part of the foreign key, which is
+    # not supported until PostgreSQL 13.
+    #
+    # For "tasks" we only want to apply the constraint on inserts into
+    # "host_lifecycle" - in particular, we want to allow delet6ions
+    # from "tasks" to render the taskid foreign key unresolvable.
+    # This could be done with a trigger, but since here is the only
+    # place we do insertions into host_lifecycle, this seems easier.
+    my $constraintsq = $dbh_tests->prepare(<<END);
+           SELECT * FROM
+	     (SELECT 1 AS ok
+	        FROM resources where restype='host' and resname=?) 
+              hostname_ok
+             NATURAL JOIN
+             (SELECT 1 AS ok
+                FROM tasks where taskid=? AND live)
+              taskid_ok;
 END
     my $insertq = $dbh_tests->prepare(<<END);
         INSERT INTO host_lifecycle
@@ -632,6 +654,9 @@ END
 		push @lifecycle, "$omarks$otj:$o->{stepno}$osuffix";
 	    }
 	}
+	$constraintsq->execute($hostname, $ttaskid);
+	$constraintsq->fetchrow_array() or confess "$hostname ?";
+
 	if (defined $flight) {
 	    $insertq->execute($hostname, $ttaskid,
 			      $flight, $job,
-- 
2.20.1


