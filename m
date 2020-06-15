Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 494471F99D9
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 16:16:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkpuT-0008BB-RQ; Mon, 15 Jun 2020 14:16:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OSTQ=74=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jkpuS-0007qe-6W
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 14:16:24 +0000
X-Inumbo-ID: bbfd69de-af12-11ea-bca7-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bbfd69de-af12-11ea-bca7-bc764e2007e4;
 Mon, 15 Jun 2020 14:15:58 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: EtXH1WdzMpHjyZOQeIdyhi9iU7Fe/sa9euWbx33WnPg4hcWHVky1sgjOroslZVaqfQ/xNZMRDY
 wCDok0bvE3/4bQb9XvjO9RBr4rr44GuBU7kGy7fMeo93lz35pxarJ8TSK/JSaoi1eXw3Y/RGOB
 SO9QEuzvHnwrp4CVJhJsXZHjdD7CgbrCkVTwDeQeXj7eJmLHVXjsebC318CTWrDJLH4RLRj1vm
 3/rljIVBSMTr7IdZ8Hw3iuegwReeXb3LZN6uXv/v7ZOScXbxnjkRC2W0OTQPvR8debHpR2Po7o
 BKU=
X-SBRS: 2.7
X-MesageID: 20839542
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20839542"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 8/9] x86/cpuid: Introduce missing feature adjustment in
 calculate_pv_def_policy()
Date: Mon, 15 Jun 2020 15:15:31 +0100
Message-ID: <20200615141532.1927-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200615141532.1927-1-andrew.cooper3@citrix.com>
References: <20200615141532.1927-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This was an accidental asymmetry with the HVM side.

No change in behaviour at this point.

Fixes: 83b387382 ("x86/cpuid: Introduce and use default CPUID policies")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Paul Durrant <paul@xen.org>
---
 xen/arch/x86/cpuid.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index ee11087626..f2fc0aa895 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -402,6 +402,8 @@ static void __init calculate_pv_def_policy(void)
     for ( i = 0; i < ARRAY_SIZE(pv_featureset); ++i )
         pv_featureset[i] &= pv_def_featuremask[i];
 
+    guest_common_feature_adjustments(pv_featureset);
+
     sanitise_featureset(pv_featureset);
     cpuid_featureset_to_policy(pv_featureset, p);
     recalculate_xstate(p);
-- 
2.11.0


