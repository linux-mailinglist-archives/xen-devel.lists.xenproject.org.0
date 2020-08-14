Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5A5244D9B
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:26:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTd-0004P1-0W; Fri, 14 Aug 2020 17:26:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dRI-00024Q-Is
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:24:24 +0000
X-Inumbo-ID: 780f4fc4-0a03-42b8-9678-da8eec86efa9
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 780f4fc4-0a03-42b8-9678-da8eec86efa9;
 Fri, 14 Aug 2020 17:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=I4Nd9Gt6CpMY5s4Khl15W7v0e3Htwl7Hno7gLQnvhCk=;
 b=M+QfoL+xq9fDh3OgGZ3SlulYtl2slAVuqQ0k5OYnfOMq0eW/Dbc83rza
 LNdnydxvqPjpjnpTZdCKgbHp613AHrL+QGX3rdMT4KITq/x373TJTB9dc
 6duFoFUplUbgyQo7Bg25dqM4kyaFY9FqIZr+dWG8wt0mCxuYgv12mBi3H g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: qKBuPelv8bhlZJNAUjTqHhwuampfVjCSQAyrcXmT4GiiB4wrcjz/HEs2ZPOX70olOZOh+JCRVo
 A75TYw1/8GiOGrcSFVVCRBm9cv6Qd1MRC4V83azadyrvvINN4AQLJPeVGvdQmcIxDsIEEZbxGp
 VGHmn58BmleiYaC9g+rhZndJnF2kyxfnrcInpRW6AQQRKnWw4KRrCzQ4jiZX+vSqxuL9zbN89H
 eqejur8hjhsiLM0TLvy7yJaneOKjouwi81ljwbM7gR6Nnrd1BQuwKhBlLHpnM6cZx0VU4N00kI
 8pY=
X-SBRS: 2.7
X-MesageID: 24576915
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24576915"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 20/60] history reporting (nfc): Move cache code into
 HistoryReport module
Date: Fri, 14 Aug 2020 18:21:25 +0100
Message-ID: <20200814172205.9624-21-ian.jackson@eu.citrix.com>
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

Finally this is now reuseable code and we can put it in the
HistoryReport module.

Pure cut-and-paste.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/HistoryReport.pm | 115 +++++++++++++++++++++++++++++++++++++++++++++++
 sg-report-host-history   | 115 -----------------------------------------------
 2 files changed, 115 insertions(+), 115 deletions(-)

diff --git a/Osstest/HistoryReport.pm b/Osstest/HistoryReport.pm
index c5e7e226..a0565b6a 100644
--- a/Osstest/HistoryReport.pm
+++ b/Osstest/HistoryReport.pm
@@ -40,4 +40,119 @@ BEGIN {
 
 use POSIX;
 
+our @cache_row_key_cols;
+
+our %cache;
+
+our %q_count;
+our %q_misses;
+
+our $rows_previous = 0;
+our $rows_today = 0;
+our $rows_hit = 0;
+
+sub cache_set_key_cols { @cache_row_key_cols = @_; }
+
+sub cache_row_key ($) {
+    my ($jr) = @_;
+    return join $; , map { $jr->{$_} } @cache_row_key_cols;
+}
+
+sub cacheable_fn ($$$) {
+    my ($jr, $cachekey, $fn) = @_;
+    $cachekey = '%'.$cachekey;
+    my $cached = $jr->{$cachekey};
+    $q_count{$cachekey}++;
+    if (!$cached) {
+	$q_misses{$cachekey}++;
+	$cached = $fn->();
+	$jr->{$cachekey} = $cached;
+    }
+    return $cached;
+}
+
+sub cacheable_query ($$$) {
+    my ($q, $jr, $cachekey) = @_;
+    cacheable_fn($jr, $cachekey, sub {
+	foreach my $k (keys %{ $q->{ParamTypes} }) {
+	    $k =~ m/^:/ or die "$k ?";
+	    $q->bind_param($k, $jr->{$'} // die "$k ?");
+	}
+	$q->execute();
+	return $q->fetchrow_hashref();
+    });
+}
+
+sub cache_read_previous ($) {
+    my ($html_file) = @_;
+    if (!open H, $html_file) {
+        return if $!==ENOENT;
+        die "failed to open $html_file: $!";
+    }
+    %cache = ();
+    for (;;) {
+	$rows_previous++;
+        $_ = <H> // last;
+        next unless m{^\<\!-- osstest-report-reuseable (.*)--\>$};
+	my $jr = {};
+	my $ch = $jr;
+	foreach (split / /, $1) {
+	    if (m{^\w+$}) {
+		$ch = { };
+		$jr->{'%'.$&} = $ch;
+		next;
+	    }
+	    s{^(\w+)=}{} or die;
+	    my $k = $1;
+	    s{\%([0-9a-f]{2})}{ chr hex $1 }ge;
+	    $ch->{$k} = $_;
+	}
+	$cache{cache_row_key($jr)} = $jr;
+    }
+    close H;
+}
+
+sub cache_row_lookup_prep ($) {
+    my ($jrr) = @_;
+
+    $rows_today++;
+    my $cacherow = $cache{cache_row_key($$jrr)};
+    if ($cacherow) {
+	$$jrr = $cacherow;
+	$rows_hit++;
+    }
+}
+
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
+sub cache_report_stats ($) {
+    my ($what) = @_;
+    print ::DEBUG "CACHE $what read=$rows_previous hits $rows_hit/$rows_today";
+    for my $cachekey (sort keys %q_count) {
+	my $total = $q_count{$cachekey};
+	my $hits = $total - ($q_misses{$cachekey} // 0);
+	print ::DEBUG " $cachekey=$hits/$total";
+    }
+    print ::DEBUG "\n";
+}
+
 1;
diff --git a/sg-report-host-history b/sg-report-host-history
index 05a2dfe0..a195bb21 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -77,121 +77,6 @@ our $restrictflight_cond = restrictflight_cond();
 our $flightcond;
 our $minflight;
 
-our @cache_row_key_cols;
-
-our %cache;
-
-our %q_count;
-our %q_misses;
-
-our $rows_previous = 0;
-our $rows_today = 0;
-our $rows_hit = 0;
-
-sub cache_set_key_cols { @cache_row_key_cols = @_; }
-
-sub cache_row_key ($) {
-    my ($jr) = @_;
-    return join $; , map { $jr->{$_} } @cache_row_key_cols;
-}
-
-sub cacheable_fn ($$$) {
-    my ($jr, $cachekey, $fn) = @_;
-    $cachekey = '%'.$cachekey;
-    my $cached = $jr->{$cachekey};
-    $q_count{$cachekey}++;
-    if (!$cached) {
-	$q_misses{$cachekey}++;
-	$cached = $fn->();
-	$jr->{$cachekey} = $cached;
-    }
-    return $cached;
-}
-
-sub cacheable_query ($$$) {
-    my ($q, $jr, $cachekey) = @_;
-    cacheable_fn($jr, $cachekey, sub {
-	foreach my $k (keys %{ $q->{ParamTypes} }) {
-	    $k =~ m/^:/ or die "$k ?";
-	    $q->bind_param($k, $jr->{$'} // die "$k ?");
-	}
-	$q->execute();
-	return $q->fetchrow_hashref();
-    });
-}
-
-sub cache_read_previous ($) {
-    my ($html_file) = @_;
-    if (!open H, $html_file) {
-        return if $!==ENOENT;
-        die "failed to open $html_file: $!";
-    }
-    %cache = ();
-    for (;;) {
-	$rows_previous++;
-        $_ = <H> // last;
-        next unless m{^\<\!-- osstest-report-reuseable (.*)--\>$};
-	my $jr = {};
-	my $ch = $jr;
-	foreach (split / /, $1) {
-	    if (m{^\w+$}) {
-		$ch = { };
-		$jr->{'%'.$&} = $ch;
-		next;
-	    }
-	    s{^(\w+)=}{} or die;
-	    my $k = $1;
-	    s{\%([0-9a-f]{2})}{ chr hex $1 }ge;
-	    $ch->{$k} = $_;
-	}
-	$cache{cache_row_key($jr)} = $jr;
-    }
-    close H;
-}
-
-sub cache_row_lookup_prep ($) {
-    my ($jrr) = @_;
-
-    $rows_today++;
-    my $cacherow = $cache{cache_row_key($$jrr)};
-    if ($cacherow) {
-	$$jrr = $cacherow;
-	$rows_hit++;
-    }
-}
-
-sub cache_write_entry ($$) {
-    my ($fh, $jr) = @_;
-    print $fh "<!-- osstest-report-reuseable";
-    my $whash = sub {
-	my ($h) = @_;
-	foreach my $k (sort keys %$h) {
-	    next if $k =~ m/^\%/;
-	    $_ = $h->{$k};
-	    s{[^-+=/~:;_.,\w]}{ sprintf "%%%02x", ord $& }ge;
-	    printf $fh " %s=%s", $k, $_;
-	}
-    };
-    $whash->($jr);
-    foreach my $hk (sort keys %$jr) {
-	next unless $hk =~ m/^\%/;
-	print $fh " $'";
-	$whash->($jr->{$hk});
-    }
-    print $fh " -->\n";
-}
-
-sub cache_report_stats ($) {
-    my ($what) = @_;
-    print ::DEBUG "CACHE $what read=$rows_previous hits $rows_hit/$rows_today";
-    for my $cachekey (sort keys %q_count) {
-	my $total = $q_count{$cachekey};
-	my $hits = $total - ($q_misses{$cachekey} // 0);
-	print ::DEBUG " $cachekey=$hits/$total";
-    }
-    print ::DEBUG "\n";
-}
-
 cache_set_key_cols(qw(flight job status name));
 
 sub computeflightsrange () {
-- 
2.11.0


