Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F096671E2
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 13:16:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476094.738079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFwVO-0004AB-4n; Thu, 12 Jan 2023 12:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476094.738079; Thu, 12 Jan 2023 12:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFwVO-00047E-1W; Thu, 12 Jan 2023 12:16:26 +0000
Received: by outflank-mailman (input) for mailman id 476094;
 Thu, 12 Jan 2023 12:16:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmgi=5J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFwVM-000478-KU
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 12:16:24 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2044.outbound.protection.outlook.com [40.107.249.44])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec84784e-9272-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 13:16:21 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9659.eurprd04.prod.outlook.com (2603:10a6:10:320::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 12:16:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 12:16:19 +0000
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
X-Inumbo-ID: ec84784e-9272-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IkAkg+exqsZYredmu7r9MPmh5Agmrwzsp82aruLC1gTbp8r7spzqbK4XpDZdFWzsWV4Ped2caQmNK7BPJWzYgZv+3O4YgJcuoaoWpgo0/T1zU1OP9KE+Og0y+o4o5F+89heCd1vn3rkmnxI/HeU7x88jVrgWH1Ww0yLC8MmXsSsEbJHThmlN2ldWLG+HCzj2XOsDdVrfg5+JddEGsZW16eMaFuPjkjBt3UMO1JI3kxDa9014HP/4C2HmuWQE0w5GuWnkPlbGRAogWevVMJ3XYmvtxlRDDdU8vpYbEAzkFGY3WZDCPnbX5DAA9WKKnpggwhzw/S5/gueo9GoyEb/dIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSg0cm17QE9NumIyyQ1sqXZmMUnNT4vIsgXAUlpWqfs=;
 b=HirPbeh2vphmZ3wP/1C52yHTBHiYneFvxAV5ldTxJs5qWsRwoCS1mB5He72ZgBfn9v2NFxVZrWasI+DoMA3XDSzwMPwKxq/lZ8LU26r3uT78XhkwVBYcMOR5RqE8SGaDuT9GWMZJyByfyvFopvhpXE3z9z/ehME3ES8Pw2BRUfmuCrRSSNgXl3KjcLpyrGA333GBFeduYFBChEqjZ+y8sZ5jCXcRHq1ENz3zwg9/7cZbVb+tFKlk+N38KmK5I6zerVzRnlQGWizkLJ3q6PVkdBN1uDEqel6Y8UCEnniUO/JzoBkKxKYowsu+6xnPPYM2CrXRI6hFdefXyfB8fcQ9qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSg0cm17QE9NumIyyQ1sqXZmMUnNT4vIsgXAUlpWqfs=;
 b=j0j7gJUTFycOqCXHhLmNtIv9MJoQ5dJxyUPHKrDW+er5ua5PRJ7ZJjQDObyeabN13SC69fNNqn+YI5WkdlFdJKzysnS3BkxvnzdmD5NQIfJ6T92As7AtekXFKhNrQ5RIUTb8bMyUcQSwv0jGuznEnSAHLHTd+S+sVg2QMcI/aR8O2v0mdJLOHIcIfuNnx3C85SBWmisjn8vNKTKFkFPg5D+JSbKIMhkvOl453TjQa5kuZjqK0Qn4hsmjgylR/IjoT05dXTVS6Si9pgIVoUPRCJdPpDjvUuz3mg5Xo5Tabx7ctV9VA36EobeB0bGyHpKeRkrNjdkwm2wkDSdGH20H0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aa20eb4d-7b18-9bbf-718f-2fe5fa896713@suse.com>
Date: Thu, 12 Jan 2023 13:16:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 6/8] x86/iommu: call pi_update_irte through an
 hvm_function callback
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20230104084502.61734-1-burzalodowa@gmail.com>
 <20230104084502.61734-7-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230104084502.61734-7-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9659:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cde2bec-373a-45ea-b813-08daf496cfdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0RZeA6thBoHURnKqXKYVVULV2zIJ5qmw5TNqhDKHbU+fP2F8XSv8BbK3rihRZqSJ3LFkhjzl5BeEHD6k7Ce7DS++cyOfNvn+ENWyupV8JemSlgVL2kcOIUunVeUOYJDfH0LfJgoveKf+AkUdgd0FkZ2jvh3RcjFw+0LVeUfuoiODkyPnvf1sXlXMttAQ5ncsegTfnYG6QMgYFIdNbQfw565f1ZZJAeqSM5iR71xraR67YnENSTuANaDhNqsc1xQJ2mGEe3Q9FFrj0cYRp/JQkGZMRh1ws4JCFeh5iKW5pkh1mQDZ4xgKXfrCxVUA6gKuPrp3Q8oQHXCehX3yWIdT3piPxgcMkFTInMFCkBA2fxPU7wvCRiddJ6qtQgo2QeL9QRvAFCwcX20LF9P94wfeKhls68JPhL0SUewjZ2C3EgkMJrS4TpcOF7qqZt9trn5i8UthWcw4f3eqV0FUA83ZzwOT25PuiZtdOXx59O3tLr2YQW+Rv5qBc2yHTN7j+aUV90womistuylluEQrWdI4/aG157AcBycVMom7iYgCvo5lM1udX84wSBSAi8Ex8CvwWD2EXqdlFgBPUWcO7dy8WGkIl0yeGskKJibrIYYfPIhIIpuERDugaJwcPhBfCeXuTM21ykLogndwC57l83NBEBZUnTtH/qHBRSJUgTns7rGxYo6Z/hNGFBCDIOnDYww/y77M3kn04Bkc2+aGQeCuR0akS9pVjSGjHbQUet4UR9g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(39860400002)(396003)(376002)(346002)(451199015)(316002)(86362001)(6512007)(26005)(5660300002)(186003)(478600001)(6486002)(2616005)(41300700001)(31696002)(66556008)(4326008)(66946007)(54906003)(66476007)(6916009)(36756003)(8936002)(83380400001)(8676002)(53546011)(31686004)(6506007)(38100700002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmFKM3NlejhQZDk1cEROd0xnR29udlIzWWtpdVFCZjJZUG9kRndlS1FnUHhL?=
 =?utf-8?B?b3lMRW9PNnozM2NqS0ZURGFhTFRORVYrY0FIUXp3QmU3NmRPTTE5UWJxV3Fq?=
 =?utf-8?B?clBZN2QzOVg1akVBTlJDeDFGMW1aOHJCUFFONms0TmZRb0hoMEROR0xiSmNH?=
 =?utf-8?B?RFhNWENadjE1aGtHYXNCMlZRbEhDeVUrUGttQmovVVlvbVJBZHZVSWFVelhZ?=
 =?utf-8?B?OGhJdjh5NnRnd0ZQMCtWWVp0VmkxdTEyYyt0NE5HWkpTRG5QMFZzMHU0b2xW?=
 =?utf-8?B?YkxINGpFSTBCRUZWcWVGdVd3YUxxUVZXNk1lU3VoL3piQkpnUWhOdmdnUkdI?=
 =?utf-8?B?M21Oenp1WGhpSTNUN0JEczd0YkM0N1NXZm5wTWhuWXBKRkVvMkZ6YmVnQjlH?=
 =?utf-8?B?UnRQY0s2U3ExSEM4YnRDczhtU2drTFZORFRhLzVoRFdKdHFhS3c0Wk1tczcw?=
 =?utf-8?B?R25ZZ01KdnRnWmsrNnJnbGlFeTV2elN5VWhCcTkySXltaEtEZXZ6UE5uY3ll?=
 =?utf-8?B?QVJHQ3dkOXV3S0tPZks5WXBhQmRRQTRrUmgwYS82N0lobUNHanZrcG9iR3Vr?=
 =?utf-8?B?TWNzMVVkRGhtbnRxT2lTV1R1NGt3YUUxNVU3Z1dXTktmSWRrdlNFbmg4c3h2?=
 =?utf-8?B?VWoveW41TzIwNnlUa2sxWkJtMndKeU9SQTF1dzh4U2dMUm83bG9VMkdhUHhC?=
 =?utf-8?B?VnhxY3FOSlNTNnQ5OXc3eWM5dXZjVERRcTQ4eG5WUU5RbjlybWxYcFc4VTBW?=
 =?utf-8?B?RENHaEV3ZW40bzF2SFdtclVpcTUyYWt0ZlhsZXovYlozYldJYXpoVVFyZ2py?=
 =?utf-8?B?UldYdHl3aGs2a2tMNkl1bms0dFNndkJZNm5OY2U3cDY2VmZzcHpvVWVGMVBH?=
 =?utf-8?B?QXJLd2lWQk9GSng0bU5HQ2c4d3l6UjI4Y0VUaExvWEVoejh4bUdXMGpKSGQz?=
 =?utf-8?B?ajIzYTVCT2YzdjQwQnhTQnZ3dWdqeEtmc01iWG5FdDJZRzlCb2dOZElYcXFs?=
 =?utf-8?B?MVRQM3F6cyttUmNVRThUZjdKZmptNFMrSURPYUNiUFI3UVpKT21XRGZCWXVL?=
 =?utf-8?B?VThzRXBTTkYvQkhab0pGTHFMS20xYkxxL3dpZGo2SGtCano1MVQ3b0U1ejlF?=
 =?utf-8?B?ZlI0QnNRSUlZampVY3c4NkRMNmhidURqV3FnUE1PMTFMTEs1YmVJK1RsN0Yy?=
 =?utf-8?B?cVVhNXNxSGllSTVWL2NkUyt4UW9RVC82WWhUUENBRXhpR2h2OTR4ZjdwSW1O?=
 =?utf-8?B?ZkpFV0E3YTlWV0JzNVdvbFkwU004RGo4ekZlS2xrYlJJK2lINEdnM2R1bTRy?=
 =?utf-8?B?SDNWeWN3VjFpeTZpOUk0MGR1V2JyRUVreFVFVTVqaHViOHVJSEhGbHpEM2dn?=
 =?utf-8?B?TlVhektXbnpHcDA2RHh6Z3VIMHVNRXVlTHpUMnRXNUd0ZlE5b2dhUGIvaSt3?=
 =?utf-8?B?Ulh1aHNhZnB2QW9YZ0V2eTFERHU1V1o5Z2JhV3lCVnlNTzViT0djODFuVXkr?=
 =?utf-8?B?cklHNXNubEJLa1ZmcXQ1bWFMeUsybndlQWVVZzl0MjIxd2djREF0a2RvbGdV?=
 =?utf-8?B?cFJ6QmhmODFXNWMwVHhLOWFpVHQxc04wVnVidU5hekVXVWNxdlVGMGVkY0Jp?=
 =?utf-8?B?YTVZVXMzMWJxT1hId2ZZZytyREdvNXVvMXV5ajNlb3o1V2hReGhMRndvTVRw?=
 =?utf-8?B?SjBKRzRFSHo2R3lkMXByMHRrS3k4VHJ5ZTRFNzJMOVBET2txL0xsUXk4Y0Vk?=
 =?utf-8?B?K3ZrdHNPMWFjUWJVTVVqUG9najBnaDUxRzhJOTk3WkZtaXlUS3BxV0ttaUNT?=
 =?utf-8?B?MEc3SVI4ZXF1MC9qbHhPcmZpR3pMcGgzSndjcHFRdWJsbWtXTmhJL3dMalZk?=
 =?utf-8?B?ZCtNaDQ3SWh3bnoxODAxMDY3ZnV2VFpmTkoydWtCYUNURWllaEFzWTJHWGdN?=
 =?utf-8?B?TENpSWU2UEtWbTVoSENpMVIxT3FMRjBlYjd5SUZBSEJncWUzOEV2aU5HRkNI?=
 =?utf-8?B?OFdTK1hSTGRnbTRFdjEvLzNQMXhXeHhpczl4cVZQanlkVWFWbUxtUUc3akpV?=
 =?utf-8?B?UCs5QVhHV2tndUtjZkpDNkluRGNWcVJMbDhBclpRVWxCUTRPV2dkc1V1bjFS?=
 =?utf-8?Q?WnSkZBl8YblQzliYu+CHK9tu/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cde2bec-373a-45ea-b813-08daf496cfdc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 12:16:19.7373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YpvZqvyUfgbA4nU4k19Ba/WyBySfTzE93wrGahD0bxFKOwrypElLSMS7WxXdcs5T4EqBonv0Vh52zFCRWXifbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9659

On 04.01.2023 09:45, Xenia Ragiadakou wrote:
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -2143,6 +2143,14 @@ static bool cf_check vmx_test_pir(const struct vcpu *v, uint8_t vec)
>      return pi_test_pir(vec, &v->arch.hvm.vmx.pi_desc);
>  }
>  
> +static int cf_check vmx_pi_update_irte(const struct vcpu *v,
> +                                       const struct pirq *pirq, uint8_t gvec)
> +{
> +    const struct pi_desc *pi_desc = v ? &v->arch.hvm.vmx.pi_desc : NULL;
> +
> +    return pi_update_irte(pi_desc, pirq, gvec);
> +}

This being the only caller of pi_update_irte(), I don't see the point in
having the extra wrapper. Adjust pi_update_irte() such that it can be
used as the intended hook directly. Plus perhaps prefix it with vtd_.

> @@ -2591,6 +2599,8 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
>      .tsc_scaling = {
>          .max_ratio = VMX_TSC_MULTIPLIER_MAX,
>      },
> +
> +    .pi_update_irte = vmx_pi_update_irte,

You want to install this hook only when iommu_intpost (i.e. the only case
when it can actually be called, and only when INTEL_IOMMU=y (avoiding the
need for an inline stub of pi_update_irte() or whatever its final name is
going to be.

> @@ -250,6 +252,9 @@ struct hvm_function_table {
>          /* Architecture function to setup TSC scaling ratio */
>          void (*setup)(struct vcpu *v);
>      } tsc_scaling;
> +
> +    int (*pi_update_irte)(const struct vcpu *v,
> +                          const struct pirq *pirq, uint8_t gvec);
>  };

Please can this be moved higher up, e.g. next to .

> @@ -774,6 +779,16 @@ static inline void hvm_set_nonreg_state(struct vcpu *v,
>          alternative_vcall(hvm_funcs.set_nonreg_state, v, nrs);
>  }
>  
> +static inline int hvm_pi_update_irte(const struct vcpu *v,
> +                                     const struct pirq *pirq, uint8_t gvec)
> +{
> +    if ( hvm_funcs.pi_update_irte )
> +        return alternative_call(hvm_funcs.pi_update_irte, v, pirq, gvec);
> +
> +    return -EOPNOTSUPP;

I don't think the conditional is needed, at least not with the other
suggested adjustments. Plus the way alternative patching works, a NULL
hook will be converted to some equivalent of BUG() anyway, so
ASSERT_UNREACHABLE() should also be unnecessary.

> +}
> +
> +
>  #else  /* CONFIG_HVM */

Please don't add double blank lines.

> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> @@ -146,6 +146,17 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
>      clear_bit(POSTED_INTR_SN, &pi_desc->control);
>  }
>  
> +#ifdef CONFIG_INTEL_IOMMU
> +int pi_update_irte(const struct pi_desc *pi_desc,
> +                   const struct pirq *pirq, const uint8_t gvec);
> +#else
> +static inline int pi_update_irte(const struct pi_desc *pi_desc,
> +                                 const struct pirq *pirq, const uint8_t gvec)
> +{
> +    return -EOPNOTSUPP;
> +}
> +#endif

This still is a VT-d function, so I think its declaration would better
remain in asm/iommu.h.

Jan

