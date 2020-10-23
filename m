Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B368F297356
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 18:15:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11148.29549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVziR-0006u3-DL; Fri, 23 Oct 2020 16:14:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11148.29549; Fri, 23 Oct 2020 16:14:55 +0000
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
	id 1kVziR-0006tb-9y; Fri, 23 Oct 2020 16:14:55 +0000
Received: by outflank-mailman (input) for mailman id 11148;
 Fri, 23 Oct 2020 16:14:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5an6=D6=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kVziP-0006tE-Nb
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:14:53 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d8e22ab-e6c9-40b2-8a2d-ca541c165d7c;
 Fri, 23 Oct 2020 16:14:52 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVziO-00086m-GP
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:14:52 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVziO-0002NH-FT
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:14:52 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kVziM-0008Eb-Mc; Fri, 23 Oct 2020 17:14:50 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5an6=D6=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kVziP-0006tE-Nb
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:14:53 +0000
X-Inumbo-ID: 2d8e22ab-e6c9-40b2-8a2d-ca541c165d7c
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 2d8e22ab-e6c9-40b2-8a2d-ca541c165d7c;
	Fri, 23 Oct 2020 16:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=bypnxhjVJ8hrVMcfMf2eie599ceBF4c9S0o8XImtOP8=; b=CNMrdGwN7QU51wM8mbKr5MB+Dt
	BmON7cpvCNnRPx7mC1vI8NYOp0Th1sQomSET6+WarLDKdmzGjku4OFAhxngYTxje4pXPvNJc2KOSy
	+4kNySUcyd1hyjTlS9v+RrR/UMy/v43mf2wPi2BQ6LO/JE/JDJLuFOIk5gn9xt11bvNI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVziO-00086m-GP
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:14:52 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVziO-0002NH-FT
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:14:52 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVziM-0008Eb-Mc; Fri, 23 Oct 2020 17:14:50 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH] host reuse fixes: Properly clear out old static tasks from history
Date: Fri, 23 Oct 2020 17:14:44 +0100
Message-Id: <20201023161444.2133-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The algorithm for clearing out old lifecycle entries was wrong: it
would delete all entries for non-live tasks.

In practice this would properly remove all the old entries for
non-static tasks, since ownd tasks typically don't releease things
until the task ends (and it becomes non-live).  And it wouldn't remove
more than it should do unless some now-not-live task had an allocation
overlapping with us, which is not supposed to be possible if we are
doing a host wipe.  But it would not remove static tasks ever, since
they are always live.

Change to a completely different algorithm:

 * Check that only us (ie, $ttaskid) has (any shares of) this host
   allocated.  There's a function resource_check_allocated_core which
   already does this and since we're conceptually part of Executive
   it is proper for us to call it.  This is just a sanity check.

 * Delete all lifecycle entries predating the first entry made by
   us.  (We could just delete all entries other than ours, but in
   theory maybe some future code could result in a siutation where
   someone else could have had another share briefly at some point.)

This removes old junk from the "Tasks that could have affected" in
reports.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 Osstest/JobDB/Executive.pm | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/Osstest/JobDB/Executive.pm b/Osstest/JobDB/Executive.pm
index 1dcf55ff..097c8d75 100644
--- a/Osstest/JobDB/Executive.pm
+++ b/Osstest/JobDB/Executive.pm
@@ -515,15 +515,19 @@ sub jobdb_host_update_lifecycle_info ($$$) { #method
 
     if ($mode eq 'wiped') {
 	db_retry($flight, [qw(running)], $dbh_tests,[], sub {
-            $dbh_tests->do(<<END, {}, $hostname);
-                DELETE FROM host_lifecycle h
-                      WHERE hostname=?
-                        AND NOT EXISTS(
-                SELECT 1
-		  FROM tasks t
-		 WHERE t.live
-		   AND t.taskid = h.taskid
-                );
+            my $cshare = Osstest::Executive::resource_check_allocated_core(
+                "host",$hostname);
+            die "others have this host allocated when we have just wiped it! "
+	      .Dumper($cshare)
+	      if $cshare->{Others};
+	    $dbh_tests->do(<<END, {}, $hostname, $hostname, $ttaskid);
+                DELETE FROM host_lifecycle
+		      WHERE hostname=?
+			AND lcseq < (
+			       SELECT min(lcseq) 
+				FROM host_lifecycle
+			       WHERE hostname=? and taskid=?
+			    )
 END
         });
 	logm("host lifecycle: $hostname: wiped, cleared out old info");
-- 
2.20.1


