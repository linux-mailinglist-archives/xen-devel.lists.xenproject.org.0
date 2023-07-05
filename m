Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36677748827
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 17:36:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559400.874339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH4Xt-0002aC-An; Wed, 05 Jul 2023 15:35:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559400.874339; Wed, 05 Jul 2023 15:35:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH4Xt-0002Wq-7q; Wed, 05 Jul 2023 15:35:57 +0000
Received: by outflank-mailman (input) for mailman id 559400;
 Wed, 05 Jul 2023 15:35:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gl5h=CX=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qH4Xr-0002W5-SB
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 15:35:56 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20607.outbound.protection.outlook.com
 [2a01:111:f400:fe59::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fa62861-1b49-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 17:35:53 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by BL1PR12MB5141.namprd12.prod.outlook.com (2603:10b6:208:309::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 15:35:47 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 15:35:47 +0000
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
X-Inumbo-ID: 9fa62861-1b49-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KQcoAJZGt3/mGPj/MSYKBDUiYKvf5NY7NElNsSeCyTaIWl+U1JDn7BDzSqQIL1ZpIwLs66La2Y7c8K2vo7SrC7GQdh8RmtkK2PADjblHoz54OAZ2cLoo7sKTrddxaoMQ1E62zboaOwwzECSxl+c2Ek05XmOAMS3MdYK3UVa4lTY91mDZG8wqv564rtivNttH/hF5t6pnqIj9GedJ5+obk8zb1PoWhtcbaYIyLieWnOFwkqzHYm3kxDKZp38w6rfnHCRYn5zKa7UDgy5dshyMW6zPbU5MCJApUJARpCsEdmmIaC+O2Cf1gMeB4OUnxu66IeOevccahkwzZ1Wga6CD2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/X95fl4pACk9QABCfkwPBpjGEjw28DThdzEJwEWRfY=;
 b=UJ/+kT5K9/trgUQNeu3qPofRPXAfif38SLmiYZe5rXggDq+GxlajQA1B5KhyNXBpjDmp6Zc5996Attof6kgzqD6F/cR7w5/niYHmP/gMxdfCnLadMdGZKxh660gTaIh1Bj+6+0KUcxjzXSeNr/cugb5SPrKzhmR6LNoljeQsHrUZt0nrkQfB6tMr6Yy+l2vR07z+oPekslJ4UYwjXbee/qufwKq4o6WSJTuf4RvomPQlrXBccYkUSaUtbfpCM1nweOO8l8/kQN9/edD+Gmla7YPe4eZVHygPtc+JGx/QmtLMKkn512yxGxIty71+6kJ/qm/JC2Mn33VsePiSnheCoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/X95fl4pACk9QABCfkwPBpjGEjw28DThdzEJwEWRfY=;
 b=mRSQJ78Dlsnedpxv5dHtYHmFLwyUvrSswjyD/h1yblr9OoCzwQCjRYhTzvEwm0MFgG0GxYS1jPSI0rU8pU1jKExj7lEFVLiqOIWy3Mi6kXpl3axWWDMCQdfcfl+jRDVNXNvZNAWW0MVTe9j01bRe/+xEU5svalIs1Td0GxuL0vM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <7df5b74c-8570-a484-b0c3-978a44a7c66a@amd.com>
Date: Wed, 5 Jul 2023 16:35:38 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 44/52] xen/mpu: P2M initialization in MPU system
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-45-Penny.Zheng@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230626033443.2943270-45-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0227.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:372::14) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|BL1PR12MB5141:EE_
X-MS-Office365-Filtering-Correlation-Id: f0bd8c8d-1fad-42d6-5912-08db7d6d811c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BG++Ff4iPrgtlKM+u0yeb/puS9yje+kCS6M3koYTk/QRsMsTf0jycss/C4Ixlj6S4whVrU8tzHjHekgXTxDHpaG23zdXYRULL3rUiP4/sgPrYvqRzf0s6/D9BnWaeUTi4uyhLP+S0Jz6oVzPIWEytJ64MIui96bsXo2Sjz8MyRn32DSXiruRUxsam1IsLiXlpUhiI/Kvry0SBsY2ADB2sis+mEgILkZ5jpsW6SbzwdGE3FVFzx6dyt2Uv4B7g3U4bEKJRZSW1avQrcKMlDaln0gVeyvwORpJ1QDiau6PGkzC207b4FhB/oDmN98BttdHoAA3j+OE805rJKJn3W/9FVQF6eqYRMVHd97auShq23i6/nHxqEFwyjnqN/oqbA52rbwYzys6xP4ueuuzA/KqCRmsSYvGDg2q3jV9xeYQoY2Gk46TWJwW12SPi87W2ltyk/e8tacOVW6aqFHD8toMkZ7NLbfeyl5zpFVSe/V/KwMfWjVDJlOk3R6ot6CNqTgveodCW/XYr9yIxkzZiSS4apkazcJ7JSQSROzFsKRPPa17ReydpBp8a7McW2bheBkJp8WqrG47QnYEXsjh69hPFsV0ZwMzU1bxn0kTXGxKfyeIZW25F5qPI1CzQ25JTQwtJ6c5pNwEcdryaAYTYPJMDA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(136003)(376002)(366004)(451199021)(36756003)(31686004)(31696002)(2906002)(5660300002)(6512007)(186003)(83380400001)(6506007)(26005)(53546011)(6486002)(54906003)(66556008)(66476007)(4326008)(38100700002)(2616005)(316002)(66946007)(478600001)(6666004)(8936002)(8676002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aThxTE9oVTJRSkRyTXZrQk9HTmsvQlJub2xLWEU0czZqd3R2MWZvdEdtOEpt?=
 =?utf-8?B?blR1OGJpeS9RZkd4K2hYNVd0SHVkOXp6SlU5N09aQ3hIWXVaaWdUb2JqWXhI?=
 =?utf-8?B?cW5TM2lRSjllZmc0QkVDVWpUV00vcE02cExIOWNtNGRyaFpTUElCSm9RSzFl?=
 =?utf-8?B?NjMyL094bXYwQ0JTNTB5akVDQ04rOXo1Ymx4NU5LSkdvNVFCTGxIVUltN3ZE?=
 =?utf-8?B?MXZhZE9tS3MrL2VsQktjaDJCU2JJemhXd3FQSlJPaHFrOUNlaFdRdVdzbW1z?=
 =?utf-8?B?S3liZHBnNjk5M2RBZzJGd2IxTUhPbE9rcDM3Nit1QXppQ1hiYjJRQXJhVm1X?=
 =?utf-8?B?TkhFMUx0Q1FmOXN2aGJVaW1BNkJVaDlhN1pSemdlcWxUWW9NaHJYVzgxZThQ?=
 =?utf-8?B?bG5ZeUhlZWk2bDZPdFlUK05pT2R3L2Qrc2dpaXJKbTdqQm9hQktlMm5mN1cr?=
 =?utf-8?B?ZUNLTlBTZWtKamZXVGV2Z3ZxdmxoSEczVVpEQ2lYZTQyOFJhdC94WUJMWkFr?=
 =?utf-8?B?cThqalVDUC9XRmRhR2ZUdkNSUjFVZitpcXdyVnlHZ0VEbE9yOE56Vkx1OGRC?=
 =?utf-8?B?WXdZcWdWZUZWQUdNSHc0ZldYdGp5Q3V3RnZablRDY2tmWE5ja3IvT21Ea0M4?=
 =?utf-8?B?am5HWGdLL1RFREpxd0RmZ0wyY1NrbEZ3NytLV0pUd2F5YWNic2oxcUpXOWpn?=
 =?utf-8?B?blFDQmJJZm1pa2UxV0dZOEdialdWRy94YnJ3NWlySnVRb1FoVjU0ZVBFZWVS?=
 =?utf-8?B?RXR0akhicGF0RkJ3YTl0czdzYnFBTVdvU2pDaHJjcjBvRjczSVZOYzNISEJJ?=
 =?utf-8?B?d0g2VzlHOXZRcUpDd1lVRGsvbGIrNkRXa1BpTTRIVXBQd21vUGpyb1AzbC9i?=
 =?utf-8?B?WmNqQngvUXV2MTVjTUhKNTVjQnZ5eEZNbWpnT0hEQTVSOUV4YlY1engraVRx?=
 =?utf-8?B?R2VBdG1nYS8yUm5hWGpDbmJtbWp0UWZMUmQ1ZUwrdmhFMldiUVRsWEVNa3Uz?=
 =?utf-8?B?RG5vcm1WWElPcU9xb0NlTTBZeUxDeSt5ODVCcWtFdmxNaTFiWjNDRkltYkd4?=
 =?utf-8?B?Ty9pNVNyN1hMV204ZkFHYUIzOE8wZUtQNytRRWk3b2l3dDBmMVdoTmNEV3kw?=
 =?utf-8?B?VWU0NEVnYjlucG5Xc0xySmVLSTZXT2pyUXpRQmFPNnRqY2Q4S0JEQWl3cWdK?=
 =?utf-8?B?UlhiMDVpRGdVSHFqSG1jNUYzcmR0ZmRHRGdMcU1TTDB0SkhGaytkcSswa0tx?=
 =?utf-8?B?YjJQa21GWDd4ZS84UHR0UFh5M09DNmJkRnY1cTdUNWZSbjZBY2RXdDdLWXJX?=
 =?utf-8?B?ck1ZRnFHaHltemU4b0wweGQvQ0pSbFBKdDNUQjVEeUhPVEwxdThzVTZyN3Bw?=
 =?utf-8?B?TzJjSnYydzJMWlcwZmlXQ3dVU0ZWTmsxb1NzMWhVZDJaUERoZ3NHdlRqM0dm?=
 =?utf-8?B?NGxDaUV6ZlZnb01ibGl6ckc1dHNSVzkzQ1Nnc3FGWTZrQ3NyV1I2a0ppVnpI?=
 =?utf-8?B?dVdERU0yQzAvNXB2Rkpsc3ZpZjVmckdoZ24vNzVEcHNzakhFbkk3QjdSS3VT?=
 =?utf-8?B?THhiUWo0K0lDVmtWTWtwS3RkNkR6cmRYYkUreGxsMklCb0JzZ29JUUxiN3l0?=
 =?utf-8?B?MUQ5Qmk3UjdDaGRYL1AxZ2dSMkpNTnpUQVhLN3daSW1PUFlTSWIvQVRUNExs?=
 =?utf-8?B?ZnM2bG5kZ0xNZUV1ald6SlY0cGtWMkNRNHZ0anBiN0ZoZ0lpN3dIRUVnL005?=
 =?utf-8?B?M2laMzhNNEIzeEE4NHBDQnp4eVpuN3RVd0pLNi9KMUNmeEFDTWJnMU9HMlN1?=
 =?utf-8?B?NXVjcERNY01rVUlMZE9zRXRPYW9aUC9hU2JCZVRlQjJTZ2JnNGI2Q1BnelhL?=
 =?utf-8?B?TEpJT3dWY2tHMVd5YW9Qb2VMR2V5QXNVUG4weHhBbWlRNEtBbG9DaHVPOGs3?=
 =?utf-8?B?VmdDZndnYUlDVWk4QmlGZHhsSG9PK0hXK0x2TU5HWGlId0FEVUhJYzlEaVdr?=
 =?utf-8?B?cTNla3VQek5JeXJKQnNYUXp6VCsyelhaamlaNTdQNlUzTkNyUkNKWDQ1eUx6?=
 =?utf-8?B?VFlnelpiNFRKSzFhaFBYS0VQOFF0R28xdUZ5cHhjNk5BMTFGV2MrNVUxL2NI?=
 =?utf-8?Q?cJyVm9fgBY2OkN7V27hunvpev?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0bd8c8d-1fad-42d6-5912-08db7d6d811c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 15:35:47.6648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZ7Nb3hQ80nDeC6KzUrOQPu7hL9TjMYMuoJDT+I/PrFZ9x9cnbz+2GzABwIfaoD7TausaTvUPtxB+swkPSHOGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5141

Hi Penny,

On 26/06/2023 04:34, Penny Zheng wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> We inherit p2m_init() to do P2M initialization in MPU system, including
> VMID assignment, setting up P2M MPU region mapping table, etc.
>
> p2m_alloc_table() is responsible for allocating per-domain P2M MPU memory
> region mapping table. As a MPU memory region structure(pr_t) takes 16 bytes,
> even with maximum supported MPU memory regions, 255, MPU memory mapping table
> at most takes up less than 4KB.
>
> VSCTLR_EL2, Virtualization System Control Register, provides configuration
> information for VMSAv8-64 and PMSAv8-64 virtualization using stage 2
> of EL1&0 translation regime, bit[63:48] of which determines VMID for the
> EL1-Guest-OS.
>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
> v3:
> - new commit
> ---
>   xen/arch/arm/include/asm/mpu/mm.h |  3 ++
>   xen/arch/arm/include/asm/p2m.h    |  5 +++
>   xen/arch/arm/mpu/mm.c             | 22 ++++++++++
>   xen/arch/arm/mpu/p2m.c            | 69 +++++++++++++++++++++++++++++++
>   4 files changed, 99 insertions(+)
>
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index a83519ad13..4df69245c6 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -2,6 +2,8 @@
>   #ifndef __ARCH_ARM_MM_MPU__
>   #define __ARCH_ARM_MM_MPU__
#ifdef CONFIG_ARM_64
> +#include <asm/arm64/mpu.h>
#endif
> +
>   extern struct page_info *frame_table;
>   extern unsigned long frametable_pdx_end;
>
> @@ -11,6 +13,7 @@ extern uint8_t is_mm_range_mapped(paddr_t pa, paddr_t len);
>   extern void *map_mm_range(paddr_t pa, size_t len, unsigned int attributes);
>   extern void unmap_mm_range(paddr_t pa);
>   extern bool is_mm_range_mapped_transient(paddr_t pa, paddr_t len);
> +extern pr_t *alloc_mpumap(void);
>
>   #endif /* __ARCH_ARM_MM_MPU__ */
>
> diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
> index d9c91d4a98..c3598d514e 100644
> --- a/xen/arch/arm/include/asm/p2m.h
> +++ b/xen/arch/arm/include/asm/p2m.h
> @@ -61,8 +61,13 @@ struct p2m_domain {
>       /* Current VMID in use */
>       uint16_t vmid;
>
> +#ifndef CONFIG_HAS_MPU
>       /* Current Translation Table Base Register for the p2m */
>       uint64_t vttbr;
> +#else
> +    /* Current Virtualization System Control Register for the p2m */
> +    uint64_t vsctlr;

register_t vsctlr;

So that it is 64-bit for ARM_64 and 32-bit for ARM_32.

> +#endif
>
>       /* Highest guest frame that's ever been mapped in the p2m */
>       gfn_t max_mapped_gfn;
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 27d924e449..de5da96b80 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -872,6 +872,28 @@ void __init remove_early_mappings(paddr_t dtb_paddr)
>               panic("Unable to destroy early Device-Tree mapping.\n");
>   }
>
> +/*
> + * Standard entry to dynamically allocate MPU memory region mapping table.
> + * A 4KB page is enough for holding the maximum supported MPU memory
> + * regions.
> + */
> +pr_t *alloc_mpumap(void)
> +{
> +    pr_t *map;
> +
> +    /*
> +     * A MPU memory region structure(pr_t) takes 16 bytes, even with maximum
> +     * supported MPU memory regions, 255, MPU memory mapping table at most
> +     * takes up less than 4KB.
> +     */
> +    map = alloc_xenheap_pages(0, 0);
> +    if ( map == NULL )
> +        return NULL;
> +
> +    clear_page(map);
> +    return map;
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
> index a7a3912a9a..8f728f8957 100644
> --- a/xen/arch/arm/mpu/p2m.c
> +++ b/xen/arch/arm/mpu/p2m.c
> @@ -4,6 +4,7 @@
>   #include <xen/sched.h>
>   #include <xen/warning.h>
>
> +#include <asm/mpu/mm.h>
>   #include <asm/p2m.h>
>   #include <asm/processor.h>
>   #include <asm/sysregs.h>
> @@ -97,6 +98,74 @@ fault:
>       panic("Hardware with no PMSAv8-64 support in any translation regime.\n");
>   }
>
> +static uint64_t __init generate_vsctlr(uint16_t vmid)
> +{
> +    return ((uint64_t)vmid << 48);
> +}

Please move ^^^ to ./xen/arch/arm/include/asm/arm64/mpu.h as it differs 
between R82 and R52

- Ayan

> +
> +static int __init p2m_alloc_table(struct domain *d)
> +{
> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +    pr_t* p2m_map;
> +
> +    p2m_map = alloc_mpumap();
> +    if ( !p2m_map )
> +    {
> +        printk(XENLOG_G_ERR "DOM%pd: p2m: unable to allocate P2M MPU mapping table\n", d);
> +        return -ENOMEM;
> +    }
> +
> +    p2m->root = virt_to_page((const void *)p2m_map);
> +
> +    return 0;
> +}
> +
> +int p2m_init(struct domain *d)
> +{
> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +    int rc = 0;
> +    unsigned int cpu;
> +
> +    rwlock_init(&p2m->lock);
> +    spin_lock_init(&d->arch.paging.lock);
> +
> +    p2m->vmid = INVALID_VMID;
> +    p2m->max_mapped_gfn = _gfn(0);
> +    p2m->lowest_mapped_gfn = _gfn(ULONG_MAX);
> +
> +    p2m->default_access = p2m_access_rwx;
> +    /* mem_access is NOT supported in MPU system. */
> +    p2m->mem_access_enabled = false;
> +
> +    /*
> +     * Make sure that the type chosen to is able to store an vCPU ID
> +     * between 0 and the maximum of virtual CPUS supported as long as
> +     * the INVALID_VCPU_ID.
> +     */
> +    BUILD_BUG_ON((1 << (sizeof(p2m->last_vcpu_ran[0]) * 8)) < MAX_VIRT_CPUS);
> +    BUILD_BUG_ON((1 << (sizeof(p2m->last_vcpu_ran[0]) * 8)) < INVALID_VCPU_ID);
> +
> +    for_each_possible_cpu(cpu)
> +       p2m->last_vcpu_ran[cpu] = INVALID_VCPU_ID;
> +
> +    /*
> +     * "Trivial" initialisation is now complete.  Set the backpointer so
> +     * p2m_teardown() and friends know to do something.
> +     */
> +    p2m->domain = d;
> +
> +    rc = p2m_alloc_vmid(d);
> +    if ( rc )
> +        return rc;
> +    p2m->vsctlr = generate_vsctlr(p2m->vmid);
> +
> +    rc = p2m_alloc_table(d);
> +    if ( rc )
> +        return rc;
> +
> +    return rc;
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> --
> 2.25.1
>
>

