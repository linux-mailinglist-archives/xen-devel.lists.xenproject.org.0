Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A23D11E7BE3
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:32:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedFt-0000qd-J9; Fri, 29 May 2020 11:32:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jedFr-0000pw-Og
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:32:51 +0000
X-Inumbo-ID: 1b6d7fc4-a1a0-11ea-8993-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b6d7fc4-a1a0-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 11:32:41 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3Z-0003xZ-3J; Fri, 29 May 2020 12:20:09 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 39/49] ts-xen-install: Move some_extradebs to Debian.pm
Date: Fri, 29 May 2020 12:19:35 +0100
Message-Id: <20200529111945.21394-40-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200529111945.21394-1-ian.jackson@eu.citrix.com>
References: <20200529111945.21394-1-ian.jackson@eu.citrix.com>
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

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Debian.pm | 38 ++++++++++++++++++++++++++++++++++++++
 ts-xen-install    | 36 ------------------------------------
 2 files changed, 38 insertions(+), 36 deletions(-)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index 49d94b9b..d51ac493 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -24,6 +24,7 @@ use POSIX;
 
 use IO::File;
 use File::Copy;
+use File::Basename;
 
 use Osstest;
 use Osstest::TestSupport;
@@ -50,6 +51,7 @@ BEGIN {
                       di_vg_name
                       debian_dhcp_rofs_fix
 		      debian_write_random_seed_command
+		      some_extradebs
                       );
     %EXPORT_TAGS = ( );
 
@@ -1646,4 +1648,40 @@ sub debian_write_random_seed_command ($) {
 END
 }
 
+sub some_extradebs ($$) {
+    my ($ho, $items) = @_;
+    my $cfgvar = join('_', @$items);
+    my $specs = $c{$cfgvar};
+    if (!length $specs) {
+	logm("$cfgvar: no extra debs");
+	return;
+    }
+    my $counter = 0;
+    my $rsync_installed;
+    foreach my $spec (split /\s+/, $specs) {
+	my $path = $spec;
+	$path = "$c{Images}/$path" unless $path =~ m{^/|^\./};
+	my ($ontarget, $dpkgopts);
+	if ($path =~ m{/$}) {
+	    $ontarget = "extrapackages-$cfgvar-$counter"; $counter++;
+	    $dpkgopts = '-iGROEB';
+	    logm("$cfgvar: updating packages from directory $path");
+	    target_install_packages($ho, qw(rsync)) unless $rsync_installed++;
+	    target_putfile_root($ho,300, "$path/.", $ontarget, '-r');
+	} elsif ($path =~ m{\.deb$}) {
+	    $path =~ s{_\.deb}{ "_$ho->{Arch}.deb" }e;
+	    logm("$cfgvar: installing $path");
+	    $ontarget = basename($path);
+	    $dpkgopts = '-iB';
+	    target_putfile_root($ho,300, $path, $ontarget);
+	} else {
+	    die "no / or . deb in $spec ?";
+	}
+	target_cmd_root($ho,
+			"dpkg --force-confold $dpkgopts $ontarget </dev/null",
+			300);
+	target_run_pkgmanager_install($ho, [], 0,1);
+    }
+}
+
 1;
diff --git a/ts-xen-install b/ts-xen-install
index 6196a890..d67cd121 100755
--- a/ts-xen-install
+++ b/ts-xen-install
@@ -71,42 +71,6 @@ sub packages () {
         if toolstack($ho)->{ExtraPackages};
 }
 
-sub some_extradebs ($$) {
-    my ($ho, $items) = @_;
-    my $cfgvar = join('_', @$items);
-    my $specs = $c{$cfgvar};
-    if (!length $specs) {
-	logm("$cfgvar: no extra debs");
-	return;
-    }
-    my $counter = 0;
-    my $rsync_installed;
-    foreach my $spec (split /\s+/, $specs) {
-	my $path = $spec;
-	$path = "$c{Images}/$path" unless $path =~ m{^/|^\./};
-	my ($ontarget, $dpkgopts);
-	if ($path =~ m{/$}) {
-	    $ontarget = "extrapackages-$cfgvar-$counter"; $counter++;
-	    $dpkgopts = '-iGROEB';
-	    logm("$cfgvar: updating packages from directory $path");
-	    target_install_packages($ho, qw(rsync)) unless $rsync_installed++;
-	    target_putfile_root($ho,300, "$path/.", $ontarget, '-r');
-	} elsif ($path =~ m{\.deb$}) {
-	    $path =~ s{_\.deb}{ "_$ho->{Arch}.deb" }e;
-	    logm("$cfgvar: installing $path");
-	    $ontarget = basename($path);
-	    $dpkgopts = '-iB';
-	    target_putfile_root($ho,300, $path, $ontarget);
-	} else {
-	    die "no / or . deb in $spec ?";
-	}
-	target_cmd_root($ho,
-			"dpkg --force-confold $dpkgopts $ontarget </dev/null",
-			300);
-	target_run_pkgmanager_install($ho, [], 0,1);
-    }
-}
-
 sub extradebs () {
     my $suite = $ho->{Suite};
 
-- 
2.20.1


