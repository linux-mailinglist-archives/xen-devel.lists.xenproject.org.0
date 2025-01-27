Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0154A1D4B4
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 11:46:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877646.1287807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcMdB-0002yP-HK; Mon, 27 Jan 2025 10:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877646.1287807; Mon, 27 Jan 2025 10:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcMdB-0002vx-EL; Mon, 27 Jan 2025 10:46:13 +0000
Received: by outflank-mailman (input) for mailman id 877646;
 Mon, 27 Jan 2025 10:46:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rEBS=UT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tcMd9-0001ah-SQ
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 10:46:11 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2412::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eaebcf9a-dc9b-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 11:46:10 +0100 (CET)
Received: from SJ0PR03CA0264.namprd03.prod.outlook.com (2603:10b6:a03:3a0::29)
 by CY8PR12MB8194.namprd12.prod.outlook.com (2603:10b6:930:76::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.20; Mon, 27 Jan
 2025 10:46:05 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::f9) by SJ0PR03CA0264.outlook.office365.com
 (2603:10b6:a03:3a0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.23 via Frontend Transport; Mon,
 27 Jan 2025 10:46:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Mon, 27 Jan 2025 10:46:04 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 27 Jan
 2025 04:46:03 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 27 Jan 2025 04:46:01 -0600
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
X-Inumbo-ID: eaebcf9a-dc9b-11ef-a0e6-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QsgZ8r2Dz7Q35lkSz6Z8g1DXwZ/2X86QNaFDbTn4nrzXAPIi1YsZOePzwMdyWU76HU0Bo/QUq3sB3Vc5Ef6o+gFR9Urkw92U68q5yOLBbLQpxtgz36rMowLFKfls+IlGxt9faH9u0xGvghHGVzDrn9ZOj9KBFvkPeTF2wNaOakGPG+q/uiKhn6pxQVt6Z8FF0yQ4pWnG9/hS1IoAHJ70EvufnXhtTwnNxFlZ/MyGXdXtIXBtpG/X/M8HW6CJZSAvdMpxKkKtq83Gu1eTUSmdkWzX/+EutF56K0CcUKkV6N2EeXX4J+Ge7lObJlYn/frE/Msx2Wfb0+XsOvQRSGfdBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0FlS5NYMJkshnxGYQIzdg2iyP5nY3U9hAQSCfYUR8ds=;
 b=kgO8clTeM3LzqczldlrZ12+0uGBiwFlHmw7seZX/sPazCUTrzmqzbA6ddLZFMyy2deLIT4WrdvteYnogNb8sbKcxy48/9EtM7DJxl8+AYC2lfij/JQni3EcRjkKSDxVac6RLJh+7pzbleTKvlitZNf2aWer8NzapASb59uDH1MBA4aX/1JS3/17m/ICdY639szVtqWYl7r1ydlOYQQOmSN76HxKXeT0xN0vhkbwmwILoL0RR97caMVjIIFxW65jLzaOfxZfnDF2rWM7R2pwlhtL0f2GUWPEDNdmc1IT8gQwAzTxqCjhpAFvFf5c4K//OlmZN8tysqmoL4lYVb9QuQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FlS5NYMJkshnxGYQIzdg2iyP5nY3U9hAQSCfYUR8ds=;
 b=3Z7mHjc3KjZfh94vEQytbv+evGMcgrR9Rymz0L91Ku29ScYTOOdene3egyMurVH35QGN4Yz+CMmYSaAwgF5gU8fdmYtyapfzy9tS4U1CMIPTopQGfjYJhTgSz2QMBiweAsQI5u2hV1DN+KKdE/rnIiH5/x87IfeMPC5NJ+YVBgg=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<oleksii.kurochko@gmail.com>
Subject: [for-4.20][PATCH 2/2] xen/arm: Fix build issue when CONFIG_PHYS_ADDR_T_32=y
Date: Mon, 27 Jan 2025 11:45:56 +0100
Message-ID: <20250127104556.175641-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250127104556.175641-1-michal.orzel@amd.com>
References: <20250127104556.175641-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|CY8PR12MB8194:EE_
X-MS-Office365-Filtering-Correlation-Id: fc186281-1563-42d1-3486-08dd3ebfccb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e0U7RTw0MEZqNp4EiOkfZQlRiY9jY7dsPkbX2lwz7Pdzk8o4+HiNm6itsKCa?=
 =?us-ascii?Q?lPt7C7kqo+qNugRNhQF9k0qYd0dD8EzYgMtYaDcDJEJlAtEA1Uvt46iopz7w?=
 =?us-ascii?Q?4afNOdlDd12gE7V+Z0BKJLJnmw3feSl7eqYLgH6NOWxjt485jmF+FVt8Fjjc?=
 =?us-ascii?Q?/pspQpp+Tor3mAy7n6dlOQjD//HCBR+qMLGvS+jWe/Kg3R2oEvbMw6P5Z77w?=
 =?us-ascii?Q?+aAhAakZYWu/l1IEemS9Zvl2yk7Aw00IBbY5/CXIWk+SufRnR1zht8BgEi+s?=
 =?us-ascii?Q?Ajv3ABcpZp1eyJO8RssMxzVqJsNHwNJygyMtrHlvbPRrnVNJ4a5BwLhrHLMr?=
 =?us-ascii?Q?A0DrJJ26ATEfuw/Dwx2D675OeO53QHqBuwUdwhKxJWZQa6qK4DsF4omm9xTF?=
 =?us-ascii?Q?8Wxi+nRbrdn3RTw56nZhq/Nnsgq5MXOEeTrlX3zhMsvSfIAMSxl3+vwqTzIW?=
 =?us-ascii?Q?E/fd+lc0Vd549Urx1E6l/Q3krezm2twr+WGXEvRV/RxHD8TtaYvYGawJbPTU?=
 =?us-ascii?Q?P+IB3zmSNkls/aik6RGI1ntcfEEooNnEinxkEH56abkD9st+Jod7wuImPTAf?=
 =?us-ascii?Q?5PYBO3J1H65nuVufv+qf1bUEdZVwz85cueMckXI/rqIg07y6yKcUU0iSnuBL?=
 =?us-ascii?Q?z2E0JznlbmD/mkXrEcGLyIwMq53/7/OL+lH1JyoqDaohrRtxWHKd3gj4x7Oj?=
 =?us-ascii?Q?lmaWrzXK3YJNtlWMsOstsY2z9Xgnbs5depiMIUBkP6TzDBwdDISFNZMwiJWn?=
 =?us-ascii?Q?t7DUMMNqYVbGWguvVUlon+ZOY3fSh4zZyLI5d0kMBppq5i8vWE+qg3gxyIAU?=
 =?us-ascii?Q?UrsInUBb9C7jxP9lQIRM0rgde36aPsjr1ROu83v/6bpvz0Rjce30Qg2chICR?=
 =?us-ascii?Q?DJxHLtVRSy1JbkZEzzjz0M/w7ubCd+Dns1KaTYDNQGZZvBDH5aybgCCKbXCn?=
 =?us-ascii?Q?Tgft2iYv+REyT78CIpXtrU5rKArTaTCWmYizxvVSiNl6rPkuY2DJWqPEtLsX?=
 =?us-ascii?Q?/nYZ8oWzbyQzCyqPNMH0PZwcDon12vlIoAcnw61f5fNR+RB69+34DShkLqFx?=
 =?us-ascii?Q?aVqM/Myue0RY3aJ48POIxSBF6VnYY7z2FEycGAWma/eDr+7p2Jg752cT8ZCr?=
 =?us-ascii?Q?WKxGoyOim7vWkrAhLdVRFUQkn/z4U6pLct3BVlKYgh7Yle+pYDLehidnIOqC?=
 =?us-ascii?Q?pgHBp0XZA8bDg6HoPIHuQKA20RERveyPa97lotpA+oS1GcnVpl4AcZM41pjC?=
 =?us-ascii?Q?ElnoERPxbHEbMOHM6CCW3anGiuEq2RNnfIz9P5j6Xt/8cau4yMvRutsrN2ze?=
 =?us-ascii?Q?kcmTY0Bg5e7d8H1Ty5mK/CqY/Gvf3HApX3CTerGLiga9p2yv9PTmbd8QnbZB?=
 =?us-ascii?Q?FScI70ReCtqB4gwke2o09Jd2YLrfC51ArrNUFud7aCucC9JJ368Mdfu3w9K+?=
 =?us-ascii?Q?uXpfmMaCssArM9H5FMehs6fEMBt+6ro1D6vtENoIhU5SN09yP4yhBRKt7KxN?=
 =?us-ascii?Q?NJlLfReDqhLjlzI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 10:46:04.8862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc186281-1563-42d1-3486-08dd3ebfccb5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8194

On Arm32, when CONFIG_PHYS_ADDR_T_32 is set, a build failure is observed:
arch/arm/platforms/vexpress.c: In function 'vexpress_smp_init':
arch/arm/platforms/vexpress.c:102:12: error: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'long long unsigned int' [-Werror=format=]
  102 |     printk("Set SYS_FLAGS to %"PRIpaddr" (%p)\n",

When CONFIG_PHYS_ADDR_T_32 is set, paddr_t is defined as unsigned long.
Commit 96f35de69e59 dropped __virt_to_maddr() which used paddr_t as a
return type. Without a cast, the expression type is unsigned long long
which causes the issue. Fix it.

Fixes: 96f35de69e59 ("x86+Arm: drop (rename) __virt_to_maddr() / __maddr_to_virt()")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/include/asm/mm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index f91ff088f6b1..a0d8e5afe977 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -263,7 +263,7 @@ static inline void __iomem *ioremap_wc(paddr_t start, size_t len)
 
 #define virt_to_maddr(va) ({                                        \
     vaddr_t va_ = (vaddr_t)(va);                                    \
-    (va_to_par(va_) & PADDR_MASK & PAGE_MASK) | (va_ & ~PAGE_MASK); \
+    (paddr_t)((va_to_par(va_) & PADDR_MASK & PAGE_MASK) | (va_ & ~PAGE_MASK)); \
 })
 
 #ifdef CONFIG_ARM_32
-- 
2.25.1


