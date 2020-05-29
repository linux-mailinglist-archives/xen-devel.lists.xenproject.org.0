Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F451E7C01
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:34:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedHk-0002d0-4z; Fri, 29 May 2020 11:34:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jedHi-0002bw-SK
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:34:46 +0000
X-Inumbo-ID: 47b7cab2-a1a0-11ea-8993-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47b7cab2-a1a0-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 11:33:56 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3b-0003xZ-5y; Fri, 29 May 2020 12:20:11 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 47/49] setupboot_grub2: Do not boot with XSM policy
 etc. unless xsm=1
Date: Fri, 29 May 2020 12:19:43 +0100
Message-Id: <20200529111945.21394-48-ian.jackson@eu.citrix.com>
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

This prevents us from passing an XSM policy file, and
`flask=enforcing', in supposedly-non-XSM tests.

These bootloader entries can appear because the Xen upstream build
ships XSM policy files by default even if XSM is disabled in the
hypervisor, causing update-grub to generate useless `XSM enabled'
entries.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Debian.pm | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index c18bf718..b140ede2 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -499,6 +499,9 @@ sub setupboot_grub2 ($$$$) {
 		} elsif ($want_xsm && !defined $entry->{Xenpolicy}) {
 		    logm("(skipping entry at $entry->{StartLine}..$.;".
 			 " XSM policy file not mentioned)");
+		} elsif (!$want_xsm && defined $entry->{Xenpolicy}) {
+		    logm("(skipping entry at $entry->{StartLine}..$.;".
+			 " XSM policy file, but we don't want XSM)");
 		} elsif ($ho->{Suite} =~ m/buster/ &&
 			 defined $entry->{Xenpolicy} &&
 			 !$bootfiles{
-- 
2.20.1


