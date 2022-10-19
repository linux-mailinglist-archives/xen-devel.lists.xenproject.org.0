Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C22C604C1F
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 17:50:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425894.674003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olBKE-0001Fu-Mm; Wed, 19 Oct 2022 15:49:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425894.674003; Wed, 19 Oct 2022 15:49:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olBKE-0001E4-IS; Wed, 19 Oct 2022 15:49:46 +0000
Received: by outflank-mailman (input) for mailman id 425894;
 Wed, 19 Oct 2022 15:49:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rFyQ=2U=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1olBKC-0001Dy-4C
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 15:49:44 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4ebf165-4fc5-11ed-8fd0-01056ac49cbb;
 Wed, 19 Oct 2022 17:49:42 +0200 (CEST)
Received: from MW4PR03CA0170.namprd03.prod.outlook.com (2603:10b6:303:8d::25)
 by DS7PR12MB6070.namprd12.prod.outlook.com (2603:10b6:8:9e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Wed, 19 Oct
 2022 15:49:39 +0000
Received: from CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8d:cafe::2e) by MW4PR03CA0170.outlook.office365.com
 (2603:10b6:303:8d::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32 via Frontend
 Transport; Wed, 19 Oct 2022 15:49:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT038.mail.protection.outlook.com (10.13.174.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Wed, 19 Oct 2022 15:49:38 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 19 Oct
 2022 10:49:33 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 19 Oct
 2022 10:49:30 -0500
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Wed, 19 Oct 2022 10:49:29 -0500
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
X-Inumbo-ID: a4ebf165-4fc5-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P++uulnqIbBhnm/TQqfw6Tlg+HOGrB2PrP0QYJJrhpEGew+ugj45KnDrMTkwfzT8puH9ZPHaKtnFCeKm7JiY9cn/vBmvzgDDZV3vMcG5Nos23atgCwciu6xADgK1Cv90Hfa8wvxM6EQGFABmBicWIOg98zDvGX2sqKU5TLAtvwSdp8cQr2mNuvTijOfcXL870YR4RHH2xjpoy7g3oZgwI1ucONL9FoM/8y7XaFGJvb5E8Cxn/9U98oqxAwxsuOjct6KS3068aVqtUmYdScSj2gKnrg8VDMY9EHzxfQ4yqdoxtOCNpjGX5fzPaEr/agQsMMW9NXUu2uAxeltCOSllJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BeGba4M/2lBAEih9NOwNpf78NbOThvzF8ia69VsVhwA=;
 b=oX5oqsoegXhRUTIkCqiqFSskDTj/ReY+BOuehHoILd+PDdMRf60sZZbNAV25kg99VWMqbf3xBKmZ1VTdABTssxTV+b2h+o2Uh7bXI/PL8WtMqfGc7jvKfMiWCeYJHkfMgtZkNaI81ZHFFuNIluX9tmo7sHrAE+RJ1un2EKsuibTqNS4SgaxBinKZl99eg/Eu3NdQbOczVyp4Wc7BBUSlsVYq4B9MoxfL9Ws8e5RwZBsSrR81lCvUtdZgMtFxkeSZrmxqO7SxaUyWCkaprCnbv5UdzXE4ONz938qDfMciCbhBBkEtWI/tJeqdk/ti7TY4kBetRXP64Gc8CzHMK1JfBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BeGba4M/2lBAEih9NOwNpf78NbOThvzF8ia69VsVhwA=;
 b=WR0LQDb3kFCY2eE+77UKOmLXnOrvkrYC31cp/q03QhGoPjB9OIxtSA3UfyihxZz6geCHJEKxgnNmWGHvSDx9trIppUW76lFkTDaALgv3MQIJ275e4I8srPxDwQmEAPUKqWF8oPrkQPELmWO+7HYBMApSWXxM3tz85wNujR/c6nU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <745ed2f6-4193-b7a3-c3a0-455ef8c24b66@amd.com>
Date: Wed, 19 Oct 2022 17:49:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [XEN v1] GICv3: Emulate GICD_IGRPMODR as RAZ / WI
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>
References: <20221019143620.45814-1-ayankuma@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221019143620.45814-1-ayankuma@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT038:EE_|DS7PR12MB6070:EE_
X-MS-Office365-Filtering-Correlation-Id: d4bd8321-3f94-4283-691b-08dab1e9876e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Df2uoELUOG2tPtlDVg5xtz6XZKwh1HCW8ebIw14XLtSuyXTdJVsSdBUACgkbC/r9CST/ETsAH1x9bBdSIc9hcjvuT2Drv4BPpWqcghLiWJ/69ZrRDCoENMOoB7irnUAXl0k543rOcAU/hx3l0Ko8nj2rrdd18VMV4Tmx7+ZeMcg2bQiSQiZq5UCUk4qRw1ElqSwQU0jgxrgirG3foI+BkKAny0OfruVkzUzERH5vPSJrpiegQBad22eM0BjpYbPGfRMOmKrbDHJtkGxohNEHKtcpTqhdgBovZ4OwI+FcB5LKaylQbqUkc6FwBLH2352D71HIeGSUhO2lM89Mm7yNIuh1mCWzbk4ajqQO6kAXrmblHpYgovr0vEULjjfJ2oZFtFnaoPFUtsmaaJEo22Ih8sBNv6Hq98644p3plHsnN+8D3QtYF2zYReEkxcfKGepXuP0ZmlKqzhJUS2lpkBQVjkaGJYIT8umtAq0jL4a2EXwkVSnvwVaDkcSGYUh1uI0l0LYvIZ6GGrD1TxK3/OmgiezEB8nLN/pIrsh5sSk1tyGwa8g14AKCDvdVre+NeuhlRu0wbnMxoI+MkdIuwvfNZNzY1LyTlpD9Z4ZfgsLVXQrZ0a1KgYfInbtiywZbRg94EVfqSzsqT7MfOO3KjI2ZH8wUaNgSL+PSs/7hbs5r3zV5FMb82IxLpofh10ngnonBNGsfgvHgZGcMCX1ViZx6G8RPTy8cigyuqmL9q2Q0XWGGCsmAvp54y1d5sgd77HQxQ3JcfMfM5PjK0yxBEUkwfjb0x0f3KDJQ2cGPwR+nfsYyCpDkYbfCcUNLWsL0J1DdkqhXpSQCRcBfYrPQ5Nj/BA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199015)(36840700001)(40470700004)(46966006)(36756003)(31696002)(336012)(36860700001)(86362001)(47076005)(82740400003)(44832011)(2906002)(5660300002)(8936002)(54906003)(426003)(186003)(2616005)(81166007)(356005)(83380400001)(16576012)(70206006)(478600001)(53546011)(4326008)(70586007)(26005)(31686004)(110136005)(316002)(82310400005)(40480700001)(8676002)(40460700003)(41300700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 15:49:38.2284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4bd8321-3f94-4283-691b-08dab1e9876e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6070

Hi Ayan,

On 19/10/2022 16:36, Ayan Kumar Halder wrote:
> 
> 
> Refer GIC v3 specification (Arm IHI 0069H ID020922), IGRPMODR (similar to
> IGROUPR) is relevant only when the guests run in secure/non-secure mode.
> As Xen does not implement security extensions for guests, so the registers
> are emulated as read as zero/write ignore.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> ---
> 
> Observed the issue while running Zephyr on R52.
> Also, found that KVM has similar behaviour.
> 
>  xen/arch/arm/include/asm/gic.h | 2 ++
>  xen/arch/arm/vgic-v3.c         | 4 ++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
> index 76e3fa5dc4..998dd62651 100644
> --- a/xen/arch/arm/include/asm/gic.h
> +++ b/xen/arch/arm/include/asm/gic.h
> @@ -48,6 +48,8 @@
>  #define GICD_ICFGR1     (0xC04)
>  #define GICD_ICFGR2     (0xC08)
>  #define GICD_ICFGRN     (0xCFC)
> +#define GICD_IGRPMODR   (0xD00)
> +#define GICD_IGRPMODRN  (0xD7C)

These registers are GICv3 specific and as such should be defined
in arch/arm/include/asm/gic_v3_defs.h.

~Michal

