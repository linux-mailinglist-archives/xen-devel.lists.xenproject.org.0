Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B04B64CC1A
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 15:25:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462303.720471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Sh4-00023F-Ja; Wed, 14 Dec 2022 14:25:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462303.720471; Wed, 14 Dec 2022 14:25:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Sh4-00021T-GL; Wed, 14 Dec 2022 14:25:10 +0000
Received: by outflank-mailman (input) for mailman id 462303;
 Wed, 14 Dec 2022 14:25:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RNn6=4M=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p5Sh2-00021N-Ku
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 14:25:08 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b4dfa8c-7bbb-11ed-8fd2-01056ac49cbb;
 Wed, 14 Dec 2022 15:25:07 +0100 (CET)
Received: from BL0PR02CA0133.namprd02.prod.outlook.com (2603:10b6:208:35::38)
 by CH3PR12MB8305.namprd12.prod.outlook.com (2603:10b6:610:12e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Wed, 14 Dec
 2022 14:25:04 +0000
Received: from BL02EPF0000C405.namprd05.prod.outlook.com
 (2603:10b6:208:35:cafe::f4) by BL0PR02CA0133.outlook.office365.com
 (2603:10b6:208:35::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19 via Frontend
 Transport; Wed, 14 Dec 2022 14:25:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000C405.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.8 via Frontend Transport; Wed, 14 Dec 2022 14:25:04 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 14 Dec
 2022 08:25:03 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 14 Dec
 2022 08:24:55 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 14 Dec 2022 08:24:54 -0600
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
X-Inumbo-ID: 1b4dfa8c-7bbb-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FRH/j4oFBLyXnD/qELhnEXEwIvNooFbanKgRbYE/1iqulMlSCAZs6bf7vbSoyOi5+1pTfJ1FHjieSwxoCpJ3zqw7DTc5JIgGG/O7Krxk2vZgj48xJYC25JJ0SdBqnltChzp1hW60ErwdtUuLq/Z7yBqNB7kepRseMyiYIYTPmJtSqwEjLGXI43JLXjto9GRFG6gYRhkszZuOuhT/Im5iZGTsbQe9NV1/ubc5sNYElgAG4/xkmzELZ01R8bNpzSHWv82YnScQp7MGnnbVBk2nSHEJxHvk9jIOL5nK0mvUDD+5WUrELHSgxMVU+HQpMRl3ckCvNMRylAxE3QOivOY6Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rViC0E6/8AxUopNptHfoO3R1Lvi/izGcKZXYR4IMSb0=;
 b=axzh4JPx9QXNx/yLZxDcZYfJei8K5ujkFYc3j/2LtCodFlAZBTrW2Mv6vOzeF+8Yo+tbETh2+NiHCGVCEwQ4U/9g+IXZv304TKwEFs/VbE60wrHQUQwjyIWTD99NlQtqt6cpHYYj7XfWvyOVoyiKPreU5Evs4oWQoxDJyRv1koKiSlr9XbiwhmkQO7rwi0U2r7cjDde5zhuWqA03+wKRkxQ8l5ZTM0INOzoB7WidKrXSipfrUwbbtwc1cUjKEHh44i4Sm6SYacXRNeADbRkLLLP8zoW9bcwNwj2Jr/o5qTwyw+u1znT46cJo67hukcjeiec4CG6ttzKgqcR4QrxvfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rViC0E6/8AxUopNptHfoO3R1Lvi/izGcKZXYR4IMSb0=;
 b=tgO42psWPLbY/1VOZC4ohs58W7pxOksLrh+Ogh7xQCXiOcYZWzX47Gp6/f6WLy9VQG24RpUdcF4m73m2jz+3t1yx1c2hYXmQiAW0Raszi5WZA14QrceZ24RfRfhxTwxCoU4WBI2fNRmxTQg9Qfk+EpPTMR1QsUJvqHKnv4Jg5ZE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <95e9eff5-038d-923f-1afe-4f2d72bde5b3@amd.com>
Date: Wed, 14 Dec 2022 15:24:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 08/18] xen/arm32: head: Introduce an helper to flush
 the TLBs
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Julien Grall <jgrall@amazon.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221212095523.52683-1-julien@xen.org>
 <20221212095523.52683-9-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221212095523.52683-9-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C405:EE_|CH3PR12MB8305:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b5c7c2f-ec02-4416-6da5-08dadddefe24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A1MFb8kz21DrfwPrctEGGTH57hXSKHi+bS01DfdDQsONNa/k5RSl0ReJqpeBxxVQ5FRIIT1ydzcDYJbIFty3MHek1/+U5loc6lP0mWBzYzzoJWT63OPutMAb8kuVXLnVCDOloOqAMkybPiflzZ9ImHA//sGyYGMttW9TNbwDD/dpahGtQVU5InJyM8JjLAZvAj/00iOOGQOMkkPwvpvkHYzWrLaBpwXhjw8fFW60ylo2qSnvddq3uF8sKOz+fCM2lnibF2XgJW3cA/B5XNn7wjUlW1mTxarML0boiNh1eGXSdHMqh4XWpfoEqOe6s08Eo/ogOYbdvJXYbwTvedWVXnyjL5qcxa1vR1DMdiYtKgaiLz7cQVXZnK5WKsXsyM1gf3p6wCC1yohjId/PFZJHfmyLslOKS7PVHTY1a4UUUb3/TgBJVM/jsCozOdiNS0CvYMvkG1WeFym9+BHGMvzDWXD1kF7nrP08XcTkN3Q0QNR3o1bZoSxNX7xdRZQboA48ZdVM41bLdJUtJ9GSlOhLglcOPyxpuBGtbLwlDkU958DOcoGZPbe1egOrj8W5t6yKOAgbbBw8qsY9Noec1K7FPSf1ktopj72xkm471rSuwp10ydDlY3n9F8oOV2hXJEjTNC5qzCdUMWPaEu0HOQwpo359W8BcNXRAvg23cNv0cGQCfuRjhymwIzOJT5U0F0eYNoezHyCpTKdUzORyUKx0UXhZTq4nyfh3okktK1kdHVL/VSPJnlmCoDK3mjq/b1Mrv3SfD29z0bjGyWJZ+4C2ew==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199015)(40470700004)(36840700001)(46966006)(36860700001)(82310400005)(336012)(2616005)(47076005)(86362001)(426003)(31696002)(40480700001)(83380400001)(40460700003)(36756003)(356005)(82740400003)(81166007)(31686004)(44832011)(2906002)(316002)(16576012)(8936002)(41300700001)(70586007)(70206006)(5660300002)(8676002)(4326008)(478600001)(53546011)(186003)(26005)(110136005)(54906003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 14:25:04.2156
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b5c7c2f-ec02-4416-6da5-08dadddefe24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0000C405.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8305

Hi Julien,

On 12/12/2022 10:55, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> The sequence for flushing the TLBs is 4 instruction long and often
> requires an explanation how it works.
> 
> So create an helper and use it in the boot code (switch_ttbr() is left
Here and in title: s/an helper/a helper/

> alone for now).
Could you explain why?

> 
> Note that in secondary_switched, we were also flushing the instruction
> cache and branch predictor. Neither of them was necessary because:
>     * We are only supporting IVIPT cache on arm32, so the instruction
>       cache flush is only necessary when executable code is modified.
>       None of the boot code is doing that.
>     * The instruction cache is not invalidated and misprediction is not
>       a problem at boot.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Apart from that, the patch is good, so:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

> 
> ---
>     Changes in v3:
>         * Fix typo
>         * Update the documentation
>         * Rename the argument from tmp1 to tmp
> ---
>  xen/arch/arm/arm32/head.S | 30 +++++++++++++++++-------------
>  1 file changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 40c1d7502007..315abbbaebec 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -66,6 +66,20 @@
>          add   \rb, \rb, r10
>  .endm
> 
> +/*
> + * Flush local TLBs
> + *
> + * @tmp:    Scratch register
As you are respinning a series anyway, could you add just one space after @tmp:?

~Michal

