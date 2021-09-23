Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F275415DCB
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:04:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193823.345337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNSM-0008HR-R6; Thu, 23 Sep 2021 12:04:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193823.345337; Thu, 23 Sep 2021 12:04:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNSM-0008Ea-H6; Thu, 23 Sep 2021 12:04:02 +0000
Received: by outflank-mailman (input) for mailman id 193823;
 Thu, 23 Sep 2021 12:04:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNSK-0006xV-Nj
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:04:00 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.62]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51a1c4be-1c66-11ec-ba2e-12813bfff9fa;
 Thu, 23 Sep 2021 12:03:52 +0000 (UTC)
Received: from PR0P264CA0139.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1a::31)
 by AM9PR08MB6915.eurprd08.prod.outlook.com (2603:10a6:20b:30f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 12:03:49 +0000
Received: from VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:100:1a:cafe::d9) by PR0P264CA0139.outlook.office365.com
 (2603:10a6:100:1a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT064.mail.protection.outlook.com (10.152.19.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:03:49 +0000
Received: ("Tessian outbound 45760a30af4a:v103");
 Thu, 23 Sep 2021 12:03:48 +0000
Received: from ec9bdfbe0915.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 04BA987C-A848-48A6-BA73-490F24ED3F12.1; 
 Thu, 23 Sep 2021 12:03:35 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ec9bdfbe0915.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:03:35 +0000
Received: from DB6PR07CA0021.eurprd07.prod.outlook.com (2603:10a6:6:2d::31) by
 AM0PR08MB4322.eurprd08.prod.outlook.com (2603:10a6:208:148::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 12:03:33 +0000
Received: from DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::cc) by DB6PR07CA0021.outlook.office365.com
 (2603:10a6:6:2d::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.8 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:33 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT019.mail.protection.outlook.com (10.152.20.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:03:32 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:03:33 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 23
 Sep 2021 12:03:31 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:30 +0000
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
X-Inumbo-ID: 51a1c4be-1c66-11ec-ba2e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rv+ePpm3yVoMrcs6MF1PccZI0uYzJEbD1D1+NGjLnZY=;
 b=Anai8pLH5joOUnO6M+9wv1bFAgkUmXITxrBlIzNr2FQAJFNbJNwUk6SZVD9FaxlmMiXecqHF+8dVALOMAT4jRsEE1WVbJrAWOZVEFSIverbAKX1RS/SIRwUL3sSKE+AbqHmQPJD0fezhoD8ne5HTqpm88u9+g/EnHXBMn64hQYY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5c9c0cfae6dac015
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=caz+a442gJEyjiBHQq/LjUEUYkTHZCKBOrNweA+RyRafJ0Nt3tRT2YLZyWlg+q/Ggfe8/+N6aeBsKInC0UFIJeqLK/Cqgd8p0af0mlE/6FetTY5+DEM2SG9s87K2tlziY8B9+41VggDlKwsYTaVGnaKQ2lY83aZSwDiZPZHMpkatiHuiPTIJ9bFbparH9vcGElwXW0eRc5eEGPE85rrEYzpGLbJc9C2524LCfnjUKTiU20lWKV7Gb0segajXw2vP+rWEwr1nrTcEvOzJ2JJELlY9Obx1by0Ne4D+Fp+eeaQwCdFS29YGf7ooZAaC4haU8M2krF3ki6yF2qy5Ez6nNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Rv+ePpm3yVoMrcs6MF1PccZI0uYzJEbD1D1+NGjLnZY=;
 b=NrrE/cJ4Cja/BXbkht3VAPTzmNsykgoit364WxV6FfrvwD6jLy/VuehNjyPDMQln8SoDSC6NCY575yo2CquWVrneU2z8PO3rRTeUtje0DFqaHLEaGTwcxoBPX5UsIQJK+bTjccdhbCgHpHZuqwulE6L8ePzsm5gZiSJfnCmWkZ05bBx1FGqO44z5+3rHJYF2OTDmcH6pxGZjAuEH4PrMfK9qKKuo/WGcyGPQU1nAsLV7BtiuBhTstekI0CZl2WhF2U5/p4JoMJpq0U9OaLsHk91mZvKlqwixgIW7quVWeameZNpL63NR+jFHqiHmfq9SDcAFiUaAEkQlYI4MFqM1aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rv+ePpm3yVoMrcs6MF1PccZI0uYzJEbD1D1+NGjLnZY=;
 b=Anai8pLH5joOUnO6M+9wv1bFAgkUmXITxrBlIzNr2FQAJFNbJNwUk6SZVD9FaxlmMiXecqHF+8dVALOMAT4jRsEE1WVbJrAWOZVEFSIverbAKX1RS/SIRwUL3sSKE+AbqHmQPJD0fezhoD8ne5HTqpm88u9+g/EnHXBMn64hQYY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>
CC: <Bertrand.Marquis@arm.com>
Subject: [PATCH 11/37] xen/x86: abstract neutral code from acpi_numa_memory_affinity_init
Date: Thu, 23 Sep 2021 20:02:10 +0800
Message-ID: <20210923120236.3692135-12-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89db300a-2116-4361-844c-08d97e8a3428
X-MS-TrafficTypeDiagnostic: AM0PR08MB4322:|AM9PR08MB6915:
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB69159010AE55D53F0FD95E8A9EA39@AM9PR08MB6915.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0BvzLm+wBVJPHsPB+W4VPN4D5VgiLLjEMy6E4snzslUHLMoaPiqc+YEVJwTqXiQXXgvswNJier6CZBSzUlhkHSiP00j3oxhxzL0BLuP1IiM9ul+gVWdDuA2nCyD3izu6Ci65Oh93oc5XsiBY0gUwQcQLwGcXD8PI1EXgjh/QWeQCSrA2wT69dJtK+cdehtisXfGqhQK0M5Otqgv2LeNUnEqDCzMIIO2ImyM+koYV9uZH8smc4lVIAsh2/+zAprwD92N+LSO6zCxtqdAoGHtp7WApNRsMQVvuYXdMoaGrbE3Zx1k41aEPmNdk+eFEXD38sPptRbcDE9BQul9oV3TxNPJdeCJhNIpF9wSqAkMPVE1v209R0LaBBLtUXkpo3lH1rfIrzgKLRXeD0kVjyNowkxfk6XEbKARFsmqONWtPpzPFlZLnMDn7x9MC5Kha76qzdR8Qiaf4xHCnbv2C4e9Swb6xhsteNPKywf5+h0dOsTSZ5t6pIMblOASt3/8o6FUaKtZu5NiA8D2xP3xqkxrltcycWatYgzbRjvlIJodT+REpepdIiEaafVN0Cm2nvPJiIGjq2sKI4nWa1VE3dHSpBdzG7ZYXDqBEAQgf1GbDKeuh0knMuNUJvdn4pzhgcsI66Dj/7WgY5DMwtHG3G9XublxzS8GqK0ot1Ag2+YXiboDM5M5cOOjG1geL4fOicWv1ShAsNk+4V4UVx6xbJvyLOuQ7Pc5twH3vB0EjE2dg6tw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(426003)(47076005)(8676002)(44832011)(86362001)(186003)(4326008)(336012)(2616005)(83380400001)(508600001)(1076003)(70586007)(316002)(6666004)(5660300002)(36860700001)(356005)(70206006)(7696005)(81166007)(26005)(82310400003)(8936002)(110136005)(2906002)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4322
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fbca8517-66ee-4a60-4ffb-08d97e8a2a34
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/8u5CeDp/RMSFVHId4o0u3V9GZpWYthLVF2m3o6F2MpOwtfdOPYlG1xtI8iX7eo1CHhCjdzz3upyFkdIuwJKsZOg97YI2MYtgs816Vn2TCiyC0kPAbv3xWKMPXvBDJRKnBkHskcigphP/7+V23pGWjgEkaRkXCIlExnJCIpGROrpEZPgh+dxPXiVC8eZBGVEYCDgp8JhfcE9yGK0rUGjU2yo2tXvyw+uVTnFdEd8/q6O2kBzcsYmeZ4UUkQ0muimWROpdPkk2VlL3a6WLLlu4LtiXhRZWpnoH39DN/I6SbvgydFVVH51Fz5hQQWMsGyXF5Vhz/PB67OTmwWP3g2jPLDzXKNeous7DAK9rairq2GvcQ+e40Hix5Kx8xd3NFlKwH+eOMhkdJQuJhel656H2NK8b9H+TueAyA7cmN8A0FLk9MMY7WLbFf5/IsfE8gybXCmHrRrxhyuKF4b58t7eLAFalRdzSdL6qeuMfXR/mpwXWZJW0HA7Oa6ydksw9WWVWAvFCQCwgKAVT+L/KmSmYeAJ2684SquJ1L9tyilYElIY4ryuDkqRtxBKx00b1fOt0ki5yaa5GWu2vFx/NZrsHNklpYQlQpKQilSrWw5U6Y45idtHialTsvcRRaMu83jxgzDZWkguIyJ9xanzPYf+nYn1z7kjVBq7tRe6UImo43EIJsjB1GRw/aKZl9eHF36xs1rYRit2gpdefg5O6SfZzQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(2616005)(1076003)(26005)(44832011)(81166007)(86362001)(70586007)(4326008)(83380400001)(47076005)(6666004)(36860700001)(508600001)(336012)(82310400003)(110136005)(426003)(8676002)(8936002)(70206006)(186003)(316002)(5660300002)(36756003)(7696005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:03:49.4274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89db300a-2116-4361-844c-08d97e8a3428
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6915

There is some code in acpi_numa_memory_affinity_init to update node
memory range and update node_memblk_range array. This code is not
ACPI specific, it can be shared by other NUMA implementation, like
device tree based NUMA implementation.

So in this patch, we abstract this memory range and blocks relative
code to a new function. This will avoid exporting static variables
like node_memblk_range. And the PXM in neutral code print messages
have been replaced by NODE, as PXM is ACPI specific.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/x86/srat.c        | 131 +++++++++++++++++++++----------------
 xen/include/asm-x86/numa.h |   3 +
 2 files changed, 77 insertions(+), 57 deletions(-)

diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 3334ede7a5..18bc6b19bb 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -104,6 +104,14 @@ nodeid_t setup_node(unsigned pxm)
 	return node;
 }
 
+bool __init numa_memblks_available(void)
+{
+	if (num_node_memblks < NR_NODE_MEMBLKS)
+		return true;
+
+	return false;
+}
+
 int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node)
 {
 	int i;
@@ -301,69 +309,35 @@ static bool __init is_node_memory_continuous(nodeid_t nid,
 	return true;
 }
 
-/* Callback for parsing of the Proximity Domain <-> Memory Area mappings */
-void __init
-acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
+/* Neutral NUMA memory affinity init function for ACPI and DT */
+int __init numa_update_node_memblks(nodeid_t node,
+		paddr_t start, paddr_t size, bool hotplug)
 {
-	paddr_t start, end;
-	unsigned pxm;
-	nodeid_t node;
+	paddr_t end = start + size;
 	int i;
 
-	if (srat_disabled())
-		return;
-	if (ma->header.length != sizeof(struct acpi_srat_mem_affinity)) {
-		bad_srat();
-		return;
-	}
-	if (!(ma->flags & ACPI_SRAT_MEM_ENABLED))
-		return;
-
-	start = ma->base_address;
-	end = start + ma->length;
-	/* Supplement the heuristics in l1tf_calculations(). */
-	l1tf_safe_maddr = max(l1tf_safe_maddr, ROUNDUP(end, PAGE_SIZE));
-
-	if (num_node_memblks >= NR_NODE_MEMBLKS)
-	{
-		dprintk(XENLOG_WARNING,
-                "Too many numa entry, try bigger NR_NODE_MEMBLKS \n");
-		bad_srat();
-		return;
-	}
-
-	pxm = ma->proximity_domain;
-	if (srat_rev < 2)
-		pxm &= 0xff;
-	node = setup_node(pxm);
-	if (node == NUMA_NO_NODE) {
-		bad_srat();
-		return;
-	}
-	/* It is fine to add this area to the nodes data it will be used later*/
+	/* It is fine to add this area to the nodes data it will be used later */
 	i = conflicting_memblks(start, end);
 	if (i < 0)
 		/* everything fine */;
 	else if (memblk_nodeid[i] == node) {
-		bool mismatch = !(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) !=
-		                !test_bit(i, memblk_hotplug);
+		bool mismatch = !hotplug != !test_bit(i, memblk_hotplug);
 
-		printk("%sSRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with itself (%"PRIpaddr"-%"PRIpaddr")\n",
-		       mismatch ? KERN_ERR : KERN_WARNING, pxm, start, end,
+		printk("%sSRAT: NODE %u (%"PRIpaddr"-%"PRIpaddr") overlaps with itself (%"PRIpaddr"-%"PRIpaddr")\n",
+		       mismatch ? KERN_ERR : KERN_WARNING, node, start, end,
 		       node_memblk_range[i].start, node_memblk_range[i].end);
 		if (mismatch) {
-			bad_srat();
-			return;
+			return -1;
 		}
 	} else {
 		printk(KERN_ERR
-		       "SRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with PXM %u (%"PRIpaddr"-%"PRIpaddr")\n",
-		       pxm, start, end, node_to_pxm(memblk_nodeid[i]),
+		       "SRAT: NODE %u (%"PRIpaddr"-%"PRIpaddr") overlaps with NODE %u (%"PRIpaddr"-%"PRIpaddr")\n",
+		       node, start, end, memblk_nodeid[i],
 		       node_memblk_range[i].start, node_memblk_range[i].end);
-		bad_srat();
-		return;
+		return -1;
 	}
-	if (!(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE)) {
+
+	if (!hotplug) {
 		struct node *nd = &nodes[node];
 
 		if (!node_test_and_set(node, memory_nodes_parsed)) {
@@ -375,26 +349,69 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 			if (nd->end < end)
 				nd->end = end;
 
-			/* Check whether this range contains memory for other nodes */
-			if (!is_node_memory_continuous(node, nd->start, nd->end)) {
-				bad_srat();
-				return;
-			}
+			if (!is_node_memory_continuous(node, nd->start, nd->end))
+				return -1;
 		}
 	}
-	printk(KERN_INFO "SRAT: Node %u PXM %u %"PRIpaddr"-%"PRIpaddr"%s\n",
-	       node, pxm, start, end,
-	       ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE ? " (hotplug)" : "");
+
+	printk(KERN_INFO "SRAT: Node %u %"PRIpaddr"-%"PRIpaddr"%s\n",
+	       node, start, end, hotplug ? " (hotplug)" : "");
 
 	node_memblk_range[num_node_memblks].start = start;
 	node_memblk_range[num_node_memblks].end = end;
 	memblk_nodeid[num_node_memblks] = node;
-	if (ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) {
+	if (hotplug) {
 		__set_bit(num_node_memblks, memblk_hotplug);
 		if (end > mem_hotplug_boundary())
 			mem_hotplug_update_boundary(end);
 	}
 	num_node_memblks++;
+
+	return 0;
+}
+
+/* Callback for parsing of the Proximity Domain <-> Memory Area mappings */
+void __init
+acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
+{
+	unsigned pxm;
+	nodeid_t node;
+	int ret;
+
+	if (srat_disabled())
+		return;
+	if (ma->header.length != sizeof(struct acpi_srat_mem_affinity)) {
+		bad_srat();
+		return;
+	}
+	if (!(ma->flags & ACPI_SRAT_MEM_ENABLED))
+		return;
+
+	/* Supplement the heuristics in l1tf_calculations(). */
+	l1tf_safe_maddr = max(l1tf_safe_maddr,
+			ROUNDUP((ma->base_address + ma->length), PAGE_SIZE));
+
+	if (!numa_memblks_available())
+	{
+		dprintk(XENLOG_WARNING,
+                "Too many numa entry, try bigger NR_NODE_MEMBLKS \n");
+		bad_srat();
+		return;
+	}
+
+	pxm = ma->proximity_domain;
+	if (srat_rev < 2)
+		pxm &= 0xff;
+	node = setup_node(pxm);
+	if (node == NUMA_NO_NODE) {
+		bad_srat();
+		return;
+	}
+
+	ret = numa_update_node_memblks(node, ma->base_address, ma->length,
+					ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE);
+	if (ret != 0)
+		bad_srat();
 }
 
 /* Sanity check to catch more bad SRATs (they are amazingly common).
diff --git a/xen/include/asm-x86/numa.h b/xen/include/asm-x86/numa.h
index 50cfd8e7ef..5772a70665 100644
--- a/xen/include/asm-x86/numa.h
+++ b/xen/include/asm-x86/numa.h
@@ -74,6 +74,9 @@ static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
 				 NODE_DATA(nid)->node_spanned_pages)
 
 extern int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node);
+extern bool numa_memblks_available(void);
+extern int numa_update_node_memblks(nodeid_t node,
+		paddr_t start, paddr_t size, bool hotplug);
 
 void srat_parse_regions(paddr_t addr);
 extern u8 __node_distance(nodeid_t a, nodeid_t b);
-- 
2.25.1


