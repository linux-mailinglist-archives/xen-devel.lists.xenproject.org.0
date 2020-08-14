Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1F2244D77
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:22:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dPI-00024z-0b; Fri, 14 Aug 2020 17:22:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dPF-00024H-UD
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:22:17 +0000
X-Inumbo-ID: baab65aa-6d25-44f2-a8a2-8b0d04228735
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id baab65aa-6d25-44f2-a8a2-8b0d04228735;
 Fri, 14 Aug 2020 17:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425733;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=5gDfq120B1TdLL2gzZ7GTUxIKoMyYxGwxpZ/5dWdhfU=;
 b=copc8rFQvTBzg46YaIYc5RS35YjX7P+UgncQdf/BpOB7c15FY4W6hAEO
 /APdeYjvOybXipUHnwWCp+YbEKeMPf3W319vYTMGUIfqzflGyjb8ercWB
 SJw/AxBRzEZG2Hdy8TYbSb77QPeE1Qax9WW05vBI45tWhcnLnESJM7VmT c=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: MlOk7mvYTrWJ2MacOCGhA+a7t/6PeGH6nlGF6cx8cqRH+L7gR+dr7pr46eJz7470Tv2TKggzk3
 gvozQQvCa84qDPDO/8OTHtjfhTZoE7xuOpufy9dCaTgqPlk5Ekaqxd5tRTCwMEKKmGihOxMmB3
 9g98GFCMh0OegL4qSUxyc7+m37iG0p4R0oofrhQpSIoC1fUSL5Q3uxoNt+JWaVSGfZuyguJQYs
 KWuxuhS6vUEfxfbghiu+XLxIOQv5nEfZdu8/Le8l71uc0owvcCCCOSs026WnoIDTSS7pmqCEgY
 We8=
X-SBRS: 2.7
X-MesageID: 24879726
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24879726"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 04/60] history reporting (nfc): Refactor to generalise,
 cache_read_existing
Date: Fri, 14 Aug 2020 18:21:09 +0100
Message-ID: <20200814172205.9624-5-ian.jackson@eu.citrix.com>
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

* Introduce @cache_row_key_cols and cache_row_key
* Handle $html_file pathname construction and $read_existing
  at the call site.
* Rename cache_read_existing.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-host-history | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/sg-report-host-history b/sg-report-host-history
index 4c0022e8..83344a40 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -77,11 +77,15 @@ our $flightcond;
 our $minflight;
 
 our %cache;
+our @cache_row_key_cols = qw(flight job status name);
 
-sub read_existing_logs ($) {
-    my ($hostname) = @_;
-    return unless $read_existing;
-    my $html_file = "$htmlout/$hostname.html";
+sub cache_row_key ($) {
+    my ($jr) = @_;
+    return join $; , map { $jr->{$_} } @cache_row_key_cols;
+}
+
+sub cache_read_existing ($) {
+    my ($html_file) = @_;
     if (!open H, $html_file) {
         return if $!==ENOENT;
         die "failed to open $html_file: $!";
@@ -103,7 +107,7 @@ sub read_existing_logs ($) {
 	    s{\%([0-9a-f]{2})}{ chr hex $1 }ge;
 	    $ch->{$k} = $_;
 	}
-	$cache{$jr->{flight},$jr->{job},$jr->{status},$jr->{name}} = $jr;
+	$cache{cache_row_key($jr)} = $jr;
     }
     close H;
 }
@@ -261,8 +265,7 @@ END
     foreach my $jr (@$inrows) {
 	#print DEBUG "JOB $jr->{flight}.$jr->{job} ";
 
-	my $cacherow =
-	    $cache{$jr->{flight},$jr->{job},$jr->{status},$jr->{name}};
+	my $cacherow = $cache{cache_row_key($jr)};
 	if ($cacherow) {
 	    $jr = $cacherow;
 	    $cachehits++;
@@ -492,7 +495,7 @@ foreach my $host (sort keys %hosts) {
     my $pid = fork // die $!;
     if (!$pid) {
 	opendb_tests();
-	read_existing_logs($host);
+	cache_read_existing("$htmlout/$host.html") if $read_existing;
 	db_retry($dbh_tests, [], sub {
             mainquery($host);
 	    reporthost $host;
-- 
2.11.0


