Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD5E791641
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 13:30:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595097.928589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd7mR-0000Ru-Ux; Mon, 04 Sep 2023 11:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595097.928589; Mon, 04 Sep 2023 11:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd7mR-0000PW-SC; Mon, 04 Sep 2023 11:30:07 +0000
Received: by outflank-mailman (input) for mailman id 595097;
 Mon, 04 Sep 2023 11:30:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ceyR=EU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qd7mQ-0000MH-SP
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 11:30:06 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061d.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63f6889e-4b16-11ee-9b0d-b553b5be7939;
 Mon, 04 Sep 2023 13:30:03 +0200 (CEST)
Received: from DM6PR03CA0020.namprd03.prod.outlook.com (2603:10b6:5:40::33) by
 LV8PR12MB9450.namprd12.prod.outlook.com (2603:10b6:408:202::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 11:30:01 +0000
Received: from DS3PEPF000099D6.namprd04.prod.outlook.com
 (2603:10b6:5:40:cafe::ca) by DM6PR03CA0020.outlook.office365.com
 (2603:10b6:5:40::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33 via Frontend
 Transport; Mon, 4 Sep 2023 11:30:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D6.mail.protection.outlook.com (10.167.17.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Mon, 4 Sep 2023 11:30:00 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 4 Sep
 2023 06:29:59 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 4 Sep 2023 06:29:54 -0500
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
X-Inumbo-ID: 63f6889e-4b16-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GC81OpH/MYEyGh5toYYr3n1dz1oYk9DEfT8crgOiRNN/Gv5C98h8awfkUXSKeFgCN5uCjTcHOdJb7ArP0YnPxDZv7pcbR8tF4JSTvCZmxgFf5/39StJmXG9e/fWI3b1BcHEtCTuZsqaXYknLCep8iMSuMUPq841Pj73eaEpU32rP36FiBA5c/kBSsxHa5A7SXyUPZH/dldrgMSkeLOUcYhBmTy6Whk+o+c5+/i7OWqvBQOURUGPsfSHsszKIlHBdPbN86mFsN74eMnjLvOQ1U0USQ899txbTR6Q6WFGkZGECy3dnZhTckQFu10m8b7kP2/I8bZE9LBxA1uAiFbDvkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYYP8czLRtpn3KnDUAftby/fdRS1lsK3Pmv3fpWaVS8=;
 b=BkU4rTJudcxku+yhLsEy4pUd/D29U0ecCLXTVPbN3VAR2A6TnWphP77aGXdWjIAMrpKlqDgcFtA4tjV5TK6Lxi9cu6wG7GSUNc8N3v3SABNzojpd9Rex9reIQo5X2AW1ww2lqR2NRlHH2JoWRpc8sI9QD4lrARJKiqz+wL6qRYkYaGwVjsmmCWNo7+hMJF1lbmgjr//z0UDJRXG+l3Zo6zV1Sg3ck6DVQoR8dHdreO+5yu9E8LMHcpY1o+u2LfiN/kEsCsHJGhCkgjUi3JnMJw75iggk3x8SB1nEGa12CJJabMyLrrhO7nPUxCPp2N7oIJjrv0/olxxrHh1yQXekPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYYP8czLRtpn3KnDUAftby/fdRS1lsK3Pmv3fpWaVS8=;
 b=NAj54o0rY3klhP1Px7vzG+X8ho4cjNdCA7O96npX6bTT4J2IZvcIP+Lbme50bUDR/arLWBqRP+lD3JK+HbZpHuRfPZoEfISM0TxqioG2rj/MxGDzpeeMmYAtV+7vqyXrNckUqzNBJYBrG3rQtWGwl4jAEEMHMBviu5JYx2JRqVE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <eb2c932d-c096-55bf-aec3-a8e311f4a6d7@amd.com>
Date: Mon, 4 Sep 2023 13:29:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN][PATCH v11 15/20] arm/asm/setup.h: Update struct
 map_range_data to add rangeset.
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230901045947.32351-1-vikram.garhwal@amd.com>
 <20230901045947.32351-16-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230901045947.32351-16-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D6:EE_|LV8PR12MB9450:EE_
X-MS-Office365-Filtering-Correlation-Id: b7c2cbab-9f72-4bb7-4255-08dbad3a4664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/2XMKfKAlx2kE+1d61O6mwkxFKAohnL7VnMgnqYJQVmAbuejwH7Xuu8h6hsS0Y5VIl8bTz3tkQNo778GOPVbZAxT4qJWMWXFG01PvYVbialLw8ikz/Nn9yAPCRKz38bNQ0Fe1aB4q5WyhE2G6T4KvSEd6/XQE7DOWaahLgZjNzemed5ZRd883YBPSYaTgGBjNi+BxifkIBbyYXTr0Ppc/XKpJdHfP3ei/zz7OOIn9AnA+ELlz6uppf+7PBzJ/qM5UD/wBC7NTaNCg1z9/mA6kATmNBh7l2E+wseTYV8uUgQi+on+tUCXFz9FTyhtpW0yPchavFB/gWqjBy1Gih9ukoVmPHiFofHzrS1fGNdPDdOI3YdW0XY3GWtmbXZ2NlKWzecYnvRjjZgLXg4FGAAKFvWweSHWVm78Yv4S1U9sGqC58w/Mfzi2Sgryqhzo1ltWzYkPaa/dXUAWfNZiuXdgCvEKwWfGK7Dvv+WkU8xKHKGmEk0VhOxQ69pxPAUW4obmFGXQ2kdHRxfVmL6UaW0rajEyziWRj0QrUNoUpmqukRnCbthS5d7FLd9Ar3YdeIz0PLiilE02dCd3rkDpC1So3jP1bkuPH/JRFCMSMk9KhowbiCf1gUqkyi+NJEljfkxfAcCXrwhhFNX5xiB+TzyTz/oruavXNTfckHtU7XIlb3gqam0KKneYydrr9g7R+K7sS6zEIbZbAeVkRa47VLi/MG1T2HyZhI9ExFsPULgl8qVZOmBbSQ9MJutNEoGuBEQcBD7Y3K7AlcqG7LyEjtQDn0CivI+1vHJNCORP6KjTOrIjLi4tIpOaVlOB/PIwvt5u
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(346002)(39860400002)(136003)(186009)(1800799009)(82310400011)(451199024)(36840700001)(46966006)(40470700004)(41300700001)(40460700003)(53546011)(356005)(478600001)(82740400003)(81166007)(83380400001)(336012)(2616005)(47076005)(426003)(26005)(36860700001)(40480700001)(70586007)(2906002)(110136005)(16576012)(36756003)(54906003)(70206006)(316002)(86362001)(31696002)(31686004)(8936002)(5660300002)(44832011)(8676002)(4326008)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 11:30:00.2960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7c2cbab-9f72-4bb7-4255-08dbad3a4664
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9450



On 01/09/2023 06:59, Vikram Garhwal wrote:
> Add rangesets for IRQs and IOMEMs. This was done to accommodate dynamic overlay
> node addition/removal operations. With overlay operations, new IRQs and IOMEMs
> are added in dt_host and routed. While removing overlay nodes, nodes are removed
> from dt_host and their IRQs and IOMEMs routing is also removed. Storing IRQs and
> IOMEMs in the rangeset will avoid re-parsing the device tree nodes to get the
> IOMEM and IRQ ranges for overlay remove ops.
> 
> Dynamic overlay node add/remove will be introduced in follow-up patches.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> 
> ---
> Changes from v10:
>     Replace paddr_to_pfn(PAGE_ALIGN()) with paddr_to_pfn_aligned().
>     Change data type of irq.
>     fix function change for handle_device().
>     Remove unnecessary change .d = d in mr_data.
> ---
> ---
>  xen/arch/arm/device.c            | 43 +++++++++++++++++++++++++-------
>  xen/arch/arm/domain_build.c      |  4 +--
>  xen/arch/arm/include/asm/setup.h |  9 ++++---
>  3 files changed, 42 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
> index 327e4d24fb..1f631d3274 100644
> --- a/xen/arch/arm/device.c
> +++ b/xen/arch/arm/device.c
> @@ -165,6 +165,15 @@ int map_range_to_domain(const struct dt_device_node *dev,
>      dt_dprintk("  - MMIO: %010"PRIx64" - %010"PRIx64" P2MType=%x\n",
>                 addr, addr + len, mr_data->p2mt);
>  
> +    if ( mr_data->iomem_ranges )
> +    {
> +        res = rangeset_add_range(mr_data->iomem_ranges,
> +                                 paddr_to_pfn(addr),
> +                                 paddr_to_pfn_aligned(addr + len - 1));
> +        if ( res )
> +            return res;
> +    }
> +
>      return 0;
>  }
>  
> @@ -178,10 +187,11 @@ int map_range_to_domain(const struct dt_device_node *dev,
>   */
>  int map_device_irqs_to_domain(struct domain *d,
>                                struct dt_device_node *dev,
> -                              bool need_mapping)
> +                              bool need_mapping,
> +                              struct rangeset *irq_ranges)
>  {
>      unsigned int i, nirq;
> -    int res;
> +    int res, irq;
You could make use of res to store irq just as it was done before without introducing new local var.
Anyway, if you think it improves readability:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

