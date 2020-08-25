Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4EB2517DE
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 13:41:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAXJz-000348-5L; Tue, 25 Aug 2020 11:40:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=577d=CD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1kAXJx-00030H-HE
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 11:40:57 +0000
X-Inumbo-ID: 5974acae-9f55-4d84-9fe4-0900222a81a2
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5974acae-9f55-4d84-9fe4-0900222a81a2;
 Tue, 25 Aug 2020 11:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598355649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=VUeC03OjFuTQDzzPTDaScnLT3rnuSOzDlR6ls8+1gsc=;
 b=eG7QL5ISIfnmsUClBo/8XGwR/oNGVnbnaLJr3Y2RLCSOQ44KYeMn+15F
 qGC19vc2jMv+iL7L+yCmoTyFONQrVmwYR//RqK44G6VP0gP0rcG5+/QF3
 h+nKOVOvuYbmrziFVd+jeA+idbEKqF0wo5JKCL3xWsst7jHZ5/RsLC973 o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: pomW1TMtNuGay6tK8pD0paEZ2SyWz0knx1vh+t8K/n897v+/qTp0hyuHXcbJAtxJXOEFlD97Ph
 US5AB6IBZF5mI+u8ILVpebmEWdIetEmDurt4qHcYaCMZGZZBGShuxUzQisM3CPNc8AhyUrTE8h
 2AtS8TpM7gEy7Q+sBRsI8y5wjdn8EBe991hwbuI2AdriPkbAz1IYC58WiIvCxlLDPGssEkjss2
 gN14EN5KIO9N1NiMgTMIj2wUtQGRhGMywUjTZ11nIG3eN2dG1ELpV4DulSdpgBjz71u1/xNtRK
 Om8=
X-SBRS: 2.7
X-MesageID: 25539847
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,352,1592884800"; d="scan'208";a="25539847"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 10/12] target setup refactoring: Merge
 target_kernkind_*
Date: Tue, 25 Aug 2020 12:40:39 +0100
Message-ID: <20200825114041.16290-11-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200825114041.16290-1-ian.jackson@eu.citrix.com>
References: <20200825114041.16290-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Combine these two functions.  Rename them to a name which doesn't
mention "kernkind".

No functional change.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Debian.pm      |  3 +--
 Osstest/TestSupport.pm | 11 ++++-------
 ts-debian-fixup        |  3 +--
 3 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index b140ede2..85fd16da 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -68,8 +68,7 @@ sub debian_boot_setup ($$$$$;$) {
     # $xenhopt==undef => is actually a guest, do not set up a hypervisor
     my ($ho, $want_kernver, $want_xsm, $xenhopt, $distpath, $hooks) = @_;
 
-    target_kernkind_check($ho);
-    target_kernkind_console_inittab($ho,$ho,"/");
+    target_setup_rootdev_console_inittab($ho,$ho,"/");
 
     my $kopt;
     my $console= target_var($ho,'console');
diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index faac106f..fd7b238b 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -105,7 +105,7 @@ BEGIN {
                       host_get_free_memory
 
                       target_ping_check_down target_ping_check_up
-                      target_kernkind_check target_kernkind_console_inittab
+                      target_setup_rootdev_console_inittab
                       target_var target_var_prefix
                       selectguest prepareguest more_prepareguest_hvm
 		      guest_template
@@ -2562,8 +2562,9 @@ sub target_var ($$) {
     return undef;
 }
 
-sub target_kernkind_check ($) {
-    my ($gho) = @_;
+sub target_setup_rootdev_console_inittab ($$$) {
+    my ($ho, $gho, $root) = @_;
+
     my $pfx= target_var_prefix($gho);
     my $kernkind= $r{$pfx."kernkind"} // 'pvops';
     my $isguest= exists $gho->{Guest};
@@ -2573,10 +2574,6 @@ sub target_kernkind_check ($) {
     } elsif ($kernkind !~ m/2618/) {
         store_runvar($pfx."console", 'xvc0') if $isguest;
     }
-}
-
-sub target_kernkind_console_inittab ($$$) {
-    my ($ho, $gho, $root) = @_;
 
     my $inittabpath= "$root/etc/inittab";
     my $console= target_var($gho,'console');
diff --git a/ts-debian-fixup b/ts-debian-fixup
index 2184212b..a878fe50 100755
--- a/ts-debian-fixup
+++ b/ts-debian-fixup
@@ -209,8 +209,7 @@ sub writecfg () {
 savecfg();
 ether();
 access();
-target_kernkind_check($gho);
-$console = target_kernkind_console_inittab($ho,$gho,"$mountpoint");
+$console = target_setup_rootdev_console_inittab($ho,$gho,"$mountpoint");
 
 debian_overlays($ho, \&overlay);
 target_cmd_root($ho, <<END.debian_overlays_fixup_cmd($ho, $mountpoint));
-- 
2.20.1


