Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AFB752256
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 15:04:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563147.880175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJvy9-0003ae-RJ; Thu, 13 Jul 2023 13:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563147.880175; Thu, 13 Jul 2023 13:02:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJvy9-0003Xu-OG; Thu, 13 Jul 2023 13:02:53 +0000
Received: by outflank-mailman (input) for mailman id 563147;
 Thu, 13 Jul 2023 13:02:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0tL6=C7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJvy7-0003Xo-Pt
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 13:02:51 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91e5d1a2-217d-11ee-b239-6b7b168915f2;
 Thu, 13 Jul 2023 15:02:50 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AM9PR04MB8700.eurprd04.prod.outlook.com (2603:10a6:20b:43f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 13 Jul
 2023 13:02:48 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Thu, 13 Jul 2023
 13:02:48 +0000
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
X-Inumbo-ID: 91e5d1a2-217d-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CGUBywDFApOIuzIET8t+G9bHPRrjH5BLKsDmc1BXb6oc5/V5jcF1b5xSCGA1PJ5JwPRYnAiVeLRA8KiPx7d8+ocZiHH0m7pdjqBIxfBSmt6NDrIXGS48iHbcL21hBW7pGHYDszypa/kysTSPSdx7oFZwNaLXZrkMTXXadYHBi5a0uYPODWwQFkDOTu/s7Dzocwgzyf38WNZGYiGQp3grxZ0u1XcJi8mp9rYk9/9IU3wmuYWUzbtQ3ZhmA3c0DKYDy9DJWxEk8xDzl6GvLviYqUCnv9MDJ2Qxop8YtCKZlYejZ5ClaSDbEBvK2DJMrSxaUi5TG3PwNQNtnq2+TiOIPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0+JziC2DWMLKXUQ2+6AYymAasPio2XVKkf1gkCYdak=;
 b=iObK6TJFbycwLWo9PSAB93J2/WVlz6GX6Vm9Okz3UQy69NNt5ffehCof8Hz+gpLo4Ex/37Bu5oxvFxi0pZnGiRcWL2HbtrIOxT725lOPqQkAsukhaV/x0uP2CiFYaxKSDXE0rdKaPMgns9x8m9jbq32Grget5X7tPDwNt+z75PVm63gv1nfy4Ffy9IA8mTLuKJAicrGz91jwYWs9tmkmin1CwkALTaCEZesVpoyCzKrmXyOGrr1yFV6uVsmVMnjK7x691NyvwgE1rl+FO3fKMZxWIjMilWzJXLuWirT9BybYWE0ZSwRwR6uxRnNusGB05Lp5VlkjANg5NdkP6X5Oog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q0+JziC2DWMLKXUQ2+6AYymAasPio2XVKkf1gkCYdak=;
 b=21VCb9/bD1buOoIWuNk+mK3eCrhhXBt98IRrTSbhlkp+sjINOMniDPJWSA5exLqdZSuv5V3n5yKaduFNupiIYJF3oXV8yJcynIa7q7DcTPk9CRKG9qmvJb1eY7Y+p5EzTve5+i7eQfVkiobIL2eYHmzfLKvyN2OC00XVDnvBD9Iilxs50hRiXd4DxPjZHl25iaF/ROk11KcmxvtmfjVCJOVaSObAy1ZP0iR5/M7EmxMfH2WYM0p4XJWmBJoe6GjBly8sqDtYXv/U2rSsUDL4z+xmNI5b8ps2KDhgjqVWmp6wwZFHM+54Pxs47j4umg6lvRkyE3/7fle6wHkLnwrybw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e398f2f3-3c12-5bbd-5bfb-d3fac7c1b23a@suse.com>
Date: Thu, 13 Jul 2023 15:02:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 12/15] xen: Add SET_CPUFREQ_HWP xen_sysctl_pm_op
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20230706185440.48333-1-jandryuk@gmail.com>
 <20230706185440.48333-13-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230706185440.48333-13-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::17) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AM9PR04MB8700:EE_
X-MS-Office365-Filtering-Correlation-Id: d2ca83f2-7115-4e48-b0ea-08db83a17511
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V2CUDUNAk+YXKdzWqz+IGTB89fiJn9NU9aX6rpcOOdvlMCsJCAM3ajkz4E5V5MPFhxbB6kGCMYVR7j7UX9ncP1q4rjhmtiP+Fvkd3XN7NMGWMzZm2l9dsS0lhxmMXisAU8XpaZ+hC/pAO9EJWKjWqf7pUzYL3pf+Tv0+y1a5p4I8Xz4Gt0myuh0S/GmUclhFQFQ6dgdTFB7XB25z8wKbr3ZyrqcURcSmHLQEjySlvPuo1ghA0j4yP4JX6lHMyHXffF7x9nTy3XC81NfvnZr62/MhkSSHmCQVi2qDkcM0rMdDnQnhGzmU8D72Pj2SW8ZAJorBo5FTZ6+gt4iBA23DT7w+n1d0Tv2sFmXnUN0U5B8w/nXO7MdXVbUKdMF2ZTEAf29EJMJ78sZED08ZykODaO/PuBgygyF7iKJNBQyxnVDiaeBj1mYYOTZEY4cFGuqPuV6cjdhG9IyY5TuZtOBDwY7j8Dws3pm9RyyNuadtixLvHESNcs8bRtIFuDXPP6ex31S+1fM1ZTSEctN4xqIcvp1OGDS+nSs+rumq5qrdwTyz6z8D2WMbHxwkPq3Elt/cc6mba5PzDYF0ApiaNFaoxVJ1cWwuYjXcL8sfIw9b706f4IcjtMFXHvCh2zzVUBaDqhKccjEQYWMTkdHr4mqpJA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(396003)(366004)(39860400002)(136003)(451199021)(31686004)(8936002)(8676002)(5660300002)(41300700001)(83380400001)(316002)(2906002)(6916009)(66556008)(66476007)(38100700002)(66946007)(2616005)(4326008)(186003)(36756003)(53546011)(6486002)(26005)(6506007)(6666004)(31696002)(86362001)(6512007)(478600001)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c08rcVVabnFJRDZxaVkrcjA2YitVNlhkaEJFNkszckRhTUV4QmVhcHlmVm9j?=
 =?utf-8?B?T3d6NEVIYklNTHIxWnk0ZUFVdHY4T0VtdFpKT1hLbjlIdVBHWVZHai9wZkts?=
 =?utf-8?B?emlWMVBoRUxkcWg2OVc2WlZ3Sm9RTmtvVXorVDlXNEtmUEk4bmZzaTVURDc3?=
 =?utf-8?B?THZWUmRZRkFEcFZSZ016V1Bxdjg4MG14ckQ4b3I1SmliU0JxcU0rRzV1Umli?=
 =?utf-8?B?U051TEY0RHZRNjJyeXpkeHBFMmlYeGxtKzc1cE0vRFd3M3FnN0c4YWJWSmdM?=
 =?utf-8?B?dFdmZy9veXIvamhQMFpuaUdiOWNzandLR0pFOUNIQUZPVjJGMUZjMHpzSlRk?=
 =?utf-8?B?VG9jbG01bEdaTEt5clFrZ0hxdWZ3aUdxdFIveW1TSjFyMzQrTkFKTUNyeGRW?=
 =?utf-8?B?MmVqTUZzbk1GUUpTeFgwWEtITFhvbXRNMmZHaURuNTdobnFoQjhneEZkQURN?=
 =?utf-8?B?eUVLUk5zM1NEQ2crVElKYlFEVk5qNjBtUHlzMHVDemVFZHhRVnFybVVYVE9P?=
 =?utf-8?B?TVhSN3BmWnA4WGFzVDlqYWphK2JDbHQxUUlad3M1ZS9hT0dIRHA3QS9sRTRw?=
 =?utf-8?B?VE96Q2lhRm5XZXBRTjE2T08rdDFGaDZxcXpSNUNaTUxYYkgzMXEwWjI3YTkz?=
 =?utf-8?B?a1JDZzI3WjlGbmN0SHRQTnkzYXdBcWJDZmNjT1pIalNXZUErbDdOYm4wSjYz?=
 =?utf-8?B?SUJ1RWZHcncybVFkNjM2eEl6b0h1ZnVlUTErVmJ0TTFxK2hEbEhYQXhWS1BC?=
 =?utf-8?B?UVV1Uk1VMEtHbzFzRUI1WkhOVVZCL0lONTFHNkxCMkZlbTNnbC9RUEVIaGlE?=
 =?utf-8?B?cEJWWlFOZ0FHTFhsbDFNRDJTV3RsUTBPdHZ5VmFicExLekNKRlFSV0FYYThN?=
 =?utf-8?B?MDdFZDhmUDF5ZitiQVA2UVZHRjg4ZXdVL21TK2x4TGdhNS8yM2orR2ZYOFp6?=
 =?utf-8?B?STc4UzhSOEZ4R1BBSU80ZHo0TDRCbjVkVkMwOUFSUVhOUStsR3RFZ0FYSG9N?=
 =?utf-8?B?SkxHeDA4Z0dvaVV6eFVSY3NOQ3JxUzQ4RFFJTmx5akMycWhUVkRGNHZQUjdT?=
 =?utf-8?B?NHp6WEV2Z040UXA3djdNNTl6TjVVU3A2L3l0RkJodjVTS1lrMzdScjFiVmhK?=
 =?utf-8?B?Y2tmMGFvdjNDUlpLamhnUE9KaGFLMG9UUVFkaUxpWklCNG1mY0hvNnVTSHFW?=
 =?utf-8?B?MCs1OVJ1Vzhadk9EQ2c5aFliN3hIKzA3TVdYSGRZaUhqZW5BR3FJcEtRbGg2?=
 =?utf-8?B?VjMvaFY3Z3JQL3VCb08vRE1VSmlIS1JhQW44VkVKZlFaTldEVStUNDZTSENa?=
 =?utf-8?B?b0IvYW96NUw5RHlnaTMrOW1QM2xWMkNEWTQydytDdnFzY3BtaXhzN2tWTVBz?=
 =?utf-8?B?M0ZxWTZqOXQxa3l3dFV2RnBHc0xvMGJ1RkM1ZGVkVmNjbll1R29zV1k3L2Y2?=
 =?utf-8?B?bUQ4ckNhQ0M3dlRzNTlNWFNneVdUelZlaWprc3JsMEdjd0E2U2cxblJIMG1V?=
 =?utf-8?B?MmhldmdBOXZZamZmcTZEczJNS3d0OWtwejJVbGtheENVcCs4UkgyYVdvdHRY?=
 =?utf-8?B?Q3pXMEdhQVFkMEJ2RG9rMjVCaUJCSVc4Z2Nmd3IwM0xVelNxSndPNXNJc25z?=
 =?utf-8?B?Yi82eXZJMnBxaUJ0V29va1N2MGpKcHBua09IS3V3Umtra0ZrNy8vY05NR01m?=
 =?utf-8?B?UnBNL1N6d3FxS29Ja25NQ2lsck9IbzlFVjYwSVh5c2thMGJqWGFaTmhqY1Fv?=
 =?utf-8?B?NjI3bk1kZko0KzVUTVI0UEthZXkvV3Fpa3paR2Q1M2gzMGh4eTJnYjYxbHhm?=
 =?utf-8?B?cytwNTY3ck1GNVc4Q0U5NTlFOUgzVnVDOWl5M0JlY3p2eXdRZWZ2M3g5Z1JK?=
 =?utf-8?B?TmxncmtBYW9yYTZCYmlWMWZFYVBPSzF5MlZ6aUN3dXVRRTRkWXpLdUtZSnA0?=
 =?utf-8?B?RTIrdlgxdzVMZ0xuWk5wZzNQRThETzd2MDBkbGozcjdOS0liVlJCZ3RIazJZ?=
 =?utf-8?B?N1FzQUViRFpsVm9VdTh5dkswSndMSThmTnU5cXFEZnhNSWF1b0ROS0tJOFY4?=
 =?utf-8?B?aFI2TDlPaEVJd0ovWFRxQ3ROeWoxMFF2MVQyd2tpZndyRzVqV1FMNHluSi8v?=
 =?utf-8?Q?OSjGTZ4ujDaiqHsiZftVP/VYn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ca83f2-7115-4e48-b0ea-08db83a17511
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 13:02:48.1142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/iqbNIGCpzTQa/ZjQR1W2AQolVAydKoSFTrEtPtkDxK7jjFn5nFEgepmZ8jrgB1Gknn04sjkXUmNRcEgmbARg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8700

On 06.07.2023 20:54, Jason Andryuk wrote:
> @@ -531,6 +535,103 @@ int get_hwp_para(unsigned int cpu,
>      return 0;
>  }
>  
> +int set_hwp_para(struct cpufreq_policy *policy,
> +                 struct xen_set_cppc_para *set_cppc)
> +{
> +    unsigned int cpu = policy->cpu;
> +    struct hwp_drv_data *data = per_cpu(hwp_drv_data, cpu);
> +    bool cleared_act_window = false;
> +
> +    if ( data == NULL )
> +        return -EINVAL;

I don't think EINVAL is appropriate here. EOPNOTSUPP might be, or ENOENT,
or EIO, or perhaps a few others.

> +    /* Validate all parameters - Disallow reserved bits. */
> +    if ( set_cppc->minimum > 255 ||
> +         set_cppc->maximum > 255 ||
> +         set_cppc->desired > 255 ||
> +         set_cppc->energy_perf > 255 ||
> +         set_cppc->set_params & ~XEN_SYSCTL_CPPC_SET_PARAM_MASK ||
> +         set_cppc->activity_window & ~XEN_SYSCTL_CPPC_ACT_WINDOW_MASK )

Nit: Parentheses again please around the operands of &.

> +        return -EINVAL;
> +
> +    /* Only allow values if params bit is set. */
> +    if ( (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED) &&
> +          set_cppc->desired) ||
> +         (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM) &&
> +          set_cppc->minimum) ||
> +         (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM) &&
> +          set_cppc->maximum) ||
> +         (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ENERGY_PERF) &&
> +          set_cppc->energy_perf) ||
> +         (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ACT_WINDOW) &&
> +          set_cppc->activity_window) )
> +        return -EINVAL;
> +
> +    /* Clear out activity window if lacking HW supported. */
> +    if ( (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ACT_WINDOW) &&
> +         !feature_hwp_activity_window ) {
> +        set_cppc->set_params &= ~XEN_SYSCTL_CPPC_SET_ACT_WINDOW;
> +        cleared_act_window = true;
> +    }
> +
> +    /* Return if there is nothing to do. */
> +    if ( set_cppc->set_params == 0 )
> +        return cleared_act_window ? 0 : -EINVAL;

Is it really necessary to return an error when there's nothing to do?
We have various hypercalls which can degenerate to no-ops under
certain conditions, and which simply return success then.

> --- a/xen/drivers/acpi/pmstat.c
> +++ b/xen/drivers/acpi/pmstat.c
> @@ -400,6 +400,19 @@ static int set_cpufreq_para(struct xen_sysctl_pm_op *op)
>      return ret;
>  }
>  
> +static int set_cpufreq_cppc(struct xen_sysctl_pm_op *op)
> +{
> +    struct cpufreq_policy *policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
> +
> +    if ( !policy || !policy->governor )
> +        return -EINVAL;
> +
> +    if ( !hwp_active() )
> +        return -EINVAL;

In both cases I again wonder in how far EINVAL is really appropriate.

> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -351,6 +351,68 @@ struct xen_cppc_para {
>      uint32_t activity_window;
>  };
>  
> +/*
> + * Set CPPC values.
> + *
> + * Configure the parameters for CPPC.  Set bits in set_params control which
> + * values are applied.  If a bit is not set in set_params, the field must be
> + * zero.
> + *
> + * For HWP specifically, values must be limited to 0-255 or within
> + * XEN_SYSCTL_CPPC_ACT_WINDOW_MASK for activity window.  Set bits outside the
> + * range will be returned as -EINVAL.
> + *
> + * Activity Window may not be supported by the hardware.  In that case, the
> + * returned set_params will clear XEN_SYSCTL_CPPC_SET_ACT_WINDOW to indicate
> + * that it was not applied - though the rest of the values will be applied.
> + *
> + * There are a set of presets along with individual fields.  Presets are
> + * applied first, and then individual fields.  This allows customizing
> + * a preset without having to specify every value.
> + *
> + * The preset options values are as follows:
> + *
> + * preset      | minimum | maxium  | energy_perf
> + * ------------+---------+---------+----------------
> + * powersave   | lowest  | lowest  | powersave (255)
> + * ------------+---------+---------+----------------
> + * balance     | lowest  | highest | balance (128)
> + * ------------+---------+---------+----------------
> + * performance | highest | highest | performance (0)
> + *
> + * desired and activity_window are set to 0, hardware selected.
> + */
> +struct xen_set_cppc_para {
> +#define XEN_SYSCTL_CPPC_SET_MINIMUM              (1U << 0)
> +#define XEN_SYSCTL_CPPC_SET_MAXIMUM              (1U << 1)
> +#define XEN_SYSCTL_CPPC_SET_DESIRED              (1U << 2)
> +#define XEN_SYSCTL_CPPC_SET_ENERGY_PERF          (1U << 3)
> +#define XEN_SYSCTL_CPPC_SET_ACT_WINDOW           (1U << 4)
> +#define XEN_SYSCTL_CPPC_SET_PRESET_MASK          0xf0000000
> +#define XEN_SYSCTL_CPPC_SET_PRESET_NONE          0x00000000
> +#define XEN_SYSCTL_CPPC_SET_PRESET_BALANCE       0x10000000
> +#define XEN_SYSCTL_CPPC_SET_PRESET_POWERSAVE     0x20000000
> +#define XEN_SYSCTL_CPPC_SET_PRESET_PERFORMANCE   0x30000000

As corrections for the respective Misra rule are in the process of
being merged, please add U suffixes here (at the very least on the
_MASK).

Jan

