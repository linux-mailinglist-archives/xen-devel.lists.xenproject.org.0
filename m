Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E3577F7B7
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 15:29:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585441.916564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWd3L-0002rK-Ar; Thu, 17 Aug 2023 13:28:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585441.916564; Thu, 17 Aug 2023 13:28:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWd3L-0002p0-8F; Thu, 17 Aug 2023 13:28:43 +0000
Received: by outflank-mailman (input) for mailman id 585441;
 Thu, 17 Aug 2023 13:28:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aH5n=EC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWd3J-0002ou-Fc
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 13:28:41 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20604.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa1ab353-3d01-11ee-877b-cb3800f73035;
 Thu, 17 Aug 2023 15:28:40 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB6863.eurprd04.prod.outlook.com (2603:10a6:803:12f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Thu, 17 Aug
 2023 13:28:37 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 13:28:37 +0000
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
X-Inumbo-ID: fa1ab353-3d01-11ee-877b-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bxGKwfDZ8WDFzmkcTpBkJ3niKK9rbUvgdN2+L2MZ77gQtmz+Wf4O2/6NySGTtg7aTvUwL2geIYZGKVwGztNyXJJAe0fQidWMr3qChjRwZntC4SayY2v9xzAhULKZPleh/RqkFENFOIN4hwBliMUpeZkvEd7E6QZWJImsFhljGovaw8Rf90KEwhVyio763hgUd95vmSF91mcB0gnW8KL4VTnhQHSPAKZKJQWxH6/AVKqEpIxLJnKbOueoGQPSjGaBCDlOfpKYwmU09L4IBM67vAIiXb0+k66Giegm1Y9AwvpyJNEevpTzSt7R29KJJtLzvZuF6HTBDzjYqXNAgkkwHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cnVk1mtWfJlXSHWhkXWp2TABStuobs0s1/gNl8oOH0=;
 b=Un9GbUnagfqeOMrbaSVYcI8Clrr4V0Dm37gdfbDowg21xJBAz3CbACcQ/2r2qxEFeL3RyQicXkXfZzdEV/wM4NFaY/CXf12uX1JCkf7CkKZlRq9Nw4U2yl98ma8yeycmPoflvau6c2cQQ2Pp8CSs06f/syxIFoHG91TaBEcFt3ZqB0AvnbEWkC3g+DBZtVxFndz82ubX5P9mRWCZvcgYFYYRI/zXgI2CRFBGeQ/mU0yP92OqnGB4CjN5dwf7L2QYW5a9yghiceMb684V0azvE18OAKXwgfb1WLaVgpMH+P7Q5gIVzj1JuSNtkkAFxqbLTKZ0SJY/LeRIEvvC60lVSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cnVk1mtWfJlXSHWhkXWp2TABStuobs0s1/gNl8oOH0=;
 b=vXTfAGIPQfFLoVHQR3fcQJVxnOGnbtYKff5wwHE3hUUSeYKhPXmOaYMPex3vSZMvnRgEK4TiggkqlC08C7zsVFYv9g0DWIYdHqrEpXvMoCt+SUCb5jxfs24O1wF6/cA2Zh0jQGRwu42XydIuXCmkzFbbG6RCH4TZAlgot07Jh2pjLYNgGF/pDKGy5F48K+UPguJm5PZPm5EFucQiaKAWK74M+OkLVInn9NiSnKa9m5CROIJP34+MiaxwX2osHjtGIFh02LWewse3MYLEcOeDKtQnQRCkMNoXkcjC9wmhEUDOjb2znubPvGYskxJtUfyrSsIQF9pppZfImQorgUPTjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <111382a3-0845-99b5-1efa-dfc505084c66@suse.com>
Date: Thu, 17 Aug 2023 15:28:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH v2 3/3] drivers/video: make declarations of defined
 functions available
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1692275359.git.nicola.vetrini@bugseng.com>
 <cc46049dbdf86cad33f6a9f7ae79851b54cecea1.1692275359.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cc46049dbdf86cad33f6a9f7ae79851b54cecea1.1692275359.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0011.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::21)
 To DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB6863:EE_
X-MS-Office365-Filtering-Correlation-Id: 55a6e1af-4546-40fc-b63b-08db9f25dcbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7ssL3UXnNZhJ99fxBomHKXBiGIMlcnWyaXE1ZavwKd8aVQMHbEBenzWdCk8pEcH2veeEa7GuyRb3tdGw6NkbWpf90Nn8sbK6ieMGMomozwrGCptFJGN4plYp4PaautkpAwJDobfbWyQgB8LC9msCUTCKN6D2+CdiZlNYPUA2gFO8Q93seed5jWZLx2f4fbQcwfemhO1owmXWFtT29ynTeeQbAWA3EVGe04rpUM5Ia62JoZGGzEowEnFp1GA6LTzZ5L3rrr1zQqe6HY3gBQYj0Pxrp/Nk9whc8vbXHKRvI4tZG2OQTzVkBeCGdby+NrKTMpJCjE9eoZt45xnwtiZH0NBmbCANQcvMQ4acks8t/IilLkc7wnQr0k7YYi8ClfgwLwYYoYvG5z83R2S+ZJboQz8p0xHshmuf/zPdrFzjO7DXfw0bUoC933iq26wcyR34Lg7qqbs6qJ32ufJC3KfM3W6R/TvHZnZ6SDqXI3B/CqRteuZ6M8NWrBoQd7zAQuXkXaKrZWJLMb6VNib4f0d7jihqbOLj/7y7pwYcEJZEv6DBynD7qyPveiLALZ/nJ8b/Z4F/JVs7pwpbJYm87DlDHGuMz+8hxrdQpg6vO8xgZOA3BqjCJ7q4x6IUVzvlHrxhvOXSSV+f+BJCX0k1HbOpkA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(376002)(346002)(39860400002)(1800799009)(186009)(451199024)(4744005)(7416002)(2906002)(66946007)(66556008)(66476007)(54906003)(6506007)(6486002)(6916009)(316002)(53546011)(6666004)(478600001)(5660300002)(2616005)(26005)(41300700001)(6512007)(8936002)(4326008)(8676002)(36756003)(31696002)(86362001)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDdnVmlMWWczTVhUUHhVWXlFNkY0blRPVEg0c3NlTjFzbkhlOWVjek1NRDRy?=
 =?utf-8?B?TFRkSDV4VFBWRlhROXlNenpXVzRueDMxeTdTekZTTE9SR1hKTks0VXZxajNw?=
 =?utf-8?B?enBxV01ZWnltdWpJZUdpZEVEekJ3OFh2MGhiR05lZFlNOXVZRkh3N2VZMWVW?=
 =?utf-8?B?M1JwTTlkQ202bms1T2Z5SlY0MXIreDJxcWxRWDRqMlZiRllTQStLZCtwd0ZE?=
 =?utf-8?B?MjVBTHBoa1pXUUprdHJoZTBQenlORkd1bFZSTXFmSmR0Y0xjdFpDR2d1dmFW?=
 =?utf-8?B?QXVlSGI3OXkvbXRGaEQzelBLZXk5cHgwYlo1ampNTUsweGQxQlI1TDR4bU9D?=
 =?utf-8?B?SnF2N0xkQWQvWjBWMzdaWmdPRGFhWjRuaWl3OFE5dGNRYmFpeDJXZjl6dHVp?=
 =?utf-8?B?cVhwdExsa3BlK1pCYU54aUdTOHVHYmZKVHdISTE3dHVRQU9mdkpFenVtWENF?=
 =?utf-8?B?Ty9iOVFjVmtKWnhtOFJ6dkRBRkNqNDMrUGhzdVNNL3R1dXJHOHpkakNVd3Fk?=
 =?utf-8?B?V1VMTTF6Z1AvME9jcW9XWllwWlJtVmQ1VjZjSEpvWlE0aGJ0T2c3ZDRzQ1VO?=
 =?utf-8?B?SWRGSkg4cVl2dCtKSSt6SGVrZXF1alpPM0VXemF0Wmk3UWs4Kzh4VWYrZmRq?=
 =?utf-8?B?VXZ1UHFFeGxmZWY4eTJYK1pOV01TOW1vQno4Nzh0VW5YMUI5bkVHWVRrYSts?=
 =?utf-8?B?dmdkcWpsRFB0ZFU0YVBNYzhyb3NZRlVnWEJBRVMyUVBINFB5Q3RzanZrSTQy?=
 =?utf-8?B?U1g4Y1RDQTdMU2Y5bldzaDY3NVByNlljNUpyRGJBd2RlM2dJZzN0U1F1YWIw?=
 =?utf-8?B?VGhKRFVTWWQ0OTRVWXAvN2dmYnR0ditLZmZGNGdVaWRWU1lBaGh2VytkRVl4?=
 =?utf-8?B?aFEyeDVOS1hDVVQ5ZnlTdGZXTE9meTJNdEsrWm5XUDY2T3BpY2NkV3ozR1Iv?=
 =?utf-8?B?NUl4WkFVcFAzQmJITE54dEoyTmsvSWp5TXNFU0thV3hLTkMzMGRzd3NkVm9C?=
 =?utf-8?B?RUk5eUdib1JyYVlYQWRQU1VhalZXSGV0SitKRWJsM3BoSlJPVUp0WGcvUzE5?=
 =?utf-8?B?WENudnp3cVQ2Q2NpRVVhdU5IdjlpT0QvN3pveEdPMWxWQm9nWGNwWXRGR1Qv?=
 =?utf-8?B?U09WVGxPdFpNRnBEZWI1WFdxQklicTMybFRyWXA2S1ZwTWdHVHZsQVNBMXV3?=
 =?utf-8?B?ZTZORjVxdFkyS0pOUkYxS3d1VzU3aUV3VlhMTEpDT0VINlBXak1vbjhuMFZp?=
 =?utf-8?B?NUlyWEhhZktMZGVyOXg5TW94anJsNllSZElTOFloVm8vQXdaMW1Ba0Q4Sld3?=
 =?utf-8?B?QUwrQ3N1MmNRaERmREVaRnYwb2U5SEtSOFNUREpINmpzZXY3NGk0TkhDZXRm?=
 =?utf-8?B?aS9qSzVxUFpScjFJaTNYVGxmUzFkQU9KV1ZYRHVPVlE5ZEVQOVJsa0FzaWpH?=
 =?utf-8?B?bFplOTdUN3grNEViRkQ1YWJkUkI1aW9YOUxmaVNldjRuTXhKeWdQQWp3c1lL?=
 =?utf-8?B?YTJ0R004aDBjRnhEZk9KRURZYVVFRXdaemVHQTBSTVdYeFYrb0txSUVTdFQx?=
 =?utf-8?B?ZGZ6WU5pc1loRitPL3FmQ2xadHVkT2F5ZmIwYUdmb3pIOW1JRUw1L0JLTzNs?=
 =?utf-8?B?WFJRNWgxSXZha1c0bzJqL25Qam9MTmVVbDJ6NDdhUi9pLzQrY1ZkdTk2Y2pK?=
 =?utf-8?B?RjFHTi9kVVN1WW9UNGRuWE5wc3NXZXBnbERUTGs4NXZvd1lWUEhTVXFMaFZ4?=
 =?utf-8?B?bnR5bHYrdGlzKzdWamZ5MmNwTkozVXJGeGljYjVWaVNqTEllK2lYN1ZmOEo4?=
 =?utf-8?B?TXFlV3Iva2ZUSWJsSlQxUXprM3dVeVd2T0V3dktpUUJNd0xKN200bXpLZ2Rq?=
 =?utf-8?B?a01WT1RjdFVpUVRnSkFoOTBTNk9vOTltUGlzNjdBSG1VN0Y2bkMxZjMvTEZK?=
 =?utf-8?B?b3lVS3JJZTgwS0VkRDUxd0dFQ2ZmZjB5enc5ZXBjTURHaGZKS0ppRnQ1MDJR?=
 =?utf-8?B?emZyMThvMzl5RE9MOVE2WEwyT2svVFR5RHVPNFp0Ukx4bVNtelV4U1RXMmt3?=
 =?utf-8?B?NFdIM3NIbnBsTFdzZXB5Y2xwZWNEb1dsdXVmTUw4RHY1NHpCQnorT2FZVnMy?=
 =?utf-8?Q?7rlnh4r4SuxwXQG4ZHezd77NU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55a6e1af-4546-40fc-b63b-08db9f25dcbd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 13:28:37.0426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e3uNil/9zsuRdq/xwz6xt1EjFxR1PODSFNrxf14PvPxJ7L86xtQwSGcd8GMJim3CFu6Te3jnIugBaBySs08ZHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6863

On 17.08.2023 14:39, Nicola Vetrini wrote:
> --- a/xen/include/xen/vga.h
> +++ b/xen/include/xen/vga.h
> @@ -15,4 +15,20 @@
>  extern struct xen_vga_console_info vga_console_info;
>  #endif
> 
> +int fill_console_start_info(struct dom0_vga_console_info *);
> +
> +#ifdef CONFIG_X86
> +void vesa_early_init(void);
> +void vesa_endboot(bool_t keep);
> +#else
> +#define vesa_early_init() ((void)0)
> +#define vesa_endboot(x)   ((void)0)
> +#endif
> +
> +#ifdef CONFIG_VIDEO
> +void vesa_init(void);
> +#else
> +static inline void vesa_init(void) {};
> +#endif

Hmm, on one hand you simply move existing code here. But then why don't
you leverage the existing #ifdef? The more that it's more specific and
in line with drivers/video/Makefile having

obj-$(CONFIG_VGA) := vga.o

and

obj-$(CONFIG_VGA) += vesa.o

Jan

