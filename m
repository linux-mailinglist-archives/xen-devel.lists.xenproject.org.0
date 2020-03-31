Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A2D199BFD
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 18:45:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJJz3-0003p3-Ef; Tue, 31 Mar 2020 16:43:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DbII=5Q=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jJJz1-0003ou-HD
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 16:43:23 +0000
X-Inumbo-ID: bbb76fe0-736e-11ea-83d8-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bbb76fe0-736e-11ea-83d8-bc764e2007e4;
 Tue, 31 Mar 2020 16:43:22 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jJJyz-0003wI-Oo; Tue, 31 Mar 2020 17:43:21 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH v2 1/2] host props/flags: Break out
 blessing_must_not_modify_host
Date: Tue, 31 Mar 2020 17:43:17 +0100
Message-Id: <20200331164318.4651-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
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

This return value convention is convenient for the callers, since they
want to print a message when we mayn't modify.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest.pm                  | 10 +++++++++-
 Osstest/HostDB/Executive.pm |  4 ++--
 ts-examine-hostprops-save   |  4 ++--
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/Osstest.pm b/Osstest.pm
index 27136bc9..54f0085c 100644
--- a/Osstest.pm
+++ b/Osstest.pm
@@ -40,7 +40,7 @@ BEGIN {
                       $dbh_tests db_retry db_retry_retry db_retry_abort
 		      db_readonly_report
                       db_begin_work db_prepare
-                      get_harness_rev
+                      get_harness_rev blessing_must_not_modify_host
                       ensuredir get_filecontents_core_quiet system_checked
                       nonempty visible_undef show_abs_time
                       %arch_debian2xen %arch_xen2debian
@@ -407,6 +407,14 @@ sub get_harness_rev () {
     return $rev;
 }
 
+sub blessing_must_not_modify_host ($) {
+    # returns '' (falseish) if we may modify a host's props etc.,
+    # or a trueish string message if may not
+    my ($intended_blessing) = @_;
+    return '' if $intended_blessing eq "real";
+    return "intended blessing $intended_blessing != real";
+}
+
 sub get_filecontents_core_quiet ($) { # ENOENT => undef
     my ($path) = @_;
     if (!open GFC, '<', $path) {
diff --git a/Osstest/HostDB/Executive.pm b/Osstest/HostDB/Executive.pm
index a6dc4462..41cce046 100644
--- a/Osstest/HostDB/Executive.pm
+++ b/Osstest/HostDB/Executive.pm
@@ -55,8 +55,8 @@ sub modify_host ($$$) {
     my ($hd, $ho, $query) = @_;
     my $blessing = intended_blessing();
 
-    die "Attempting to modify host with intended blessing $blessing != real"
-        if $blessing ne "real";
+    my $wrong = blessing_must_not_modify_host($blessing);
+    die "Attempting to modify host but $wrong" if $wrong;
 
     db_retry($dbh_tests, [qw(resources)], $query);
 }
diff --git a/ts-examine-hostprops-save b/ts-examine-hostprops-save
index e50ea7fb..0c39b864 100755
--- a/ts-examine-hostprops-save
+++ b/ts-examine-hostprops-save
@@ -31,8 +31,8 @@ logm("setting host properties and flags");
 
 # NB: in order to aid debug only attempt to save the host props on flights
 # with intended real blessing, for the rest just do a dry run.
-our $dry_run = $blessing ne "real";
-logm("not saving host props/flags with intended blessing $blessing != real")
+our $dry_run = blessing_must_not_modify_host($blessing);
+logm("not saving host props/flags ($dry_run)")
     if $dry_run;
 
 foreach my $k (sort keys %r) {
-- 
2.11.0


