Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6076B89DA76
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 15:38:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702451.1097467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruBg6-0003JO-Ax; Tue, 09 Apr 2024 13:38:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702451.1097467; Tue, 09 Apr 2024 13:38:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruBg6-0003Gz-89; Tue, 09 Apr 2024 13:38:22 +0000
Received: by outflank-mailman (input) for mailman id 702451;
 Tue, 09 Apr 2024 13:38:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NvYF=LO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ruBg5-0003Gt-FS
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 13:38:21 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2009::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c481179-f676-11ee-94a3-07e782e9044d;
 Tue, 09 Apr 2024 15:38:19 +0200 (CEST)
Received: from PH7PR10CA0009.namprd10.prod.outlook.com (2603:10b6:510:23d::29)
 by SJ2PR12MB9005.namprd12.prod.outlook.com (2603:10b6:a03:53d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 9 Apr
 2024 13:38:15 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:510:23d:cafe::ba) by PH7PR10CA0009.outlook.office365.com
 (2603:10b6:510:23d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.36 via Frontend
 Transport; Tue, 9 Apr 2024 13:38:15 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 9 Apr 2024 13:38:14 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 9 Apr
 2024 08:38:14 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 9 Apr
 2024 06:38:14 -0700
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 9 Apr 2024 08:38:13 -0500
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
X-Inumbo-ID: 6c481179-f676-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gpV4NrEq+lV8KuEBy98T8ksphJ6E/c32YgIIh9t4TyC/K7Lyu8qzttF1jIlyFJOYYFBvUH6YsnooDxAvFko0XIr9+TVGQapNk2teZ72SjMC8eI5Dig3eGLxLXJog0fUrG7eCIlsMVfVZx8QPFKT3XkUh/ykvQ6OAsRxsAFL+3WszXukxnoqEd91UdwOC+dDU/yAKOAWqatGc64kWQ+vKeqfudL5rqnFW0aRGsxnRF4SPbDtSDGzXLhJkfFpVFoxYxadq+C7GxsPVIbpxx2v0LiMMAdZjSjOiZZcbS+y7FxdDKFZzLHLVHOdd9LI0ig0RuIOTAHxXgvJJ7tuoC26x0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1S5gcepFEut6mWo0Vqg5/fAfmi2CGeyyFjQ/NZPEUJM=;
 b=IrFiZmO8NSfe9VjZ+nh6OSR5AoU9xfiyubvmNWlDAyw0/+vNCzzw9ZtQIJ/gX13uyWa/BU/NxYoe/8VW/QFUKTGQyIHIpnZbCZPSg5XGyEfW9cTXJKtIm5B+27heZO33ffNms0QhwwI8mSH68fZAXjjRYoZ0Ht8OmrGX7bz7L4yUTuSlkNJjtUskE6MCBIicRt7FGaKhell91EJfl1ZiuVgiPiouAocKyfukLL/e/hBk59of0tINBlv/x19YRL0nkZERDc3Ewbcl2SArpLMIbm2WAuzYdOXuGvg6uvSuTXPqoxtwMrH6HjJbmFY5YJPF90IHUg9+PAHLLWtSiMkKUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1S5gcepFEut6mWo0Vqg5/fAfmi2CGeyyFjQ/NZPEUJM=;
 b=g5FbloD55hGYH6LqUhZrMkSJYJfe1CYgtOkRN7s26XqIwf3uPtMpygvV4sX6+tDT6w6GPX6RIM2/VbLlQabQkF1R5yNhrC6T8bvKBWXpOHAieepqrncIf8Bp0mp9wSIsQTNNtCETvPfjNR5jTtODrBkANfIDrh82Jb7mL9+MWO0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <611fb8ea-1b2f-487e-956f-0aba716912c3@amd.com>
Date: Tue, 9 Apr 2024 15:38:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/13] xen/arm: Avoid code duplication in
 find_unallocated_memory
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240409114543.3332150-1-luca.fancellu@arm.com>
 <20240409114543.3332150-7-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240409114543.3332150-7-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|SJ2PR12MB9005:EE_
X-MS-Office365-Filtering-Correlation-Id: 5458b75a-6643-4ac4-9dd0-08dc589a4eda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Rm2T8Wpi/bSTOtiNNGOr+GGhx7T3zWoQ3ulKrKzs/LVuEGm60HgcS5CYWOxnc+pmG8yL/WRomB0Op7pHokJsez+cURIqo+a/NXqAcGsjQs/mZ6JDk9xPfxfmPpizsQEIzoy+ozIL8RR6bO9a/tDA/ZdIqjMAQxDuqjZ2I+H8poQS4tqJCxfwTlUfdhomAzpg4gYPVBpzo7Wew21lq2RB5OZh4hWVgOUVbj9pJiJLokkq2aEo1CMnsUcj90nDBySSAmoNiC/sjxt8XZIq5+MQPzdhyZBY5s67/kjZjAKJm6cRt7MWEG6Qf1gn/WsGLit2hMyNNDTU99COSPw+ZONDzEXomVaP38HSIvap73LI4llIFPgrvacLDr/nVUoKcBIwkGiqCgQe9zvRPr28zaQ/KwhMOVN1byx7V/3yLieknE6F5sDNGeqTmvBHQQyBcIxLxTIRtLi3WtPJVXk0xoqHgY8n7PPyjIMV5mGK2jAPrNVlE2vbL5id84nqH+adtc1qEbhxQ33QRQGkHUNY8ILKDLmErjLewIzeh70W4Lc+N14t7220kWrn3y8UpINnTbZt15u0eUyOTj/0rx+80wY7bFEegTQXhBNwjdwXuUr4GJMC2/a8uxGJSIonAPGhnphZW3OdQLSVzO2aiH7/sQwZ1MQAscStInOVcE61k0Kp6G2aSEUshI8XNxFjSM4p0lHXeexNePTHN/oMzE2jQPuBR0H2A6w6Vs9Hr8TSbKcKWUIln01WfpGODGflWXuJiM4B
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 13:38:14.9843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5458b75a-6643-4ac4-9dd0-08dc589a4eda
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9005

Hi Luca,

On 09/04/2024 13:45, Luca Fancellu wrote:
> 
> 
> The function find_unallocated_memory is using the same code to
> loop through 3 structure of the same type, in order to avoid
> code duplication, rework the code to have only one loop that
> goes through all the structures.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v2:
>  - Add comment in the loop inside find_unallocated_memory to
>    improve readability
> v1:
>  - new patch
> ---
> ---
>  xen/arch/arm/domain_build.c | 70 +++++++++++++------------------------
>  1 file changed, 25 insertions(+), 45 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 57cf92668ae6..269aaff4d067 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -869,12 +869,14 @@ static int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
>  static int __init find_unallocated_memory(const struct kernel_info *kinfo,
>                                            struct membanks *ext_regions)
>  {
> -    const struct membanks *kinfo_mem = kernel_info_get_mem_const(kinfo);
> -    const struct membanks *mem = bootinfo_get_mem();
> -    const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
> +    const struct membanks *mem_banks[] = {
> +        bootinfo_get_mem(),
> +        kernel_info_get_mem_const(kinfo),
> +        bootinfo_get_reserved_mem(),
> +    };
>      struct rangeset *unalloc_mem;
>      paddr_t start, end;
> -    unsigned int i;
> +    unsigned int i, j;
>      int res;
> 
>      dt_dprintk("Find unallocated memory for extended regions\n");
> @@ -883,50 +885,28 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
>      if ( !unalloc_mem )
>          return -ENOMEM;
> 
> -    /* Start with all available RAM */
> -    for ( i = 0; i < mem->nr_banks; i++ )
> -    {
> -        start = mem->bank[i].start;
> -        end = mem->bank[i].start + mem->bank[i].size;
> -        res = rangeset_add_range(unalloc_mem, PFN_DOWN(start),
> -                                 PFN_DOWN(end - 1));
> -        if ( res )
> +    /*
> +     * Exclude the following regions, in order:
> +     * 1) Start with all available RAM
> +     * 2) Remove RAM assigned to Dom0
> +     * 3) Remove reserved memory
Given this commit and the previous code, I expect one call to rangeset_add_range() and
3 calls to rangeset_remove_range(). However ...
> +     * The order comes from the initialization of the variable "mem_banks"
> +     * above
> +     */
> +    for ( i = 0; i < ARRAY_SIZE(mem_banks); i++ )
> +        for ( j = 0; j < mem_banks[i]->nr_banks; j++ )
>          {
> -            printk(XENLOG_ERR "Failed to add: %#"PRIpaddr"->%#"PRIpaddr"\n",
> -                   start, end);
> -            goto out;
> -        }
> -    }
> -
> -    /* Remove RAM assigned to Dom0 */
> -    for ( i = 0; i < kinfo_mem->nr_banks; i++ )
> -    {
> -        start = kinfo_mem->bank[i].start;
> -        end = kinfo_mem->bank[i].start + kinfo_mem->bank[i].size;
> -        res = rangeset_remove_range(unalloc_mem, PFN_DOWN(start),
> +            start = mem_banks[i]->bank[j].start;
> +            end = mem_banks[i]->bank[j].start + mem_banks[i]->bank[j].size;
> +            res = rangeset_add_range(unalloc_mem, PFN_DOWN(start),
... here you always call rangeset_add_range() which is wrong. For direct mapped domain
you would e.g. register its RAM region as extended region.

~Michal

