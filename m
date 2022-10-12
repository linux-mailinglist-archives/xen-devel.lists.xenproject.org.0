Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 907655FC1F7
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 10:26:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420857.665920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiX4M-0001IC-CF; Wed, 12 Oct 2022 08:26:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420857.665920; Wed, 12 Oct 2022 08:26:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiX4M-0001Fw-91; Wed, 12 Oct 2022 08:26:26 +0000
Received: by outflank-mailman (input) for mailman id 420857;
 Wed, 12 Oct 2022 08:26:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zIvO=2N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oiX4K-0001Fk-DO
 for xen-devel@lists.xenproject.org; Wed, 12 Oct 2022 08:26:24 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062.outbound.protection.outlook.com [40.107.105.62])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e18bdf1-4a07-11ed-8fd0-01056ac49cbb;
 Wed, 12 Oct 2022 10:26:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7264.eurprd04.prod.outlook.com (2603:10a6:800:1b1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Wed, 12 Oct
 2022 08:26:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Wed, 12 Oct 2022
 08:26:21 +0000
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
X-Inumbo-ID: 8e18bdf1-4a07-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQpEZv1wzxSTgdBvPbWwAjGgNjvbh3MmckLQp64f6x7+WvDRQ3htrTZJRsMYOx8GqaNiz9nE1zbqpZRUElDKrYUflpclliylGW9WKcfSgnXSFb1ABCEw14zl8FV4I3G6c2Lx+/3ANBSmV1msBFQyjEV0BZ7VtWX9k5nXONvT1xelwiuappgG1gcP4mWecjn871r9rhwM0m4/vuT3EaSp+mRSRb0g90PRYB2baaNjPMVn4VPmm18pqRo1xZ040mr4Zvgdk/KDQlTGx4k2I9ueGTo0Gzv4x/mTEHjRY4eo0tAZzI92a1gjk2t82url9ofSO0ALkIQ0aneRs0et8F54Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dgg7KhMWK/fhp3AzmzNV/nx4McQ/qL7ZCFCDlYQpZjA=;
 b=B9OA96dF7g3Xn4/TEwtFten7txj/E1sdnXu+mWLh6HH0SkYYL4OGqzbx8l/S9pAtbgDlnvyPFHTG2BPCFqtwPjLEXGqehr+Xt2IYSxb2SUfNsUqIo+9EvP0E+NPgPGCEX9LvWrDPxb6CaS8VVB3vGANh4jzhKQUsFOFlxcn2FVmIttEGwrBQ3cYZvPqxv7U6YCEpBNyH5gw8/5SqrRGIiqUv2lkW6WYC+/783wlxYafnDGQ1q/0B7dXx8I78/P4smqu94oRjJZXcD2cdTHN6lKuB4f0O6WKgtQflRH0ycG2m/GNiL/g3zPh9FFBOc10nceA6A4/WD0QK8TCEsoQRYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dgg7KhMWK/fhp3AzmzNV/nx4McQ/qL7ZCFCDlYQpZjA=;
 b=q2n+N/BeR1hVL7vIYGHzEUbvTyE1L3GYaSFdeay5UkwYAreRyfY1+DZiH5M7ioHXOWJVDLF6m0rU09Zxh9V/IcK7xrgOzYQueA6gCMmIZ3FwJIS3irwdkWt4NP41TKvRIvIFjLlSxNK19lQbbu3dTkkzMV3wecko+PHeO3XUg7dpkMpGno8N2JiE1DsrCSoOVAyDmFWcoTawJSqKWcj+G7mIN0CNLQDFQBebiPxg2IlBtx1tqXE837FJFusXnppX8e4P2R/onl2BmIA64rTEwGoKTjBh0W+ywuFX2d+LDp3JUYUK+UxrHm4UeC48RqRosQO+DfE5fP2QfNPi07VakA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0ac3e95f-293e-d395-f69d-846f87edc0ea@suse.com>
Date: Wed, 12 Oct 2022 10:26:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH for-4.17 1/4] amd/virt_ssbd: set SSBD at vCPU context
 switch
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20221011160245.56735-1-roger.pau@citrix.com>
 <20221011160245.56735-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221011160245.56735-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7264:EE_
X-MS-Office365-Filtering-Correlation-Id: 10d7429b-450a-41d8-6975-08daac2b7176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l8xvKHfjHzDDY4hxFPn6w1XIXCnt0Ls9XiVXJULR4QpCygcPsrEaIMfJ9LnzjjzIUALkVEYtU3pbowhwnD5sXKwADuKzHXZhUeB86RiT0q7U5/+14oGJ0fYf5LHDuD/f8wH8h/JTQw9EbrZeUWDXx7nAuDb2J874sAxbS1clIxqCbcuR1w6v1oGtkAj+MBFCyxwDL+ItCBOv0jznni5zJl3q70sHG8jJu46rQbeVPB7bveM8og+sMU3UV5UGdBo4/rfIujXODVu+Eakby90y4Y4YnqpFdYNY05Mt8i+IsdLzmAavLD/6kqytfZGQc9Yzwo4h4pbb5pXNKCEwLjzsByYAV/S+YyY7bLSVGXt3MRQQUi/3NwC0HRXMOvViXyv3IHDZyyCVQ6/j/ynnduBtXYma/tvJ5sRmBAZy3W25ml6fT/WBdpdNl8Dk3Dj4FmUdGrUKru7ArBboXaRJxqoO9S/0RbnM6Aqgrt2WCE757I0OvZ1ogv6O8x3FREoYi5KNb5FkrvTVbJlfWePvtkoA+yXeyLSNznz5rjnYUbckocxWMEB95mdCxTRE8LEqutrHju2Y+01+7mx4tn2OMX3zUis289wEA6+Gvaz9dsudviru8W7qiQTOki54mdn2vFE9g7NUDepdcWqqSYp2UZlj5/9wlVmYUm7WpNidaY8bqSKOygWAwhLsFzOCGF/L4po2kjLdGHjXKruocgcYxLxtIVm01TP4tIOyRYOBAGArBfAKjmpiuJacTPFTZtYe0rIayI/05r5Bsu+iFPP/k/N/gWQUffMr0yYNFj88HwozKKE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(366004)(376002)(39850400004)(136003)(451199015)(86362001)(6506007)(38100700002)(6512007)(66476007)(8676002)(478600001)(66946007)(53546011)(2616005)(41300700001)(6486002)(66556008)(4326008)(316002)(2906002)(8936002)(31696002)(54906003)(5660300002)(186003)(6916009)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SC9qQ24yVmhPeGNuTGk0bDROUUQyN1ppR2ZuWExPU0sxTjRlWFQxQ212VVMy?=
 =?utf-8?B?bFc4dFRlN0U0UW5aTDRZWVMzTVRsbEpiQitPbFNHZ2NvOTZZajZOUzBtdDc5?=
 =?utf-8?B?V2pEdEoxRkJVM1BYcGlrOFVzUGFDM05KaWhGeEZHcVBpMEp3UEJORzg0NUxV?=
 =?utf-8?B?VVNqVkpBRXBCVFVtM3lYMVRIeW1tQTVZdjNPWmhXbjlCNUE0SE1PRnpJcklW?=
 =?utf-8?B?b1lPMjlvVm1hTnBMcXVBNHhaY0hYa2pwdFRKRkx6REk2alpjWjd3R2pjalpB?=
 =?utf-8?B?amhoaXZ3dHY1N2JwMzRIRnYwTjVueHRsTFJib2x6WkNsajJMUHhsOXFRTmFY?=
 =?utf-8?B?TzVRR0RPVnUxV0dLT0FjMlV2cmNmRnMxZGtNNW03elJvdFpUT3lyN2Fvd2pQ?=
 =?utf-8?B?M0tHSDZmaEgyZ2pvbFZRTlJFOHBWLzhBbGt6MlMzMzJ5U29OVThmUXFHb0lO?=
 =?utf-8?B?aVFmWUs0OWk1dU5EMkhPc3grQWFzbjgvcGNmUXFIaERZS090VTJBc0lmdHhI?=
 =?utf-8?B?NWpjNm9qNGFERGNmb0Z0QkxpdTZCNjlxV09Vc1kvazlONTBPR2F4alBVVitJ?=
 =?utf-8?B?UlowTHZISEJkajJ0d3BsWlZTa1c2RmRQRFhjWk5ucVJITWxoaDZINGVqeUFP?=
 =?utf-8?B?MGZ3a3hIL3IvbEpXOVlMdENnbm9LbVZXc1dnMGxucUdrOFNjaXNkUm1ydHpW?=
 =?utf-8?B?YmZyRng2Szl1NEJOOXRYbDZDeHp2SHVHUzJVMUxvWHFNVElSbThIRS8rYllT?=
 =?utf-8?B?QlR4RmFrSndWTUxjUjdMVVY2VGE4Z0VCZ2lBYlIvYUo1RzlJaTF2RC82WUFJ?=
 =?utf-8?B?QTl3OGM4RmJjaUtCZ2RrSjFGNHVCY01vWDZubGJQaVAzZHJVN1FCMklXOWVj?=
 =?utf-8?B?OXlvVEl2cEZISXFYcDBudkFoQzBOVGNhMHB2YjB4L29BTGdoR0pjaXZscnYw?=
 =?utf-8?B?Q1VhUkFDVmVWNGVJOVRRWE8wM3lvOXVid09RdG8wNUJKL08ybFh2aWNIR0gx?=
 =?utf-8?B?U3VSTk9OaWlobHN0RnVwUGxPMjZPYU1wK3BqQzNzNUZvVGMrd0cwWGR2WDZr?=
 =?utf-8?B?RDJHYU8xY2k2elpVTHVkRTRCU2hMcGRCWGl2aG1WbXcxTk01cGtTOU95dzBa?=
 =?utf-8?B?eGl0VGNQeUVnYkN6U1l6NnlobU5PcTE3dXZobXJ4NXpqSDRrL1VMTlhxY1FU?=
 =?utf-8?B?VGYrdWVxcVhseUdzSXJEVllKeUxlSlQySnQ0TU5zMzc4bE1mdjBjbWpnQXN1?=
 =?utf-8?B?U3FXSUp1Qmo2dFhwNm1MaEJvYjRPcWQxc2tSOW9EZUlpNml1MlZYZzNLUmgx?=
 =?utf-8?B?VUROcjJoczVMK2x0dy9XTnovdk40ZEhZNkVBV0pTU0phNHdBV0RBRldOOHhH?=
 =?utf-8?B?WWd1QVNnY01VanBGODVvaTNjd3VpeStzWEZrUWhxcnFqVkdvdnVtbkFPbkdG?=
 =?utf-8?B?MjFSemF0ODVTSFBIUC9iYmkvZ0tyNHBKWG1ubGRyV3l6bzVVRmFyZjRQbVhi?=
 =?utf-8?B?STNOZGF4NE1QOHF0UGszcktHQWFzbURMRmx6Sml1U2hJaXpmemo1UVh4ZnBR?=
 =?utf-8?B?blJzSE9zQmU0K2krN1JkdXRHN0psNXl6dVpDZU01aE43Yk9MOU5aM3JDUmM3?=
 =?utf-8?B?K093N2F5RUV4cVZjcTFPR2g2SSs3YlhlTHBPaGtFM0pTTzBqMCtaRTE1dHQz?=
 =?utf-8?B?Zk55UVExRjB3SlRCNEYxcG0wdUNBT29GUDNRa3EvTW10SkVDZmRaaklwYjI3?=
 =?utf-8?B?SUVvTDVJeWJmVDBLOUxNWnBTSEJMWEVaa2NyQXVoL0ZIRExIeDRweW1PeEF5?=
 =?utf-8?B?RDRHR2h0U3R6OTJZRXNFbW5OQ2JFdHpmcGdCY0ZrMmNQMURZS1Z0VVpiOGtU?=
 =?utf-8?B?azRsaTBvQU8vU2VBUkJ6c1JoUHViSm1OL3BBWmpLc2ZNeDZTblNNRDNOUUpD?=
 =?utf-8?B?eXZxZjQrMC9CSEJmSm9nMHJ6ZFRJRkhVdkJXa2hTRm5DTEJWK1BGT3hsWFBZ?=
 =?utf-8?B?MmszVlB4NmNCZVl4dFF1RmZFVTRab1FianR6dUt1TjhGZnNrbHRKZ0U3UGFj?=
 =?utf-8?B?ZVNkV2NrekVkcU1Ka3VLNXYzSFUwNWtOa29QbXE3Mjd2dmw2WHR2ZE1YNGhh?=
 =?utf-8?B?Nnc3Rk9GUjlvNDlkMXlUNFJkVmlnaHh3bVZGMSszcWtkN2p6ai9OM0k3Wkoy?=
 =?utf-8?Q?ELQ1wg4ZCYYQXPR3KuM92oaTTnadE6lUPPRntI+gJRZq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10d7429b-450a-41d8-6975-08daac2b7176
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 08:26:21.5690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Omrkx5g8RL+Zteuoq3IGEaNxpLJ0uDNtKT2Yn2loWSBFkRqGeN1z4gHIFNXBDuvwPBf88OD40k3unHnZ7NyEsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7264

On 11.10.2022 18:02, Roger Pau Monne wrote:
> @@ -140,6 +135,7 @@ __UNLIKELY_END(nsvm_hap)
>           */
>          stgi
>  GLOBAL(svm_stgi_label)
> +
>          mov  %rsp,%rdi
>          call svm_vmexit_handler
>          jmp  .Lsvm_do_resume

Seemingly stray change?

> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -973,6 +973,14 @@ static void cf_check svm_ctxt_switch_from(struct vcpu *v)
>  
>      /* Resume use of ISTs now that the host TR is reinstated. */
>      enable_each_ist(idt_tables[cpu]);
> +
> +    /*
> +     * Clear previous guest selection of SSBD if set.  Note that SPEC_CTRL.SSBD
> +     * is already cleared by svm_vmexit_spec_ctrl.
> +     */
> +    if ( v->domain->arch.cpuid->extd.virt_ssbd &&

With this false, can ...

> +         (v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD) )

... this bit ever be set? IOW if the former condition actually needed here?

> +        amd_set_ssbd(false);
>  }
>  
>  static void cf_check svm_ctxt_switch_to(struct vcpu *v)
> @@ -1000,6 +1008,11 @@ static void cf_check svm_ctxt_switch_to(struct vcpu *v)
>  
>      if ( cpu_has_msr_tsc_aux )
>          wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
> +
> +    /* Load SSBD if set by the guest. */
> +    if ( v->domain->arch.cpuid->extd.virt_ssbd &&
> +         (v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD) )
> +        amd_set_ssbd(true);
>  }

Same here then.

> @@ -2518,6 +2531,10 @@ static void cf_check svm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
>          vmcb->spec_ctrl = val;
>          break;
>  
> +    case MSR_VIRT_SPEC_CTRL:
> +        amd_set_ssbd(v->arch.msrs->virt_spec_ctrl.raw);

Would seem cheaper to pass "val & SPEC_CTRL_SSBD" here.

Jan

