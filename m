Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0E3490769
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 12:52:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258138.444221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9QYG-0006V9-Rg; Mon, 17 Jan 2022 11:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258138.444221; Mon, 17 Jan 2022 11:51:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9QYG-0006Rt-NV; Mon, 17 Jan 2022 11:51:56 +0000
Received: by outflank-mailman (input) for mailman id 258138;
 Mon, 17 Jan 2022 11:51:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZUQe=SB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9QYF-0006Rn-Gc
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 11:51:55 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd7b833c-778b-11ec-a115-11989b9578b4;
 Mon, 17 Jan 2022 12:51:54 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2051.outbound.protection.outlook.com [104.47.0.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-6RZLI7S-O_q-s7KbGKGqWg-1; Mon, 17 Jan 2022 12:51:52 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Mon, 17 Jan
 2022 11:51:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 11:51:51 +0000
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
X-Inumbo-ID: dd7b833c-778b-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642420314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oc0MSvZetPBP31Vj6TBKcISpXRgjS84LLAn7LVAlxKY=;
	b=jUfCopHh55xXycItvUICJf+HKclrPbjDaDHCN2fMzGUbBYzM5Cd3JQZ/a7c19fJcTc92Dm
	3YLnOGL4JakPnK3OojGvTYAzlN6Qus/ckT3WZnLXRA3ldIAFDRt2/CC432PXguusT2WlPX
	VNfcw2Jwe/Gj+CuHsqt75GOljf+WK6o=
X-MC-Unique: 6RZLI7S-O_q-s7KbGKGqWg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aR0wlAnndNEuBsU5y3qMbTukLTUzQL2EXOBwDWJeIswPMrIu5gulSh4FjNsI4YB71G++B+qZ9PGIsvTjV31Xvrq0EkXbvk9fOUiMzE6RGpxTXCg0VmbV8Lq8lMxLGVagaNl88iWM2fBTrXR4W9rLW3uOmUd5y0aLIKFMhgWF2D7kIadrUsWVJbrBcvic07B4o8xHGKaco8wIsGjvUWwnsY5ARGA8yf9LDwhatLGLcsx+3XQlSDLn6wFViPGiWJE2lB+KdpPKzMzWY8QsV5461IAbVsQ1O4n1Ufgm/Og77/6klYOjXhog2mBnLhnCwVbA/fz7H5js55uPuZC5+7ISng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oc0MSvZetPBP31Vj6TBKcISpXRgjS84LLAn7LVAlxKY=;
 b=ACmnIKv2IGgUOh7w1xb+w1M7P7ZhVF43ebiK403CS/0g2fQNOd33jiSGkgDxvzFmVuR2NVEk5TcvYxgHtewV3xLj+Tfh5fFCE3UIYijLEyvN3QHdswC0ZcxZV2phxNhkKjR4ZqxD3rnXXS5LkzcaW1g8LmB3XbRCSdxuHjb4JwCfBbeLJlVekjzi5QMcik7A8U6g7qJS0XwV6EoU/DyzTnn43yw+ZIEbrJeZZsqgUVSf5RVblZzj20PKrrWXF/HXCCj11k3+WXFf6zXJT65LfioIJe0akaQQwZTFkblOOTeNiIOwF2E2TAjajl0zkvnpB0uNiP/CB3rRWe4W9Mtgxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5f2c932b-8e30-b636-76f9-d4b27a9f477b@suse.com>
Date: Mon, 17 Jan 2022 12:51:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] x86/spec-ctrl: Fix NMI race condition with VT-x
 MSR_SPEC_CTRL handling
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220113163833.3831-1-andrew.cooper3@citrix.com>
 <20220113163833.3831-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220113163833.3831-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0082.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94ff01d4-c34a-4f0f-bc75-08d9d9afbfee
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB835325EEAE31732AA482FC3CB3579@AM9PR04MB8353.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YwvHBL+Zyz29NEnpshTnqfRVBuek/To9Gh/Flcis8Ykd5vDaz35oBusZ4Ld4zZBdRhNIUSvbrFtnzWzxcy/AZ/16r8V88e59yEKQIyDQGkswJQ19c0Z13MLJj/nUeVBpiNk6bq1ii3kTRoGCQUKiMvh+oTkQOhM0+7RMOgdkdgm6ZvC60zEXP+IZXo9prkFrxwHm7OluQn88dDnNlY/82vXU/VQsVFy11IkcWKi9vLxbNFjTtkPwS8iHNSOjnrA4cg7xNJk6y9o61oZlrLAp3fh00ZWm3rMIXDd28qvCZbJTcNla1uyJE6+Ua4Xd/X5lW0pq1Z3xfUqWT2ErfC6mVdPx/Ip1R5VmXH5Xos5HNg3f6GVxuRBGL+PKvgo9lqla3RGm8UcZJq1Q+clQ2ZxZyp/voi9/kopRtjZSa45udu4MbFVKQYuXPQld0eM7zlcbNXZa66rNqdBUP2pi1aZngaxvYRds/W2d+7H8ZhIxT9/KRu80WOgsby1wC3klo2s50g0aF+DPNat07xfxpUIl4++Q7bhxchFtHwfayxVEIqIO0hipDqs9osO32LI3xI8eeRura45iQcbH93AsJ2bgx/EvxMPOcHfdn3HjMvMI9FuJW/K17wEliEVvF6WrXAHLWnxR4nJHTZ3KoE04p4flXiuP0J2LSaFbcpXpPOiJKvTKkqBpMJlgLlBrFealqshEQGNDtRyk7zZoRf0a/tLiqkLkiCUdZjAEovs4spJlcyY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(6506007)(2906002)(66946007)(54906003)(36756003)(6486002)(86362001)(66556008)(66476007)(6512007)(5660300002)(4326008)(38100700002)(316002)(31686004)(8936002)(508600001)(8676002)(26005)(6916009)(83380400001)(2616005)(186003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QU9nT08rUDdPYmJ0cW5GU0U2R2tSUVhneDBZeHFnWFQyN3ZMVno1bUFudXRn?=
 =?utf-8?B?bGZzMmlYUmdDUnhTbXZTWHg5L2E1M2dDVzdsajVkS3g3ZWtuUDdHV0U1WUlC?=
 =?utf-8?B?ZmNVODlNNWkyeWpzRTkrdlVISnpNYUh5T0d1WExuRnpIdTQzVTZQQTd3MDFn?=
 =?utf-8?B?alc4TmswVnpjQS9aeUozTWc3ME5hYWRSTUpjaVBxUWFCd0IwR0lkMnZISU5z?=
 =?utf-8?B?bjM5T3AwNHI4MTQ2RHNYZi9uSmV2TlBiMmpoZVBoMExQNDgyekNJMmkxSVFv?=
 =?utf-8?B?R3JxSnBROGg4Yld6OG9vTllGVDBZZ2NvZUlKM0FJaTZBbExCMlkzbGp2Ny9w?=
 =?utf-8?B?YURHOXR0ZTBYUjV3WkZoa1BuMWd1MXVJQmZGblNsV0FZSmptNDlqdUxyWTFh?=
 =?utf-8?B?SnRqTnF0bE9MalFVcWkvZ1NkWXdNMEFtS3REcndZaVMvNE1sZUdZZkdRQTc0?=
 =?utf-8?B?djFjc3FmUUliT1JFTkJlKzVkeXZySXJSR0hYWjNoUUFEbkh6OU1aTzRqY3dF?=
 =?utf-8?B?MFBEOC9HU3Iwc01BSXkrN05wQm5OYTFZT0ZLMlRwRi90TFZySkI4UzFoYWZw?=
 =?utf-8?B?QnZIdm01amF1WGlHZkxlcWM0em5kQys2K09mRUhoT2IvSDg5emJ1ZHdLeUVR?=
 =?utf-8?B?TzdmUGFYMHBySms2NDYraTE4RXgyc3Bxb0owOFhycFAycTdhM09tNEd2VVRl?=
 =?utf-8?B?d2x1b1JkRTRGWE1yMmZFeFVRc1p0bXZhR1lYZHlSaFNrUFROcmVXWmpUK1lZ?=
 =?utf-8?B?N1pnTjRkNjZURlErdExZZkZaM1RBaHA3eE5KSXlSczBNNWxvWkp1dWFVK3dz?=
 =?utf-8?B?bEVIYW1heTRnWERLY2wzUnBzZ3BpYVR0eVNSQWtBSEpHbmI1aUFhNFpSc0dt?=
 =?utf-8?B?M3F6UVRtaEFUUEVRSFFCVTh4SFB5WTd2a2ZGbWw4UDUrTnV5Z0F3cUEwbVJD?=
 =?utf-8?B?b3ZjZEg2WGlFbmQxQVFhVE9oL1VzUTZOY0RFZXZBRytuemlUeDFKTnVtVHBa?=
 =?utf-8?B?NnNKZkZRSFpTREljTE1maVVoSUw1Tkk0Z05oWHN5b09qWVpIa0VXM0dsbVFS?=
 =?utf-8?B?dUpEUC96dXdQWkt5MVVCS2hCMnN5WmdRazh3eCtNb0w1SXRWS0pVU0pVNVlC?=
 =?utf-8?B?cEZleEpPNnY0aGZnRVl0TVJJVnhKOWZ2MFZ3Mno2bDhRME1iTVRWL1owMzRi?=
 =?utf-8?B?aituWG5qUXdZVS9GaFJCejMvaHYwTy9POXMwS2pWcEVUak50YWtOMCtuSnJF?=
 =?utf-8?B?ZlpsSU0wL0tGOU1LaThUNmFiVXZyYUVHNUp6NUltaThFMGJUR1phNWd6SmhS?=
 =?utf-8?B?emZDRlV2VHdpbDEvcjBLRVBCS3NJdVgxeE1wMmp4eVI0UktLQVQrOGw1QkZp?=
 =?utf-8?B?NlBrdXY5WmRSOElWd2lma3V5UEJPN2xFdmpaMnpJWVZrOW5JYnRMdzFpejBS?=
 =?utf-8?B?QWl3eG91bDVDeG9pY1RLamRqSllwZTBKNll1Z1M0T1lMMUZGZCt5NEd2Vk5T?=
 =?utf-8?B?NENNRFR1WVNYcDY1K1ZQU2ZQTjV0bWZQc3p3VzRFOHd1aUIrKzVTSFdhVDFh?=
 =?utf-8?B?T05PaThZSVg5Kzd0cWh4RnBGNFRRWG9mR3lzTkkvcytOQ3ZERWhlN2oyUDJw?=
 =?utf-8?B?VHZRRjZ1VHNUUm5nOVdZR05MYS9xaVpSVnFQZmhPdW5BVVZYaGIrekJoN2lR?=
 =?utf-8?B?YWxyRFh1WFBGNHd5M0t2ek1ySU1OUlNRRk9Ud0tXc1FtSmFkQ3NsZTkwekx4?=
 =?utf-8?B?KzNVRUw4OWhpR3JDKzNwS05rNEpYN3U5ZXJmeExQL0xKNHA3Mi92TldCbElz?=
 =?utf-8?B?WmZtcHFBS1h5NzlkVzZTMWFqL2FIRStHUk9na0VGRlJpWVo5eklYcHY4YkFK?=
 =?utf-8?B?a0RJSzQ1a0NUaDNjMy9KaHV4dlNvbTBMa1F3YUw5SzV4cDVYaEE2QTIxL0Vn?=
 =?utf-8?B?dXh2enZuSTVNVjBrVlh2RDBzV3Y2ZXkyNTVSRyt3c3RWbmd6VnBydGdMM0M0?=
 =?utf-8?B?cGRWOFJOR2NzMS9PYW00WFM5RlpTVUlXWkNDSlU4K1NEY21TMU5uQmhScG05?=
 =?utf-8?B?RnVGT3VBNzYvVGc0MW9YZFJRR1poaUxNK3R2T1k4R3E3c1ZGdjlISGRnbnVl?=
 =?utf-8?B?a1FKVXBDcVp1endsY0l4QTRzcnVrNVZRUk94UnFWRDFZamhyc0ZvSVhMUEUx?=
 =?utf-8?Q?3++y4WCAQSyxaim505XK38I=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94ff01d4-c34a-4f0f-bc75-08d9d9afbfee
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 11:51:51.3843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Na7a0pSfKY/eyiYbQT0lXH80BI9UFSwjEGy86x4syl0bqacApspdHlzwllKy02ICL9t//tP/TdW3TgImwmic5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8353

On 13.01.2022 17:38, Andrew Cooper wrote:
> Second, update vmx_msr_{read,write}_intercept() to use the load/save lists
> rather than vcpu_msrs, and update the comment to describe the new state
> location.

Nit: Assuming "the comment" refers to something in the named function,
I'm afraid I can't spot any comment being updated there. Perhaps you
mean the comment in the declaration of struct vcpu_msrs?

> --- a/xen/arch/x86/hvm/vmx/entry.S
> +++ b/xen/arch/x86/hvm/vmx/entry.S
> @@ -35,7 +35,14 @@ ENTRY(vmx_asm_vmexit_handler)
>  
>          /* SPEC_CTRL_ENTRY_FROM_VMX    Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
>          ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_HVM
> -        ALTERNATIVE "", DO_SPEC_CTRL_ENTRY_FROM_HVM, X86_FEATURE_SC_MSR_HVM
> +
> +        .macro restore_spec_ctrl
> +            mov    $MSR_SPEC_CTRL, %ecx
> +            movzbl CPUINFO_xen_spec_ctrl(%rsp), %eax
> +            xor    %edx, %edx
> +            wrmsr
> +        .endm
> +        ALTERNATIVE "", restore_spec_ctrl, X86_FEATURE_SC_MSR_HVM
>          /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
>  
>          /* Hardware clears MSR_DEBUGCTL on VMExit.  Reinstate it if debugging Xen. */
> @@ -83,7 +90,6 @@ UNLIKELY_END(realmode)
>  
>          /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
>          /* SPEC_CTRL_EXIT_TO_VMX   Req: a=spec_ctrl %rsp=regs/cpuinfo, Clob: cd */
> -        ALTERNATIVE "", DO_SPEC_CTRL_EXIT_TO_GUEST, X86_FEATURE_SC_MSR_HVM
>          ALTERNATIVE "", __stringify(verw CPUINFO_verw_sel(%rsp)), X86_FEATURE_SC_VERW_HVM

Shouldn't you update the "Clob:" remarks here as well?

> @@ -119,12 +125,11 @@ UNLIKELY_END(realmode)
>          SAVE_ALL
>  
>          /*
> -         * PV variant needed here as no guest code has executed (so
> -         * MSR_SPEC_CTRL can't have changed value), and NMIs/MCEs are liable
> -         * to hit (in which case the HVM variant might corrupt things).
> +         * SPEC_CTRL_ENTRY notes
> +         *
> +         * If we end up here, no guest code has executed.  We still have Xen's
> +         * choice of MSR_SPEC_CTRL in context, and the RSB is safe.
>           */
> -        SPEC_CTRL_ENTRY_FROM_PV /* Req: %rsp=regs/cpuinfo Clob: acd */
> -        /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */

Is "no guest code has executed" actually enough here? If VM entry failed
due to a later MSR-load-list entry, SPEC_CTRL could have changed value
already, couldn't it?

> @@ -601,17 +602,27 @@ static void vmx_cpuid_policy_changed(struct vcpu *v)
>  
>      vmx_vmcs_enter(v);
>      vmx_update_exception_bitmap(v);
> -    vmx_vmcs_exit(v);
>  
>      /*
>       * We can safely pass MSR_SPEC_CTRL through to the guest, even if STIBP
>       * isn't enumerated in hardware, as SPEC_CTRL_STIBP is ignored.
>       */
>      if ( cp->feat.ibrsb )
> +    {
>          vmx_clear_msr_intercept(v, MSR_SPEC_CTRL, VMX_MSR_RW);
> +
> +        rc = vmx_add_guest_msr(v, MSR_SPEC_CTRL, 0);
> +        if ( rc )
> +            goto err;
> +    }
>      else
> +    {
>          vmx_set_msr_intercept(v, MSR_SPEC_CTRL, VMX_MSR_RW);
>  
> +        /* Can only fail with -ESRCH, and we don't care. */
> +        vmx_del_msr(v, MSR_SPEC_CTRL, VMX_MSR_GUEST);

To be forward-compatible with possible future changes to the
function (or load list handling as a whole), how about having an
assertion proving what the comment says:

        rc = vmx_del_msr(v, MSR_SPEC_CTRL, VMX_MSR_GUEST);
        if ( rc )
        {
            ASSERT(rc == -ESRCH);
            rc = 0;
        }

?

Jan


