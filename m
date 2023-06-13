Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D5072DA46
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 08:57:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547821.855428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8xxs-0005QZ-Jg; Tue, 13 Jun 2023 06:57:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547821.855428; Tue, 13 Jun 2023 06:57:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8xxs-0005O2-Gy; Tue, 13 Jun 2023 06:57:16 +0000
Received: by outflank-mailman (input) for mailman id 547821;
 Tue, 13 Jun 2023 06:57:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kK7f=CB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q8xxs-0005Nw-2w
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 06:57:16 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 869a1ce6-09b7-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 08:57:14 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9568.eurprd04.prod.outlook.com (2603:10a6:102:26e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Tue, 13 Jun
 2023 06:57:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Tue, 13 Jun 2023
 06:57:08 +0000
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
X-Inumbo-ID: 869a1ce6-09b7-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nNLxqfcdNpqQk/PNtc4KWIo8w3pLI2E15Vc2tHBqiHUjGKJQ3i58+dW+u1fXVmJCOWhNp5GYDGkhU/1fCcYhseEIPiL0OUrzjwSqcsGMvkJqxHcEmQ1jPoAXzOABGlzBKuCk5NGIyEHHzTYe2a2726/NNWJywQaE8uv0l5D+ZF7kLqqIa1PPdcb5AZW29wPqD9GzoN/Ar/nUX7MBCoQJ5Rc8qWtTXj6uW3nl2EpMvx+kzM2Wj4Zz594sZPvXWLxXhKZgYidNFZEi/OAPBP/4m0V86V1SYgoFvtg/FM80exlu0dimR1PxoBGS0WEYz8K8MkAcX+rRC2eIClLoSSJoHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHKBkZaCGJ1syBz6AmdtxAal+mFQZGoQ0aIUijLnACs=;
 b=lqrZkmtAiH7BPYupaG+U3raA2Jz6NVz4OCBCbd043LPsb+bPk0DMEayEOJajvSMF4zqQw/uFD/kuPvj6EI2DQ+62ehqZ34/nasgzsa9879D9Yr7o4zdOMCRCkyN5aXHiWr0R034KV+mROvpsTkYqunO9s2C+++LX5Mhy6WPS3p98YiZnlHd7vglrVex5eRxbytmOb3MSJQ2EL+C+gvJYrdkw1EQnIz3JvkRFfvL6BTq/rrss/FJQTGT/D00eYCKemeT+piPGVAR6sxsuS9TL2U53cl2uziCRkomBJujO5QMtzIH2vgBbbWQZqwJosk/T0/nG8V4oNgSsUgoIgcvIIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHKBkZaCGJ1syBz6AmdtxAal+mFQZGoQ0aIUijLnACs=;
 b=ylItfZj7Rcmmhk3X0FS98NUd7Cw6kmigLB2ldHe2CEUf7l+HssvjbtosPSq440EUosS91SLPEvgUG8LWS7RwBS7ydkayfXOj4cHAlnnd3aWEyQJJkWMA25/0JkLCeFQj4KTLSX8OmYyJbpl16hwzT1KnGXLZZ7M3sv8qt7epg5QicbKoJl7fwIHDa++WC85hNeRtaAorEzNvMHIiKW1x/oPDUB1r0yeQyCF1CaibWagHjohGD0fj80TO2QGRjinl1YbphxkgNzYMcF3N2Gj73bCSGY4E/KMPQ+aKw0rc3x+r334r9tzI9urm90U9J9vOWh3wzfrXctPMn3Xhd2L8cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <26a77ade-7c77-0309-7a1d-e083621c9dcf@suse.com>
Date: Tue, 13 Jun 2023 08:57:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 4/4] x86/microcode: Prevent attempting updates if
 DIS_MCU_LOAD is set
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230605170817.9913-1-alejandro.vallejo@cloud.com>
 <20230605170817.9913-5-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230605170817.9913-5-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9568:EE_
X-MS-Office365-Filtering-Correlation-Id: c003e28f-f2a8-4927-e386-08db6bdb6796
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DL8AAmPqLhv85Reg9J7GXDtW27IK8sJwZNPWVsC78ZiXL5qmTOC7gbOoBIv4q8yJXevz8VocT8mJz9SJ/1a2uNoDs09Y9Szc+qNVlWLi7olaPeX/dccly1vsn+1hixfI/Hxf7t51sRerchMT4FxCHNy3FSYp0i4luLFWm4mW1Q7ZdW04s+jHaNCu43g0nlKsq2Am1HUcLYQvClqciP9s3hssHorygA08UbHyG7OF76Fzd77nF5+3pysoA7cxqgleTIkPd/dIkyNEb2a44DFPxxl20lw4+7CxGurIgQWAeYjeF8giiUfDN6jMqnfFIwlZHG6Y3Sx5yCYYs0H+/ld3y0aB8KfYxDiI/w3Qf4A/n6/9Ne16n1SXyyxtg8rQgeFWPe3t4y4Hf692gaNK9rylMcA1bmNnwwOoevim56nWdiv6RII6KF67CNXFo1r747SbpC2QPBgvqjYNsqwKmZSkjixvahxk+8Pws8HfjK14KhFIGFQci6lqWkF98D7bxjCu+rNOvELzlxXJO+/gzNLE9deAVHmFSRaGMvF8WPoBpqfwStx7qPo2NcKwnC5IrQmQDbX9yvdp8vMMOGmvSLEjbUNjiOpB4WUilWO9AIobYzG68TiQd7QLDPADb9KNU3pY52430oOI+qhj//s95G36+g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(366004)(396003)(346002)(376002)(451199021)(31696002)(86362001)(36756003)(66476007)(66556008)(54906003)(478600001)(6916009)(4326008)(66946007)(316002)(6486002)(8676002)(8936002)(41300700001)(5660300002)(15650500001)(2906002)(38100700002)(2616005)(6512007)(26005)(53546011)(6506007)(186003)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3Y1bTgxUjdxRndGUG4yUjR2Z1FNVXZYZnhTTnpldlE2aGFvdG1sTE5BZ09w?=
 =?utf-8?B?N0RXemk5WEhhaTNKOENrWS81aENZRkZtSW1GMkl6QmsyQU9Hc2w5eDdIN2Rx?=
 =?utf-8?B?ZjVxd2Z3UHNsbEVqaVh4V3RkODExTHI2bi9WdmROOXVSVW9jYUptd2d3K1lv?=
 =?utf-8?B?S0p3dStYYVFPRllFbGk1N3MzNUtqeTZ5Rko3QksrUUYxQTJCN0syOWVDMVF6?=
 =?utf-8?B?Z2hBTzBGRUFOSHkxeTlsNXVwaWdObzR6MnVVSmpZZTBFWURPL0lnUmtTcHhV?=
 =?utf-8?B?NDcxQ1M5cGZ4RVk4Qm9QTm15YnhzWDhKTnpPSm1qTU9vTHdNZDAwdHYyTk0r?=
 =?utf-8?B?V1ZnaUJGaDNadTM0S0RVbEtnTnUvbjdZOFliZTFFZHY0cFArMm4zYWUzVUlj?=
 =?utf-8?B?Ly9tb1ZEOHY4dHp1NG5PMjE4Q293ODFSUFRERUdzcVk1c2lteUs0VXU4ajJI?=
 =?utf-8?B?M0hqTmpwZmhXMkhsUkdLNW9QdENTVXF0a0RvZHdlSW10ZSt3R0JnL1FsRjcr?=
 =?utf-8?B?Q0dLSEdhb1ZIQVpiSG44TnlZclRkY3NLdmRYbncwZGdmbUpHZHJxSWtJZmNV?=
 =?utf-8?B?czZjSTRlQkhnQjlMY0VGVDFqNnZvR0hMNEd0cVFVYktWbXVIUXFRL0JlYmVU?=
 =?utf-8?B?OFFIY2Q0SFErblNlVlVaa3RkYW96cGZFL0ErN2hxTkVqRWFVckJCMDc5S1Bx?=
 =?utf-8?B?dGtoZS9uc2FYc2xDWWtKcXVmNHdSM0hLMnRod0V4UUdIYUxSWVFWNTVtVHAz?=
 =?utf-8?B?QjJBZWlJQkVVYzRiTUx0T1NVVkU4SCs5Z1JiRExNNG9OTlNlOFRyTE44dG1F?=
 =?utf-8?B?ZDRjT1BicHMxWFFocS9ZTWJSZGJsRzdXRE80Rk9ucjRtalVhd08zdHRMNCsx?=
 =?utf-8?B?MW1ETlJ5SXcybVZTM3NxMGo2ZE00eDR1TURMZzZJUjFaWXRJUEFEN1lUd3BF?=
 =?utf-8?B?aWVTdWlnaHZvTjEvTEplUnNBclkvU0xQeWpVYlp6a250ajRNcll4UDFyT1c4?=
 =?utf-8?B?ODRVNnppb3R5VjIzZi9lS0NIMWJHd2tTTlRUdXdMaGNaZjk0NUwvZlB6bHp2?=
 =?utf-8?B?dmlRUFRVNTh4bndlK1B1dHhxQUlOc2JTYXROUy9VdWF1V0w1M1BuM2xhTnUy?=
 =?utf-8?B?NHZqUVdpWlpsa3FueVZPckVVaTN4b0tCdHpNakUrUnZuWUhnb01mQ3Q4d01p?=
 =?utf-8?B?OTUwWjBWSzF1cWtlMzhRbmpBWXhKcFB3am1QUUpOSk9zK0pseVprUTZzYnFW?=
 =?utf-8?B?OWo2N2U0R3VSN1RRbVhUYUFuZU5RSU9xUHkwWFNXSExlODlDNi9uQmlhSVRF?=
 =?utf-8?B?RE9PWHFHdVlIZDhIanNRWklRd2RMdU5RbFBhYzRmS0c0REpNNG05UzhPQlIz?=
 =?utf-8?B?ZU9xcDA3MkNEMUhRQlhoOE01SzZWU2RCTHAyQk44NkloZXJyT0NQeUpwQzRk?=
 =?utf-8?B?aGdTNUQwN2pJalFDdVJnOXpuVEZsMTVnUmU5YWRTdWozV0FRaEJsNE5PYVdI?=
 =?utf-8?B?TU5CK1oyWDF4WjhIQUd0SWZWQWF0OTlaZVdiQURTQ01VWXo2eXVVQU5yRWp1?=
 =?utf-8?B?S1lSUGlXN2RISGE1SmFOYTBEejF0MEFCZFNUWXZIWm9pV1VhdzJkZ0drb1VF?=
 =?utf-8?B?cFBJS2djeEVpZnovVDFhK3prWVVKeUc0cmQ3MlZiVTA0SUZhTk9waGF2eXIv?=
 =?utf-8?B?NDlUdi8xVm9qRlZra3lNa1lhQnhrM1ZGM1R3ZHRtcmg3Umc2Y1c2R0JJNlJ0?=
 =?utf-8?B?REEvb0dyNHRMUUNvZ09HQVQ3L2F0TFlKT2xKTm9TSnUxNklYOE1hY2tHQlg3?=
 =?utf-8?B?b0ZWdHZ0dk5nekMyRjdxcE9qM080R2lPV2NwcDdwenNydGtMTGs5b1JXTXZ0?=
 =?utf-8?B?ZlVEd0I0ZExmS0RPcjhjVG8wNTdueU5kNkNoVDlkUDBTSEhiZEtZQ2xkalll?=
 =?utf-8?B?Q2JORGxVSVJydWtYQ0JlNFNUTk5WOVJibWp1N3phZVp0V2kvT1g0cVV0QzJD?=
 =?utf-8?B?ZFNPL0xTQXpoSkRaelhXcE9oOG50c05pUVpsaHNHSFlZYmwwTGJuZnJXOXM0?=
 =?utf-8?B?TklSSm9JZEhKWmF1ZGRNSmtjU1RZUFFSSlByWlpTUi8yK0ZTWG1tN0xNNEVM?=
 =?utf-8?Q?Sr7s4bLyUpdqQfRdZpBvlH9st?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c003e28f-f2a8-4927-e386-08db6bdb6796
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 06:57:08.4172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KSJn5lx+NHNf0s57eeUh+dq8My7j5aTnVII5CVmUPg88Se7jiljKY6zfVryBeSt6DaUbz2E1pdT7xQX4NXpRdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9568

On 05.06.2023 19:08, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -749,11 +749,12 @@ __initcall(microcode_init);
>  /* Load a cached update to current cpu */
>  int microcode_update_one(void)
>  {
> +    if ( ucode_ops.collect_cpu_info )
> +        alternative_vcall(ucode_ops.collect_cpu_info);
> +
>      if ( !ucode_ops.apply_microcode )
>          return -EOPNOTSUPP;
>  
> -    alternative_vcall(ucode_ops.collect_cpu_info);
> -
>      return microcode_update_cpu(NULL);
>  }

This adjustment (and related logic below) doesn't really fit the purpose
that the title states. I wonder if the two things wouldn't better be
split.

> @@ -849,12 +850,25 @@ static void __init early_read_cpuid_7d0(void)
>              = cpuid_count_edx(7, 0);
>  }
>  
> +static bool __init this_cpu_can_install_update(void)
> +{
> +    uint64_t mcu_ctrl;
> +
> +    if ( !cpu_has_mcu_ctrl )
> +        return true;
> +
> +    rdmsrl(MSR_MCU_CONTROL, mcu_ctrl);
> +    return !(mcu_ctrl & MCU_CONTROL_DIS_MCU_LOAD);
> +}

As Andrew says, in principle AMD could have a means as well. Surely that
would be a different one, so I wonder if this shouldn't be a new hook.

> @@ -871,6 +885,15 @@ int __init early_microcode_init(unsigned long *module_map,
>           * present.
>           */
>          ucode_ops = intel_ucode_ops;
> +
> +        /*
> +         * In the case where microcode updates are blocked by the
> +         * DIS_MCU_LOAD bit we can still read the microcode version even if
> +         * we can't change it.
> +         */
> +        if ( !this_cpu_can_install_update() )
> +            ucode_ops = (struct microcode_ops){ .collect_cpu_info =
> +                                    intel_ucode_ops.collect_cpu_info };

Similarly I'm not happy to see a direct reference to some vendor specific
field. I think it wants to be the hook to return such an override struct.

Jan

