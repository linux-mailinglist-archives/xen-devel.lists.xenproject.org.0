Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF148244D72
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:22:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dPR-00029z-BB; Fri, 14 Aug 2020 17:22:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dPP-00024H-Um
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:22:27 +0000
X-Inumbo-ID: 7cfade94-bd8a-4f7c-9479-4c87aaef6b90
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7cfade94-bd8a-4f7c-9479-4c87aaef6b90;
 Fri, 14 Aug 2020 17:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425733;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=JGVZgUM9Ou32fNfhr7w/FMv9cNbdn7S2Jl2MIBunzZQ=;
 b=cGY9juJrgezOfICmiqUbGeVTxrbXt5WqfkYrMtNZcVAvgVUFtgRsJdeN
 Plr+hsgpEU/vJG0B88etnO+jWF4FHKzbnKbIY8Fnt1cxIqD3WC9wy20Td
 0E2J7q/EOYhsFcgpSGA4F9lUeS0GpFXF1qMnug7ATqdkhBC+xmWi8hLST 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: gGBUpPHDUEVc/bmQu3o7aloOTSEwnX+ETtRovKb0ZTBHJzZzwYL1Qmy7ht8vRXIHRBjFWIvx+c
 DEGKDM9B8g6IRsFsHl4y3u64j6OUh2xsfj+pJ4uc11DveaHaG6ziaoy6ejSfzHcY1XeYGSVYCY
 4fRHCIkn335Rdxk6F6XBJUAbC+MWd9YyT0yg4ykiiA8zDvzRnLpLAi4X3VDILwrPrgxj5ERn2t
 6WOzpaGoDMbjDcXF4bDWNdVQi3yf9xdDCSISjL7+C+7luuB/P1Ubo1jWVLrIgk6TSne/i2iGZr
 wAQ=
X-SBRS: 2.7
X-MesageID: 24879728
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24879728"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 05/60] history reporting (nfc): Make cache_write_entry
 into a top-level sub
Date: Fri, 14 Aug 2020 18:21:10 +0100
Message-ID: <20200814172205.9624-6-ian.jackson@eu.citrix.com>
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

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-host-history | 46 +++++++++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/sg-report-host-history b/sg-report-host-history
index 83344a40..fe5b7cc2 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -112,6 +112,27 @@ sub cache_read_existing ($) {
     close H;
 }
 
+sub cache_write_entry ($$) {
+    my ($fh, $jr) = @_;
+    print $fh "<!-- osstest-report-reuseable";
+    my $whash = sub {
+	my ($h) = @_;
+	foreach my $k (sort keys %$h) {
+	    next if $k =~ m/^\%/;
+	    $_ = $h->{$k};
+	    s{[^-+=/~:;_.,\w]}{ sprintf "%%%02x", ord $& }ge;
+	    printf $fh " %s=%s", $k, $_;
+	}
+    };
+    $whash->($jr);
+    foreach my $hk (sort keys %$jr) {
+	next unless $hk =~ m/^\%/;
+	print $fh " $'";
+	$whash->($jr->{$hk});
+    }
+    print $fh " -->\n";
+}
+
 sub computeflightsrange () {
     if ($flightlimit) {
 	my $minflightsq = db_prepare(<<END);
@@ -285,27 +306,6 @@ END
     print DEBUG "CACHE $hostname $cachehits / ".(scalar @rows)
 	." of ".(scalar %cache)."\n";
 
-    my $write_cache_entry = sub {
-	my ($jr) = @_;
-        print H "<!-- osstest-report-reuseable";
-	my $whash = sub {
-	    my ($h) = @_;
-	    foreach my $k (sort keys %$h) {
-		next if $k =~ m/^\%/;
-		$_ = $h->{$k};
-		s{[^-+=/~:;_.,\w]}{ sprintf "%%%02x", ord $& }ge;
-		printf H " %s=%s", $k, $_;
-	    }
-	};
-	$whash->($jr);
-	foreach my $hk (sort keys %$jr) {
-	    next unless $hk =~ m/^\%/;
-	    print H " $'";
-	    $whash->($jr->{$hk});
-	}
-	print H " -->\n";
-    };
-
     @rows = sort { $b->{finished} <=> $a->{finished} } @rows;
 
     print DEBUG "SORTED\n";
@@ -317,7 +317,7 @@ END
 
     foreach my $jr (@rows) {
 	if ($wrote++ >= $limit) {
-	    $write_cache_entry->($jr);
+	    cache_write_entry(\*H, $jr);
 	    next;
 	}
 
@@ -417,7 +417,7 @@ END
         print H "<td>" if !$any_power;
 	print H "</td>\n";
 
-	$write_cache_entry->($jr);
+	cache_write_entry(\*H, $jr);
 
 	print H "</tr>\n\n";
 	$alternate ^= 1;
-- 
2.11.0


