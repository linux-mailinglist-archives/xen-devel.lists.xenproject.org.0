Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC698894CA1
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 09:28:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700026.1092561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrYZ9-0000ge-0D; Tue, 02 Apr 2024 07:28:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700026.1092561; Tue, 02 Apr 2024 07:28:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrYZ8-0000ei-Si; Tue, 02 Apr 2024 07:28:18 +0000
Received: by outflank-mailman (input) for mailman id 700026;
 Tue, 02 Apr 2024 07:28:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m3oM=LH=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rrYZ8-0000ec-1p
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 07:28:18 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 917a081d-f0c2-11ee-a1ef-f123f15fe8a2;
 Tue, 02 Apr 2024 09:28:16 +0200 (CEST)
Received: from BN1PR10CA0028.namprd10.prod.outlook.com (2603:10b6:408:e0::33)
 by DM6PR12MB4138.namprd12.prod.outlook.com (2603:10b6:5:220::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Tue, 2 Apr
 2024 07:28:12 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:408:e0:cafe::96) by BN1PR10CA0028.outlook.office365.com
 (2603:10b6:408:e0::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46 via Frontend
 Transport; Tue, 2 Apr 2024 07:28:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 2 Apr 2024 07:28:09 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 2 Apr
 2024 02:28:05 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 2 Apr
 2024 02:28:04 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 2 Apr 2024 02:28:03 -0500
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
X-Inumbo-ID: 917a081d-f0c2-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GcckKd2UCKq1hlK4IBDVwpSci/QtGq+mWwAC6rUHNcc587mvCCCnxRf92GfCmY6SU/jB2h1s9faZ19e4qrnGeAVSQkGYkG/Pz9mF7WUtm4pn+NdxSZAK5ve2YR1XiQgArJr0Z6KbwXZixqu2UlTVaMklCQlekDjp7m664VinHlkm9XPzpAhzI1GgjL7k4iuxx8my8GDGFFYUFpH5NCkYooq1LpW/cI4DNABRWpyV3fgjwyK48qVAJRzUf/sIJUhT7FJF8MG/MdavMpobh/hetR/esJxft9IqGwZBgJWCbgNgjjIvibIABGP9uxszGFCXpmENXls8eFRBmKz0AEGPqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N5C4BD1il94gtoJ4MVzbYstUmHjOmvis1l9KSTC2WrI=;
 b=d+nTBXmqC1pMM/H1Uic5JwA2Qoh5AivGE12Hb6yFaowWwXUcyw9owh8S/TKzNtQgeCcVcWfClo5T09p/wtdFSloZdHVlaZiOV9P2UpFPDtT3hZVFvQ4VowGOJPR0Ou9zp5wM4w7AON9xyu1MiIn9gvVKa6TZpYS4FSpZQbaw+/Z6mb9D2MZxrw6SdoEG4+mN0hUmHI9r2I0muexh5ZLSYkx6WNMzBg9Hiel7L6uy60uJyQMapTJD01DXncJD9lnY7zml6RlY1PTJw6+pUjQP22SsSli+Z4VPoXvBdaD5FuKy2qk5Zulo5Z66vhe9aNXiR2eL8N/IqPJriLngXwkbpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5C4BD1il94gtoJ4MVzbYstUmHjOmvis1l9KSTC2WrI=;
 b=PmXqB9NZBMsgM+2glJLXG6cI0f/5kcMcVnkgNnBei+4WGMFz0ubuwmjNeAL9r1J5MTbA2mFH6SLLsagdzHKZAf/k2NgpvLfAup+fzvYvly4lkioQLG3up90lWnHjScKpYGcLXcsdSNpY4oqxtxIQdyDbm8uJgCIPdkLoDf+9EIY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <5681b3e2-2e7f-484f-9ea8-c64e94a97dc3@amd.com>
Date: Tue, 2 Apr 2024 09:28:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm: smmu: allow SMMU to have more IRQs than context
 banks
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Rahul Singh <rahul.singh@arm.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
References: <20240329000822.3363568-1-volodymyr_babchuk@epam.com>
 <20240329000822.3363568-2-volodymyr_babchuk@epam.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240329000822.3363568-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|DM6PR12MB4138:EE_
X-MS-Office365-Filtering-Correlation-Id: 26dd61ea-a69d-4f0d-b50d-08dc52e6723b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WFM6XHuWaK/HKCoD+HG9n6ykmzSjv+w2+l95tZLnwECUgiOp+DdtRKv0V57kJRNe0YcuPilqFCtzpZk5dl0tmiw2flZtLqok2+cgiHROffZbDUZl/vV5Qjwq0TkfzSQvjOfHRVs13RmzRE6gQp6Wm68P01OEm6Shoc9GB0tQcfhPe5TPHF26d/TA1wXQ+SNIS5E1PK7OMWTW9ErrdGFbSzF9fKyYwDpztM/ZYbdppfDOvhIqktLpMfUYNIMT6KuulL5v35qy2M6SdYolnc10Y8NcYaw3MPl+IT4RHBcxvSiaMC43bB9IBXzkz8svbJLfWi+LoIpgODzALUHx0f4cwj7Xjn7Wt4RRHHFTnc623Frdi0YHHZ2JFGo0T2Z6fYWcAqqXXow9k9TgCH+1Dmug8m9TVSalFUIPe2SkqVMfs5AgLYYdFVHJLZpjMEjpE21OOYPKJy6fuKnaOiVkOinZ4T5hbtl057uDbk7VnGHo5b5h/d6R3Rmq1GKS4f5fLa3PGcYRgHZH/7VVZEYISGKtBvt777rQgXqmOZdSUjucxtsjTziElFJaJ2L27bmvXBzmkHNibc+x/HcqBakw5zL4A2n3jJeDsVS3RacRKgZE/IPW5vV/YgdXzCS/Pv3CsGyLXRrSiu4oBMFwNrLwnls43ajomXIMq/75AFWYn2N7JPJrUVfpHLk6eCstvNEIP9qZFg3eufjfei2eglgg/bIRsMK6tKYzK9e381n0ePSW0Nte3i3wESXEK86G4OWh8oWB
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 07:28:09.1770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26dd61ea-a69d-4f0d-b50d-08dc52e6723b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4138

Hello,

On 29/03/2024 01:08, Volodymyr Babchuk wrote:
> 
> 
> I encountered platform, namely Qualcomm SA8155P where SMMU-compatible
NIT: a commit msg should be written in imperative mood

> IO-MMU advertises more context IQRs than there are context banks. This
> should not be an issue, we need to relax the check in the SMMU driver
> to allow such configuration.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
>  xen/drivers/passthrough/arm/smmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index 32e2ff279b..2dd3688f3b 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -2550,7 +2550,7 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev)
>         parse_driver_options(smmu);
> 
>         if (smmu->version > ARM_SMMU_V1 &&
> -           smmu->num_context_banks != smmu->num_context_irqs) {
> +           smmu->num_context_banks > smmu->num_context_irqs) {
This was done in Linux by commit:
d1e20222d537 ("iommu/arm-smmu: Error out only if not enough context interrupts")

However, they also ignore superfluous interrupts. Shouldn't we do the same?

~Michal

