Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBD46FACDF
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 13:28:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531387.826998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvz2V-0001XO-Sn; Mon, 08 May 2023 11:28:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531387.826998; Mon, 08 May 2023 11:28:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvz2V-0001VL-PJ; Mon, 08 May 2023 11:28:23 +0000
Received: by outflank-mailman (input) for mailman id 531387;
 Mon, 08 May 2023 11:28:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pvz2U-0001VF-4m
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 11:28:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2075.outbound.protection.outlook.com [40.107.7.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f950244-ed93-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 13:28:20 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GV1PR04MB9150.eurprd04.prod.outlook.com (2603:10a6:150:25::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 11:27:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 11:27:51 +0000
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
X-Inumbo-ID: 6f950244-ed93-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gFMRv3ym8Pc7NjnPfWcAfPcTdv+0wLCL0JJ5GDZQt4PgaVKv18kMcnlFacH2Ha0IYzd80U2PtXjCVi9Okl86qWPwasev3dKr+B1bi8jEirG2OUmu3M2XjpWEloruoKQqC+kd16gODEZbBixHLjRgPHD0LxBwZHUxUxgTgk7ziQRuk11Hexec8m0W1l2sN9I2UU6dYlJerpQ2vn3i4h2qx+vgVl86C3W0uW3crvJ3Tld7qQfS3q2yJSK/ggHyAdGVh4kuW/qkuw8RasO1mGuDMAyCvElDnaSs+76FlK9Oz6+vIA7kZgzNxLiyaIM4CDCcTlBRZtIYYB15a9+p89awcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hNwRBae2FyJhvSroKSc0n+S74kYsmrTh60e1kp0Gh28=;
 b=g2HVoY4jUHBpeBRRhsqCYL4RQB3i4Z8q/wjH8KoqjSCQi5KQNc5oEfx+wdCbz10xs7fI/uQnvCEr1jonVKQTd5oQJf0dxdpTM4zE53Qb2O7fcWMgV6UBqsjcUbI9YKsYIoBSzZTHPNpmlcwA6JSXqgjdDnnvFNHR9tKkcHqFoXbYYbJJlmX6/bzBumPSeJCKC875E4ZFOQ7pSzR9d/CKIDGsJ0ZaBDPAksCAldF6z5yOssljg6OhU3WBs7ZbUjlJDJax/EMiweRCD4CJXSzFzAQnLS8OrVX39bq9YdTOyOf28jkuO1UU6p5DKcgkQ3izT5o8VX+oKi92RCxGeUnIEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNwRBae2FyJhvSroKSc0n+S74kYsmrTh60e1kp0Gh28=;
 b=W8eAfH3bsbmQt8TQ9V6OpjSlYGjNLljX59/YCzPGhCWJwP4BXecqMN1UoVGKU+dGutHOa6X3LTJOylKxQjo1XD0CjVW1klWC5gEQQycd1+PCF9l/AJ5b/UAI1Dm7gyNjflf0r2kKjxGc9f2rpaiRVvZm40WKy1IMxyy/l3rw9PaAWKM8KCFfR+/XKuY9rm6lDqP0SeM3MWOX0d7n7qU2XHq8LunuTjGE8xSQu4YcllWTUy+5HrKbvWUMh6hsk8vY7Xn9nXhHD8QXgb7i/gTzxQpx6GWl5c+4dulxM586+KxHf+DHLywku6JU/jQBpDqsMw7HV35APdlnCXXS6Ldobg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1166bdf1-4d54-30bb-bdf9-65dfaeb6b29e@suse.com>
Date: Mon, 8 May 2023 13:27:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 10/14 RESEND] xen: Add SET_CPUFREQ_HWP xen_sysctl_pm_op
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20230501193034.88575-1-jandryuk@gmail.com>
 <20230501193034.88575-11-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230501193034.88575-11-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0116.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::33) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GV1PR04MB9150:EE_
X-MS-Office365-Filtering-Correlation-Id: d35bf528-654c-4010-551e-08db4fb7423f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pqtKeKQUCsgLA1AyQW+7VySHBmSpMaKgbsyjqfohuN5LqyvzSiSDygmWGP1dDDyciXWXeXA4fWam4XK8UhFdx1sg6H/XyfqBmq3zJAOL4MpHx+xZy1Kn/702zoDKpv6CVYzbTXPrk3q6Ut4z4DMa7PtdJQF6koG/hbPGyU2dC0teu6JoKHTf6UU9Un1SqFLHpdTyeHJAQtLqPBSElUl/e634p/yntXYIc64GpzJxc54bT2BTByeYf9dAHsJZOL2amp44AZHz1gGZu9zIQX14usIabjeyipkcIwrtG2rSaDJMfNyPILwUtVJ6kjDKPSIWX7JFDFtUko5fYCTRaXr6HykCxNiwXM91abJO/sDc/hF/GMfoQ1I90OgW+bvfk8bLuOuF6I/fP+6FaTSejnzUcgW/dY75gDt05JPNMZZ0ZJXGDSKtaN44+eZvp7SRa5YhDh4sDmA4xG0bOtCjp9Jph6/UBfdSMDn9x6Bapq2ZMdBJUtdIcaHOelz49fW9+XmaRk2DyOmuHAvcXD1EGqs++iK9MIMXIKmcDoeB2K0W/NW0x+7N5dmU+LnWu08qV8WQLgV3WDrwHfVU7P92JOFE6G4iVoqRr5oZxgdmE/nTQ2qJSllLbdK0WVNVunylAQVNeIHTdvFePgerBj7u6vzb4w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(396003)(376002)(346002)(136003)(451199021)(6512007)(53546011)(26005)(6506007)(6486002)(83380400001)(36756003)(2616005)(38100700002)(86362001)(31696002)(186003)(41300700001)(2906002)(54906003)(31686004)(5660300002)(6916009)(4326008)(66476007)(66556008)(316002)(8936002)(8676002)(478600001)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHNuQzFoYWFqZVplNk96a05reWI3NHhuZk9JRU83em53cklWUjFRbk9tb1Ax?=
 =?utf-8?B?UzdTRkJsSTJxeVZKT1VaOXNGemZoWVpvb2pxVUxrTlNYREZoZHBUbEErbWVs?=
 =?utf-8?B?alJkSU1heXZrTXExdEZuWGg2czhIRm45Y3VoaDl3Rys2WlNraEpDeEpSQ0x0?=
 =?utf-8?B?Kys3MlFlRWNlSnFnS1llcHo0ei9Za1g1cnlocmU4bkZvMHVSY1NEOTdkV2tB?=
 =?utf-8?B?U1NLZHB1cWlvbDJoenVJelRBdkJUVEIvUnFWbklnVC90QWlQZHltbnJ2Mmll?=
 =?utf-8?B?d3NqUVlWODlKWGVudzJ0V1B6dW9KUWgzMW1QWDA0QlJrenh5ZlVDSzdLcGNB?=
 =?utf-8?B?akM0R3pxRUpoelRicDBENnM5eDVjaE5Ga3QvRTU5M0lPOStUb21FTmRITng5?=
 =?utf-8?B?TEhiMC9DMlNueXlHQmNvMzBtRG9vRjVqTjgwKzJmVjZXQU5oL2kwQmU5Mi9o?=
 =?utf-8?B?OTNSekNrdTY0T1RJL3dPTHhyeUUxWmd4N3ZKZTd3R3Y1OWRzUTloajkxaGxs?=
 =?utf-8?B?SU5uZ3QvYTg4NnVNMmJBdmVGYlNXRDRiRU5zN21HZDVWeS82SnNsNFFldUN3?=
 =?utf-8?B?ZFMyWm4xbC84MVNLcDllVUhuOUVaT1U4a1cxVDF3eWxzVzRlNDNERlpiS3hs?=
 =?utf-8?B?TmRnTmN4QUJ6ZldQZnB0UnFWb2dLWjF5SEIwNDFmcHhJZHhHcHdrUHZsMlVq?=
 =?utf-8?B?eW9Sd2h6dnR1L0ZydmhnN2NWS2JLT2M4cVF3djFtVXJJUVVVRGZoSVpnTFc4?=
 =?utf-8?B?aGUrSkN6ZUNvbkZpa1lSSU52V2tSbk9uSnFPRk5hZkVLM2k0dlJJb2I5Q2NV?=
 =?utf-8?B?aDhBMlZRdWR1OGhXNHpuRGZaOFVGSUxKV3FNVllsUXlyN2lXeEJkbmxFaDVk?=
 =?utf-8?B?WUhZZGRWZTJlNVdLZ05Ta0ExSWtRbHhrRmJENVJMNEhyTUtPTjg2aXBlTXdu?=
 =?utf-8?B?UFo2ekRCVVNLTXNxODcwWE4zNkhzQm5zVysyeFUyeU1lWlZzQjl6MWxIcm1G?=
 =?utf-8?B?Q0tQcWJQK0VHUEpaaWU2OU9lVkdSYUhMcEkzQVE1dGFDYnRreE1hUzF2Z3By?=
 =?utf-8?B?M2ViWngvUElTZmYxdExJc1MwOU9ldm5PS1VtQXV5YVI3MjBJSEIvS1FjVXVI?=
 =?utf-8?B?ZllKQS8xd3BYNkxLQlM4bC9CRFhpKzdjY25DMGMvRU9PMXpPL3pWQmcremJi?=
 =?utf-8?B?OWV5TktMQk5tdzVuSFBxT0xQTDA0ZXF2Tm1oaVNrSWdyZmlsa0FvejJNdWlx?=
 =?utf-8?B?MnVDNytSak5ZUFZGSEZmMUpSYlMwTWk2ekV1RVBhVVBXemtKaGlZdG41Q2pY?=
 =?utf-8?B?YVlIZDkrUW5JN2NibFNvazBzVTRSZ0xsQy9VTGRqV1NWeVIxS3NzYmUvMHZj?=
 =?utf-8?B?SU1BeHUvWUFHNzFCRUpMZjZ3VmhtSXZ3NGlmenVwZXZHMXZHSmthWDJvTEJH?=
 =?utf-8?B?NXhjNEdjRGFnYTdMd1RaMHVuZkY5MGFzek5IVDFhcTdvWGFsTlhVNnkyc25x?=
 =?utf-8?B?UmxwbVdYU3Q1RWxkbHF6aEhKZTBmcUprRVVCQzFrNk53bWFVbzAxdC83N1c0?=
 =?utf-8?B?aDBLbXI3TDc4RitYb0E4aFFTME1rNXJpZlJ4REIyQnUyNzc5eXZUUUl1Y2FO?=
 =?utf-8?B?SDBFVDQyRU9EbjB2SWViejBvQWpqRlFzZDg4dmF4RGNrZWNoVUdSNXZvSDM3?=
 =?utf-8?B?aE9iZHNnQlJqUmk0cnNZOFN3QlZNamlEVmVBUzR1R2N4aCs0aWltKzUyRXRk?=
 =?utf-8?B?djMvVklxb3lBUE5TWDhmL21uTjJRM05yTVNKQ25OS0FjMlFVTWVQQVBIbnNn?=
 =?utf-8?B?QWJYQWpiZ1hoQjVzVFJvU0pPMXZxWlVHb2FVQ0dtWjdjbTZCalJCRU1aeExD?=
 =?utf-8?B?R05BREg0STA1dW5idm5VRnMrS3hLSXA2Z29iVW96ZGpUUVFCSkl3WkdEWVNQ?=
 =?utf-8?B?SUVXR3FGaHVKY2tmQk1QMVh5eG5aVnQzZzdmcEhrelY1ZzRKbFVpS2JJSWNF?=
 =?utf-8?B?aWlhY1NJbTlZZGNtWi9YMTZhOHVQcmIyQzVXQmJSSDJ5dE1PMWdnREpWWEZ1?=
 =?utf-8?B?V3ZiNFdQQmdIYzFBRXVjSU8yYkJIeEJoK1JDT095bVovcTN6bkd4RkRIYkQw?=
 =?utf-8?Q?Ai3f4sTJQPRCPQQYjeWK3TxcC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d35bf528-654c-4010-551e-08db4fb7423f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 11:27:51.3751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WXA2Y6g1vU9EaC19HnlF/hafsPB1Yq4wFzZtViPvydwTGAo7yayMxVN89bQRiYQjH2LnYBL7xR7Pu/T9gXMYWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9150

On 01.05.2023 21:30, Jason Andryuk wrote:
> @@ -531,6 +533,100 @@ int get_hwp_para(const struct cpufreq_policy *policy,
>      return 0;
>  }
>  
> +int set_hwp_para(struct cpufreq_policy *policy,
> +                 struct xen_set_hwp_para *set_hwp)

const?

> +{
> +    unsigned int cpu = policy->cpu;
> +    struct hwp_drv_data *data = per_cpu(hwp_drv_data, cpu);
> +
> +    if ( data == NULL )
> +        return -EINVAL;
> +
> +    /* Validate all parameters first */
> +    if ( set_hwp->set_params & ~XEN_SYSCTL_HWP_SET_PARAM_MASK )
> +        return -EINVAL;
> +
> +    if ( set_hwp->activity_window & ~XEN_SYSCTL_HWP_ACT_WINDOW_MASK )
> +        return -EINVAL;

Below you limit checks to when the respective control bit is set. I
think you want the same here.

> +    if ( !feature_hwp_energy_perf &&
> +         (set_hwp->set_params & XEN_SYSCTL_HWP_SET_ENERGY_PERF) &&
> +         set_hwp->energy_perf > IA32_ENERGY_BIAS_MAX_POWERSAVE )
> +        return -EINVAL;
> +
> +    if ( (set_hwp->set_params & XEN_SYSCTL_HWP_SET_DESIRED) &&
> +         set_hwp->desired != 0 &&
> +         (set_hwp->desired < data->hw.lowest ||
> +          set_hwp->desired > data->hw.highest) )
> +        return -EINVAL;
> +
> +    /*
> +     * minimum & maximum are not validated as hardware doesn't seem to care
> +     * and the SDM says CPUs will clip internally.
> +     */
> +
> +    /* Apply presets */
> +    switch ( set_hwp->set_params & XEN_SYSCTL_HWP_SET_PRESET_MASK )
> +    {
> +    case XEN_SYSCTL_HWP_SET_PRESET_POWERSAVE:
> +        data->minimum = data->hw.lowest;
> +        data->maximum = data->hw.lowest;
> +        data->activity_window = 0;
> +        if ( feature_hwp_energy_perf )
> +            data->energy_perf = HWP_ENERGY_PERF_MAX_POWERSAVE;
> +        else
> +            data->energy_perf = IA32_ENERGY_BIAS_MAX_POWERSAVE;
> +        data->desired = 0;
> +        break;
> +
> +    case XEN_SYSCTL_HWP_SET_PRESET_PERFORMANCE:
> +        data->minimum = data->hw.highest;
> +        data->maximum = data->hw.highest;
> +        data->activity_window = 0;
> +        data->energy_perf = HWP_ENERGY_PERF_MAX_PERFORMANCE;
> +        data->desired = 0;
> +        break;
> +
> +    case XEN_SYSCTL_HWP_SET_PRESET_BALANCE:
> +        data->minimum = data->hw.lowest;
> +        data->maximum = data->hw.highest;
> +        data->activity_window = 0;
> +        if ( feature_hwp_energy_perf )
> +            data->energy_perf = HWP_ENERGY_PERF_BALANCE;
> +        else
> +            data->energy_perf = IA32_ENERGY_BIAS_BALANCE;
> +        data->desired = 0;
> +        break;
> +
> +    case XEN_SYSCTL_HWP_SET_PRESET_NONE:
> +        break;
> +
> +    default:
> +        return -EINVAL;
> +    }

So presets set all the values for which the individual item control bits
are clear. That's not exactly what I would have expected, and it took me
reading the code several times until I realized that you write life per-
CPU data fields here, not fields of some intermediate variable. I think
this could do with saying explicitly in the public header (if indeed the
intended model).

> +    /* Further customize presets if needed */
> +    if ( set_hwp->set_params & XEN_SYSCTL_HWP_SET_MINIMUM )
> +        data->minimum = set_hwp->minimum;
> +
> +    if ( set_hwp->set_params & XEN_SYSCTL_HWP_SET_MAXIMUM )
> +        data->maximum = set_hwp->maximum;
> +
> +    if ( set_hwp->set_params & XEN_SYSCTL_HWP_SET_ENERGY_PERF )
> +        data->energy_perf = set_hwp->energy_perf;
> +
> +    if ( set_hwp->set_params & XEN_SYSCTL_HWP_SET_DESIRED )
> +        data->desired = set_hwp->desired;
> +
> +    if ( set_hwp->set_params & XEN_SYSCTL_HWP_SET_ACT_WINDOW )
> +        data->activity_window = set_hwp->activity_window &
> +                                XEN_SYSCTL_HWP_ACT_WINDOW_MASK;
> +
> +    hwp_cpufreq_target(policy, 0, 0);
> +
> +    return 0;

I don't think you should assume here that hwp_cpufreq_target() will
only ever return 0. Plus by returning its return value here you
allow the compiler to tail-call optimize this code.

> --- a/xen/drivers/acpi/pmstat.c
> +++ b/xen/drivers/acpi/pmstat.c
> @@ -398,6 +398,20 @@ static int set_cpufreq_para(struct xen_sysctl_pm_op *op)
>      return ret;
>  }
>  
> +static int set_cpufreq_hwp(struct xen_sysctl_pm_op *op)

const?

> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -317,6 +317,34 @@ struct xen_hwp_para {
>      uint8_t energy_perf;
>  };
>  
> +/* set multiple values simultaneously when set_args bit is set */

What "set_args bit" does this comment refer to?

> +struct xen_set_hwp_para {
> +#define XEN_SYSCTL_HWP_SET_DESIRED              (1U << 0)
> +#define XEN_SYSCTL_HWP_SET_ENERGY_PERF          (1U << 1)
> +#define XEN_SYSCTL_HWP_SET_ACT_WINDOW           (1U << 2)
> +#define XEN_SYSCTL_HWP_SET_MINIMUM              (1U << 3)
> +#define XEN_SYSCTL_HWP_SET_MAXIMUM              (1U << 4)
> +#define XEN_SYSCTL_HWP_SET_PRESET_MASK          0xf000
> +#define XEN_SYSCTL_HWP_SET_PRESET_NONE          0x0000
> +#define XEN_SYSCTL_HWP_SET_PRESET_BALANCE       0x1000
> +#define XEN_SYSCTL_HWP_SET_PRESET_POWERSAVE     0x2000
> +#define XEN_SYSCTL_HWP_SET_PRESET_PERFORMANCE   0x3000
> +#define XEN_SYSCTL_HWP_SET_PARAM_MASK ( \
> +                                  XEN_SYSCTL_HWP_SET_PRESET_MASK | \
> +                                  XEN_SYSCTL_HWP_SET_DESIRED     | \
> +                                  XEN_SYSCTL_HWP_SET_ENERGY_PERF | \
> +                                  XEN_SYSCTL_HWP_SET_ACT_WINDOW  | \
> +                                  XEN_SYSCTL_HWP_SET_MINIMUM     | \
> +                                  XEN_SYSCTL_HWP_SET_MAXIMUM     )
> +    uint16_t set_params; /* bitflags for valid values */
> +#define XEN_SYSCTL_HWP_ACT_WINDOW_MASK          0x03ff
> +    uint16_t activity_window; /* See comment in struct xen_hwp_para */
> +    uint8_t minimum;
> +    uint8_t maximum;
> +    uint8_t desired;
> +    uint8_t energy_perf; /* 0-255 or 0-15 depending on HW support */

Instead of (or in addition to) the "HW support" reference, could this
gain a reference to the "get para" bit determining which range to use?

Jan

