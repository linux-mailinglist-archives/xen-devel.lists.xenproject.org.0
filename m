Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5657B3E8E91
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:25:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165644.302746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlQV-0005ER-Gq; Wed, 11 Aug 2021 10:25:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165644.302746; Wed, 11 Aug 2021 10:25:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlQV-0005AD-8U; Wed, 11 Aug 2021 10:25:35 +0000
Received: by outflank-mailman (input) for mailman id 165644;
 Wed, 11 Aug 2021 10:25:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlQT-0000BQ-CR
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:25:33 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1e::62e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 058c3040-97d5-4e0f-9c77-41e2e1bb8c05;
 Wed, 11 Aug 2021 10:25:16 +0000 (UTC)
Received: from AS8PR04CA0045.eurprd04.prod.outlook.com (2603:10a6:20b:312::20)
 by VI1PR08MB2685.eurprd08.prod.outlook.com (2603:10a6:802:1d::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Wed, 11 Aug
 2021 10:25:12 +0000
Received: from VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::40) by AS8PR04CA0045.outlook.office365.com
 (2603:10a6:20b:312::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT006.mail.protection.outlook.com (10.152.18.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:25:12 +0000
Received: ("Tessian outbound ab45ca2b67bc:v101");
 Wed, 11 Aug 2021 10:25:12 +0000
Received: from 031a7dee3bae.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0A59B839-8235-43B7-B458-7FAB70575D20.1; 
 Wed, 11 Aug 2021 10:25:05 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 031a7dee3bae.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:25:05 +0000
Received: from DB9PR01CA0023.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::28) by HE1PR0802MB2202.eurprd08.prod.outlook.com
 (2603:10a6:3:c2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Wed, 11 Aug
 2021 10:25:03 +0000
Received: from DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d8:cafe::c8) by DB9PR01CA0023.outlook.office365.com
 (2603:10a6:10:1d8::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:03 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT045.mail.protection.outlook.com (10.152.21.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:25:03 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:24:59 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 11
 Aug 2021 10:24:59 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:24:56 +0000
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
X-Inumbo-ID: 058c3040-97d5-4e0f-9c77-41e2e1bb8c05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JhtM44GZuI/12WEDyvg/X/JAT+76nirV+G6Sqv4vRg0=;
 b=3dI+0aXefwLx6vS2aoMegWSThioPZeOxADmdX4FWMgS3f5H5EbEbnbHC3jBwJrM8OzcFoOO06wmM7PlUenQJyVpL26Jx498LPmXzmu0y7j7IKyRcwzyRuT6X2psihdzAcd3FF5118cCUwBHOMj4MUW7PVQDmtsu4AA1QUFOMyU0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ae4dbbd4b10260f4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AwEOme3D76IyzSEK5VHA/thX5mZgudvBc0qhoaPDvw00ytUGSkR4Sf6tY5LmI4hNk08n4ro12lwy2zbbia34wSP6Q5bowXBIH6s2S6mxNykKgnjupw0LxLtfqGEXGFiHYp2pS3vXouwlSlwYWj2h5v0Adkh2ewPDQ9IzO4nuHRapmVzHmP+A2LtsE496vOcUZ9+4sLiBlC85m8WL3Ox6R7bPkRQqfKMNFt17AGWJKWBddyVTV3Lm4YSaqYBNy1idPumffNix0axRQckTmGglm2I8w6ZTn3Sok2SJDyY2fCjBPQyPGwjQ3iMfYeDkaNTDRnNywobmEqlR+B5K54m0FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JhtM44GZuI/12WEDyvg/X/JAT+76nirV+G6Sqv4vRg0=;
 b=UNPR2tFhClJlI42ra10zk/x3VTXSq6O20RQlf6I4fSGcibTynEFreiXZJmuqGagBd7mHx3hLEyB2WVcyz5k7VtCNDQpgX42DUxZvTsdwymUArMStg73Rs7wv6fMyrPvM/J/eziiiFWogFey3r5p9HeKtCH7jiTgyGrrUxmnbex46VrZxP+2y82zdJ+WRWUGPf5+AK0d4oQawzbtuIZxXZVW6y+oSGPPxh813xYCw2UGZLvi3ga7nxxoMXQfTTUuo5DstyeZEw9LrXe+3EtlW6BVJnMtpcsYTWkToyREPjR6KrlVtEzkYJJguGolxTkSN0gJP3hPb92MrjnQNIYgFVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JhtM44GZuI/12WEDyvg/X/JAT+76nirV+G6Sqv4vRg0=;
 b=3dI+0aXefwLx6vS2aoMegWSThioPZeOxADmdX4FWMgS3f5H5EbEbnbHC3jBwJrM8OzcFoOO06wmM7PlUenQJyVpL26Jx498LPmXzmu0y7j7IKyRcwzyRuT6X2psihdzAcd3FF5118cCUwBHOMj4MUW7PVQDmtsu4AA1QUFOMyU0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>, <jbeulich@suse.com>
CC: <Bertrand.Marquis@arm.com>
Subject: [XEN RFC PATCH 11/40] xen/x86: Move NUMA nodes and memory block ranges to common
Date: Wed, 11 Aug 2021 18:23:54 +0800
Message-ID: <20210811102423.28908-12-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 332dcda5-4f26-42dc-5d83-08d95cb24dad
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2202:|VI1PR08MB2685:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB268506D0561DCE0B81D47D829EF89@VI1PR08MB2685.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:327;OLM:327;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 y1rXWeO/Q2/iehKh+mwWoUiLgm93hg3uuS/qNVJDYq+CY+DL0AUw1M7zC/wCuKWOdLUjLXPotv1KiPhLQCs2FULAfa3gnSXbr/OxwwzaEYMH6Ik/JbqPcye3jRidU53i8sR8euQ9+ksA+TpN0XO8eoCzFlOwjEnpRDHBe8vAHwswvCKoOXFzIEhzV50rIYOABB4LrlfzKPoOf0D1MEyuos4MjDXhGx/NSyCRRfwrMFks1Vq6HrNcRjMOxtSj1o7ct25gmmdF+oNG3m6R593ZFgCwKp1lXdq58xnRTIjpKYQXRQZpiwJO0myY3ExCnwICgGqXrshUS199VZhfCWhBFmxg0X7H6YDit+bQXDA2g60As/9rAxPtHRnaFuNWZ7ptQ2cmo7nM7NpAq1q30z566YmREd1U9PBYY2DVBSTRcdUTm1L79RO3h9fAUXojJooNeEIx2KH73JdtKMkM7fqq+/PBHXjev+mmT5kmVbjNSNoj9lJ+tHQqXko7npPNyJInHi2bBGFJwpJJrszud0PFSLjVC6700oM+0Osfwaz+q4Bh71J/tc5q6FWwatB5rzAnGws7M8G6dAbdqIDvtwH+lMJpzs1w8al9BrMMlU0CKL+LyBZsm4SysOPj8smNGkezkk78pEt+cG519IzQ+/4KbKH42Uxm/VzD5e2kDFihyfMkRrFSMGAg7x5LvmYPqhcLqjnrEW8ALTinZE4hYygvXs/ppFbS1vKEfsR/vkQ+hliHakn/HvG5OnVLdhaYAfRRh/KqNLWTx3JXMOLbnj7TYHhnMC8AR7ZZZl+SsuLkTi0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(8936002)(83380400001)(508600001)(8676002)(356005)(426003)(186003)(81166007)(82310400003)(5660300002)(7696005)(86362001)(336012)(2906002)(26005)(2616005)(70206006)(44832011)(36860700001)(316002)(110136005)(1076003)(36756003)(70586007)(34070700002)(47076005)(4326008)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2202
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	af221aef-f66e-4d9b-91dd-08d95cb24820
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fLUfA5fTN1/lmWS6jSqKehlcjiZIDqKBwYC8HVhgTdDfYLPZWHYdIP8emm7soqz0szmGYKruOJLJ/D7z+lnrmOHBlT9Ep6W3bdZq/jf/bUU1xyYATdkI26yTquRXVcD+Eu/cR5uM1DQNqu5SUs0XUkdWL//pqgeLnZlB0U1H0H9iunXzUH9j5VXXtgjVcEQOLSa31JAsFoJO0L4k8gObzHX9R68R7GpnE7YsJgICqCdGq60S9QvXL2KebolEo2GbnxWepwUiaolAKadmQ11VwjTMAY8vRO5+DPKVvZdZBe8vQOuka7w1QvAJKrT7/xtkmL/oHQhb5sXZ+zBGJ9V8xBysyGv80s2qHvm0lVXPEGjd8sLqOiV4M+k51uKpjSTePEZyg57mSpfFG+WmIkJzIlsEaenx34BmEouAgxLBV8N/0bYoW1p06QRIGayNodeA+qGpbkZHTc/dJjUYz29WGEmN6V/sSuNgaFqXjAwozqQNAC5zuoCKi7mbjcf8biD123vmjoJRbS2JFhCNcB17l4izv/t+D32enJndKzop5B0nqzygBj+m1D4Bnt5sJUY2sfGnVarjvg0DRmu49KFBIsrbnXq4t0Nmxote4uz7sCol/JIXgqirMQt5lwM7HBB9eVF1r6HORGZ1Sjst1zdZd94x0JnSvhRzPCJ1clwqzv8+fMoxcbJPCNGuiTY52os+ZnritHzvh4/xbXkAEC6jOx6O7dHpnj2pzbnKSQavpZ8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(39850400004)(346002)(46966006)(36840700001)(83380400001)(4326008)(82310400003)(47076005)(2906002)(36860700001)(1076003)(82740400003)(81166007)(36756003)(478600001)(70206006)(7696005)(70586007)(26005)(44832011)(336012)(8676002)(186003)(426003)(8936002)(2616005)(110136005)(86362001)(316002)(5660300002)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:25:12.5627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 332dcda5-4f26-42dc-5d83-08d95cb24dad
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2685

These data structures and functions are used to create the
mapping between node and memory blocks. In device tree based
NUMA, we will reuse these data structures and functions, so
we move this part of code from x86 to common.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/x86/srat.c        | 50 -------------------------------------
 xen/common/numa.c          | 51 ++++++++++++++++++++++++++++++++++++++
 xen/include/asm-x86/numa.h |  8 ------
 xen/include/xen/numa.h     | 15 +++++++++++
 4 files changed, 66 insertions(+), 58 deletions(-)

diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 6b77b98201..6d68b8a614 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -26,7 +26,6 @@ static struct acpi_table_slit *__read_mostly acpi_slit;
 
 static nodemask_t memory_nodes_parsed __initdata;
 static nodemask_t processor_nodes_parsed __initdata;
-static struct node nodes[MAX_NUMNODES] __initdata;
 
 struct pxm2node {
 	unsigned pxm;
@@ -37,9 +36,6 @@ static struct pxm2node __read_mostly pxm2node[MAX_NUMNODES] =
 
 static unsigned node_to_pxm(nodeid_t n);
 
-static int num_node_memblks;
-static struct node node_memblk_range[NR_NODE_MEMBLKS];
-static nodeid_t memblk_nodeid[NR_NODE_MEMBLKS];
 static __initdata DECLARE_BITMAP(memblk_hotplug, NR_NODE_MEMBLKS);
 
 static inline bool node_found(unsigned idx, unsigned pxm)
@@ -104,52 +100,6 @@ nodeid_t setup_node(unsigned pxm)
 	return node;
 }
 
-int valid_numa_range(u64 start, u64 end, nodeid_t node)
-{
-	int i;
-
-	for (i = 0; i < num_node_memblks; i++) {
-		struct node *nd = &node_memblk_range[i];
-
-		if (nd->start <= start && nd->end >= end &&
-			memblk_nodeid[i] == node)
-			return 1;
-	}
-
-	return 0;
-}
-
-static __init int conflicting_memblks(u64 start, u64 end)
-{
-	int i;
-
-	for (i = 0; i < num_node_memblks; i++) {
-		struct node *nd = &node_memblk_range[i];
-		if (nd->start == nd->end)
-			continue;
-		if (nd->end > start && nd->start < end)
-			return i;
-		if (nd->end == end && nd->start == start)
-			return i;
-	}
-	return -1;
-}
-
-static __init void cutoff_node(int i, u64 start, u64 end)
-{
-	struct node *nd = &nodes[i];
-	if (nd->start < start) {
-		nd->start = start;
-		if (nd->end < nd->start)
-			nd->start = nd->end;
-	}
-	if (nd->end > end) {
-		nd->end = end;
-		if (nd->start > nd->end)
-			nd->start = nd->end;
-	}
-}
-
 static __init void bad_srat(void)
 {
 	int i;
diff --git a/xen/common/numa.c b/xen/common/numa.c
index 9b6f23dfc1..1facc8fe2b 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -29,6 +29,11 @@ nodeid_t cpu_to_node[NR_CPUS] __read_mostly = {
 
 cpumask_t node_to_cpumask[MAX_NUMNODES] __read_mostly;
 
+struct node nodes[MAX_NUMNODES] __initdata;
+int num_node_memblks;
+struct node node_memblk_range[NR_NODE_MEMBLKS];
+nodeid_t memblk_nodeid[NR_NODE_MEMBLKS];
+
 /*
  * Given a shift value, try to populate memnodemap[]
  * Returns :
@@ -136,6 +141,52 @@ int __init compute_hash_shift(struct node *nodes, int numnodes,
     return shift;
 }
 
+int valid_numa_range(u64 start, u64 end, nodeid_t node)
+{
+	int i;
+
+	for (i = 0; i < num_node_memblks; i++) {
+		struct node *nd = &node_memblk_range[i];
+
+		if (nd->start <= start && nd->end >= end &&
+			memblk_nodeid[i] == node)
+			return 1;
+	}
+
+	return 0;
+}
+
+int __init conflicting_memblks(u64 start, u64 end)
+{
+	int i;
+
+	for (i = 0; i < num_node_memblks; i++) {
+		struct node *nd = &node_memblk_range[i];
+		if (nd->start == nd->end)
+			continue;
+		if (nd->end > start && nd->start < end)
+			return i;
+		if (nd->end == end && nd->start == start)
+			return i;
+	}
+	return -1;
+}
+
+void __init cutoff_node(int i, u64 start, u64 end)
+{
+	struct node *nd = &nodes[i];
+	if (nd->start < start) {
+		nd->start = start;
+		if (nd->end < nd->start)
+			nd->start = nd->end;
+	}
+	if (nd->end > end) {
+		nd->end = end;
+		if (nd->start > nd->end)
+			nd->start = nd->end;
+	}
+}
+
 void numa_add_cpu(int cpu)
 {
     cpumask_set_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
diff --git a/xen/include/asm-x86/numa.h b/xen/include/asm-x86/numa.h
index 07ff78ea1b..e8a92ad9df 100644
--- a/xen/include/asm-x86/numa.h
+++ b/xen/include/asm-x86/numa.h
@@ -17,12 +17,6 @@ extern cpumask_t     node_to_cpumask[];
 #define node_to_first_cpu(node)  (__ffs(node_to_cpumask[node]))
 #define node_to_cpumask(node)    (node_to_cpumask[node])
 
-struct node { 
-	u64 start,end; 
-};
-
-extern int compute_hash_shift(struct node *nodes, int numnodes,
-			      nodeid_t *nodeids);
 extern nodeid_t pxm_to_node(unsigned int pxm);
 
 #define ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
@@ -45,8 +39,6 @@ static inline void clear_node_cpumask(int cpu)
 	cpumask_clear_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
 }
 
-extern int valid_numa_range(u64 start, u64 end, nodeid_t node);
-
 void srat_parse_regions(u64 addr);
 extern u8 __node_distance(nodeid_t a, nodeid_t b);
 unsigned int arch_get_dma_bitsize(void);
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 5af74b357f..67b79a73a3 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -54,6 +54,21 @@ static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
 
 extern void numa_add_cpu(int cpu);
 
+struct node {
+	u64 start,end;
+};
+
+extern struct node nodes[MAX_NUMNODES];
+extern int num_node_memblks;
+extern struct node node_memblk_range[NR_NODE_MEMBLKS];
+extern nodeid_t memblk_nodeid[NR_NODE_MEMBLKS];
+
+extern int compute_hash_shift(struct node *nodes, int numnodes,
+			      nodeid_t *nodeids);
+extern int conflicting_memblks(u64 start, u64 end);
+extern void cutoff_node(int i, u64 start, u64 end);
+extern int valid_numa_range(u64 start, u64 end, nodeid_t node);
+
 #endif /* CONFIG_NUMA */
 
 #endif /* _XEN_NUMA_H */
-- 
2.25.1


