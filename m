Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 587E6244D6F
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:22:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dPD-00024X-PD; Fri, 14 Aug 2020 17:22:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dPC-00024Q-JZ
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:22:14 +0000
X-Inumbo-ID: b8347382-924e-4d0d-9e5e-3016f5d321cf
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b8347382-924e-4d0d-9e5e-3016f5d321cf;
 Fri, 14 Aug 2020 17:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425733;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=RjjORyA+rdseRm2tV6Z7JEe1+gg8kiuTDoKkbr3lFMQ=;
 b=TIfosQz4s08fgocO6QaE7ES6nuU3DsyC5/8VgJp49lL1gz7dcJ+UkDqF
 HeGDXznnC//J7UfSmYeSz9dMEWk6QysgZ3aW+RGL97Xuq9RBqUDDMJXbE
 P0L1paw0mR5Pf+Jerp9zm8jgKxWTfbdFbc2l+IZs9FF236vtXVdtMuEiZ 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ONtIFVyXJwkCpDNFv43eVx5sFrmhe57dsGwVmo3cuMWhLTNHKS8SlVvhyewcYHDHV4iZaBObwY
 vOWuIi5UQbmECw0soiEYJ1dZYFlHVVhGNwYG7BhHuVXjWEZHZ/k9GrTLpK17hTTFkQnsBrmsHi
 HGwyGw6bxn5M/EXEhdGUyO2QiydwC8e+B/T73qLw0KJe8EHJrrZ9UUtfrPJf/WsaSBFX8nlO77
 ptbTv70h5jmjOutwcY53VFfDGfULOTnysQwmeZ3aS0l029RIKr3kZfpLCBCfPw8TmaFPoWogLK
 iEM=
X-SBRS: 2.7
X-MesageID: 24900362
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24900362"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 01/60] history reporting (nfc): Do not key cache on
 hostname any more
Date: Fri, 14 Aug 2020 18:21:06 +0100
Message-ID: <20200814172205.9624-2-ian.jackson@eu.citrix.com>
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

Now we process only one host at a time, so we don't need to
distinguish.

Replace all references to $tcache with %cache.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-host-history | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sg-report-host-history b/sg-report-host-history
index 380f8fac..50cc5b58 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -76,7 +76,7 @@ our $restrictflight_cond = restrictflight_cond();
 our $flightcond;
 our $minflight;
 
-our %hcaches;
+our %cache;
 
 sub read_existing_logs ($) {
     my ($hostname) = @_;
@@ -86,8 +86,7 @@ sub read_existing_logs ($) {
         return if $!==ENOENT;
         die "failed to open $html_file: $!";
     }
-    my $tcache = { };
-    $hcaches{$hostname} = $tcache;
+    %cache = ();
     for (;;) {
         $_ = <H> // last;
         next unless m{^\<\!-- osstest-report-reuseable (.*)--\>$};
@@ -106,7 +105,7 @@ sub read_existing_logs ($) {
 #	    print DEBUG "GOTCACHE $hostname $k\n";
 	}
 #	print DEBUG "GOTCACHE $hostname \@ $jr->{flight} $jr->{job} $jr->{status},$jr->{name}\n";
-	$tcache->{$jr->{flight},$jr->{job},$jr->{status},$jr->{name}} = $jr;
+	$cache{$jr->{flight},$jr->{job},$jr->{status},$jr->{name}} = $jr;
     }
     close H;
 }
@@ -253,8 +252,6 @@ END
     my $inrows = $hosts{$hostname};
     print DEBUG "FOUND ", (scalar @$inrows), " ROWS for $hostname\n";
 
-    my $tcache = $hcaches{$hostname};
-
     # Each entry in @$inrows is a $jr, which is a hash
     # It has keys for the result columns in mainquery
     # It also has keys '%<letter>' (yes, with a literal '%')
@@ -267,7 +264,7 @@ END
 	#print DEBUG "JOB $jr->{flight}.$jr->{job} ";
 
 	my $cacherow =
-	    $tcache->{$jr->{flight},$jr->{job},$jr->{status},$jr->{name}};
+	    $cache{$jr->{flight},$jr->{job},$jr->{status},$jr->{name}};
 	if ($cacherow) {
 	    $jr = $cacherow;
 	    $cachehits++;
@@ -285,7 +282,7 @@ END
     }
 
     print DEBUG "CACHE $hostname $cachehits / ".(scalar @rows)
-	." of ".(scalar %$tcache)."\n";
+	." of ".(scalar %cache)."\n";
 
     my $write_cache_entry = sub {
 	my ($jr) = @_;
-- 
2.11.0


