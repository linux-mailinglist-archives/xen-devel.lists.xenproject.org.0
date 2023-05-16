Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6CC704E33
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 14:54:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535176.832807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyuBf-0003xC-2D; Tue, 16 May 2023 12:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535176.832807; Tue, 16 May 2023 12:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyuBe-0003uV-VW; Tue, 16 May 2023 12:53:54 +0000
Received: by outflank-mailman (input) for mailman id 535176;
 Tue, 16 May 2023 12:53:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pyuBd-0003uP-Hg
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 12:53:53 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe02::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4ae1511-f3e8-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 14:53:51 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9389.eurprd04.prod.outlook.com (2603:10a6:102:2a8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Tue, 16 May
 2023 12:53:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 12:53:48 +0000
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
X-Inumbo-ID: b4ae1511-f3e8-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oThhyUkcMuB9Y9AWrSnLEhxwxREE4/L7FJEakfk0A0Xu+3dK+VmDHVuDV/sMKtqfdWXn0pcZiM1XbSjp1GD3NTr+e9Uu9bSM9wQhI9zgGHyeA72SyhuOv3wLcNRccDTIkiXbQJutB+cl3CtjqndFTfUQS/6z14zy9uy0v67CUi1zOanbWP6WC4fAtlsDC9MuftjjaTQoqZh9LiQqDmFUZrH702A9mxMI5LBNzr94p0ZaThFBHmcFiBgrc4wxJh1Um9ilm2UKBYncQezuOboITILbI4rGcVF8lq8ByjxY3+xXFa6mYB5InaV5NP1Pp4ZzdN3deefVG+z88Be0I0rILQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fj4WW3cDCNYbX2SRoGHsebVtFneF3IAQPw+XdPhZ/Ak=;
 b=Zn4WUQxn8wTJm4M/aIJUCoJDXsvOssCbon00QBymROnR+/JUpZZgYhU3NyBb7ipx2Dn/yCW8wHzTz/YkoIAAwZGFQUlY1/wNFcjhYBzIxFBikvS+b8BVA6RDktQuQzIRdUISPpQBGGTyeXay01+0FZLXMsFF/5STYUZMo/BwZ/liigiLpOn1lo5C9vfj1qSTeYHwrUDLTs7TDbu7m8mNBGUuNdAvrO7O8AzaPhbSBlNoOQ/baU85ix1Fyicm4NvH6bYubVI4/AJvP+M5VQelqBHX/Y6lD4ZAN9zdyVge4frRuzZfGLJUcSP9PAeFk7eGWAThSpdYdsTfrKkfoq0rOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fj4WW3cDCNYbX2SRoGHsebVtFneF3IAQPw+XdPhZ/Ak=;
 b=hJjXowwfBWhKiUbo+q4OiuxaRuEiVGNvrLc73ZCaQ32CiWlOls86IOwdvt/q1r6WB93M4wzY6tCYJXE8q2UV+wtJENjVkgaR+3TJgSVXtenQPx4uKatQcih/NMag5cizlpgAEpr3JMlAlm6iaYm6NQIVVMYjE8qLp0xRAyAp0YAGas8DUnKA58Dhc0j3vB+5fU2sgiffZBnbm9+nbEJIStRKC9OoZtaleJCIyHAjCvjEs+F0/sh68Webp8TwqKU2hzFscUv+G/Sv7VmFwvFR4lKs71b3q/6SSV23sIMO9Qmg+d1OATmoF5DtRLeUydub7CiSLLm6VSx29HTd9CfwoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f5f56c2b-f382-b007-3949-2bf4bd37b392@suse.com>
Date: Tue, 16 May 2023 14:53:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 5/6] x86/boot: Record MSR_ARCH_CAPS for the Raw and Host
 CPU policy
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
 <20230515144259.1009245-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230515144259.1009245-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9389:EE_
X-MS-Office365-Filtering-Correlation-Id: b860927f-8e80-4e4a-8f17-08db560c9723
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SDGJjGmAAQfq0mVWkmZiu18MDymq8x3ukOYAWciJFjnOjOhWV8fs1//+XSfjfgSftJjM0AfPIim0Z/9Gdw/uo9bpUoRU9HVIbjfdWcnM6oLnIZ19x7l90z63xIfFJpUYwOcK4QMRP2nKhlDSWUEEggg2buBD1y4GSXsTdQbL//ahw25DOTshTGPGQ7Yra9LtgUliUIRqitsspG/IZrFfyBvsBlc4Ji4Gu/aPt3EdyyKgwoFqnHiV7WjPJOiNoTbNc+m8If7f8u6NvkGgxAv/jdPmEyT3dvOhra2K1OOp1hzluwbOBNbC+2Mz/WrFduFTVx5gUs7RjllMqAbiuvQiQ4M7Jga2SZIMZFmHriZrmu5aEjI85VkjfU/ZH6qJUgTrwUJnnmC7/QnefILQz8SBvkdGkzzOY+J5HF7mjwM8+hpaBHUKHbroW2L8ApcoBCF2p3bgwiBV5/j82XuoNSq+SVqDsms0bOXfOWwM5BacFJM7j7ecLCxfRlOAASR3HefDM6ncx5B9bD19X5Ehx8t4NdEKXSHRiY4/NlaKtX9W4sAqxTeKj33sj+5tEe8MLlfaLifG0z1SboPQVrHgkA/JNnBizR1ntYrUBd3HAdr+PYKX8EYPvbqfsPL2K4peyndaJ00yymS1ipYtCKwY2KjQDA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(366004)(136003)(346002)(39860400002)(451199021)(83380400001)(478600001)(6486002)(54906003)(2616005)(6506007)(6512007)(26005)(53546011)(186003)(2906002)(4326008)(36756003)(38100700002)(6916009)(66476007)(66946007)(41300700001)(66556008)(8936002)(316002)(86362001)(5660300002)(8676002)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anNJQ0NnTUVmcGc1cG80WFFOMUcrNmgxS1NielhQa2xWL0VLNU5DSHhBbll1?=
 =?utf-8?B?NGFlbTUyWlI3ZU0wWERXZHdUODg2dUVZbUMxU3QwTmd6cUl1WGFKeTlLcXgv?=
 =?utf-8?B?RDBqVWt0ZTNER3ViNWc5ZThRZGxvL1U3eURRc213UW0zUFkzaTlVa1lQVTBX?=
 =?utf-8?B?ZklwZWowbitwWnBQMTFxb2NZczREd2gvZnEwNGkrKzdQVUFmZTZDOWsycnR1?=
 =?utf-8?B?LzI1Y1FtNHA0c1orMFNhbUVZWUxKNmZPVHdQcWxMU2gyZzVkVC90cVZJOUdv?=
 =?utf-8?B?T21hY1IyTzBzK0tMMkYzNy9jVHF4OHVNZ0ZrTFJsZWRRQ1RabEVIQ1dQUUJP?=
 =?utf-8?B?S3ZPS1ZvVS8xeVZtQXI1RWFDeDhrWEZJT3VwQzZJS0x1RHVMUittN0VCQ0pZ?=
 =?utf-8?B?ZDd4V1laUDdyczBzZC9TVFRVaGIyRW5yT3ZsdWZueUg5c3N1ZzdlelV4MkVL?=
 =?utf-8?B?VmJxRGM1bCtGUnVuYkJmbFQwclZidmlQMmcvN3ZiMGVtaVo5SFRydWlyclJG?=
 =?utf-8?B?Umd3MkMyWngwL1VJTkxiVCsybDE4d2NvS2J3eHJaRlptZ3RGeDAvUVpHNkRr?=
 =?utf-8?B?R29odFNHaFdlaVVpUFA3ZjgybDQ0WkdKMCt5SnBnSUc0N3ZvYTNrVW5KdW8v?=
 =?utf-8?B?VE1yeEQ4L3FjMkhyZHJEV1lCazgrRlhNVDV5NUI2aDN0cW1FQ0tvMndZNkJN?=
 =?utf-8?B?UHhGVHNHcGd6Q3d1dVEzQUtzYkUxZTQrWExyL0gveThnVWV6N2JBaENaeGU5?=
 =?utf-8?B?WjloWEVaM1BEUU5CeHpXZU5VKzBGczRNVldoNG1NaUlJUVFMNHFKc2puOGZv?=
 =?utf-8?B?Sis3WWtVaDdHZmpaalBiQ0l2RTFKaVd3TUovcFZUcWlOdVVBUzUzZ3VJVnRM?=
 =?utf-8?B?NDQvcjlzT3B0R3NBWmg3V01KSmo0eGdBaXlqZEVLUmZYSktzM3hkSlVvNVJG?=
 =?utf-8?B?SkJ2amJGWDQ5WkNOSU5UMkRUTFRMbXRELzV3Wlh6KzhrbEd4My96cEljZ2NM?=
 =?utf-8?B?QzNjUm55WVNkVm9iYnRkRlNiUlU4SndqQnhPTVd3dGo4U3dPcExJSEVrMlNT?=
 =?utf-8?B?UUZrcEk3d3UxSVV2RDBkWFpzanlxZnNDOEM4OFNLVy9naTBrRDQ2aWo4ODZK?=
 =?utf-8?B?RkEveDJtY3JJRDJwUkZNSXNrdWhiV01Ndks3eFVPUTBxZHF4YnJIMDJRTzJR?=
 =?utf-8?B?SldVRGp1Q2FSY3NkVjhYaFAxWmoyenpwODFob3JWcTZoWGV5YTNiV0lnV1dW?=
 =?utf-8?B?NnM5dDZ4bHBtbGVGVXJrckV6c0lVZjlLNURud01QZll2ZDVQMlhPTmRpYVVq?=
 =?utf-8?B?c3JXVHBMYnpweHlTMG5qV050R3liM29DQm5hb29veGc0dEZRT0k2Y3BOVjRW?=
 =?utf-8?B?R1RPN3NOU25GdjBDTENqNTd5bWtURGR3elF6ajRwNHg0M04yRVNWR2Fna1NO?=
 =?utf-8?B?a1VtcWRqSlgzWDErbk02ODVMd1RrSzhjRTAxeG9mVEdlQUxHbHZzZlJxVk45?=
 =?utf-8?B?WUdMcDJjM0xLUnJzN01SbFQ1Ly9EWUVVWVFGSmZadUxvUW1zSGd1MHQyYSsx?=
 =?utf-8?B?L2NBVjF2V2MvSFBCZExiZFlOVDFDQm9hdDhmKzZnVlNJdHJmN2NZb1VpaGJz?=
 =?utf-8?B?SUs5ZTNWSXNJMlNXRlJYUWFaNDlhMG8zQ1BmVVVrSTV6RGJnU3VWRGhyaUsr?=
 =?utf-8?B?RjUxYjJtbHZrdHZzQjRqckZTMGNrSWFQaWlURVREV1czTUNLSlpFblJBUm85?=
 =?utf-8?B?b2ovYnU2VUVLVWE1R0EvQTh2M3pkZWZibjRsNU40UTBFVlcwTGQ2M1E0ZWdy?=
 =?utf-8?B?UGs4aXJPaUo0RSsyM3IwMC9DZkh1cXg4YlVsNnZjcjNBekJ6dUlTYzQ1aWRK?=
 =?utf-8?B?Y1c0Mnh1cVhXYjFqS21YUitLVWV4ODk2MTlmWU9UajM3WXVMZC9COVVQRWVY?=
 =?utf-8?B?YnNQNGMrNTlrNnlnYW9xTER1T2ZrODRLK2QrWkdiOEkrN29mWFZmbHVSV3Z2?=
 =?utf-8?B?ZDJUV3ZPc0VZbCtGTVBhMWNCalFDY2t4TFZpbVR2eTIwZlNUaGlkOUZ5M0pN?=
 =?utf-8?B?bTNSaWVsZzV5NHR6cTdmUTZLbFB1ZXorR1lGcENXSEdoN3BrU2VJeDA3VnBI?=
 =?utf-8?Q?2JjPeSIrhX46MKT2F0VxPAASL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b860927f-8e80-4e4a-8f17-08db560c9723
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 12:53:48.0892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2jcbjjHgD/I2TjzWXYtgDpZlUsX8f/YJ+3uEWTcVdFpTBOseQVLGbQB3SDOXI3umSyjHI6qHon1eDPaCY0ph7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9389

On 15.05.2023 16:42, Andrew Cooper wrote:
> Extend x86_cpu_policy_fill_native() with a read of ARCH_CAPS based on the
> CPUID information just read, which removes the need handling it specially in
> calculate_raw_cpu_policy().
> 
> Extend generic_identify() to read ARCH_CAPS into x86_capability[], which is
> fed into the Host Policy.  This in turn means there's no need to special case
> arch_caps in calculate_host_policy().
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I have a question though, which I think would be nice if the description
had covered:

> --- a/xen/lib/x86/cpuid.c
> +++ b/xen/lib/x86/cpuid.c
> @@ -226,7 +226,12 @@ void x86_cpu_policy_fill_native(struct cpu_policy *p)
>      p->hv_limit = 0;
>      p->hv2_limit = 0;
>  
> -    /* TODO MSRs */
> +#ifdef __XEN__
> +    /* TODO MSR_PLATFORM_INFO */
> +
> +    if ( p->feat.arch_caps )
> +        rdmsrl(MSR_ARCH_CAPABILITIES, p->arch_caps.raw);
> +#endif

What about non-Xen environments re-using this code? In particular the
test harnesses would be nice if they didn't run with the two fields
all blank at all times.

Jan

