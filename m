Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E55E172B869
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 09:05:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546860.853935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8bbw-0005Pu-6Q; Mon, 12 Jun 2023 07:05:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546860.853935; Mon, 12 Jun 2023 07:05:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8bbw-0005MZ-3L; Mon, 12 Jun 2023 07:05:08 +0000
Received: by outflank-mailman (input) for mailman id 546860;
 Mon, 12 Jun 2023 07:05:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cme/=CA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q8bbu-0005MR-EN
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 07:05:06 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2047.outbound.protection.outlook.com [40.107.7.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7479e296-08ef-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 09:05:04 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9437.eurprd04.prod.outlook.com (2603:10a6:102:2a9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 07:04:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Mon, 12 Jun 2023
 07:04:33 +0000
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
X-Inumbo-ID: 7479e296-08ef-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jY1aoixTYqnP50UkExUVG9GImH/WNSmQelcrTEO5gefmBu9MvkYQ3oLIsQzKwREt1d8GTNMOpnaHl9aFkl0KLSwvibT4wGvGwt7kZkO5UlfIcFcQBeOoPMdHx0gltOE5zkH53O511EBddN4gNvJN/UQJ5ic5bUXJjph5dgffJceKOrL9judApyF1FcvCxDZXjd1wW4LcUfwfVho/FsVpdQZEJSKXWaSTug+UIOrki8z94Ob5QRPHZnDXJbas+z40WrVqPyN2u0UBqBGNoQiJYKLc9Yd9cWCLWNB5/o3VggETyzoHokg0SDFsbvHK+bW1P8gOghilUDy3e5Jxot55og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=taU23e3HG2GZ/V07XpCyk8o/l7WkBwv/6UKpugjEwvY=;
 b=lSctC1mUdFBpEuumOQ3LHEfqAEFPp5xD9/nnWH4Dv1eCXUBMKt5omoSb8Z3vFf8AoqJ0C/dmKBggwYpWO0/1jpJs61/9FtYysx5tIcqJ6bHjNH3Jm8HyEuZfUmX06n6vmioTyh/e0/zGF+Hy77B+QDSBueUVx8Kw/9/2w2CnzzJy26MwEmFtupSHSWtp4VydCPLku5CAo0CvqmKMWRgvPgsp6HH+NgNIt9LkvoWsovBbA25lT08zkttyUlxkrKpBqMD4zRRTM5fyvygA7Iidg0gKGS6mulaaz/7/hlIKJ+T5/A4efpD7ihNm7Buvchae9ZidH34P4zTRVhWgHIcD7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=taU23e3HG2GZ/V07XpCyk8o/l7WkBwv/6UKpugjEwvY=;
 b=CwOYUlKr6nQnZwdwpHNp0dhcZsskJHHKRIJk2KYdM9IFBlapPVZZH74b0K8iEgTKEP8YLA7C0YvmsH2gRL9H2R91Ax4y124uLcQDn6WJDU/IjflVpUhS45nJVaxVBvKbtlygdbOAGkFJN0/xngbZaDNs4FlOopE9VrqG/R/iJITyVi5LBGJU+HnTZgSSZxD1nLPoX/mnwVVaWYS4MauRNdw+pHVS8FEJTNxfbq5LnwJcvIyTKE4Fyqc2xT5x5VySBNPRDyHoiyXvz/SBddydNz30hQnt9zDVLpkkk/cEeBIqgse//Fx/8sslq0TWC+MmdOhZIbHL7BWGjlWr3p/6sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d51d7a7d-9395-8301-2f3e-b6b43a797788@suse.com>
Date: Mon, 12 Jun 2023 09:04:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 2/8] xen/riscv: add .sbss section to .bss
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1686080337.git.oleksii.kurochko@gmail.com>
 <6a0f3171323f0092b8374f2244182c7e7ca850c0.1686080337.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6a0f3171323f0092b8374f2244182c7e7ca850c0.1686080337.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9437:EE_
X-MS-Office365-Filtering-Correlation-Id: 2df7ca84-ced2-4b4f-7562-08db6b13467b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Wzmp1lpdkA7fxTGcKeASxHkYcZYpW7UvnOWTC58UUk4qnXZe/Um9XiZKzy7K+oyH9cF9ULBRJejLIwc6vM+mKPBaXtBrV9pT9kxJqXj8fHCrbiQQXW4NlEYD7GYRnkhTXoYViwKd5FSC1WZdvjTyhgG886+vKXVL61eLvY5i02bEwVS7aclg+rJF/se1kTm+sLJX9OotP5LG/1Jmd9bw29xhsSTnrzZU3GqJkVu3baZ++MAq9a3rrpVLYCQadePyDe48+IMKg1ZCKXwwraam1GdIa7WRPGgEKA9Im8zawp/liUcvRIg0tlP5JlXGQLzP18h9nf2NsCJlG2CqJeTpHOlZjCUWeNk/D1sFb3hnxak68RNbZGMpBjV0Gi+U05+Rgl6XWoojKqyZrO6WvBdySJo2mK4s4NXMD8f/XcVJjsgFr+C4kj6AIflEgOzxv0TCKY5SGvlplan9NugmVsQ9TQTsmFwVMSA2q1RDgzVhEWFoizRyccAzad0ain0uxDUbqhA0EEJ33wYyXFm4Sj4xRofQf6tNSyhAyMPCp06/I8Q8gDBGFLdHatLYNXjDInUwc3gPzszt5Bfyd5jYaaMj+XHaaN3oGsi0nI83bGt5iEb1Iau8IMtwBuNGYfPcmMfAL6i/IYgettQ3wVfygg2ovJJq8fq00p9XkA0AdUxo1woaCne7YiLZ45bfTTugmcHb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(376002)(136003)(396003)(366004)(451199021)(66946007)(66476007)(66556008)(54906003)(478600001)(8676002)(5660300002)(8936002)(36756003)(6916009)(31686004)(4326008)(41300700001)(6486002)(316002)(38100700002)(26005)(186003)(6512007)(6506007)(53546011)(2906002)(4744005)(31696002)(86362001)(2616005)(83380400001)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGpoT2tMai9DSFhhQklLKytYcFI4ZDVTaXVCL2gxLzRIQk5kanIvbVJkT0ln?=
 =?utf-8?B?SGZ0Y2ZZUDZZSnBYdFdJN2pNRDVjRnJBRitoZ3h0RUtqZ085Y3NKS0F4TFl4?=
 =?utf-8?B?b1RQS0RlWCtrU3IycG50MW1hZWxZbjN0YktwbFN1VjNuK0gyK0pJYXhJb2t5?=
 =?utf-8?B?TG4rY2lNdkdsUWJESXNpdUhwR0pZRzREZW93ckRlZGs0QkRySFdyYk5NeTdU?=
 =?utf-8?B?ajBuaWpFMGhCb2dmQ0hSNWpYbTlzR2F3dHpVb0kydEt0YS9wL05wZ01GL1JF?=
 =?utf-8?B?TG1FL2JzcTZCVENvNlNMaG9ENHlFRjhXVnB2czF5bjlWR0dESUg4WWc4QjFi?=
 =?utf-8?B?L3RmR1hJNU93OUVYdjZ2UnRlNmQ5MDBqLzdGb3J6dUFIR3BSWVB1dmJqbEQ0?=
 =?utf-8?B?ZXRITkhpeDVPSzVOMFhLYW1qNlU3REh6c01ObmowS0tySzlVRXFGOEJwVFJs?=
 =?utf-8?B?d2pReFIxWll1cnNNd1hQODFhQ29idGdmUTVKZnpORHV0aVhOdG1qNUxZUzJD?=
 =?utf-8?B?cGl2YldQVU5FaXo3Uld0dHR6UVQ0RHlpU2YvVFEzaUk2V1AwSHZQZ21IdVV3?=
 =?utf-8?B?MkRtdExOVkdtZCtjNG1hR3pBcWkxMkRnTWhDYTdXUzhiRTkvUXA3RzExT251?=
 =?utf-8?B?Y1p1bC9Sdng4WkVVQWQxeVhHeEpQb2VyN1dMZkdSeXBHcFMzQUd5TVprN1du?=
 =?utf-8?B?eVdoVVpLWVBTTVRHbXZYbEJZM1dPV1JYdFJBbGJ5OFJXMmdOQXZWMnFNc1N6?=
 =?utf-8?B?SkRoM0ViOWFYdWdTT1RweG1WTG9XWUZObWhYNWhRWDBTY0dSWFNsbjJHdzY5?=
 =?utf-8?B?UHd6YTl6V3h1THBENFJmek5EenMwK216citWREMxaXl4U0ZSQzl1citGY2g2?=
 =?utf-8?B?TGlhSU9MaXBOZzMxQi9kV2RaN0pEaDdWa3RFTUdGWUQrZGVVcVFpQmtrY1FL?=
 =?utf-8?B?L0tzbnFmTXQzWW92YlRnUWpCdlNnNTJ2ZjVOR3l6TFQwbUlaUUJPclEzenhT?=
 =?utf-8?B?a1BsakZkS1hYSmlqdUNsVjZsSjMyTEFjRm9DVFY0MnBDV0VVWUNxWWt3TnNx?=
 =?utf-8?B?S213cERnWGhYZ3pDaXlWaHlDOWxWODV2UzgwRVlFUWRMVVpseTR6Z0krU0VE?=
 =?utf-8?B?ZlpTUXRDc1dCVDB1WGpGVlhJTUdKQ0VldDMwcThweW9SS0RyZzJpYlU1VEcy?=
 =?utf-8?B?QW1OMUtWb0hubjNEaktFajB4Q3h5M0tkZzBneDMzL3FNaHRiTnVUVWR5MFhr?=
 =?utf-8?B?YlR6TW05MEIxMUdyS0E5Q25aMmZHSHhaVkZtdkVIRlNBSzlPekN1L1hBaTIw?=
 =?utf-8?B?K1EybVMwVE5MYVp6S3VROERoVDZWN3FRZTl1c1pPN0RPY25yYVZVaEYra2Q3?=
 =?utf-8?B?SGVEMHVLTWwrZUI4VTdzaXR3dURvb2dGVHU3NnNWamhuL0VZaldRSktEakt5?=
 =?utf-8?B?Q0J4aGRSbTVJQmoxOFZwQVY1MXRxUmpYM2xjS3VvNndhS3ZhNElCcXRHSS9y?=
 =?utf-8?B?Nm81UFRpNS9Tc3VwaS9Qd1creTBuV3gvUlZYM2ZrcUFIWnRMOGRMMm1nSW1N?=
 =?utf-8?B?b0VtVGpoTEZSNlZhaTJrZWYxRUwvUHRVVE8yR0NkY0IwR2dOUHVacFNYQUtk?=
 =?utf-8?B?OU81aWk2RVFHYlpTZnJMTWY1QTYraHVYZFptbTdMb3l1bytmOXZJMU5kV0Vq?=
 =?utf-8?B?QkVhOVdqQ1VTbDZvdUduR0tIaVVJcy80b3p2anpmMkhibWk3NGp3UWxvSjZ2?=
 =?utf-8?B?Z1VkSWN5NFVsZTBaZ1UveWNaSzg5SUhBWlh1Z3RsUU5ITENIRXdubWFhZ3Bp?=
 =?utf-8?B?SVZjcHY4WUx1UzNVR2NENGEzRHQwYTdieVprVzJVVnRYR2wxb3o2TTR6dlk5?=
 =?utf-8?B?R205QmQvR1BjdkxncXJqWVJjcHRqeWdGTnJhZEtoZndZWU52UG1GbmlSeWN2?=
 =?utf-8?B?YTJjaDRkdVdSeGFESjBrZzIwM09uNXpPd0hnem16UkRwd0JwVVFpOWo2SG5z?=
 =?utf-8?B?eW9yR1lRY0tUbEdhai9waS9JVk91bWkzc3NJeUZVOHpyNXVCT0VXTXV3bXVs?=
 =?utf-8?B?TUxyZGpNSFhyOWhNQzM4MUJqd2UvNHZxZTJOQlpBdEVNZjJtdmllQkh5eUl5?=
 =?utf-8?Q?KfPKsqMUjG9XtIbAPQgH4TCm4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df7ca84-ced2-4b4f-7562-08db6b13467b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 07:04:33.5917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iownjv4x5Y0YsIsNas4JhysR116+WUhNghLFHZ4yg/9k6LR380vujsNP1/dDgbGqQ3u6t70/YLzhDYTRkYu8RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9437

On 06.06.2023 21:55, Oleksii Kurochko wrote:
> Sometimes variables are located in .sbss section but it won't
> be mapped after MMU will be enabled.
> To avoid MMU failures .sbss should be mapped
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/riscv/xen.lds.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
> index 74afbaab9b..9a2799bab5 100644
> --- a/xen/arch/riscv/xen.lds.S
> +++ b/xen/arch/riscv/xen.lds.S
> @@ -151,7 +151,7 @@ SECTIONS
>          *(.bss.percpu.read_mostly)
>          . = ALIGN(SMP_CACHE_BYTES);
>          __per_cpu_data_end = .;
> -        *(.bss .bss.*)
> +        *(.bss .bss.* .sbss)
>          . = ALIGN(POINTER_ALIGN);
>          __bss_end = .;
>      } :text

Two remarks, despite Alistair's ack: Wouldn't it be better to add .sbss.*
right away as well? And strictly speaking wouldn't it be more logical to
have .sbss ahead of .bss?

Jan

