Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5852469E1E3
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 15:04:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498962.769936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUTFE-0005xb-Tp; Tue, 21 Feb 2023 14:03:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498962.769936; Tue, 21 Feb 2023 14:03:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUTFE-0005vC-R8; Tue, 21 Feb 2023 14:03:48 +0000
Received: by outflank-mailman (input) for mailman id 498962;
 Tue, 21 Feb 2023 14:03:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUTFD-0005v6-7N
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 14:03:47 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e83d589-b1f0-11ed-a089-e9535cc0f9c3;
 Tue, 21 Feb 2023 15:03:46 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8819.eurprd04.prod.outlook.com (2603:10a6:20b:42e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 14:03:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 14:03:43 +0000
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
X-Inumbo-ID: 8e83d589-b1f0-11ed-a089-e9535cc0f9c3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GslxS+YPckaCdg9KtV27AF+/uI6jh/d+rdfPJa0FEEpXDfocSbkezTXxtV9G5OhI6PgIkqr3pp/ooPZ9Y5TiUyMvGjkb6te6Z5lfh/YxtMSldm/OLRCaprppZrcvKMewKi9r/oR+8AU6woFCzMGd57/2fDwm2DW6KLOVI9av8XeHSEJi4GlgC+mr1DmIANv976vE4RVVARePl5KopHmAuKHhhF15YOB16cC3RVEdxQWgvAYZLKFh5+T5uXQz7lC76QBt6nVTGKUaop6zyyMDzL0PZlyQcYGgrrZpOMyDSY5K+/6jvqUS8v1nJrCFjTlSkfbdc6dvtoWIczzi/vlnug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFs7A2VAug61hvU98LDtRRrgTXr58yHOjvk5+u07sK8=;
 b=ZO7P6WCdoK1JSF0oHeLoKdlaSiL7ZU2/rgnePcGNPzgbYvBOj27rEJNpnwT9/Dlwuf02s219uoA5mm4q2S039iIIr06TKjxMNwxss/3JcuixVCoDxP9ViIffrwsKaTBARedqirTUj8LBpUcAq3wp4gwYBz7Iweq3mjA659bfAZ5xzn4KWjIRGIML0r3uyHO0wPNzll1c9HPCfJ2wCgsBTVxeRX/YBh7lYewlgXdibQZXCL/GR1RTi8vC9+cIoaktJ12UjxmU6auzmhZNicvIx5NH99MRz4RXOHlU8Zy/vwrtCt+t6mHrN/XwQZ+iE2S91SwRNlk+tQUjip+GQ/wPUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFs7A2VAug61hvU98LDtRRrgTXr58yHOjvk5+u07sK8=;
 b=1HCfekApL7lwj5licpRkqTVH4DRDopzzXh69sozDjM6QnvVN7WTGbegT3mTw3apB3Vo9TyrvfcuWYWqEYoSe3MwZGovv/GoTP+ZEDsmD7NOLmLLYDrY+jPHLPwa8zq7NqCVkcETyJzSLEBPLpjcOHsQhAKk3skVUzYgh36TvQWukAfy6kLzr3zwUGtyIiykq/aNl9DpPF27QPxHycSWT9El0dwBdpSfZRdKWxbBBikNv7sHKaWH23OuR/O8TwpfZzOy9P8suegbaw2hZU2rjTLsuGbTdVoyT6pyCc+jvY9X+SYfTlFAiKqcuD2f7S7nbVPJ0ULUXottkCJG0wGQlzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e608a174-c158-5e69-4650-51195dfee5fe@suse.com>
Date: Tue, 21 Feb 2023 15:03:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 2/2] x86/ucode/AMD: late load the patch on every
 logical thread
Content-Language: en-US
To: Sergey Dyasli <sergey.dyasli@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230215153846.18582-1-sergey.dyasli@citrix.com>
 <20230215153846.18582-3-sergey.dyasli@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230215153846.18582-3-sergey.dyasli@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8819:EE_
X-MS-Office365-Filtering-Correlation-Id: bd103c45-be2f-4096-c4a4-08db1414715c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TpNuli0wjqGPALt1C7+EqFuaETFj5z6OpzGxwGyseAZC3uZsrWleHIY0lN5hmpXJVqzRrWuPq60pMkbWiEvUj34G+NVnzrSPWaMZ+j4pPkwCeJ+/bXD/JundDRXlmvYpakR2QWuz9ZfiDBRsZZNf1c4pK/r0v8RzWVI7hW90yWvzyQUWZhg5633aADM6gJaHL+XynIpScJptog/8tqyecVufQuKMp9jvT1D8kCr0vcGjCi0B/JeNgB09Wr5oGQnYtFEGmHjGNG8D9n+JgKjTZxVwG71m6kE5cXvSeUhzwJXow+LLH7E/NExm2P3SPmYUUeuQezc9YtjU4vO6kSziYVdm5tnFQtuG1CE7XDpkF8a/i3O5PXAZ+zMZEvJap+YBMTEX79prm+4iZ2TW27ZylWKkHOw690fON4M+X+8RvLBhBPEh/2CoI1DgcUodNAsMqxAOzZLG36GVQn9aS1O60hi1julCye4aD+DIbkGLVQ7vgirfJTrc11rJ7uc2ZDYAzFR8EtBpW206JOfk9di7gGtuOBYJKZrjSwE+wGb7/6mAzmGMc+b/UrPpOIeVU9G8p+QyGKnSKTee6o/heU3PABOVKBFP5nIwvfmVGQR6+jzBqbEqHTrguf1N60vbAnIgD9Ti7vxXQpBM+gxsExLe4M41W3ZjAZwijMFYOkFHQ+rau7S6ZCNhMbrhfYaNVl2au4rWz1h0dlkWfHQcwopnrExPIL8SOAoHil9cfmnaIsw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199018)(38100700002)(31696002)(86362001)(36756003)(8936002)(2906002)(41300700001)(5660300002)(53546011)(6512007)(26005)(186003)(6506007)(2616005)(316002)(4326008)(6916009)(66556008)(6486002)(66946007)(8676002)(66476007)(54906003)(478600001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d010VWtTemh3bDliYmwrVWZva3MxZDRMYW80NGdESU5SbWZGNHU3bkh3Wlhx?=
 =?utf-8?B?Q3lWUWNXcmJZZ3dadHpVc25jMDBTOFlpMkttTGxJUDNaQjhGak5PajU2MURI?=
 =?utf-8?B?UE1XbzZTcXhyY0NiOFowc1dGY3hadFU0b0YxZW45bisvUitZRys4cmxQUU44?=
 =?utf-8?B?UHR6cndwbmFIUEljUUtoZTA0Yy9PbjdaL1l5cE02L3VMc1VKUm5FazI2TG1L?=
 =?utf-8?B?ZUxhWnIyeExNaGZnUXZjVGdrcDk1T1ZkUkpZakMwWDh3ckJMYUVTWFozaFBn?=
 =?utf-8?B?OHVHeE00MzBRYmFOQThqUmhVMVYzZS9qalc5alhWdWRjNjZISWVoSEUvSk1T?=
 =?utf-8?B?V1ZwMkwrV2xiTjlON1NaV1BiS1haYTdSVmtheVp1bVVwaHcxYjlwc0gzeFph?=
 =?utf-8?B?c012dm1wakdWM092SGcxalFpQ3MrN1FuMFJPUmE4M2t6cjM2SDdHSldOamFO?=
 =?utf-8?B?eVJERHlDeVpOaEJ4blBMRldzc2dDMVJSRVI3YVdIV0JlZWpOamZGZ3phWlh4?=
 =?utf-8?B?WGVFZVNnUSs4Zk94Q2EwRmUrYXlNbFd2dzdZeXpFMExoVG1sczVrWkZmWlQ0?=
 =?utf-8?B?Rm1Fc3NPb3R5L1BZTEZxREJZVXVaSzN3KzZ0SzVyZmJTUmF5ZmYydHY0M3Nh?=
 =?utf-8?B?M2ZIUlpDQzlHaklzSDZTU2FPRTRwNHRrY1dmOWhpWWMzbVpUT2pEdmZ4cnpl?=
 =?utf-8?B?U3pQbTRnMWwyYmNEaEU1THFnUU1lQWdnckZBbjFiL1EzR1dMeTJUTFExTmdw?=
 =?utf-8?B?aDFuNWFmNEhMOGM1WFBJZjlLdW44NjlGMjBYejRkS0xhTDhYd3Vuby80Z1Qy?=
 =?utf-8?B?dEN1eldmZEpTTHdHeXp2aEthSGE0cU9ScDRBNGlZSW5hSzJXWUU0YXZaL3B3?=
 =?utf-8?B?bDBsNmJSMmZKVVdqbmdvTmpjQmxwbVFHZ3ZpYzFleHFSdVBBemNvRHVwZTFU?=
 =?utf-8?B?RnBWMmdqQVk2Vy9pQkZwOXVoWFkvRVZQVkJZbzZKaUxBZWtOYzJlRXY0aVNQ?=
 =?utf-8?B?cCtOYU9xaDZkM01pbEZobEVxTjdTT3FCVlRTK2JwM1FoTWJSZVVFTm5kY1BP?=
 =?utf-8?B?K2l2dTRGWnVQcm9MT0FXQTJVQXQ5ZEIyOGdWK1k5UzBUcSttSXVZUk50OGIr?=
 =?utf-8?B?V0ZaNjFXMEx4QkpXbGw2WVByelloK3d5V1lWZUZiZUgvejlsQ0NRZDJ2U1N2?=
 =?utf-8?B?eUlTQ3RSS25scDQ2cThiOENvSDIzaEtGbHhjZklxWkFOYnZialBLWUloYXlz?=
 =?utf-8?B?N3hwODM1UlJSRzBwdDhNNjFSeEVSMUJQeElhZkpJSTlCRHVudzh2V2dydXBu?=
 =?utf-8?B?N0NLMjhhQmJFS1AzZFZaVytWQkZaMGNYcDhkQzQ4azlWRWp0R2NLVVJVT2I3?=
 =?utf-8?B?bXRCelJwTkFmUHFaaXFjekRRUWhTdzUxZzFBaVQ3RUZKTDJZK3ROQjQxbk9a?=
 =?utf-8?B?WmJBdHZqTHJ1Qm94RkJ4L1ZKci9oMGRjUjd4bEJnaGxWTytCN3pVaDJTdzEx?=
 =?utf-8?B?QXRReElHQ0tVVEhhVmpsd0FGS3d1RUJUQ09IRjNqdHl6MUt4RWdEU25sNFg4?=
 =?utf-8?B?bWRqR0k1WTd5b3JzTXZxZFBleTZ1aXBaZmZnSS9nTzBsRVFkMEFOVUlIYzNs?=
 =?utf-8?B?OExMVHpNTHFndDJFbjdQU0x3SEl0Z0pVY3d3MWllcXpHVlltaEluSHNOUG5Z?=
 =?utf-8?B?MU5NZ1ZhbXpuWXorN05za05CTUR3Rm1rYW50QlRvRzFLbUllUkRXVWtZajlm?=
 =?utf-8?B?MzZmWk1QdUFZTVd5TUFyZmkyaWlVRXRyUWQwUjhzN2lkRUJoa2NUZkdRTC9v?=
 =?utf-8?B?T0JkMXV5bjRKUVJxQVk1dWt1MENrQXNFbTExNDlOT0FrUlBBRy9ZeTVlQVJK?=
 =?utf-8?B?NDRPRGhhbjRjNm1jT1dPdVJYOEFyOUxCVUIzbldaeVIrU2Jtd0ZGY1E4Ujk2?=
 =?utf-8?B?S080YW95dzdlc0V1MGgzR0lxcTVITS9YVmhoYTJLRXNDc3AwMHkrL0Jja3hm?=
 =?utf-8?B?YktHY3F0VnlHNEkyVEZBUkIyaUxFZS9VWis3dThiNTBicTdma0txdTBiY2Jm?=
 =?utf-8?B?ZHVSSXNLdkJsbVJ2TmhBcDJmdGRkcjBHN09TODVUYnI1WmhraVVqQ2k5a2Vl?=
 =?utf-8?Q?Iy6gRIbBYzwz+2xBaO0lWnfDN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd103c45-be2f-4096-c4a4-08db1414715c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 14:03:43.8113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ivE6WPleuv8ESaShsj0/PEJwqff8NXxctCCRzGet+FWHHL6RxhyH3Kcjf6CQKURvfDG+yM5+dCR4LOxmmGF9dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8819

On 15.02.2023 16:38, Sergey Dyasli wrote:
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -398,10 +398,16 @@ static int cf_check microcode_nmi_callback(
>           (!ucode_in_nmi && cpu == primary) )
>          return 0;
>  
> -    if ( cpu == primary )
> +    if ( boot_cpu_data.x86_vendor == X86_VENDOR_AMD )

Given their origin, I'm pretty certain Hygon wants treating the same here
and below.

> +        /* load ucode on every logical thread/core */
>          ret = primary_thread_work(nmi_patch);
>      else
> -        ret = secondary_nmi_work();
> +    {
> +        if ( cpu == primary )
> +            ret = primary_thread_work(nmi_patch);
> +        else
> +            ret = secondary_nmi_work();
> +    }

May I ask to get away with less code churn and less overall indentation?
Already

    if ( boot_cpu_data.x86_vendor == X86_VENDOR_AMD )
        /* load ucode on every logical thread/core */
        ret = primary_thread_work(nmi_patch);
    else if ( cpu == primary )
        ret = primary_thread_work(nmi_patch);
    else
        ret = secondary_nmi_work();

would be shorter, but I don't see anything wrong with simply going with

    if ( cpu == primary ||
        /* Load ucode on every logical thread/core: */
        (boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
        ret = primary_thread_work(nmi_patch);
    else
        ret = secondary_nmi_work();

Same again further down, I believe.

Jan

