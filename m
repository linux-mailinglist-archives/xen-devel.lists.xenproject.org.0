Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D451DA067
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 21:03:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb7WM-0004rz-OP; Tue, 19 May 2020 19:03:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+xc8=7B=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jb7WL-0004rB-7l
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 19:03:21 +0000
X-Inumbo-ID: 4de532a2-9a03-11ea-9887-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::3])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4de532a2-9a03-11ea-9887-bc764e2007e4;
 Tue, 19 May 2020 19:02:37 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jb7Vc-0001da-Lt; Tue, 19 May 2020 20:02:36 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 09/38] Bodge systemd random seed arrangements
Date: Tue, 19 May 2020 20:02:01 +0100
Message-Id: <20200519190230.29519-10-ian.jackson@eu.citrix.com>
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

Unfortunately we must hardcode the actual numerical value of
RNDADDTOENTCNT because we don't have a suitable compiler anywhere
nearby.  It seems to have the same value on i386, amd64, armhf and
arm64, our currently supported architectures.

Thanks to Colin Watson for pointers to the systemd random unit and
Matthew Vernon for instructions on overriding just ExecStart.

I think this change should be a no-op on non-systemd systems.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 .../override.conf                             |  3 ++
 overlay/usr/local/bin/random-seed-add         | 33 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 overlay/etc/systemd/system/systemd-random-seed.service.d/override.conf
 create mode 100755 overlay/usr/local/bin/random-seed-add

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


