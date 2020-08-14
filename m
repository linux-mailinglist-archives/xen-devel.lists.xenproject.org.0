Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD07244D93
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:26:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTG-0003ve-By; Fri, 14 Aug 2020 17:26:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dQE-00024H-08
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:23:18 +0000
X-Inumbo-ID: e2150a9a-a58e-4e3d-bdbb-40a0a3959b5b
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2150a9a-a58e-4e3d-bdbb-40a0a3959b5b;
 Fri, 14 Aug 2020 17:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425737;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=XiPWejwwXpw9o1nBvswJoP0ieCDSqMIwE8v0EYPViaY=;
 b=Y2qyCBW4529PeSEvr2El4si8IGYS07p1Q4dz7yW+1TU9hIHeTejDkxuc
 gHrQqdlhmtsPV/FhsTg3ze5xB/zEf6FZll0fL8sqfVqd+4xYoOmtpFVo1
 tB4UenCTqfGuQf2yv2i9NxKDk2vI734Ro4XIW6q0XGZtV0ImsvgtxvHF0 E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: HYCUijgYzXrBpfqBRfw8aIUcGquuKN9q987Qx16Wb2/PEo91PXvCCkNhUFgJgUWqw5g4gDbNMv
 5bJNOhVsA6XG5rajEe9HyLxpOjtPj5rgiy5hARCtmwRqCXAO8aPpvxxaV7hFYLPpQzEe+rzyWP
 yHEc1dPOY5LpLyaVnPj0KwlddE6eLOT4JYa70Cj85jsoPrzS+RoBw90Vm0L3vnRdCtjCqwaiJ6
 Q8H45BsWJGDNhDKyp6uCQUhBUGzN+A50AiUqCIla9EiTMYBfMzlWQRE8Q01XPkpONVrYmn8l4f
 NmU=
X-SBRS: 2.7
X-MesageID: 25487820
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="25487820"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 24/60] history reporting: Cache data limit now in
 History module
Date: Fri, 14 Aug 2020 18:21:29 +0100
Message-ID: <20200814172205.9624-25-ian.jackson@eu.citrix.com>
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

Replace the ad-hoc query-specific limit strategy in
sg-report-host-history with a new, more principled, arrangement, in
HistoryReport.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/HistoryReport.pm | 38 ++++++++++++++++++++++++++++++++------
 sg-report-host-history   | 14 +++++---------
 2 files changed, 37 insertions(+), 15 deletions(-)

diff --git a/Osstest/HistoryReport.pm b/Osstest/HistoryReport.pm
index 6e5ed6ec..b576c02a 100644
--- a/Osstest/HistoryReport.pm
+++ b/Osstest/HistoryReport.pm
@@ -31,7 +31,7 @@ BEGIN {
 			 cacheable_query
 			 cacheable_fn
 			 cache_write_entry
-			 cache_report_stats
+			 cache_finish
 		    );
     %EXPORT_TAGS = ();
 
@@ -43,6 +43,7 @@ use POSIX;
 our @key_cols;
 
 our %cache;
+our @previous;
 
 our %q_count;
 our %q_misses;
@@ -50,6 +51,7 @@ our %q_misses;
 our $rows_previous = 0;
 our $rows_today = 0;
 our $rows_hit = 0;
+our $rows_extra = 0;
 
 
 # History report query and processing cache
@@ -73,6 +75,12 @@ our $rows_hit = 0;
 # It also contains one entry for each cached subcomputation.
 # The keys for these entries are "\%$cachekey".
 
+# Limit strategy
+#
+# It is up to the caller to make a primary query that returns the rows
+# that it is interested in.  They should be in (perhaps approximate)
+# reverse time order.
+
 # These routines all expect the file handle ::DEBUG
 # They are not reentrant and can only be used for one HTML
 # output file in one program run.
@@ -118,7 +126,6 @@ sub cache_read_previous ($) {
     }
     %cache = ();
     for (;;) {
-	$rows_previous++;
         $_ = <H> // last;
         next unless m{^\<\!-- osstest-report-reuseable (.*)--\>$};
 	my $jr = {};
@@ -134,6 +141,7 @@ sub cache_read_previous ($) {
 	    s{\%([0-9a-f]{2})}{ chr hex $1 }ge;
 	    $ch->{$k} = $_;
 	}
+	push @previous, $jr;
 	$cache{key($jr)} = $jr;
     }
     close H;
@@ -169,18 +177,36 @@ sub cache_write_entry ($$) {
 	print $fh " $'";
 	$whash->($jr->{$hk});
     }
+    $jr->{'% written'} = 1;
     print $fh " -->\n";
 }
 
-sub cache_report_stats ($) {
-    my ($what) = @_;
-    print ::DEBUG "CACHE $what read=$rows_previous hits $rows_hit/$rows_today";
+sub cache_finish ($$) {
+    my ($fh, $what) = @_;
+
+    my $nprevious = @previous;
+
+    # Write as many rows again.  This saves re-querying in case of
+    # flapping etc.
+    for (;;) {
+	last if
+	  $rows_extra >= $rows_today &&
+	  ($rows_today + $rows_extra >= @previous * 0.9);
+	my $jr = shift @previous;
+	last unless $jr;
+	next if $jr->{'% written'};
+	cache_write_entry($fh, $jr);
+	$rows_extra++;
+    }
+
+    print ::DEBUG
+	"CACHE $what read=$nprevious hits $rows_hit/$rows_today";
     for my $cachekey (sort keys %q_count) {
 	my $total = $q_count{$cachekey};
 	my $hits = $total - ($q_misses{$cachekey} // 0);
 	print ::DEBUG " $cachekey=$hits/$total";
     }
-    print ::DEBUG "\n";
+    print ::DEBUG " extra=$rows_extra\n";
 }
 
 1;
diff --git a/sg-report-host-history b/sg-report-host-history
index e281986d..2ad2134d 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -119,7 +119,7 @@ our %hosts;
 sub mainquery ($) {
     my ($host) = @_;
 
-    our $runvarq //= db_prepare(<<END);
+    our $runvarq = db_prepare(<<END.($limit ? <<END_LIMIT : ''));
 	SELECT flight, job, name, status
 	  FROM runvars
           JOIN jobs USING (flight, job)
@@ -128,8 +128,9 @@ sub mainquery ($) {
 	   AND $flightcond
            AND $restrictflight_cond
 	 ORDER BY flight DESC
-         LIMIT $limit * 2
 END
+         LIMIT $limit
+END_LIMIT
 
     print DEBUG "MAINQUERY $host...\n";
     $runvarq->execute($host);
@@ -233,11 +234,6 @@ END
     my $runvarq_misses = 0;
 
     foreach my $jr (@rows) {
-	if ($wrote++ >= $limit) {
-	    cache_write_entry(\*H, $jr);
-	    next;
-	}
-
         #print DEBUG "JR $jr->{flight}.$jr->{job}\n";
 	my $ir = cacheable_query($infoq, $jr, 'i');
 	my $ar = cacheable_query($allocdq, $jr, 'a');
@@ -338,11 +334,11 @@ END
 
     print H "</table></body></html>\n";
 
+    cache_finish(\*H, "$hostname");
+
     close H or die $!;
     rename "$html_file.new", "$html_file" or die "$html_file $!"
         if $doinstall;
-
-    cache_report_stats("$hostname");
 }
 
 foreach my $host (@ARGV) {
-- 
2.11.0


