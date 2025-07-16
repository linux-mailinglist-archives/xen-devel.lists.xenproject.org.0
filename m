Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B85F3B0719B
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 11:26:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044991.1415052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubyPK-0007jS-MX; Wed, 16 Jul 2025 09:26:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044991.1415052; Wed, 16 Jul 2025 09:26:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubyPK-0007i0-Jz; Wed, 16 Jul 2025 09:26:34 +0000
Received: by outflank-mailman (input) for mailman id 1044991;
 Wed, 16 Jul 2025 09:26:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zqb/=Z5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ubyPI-0007ho-Al
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 09:26:32 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2409::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f37f6034-6226-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 11:26:30 +0200 (CEST)
Received: from BL6PEPF0001641E.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:e) by PH7PR12MB7454.namprd12.prod.outlook.com
 (2603:10b6:510:20d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Wed, 16 Jul
 2025 09:26:24 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2a01:111:f403:f902::3) by BL6PEPF0001641E.outlook.office365.com
 (2603:1036:903:4::a) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.32 via Frontend Transport; Wed,
 16 Jul 2025 09:26:23 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Wed, 16 Jul 2025 09:26:22 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 04:26:21 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 16 Jul 2025 04:26:21 -0500
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
X-Inumbo-ID: f37f6034-6226-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QsmuuD2TsORX9FafzagX7pjxk//GHUP3gFx1OXStYEnORilX/Vu+uxluJwuKNeiuJo2HHCSomczxV6onT4eESwCz8ioQIgQEfWxMMrE781owThD12in1hWzVlxYXAYn3vEj5N21G9K39nml+zCzcfPR9u841eHSkOKdNwNxPR/PimuPR0Jh9/l0Y8Im5O5quZ/UJFefz1r4aw7Bg+7ePgmv0CkbbHBnV2ypzNBg9RsUBLcIvZ/2XMCH6wGqMuyjD7tTEUciZuPve5tqYwsUOFmXRWbgauXNqqayu4t7KEDPHSE3U76rFIX7oDI19AugJioES1/sP8oeNZqZmDG7zzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVIBbvlBVldvbnAYPQd82C58PM0I0sM9O38oc86q7BY=;
 b=wkBtT72i+VjvgIamRAgKHGwqpcLBgFN45ooh8eBKZlsTGZ/WtVTr75Tvv+Rl6GQVgmxpC0bG2hoVMbrRoQ80CeBk0ofsHio/B+6iW315V6Fz8jEWCf180TZpGPH1DJ3KBb1va8XrPNS1vwsnyBKbL8B4NYLKnEQpy8eJ7vau5QeJoCB4SmWW6x6GJWwXx7PmAORi2d3vd8S97YkDL1XrxvWusmtLeh8oDDd6iimfE3FWbOwG/zV/AIRATuCOp4/ModROTwcKChrEiACe8/iMkER8hgSiRAv/x7ZxPLvyixkOIzVpBn+BIOK905QgLGQ5HE7d2f9GnGRDoZueauqw5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVIBbvlBVldvbnAYPQd82C58PM0I0sM9O38oc86q7BY=;
 b=ATctQVPlP6IiO4gsrKUdPTjAikVhFMHyjtyVrAHjY28PpBcqbRLsRzmdkKkPf0L8yuOt4I8PytUi3+T9Yzl16Kimv6vRwpyT7igbmEQP3QzYYNolzD6c6KyGVhlUieCQLRUr9cPeHcTSH4d/vwt7bVKjIgTf4Z+6z0BgEsNfvh0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <Oleksandr_Tyshchenko@epam.com>, Michal Orzel
	<michal.orzel@amd.com>
Subject: [ImageBuilder][PATCH] Fix DOM0_CMD options for early console
Date: Wed, 16 Jul 2025 11:26:13 +0200
Message-ID: <20250716092613.13954-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|PH7PR12MB7454:EE_
X-MS-Office365-Filtering-Correlation-Id: f62fb3d5-611d-42b1-42a4-08ddc44ad456
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b5/c0J1xxC7IRGrfW5vvwACAYpGGgcRmF+BPIrTxTfNjHtVOD1V/YItTFIp8?=
 =?us-ascii?Q?ammMAQmFXdwU6O4ErwAvXy7aEZWj0SzT76wvP9jpef6rAK6OFUAg/ddKQ8kQ?=
 =?us-ascii?Q?6U5TnJv8Zdl/6U1HtsrmaEb8VosjOszP1E9URMk++336Vkf7ZmLWFggWdhuG?=
 =?us-ascii?Q?41JX//+1l/ZuNJkAcerbq9xEjOT66dGDZSe6B53oQiZGHD1Utkgz+IJoqNzc?=
 =?us-ascii?Q?0qnq/01AHJYfS8ySeXcfGxe/KyI2afZJYZn7R9QvRJ4dJqOSfxIiB5GBpICe?=
 =?us-ascii?Q?4+6Uy6Mbwxhdhxvy5+gDnkQVJOsJG/SuWPlh9h5usEs7LyxCj+ATCAQ8KIsc?=
 =?us-ascii?Q?SyEni29pY8MktHvN97DRbp+qU1+7gtf9L1bi8f6vfkkuZOpGe3CbGB43h3sS?=
 =?us-ascii?Q?Tc0bMMyPkUrUfbVrF4N18zg2F1f/E1JotH3hejkIJHRXFZ7had10CnZee6sU?=
 =?us-ascii?Q?2cExlcaPbKVTO8+u5WjijrTJWScKhc8NgqyNh6eLP7MXyNIHKUTwobLJ2/R7?=
 =?us-ascii?Q?Lhh+pa8RuMJBHqvaKwRfLoaBShr0itJZSNfUQo2X5yg2ZxTh9XF4wDQsfjUF?=
 =?us-ascii?Q?0tWT7fLxD8V64ucC5tk7w/h5dWXqUUcbbkmUaZElv28/kRb3wBOTzlzWIS8p?=
 =?us-ascii?Q?aI6oEintLRlkt4tNuJabA4/VsxWCxRcit8omZmetzwwi5t33u1+zOxIl0ECG?=
 =?us-ascii?Q?F2jYbq8uCkCF7DMlJVpyu2bHpLVeJltcrad4rVDQqegsiCSsBiVswQimrBB6?=
 =?us-ascii?Q?9vBW8zkVC/YIQtbSbgUCEYZ21uzJ+k1BNSlj28IT17zP5Wpld/gv6H4guPb7?=
 =?us-ascii?Q?HcA3wWsrDI7Ag96OgLaVOB3KD8kGcbNNhfIjxIjnY58LrJyVqPbvP51IJeAs?=
 =?us-ascii?Q?vhbyKDNXMqnYxYx6Uh1OQfZtgL07oUjIlRJNj4wTIMWmjMRO/dL45I4QXjU4?=
 =?us-ascii?Q?j4ZBfbgTthD09Qb71KcKs/efe3WCPH7umrCB5nJmAcY3x+77V1dL+3CEkdWB?=
 =?us-ascii?Q?vlXnqLhImyIkG8hBqwaTd7yXu3xRO1F0slpPOkqzblAvRjcVao11qt9FkqOK?=
 =?us-ascii?Q?ahRP5P7Head2XquXKy5Znve73A2AESCXKJZJX3tWgBgKsPwVSd2xuPae1AA6?=
 =?us-ascii?Q?4YIU/FENxEI1O5gJlOfLBSwQe27dkQL8TltQxJbZTwpR8tKIAIct4BxeuYAq?=
 =?us-ascii?Q?9gyypIo95+Kn672tuw8VmvnL7IaP5Gvnk1ibnK4dcOFEr2sa2OIeQJ27/Mow?=
 =?us-ascii?Q?IR8mn7PXA8gk3j083FWvXe0GLrDCioaf6CI1HeTUJUrBNPupk+HiPqcnCtNT?=
 =?us-ascii?Q?aUr5klmHIzzuODTfmX/ojL0Kogh0Tx44K5SQPPGoEZQmMMX6swLTBbSJfyM5?=
 =?us-ascii?Q?KS8QhJisMA5gF8n6ertGTZ51f9epr5GhIgtwINATSGjgZI8hU3AzPS2IvnPf?=
 =?us-ascii?Q?vJkfCOj2+gGEsT/rUYFnvOCP1NgZ7UxM+prji1ql5uvLJmVKCKzbXA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 09:26:22.5086
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f62fb3d5-611d-42b1-42a4-08ddc44ad456
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7454

Fix incorrect earlycon option that should be xenboot instead of xen.
Refer:
https://elixir.bootlin.com/linux/v6.15.6/source/drivers/tty/hvc/hvc_xen.c#L772

Fix incorrect earlyprintk option. On Arm32 (Arm64 does not have
earlyprintk), it should be just earlyprintk which will enable compiled
in (if at all) debug printk code.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 scripts/uboot-script-gen | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index dfa154efaa1b..d451dc22e843 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -903,7 +903,7 @@ function xen_config()
 
     if [ -z "$DOM0_CMD" ]
     then
-        DOM0_CMD="console=hvc0 earlycon=xen earlyprintk=xen clk_ignore_unused"
+        DOM0_CMD="console=hvc0 earlycon=xenboot earlyprintk clk_ignore_unused"
     fi
     if [[ ! $DOM0_CMD =~ root= ]]
     then
-- 
2.43.0


