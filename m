Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B55AE2866FF
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:27:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3702.10997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEA8-0003Bl-JC; Wed, 07 Oct 2020 18:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3702.10997; Wed, 07 Oct 2020 18:27:40 +0000
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
	id 1kQEA7-00034c-D5; Wed, 07 Oct 2020 18:27:39 +0000
Received: by outflank-mailman (input) for mailman id 3702;
 Wed, 07 Oct 2020 18:27:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE6O-00072Q-Qr
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:23:48 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4d8655f-307c-496d-a72a-2974b582accc;
 Wed, 07 Oct 2020 18:21:39 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDk3-0007CF-2H; Wed, 07 Oct 2020 19:00:43 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE6O-00072Q-Qr
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:23:48 +0000
X-Inumbo-ID: b4d8655f-307c-496d-a72a-2974b582accc
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b4d8655f-307c-496d-a72a-2974b582accc;
	Wed, 07 Oct 2020 18:21:39 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDk3-0007CF-2H; Wed, 07 Oct 2020 19:00:43 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 38/82] ts-host-reuse: New script, to do reuse state changes
Date: Wed,  7 Oct 2020 18:59:40 +0100
Message-Id: <20201007180024.7932-39-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

This will be made part of the test job recipes.

We calculate the sharing scope (sharetype) by reference to a lot of
runvars, etc.

This version of the script is rather far from the finished working
one, but it seems better to preserve the actual history for how it got
the way it is.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 ts-host-reuse | 163 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 163 insertions(+)
 create mode 100755 ts-host-reuse

diff --git a/ts-host-reuse b/ts-host-reuse
new file mode 100755
index 00000000..e14a9149
--- /dev/null
+++ b/ts-host-reuse
@@ -0,0 +1,163 @@
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
+# usage:
+#   ./ts-host-reuse prealloc|start-test|post-test IDENT [ARGS...]
+#
+# Computes the sharing scope of the host for IDENT, and then
+#
+#   prealloc      Sets the share-* runtime hostflag appropriately
+#
+#   start-test    Expects the host to have previously been `prep'
+#                 (being prepared) or `ready'.
+#                 Marks it as `mid-test'.
+#
+#                 All the scripts before `ready' or `start-test', (at
+#                 least, ones which affect the host) should have been
+#                 marked with @, so that they are skipped when the
+#                 host is shared or reused.
+#
+#   post-test     Expects the host to have previously been `mid-test'
+#                 Does a small amount of cleanup, deleting some things
+#                 which take a lot of space.
+#                 Then marks the host as `ready' for reuse.
+#                 Must not be done if test arrangements had unexpected
+#                 failures which might leave host in an odd state.
+
+use strict qw(vars);
+use DBI;
+BEGIN { unshift @INC, qw(.); }
+use Osstest;
+use POSIX;
+use Osstest::TestSupport;
+
+tsreadconfig();
+
+die unless @ARGV==2;
+
+our ($action, $whhost) = @ARGV;
+
+our $ho;
+
+#---------- compute $sharetype ----------
+
+our $sharetype;
+
+sub sharetype_add ($$) {
+    my ($k, $v) = @_;
+    return unless defined $v;
+    $sharetype .= "/$k=$v";
+}
+
+sub compute_test_sharetype () {
+    $sharetype =
+	"test-$flight/$r{arch}/$r{xenbuildjob}/$r{kernbuildjob}/$r{buildjob}";
+
+    sharetype_add('suite', $ho->{Suite});
+    sharetype_add('di', $ho->{DiVersion});
+
+    foreach my $runvar (qw(freebsd_distpath freebsdbuildjob
+			   bios xenable_xsm toolstack kernkind)) {
+	my $val = $r{$runvar};
+	die "$runvar $val ?" if defined $val && $val =~ m{[,/\%\\]};
+	sharetype_add($runvar, $val);
+    }
+
+    return $sharetype;
+}
+
+#---------- functions ----------
+
+sub post_test_cleanup () {
+    my $script = <<'ENDQ';
+        set -e
+        cd /root
+        du -skx * | while read size thing; do
+            printf '%10d %s' "$size" "$thing"
+            if [ $size -gt 11000 ]; then
+                printf ' removing'
+                rm -rf -- "$thing"
+            fi
+            printf '\n'
+        done
+ENDQ
+    my $r_vals = sub {
+	my ($re) = @_;
+	map { $r{$_} }
+            sort
+	    grep /$re/,
+	    keys %r;
+    };
+    my @vgs = $r_vals->(qr{_vg$});
+    my @lvs = $r_vals->(qr{_lv$});
+    $script .= <<ENDI.<<'ENDQ';
+        for vg in @vgs; do
+            for lv in @lvs; do
+ENDI
+                dev=/dev/$vg/$lv
+                printf 'LV %s...\n' "$dev"
+                if ! test -e $dev; then continue; fi
+                dd if=/dev/urandom bs=1024 count=4096 of=$dev ||:
+                lvremove -f $dev
+            done
+        done
+ENDQ
+    target_cmd_root($ho, $script, 300);
+}
+
+#---------- functionality shared between actions ----------
+
+sub noop_if_playing () {
+    my $wantreuse = $ENV{'OSSTEST_REUSE_TEST_HOSTS'};
+    my $intended = intended_blessing();
+    if (!defined $wantreuse) {
+	$wantreuse = $intended !~ /play/;
+    }
+    if (!$wantreuse) {
+	logm("not reusing test hosts (in $intended flight)");
+	exit 0;
+    }
+}
+
+#---------- actions ----------
+
+sub act_prealloc () {
+    noop_if_playing();
+    compute_test_sharetype();
+    $ho = selecthost($whhost, undef, 1);
+    set_runtime_hostflag($ho->{Ident}, "reuse-$sharetype");
+}
+
+sub act_start_test () {
+    compute_test_sharetype();
+    $ho = selecthost($whhost);
+    return unless $ho->{Shared};
+    my %oldstate = map { $_ => 1 } qw(prep ready);
+    host_shared_mark_ready($ho, $sharetype, \%oldstate, 'mid-test');
+}
+
+sub act_post_test () {
+    compute_test_sharetype();
+    $ho = selecthost($whhost);
+    return unless $ho->{Shared};
+    die unless $ho->{Shared}{State} eq 'mid-test';
+    post_test_cleanup();
+    host_shared_mark_ready($ho, $sharetype, 'mid-test', 'ready');
+}
+
+$action =~ y/-/_/;
+&{"act_$action"}();
-- 
2.20.1


