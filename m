Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A931462889C
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 19:54:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443511.698062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oueZi-0004Lb-EQ; Mon, 14 Nov 2022 18:52:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443511.698062; Mon, 14 Nov 2022 18:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oueZi-0004IW-BO; Mon, 14 Nov 2022 18:52:54 +0000
Received: by outflank-mailman (input) for mailman id 443511;
 Mon, 14 Nov 2022 18:52:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0dAn=3O=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1oueZg-0004IQ-Ew
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 18:52:52 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88c16b7e-644d-11ed-91b6-6bf2151ebd3b;
 Mon, 14 Nov 2022 19:52:50 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by SN7PR12MB7348.namprd12.prod.outlook.com (2603:10b6:806:29b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 18:52:46 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::62cc:47ae:a750:8f57]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::62cc:47ae:a750:8f57%4]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 18:52:46 +0000
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
X-Inumbo-ID: 88c16b7e-644d-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4s/1LIMjtGDpyZNShAssITKgFPxU3Ir4ytXnw63ll2U/xvzZchl6+4u+Psmd+I4OZGoscdgG7jwVIH4qsn9Qf7vPjdOoKdj017SWjuDPgjZtN5xGelkAoDt2jfIC2MrXOSFFQo/CFwB+geGbuN2UsVP3F/4QBV+T06eNl5QLla0G6Ss+sukAxiwxe1q1fZ8R177vaxiqqa0TtVSoKdHIvXmkqo2qA3peWgMJMJWkGT8eY682i5e8UypO8/tR23+tcefKMAh1eLSgXZ3w88GWQ137vzfG41AyinkiiXm2IFnO+RPHGm6lwGbwCEdsPVBR3NEBQdO5X/g6oWEHQEixA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQFWV1AW5IPthzY9LgpThqWkLLvMASjgxOJcwcV3N50=;
 b=Dphy/8RbFhSGJoO65mRwltj4+WjzJ4UXWRyPt/ay2seni+9bhpRIhcpDaC1AjYuZDTuthXCMyAOBRP1j1M7bI3ANqf7gv2OjNvJ1tSK+596aXDQ7TERyDNfcyC/rU5/DY+l0cUNCm1Uyn0E+1EIvqxzUAorfb0YylYPHg0Eg2VoK1DSJVRoTCMZuQYKgHXb07Oi1ilKQ1uDLLrhuecj6f1GWoatk9sc//XwvEijt46R8JcN/OAz1Qw+44WS9DqC9MYyWJQ5vGsxoAaQwd/nVKiUm3JaOQNmOwgOIbhjF9kEhpbCOz/I/9oj2iWuIX1qfRBL/InYTFRQg1ncRlB9qCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQFWV1AW5IPthzY9LgpThqWkLLvMASjgxOJcwcV3N50=;
 b=X+CC1sALGKHGex4QtF8fWEwMXmB0nA05gdWkWfJMeSCGC7ziRFFaC6nXfzVlQUjXgjp0XYR0A0Gg6SNDSDxcrQyCSfOIAPiJIzfVI1uiUdPKzxtw5+bvXy7Yo93yYO9Sp3ZzJqikQnvBGFz3v12ibWc3aA6xcHbk6QaqvuQ4mD0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <a6417c35-e765-c5c5-1acb-90537d0335db@amd.com>
Date: Mon, 14 Nov 2022 18:52:40 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v6 05/11] xen/arm: define Xen start address for FVP BaseR
 platform
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Jiamei . Xie" <jiamei.xie@arm.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-6-wei.chen@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20221104100741.2176307-6-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0549.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::18) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|SN7PR12MB7348:EE_
X-MS-Office365-Filtering-Correlation-Id: f34a0652-7151-4872-3aa1-08dac6716b81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RnBj3XVsXNYGpYgDZDKVp9bR6fTKPoNYejw+/zj1xhKbPFHojcrWEhOA6BqPatn6tpUbbLYrp94XkXKgwbUeSa4Q+F6L9rQt5cFUU+LfgbcIM7WJjXlqQnj2uwyA3xdpSXtdR19SymxH2OrPDYx0xrHAJxaaGUopwk8OaF9eger+HHkoHaqd8eVcebzl3hkMCsOmXncIQ1rZFMYgH4VwlWUdpRcMkgviWMrwGYOailYLR2r6W3kbdpLmcFgPMJ0ypi9K6CR7fC22n1vs72+fCLO6l/vbL+4Rtzy0jz4t6CURB7QF2NWvDqMLU3fcXOdVkfN9FC6jK5BdpAfvF4dMDkTbuRJmsvJCn+vWJq7vjWb3L0FC5OlO6W6IC0hK9LPqL6BkeRkhqZVna8Gppi1gFwnVq2LiJrQdafzLcW/Fp5q0Kz67Sjcg7g5pPOQxchb7sSqljbrAZTIJSqNuoH8uT1+O2eYs6GBQpxufdIuJuEAo2OwwAxzzR/usKB4z7wXGjPZfMSaIO5kkeYZOSHSIGdQ+4vGMpZZ8pcLGSadINeK/m9XT1TlHtjX00CJi5QRmZXlfc80q3BoMm0uKO1rAe7gFlD9XyNc3iR7d3Tn1KP2ZFQO0LmVMSlsDQ2HRpYvFuqfIuEzN/+OcoKXobN3VbJ3qYygqVhKfFO4tue9U8WUdBrGVnYqIDwXjXQr2tqTyOzDCMNpApR83Zw/18HByYbLpZROlneu2LJU1A/ox9OYAoUE67QJ0rsImFi9rR7SWav3Y4vuKY6TbldE+9syxMiYz6q/iXbOnWP3ibsTx7Ek=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(346002)(136003)(396003)(376002)(451199015)(41300700001)(5660300002)(31696002)(8936002)(2906002)(83380400001)(26005)(6512007)(186003)(2616005)(38100700002)(316002)(54906003)(66476007)(66946007)(8676002)(66556008)(4326008)(6506007)(6666004)(6486002)(53546011)(478600001)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b21tTDdSNW04by91V0hLbnptUHhjMjA4YjNVcmlWelhqeXZuUVVzd2lXWGZX?=
 =?utf-8?B?YjdnejI1N1ZLWFVlNTB3Qm00MUI5aGl4cEZib1Y5TlVSbzkySlBrNzRXcUJZ?=
 =?utf-8?B?NnZVMUVjRStsOVVRL0F0RWNWeWRzOXZVbWttdjVqQjl3OGpBYVdUZXlsNmMv?=
 =?utf-8?B?SlRVVHJUOUdJOEVUMWh2MDU0SkZtNDlnWFZ1anR1b1NXaENERkZHZHYzaFFx?=
 =?utf-8?B?TDI5T2pDcFkrR2t4SlZFNHU1R09xL2lscHFXbGlObXZMSWF5a2VoTi9NRW8x?=
 =?utf-8?B?RFpaVFV3eTc1M1BLRndzWkM1K3E0Ky9TVm1lMUF2M0VPSFkxa3JPN21sQlBr?=
 =?utf-8?B?QUI2Y0RJQjVKNHZsZmphVnYxZ2VaanhTbzhZWFNFY2ZjdURoM09kUW1kcklp?=
 =?utf-8?B?em1lWU82YmJVdXdzdFUxY2JNa1B0S3ZjbGR6b2dPYlE0ZUduNmlpV2l3K3lP?=
 =?utf-8?B?NHp6YTRyTVdEYmgyeHBPRXNyWktkMDVOelZPSWNJbjJPRkVMNWtORTR5RnlJ?=
 =?utf-8?B?UjNHN3ZxNU5PK2hPZnpwK2FqZXpFVjR4UGpjeEpFaDZHdVFmM2ZzbzFSUHJH?=
 =?utf-8?B?YlR4dHVJOVpUcnBNOHp5bGxCakNrZm5QWndVVXlCM1VONTFnT2N6c0ZrT3pE?=
 =?utf-8?B?OGZhS2ZQUFYvQ3dQYTVnK2tzZjF0aHdoc1dDMjZrU05HcE5keUFqSWs3UnFM?=
 =?utf-8?B?NExhTzVMcmhqeWFINitTTzlHMklvelRKMGs1MHpRcmtBV21sRFFQQVpDblgx?=
 =?utf-8?B?Rm8wcU1SU3NicXYvTGFNWVUzRW5ob1pGK2tQN0pEWFdWNkZNd29JQkt2cnU4?=
 =?utf-8?B?Q3JybS9ZZlc4L1ZwdFJNaVVPUUYvQW5IZW5XMnl1Unpobzh3c1RGMjUwOUMv?=
 =?utf-8?B?cHFjcjFmbzl6RDU5M1FucHJ6KzRLa29iTmsxdjJzem1CYTlzVG8xRklURTBs?=
 =?utf-8?B?Si9YYmF4a05jM28rMVIwQzgrNktOcG9sdmhYNG1YSCtHTU1VdXc4ZEFMcTYy?=
 =?utf-8?B?dlFFeWhYdXFVa0c2bVBFb2ZFMmJXUmIzR29zOUF6NU9VWjFYbnhydlJ2dVNO?=
 =?utf-8?B?V0ROTjB6cXoySC9mZzlhcUtRcGJ0SUw3UklOZ3A4a3FqaDJVdk9oWWp2ekdQ?=
 =?utf-8?B?K3lJYkNWWUR4Z2svYUxXSEY1TVE0V0VZcmI4cnM0dDM3NnJUZUlCcEU2VFp1?=
 =?utf-8?B?Tm1SWnRDL3c3TGpYbTJyejI0eUlwam9QTlFoRDlqYU5YdkNKbm90Y1JVSVli?=
 =?utf-8?B?bGx6NDZ6VjZ0U1lrVVcvZlBhRGR4UnFhL2VFQ3BZSVJXYUJ2NktnK2RMOXJB?=
 =?utf-8?B?MkZlanZhZ2ZHWXFoN243WENGQkpzOEJMQkdCaHpFNVRBSE5iUTVBS3VBM3NY?=
 =?utf-8?B?S3ZmWU5SQmwvYzlDZG1IdnI3THBuR0Z2Y2JIa0FUK01Wd05yeU16azRCcWlZ?=
 =?utf-8?B?S2ZrRGpwb21KWWt1cDFYeE01b3RKTDl6bHAzK1o4MjFTZkp2MjNHT2dPcDcr?=
 =?utf-8?B?SnZpY2x5OS9TejM0NFoySjRRUmFiNmRvMy8wYnNuYnB4ZVFWNWQ4ZzJxYmZz?=
 =?utf-8?B?U3dReUQwWkNvV2UreUdGUzBuMlVUV1QxYmNURk4rUWpScFV6TFo4UzlSSHQ5?=
 =?utf-8?B?alE2VFB0THRHVExHOEFlUVVxaUFDZll0MHBwektyemRDVnlNVWxESjFDcWRt?=
 =?utf-8?B?OGsyczNmTmlLc0FjR1kzTlRORXhHSm1NL01vSGxRZi9sOTZvU1F0MkVwT1R0?=
 =?utf-8?B?cnZkT2laUE9CbStxYVFjeWdiS2VwSEJvMW5MQ2VYSlEwZ1BQUjFOKzN4YjYx?=
 =?utf-8?B?eVBLQjRvT3NLWnIyUk8zWVdFNTdhaGxqWVdJSG5lWGJmTWk4NWh3RUFvUHly?=
 =?utf-8?B?Zm5kZTREUkcxc05HQm9zZWxzSWR6SGx4K1FIS3JmQ24zU3d1VVpkRXgyV2lV?=
 =?utf-8?B?UGdReFJhUmRnK0EvMFljVG9LMkRWM0poYmJITHdLWHlmNEswTXozRDV1S0dX?=
 =?utf-8?B?RW1VQ3pZay83OTEwem52SXVOWkxEV3pwak1jN0FHZmNmSExMb2ZxdWdxb05U?=
 =?utf-8?B?ck0vQ1laZUJjbWx1bkJvSFI0ZFJpLzEzQmNIRWdGYzdHOTdhM2pyVmlYeVVI?=
 =?utf-8?Q?RJbRm+U4p+/EJvTFMXtz02C3q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f34a0652-7151-4872-3aa1-08dac6716b81
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 18:52:46.6237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1bdXO06sNXVS+OD0vYhVdf+P/LsEWJA4z7HSVcGCRV0mctoiUpcO+kntBTb/VJ5MFCNcz9JhbxheLAsKr0BfJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7348

Hi Wei,

On 04/11/2022 10:07, Wei Chen wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> On Armv8-A, Xen has a fixed virtual start address (link address
> too) for all Armv8-A platforms. In an MMU based system, Xen can
> map its loaded address to this virtual start address. So, on
> Armv8-A platforms, the Xen start address does not need to be
> configurable. But on Armv8-R platforms, there is no MMU to map
> loaded address to a fixed virtual address and different platforms
> will have very different address space layout. So Xen cannot use
> a fixed physical address on MPU based system and need to have it
> configurable.
>
> So in this patch, we reuse the existing arm/platforms to store
> Armv8-R platforms' parameters. And `XEN_START_ADDRESS` is one
> kind of FVP BaseR platform's parameters. So we define default
> `XEN_START_ADDRESS` for FVP BaseR in its platform file.
>
> We also introduce one Kconfig option for users to override the
> default Xen start address of selected platform, if they think
> the default address doesn't suit their scenarios. For this
> Kconfig option, we use an unaligned address "0xffffffff" as the
> default value to indicate that users haven't used a customized
> Xen start address.
>
> And as we introduced Armv8-R platforms to Xen, that means the
> existed Arm64 platforms should not be listed in Armv8-R platform
> list, so we add !ARM_V8R dependency for these platforms.
>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Jiamei.Xie <jiamei.xie@arm.com>
> ---
>   xen/arch/arm/Kconfig                           | 11 +++++++++++
>   xen/arch/arm/include/asm/platforms/fvp_baser.h | 14 ++++++++++++++
>   xen/arch/arm/platforms/Kconfig                 | 16 +++++++++++++---
>   3 files changed, 38 insertions(+), 3 deletions(-)
>   create mode 100644 xen/arch/arm/include/asm/platforms/fvp_baser.h
>
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index ad592367bd..ac276307d6 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -138,6 +138,17 @@ config TEE
>            This option enables generic TEE mediators support. It allows guests
>            to access real TEE via one of TEE mediators implemented in XEN.
>
> +config XEN_START_ADDRESS
> +       hex "Xen start address: keep default to use platform defined address"
> +       default 0xFFFFFFFF
> +       depends on HAS_MPU
> +       help
> +         This option allows to set the customized address at which Xen will be
> +         linked on MPU systems. This address must be aligned to a page size.
> +         Use 0xFFFFFFFF as the default value to indicate that user hasn't
> +         customized this address, and Xen use use the default value that has
> +         been defined in platform files.
> +
>   source "arch/arm/tee/Kconfig"
>
>   config STATIC_SHM
> diff --git a/xen/arch/arm/include/asm/platforms/fvp_baser.h b/xen/arch/arm/include/asm/platforms/fvp_baser.h
> new file mode 100644
> index 0000000000..9450a411a9
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/platforms/fvp_baser.h
> @@ -0,0 +1,14 @@
> +#ifndef __ASM_ARM_PLATFORMS_FVP_BASER_H__
> +#define __ASM_ARM_PLATFORMS_FVP_BASER_H__
> +
> +/*
> + * 0xFFFFFFFF indicates users haven't customized XEN_START_ADDRESS,
> + * we will use platform defined default address.
> + */
> +#if CONFIG_XEN_START_ADDRESS == 0xFFFFFFFF
> +#define XEN_START_ADDRESS 0x200000
> +#else
> +#define XEN_START_ADDRESS CONFIG_XEN_START_ADDRESS
> +#endif
> +
> +#endif /* __ASM_ARM_PLATFORMS_FVP_BASER_H__ */
> diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
> index c93a6b2756..0904793a0b 100644
> --- a/xen/arch/arm/platforms/Kconfig
> +++ b/xen/arch/arm/platforms/Kconfig
> @@ -1,6 +1,7 @@
>   choice
>          prompt "Platform Support"
>          default ALL_PLAT
> +       default FVP_BASER if ARM_V8R

I could not spot the patch which introduced ARM_V8R.

Can you rename this to ARM64_V8R ? The reason being the underlying code 
is specific to R82 ie 64 bit V8R.

- Ayan

>          ---help---
>          Choose which hardware platform to enable in Xen.
>
> @@ -8,13 +9,14 @@ choice
>
>   config ALL_PLAT
>          bool "All Platforms"
> +       depends on !ARM_V8R
>          ---help---
>          Enable support for all available hardware platforms. It doesn't
>          automatically select any of the related drivers.
>
>   config QEMU
>          bool "QEMU aarch virt machine support"
> -       depends on ARM_64
> +       depends on ARM_64 && !ARM_V8R
>          select GICV3
>          select HAS_PL011
>          ---help---
> @@ -23,7 +25,7 @@ config QEMU
>
>   config RCAR3
>          bool "Renesas RCar3 support"
> -       depends on ARM_64
> +       depends on ARM_64 && !ARM_V8R
>          select HAS_SCIF
>          select IPMMU_VMSA
>          ---help---
> @@ -31,14 +33,22 @@ config RCAR3
>
>   config MPSOC
>          bool "Xilinx Ultrascale+ MPSoC support"
> -       depends on ARM_64
> +       depends on ARM_64 && !ARM_V8R
>          select HAS_CADENCE_UART
>          select ARM_SMMU
>          ---help---
>          Enable all the required drivers for Xilinx Ultrascale+ MPSoC
>
> +config FVP_BASER
> +       bool "Fixed Virtual Platform BaseR support"
> +       depends on ARM_V8R
> +       help
> +         Enable platform specific configurations for Fixed Virtual
> +         Platform BaseR
> +
>   config NO_PLAT
>          bool "No Platforms"
> +       depends on !ARM_V8R
>          ---help---
>          Do not enable specific support for any platform.
>
> --
> 2.25.1
>
>

