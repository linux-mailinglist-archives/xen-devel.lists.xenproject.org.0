Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B00ACB6242
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 15:06:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184139.1506663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vThJD-00014k-LB; Thu, 11 Dec 2025 14:06:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184139.1506663; Thu, 11 Dec 2025 14:06:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vThJD-00012O-IL; Thu, 11 Dec 2025 14:06:19 +0000
Received: by outflank-mailman (input) for mailman id 1184139;
 Thu, 11 Dec 2025 14:06:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pO9S=6R=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vThJB-00012I-V7
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 14:06:18 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 852beb5f-d69a-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 15:06:00 +0100 (CET)
Received: from MN2PR14CA0018.namprd14.prod.outlook.com (2603:10b6:208:23e::23)
 by IA1PR12MB7710.namprd12.prod.outlook.com (2603:10b6:208:422::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 14:05:54 +0000
Received: from BL02EPF00029929.namprd02.prod.outlook.com
 (2603:10b6:208:23e:cafe::ea) by MN2PR14CA0018.outlook.office365.com
 (2603:10b6:208:23e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.9 via Frontend Transport; Thu,
 11 Dec 2025 14:05:43 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF00029929.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Thu, 11 Dec 2025 14:05:53 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Dec
 2025 08:05:52 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 11 Dec 2025 06:05:50 -0800
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
X-Inumbo-ID: 852beb5f-d69a-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JgXgfyXVJlcw7Q04LpcO/s4LfmVZXJCdSpGMrRRrYNE88URqwmurUIiWeym93N97T5fHRpiAfDqIWN0/8C4eFbyNSPyvHra5CItquc3T7xadOdTA6zRbC8D+haQRZ74PXw/PeuAZovoBW7dVDrGkYFkOx0MoktEmrxPDDYQQrWN0lSqiIE8WTk3CgVCA88dSEtC1U32De3eGrfXxo13CmTlkLo24Ij+JzpNFSazQ63ktkoWRHQPXU5HvL+0VHjX9OlDxRZxUN329odZnQspA393PLYdMExRBH37cX/WagQcItK0QMhJs5t3YFKArhPb/v+1cx67XADUL/k0VHF227A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9z7rVePGX2ANfrB9anmYd/bg2v5tJQhI+VfolDuIvHM=;
 b=aapib2CJio6UIHLVGeCMRQVGoLW1yKJrUBpoJDSQPwVfZJdioD4D7DYixJls6Gga52nctUj+8LmEJAy11IKHJnLs0b/m6uib9AHZiJnaJX2m2Yvj6R8YfdfXmhe4Cs74u3Pk+oqnvRypyHyhDFXpU9CrMDa1gSXyXKALziNcABqIfRaaPAf74fmNeIvYXxohZMl0Nkpibv2xQ213eVBDx16okZKGKOT+ltxco3diFFjD2rOXskXEpm2Y6ndBzu/hrxMuEf8gxuHuhcZJIIwO0hUtH6y5Ybcha6ocu4JPoBdreektPu7J22x5P5RS11iTJMbd5ugMZlM2ScqPDGzDVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9z7rVePGX2ANfrB9anmYd/bg2v5tJQhI+VfolDuIvHM=;
 b=S4/NsWzAOx3Ti+jlQdlzvB35mPkBY/ZbXebJF364kUO7x0zMGfXQnzeLRO2WEOlnhTGHl00h5R/Tton7GQV+DqmdqJ4b9pLPgA0A1pcO/YCchw+YZcTFjTsV+CEZ4n7WdUncsZkTFlzFAPZuVCWPtvtdUNy3gban+XRMR4GqgTM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <a9a36ee9-c513-40a1-8c37-c7ae12202c80@amd.com>
Date: Thu, 11 Dec 2025 15:05:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] arm/mpu: Implement free_init_memory for MPU systems
To: Harry Ramsey <harry.ramsey@arm.com>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>, Hari Limaye
	<hari.limaye@arm.com>
References: <20251128095859.11264-1-harry.ramsey@arm.com>
 <20251128095859.11264-4-harry.ramsey@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20251128095859.11264-4-harry.ramsey@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029929:EE_|IA1PR12MB7710:EE_
X-MS-Office365-Filtering-Correlation-Id: 215e2122-5d8b-4443-70fd-08de38be6586
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXg0Vnd1cGdxaVAzUW12bk1KaEpKa1VFWmYzdGNueldxL1BPV0FyRFFuc1RS?=
 =?utf-8?B?TE5aZVFsaXAxV1IyaWQzNXFwZnZyWjRzOVNoUlJBQjR0S0tDZFVPOXJYWHd4?=
 =?utf-8?B?ZFBMN3orNGVIL2lOWjMwakhnMVAzZkI0SUJWV3EzS3pqTzFZVm54bm9HNXVz?=
 =?utf-8?B?LzhOaXJXSldWR2F0UXNaelZKdUw1RXd1YlJUVW5uN2VJcWFUZnFmd1g2WFha?=
 =?utf-8?B?cnNQN2tFVzVoUGcwNmFIbjgwU1hQZHV3WWNndG5ENXVrL1pBYWtNcSthRkNM?=
 =?utf-8?B?R2hYa0lZSGp3M1NJQjlyYUxKYTVsTkVweGVZcWxHbEFkUVFpcW1mSEdaUUpa?=
 =?utf-8?B?UXhxekpWNm1XSlIvWHdWM2h4VFZ3Q3QwY0llbi9aUytnNCthZEc0Q2E5aTQv?=
 =?utf-8?B?SThIUUZEMTRzVU14TjVpRFo0YVNSR1ZKRUREY0dsVXZFWVVBTk1VZUpQNTRT?=
 =?utf-8?B?b2hqWnhKcFlPUG0zM3JNOTJWVXRMVlYxWmtDMWM2MFZhODNyMHdrSHo1eVlO?=
 =?utf-8?B?akE4THA5aXdDMG5CWU1rTXpDVmFXdEo1MXBrVTZOOXUySXRMMWc1UnFoZ1BK?=
 =?utf-8?B?Q20rQW9IMXNvUWxubVJmKzdNUUc4UkZ0azh6UG1wSlV4YkY3Y0tyNDhzVkJh?=
 =?utf-8?B?MEJXbHIzcFUrR2hKK1hhUXk1akJpOThZWDUyNzFDeXRzb2tWc0VxK2FqQmtr?=
 =?utf-8?B?d3VxanNYOGZrRXZNQ0xBbVJRMm1lSDEwakdROXhYSnd3S2g1VlFPUXdSbGhI?=
 =?utf-8?B?ODErQzFIWlZFWXRSV0EyT2dFV0Fmbmx4Yy9ESnBMenAwOHUzZks1MVpWRDls?=
 =?utf-8?B?Qmd3NkUxWXBsWS8vODhjcEhhK25icjRJVllBR3VCbGN2NkV3RjUrclJDYmE4?=
 =?utf-8?B?bDhWL3ZaOUZuSWZMMy9HajJualZFSkRIZDFRZVV3Z0hKOU1SaTlROFdVVWtj?=
 =?utf-8?B?UzVFUkR4MUFlVFhUSzhvcjNwVlgyQTFnMWpneGErczA5c0hWMTRlNXJyeWIy?=
 =?utf-8?B?RHM4MVNYUlM2SWpLellHVDlJd1NZeXc2SXlRY1FNa2gxVnZXdXB3NCt3VlFx?=
 =?utf-8?B?aDV4NXA1Sm5Wa1BVZzVoVDNUUE5mV1l1NWN2MFdJWkNSenAvQ2R6cHlGajUy?=
 =?utf-8?B?RWpLcUVoa2xmZGgyclV2MHZJbEt0QTE0aFdlSkNPT2YweklxMGNBL3JSTjBT?=
 =?utf-8?B?Q3dscUIrNk0xK014UGZ4YWRrMTN5cDJ0ZlpGRElXWnM0TktTOTl4dktIMkJW?=
 =?utf-8?B?TXdHK2dFUVpmdldqeHlYVjZlaTVIdWxwdkowQjJBdVdMNzRaTXpsakZmVEVX?=
 =?utf-8?B?YjlMWW55bHp5aG1kZDFrV0x1bTFiUlNRbXVTaDJaOXdGZnNmQWpNeExDNyty?=
 =?utf-8?B?WEVkcFhKbkpRRTVnWmllUlVKcDJuT3U0Ty9hallvK09aV1lIZ1E2MW9HQ3FV?=
 =?utf-8?B?VEVFWjRtUVg3eDdHMmxVTHQxekk4UkhHMTRvRkZCcXhPRE5pTTh1YTBCTU9i?=
 =?utf-8?B?WitST01oczZ0U2FTS0lrTWc3cEFUaXUyeHJweVpFRGU4TC9EM2lVaTBBbnYv?=
 =?utf-8?B?QWpLVU03am5weTVoZVlzL2l0NHdOb1FybSs3NjJkNmtlQW0xNzBrc1dCVWFn?=
 =?utf-8?B?Mk5yYzlLMlpnbExHbXREcEdSQnh3L0MxZW5ZbTE4QXdHc1h6SnVBWmV2am56?=
 =?utf-8?B?S2t3VDFsbm9SUEJmVG1IdE45T1dYQktWQmpZMGRpeFY4VFo5L1Z2V3ZuUVRX?=
 =?utf-8?B?cXFjVExYYnUxTExPM3Nvc0xBbE53M0I2WXVOMmVVT3dvR3VQVy9MTEFta1hy?=
 =?utf-8?B?WExBVW1MamVWTzB2M21vWjVRUkhudi83S3gvUTVFVkNtK2lzN3VnS3VoRzc5?=
 =?utf-8?B?QytSMXVGRU9kc3VCb1FqUy9OVVBrSlBZYWl5WE1mdnJ4d2I0NWZyWnh1RG9D?=
 =?utf-8?B?bDJIR2gwZWVNNVdKWUdxcjduL1FNQVoreFNWN05TNUY3UkdKb0tKMHNmRkR3?=
 =?utf-8?B?NjRpWnRxbFB1YkpadWhrQlgyQloreHFOTElUMGJISXdhc0hqcVBncVVpZ3pQ?=
 =?utf-8?B?MGt0SDdrK1c3RUZVQkg0UjhKOWIrcTNFRDVEVEVkVWhkay9BYmhEMlVYZFhD?=
 =?utf-8?Q?+6EA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 14:05:53.1018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 215e2122-5d8b-4443-70fd-08de38be6586
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029929.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7710



On 28/11/2025 10:58, Harry Ramsey wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> Implement the function `free_init_memory` for MPU systems. In order to
> support this, the function `modify_xen_mappings` is implemented.
> 
> On MPU systems, we map the init text and init data sections using
> separate MPU memory regions. Therefore these are removed separately in
> `free_init_memory`.
> 
> Additionally remove warning messages from `is_mm_attr_match` as some
> permissions can now be updated by `xen_mpumap_update_entry`.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
> ---
>  xen/arch/arm/include/asm/setup.h |  2 +
>  xen/arch/arm/mpu/mm.c            | 91 +++++++++++++++++++++++++-------
>  2 files changed, 73 insertions(+), 20 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 1eaf13bd66..005cf7be59 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -65,6 +65,8 @@ int map_irq_to_domain(struct domain *d, unsigned int irq,
>  int map_range_to_domain(const struct dt_device_node *dev,
>                          uint64_t addr, uint64_t len, void *data);
>  
> +extern const char __init_data_begin[], __bss_start[], __bss_end[];
> +
>  struct init_info
>  {
>      /* Pointer to the stack, used by head.S when entering in C */
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 29d8e7ff11..8446dddde8 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -174,28 +174,13 @@ int mpumap_contains_region(pr_t *table, uint8_t nr_regions, paddr_t base,
>  static bool is_mm_attr_match(pr_t *region, unsigned int attributes)
>  {
>      if ( region->prbar.reg.ro != PAGE_RO_MASK(attributes) )
> -    {
> -        printk(XENLOG_WARNING
> -               "Mismatched Access Permission attributes (%#x instead of %#x)\n",
> -               region->prbar.reg.ro, PAGE_RO_MASK(attributes));
>          return false;
> -    }
>  
>      if ( region->prbar.reg.xn != PAGE_XN_MASK(attributes) )
> -    {
> -        printk(XENLOG_WARNING
> -               "Mismatched Execute Never attributes (%#x instead of %#x)\n",
> -               region->prbar.reg.xn, PAGE_XN_MASK(attributes));
>          return false;
> -    }
>  
>      if ( region->prlar.reg.ai != PAGE_AI_MASK(attributes) )
This check and ...

> -    {
> -        printk(XENLOG_WARNING
> -               "Mismatched Memory Attribute Index (%#x instead of %#x)\n",
> -               region->prlar.reg.ai, PAGE_AI_MASK(attributes));
>          return false;
> -    }
>  
>      return true;
>  }
> @@ -352,8 +337,33 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
>      {
>          if ( !is_mm_attr_match(&xen_mpumap[idx], flags) )
>          {
> -            printk("Modifying an existing entry is not supported\n");
> -            return -EINVAL;
> +            if ( rc == MPUMAP_REGION_INCLUSIVE )
> +            {
> +                printk(XENLOG_ERR
> +                       "Cannot modify partial region permissions\n");
> +                return -EINVAL;
> +            }
> +
> +            if ( xen_mpumap[idx].prlar.reg.ai != PAGE_AI_MASK(flags) )
this one are identical. Why do we duplicate it here? If this is because
is_mm_attr_match returns just bool, then maybe you want to introduce more
logical return values and parse them here. What you eventually do here is you
allow modifying regions for RO and XN. Therefore is_mm_attr_match could return
true on RO and XN but false on AI.

> +            {
> +                printk(XENLOG_ERR
> +                       "Modifying memory attribute is not supported\n");
> +                return -EINVAL;
> +            }
> +
> +            if ( xen_mpumap[idx].refcount != 0 )
> +            {
> +                printk(XENLOG_ERR
> +                       "Cannot modify memory permissions for a region mapped multiple time\n");
s/time/times/

> +                return -EINVAL;
> +            }
> +
> +            /* Set new permission */
> +            xen_mpumap[idx].prbar.reg.ro = PAGE_RO_MASK(flags);
> +            xen_mpumap[idx].prbar.reg.xn = PAGE_XN_MASK(flags);
> +
> +            write_protection_region(&xen_mpumap[idx], idx);
> +            return 0;
>          }
>  
>          /* Check for overflow of refcount before incrementing.  */
> @@ -499,8 +509,7 @@ void __init setup_mm_helper(void)
>  
>  int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
>  {
> -    BUG_ON("unimplemented");
> -    return -EINVAL;
> +    return xen_mpumap_update(s, e, nf);
>  }
>  
>  void dump_hyp_walk(vaddr_t addr)
> @@ -511,7 +520,49 @@ void dump_hyp_walk(vaddr_t addr)
>  /* Release all __init and __initdata ranges to be reused */
>  void free_init_memory(void)
>  {
> -    BUG_ON("unimplemented");
> +    unsigned long inittext_end = round_pgup((unsigned long)__init_data_begin);
Looking at the linker script, __init_data_begin is already page aligned.

> +    unsigned long len = __init_end - __init_begin;
> +    uint8_t idx;
> +    int rc;
> +
> +    rc = modify_xen_mappings((unsigned long)__init_begin, inittext_end,
> +                             PAGE_HYPERVISOR_RW);
So here you modify mapping of text section but...

> +    if ( rc )
> +        panic("Unable to map RW the init text section (rc = %d)\n", rc);
> +
> +    /*
> +     * From now on, init will not be used for execution anymore,
> +     * so nuke the instruction cache to remove entries related to init.
> +     */
> +    invalidate_icache_local();
> +
> +    /* Zeroing the memory before returning it */
> +    memset(__init_begin, 0, len);
here you zero the entire init. Is it because init.data is already RW, so you
don't need to modify the mappings? If so, more informative comments would be
welcome.

> +
> +    rc = destroy_xen_mappings((unsigned long)__init_begin, inittext_end);
> +    if ( rc )
> +        panic("Unable to remove init text section (rc = %d)\n", rc);
> +
> +    /*
> +     * The initdata and bss sections are mapped using a single MPU region, so
> +     * modify the start of this region to remove the initdata section.
> +     */
> +    spin_lock(&xen_mpumap_lock);
> +
> +    rc = mpumap_contains_region(xen_mpumap, max_mpu_regions,
> +                                (unsigned long)__init_data_begin,
> +                                (unsigned long)__bss_end,
> +                                &idx);
> +    if ( rc < MPUMAP_REGION_FOUND )
> +        panic("Unable to find bss data section (rc = %d)\n", rc);
> +
> +    /* bss data section is shrunk and now starts from __bss_start */
> +    pr_set_base(&xen_mpumap[idx], (unsigned long)__bss_start);
> +
> +    write_protection_region(&xen_mpumap[idx], idx);
> +    context_sync_mpu();
> +
> +    spin_unlock(&xen_mpumap_lock);
>  }
>  
>  void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int flags)

~Michal



