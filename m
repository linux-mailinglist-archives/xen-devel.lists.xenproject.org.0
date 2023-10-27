Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A2A7D9A8D
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 15:58:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624505.973082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwNKs-00055B-NV; Fri, 27 Oct 2023 13:57:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624505.973082; Fri, 27 Oct 2023 13:57:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwNKs-000523-KS; Fri, 27 Oct 2023 13:57:14 +0000
Received: by outflank-mailman (input) for mailman id 624505;
 Fri, 27 Oct 2023 13:57:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eU9S=GJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qwNKr-00051x-0B
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 13:57:13 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061e.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b94e15c1-74d0-11ee-9b0e-b553b5be7939;
 Fri, 27 Oct 2023 15:57:11 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8194.eurprd04.prod.outlook.com (2603:10a6:20b:3e6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Fri, 27 Oct
 2023 13:57:08 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.008; Fri, 27 Oct 2023
 13:57:08 +0000
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
X-Inumbo-ID: b94e15c1-74d0-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MCA0ZPwcD8upIDKt3vrObhwymDi0BoTkWo74RmuVCnwtdFQ17rU2paqyhZZvV72cF8vSwwgpL8WtsW9OmsJvKtu67jcPXkiygftk8DxVX1x3+mJAxEmOh46WE+kqFacL6noq+tE5bFxxq2Ptt8Dm5Fhj9eREjIy/6y5+yyjEBJ2plSXoIvqIOYM9/F1lwvFcM9aN/OU/d8VAUmWUGpxcc4bmeNtAu+sMVtqbRNPcmr4ywO+eHHh2GWSE1UV1vGOZt8ffMJr5YZbVJp/4s3vaIphpdKRHBBZeP3m8Da/2PZY+I58mNVPAGwLLHL8mKbAuaDw9WwisNsRE89smUW34Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJiV3slNr0tHCJXEI3X61r4zXwykuCqSO5AgES5BSgU=;
 b=bbe1tpC4bbMUqlj3m+PEijNfyXCyCFerFPq4BK/Fhu3mlEzx61f2E8j5XVl8ndPeSNTU+h2qVyKPapHqGwQ7fuOQPcUkqdJR3XHxzXBTKfeWYJeNSy6rxUooCtPu7c0s/YcH0QMxZwzOLlEEkoGpojv1jZDLiikbcs+njjgBpHzOrw50xxauCDJwgCvPDmtO6n7INpfnd62F+zbRF1Xw4fGWxrVoijRIv2qMrLU44A4RCHlw1w+JwO2nRkM+3ca8ItwtLjLuGFm4n+CkThpbotqZOS+OTififjK5PqZ70emmeD/DGfydglcqS+HKAXt1qsxdAFmnT4VxI8ODYT8ASw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJiV3slNr0tHCJXEI3X61r4zXwykuCqSO5AgES5BSgU=;
 b=K44SNFO/LguLAR1dz7HpbOmvqN7ecg+GTD1edLiAN/z0Ry5qZe5Zv1HsjKeAeavt2fLATYqMuW46Kk2VTqCav5+rA+5mAKMNzEu2LOa0LgK13fBjSF15sT0eX00HlJylOQlDFU2uWFY2pjO61AelBFRAj8eCnRWYrYRdPbd8z9/60RTOCboyGq4uZaBqNTXQskf6tFTzm8RiIdB16ZM2NgEyyqD+RrqbpvPHgshuBrBeo/KWqJdAwVKxtHZ9F8F6LkQ2+DFLjm0wKS7B0wy7JkeMO+EqRIbINGXdDCbaYirAOC+WmcFS7YJxm+tZ/aUbjgBiiz/peqjqaoeRsr7ieQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <beb4255f-76ca-2b09-a953-d02e0f04997e@suse.com>
Date: Fri, 27 Oct 2023 15:57:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH] xen/set_{c,p}x_pminfo: address violations od MISRA
 C:2012 Rule 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <88499ca9a61b59d13d90f6c5f77cbb2e124d850e.1698322083.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <88499ca9a61b59d13d90f6c5f77cbb2e124d850e.1698322083.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8194:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aa1bdc2-bb4d-45e9-c3e7-08dbd6f49c22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gj8GXHwLZYT0FnbiGYxG72FOc8xLJtMbw8acAo852fTa6+z9zyAJjhEP3fpGf7rkXptfMWI0MBnJk5Uu0vBvkNN9NDP8F90+xPwP9Rg4wb35SNyg3EZNTL/2B+oV7jy8eduY/uIUDscD2qfpk9o836aKv/XCuBPw5H6nNf/homtRMD/LkvfwikHJTJdNNM0Bv6JrtFyjp0/XeQoE5E1ZDI9Eh4rAv+DAw4X9P1TJxx5NlRESAFf7rG7+8MDrbFbgwXBpZCUaOBnoyBpVR4Omvx/AjDHvQCzFgf2usPOnGcgJ6run+UzbfRRsmQoeyvj+u+xGDvVyah0BO4M6bgsxypw7tUCeO6TP2Hbg5G4OWnOvZ2OBS9jTqBgGyKI7DVsDm1M0xoGN9e2bq+b6L3XgygAlUD624vctEIifOpxreXOr4M/LtsFv5mlv49eZVqZlcA3lgHlEKsqrzhamI4ASv276wEa+PfeUQIdUP5P9SjhxBcx3MeUUyopDstfDaAPz0EXweGM9ICtsFcg0A1AxMKTs6EkMg1F0yCMuSrTV2t8XtRWPKUxvUO7ssGIlha0LbH10Tjpswdfxaw4MG2Mmpm0pGccD9DDt/RnZNyPSXzgpZdpPZY4hyCSUC0/Kapzv08eLUxz3uevfcMUAJHkg2A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(39860400002)(396003)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(8936002)(8676002)(2906002)(41300700001)(4326008)(5660300002)(2616005)(36756003)(26005)(53546011)(6512007)(6506007)(38100700002)(31686004)(66476007)(54906003)(66946007)(6916009)(31696002)(316002)(86362001)(478600001)(83380400001)(66556008)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUtwMEgzYUpjNlZ4Z04vNHlxZmNnNUhEeER0elVqbkc0eStLSVE2Wk90VEIv?=
 =?utf-8?B?ck9sZEM3NXExR0xLZ29TcW5BWncrWDBETGxwbUU3YklMWnhaeDBnUWdndEh6?=
 =?utf-8?B?RitXNFhSb0UxTE90bDBPMEUrYmo2TGEvM1hzOU85Q1kzTTRvWkFKcWR0VlEz?=
 =?utf-8?B?S3piZmoyUExEb2pDTXNVR3IvbWlMdkFhVlhoNEZhSXJ2TkRkbm1oM0EwSFhp?=
 =?utf-8?B?djcvditZaXZIWlRQR3A3cVE5N2ZGQkNTbDc3VUZFUlppaWh3aXArVHprN0tS?=
 =?utf-8?B?K0JjZkp6b3hZenQ4cmNGY054cVYyQmJMMG5laUdXR3ZidjlkbnMyeWpScTRF?=
 =?utf-8?B?eDV0UVhhR2JRMGpFU1FIMmJQbUJwbWRlUFdZVjY3blhkZmNHMWxRZFJIck9X?=
 =?utf-8?B?akpyaFhkeDhPdVdka1JGUjloUzN1L1MvVit2ZTg4eWppMzNYbHhSWGowc3BU?=
 =?utf-8?B?dDFTQmo2STdpOEJZZXB5UWhmNUM5TkNmRnIvM2ZlYjNIc1N1N01WUjlxYkVM?=
 =?utf-8?B?RlJxQjhYbU0wQk50aDdIclpuUHRLSWowRXpleDhERVk1RVF3c0Z5THJWZnc2?=
 =?utf-8?B?Z2UvbWlSb0JJM2dVOWkxYjdkWmNhQjZ2WWI3Nnk1RzJGYUxVTWc1Rk9DT0x5?=
 =?utf-8?B?bSsyeHRuckhXRVBRTktLb0tvOXNza0ZSUnhlWExybTVyMURGNU5tZzIybnhE?=
 =?utf-8?B?ZlVnNXlhdUk4VUxtbGEwRVlTVDJQNVdhaTFYNVVQWWlXZ0JqNDNIZzF3bTUx?=
 =?utf-8?B?cXdOYTFETy9wZVFqb1h5VFArbzZxcVdRSVRuQUJyeklVM1NOcXBVQWs2T1J5?=
 =?utf-8?B?SGRxemhRaktnR21WVW1zQmtHemU2TE5VcSsxNEZDZG8zY1F6WWV4V0NHQjJR?=
 =?utf-8?B?S1QxL0tMZm9tNTlmUHU5eWx0TWtWRjlsOEJhdUlGNzZMUGs4ZXJWRVFMWE51?=
 =?utf-8?B?UG1XL2E5eWY3dkQ4YkY0Y3VjTkNlR1VFZkVVYlVaQnBiMngxSGFqc3hBRml4?=
 =?utf-8?B?Vm1QdzNSaC96ZVJRMU1XcE05RXgvQkdNNDYyWUp2YW1ncjhoVDExMkkwcFZ0?=
 =?utf-8?B?ZWx3VHNpZ0h6WTI3ZStOd3k5R1ZML0tDblJFQS8zZFh1V3hDRElkVElnTjRk?=
 =?utf-8?B?cWhqNmZ4SWY3am9IVjQ2Q0NTeFlnNEMrem1Za0FFMmxGWjYvcm0yNWpJMEhh?=
 =?utf-8?B?bUJnR25BQmVFUUxFQUlkWlpwMHRucDZvSDhqSXJzenVpWThzR0hYUmJLNzZJ?=
 =?utf-8?B?STVWRnN1a25RWjZnbi9HYjBCdS8zVnh5S3JrUzRiL3M0Q3c5eU9ucjRaSXFT?=
 =?utf-8?B?Y1J1R1VjZ2tVVzNZdmdwd1l4ekxRSi94QVZLRHduaUZtL0NiMjF0Tnl4azA4?=
 =?utf-8?B?WkVBSk9Db0huUHFWUytiOGpRbnQ1aDc1MTM2L1FtMytWTmVKZmNrcmtCOEhJ?=
 =?utf-8?B?R2NnK1BVS0crWXVkeExqTDdWc0JtT1JNMDl0Sjd2K20xZ2FrWHV2NlM0U0xl?=
 =?utf-8?B?cVBUYXJTV21jTUJJS0J3eGRKdEN4N1VLdlZPdE5HdThqNm5aSlNWMnJnYUZ6?=
 =?utf-8?B?WkxaYXIyaXNKWFFwemNHUmZnSkVpSE91OGgwd0JOSEg3N20vMDQxc3BaUURa?=
 =?utf-8?B?S0REaWZvWnJRZEc2WDlkcGhrbEttYWw5MFJxSU5yejZna2tSTXdIM2gydlA3?=
 =?utf-8?B?aC9qRHhSeFpDdkxGeDVQV292MHRRTGZKSDBoU2hBYnZXeks3MWdYZnpnMUVy?=
 =?utf-8?B?cmRzRlZ4QUV3d0lHV2RpTC9kdmFBcWJpcDladnRjSEFQOGx6cUM2ZTdMYzlR?=
 =?utf-8?B?SUM1bUJ4d2FTSWU0VE90ckwzQlFCZytnUU1NU01CdGNoT1JiY1V5Z2txMW9V?=
 =?utf-8?B?QnhwUDdLSjhFV21CL2liR0Z0cmVDbjRKMnltajJXRmllQWRTYklWZ1lwL2NW?=
 =?utf-8?B?TldwMEpBZTJnVWU0L1QrQTJLK2h2QVdIRS83c3dWYjZ5YXdOMHNZSXdiYU5E?=
 =?utf-8?B?VHpGSm5jUnJvZGoydWl1NEVNVjVLMjNkZnJvaTR0UExsdUh0RzFtVXJ5TC8r?=
 =?utf-8?B?L3dtL2JySXZLRnZ0QmZxOGhkQTFHNTN0azh4MkUwem5xZXhMQnUzYWNrWllw?=
 =?utf-8?Q?dSqgVkW02hOu4w/tIgMeC3bTI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aa1bdc2-bb4d-45e9-c3e7-08dbd6f49c22
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 13:57:08.6307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GvoabIJqNGLfikk5MD5EyNiOhbCqzdQ71lJhRrTnMQ0qXpSvYOIiuKSkwbVUiVEyO8lv+1N3P6mLnB1Tuht5LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8194

On 26.10.2023 14:09, Federico Serafini wrote:
> --- a/xen/drivers/cpufreq/cpufreq.c
> +++ b/xen/drivers/cpufreq/cpufreq.c
> @@ -457,14 +457,14 @@ static void print_PPC(unsigned int platform_limit)
>      printk("\t_PPC: %d\n", platform_limit);
>  }
>  
> -int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *dom0_px_info)
> +int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
>  {
>      int ret=0, cpuid;
>      struct processor_pminfo *pmpt;
>      struct processor_performance *pxpt;
>  
>      cpuid = get_cpu_id(acpi_id);
> -    if ( cpuid < 0 || !dom0_px_info)
> +    if ( ( cpuid < 0 ) || !perf)

I don't see the need for the new pair of parentheses here, but if you
add such, please don't violate style.

> @@ -488,21 +488,21 @@ int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *dom0_px_in
>      pmpt->acpi_id = acpi_id;
>      pmpt->id = cpuid;
>  
> -    if ( dom0_px_info->flags & XEN_PX_PCT )
> +    if ( perf->flags & XEN_PX_PCT )
>      {
>          /* space_id check */
> -        if (dom0_px_info->control_register.space_id != 
> -            dom0_px_info->status_register.space_id)
> +        if ( perf->control_register.space_id !=
> +             perf->status_register.space_id )
>          {
>              ret = -EINVAL;
>              goto out;
>          }
>  
>          memcpy ((void *)&pxpt->control_register,
> -                (void *)&dom0_px_info->control_register,
> +                (void *)&perf->control_register,
>                  sizeof(struct xen_pct_register));
>          memcpy ((void *)&pxpt->status_register,
> -                (void *)&dom0_px_info->status_register,
> +                (void *)&perf->status_register,
>                  sizeof(struct xen_pct_register));
>  
>          if ( cpufreq_verbose )
> @@ -512,69 +512,67 @@ int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *dom0_px_in
>          }
>      }
>  
> -    if ( dom0_px_info->flags & XEN_PX_PSS ) 
> +    if ( perf->flags & XEN_PX_PSS )
>      {
>          /* capability check */
> -        if (dom0_px_info->state_count <= 1)
> +        if (perf->state_count <= 1)

Since you're adjusting style elsewhere, would you mind adding the missing
blanks here as well?

>          {
>              ret = -EINVAL;
>              goto out;
>          }
>  
>          if ( !(pxpt->states = xmalloc_array(struct xen_processor_px,
> -                        dom0_px_info->state_count)) )
> +                                            perf->state_count)) )
>          {
>              ret = -ENOMEM;
>              goto out;
>          }
> -        if ( copy_from_guest(pxpt->states, dom0_px_info->states,
> -                             dom0_px_info->state_count) )
> +        if ( copy_from_guest(pxpt->states, perf->states, perf->state_count) )
>          {
>              ret = -EFAULT;
>              goto out;
>          }
> -        pxpt->state_count = dom0_px_info->state_count;
> +        pxpt->state_count = perf->state_count;
>  
>          if ( cpufreq_verbose )
>              print_PSS(pxpt->states,pxpt->state_count);
>      }
>  
> -    if ( dom0_px_info->flags & XEN_PX_PSD )
> +    if ( perf->flags & XEN_PX_PSD )
>      {
>          /* check domain coordination */
> -        if (dom0_px_info->shared_type != CPUFREQ_SHARED_TYPE_ALL &&
> -            dom0_px_info->shared_type != CPUFREQ_SHARED_TYPE_ANY &&
> -            dom0_px_info->shared_type != CPUFREQ_SHARED_TYPE_HW)
> +        if (perf->shared_type != CPUFREQ_SHARED_TYPE_ALL &&
> +            perf->shared_type != CPUFREQ_SHARED_TYPE_ANY &&
> +            perf->shared_type != CPUFREQ_SHARED_TYPE_HW)

Same here then?

Jan

