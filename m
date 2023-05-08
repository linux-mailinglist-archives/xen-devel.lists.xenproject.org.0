Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADC66FA8AF
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 12:44:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531364.826968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvyLa-0004Jp-6e; Mon, 08 May 2023 10:44:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531364.826968; Mon, 08 May 2023 10:44:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvyLa-0004Hr-0P; Mon, 08 May 2023 10:44:02 +0000
Received: by outflank-mailman (input) for mailman id 531364;
 Mon, 08 May 2023 10:44:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pvyLY-0004Hi-Fj
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 10:44:00 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2052.outbound.protection.outlook.com [40.107.13.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b65f0c1-ed8d-11ed-8611-37d641c3527e;
 Mon, 08 May 2023 12:43:57 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8972.eurprd04.prod.outlook.com (2603:10a6:20b:40b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 10:43:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 10:43:26 +0000
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
X-Inumbo-ID: 3b65f0c1-ed8d-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQK67h19T/9ze0UJVawzQDmmgiW3nt5uAK9TJ8VtSz6qZslE6dhaCDY291n2hSteeizN5bxekdTt/1p/LFpcOfbVgt4cAJSxVdKhFP3P6UJbBIebQh2uvSUlnoHN423QmECS/L6+w8KK9NY/nglB5afMTSjKHMoS/dd/lWr7aZmQO96mG7LfMMuqu8tVXxlH7q7qaDIu7f3fCg2RHifs4nukyMEKNKKWoBtWxJ1nGU1egPCBt605qVaIbgszrD9dbTRCKqst1UYKOB76iw7r4yHuA8hr6llFQQ0Snei2govYMl6qN2Wbl+8yv0YeDsbAboT4ZB8kLjlNyQSJGPSgIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Vnj8BGxFdOpi+mDnv+mAqFum0KzLAlOAdeTOWLMjIs=;
 b=B0OgsHvxVQR3kafYFbv1tVDuEUFk+v1OqHZhKouVZPxbF9qteT5wNMAY5Kh9imsflZN89uKM7ZN5sA4GHPqjuHeTkLNO4xNVamouwaLxq3CkzkWwkPQaAa7TSd7ap8tHgOMxIYElhgXj0G+DgxG535YSzqVp57a8AsUTPSFvwau/S9XF3VgWkSTM7MzYXXftsVkp5LYKTWf0PbAUxpcohxjxXURKhbCy0PpXlzGl096SzLwoPCeHXbadDOztIBtvNqA5eySStdTxIP2eakOl0oGcOF7V8nW6zDTg8XyysnxIeaX9esqqXW8yo5m5LFjp4ToKXTtmBljQux8+S3mNGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Vnj8BGxFdOpi+mDnv+mAqFum0KzLAlOAdeTOWLMjIs=;
 b=Wz8ESupLngXCenUVeARG9XeFNiZsQfkroTdHbTb99c3fj7lWW9PpW8RqGTS8cxqNZY0bFWJX61NJyU4pqb4q3lTgolkZGZgY8JkUyOQac/qH7qzHfvm0FULC9UnQk5cTZsvK9pjZwVUIpm1DRAX0o6EyT+4tKIF34SSgGv/zP4eS9jb+y8kp+O2tuItQB9LXCUyWL2J7FaW83FLjjDtNoNcpc6tdaBIz9PDr6CFsQzvwcsEoLZOnS3tkdUplxXC5E3URF+AW1sqbpajtab0C/lsvPLGl0M9fwRDNfRN7/yJzNzMe+Gl9u7KZ3LoC0A2Wr683BIDMnKbGj1DtuzcKqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <256fc66c-066f-3f0c-b34b-a237e9268f22@suse.com>
Date: Mon, 8 May 2023 12:43:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 09/14 RESEND] xenpm: Print HWP parameters
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230501193034.88575-1-jandryuk@gmail.com>
 <20230501193034.88575-10-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230501193034.88575-10-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0001.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8972:EE_
X-MS-Office365-Filtering-Correlation-Id: 65287fbd-5e2d-49b6-483a-08db4fb10db0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7JpMww0oG3sIX830c0JnR9B3CuR8bo58MZ7MR8zcVDBZVXtFMq6tPErsNKPsDNHgz5N2fom6MFnqSu8ZLzY85r8/rZ5l7qjoJL3MzMUukfTq/gEmZdAuHLMrJUVrLFjDCyGwoMf1KcOzr+070m/KCyWhKLYz8lVsGVLO/B6pyr88WvyHYgGQyhK+ozpSPHB6+8x39kZtePFJS6wRBtFho4j+y2DhfslvZH/TGOJEPggNOV3q3ALzyjQKjPg9wUJGL5utns80zCihEkYSuzp9aAB4FedRWjZBgrIjvGDfo9n9O4jIxMiKXLO2XyJZMI32p82LJVKuR4v3idvVyVUcy0wimI+/x3jNYf6U8wkspiDbO7Puvim1UplULidJhqv91kg9QyFj9janRRC4Y1/NP9qf8ht04N3FbNaF3zmR76QJSkOk/Fn6ZhsTo6kOU/qP6wZhpA0mf363evgLC861zZPed8hRKc2jT9JqVSyA1ljCoLlD23C2theDwmT6Eao33BppXTwxVwVU/5kmeSgV/A0w7kdftAj5rZeoV9dCi/KqfuLAlXrjeFTOL3EkX+dgq48E37fuBPq8fZeUlFHYCspRcVBBUkv0YXLhz1vyoDb0bmeSEmZVlR+r/jSOKIJcCMFHiM56HUpRlEl5g0NUeA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(366004)(376002)(136003)(396003)(451199021)(31686004)(66556008)(6916009)(4326008)(66476007)(6666004)(478600001)(66946007)(6486002)(54906003)(316002)(86362001)(31696002)(36756003)(26005)(53546011)(2616005)(6512007)(6506007)(83380400001)(5660300002)(8936002)(8676002)(2906002)(41300700001)(38100700002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dG4vdlRSTFI4OWhhRGJrKy9kZmRzZCtRVFZqamxoWitLZjNYSDVQMXRrWkNJ?=
 =?utf-8?B?cTBRUklBbUQ2Y3YxS1lTajFjWUw1NHc3dnNBWmlHTml5NHE5L0t1eXQ1TGp5?=
 =?utf-8?B?bnd0TWk4MGI2OGFEN0JLMWFaT0pUVGl1V1ZwUUVRNjI1SmJDNGVTWUw1TVc5?=
 =?utf-8?B?SGFQMGJLeG1JMDRSRTNhdm82SkdUZzY3REpHK0ZMUGwrdmxwSFhmWmZTNGJ6?=
 =?utf-8?B?RDhvUFlhdGx4cXd2RHF3d3F0cFQ4OFJocFdzQmM1RmxNaDQxbEtPWHlGK1NJ?=
 =?utf-8?B?SjFwMHNLU1BEa1ZYN3pYTm4wdmVKVStJR0E1TnEzNlJlRm9ZdEwyUVUvNitM?=
 =?utf-8?B?VlNqVE81SkFvZTJpcFFoRUpaNG1TYmx5NkQ1STliN2I2ajNsTU1oVUI1Nkww?=
 =?utf-8?B?OFJ0a2FnckxWVXB4NXN5MFcvSEtudzFoY0FvenBhcC9QOE1FazFHdGpuSVdN?=
 =?utf-8?B?Y3JEVjdVVGRGZXNrNThobFR0ZEQ1V2hHbUV2Yy83Z0FIQjdYZm5SM1FQMkZG?=
 =?utf-8?B?ZmNwNGl2SFlBTGRwcjVSc2VFTTV2N2YvbXZmRGxKS2tGaHlKdWV1YS9DSEsw?=
 =?utf-8?B?Q1lrOGVQalcwUGVzS0V3bDRLMjM1ZVcyTlFOT2FpSFZNUzBSem5yaVNMMFFq?=
 =?utf-8?B?QjVDZjZhcUQ2ZG1Ob0p1Z2dNN1o0TXdaS205Q1NwVmhJa29WVk5xK3dleS9l?=
 =?utf-8?B?RVNCWG5tYzNLbENYclBiaGZkZFd3N0FSK0pLbHUreXdCbFE1dmtOYzZ3ekFT?=
 =?utf-8?B?UWc2S1VpZ3JxMHNNRzhjT1UrRmZOTy8zUUJFb3ZvMmhRZVhmeFlsdXF3dlFP?=
 =?utf-8?B?WTFkNStuNGpRQUw1clJBcXhDZVhWeDZ5YU9yQVJITlZlMFc4dlRwNzlVeVhx?=
 =?utf-8?B?ZEtyQkttb2o0a0gyalZaK0dIUXpaODdGd2lQenpsV2lSbzBPVENoVkI4SGs5?=
 =?utf-8?B?ZnhFTzlURnRQWTduUG0xSTdRbEJLVCtvTGFsNVZua2VBWEI2amJ6dEthRTVn?=
 =?utf-8?B?NWxvdVdreHJsVjN3MkozSVplZlNlMWpOWk9DbllJSXRkTkV1NXNBYm5MS3Bv?=
 =?utf-8?B?Qytsc05uT1BqUVBJOVN2aWkrWXVKSkRsbEM1NDNaZk9ZMDlneVhxWmppUTl0?=
 =?utf-8?B?K1UvZkRBZ0NDSUpvekpmZ2NvbXNCQUo5M1dTS0JPWEd3WE5oTnVhSTlJdkw3?=
 =?utf-8?B?eUF5dkhFYWdkQllnQlNFdHZXMlRtYjVNNG9udm4rNk1YY0lGKytRRGQvb0Vu?=
 =?utf-8?B?ZndtUHVIdkt1Q0xWTHJWdGxwUWlZUWtKL0lvMm1Ia29aTC95NlNBbVV4TmlE?=
 =?utf-8?B?dE9scm5JWjRYYzFZcGZMMmxuS3NyVnhwdjIyNm5XbkNhN0poeWRvZFJXaE00?=
 =?utf-8?B?TlVsZzBTN2g1Skx5cG92WTY4Y05uUHdRa2E5djIwZ2cwbjNhREVJYzNmWGlm?=
 =?utf-8?B?L0xuWElHNGY5QkhvT0FPVUhuRXpONDdrNmhNYlRMZjJQa013U2xNNmVjYnVO?=
 =?utf-8?B?NXlKMUUzYWJBS2hTTHNTTmF2OFpnWDRxNkhyUXc3cnRnZVJqL0JmU3A0TmFR?=
 =?utf-8?B?S01PZ2tVVk1nMzFnelZsczM0M0Q3ZHNBd0xTbXhPZXIxZHVnNkttR1lXSW1T?=
 =?utf-8?B?NFhYd0V0eldhT3dvYXR6WDdVOUNPbmxmUGRVdVpSR2l1Q1dERUg5Wk1mcEJL?=
 =?utf-8?B?UHlTTUpxOVI2cGozNFExaENidi96KzZjc2xMTmg4Vmw5VjhnUDgvaHpYRzhP?=
 =?utf-8?B?cThxK2dpbnhJbkZpa2JZYUthK1JtUU5NelVIVSt4SjFGL2ltY0ZHR2MxNkMy?=
 =?utf-8?B?aTNOTktBckppWXVZZ1BUaTY0NXM0MnhlZTVuUkl4MmIxeXJ3VU85QVQ2anpO?=
 =?utf-8?B?aG40NERvd2JrMWZ1cHF4L0orSktqQ0cvUmt2c1l2NHNsNnNsREpyK0dpYnRz?=
 =?utf-8?B?Z2lzNDdNY2xCRVFIQlZ1V1dudFU4NkF2VkFoaWsvanMraTN0bVdOZ1JiQnFN?=
 =?utf-8?B?cmh6WG9kK2JoUElEQjFGaVo2M1Y2bU8wMy83bHhubVVsMDNMYU9wWVNSZUZF?=
 =?utf-8?B?SWxubCtIc0N3VmE3TS93cGVzMW9VVUJBT0pVRFhac0VNQjcwUWV3ckJaUmhB?=
 =?utf-8?Q?B76mF5kTZ7048QP6Vnw/oGmqf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65287fbd-5e2d-49b6-483a-08db4fb10db0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 10:43:26.1957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PcdBNKK5KMSswbJt3ZLf8qUEcPDMrr5oUwxQAkK6zd9GZLyPij3FzveVd5SQSnV8DYq1lCGkOA71DllRamfJlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8972

On 01.05.2023 21:30, Jason Andryuk wrote:
> Print HWP-specific parameters.  Some are always present, but others
> depend on hardware support.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
> v2:
> Style fixes
> Declare i outside loop
> Replace repearted hardware/configured limits with spaces
> Fixup for hw_ removal
> Use XEN_HWP_GOVERNOR
> Use HWP_ACT_WINDOW_EXPONENT_*
> Remove energy_perf hw autonomous - 0 doesn't mean autonomous
> ---
>  tools/misc/xenpm.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 
> diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
> index ce8d7644d0..b2defde0d4 100644
> --- a/tools/misc/xenpm.c
> +++ b/tools/misc/xenpm.c
> @@ -708,6 +708,44 @@ void start_gather_func(int argc, char *argv[])
>      pause();
>  }
>  
> +static void calculate_hwp_activity_window(const xc_hwp_para_t *hwp,
> +                                          unsigned int *activity_window,
> +                                          const char **units)

The function's return value would be nice to use for one of the two
values that are being returned.

> +{
> +    unsigned int mantissa = hwp->activity_window & HWP_ACT_WINDOW_MANTISSA_MASK;
> +    unsigned int exponent =
> +        (hwp->activity_window >> HWP_ACT_WINDOW_EXPONENT_SHIFT) &
> +            HWP_ACT_WINDOW_EXPONENT_MASK;

I wish we had MASK_EXTR() in common-macros.h. While really a comment on
patch 7 - HWP_ACT_WINDOW_EXPONENT_SHIFT is redundant information and
should imo be omitted from the public interface, in favor of just a
(suitably shifted) mask value. Also note how those constants all lack
proper XEN_ prefixes.

> +    unsigned int multiplier = 1;
> +    unsigned int i;
> +
> +    if ( hwp->activity_window == 0 )
> +    {
> +        *units = "hardware selected";
> +        *activity_window = 0;
> +
> +        return;
> +    }

While in line with documentation, any mantissa of 0 results in a 0us
window, which I assume would then also mean "hardware selected".

> @@ -773,6 +811,33 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
>                 p_cpufreq->scaling_cur_freq);
>      }
>  
> +    if ( strcmp(p_cpufreq->scaling_governor, XEN_HWP_GOVERNOR) == 0 )
> +    {
> +        const xc_hwp_para_t *hwp = &p_cpufreq->u.hwp_para;
> +
> +        printf("hwp variables        :\n");
> +        printf("  hardware limits    : lowest [%u] most_efficient [%u]\n",

Here and ...

> +               hwp->lowest, hwp->most_efficient);
> +        printf("                     : guaranteed [%u] highest [%u]\n",
> +               hwp->guaranteed, hwp->highest);
> +        printf("  configured limits  : min [%u] max [%u] energy_perf [%u]\n",

... here I wonder what use the underscores are in produced output. I'd
use blanks. If you really want a separator there, then please use
dashes.

Jan

