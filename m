Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC57244D9F
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:26:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTf-0004VR-OS; Fri, 14 Aug 2020 17:26:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dQA-00024Q-GT
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:23:14 +0000
X-Inumbo-ID: e7f34f1b-859e-4d7e-8e46-9bfbb0823a41
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7f34f1b-859e-4d7e-8e46-9bfbb0823a41;
 Fri, 14 Aug 2020 17:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425741;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=SS9u5RjMdUWJ2MRfTSjZvF1Vqzd0OuPHfvTpp/2jiqY=;
 b=L4KHtTcGqhb9jvh49Aqvmet1RysFlLr1pwlZLO5HT7rmuQVTsiFCxjnT
 GaUlcBww0NLs22FpFYE8N40kLpbYYiZyvanUnlEc66jgc0N+bVM/KeTNs
 KzrttvG2QI6NjuzzUsN7nT+2w+SBOUzl2wlSHHVorS42MhOQhlFu/S1Rr 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: xb4J0d22X3Zh3ZJ3X8aJtKQ9o14b9OJE/B1nJdYOFR4A/tgIUjPRFj3MZTx8GDMinayn7e3Fti
 ewWMlXXmlhmAz5xTJ3u1WpMjPK5wHua7z1en6QY+e4AKZvAfOjmg03AWQ0gfEAdZJXdgQvOlMM
 /Ymy11hXV6UJJKVulCy/RUXWtt0FzfG/mefN1acde3uL8igJo9HwwNTwQLc4jUmhrti89sgITg
 ckQI1MihPzBrYxP6kvPpnPD6yIHOzjfZMzKyBQtDsRNaV4bvAYEm3a32WUZ92LBB/85Y02zXan
 vnI=
X-SBRS: 2.7
X-MesageID: 24900378
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24900378"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 42/60] sg-report-job-history (nfc): Add new
 hostvarcols calculation
Date: Fri, 14 Aug 2020 18:21:47 +0100
Message-ID: <20200814172205.9624-43-ian.jackson@eu.citrix.com>
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

We are going to want to replace the existing @hostvarcols
calculation.  Provide a new one based on $ri->{Hosts}.

Right now, die if they don't produce the same answers.  This still
works, which shows that the calculation is right.

Tested-by: Ian Jackson <ian.jackson@eu.citrix.com>
Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-job-history | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sg-report-job-history b/sg-report-job-history
index 118926c6..fb2930a9 100755
--- a/sg-report-job-history
+++ b/sg-report-job-history
@@ -206,6 +206,13 @@ END
         push @test_rows, $ri;
     }
 
+    my %hostvarnames;
+    foreach my $ri (@test_rows) {
+	$hostvarnames{$_}=1 foreach keys %{ $ri->{Hosts} }
+    }
+    my @hostvarcols2 = sort keys %hostvarnames;
+    die unless "@hostvarcols" eq "@hostvarcols2";
+
     my $osstestverq= db_prepare(<<END);
         SELECT DISTINCT harness
           FROM flights_harness_touched
-- 
2.11.0


