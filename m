Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A064D7DC882
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 09:38:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625526.974876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxkGI-0005uA-MF; Tue, 31 Oct 2023 08:38:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625526.974876; Tue, 31 Oct 2023 08:38:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxkGI-0005rq-Il; Tue, 31 Oct 2023 08:38:10 +0000
Received: by outflank-mailman (input) for mailman id 625526;
 Tue, 31 Oct 2023 08:38:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yzb5=GN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxkGG-0005rk-Mr
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 08:38:08 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on061c.outbound.protection.outlook.com
 [2a01:111:f400:fe02::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfc4d770-77c8-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 09:38:06 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB7107.eurprd04.prod.outlook.com (2603:10a6:208:1a0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.16; Tue, 31 Oct
 2023 08:38:03 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Tue, 31 Oct 2023
 08:38:03 +0000
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
X-Inumbo-ID: cfc4d770-77c8-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENwmxbPPi8oN9luK45QfMdcTXAJIdWYCJgMc7PHHqR5+NxB3+xH6oN7SDPfgw8k86HG/yjple3PnIf/WAKeqbmlVtHAmBVHWuE+QqFa6mPkJnU4R5k+kYnEGNmqG+8bBaON29bQziCa5HYqQsNQOUotYWcrt+Ak0kqaQ0KfVUHPx1jqexPpKRJYehu5sn2/bGj/XG7pF2xjbN6VH6Hg1RqocKWNKkeipR7lYa6REibT5tJoEW89Z4BXqWrFLqzuO5gV7VmBbVgcO6p7hOE0oGLC0652+0+dXEjilPmeSkBn2Ll+ZiHpHNQmc1sgb5dzM9Di9lP/cOJ1dBE8unenN/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UuC8T6P3mH03w5RWnjiWLqRLF+9j1EwWQ98JzWr2m8g=;
 b=kMLokaLIS+Px+kWhIKbV+DAgsnrQOBI/DeXgoEAlJ9gkzxke4Sk8YS6yh37GELvtC8NlH/FWfvg/dOAls1+cECL1Cl+f2NP4FXQ/xCq0/aIk29e4x+fqDclb+2gqNSo5I2RFLkZnJE7wCxQdOhrQlE2+P7VpF4FTdzB8KAQf1nhCg8ZveaBnUV0Rf3ckvqUDfn1m8O96R+rrjjHJT45jZG6YRXICcshfpbA8e/gUZDhC2KDxmFxCCPU/0r/P8htjmLXEDPaIHzQSNyEbLXkUvy5TCCJA75qR9fwyWdPt8JcaWsorrDsdjoYirgf/6abKX8dJswgp6CNlA8VbtHrLtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuC8T6P3mH03w5RWnjiWLqRLF+9j1EwWQ98JzWr2m8g=;
 b=YxvXRnCzEdtBJ8b5296gMsk75+69me9sXQ8sGzWQMAcYeXQurV0SDzEpoDN4iVuDbG9EE1dYF40n5zQf5XojEWlrYJmm/xvwbobytSxcUDKvi7brRJDZpSoH7CvdwiVWu6Rq1mMArorVNeswZ+mQCHP6Bsn7AMSytpVaccyp+iZRkTICY+hVMzgs64C8S9FN9DHTmO9jMHspz3hOou11akccucCw+b5q66AOT08MuIIQBqqJz8HAgKhfF6MhryZsVpLxz71qpMz7XpPUO45cqcRINgC/1k2pZpo8+pe+4dWHlOKll6Ft8dGrrwLTaYWzQKlkN+evJMYZBPPvvxBIug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b33ad98e-5bc2-3c55-c647-bf097e5971a3@suse.com>
Date: Tue, 31 Oct 2023 09:38:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v2] xen/set_{c,p}x_pminfo: address violations od MISRA
 C:2012 Rule 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <5624a23d704a2ef4eabc1d741e7e5b52de0362d9.1698740011.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5624a23d704a2ef4eabc1d741e7e5b52de0362d9.1698740011.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::22) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB7107:EE_
X-MS-Office365-Filtering-Correlation-Id: 712fecba-2508-4c97-add0-08dbd9ecb29a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3TPJaOOI2cm/xWux0YwDhJtgZGzvtA2yzZPU7Pf5ofCZP5ycxwepb49yi3VLorP+OeoZrX9DM5KOdYDHpXb0Cklzz8kaskqE1CNn/WOB7Cj0jcjyVl+LBc+jCbVBPJUAVueXPqz5mHIyByZkTsvzmjC6z1D9bn/aDhhqrxy1O5e/0eLFTshtv6UeXk+b2Xkl7nm+XHTA6XRsDtCJyeeEcyrUHLwSFn4BzaUhXRaIjbMCmVc2RL7lhtE1AO8WFdlJFQ4eU+IdoHcl3EfsH1lDRPg9SaKwulXNRi3PE4gixog6PXPvbqHQ2Kq64XQ+ju6KITeusks8TN+hipCXXYVHEK9RPFwVVKuab1aECVzGO/E/SyhXqJmgRhnd14Nb0gU+ECa6+uWdXwbE0z2w6Q+UbIUJKb8gPH1EKgz7JoPMCxoqeSY2gdy4EBPvtQCULF+WS9UUvMy2swkeiluoEzRQD/7j1gkM6aurcg1Jkd72yyJvAVIw1/Ylel85hreeSnhUUakLFySt/pb/wkcdP2EBy79Y8wAMBfq6ZXwdyCYPs6p7yAzUP070m8q77VwJeFw+u3jkWG/c2tlq4bt6TMMcBW5pt/n8y+3Li8v49WGoWGywm73QUgZw4lwIfq/rmHezdsaMqG7GSElgh9j2RYJmJA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(376002)(39860400002)(366004)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(2616005)(53546011)(478600001)(5660300002)(6512007)(6506007)(66946007)(26005)(41300700001)(6486002)(8676002)(8936002)(316002)(54906003)(66476007)(66556008)(6916009)(2906002)(4326008)(31696002)(38100700002)(86362001)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGVMOHJvMHJybm95RzVQT1U4MC9JUXhSU2dyYk9KeExwQ2I1YkhtQzZhaGFL?=
 =?utf-8?B?K0RFbit5Ymw1SVliR1I1Sk5NQUw2dy9zbnRzdVFIZlhZMmhLY0ZaT2ZqakZr?=
 =?utf-8?B?RG5DbCt4Zy93OWs1b0dsc3FnVDE1RFdsSnM5OGU5ODBLOW5sU0lhcXJCRkZF?=
 =?utf-8?B?ZHBadWkvMWN4N3FwcE9QY1A0cFdmcnhkYnNRMlluUXBoSjhibTBkNXpONGtX?=
 =?utf-8?B?UTRJd2RXNmxHdHRBQ3Z4OW8xbnpTdWhGVnlyM3FQY1JwZWtxaTlGZVVoeExs?=
 =?utf-8?B?d1ZKdU96UU9pVmVUb0hJZ0tyYXI5V3J4Z1ZubSsxNEw2aE81cS9aVzE4WkhZ?=
 =?utf-8?B?NytsMEpEdi9DUEtTTHpQa09YOVNCMzkzTVM3VUhjbFZBaVErQjJYVjBESkV3?=
 =?utf-8?B?WXJ0UExHTlE0Y05nT0VueUdlYjE2a1AxN0RDVzgxN0hxaTVkY2FoSHZUQkJs?=
 =?utf-8?B?dCtYeTlJV25ydDZ5c1NLNGFMSFA2SGQwMWd2OHR4cDFxK0VQakJhRWpGMGxq?=
 =?utf-8?B?UloxanNXdU43UEErR1NqanhXWVdTWDJzcVZyaVRwSkFzNUNyZ01wZThTSHV2?=
 =?utf-8?B?NHJOK1FJRERaaE5waGlhLzFLMmNRWjBLcHpwMG5NNVNlL2gxV1oxeWlaZkll?=
 =?utf-8?B?R00ya0lOS1FHNXJzU0xUekkwaDBNZUpBbGIvQ29HL25uc0J6blFzbHdMV3A3?=
 =?utf-8?B?YTRvdE5IMHVmTzRaUnpTMjU3NHc1WENDRTIwUHdVOUJ4SWxsVmppZ2lSN3dm?=
 =?utf-8?B?WHdRMDh5NW5yNzN6RTBkOUE4QVE5NmhFMEdmVGFCd3paMFhxT1RmVXpBWGpY?=
 =?utf-8?B?WDQyQUg3K0tmei9yRmtmendjb1dBczhTYWRNdzZ0S2FvVFVnUE5QVk96MlZi?=
 =?utf-8?B?Q2FYTEw5Tjg0aVV6L2NRV0lyS0V6eUtPblRqTXFpTWFaczF1S0V2Q0RxTDVa?=
 =?utf-8?B?ZDhJMlZoWkdsS0dNS21vRTJ2dnpzeGpFS2FtOUUra2ZMR2doZDl2RjJnSU8r?=
 =?utf-8?B?ZXlkdHZRVHRGTm44Q3UzbHU3VXF2d0I4QkVObjJLQ2txaHBaWlltTlB6L082?=
 =?utf-8?B?dGhFanVDc1pmOTg3ck5UZk52SG1FZnBGVlNLeVJ6RmNxUXlQMGlrN0pqMUZz?=
 =?utf-8?B?a3d0K3pJbk1rUkwvd2pIcUpIbVZPVDdQOHRoSXY4VWJQdUx0ZUtYSGpNdGFZ?=
 =?utf-8?B?Y2dua0t0S2x1eDVvNmxHcGFtUXJ0ekNUL1NZa08xVXcrNDdYcGFtK1QzaHcy?=
 =?utf-8?B?TmEwNUNmYlhldVVLdmdKNWU5TjlvaWFmWkdnSlBWK3NsWldmRWU1cXM2ZE9p?=
 =?utf-8?B?eEg1NklzSUtxeWR5Mm5uTWJUVmxMazlDYzkzUjMydHlpNFN0bThmU0hSUWp6?=
 =?utf-8?B?Y3cyMnVBV3c4eWZyZk5UeHEwTFgwckpGVVVkKytlRlczM1h1cUZtQnBGT0l1?=
 =?utf-8?B?ckZ5Z25STVhtNzkyeG1welJhOFFIeHhzUGdnb2gxZWxGdzFQd05WbHVCR1kw?=
 =?utf-8?B?Z2pJVEs1R1kybld5N1BUM241TVYxOW9tODROczhNdmh3MXFGdHFEOTN0SG5W?=
 =?utf-8?B?UWJBdUdsZGZ4OWhMYlJuUjRnTlZySExkTlVMTU9FNVE1V0dPYzRjVjFqMm5D?=
 =?utf-8?B?NzliNDZmd1l1OEZSeG5KRXBOcmVpSG1lV1ZNejBMSVp4NmV6cGd6WkliWWxm?=
 =?utf-8?B?MjBMUG8wb2NmRFVCc2cxUFR1OGJvY3VZV3ZHT0I1ZzZlQlN6TVNOTE1aMjZK?=
 =?utf-8?B?cXltc3FDZzNwL0RZK1ZKYnpNSjlQeFpqV0dyTzZIaGdmTFgvN1RPejRtTnpY?=
 =?utf-8?B?Rk1idGFrY2pTakJHeEFTUVc2NzJwUFhzOGVHbm1SSlBNcFVqVE1QMU9IeEU1?=
 =?utf-8?B?ZjRRMC9DYVNEakpYT3FwVURXMHBUdGZIRWFTMGx5ZDd1YmNacmZIQlBOWFp1?=
 =?utf-8?B?dXAyaDF4TTVyYVF0bFFPaFpubnBLRG9aQTJtZzNsb2ZmeW1BK3RyTzIyMDZN?=
 =?utf-8?B?V3NCL1JSR2Ria0FmTFV1Yk9RNEQrMGNkNDRqeEgvZ2pINDlXaEFpTm1XcnZI?=
 =?utf-8?B?RTBxV2ViTmhsVlpFWXBEVS9OL0d2UVdLU3FxeFRlT0NsdDFNRkcvU3lNdkdV?=
 =?utf-8?Q?YCxM8ZVPwai7bqUJqKEEy//Av?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 712fecba-2508-4c97-add0-08dbd9ecb29a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 08:38:03.6067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tVp64uhcwc/5pRaDOdM0KoAVgkPrVFnf9t392+2B7d4dHdh1UmT0GDyrecyMBzblhtskjjAy9o83zfgcurfqgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7107

On 31.10.2023 09:33, Federico Serafini wrote:
> Make function definitions and declarations consistent.
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> @@ -488,22 +488,22 @@ int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *dom0_px_in
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
> -        memcpy ((void *)&pxpt->control_register,
> -                (void *)&dom0_px_info->control_register,
> -                sizeof(struct xen_pct_register));
> -        memcpy ((void *)&pxpt->status_register,
> -                (void *)&dom0_px_info->status_register,
> -                sizeof(struct xen_pct_register));
> +        memcpy((void *)&pxpt->control_register,
> +               (void *)&perf->control_register,
> +               sizeof(struct xen_pct_register));
> +        memcpy((void *)&pxpt->status_register,
> +               (void *)&perf->status_register,
> +               sizeof(struct xen_pct_register));

Along with the other coding style changes it might have been nice to
also drop the bogus casts here and ...

> @@ -512,69 +512,67 @@ int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *dom0_px_in
>          }
>      }
>  
> -    if ( dom0_px_info->flags & XEN_PX_PSS ) 
> +    if ( perf->flags & XEN_PX_PSS )
>      {
>          /* capability check */
> -        if (dom0_px_info->state_count <= 1)
> +        if ( perf->state_count <= 1 )
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
> +        if ( perf->shared_type != CPUFREQ_SHARED_TYPE_ALL &&
> +             perf->shared_type != CPUFREQ_SHARED_TYPE_ANY &&
> +             perf->shared_type != CPUFREQ_SHARED_TYPE_HW )
>          {
>              ret = -EINVAL;
>              goto out;
>          }
>  
> -        pxpt->shared_type = dom0_px_info->shared_type;
> -        memcpy ((void *)&pxpt->domain_info,
> -                (void *)&dom0_px_info->domain_info,
> -                sizeof(struct xen_psd_package));
> +        pxpt->shared_type = perf->shared_type;
> +        memcpy((void *)&pxpt->domain_info,
> +               (void *)&perf->domain_info,
> +               sizeof(struct xen_psd_package));

... here. If I end up committing this, I may take the liberty to do so.

Jan

