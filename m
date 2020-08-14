Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B32B244D7E
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:23:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dPr-0002ce-TE; Fri, 14 Aug 2020 17:22:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dPq-00024Q-Fy
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:22:54 +0000
X-Inumbo-ID: 5d65d4e3-876c-4136-98ca-f3e8e235ac0a
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d65d4e3-876c-4136-98ca-f3e8e235ac0a;
 Fri, 14 Aug 2020 17:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425740;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=cgymAWCuGG6G0PHhWvU8N3IYB47K2vDm+DZU0S9yr2A=;
 b=OaHP0596L+MgxsEDrAQe1piklO+CgZaEuoo9nTqOwvA4IVd7Be/0cyaf
 eoJwSf60q8leQs6+XFeZthrU3J50VCoX0KuZNttKT54nBqntbhULcNqo8
 Aubr/s1u3TsP3B+vSdZ4oSw0QZxmBZoxJgwzJwtSty59/Tav56/rqf4zL E=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: XLTBOLShMunTVXpzUPk0nL30OigiYSi84mZ8SU1DYgCm8dckGpD+ff64M3PkY9hrJUNTxBlzKs
 dxjwmp/nV5gCvaCGIXPNgoQkojgEJDz7k3+/Yajo79Hsp/OFfvNQAfa1l2U9BVuk3m8vBtqayB
 1yoJu4XWTtS0qKEsnSZi9v8icnD2uUbbFbIsxZbNz+sxCVhzgwbLSbtMZysSIHCiPhQIxvCILn
 2Zr9JovgA0ZOfe9XxcAyvCNjX3G0PfZf9Mmv6KiSEwhryICoE9Uz87t2rYH2x9Pl+teg4jtIYc
 60Q=
X-SBRS: 2.7
X-MesageID: 24900377
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24900377"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 41/60] sg-report-job-history (nfc): Make $ri->{Hosts}
 a hash
Date: Fri, 14 Aug 2020 18:21:46 +0100
Message-ID: <20200814172205.9624-42-ian.jackson@eu.citrix.com>
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

This will make it easier to cache this.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-job-history | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sg-report-job-history b/sg-report-job-history
index 8932458e..118926c6 100755
--- a/sg-report-job-history
+++ b/sg-report-job-history
@@ -173,11 +173,11 @@ END
     while (my $f= $flightsq->fetchrow_hashref()) {
         my $ri= report_run_getinfo($f);
 
-	$ri->{Hosts} = [ ];
+	$ri->{Hosts} = { };
 	foreach my $hostvar (@hostvarcols) {
 	    $hostq->execute($f->{flight}, $f->{job}, $hostvar);
 	    my ($host) = $hostq->fetchrow_array();
-	    push @{ $ri->{Hosts} }, ($host // "-");
+	    $ri->{Hosts}{$hostvar} = $host;
 	}
 
         my %revisions;
@@ -255,7 +255,7 @@ END
 	print H "<td $r->{ColourAttr}><a href=\"$url\">".
 	    $r->{Content}."</a></td>\n";
 	my $lastrev;
-	my $hosts = join ", ", map { $_ // "-" } @{ $r->{Hosts} };
+	my $hosts = join ", ", map { $r->{Hosts}{$_} // "-" } @hostvarcols;
 	my $hosts_colour = report_altchangecolour(\$alt_hosts, $hosts);
 	print H "<td $hosts_colour>".encode_entities($hosts)."</td>\n";
 	$osstestverq->execute($r->{Flight}{flight});
-- 
2.11.0


