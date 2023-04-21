Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2D06EA56B
	for <lists+xen-devel@lfdr.de>; Fri, 21 Apr 2023 09:57:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524496.815483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppldy-0005oX-Sk; Fri, 21 Apr 2023 07:57:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524496.815483; Fri, 21 Apr 2023 07:57:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppldy-0005m0-Q9; Fri, 21 Apr 2023 07:57:22 +0000
Received: by outflank-mailman (input) for mailman id 524496;
 Fri, 21 Apr 2023 07:57:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v1kD=AM=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ppldx-0005lu-EP
 for xen-devel@lists.xenproject.org; Fri, 21 Apr 2023 07:57:21 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7eab::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2314ac4c-e01a-11ed-8611-37d641c3527e;
 Fri, 21 Apr 2023 09:57:19 +0200 (CEST)
Received: from DM5PR07CA0068.namprd07.prod.outlook.com (2603:10b6:4:ad::33) by
 SA3PR12MB8045.namprd12.prod.outlook.com (2603:10b6:806:31d::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.45; Fri, 21 Apr 2023 07:57:15 +0000
Received: from DM6NAM11FT087.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ad:cafe::5b) by DM5PR07CA0068.outlook.office365.com
 (2603:10b6:4:ad::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.28 via Frontend
 Transport; Fri, 21 Apr 2023 07:57:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT087.mail.protection.outlook.com (10.13.172.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.26 via Frontend Transport; Fri, 21 Apr 2023 07:57:15 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 21 Apr
 2023 02:57:14 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 21 Apr 2023 02:57:12 -0500
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
X-Inumbo-ID: 2314ac4c-e01a-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n6F1h4KR6c1oMdejEprt5Ro/cJdRWDvp4+s+i/+CxYMEp4s10mlHujkgeiLgERafjmt1QNzjjuMeBbDKtTJDxBb0KR1hlsXatBzcJAWPu4Rx3u3Efpn8eiKMw6kbwJ9+e8tBZbW2rxumWPpk66HU3DhZHsqQAHpTqQLMsx1feJEG87uCZSy/WvaqClrRY7M2divkrQqSIFR+xXdDXqEBgpwQHGsvcenDHFuakHZk5iqKzN1vNzje1mfxMdtc3QD3dhd/5TySXKbnx8EmXbqAGnzqK7tJkAkpPATJV85GeW8dc5R/QKQ+J7h31ID2OSHzye8t+SykSLonuqNPzb4aBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aaLKSLBlH0pmitOGlaO7/UUHDoX6HYuf9NHfmDDiTwM=;
 b=DLcyBSX+sObCl78qpBLdCwIBLlg0tY0fo0oBqdlwjwEdW3OM2p0YP6HJk+MWa+hvMM53EOACwtVm8hoxPCZzz/0wZcVRJE5BWY70lJG/qLEJ5ZQAEaNNOTy9Q8Fp7meNJX6Yhzu9vwMaCVZ5Q26XMtt8F0jaJtAlwDwGgjDccgxxSUPhsXoWNhfNu7tsWoTXpXaKgwiS+oWe8tIgjx+MVvvE1JZLtj1i1wOV99oUkcpw/9QbgVXR+dFb2mEm7VCVhYXx33uRBxu2Q53Dtc+aqYFf3SZcJsjAL4lDba9gpL8zzJMIKwguUp/P4M0cZxisqSdhko9mok2UDUm5a3iCUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aaLKSLBlH0pmitOGlaO7/UUHDoX6HYuf9NHfmDDiTwM=;
 b=jWZCjL2IQLWqL1K8Smir13KZmoJ+RSsahbGddb9jTNZ+s0v7Mf6eScRDP3WjFYejE9510K4SeJoNZEQS4Yq9zuq7Jndn9Yl7SWPqDbkEdrVQZ4imAdXIeZBXGKtaPheYKL33r6kVTte8Ui1h1EFpqsMVXaSab8Ps2spZkqD//vE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <45b3d1cc-899d-5917-535e-fa6539f88571@amd.com>
Date: Fri, 21 Apr 2023 09:57:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [XEN v5 04/10] xen/arm: smmu: Use writeq_relaxed_non_atomic() for
 writing to SMMU_CBn_TTBR0
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
 <20230413173735.48387-5-ayan.kumar.halder@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230413173735.48387-5-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT087:EE_|SA3PR12MB8045:EE_
X-MS-Office365-Filtering-Correlation-Id: 6314be5b-2924-496b-d17c-08db423e05ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9TKIB+ujAKhsF6Zw94c1/tFFz6OArUguZOxQSwSVeMW0YkGX3WAiS4aUkCQnaDh0d4617SM4ryfJVWdOiGhQECTnAWQ8I6cjRCsieIZyZRZYLgBgJloSkYyu/a2kpEkE22mNWn58l5I8SWdmJsKgNH+Ol8kcDDqcdBeXHIKlZIImkQgAgdaifoykwF0r9Lp40OMUu6RiENdm2KhtTubtmHgA4i5uIUUwBt7WPpFHpcWWCfjvkDA+eSGvNAtcLL0wELAYXz3MsBOgGGdV1xFJClCXH5rUYHIcVWNFq+lPzNr37kaZ9J/M2C+xt/R6quAzji0pVBE1bcrTGRsB5nFlkEn1n77DfUgZDwpW05IAAhazDLr6yG6CU9s6pChai2LUvAdJbUBdMMPKN1VheyT7vjcxiO/gzumYIxhyDcARXTBPrRt7mGx7lEXJ8JOBBQYuxU/V9+y9ziTjq5zYJrUgnGKGscBmeLRYRjqaS+OT1bHH7ImA2UoCmbezFi84y11Xxu3qgj+DWkWKfw4xm0qUN+qAs7Sswtvs3Iwt9QsrEEbPJimt45MzAuHqVoHnpdHxw2AbucPvvNaohpoAIuX5MJWD2SqsaVrR5zayBvbaPIBE3shKNMZEYMgfyrIYcOq+zOrIi4h59s4PTSn1ocAjaFJSpmd9T5AiDotATuJBDxztYVTtu3ehPe9mzT8aZSaHli1Rooqsdya/RsOOtdXwoIV+EZRXgVp3ThNP+iiA8E/2ugfzjk+WrXnut/idiQ/QJOzd7BT1pFF9MEEZo603KQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199021)(46966006)(40470700004)(36840700001)(44832011)(36756003)(7416002)(40460700003)(82310400005)(8936002)(5660300002)(356005)(8676002)(41300700001)(2906002)(81166007)(40480700001)(86362001)(31696002)(54906003)(31686004)(478600001)(2616005)(110136005)(36860700001)(16576012)(316002)(53546011)(26005)(186003)(426003)(336012)(4326008)(70206006)(82740400003)(70586007)(83380400001)(47076005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 07:57:15.2893
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6314be5b-2924-496b-d17c-08db423e05ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT087.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8045

Hi Ayan,

On 13/04/2023 19:37, Ayan Kumar Halder wrote:
> 
> 
> Refer ARM IHI 0062D.c ID070116 (SMMU 2.0 spec), 17-360, 17.3.9,
> SMMU_CBn_TTBR0 is a 64 bit register. Thus, one can use
> writeq_relaxed_non_atomic() to write to it instead of invoking
> writel_relaxed() twice for lower half and upper half of the register.
> 
> This also helps us as p2maddr is 'paddr_t' (which may be u32 in future).
> Thus, one can assign p2maddr to a 64 bit register and do the bit
> manipulations on it, to generate the value for SMMU_CBn_TTBR0.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> Changes from -
> 
> v1 - 1. Extracted the patch from "[XEN v1 8/9] xen/arm: Other adaptations required to support 32bit paddr".
> Use writeq_relaxed_non_atomic() to write u64 register in a non-atomic
> fashion.
> 
> v2 - 1. Added R-b.
> 
> v3 - 1. No changes.
> 
> v4 - 1. Reordered the R-b. No further changes.
> (This patch can be committed independent of the series).
> 
>  xen/drivers/passthrough/arm/smmu.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index 79281075ba..c8ef2a925f 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -499,8 +499,7 @@ enum arm_smmu_s2cr_privcfg {
>  #define ARM_SMMU_CB_SCTLR              0x0
>  #define ARM_SMMU_CB_RESUME             0x8
>  #define ARM_SMMU_CB_TTBCR2             0x10
> -#define ARM_SMMU_CB_TTBR0_LO           0x20
> -#define ARM_SMMU_CB_TTBR0_HI           0x24
> +#define ARM_SMMU_CB_TTBR0              0x20
>  #define ARM_SMMU_CB_TTBCR              0x30
>  #define ARM_SMMU_CB_S1_MAIR0           0x38
>  #define ARM_SMMU_CB_FSR                        0x58
> @@ -1083,6 +1082,7 @@ static void arm_smmu_flush_pgtable(struct arm_smmu_device *smmu, void *addr,
>  static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain)
>  {
>         u32 reg;
> +       u64 reg64;
Shouldn't you be using uint64_t? Also ...

>         bool stage1;
>         struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>         struct arm_smmu_device *smmu = smmu_domain->smmu;
> @@ -1177,12 +1177,13 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain)
>         dev_notice(smmu->dev, "d%u: p2maddr 0x%"PRIpaddr"\n",
>                    smmu_domain->cfg.domain->domain_id, p2maddr);
> 
> -       reg = (p2maddr & ((1ULL << 32) - 1));
> -       writel_relaxed(reg, cb_base + ARM_SMMU_CB_TTBR0_LO);
> -       reg = (p2maddr >> 32);
> +       reg64 = p2maddr;
> +
>         if (stage1)
> -               reg |= ARM_SMMU_CB_ASID(cfg) << TTBRn_HI_ASID_SHIFT;
> -       writel_relaxed(reg, cb_base + ARM_SMMU_CB_TTBR0_HI);
> +               reg64 |= (((uint64_t) (ARM_SMMU_CB_ASID(cfg) << TTBRn_HI_ASID_SHIFT))
... here you use uint64_t for a cast and not u64

~Michal

