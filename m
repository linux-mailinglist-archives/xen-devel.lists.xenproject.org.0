Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C22A61E7BEC
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:33:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedGS-0001GS-St; Fri, 29 May 2020 11:33:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jedGQ-0001Ep-QA
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:33:26 +0000
X-Inumbo-ID: 2696c888-a1a0-11ea-9947-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2696c888-a1a0-11ea-9947-bc764e2007e4;
 Fri, 29 May 2020 11:33:00 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3Y-0003xZ-Qw; Fri, 29 May 2020 12:20:08 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 38/49] ts-xen-install: Add $ho argument to
 some_extradebs
Date: Fri, 29 May 2020 12:19:34 +0100
Message-Id: <20200529111945.21394-39-ian.jackson@eu.citrix.com>
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

This is going to move to Debian.pm.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 ts-xen-install | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/ts-xen-install b/ts-xen-install
index 08b4ea23..6196a890 100755
--- a/ts-xen-install
+++ b/ts-xen-install
@@ -71,8 +71,8 @@ sub packages () {
         if toolstack($ho)->{ExtraPackages};
 }
 
-sub some_extradebs ($) {
-    my ($items) = @_;
+sub some_extradebs ($$) {
+    my ($ho, $items) = @_;
     my $cfgvar = join('_', @$items);
     my $specs = $c{$cfgvar};
     if (!length $specs) {
@@ -111,11 +111,11 @@ sub extradebs () {
     my $suite = $ho->{Suite};
 
     # $c{ DebianExtraPackages_<suite> }
-    some_extradebs([ 'DebianExtraPackages', $suite ]);
+    some_extradebs($ho, [ 'DebianExtraPackages', $suite ]);
 
     # $c{ DebianExtraPackages_<firmware>_<arch>_<suite> }
     my $firmware = get_host_property($ho, "firmware");
-    some_extradebs([ 'DebianExtraPackages', $firmware, $ho->{Arch}, $suite ]);
+    some_extradebs($ho, [ 'DebianExtraPackages', $firmware, $ho->{Arch}, $suite ]);
 }
 
 sub extract () {
-- 
2.20.1


