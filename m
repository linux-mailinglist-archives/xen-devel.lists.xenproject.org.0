Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 576888B0FC6
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 18:29:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711532.1111547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzfTB-0001qT-Fe; Wed, 24 Apr 2024 16:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711532.1111547; Wed, 24 Apr 2024 16:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzfTB-0001oN-Ch; Wed, 24 Apr 2024 16:27:41 +0000
Received: by outflank-mailman (input) for mailman id 711532;
 Wed, 24 Apr 2024 16:27:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gNf0=L5=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rzfT9-0001oH-Ui
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 16:27:40 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e8b90fe-0257-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 18:27:36 +0200 (CEST)
Received: from MN2PR14CA0009.namprd14.prod.outlook.com (2603:10b6:208:23e::14)
 by CY5PR12MB6108.namprd12.prod.outlook.com (2603:10b6:930:27::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 24 Apr
 2024 16:27:30 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:208:23e:cafe::4f) by MN2PR14CA0009.outlook.office365.com
 (2603:10b6:208:23e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22 via Frontend
 Transport; Wed, 24 Apr 2024 16:27:30 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Wed, 24 Apr 2024 16:27:29 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 24 Apr
 2024 11:27:29 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 24 Apr 2024 11:27:27 -0500
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
X-Inumbo-ID: 8e8b90fe-0257-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F4PZ0asnfjOot9VZc5WlCJq0bJM6mTBRVYwA+VlWVvhZ5jTj8hiGyz82XgW4swExYjhbfqTYswc/NRGjDD/rkIVHpfH406R+6BVB+3k2HQMS9iXQVOmXOXwyy4uAFUf3q2DERTOoEtZuPSkzYDVMovMNeyJz1PslX9tDJv2uuSpa2COjby/HyygLxi3Fe4AqthGPPRy0uTS+/CbBhB9/Wnuu86su81/jZx8DLrheum/3kjWMVo6QmhRYO+dBNbrRz2+4rcQDbrCar/UZCD1yqYlgFlquPS6Xo0ht6BKNZFdus7ZyXob+ZTe8FSayhIrQwO3RVNVZfUQ9OjuZAv3y6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8lea7rpiXbySq5b28kViv384nbu2rzhSNZO83KIpiL0=;
 b=elwlvvqAyHDuFOnKdFRaYNVJg5Fda/L3KxhsnfY3LsNriGCD90qLGxdLhMUHguyqRld0+OiNJGWKOZFzDEFRgws3BEsf1v0BkhQGdo6S7kjhyvKV+ukkk5ha4hequ3JqC20zHmDFdT60/7jYxn4p9xtLC/QihWzsiOpnY5rJg0xJ0ckBbFYwj8eOGvmqb53QlquSlwpvlzNy6wTH/Enk5/B058hnafpgsR5mV8B/ZHZ3Nnxcf7O8O7Tu7AythAbHNt+F6DKJxrKCSqTrNKlQ2mqGj0Mr+zgSzFMTE19w50kAuLVxxn+61TXleMa/W4UdF7SK1z/No0MkJIOpjQpbbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lea7rpiXbySq5b28kViv384nbu2rzhSNZO83KIpiL0=;
 b=xH7xE6E6HSKydLyO4KgvykmPQfdYHOIYPG5vxHDjEclsq9pgDLlFU7Wxwm8E4K7UY/K9WfzAX6YJXINtf1RfdgkKH26HAQevvgHBN1NN9eiv3NbvRgCoIEhvzZKHg81s+XgDVC7UHKa4m9pcq0m9N0zqAywuX4pdYe1IUC+v894=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH] arm/vpci: make prefetchable mem 64 bit
Date: Wed, 24 Apr 2024 12:27:22 -0400
Message-ID: <20240424162726.204791-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|CY5PR12MB6108:EE_
X-MS-Office365-Filtering-Correlation-Id: 90d21c0f-c400-4604-7a2b-08dc647b6fdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WRVMeBCLA0T4cBra/OTI15Tj939vsUuugHEccLP8/rEA9vVWc3Ap0BoszbA4?=
 =?us-ascii?Q?UJHDsegg3I/z27W5XC2b9ftatve81vGCLv8hKnTprBuyuKTqLSr3wWLww/Ky?=
 =?us-ascii?Q?W/95z3grXFeRyDuUp0EDqua+WE1lpG0yR48vLg+yBKMt5CQRrYlgmc4MtQHa?=
 =?us-ascii?Q?wIR7I8AAq90O9Tzy8CHlFHho3rfLaquCgt+Dum+V4qs0Z2pYB5T/IPDqa/om?=
 =?us-ascii?Q?KRocWP2eF9kGlmY8v5cl0/ReihbdKk19aC49yC7j3NX5ky5s94YMZ3RW2CSk?=
 =?us-ascii?Q?346tKRixIfhYulMAsOv8KEUDyWY3E1VGl4pDEcVTYVUV2P4EcAhaVTIvwZBP?=
 =?us-ascii?Q?3ISgSYbgKntDEyyUecGecoqhT1NfkjpeOGZsvSsd8Z4fkIMVANW/rIC6Ge4g?=
 =?us-ascii?Q?2KSgwMIX2pSTNeW3qu+4av0VYUUQ1hn3mBB5hy0CWWjd++YYw+hbMgk+DT0U?=
 =?us-ascii?Q?qCaN/fTN7KJv0VjG5fkgytCQr+fvv+jjib7GEi32lcK38nj1heXNHIXWtGYT?=
 =?us-ascii?Q?2tv9a44P5in0ZThiQKKkurxeEYHYDagYGdW6IVr1W6dNa7LzqMy9EeHwQq/9?=
 =?us-ascii?Q?VSgvN0blYGVsB9gv2pTWks6/g/VvEE1VHZxcqpZP2sIapfWaxBNywb0a8CM1?=
 =?us-ascii?Q?vChynikXY0dY2wJWQ0h10TCNTiYmdgMDvuw4CTqp3p7ZpdPoV3bW/eTfJPZz?=
 =?us-ascii?Q?PdAvzxj/eB9RDUHwoZCxKnjTA8Cc37lrKwpEJFGzvcd61kCFkoNepZwqkbRD?=
 =?us-ascii?Q?/BAaCuiFaQjJ9X0dK3OXOwHpkeDFInwMgTG12AlhHd4/NMEi5375RNhaTdZ8?=
 =?us-ascii?Q?G3NI8saogdhGHtfD5Lyi6Iwy5p27xhJl++9EhjhYeXwU5cwSdE3apzYrjBjr?=
 =?us-ascii?Q?3a6JKkMa+o8BVgKBrqouZDeNT6Er89R0NDc29a9gF3nNpyC9d1EsHxvUQWZ4?=
 =?us-ascii?Q?8bd0yJZGuaj8dfCK4aBVuZ9JFeLNZdaFCgQzP19ozaAkgU7J9qfeA1eA9diO?=
 =?us-ascii?Q?6xe6fl9rxz0ujD5Cg18Cw/Fic8jLfIZkQ4J2zTN+1OHW5twwr4+VIX7M/6jb?=
 =?us-ascii?Q?qipG4SZoPj6uPMcC8E3NKPUO5Vyjz7fzlWwO2vMiKaUJLht3uE7W5/8FQh4u?=
 =?us-ascii?Q?wobNNs2AV+Tm/Ik2XFcvXcThcv7rxQFT8+O9q/nIYDLy9xmlnYTiyC8yLtNw?=
 =?us-ascii?Q?DchSkobipqzAHAI9ojVGrk6uMLKKdU3bn83fuU9Mw2yifTeNNNfNB2r0T5f2?=
 =?us-ascii?Q?mKA52KOhUqE5TLdcy2FLS+Ub/ziP3ZhEjtgYEQOxkugOL7SI38UI7TLmMm7m?=
 =?us-ascii?Q?a9La0RaIPr86vE64VyZaFBMDKOSQPUzcfhWBr/xATUwiSbmRvO/ReClTaChY?=
 =?us-ascii?Q?4W7h5DCUTHN+eXjxKt00hP87I8Bm?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(82310400014)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 16:27:29.9864
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d21c0f-c400-4604-7a2b-08dc647b6fdb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6108

The vPCI prefetchable memory range is >= 4GB, so the memory space flags
should be set to 64-bit. See IEEE Std 1275-1994 [1] for a definition of
the field.

[1] https://www.devicetree.org/open-firmware/bindings/pci/pci2_1.pdf

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/include/public/arch-arm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index e167e14f8df9..289af81bd69d 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -487,7 +487,7 @@ typedef uint64_t xen_callback_t;
 #define GUEST_RAM0_SIZE   xen_mk_ullong(0xc0000000)
 
 /* 4GB @ 4GB Prefetch Memory for VPCI */
-#define GUEST_VPCI_ADDR_TYPE_PREFETCH_MEM   xen_mk_ullong(0x42000000)
+#define GUEST_VPCI_ADDR_TYPE_PREFETCH_MEM   xen_mk_ullong(0x43000000)
 #define GUEST_VPCI_PREFETCH_MEM_ADDR        xen_mk_ullong(0x100000000)
 #define GUEST_VPCI_PREFETCH_MEM_SIZE        xen_mk_ullong(0x100000000)
 

base-commit: 410ef3343924b5a3928bbe8e392491992b322cf0
-- 
2.43.2


