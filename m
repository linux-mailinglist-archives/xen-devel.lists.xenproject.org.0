Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 768DD74860E
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 16:21:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559236.874048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH3Nl-0004hn-No; Wed, 05 Jul 2023 14:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559236.874048; Wed, 05 Jul 2023 14:21:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH3Nl-0004fR-Kx; Wed, 05 Jul 2023 14:21:25 +0000
Received: by outflank-mailman (input) for mailman id 559236;
 Wed, 05 Jul 2023 14:21:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gl5h=CX=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qH3Nk-0004fL-49
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 14:21:24 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36de9213-1b3f-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 16:21:22 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by SA1PR12MB7248.namprd12.prod.outlook.com (2603:10b6:806:2be::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 14:21:17 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 14:21:17 +0000
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
X-Inumbo-ID: 36de9213-1b3f-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWD8LeanzrwJb0RRV/KXsDfaajhdQMLhbZMUt5smOEcoeQ/RCS5Nlzq3gR3JH+LrB+BaD5M6XdtG0O9VKDzoFFP7B3K+5TsU2USQWD2x6lnOEJLAaxL+dgr66oQFN6rwRBozVrbSEl6xuXze5cet0Ol23rcVTiEy7HjJtj4JiRv0gCkgBqcBczGVwsfJEkRWAgq7oh3MFwZwNj/uyxHCra2cf1qxf7E7tO1NxZbLd+2ACwxj9aTUMcOG2DyHPYLHq9ZkTS9JzkMBkGQeSGbWSTvQdqHxB90xw+BbWYOq6D2iQv24gexuXbsJgGmbE8iHqRFNpxSW3IlPkcqWZp3Yug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvFvdJIGeOI7z9GBRSz7Y5eAvlGkW/B+cgC1jVH4bP8=;
 b=StDP1ikhiL7KbXNtoBLyR7ETrG3PLLQpr5xBeEGWwNox9t1PqqPX4OGpoWztMRuNW4hl3XRoCrW7fUOxxkOEqsGNj7vt9BtiBERz2LNpQx5BgdK78JS7yzcqHmjrYW5mWFSVtiKrZbU3IXXn+oqcQL6pVAfSP1BkfWwHyEk+vPqiF7Dp+YRJfoBKua7yPdM45uIxhN3BYA9FrCp3p19dn86rrec+K9gOTmpsZvWdiMbX4k7JzmDlCKVzGfX7A5SVEVvfuqYW8qdoHs2xjtk2HP3izMO5HmRXp/TrEdPWGgWuLq88wmy2fDIZyKtvwNLd2mBcA1OztRyBzkr8o9/Nmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvFvdJIGeOI7z9GBRSz7Y5eAvlGkW/B+cgC1jVH4bP8=;
 b=vjNu2zngjxZpBLVw5n0ONnNOyz7jn+TtrX12T8+c0peRx2uBqDjZCQp+NArjdgA/eXNNT8uYmnnIkb6pUcRk7rTis/Hc+Faml/pRoJI+PnAvk+MM5H498/BlFsLoLxMp88kZP1FqZFfLXnZI8f30kvh5Q8Hg5jxmCWSgm+kxzT4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <040d7ea3-aeaf-62ea-5561-81e283f2185c@amd.com>
Date: Wed, 5 Jul 2023 15:21:09 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 43/52] xen/mpu: configure VSTCR_EL2 in MPU system
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-44-Penny.Zheng@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230626033443.2943270-44-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0275.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::11) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|SA1PR12MB7248:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a25b0b5-429b-4d63-36c3-08db7d631878
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fioPn84B2gb9YAJ1XAZbPufKpwpnXHtncjAXJIHEaw2FW/ZHPcMYQq4k2y9TYG4dSdlHLsRn3Ie2GjDcPxrcq/cbojhkHq/H99YNLn1HGHjr8KkzneQ/GLK6cL2IZl7b7QO2eTFoYM2jMKNcawidVI8VOswsgIkczkHc+DoM4DtXeSLq7jsHzyye5yxtQROvUZfpqblGW54lxP3+W/CsOj+yBJeOKaz3goUG914wZnBM54JqVQkmEu7/vA0KHD5QdGXEtwGlLYKfvO8Ea+lQqCr4w4ztCT31EL0mk97NUrDxcHnb+FpcnmeU/GVw4/wX/rHVYuGyKJXZFwIt0X6WaRCB61luzFPZZ6sRuN087OHiZnuGkk3OUjjHy+k3iUaqTM/egAVaG1YCM1iBo5HDwFKZUoAczSr4xIsTNY5wm9/FrOn/wOyMR4uiswzwT10GmAasCARVcPkEEvVuoOUTi24e6MDoqtOrdIhFUCAx8QXuodUsMT5wuqeFi5IJKCb2NJQ/2i1yv4nA8AWs/TB+KmmAgzjvF9SZ3GUDK2t3HUmvPB8hhIAHyPrF2y2BndFOYiAQJeDNtMG9DEfKCpYu9a7HbPe5N+WMjbTZhRnDQ75Bk54pzFxv3rD+gayocwXFr5prunVnRY2vLTymUdpGAw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(451199021)(54906003)(478600001)(6486002)(6666004)(41300700001)(8936002)(8676002)(38100700002)(4326008)(66946007)(66556008)(66476007)(316002)(2616005)(186003)(83380400001)(6512007)(6506007)(26005)(53546011)(31696002)(5660300002)(2906002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDN1akdwTnlCWHcrdnN1ZlF4QTJ6bFFKeGd1VE5mdGJYZXNPL1pqbUFqTTIr?=
 =?utf-8?B?Mk1aUDcvaGRWS1VDQUdEZnJjcitubS96aGsrZXZINmtVUW1FNGcydlVCaXJr?=
 =?utf-8?B?UVgxUGJKa2s2SDY0TVhSQnk1WTNOY0NBblM0aXM0R2ZFMzV1SHp0MU16V3pX?=
 =?utf-8?B?cUhWZEJlTUxEZjdSSnp3YVdQbGlIS0FLb2hJbXpFRS9wdENVN2ZyU0ZlNW9m?=
 =?utf-8?B?NVpaYWRUTWN6OS9lM25iS2M1SStMN0RkejZpK21IWmZiTjNUTEZpd3VwTUJh?=
 =?utf-8?B?c3M1Z0VKL3Nqc1YybGIwa21lSTNhZU1DcHAzZTB2Wjc3SDVtNXZJN2JRT0JH?=
 =?utf-8?B?TTlIblhiVkg3YjNVQ3dtNVMzc0MwWUhUV3FPQU5mNEVOOFcwWTZDQ3NWOUFr?=
 =?utf-8?B?bnZDZ3ZCY1JFTVVCODJKY1p3ZWNkN3doSG1iQ1p6dmFTZ0dST3FjSzB3SXQ5?=
 =?utf-8?B?YjNxdGtaazlpUGNINjBsNEhpTE5odEhZNlhJSGZYN0pxWEtkVWRJKzJ6R1RY?=
 =?utf-8?B?cmJCd3hlZUJCS0ttM1pLaWJEYVk2WmJ1dFdyZkw4ZHdXS0N5ajlYVUVuRm10?=
 =?utf-8?B?Mmw5UjlSVW1aS0sySEFUeHZQSzh5dGJNdGhybEpnejhDYWhuaTR3SkFTV3BE?=
 =?utf-8?B?d0prdHhrU2diK3p3Rk9xYzBmZWZqTTByZTRpb0NWZlZiWVNFMEp4Q2VIRFp5?=
 =?utf-8?B?WGxSd2oySkJOSEliT0w4MHJva0o2bU1BVi9RcXA0bU4wNFZoL1JXeVVtTUtQ?=
 =?utf-8?B?Vm9ZZEJVdnNUNkhsUWozWkpSamRYYys0bVB3ZUg5RFpmWmJLN2VHVFpXL01P?=
 =?utf-8?B?SFBsRXpiM2x5MFVVSVcxNExDTVgrUVo1U0ZlRHBFNHBjay9aVkpyRXJyM2J0?=
 =?utf-8?B?U3U3Wll3Ry9heXVlNW9MOUNtWEZ1S2VqZUY3Wkltb0g3Z2VrQzN5WHppYTBP?=
 =?utf-8?B?TGZDVGtTSzMxQ3ZVM3JQMjhucFFtOHBreHdZU3UyNytHK3BNdmpvZjkyczVH?=
 =?utf-8?B?QzdFMTlEZXprbVp4V292akNlbjRxRmdva1AxSFU1WVA4TmVtZFgvVTN3d3FN?=
 =?utf-8?B?ZzJnRU81NHhObVpJa3hHRmVrWFNNRnN6SVhXL1Jqbk1EZzM0SnVZZEx3WWJ6?=
 =?utf-8?B?dEdNSzQ2MDlZSFdSODhyZktSME1kMkFGdUVvUGNNR0F0MnFSd0ZDVnNpOTZz?=
 =?utf-8?B?bUdBTTd5Z0NZcFdXK3NLaUtZMEVZKzMzdkZpYmN1Yy9ENXE3U2cyUi9MZjRa?=
 =?utf-8?B?MUtKdjB2VHU1THZDUnA0WHJncEFmbTIzbHQyeGVWSjFuaGM3RVpGL1JXcVpo?=
 =?utf-8?B?a2tzcVk3cmYvd0ZEbU02Wm9xd2tEc2VjRHc1RndSZlM1N1JvRXBVV1JwSThj?=
 =?utf-8?B?V0JPcTdtbEppQW9uZCtSQ1dFWW9WcjBlczhDYVF5Si9WSEUxQnpHbVpSeXJX?=
 =?utf-8?B?UTU2N3NrWDlmQndjVmNRd1d6MmsyQVJiS09LVVZkSUJJN1U3WnlrVmtRNUNk?=
 =?utf-8?B?N0x0Zjd4N1hlbVRWTnhOUHZCN05TL0ZDV0tsZHozNTg1b0lQd2FVWDdhNW9j?=
 =?utf-8?B?WUhqLzZWMi9KSW1JQVlLZGJwbi90VFdQMktmdVJRN2hyWmRUMjRHUUNaUmRu?=
 =?utf-8?B?NmMydW1ka2JzY2VmN2lQUFhJZndWSTZyN1I5aW44WVkzWE51U21iRGIzZXB2?=
 =?utf-8?B?Ny8rVVA1VzB6OU15azljWWtUWm5wTUE5U2Zyb2w4RFRWek1EVW9hNmFEaC9j?=
 =?utf-8?B?M0l0VXowVURpZE90TW5xdWI4NG00RmYyNDhXWVVYM0x3Zlp1TW43cGFNZVVn?=
 =?utf-8?B?TlpIb0RhSm50K3dUdE5LSE51VEMyVWgwN3kwNkpBT1NaeDJpMU9zUTl1Skdr?=
 =?utf-8?B?MVFTU0UvS0ZrV1BWeERwakR1ZnJGSlBSaDZYS3QzekQxSERqRkFqdHFqY05V?=
 =?utf-8?B?N05DZ3NpQ05FdWtrdmt2QkRaRCszd2JkTjhxUGNOV1d4Znc0UTkvcEJPSC9n?=
 =?utf-8?B?WFpQRCtNcDFTZlVEY1lmNzM1QTc3NjZRSXJnNnpLSU1oMjNrZTlSTWhBL2Er?=
 =?utf-8?B?UjczMk9sRTdSVHBrSllQMzFiRXQ0U3JNY0tQc014N0hZWUt3UTgyNkloVGYy?=
 =?utf-8?Q?fPRj8cFIsLt1qwP944GRxTDHE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a25b0b5-429b-4d63-36c3-08db7d631878
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 14:21:17.1545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TRvNzv6Zk7F6FnTmV9AG1jV524lJaHBRNKSyMA9R2hFkHIH1sg1YdaYUsRfaSK+dYZJbiLOCy5xOsksYmlHCNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7248


On 26/06/2023 04:34, Penny Zheng wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> VSTCR_EL2, Virtualization Secure Translation Control Register，is
> the control register for stage 2 of the Secure EL1&0 translation regime.
>
> VSTCR_EL2.SA defines secure stage 2 translation output address space.
> To make sure that all stage 2 translations for the Secure PA space
> access the Secure PA space, we keep SA bit as 0.
> VSTCR_EL2.SC is NS check enable bit.
> To make sure that Stage 2 NS configuration is checked against stage 1
> NS configuration in EL1&0 translation regime for the given address, and
> generates a fault if they are different, we set SC bit 1.
>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
> v3:
> - new commit
> ---
>   xen/arch/arm/include/asm/arm64/sysregs.h |  6 ++++++
>   xen/arch/arm/mpu/p2m.c                   | 17 ++++++++++++++++-
>   2 files changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
> index ab0e6a97d3..35d7da411d 100644
> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
> @@ -512,6 +512,12 @@
>   /* MPU Protection Region Enable Register encode */
>   #define PRENR_EL2   S3_4_C6_C1_1
>
> +/* Virtualization Secure Translation Control Register */
> +#define VSTCR_EL2            S3_4_C2_C6_2
> +#define VSTCR_EL2_RES1_SHIFT 31
> +#define VSTCR_EL2_SA         ~(_AC(0x1,UL)<<30)
> +#define VSTCR_EL2_SC         (_AC(0x1,UL)<<20)
> +
>   #endif
>
>   #ifdef CONFIG_ARM_SECURE_STATE
> diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
> index 04c44825cb..a7a3912a9a 100644
> --- a/xen/arch/arm/mpu/p2m.c
> +++ b/xen/arch/arm/mpu/p2m.c
> @@ -10,7 +10,7 @@
>
>   void __init setup_virt_paging(void)
>   {
> -    uint64_t val = 0;
> +    uint64_t val = 0, val2 = 0;
>       bool p2m_vmsa = true;
>
>       /* PA size */
> @@ -76,6 +76,21 @@ void __init setup_virt_paging(void)
>
>       WRITE_SYSREG(val, VTCR_EL2);
#ifdef CONFIG_ARM_64
>
> +    /*
> +     * VSTCR_EL2.SA defines secure stage 2 translation output address space.
> +     * To make sure that all stage 2 translations for the Secure PA space
> +     * access the Secure PA space, we keep SA bit as 0.
> +     *
> +     * VSTCR_EL2.SC is NS check enable bit.
> +     * To make sure that Stage 2 NS configuration is checked against stage 1
> +     * NS configuration in EL1&0 translation regime for the given address, and
> +     * generates a fault if they are different, we set SC bit 1.
> +     */
> +    val2 = 1 << VSTCR_EL2_RES1_SHIFT;
> +    val2 &= VSTCR_EL2_SA;
> +    val2 |= VSTCR_EL2_SC;
> +    WRITE_SYSREG(val2, VSTCR_EL2);
#endif
> +
>       return;
>
>   fault:
> --
> 2.25.1
>
>

