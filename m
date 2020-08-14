Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA9F244DA4
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:27:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTk-0004iA-Kd; Fri, 14 Aug 2020 17:26:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dR7-00024H-2N
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:24:13 +0000
X-Inumbo-ID: 0cc4a31a-a8ff-42df-9468-3999946ea39f
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0cc4a31a-a8ff-42df-9468-3999946ea39f;
 Fri, 14 Aug 2020 17:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425741;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=K4MIaKessBz20HyGZXTzw+K8QuBXZ4UICpsMkuTqCYc=;
 b=b1aac2nP9l8qvgqxMWMXp7BNgrx5Qr1qsmlYeXTspp0ml44haC9t7aJa
 2D2oMglJjlUxeFZvbJH3hkuZreClYTg9m8KecBGxtY1hhtcWw2jp561tZ
 NU2VNqhmxOHEkwiCilqhQMbK6slOTuDiSndn0XyDJtJeIMEJ73EL1+7rX w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: tOXW0E1ASfq6vWuXstSZBpN89HTycJbZPlMC4UcJIvO32tDN6HB4Vn4dSHJSCzArMaHVFRl8Ff
 ii/oz83F8N2JgFYgmDZhls9FzVfl51Ez3mS7SGcmwLSK5F9Kbl8D+bqFCDeZBvT0mqDERp5JXS
 RTjWNAHmrB0uGAZO/gnQzgToY0XOf2fYSLQWGtHF3qXj1vGtFY6xfoM1Sk+fjzk0eTgOGqoFl+
 YId1riTVqEJhVYC+o+L0GeZfRPLOJNjmpAj+62VViNl3q5qhMdevKA17THPZS9BHNR/NPAkFE6
 N4M=
X-SBRS: 2.7
X-MesageID: 25487831
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="25487831"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 46/60] sg-report-job-history: Introduce use of cache,
 for hosts query
Date: Fri, 14 Aug 2020 18:21:51 +0100
Message-ID: <20200814172205.9624-47-ian.jackson@eu.citrix.com>
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

* Set up the cache.
* Call the per-row setup hook.
* Cache the computation of $ri->{Hosts}.
* Call the per-row cache write hook.
* Finalise the cache.

Output is the same, but with cache information in the output html, and
faster.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-job-history | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/sg-report-job-history b/sg-report-job-history
index 5684ac02..9f1216a6 100755
--- a/sg-report-job-history
+++ b/sg-report-job-history
@@ -121,6 +121,10 @@ sub processjobbranch ($$$) {
            AND name LIKE '%buildjob'
 END
 
+    cache_set_task_print("$j $branch_or_all");
+    cache_set_key_cols(qw(flight status)); # we process one job per process
+    cache_read_previous("$htmlout/$html_file");
+
     print DEBUG "processjobbranch('$j',", ($bra ? "'$bra'" : 'undef'), ")\n";
 
     my %rev_grid_col;
@@ -156,13 +160,17 @@ END
 END
 
     while (my $f= $flightsq->fetchrow_hashref()) {
+	cache_row_lookup_prep(\$f);
         my $ri= report_run_getinfo($f);
 
-	$ri->{Hosts} = { };
-	$hostq->execute($f->{flight}, $f->{job});
-	while (my ($hostvar,$host) = $hostq->fetchrow_array()) {
-	    $ri->{Hosts}{$hostvar} = $host;
-	}
+	$ri->{Hosts} = cacheable_fn($f, 'h', sub {
+            my %hosts;
+	    $hostq->execute($f->{flight}, $f->{job});
+	    while (my ($hostvar,$host) = $hostq->fetchrow_array()) {
+		$hosts{$hostvar} = $host;
+	    }
+	    \%hosts;
+	});
 
         my %revisions;
         add_revisions(\%revisions, $f->{flight}, $f->{job}, '');
@@ -276,8 +284,10 @@ END
 	    print H "</td>";
 	}
 	print H "</tr>\n";
+	cache_write_entry(\*H, $r->{Flight});
 	$alternate ^= 1;
     }
+    cache_finish(\*H, "");
     print H "</table></body></html>\n";
     H->error and die $!;
     close H or die $!;
-- 
2.11.0


