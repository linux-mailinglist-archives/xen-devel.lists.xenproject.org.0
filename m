Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCC575FBA3
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 18:16:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569133.889410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNyDC-0003SF-4N; Mon, 24 Jul 2023 16:15:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569133.889410; Mon, 24 Jul 2023 16:15:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNyDC-0003Pi-0q; Mon, 24 Jul 2023 16:15:06 +0000
Received: by outflank-mailman (input) for mailman id 569133;
 Mon, 24 Jul 2023 16:15:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vJ35=DK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qNyDA-0003Pc-DY
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 16:15:04 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7d00::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e6c9386-2a3d-11ee-b23b-6b7b168915f2;
 Mon, 24 Jul 2023 18:15:02 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8467.eurprd04.prod.outlook.com (2603:10a6:20b:34a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 16:15:00 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 16:15:00 +0000
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
X-Inumbo-ID: 3e6c9386-2a3d-11ee-b23b-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nj0+PU7JiMpJCIvH1GDmjXz7x8aZOaO0Mhx+Y9S2FGCe/zS6i3B+JkUWmGhxUzoGvBHOdgffkeVfEx0lcW/BppCmsJXMTm63vWm/7WfpfsXKqQzxtf92hRcnMpLXzG4+6lr55zoF1QeZ1RS71DBSK8sOBKnt6dyThgZQdZQ7ZWymiKgT8AKi6KG36d38PzyVox5lqZfnQL4KBXdUBn8q/k3sdwwZac6wIER9M6356kOaIB9QNL8A1hcEiepajCAzEdB4gnPW5DXsT+H+epISJR0AaG84u1Gmh5Z1szDtnVkfpoRQXzDeel0FpdaWCum1k7sYUXNK9IGm/eQwIfyZ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LaaEnlkpUVwgi3NGcFwJPwKkPKyvm+Dghfw08tkBYYk=;
 b=Sk6SiYmi6UC7Hud9561N9de+engVoG0FVOe2aW5ArRox2pc/nnc0bjTOaR/7gPDleRheIiAOWujP7TJQArgXNp4cBW/QsQ5P8bkpA9fHQs6dyLe/1x+aHUEoJhMvhiJb5Ii9g8keNCpDaO0QH7S0kefpt5/vDLACMdJ/InpDBd+kXfolEmBs76y581N+3OCiCjHrkYW7xxsI91otJAy/Yg9s3WsI5ZtJs9Im5+sGhiaY4dfFa4xBP+Ex0oh38SlPKHbE07txiVk2tJoYmjAD0crg6cEq1i5x71f8ScYEiovebS5v+aKrDTf6mGSLeCmaI9qPFd/v0UT1DnFm7qwFBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LaaEnlkpUVwgi3NGcFwJPwKkPKyvm+Dghfw08tkBYYk=;
 b=ZbUFbVGVvhnBOTm5HCoseGgA7qWCVQ6uUZsoIc0jV+wtUZxHdbgV3DJ3sa0YT+XPf0RiyeQ/3R85YsXkdp9c8CPczZHk599q8KpVLu0/Y5tQjau2K5dvu5RGuT+JUQhrVFVtD8xTCkIpHEaFvzqfZnOftJ94rou45IVnt79FCTK1sIJlsVqlt6RZ37rLaoZYQaTvHTXfxkiJPh92BdL9GYYTP1W+xg9dqva+i5K/oIu0W29y5Hq9vzWZeU22jvUY1lKqxGAQ7nn7rPWX3XhuGMLkY/VfNknRin/J21fGyxv11OJzCVbMqF59qd7RBvKZYMAIlDuPbD2MUDFrLuJSxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7636d3d2-c78d-711a-ed90-aedd1b464c6c@suse.com>
Date: Mon, 24 Jul 2023 18:14:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 06/15] cpufreq: Add Hardware P-State (HWP) driver
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230724125857.11133-1-jandryuk@gmail.com>
 <20230724125857.11133-7-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230724125857.11133-7-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8467:EE_
X-MS-Office365-Filtering-Correlation-Id: 85fd98d2-32ee-40ce-323b-08db8c612160
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A1qRiFtGJpQ/fQuqcwKOZdERWCIBZX1iBiY/jNxV0HQriC8zXVS22XDCfcElDFtXZlgAhBwlrg9eX5mSg60Y783TB7BSKU+l3yjHfopcQC5N6fLCGo0UCWYnQzZj21HnGdX7ZoVGJMqxMkMIUdughsjXNYChGhy9NzE6wPbSck1MpdEcabN94wVUGOR+bTINnakOob6Z1OBZ+KbH+LsDEY3Fko0OZcqUDKUVYbgYzmgs7TDwV6UQH3YbJFGbHJL2c+Yn4OPIkPEeBvRSBvUcWYjZLl20YenmGO2czfN311JsNVQpC2vl0pZ3o40wPItI9USTc2oaYodJ7BTo1nOZYWZb2KqwhsBLA4zjv9qqDNkZgB6TaY2DFKHAiVBeOE8sD/MHFrb0jaYEhkY3oKdP31nI9YvVnLtozH9/E5KdrawzphAJNFEnjypc2cnIopn2K4gEb+ws1MZd3gyyz03/aZET0yKFstlhDhuKa8d8XkGe1EQsTM9Kzj5jNvJw/HihjRaXWlHdJDan6tSTSzy0tLNpBbeJuyFgI27aoob6NP6buM0LLl23S5YzxCuo3KDMXUZPPLraAZnGFd1vFeys2mi5BzRLonURRiuR2NLKUTEJ18x3S+Olvy/5nBZwmBsGiZNy9As7HLBaOhFx9JaCsg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(376002)(39860400002)(136003)(366004)(451199021)(38100700002)(6916009)(36756003)(53546011)(2616005)(83380400001)(8676002)(8936002)(5660300002)(478600001)(54906003)(316002)(66556008)(66476007)(4326008)(66946007)(41300700001)(6486002)(26005)(186003)(6506007)(6512007)(2906002)(31686004)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEpKOU51SThLa0k0N1JiRktwV3Vaa3NQTkYzRTEzMVV4Y2xlcTRDMGZQRGw2?=
 =?utf-8?B?aTlWMy9uZFNuL1pvdXJmUGZtYVRHRDFBUlhiYmxmZlpROEJ6T2lDQnd1czNL?=
 =?utf-8?B?R0IrYVJROW1rSzBGMnB1bTRoWll2eDRtaU5jOGxlT0RtbmFiUm9ZWERicm9H?=
 =?utf-8?B?dW9RV00zUmVYblA3ekRjUHBaZEt5TGdzYWliT01Gb080M1Nkb3ErWjhCNjU3?=
 =?utf-8?B?RmdnYTRPZ1NtWUNkT0tvU1NXY1hveVhMR2gvaEFFUVl1WnMvWjFBY1RMVWFm?=
 =?utf-8?B?VC8xZk84UU0wTkgxdkRSM2EwWUlvWDBBNXNBdXE3U0xVTWV6MWRQK0lqenor?=
 =?utf-8?B?T0YyRDdtUmt1VWJWaTNXVmt3RWlHTmozbkY1QlYzdDlKZnpWZ2lYTDZoZGVn?=
 =?utf-8?B?Tjl6Z1hQTThlQjF6YThiU0VoNkxucHBXQVVSTU55U3pMdU1hblFKTXI1Sk5U?=
 =?utf-8?B?OHpQMnEwUHl0d2FSODgvMlNRS2pFRXBtZG1FSEY0dzJjZmZpall6cngvdE1R?=
 =?utf-8?B?VEpDbUdjRzRSUVk4d0cwMXMvSVB6RnJDUktEZGpnbXQ4UytMdWF2WXFvbXdC?=
 =?utf-8?B?Y0dsWjRQUmdZdkpIYzVZYi9GTmp3Ymg0ZGtZbWJEeVQ1RXlOOXY2K0pRUDEz?=
 =?utf-8?B?THljanE2QVk0OTNtcyt5VHJuVzYwMy9obGhjcDVFaE9HUmdEL2h0N3djSUR1?=
 =?utf-8?B?T3hDbjg5NmZrWVlnTnpQUTZqN3BQaldQNURnRDNnK1V5MjVWZ293RXJyN2FJ?=
 =?utf-8?B?dVNYN1dSRWNzK2RuVjhibk9EMjRpWWRnYjU2Yklpa0NxQS9FZ1YwNlJHRDMv?=
 =?utf-8?B?NGxtb2lIVENIaytNajVTMGRad0lIUnlGSGtLdHJvUGllMHZoNllZMUEvTWE2?=
 =?utf-8?B?VkVWb09ZMXdFQTlvSCt5UzcwN2FiN001U2JNdzM5bU9YWWhLbkJTSmdxcFpM?=
 =?utf-8?B?YUsvMkR2MDdDVno2T2RUSlhYVDhKK2p2ajh3Z0YwQ0F3TEpHOEY2NkkrNmJ0?=
 =?utf-8?B?eGxWMllUdVRTSHdSWitSMlZRVWxQekxZeW91YVhaWk41bVJQT2d6NjRrcUFZ?=
 =?utf-8?B?Y1NwNENXeTloelJXZy9veGhkWXZha0JQRnU3WVNWSnhCUzNLa05EUUxIaStn?=
 =?utf-8?B?T0tHNVQ5UElySTBhclo3SEhoaE9GZ3FZdzlZR1ZBWHBaL0Q0SGt5MmNwVy9L?=
 =?utf-8?B?U1B5SW8yMlRCVU9zRDY4ZU9MSld5SGZNbWFyblBNbDhvZ3p4cmpwb2w5K2Uv?=
 =?utf-8?B?anpEdlJFZ1F6VDZiZVdsR3VUbXZuQlpFR3lydDhmQU9kYkw3d2Z3Z3pUQnBD?=
 =?utf-8?B?bGl2VEV3SEJVZjRmVnBmS1hQN2gxVFdUdVRPSkY5NDluSGJkeEN0ZU9kWUlm?=
 =?utf-8?B?SzJQTHdKOGsrMU9zUTRXYlA2SU9GQ0pFYU0zczRjUGtmOTlLMXZwYm9RbGgx?=
 =?utf-8?B?MmlLVzFjamhQZnFaSjd3dTFmNWJrMmgrN3ZjQ3p1elJ0TG45Um9ObmtBMXNR?=
 =?utf-8?B?MWMvekM2WHRCNnp3dGNtZnRMZzV5UzA0R213NW9YaTQrWFN4ZThOQkN4c0NH?=
 =?utf-8?B?cGdReFVKaWZlRHJLb1gxSldiWlBPUytsSko4VlhyRk1Td2FuK1lKeEplR0kx?=
 =?utf-8?B?MEUrbnRHTE9QVDVqNUhVeU92dG10R0toalYvOGxlZ0xmSisrc2NpdmZwbTkw?=
 =?utf-8?B?RE9QanVtaWQzTG83ekMzaG12bFFoVmJUSUJIME9TMjc0S2J6aDZjZnZzNVJ5?=
 =?utf-8?B?ZUNTUXZFNnEwdDlJUEpDWFovSy9CbC9WY08vbVI2eFNKZVVHdVdWUlU2NC91?=
 =?utf-8?B?TE1NOHZxdmljWEZSdGwxNmo4Wlh5V1lFdi9ncWJxUEJtQlVrVmZvdWhjQngr?=
 =?utf-8?B?NFhkRHFIdS9LR3Y1eXJTSGlTRWVCWWJrOUk1bUpreGxZQ3loTFNwZ3BZbVdt?=
 =?utf-8?B?bk1jbUU3OWRPK2xKWERsU0Y2VWQ4ME9sYUs0SXBQV1ZXRzZVaWlLVnRRUXQ5?=
 =?utf-8?B?RnlhTFFjQVlMOHNaVjVNNnN2S2ZFY0JUZnVLNTNYaUxhRTI2eTJZcm45dTU3?=
 =?utf-8?B?c1RBKzMxWGxmUkU1YklOY2Y4UmxVaERxREU1aWFFMlRQcXFSUXRKdVpQTlpn?=
 =?utf-8?Q?WDLIF7RtvoheZXTBDK1yIetR6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85fd98d2-32ee-40ce-323b-08db8c612160
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 16:15:00.4148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +TikQOtsBJkDCBEANNvBpjye4abxm+OalP5WNgOCF3XrOKSQcg3NjF9pj6PYLmErKCoygYlysvRulaAw6tiMXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8467

On 24.07.2023 14:58, Jason Andryuk wrote:
> --- /dev/null
> +++ b/xen/arch/x86/acpi/cpufreq/hwp.c
> @@ -0,0 +1,521 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * hwp.c cpufreq driver to run Intel Hardware P-States (HWP)
> + *
> + * Copyright (C) 2021 Jason Andryuk <jandryuk@gmail.com>
> + */
> +
> +#include <xen/cpumask.h>
> +#include <xen/init.h>
> +#include <xen/param.h>
> +#include <xen/xmalloc.h>
> +#include <asm/msr.h>
> +#include <acpi/cpufreq/cpufreq.h>
> +
> +static bool __ro_after_init feature_hwp_notification;
> +static bool __ro_after_init feature_hwp_activity_window;
> +
> +static bool __ro_after_init feature_hdc;
> +
> +static bool __ro_after_init opt_cpufreq_hdc = true;
> +
> +union hwp_request
> +{
> +    struct
> +    {
> +        unsigned int min_perf:8;
> +        unsigned int max_perf:8;
> +        unsigned int desired:8;
> +        unsigned int energy_perf:8;
> +        unsigned int activity_window:10;
> +        bool package_control:1;
> +        unsigned int :16;
> +        bool activity_window_valid:1;
> +        bool energy_perf_valid:1;
> +        bool desired_valid:1;
> +        bool max_perf_valid:1;
> +        bool min_perf_valid:1;
> +    };
> +    uint64_t raw;
> +};
> +
> +struct hwp_drv_data
> +{
> +    union
> +    {
> +        uint64_t hwp_caps;
> +        struct
> +        {
> +            unsigned int highest:8;
> +            unsigned int guaranteed:8;
> +            unsigned int most_efficient:8;
> +            unsigned int lowest:8;
> +            unsigned int :32;
> +        } hw;
> +    };
> +    union hwp_request curr_req;
> +    int ret;
> +    uint16_t activity_window;
> +    uint8_t minimum;
> +    uint8_t maximum;
> +    uint8_t desired;
> +    uint8_t energy_perf;
> +};
> +static DEFINE_PER_CPU_READ_MOSTLY(struct hwp_drv_data *, hwp_drv_data);
> +
> +#define hwp_err(cpu, fmt, ...) \
> +    printk(XENLOG_ERR "HWP: CPU%u error: " fmt, cpu, ##__VA_ARGS__)
> +#define hwp_info(fmt, ...)    printk(XENLOG_INFO "HWP: " fmt, ##__VA_ARGS__)

I'm not convinced ", ##__VA_ARGS__" is a good construct to use. I notice
we have a few instances (mainly in code inherited from elsewhere), but I
think it ought to either be plain C99 style (without the ##) or purely
the gcc extension form (not using __VA_ARGS__).

> +#define hwp_verbose(fmt, ...)                             \
> +({                                                        \
> +    if ( cpufreq_verbose )                                \
> +        printk(XENLOG_DEBUG "HWP: " fmt, ##__VA_ARGS__);  \

(One more here then.)

> +static bool hwp_handle_option(const char *s, const char *end)

__init?

> +static void hwp_get_cpu_speeds(struct cpufreq_policy *policy)
> +{
> +    uint32_t base_khz, max_khz, bus_khz, edx;
> +
> +    cpuid(0x16, &base_khz, &max_khz, &bus_khz, &edx);
> +
> +    policy->cpuinfo.perf_freq = base_khz * 1000;
> +    policy->cpuinfo.min_freq = base_khz * 1000;
> +    policy->cpuinfo.max_freq = max_khz * 1000;
> +    policy->min = base_khz * 1000;
> +    policy->max = max_khz * 1000;

Earlier on I asked what about cases where the CPUID output yields
some zero values (as I know can happen). Iirc you said this doesn't
affect functionality, but wouldn't it make sense to have a comment
to this effect here (proving the cases were thought through).

> +static void cf_check hwp_init_msrs(void *info)
> +{
> +    struct cpufreq_policy *policy = info;
> +    struct hwp_drv_data *data = this_cpu(hwp_drv_data);
> +    uint64_t val;
> +
> +    /*
> +     * Package level MSR, but we don't have a good idea of packages here, so
> +     * just do it everytime.
> +     */
> +    if ( rdmsr_safe(MSR_PM_ENABLE, val) )
> +    {
> +        hwp_err(policy->cpu, "rdmsr_safe(MSR_PM_ENABLE)\n");
> +        data->curr_req.raw = -1;
> +        return;
> +    }
> +
> +    /* Ensure we don't generate interrupts */
> +    if ( feature_hwp_notification )
> +        wrmsr_safe(MSR_HWP_INTERRUPT, 0);
> +
> +    if ( !(val & PM_ENABLE_HWP_ENABLE) )
> +    {
> +        val |= PM_ENABLE_HWP_ENABLE;
> +        if ( wrmsr_safe(MSR_PM_ENABLE, val) )
> +        {
> +            hwp_err(policy->cpu, "wrmsr_safe(MSR_PM_ENABLE, %lx)\n", val);
> +            data->curr_req.raw = -1;
> +            return;
> +        }
> +    }
> +
> +    if ( rdmsr_safe(MSR_HWP_CAPABILITIES, data->hwp_caps) )
> +    {
> +        hwp_err(policy->cpu, "rdmsr_safe(MSR_HWP_CAPABILITIES)\n");
> +        goto error;
> +    }
> +
> +    if ( rdmsr_safe(MSR_HWP_REQUEST, data->curr_req.raw) )
> +    {
> +        hwp_err(policy->cpu, "rdmsr_safe(MSR_HWP_REQUEST)\n");
> +        goto error;
> +    }
> +
> +    /*
> +     * Check for APERF/MPERF support in hardware
> +     * also check for boost/turbo support
> +     */
> +    intel_feature_detect(policy);

Nit: The comment could do with adding at least a comma or semicolon.

> +    if ( feature_hdc &&
> +         (!hdc_set_pkg_hdc_ctl(policy->cpu, opt_cpufreq_hdc) ||
> +          !hdc_set_pm_ctl1(policy->cpu, opt_cpufreq_hdc)) )
> +    {
> +            hwp_err(policy->cpu, "Disabling HDC support\n");
> +            feature_hdc = false;

Nit: Too deep indentation.

> +static int cf_check hwp_cpufreq_cpu_init(struct cpufreq_policy *policy)
> +{
> +    static union hwp_request initial_req;
> +    unsigned int cpu = policy->cpu;
> +    struct hwp_drv_data *data;
> +    bool first_run = false;
> +
> +    data = xzalloc(struct hwp_drv_data);
> +    if ( !data )
> +        return -ENOMEM;
> +
> +    policy->governor = &cpufreq_gov_hwp;
> +
> +    per_cpu(hwp_drv_data, cpu) = data;
> +
> +    on_selected_cpus(cpumask_of(cpu), hwp_init_msrs, policy, 1);
> +
> +    if ( data->curr_req.raw == -1 )
> +    {
> +        hwp_err(cpu, "Could not initialize HWP properly\n");
> +        per_cpu(hwp_drv_data, cpu) = NULL;
> +        xfree(data);
> +        return -ENODEV;
> +    }
> +
> +    data->minimum = data->curr_req.min_perf;
> +    data->maximum = data->curr_req.max_perf;
> +    data->desired = data->curr_req.desired;
> +    data->energy_perf = data->curr_req.energy_perf;
> +    data->activity_window = data->curr_req.activity_window;
> +
> +    if ( initial_req.raw == 0 )
> +    {
> +        hwp_verbose("CPU%u: HWP_CAPABILITIES: %016lx\n", cpu, data->hwp_caps);
> +        initial_req = data->curr_req;
> +        first_run = true;
> +    }

What part of data->curr_req is guaranteed to be non-0 (for the condition
around ...

> +    if ( first_run || data->curr_req.raw != initial_req.raw )
> +        hwp_verbose("CPU%u: rdmsr HWP_REQUEST %016lx\n", cpu,
> +                    data->curr_req.raw);

... this logging to be effective)?

> +static void cf_check hwp_set_misc_turbo(void *info)
> +{
> +    const struct cpufreq_policy *policy = info;
> +    struct hwp_drv_data *data = per_cpu(hwp_drv_data, policy->cpu);
> +    uint64_t msr;
> +
> +    data->ret = 0;
> +
> +    if ( rdmsr_safe(MSR_IA32_MISC_ENABLE, msr) )
> +    {
> +        hwp_verbose("CPU%u: error rdmsr_safe(MSR_IA32_MISC_ENABLE)\n",
> +                    policy->cpu);
> +        data->ret = -EINVAL;
> +
> +        return;
> +    }
> +
> +    if ( policy->turbo == CPUFREQ_TURBO_ENABLED )
> +        msr &= ~MSR_IA32_MISC_ENABLE_TURBO_DISENGAGE;
> +    else
> +        msr |= MSR_IA32_MISC_ENABLE_TURBO_DISENGAGE;
> +
> +    if ( wrmsr_safe(MSR_IA32_MISC_ENABLE, msr) )
> +    {
> +        hwp_verbose("CPU%u: error wrmsr_safe(MSR_IA32_MISC_ENABLE): %016lx\n",
> +                    policy->cpu, msr);
> +        data->ret = -EINVAL;
> +    }
> +}

Neither of the two -EINVAL really indicate an invalid argument that was
passed. Maybe EACCES (or less desirably EFAULT)?

> @@ -89,15 +96,45 @@ static int __init cf_check setup_cpufreq_option(const char *str)
>          return 0;
>      }
>  
> -    if ( choice > 0 || !cmdline_strcmp(str, "xen") )
> +    do
>      {
> -        xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
> -        cpufreq_controller = FREQCTL_xen;
> -        if ( *arg && *(arg + 1) )
> -            return cpufreq_cmdline_parse(arg + 1);
> -    }
> +        const char *end = strchr(str, ';');
> +
> +        if ( end == NULL )
> +            end = strchr(str, '\0');
> +
> +        arg = strpbrk(str, ",:");
> +        if ( !arg || arg > end )
> +            arg = strchr(str, '\0');
> +
> +        if ( cpufreq_xen_cnt == ARRAY_SIZE(cpufreq_xen_opts) )
> +            return -E2BIG;
> +
> +        if ( choice > 0 || !cmdline_strcmp(str, "xen") )
> +        {
> +            xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
> +            cpufreq_controller = FREQCTL_xen;
> +            cpufreq_xen_opts[cpufreq_xen_cnt++] = CPUFREQ_xen;
> +            ret = 0;
> +            if ( arg[0] && arg[1] )
> +                ret = cpufreq_cmdline_parse(arg + 1, end);
> +        }
> +        else if ( choice < 0 && !cmdline_strcmp(str, "hwp") )
> +        {
> +            xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
> +            cpufreq_controller = FREQCTL_xen;
> +            cpufreq_xen_opts[cpufreq_xen_cnt++] = CPUFREQ_hwp;
> +            ret = 0;
> +            if ( arg[0] && arg[1] )
> +                ret = hwp_cmdline_parse(arg + 1, end);
> +        }
> +        else
> +            ret = -EINVAL;
> +
> +        str = end ? ++end : end;
> +    } while ( choice < 0 && ret == 0 && *str );

According to the earlier of the two lines, str may be NULL and hence
cannot be dereferenced without first checking to be non-NULL. Earlier
in the loop though you ensure end cannot be NULL. In that case,
however, you point end at the nul character, so the increment above
would point end at the next following one. So my guess is that you
meant

        str = *end ? ++end : end;

Jan

