Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1981E7C04
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:35:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedHz-0002ta-8D; Fri, 29 May 2020 11:35:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jedHx-0002sM-SP
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:35:01 +0000
X-Inumbo-ID: 4c099578-a1a0-11ea-9dbe-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c099578-a1a0-11ea-9dbe-bc764e2007e4;
 Fri, 29 May 2020 11:34:03 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3Z-0003xZ-JO; Fri, 29 May 2020 12:20:09 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 41/49] Debian.pm: Move standard_extradebs to
 ts-host-install
Date: Fri, 29 May 2020 12:19:37 +0100
Message-Id: <20200529111945.21394-42-ian.jackson@eu.citrix.com>
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

This makes it effect builds on Debian, too.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Debian.pm | 1 +
 ts-host-install   | 2 ++
 ts-xen-install    | 2 --
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index 60393ca9..2d30b3e9 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -51,6 +51,7 @@ BEGIN {
                       di_vg_name
                       debian_dhcp_rofs_fix
 		      debian_write_random_seed_command
+		      some_extradebs standard_extradebs
                       );
     %EXPORT_TAGS = ( );
 
diff --git a/ts-host-install b/ts-host-install
index 253dbb5d..924c1e06 100755
--- a/ts-host-install
+++ b/ts-host-install
@@ -146,6 +146,8 @@ END
             qw(amd64-microcode intel-microcode));
     }
 
+    standard_extradebs($ho);
+
     my $ntpserver = get_target_property($ho, 'NtpServer');
     if ($ntpserver) {
 	target_editfile_root($ho, '/etc/ntp.conf', sub {
diff --git a/ts-xen-install b/ts-xen-install
index 965fd519..5d4f8b0d 100755
--- a/ts-xen-install
+++ b/ts-xen-install
@@ -74,8 +74,6 @@ sub packages () {
 sub extradebs () {
     my $suite = $ho->{Suite};
 
-    standard_extradebs($ho);
-
     # $c{ DebianExtraPackages_<firmware>_<arch>_<suite> }
     my $firmware = get_host_property($ho, "firmware");
     some_extradebs($ho, [ 'DebianExtraPackages', $firmware, $ho->{Arch}, $suite ]);
-- 
2.20.1


