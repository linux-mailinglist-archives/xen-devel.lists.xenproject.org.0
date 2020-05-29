Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A18A1E7B9B
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:20:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jed49-0006od-IR; Fri, 29 May 2020 11:20:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jed48-0006nv-DN
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:20:44 +0000
X-Inumbo-ID: 559fe83c-a19e-11ea-9dbe-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 559fe83c-a19e-11ea-9dbe-bc764e2007e4;
 Fri, 29 May 2020 11:20:00 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3P-0003xZ-Lq; Fri, 29 May 2020 12:19:59 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 09/49] Bodge systemd random seed arrangements
Date: Fri, 29 May 2020 12:19:05 +0100
Message-Id: <20200529111945.21394-10-ian.jackson@eu.citrix.com>
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

systemd does not regard the contents of the random seed file as useful
for the purposes of placating the kernel's entropy tracker.  As a
result, the system hangs at boot waiting for entropy.

Fix this by providing a small program which can be used to load a seed
file into /dev/random and also call RNDADDTOENTCNT to add the
appropriate amount to the kernel's counter.

Arrange to run this program instead of
   /lib/systemd/systemd-random-seed load

With systemd the random seed file is in /var/lib/systemd/random-seed
rather than /var/lib/urandom/random-seed.

And, provide an initial contents of this file, via a d-i late_command.

Unfortunately we must hardcode the actual numerical value of
RNDADDTOENTCNT because we don't have a suitable compiler anywhere
nearby.  It seems to have the same value on i386, amd64, armhf and
arm64, our currently supported architectures.

Thanks to Colin Watson for pointers to the systemd random unit and
Matthew Vernon for instructions on overriding just ExecStart.

I think this change should be a no-op on non-systemd systems.

In principle this is a bug in Debian or in systemd, that ought to be
reported upstream.  However, it has been extensively discussed on
debian-devel and it does not seem that any improvement is likely.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Debian.pm                             | 18 ++++++++++
 .../override.conf                             |  3 ++
 overlay/usr/local/bin/random-seed-add         | 33 +++++++++++++++++++
 3 files changed, 54 insertions(+)
 create mode 100644 overlay/etc/systemd/system/systemd-random-seed.service.d/override.conf
 create mode 100755 overlay/usr/local/bin/random-seed-add

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index b8bf67dc..8ccacc79 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -49,6 +49,7 @@ BEGIN {
                       di_installcmdline_core
                       di_vg_name
                       debian_dhcp_rofs_fix
+		      debian_write_random_seed_command
                       );
     %EXPORT_TAGS = ( );
 
@@ -1087,6 +1088,13 @@ ln -s . /target/boot/boot
 END
     }
 
+    my $cmd = debian_write_random_seed_command('/target');
+    preseed_hook_command($ho, 'late_command', $sfx, <<END);
+#!/bin/sh
+set -ex
+$cmd
+END
+
     $preseed_file .= preseed_hook_cmds();
 
     return create_webfile($ho, "preseed$sfx", $preseed_file);
@@ -1612,4 +1620,14 @@ mv '$script.new' '$script'
 END
 }
 
+sub debian_write_random_seed_command ($) {
+    my ($mountpoint) = @_;
+    my $dir = "$mountpoint/var/lib/systemd";
+    return <<END;
+        umask 077
+        test -d $dir || mkdir -m 0755 $dir
+        dd if=/dev/urandom of=$dir/random-seed bs=1k count=1
+END
+}
+
 1;
diff --git a/overlay/etc/systemd/system/systemd-random-seed.service.d/override.conf b/overlay/etc/systemd/system/systemd-random-seed.service.d/override.conf
new file mode 100644
index 00000000..f6cc0f84
--- /dev/null
+++ b/overlay/etc/systemd/system/systemd-random-seed.service.d/override.conf
@@ -0,0 +1,3 @@
+[Service]
+ExecStart=
+ExecStart=/usr/local/bin/random-seed-add /var/lib/systemd/random-seed
diff --git a/overlay/usr/local/bin/random-seed-add b/overlay/usr/local/bin/random-seed-add
new file mode 100755
index 00000000..89e75c4d
--- /dev/null
+++ b/overlay/usr/local/bin/random-seed-add
@@ -0,0 +1,33 @@
+#!/usr/bin/perl -w
+use strict;
+
+open R, '>', '/dev/random' or die "open /dev/random: $!\n";
+R->autoflush(1);
+
+sub rndaddtoentcnt ($) {
+    my ($bits) = @_;
+    my $x = pack 'L', $bits;
+    my $r = ioctl R, 0x40045201, $x;
+    defined $r or die "RNDADDTOENTCNT: $!\n";
+}
+
+sub process_stdin ($) {
+    my ($f) = @_;
+    my $got = read STDIN, $_, 512;
+    defined $got or die "read $f: $!\n";
+    last if !$got;
+    print R $_ or die "write /dev/random: $!\n";
+    my $bits = length($_) * 8;
+    rndaddtoentcnt($bits);
+}
+
+if (!@ARGV) {
+    process_stdin('stdin');
+} else {
+    die "no options supported\n" if $ARGV[0] =~ m/^\-/;
+    foreach my $f (@ARGV) {
+        open STDIN, '<', $f or die "open for reading $f: $!\n";
+        process_stdin($f);
+    }
+}
+
-- 
2.20.1


