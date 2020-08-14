Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6773B244DA6
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:27:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTo-0004t4-Pi; Fri, 14 Aug 2020 17:27:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dSP-00024H-55
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:25:33 +0000
X-Inumbo-ID: cec8a870-aeaf-4337-8028-080daa349966
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cec8a870-aeaf-4337-8028-080daa349966;
 Fri, 14 Aug 2020 17:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425762;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=NHSD6TGEqM5ArTfICWOWbpPDVCeLImS8L+r0LiJLVRw=;
 b=UH5jPwKLZGD3oRjXuNJCAxpeBLXQzeuRi7pTDHWJ/uU3qdlBNBOkTB3B
 zOAgGBBc/oo5kplMkJ0M+Fh6ou9SWU/OgJoF25qXOr+gQnpOjEFQ7DUYK
 0zGshZSEXHpc4RUs3RR7eVzRKLb2nMnuQ4eg1geM9dfPF2AyNDa28oTug k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Ez1uaDVp3YNnZmB8o5hfowhFbk2KXYlLwJxDccw/0cocOpw8NZX3shD+l6qDoFjxPAEDwqU+21
 OkEm8iHYWXcrUFUH4rnB/OVuMPs4Rs1uOwvvVz3P4ygMGUVS/J3rbpxF+jfi8t6sM3QyqCl5QP
 MYsEpzjII7cXrkHHFoK4hyWFWMzBZk83ag4YEeFS702AY3X//fK7BMRBNiYDFdpyOdF6FFUqvZ
 xjKYuJLYKaVRIMOWGYNqa2jlR0nHSbodwpe5BmlpNF/YnKLWBwhJLJM8ZEYp0PbiXTvO0faacH
 Nr8=
X-SBRS: 2.7
X-MesageID: 24576917
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24576917"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 21/60] history reporting (nfc): Rename some module
 variables, remove "cache"
Date: Fri, 14 Aug 2020 18:21:26 +0100
Message-ID: <20200814172205.9624-22-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
References: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
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

This makes the code terser and easier to read.  No functional change.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/HistoryReport.pm | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Osstest/HistoryReport.pm b/Osstest/HistoryReport.pm
index a0565b6a..61b1ee8f 100644
--- a/Osstest/HistoryReport.pm
+++ b/Osstest/HistoryReport.pm
@@ -40,7 +40,7 @@ BEGIN {
 
 use POSIX;
 
-our @cache_row_key_cols;
+our @key_cols;
 
 our %cache;
 
@@ -51,11 +51,11 @@ our $rows_previous = 0;
 our $rows_today = 0;
 our $rows_hit = 0;
 
-sub cache_set_key_cols { @cache_row_key_cols = @_; }
+sub cache_set_key_cols { @key_cols = @_; }
 
-sub cache_row_key ($) {
+sub key ($) {
     my ($jr) = @_;
-    return join $; , map { $jr->{$_} } @cache_row_key_cols;
+    return join $; , map { $jr->{$_} } @key_cols;
 }
 
 sub cacheable_fn ($$$) {
@@ -107,7 +107,7 @@ sub cache_read_previous ($) {
 	    s{\%([0-9a-f]{2})}{ chr hex $1 }ge;
 	    $ch->{$k} = $_;
 	}
-	$cache{cache_row_key($jr)} = $jr;
+	$cache{key($jr)} = $jr;
     }
     close H;
 }
@@ -116,7 +116,7 @@ sub cache_row_lookup_prep ($) {
     my ($jrr) = @_;
 
     $rows_today++;
-    my $cacherow = $cache{cache_row_key($$jrr)};
+    my $cacherow = $cache{key($$jrr)};
     if ($cacherow) {
 	$$jrr = $cacherow;
 	$rows_hit++;
-- 
2.11.0


