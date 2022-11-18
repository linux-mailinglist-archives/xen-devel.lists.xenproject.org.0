Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E25D462F2EC
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 11:46:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445563.700799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovysV-0006rP-D3; Fri, 18 Nov 2022 10:45:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445563.700799; Fri, 18 Nov 2022 10:45:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovysV-0006oV-7i; Fri, 18 Nov 2022 10:45:47 +0000
Received: by outflank-mailman (input) for mailman id 445563;
 Fri, 18 Nov 2022 10:45:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nf+F=3S=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ovysT-0006R2-04
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 10:45:45 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20622.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21399c53-672e-11ed-8fd2-01056ac49cbb;
 Fri, 18 Nov 2022 11:45:34 +0100 (CET)
Received: from AM6PR10CA0069.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::46)
 by VI1PR08MB9984.eurprd08.prod.outlook.com (2603:10a6:800:1c7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.6; Fri, 18 Nov
 2022 10:45:38 +0000
Received: from AM7EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::5a) by AM6PR10CA0069.outlook.office365.com
 (2603:10a6:209:80::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20 via Frontend
 Transport; Fri, 18 Nov 2022 10:45:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT024.mail.protection.outlook.com (100.127.140.238) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 10:45:37 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Fri, 18 Nov 2022 10:45:37 +0000
Received: from 12f38b6ab8ce.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 142453EE-88AA-4242-A3D0-BE195FC8BD56.1; 
 Fri, 18 Nov 2022 10:45:30 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 12f38b6ab8ce.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Nov 2022 10:45:30 +0000
Received: from AM6P194CA0044.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::21)
 by AM9PR08MB6020.eurprd08.prod.outlook.com (2603:10a6:20b:2d6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.8; Fri, 18 Nov
 2022 10:45:28 +0000
Received: from AM7EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::83) by AM6P194CA0044.outlook.office365.com
 (2603:10a6:209:84::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20 via Frontend
 Transport; Fri, 18 Nov 2022 10:45:28 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT051.mail.protection.outlook.com (100.127.140.64) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 10:45:28 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 18 Nov
 2022 10:45:27 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Fri, 18 Nov 2022 10:45:24 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 21399c53-672e-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wQ8/FZBsYtn+E4uyHcWiQeWkJ4kxRPSI3oqXiHsNW8=;
 b=h3GAD3I/ZzAFvDzcrb68L2+B6vKGtmEo9Y7ywnqmLHXIv42qhNKsJBPc3pWqNKNjn4bHJFJ44AHuTUQy+2Sxfb/sQq6LCEM7UjkAtYfdER0iAX4tNqlbWg1Ljuir2XY+1ygnGBscXPplAtvhDtsU/L5bKQ4zGfT6NWeCRLCgvC0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ce6e84f24473665c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m7hJM/s2p8/2b4e6bGUl1QVvwH4A1qQac8ew2EOfQMrCaEtWXeMsmnIpoimPhPun5GvSeczT+m1NE9C2q/rJ/i+mobhm1Ye7YsHxkmqwkEJ3JJfvR5lHJfnqXQytYNlzzXiVSaepPCYwdUMfCCc4WD37V0qmrVfn3ope19LkYKzbtqOSpm3ownYDnHLb3jc3yeArCgSQr0xRZchiTzq0Bph54rmUAwqKxyB3plFyrwi61IrQXNiECNQCnXZ//qW69FyS2QG7SQpfLZ2E3HabAgNCQZuXMnI5pqtu06FcHG4GJpSRoAaVQGKJhuMVylALKz1ldVsd4LNbBQMi6+x4zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wQ8/FZBsYtn+E4uyHcWiQeWkJ4kxRPSI3oqXiHsNW8=;
 b=FbiXuRPBscn1NIaAeyT6z0J/8lCJ0W5UutTGTUln2tzOK7qcXJ1yP8RjG03bf8M4sc5q49/0cX+dTZgU3nJ50nt3LJTZpPHInVHPSYLTU/FlHaF/txVdUsVvy1xPzFPGKgTBCcNTA6sgv7Q7boCQf1S7tL0lAe7W0QpmyXuMdmLUEYaMftACkZ06QJLg97ph/QW1VlhhXr1xM7v47TASWtG6iZQ32RweL7WoQTdU4oeIyHjiEjtF92Psf6DB6D9ujlWf/FcUGZAgpbLBapKo+Ww/639a/ChT5iJSCFf7l+yuzNg15tTdrcoxxkfUtmtSTFXCWmcLr2RQXFI2bD//EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wQ8/FZBsYtn+E4uyHcWiQeWkJ4kxRPSI3oqXiHsNW8=;
 b=h3GAD3I/ZzAFvDzcrb68L2+B6vKGtmEo9Y7ywnqmLHXIv42qhNKsJBPc3pWqNKNjn4bHJFJ44AHuTUQy+2Sxfb/sQq6LCEM7UjkAtYfdER0iAX4tNqlbWg1Ljuir2XY+1ygnGBscXPplAtvhDtsU/L5bKQ4zGfT6NWeCRLCgvC0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v9 4/6] xen/x86: use arch_get_ram_range to get information from E820 map
Date: Fri, 18 Nov 2022 18:45:06 +0800
Message-ID: <20221118104508.768274-5-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221118104508.768274-1-wei.chen@arm.com>
References: <20221118104508.768274-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT051:EE_|AM9PR08MB6020:EE_|AM7EUR03FT024:EE_|VI1PR08MB9984:EE_
X-MS-Office365-Filtering-Correlation-Id: 52de9e07-dcee-4dde-30dc-08dac95207b9
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Q5feJxiPUYUxysp6wFC8qVKhHHK/s6qWlkQda+v7udtPMnaYnFOcqYCSWbKdY3ES8+UUMJd035MGv7GfqpmsFPtmMNbK3hYDNF6W5ACn/rWP+76miTwjyGcd4YXvBtYAqbXvev6GKMDiw4FYpv6+Gnl3IBzDLdNqIVGdOws7bxVXZTULMK05nDPx/CGVcRIFfaYOO1KlsFd+Lig3LYZCFQhgxUqfjuXhuZGP4u3VfTUMhjLqGKGElaijC3yUroaaB87y9UvsCTkyegEN4urBCm6BWKcNbiQDZVV4ElH8u6bHSnrtLH4FKRUyHKusvp1iAPybOxa0KJ9KeY6Du9BpJanZ1cSySmbM1H8gHwjw2wysb2DXCC/fsL9eYiDi7Ph4JLB23MAh//BoJW1Zz3iTioav+Vha3dm7/Q7QIwsM8qXkZQFeV8rdnEs2M/d62y5x9Mru88HYPYz0UZtfJp4bkU1Dt4sa6PnySgDArkrOp5IJyGjYFJVEshs+n4wwNXiYknT6SMscQfYZQZuU4+wEef5hCpJLLMjErSNi/jUTzjhIoQQk8UdmGGa2ZSYpu9ViJrVRCRIexOGYmM7/PuwYv255AVy8itgD1pqZNkUlUbp2jvSLm9LaYaTyWcWLld2C5vN/AJ/zpX/fyFVeXd5Vpj3LfrbEFnyUDSkOjZ5DSFpnj1cnXkdNYAlU+UJSQ6I/4ZIGCJU24Mpm0IAKQeYdNOeqWOLDNwBmLsNQTioiCuM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(136003)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(83380400001)(86362001)(40460700003)(7696005)(6666004)(26005)(478600001)(356005)(81166007)(36756003)(40480700001)(70586007)(82310400005)(36860700001)(336012)(186003)(2616005)(1076003)(426003)(47076005)(8936002)(70206006)(44832011)(41300700001)(82740400003)(8676002)(316002)(5660300002)(4326008)(54906003)(6916009)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6020
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4ce3f9f0-9fa5-4ed6-28f9-08dac952021e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1yizkIegv7EIu1eebYVFE3nX8Fm/nJF8nWrEyBhdqUlKvjCYzGH3J23mhHiyU3LrSZFkR+r4wYqVC8xbkTWslrXEWQhc3UTexuSZsGaxtcdGd4UeTxj0kTH6NRkRWaIX7wuoaMy+96hjQNtKaeBXekELBhEZm8aosZN5STJ5ADEHYVSDlkux5Wso8r8lCqxRvyJnpID81Y7Eetdup0IVq1l8GuBxDvoVWQu6CLMS/GimszR9u/lL/zjlht42K8MU4cOHo1sDHB9/eOawdFEfHZuHpIGOqmJu6ZkhWIBA5mLWOUDCyrLnHfxDrmFl3RNz/z78Bel62stQTBNIYU+h4jd4m+lDEGAg0c39yzpYOF0OjBowp8a5dRbqgamUPdoSjnQhi8xHx5gauF1APIRKvx2pm13aSbbmx98SrX9yYQI/uEkHZc2rw4Csgw5MVp2ql4J5LhrBLaDFYDIagPvwu/PJtvbhA9Vatnpy4eVgoeGIT9thNs3saOk0Uh3DwEq6L7zx3QxtmQjZkf1X0s8ivLrxIDwBkPE5YydoUd+Cspgtxpn0gutID6AoucxHTeKeuVRWZvik5UTDdGIwxQT3lRyXwy+sbgUlOBvOtjrc6my7yNI2j4Ot94W7z4bxMIGMRiVLpY1HWDDiSKDEw88qua/p/PkcGp6ncDPhdgTLxLIxnl9tEyw3Hwv8+rFaIx2eor6HtA4l1phy8Yz9abYOUg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(39850400004)(136003)(376002)(396003)(451199015)(40470700004)(46966006)(36840700001)(36756003)(8936002)(36860700001)(7696005)(40480700001)(86362001)(81166007)(82740400003)(40460700003)(8676002)(6666004)(47076005)(2906002)(426003)(5660300002)(41300700001)(83380400001)(2616005)(82310400005)(107886003)(44832011)(478600001)(1076003)(26005)(186003)(4326008)(336012)(70206006)(70586007)(54906003)(6916009)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 10:45:37.9799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52de9e07-dcee-4dde-30dc-08dac95207b9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB9984

The sanity check of nodes_cover_memory is also a requirement of
other architectures that support NUMA. But now, the code of
nodes_cover_memory is tied to the x86 E820. In this case, we
introduce arch_get_ram_range to decouple architecture specific
memory map from this function. This means, other architectures
like Arm can also use it to check its node and memory coverage
from bootmem info.

Depends arch_get_ram_range, we make nodes_cover_memory become
architecture independent. We also use neutral words to replace
SRAT and E820 in the print message of this function. This will
to make the massage seems more common.

As arch_get_ram_range use unsigned int for index, we also adjust
the index in nodes_cover_memory from int to unsigned int.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v8 -> v9:
1. No change.
v7 -> v8:
1. No change.
v6 -> v7:
1. No change.
v5 -> v6:
1. No change.
v4 -> v5:
1. Add Rb.
2. Adjust the code comments.
v3 -> v4:
1. Move function comment to header file.
2. Use bool for found, and add a new "err" for the return
   value of arch_get_ram_range.
3. Use -ENODATA instead of -EINVAL for non-RAM type ranges.
v2 -> v3:
1. Rename arch_get_memory_map to arch_get_ram_range.
2. Use -ENOENT instead of -ENODEV to indicate end of memory map.
3. Add description to code comment that arch_get_ram_range returns
   RAM range in [start, end) format.
v1 -> v2:
1. Use arch_get_memory_map to replace arch_get_memory_bank_range
   and arch_get_memory_bank_number.
2. Remove the !start || !end check, because caller guarantee
   these two pointers will not be NULL.
---
 xen/arch/x86/numa.c    | 15 +++++++++++++++
 xen/arch/x86/srat.c    | 30 ++++++++++++++++++------------
 xen/include/xen/numa.h | 13 +++++++++++++
 3 files changed, 46 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 90b2a22591..fa8caaa084 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -9,6 +9,7 @@
 #include <xen/nodemask.h>
 #include <xen/numa.h>
 #include <asm/acpi.h>
+#include <asm/e820.h>
 
 #ifndef Dprintk
 #define Dprintk(x...)
@@ -93,3 +94,17 @@ unsigned int __init arch_get_dma_bitsize(void)
                  flsl(node_start_pfn(node) + node_spanned_pages(node) / 4 - 1)
                  + PAGE_SHIFT, 32);
 }
+
+int __init arch_get_ram_range(unsigned int idx, paddr_t *start, paddr_t *end)
+{
+    if ( idx >= e820.nr_map )
+        return -ENOENT;
+
+    if ( e820.map[idx].type != E820_RAM )
+        return -ENODATA;
+
+    *start = e820.map[idx].addr;
+    *end = *start + e820.map[idx].size;
+
+    return 0;
+}
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index ce507dac9e..1a108a34c6 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -452,37 +452,43 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
    Make sure the PXMs cover all memory. */
 static int __init nodes_cover_memory(void)
 {
-	int i;
+	unsigned int i;
 
-	for (i = 0; i < e820.nr_map; i++) {
-		int j, found;
+	for (i = 0; ; i++) {
+		int err;
+		unsigned int j;
+		bool found;
 		paddr_t start, end;
 
-		if (e820.map[i].type != E820_RAM) {
-			continue;
-		}
+		/* Try to loop memory map from index 0 to end to get RAM ranges. */
+		err = arch_get_ram_range(i, &start, &end);
 
-		start = e820.map[i].addr;
-		end = e820.map[i].addr + e820.map[i].size;
+		/* Reached the end of the memory map? */
+		if (err == -ENOENT)
+			break;
+
+		/* Skip non-RAM entries. */
+		if (err)
+			continue;
 
 		do {
-			found = 0;
+			found = false;
 			for_each_node_mask(j, memory_nodes_parsed)
 				if (start < nodes[j].end
 				    && end > nodes[j].start) {
 					if (start >= nodes[j].start) {
 						start = nodes[j].end;
-						found = 1;
+						found = true;
 					}
 					if (end <= nodes[j].end) {
 						end = nodes[j].start;
-						found = 1;
+						found = true;
 					}
 				}
 		} while (found && start < end);
 
 		if (start < end) {
-			printk(KERN_ERR "SRAT: No PXM for e820 range: "
+			printk(KERN_ERR "NUMA: No NODE for RAM range: "
 				"[%"PRIpaddr", %"PRIpaddr"]\n", start, end - 1);
 			return 0;
 		}
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 04556f3a6f..9da0e7d555 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -80,6 +80,19 @@ static inline nodeid_t __attribute_pure__ phys_to_nid(paddr_t addr)
 #define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
                                  NODE_DATA(nid)->node_spanned_pages)
 
+/*
+ * This function provides the ability for caller to get one RAM entry
+ * from architectural memory map by index.
+ *
+ * This function will return zero if it can return a proper RAM entry.
+ * Otherwise it will return -ENOENT for out of scope index, or other
+ * error codes, e.g. return -ENODATA for non-RAM type memory entry.
+ *
+ * Note: the range is exclusive at the end, e.g. [*start, *end).
+ */
+extern int arch_get_ram_range(unsigned int idx,
+                              paddr_t *start, paddr_t *end);
+
 #endif
 
 #endif /* _XEN_NUMA_H */
-- 
2.25.1


