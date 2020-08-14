Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E72B244D92
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:26:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTG-0003vW-3p; Fri, 14 Aug 2020 17:26:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dRr-00024Q-Jq
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:24:59 +0000
X-Inumbo-ID: 4c919405-4ff3-407c-9937-c3680a335396
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c919405-4ff3-407c-9937-c3680a335396;
 Fri, 14 Aug 2020 17:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=qblTmgTO05UZJXst81Uqf3+0V5Ri789DAqTYXLAzAGk=;
 b=fdvJNSafRx9VinhJTSeaZTFD4zNxd/aVTcLtVD5oN699POVirfEhXqtQ
 V0Iwm63itomA72PnQBCknXo31GFdHZYw0hDRE89kJTNfnht1DRVGn2wZ6
 pxYa3ONfrwlRlhmgRZHUglYgK54mQEmaLDl5BnPZeFmQqkg7QcXOEeF2G 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 9eVFVQUT5Pv2GmxWznXw+ifds/t8RZyy80dwV4K1o/3cana6JGZQ6ZDmLhzc5EHuNORqjCyLUq
 lrY5Uv11696lDlw0+R5cZPnVLcQAcihCIWYpjcz3A1EUrmWEAnLfaJMRBDbm6+2aeD3mJLDhOU
 0bxwCDAHdYHCGs9Iu78tDG0a8MKU1WPQhLgVC7Zx5sfw+1X3iiu3iDn1Iv9d27/g7f3xWRFUDd
 FNUAEDNbDE9ZjoGewFTAVIJDh4N4LGNdsu3v5gpBOYovvgfapq7jhDxP0nrdi5PMffduAYfVME
 NlQ=
X-SBRS: 2.7
X-MesageID: 24576926
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24576926"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 53/60] sg-report-job-history (nfc): Refactor
 osstestrevs code
Date: Fri, 14 Aug 2020 18:21:58 +0100
Message-ID: <20200814172205.9624-54-ian.jackson@eu.citrix.com>
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

Split this into (1) get the data from the db (2) process it into the
form we want.

This will make it easy to cache (1).

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-job-history | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sg-report-job-history b/sg-report-job-history
index 39ebe024..d5e37bcd 100755
--- a/sg-report-job-history
+++ b/sg-report-job-history
@@ -260,14 +260,17 @@ END
 	my $hosts = join ", ", map { $r->{Hosts}{$_} // "-" } @hostvarcols;
 	my $hosts_colour = report_altchangecolour(\$alt_hosts, $hosts);
 	print H "<td $hosts_colour>".encode_entities($hosts)."</td>\n";
+	my %osstestrevs;
 	$osstestverq->execute($r->{Flight}{flight});
+	while (my ($harness) = $osstestverq->fetchrow_array()) {
+	    $osstestrevs{$harness}++;
+	}
 	my $osstestrevs = join ' ',
 	     map {
-		$_ = $_->{harness};
 		s/^([0-9a-f]{12})[0-9a-f]+\b/$1/;
 		"<kbd>".encode_entities($_)."</kbd>";
 	     }
-	     @{ $osstestverq->fetchall_arrayref({}) };
+	     sort keys %osstestrevs;
 	my $osstest_colour = report_altchangecolour(\$alt_osstest, $osstestrevs);
 	print H "<td $osstest_colour>$osstestrevs</td>\n";
 	foreach my $i (0..$#rev_grid_cols) {
-- 
2.11.0


