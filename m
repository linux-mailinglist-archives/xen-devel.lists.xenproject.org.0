Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B9F775F76
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 14:44:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581047.909562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTiXC-00032z-UU; Wed, 09 Aug 2023 12:43:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581047.909562; Wed, 09 Aug 2023 12:43:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTiXC-0002ze-Rf; Wed, 09 Aug 2023 12:43:30 +0000
Received: by outflank-mailman (input) for mailman id 581047;
 Wed, 09 Aug 2023 12:43:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTiXA-0002zY-UI
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 12:43:28 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2083.outbound.protection.outlook.com [40.107.7.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55a7a6a4-36b2-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 14:43:26 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8966.eurprd04.prod.outlook.com (2603:10a6:10:2e1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Wed, 9 Aug
 2023 12:42:57 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Wed, 9 Aug 2023
 12:42:57 +0000
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
X-Inumbo-ID: 55a7a6a4-36b2-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMZKrwULhP1vU7HwgyLMZOEqxyHHk5PsSMSmnbOno3ZUmvomHCRMwksCIM4x7iWYCJZ+DEtAS607yxONVj4RheE9o87vzOMACPvhU6L4SXzCXnCQyh3sPvZ60H1s7BrY3Mx/gkNyJiDbnGYj5iHwec63ulA/ZBlzUW5VgXWYYEjFtWA6RCtOxf2pzyWqFaNYjFzYyyS1P12hKT2e50OYCyZkPPIpke2MjBsKAc2scygIVC70DqKIZRwoPlqdMh5fvloX5KdeftErCk8oAOi/7nTWzyWm0dRJF7ppmM4YESw+hdCiC3+BXhQY6wvoBSXq0WgSyads8XMiqe31spFxLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDCvP9gDz4OwFGJD9WlNakVlIXibVVDA0fVaxyA6IxA=;
 b=gO4vFJqruKJjqr2ChuEHntO1f93043HMBGDADAZ2tC553AWhJxAT0M+QQvFSjENgCUNuewZWSV9jsSGPMmAJMVf7taXRDVdqTwupGmtGdl2Kz8/UALFzYAphV9sWHQDUmoXOFCrtBBXFHReLMpPEW94nPIh0UVNEvBk0V3m+zvrHxt+TZh+WWElYJsldmtno3uJOA+HVtXU4Vs4enX03cUQvlETelZ9FG/M3+6uJknK2BLzTANqgYPo2+Myncq1x8nsKcKBAqTKjTdRzCi9YndpTImSEGWWdpwFxHVFRXp4mBwSaukor+AcNx5vAiPHb0TXCV4CpNI2TPjtQPNm+jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDCvP9gDz4OwFGJD9WlNakVlIXibVVDA0fVaxyA6IxA=;
 b=CuazNH8zkKJ1s87Sm3CABabz/adOUdgpxBnrrKNU4JiqqGDEmF8GPPCBGXhCEspBlWAq5uVtxPsYQt7TMpU8yUJKF5pqhllwS8u554YCeRBOFKjZV8PlXE7vE8tbCvcrS4UADILvam0pCF5PCL+bqU7JlaTvDVg7o60eJm6/gNDOtUBnVSC0c7eN6fO+wfazPlCniCqf+I5nOylWb6r47W3JqEOD898KF6Ms3U5lfJKGDeWES6vqidSVq/OfcCH0glsBUdQspA1rmZJZEgySmu4rk7UTnPvMoKvjpTBzMNNGsm+ru4fTpmepZjBIthzxSCc+Mmaw4HK5Gwi1EltJyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cfbc7569-3714-2200-054c-49ba593d6903@suse.com>
Date: Wed, 9 Aug 2023 14:42:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 4/8] xen/arm: address MISRA C:2012 Rule 8.4
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1691575243.git.nicola.vetrini@bugseng.com>
 <c2b0bb92a246e5cf149b1ec81c6ed635a275f9df.1691575243.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c2b0bb92a246e5cf149b1ec81c6ed635a275f9df.1691575243.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8966:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c858806-d82b-48aa-e3b5-08db98d628a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jmS5l2hIgTGTcCtgJbuL0ifWUQg81//9Uywe6zXykvfOTOChCJbTY2pcx1rTa3xXukEVw+8hR5YDlpIWSN0Xef1WxLfye2M4lVPkAlaLXc7/hmbxNT8AwMQpQs9KjhKFRx8RwbD8pPDNq+8+8DfnWGiDX1A87xcK+b0hyAGlOeum+Q5VD7Su8um656zV2z/tq8RTf+iyMG9Mx3tIu4Ua7eCY1zzbjzmKYVRHfDAAJb8uaf0bVsy/KbqJlVL07A296rbbhlzYYoKj+8thfFdv9DcNwHmwkxPQ8SbYpsi0PUSpsHI8gIM99uNu1NQQLT+X1WzB7TSQYEuh3cN2ZMexaSVWIkP4xPzYkOJJ2IN2FrA5XtFpGGWiQOkQ9psMuXTZdeKN+lARKX/kpj5THUHw9D+gMhcaKEClJPbsjEKCI7JhenEnbTNEWiSq51X27TexS+yXZx+Yjvsvu9fORgsD2UYisbvEW82JLqvQeJ1NBglKS2xJWWu9TLP5kbf9FjhGUNptD4+GC55HlC+usYu63gDinuX+K4iUp7IKRfJAQvxSY0ewVJXYvFwHbpKwkU90Zxi28O9fD+fzVEWwzRd1nanLTE4Tex4owtcPIKuwrc6oBmrhZZW2+0pJXOzjJBqWHjEgleDtQMG8REHp9NIFDg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(396003)(366004)(39860400002)(1800799006)(186006)(451199021)(6512007)(6506007)(26005)(53546011)(66899021)(66556008)(36756003)(38100700002)(54906003)(316002)(7416002)(86362001)(5660300002)(4326008)(2906002)(66476007)(8676002)(31696002)(6916009)(8936002)(66946007)(41300700001)(6486002)(31686004)(478600001)(83380400001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzg4RXBUZWdzWC9wdlhmUGFzUW9BM2JwYm92T1ZLK1FKeStPZFhkRis0Wjgr?=
 =?utf-8?B?NkRsR0RSRGIwVmZxMksvUDJUSndranpZWjZOQTNMWnRPT29lRVdTbmQ1WURi?=
 =?utf-8?B?TkJ2S0J5eWxTR3BHcUQvWmFrcEpuczAyeVByaFhhZ2t5engxOVgwZFJHa2lJ?=
 =?utf-8?B?R1M3SGtMd2Q4K2ZVNEpmMExjdlQ2K0tJK2VseHlSWEdqQlJ5QVo3MjRlWUR0?=
 =?utf-8?B?bmR3S1VSYjBic3RIWENsNWRrcFJqZmlSUzQrNzh4NUJyREFNM1RtdjRlbTVX?=
 =?utf-8?B?WHh5ckw4OS90dGNFcDhxOG1LUG5yNHoybUdJOGVIK3MwMjRHVUwvVzJRSkc4?=
 =?utf-8?B?VnBNUWRYZk1mbDNxaG1ORzdwZVdaWUhtdGIraTFFbk5wTUM3OHRPNkFiQ2tw?=
 =?utf-8?B?aGUrZDVSTS9TWVNHblRlU3VxQlZXSE9SbktlTXl0ckhXZXdLRVNkRWhHSzZG?=
 =?utf-8?B?VkdNMno1WDFHc2xmZXBBL1V0M0Jjb0UvbWlwQ1pudFR4cjkvaDV4SGNRK1l0?=
 =?utf-8?B?YThzc3UwME5CazFNSTJ4QjErWS81anpzakNkMGEyYmhyRDZ6OU5lYXdQZlZH?=
 =?utf-8?B?dmNCbjh2d3lYdnRGd29xbzgyQWFtczNpOU9GanZjM2R4OEx3Z2tnbzd4aTNu?=
 =?utf-8?B?OG5CZWZBeU1aQVdnd1NkREtUSWRCTjJ2cUJoZkpCcmRLTUtnZ3J6SlIrZzJS?=
 =?utf-8?B?N0c4b3JKNGtNY3JDMXlsdmc4L3BQdU51MGtFOTlQakV6NGFLWHBaZVVJYzNI?=
 =?utf-8?B?SjRBVDlSNmJOMUMweVlUb3VDVFh6STNtQUJHV2htd1N1YkdLVisrdW9oVHBR?=
 =?utf-8?B?dEZIaWFkS1Z3VERtWURHTncrZnJqVUJOU1lpVExQMDR4TVNyRnBBUHZsaVRG?=
 =?utf-8?B?OW5ZU1RXeDl4STkySFVNSklrMG1UTkNrYm42aW9BaExRRkk1US9ZN2owRWZE?=
 =?utf-8?B?bnJITWdyZWJBTExnK29zNzBZUWt1SWpOcTUzaUpWQW9yOTRqaXBqSW5YejBw?=
 =?utf-8?B?MGFWbklneEJIN0FBcGI5VHpRUWxUcXp6VDlRUDJjUnpyQkZrc1VHZ3NSYzRZ?=
 =?utf-8?B?Zkt5bFp4dVRCeWJKd0toOU1tNzZ6V1hTNThRSjdZeGhCV0pOajlTVmZZMHpo?=
 =?utf-8?B?TVQyUDJrNVdmaDVveSs3Z2NVODR0V1kzdzduVXlJa3JHMGVzMi91c2x5WXRI?=
 =?utf-8?B?ZDBJK0ZrOHNWeUZYaTA5R0JuMWZtUUFCUnJOcFI2WXVmeHhNK290eGVBRTc0?=
 =?utf-8?B?QTBCaEZJVXE1SmtCcUxHbWRCTWJpYm1hMlB3MVlyL05zUHJKTDFQRk1WRUdr?=
 =?utf-8?B?VmxFTnoxREJoa1dETGVBNmNLZ1pMWjBkZTFIRkxYUGdIMG0yRlc1ajh5VlZN?=
 =?utf-8?B?dktYM3U3ajZmemcvUGxMM2o5b0Q3OVZodUwyOWUzK2l0dk80dFAzd0dlQnpX?=
 =?utf-8?B?NllKWXFCRmNGa25IY1Q1QTVFcDE2U0p0Y3FXSlZkTUJONndDOFVLRzYydWFW?=
 =?utf-8?B?OU9mT0plWlJvQkpqeWVpWitwaSt5NjkwZnVjTUR0bXlKTm1lRDh6S1JTdzgv?=
 =?utf-8?B?V3BDdzQ5dW5RdHpuNVpsRVBBWGx1VGpGUkpGajBFUFBPMGRjVkxYYjB3eUFu?=
 =?utf-8?B?RUQxQnFMa0NLOVRPMVIxazA2T0ZmQTIxOXhkODJ1L0VtZFdHaHBsZ1hxZUM0?=
 =?utf-8?B?OHhJbWQ1U21vNXZwQVlFL0s3dmxMQWVFSkp6QkIvUjJXQmhCTHdUKzhKbGkz?=
 =?utf-8?B?ZDJhbjByZDZkVWpuellpcTN1U1ArR3VETC92dzZ3N0lDSnEvNGRUQ0pZSG83?=
 =?utf-8?B?TDJrVzN2Z2FrdloyeXAyaXI1azdpck5pL0ZadFlKb3pYcVJVV3h4WGhacnhX?=
 =?utf-8?B?VUhxbTNaS2lJSkYzZHo5bzhnVnplS0xUZlB1QVFpNHJVc3BPQWQyUGRGeDY2?=
 =?utf-8?B?bDBlQlI0dTVpeXZHdDNjLy91aEpMaHREbTZvM1hLSjNzd08rT05yNU1Vclpl?=
 =?utf-8?B?Y255SisxRDY3ZFVlcDVzZk96Rnh3ME5iK0gvZWp0MElFd1hmTEV1STVJd0tj?=
 =?utf-8?B?WnZxNVJweWlEdE1WZlpWQTNpSTkzTEhvenRtRzc5cDVkU0ZOcnFGRWZlYTFz?=
 =?utf-8?Q?DN7YUsObthHRfTTNKhZxRwyIE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c858806-d82b-48aa-e3b5-08db98d628a7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 12:42:57.6632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jPWDeQ3bhrSMeJkrNxzt7mEjT7bXa63XRZQa5RYutvXvAdQ7UDMRGzettp52Gvzl2ni5Yo8p0Sx0JBRSf1slHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8966

On 09.08.2023 13:02, Nicola Vetrini wrote:
> 'xen/hypercall.h' is included in 'xen/arch/arm/setup.c' to allow
> the declaration of 'arch_get_xen_caps' to be visible when
> defining the function.
> 
> The header 'xen/delay.h' is included in 'xen/arch/arm/time.c'
> to allow the declaration of 'udelay' to be visible.
> 
> At the same time, a declaration for 'get_sec' is added in
> 'xen/include/xen/time.h' to be available for every call site
> (in particular cper.h).
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/arch/arm/setup.c   | 1 +
>  xen/arch/arm/time.c    | 1 +
>  xen/include/xen/cper.h | 3 +--
>  xen/include/xen/time.h | 1 +
>  4 files changed, 4 insertions(+), 2 deletions(-)

I would have almost put this off as Arm-only, but then saw this diffstat.
How come you consider cper.h Arm-related? This is used only by APEI source
files, which in turn are used only by x86 afaics. So I think you want to
split off the movement of the get_sec() declaration.

As to title and description (perhaps affecting more than just this patch):
Failing to have declarations in scope where definitions appear is an at
least latent bug. We fix these as we find them anyway, so Misra is
secondary here. Hence I'd like to suggest that you declare any such
change as an actual bugfix, ideally including a Fixes: tag. It is of
course fine to mention that this then also addresses Misra rule 8.4.

Jan

