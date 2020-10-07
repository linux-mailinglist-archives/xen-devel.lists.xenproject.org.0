Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01765286705
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:28:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3708.11061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEAK-0003nb-Qd; Wed, 07 Oct 2020 18:27:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3708.11061; Wed, 07 Oct 2020 18:27:52 +0000
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
	id 1kQEAJ-0003j1-Uu; Wed, 07 Oct 2020 18:27:51 +0000
Received: by outflank-mailman (input) for mailman id 3708;
 Wed, 07 Oct 2020 18:27:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE6i-00072Q-RM
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:24:08 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e085007-4ceb-414a-9a23-2ce256872ea1;
 Wed, 07 Oct 2020 18:21:52 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDk9-0007CF-W7; Wed, 07 Oct 2020 19:00:50 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE6i-00072Q-RM
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:24:08 +0000
X-Inumbo-ID: 9e085007-4ceb-414a-9a23-2ce256872ea1
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9e085007-4ceb-414a-9a23-2ce256872ea1;
	Wed, 07 Oct 2020 18:21:52 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDk9-0007CF-W7; Wed, 07 Oct 2020 19:00:50 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 67/82] host lifecycle: Fix detection of concurrent jobs
Date: Wed,  7 Oct 2020 19:00:09 +0100
Message-Id: <20201007180024.7932-68-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous algorithm was wrong here.

This commit was originally considerably later than the previous one.
I'm avoiding squshing this commit, to make future archaeology easier.
The effect of the bug is to report other tasks as live too often, so
hosts show up as shared rather than reused.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 Osstest/JobDB/Executive.pm | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/Osstest/JobDB/Executive.pm b/Osstest/JobDB/Executive.pm
index cf82b4cf..3a8308e9 100644
--- a/Osstest/JobDB/Executive.pm
+++ b/Osstest/JobDB/Executive.pm
@@ -561,17 +561,15 @@ END
 END
 
     my $ojvn = "$ho->{Ident}_lifecycle";
-    my $firstrun;
 
     if (length $r{$ojvn}) {
 	my ($oldsigil,) = reverse split / /, $r{$ojvn};
 	$oldsigil = '' unless $oldsigil =~ m/^\W$/;
 	return if $newsigil ne '' && $oldsigil eq $newsigil;
-    } else {
-	$firstrun = 1;
     }
 
     my @lifecycle;
+    my $seen_us;
     db_retry($dbh_tests,[], sub {
 	my $elided;
 	@lifecycle = ();
@@ -581,10 +579,10 @@ END
 
 	while (my $o = $scanq->fetchrow_hashref()) {
 	    my $olive =
-	      # Any job which appeared since we started thinking
-	      # about this must have been concurrent with us,
-	      # even if it is dead now.
-	      (!$firstrun || $o->{live}) &&
+	      # Any job with any entry after we put ourselves in the
+	      # table must have been concurrent with us, even if it is
+	      # dead now.
+	      ($seen_us || $o->{live}) &&
 	      # If this task is still live, we need to have something
 	      # with a live mark, generally all the prep will have
 	      # occurred already, so we don't mark the prep as live
@@ -597,6 +595,7 @@ END
 		$o->{job} eq $job) {
 		# Don't put the + mark on our own entries.
 		$olivemark = '';
+		$seen_us = 1;
 	    }
 
 	    my $oisprepmark = !!$o->{isprep} && '@';
-- 
2.20.1


