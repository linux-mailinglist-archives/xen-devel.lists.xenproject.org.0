Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 343E7A4BA03
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 09:57:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.899954.1307908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp1bn-0003wI-5g; Mon, 03 Mar 2025 08:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 899954.1307908; Mon, 03 Mar 2025 08:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp1bn-0003vD-2O; Mon, 03 Mar 2025 08:57:07 +0000
Received: by outflank-mailman (input) for mailman id 899954;
 Mon, 03 Mar 2025 08:57:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kv9T=VW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tp1bm-0003Dc-0s
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 08:57:06 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20627.outbound.protection.outlook.com
 [2a01:111:f403:2417::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a515d6a-f80d-11ef-9ab2-95dc52dad729;
 Mon, 03 Mar 2025 09:57:05 +0100 (CET)
Received: from BN9P221CA0004.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::12)
 by SN7PR12MB6837.namprd12.prod.outlook.com (2603:10b6:806:267::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Mon, 3 Mar
 2025 08:57:00 +0000
Received: from BL02EPF0001A0FF.namprd03.prod.outlook.com
 (2603:10b6:408:10a:cafe::1a) by BN9P221CA0004.outlook.office365.com
 (2603:10b6:408:10a::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.27 via Frontend Transport; Mon,
 3 Mar 2025 08:57:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FF.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Mon, 3 Mar 2025 08:56:59 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 3 Mar
 2025 02:56:59 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 3 Mar 2025 02:56:58 -0600
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
X-Inumbo-ID: 7a515d6a-f80d-11ef-9ab2-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wvy1xcBad+iO+imkR1o+Pzl9v+7aMTTG1lbT7cOPMiRBgpPhmvWs0/IfgEqba7h4Jzh1Mkv+8xWrLx2le8CdevVaVTh4qEcQK6uG6290TaDYoUqnk1b/G+a63J1o+akdHnMJbzl15DF35b5/smx5L9qeiBydz5Y/sgu4MLf7IpFKmzQWkhsVkwnrftE057i6pZY1NfFXV698dOm2Tp8Q/zjIIU19qCkhFLtS9KUr6rf4pEqd6y6Hak/hKk3aa7JleHcWsP4OwxVpKFX59hyPb3AjmoqSgX3cXiQoQ1PzvPeIZQI48i4kiauQsxZl1Yml8MpTIpxEhiO0Xq79ML2Flg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/bQ+H7J+bTS7mkQRIITAqEiowFLxZYtUi8lKZ2cQbE=;
 b=KmElTPAQYnXhUg5ChlEhXuR2Bo0CLiJwiPJK5+grlBj7Hx4yXYUOJLLckl31AOS9qY1jtoLa88QvK6gwVbSUZ/4YNpxi4YTZ0B45hVzdyz+XMD74RVAKLdweEaZmSnmsM4Jw7KYS9Lc8vCqN8TVVwY2NLU7lOTEv/9e4wVLgfQprCU3J7GvV5+ov9ALYOrIglFwll4G3pTf+9kEHLhZFITWxxNq5EFRaYbXtECXHoEASyNfIZpK17Txlc9KvDgO5IH/Ljivmwt5O1GUCxR2T4n7E2T89h1Bjq8Kc0wuPUkZSZwN2tk+C18d8eIFcCL9+LtDSf9q4Vs9fqF4nGhB36Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/bQ+H7J+bTS7mkQRIITAqEiowFLxZYtUi8lKZ2cQbE=;
 b=wo1s2kbCKarijxgOrMNJNX1PEYGp/Sflbo5c5t57k68E4FV1qQEE6KMj/348hEurgqWRU/mdc8VCg8QgueoDU1zXLdRRbv0kgn8Ykc0txTFhX8JCcLvGwevxAkO+nYDoavkNGMY1zzeK2YIeDO0qfsiOAOJ2yIUyAUe/9lR2MuU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 4/4] xen/arm: Don't blindly print hwdom in generic panic messages
Date: Mon, 3 Mar 2025 09:56:50 +0100
Message-ID: <20250303085650.74098-5-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250303085650.74098-1-michal.orzel@amd.com>
References: <20250303085650.74098-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FF:EE_|SN7PR12MB6837:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a317e7b-4e47-4eb3-57aa-08dd5a315bee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/bGMkLobgP1UIkvX9In49fSxyEa0duhwsuaGSEwKjGSmytFY/PRwk03rzo+L?=
 =?us-ascii?Q?bUpxfb8rIX9wlF/HFy15LFumbBZqm6y96atm6V6kunxpE8OIe0An0bl2EGlO?=
 =?us-ascii?Q?znhMC/cfHEs2qWJmC+rxa3eAItoLyU5KatgrxUrcgmJ02xqCWZD1VLiunwKP?=
 =?us-ascii?Q?AWapp8sQzbESh7Sm869NIZFC71NqR7o1UmqJSD0dvixPYyigDRiPHsIH961v?=
 =?us-ascii?Q?FjAe4TvQ7KJHzMbx8woqw/qCohRJ8ZlDhkMomQd6w1IlJccA7B5On63+35WB?=
 =?us-ascii?Q?m47X9AKlLV4Awr2PFkkA6uQzpiHD9Q8dK/xavTGNFQ9UlFHaWSxrm2K+VN4y?=
 =?us-ascii?Q?I1TuYeF/d0v5veSDc8zfGSmA11mU6zTiPGYpSbmxCZmd9msovuNp484aweWx?=
 =?us-ascii?Q?2xupnVrbOw8DQ4+nc4dN5x+ZqZXSvYuhsg1Ur7U+gVlJq1dJfZx1Xtg1jG6K?=
 =?us-ascii?Q?e3nNUYYE/VJo1UEwUlyP39+y8wcHTw2V+3koi3+3MSChlnpSGcoeesido0Zm?=
 =?us-ascii?Q?IrinbMRG4LlHxgd5fH/xA8BAd8UwQjWRoC8U79v09dsSW7hTTjWkeDN9z7rC?=
 =?us-ascii?Q?eeKvSsvKNHnyjIY4int1h5XXtuFlAfgmPS02Vbt/CrDOd5m7IielzUUfPJGR?=
 =?us-ascii?Q?/sB0vSUSaRbtbG1F/rDeK3WD2TQsce9ZplXu8QwoXBhTGHwXNWCxXkMAA5vg?=
 =?us-ascii?Q?mGfjjneTy/r6j08Mzy2Pd3R9oeTC3CK6vgjpqlfgANowtrXJ+bvpcr489MRV?=
 =?us-ascii?Q?CBMxS8UtX111my0s5Ms7p+YWC5JmqMqUYLPYLDLvYCfYaORuT6Pkj0Z6QUWa?=
 =?us-ascii?Q?+CDE9ABgJxIprXsx1H2PCBdIMsFpqhMmrgaTUC+G9qEt/TxahbKMuD5kK9iz?=
 =?us-ascii?Q?cI/UP6COGhqj/eUj0h1Znb0b2Fog+1eOxDP5fmRszr1UwUjEnXWHVseovVnY?=
 =?us-ascii?Q?M5+4DsrVpze/82eO1ana8UKM5j0w9tXedKzhO7VAx+YKRsKNHFTWIsnF2M83?=
 =?us-ascii?Q?uOt8KOHrMy9uAGnvwy9cXdZPlPcjLuOYCcdtBfcZaES9icQDJ/TOHZ8QCoYQ?=
 =?us-ascii?Q?/lGuXkGopAofgreRWTBAyVVkmSKSxdqT3DGehJpDGpOfM58T+cfWHg2UB4Xs?=
 =?us-ascii?Q?yZkd46cfzuPvD4X8snOXJTJXkGmUehwLBJx+aqDLv4wRkYnzEjocDFfDt2Vh?=
 =?us-ascii?Q?FuWIKBhYIFqEmBz0knBLxODCewZOZEnr/y5bbwpzG1qhXfoXrnBLycL7tEQ1?=
 =?us-ascii?Q?DQ2qlUO8B8SZ7XPGJ6/1C/ncSPXnvtL65ZYJwC3p4l2OOX/X6a3hugqA7vwM?=
 =?us-ascii?Q?et2kFIttwYFeRikSq3iaTIDsihweaMrYHfOYOX27mMw1chulxLrwc4xQwh4S?=
 =?us-ascii?Q?NIzOseSF0M9/xTg9Msny4QN/zxHg3keuGO65lKHXugu4GL1aCKI2qID4s3RV?=
 =?us-ascii?Q?jQar44htT//5dCfwgVlfFLqQdphIfmAWxAYVxPMxT1/Pl3MSBwfSETHaK5tf?=
 =?us-ascii?Q?6b34Gb47zc4yv20=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 08:56:59.8253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a317e7b-4e47-4eb3-57aa-08dd5a315bee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6837

These functions are generic and used not only for hardware domain. This
creates confusion when printing any of these panic messages (e.g.
failure when loading domU kernel would result in informing a user about
a failure in loading hwdom kernel).

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/domain_build.c | 4 ++--
 xen/arch/arm/kernel.c       | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index fe05cf6d855f..6531fe019f79 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2112,12 +2112,12 @@ static void __init initrd_load(struct kernel_info *kinfo)
 
     initrd = ioremap_wc(paddr, len);
     if ( !initrd )
-        panic("Unable to map the hwdom initrd\n");
+        panic("Unable to map the %pd initrd\n", kinfo->d);
 
     res = copy_to_guest_phys_flush_dcache(kinfo->d, load_addr,
                                           initrd, len);
     if ( res != 0 )
-        panic("Unable to copy the initrd in the hwdom memory\n");
+        panic("Unable to copy the initrd in the %pd memory\n", kinfo->d);
 
     iounmap(initrd);
 }
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 80fad8b3362c..6eaf9e2b06b3 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -150,12 +150,12 @@ static void __init kernel_zimage_load(struct kernel_info *info)
 
     kernel = ioremap_wc(paddr, len);
     if ( !kernel )
-        panic("Unable to map the hwdom kernel\n");
+        panic("Unable to map the %pd kernel\n", info->d);
 
     rc = copy_to_guest_phys_flush_dcache(info->d, load_addr,
                                          kernel, len);
     if ( rc != 0 )
-        panic("Unable to copy the kernel in the hwdom memory\n");
+        panic("Unable to copy the kernel in the %pd memory\n", info->d);
 
     iounmap(kernel);
 }
-- 
2.25.1


