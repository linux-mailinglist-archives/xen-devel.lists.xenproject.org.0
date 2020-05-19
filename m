Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 424B71DA0A6
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 21:10:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb7dG-00077n-FM; Tue, 19 May 2020 19:10:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+xc8=7B=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jb7dE-00075c-KD
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 19:10:28 +0000
X-Inumbo-ID: 4dce2cdc-9a04-11ea-9887-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::3])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4dce2cdc-9a04-11ea-9887-bc764e2007e4;
 Tue, 19 May 2020 19:09:47 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jb7Vc-0001da-TG; Tue, 19 May 2020 20:02:36 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 10/38] Debian guests: Write systemd random seed file
Date: Tue, 19 May 2020 20:02:02 +0100
Message-Id: <20200519190230.29519-11-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200519190230.29519-1-ian.jackson@eu.citrix.com>
References: <20200519190230.29519-1-ian.jackson@eu.citrix.com>
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

This involves a new ts-debian-di-fixup script, which runs after
xen-tools.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Debian.pm  | 14 ++++++++++++++
 sg-run-job         |  1 +
 ts-debian-di-fixup | 29 +++++++++++++++++++++++++++++
 ts-debian-fixup    |  1 +
 4 files changed, 45 insertions(+)
 create mode 100755 ts-debian-di-fixup

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index b8bf67dc..78d8c97e 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -49,6 +49,7 @@ BEGIN {
                       di_installcmdline_core
                       di_vg_name
                       debian_dhcp_rofs_fix
+		      debian_write_random_seed
                       );
     %EXPORT_TAGS = ( );
 
@@ -1612,4 +1613,17 @@ mv '$script.new' '$script'
 END
 }
 
+sub debian_write_random_seed ($) {
+    my ($gho) = @_;
+    my $mountpoint = '/mnt';
+    my $ho = $gho->{Host};
+    target_cmd_root($ho, <<END);
+        set -ex
+        mount /dev/$gho->{Vg}/$gho->{Lv} $mountpoint
+        umask 077
+        dd if=/dev/urandom of=$mountpoint/var/lib/systemd/random-seed bs=1k count=1
+END
+    guest_umount_lv($ho, $gho);
+}
+
 1;
diff --git a/sg-run-job b/sg-run-job
index aa7953ac..9255096d 100755
--- a/sg-run-job
+++ b/sg-run-job
@@ -511,6 +511,7 @@ proc run-job/test-debian {} {
 
 proc install-guest-debian-di {} {
     run-ts . = ts-debian-di-install
+    run-ts . = ts-debian-di-fixup + debian
     run-ts . = ts-guest-start + debian
 }
 
diff --git a/ts-debian-di-fixup b/ts-debian-di-fixup
new file mode 100755
index 00000000..68cda2f5
--- /dev/null
+++ b/ts-debian-di-fixup
@@ -0,0 +1,29 @@
+#!/usr/bin/perl -w
+# This is part of "osstest", an automated testing framework for Xen.
+# Copyright (C) 2009-2013 Citrix Inc.
+# 
+# This program is free software: you can redistribute it and/or modify
+# it under the terms of the GNU Affero General Public License as published by
+# the Free Software Foundation, either version 3 of the License, or
+# (at your option) any later version.
+# 
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU Affero General Public License for more details.
+# 
+# You should have received a copy of the GNU Affero General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
+use strict qw(vars);
+use DBI;
+BEGIN { unshift @INC, qw(.); }
+use Osstest;
+use Osstest::TestSupport;
+use Osstest::Debian;
+
+tsreadconfig();
+
+our ($ho,$gho) = ts_get_host_guest(@ARGV);
+
+debian_write_random_seed($gho);
diff --git a/ts-debian-fixup b/ts-debian-fixup
index fef9836e..45bbcd27 100755
--- a/ts-debian-fixup
+++ b/ts-debian-fixup
@@ -202,6 +202,7 @@ sub writecfg () {
     target_putfile_root($ho,10, $cfgstash, $cfgfile);
 }
 
+debian_write_random_seed($gho);
 savecfg();
 ether();
 target_kernkind_check($gho);
-- 
2.20.1


