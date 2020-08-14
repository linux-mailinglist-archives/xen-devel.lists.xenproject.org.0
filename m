Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 149AF244DA5
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:27:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTn-0004p7-56; Fri, 14 Aug 2020 17:26:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dRm-00024Q-Jf
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:24:54 +0000
X-Inumbo-ID: 8ece59ae-6f11-4c58-bde3-308e5aa54450
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ece59ae-6f11-4c58-bde3-308e5aa54450;
 Fri, 14 Aug 2020 17:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=2hKHQMm9lLk+HPPyAXgeOLKFpKDe8arF7r1l0PzRvic=;
 b=FkWFF/r6MMbEmBQr07kuhErzeIx/aSLCMNO5M5kTZemDT3atGO10ZX+0
 gern9u4hwLD62T53XRGjovHLA4zhi54VmQTtWWVZ7G68OsHQ0S6F3X/Ty
 nNsu/yivIsDQqNoV8HdpfV3TBjFT9A6CzP4F4CeTX+Cjf3Drizl8h+eXr c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Si1LiZ6+uGvgQeCovR0vFboL6vY7HEzbv+EJ2TxQnGItq26WNjNXEWlI+sutz2urnTRhOq2ZAN
 sgdVA+LQsKSiTHTpCrxC1WxXZCOmB+g18H7dRLhExvkU6wD2Of+W9E2ArUxDs0SNpDdUMUmbWg
 4LkqsVBL81V+2+eBQneabxM59ogtcqrB5AcPPIne02CCuRPWVdzOTOQ5fW40AJFIvrG3ytIPH/
 CrYpmIvxUn4+sEsL4804TJao+DDKGjLmvsnTDylckLwYCtJ2oSCpsQ9R2ec06YzULZ/GtetWok
 sLc=
X-SBRS: 2.7
X-MesageID: 24576925
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24576925"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 57/60] sg-report-job-history: Cache report_run_getinfo
Date: Fri, 14 Aug 2020 18:22:02 +0100
Message-ID: <20200814172205.9624-58-ian.jackson@eu.citrix.com>
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
 sg-report-job-history | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sg-report-job-history b/sg-report-job-history
index 2cac123b..5d2a7e15 100755
--- a/sg-report-job-history
+++ b/sg-report-job-history
@@ -159,7 +159,7 @@ END
 
     while (my $f= $flightsq->fetchrow_hashref()) {
 	cache_row_lookup_prep(\$f);
-        my $ri= report_run_getinfo($f);
+        my $ri= cacheable_fn($f, 'rri', sub { report_run_getinfo($f) });
 
 	$ri->{Hosts} = cacheable_fn($f, 'h', sub {
             my %hosts;
-- 
2.11.0


