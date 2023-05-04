Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C94CA6F65E6
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 09:37:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529586.824117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puTWb-000237-C4; Thu, 04 May 2023 07:37:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529586.824117; Thu, 04 May 2023 07:37:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puTWb-000204-9A; Thu, 04 May 2023 07:37:13 +0000
Received: by outflank-mailman (input) for mailman id 529586;
 Thu, 04 May 2023 07:37:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=evI0=AZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1puTWa-0001zw-1W
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 07:37:12 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a1026a6-ea4e-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 09:37:10 +0200 (CEST)
Received: from BN0PR02CA0034.namprd02.prod.outlook.com (2603:10b6:408:e5::9)
 by SA1PR12MB8844.namprd12.prod.outlook.com (2603:10b6:806:378::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 07:37:07 +0000
Received: from BN8NAM11FT096.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e5:cafe::53) by BN0PR02CA0034.outlook.office365.com
 (2603:10b6:408:e5::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26 via Frontend
 Transport; Thu, 4 May 2023 07:37:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT096.mail.protection.outlook.com (10.13.177.195) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.26 via Frontend Transport; Thu, 4 May 2023 07:37:07 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 4 May
 2023 02:37:06 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 4 May
 2023 00:37:06 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 4 May 2023 02:37:03 -0500
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
X-Inumbo-ID: 7a1026a6-ea4e-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oHvF1C89f/2TW8wdWUOmYH+s2bG6TZ7D7X8dwIDxQ+aSmUZuthmJJ03ou9ro14b+raEtgwzVI8eqlPZncaOmaE55qDApPZ9EuRluFIfq1qlRG04UgYpHe0cbqLVQOd7ViMJp4hdPMqvBshjfIpJPIchQNbtrNoQcICDLxfORTikDn4GBpk+o3UJliO0TqXnYxHC44q+jduuRi12LCQSnQYzJtnngb+L/gcS1hl5hHXLFiquvLmxZj4vBsajbM+v9zX/8jD1BOkOjl/XDRfEYlzGyYtUJnyKKdHd1nZP7GFYymt+k2zDl4UuWq3xn9SOMYItnoG+1poUVt/R2slUezw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hu6RIZv7TDT51Iy6tIM1pYoLNuxak+6DMHpCl2kjCLY=;
 b=QKsOihvQnjv25Wai3rsM7/2ZNQgmS0ruZbbp7QQw3r7Jy9Vgonf7Tlr3VhjS9vwg1nSi59UQe9VveOgYKreNtu4UQtZ1+Apa5hPFeTsyvXzjhcDv+EcKknkaMmejMUxNQOTQazTo/JfDpwEQ1ELdkRUoJQYxRmsEPt3YLhNKbLi9qjjugU5PD+q/2xuHnCcpIeD4CMw7Js842c+zAD0d+8Pya1b2lV7WzHhe/S7PfznS8VRaXCifr3gWNhuljaZhIQdxKfFi8EajSf5ktGd6t19cmxYoS3drRJ/4IYCCoW5dn+aJtXXaPpIPHt1pT+p4Oc2cwq6JH0ks2GNrMTX0fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hu6RIZv7TDT51Iy6tIM1pYoLNuxak+6DMHpCl2kjCLY=;
 b=VtJWsARv31OXPw9ZAHCx0sdouzVKXFjIcL6CFXVyDOwl0bnZGlAppTLWU3WPpNXhRlh/jwReC5gn08TgkTj99CBHPEIvzny84xlssQzk4bLmsJKa+0U1mFCqFcJHp+sJTVOCSopZ4JjyX287GdFukXZrnKAdPaawaZhD+sw2aHU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c8021f4b-1607-23df-803b-ac162d9d4324@amd.com>
Date: Thu, 4 May 2023 09:37:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [XEN v6 04/12] xen/arm: smmu: Use writeq_relaxed_non_atomic() for
 writing to SMMU_CBn_TTBR0
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>
References: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
 <20230428175543.11902-5-ayan.kumar.halder@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230428175543.11902-5-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT096:EE_|SA1PR12MB8844:EE_
X-MS-Office365-Filtering-Correlation-Id: 603f5a7e-87af-46ff-d2db-08db4c725ce9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p2snQRYJSJYpHFA1xT35VNyEWPn2EERHZfGw/vDbcIuwBE9TGdYbWxL3Zv9M9E41rCSG5M54v7uhB02qP22LDeMsnW/nIxt/pRUUH4Dtghlv2S4T4ycMegYkd+CqnSGcqhqGIL5CdOrDxbfn2fFsuP77TMjNkFgpojDNJMAVTu2OnCGkHmTRo5n/1PD218QxtMtMzUN/+MWH56Yjo5z72468XX9HBRdKa5S5oFl5sVoqBBavIAXTqsf77sEuz0oXRMYV+pKSVxnuOpyQGDkhd2EYzKlZobrelkZaNz5lZ2PGWLIpVpjphC12bq2T6aWphVRTUxJ/7KTCJim0NiB3fW0/37aibbnSsC0xH06zQMX/sBmd8SKnkEcavazSVkLBfrnm0YD/jHEtmIiFK2mEGEVxLacXwYHFEqD0RazhtV/DNg09F7XhAnALRwboQY8zfBFpEynn+IwrUYJPzFuC5CyLZ6V1MT7ZA7WV0A1LfUA2ekrQAgeAaVq5RsIaUl7sJLSDegiW3atVnVH9LkbFNM6egqDeqI5PS5KlmnOeNswL5DnO5Zq3pN20gPrexQ0HoDEKEfbeZPCzFgwMVk85o/lUwFGB3SDES5eX4MGPYkwYMNkcoG01RP31VjcMGgXyZiKz598FQfx91ze5S2zYziz9SxqBx51zx6jcX3SG9DscAas3Wok/kvhHzWLyWToSo0Co+cckXwIXFnA7bGM9A7yS9aYgWIqB43GTBJMPvxVph0zgOjdDb6vyq/wfSIyaEo5knxwAOB0XiM/sQvFxfQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(39860400002)(346002)(451199021)(36840700001)(40470700004)(46966006)(356005)(8676002)(53546011)(40480700001)(36756003)(26005)(336012)(8936002)(2616005)(426003)(7416002)(5660300002)(16576012)(316002)(110136005)(54906003)(70586007)(478600001)(4326008)(186003)(70206006)(41300700001)(81166007)(31696002)(86362001)(82740400003)(36860700001)(47076005)(83380400001)(44832011)(2906002)(82310400005)(40460700003)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 07:37:07.1398
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 603f5a7e-87af-46ff-d2db-08db4c725ce9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT096.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8844



On 28/04/2023 19:55, Ayan Kumar Halder wrote:
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
> v5 - Used 'uint64_t' instead of u64. As the change looked trivial to me, I
> retained the R-b.
> 
>  xen/drivers/passthrough/arm/smmu.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index 79281075ba..fb8bef5f69 100644
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
> +       uint64_t reg64;
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
> +                        << 32);
I think << should be aligned to the second '(' above.

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

