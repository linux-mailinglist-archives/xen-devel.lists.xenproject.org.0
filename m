Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DC34AEFEE
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 12:25:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269026.462997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHl63-0005U4-Gc; Wed, 09 Feb 2022 11:25:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269026.462997; Wed, 09 Feb 2022 11:25:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHl63-0005R5-C7; Wed, 09 Feb 2022 11:25:15 +0000
Received: by outflank-mailman (input) for mailman id 269026;
 Wed, 09 Feb 2022 11:25:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFrC=SY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nHl62-0004oi-03
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 11:25:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f288c6f1-899a-11ec-8f75-fffcc8bd4f1a;
 Wed, 09 Feb 2022 12:25:13 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-U4BJNrIxNJKXeqGy4vLthw-1; Wed, 09 Feb 2022 12:25:11 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB3PR0402MB3740.eurprd04.prod.outlook.com (2603:10a6:8:e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Wed, 9 Feb
 2022 11:25:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Wed, 9 Feb 2022
 11:25:10 +0000
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
X-Inumbo-ID: f288c6f1-899a-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644405912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LUPm9P7Soho4UbNgVOVbXKJ0UODsyWCejIETI+XeZvQ=;
	b=lOfWPlhRKmwiJ1YeazJ7vlen5DxkVfcSrJHYozQgN9HdRjwJZdh5wqYfrZBGgIIG9oiDXw
	phqEEJbMZ8E2puIEp3fUeCn2CmkZ3YJ/FjNhm8qFoWf/isqiuRBe535J+MxSnZ4YbYVUq4
	nAV5hgm5Rs5HkK9LojY9k0qAA5gRkqY=
X-MC-Unique: U4BJNrIxNJKXeqGy4vLthw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kb5B3CTNnDc0ClWFkSKaEJz+chOdK2F7KzPFi/FVahsNAa7ItL+AxicKtdvhYfo0IA74y/LoLgLuQswI2EBwdEHM7vMNH1YJwR9DMCOZ1HEOLaCzSEqyOAmbIy+M3Q5WP9cgOoWBUBqYEAVF7pDaIFb33z0bEunluqH3Pfhe8ERcP+0b12CRfTr+HyZgnrwhsFt/EJ6FFBufIPPhMbLHCK0bfuOqc0JsVB8GUe7TUlQrNrh613mW5nyoRz67fnsHTqbHZXTaXggt8lhwN92julxpSSvONVy2haj32beyeWK6otyam9kboZ6UIUdzzm0uBgFG5huETzjpNuh14jK2kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LUPm9P7Soho4UbNgVOVbXKJ0UODsyWCejIETI+XeZvQ=;
 b=TwXU3UIxK/BB3qakySqbdnnDFvYz2ZUKnX+sjI5OsKLONktZQYLHj1MIPQFA5HXcZI+FUNOHBJuEb72/sJ27COP0nfOTV+dvDZqjCB/PACRCVkV/KZJCnL9JIwtLezilioRwethAOvpAw8hKoPADiemItnAcqUdZW+u8UgofGlox56VWqnwIif762ZC/uUtpGJBycL1/6HLV9sO89PDmar2c1KYqw13H80kYUwBKuv0JLuDnMQPV73OoTqj/JKosWDJvD6Dyduf6NcoyknUWx8jH0jNRicwVGzngv1XcAZSXpYdM7A5hi7uLc0scGGn4oXi/lnzY+y9UdttxF5gL3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fe2e94e8-9e46-82be-6e83-391f4709ef75@suse.com>
Date: Wed, 9 Feb 2022 12:25:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] x86: Use low memory size directly from Multiboot
Content-Language: en-US
To: dinhngoc.tu@irit.fr
References: <001301d81da4$4c993260$e5cb9720$@irit.fr>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <001301d81da4$4c993260$e5cb9720$@irit.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0001.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f17d6134-683a-4883-fef3-08d9ebbed4ed
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3740:EE_
X-Microsoft-Antispam-PRVS:
	<DB3PR0402MB3740E5C737A306D8F723DADFB32E9@DB3PR0402MB3740.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rAPhpV3W2iTCSiO8nFC39DvkcyKFF+zPaBHq/04O+Ej8QOOsE7PNZyX9rEThuRGcaFftjWlGrKHTc5csQI6DBefTMhCdntXgZa2+1rASZ6RYeJAS4kPGIxIeIj/3JDaFcxvjaSbp585RvscPmt9+k6rHtcRcIomji1ZpHp1t6Qy/MTUp3bpwP9ScG8JRRtuFxZiFmiy+0JyQOUD9GmJATglaS/FdG1U83DMZE6fzCkI8MSGg9xvaWf3qonjpzB6zM4RvQQ/cbf0FGSMPRpDdqMMLO8CNaVXh+bS/nI9yivlIy5YlI5cd8jk1VSFc5vEqUG3rasX92EBfYOg5hiLqTW+zegOgDZ5zLhxT1vyCLBmd+zZjYHGmELLE1Fzl67JBFENWuvG1WPVN4MmgszC4BMrzi4zTO4P2rNFGHZT5l10rH7urWRrvlGG+tW5XYT1vWeg5FxIYcoPCCmhYGqQLayb0qkWESCD3RCUKiAWBHYnO5p+OQTWDHZOmdh21cJmZcECy2uCIx7D8JlMFCoyeEcUFM7xsSUa7rN2LfbhrhGVoMmC4URlfSqXEN+LYNcuthPuyEtImrpdo41CH4MS1+IFxPw2dJbvn7hJuypQeCdeN2uOo1kItwAy5Px4PskSuJlzjeK/BP8vci9s1ZW+UezqXpsQldkRrc1+yNl4+pcxmbT8M8BLRnFSBHniatjimrNt14myVAzHXVlRrXbuaQQmX1KLONvhRE3eo082iKCFbt0pjSnPOKN0MZ2O8IwwD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(31696002)(86362001)(53546011)(316002)(2616005)(6512007)(2906002)(6666004)(6916009)(6506007)(26005)(186003)(83380400001)(66556008)(5660300002)(66946007)(66476007)(6486002)(36756003)(8936002)(38100700002)(4326008)(8676002)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFlLQ1F2MWpyeXJ2eVNtNlNrTnRUSHFqYUhscUxNYUVhVnZVam9xOWZ0T2J3?=
 =?utf-8?B?WDdvR1NYbCtPZUtDMXpOSW5hTktHQkVBdDVZZ0pFM1BKOHRNSXBZUS8vTlI5?=
 =?utf-8?B?d1h5dFMvdytwVjNPOEZSaFhKVnhiNkY3cHROYzZkNktqYWlJUVh2TzRtd0Nj?=
 =?utf-8?B?K3ZIbFUyOVFQK25LM2R6c2NPK251bkFjUVdDTVh0YW51RTJkVGJMaFRlVlVH?=
 =?utf-8?B?R1VVSHhnZWxabzZRMFkxZFBKd0FtL1cra3JnUDY4ZWRKenVLbEk2eFBudk1q?=
 =?utf-8?B?R004b0FQVGtWSjZ3UjMrNUlOdk5SSEs2Tk5CK3hseWtjMUFKTk9mTlhROU5H?=
 =?utf-8?B?Y2trb29FZ0Ruai9HbWhaSnM0UkVFM0tOOVE1bGJvcDhyMHdSQ1F4bC8rM0JP?=
 =?utf-8?B?OUVXOTRiQWIwZ2tBNk1VbzU4WXkvbGZpSWtpb3lhVXYrelBZdnJ5Y3IxVUJi?=
 =?utf-8?B?NVd2RGJhcVYzR1pPTFpVMUY5VFk4eWtKYjFkd05lOEFWVjVmaVNneHNBTjU0?=
 =?utf-8?B?SXNiYmhsYTlNNEVpWXFvdDdVZGNjQm1TRUtRdVlJVElVRjQxZnMxVjV0aGdK?=
 =?utf-8?B?VTZJZ09KaFZoK1JSb0NWR0dsZ3h1dXA0UEVGcXBzNlVlR0dRd0Jkb2E5RHRB?=
 =?utf-8?B?MUlxTmxGQjNWSHpEL0lBQm5hdU1HZWhiYkVtN3FjMmJsbklpRTcrR0FqbzRp?=
 =?utf-8?B?NlU1MXJXZTNtam1qWHJJalJLN0xDZHl1d2VQNVZyVmIza1FFaThxNHBIOFZy?=
 =?utf-8?B?UEs1YVJVMzE2RHJLaXpaVTc1MFl0UURTNEppVU1PbUtYM0N0UUpsTDZ3Qng5?=
 =?utf-8?B?ZlAraHRyK2xlMFlVKzV1WnFhRnZLR2c0R1hYNDZ6amkvYitTT21YSFhwYjZC?=
 =?utf-8?B?ZVFYUmNSR3QybWFydFZIU3M1ZC81aXU3QnZCL0dCeDhHejI1MHkzMnBBcUlI?=
 =?utf-8?B?aUVmS3M5L3o0TVo3R3NoTmVsd0d2WjR6VTRiS3dQaFRlaTNmWm0zRHNteGFv?=
 =?utf-8?B?d0lQdGdMVExTRVQxcG4zdHRWNGhLcVJLdEZoc2l6U1F2NGZUcDN0b3F5Smcz?=
 =?utf-8?B?dmYzZy9IN3BQUXp2NHU1Qzk0d0pheWdsNjRGbWFXMFdvMzA5dEFmc3BxUEdk?=
 =?utf-8?B?OStkZXdyWU5KZ1lqM1RUZGY2VTlBaVVvckRuemRZSWJiU2s1UnRkbG84Snhk?=
 =?utf-8?B?TzN5Q2t5NEJMS2ZNeW9PVnYwUjJZWmdLZWRNN2NqcjY0c0JCTHowb2NhQTMy?=
 =?utf-8?B?Nm9odjVCZktEcWNPcWRodjYzOENxOUE0UmhEUnREV0J3WHZpNktkcjAxZVZV?=
 =?utf-8?B?WXIxZTNianJ4ayszRWJNaUxHNW9wbVN1M0U0SUlML2lTOHFDOU1zc0xhUFlj?=
 =?utf-8?B?YlVEdVNsYXZ1d3pKZG01d2IwanIzTlB4WWEvWHBLbi9hTlQvb21BblZRajZ6?=
 =?utf-8?B?MFVjN2tUV1BpK2xUNmkvV2lNRmNDc0J6Ull2NlV4REZIK1ppMStkVkNTSHNu?=
 =?utf-8?B?bStwWHhmMnF3UW1sRnJsYitWZTRCYkVWVEhGOUgrc0tLM3hvWXdXU0xTbkgx?=
 =?utf-8?B?ejZ5eHhYODhQODhYUXgxKzdPYlFUS0k2T3pLQXVaaDl6QkRwZm1HSVp2bEYy?=
 =?utf-8?B?YS92ZGQ5U0FyNnR6V3RYZ2F2NVNmTGZUakl6aC83b1JQZXkzYU9pcGw0WWNs?=
 =?utf-8?B?OGovWXF5aDhQN3A4dVpTeWduZm9yMlk0RnNtOHIxaHZzQmFhaW9wTTlHbTNk?=
 =?utf-8?B?VmFOa2owako0QXpxZkRDeUdONHhIMmZwUmVjMTZXRmJuNHp4V21BMnJ2SGJP?=
 =?utf-8?B?Zm1TeVJNdFdpNEhvTUdBQTd3VFdJNnc1OUU3MHAzU2dndm9nNHZyWUdaRFNa?=
 =?utf-8?B?dFNLNHprenN5SGU4WkplSWpPeEErRHU0VE9aTjlyOUpLRjBMRmUwQ0pmWk1w?=
 =?utf-8?B?N3pTeGhSOGtxL2IwVElsVEZGakI4WjZUQmY4K290OEFMRW9pdHZzek9uQVhN?=
 =?utf-8?B?djJnM2l4clVWTWgzNzdTamVsVWlUOFY5TU1RWTFqOHZGM05jMnJpb0FVMVUx?=
 =?utf-8?B?MlNVQ0tPRWVNeHQyWnlwemxBVlN0L2REMWl6bEdxcjNHMzdROVo4NDBpdVBD?=
 =?utf-8?B?MnB4S3h5cTJsalBmSFM1VmdFVWRJRVI4VzNPQ253aGM0aXF0Yjg1RXhGRnZM?=
 =?utf-8?Q?bZU56qkM3IV8oCDTg5g7nWw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f17d6134-683a-4883-fef3-08d9ebbed4ed
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 11:25:10.1128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gT5WHVpTLhzhJOwgtxSEAcRMXvN1mDuwDJADuDx37FDLQkFLs2I+QbifV0atoXUiu/EEBo/uJPR1mmPenR7qIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3740

On 09.02.2022 12:00, dinhngoc.tu@irit.fr wrote:
> Previously, Xen used information from the BDA to detect the amount of
> available low memory. This does not work on some scenarios such as
> Coreboot, or when booting from Kexec on a UEFI system without CSM.
> 
> Use the information directly supplied by Multiboot boot information
> instead.
> ---
>  xen/arch/x86/boot/head.S | 30 ++++++------------------------
>  1 file changed, 6 insertions(+), 24 deletions(-)
> 
> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> index dd1bea0d10..31a0663e6d 100644
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -524,33 +524,15 @@ trampoline_bios_setup:
>          mov     %ecx,%fs
>          mov     %ecx,%gs
>  
> -        /* Set up trampoline segment 64k below EBDA */
> -        movzwl  0x40e,%ecx          /* EBDA segment */
> -        cmp     $0xa000,%ecx        /* sanity check (high) */
> -        jae     0f
> -        cmp     $0x4000,%ecx        /* sanity check (low) */
> -        jae     1f
> -0:
> -        movzwl  0x413,%ecx          /* use base memory size on failure */
> -        shl     $10-4,%ecx
> -1:
> -        /*
> -         * Compare the value in the BDA with the information from the
> -         * multiboot structure (if available) and use the smallest.
> -         */
> -        cmp     $0x100,%edx         /* is the multiboot value too small? */
> -        jb      2f                  /* if so, do not use it */

The comment here is a pretty clear indication that bad values may have
been observed, even if this was only in the distant past. But we have
to not regress even on very old boot loaders.

Is the kexec case recognizable by any means (including to distinguish
kexec properly communicating the value vs it not doing so, as iirc it
was said on irc that this didn't always work correctly there), such
that we could skip using the BDA value in that case?

Jan

> -        shl     $10-4,%edx
> -        cmp     %ecx,%edx           /* compare with BDA value */
> -        cmovb   %edx,%ecx           /* and use the smaller */
> +        /* Use lower memory size directly from Multiboot */
> +        mov     %edx,%ecx
> +        /* From arch/x86/smpboot.c: start_eip had better be page-aligned!
> */
> +        shr     $2,%ecx
>  
> -2:
>          /* Reserve memory for the trampoline and the low-memory stack. */
> -        sub     $((TRAMPOLINE_SPACE+TRAMPOLINE_STACK_SPACE)>>4),%ecx
> +        sub     $((TRAMPOLINE_SPACE+TRAMPOLINE_STACK_SPACE)>>12),%ecx
>  
> -        /* From arch/x86/smpboot.c: start_eip had better be page-aligned!
> */
> -        xor     %cl, %cl
> -        shl     $4, %ecx
> +        shl     $12,%ecx
>          mov     %ecx,sym_esi(trampoline_phys)
>  
>  trampoline_setup:


