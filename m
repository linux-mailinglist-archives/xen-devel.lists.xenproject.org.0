Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 505E6244D90
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:26:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTN-0003zu-7c; Fri, 14 Aug 2020 17:26:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dQs-00024H-1V
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:23:58 +0000
X-Inumbo-ID: 749a8c06-0975-4c08-af34-0971eb50803e
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 749a8c06-0975-4c08-af34-0971eb50803e;
 Fri, 14 Aug 2020 17:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425740;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=w0mAgyyUXpLt7oHYlPS5haLuq7oCjn7NqYL9AvRgxDs=;
 b=JxVGtU5SsWrrnnU7DeKQC9fuW8HP7hUp3EhNFZNnFE45muHoQhcdmRcw
 ABk47UMNWv2DU3RV/9zCOYaplzHrXrzt0KQmP9PNfFfbpLpoH4onxSfAh
 mS2k8TaVQDJNU1U7rqtejokgF9HgKupeKE3B7vTxM434kGSLQkr9NW92P k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: GQnkPuEvFvPygCaE7B/72A7gl2K5hfP+jxP3OspD//H00LURecshAlXMAOe9QCuqTw9cGMJ2G0
 c8e0ACC/5PN2gYge1t3cWzVRQsgTiDkpsbHt5T0Tk4005tmRagTExLVazGd9DpAf1MMDmqHkMN
 Hp0fMMMb4/MfZzdWvTd92KxeCzh57SP/T9r7fVbQ7CxRw6n04YEuZ66lZzk5NsMqVT44iSr0jx
 SPKZJdsqwXn8VD4qkMq7tvyzAfhb3ynbLeZUOUBeS9fsX4j3oSaMfzxonz5E4FR48aCEmESv/l
 nJw=
X-SBRS: 2.7
X-MesageID: 24725189
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208,217";a="24725189"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 37/60] sg-report-job-history (nfc): Remove needless
 conditional
Date: Fri, 14 Aug 2020 18:21:42 +0100
Message-ID: <20200814172205.9624-38-ian.jackson@eu.citrix.com>
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

$htmlout is now always defined.

Nothing other than indentation change, and removal of the surrounding
if block.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-job-history | 162 +++++++++++++++++++++++++-------------------------
 1 file changed, 80 insertions(+), 82 deletions(-)

diff --git a/sg-report-job-history b/sg-report-job-history
index 7197a5f6..3b45992f 100755
--- a/sg-report-job-history
+++ b/sg-report-job-history
@@ -209,89 +209,87 @@ END
          WHERE flight=?
 END
 
-    if (defined $htmlout) {
-        my ($title,$url);
-	ensuredir "$htmlout/history";
-	ensuredir "$htmlout/history/$j";
-        if (defined $bra) {
-            $title= "$j (branch $bra)";
-        } else {
-            $title= "$j (all branches)";
-        }
-        $html_file= "$htmlout/$html_file";
-        open H, "> $html_file.new" or die "$html_file $!";
-        $title= encode_entities($title);
-        print H "<html><head><title>$title</title></head><body>\n";
-        print H "<h1>$title</h1>\n";
-        print H "<table rules=all>";
-        print H "<tr><th>started</th><th>flight</th>",
-	        "<th>branch</th><th>failure</th>\n";
-        print H "<th>", (join ", ", @hostvarcols), "</th>\n";
-        print H "<th>osstest</th>";
-        foreach my $c (@rev_grid_cols) {
-            print H "<th>".encode_entities($c)."</th>\n";
-        }
-        print H "</tr>\n";
-        my $alternate= 0;
-        my @last_revs;
-        my @alt_revs;
-        my $alt_hosts;
-        my $alt_osstest;
-        foreach my $r (@test_rows) {
-            my $altcolour= report_altcolour($alternate);
-            print H "<tr $altcolour>";
-	    my $started = $r->{Flight}{started};
-	    print H "<td>";
-	    print H show_abs_time $started if $started;
-	    print H "</td>\n";
-            my $flt= $r->{Flight}{flight};
-            $url= "$c{ReportHtmlPubBaseUrl}/$flt";
-            print H "<td><a href=\"$url\">$flt</a></td>\n";
-            print H "<td>".encode_entities($r->{Flight}{branch})."</td>\n";
-            $url= "$c{ReportHtmlPubBaseUrl}/$flt/".encode_entities($j).
-		"/info.html";
-            print H "<td $r->{ColourAttr}><a href=\"$url\">".
-                $r->{Content}."</a></td>\n";
-            my $lastrev;
-            my $hosts = join ", ", map { $_ // "-" } @{ $r->{Hosts} };
-            my $hosts_colour = report_altchangecolour(\$alt_hosts, $hosts);
-            print H "<td $hosts_colour>".encode_entities($hosts)."</td>\n";
-            $osstestverq->execute($r->{Flight}{flight});
-            my $osstestrevs = join ' ',
-                 map {
-                    $_ = $_->{harness};
-                    s/^([0-9a-f]{12})[0-9a-f]+\b/$1/;
-                    "<kbd>".encode_entities($_)."</kbd>";
-                 }
-                 @{ $osstestverq->fetchall_arrayref({}) };
-            my $osstest_colour = report_altchangecolour(\$alt_osstest, $osstestrevs);
-            print H "<td $osstest_colour>$osstestrevs</td>\n";
-            foreach my $i (0..$#rev_grid_cols) {
-                my $v= $r->{Revisions}[$i];
-		my $rev_colour = report_altchangecolour(\$alt_revs[$i], $v);
-                print H "<td $rev_colour>";
-                if (defined $v) {
-                    my $vp= $v;
-                    if (defined $lastrev && $v eq $lastrev) {
-                        $vp= '<-';
-                    } else {
-                        $vp =~ s/^((?:\d+\:)?[0-9a-f]{12})([0-9a-f].*)$/$1/;
-                    }
-                    print H "<kbd>".encode_entities($vp)."</kbd>";
-                }
-                $lastrev= $v;
-                $last_revs[$i]= $v;
-                print H "</td>";
-            }
-            print H "</tr>\n";
-            $alternate ^= 1;
-        }
-        print H "</table></body></html>\n";
-        H->error and die $!;
-        close H or die $!;
-        rename "$html_file.new", $html_file or die "$html_file $!";
-        #print "wrote $html_file\n";
+    my ($title,$url);
+    ensuredir "$htmlout/history";
+    ensuredir "$htmlout/history/$j";
+    if (defined $bra) {
+	$title= "$j (branch $bra)";
+    } else {
+	$title= "$j (all branches)";
+    }
+    $html_file= "$htmlout/$html_file";
+    open H, "> $html_file.new" or die "$html_file $!";
+    $title= encode_entities($title);
+    print H "<html><head><title>$title</title></head><body>\n";
+    print H "<h1>$title</h1>\n";
+    print H "<table rules=all>";
+    print H "<tr><th>started</th><th>flight</th>",
+	    "<th>branch</th><th>failure</th>\n";
+    print H "<th>", (join ", ", @hostvarcols), "</th>\n";
+    print H "<th>osstest</th>";
+    foreach my $c (@rev_grid_cols) {
+	print H "<th>".encode_entities($c)."</th>\n";
+    }
+    print H "</tr>\n";
+    my $alternate= 0;
+    my @last_revs;
+    my @alt_revs;
+    my $alt_hosts;
+    my $alt_osstest;
+    foreach my $r (@test_rows) {
+	my $altcolour= report_altcolour($alternate);
+	print H "<tr $altcolour>";
+	my $started = $r->{Flight}{started};
+	print H "<td>";
+	print H show_abs_time $started if $started;
+	print H "</td>\n";
+	my $flt= $r->{Flight}{flight};
+	$url= "$c{ReportHtmlPubBaseUrl}/$flt";
+	print H "<td><a href=\"$url\">$flt</a></td>\n";
+	print H "<td>".encode_entities($r->{Flight}{branch})."</td>\n";
+	$url= "$c{ReportHtmlPubBaseUrl}/$flt/".encode_entities($j).
+	    "/info.html";
+	print H "<td $r->{ColourAttr}><a href=\"$url\">".
+	    $r->{Content}."</a></td>\n";
+	my $lastrev;
+	my $hosts = join ", ", map { $_ // "-" } @{ $r->{Hosts} };
+	my $hosts_colour = report_altchangecolour(\$alt_hosts, $hosts);
+	print H "<td $hosts_colour>".encode_entities($hosts)."</td>\n";
+	$osstestverq->execute($r->{Flight}{flight});
+	my $osstestrevs = join ' ',
+	     map {
+		$_ = $_->{harness};
+		s/^([0-9a-f]{12})[0-9a-f]+\b/$1/;
+		"<kbd>".encode_entities($_)."</kbd>";
+	     }
+	     @{ $osstestverq->fetchall_arrayref({}) };
+	my $osstest_colour = report_altchangecolour(\$alt_osstest, $osstestrevs);
+	print H "<td $osstest_colour>$osstestrevs</td>\n";
+	foreach my $i (0..$#rev_grid_cols) {
+	    my $v= $r->{Revisions}[$i];
+	    my $rev_colour = report_altchangecolour(\$alt_revs[$i], $v);
+	    print H "<td $rev_colour>";
+	    if (defined $v) {
+		my $vp= $v;
+		if (defined $lastrev && $v eq $lastrev) {
+		    $vp= '<-';
+		} else {
+		    $vp =~ s/^((?:\d+\:)?[0-9a-f]{12})([0-9a-f].*)$/$1/;
+		}
+		print H "<kbd>".encode_entities($vp)."</kbd>";
+	    }
+	    $lastrev= $v;
+	    $last_revs[$i]= $v;
+	    print H "</td>";
+	}
+	print H "</tr>\n";
+	$alternate ^= 1;
     }
+    print H "</table></body></html>\n";
+    H->error and die $!;
+    close H or die $!;
+    rename "$html_file.new", $html_file or die "$html_file $!";
+    #print "wrote $html_file\n";
 }
 
 my @tasks;
-- 
2.11.0


