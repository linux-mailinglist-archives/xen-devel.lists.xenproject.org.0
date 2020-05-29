Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B230C1E7C03
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:35:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedHu-0002oK-PH; Fri, 29 May 2020 11:34:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jedHs-0002md-SC
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:34:56 +0000
X-Inumbo-ID: 4ac56d86-a1a0-11ea-8993-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ac56d86-a1a0-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 11:34:01 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3Z-0003xZ-CA; Fri, 29 May 2020 12:20:09 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 40/49] Debian.pm: Break out standard_extradebs
Date: Fri, 29 May 2020 12:19:36 +0100
Message-Id: <20200529111945.21394-41-ian.jackson@eu.citrix.com>
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

Refactor this out of ts-xen-install.  We are going to run it in
ts-host-install.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Debian.pm | 7 ++++++-
 ts-xen-install    | 3 +--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index d51ac493..60393ca9 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -51,7 +51,6 @@ BEGIN {
                       di_vg_name
                       debian_dhcp_rofs_fix
 		      debian_write_random_seed_command
-		      some_extradebs
                       );
     %EXPORT_TAGS = ( );
 
@@ -1684,4 +1683,10 @@ sub some_extradebs ($$) {
     }
 }
 
+sub standard_extradebs ($) {
+    my ($ho) = @_;
+    # $c{ DebianExtraPackages_<suite> }
+    some_extradebs($ho, [ 'DebianExtraPackages', $ho->{Suite} ]);
+}
+
 1;
diff --git a/ts-xen-install b/ts-xen-install
index d67cd121..965fd519 100755
--- a/ts-xen-install
+++ b/ts-xen-install
@@ -74,8 +74,7 @@ sub packages () {
 sub extradebs () {
     my $suite = $ho->{Suite};
 
-    # $c{ DebianExtraPackages_<suite> }
-    some_extradebs($ho, [ 'DebianExtraPackages', $suite ]);
+    standard_extradebs($ho);
 
     # $c{ DebianExtraPackages_<firmware>_<arch>_<suite> }
     my $firmware = get_host_property($ho, "firmware");
-- 
2.20.1


