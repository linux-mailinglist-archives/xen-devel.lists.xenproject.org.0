Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 553F9244D9E
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:26:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTe-0004Sk-CZ; Fri, 14 Aug 2020 17:26:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dQU-00024Q-Go
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:23:34 +0000
X-Inumbo-ID: 90a2a242-43f8-4d80-b009-045a4ce57d5b
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 90a2a242-43f8-4d80-b009-045a4ce57d5b;
 Fri, 14 Aug 2020 17:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425743;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=6jsNPgkrbQxgzqdAWU+v8WyFAwyN1dTTfEckfC/Xnrw=;
 b=hroHY/PuRAP1+qpuwFyUQWI9caDlh22mnwtD1RKlIe/xPGO2IruOlnTs
 CpqlrMCbIVGoDaw4tSrHwyUhg6grcm6RN2gU407uJUq0cxCi9BaRCdTYz
 eYWOvji7O8+OAdbu6ctwqv+JIY7gv1qgDz8TTMDCcUtTPtQIc4Z++7QeB U=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: IichEY6ZbjBfBltydfbxGNc45YhISME2fOnywk2FxnlR5Yi55yUdPVBUQdCZ+R3/xfjTVUvoVr
 D2eDWOwNYmeTiSRdecYPIFFAV87WYBsltBYIicUTlEYEdVXtcMYRQ1NEu60qM8Dlc3Cizss2+7
 smCeAhgKQJmvF8R6x6aNgjG0xvJs70rwhVUsVnmZDrLAyf7x3zKVo1GBc3UCWndiCtYzt3KnBM
 8LblB9vH6EohahVqiPCBGEBP/S0XcllJiU83/fU4Zi+BseQ/EgJZqeVjCXbyKMzcdj8gWzcgj3
 IyU=
X-SBRS: 2.7
X-MesageID: 25487837
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="25487837"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 54/60] sg-report-job-history: Cache osstestrevs
Date: Fri, 14 Aug 2020 18:21:59 +0100
Message-ID: <20200814172205.9624-55-ian.jackson@eu.citrix.com>
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

No logical change.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-job-history | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/sg-report-job-history b/sg-report-job-history
index d5e37bcd..48dc2f57 100755
--- a/sg-report-job-history
+++ b/sg-report-job-history
@@ -260,17 +260,20 @@ END
 	my $hosts = join ", ", map { $r->{Hosts}{$_} // "-" } @hostvarcols;
 	my $hosts_colour = report_altchangecolour(\$alt_hosts, $hosts);
 	print H "<td $hosts_colour>".encode_entities($hosts)."</td>\n";
-	my %osstestrevs;
-	$osstestverq->execute($r->{Flight}{flight});
-	while (my ($harness) = $osstestverq->fetchrow_array()) {
-	    $osstestrevs{$harness}++;
-	}
+	my $osstestrevmap = cacheable_fn($r->{Flight}, 'o', sub {
+            my %osstestrevs;
+	    $osstestverq->execute($r->{Flight}{flight});
+	    while (my ($harness) = $osstestverq->fetchrow_array()) {
+		$osstestrevs{$harness}++;
+	    }
+	    \%osstestrevs;
+	});
 	my $osstestrevs = join ' ',
 	     map {
 		s/^([0-9a-f]{12})[0-9a-f]+\b/$1/;
 		"<kbd>".encode_entities($_)."</kbd>";
 	     }
-	     sort keys %osstestrevs;
+	     sort keys %$osstestrevmap;
 	my $osstest_colour = report_altchangecolour(\$alt_osstest, $osstestrevs);
 	print H "<td $osstest_colour>$osstestrevs</td>\n";
 	foreach my $i (0..$#rev_grid_cols) {
-- 
2.11.0


