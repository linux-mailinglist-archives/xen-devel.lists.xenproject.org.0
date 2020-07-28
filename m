Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA3E23057A
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 10:34:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0L3w-0006Hg-VS; Tue, 28 Jul 2020 08:34:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uMAr=BH=amazon.com=prvs=4712fd9bf=elnikety@srs-us1.protection.inumbo.net>)
 id 1k0L3v-0006HU-9g
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 08:34:15 +0000
X-Inumbo-ID: 1e8022ca-d0ad-11ea-a87c-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e8022ca-d0ad-11ea-a87c-12813bfff9fa;
 Tue, 28 Jul 2020 08:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1595925255; x=1627461255;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=QXuCPaBFwD3FLj/A53XcKjEkryN9839jPfi9Dd1Dorg=;
 b=UkyvHY+/7y2zpkdz9P4UlnlgNkdASBcStysxA4W94GCPFIGiIYleVE2G
 5n3O0bUtlm4yQFSqAoEWoaVm9d1jBtIXzXEmtIIM3uURQlrLMXRnGshHB
 wl9G2XSHmeqdHVHmveWEOr+RbQBMQDaeolrh/fbe/b+ehzciW3kyenEYl 4=;
IronPort-SDR: 6DXbhNr046JubuV4KDNdBBx9GeCIZWksuRWojQ0/uWt1YYY3eVg54fY5aVdWaznDzJdghaWPUj
 M8/aQ3cW5CIQ==
X-IronPort-AV: E=Sophos;i="5.75,405,1589241600"; d="scan'208";a="44424179"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2c-c6afef2e.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 28 Jul 2020 08:34:14 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-c6afef2e.us-west-2.amazon.com (Postfix) with ESMTPS
 id DC4BDA2683; Tue, 28 Jul 2020 08:34:12 +0000 (UTC)
Received: from EX13D32EUB001.ant.amazon.com (10.43.166.125) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 28 Jul 2020 08:34:12 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D32EUB001.ant.amazon.com (10.43.166.125) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 28 Jul 2020 08:34:10 +0000
Received: from dev-dsk-elnikety-1b-cd63f796.eu-west-1.amazon.com (10.15.63.96)
 by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 28 Jul 2020 08:34:10 +0000
Received: by dev-dsk-elnikety-1b-cd63f796.eu-west-1.amazon.com (Postfix,
 from userid 6438462)
 id 510FFA0139; Tue, 28 Jul 2020 08:34:10 +0000 (UTC)
From: Eslam Elnikety <elnikety@amazon.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/vhpet: Fix type size in timer_int_route_valid
Date: Tue, 28 Jul 2020 08:33:57 +0000
Message-ID: <20200728083357.77999-1-elnikety@amazon.com>
X-Mailer: git-send-email 2.16.6
MIME-Version: 1.0
Content-Type: text/plain
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Eslam Elnikety <elnikety@amazon.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The macro timer_int_route_cap evalutes to a 64 bit value. Extend the
size of left side of timer_int_route_valid to match.

This bug was discovered and resolved using Coverity Static Analysis
Security Testing (SAST) by Synopsys, Inc.

Signed-off-by: Eslam Elnikety <elnikety@amazon.com>
---
 xen/arch/x86/hvm/hpet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
index ca94e8b453..9afe6e6760 100644
--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -66,7 +66,7 @@
     MASK_EXTR(timer_config(h, n), HPET_TN_INT_ROUTE_CAP)
 
 #define timer_int_route_valid(h, n) \
-    ((1u << timer_int_route(h, n)) & timer_int_route_cap(h, n))
+    ((1ULL << timer_int_route(h, n)) & timer_int_route_cap(h, n))
 
 static inline uint64_t hpet_read_maincounter(HPETState *h, uint64_t guest_time)
 {
-- 
2.16.6


