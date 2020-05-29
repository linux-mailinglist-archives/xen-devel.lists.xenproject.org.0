Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1CD1E7BFF
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:34:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedHa-0002S8-Fa; Fri, 29 May 2020 11:34:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jedHY-0002Qo-Qx
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:34:36 +0000
X-Inumbo-ID: 45167a06-a1a0-11ea-8993-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45167a06-a1a0-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 11:33:51 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3a-0003xZ-3W; Fri, 29 May 2020 12:20:10 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 43/49] setupboot_grub2: Insist on space after
 directives
Date: Fri, 29 May 2020 12:19:39 +0100
Message-Id: <20200529111945.21394-44-ian.jackson@eu.citrix.com>
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

These parsing regexps were all wrong!

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Debian.pm | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index 2d30b3e9..a20569e5 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -529,17 +529,17 @@ sub setupboot_grub2 ($$$$) {
             if (m/^\s*submenu\s+[\'\"](.*)[\'\"].*\{\s*$/) {
                 push @offsets,(0);
             }
-            if (m/^\s*chainloader\s*\/EFI\/osstest\/xen.efi/) {
+            if (m/^\s*chainloader\s+\/EFI\/osstest\/xen.efi/) {
                 die unless $entry;
                 $entry->{Hv}= $1;
                 $entry->{Chainload} = 1;
             }
-            if (m/^\s*multiboot2?\s*(?:\/boot)?\/(xen\-[0-9][-+.0-9a-z]*\S+)/) {
+            if (m/^\s*multiboot2?\s+(?:\/boot)?\/(xen\-[0-9][-+.0-9a-z]*\S+)/) {
                 die unless $entry;
                 $entry->{Hv}= $1;
                 $entry->{Chainload} = 0;
             }
-            if (m/^\s*multiboot2?\s*(?:\/boot)?\/(vmlinu[xz]-(\S+))\s+(.*)/) {
+            if (m/^\s*multiboot2?\s+(?:\/boot)?\/(vmlinu[xz]-(\S+))\s+(.*)/) {
                 die unless $entry;
                 $entry->{KernOnly}= $1;
                 $entry->{KernVer}= $2;
@@ -551,7 +551,7 @@ sub setupboot_grub2 ($$$$) {
                 $entry->{KernVer}= $2;
                 $entry->{KernOpts}= $3;
             }
-            if (m/^\s*module2?\s*(?:\/boot)?\/(initrd\S+)/) {
+            if (m/^\s*module2?\s+(?:\/boot)?\/(initrd\S+)/) {
                 $entry->{Initrd}= $1;
             }
 	    if (m/^\s*module2?\s*\/(xenpolicy\S+)/) {
-- 
2.20.1


