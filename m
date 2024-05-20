Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC75C8C9C14
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 13:25:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726023.1130290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s918M-0003oW-2l; Mon, 20 May 2024 11:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726023.1130290; Mon, 20 May 2024 11:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s918L-0003m1-VT; Mon, 20 May 2024 11:24:49 +0000
Received: by outflank-mailman (input) for mailman id 726023;
 Mon, 20 May 2024 11:24:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nMKL=MX=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1s918K-0003lv-1M
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 11:24:48 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f0c30ef-169b-11ef-b4bb-af5377834399;
 Mon, 20 May 2024 13:24:45 +0200 (CEST)
Received: from MN2PR16CA0032.namprd16.prod.outlook.com (2603:10b6:208:134::45)
 by CY5PR12MB6227.namprd12.prod.outlook.com (2603:10b6:930:21::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.34; Mon, 20 May
 2024 11:24:41 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10b6:208:134:cafe::7d) by MN2PR16CA0032.outlook.office365.com
 (2603:10b6:208:134::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35 via Frontend
 Transport; Mon, 20 May 2024 11:24:41 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Mon, 20 May 2024 11:24:41 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 06:24:40 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 20 May 2024 06:24:38 -0500
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
X-Inumbo-ID: 8f0c30ef-169b-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CDC38WT///F81ifqxvumWRqcv1WUVcdtykY1mIC7NOkeKEhsGt+C9XarYicnMovVjBOi9c2hW8FQNm6925dYhBKV+xP4sPTst+QYFIOYSzUyq88h+Br1woR8NO6UEA5OG9v9aO/eFmRJkT9dpz1AwI8R2i9zk0fdlTawXGK2EkbUrz6zyE9iitu1I1UWbFDIW2wfT4ocgMSCXJqVC/DwyRmOzA0jhe7NfCliCnr/83i7Dgb4+q16PRQvaTnGh2k3cMPS9ecSe1HdWkNIZTONYuq1i660pzBxHLkSYn7ALahANTuXewwfhArMjzcAEJdnQHXig3JGFIXXuljgLg0YAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6Dn2mNakz3TW3eerJbC6D7zuX+vojhzUPqjLfrzLPQ=;
 b=C8wAwcxX1hWBMpAYh3RYiXlJEEEb992YQ8lMJVbHHBaxDdhxza8fidOpb8toaaGM5r+18QktRqnVN14kYW7OrQIaWMqXJIXDoqcCBpvZx6Sm7IbP280v+k2M/1em6n1OglZ0EWZJOLqg0m3BiK5CyM2GM4d6nE0svHG0UXw989knVeWttvpK+ICFWv9+M2yr1tjgLfMWmwSX499FLIJZEwTVWOKKBJdTeOTwYpXuhrNXNRFe6tDiq6Rwl00G9Zy4xyiGx8NJ6sT7IgusdK2iAkcL5hcqsCfyYclA+xhw9toK4jUAsnVnGN/iGJRMD1b2+jdjqc1FDYoaVHqCDMhQsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6Dn2mNakz3TW3eerJbC6D7zuX+vojhzUPqjLfrzLPQ=;
 b=lXMFrRYccM9udbqi+DHgiPM4SIytz3B0D/jcPLyLKlMlKmSEJhNBRXbfBO0xIjlMiwlwxBpip+z6uBXPNaJJZkYy/eWz9TeJP+6AMaiumTfLfyne5whPrp2g3/6Yh0qQomUT50XtNK11dZuauL7aeXhYkYWlka7ZVzLWouhwbXg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <ee20798f-a459-492a-a7a1-308472878fe1@amd.com>
Date: Mon, 20 May 2024 13:24:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] xen/arm/static-shmem: Static-shmem should be
 direct-mapped for direct-mapped domains
To: Henry Wang <xin.wang2@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Luca Fancellu <Luca.Fancellu@arm.com>
References: <20240517032156.1490515-1-xin.wang2@amd.com>
 <20240517032156.1490515-2-xin.wang2@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240517032156.1490515-2-xin.wang2@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|CY5PR12MB6227:EE_
X-MS-Office365-Filtering-Correlation-Id: 78716d5b-137e-44c8-f665-08dc78bf7118
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400017|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RE1KMk05MEVmZGY3RVNQUEMvSE1TTEVWdjhkU0ZpR2RXZnMzeEZnb2JkUkdF?=
 =?utf-8?B?L3RnY3piR0dnN0gxeFpqUXlIS2VmdVFXRWcyY2ZNOExnWFNlR0Vad3N5amVU?=
 =?utf-8?B?ZFNveTNJeDMzb0NwSjQ4K2pFWUhhNk56UEdlYXljRDBBamNnN0twLzZ2MkxX?=
 =?utf-8?B?TlhEZmR1OWVPUDlNN2h3d0pPMjZsd0F3WEpRL1JLV3ZGa3JQMjNPMktTb3Fy?=
 =?utf-8?B?M25oV0pkS21aNk9mcHNrZ2ZVU0h6bzRTNndkUmIyb0RMRUdRZFoySEs3QVVE?=
 =?utf-8?B?MG1FOHFoM0VrdnhZVkhmSzQrOEQ0Tm1CclFuYU1FSjJ6bU5RYzJVd0RXd053?=
 =?utf-8?B?SWxQbzAzVE0xQzJSWXVFL2pTRXZ6OVN5WGg0RXkzTFU1WVdmRExuMU1mYU9U?=
 =?utf-8?B?aGpqMUl0T2d1M2x2NzZBTjhPUW5LV0xyWm5PK3VTbU91U3hLaTlSd2dPVjda?=
 =?utf-8?B?OUlKSUYzRWhJOVpEVHVPWUFaRU5lVHJ4SDNkbWkzQXRCSDdhSFNEc2VFVHhx?=
 =?utf-8?B?cE0xMnhMM3JidEVyWVRhRmJUcDc2KzFkSVVnVnpFd2htejdURUVxdGEwYm5Z?=
 =?utf-8?B?U0NLRzhUbjBMbHZ4ZUdkUWFWazl0MjFvcmNiUzk2amxJbUpZUGxLam9CZXdI?=
 =?utf-8?B?MUE3RlUwUG1YZHRMUUZWalZiTXBFOFhrRUlCZklza0xMT2dnbmRPVnMyb0RG?=
 =?utf-8?B?MXdzQkVnQXgvbmtGeVdyMlQxbXgyTmNVcjMrUVRLYWJMT0h3SWMvZzViT2lL?=
 =?utf-8?B?bTVySEY5WmVOTmFPeEdmc3BqU2lZSHFsUHpWTFpWeGlKL2dzM0d5MXA3V1RK?=
 =?utf-8?B?NDZqRmhaNkxBNjk3VWdxcVNLUUF2UEVhN1pIZVZsQlBOVFczc2dhT2MzNlU0?=
 =?utf-8?B?RUVtdndOeGFtSlplZFRLTERIMm1Tc3RYQ3hVZU0wZ1BJcm1zVVFZLzgvN0xC?=
 =?utf-8?B?REh4UGpnYW5adDJobTVHajc4YmUvQ3oySi9HRlJHb1VBcWF4TmxQK0pLQTFj?=
 =?utf-8?B?bXZsejMrblBsU2cyYTJIV21TMWl6cE53bXVNT3NuckZpbDMxL3IzbTlHSzNo?=
 =?utf-8?B?TzJOZ2o0c2FmSXpSYkI2bllpQmJMUmVoWWZiTW1paWdQaWJtK0t6d2Nld3Bl?=
 =?utf-8?B?QmhmRnpLMDA2UkFSc3RzR0xQbmJLSWFYdkNZYmtYbjA2UWhrR0w5QXFqVVBU?=
 =?utf-8?B?amVpKzV2OVpNQStzd08razZQVVJBdG9XSVUvbkNEd2dRSHczM0lDRGUvWXhN?=
 =?utf-8?B?OGlid3Z0ZlF0alZmNld0S1VUamVyM0l6cWJ0Q21RZjdFMzdQSjE1UWV3dFZl?=
 =?utf-8?B?Q1RkRDAwc2gxZnVaS3AxbDljUmRQTlJiSVJHVXk0M2lyMURjTWo3N2V6RHVL?=
 =?utf-8?B?QURvZjY5Z3BETy9VMnMxczNGTTNOMzRKMjRYNmdBaXU3NjlHSGZwMW5ST1Vj?=
 =?utf-8?B?OGtacHlKeUgyUVB5YlJZN2FUY1pjVFBvdDRDdkU1R1pmeWlvdVF1RS9tejA4?=
 =?utf-8?B?RjhaeVI0N0pGbUdDcHIwYjg0cmp5dFE2c3o0RWtBcXE1c2pBNm5oM0k5bUha?=
 =?utf-8?B?a1lWejNKdnpCYXBST3RGQmFBeHUwNGU3MVlCU1NhV2V2Tk9NelR3ekZ3Z3hT?=
 =?utf-8?B?WDYwVy9Nd095VVZ3ZTFVR25rOVpaeFMvUXR0NVNSbGc2VDRJMTRDNkFVKyts?=
 =?utf-8?B?NjliamZ6azBVcTV4SGpjUFdTWHJZTzY3YVdmSHBUWEZ6RDZqMmIyVC9oVmdV?=
 =?utf-8?B?Z1B1ZnJwTmRnQWJVbnpLV0tvWXgzUktvQ1dMY0FNTUwvMFd5WFRlVjVwWTNs?=
 =?utf-8?B?b3FFcnQwS3hKbk93citRaUVXUHZra0dkN3N0aStxd3hBcnRKekRpWi9GUnBO?=
 =?utf-8?Q?0D6bLjqxr9vIn?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 11:24:41.0847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78716d5b-137e-44c8-f665-08dc78bf7118
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6227

Hi Henry,

+CC: Luca

On 17/05/2024 05:21, Henry Wang wrote:
> 
> 
> Currently, users are allowed to map static shared memory in a
> non-direct-mapped way for direct-mapped domains. This can lead to
> clashing of guest memory spaces. Also, the current extended region
> finding logic only removes the host physical addresses of the
> static shared memory areas for direct-mapped domains, which may be
> inconsistent with the guest memory map if users map the static
> shared memory in a non-direct-mapped way. This will lead to incorrect
> extended region calculation results.
> 
> To make things easier, add restriction that static shared memory
> should also be direct-mapped for direct-mapped domains. Check the
> host physical address to be matched with guest physical address when
> parsing the device tree. Document this restriction in the doc.
I'm ok with this restriction.

@Luca, do you have any use case preventing us from making this restriction?

This patch clashes with Luca series so depending on which goes first,
Acked-by: Michal Orzel <michal.orzel@amd.com>

> 
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> ---
> v3:
> - New patch.
> ---
>  docs/misc/arm/device-tree/booting.txt | 3 +++
>  xen/arch/arm/static-shmem.c           | 6 ++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index bbd955e9c2..c994e48391 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -591,6 +591,9 @@ communication.
>      shared memory region in host physical address space, a size, and a guest
>      physical address, as the target address of the mapping.
>      e.g. xen,shared-mem = < [host physical address] [guest address] [size] >
> +    Note that if a domain is direct-mapped, i.e. the Dom0 and the Dom0less
> +    DomUs with `direct-map` device tree property, the static shared memory
> +    should also be direct-mapped (host physical address == guest address).
> 
>      It shall also meet the following criteria:
>      1) If the SHM ID matches with an existing region, the address range of the
> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
> index 78881dd1d3..b26fb69874 100644
> --- a/xen/arch/arm/static-shmem.c
> +++ b/xen/arch/arm/static-shmem.c
> @@ -235,6 +235,12 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>                     d, psize);
>              return -EINVAL;
>          }
> +        if ( is_domain_direct_mapped(d) && (pbase != gbase) )
> +        {
> +            printk("%pd: physical address 0x%"PRIpaddr" and guest address 0x%"PRIpaddr" are not 1:1 direct-mapped.\n",
NIT: 1:1 and direct-mapped means the same so no need to place them next to each other

> +                   d, pbase, gbase);
> +            return -EINVAL;
> +        }
> 
>          for ( i = 0; i < PFN_DOWN(psize); i++ )
>              if ( !mfn_valid(mfn_add(maddr_to_mfn(pbase), i)) )
> --
> 2.34.1
> 
> 

~Michal


