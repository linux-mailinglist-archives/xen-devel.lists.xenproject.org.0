Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B4C4B73DD
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 17:47:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273449.468643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK0yS-0002Hi-T9; Tue, 15 Feb 2022 16:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273449.468643; Tue, 15 Feb 2022 16:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK0yS-0002EV-PK; Tue, 15 Feb 2022 16:46:44 +0000
Received: by outflank-mailman (input) for mailman id 273449;
 Tue, 15 Feb 2022 16:46:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p95L=S6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nK0yR-0002EP-6C
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 16:46:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9f4209e-8e7e-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 17:46:41 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2054.outbound.protection.outlook.com [104.47.8.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-czT-rb2aPdyUCBZ_VEyYIA-1; Tue, 15 Feb 2022 17:46:39 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB5212.eurprd04.prod.outlook.com (2603:10a6:10:20::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Tue, 15 Feb
 2022 16:46:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Tue, 15 Feb 2022
 16:46:38 +0000
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
X-Inumbo-ID: d9f4209e-8e7e-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644943601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U8inlhwNEt2P04YrXuqFHUIjMp/G8CmrvHaCp+hNFLU=;
	b=VdbPrghS4vlJOGxgo+gVTdGTuEI32B98S2Tpelmbbr1aeNyuddl3jqYkT+qeIV3HIYgt36
	Mq2iJAqlvKKCSKehHdCuDO5Or4KrJxugB1J8WkAC2M7Js6ApShalOyfVKZZPK66PlAJA4k
	UX9/oRU/BGKg4rne/i2BF3A73U+m9HE=
X-MC-Unique: czT-rb2aPdyUCBZ_VEyYIA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XA5uwhJPWHJYEH5PJaASoAZ30tweUiNtLkWTu9a0Nl+NQtSRxfLprUZsny77qeeCNuy6P1v5EgLpMfkqT+TLrmpaXS35xhhtvtL/TFbmemT7yO3FqkhbFBo/DlCV2/zQuv1WSUjWmEbcs6b9adQCwftbihDlj9ypTufMe2IMZZDaMQFVV4B2xZaKqjimYJ5n6tdVP67VrlVllZYr7UKc8hmz7xZpFGte9rzfzZYPwE2JEGQUzM/oo7BRubDct5Or+NUXn9FTdYS3VEFFUtXn3m+ZuB7drsSXa0ojAk6fVk9PGfcmKKW4V4I033NglIaf1mB0ilLri+hbVKDwZEZ7+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8inlhwNEt2P04YrXuqFHUIjMp/G8CmrvHaCp+hNFLU=;
 b=oE03AeRfXlXuARz7YyeVEgRP9UbwRognXldrjoamoDzlJVKJNLjAo9bqAbb1Vqtjq1iRO6hC6F1P2dd9w2qclV2H/K89YphkaOGEbZnUlwkFW62J+doDCYdGE/EjLTB4aaoSmRFB1b1qALFx/biXmFR/lm8mfybdC6VXZ65cB50XyuNdAQGBN9Ytj5VpHMoAg1Mgm3tGBbDb368JJ5ttQ1b1KEAwXEUTIv4cpxlSanOZklXR5n6ZkjGByBW6waolE70NsWSIzDT5pwyqTCCGCrvjBn94A0Il/hGH70Fviv2SBKdEn4YNfA9D+poOMGxbbmno3cVfDD7fJN25vSpa4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <79617697-307e-b19b-71a9-7c8554aec481@suse.com>
Date: Tue, 15 Feb 2022 17:46:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 68/70] x86/setup: Rework MSR_S_CET handling for CET-IBT
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-69-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220214125127.17985-69-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0025.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e692ada-8383-49cc-094e-08d9f0a2bc6e
X-MS-TrafficTypeDiagnostic: DB7PR04MB5212:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB521214340C0331BA96BD4E0EB3349@DB7PR04MB5212.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/W9rRYlWABQZyAJ3xRNUZdEXhafxVL2PkBKHh8S42tzYo0KRW5lt0sxvKfra1Zaf95jrKPN+jZDgeF+ELMY69WH22G6ttATX8mBzvPTz399nLdoWRIAAMpwJxa64Z12fUII0xkQqf3sTjOx4U9hlF69goBePaNpJiWUDkY8h396kSiZ/hCtlRjYECUN+EUWINpyjDUwBRn1MjwMMSFCVFVG7EhIZc/HnRMWFtoJtUntPYzOyVtgFuWrecjdTe4VWQ8NNlJO953T3rH7FAsswE59n8Tjz4yaFkA6Agw9EmgP7Vd8yOlgc1KRjGcbbkkdKQFqRi9LO05xdopTfzo4Y/sv2VDcymiUqw22wiKUv0FevxOTXYqkmvSWvEKiwmX2oXN/U+qWcCyo+ibp8FIqtYYRT6Lsa8FRw5gOG7/Wkc7cQql8qVG+iCYwWY5Tr18QHxDrrp61obSowTX0EvS+CfC6iO9jh8iQmIE2vB+lwUGXZElETynnHI3TOSASV6Uii3XAHOX8Dnq88xzVeqoag3qIfMKLAuoR7cvEkvUcix1VvUmHKNTPtfSFtOgtPrk+r+Gzq+zpbKQ5SUjLiMVW+3csJsTZSHSL+ct9V1F2+G+bUPD0SK5W6N4Gftie+CBKs+6d4l12ylaIKxb3w9iGLnbXHduOC+wuirfL3t/cYdVQTQwOX+tSgoqKlEnpaEvp3UWFescloKo7ytt1MRBFCvh3Q7AdAEDngVwTZjJzVnBtvsw4RLxMjuwH0Hj1SjM7h
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(66476007)(66556008)(4326008)(6486002)(86362001)(316002)(508600001)(6506007)(53546011)(5660300002)(8936002)(8676002)(83380400001)(31696002)(36756003)(2616005)(2906002)(6512007)(26005)(186003)(38100700002)(6916009)(31686004)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajArNTZESUVpUFVtNXViWStSeGk2aDB6Wnl5VkN2ZU5UdklPQkd2ZGU4WmFV?=
 =?utf-8?B?R2s0TFQyTGExdnFpRFdaVmNzRldLdlBaSjlRNm04RklQdC93WXJkWlVBR201?=
 =?utf-8?B?bVdpcnJSQnlqMVpHSXVybm9JWDloNTdmd0RzMTNEakhDMXhTcWRHTW5BTUl5?=
 =?utf-8?B?WGtnZ1pENDhVVFhic2VsZTZibmpQTXJWNUlNQnh4WVZOMHNNd21xMEhBZjda?=
 =?utf-8?B?US82eTJ1OUQ4c0JmN1haYmVkdEZ5UGNqYzJXeG55VnQ3U0hNZFFTVTlNOFRO?=
 =?utf-8?B?Q0pZZEdmN09YVnUyOXg3R3c5UUlhc1hlbWdOM3JOa1Q5NHJtMzVsTHRicXlw?=
 =?utf-8?B?S3JCSmdTekxsZnJoRldNUVJjNG1OZzNQeXVocEdWTjAxa3hZV2k5cm1ZUHdJ?=
 =?utf-8?B?ZHhETnR2ZXpUbFR3R0svQjJyRUZOZStTSjUxdmJBNlErL3BEMGQrQVhTVzNO?=
 =?utf-8?B?Skp5ZlF3YnR4Uy9uT042b0x6WVpSU2x3RmZGNUloVDdncWM0cFdVMmtKVWRV?=
 =?utf-8?B?VUt5V0JyMFhHMWwyYkhpcHZaelhENFNFUVpyYzV4M010L3A1RkN1VWRCbWV1?=
 =?utf-8?B?VHFrT3hmRFlOV1BrTFcyMEEwQmoxeHRObXdiM2syS3A5MjJJV2JISjUzYnJt?=
 =?utf-8?B?MzdFYmtGTEp4dHl6U3o5VFFJRHFhSlRkOXVrT2hUV1B2dXU3SWRjM29WeFRQ?=
 =?utf-8?B?bmNMQy81NWZJZ0lNcUk1S0dscEFwUHVnbzNVQ1cxWERsSUYvT1dYVERoNXpZ?=
 =?utf-8?B?b3VWeGhwY1JIcm9pL2xhTUpPamUyaXAyR3ZRdjVucVAxRjQxYjJJYXBOM0h1?=
 =?utf-8?B?OXFiZ0Y0NUFQYkU1RTBPeFI4dUlPdHM0Tm80RnFJNHMyby9UVGlBbWpnMExl?=
 =?utf-8?B?ZjIvcHNzdlhRbXJIanY3ZGNmdXlJZC9sZDhVSHE3UVFEZ21HQmFGN3k2WnVo?=
 =?utf-8?B?TWZIeGdtWDdLL3MrRWpUY1lINHk1MTd5QmVMbFR3NEoraVR1V3hqZkwxNkRq?=
 =?utf-8?B?WDQ5V0tWR3ZNV3diWU1VTENRdzN3dWJVYTJTRVdoMGlMcWhWL0NDYnNzNUp3?=
 =?utf-8?B?RTE3c1g5dEVYTkx4SDFQWmdrdXIxRHZIYXNKbHA3UmVjSW5XcVA2YXY4TWZ3?=
 =?utf-8?B?V2VuLzB4aVNRNFRWdG8vY2hCQVdKUFZrUTA4dk05c21rSk1FSnQvcHp0cHp5?=
 =?utf-8?B?WHRSZy9HOXFwckkyeGZTdDV4R3FmVGN2WFdkZC84dkRQWllXRVo2djZEWERq?=
 =?utf-8?B?c0dVcWFoenFPV2FFcnliOWpMaGlSSnVIY0ZZTmFZMlByZUlhSEdKM3dMcXZX?=
 =?utf-8?B?K1NRbHczNVg2bWZvSlgwWXZvSU9WaDhDdmozMHF1WEtLK0hiaWZpNlQrVnhF?=
 =?utf-8?B?Qkd1Tk54T1lra3lRZERRUmJhRzh2RzVubkpEUnhFR0liS1NXY1UvOUJGZ253?=
 =?utf-8?B?UkFzUnI3N0VNbWVjdElvOUllbXowTTloSEh2ODdlSmk2VUJVSkprY2FGUjdO?=
 =?utf-8?B?dlIyMkRSa2hhMUZtRk1uV0FnM0pjUWJOb3BiMWNZbnZLVjVBNWhjR2xHVCta?=
 =?utf-8?B?SzM2cmlxSUhvdFM5aHZoQ3NPdkdSb2V5NXdUNEV2eHlLOWQ2UEd6OHJZOUlF?=
 =?utf-8?B?Nlg2WHZSZ3VGTlNYTjVEMVVUcXRFQWl1T2Z0WDdCeHYzM1c4ZkF4TUdxK2pn?=
 =?utf-8?B?N3YxYUh4WU85VHVGdkNjajE4Rk5UVFRyTWFPNjh6THpOc0FPS09vMmVHOGd6?=
 =?utf-8?B?Z01lUFZ2TjFoNEZKTkJtanBna0JkSU5mRjE3M25nWTRwTzlNMmF4VXhBeW00?=
 =?utf-8?B?dlNPYUxLb2YrK3BKWUxwQTRMbW1BWGxXc0xRYU1rYWszNUNTRnZKS0VRbHFa?=
 =?utf-8?B?YWRQU0hnUFNvQXJZS0xvOTlHL0JCdWhzR1RSYzVRalliTlNrKzVkMDlIODJh?=
 =?utf-8?B?aVZlMjJmNndkdDZyTitLS2hWNzVOSnVjT3owK2N6WHI5Q012S2t0VVpkd0hq?=
 =?utf-8?B?STFIWk43d0s5eHdiYU9aNTN2c2VYdnlxcUNKanpYT2FKMnp1YjViTjVBWHlH?=
 =?utf-8?B?MHVKckw5RHFKeURNRDFLdGtybFpHTGFWMGJqYmoxUWUyU2ZneWFkT0NiMlUy?=
 =?utf-8?B?UUpSRFROYkt6Um1WNDIwenBRTFErWG5HUFlwN1RuNGJxaUlkWWZsdTB2MlpM?=
 =?utf-8?Q?DNYyBv3EHSMEqynOIibpLTw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e692ada-8383-49cc-094e-08d9f0a2bc6e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 16:46:38.7269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TMoo25gyrE4OyW+Bj7oWwKPKuqhi0tLrf6BPYicChjiJcoH7NuGftxb03uJkAEvSAPFiapBoRax9Hjkmwmqm3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5212

On 14.02.2022 13:51, Andrew Cooper wrote:
> CET-SS and CET-IBT can be independently controlled, so the configuration of
> MSR_S_CET can't be constant any more.
> 
> Introduce xen_msr_s_cet_value(), mostly because I don't fancy
> writing/maintaining that logic in assembly.  Use this in the 3 paths which
> alter MSR_S_CET when both features are potentially active.
> 
> To active CET-IBT, we only need CR4.CET and MSR_S_CET.ENDBR_EN.  This is
> common with the CET-SS setup, so reorder the operations to set up CR4 and
> MSR_S_CET for any nonzero result from xen_msr_s_cet_value(), and set up
> MSR_PL0_SSP and SSP if SHSTK_EN was also set.
> 
> Adjust the crash path to disable CET-IBT too.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit with a nit and a remark:

> --- a/xen/arch/x86/acpi/wakeup_prot.S
> +++ b/xen/arch/x86/acpi/wakeup_prot.S
> @@ -63,7 +63,26 @@ ENTRY(s3_resume)
>          pushq   %rax
>          lretq
>  1:
> -#ifdef CONFIG_XEN_SHSTK
> +#if defined(CONFIG_XEN_SHSTK) || defined(CONFIG_XEN_IBT)
> +        call    xen_msr_s_cet_value
> +        test    %eax, %eax
> +        jz      .L_cet_done
> +
> +        /* Set up MSR_S_CET. */
> +        mov     $MSR_S_CET, %ecx
> +        xor     %edx, %edx
> +        wrmsr
> +
> +        /* Enable CR4.CET. */
> +        mov     $XEN_MINIMAL_CR4 | X86_CR4_CET, %ecx
> +        mov     %rcx, %cr4
> +
> +        /* WARNING! call/ret now fatal (iff SHSTK) until SETSSBSY loads SSP */
> +
> +#if defined(CONFIG_XEN_SHSTK)

Just #ifdef, as it was before?

> @@ -90,10 +101,6 @@ ENTRY(s3_resume)
>          mov     %edi, %eax
>          wrmsr
>  
> -        /* Enable CET.  MSR_INTERRUPT_SSP_TABLE is set up later in load_system_tables(). */
> -        mov     $XEN_MINIMAL_CR4 | X86_CR4_CET, %ebx
> -        mov     %rbx, %cr4

The latter part of this comment could do with retaining.

Jan


