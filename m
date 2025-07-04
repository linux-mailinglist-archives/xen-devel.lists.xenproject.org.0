Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E54AF8A29
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 09:54:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032941.1406368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXbFq-0002Gi-UR; Fri, 04 Jul 2025 07:54:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032941.1406368; Fri, 04 Jul 2025 07:54:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXbFq-0002EF-P7; Fri, 04 Jul 2025 07:54:42 +0000
Received: by outflank-mailman (input) for mailman id 1032941;
 Fri, 04 Jul 2025 07:54:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aOXq=ZR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uXbFp-0001zt-La
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 07:54:41 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20626.outbound.protection.outlook.com
 [2a01:111:f403:2418::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 236f65dd-58ac-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 09:54:40 +0200 (CEST)
Received: from CH2PR14CA0043.namprd14.prod.outlook.com (2603:10b6:610:56::23)
 by IA1PR12MB7543.namprd12.prod.outlook.com (2603:10b6:208:42d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.38; Fri, 4 Jul
 2025 07:54:36 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:56:cafe::86) by CH2PR14CA0043.outlook.office365.com
 (2603:10b6:610:56::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.22 via Frontend Transport; Fri,
 4 Jul 2025 07:54:36 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.20 via Frontend Transport; Fri, 4 Jul 2025 07:54:35 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 02:54:35 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 02:54:35 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Fri, 4 Jul 2025 02:54:34 -0500
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
X-Inumbo-ID: 236f65dd-58ac-11f0-a315-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QRVnDUpDE8Mtk7kkD5w2Ok4Mn74RFYaCYMahDsAC7em7AxkCFOppdzyDCr6W/yY+xOFKi2d8p71HWofTfq1yHyxByHZsAIts4TFMeIxs6Z9pfAvrq4YK/V3iKOPoLwEHlbg33fawQTasnZHEZMtyAOA8gssZ2PNjp4Wc7KxIWhDMpRdswHK5g8IV602AktncWyOWbDTt5uWVMorHJHKUsg7KTkvivr1r3Vrti11gnwFoKN5sIhJZcp42Y0QuSrs68+64fvOt1U+LeFi1N4rbPqx4LM9i14E/WaOp+VHonHFsa2uyyB4aXmszgdyFghZRLX5eUQjN3v+P9FTJD8cGnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0IBfdC6Tm1Qv/CJzlHXWpGpzVGi7GarsMLS4AsB0Ws=;
 b=ElrQSfzre4Taz1GCc9I6ACDVnxJfqFKw45+qQ2HTW6gHR5cDzBJI5s7eZFQmEX9C1tspsInMmrer6kk2vkURca9CdFewiEyQRJgBkJjY4VhqCFDaeRDp5IZkTvNs2mUpy7Dj66R/e9esdo/nryLbCFEvLStgwIhl4I9wg4dJouY6Fuq1iMdkZpCPh82fHocQ6yEQPTLMQx3uPuSqHS5bAsuSzbNg5GQ4DKbmFemDOP6s22HWuobZOfBzxGh7OLuQR8LYJJGltNdOaHRC4PDnuSyBMtjCoisHgDsvwn6txlIo6QCTXRRS+7h3xqjFd8O9NqrSSFDlzI4MKseVXeDVog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0IBfdC6Tm1Qv/CJzlHXWpGpzVGi7GarsMLS4AsB0Ws=;
 b=PB1UbRWeEB3oeoJfZ7+7CoS3m2rFcvcKyR0WltlYm7cvu+s+Cm1/ULjZvE3Uwhkiwuj3zQVIX3z6IOotNkPFMPn3Yd6EWlA3tCF4DjJJZx874MLIS6/n+MWaHBS5VVZLKwogW6LjS38zZqBqLdUXCRMu+JpBD0UE/O3R2m+C8BE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/2] xen/arm: Skip loops in init_pdx() when no PDX compression is used
Date: Fri, 4 Jul 2025 09:54:28 +0200
Message-ID: <20250704075428.33485-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250704075428.33485-1-michal.orzel@amd.com>
References: <20250704075428.33485-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|IA1PR12MB7543:EE_
X-MS-Office365-Filtering-Correlation-Id: 251ec622-6679-4e2b-810e-08ddbad00539
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zOKbmCRpGU3DZAX+ZMcJCYyJRSrtSsAkgvxkZV2VaQFapwua7sEkdoW7YWKy?=
 =?us-ascii?Q?DqJ8nIiaJ0HgUa07C5d0vu+pWroxiLg1jTUANVHSPSJqq7guUinMaL5UROeX?=
 =?us-ascii?Q?WVBPoXRcbUlUz/JdqI8mqYi3Vg14HDVKMtOYOU0klgs5DUXJIw/eAFDlv7iE?=
 =?us-ascii?Q?PEsXOh1hP64NmWvDUMsvOPQyO1KRtv71FK3CWPn5vDsiy874mtifxL9bu6hw?=
 =?us-ascii?Q?E5NN0k0UlGGQXNrkbXMXfegVUT9UkvMrfGbyfdLAg4JcZGKgSHC/Uh6QyVWQ?=
 =?us-ascii?Q?z/sSg/Doh5tuJEAjMTvmM+W/M3nHsb8nfub0Fizg3qWhmcCWIurc6LjXP/uh?=
 =?us-ascii?Q?sD95WTVRIvI3DMhL8WwgciuFKBAD6vGt5pDykG/Nm8isTlzF+/hElhONd99+?=
 =?us-ascii?Q?Z/NWu9QACtE7eqO0f5IiZECyElXnVRtv+8/hWC1bmpgCzZKtu8zVjumuzLNG?=
 =?us-ascii?Q?mZDE2GfD/2lOHpX1+4qPPsfG5ZJEWfpOa03ZgouuG3wSb8pt/fmZmeWAZulP?=
 =?us-ascii?Q?pHwS0qoKrfaf/KHj09pAz+uqDaxpAi3lGQkNTOARIb5ZVWHzFb4lQuMjpyzc?=
 =?us-ascii?Q?7DscCWIW17dk/JUq48khAf1TtBAmSAIZrPhogc8KMVYOnbak2p4En3Wh8Q/H?=
 =?us-ascii?Q?LAKYMviXNKUz4kEK17Hwlk3cB4oBP7+EOnMKOztEEEKzlHZTIGupnstQ9s48?=
 =?us-ascii?Q?3YggYkFaTwklfbvdn9NbTO4NijlFIdwm5NLzN5lAyPHz88JmaZcKVCKu9vKQ?=
 =?us-ascii?Q?ybLChRN2GEQmnPch9ywOkxd/alBv22LTap/w1ngRTl0aCZg8qE4kSltKG4JK?=
 =?us-ascii?Q?6PpT/NAhUMfN9roHnpqYZqXhcal5lw68NCpWCPG1SyFTGVhRYwr7tdpt+1Ya?=
 =?us-ascii?Q?qVlekOmPJOeDYZQruNa+FU2ZV9d8s6YqVZAdnQBC2sle7dbFR3uTJb6Vwu6R?=
 =?us-ascii?Q?7eJ5baav1ZGj9ZJJ9zlckt3vNGWb3+/WamhPEjiTlGb/FNb97sZdVqdiBpGW?=
 =?us-ascii?Q?64yz7l0gj1tp1eoUbvdLlU9IGQasNELT7kSVDHN+cT1EmK+j4ZD/x86+qNxa?=
 =?us-ascii?Q?p3xpizKbdJrxFV8vMog6vq/c5qchfdJ6jduri5eWk8CD6fZwYoLm2lnOcc33?=
 =?us-ascii?Q?eTpsNFZwQdwNDY3QaGcH1a4m2F01RMa7wXZd2J+aZ2F9sAbBpUFAazfvvHXw?=
 =?us-ascii?Q?pm30BPWBH9V+d9eIXmskUO1Q9uO59ZCpjCK+gDDOG4wu/DJumPF5P/k/77j7?=
 =?us-ascii?Q?ZqwmtvnRhkU5D3X3rs7jSReIIo0OuEEmz87BDniUwVk3phnyukn6s72EFJcU?=
 =?us-ascii?Q?8KQNmdWycL52YJZok+4lx0jPsuknJiRnAFGhT5ExDqYP67hL9GgLwLy84Kvi?=
 =?us-ascii?Q?VnsKsUezqnPzKYNY3cbWdmDtT8IWbxNAeXGAusApcFTzQ9PjxpwgDoNlT+1d?=
 =?us-ascii?Q?EdUXMwsz3hDL+gKUj0jSrcYuZF9wS9ndt9WcnYC+TJq10wfghTwX1W3f3yHb?=
 =?us-ascii?Q?JMOYtEcREYDxcRjc/hc4MFcEmNF4XX6BKew6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 07:54:35.9552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 251ec622-6679-4e2b-810e-08ddbad00539
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7543

When CONFIG_PDX_COMPRESSION=n, pdx_init_mask(), pdx_region_mask() and
pfn_pdx_hole_setup() are just stubs doing nothing. It does not make
sense to keep the two loops iterating over all the memory banks.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/setup.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 93b730ffb5fb..12b76a0a9837 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -255,7 +255,9 @@ void __init init_pdx(void)
 {
     const struct membanks *mem = bootinfo_get_mem();
     paddr_t bank_start, bank_size, bank_end, ram_end = 0;
+    int bank;
 
+#ifdef CONFIG_PDX_COMPRESSION
     /*
      * Arm does not have any restrictions on the bits to compress. Pass 0 to
      * let the common code further restrict the mask.
@@ -264,7 +266,6 @@ void __init init_pdx(void)
      * update this function too.
      */
     uint64_t mask = pdx_init_mask(0x0);
-    int bank;
 
     for ( bank = 0 ; bank < mem->nr_banks; bank++ )
     {
@@ -284,6 +285,7 @@ void __init init_pdx(void)
     }
 
     pfn_pdx_hole_setup(mask >> PAGE_SHIFT);
+#endif
 
     for ( bank = 0 ; bank < mem->nr_banks; bank++ )
     {
-- 
2.25.1


