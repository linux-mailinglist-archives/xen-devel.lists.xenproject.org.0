Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B86E724052F
	for <lists+xen-devel@lfdr.de>; Mon, 10 Aug 2020 13:21:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k55rQ-0008Fy-LU; Mon, 10 Aug 2020 11:21:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W5wo=BU=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k55rP-0008Fj-UW
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 11:20:59 +0000
X-Inumbo-ID: 276036f7-fddc-46d1-b86e-4ff89e0331dc
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 276036f7-fddc-46d1-b86e-4ff89e0331dc;
 Mon, 10 Aug 2020 11:20:54 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k55rJ-0003aJ-AT; Mon, 10 Aug 2020 12:20:53 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 2/6] timing traces: cr-publish-flight-logs: Report
 more progress
Date: Mon, 10 Aug 2020 12:20:43 +0100
Message-Id: <20200810112047.30285-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200810112047.30285-1-ian.jackson@eu.citrix.com>
References: <20200810112047.30285-1-ian.jackson@eu.citrix.com>
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

More tools to see where it is faffing too much.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 cr-publish-flight-logs | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/cr-publish-flight-logs b/cr-publish-flight-logs
index 717cb957..ba5d3b70 100755
--- a/cr-publish-flight-logs
+++ b/cr-publish-flight-logs
@@ -43,6 +43,9 @@ die unless $flight =~ m/^\d*$/;
 
 die "usage: ./cr-publish-flight-logs [flight]" unless @ARGV==0;
 
+sub progress { print (show_abs_time time), @_, "\n" }
+
+progress("acquiring publish-lock...");
 open LOCK, "> $c{GlobalLockDir}/publish-lock" or die $!;
 flock LOCK, LOCK_EX or die $!;
 
@@ -51,6 +54,7 @@ if ($push_harness) {
     my $gitdir= $c{HarnessPublishGitRepoDir};
 
     if ($githost && $gitdir) {
+	progress("pushing...");
         eval {
     system_checked("git push $githost:$gitdir HEAD:refs/heads/flight-$flight");
     system_checked("ssh $githost 'cd $gitdir && git update-server-info'");
@@ -72,9 +76,10 @@ sub copydir ($$) {
     push @cmd, '-e', join(' ', map { s/\'/''/g; "'$_'"; } @ssh);
     #--bwlimit=50
     push @cmd, $src, $dst;
-    print "+ @cmd\n";
+    progress "+ @cmd";
     $!=0; $?=0; system @cmd; die "rsync $? $!" if $? or $!;
 }
 
 copydir(qw(Logs), "/$flight") if $flight;
 copydir(qw(Results), '');
+progress "complete.";
-- 
2.20.1


