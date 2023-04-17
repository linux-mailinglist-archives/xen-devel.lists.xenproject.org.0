Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC52A6E452E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 12:29:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521937.810948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poM6W-0003oQ-Ch; Mon, 17 Apr 2023 10:29:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521937.810948; Mon, 17 Apr 2023 10:29:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poM6W-0003mD-9c; Mon, 17 Apr 2023 10:29:00 +0000
Received: by outflank-mailman (input) for mailman id 521937;
 Mon, 17 Apr 2023 10:28:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poM6V-0003m7-8B
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 10:28:59 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2047.outbound.protection.outlook.com [40.107.7.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7e3efdd-dd0a-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 12:28:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7926.eurprd04.prod.outlook.com (2603:10a6:20b:2ab::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 10:28:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 10:28:26 +0000
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
X-Inumbo-ID: a7e3efdd-dd0a-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3FHKDYtRITZV+EZmZve6AtnIoxd+ukU0gEAR+UDJgQD6edrspHFJw994OtA3Hq+ys3sMljuAgQMnMhBN1DHUe+kejmHua81DainJWEOTth+Oo4z4ny2yt50C68+Y4Pi3ohNB7vJt0gcGys1oX3IQZax+vTneysrWCF9t1gjeUQLpCbzuRiN/ayzXhDgiYffJ4hRUS6Q6+saxWauhwlASr6HPkV4H565P8aQVdp3/VkpeGSCHDRbqe4XvjcTz9LXrVgikx+gujaDTo+wZ8ElYUhq4ThiwCjDMbc6jQLsrrFUXA14vxfBCDTcasymSNRx4/65c7ufOAKMwGtmc3Fixw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQHT1oZP17QpYfE5QRddGAismzOzCVueQ4OA1oVKvXk=;
 b=Gw6zGCRqsymWAIwo9O2QtEle2zLdH+swiFopMfpxT/ypU10E/32CeBHZRNYj1xKEQZnFgXEUFWHts991WhLfg8kWG553QcvS9ogOV0MkEzwVQVHrxrejzpr1Nd3YqEjb/xsQlkI3GJYBWXhLWsZRLfYy1nG2+ixtZHEnYu2XBmyRMfDSPpUE/QNhu7kxAGHajb6gKRGVNNVC9HLbFp5+lQbgjsa5oqKVgDlguqxqgSgvbGOnzgrvQT2vuK9SDar5W8mYlkNzRWphW09ucfBTJ55j3ubtPs97GoNtJvMPr1cF05Dme3p1nrQT5MBnr/x3hiim4YqvSOcuXPH3ZVvFNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQHT1oZP17QpYfE5QRddGAismzOzCVueQ4OA1oVKvXk=;
 b=LoeQzoxTZ0mANFbxeASw+agRbIc7dNMEJ2bC/UutfDxts9esKklUpG7PJAQ9PN/MfKWFPkn85nu/ueF62E/JT8VxmPRHlX2KCvzO27r0og88UOoTFkEm4p449rla6h7yh9XkQjwdjptf4/+JWSI9G3oC37vYcxIFV19n71XrFHekpurZM63iA+04X/QMyAz07mOR8rarLU9mqyJPFZ1Z9Ca3/rq1AkehMAsqow3WT4Wr5BqiW3jFhf07E5qOoS7CHyaQHcfuaInBQ+or9TND7/93yIle0W4DyoJdtbYsAeSnf9nTFSx6QLxAaSZ4h+V8qY1j03oP8nK9bPXvbkKjbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1cde4c30-bc48-7170-d465-11ed8617449f@suse.com>
Date: Mon, 17 Apr 2023 12:28:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] x86/livepatch: Fix livepatch application when CET is
 active
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230415195816.3717648-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230415195816.3717648-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7926:EE_
X-MS-Office365-Filtering-Correlation-Id: 2640094d-75dc-44d1-ec02-08db3f2e7aa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yby0j/TMz5f2S+qpsIpSGJncRiTe6K+FnWLAQ21WNLIGVoSoHsDlNzy668+A2lyuhKN7Xvhq4wUW8y1tkBMyG/EEn6hc+7y0AwVjsYvD6F0dFxJhgfADAu/hudcfozr3AcGnyOXHX+9y0GMDAANqw/OKb77wMT5hOPNgpQ+HMdm1mwFR+nIHwbbon0Q49jWq3pNmfODoiG3Ikukql97NMxZE6FrL+N0Q8gVg1vwKQNcgbDNq4z/BvKLeIzdkqm5JqDfZDmLmEa43h9qJDh+PxsedoeBYX7u3Xva+lDt7JLEpAVhF0skgIpWtugtRUw1PQm7cQBzyDGzIa+NeCXriSZaZ7TFxTmQIwUji10dZQ+kdgc7OZbp7S8uIzVww1JpxzgczDme3FLWRi+UhamWKpJXoxlfdlHSp+Ng+4dQRSomZR6+MvfZvC7YZm5ewRRhooh+lYjjh2nGjVESII6xzXvJJlTIWtxVMbfc4RVJ0YW9l5g4qOnJWu5dYiMTyIVZ/hSh0sjCFZoGmDynJm9iJDm42nfW2ElO0VasjB6M3hRDcYaDihsBYU/X3Odc884zSckrV163exlxuKdegRM1J88LxkUIr/owAlOTna1DF6QtUkFk6vI86Ez+DavrxSlb9BuOiZrLBelwNd9et/IZtBw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(39860400002)(396003)(366004)(376002)(451199021)(38100700002)(66899021)(8676002)(8936002)(5660300002)(2906002)(36756003)(86362001)(31696002)(478600001)(6486002)(54906003)(31686004)(186003)(2616005)(26005)(6506007)(6512007)(53546011)(66946007)(66476007)(83380400001)(316002)(41300700001)(4326008)(6916009)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STg1alZDb3NOaDVjYzUwMW5ub2Vxekp6Z3phMjhhbTZiZkJXNFpIdDU5by9v?=
 =?utf-8?B?d1NYalJDdytxQW9nTE1vdjRSS1E3UElIamNqUlVOVmZQRlEzUmRiVUhBbDAx?=
 =?utf-8?B?WVNjY0dKV2VXTHM5S082RzNVc1hNeGxIallzV1dMaTZlR1ZEMHdOV0Y1akY1?=
 =?utf-8?B?RXdCTzdldXZOVE1tVUJxQjMwZnR3QnY3dmNGaTY3SCtRRnBaRjNNR0dZWlJy?=
 =?utf-8?B?ZkVFL3BBOG1GZUdtQ2NETDdqZWRPQUpoQVg1TG95aURJNTlUdkM0VDllQzE3?=
 =?utf-8?B?K09idTVScmduU1ZIUEpBRlpYemhQc2dvV0ZLa3ZtazRnWEs0dG1LRlhxemNr?=
 =?utf-8?B?c1JMckZBZEFEWWpFMjROdk1uV0ZPZk1qdGpRaWhxdjlVLzF1T1J1aHZmajN1?=
 =?utf-8?B?dlNxRzRLVDdNZWEya2hwUk5JU3gzdk9UKzNVVUlzTVIweUZ3WFZNamtMeDAr?=
 =?utf-8?B?YjBiQ0dSNzRJYlhRMWgwUjRjMWFCbTVmYzhIU1BtZUhZM1BKM0dBUU5LdllV?=
 =?utf-8?B?YVdVSjl3SzN3UFFMMXhGQk00MHhEOG9WZWovVnMvRVlDR0FscXFQby9aVTR4?=
 =?utf-8?B?U21WTnVjOVFxdzBLU2xNYnB2L0o3T2p3MVQ1ME4zOEpZcEVyeFlNbTNPbGxR?=
 =?utf-8?B?bnhpZHNFWFkrNCtOVnRybEc0Z0dFV3JGQ1MxUHlWNXJOSklueXpLYjBsQXhi?=
 =?utf-8?B?QWthemF2WG1CQWxKbGJHVWc0c0duSEM0N2FLZUhrc20xN2g2TERKck1DdHJU?=
 =?utf-8?B?VFpkM09oMm44L01IRi9CdUdLeEFLenl0Rmx1OGFsRWMrS1JzL3huTXBLdGlP?=
 =?utf-8?B?U2pPQXlKOE1PS0dxZ0ppZ00vdVcxRXNKQUhZWGtJQUI5SFgxenNZWFk4QjBr?=
 =?utf-8?B?ZjBpRE9tZVM5WVJDV3Zpd0VQOE9wSjBpRHVDZ29IMWRyTU5pRHFSdGhaRmpX?=
 =?utf-8?B?Z3VaZ1VhQlEwZkN1enRuaE41Nm5JMUNaM0MzMEVPQ0VxcmlnQ3FDeVJ5bHpx?=
 =?utf-8?B?NXFBdGxQdE9MdWNrT0hveElnWWdYdFZNQ2JscXB1NncrcUJRc2NVVFRwTEsw?=
 =?utf-8?B?SkRudnFxU09jc1F1elk1Q0Z0ZzVyQ2xYQkhNTXRQR1RUTXZnSDQvbmN4Nm1l?=
 =?utf-8?B?VW9SQnlXY3JnQjBGeHg4ckIwTkxLOWFpQjVYb0xXNHh4YWN2RHRpWHZPS0VF?=
 =?utf-8?B?RFdiWFYzbnRsNlNTck9DK3V4eTBxYkRGQXhVV0dUTzFWTDY1b2VydU9haGpO?=
 =?utf-8?B?MUVBdmVaQlYwdGExQWVSL0VuYmtvT2twblMwTEZ5T2VZV1ZaMnpFRkc3SVBo?=
 =?utf-8?B?RWFDWmVPRmNUQWpzYzY2dHcxbm1zRE10cXRHMFdMeHp4Szl3WnliNkd1YTF4?=
 =?utf-8?B?UWZpZzViZk5qUVhSSjdlc1N2Zm1ITzFEc1NkMFZoWlA4YjNZZDB3bkZwbzNH?=
 =?utf-8?B?a2hUV3RkSFYyQXFDVG5CUE1lcGVkKzl2MmswVjBSbGFyTXo5UTQrL0xldmpI?=
 =?utf-8?B?bWlvWFplOXZUMDczZ01Dc2JMaUppOFFncnFCSnh1aDhIM2xuRUYyVkpHanFV?=
 =?utf-8?B?eXlhODA0Ni9OVHNCWmVqWEE3SmRNTFBmaEhVT1dDajlDbUp1WnpJajYyM3VB?=
 =?utf-8?B?azF4Uk5QZnNKTklHQkU5Y3d0MlZGZ2dMejdGcSszWm1NNEZ3aUwvMndvVlBR?=
 =?utf-8?B?cTl2SS94am8rNWh5cjNvaXN6R2NJQzlNeUVIN2hvU01RRUJuRzFEakNUYTIx?=
 =?utf-8?B?RXM0OU8ybjIxRDAzQ09VL0kvN3RCcjcwOGdOK25VMTlwQnlaMkpCZTZmQk55?=
 =?utf-8?B?bzQwdGw0c2NDTFRBVm0xNnA5UENTR0RmSTBQWlRiUlJBVHVJWHp6cThqUndL?=
 =?utf-8?B?dExqSUFRSkExUlhTb0oyeWJmdGU1VHV4OC9LNFFCbXB4dnBPUlVPZDhQbmEx?=
 =?utf-8?B?M0p3ZTFNcUx6WTVBQXcvMnlmUkpUWG5veEFnRDRkN3UzL0Jsek05QThjMGZk?=
 =?utf-8?B?ZDBmLytZTXIxcC9QYUEyeE91L3NBemQyUytiS05iZ0tYaVRwWGMyWlVFNTBk?=
 =?utf-8?B?NGdxR2IxOHZpYnlCbU5UY3Nna2JwVXJuZWNzQThScHFzQ21NQmlLdlNFU1px?=
 =?utf-8?Q?mjlKNDDwWP8meun7XD7963mAM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2640094d-75dc-44d1-ec02-08db3f2e7aa0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 10:28:26.3320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TkhlIJn8Z8NTlSSlvU3j2OPcD/v8oT3izyunj9p1Erl2MIxvo36p4N/i0duSZJSX3fFHJTvkrpt3+S9LMPv04Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7926

On 15.04.2023 21:58, Andrew Cooper wrote:
> Right now, trying to apply a livepatch on any system with CET shstk (AMD Zen3
> or later, Intel Tiger Lake or Sapphire Rapids and later) fails as follows:
> 
>   (XEN) livepatch: lp: Verifying enabled expectations for all functions
>   (XEN) common/livepatch.c:1591: livepatch: lp: timeout is 30000000ns
>   (XEN) common/livepatch.c:1703: livepatch: lp: CPU28 - IPIing the other 127 CPUs
>   (XEN) livepatch: lp: Applying 1 functions
>   (XEN) hi_func: Hi! (called 1 times)
>   (XEN) Hook executing.
>   (XEN) Assertion 'local_irq_is_enabled() || cpumask_subset(mask, cpumask_of(cpu))' failed at arch/x86/smp.c:265
>   (XEN) *** DOUBLE FAULT ***
>   <many double faults>
> 
> The assertion failure is from a global (system wide) TLB flush initiated by
> modify_xen_mappings().  I'm not entirely sure when this broke, and I'm not
> sure exactly what causes the #DF's, but it doesn't really matter either
> because they highlight a latent bug that I'd overlooked with the CET-SS vs
> patching work the first place.

Which perhaps warrants a Fixes: tag at least for that latter change you
mention?

> While we're careful to arrange for the patching CPU to avoid encountering
> non-shstk memory with transient shstk perms, other CPUs can pick these
> mappings up too if they need to re-walk for uarch reasons.
> 
> Another bug is that for livepatching, we only disable CET if shadow stacks are
> in use.  Running on Intel CET systems when Xen is only using CET-IBT will
> crash in arch_livepatch_quiesce() when trying to clear CR0.WP with CR4.CET
> still active.
> 
> Also, we never went and cleared the dirty bits on .rodata.  This would
> matter (for the same reason it matters on .text - it becomes a valid target
> for WRSS), but we never actually patch .rodata anyway.

Maybe worth making explicit that this (the clearing of D bits for .rodata)
also isn't changed here? Otherwise this reads as if you meant to deal with
this as well.

> --- a/xen/arch/x86/alternative.c
> +++ b/xen/arch/x86/alternative.c
> @@ -382,24 +382,28 @@ static int __init cf_check nmi_apply_alternatives(
>       */
>      if ( !(alt_done & alt_todo) )
>      {
> -        unsigned long cr0, cr4;
> -
> -        cr0 = read_cr0();
> -        cr4 = read_cr4();
> -
> -        if ( cr4 & X86_CR4_CET )
> -            write_cr4(cr4 & ~X86_CR4_CET);
> -
> -        /* Disable WP to allow patching read-only pages. */
> -        write_cr0(cr0 & ~X86_CR0_WP);
> +        /*
> +         * Relax perms on .text to be RWX, so we can modify them.
> +         *
> +         * This relaxes perms globally, but we run ahead of bringing APs
> +         * online, so only have our own TLB to worry about.
> +         */
> +        modify_xen_mappings_lite(XEN_VIRT_START + MB(2),
> +                                 (unsigned long)&__2M_text_end,
> +                                 PAGE_HYPERVISOR_RWX);
> +        flush_local(FLUSH_TLB_GLOBAL);
>  
>          _apply_alternatives(__alt_instructions, __alt_instructions_end,
>                              alt_done);
>  
> -        write_cr0(cr0);
> -
> -        if ( cr4 & X86_CR4_CET )
> -            write_cr4(cr4);
> +        /*
> +         * Reinstate perms on .text to be RW.  This also cleans out the dirty

I suppose you mean RX here, matching ...

> +         * bits, which matters when CET Shstk is active.
> +         */
> +        modify_xen_mappings_lite(XEN_VIRT_START + MB(2),
> +                                 (unsigned long)&__2M_text_end,
> +                                 PAGE_HYPERVISOR_RX);

... the code.

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -5879,6 +5879,77 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>      return modify_xen_mappings(s, e, _PAGE_NONE);
>  }
>  
> +#if defined(CONFIG_LIVEPATCH) && defined(CONFIG_HAS_ALTERNATIVE)

In line with your observation that this wants to be ||, ...

> +/*
> + * Similar to modify_xen_mappings(), but used by the alternatives and
> + * livepatch in weird contexts.  All synchronization, TLB flushing, etc is the
> + * responsibility of the caller, and *MUST* not be introduced here.
> + *
> + * Must be limited to XEN_VIRT_{START,END}, i.e. over l2_xenmap[].
> + * Must be called with preset flags, and over present mappings.

(s/preset/present/ ?)

> + * Must be called on leaf page boundaries.
> + */
> +void modify_xen_mappings_lite(unsigned long s, unsigned long e, unsigned int _nf)

... perhaps use init_or_livepatch here? At which point the #if may want
to go away, as in the !LIVEPATCH case the code then will be discarded
post-init anyway? The more that HAS_ALTERNATIVE is always true on x86
anyway.

> +{
> +    unsigned long v = s, fm, nf;
> +
> +    /* Set of valid PTE bits which may be altered. */
> +#define FLAGS_MASK (_PAGE_NX|_PAGE_DIRTY|_PAGE_ACCESSED|_PAGE_RW|_PAGE_PRESENT)
> +    _nf &= FLAGS_MASK;
> +
> +    fm = put_pte_flags(FLAGS_MASK);
> +    nf = put_pte_flags(_nf);
> +
> +    ASSERT(nf & _PAGE_PRESENT);
> +    ASSERT(IS_ALIGNED(s, PAGE_SIZE) && s >= XEN_VIRT_START);
> +    ASSERT(IS_ALIGNED(e, PAGE_SIZE) && e <= XEN_VIRT_END);

I can see why you want s page-aligned, but does e really need to be?

> +    while ( v < e )
> +    {
> +        l2_pgentry_t *pl2e = &l2_xenmap[l2_table_offset(v)];
> +        l2_pgentry_t l2e = l2e_read_atomic(pl2e);
> +        unsigned int l2f = l2e_get_flags(l2e);
> +
> +        ASSERT(l2f & _PAGE_PRESENT);
> +
> +        if ( l2e_get_flags(l2e) & _PAGE_PSE )
> +        {
> +            ASSERT(l1_table_offset(v) == 0);
> +
> +            l2e_write_atomic(pl2e, l2e_from_intpte((l2e.l2 & ~fm) | nf));
> +
> +            v += 1UL << L2_PAGETABLE_SHIFT;
> +            continue;
> +        }
> +
> +        /* else decend to l1 */

Nit: "descend"?

Jan

