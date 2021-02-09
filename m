Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D9331557B
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 18:59:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83376.155042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9XIE-0007iq-6J; Tue, 09 Feb 2021 17:59:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83376.155042; Tue, 09 Feb 2021 17:59:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9XID-0007hG-Rp; Tue, 09 Feb 2021 17:59:17 +0000
Received: by outflank-mailman (input) for mailman id 83376;
 Tue, 09 Feb 2021 17:59:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l9XIB-0007eA-Kf
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:59:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l9XIB-0003z4-JF
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:59:15 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l9XIB-0004e7-I5
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:59:15 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1l9XI9-00065Y-LO; Tue, 09 Feb 2021 17:59:13 +0000
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
	bh=/4mHoLOl6nDqU6KIAQm25wzyPgRrf/4mH1E4Sbq3iG4=; b=3uMlFeG9iuaWxstI/MqtDF3r5I
	ZwYaOHg+2JTXqdkuvzMo95q4LPITbPe89bOVmMhK9H20+RkPE+JyNhLOl3Dws4p8CoYK55ZeKyLTJ
	GgyW8AYdRkGXrotuiULJxYyMWTgVOCOUsBrMQ+G39mjoWo5OUQXmnmKH/+Bt4hKzfZZ0=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 5/7] Debian mirror: Disable timestamp verification for snapshot.d.o
Date: Tue,  9 Feb 2021 17:59:02 +0000
Message-Id: <20210209175904.28282-5-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209175904.28282-1-iwj@xenproject.org>
References: <20210209175904.28282-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is kind of duplicative of the logic in preseed_backports_packages
but I don't want to mess with that now.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 Osstest.pm        |  2 ++
 Osstest/Debian.pm | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/Osstest.pm b/Osstest.pm
index 809194f0..7776ba88 100644
--- a/Osstest.pm
+++ b/Osstest.pm
@@ -246,6 +246,8 @@ sub readglobalconfig () {
     $c{DefaultBranch} ||= 'xen-unstable';
 
     $c{DebianMirrorHost} ||= 'ftp.debian.org' if $c{DebianMirrorProxy};
+    $c{DebianMirrorAllowExpiredReleaseRegexp} //=
+      qr{^\Qhttp://snapshot.debian.org/};
 
     $c{EmailStdHeaders} ||= <<'END';
 Content-Type: text/plain; charset="UTF-8"
diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index dee52b3d..d6e0b59d 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -972,6 +972,22 @@ END
     preseed_hook_command($ho, 'late_command', $sfx,
 			 debian_dhcp_rofs_fix($ho, '/target'));
 
+    my $murl = debian_mirror_url($ho);
+    if ($murl =~ m/$c{DebianMirrorAllowExpiredReleaseRegexp}/) {
+	# Inspired by
+	#  https://stackoverflow.com/questions/25039317/is-there-any-setting-in-the-preseed-file-to-ignore-the-release-valid-until-opt/51396935#51396935
+	# In some sense a workaround for the lack of a better way,
+	#  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=771699
+	preseed_hook_installscript($ho, $sfx,
+            '/usr/lib/apt-setup/generators/', '02IgnoreValidUntil', <<'END');
+#!/bin/sh
+set -ex
+d=/target/etc/apt/apt.conf.d/
+mkdir -p $d
+echo 'Acquire::Check-Valid-Until "false";' >$d/02IgnoreValidUntil
+END
+    }
+
     my ($mhost, $mpath) = debian_mirror_host_path($ho);
 
     my $preseed = <<"END";
-- 
2.20.1


