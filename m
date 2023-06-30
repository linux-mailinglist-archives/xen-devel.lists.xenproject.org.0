Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F151743F99
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 18:19:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557574.871049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFGon-0006kv-I4; Fri, 30 Jun 2023 16:17:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557574.871049; Fri, 30 Jun 2023 16:17:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFGon-0006iG-Dp; Fri, 30 Jun 2023 16:17:57 +0000
Received: by outflank-mailman (input) for mailman id 557574;
 Fri, 30 Jun 2023 16:17:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9zhT=CS=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qFGol-0006iA-Jo
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 16:17:55 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20620.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8817be0-1761-11ee-b237-6b7b168915f2;
 Fri, 30 Jun 2023 18:17:53 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by IA1PR12MB6164.namprd12.prod.outlook.com (2603:10b6:208:3e8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Fri, 30 Jun
 2023 16:17:46 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6521.026; Fri, 30 Jun 2023
 16:17:46 +0000
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
X-Inumbo-ID: a8817be0-1761-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OheQWw/kBo7HZhb2f7Zuv32/7WBe+E9JLttDm+S2VtUV/EsJsRDuFUn5jBUe12a/xvqZDjqW6bKkVVydZIQyBF96CY2axRDVE5/gHJsH4TWdnuGt0POx6qcVQe1handJ9dlD4/KhdzWR0Pi2BdpMaZviUFmnJ/evHtauFnNDLcXhAxb7awvjHwjSNkqdIVDgrG4QM/zsNt3+P20BEWDezwobK5sa61aenf7D9sOry9AdU3Hyxr/6eEdjLLN8374FtHJvDNAOqjVaaGm30fIrfHxrwIw4PZEbZ7Qc/34gNT1bXWdHApUNMujjJ6Cy1UR6s5U8JbBqkkiaUDTzJWgcRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Zl0UD3FnudfbqzvIErZ+q4HM/QgWnzSHeR8+X51gzY=;
 b=m+Gq4n9LAQC5J7KZNciOi5aRCbITgHQu/4zP40PjgsA5xM/KX2Jy88REzR8ZuqnilPMrEHdeYdKC8RlAU6jfJz4FSCm6RQZ/r7GfOgh1yJ5jCC8D5Fq+NM4G5yLG3DcpXn9+Mc5ZxAddyDj1fjLpgwPFjzYsGsUX1X7XatHcVh5xNE2H8LjaojjVNcB5jy1Ia7OzndxWcxT4zLFcP0I4/Obt513cuXwG0co6cme6++JD0Wf4qfnqRbUEQ/H0+njJcB/Q+UhbEOWgMML0iZlk5pyUu1sZ9c8/r8G7g3crUu4YUXfHsFlNWH1IlrzscPXW59L2n+dGI9doe1YlLkLiSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Zl0UD3FnudfbqzvIErZ+q4HM/QgWnzSHeR8+X51gzY=;
 b=ZLE8vDGjyxYA15+Pz+LVrF7FON9/lsj+CVMekHeLUyZq2SG+b0Q0PMn/kEgkfI840iAiCEzw1mH7BkjLr5pLXcHIQHORXrUGkECoTLUamSlqt0pUJEFtWfEmPfYfng+MKWbkZ/S58/AgZMJceXiHzxk+FuRp9GdKxksUC4s/720=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <87564d07-391b-7dfa-e28f-e13d73e67811@amd.com>
Date: Fri, 30 Jun 2023 17:17:38 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 34/52] xen/mpu: destroy an existing entry in Xen MPU
 memory mapping table
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-35-Penny.Zheng@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230626033443.2943270-35-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0096.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::11) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|IA1PR12MB6164:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a64372e-e275-4471-770e-08db79858a64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rgW4DIloezK9+Y/8MAeu0tnAfFdNiZTKKvIt+tpC0ke/BaB0UDtAqmp5IR7AAmWo5ADVMuFKK/mY8ApqLV4La1JXdbLiWoUp5nPwR6/0MNaUy5xoIYn2vGisnE/ZOUuPgpZiQNrDp8KLA3UVweVLL49b7BjlMy3JpVO1rYzK257SgU2FkMKc6G6Nzgp8xjGl1C82UIurHEwDfBoJngBqEo82yOV1y2xQI41ZupMRwuAIzRr7+2KDAQ6TJYxWIB9bMTxdgc6td1qby8NNfYHwDtyQIy4JIXJ5Xo4z6d9iCgR5nHZVeJDU0kJNcjhG0rV7XbMl9ERBuR8MBrcAQ9jrnCwqMDAbclR8DmrEla2s+rPbG+RC4YRL0ZaxtXBV+DpoXL8W5IntpX/DLIPoEA0dM6TqZ3ruu4ySjYl1cmWQCgS2eVS5G1sQkP3DVOlk/tF7RWnydoWpeVXaFTuxSIsK7MPHsSW9676HqsSIJSES6Sx2F+0gc+D+xiRjQ9wjeLgqf2LaXysWhWrkR0pZqliIl1AII9nib/47yyGBwMV/1jpzknhWHCCUEjdSiIsH6ULfS5meWBtQl1DnDF/JhKzkWEP4wp9WWDgYuxvqDGL1sw8Zel9yAu760FSFSw6IaiR0fcN4oqrnrAfNnk9yxD9qiA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(451199021)(26005)(4326008)(66476007)(66556008)(8936002)(6506007)(36756003)(2616005)(478600001)(54906003)(2906002)(6666004)(83380400001)(186003)(6486002)(53546011)(66946007)(316002)(31696002)(38100700002)(5660300002)(8676002)(41300700001)(31686004)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFFuQVNqN2RLejdySjNZSys2RG4rTk8yWnhkU1hZd2hnUzFlbXl0S2ljYjcz?=
 =?utf-8?B?YUtXNG41NTZRTFdmNElGQm1kL0FOT2NIR096THpqV2pCN0dzUnljc2FOT3lM?=
 =?utf-8?B?MXZYMVJoc0N0OXlkWlAwTWpMOTJCaWtBQXV5YjEyWkpOOFJLSHJMSVp5S1R0?=
 =?utf-8?B?R1Fwb1ZzQzhBMXhTYkE3QVJPaSttVnJCRGoyZ2hla0tRRmxpeFF0d01PNUZP?=
 =?utf-8?B?WnpTSWpZYyt4ajBISXJXMDB4MFR4MjhLMUN3Q3FyOUhrN3FzWGtQcW5rOEND?=
 =?utf-8?B?Z205WTEzOW1qTDM2NGQwSm1HMzlEcVhmaU5Dd1FTWDBBaHo3dGZ1SmtnZWdP?=
 =?utf-8?B?eFl1WUI4M240L0wwNHcyN0JvenRFMXRMMU9RZkF2cFhSL2VCVHIvVVd0V0p6?=
 =?utf-8?B?d2FLQ3Z2YzFQenVrU3U5VlhNWHcvZk1BVzJjeEhkTUtoSE5yRjZnS0o2MFNo?=
 =?utf-8?B?K0d1a2wwQzNpS2hrbWQ5SzF2Z0d4THRXVXE2T2poc2l4RVNTQy9OeGpxTEZQ?=
 =?utf-8?B?NzFZV0taUmxlbm1URXdmclFkOGEwbUFNd0NzZGl4Y0EyeHFkTDBobHZrd3pW?=
 =?utf-8?B?cGRuQkJyTjk3ZTJDL0FReE00UG41SXFOVHpEaWJUdGxoMDBMWWdhS0NvVkZU?=
 =?utf-8?B?cVNmSVZQSXJ4Q1MrZkVpLytXeW1xSmd5NE42ZWxFUXJTRFdFUjY5aGhuSEh6?=
 =?utf-8?B?cnloWjRkRWdBM0NZT0k0UHlJc1hvY09aTFVSaGVKaUdIOGtpaGFLUDNDdEFj?=
 =?utf-8?B?ZmNaUlVad2JFUE8vT0ZjaEcwdzR5RzUvTmc0MFhsN1FpUE1NQUJWQWhEY3Vv?=
 =?utf-8?B?d2dsTUo5Sk5xanNXbTJZRVk3cEwrR0FNUTRDellDY3VrcmpiR0lmK0tUbFZm?=
 =?utf-8?B?N2RYZTB6Zm9sZU0yUFdVQitFUUNTYWhRM3R5Q1VPTlZtNFRLYXpTVFVsakxk?=
 =?utf-8?B?QTR3SUVUYWZNTVdSdFNieGM1UnRrcDlRemZ1WHpJanZNbHRVbzQ3djBJQU5z?=
 =?utf-8?B?WkJrQUNwMnh2a2pHa1dCMHFObk5DS0pTR3lobE9OZVBVeDNjNlhycjR6dER0?=
 =?utf-8?B?bVV5SnVWcTgzcEZ4OHRoU1ZNS0JhYW9UZDZYaXQwU01PdjFyekdQOEQ5UFND?=
 =?utf-8?B?bldMVmRKVTUwelFuTUc5SW1JekNGN3p4RitvdEl2dUVlTG1OUzNOY0FkN2s1?=
 =?utf-8?B?M2VMSlJ3dlo3S1VrdVF4UVJzN0V2VXhyTzM3L1J2dWJjcHNhbUNjVkx0dXNk?=
 =?utf-8?B?dEZuZkhhK2tiMk42SjNqOUFKeXV2bUw3Qjl4TyttUkJrRlJGY0dtQnRqcVp3?=
 =?utf-8?B?QlFNTzMwVUFFV0l2akVlYWl3ZDM1ZmNtVXZSc2NOVEZWVHFkVklxUXBVdks0?=
 =?utf-8?B?RFlYMVR4WUJzd2o1SXU1Z0owNElpbzFRMm5LbEJOOVdwUjIrdnlSOTVBVm1i?=
 =?utf-8?B?SXN4M3hnbHQ0NHZlblhUOTlWVldjeDVEcFNvcUtJb0NlcUd0dGQveStlWDNC?=
 =?utf-8?B?V1RvQzk2b0dXZysxTEJBaG9xTG1lY09WZHRyU2pOQTlrTzJFT09qVFdYRmRz?=
 =?utf-8?B?Q0diZVltczQvQ1RDRkk2Wk9ZbVM4YnBsaWlpNnJIRDFSbkQxQ0dMSDFwd1ls?=
 =?utf-8?B?emZFTjJDeXowcHRmbDdvb0hUN2FsSkpjVm1LR28zelJZL0hYY1FCSVpkY1h5?=
 =?utf-8?B?V2dvWUl5eG1VVHBQVTlOUXpYWXZPdVkvRWtoVDduTkxZUVFPQ3dmVzJBbEdv?=
 =?utf-8?B?SlVIYWJiY0UrL09yZTMyMUJZbzQrUFpwTkJQdWZGNGxQdlJiZHNvR3FQdGdU?=
 =?utf-8?B?RUorNzdKTHhmT3MwQzltRWZ2MXVTcUc3ei9jTGIzMXRhL3Voalc3TVJxcjMr?=
 =?utf-8?B?TldRRU0wR3JsNDBoS1VQdmNDRXZ6VDhFcC83QUNPeC85VE9xSFBDTHE3YjFS?=
 =?utf-8?B?TmlzOFZyVGtLa3Q2RjE4cGRDc1pOdFArdDQ1Z0ZoYWVmRFZYYkFGcVhBbEp0?=
 =?utf-8?B?aTI0Z2ZITE5rUXNjSGZSTTVvYTc0aGdzbFhOc1ZoM1U5aHdXYS9rVlFOWDRB?=
 =?utf-8?B?cThyeWRIY1JVVWVqWFYxY1piNG5HK2dDcUhQdmxxaE1jR2NuRHRidTFEWFJG?=
 =?utf-8?Q?TXtypdRWFdvtF0HYQdKsDUeLI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a64372e-e275-4471-770e-08db79858a64
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 16:17:46.4079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: souSrwuFd2spUU/WhFWgHiC2upG/DgqArAurx9gQOMt/yuDGTBc7NtVzKxgn5MIXNuiELG3K4OEVxQFItEldgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6164


On 26/06/2023 04:34, Penny Zheng wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> This commit expands xen_mpumap_update/xen_mpumap_update_entry to include
> destroying an existing entry.
>
> We define a new helper "control_xen_mpumap_region_from_index" to enable/disable
> the MPU region based on index. If region is within [0, 31], we could quickly
> disable the MPU region through PRENR_EL2 which provides direct access to the
> PRLAR_EL2.EN bits of EL2 MPU regions.
>
> Rignt now, we only support destroying a *WHOLE* MPU memory region,
> part-region removing is not supported, as in worst case, it will
> leave two fragments behind.
>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
> v3:
> - make pr_get_base()/pr_get_limit() static inline
> - need an isb to ensure register write visible before zeroing the entry
> ---
>   xen/arch/arm/include/asm/arm64/mpu.h     |  2 +
>   xen/arch/arm/include/asm/arm64/sysregs.h |  3 +
>   xen/arch/arm/mm.c                        |  5 ++
>   xen/arch/arm/mpu/mm.c                    | 74 ++++++++++++++++++++++++
>   4 files changed, 84 insertions(+)
>
> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
> index 715ea69884..aee7947223 100644
> --- a/xen/arch/arm/include/asm/arm64/mpu.h
> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
> @@ -25,6 +25,8 @@
>   #define REGION_UART_SEL            0x07
>   #define MPUIR_REGION_MASK          ((_AC(1, UL) << 8) - 1)
>
> +#define MPU_PRENR_BITS             32

This is common to R52 and R82.

Thus, you can put it in the common file (may be 
xen/arch/arm/include/asm/mpu/mm.h)

> +
>   /* Access permission attributes. */
>   /* Read/Write at EL2, No Access at EL1/EL0. */
>   #define AP_RW_EL2 0x0
> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
> index c8a679afdd..96c025053b 100644
> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
> @@ -509,6 +509,9 @@
>   /* MPU Type registers encode */
>   #define MPUIR_EL2   S3_4_C0_C0_4
>
> +/* MPU Protection Region Enable Register encode */
> +#define PRENR_EL2   S3_4_C6_C1_1
> +
>   #endif
>
>   /* Access to system registers */
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 8625066256..247d17cfa1 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -164,7 +164,12 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>       ASSERT(IS_ALIGNED(s, PAGE_SIZE));
>       ASSERT(IS_ALIGNED(e, PAGE_SIZE));
>       ASSERT(s <= e);
> +#ifndef CONFIG_HAS_MPU
>       return xen_pt_update(s, INVALID_MFN, (e - s) >> PAGE_SHIFT, 0);
> +#else
> +    return xen_mpumap_update(virt_to_maddr((void *)s),
> +                             virt_to_maddr((void *)e), 0);
> +#endif
>   }

Refer my comment in previous patch.

You can have two implementations of this function 1) 
xen/arch/arm/mmu/mm.c 2) xen/arch/arm/mpu/mm.h

>
>   int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int flags)
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 0a65b58dc4..a40055ae5e 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -425,6 +425,59 @@ static int mpumap_contain_region(pr_t *table, uint8_t nr_regions,
>       return MPUMAP_REGION_FAILED;
>   }
>
> +/* Disable or enable EL2 MPU memory region at index #index */
> +static void control_mpu_region_from_index(uint8_t index, bool enable)
> +{
> +    pr_t region;
> +
> +    read_protection_region(&region, index);
> +    if ( !region_is_valid(&region) ^ enable )
> +    {
> +        printk(XENLOG_WARNING
> +               "mpu: MPU memory region[%u] is already %s\n", index,
> +               enable ? "enabled" : "disabled");
> +        return;
> +    }
> +
> +    /*
> +     * ARM64v8R provides PRENR_EL2 to have direct access to the
> +     * PRLAR_EL2.EN bits of EL2 MPU regions from 0 to 31.
> +     */
> +    if ( index < MPU_PRENR_BITS )
> +    {
> +        uint64_t orig, after;
> +
> +        orig = READ_SYSREG(PRENR_EL2);
> +        if ( enable )
> +            /* Set respective bit */
> +            after = orig | (1UL << index);
> +        else
> +            /* Clear respective bit */
> +            after = orig & (~(1UL << index));
> +        WRITE_SYSREG(after, PRENR_EL2);
> +    }
> +    else
> +    {
> +        region.prlar.reg.en = enable ? 1 : 0;
> +        write_protection_region((const pr_t*)&region, index);
> +    }
> +    /* Ensure the write before zeroing the entry */
dsb(); /* to ensure write completes */
> +    isb();
> +
> +    /* Update according bitfield in xen_mpumap_mask */
> +    spin_lock(&xen_mpumap_alloc_lock);
> +
> +    if ( enable )
> +        set_bit(index, xen_mpumap_mask);
> +    else
> +    {
> +        clear_bit(index, xen_mpumap_mask);
> +        memset(&xen_mpumap[index], 0, sizeof(pr_t));
> +    }
> +
> +    spin_unlock(&xen_mpumap_alloc_lock);
> +}
> +
>   /*
>    * Update an entry in Xen MPU memory region mapping table(xen_mpumap) at
>    * the index @idx.
> @@ -461,6 +514,27 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
>
>           write_protection_region((const pr_t*)(&xen_mpumap[idx]), idx);
>       }
> +    else
> +    {
> +        /*
> +         * Currently, we only support destroying a *WHOLE* MPU memory region,
> +         * part-region removing is not supported, as in worst case, it will
> +         * leave two fragments behind.
> +         * part-region removing will be introduced only when actual usage
> +         * comes.
> +         */
> +        if ( rc == MPUMAP_REGION_INCLUSIVE )
> +        {
> +            region_printk("mpu: part-region removing is not supported\n");
> +            return -EINVAL;
> +        }
> +
> +        /* We are removing the region */
> +        if ( rc != MPUMAP_REGION_FOUND )
> +            return -EINVAL;
> +
> +        control_mpu_region_from_index(idx, false);
> +    }
>
>       return 0;
>   }
> --
> 2.25.1
>
>
- Ayan

