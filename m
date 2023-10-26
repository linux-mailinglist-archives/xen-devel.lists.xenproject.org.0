Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 832417D7D35
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 09:02:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623507.971403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvuOB-0007wU-RH; Thu, 26 Oct 2023 07:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623507.971403; Thu, 26 Oct 2023 07:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvuOB-0007tk-Np; Thu, 26 Oct 2023 07:02:43 +0000
Received: by outflank-mailman (input) for mailman id 623507;
 Thu, 26 Oct 2023 07:02:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I5Mm=GI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qvuOA-0007tc-30
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 07:02:42 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20623.outbound.protection.outlook.com
 [2a01:111:f400:7eab::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5c95729-73cd-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 09:02:39 +0200 (CEST)
Received: from MN2PR20CA0050.namprd20.prod.outlook.com (2603:10b6:208:235::19)
 by MW6PR12MB8952.namprd12.prod.outlook.com (2603:10b6:303:246::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Thu, 26 Oct
 2023 07:02:34 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:235:cafe::ea) by MN2PR20CA0050.outlook.office365.com
 (2603:10b6:208:235::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.22 via Frontend
 Transport; Thu, 26 Oct 2023 07:02:33 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Thu, 26 Oct 2023 07:02:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 26 Oct
 2023 02:02:33 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 26 Oct
 2023 02:02:33 -0500
Received: from [10.71.193.58] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 26 Oct 2023 02:02:31 -0500
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
X-Inumbo-ID: a5c95729-73cd-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hj653eZhm/MY1UuKbu7bnZ/FFQSOU4I4p7aYmkjaJiceRuGQMyr0GftI6retpAnoo2yZVJOx+607AKt5Zub6fzQPFygs1dyRYDmQFFtooOqJv1w9WDOOFLgbf+5PVj+TQetWK9kx8s9hithcPOsQXf8PAq8tg+gcuI3IiBNbaZ60z0ua+rrX+CElMG2MwfY+FROt4/bdK/hKNFct7HpQ+sZ/UqU4lpCTfFDgMpwYjVs0W930NNXH/FFpn/SuajgE31oD5h/xAC8u1wVvPpEvuU6R38+tC/w7JWDE5y3osOnfEkcFNyQya8i79ObdhBimdi2D3T7bTyaV5FcRJy3RhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=01t6zzyHVhEgIqqj4ki0W1eJZJOuPeY7LSA/kgKoJM4=;
 b=GNV4Ips5LMN6KyIJcx3StdFD+2XrbKQf48mUKNle2MQILEiiJNy7RC5Q9DAMzwR7JxlDeLBiMfohMPpG4KYw/v6zelJtkHkl4RoNpVc7q9qfgq9ZHa3VRSPmc/YFcjtY6xyamjdFRjN/Nnmcx4FXR9kLvaVfn0CQkDQw6TJh1wuFv+CTEYeX9/V3/GpkJi9xwAnnBMiDejjoJOpRMd3/VTt2Qkj+13UDbaRG6lqVSId4UGnVTC/Bb5oLt4ZblxpMEyV2+26LW8eMcXzYHJNiMujizdSpIUiaQVbR0jqJ0q3H9CeYnd/sbHnFi51i5/tBes/HWpZHLDJkDDHrqTjV9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01t6zzyHVhEgIqqj4ki0W1eJZJOuPeY7LSA/kgKoJM4=;
 b=TMviiZZlaFwPcqOG2650yg4Y5Ng7Juix6bjbqlMDEUvpgzVkw8NqMgpVo0iVfAHTWFnGRDimia7kBv4RYSI0Y3hMDs4f7kca0dEXHIDhbf0v0LBnfRrmGFiNUIPOBtkdfaO5yfP6YR9J+SRkzTk9k96I1T+o8YBuxajP8pWI4T0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <ae4342e4-0ee1-484c-b679-5e3c24e2ad68@amd.com>
Date: Thu, 26 Oct 2023 09:02:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Add Rockchip rk3399 early printk support
To: Jun Nie <jun.nie@linaro.org>, <sstabellini@kernel.org>, <julien@xen.org>,
	<bertrand.marquis@arm.com>, <Volodymyr_Babchuk@epam.com>,
	<xen-devel@lists.xenproject.org>
References: <20231026054634.2805035-1-jun.nie@linaro.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231026054634.2805035-1-jun.nie@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|MW6PR12MB8952:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f68f85f-5a8b-4e28-86f5-08dbd5f1875f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Xql/iokti876VAclczC1FdQ8O7ocSmxOkKrzCG3f77+XZ8X/vcWSLRY5nLamEFGmMbNvIj3KQU626cCneUdOAPg/E64yfYoa0TCgH4B2k1BfKcninRlDL/3zC97U8NzW5Y+yvjzt5ye0Nxo5vC1RrxNd4fEdGkujjS9DCYi65TjCqGFZMdxMPxc1K5yJ+njqN2S3hs2LXzaaGlUvj4lkYw2bOSa4Cqno+1IHKXgrf0vZIzSJJAVH/dMB01bZgH+Gt3QTjLTrCbZmGMcPnYtTy8v39WZHqkTI+8HXpbWG7YLPPf6k2c0BEEGdSv0dg5d226rHTos9Q2xfqQUZuU7T0H0Yfw/QDfEUma4rilkU4qOmUKPMpdzvdOhw71p5oVxZJdJgSlEh9up8vCMDHuArpQTCtSrcZzrsbgDdcaB6YoU9k93aazdWOmSdas+HA6nCG0Yp+gkX5f4rVwxLi7JV0bRlh6UlQ50qTaITl4dKezEhZjsfAtiz3sgjKmW0VmbNhEwc5G660eAopld2LudOE+MpzLaMyS0pwnQRHhpVWxt+1cLGwK2E6zjakMoU/rR4shulC1epb/hPU2nKFxKFOSlswE4h4CQOIaovJg6apSSq8ASjziCdeQBV7tb5k5TCmIlJiAPK/ApFoQIArkAvwaCyi+q3afSWSULYyylXuCNoV0+R8ayP5YXGXJCTqQU6nNZ5tJsnqNs8OFXBx5fmHPnWWXujGg/GKvLrvAfCLc5+ZJNdw20wIf+fvv0DFY19VwYRfKAbnkJPOlLA1kHgQ8C9orC4yX+Wa9VMWuf4c5GY688w7ckkfTLavvVsoIBf
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(39860400002)(396003)(346002)(230922051799003)(64100799003)(186009)(82310400011)(451199024)(1800799009)(46966006)(40470700004)(36840700001)(26005)(31686004)(36756003)(2906002)(4744005)(44832011)(41300700001)(5660300002)(36860700001)(31696002)(86362001)(316002)(8936002)(8676002)(478600001)(81166007)(356005)(110136005)(16576012)(40460700003)(70586007)(82740400003)(2616005)(336012)(70206006)(53546011)(40480700001)(426003)(47076005)(6666004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 07:02:33.7607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f68f85f-5a8b-4e28-86f5-08dbd5f1875f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8952

Hi,

On 26/10/2023 07:46, Jun Nie wrote:
> 
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  xen/arch/arm/Kconfig.debug | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
> index 842d768280..fefe8ac4df 100644
> --- a/xen/arch/arm/Kconfig.debug
> +++ b/xen/arch/arm/Kconfig.debug
> @@ -158,6 +158,9 @@ choice
>         config EARLY_PRINTK_RCAR3
>                 bool "Early printk with SCIF2 on Renesas R-Car Gen3 processors"
>                 select EARLY_UART_SCIF
> +       config EARLY_PRINTK_RK3399
> +               bool "Early printk with 8250 on Rockchip RK3399 processors"
> +               select EARLY_UART_8250
Platform specific options for early printk are deprecated. You can read it at the top of the file:
"
Deprecated: Alternatively, there are platform specific options
which will have default values for the various parameters. But
such option will soon be removed.
"

~Michal

