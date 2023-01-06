Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AA26601D3
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 15:12:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472669.732983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDnSb-0002A7-3C; Fri, 06 Jan 2023 14:12:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472669.732983; Fri, 06 Jan 2023 14:12:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDnSb-00026g-0K; Fri, 06 Jan 2023 14:12:41 +0000
Received: by outflank-mailman (input) for mailman id 472669;
 Fri, 06 Jan 2023 14:12:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ggnj=5D=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pDnSZ-00026a-6O
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 14:12:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2046.outbound.protection.outlook.com [40.107.21.46])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b231ddc-8dcc-11ed-b8d0-410ff93cb8f0;
 Fri, 06 Jan 2023 15:12:35 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8804.eurprd04.prod.outlook.com (2603:10a6:20b:42f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 14:12:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 14:12:34 +0000
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
X-Inumbo-ID: 2b231ddc-8dcc-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Die09GvshbmyQ/BF8x9nlKVsSsQbaHL7K0SWsZT90Gedjo0lfYfKqc13uC2bFmwhbKLL1PO+8rdKKaunANu1T7QkNzaiWOuwIvWH7MeFK8HJg//f9NeTERdeKvZhteUFWgibMsC2qWAJ6ISfijp9OXKNkOJVruNoihTa/NvGwu/kI+/7K984XjP/rp0+JJipQii07ct8jBSet4tL3qLG5Fbh/vOjhTO+Ywbg8q8cNfgCICak6Qb1P0QAxCjKsSGbH5n4tuoR+TIKKD/Tq2DypBNy7P1HqdmVohjqasf6JWXm2HwZ3OsPUzAO2BRNOkS90vk1dpK7THyoiTYqFcEILw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FacX2mzZ5EiF0EJmp6Q13pLRP+eKFI0c7R9yu/clnsI=;
 b=SGHJmvCx1JS0T6dQ0q99/WYFDrMRNGbqqimfdGAyxhTuy/4asU4B8hiLbUA/bWGMmMNvEN/7B7EaAfU60EhaOdKdAuTWKRqy/zZx+CgSKgLkuPaiQARNTw/RO191Yt+jVkZ/RCqD5R/CXFJbOC+BVkdTNlEK3xmW6fkQh3GRlqsnwEJ8eTyoNP8GCfsUfMxjNPDwDzfdpmHjpGfY/UUKEi8D9B1Aja8N/4CZNBEPiJaM9JnMjY42mMTEGhRODUCiBpxG4yblQ67QBwlU3+MQczE2X6EaOr3u10u1n/PWjSFxDjMT/UA9D+YAFR9kScDXGAp84uQrvz7GwKyTNCoV5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FacX2mzZ5EiF0EJmp6Q13pLRP+eKFI0c7R9yu/clnsI=;
 b=soDH96wceQd94okvEZf9r9mAZox8uanxRwaWkdC8//K8u1vlFQ3UgPcZqIiKy0xZaLAD8jG5oNDn2SynD6fjZdMC/XfiJBIF4rATyAofIOj7+A0px2yzoGWPr7SAjjvpmBrVfS72UtFr2rhJELSo9TnWxEQFHOwPRXbjf5A80SkpjIOfi/YPD/z6XLjS79M7T61wkXfQkAybSLDiFvd7upMiKpwhoMj/MKYw3VHk9SB9MVnkwEhKp+c3z37bpGXFdZMsZ5d4xsFZiVg+gmoqxL21dNikUYmeh6Mub/k74KWdeGcxFdmClwXwa5sBC7udIPjdqp5mPu3WrDsCUePlqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <204d2288-df9a-0d53-2c42-a52ad0c0c0f7@suse.com>
Date: Fri, 6 Jan 2023 15:12:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 2/8] xen/riscv: introduce asm/types.h header file
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
 <ce66a86285e966700acb13521851aca5b764a56e.1673009740.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ce66a86285e966700acb13521851aca5b764a56e.1673009740.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8804:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e1f449b-2f90-4230-91f6-08daeff00e72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+ssqVpAcrNPecd0wGsU3wXCmNnd1mbUfKdQD5oPDudNFTvGjJEdbRHExzNQwTPA911YQj/9NohGSY/8ye4BKfO+fhHWE22x6jR09sYZgZ/EgJVhuStxhY9foWtQQbZ1Ac07/6b9vROuXuZAUorp0aicSHZo+XBmpAafZSgndVEVDNG7RQek7c3nxrfeKPUC1CEBf5H53AIxUrTm6oUOW5RIkPxzczdpHnoPVR1KkjXB/IScFO6h+rwspzDIU0/QruCR8Ts8rC9kBnFLPsMDizbfs07j1MHR5E3clst+a0NqAjfD1gP93c0LfHiVknG5evHTjaXWnfcZMGeyDmIkcgiuKqZRhjpNCiOILsC54NbTqUmZqZPqX67VuYW8VP+6rwuGEIHIQFB9+hoDG87CbPxGgpD5Iyt4O3JcG1s/TwU/VGeiri3ljFf2uq+YsnzNvLuEy5/FOjUlManUrbRaD5WcVVucJvAr+eSrB6mUKFLOs6oxqYx+R0YroGOHmtGiH2mKz5MT3nKggKtVyMvFxViJcICTnh2sGeDtEIdW4/4zT6CJq/ptaCPWrCeCY42xvo/Q83tp1Rc8t8yovDQaryJWCNL/weq7MeOjQ6AV9SlHUPd5aCcFs67/FnmcffJzGm5B2FOIE/JNNYIoNHQaB9z9FEn/QWKw3m3d5eyqvRDoWoVTIh+nVm8J/ESDaG5xv5LOg8tuT5girdKQP89XHni99tmtou9QjdmUTTpvW0hM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(346002)(396003)(136003)(39860400002)(451199015)(6512007)(26005)(186003)(2616005)(31696002)(36756003)(38100700002)(316002)(6916009)(54906003)(31686004)(2906002)(4326008)(86362001)(66946007)(41300700001)(8936002)(5660300002)(8676002)(66476007)(478600001)(6486002)(66556008)(53546011)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUdhZGtZZkRycHdHYm5PQ2E1Z0FBNTkxdnJVOUJvS2poNTZBWWVLa09aZmk0?=
 =?utf-8?B?NjVzS1AxMkNRcmQycmxZVklrcVQ5SWVTYmwvc2k0ZGJJcGZkNjlvRW41WThF?=
 =?utf-8?B?QzNGQTZ4RlBOQTJTZGdCTjBIR3h1cDI1VEpqK2tJT2FUdk9yN3N2SjgwaDdi?=
 =?utf-8?B?aVVYcnp6UVdkMG5CV0szRlV5b2ZYS1FhQk0zT092dFBDMDNzektETVd1VzdT?=
 =?utf-8?B?T0Y1ZlFpU3hBVjFlbGFLSHU5bjBCUlVnazd2M1Z0dXkzUFErQzA3RTRrM09v?=
 =?utf-8?B?YnpHc0JRM2JTREhoTXpxaXc5NHlSUXFNV1lld3RPNW9xWlFVdTcxOUs4eWVS?=
 =?utf-8?B?QzRGM2dGN2UyaFU2N1lCOTl2aTRqVlkrUm05THV3cXNLL3JTdjltazhDR3Bx?=
 =?utf-8?B?MTRLZWFEdkFlUlZKZmI0YzF4TG1BTXJzMzY1bitnbWo0cjBQOUlzVkpCR3l4?=
 =?utf-8?B?Zit1M29KR2gxbE1nMzFXc2lsSEVxU0VRZE9uRnRMRWZtNVZreXRvUFV3NGZ2?=
 =?utf-8?B?QnByT25LTTliNWJySEZRZFU0dWE1Y2wwTTczQUZKVnRUTGpQN05URmU3WnAy?=
 =?utf-8?B?YzN5REMwSkxiTWM5aWkweXZkZTVnZU9zcFRBdTFlTkYrRThZb2N5L0lWMmcx?=
 =?utf-8?B?TDN4dllKL2RKU2kvbWR0U0xrTlYwekxiU01IdjBRL1I4MkQ1c3Q3SUtIcTM5?=
 =?utf-8?B?NHh0UkxzSlE0VU9vbVBYcjZGc3dha1o2S0hHLzBhTlNtUmViY0phdnZSOENC?=
 =?utf-8?B?OEdjTDBCL1YyQmQycDNnTWR6YTdwVllNZkxOUngzYnkycTdXZ2p3TlppU2Rs?=
 =?utf-8?B?LzJPSXErUHBVRVF5UXNDakxxclJEUW9YT3pHTHRGZkJXMDJpNmxiV0dPa3VC?=
 =?utf-8?B?SzNmVWRSTm0ySy9sRk9wUUdYdzlsanQ2c21NUGFYcUtLanErQWRCVVgyVE1y?=
 =?utf-8?B?NXVIUFBnYy9XMkJ6bE05VjZnbUxWZGRGWHU1eEdQSnhTb1ZLN2pWL252ODBm?=
 =?utf-8?B?Q1M3K2hDS3ZOS2UvVUFuNFNUL1MvejlFQnR1c2orU2d1Z1BzMGJQU2xOUkIx?=
 =?utf-8?B?U0hSTy9pMllSMmx5YjNwWGJ2NWtXUHNNNzZqL0N4V0NVRmNXR3NkUWEzMEJm?=
 =?utf-8?B?ZDZQUHJySGhubWJIRkdnU09pNGNmdTE0WlhYQVNtZHEzSTByT0lRaXRlaUF6?=
 =?utf-8?B?L2loWE54R0N3R2hDMURGTGpVT1FhYnNXN2ZzQ2twL0tGb2VURDEvTjhjNkhO?=
 =?utf-8?B?RFhHd3VJeTlFZlhEczVUZUtYQ2ZVVWJpd0Y0Z3NjUEptSXNzVXpydTNoWEN3?=
 =?utf-8?B?dmErQXRyTExGOW1OMmdRdUhheXp1Z0FEdi9UenRVUTduWE1CRk9zRktsdjEv?=
 =?utf-8?B?dnVjRXo2TU1lcW9EZDhkczVhaXRRbzBQWkhVb1M5aDBPVk1QQzBwbkhQSWNl?=
 =?utf-8?B?RGRKaE0rdVBWZFJxUmxBbUxwQnUzck9rNjEvRW9Hb3VRaE9ZdHg3YkdRMU5G?=
 =?utf-8?B?aFlibTJ3UFhtdkQ5RVZ5K3IyREY2ZVV4eHFLUHZ3KzgrSmdnMHNaZEM5Y0Z1?=
 =?utf-8?B?d0dyRVB5VWFCVWFFNkhwaExDdFJTeCtjOEFRUW81cWRubnVZRy9KUlg0SVEx?=
 =?utf-8?B?SHN3cHVWMWVmZDR4ODd4bzBOdU5UZ0QvQ09rM3g0QVRuYnJUb2xFaTZ0NHRs?=
 =?utf-8?B?dGhwMXh1R28zUzVKZ3l6c1VGd3k3TWFKSUUxRTJua2JLRGRlWjgzYXNVRU9M?=
 =?utf-8?B?a1pJYmI0bVVRdmZuS25FSkFjNWFVNnE3S3o4c0FWTTBLUnM2MkhqWUlVY3lx?=
 =?utf-8?B?eUgralYrTk9pVTQzN1NjVGx2NXd3aURSdnlzQkZKdEZxQ1ZibUVDSWE1SERs?=
 =?utf-8?B?T09YSE0zSlE3Q0ZFUEw0N29saUZMU0dRb0lXU2ZYakFSNnRub0dMN1ltN0FW?=
 =?utf-8?B?NTMvbENsWm05OVBpNS9NYnVQcEJ3K24zTCtDL2h5NnBjNEo2YUNra0cxZUN5?=
 =?utf-8?B?S01BN0ZQTzJPQkM4djFuczZPa3JLT3ZiRjB2ZEg0MzB0THlIQWtHcmViMjQ2?=
 =?utf-8?B?a2ptMHZvdi95aWJ3anNQa21ER2NRUXlQVTFMamdvRkd3a0tlQVRPenFYT3V4?=
 =?utf-8?Q?YT3t1yGvp4GDIgY5qn2eOq8NI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e1f449b-2f90-4230-91f6-08daeff00e72
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 14:12:34.1019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r72DBgK292McbeACiiYzGlaQWAJ4zZNjA926GYOzng+hnTIG0YJrP3gUi0Vwo8BHpwWm+xrWKDFEqkWwgiLB6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8804

On 06.01.2023 14:14, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/riscv/include/asm/types.h | 73 ++++++++++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 xen/arch/riscv/include/asm/types.h
> 
> diff --git a/xen/arch/riscv/include/asm/types.h b/xen/arch/riscv/include/asm/types.h
> new file mode 100644
> index 0000000000..48f27f97ba
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/types.h
> @@ -0,0 +1,73 @@
> +#ifndef __RISCV_TYPES_H__
> +#define __RISCV_TYPES_H__
> +
> +#ifndef __ASSEMBLY__
> +
> +typedef __signed__ char __s8;
> +typedef unsigned char __u8;
> +
> +typedef __signed__ short __s16;
> +typedef unsigned short __u16;
> +
> +typedef __signed__ int __s32;
> +typedef unsigned int __u32;
> +
> +#if defined(__GNUC__) && !defined(__STRICT_ANSI__)
> +#if defined(CONFIG_RISCV_32)
> +typedef __signed__ long long __s64;
> +typedef unsigned long long __u64;
> +#elif defined (CONFIG_RISCV_64)
> +typedef __signed__ long __s64;
> +typedef unsigned long __u64;
> +#endif
> +#endif

Of these, only the ones actually needed should be introduced. We're
in the process of phasing out especially the above, but also ...

> +typedef signed char s8;
> +typedef unsigned char u8;
> +
> +typedef signed short s16;
> +typedef unsigned short u16;
> +
> +typedef signed int s32;
> +typedef unsigned int u32;
> +
> +#if defined(CONFIG_RISCV_32)
> +typedef signed long long s64;
> +typedef unsigned long long u64;

... all of these.

> +typedef u32 vaddr_t;

(New) consumers of such types should therefore use {u,}int<N>_t instead.

Jan

