Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4075A244D7D
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:23:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dPq-0002aY-HA; Fri, 14 Aug 2020 17:22:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dPo-00024H-Vd
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:22:53 +0000
X-Inumbo-ID: 6f09f715-d41d-4452-ad68-84fe856b129e
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f09f715-d41d-4452-ad68-84fe856b129e;
 Fri, 14 Aug 2020 17:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=47TkWKaaMaSDWsGucq1zdsdrawQzX1oeIufX8OcbbNY=;
 b=V78mDAs8efXQIUdZJjPyIroEivHDu5bOCuhAc4PwIeS9vGZ4hNBMIXGx
 JOmK6NYLkEoQDjUfqU4oGAl9LaLk31WAXcoCZ7MqnfWpO4EJ2pwci0YxZ
 f4XPF3Qu3V8swAOqcwjn1olUMTHK/pXfSzj6Q4Ln1OE9HIEFPqw0R1RC6 k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: zFNVZ/yNaBs/RwWhfhsC3hLuE+5mbJuv5+TSB6jTA/S45Ql/xDkCZYXNQDOD+Ul7Zy5325BDwD
 3KQkroufcgpnS9VvdPWkQrPuzWioHFTXLZzN+tnRKTDgF8RW1TOsCKWbDOxK7061p2dAKCGB8E
 NV6OutNrglmz0SEUtiKRce+PaaGUThdACd7nqujpzX5GkMxAg183rUWvxb82RrHbTjqDuliYat
 CFsdSVI9qhvr7CL/Sw5YK1sJd7ddLMDaXB9wvMNYcCTDT8WQlF1VeSgxcQalL/opXvIfw3Mwgw
 JCE=
X-SBRS: 2.7
X-MesageID: 24900369
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24900369"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 17/60] history reporting: Cache stats reporting:
 Centralise and rework
Date: Fri, 14 Aug 2020 18:21:22 +0100
Message-ID: <20200814172205.9624-18-ian.jackson@eu.citrix.com>
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

This uses the new variables instead of the old ones.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-host-history | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/sg-report-host-history b/sg-report-host-history
index 32cc883d..9c70b560 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -185,6 +185,17 @@ sub cache_write_entry ($$) {
     print $fh " -->\n";
 }
 
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
 cache_set_key_cols(qw(flight job status name));
 
 sub computeflightsrange () {
@@ -335,9 +346,6 @@ END
 	push @rows, { %$jr, %$endedrow };
     }
 
-    print DEBUG "CACHE $hostname $rows_hit / ".(scalar @rows)
-	." of ".(scalar %cache)."\n";
-
     @rows = sort { $b->{finished} <=> $a->{finished} } @rows;
 
     print DEBUG "SORTED\n";
@@ -457,8 +465,7 @@ END
     rename "$html_file.new", "$html_file" or die "$html_file $!"
         if $doinstall;
 
-    print DEBUG "HOST CACHE RQ $runvarq_hits / ".
-	  ($runvarq_hits+$runvarq_misses)."\n";
+    cache_report_stats("$hostname");
 }
 
 foreach my $host (@ARGV) {
@@ -528,7 +535,6 @@ foreach my $host (sort keys %hosts) {
             mainquery($host);
 	    reporthost $host;
 	});
-	print DEBUG "JQ CACHE ".($jqtotal-$jqcachemisses)." / $jqtotal\n";
 	exit(0);
     }
     print DEBUG "SPAWNED [$pid] $host\n";
-- 
2.11.0


