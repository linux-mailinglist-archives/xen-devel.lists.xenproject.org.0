Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 307067474FC
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 17:11:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558494.872647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGhgJ-0000MK-Ek; Tue, 04 Jul 2023 15:11:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558494.872647; Tue, 04 Jul 2023 15:11:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGhgJ-0000Kb-Bx; Tue, 04 Jul 2023 15:11:07 +0000
Received: by outflank-mailman (input) for mailman id 558494;
 Tue, 04 Jul 2023 15:11:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gy6C=CW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qGhgI-0000KV-4B
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 15:11:06 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20626.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd52a637-1a7c-11ee-8611-37d641c3527e;
 Tue, 04 Jul 2023 17:11:03 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by IA1PR12MB6532.namprd12.prod.outlook.com (2603:10b6:208:3a3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 15:10:59 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 15:10:59 +0000
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
X-Inumbo-ID: fd52a637-1a7c-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJuWo5vFijYkGj5R4ChaPKhw7WOaH++tpUHGIqN3mBPUxiEE8QEAbPsAenJC6feQ0X8ypzMp8bEP+2YHnPBh0bJac62vOzIx7QcmvK8SF6F7AmB/S9NCYupeCMoaBhSQYwZBv4gdMwetl9KoSoTB+g9Zbm1cc7hE0Sjmj+lYH/U6gB+c8KstEq37wnLfHWorqLE/B1uurs54VHDUwzjIiS++OzruIfq77wV9n8y1SBp/V6Wb0U4bm25yHC3dOcCjoOizMbD8CcRowUKG+wAxjL96onfBqwQz4tP/5rLtjyCpbEf8QQz2dEwnqFqvxRvMYOb7yYxy3p00jiS6eW7ogw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nOcm/RpHgjydAlWbSkr4gvYaSLUTD3uhqwiyKA7/TF0=;
 b=VtpE1i3eY/BbVc6jWGIRs61uEEIQ4QfpQrTpy+tgy2qo4WsU4utocZOvpQcBLrpzwULtcw3kStNGg3oicU+9u3xkRmMgBBNSDhjEtvcaZGHgBgfze5daJk6TlSa8fpyiEc1na1Z5bn7EgpBF07B2zPvaH9xSsK/WitEDmpCLl4Np7lJlqpY5zidiPzTw9Qnsb28pKoKeWV5cyqDfI5QkjHZsmTwui+Z797T9JWU/7u+2Fw1OR40KSOQx5P17eV5+SgdGr0sBu4N0KFEEZiLFjrKtdeZ2x2wQvf+xMMFaZxHZt1nqRanF/RbgRCmZcthxojX0oJkQuvZhrhyyESeL2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOcm/RpHgjydAlWbSkr4gvYaSLUTD3uhqwiyKA7/TF0=;
 b=WcC0GcqK0ulyRQmPMdiduAAlC60BSto4Is7npuFIjvyeTOXJL/xPX3dJ8+kFnhrHHgpF7bDARjcxkt/91X/PBAlyAR5ANNRWOJ/XJS+Afc5ABCErzNOXuci8MYypoRvhDqatarbdPNRVkKeG4F/QjQjkOwGhEzmsZyc9AjMs8u4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <16428e2d-423c-6a9c-5caa-6ff5770a840e@amd.com>
Date: Tue, 4 Jul 2023 16:10:52 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 35/52] xen/arm: map static memory on demand
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-36-Penny.Zheng@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230626033443.2943270-36-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0077.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::8) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|IA1PR12MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: 36f35e63-7811-4f91-2183-08db7ca0df89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QTOuQqnIH0/u/N5tj2BArR/pwwQG4GyUuE96fJRDrJNssLgvII23aI2r86/A7of81RqpcupqKjXDq7EMa/nCKxN5ANumRjnBrQ+75ud/QgPPTUwPKf1PeyFkxv7H5x1CUchtiN36iEM+zXMp4r2iuT/Jq5JXC5HH2lV7OCY1JMlZKfywjjaFE+FHs8Gf/3+DFD2a0rlwa81k8q9PQ7ndqo1cVTbsnhFSze9xi072Y5VOrY3SGfBAxFYHvPtFiccASxwLu4epth66xncqrrl7oNO7ONMYrDb7dmZW1/3cLxKQcBLU2oKwyc7/2sOolyEqSp7PFeU+ICs8l4NvJOUXhDZedN3E5YUZvUAH6MEGklIWBvnfaxv9jwxvkkV4rzcVPC4gtus4bEy1xBnITcRjpJLdwGU+XCbWmTvHEFCzmzpwSotZW1OUAE0hx4AmF8uJygAkh4jrFkH4OeA7P/w+N8S9+BzRI0SD9xcO5bOGIxMrt4OX0h5AbIq2V0F/EMy0QvWCeJrvVEjG+QCq+XpnULu0QWIkb+48EGgRWjKH09IJkA1dchYqalQxRiZ+a6AjHuD5z5ZfnWTnGkqYDZgtspbcN1nbrhRCgyEOcFZ32o9wBPpBI5ss0EZjBOPZUqoY0pdGQ6KJbYGSS4Lxe/UO8A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(376002)(396003)(39860400002)(451199021)(4326008)(31686004)(316002)(66946007)(66556008)(186003)(31696002)(26005)(6512007)(66476007)(6506007)(53546011)(83380400001)(2616005)(2906002)(6486002)(6666004)(38100700002)(5660300002)(478600001)(8676002)(54906003)(8936002)(41300700001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDZ1SjlVWVE0UWJxWmNZcVoyRnV1WWZXb3JscmZXdTRjUGN3YlF4bjltUjZv?=
 =?utf-8?B?Y2tQcmZ3aUpCcndhMzFudk4vT2lwaU5NMVlYdERqSWZXWEcyekZWeVNULzNy?=
 =?utf-8?B?dU8yUGdwMVZkN29PcGszRmxpWlcydXVSUkpTUkh5NFZYTEhPYW4weTVMTmdh?=
 =?utf-8?B?L0dYT1ZGZEVNb1dzT1ZiUlp3Nnhkc1VXNUVnTGV6MS9rcnhpSFZ1QmNZTjdl?=
 =?utf-8?B?bTJma0EvOHJYZ2RNU1UwSWlLMkM2QWhpSXJOaW5UczBnRUpramV1ZXNnRlU0?=
 =?utf-8?B?Tkd6dG1Ga0JyL0tOWXV2eUNscG5pc3ppTFlmN0w3MENUeXRkeUtWV1JRaElY?=
 =?utf-8?B?WFJWb05EZk1LTmdCWjJJRVJDL3BWNTJ1aTBRMkVIbjV2Z1lBbWRzYUhRUFVs?=
 =?utf-8?B?djk1czFwdGJPREIxdmh0TzZjY0FMN0daR0hnbGdlOXpWWEEzTGNsckkxenRX?=
 =?utf-8?B?dTU1MFhmYlNPZUFpQWZ0ZkNyNlZqcVc4TFpPWitmQkJUeDZ4VGdjamVTTThs?=
 =?utf-8?B?Nm0xcFB2MDlLcmxtekp0ZHFMcDJUaEhHYk1YaUdMU1dKeFg5VkNqTFEydVpv?=
 =?utf-8?B?UE5QMkNpdGU0SmR5emFaRXVlZnF4N0Q1M0xnRE1aUVQzZ0ZlV1RVdHVOeGd5?=
 =?utf-8?B?Q2VlRHRlUXYzWW1pL0dsYmU1NXBHRW5mUlpLdHlLcTdyeVlUNURua3ViczlJ?=
 =?utf-8?B?TGRybytrb3g1T095b3Nza0tnRzF4V3h3TVhjdnpkR3RCOUdqYVRFT0wreUZt?=
 =?utf-8?B?M0QvY2ZyNlBwRGxmM3BWaDE1VVc5dmt0ZHNRbTIxZkJ4azFkZTRKSnRETGx2?=
 =?utf-8?B?dVRDUlJ5dE9vTEoyYnlJZ2ZoUjNUKzBtNzk4eG53OXhvd0hjd0ZHa1FTNlY5?=
 =?utf-8?B?ZWp6b2tWNTlGN0d6VFRoNkY2ZTJKcWkweE1QM0E4V0loZjJPd1JKSmZIYjZr?=
 =?utf-8?B?ZnZTbldvZWNOWWVmaDBlQ1FlL2Ivb0F5Wml6SGxiTEIySmVDampNeHhHR0hu?=
 =?utf-8?B?VWwyZXV1NTdEUk8wWXRWb1RHbTVyNGRvTWZJV1dKVFQwa3B5RXdLVWVVcGRt?=
 =?utf-8?B?eDR6bTNrS3RWck5VVHV6emVTbVc0SEdJZmFLL1d5VHRYbUhzeUVMdDVpb3hm?=
 =?utf-8?B?Zkl3R0Q4YnhPRjJoRTJrM2xBTVlrRnlNN0NyQm45Mno5M2k0S2dHb0xEUkNH?=
 =?utf-8?B?UmhMbjIxNk1SNXBQSlNvTzlHeDJkM3l3Nk4zSmQwZUc0MmVGNmhKOWhTSDV3?=
 =?utf-8?B?OENtRFpOVlgwNWFoSTFIMEM3c2JmMU14M1Z3VGFNMHppMVhwK0hJVGdNUm14?=
 =?utf-8?B?QlVuNmo1dzlxMHpVUHp3dlNJQURNYkluajlvU0ZCc0ZxZ25rblRYY0VWTEFm?=
 =?utf-8?B?VDczK0doN2FlTHM2ZU1TRDgraVE5eWZHUVRVR1prdHc5VTNzZy9oZUlGVzVF?=
 =?utf-8?B?ekVJd2lidzl2eDdDR3hmQ0pYT3VGTEVlT0hZcm4rN0Y4ZlBMRy9xeTVZVnQy?=
 =?utf-8?B?TS9pZGIyWFJtdGVadCtRWlIwR3NSSkloeXdySlE2OVdjaDRhV3RxaGt6VW1T?=
 =?utf-8?B?d2pkVGdWWGszMlMvcU5xUFF5Vy9kUy9UZ1RpdHg3aXA5ZC96c05hN2dVMHg5?=
 =?utf-8?B?djM3dFlkenhXbVczTWw2U1dPYUp3VnRoOU4yTmpldTNhenBQRGQvQXhhRVJZ?=
 =?utf-8?B?Ykl1OWx2aUtad3YrZ3ZJV3dzOVZYWXJsMDdZcS9UWHhRZTZnaCtnL3A0RkhK?=
 =?utf-8?B?Z0gybzVjRE1kVTdRbGwwVUtUaCs3bDBabHZnM21xTFQ4c1FTcXdvOHZuY2dV?=
 =?utf-8?B?RkhzRGd5MUR4ZmZ6Ujd5Njd4L0tJSURmc1ZQWC9NZUtoRmYyL2hxYS96cHVB?=
 =?utf-8?B?azJtNWZoM0RYTmhiS1lWU0MzL3lCaEliK011U3F4V1RDUy9DM1FMRlo3NDdr?=
 =?utf-8?B?TzN1ano3RllIc2RnVW53c0VlM0E1NCtmSjVnKzZQbWV6bmxDWEw3ZjlxdWpJ?=
 =?utf-8?B?VGVHNXVSWjRnb0VHMnBDdGVYR0g2Y054Y2JieFFCR3V4YWlCTW9xclBCZ1JX?=
 =?utf-8?B?bUVaanRjYThjOTB0c1hVbmFGWEVjSEkrelJYVllTcUdzRXVTcy9NRGc1QzZ2?=
 =?utf-8?Q?dZ7anFNUcXqIBMKXqXMZYqS+X?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36f35e63-7811-4f91-2183-08db7ca0df89
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 15:10:59.2218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gC5Z0wbvbTinewn9YBBgeCp4H7rRc28J11REK5yDkUojAv6M1fqI1EqkTLN5yCPZvaNrgyk3/idcX6cmnF/0mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6532

Hi Penny,

On 26/06/2023 04:34, Penny Zheng wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> In function init_staticmem_pages, we need the access to static memory
> for proper initialization.
> It is not a problem in MMU system, as Xen map the whole RAM in
> setup_mm(). However, with limited MPU memory regions, it is too luxury
> to map the whole RAM.
> As a result, we follow the rule of "map on demand", to map static memory
> temporarily before its initialization, and unmap immediately after its
> initialization.

I could see that you are using _PAGE_TRANSIENT  to map memory 
temporarily. However, I don't see this being translated to any of the 
MPU hardware features (ie _PAGE_TRANSIENT does not seem to translate to 
any of the attributes in PRBAR, PRLAR, PRENR, etc). Thus, how is it 
different from mapping the memory in "non temporary" way ?

Please let me know what I am missing.

- Ayan

>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
> v3:
> - new commit
> ---
>   xen/arch/arm/include/asm/mm.h |  2 ++
>   xen/arch/arm/mmu/mm.c         | 10 ++++++++++
>   xen/arch/arm/mpu/mm.c         | 10 ++++++++++
>   xen/arch/arm/setup.c          | 21 +++++++++++++++++++++
>   4 files changed, 43 insertions(+)
>
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index 66d98b9a29..cffbf8a595 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -224,6 +224,8 @@ extern void mm_init_secondary_cpu(void);
>   extern void setup_frametable_mappings(paddr_t ps, paddr_t pe);
>   /* map a physical range in virtual memory */
>   void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int attributes);
> +extern int map_staticmem_pages_to_xen(paddr_t start, paddr_t end);
> +extern int unmap_staticmem_pages_to_xen(paddr_t start, paddr_t end);
>
>   static inline void __iomem *ioremap_nocache(paddr_t start, size_t len)
>   {
> diff --git a/xen/arch/arm/mmu/mm.c b/xen/arch/arm/mmu/mm.c
> index 2f29cb53fe..4196a55c32 100644
> --- a/xen/arch/arm/mmu/mm.c
> +++ b/xen/arch/arm/mmu/mm.c
> @@ -1113,6 +1113,16 @@ int populate_pt_range(unsigned long virt, unsigned long nr_mfns)
>       return xen_pt_update(virt, INVALID_MFN, nr_mfns, _PAGE_POPULATE);
>   }
>
> +int __init map_staticmem_pages_to_xen(paddr_t start, paddr_t end)
> +{
> +    return 0;
> +}
> +
> +int __init unmap_staticmem_pages_to_xen(paddr_t start, paddr_t end)
> +{
> +    return 0;
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index a40055ae5e..9d5c1da39c 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -614,6 +614,16 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
>              frametable_size - (nr_pdxs * sizeof(struct page_info)));
>   }
>
> +int __init map_staticmem_pages_to_xen(paddr_t start, paddr_t end)
> +{
> +    return xen_mpumap_update(start, end, PAGE_HYPERVISOR | _PAGE_TRANSIENT);
> +}
> +
> +int __init unmap_staticmem_pages_to_xen(paddr_t start, paddr_t end)
> +{
> +    return xen_mpumap_update(start, end, 0);
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index f42b53d17b..c21d1db763 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -637,12 +637,33 @@ void __init init_staticmem_pages(void)
>               mfn_t bank_start = _mfn(PFN_UP(bootinfo.reserved_mem.bank[bank].start));
>               unsigned long bank_pages = PFN_DOWN(bootinfo.reserved_mem.bank[bank].size);
>               mfn_t bank_end = mfn_add(bank_start, bank_pages);
> +            int res;
>
>               if ( mfn_x(bank_end) <= mfn_x(bank_start) )
>                   return;
>
> +            /* Map temporarily before initialization */
> +            res = map_staticmem_pages_to_xen(mfn_to_maddr(bank_start),
> +                                             mfn_to_maddr(bank_end));
> +            if ( res )
> +            {
> +                printk(XENLOG_ERR "Failed to map static memory to Xen: %d\n",
> +                       res);
> +                return;
> +            }
> +
>               unprepare_staticmem_pages(mfn_to_page(bank_start),
>                                         bank_pages, false);
> +
> +            /* Unmap immediately after initialization */
> +            res = unmap_staticmem_pages_to_xen(mfn_to_maddr(bank_start),
> +                                               mfn_to_maddr(bank_end));
> +            if ( res )
> +            {
> +                printk(XENLOG_ERR "Failed to unmap static memory to Xen: %d\n",
> +                       res);
> +                return;
> +            }
>           }
>       }
>   #endif
> --
> 2.25.1
>
>

