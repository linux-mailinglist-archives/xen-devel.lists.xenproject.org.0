Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CD9B16D25
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 10:06:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064965.1430313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhOIL-0004lq-QO; Thu, 31 Jul 2025 08:05:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064965.1430313; Thu, 31 Jul 2025 08:05:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhOIL-0004jt-Mx; Thu, 31 Jul 2025 08:05:45 +0000
Received: by outflank-mailman (input) for mailman id 1064965;
 Thu, 31 Jul 2025 08:05:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HAjF=2M=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uhOIK-0004IO-Gy
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 08:05:44 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2413::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27c1f123-6de5-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 10:05:44 +0200 (CEST)
Received: from CH2PR05CA0027.namprd05.prod.outlook.com (2603:10b6:610::40) by
 DS0PR12MB8245.namprd12.prod.outlook.com (2603:10b6:8:f2::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.11; Thu, 31 Jul 2025 08:05:40 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:0:cafe::13) by CH2PR05CA0027.outlook.office365.com
 (2603:10b6:610::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.12 via Frontend Transport; Thu,
 31 Jul 2025 08:05:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Thu, 31 Jul 2025 08:05:39 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 31 Jul
 2025 03:05:38 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 31 Jul 2025 03:05:37 -0500
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
X-Inumbo-ID: 27c1f123-6de5-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVfqdyK1Uqpbrb0bdPtuTmk6LGHfxeoAKXZyny3QyVOn5ad4ubA3NX31fREfXEgiQ5w4FOPjdKgd6j9/3Zj2jULVc+Kf3txtJyj1FAva5UPLaz3+p+1Owy83fJ7729Ql25O6E3HwOYCwA0p18YISn7MKsZtBkvYgMKfVuqhNLi6zlM4AH58OJgamg+TMhPbxzUYSWShhOaLshLNwVLZ5Shj86qjOnjXqGFLsgMwUYf4o+a5JUPrTdBORHYxvvulEEOnCRaW3HFfqvJkpybv7EldVuAMxN3BWv0Nk/iKCT+D76jyNy261qXgrxEGTiOBtG+7fT7x8IrAPFek9+qMSaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MGlwjVDMjCOcmFAd84sW4m3FfWETwSo4vfUWm+zi5W8=;
 b=GTj8wFHr69pJXlfgvYhxJc/dr1GwXtrGcIZKPVMyFYNvhDyHy95bxYZ9s/9dsv+v+hcAKZ9N83wBWcHY5MsOTkcG0s9yNkcU6cS52AVMw8yd3TiX/NvyVI1lJ0QcyUKC3ZlhkAno61xV4U1zh2FpnhLc3SqahDMpHmFb9NkAniEZRJEdVhDcB049wYjeD22uCkoNapv7Avaop3XTC71lWLXmvvAgmHTYcLaUAlmsScu7v75/F5jzBMCRWya1Vydx1DrjBTgIxWTesskEuF6nhmhAdn8yKH4Zo+ZuLwnE51cNe+jShIeqw3i9kufw85NN2pl7LfKSQBkyE7GBcNQOsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MGlwjVDMjCOcmFAd84sW4m3FfWETwSo4vfUWm+zi5W8=;
 b=MqNQ8D0K5hcaktOnEao4OJDlulFPE85vbr+Ng5JrEXQN0V5I/t31qjThKT3yM3qfqZfcokVIlnJprYfkTQRL9SSA0FMTx1rNZW8hnXSOlX/9qDL89iR4Au8jMWDtoXBH4B2wxpSR40g6O2epxF0f/3u2snqUmDB66f2Gud5j1Vc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH 2/2] common: Make livepatch dependent on HAS_VMAP
Date: Thu, 31 Jul 2025 10:05:22 +0200
Message-ID: <20250731080522.810468-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250731080522.810468-1-michal.orzel@amd.com>
References: <20250731080522.810468-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|DS0PR12MB8245:EE_
X-MS-Office365-Filtering-Correlation-Id: 72196fe0-4b23-43bb-6b1e-08ddd00909fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4Kdi4QfWs8df3/W3JVSdN88Q2XIGjpT579CneK8/WrSiA2o3BrE0bVUgQanM?=
 =?us-ascii?Q?6be4TgGZf9Rj0Al8uu5CuN+87wmO6/HrT+P3n1BDIIkF+A74YEU3hN+JoVYD?=
 =?us-ascii?Q?W2J499YIx88si4/RmoWRvAed9AHyaCMIjcr6idxlyUapzBZWnTcwlF8/Cn/w?=
 =?us-ascii?Q?cPJGVpAFVqU6MPqfH7vcrKtTDSrCOrx1yBvrlQ+GiweaF1zeQ8xOzRbkGOTd?=
 =?us-ascii?Q?UHGr1kv+OHNqEJxjEBu6rYvU/TYbVxnLwbXzTAlS7oQzVzj5GA1ZWPB7X68u?=
 =?us-ascii?Q?CqlBUAyrltz1b6AkRT0/GPjn0IHQab05r97TB2GeMqyYCTGds4IxWrOuNT1u?=
 =?us-ascii?Q?GOynFRkHdUmko4SZCBCv708TqOIC9ooNeoDmNiECTJQdAMm1tbB7LOx4+2zv?=
 =?us-ascii?Q?CSinW3vCTOq9n4OwY2CUnRcBvgYDnJT7VT0sHfRcBiJkLo6gmUb90BB1G+BT?=
 =?us-ascii?Q?jLtWBtdoX8dgl/6//DDAWBErVyy1Lz4C4lW+wENhbOErrlxtgvVM+YtwJTyl?=
 =?us-ascii?Q?F0WMQC1QLn2Y5GgoKcEXF/vU7znaGttgB6FH4UDEijLlPd4Yh6F9/JUw6txs?=
 =?us-ascii?Q?PSqGvrbZPdgMp8e7HgEtAVfDZHorv5cVOiTJcVBXQSANWG0PSmzgdDHM11fZ?=
 =?us-ascii?Q?QMjrO/4sDkcQMm36U7hln7E3d8QfoTd5dY1pBK6wSoKTl0tFnZcJ96Fcidan?=
 =?us-ascii?Q?dp9UWkN0NNuELXCOUSF54yEZIrM0qGkh0OAYAdZhyneTagwIeY9YDJbx1TRd?=
 =?us-ascii?Q?RdBIGu4yYBcHvifHP4FmoadtiFxcvZ6ex4Mjj9pHSl9ez4Z2BYTOwVL+wZ25?=
 =?us-ascii?Q?xeEX6hPTq8mF8RvLWMpX4ipZNjcLycatJSgDXi6Nl9c17Lu1zQrz6GtGNKhz?=
 =?us-ascii?Q?BV7RKfrbef5ltb0I4+XwtooSRl1aaXtMr64MqLmNFBxZitb3KxfJEla7vhTZ?=
 =?us-ascii?Q?Y5oHE4UxOm0/p+OzwKADV336o90Q3edU8KP+P9ZWxgVxOcLaJDeKeIt4B4B5?=
 =?us-ascii?Q?j7b9996cBvobTQ8eZ6WzEtDEtZCO9Yfq1gBWjoLvEn95IE6tW3nKqH9vFOvH?=
 =?us-ascii?Q?oEswa/9g/AZ+chPp96tV8jZ3A1phXsrtMPy2yPDinVn5AtfZxjschQJtmeGR?=
 =?us-ascii?Q?yRd1rJq2aAi6c/+c6bCS8OFG9zIQJgO1JwZ+Fbf6dyWYcEPQEkSYLBq82FW1?=
 =?us-ascii?Q?iDFMdW9mwjcSwgnSoAgie+FBkKji1RlB2YJ6mMXjWgKMvXgDlQ4YV5BdW6q+?=
 =?us-ascii?Q?zvhv4GbmZTopn0ksKIAzYg7RWtc7oxjxJOt5qvNUm4Z7AWpKKYgxaPAkjrhn?=
 =?us-ascii?Q?795KSDcOlwPddqOhLK83yPByVv4ZikqersH1DfMt+DKYs/FdzAhQs2Psqbvd?=
 =?us-ascii?Q?vJxG1brRW5hc1cSxTd8QRor87mD9gBQLNEBIJZiL9yOkExGbiEfecPZl+3/C?=
 =?us-ascii?Q?T0DFSRtsjsGho8K4wMXP7QMPFrW4Fkuv5f6np8amljyYvgPCMAL5BxRlOjf1?=
 =?us-ascii?Q?aJY/BUotCH2AEsoCluWWwokCjxFJ4ydqJ7NE?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 08:05:39.6910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72196fe0-4b23-43bb-6b1e-08ddd00909fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8245

It should not be possible to select and build livepatch if HAS_VMAP is
not selected. This is the case on MPU systems.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/common/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 2539a635f111..16936418a6e6 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -477,7 +477,7 @@ config CRYPTO
 config LIVEPATCH
 	bool "Live patching support"
 	default X86
-	depends on "$(XEN_HAS_BUILD_ID)" = "y" && SYSCTL
+	depends on "$(XEN_HAS_BUILD_ID)" = "y" && SYSCTL && HAS_VMAP
 	select CC_SPLIT_SECTIONS
 	help
 	  Allows a running Xen hypervisor to be dynamically patched using
-- 
2.43.0


