Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3068D6CBB5F
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 11:44:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515619.798671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph5sf-0000OC-Na; Tue, 28 Mar 2023 09:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515619.798671; Tue, 28 Mar 2023 09:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph5sf-0000LS-Jb; Tue, 28 Mar 2023 09:44:41 +0000
Received: by outflank-mailman (input) for mailman id 515619;
 Tue, 28 Mar 2023 09:44:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ph5sd-0000LL-Ta
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 09:44:39 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0629.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 276821c0-cd4d-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 11:44:37 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AS8PR04MB8248.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 09:44:36 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965%3]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 09:44:36 +0000
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
X-Inumbo-ID: 276821c0-cd4d-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AODR45f020lKj6zsFqIssa3mNYzeVcYuwYbJrfLp/Pi+FW6hXTVfaw4dMBVnFW0fgOM5tGF+k8XdehLwKM42BcY27I0aMZlK+IVSeqxvJDT872lU/45okQdGpemzK5JgfUq/SMpepjgyLngILi+gDLYbipS5bSmyhtL3O0XxQz9E0U/rRNJG8EZMSwI9LGTXApCaFyJ9ykdFlfu8TiANe+YMTdkaTBuVFHQWftRcoJaEgYYPMNjjEVswllt6dgIZI5HbaaaKda7CwThqvdFdUgGPEba3qjLejZNCSxY1JY/BJ0zy7z9ryUjD4P4ar9ec2vo4alcg2ssWB2VnewUPXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FS9VaI5T1Rqb9dw/YiPr/o6Wyx+B/vw5OBGvrEVxztM=;
 b=XKXwwRrSGENJoaKTyho6LKQOQH6+HxGUloQm/k9asKNBAO9ykQcrt8surOBbfLuYoSj9bdFAKMRhwmvHpPgWKSDiOPLBUN4IIKpn+WN0JJLU57IoC9DiQ32sSmXTx52ZB7PxTtk6hKDtI+hvOosUA/vSYZ5jm/VM+45DpoascXPTPapMudKMMUyWkJA1K7OeNhTU2w2BPS8axTyuNa6w8Pf7VxVzF7CC4sjut4E483w2GC9CujJdTwiNueyWogTfaHJ3+msGLjYerEQMPS/IjDRP4fz8XUjmrnZ6f6u+o9OEwP0swpUFeWHqjR1SGbwgQwgD7HnvIkCRetULde8kIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FS9VaI5T1Rqb9dw/YiPr/o6Wyx+B/vw5OBGvrEVxztM=;
 b=v09zg7/dVMawdctwNOzAihbv2vp5Jpkr/fWsEP/uOSbges8VTpfn7d/n+7GpNcs7VB8GnqJ5seInhmAbkUnGYUspQ7Ryas72jCoIubBk02fAQjPdlychGkn9R3MvDmQwmF2/EUo1W6pBzEkhlk+GVDQdbGy6e9LNJ7rzDRjqSUNdOszRZiIxRY4XuUG9/QsE/IKVf9Lty+8krGTa/+SaN7UqkX/TFCJhck8WOckWgovSovlroNwG0SngIU0v4Nhs851HyakeGnWEARF0b7NtbBl05JNfdOZqa24jVNxsclF4YV+QLPNkNm2JSH00dL45umdBaz6yt8HTrl5auVF7Gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <56aede95-9e08-ede7-c0fb-51e7f4b99d6e@suse.com>
Date: Tue, 28 Mar 2023 11:44:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 06/12] xen/common: add dom0 xen command line argument
 for Arm
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230327105944.1360856-1-luca.fancellu@arm.com>
 <20230327105944.1360856-7-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230327105944.1360856-7-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::8) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AS8PR04MB8248:EE_
X-MS-Office365-Filtering-Correlation-Id: d8b391ca-2269-472e-b7a5-08db2f710ac0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GmfoC5TF3IVThsoV01rJ/9iPObIdFishZFWGdBhCmzmZ7M3tcw8AJ5jDWD9NDxazzfASY/+eOc1F9E6Fwo5qy7VpTbhQcXoNQSORWOZtFbqsxYHVATz/noi3o8GAC35snwQuUSkpl1W3NCAvLDO3HxRMMfrHHOCCLPwRZKwr9oTBlqz+0NcG9HC1DHT7uv6O94q470DRoUVdm7F1/V72nWv8VK3h21tVtK78gEuV8ThEOeAmBbVCvXRFcBaVJN7Bmb/DZ2he6LHOkhVe7V6qQVEwlnW+duFdHPcH+uRkWMoZeDTQVp5h36llPh4+MLYajN8H4b83KQs0S2sMP41886yzTG3Rs7+m115krifsYBdvB37zM8Z6DrodRB2pEpBE4j1YoSJM5sWeBw7wxyggcdW4dAo/YXasBgJgXF7Ivabv73sg5jX1AdKSvcA/e5Gz/L6hPdn4k38YbLa+z5SUO9dHNNHZoLmoaco/iQP0stRYuQ5o/6esklXi/M6iAC8jk8M8FqtA0qr1+TqSHXoPA+z2oydyvbirNrHlRDf6NmdnXnRhFmiiWL/HAeAgoEHE8VjjBgL1niqA1YKM5duZD0Zvgd7NfYG/LPFzaV+pSpsAu0RcS5u7uLeelouVDwLYJtcsoPJkAUuNEZyViEOW6w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(346002)(136003)(376002)(396003)(451199021)(2906002)(6512007)(6506007)(53546011)(186003)(26005)(2616005)(83380400001)(66946007)(66476007)(4326008)(66556008)(54906003)(8676002)(316002)(478600001)(6916009)(8936002)(7416002)(6486002)(5660300002)(41300700001)(38100700002)(86362001)(36756003)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzBWbmQrZEQ1Qmx4Rk50UWszckk1VkYrdWlTSHB2UER2UmdMb081bVJGclpK?=
 =?utf-8?B?RnhUMDVaQzFDdTFkWTNsSWZSbStHZllTbXZHL3d2Znh5dTg5ZFhNS2RQYUJX?=
 =?utf-8?B?MDd3cURNYjZYcHFNVlBXME1jUDFKdm03NTlFZmlJTkNwTVNFcDBSblVDQUhw?=
 =?utf-8?B?Rk9BQ1hNREdTc2xWUDdCTkozcklNWWsvMUNSZlU3ODRqcGcyN1cvak9uMWJG?=
 =?utf-8?B?T1dzcVgvSXhJTkozMGJxWUZxNWRrY0NxNjNpT1dHS1FkVGFoVy9XTGpOUUhP?=
 =?utf-8?B?RTZoUkJ3Wll5RmN3VGRZWE1aVEpUY3lqbzZXZFdXZUNETHYwYmJ4c0JwTzF4?=
 =?utf-8?B?TnZQbXpzb3lkaG5YZmtNYmNpVU1BcU5VTmRWeGx4eU52d0JGeHN0eS94Vnd1?=
 =?utf-8?B?bGlubEZ6S1NiWHNMWitTK3dMZVcxd0llbHRuaEFOTkRWOXBxMG5qcFV1Q1BU?=
 =?utf-8?B?YXg2eUVocGRpNm1CQkU2WityMnZkUzVlbDV5VzRneXlmTC8rS1ZqcTFTaXli?=
 =?utf-8?B?QmwybkhxUVVmRHZwazREbXFrdXRLcnhrMUYyMmJGQ0dVa0FGSmpINzJ3MG5r?=
 =?utf-8?B?aE95Q1VoVEkyZnN1b0JGb2R4RTFXTUQ2RGVPbUlOT0pmUHFhZGZ6Qm5uVnhu?=
 =?utf-8?B?ZWRSc0pwODZFVzJncldhc2RKaHhuYWNnUEg4VXQ5SU1nZHNmZXcrY3pOWnk1?=
 =?utf-8?B?S2psYnpMOXQyU21RMzQrMzZjOFlXNHA5azBaWjVnT0F6cTREbE5NbDVvTXYv?=
 =?utf-8?B?dDBzVmpZb0ttdDVyYmd4cUJTNXdSd2tYcWc5NjJpN3UrbHdEZ3F1MFpValln?=
 =?utf-8?B?Vnl4NkJJREI5M1ZzdkUvVS9oSngxWHVtMDY5T0RoaHBJdHhHQVZBT3BqNWRr?=
 =?utf-8?B?ZHZXdWh1Y0U1dDJ5aHU3RGJabG90NzJIWDFGZmdoV28rQ1NLMTU4aGxNNTRJ?=
 =?utf-8?B?SGxyVVBISE1LOVpvOEZ4Mld6Y0kvaG9lc0lWNGNBYjVRRHhVSFN6T0FXV0lC?=
 =?utf-8?B?WnlUWjl5eU1hUnliS0h6ZVRrSHl1WnlZQ3d3ZkRXeEwxUk9pZFZMYTdFZUhO?=
 =?utf-8?B?aDU0UENzdzVFNDVNQ0p1YnZYUUlMb0pyZ3RBcFJvajRPUHBrWUpaQVFrdGFY?=
 =?utf-8?B?by9lcEpuY1FhREI2bXhnN21wOW5YWDBhWnVsUWxLdjRZS1NBcCtxejZsNGdM?=
 =?utf-8?B?UzMzdkZvYTVULzhweDhGLzlMemFuNFA3QkI0dmU2SVhRZ09xSGowL2gyU2ox?=
 =?utf-8?B?NkYvcjcwcU5RRUxCNmMvK3BtVXdCQjdmb2k4YXNzSmtNUHo5MFdwdS9sdUZD?=
 =?utf-8?B?V3ZoYVZQUllwUW5lS0ZNRHN3bUdVT2V3ZkxuOXl6ZDFvd21WbENnVTB3WTZw?=
 =?utf-8?B?dmtTUm8zbjY1UmZHRUpmdlhTRzJxSXBiZ1VXQTVoVnZDZ1RISldHcnowR2lB?=
 =?utf-8?B?YURPSkQ1TEJqbUVRQTBmNHVLR1MvOFNSNUFDT3F2WCtKL2JMUytYdGIvaEpX?=
 =?utf-8?B?b2VCODFKUTdVZHp0RnF2UVpzcUkzYnRKS01yUit4bGxSZlpqbENyWVFBbmxj?=
 =?utf-8?B?TlVEQ295dTRUM0tlSlBLbEtRTXNCcVNFWmJON3RoRWdEam5iWTlJTXZ6YkFQ?=
 =?utf-8?B?Y1Nkbys0NnFrTXh1T0pmb2FubXhUVmlMNis3eCtEaUdKa3U4VE0zT2t3SW14?=
 =?utf-8?B?YUZKTlJuZGRybkNHRlBGcHliTnlsSEJwYmc5QXh0RXFPOFRMRk14QjJWQnRY?=
 =?utf-8?B?Ym1GOUxKbi9yRzNuM05wdStyYWtiam5hZ0luZFdtWjhFKytiK1g4WUUwaWxJ?=
 =?utf-8?B?NTF1TWdhbVpGUXpmbjFQUE1vMyt6ZzdHM2xTUEdMYVQ0QmZYeWlwSWVyM3hO?=
 =?utf-8?B?WkZhZjFwSEJteDNqSUZnc1Y4WDI4bFQzenpITlFyZ3A4Y3o1RDlTSnR1Nldx?=
 =?utf-8?B?UmY4OVlNQnhUS2VVOXVqWjlaSEpvZ1JPaHlYSDAvWW5TNHNBbEQvZkdXU0Nt?=
 =?utf-8?B?bHQ0b09DdC9MSkUydkFLT0Y4WUVSL09CTFliWWZsS1Y1dzJpQUJxeWc0YUYw?=
 =?utf-8?B?NXptYVdFM05oVDl4eWpReUxvMkx0d0EzN2lzd3BnR2VqMWxQTS9Xc1VOaVRX?=
 =?utf-8?Q?URLAQb1h8QmmFJLC4dNaRLkjR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b391ca-2269-472e-b7a5-08db2f710ac0
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 09:44:36.2942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pnI2PcQTe61yNhlR/imYXioeWYW23E+h4NKs77zA2kipeuoNKneveD1JFiQdKBQssnbJhVzaQ0GKran3roZYjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8248

On 27.03.2023 12:59, Luca Fancellu wrote:
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -59,6 +59,11 @@ static int __init parse_dom0_mem(const char *s)
>  }
>  custom_param("dom0_mem", parse_dom0_mem);
>  
> +int __init parse_arch_dom0_param(const char *str_begin, const char *str_end)
> +{
> +    return -1;
> +}

Please also use -E... here, like x86 does.

> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -266,42 +266,30 @@ bool __initdata opt_dom0_pvh = !IS_ENABLED(CONFIG_PV);
>  bool __initdata opt_dom0_verbose = IS_ENABLED(CONFIG_VERBOSE_DEBUG);
>  bool __initdata opt_dom0_msr_relaxed;
>  
> -static int __init cf_check parse_dom0_param(const char *s)
> +int __init parse_arch_dom0_param(const char *str_begin, const char *str_end)

Is there any reason you couldn't stick to the original variable names (s
and ss) or use other meaningful by shorter names like s and e or str and
end (my personal preference among the three in the order given)? That'll
help with line length and hence readability.

>  {
> -    const char *ss;
> -    int rc = 0;
> -
> -    do {
> -        int val;
> -
> -        ss = strchr(s, ',');
> -        if ( !ss )
> -            ss = strchr(s, '\0');
> +    int val, rc = 0;
>  
> -        if ( IS_ENABLED(CONFIG_PV) && !cmdline_strcmp(s, "pv") )
> -            opt_dom0_pvh = false;
> -        else if ( IS_ENABLED(CONFIG_HVM) && !cmdline_strcmp(s, "pvh") )
> -            opt_dom0_pvh = true;
> +    if ( IS_ENABLED(CONFIG_PV) && !cmdline_strcmp(str_begin, "pv") )
> +        opt_dom0_pvh = false;
> +    else if ( IS_ENABLED(CONFIG_HVM) && !cmdline_strcmp(str_begin, "pvh") )
> +        opt_dom0_pvh = true;
>  #ifdef CONFIG_SHADOW_PAGING
> -        else if ( (val = parse_boolean("shadow", s, ss)) >= 0 )
> -            opt_dom0_shadow = val;
> +    else if ( (val = parse_boolean("shadow", str_begin, str_end)) >= 0 )
> +        opt_dom0_shadow = val;
>  #endif
> -        else if ( (val = parse_boolean("verbose", s, ss)) >= 0 )
> -            opt_dom0_verbose = val;
> -        else if ( IS_ENABLED(CONFIG_PV) &&
> -                  (val = parse_boolean("cpuid-faulting", s, ss)) >= 0 )
> -            opt_dom0_cpuid_faulting = val;
> -        else if ( (val = parse_boolean("msr-relaxed", s, ss)) >= 0 )
> -            opt_dom0_msr_relaxed = val;
> -        else
> -            rc = -EINVAL;
> -
> -        s = ss + 1;
> -    } while ( *ss );
> +    else if ( (val = parse_boolean("verbose", str_begin, str_end)) >= 0 )
> +        opt_dom0_verbose = val;
> +    else if ( IS_ENABLED(CONFIG_PV) &&
> +              (val = parse_boolean("cpuid-faulting", str_begin, str_end)) >= 0 )
> +        opt_dom0_cpuid_faulting = val;
> +    else if ( (val = parse_boolean("msr-relaxed", str_begin, str_end)) >= 0 )
> +        opt_dom0_msr_relaxed = val;
> +    else
> +        rc = -EINVAL;
>  
>      return rc;
>  }

While largely a style aspect (and hence I'm not going to insist), I don't
see the value of the "rc" local variable with the changed logic. With at
least the other aspects addressed
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

