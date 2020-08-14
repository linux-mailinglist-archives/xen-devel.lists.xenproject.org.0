Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76873244D99
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:26:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTc-0004MF-0a; Fri, 14 Aug 2020 17:26:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dR2-00024H-26
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:24:08 +0000
X-Inumbo-ID: 7b739c17-12e3-4632-90be-eecd9e270004
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b739c17-12e3-4632-90be-eecd9e270004;
 Fri, 14 Aug 2020 17:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425741;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Dc1iYPOHo/sW4uoJCyRT7Y63wrTdDiuAqSFl61F0cNU=;
 b=LgSS+yI0toLrPxfqDkOoe7XZ433ev0DfLpvroZ9DOE9XBEHULzOv95+q
 AY0fOR9aK9SEwM+U15Ys46IRZUJo79pYQEQHPgHPxIJyQhI+mTQa3haP3
 MKRxeoBUsFKyG9yVNFc0fqjW+TNfVZnjwtkzBGa348bFj+YKL7yb1bbxl A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: xzcpiXWt2MDVKaH0+t+J4BZz9NNgtQGsKmhYOQJLttcwgGR3o5z8fbi0gMFW2gQn7P7+MJHKEK
 ER6TZN8QdXnN0vZBVX5IgVQVzQY4jJxeZp8E4tLTuptYKpLmdY5jqhTUT7ptP7y344zVRm74s0
 d/Bxrv6FkTecUoP3127/WnShj4n7CrEK77uM5WOCiHcIexj6oVUmooTZCLD8U1/ZP46GqHVVYx
 Ak3cb7sIiBvOZWicDdAVaH2me1QkHnZfw45LCM+H0LvpcfOtTtd01/CcMCZf9PENghJf4w/9kw
 A2E=
X-SBRS: 2.7
X-MesageID: 24879747
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24879747"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 45/60] history reporting (nfc): Provide
 cache_set_task_print
Date: Fri, 14 Aug 2020 18:21:50 +0100
Message-ID: <20200814172205.9624-46-ian.jackson@eu.citrix.com>
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

This takes a string which gets added to the cache messages.  This
will allow us to distinguish the output from different processes
when using parallel by fork.

Nothing sets this yet.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/HistoryReport.pm | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Osstest/HistoryReport.pm b/Osstest/HistoryReport.pm
index 5d2c83b7..bfbee28c 100644
--- a/Osstest/HistoryReport.pm
+++ b/Osstest/HistoryReport.pm
@@ -29,6 +29,7 @@ BEGIN {
     @ISA         = qw(Exporter);
     @EXPORT      = qw(
 			 cache_set_key_cols
+			 cache_set_task_print
 			 cache_read_previous
 			 cache_row_lookup_prep
 			 cacheable_query
@@ -46,6 +47,7 @@ use POSIX;
 
 our @key_cols;
 
+our $taskprint='';
 our %cache;
 our @previous;
 
@@ -91,6 +93,7 @@ our $rows_extra = 0;
 
 
 sub cache_set_key_cols { @key_cols = @_; }
+sub cache_set_task_print ($) { ($taskprint)=@_; $taskprint =~ s/\s*$/ /; }
 
 sub key ($) {
     my ($jr) = @_;
@@ -162,7 +165,7 @@ sub cache_row_lookup_prep ($) {
 	$$jrr = $cacherow;
 	$rows_hit++;
     } else {
-	print ::DEBUG "CACHE MISS ",
+	print ::DEBUG "CACHE MISS $taskprint",
 	    (join " ", map { $$jrr->{$_} } @key_cols), "\n";
     }
 }
@@ -209,7 +212,7 @@ sub cache_finish ($$) {
     }
 
     print ::DEBUG
-	"CACHE $what read=$nprevious hits $rows_hit/$rows_today";
+	"CACHE $taskprint$what read=$nprevious hits $rows_hit/$rows_today";
     for my $cachekey (sort keys %q_count) {
 	my $total = $q_count{$cachekey};
 	my $hits = $total - ($q_misses{$cachekey} // 0);
-- 
2.11.0


