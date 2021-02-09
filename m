Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7933B31557C
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 18:59:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83373.155005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9XIC-0007fJ-Ib; Tue, 09 Feb 2021 17:59:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83373.155005; Tue, 09 Feb 2021 17:59:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9XIC-0007ec-9k; Tue, 09 Feb 2021 17:59:16 +0000
Received: by outflank-mailman (input) for mailman id 83373;
 Tue, 09 Feb 2021 17:59:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l9XIA-0007dc-92
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:59:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l9XIA-0003ys-7v
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:59:14 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l9XIA-0004d9-4H
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:59:14 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1l9XI8-00065Y-AQ; Tue, 09 Feb 2021 17:59:12 +0000
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
	bh=IJysOWmQHZYngadVXUNXmiph+YVmGyRyOsy43nVdaL8=; b=aDETW7u5hqy8GTIuhW5MBMIuKz
	hOjzqZ2/xy/zUu1LB7WahmA3a83lzYRy/55wrSHZOM1W2JHmwbrMgyy041Xz5lqmhoXsEvA5zzg6E
	jZRzPZCiBeYXZxodHsHABFUcxH1flsNQQangJ7Pji8VS+re4iVNeFyrbzKlDt3HZmluY=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 2/7] Debian mirror selection: Introduce DebianMirror[_<suite>[_<arch>]]
Date: Tue,  9 Feb 2021 17:58:59 +0000
Message-Id: <20210209175904.28282-2-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209175904.28282-1-iwj@xenproject.org>
References: <20210209175904.28282-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change with existing configs.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 Osstest/Debian.pm   | 35 ++++++++++++++++++++++++++++++++---
 README              |  4 ++++
 make-distros-flight |  2 ++
 production-config   |  3 ---
 ts-debian-install   |  4 +++-
 5 files changed, 41 insertions(+), 7 deletions(-)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index 01930e1f..05cc6e1f 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -22,6 +22,7 @@ use warnings;
 
 use POSIX;
 
+use Carp;
 use IO::File;
 use File::Copy;
 use File::Basename;
@@ -35,6 +36,8 @@ BEGIN {
     $VERSION     = 1.00;
     @ISA         = qw(Exporter);
     @EXPORT      = qw(debian_boot_setup
+		      debian_mirror_url debian_mirror_host_path
+		      debian_mirror_url_suite_arch
                       di_installer_path di_special_kernel
                       setupboot_bootloader_edited_rune
                       debian_overlays debian_overlays_fixup_cmd
@@ -811,12 +814,36 @@ chmod 600 $subdir/etc/ssh/ssh_host_*_key ||:
 END
 }
 
+sub debian_mirror_url ($) {
+    # I think ideally this should handle, and be used for, backports too.
+    # It would need an optional suite suffix which could be "-backports"?
+    my ($ho) = @_;
+    my $suite = $ho->{Suite};
+    my $arch = $ho->{Arch};
+    my $url =
+      $c{"DebianMirror_${suite}_${arch}"} //
+      $c{"DebianMirror_${suite}"} //
+      $c{"DebianMirror"};
+    if (!defined $url) {
+	$url = "http://$c{DebianMirrorHost}/$c{DebianMirrorSubpath}";
+    }
+    return $url;
+}
+
+sub debian_mirror_host_path ($) {
+    my ($ho) = @_;
+    my $url = debian_mirror_url($ho);
+    $url =~ m{^http://([^/]+)/(.*)$} or
+      confess "unsupported Debian url (needs to be http://HOST/...): $url";
+    return ($1, $2);
+}
+
 sub preseed_backports_packages ($$$$@) {
     my ($ho, $sfx, $xopts, $suite, @pkgs) = @_;
 
     if (! $xopts->{BackportsSourcesAlreadyAdded}++) {
 	my $bp_url = $c{"DebianSnapshotBackports_$suite"};
-	$bp_url ||= "http://$c{DebianMirrorHost}/$c{DebianMirrorSubpath}";
+	$bp_url ||= debian_mirror_url($ho);
 
 	my $apt_insert='';
 	my $extra_rune='';
@@ -942,6 +969,8 @@ END
     preseed_hook_command($ho, 'late_command', $sfx,
 			 debian_dhcp_rofs_fix($ho, '/target'));
 
+    my ($mhost, $mpath) = debian_mirror_host_path($ho);
+
     my $preseed = <<"END";
 d-i debian-installer/locale string en_GB
 d-i console-keymaps-at/keymap select gb
@@ -1001,9 +1030,9 @@ d-i finish-install/keep-consoles boolean true
 d-i finish-install/reboot_in_progress note
 d-i cdrom-detect/eject boolean false
 
-d-i mirror/http/hostname string $c{DebianMirrorHost}
+d-i mirror/http/hostname string $mhost
+d-i mirror/http/directory string /$mpath
 d-i mirror/http/proxy string $c{DebianMirrorProxy}
-d-i mirror/http/directory string /$c{DebianMirrorSubpath}
 d-i apt-setup/use_mirror boolean yes
 d-i apt-setup/another boolean false
 d-i apt-setup/non-free boolean false
diff --git a/README b/README
index 33c4d2cc..20d9802a 100644
--- a/README
+++ b/README
@@ -398,6 +398,10 @@ DebianMirrorProxy
    The apt proxy to specify for Debian (and derivatives),
    eg http://apt-cacher:3142/ .
 
+DebianMirror[_<suite>[_<arch>]]
+   Overrides DebianMirrorHost and DebianMirrorSubpath, optionally
+   for specific suite and arch.
+
 TestHost <hostname>
 TestHost_<ident> <hostname>
    Specifies the test box to use.  Should be a bare hostname,
diff --git a/make-distros-flight b/make-distros-flight
index 406d7d64..47094ef5 100755
--- a/make-distros-flight
+++ b/make-distros-flight
@@ -74,6 +74,8 @@ test_do_one_netboot () {
   else
     #local mirror="http://`getconfig DebianMirrorHost`/`getconfig DebianMirrorSubpath`"
     # XXX local mirror seems to serve up stale files.
+    # ^ this should use debian_mirror_url, not plain config, so it
+    #   honours suite- and arch- specific settings
     local mirror="http://ftp.debian.org/debian"
     diurl="$mirror/dists/$guest_suite/main/installer-$domU/current/images/netboot"
     gver=$guest_suite
diff --git a/production-config b/production-config
index df32e863..e7009a55 100644
--- a/production-config
+++ b/production-config
@@ -126,9 +126,6 @@ CoverityUploadUrl https://scan.coverity.com/builds?project=XenProject
 CoverityTools cov-analysis-linux64-2019.03.tar.gz
 CoverityToolsStripComponents 1
 
-# We use the IP address because Citrix can't manage reliable nameservice
-#DebianMirrorHost debian.uk.xensource.com
-#DebianMirrorHost 10.80.16.196
 DebianMirrorProxy http://cache:3143/
 
 HostProp_DhcpWatchMethod leases dhcp3 infra.t:5556
diff --git a/ts-debian-install b/ts-debian-install
index 8caa9d76..c42e8a37 100755
--- a/ts-debian-install
+++ b/ts-debian-install
@@ -83,12 +83,14 @@ END
     $cmd .= <<END if defined $useproxy;
         http_proxy=$useproxy \\
 END
+    my $mirror = debian_mirror_url($gho);
+
     $cmd .= <<END;
         xen-create-image \\
             --dhcp --mac $gho->{Ether} \\
             --memory ${ram_mb}Mb --swap ${swap_mb}Mb \\
             --dist $gsuite \\
-            --mirror http://$c{DebianMirrorHost}/$c{DebianMirrorSubpath} \\
+            --mirror $mirror \\
             --hostname $gho->{Name} \\
             --lvm $gho->{Vg} --force \\
             --kernel $kernpath \\
-- 
2.20.1


