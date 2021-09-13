Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0258A40994B
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 18:31:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185810.334573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPorl-000220-3t; Mon, 13 Sep 2021 16:31:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185810.334573; Mon, 13 Sep 2021 16:31:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPork-0001r3-V9; Mon, 13 Sep 2021 16:31:32 +0000
Received: by outflank-mailman (input) for mailman id 185810;
 Mon, 13 Sep 2021 16:31:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mPori-0001OB-Hi
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 16:31:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mPori-00013e-Gr
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 16:31:30 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mPori-0006ud-Fq
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 16:31:30 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mPorg-00038U-Oa; Mon, 13 Sep 2021 17:31:28 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=/+x+VTxPOx8gBN+12QXDZqpJKD9whSaNezCRFKCFhP4=; b=ESEKoHcEFy+r0di5R3FhO92RKh
	wUacJiG+3jnXvWu0YSD2OOXBXe1ueom9Br/NbhFcE+AubAgzqIDs3oe0pOQRl0hpFU3O2+EhNUubN
	gGMiqlID+yNH3Q9GmMyOM2IteZhNPccuhhJ8FLwkBGzE6eJTJLUMFoW1U39kJgTD/A8Y=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 5/5] db: Replace ExecutiveDbOwningRoleRegexp with ExecutiveDbOwningRoleMap
Date: Mon, 13 Sep 2021 17:31:15 +0100
Message-Id: <20210913163115.12749-5-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913163115.12749-1-iwj@xenproject.org>
References: <20210913163115.12749-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

And use SET ROLE.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 Osstest/Executive.pm    |  2 +-
 README                  | 17 ++++++++---
 mg-schema-test-database |  2 +-
 mg-schema-update        | 68 ++++++++++++++++++++++++++++++++---------
 4 files changed, 68 insertions(+), 21 deletions(-)

diff --git a/Osstest/Executive.pm b/Osstest/Executive.pm
index d95d848d..ec592ed5 100644
--- a/Osstest/Executive.pm
+++ b/Osstest/Executive.pm
@@ -115,7 +115,7 @@ augmentconfigdefaults(
     QueuePlanUpdateInterval => 300, # seconds
     Repos => "$ENV{'HOME'}/repos",
     BisectionRevisonGraphSize => '600x300',
-    ExecutiveDbOwningRoleRegexp => 'osstest',
+    ExecutiveDbOwningRoleMap => '=',
     MaxUmask => '007',
 );
 
diff --git a/README b/README
index 20d9802a..aa611f23 100644
--- a/README
+++ b/README
@@ -770,10 +770,19 @@ ExecutiveDbname_<DB>
    PostgreSQL dbname string for the database <DB>.  Default is to use
    ExecutiveDbnamePat.
 
-ExecutiveDbOwningRoleRegexp
-   Regexp which is supposed to match the database user used for schema
-   changes - because, that role will end up owning the database objects.
-   Defaults to `osstest'.
+ExecutiveDbOwningRoleMap
+   Adjust roles used for schema changes.  osstest uses the following
+   nominal roles
+      osstest        Main db runner, owns most tables, etc.
+      webflights     More privileged, can see webflights tokens
+   The syntaxes for ExecutiveDbOwningRoleMap are
+      =              use the built-in nominal role, literally (default)
+      -              always use the default role for the user
+      <NEW-ROLE>     always use NEW-ROLE for everything
+   or a list like this
+      <NOM-ROLE>=<NEW-ROLE>,...
+   where <NEW-ROLE> can be `-' (default user role); unspecified
+   roles are not mapped.
 
 Flights for by-hand testing
 ===========================
diff --git a/mg-schema-test-database b/mg-schema-test-database
index b185e8b9..33b644f5 100755
--- a/mg-schema-test-database
+++ b/mg-schema-test-database
@@ -361,7 +361,7 @@ OwnerDaemonHost $ctrlhost
 QueueDaemonHost $ctrlhost
 OwnerDaemonPort ${ctrlports%,*}
 QueueDaemonPort ${ctrlports#*,}
-ExecutiveDbOwningRoleRegexp .*
+ExecutiveDbOwningRoleMap -
 QueueDaemonHoldoff 3
 QueueDaemonRetry 5
 Logs $PWD/logs
diff --git a/mg-schema-update b/mg-schema-update
index fb754bed..5ec7220e 100755
--- a/mg-schema-update
+++ b/mg-schema-update
@@ -22,7 +22,6 @@
 #  ./mg-schema-update [<options>] apply [<updatename>...]
 #  ./mg-schema-update [<options>] show
 #  ./mg-schema-update [<options>] apply-all
-#  ./mg-schema-update [<options>] check-user
 #
 # Usual rune for applying updates:
 #
@@ -53,6 +52,7 @@
 
 use strict qw(vars);
 use DBI;
+use Carp;
 BEGIN { unshift @INC, qw(.); }
 use Osstest;
 use Osstest::Executive;
@@ -121,13 +121,6 @@ sub getstate () {
     @state = sort { $a->{Sortkey} <=> $b->{Sortkey} } values %state;
 }
 
-sub check_user () {
-    my $user = $dbh_tests->{pg_user};
-    my $re = $c{ExecutiveDbOwningRoleRegexp};
-    return if $user =~ m/^$re$/o;
-    die "running as wrong user \`$user', expected to match \`$re'\n";
-}
-
 sub cmd_list_applied () {
     die if @ARGV;
     getstate();
@@ -174,6 +167,56 @@ sub want_apply ($) {
     $v->{Todo} >= 2-$force;
 }
 
+sub check_user () {
+    my $user = $dbh_tests->{pg_user};
+    my ($map, $default) = roles_map();
+    my $n = $map->{'osstest'} // $default;
+    my $wanted =
+      ($n eq '-' ? return :
+       $n eq '=' ? 'osstest' :
+                   $n);
+    return if $user eq $wanted;
+    die "running as wrong user \`$user', expected \`$wanted'\n";
+}
+
+sub cmd_check_user () {
+    die "too many arguments\n" if @ARGV>0;
+    check_user();
+}
+
+sub roles_map () {
+    my $default;
+    my %map;
+    if ($c{ExecutiveDbOwningRoleMap} !~ m/,|.=/) {
+	$default = $c{ExecutiveDbOwningRoleMap};
+    } else {
+	foreach my $kv (split m/,/, $c{ExecutiveDbOwningRoleMap}) {
+	    my @kv = split m/=/, $kv;  @kv == 2 or die;
+	    my ($k, $v) = @kv;
+	    grep { $_ eq $k } qw(osstest webflights)
+	        or confess "bad NOM-ROLE $k";
+	    $map{$k} = $v;
+	}
+	$default = '=';
+    }
+    return (\%map, $default);
+}
+
+sub map_roles ($) {
+    local ($_) = @_;
+    my ($map, $default) = roles_map();
+
+    s{^\@\s*SET ROLE\s+'?(\S+?)'?\s*\;\s*$}{
+        my $n = $map->{$1} // $default;
+	($n eq '-' ? "SET ROLE NONE;" :
+	 $n eq '=' ? "SET ROLE '$1';" :
+	             "SET ROLE '$n';")
+    }mge;
+
+    #print STDERR ">$_<\n";
+    return $_;
+}    
+
 sub applyone ($) {
     my ($v) = @_;
     die "Will not apply $v->{Name}.sql: $v->{Msg}\n"
@@ -195,7 +238,8 @@ sub applyone ($) {
             SET client_min_messages = warning;
 END
 
-	$dbh_tests->do($sql);
+	$dbh_tests->do(map_roles('@SET ROLE osstest;'));
+	$dbh_tests->do(map_roles($sql));
 
 	$dbh_tests->do(<<END, {}, $v->{Name}, time);
 	    INSERT INTO schema_updates
@@ -253,12 +297,6 @@ sub cmd_apply_all () {
     print "Appropriate updates applied.\n" unless $quiet;
 }
 
-sub cmd_check_user () {
-    die "too many arguments\n" if @ARGV>1;
-    $c{ExecutiveDbOwningRoleRegexp} = shift @ARGV if @ARGV;
-    check_user();
-}
-
 GetOptions('f|force+' => \$force,
 	   'q+' => \$quiet,
 	   'o|oldest=s' => \$there);
-- 
2.20.1


