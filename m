Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A9B28671E
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:29:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3771.11334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEBO-0006lU-6K; Wed, 07 Oct 2020 18:28:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3771.11334; Wed, 07 Oct 2020 18:28:57 +0000
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
	id 1kQEBN-0006i9-7K; Wed, 07 Oct 2020 18:28:57 +0000
Received: by outflank-mailman (input) for mailman id 3771;
 Wed, 07 Oct 2020 18:28:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE64-00072Q-Py
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:23:28 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 029da054-f876-40dd-a094-2e3f3d07448a;
 Wed, 07 Oct 2020 18:21:29 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDk6-0007CF-BH; Wed, 07 Oct 2020 19:00:46 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE64-00072Q-Py
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:23:28 +0000
X-Inumbo-ID: 029da054-f876-40dd-a094-2e3f3d07448a
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 029da054-f876-40dd-a094-2e3f3d07448a;
	Wed, 07 Oct 2020 18:21:29 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDk6-0007CF-BH; Wed, 07 Oct 2020 19:00:46 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <Ian.Jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 52/82] host allocation: Group jobs by their reuse parameters
Date: Wed,  7 Oct 2020 18:59:54 +0100
Message-Id: <20201007180024.7932-53-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

This promotes reuse by arranging that jobs that can reuse a host get
to run consecutively.

Signed-off-by: Ian Jackson <Ian.Jackson@eu.citrix.com>
---
 Osstest/JobDB/Executive.pm  | 47 +++++++++++++++++++++++++++++++++++++
 Osstest/JobDB/Standalone.pm |  2 ++
 ts-host-reuse               |  1 +
 ts-hosts-allocate-Executive |  4 ++++
 4 files changed, 54 insertions(+)

diff --git a/Osstest/JobDB/Executive.pm b/Osstest/JobDB/Executive.pm
index 30629572..8c235d45 100644
--- a/Osstest/JobDB/Executive.pm
+++ b/Osstest/JobDB/Executive.pm
@@ -389,6 +389,53 @@ END
     }
 }
 
+sub jobdb_set_hosts_infraprioritygroup ($$$$;$) { # method
+    my ($mo, $flight, $job, $group_key, $rref) = @_;
+    # Sets the runvar hosts_infraprioritygroup in $flight,$job
+    # The runvar values are NUM:GROUPKEY
+    # such that each GROUPKEY always has the same NUM, within the flight
+    # $rref is \%r (for use within a ts-*) or undef
+
+    my $vn = 'hosts_infraprioritygroup';
+
+    my $queryq = $dbh_tests->prepare(<<END);
+        SELECT job, val,
+               (job = ?) AS thisjob
+          FROM runvars
+         WHERE flight=?
+           AND name=?
+      ORDER BY thisjob DESC
+END
+    my $insertq = $dbh_tests->prepare(<<END);
+        INSERT INTO runvars (flight,job, name,val, synth)
+                     VALUES (?,     ?,   ?,   ?,   't')
+END
+
+    my $resulting;
+    db_retry($dbh_tests,[],sub {
+	my $use = 1;
+	$resulting = undef;
+        $queryq->execute($job, $flight, $vn);
+	while (my ($tjob, $tval, $thisjob) = $queryq->fetchrow_array()) {
+	    if ($thisjob) {
+		logm("$vn: job is already in group $tval");
+		return;
+	    }
+	    $tval =~ m/^(\d+)\:/ or die "$flight $job $tval ?";
+	    if ($' eq $group_key) {
+		$use = $1;
+		last;
+	    } elsif ($1 >= $use) {
+		$use = $1 + 1;
+	    }
+	}
+	$resulting = "$use:$group_key";
+	logm("$vn: inserting job into group $resulting");
+	$insertq->execute($flight,$job,$vn, $resulting);
+    });
+    $rref->{$vn} = $resulting if $rref && defined $resulting;
+}
+
 sub jobdb_flight_started_for_log_capture ($$) { #method
     my ($mo, $flight) = @_;
     my $started= $dbh_tests->selectrow_array(<<END);
diff --git a/Osstest/JobDB/Standalone.pm b/Osstest/JobDB/Standalone.pm
index 4f320ccf..1db4dc78 100644
--- a/Osstest/JobDB/Standalone.pm
+++ b/Osstest/JobDB/Standalone.pm
@@ -118,6 +118,8 @@ sub jobdb_resource_shared_mark_ready { } #method
 
 sub jobdb_check_other_job { } #method
 
+sub jobdb_set_hosts_infraprioritygroup { } # method
+
 sub jobdb_flight_started_for_log_capture ($$) { #method
     my ($mo, $flight) = @_;
     return time - 60*60; # just the most recent serial log then,
diff --git a/ts-host-reuse b/ts-host-reuse
index 5bdb07d1..29abe987 100755
--- a/ts-host-reuse
+++ b/ts-host-reuse
@@ -141,6 +141,7 @@ sub act_prealloc () {
     compute_test_sharetype();
     $ho = selecthost($whhost, undef, 1);
     set_runtime_hostflag($ho->{Ident}, "reuse-$sharetype");
+    $mjobdb->jobdb_set_hosts_infraprioritygroup($flight, $job, $sharetype, \%r);
 }
 
 sub act_start_test () {
diff --git a/ts-hosts-allocate-Executive b/ts-hosts-allocate-Executive
index fc107c08..a50f8bf3 100755
--- a/ts-hosts-allocate-Executive
+++ b/ts-hosts-allocate-Executive
@@ -733,9 +733,13 @@ sub alloc_hosts () {
         ? -10000
         : -10 * @hids;
 
+    my $infrapriority =
+	($r{hosts_infraprioritygroup} // '') =~ m/^(\d+):/ ? $1 : undef;
+
     my $ok = alloc_resources(WaitStart =>
                     ($ENV{OSSTEST_RESOURCE_WAITSTART} || $fi->{started}),
                     WaitStartAdjust => $waitstartadjust,
+                    InfraPriority => $infrapriority,
 		    DebugFh => \*DEBUG,
                     \&attempt_allocation);
 
-- 
2.20.1


