Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1116FA70E
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 12:26:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531357.826959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvy4M-0001vS-LD; Mon, 08 May 2023 10:26:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531357.826959; Mon, 08 May 2023 10:26:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvy4M-0001s6-IM; Mon, 08 May 2023 10:26:14 +0000
Received: by outflank-mailman (input) for mailman id 531357;
 Mon, 08 May 2023 10:26:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pvy4K-0001s0-K8
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 10:26:12 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20630.outbound.protection.outlook.com
 [2a01:111:f400:7d00::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be847a7d-ed8a-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 12:26:08 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GV1PR04MB9516.eurprd04.prod.outlook.com (2603:10a6:150:29::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.31; Mon, 8 May
 2023 10:26:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 10:26:03 +0000
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
X-Inumbo-ID: be847a7d-ed8a-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WqX4YNv1ss9a71FGly4Tj5FKhsgvh4kZjqvBbp14dNKSiKXYvr1YVNpBShTtJ8JkthHLxk1w+eXqCoIjVHKbszkcmOwDSjEEk+XiBEQto5gyIKd8diZ8Oksis1eLLIgSpvAMoRX0FSBd2LrVPaJquFQAq/7tc+V26kLt8PDr9cNXIyxdTkQVxDsN/VuWdi8H6PbEglw8TeCpWyNVTDc94azuPz3zvs1oOdXiFr3GmF8MO/p+VO7l4s7sudg0r+AvYGEPfaS5dGlYmqRDgwKSIpdPbUPnkKC3e31pIGMKVkzM6GZvjBWnJPjHDkSm1KFWoari7DplIRre2rshROn+eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VEr9T4xbk3VHvgP500GYHqgmh3Go+O1E/iTwnb/XR6M=;
 b=g3xpMVN0r43uX9r8L085gX3aaIayOjeLWQPLH7FB/ZqltyRQbDcta9pK9dVfz306LTMSVkhZbnuFbENB9CGOYXJ8ym2llddc1Pv0u5zB1HUZehnhrA+R6j227/PAV060bGdSGJd3GmO2FpMfR0M82YvKk9WhAMw1mtT7WGX80z4sDr48y4ThRwCo8lTBPR4L3SNMTvewkkKJym8B4m0StmuEc7zPoQmes4DMJTlx/s9GOv0EAWauK5fW9iP6BmZe4V8ylJpQanu3qsWMNS1/p7dEjYFU1V6ueDIR9LSuwFTwydg4ecihNb79ruFBQ2/ikQkmGxi1SSQOG1aQrHn6iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VEr9T4xbk3VHvgP500GYHqgmh3Go+O1E/iTwnb/XR6M=;
 b=MhekFcRTWJrelCU7gvQvWLWM1Tq66BklVJGTRlVhWvK9YqxpxgMBN9RA59FCXLX3ccr5sFgJPJFJCAgneLRAuF+fHsSpXrLmLAUg2exzMeQ12NKjH6pSrY/kafp6dRFBQiO8hGXQ8VRGAk83ZZfgyeecQ6+fmrYX1qlFVBTWL0hwCUVyMq9XRgBUvlvEi88TwQlO8VehehH68rweoDfEDeqhubXSsUiAVb/USbvZslOWaP23//RLU7GzwwenpgYWQDy7MC/KLsHxbGSHOm9QKrUVZsN7oLL0E2GDuRkFx9gDlHF45hWXy8nbxEbRkVbDWHpvCWukEtaitlDhr678GA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7db38688-1233-bc16-03f3-7afdc3394054@suse.com>
Date: Mon, 8 May 2023 12:25:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 07/14 RESEND] cpufreq: Export HWP parameters to
 userspace
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20230501193034.88575-1-jandryuk@gmail.com>
 <20230501193034.88575-8-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230501193034.88575-8-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR05CA0100.eurprd05.prod.outlook.com
 (2603:10a6:207:1::26) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GV1PR04MB9516:EE_
X-MS-Office365-Filtering-Correlation-Id: 05a1de6c-5a8c-4282-642b-08db4fae9ff5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yhzfp7HfkF/iFuuLkRLLJbbXB7YfO2p4rdofOQsVPGMy6sbOU7p1sK+Rw2akUl1up9jHKHETy29DlTrz+PE5BSfPaf9SdtoQkKUycg3NdcnHc409OqkvBEETy21YKnQfYf/ykCNEwWsDgE70WzsRHnDCNTbtstpxpgPQWJ3n1zzUwTMLDLcB8arRw2v7/qBlT/Zddth/+li6VCHO9p7tS2XC7SbIX825uoXN/Dn1hd67Tuaio/aDuFk2BT9vkMR/SylvhItowPUNwIP8oUeeTZk7kDwOVKMLcmSaSSYRB/Tbc3XGiGJWptfJ+GuyxT0U15WC3Z84EbCT5rDBbj1LzDlEu/5w5vv13qeVuxgh9sxKod1quY0l6YlOm23edBhrN09wCup7xQcGeRaRfapiEMjyaMniM7+YUauhNAj4wmNS20y1JMy8SxyQ/JNJca+0KpeKu9YTweSWF8a19DTpBhvECKgYKtrEGA0wprZ1wtaDca+z2zzVzc3+84mebcpxlBTN2rqijBw8L8kaFVMgOYQbgVrP+7Zotzi2639G9jIUH+552NxNIdf7xyrCMYMtSaigIqXzWCgUmR6iWZ1L77bV1EGHSPF4spMfzsHbeZQePtFe3xqwq3NfWFDcigfertCI0fUNWILM/9BUZVCl8w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(396003)(39860400002)(376002)(346002)(451199021)(83380400001)(2906002)(2616005)(186003)(36756003)(38100700002)(86362001)(31696002)(5660300002)(8936002)(8676002)(66556008)(66476007)(66946007)(6916009)(4326008)(6666004)(41300700001)(6486002)(316002)(478600001)(54906003)(31686004)(26005)(6512007)(6506007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHd5VXNXaENDeWp6Y3FkVjJkZ1dXWW5kZThHTURwa2FaMVEwR3crKzRWV0NX?=
 =?utf-8?B?K21sZERFaTNhdFM4WEtneWhSZER6WkdvOUhpZktsdGlaeTZXaHFWNDZlNzF5?=
 =?utf-8?B?NWZhOVFXV2JOQUtlK2wvcGZsTGRSNnR5d3JTOVhISWk3RnlKZVVqU1hlODRN?=
 =?utf-8?B?NExBbDhHME05MFcyYi93WDIzRjBWOXFUalNwOVNSZmFydTBrRm9JcE0zQnNW?=
 =?utf-8?B?YUJUUkxyMGk5NDNRSGNidWdhdERpU1VheW5JL3VnaW9xSmVoNlJZS1BwQ2pC?=
 =?utf-8?B?RmV3eFdsaVlaMVcrTUwxRndwU2kvb3FTNU9IdWpPa1NDQzg2ZDNTTmY4b09K?=
 =?utf-8?B?NlQyenRERFkrN0Q5RU80QXhUOW81N0RiVDlRaDVNVFB0Y2kxTmJvc01sVFBw?=
 =?utf-8?B?K0dBb2g2SGhJa0VVNlU1UkNLYm5zVzlGOTJkNTZEMkR6bENDUmRISlU0a1Jo?=
 =?utf-8?B?blA0OHRXUGowWTNKekVXRnhlV0FnRWJaNk40azVNUEk1cFJ5UHcyMWNkUndN?=
 =?utf-8?B?YjNKdmxyWnVKQnRQRTNiL21FTExHMGFhL1hkSG9uelByY25wbmpGZ1pCbHpQ?=
 =?utf-8?B?MnAvdTExVFVSTk5uTFdweGhYc0dhTFN3UVF3QnZ4TEU0dmVuMUVRdmhoSlNn?=
 =?utf-8?B?Tno2YWV2K3BlQVFGaUNVUEpVK1daSC84c0FPMWJ3MVFWNXpFU0hSeVVYSzFI?=
 =?utf-8?B?bWtIZWxIVitXcE9DTktPUENYN2thZ2JVNGJTdm1QaHl4UmR5dDZPaFc0TzZw?=
 =?utf-8?B?bUZnY3k0OUNpaktrTmd4MjV5dENXM3JaRlNqKzNpUUtEUEFFazZsT04xbnFl?=
 =?utf-8?B?Z0lROVVSWkc0YUVVcGJJRkZpV1hOUHJVSk55SzZmWSs1cnZiVmc2dEpUMnpS?=
 =?utf-8?B?RFJXUkI5V3FINkNlRlpIR0tyOWZQVzVrcHFZSDVJT24yc0FuUjBKbnBsVHlZ?=
 =?utf-8?B?aVhiY2JRa0hKY1M1QWExV3A4Y0tXM1NZYjFma1VzQWRZcFRJdndUUWx6NVRz?=
 =?utf-8?B?WGIrRlpiWmNTTDhUeU1KMmFGY1F1ZEFUV3Z2ODN3QTVPZlJoUmY1ckRMK1dM?=
 =?utf-8?B?a0hqRUJOempjOWFuOUVTc3dQaHp1RlQyME9LalNkS0xaYlVsTzU3dmlneGVG?=
 =?utf-8?B?b1VJZDdzcWV3eUtvcHhsLzdWTm1xVTR2Z1BhWGtGTGY4VUUxRFJaOEtOQ1dN?=
 =?utf-8?B?Q055dXlpVS9BTE1FSHVJMXBuSmRZS1BhejZKcmtQb21aLzJTUEQ3SkhlbTA0?=
 =?utf-8?B?cXRUNktWNHc5WUY1YlJUZEticUJzQlBNNEg1QTZJZm84YzcwMUl6c2tDQjQr?=
 =?utf-8?B?QlFRWVBGRjRlSldlbDQwNUJwelh5MWM4WXAzWUpYMlNZcmhDcStJN0FaRGNw?=
 =?utf-8?B?NG9sMGpGRHRsTUdlUUtiUThPYWRWNnBkZXdqOVM1T1ZVbDErd2Zmd3BuOW5Z?=
 =?utf-8?B?UkxZeThYaGlYdUlwblh3WTdYcm5KL1ZzMVhKVjQwUitHOHkxNzkzSnpyWEtZ?=
 =?utf-8?B?cW1aREhodjExby9rMGNJa2l2SitUak14c0pVcmtiZm9pYUQ0cmtsTkhVbTA3?=
 =?utf-8?B?aEg1Rm5Cb21oVHhFMVduTEczOHA1bjU4VjNnWHlQWTF1RDlVUWkxdEszYTlJ?=
 =?utf-8?B?cEh4dGVIRG1RajhkYWtlUVBQMVF0TDdQWmFRMzlEUUVMclBMajNUZjR2RE5a?=
 =?utf-8?B?eDZKdnVzVlFtTm5pLzhtd1hiMUlBVTB1eFdqOGJrdzZ5dGlKMGRUZkwxdU52?=
 =?utf-8?B?c1o4QWs1Q0cxTkxIMmVubGNzRldPSzRaMWRMaWlEbWxvL29mWUhHd3VzQWNP?=
 =?utf-8?B?RHVnOWZQRFdpNmErNnpyUWh5RS9sb2VZbmgxWTF3WkhBaUwrVUdpQkZUblJq?=
 =?utf-8?B?RXNDdFhFcW5XVStaLzFBQlBPakhBY2kvQTBvbCtGZnUyZDlVd0E1WThuZzMv?=
 =?utf-8?B?ZjAzMksrMkJlUmgxT1N3VlF3MTlNVDVDdkRkUDdzU2FFUTViUTJSL3A4N3Y1?=
 =?utf-8?B?S010dGFVay8yclYzUnhEUFRsSldDQzU4UkJBNzlwYXJNYVNPOFlmRXBNdTly?=
 =?utf-8?B?S1FGNzEza3gydmIrWGVzYWU5M1RWeDB5Q1dpT2U1M1VQUDlHMEUxYVhSbklJ?=
 =?utf-8?Q?BaHi3wCASH7uaVDF0Q0lXOak1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a1de6c-5a8c-4282-642b-08db4fae9ff5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 10:26:03.1200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5kxID9A2ZrzYjgE2jq9Rz0VEIYsyk02/cuKViyHpxSnPdvbTUA6Dj96PP3n/7U5aT778lB0ydR9zBjtm4bV8PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9516

On 01.05.2023 21:30, Jason Andryuk wrote:
> Extend xen_get_cpufreq_para to return hwp parameters.  These match the
> hardware rather closely.
> 
> We need the features bitmask to indicated fields supported by the actual
> hardware.
> 
> The use of uint8_t parameters matches the hardware size.  uint32_t
> entries grows the sysctl_t past the build assertion in setup.c.  The
> uint8_t ranges are supported across multiple generations, so hopefully
> they won't change.

Still it feels a little odd for values to be this narrow. Aiui the
scaling_governor[] and scaling_{max,min}_freq fields aren't (really)
used by HWP. So you could widen the union in struct
xen_get_cpufreq_para (in a binary but not necessarily source compatible
manner), gaining you 6 more uint32_t slots. Possibly the somewhat oddly
placed scaling_cur_freq could be included as well ...

> --- a/xen/arch/x86/acpi/cpufreq/hwp.c
> +++ b/xen/arch/x86/acpi/cpufreq/hwp.c
> @@ -506,6 +506,31 @@ static const struct cpufreq_driver __initconstrel hwp_cpufreq_driver =
>      .update = hwp_cpufreq_update,
>  };
>  
> +int get_hwp_para(const struct cpufreq_policy *policy,

While I don't really mind a policy being passed into here, ...

> +                 struct xen_hwp_para *hwp_para)
> +{
> +    unsigned int cpu = policy->cpu;

... this is its only use afaics, and hence the caller could as well pass
in just a CPU number?

> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -292,6 +292,31 @@ struct xen_ondemand {
>      uint32_t up_threshold;
>  };
>  
> +struct xen_hwp_para {
> +    /*
> +     * bits 6:0   - 7bit mantissa
> +     * bits 9:7   - 3bit base-10 exponent
> +     * btis 15:10 - Unused - must be 0
> +     */
> +#define HWP_ACT_WINDOW_MANTISSA_MASK  0x7f
> +#define HWP_ACT_WINDOW_EXPONENT_MASK  0x7
> +#define HWP_ACT_WINDOW_EXPONENT_SHIFT 7
> +    uint16_t activity_window;
> +    /* energy_perf range 0-255 if 1. Otherwise 0-15 */
> +#define XEN_SYSCTL_HWP_FEAT_ENERGY_PERF (1 << 0)
> +    /* activity_window supported if 1 */
> +#define XEN_SYSCTL_HWP_FEAT_ACT_WINDOW  (1 << 1)
> +    uint8_t features; /* bit flags for features */
> +    uint8_t lowest;
> +    uint8_t most_efficient;
> +    uint8_t guaranteed;
> +    uint8_t highest;
> +    uint8_t minimum;
> +    uint8_t maximum;
> +    uint8_t desired;
> +    uint8_t energy_perf;

These fields could do with some more commentary. To be honest I had
trouble figuring (from the SDM) what exact meaning specific numeric
values have. Readers of this header should at the very least be told
where they can turn to in order to understand what these fields
communicate. (FTAOD this could be section names, but please not
section numbers. The latter are fine to use in a discussion, but
they're changing too frequently to make them useful in code
comments.)

> +};

Also, if you decide to stick to uint8_t, then the trailing padding
field (another uint8_t) wants making explicit. I'm on the edge
whether to ask to also check the field: Right here the struct is
"get only", and peeking ahead you look to be introducing a separate
sub-op for "set". Perhaps if you added /* OUT */ at the top of the
new struct? (But if you don't check the field for being zero, then
you'll want to set it to zero for forward compatibility.)

Jan

