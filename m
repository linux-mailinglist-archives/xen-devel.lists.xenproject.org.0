Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIz3CH79AWppnAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 18:02:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDF7511BBE
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 18:01:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306308.1578341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMT3z-0000ax-Ho; Mon, 11 May 2026 16:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306308.1578341; Mon, 11 May 2026 16:00:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMT3z-0000Xz-F6; Mon, 11 May 2026 16:00:59 +0000
Received: by outflank-mailman (input) for mailman id 1306308;
 Mon, 11 May 2026 16:00:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1wMT3x-0000Xp-Rv
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 16:00:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMT3u-007hct-AW
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 18:00:54 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6a01fd25-5cb7-0a2a0a5109dd-0a2a45019b44-18
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 18:00:54 +0200
Received: from [209.85.208.181] (helo=mail-lj1-f181.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6a01fd35-c1f2-0a2a45010019-d155d0b5b19b-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 18:00:54 +0200
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-39393c1b5aaso40018451fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 09:00:54 -0700 (PDT)
Received: from [10.17.80.122] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-393f6131c08sm28569531fa.30.2026.05.11.09.00.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2026 09:00:52 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778515253; x=1779120053; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ug0aCUEmDPdrZzEZL+s+UF5tIuI8VwfPl3ENnEI/bU=;
        b=Wxnbl9hnWsu9UWf3ytnnBycu+lhrFtPqhA1Oa3jPOWs73v5iFOFhTgnkklL3TZJnt8
         UY6DnHn3swnBjPr8lo4aEUabFqNXPswTegfANc709ovqliHgUBOPTK0XcXRqXlcHh0zp
         oDV1xh++GcucaRfAByYkXxepk8DyGNXBtIvrZ6ZneDSV403JWQtBuL3ksbZRr7quzhty
         wScZciAOMc0vbirQbiN1+MIXTwbfYnY8DlGANXkwriNlZKuj/ABFqmpS5i9SPxEnsVSI
         kWz+SvC8c/KftJSaQaFz3Pkkflr+heRBU61iDj8E0IJ0cFOUcsHUIY1IZVqmsXv5zm41
         cRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778515253; x=1779120053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ug0aCUEmDPdrZzEZL+s+UF5tIuI8VwfPl3ENnEI/bU=;
        b=JC1u4SEZUKKNnBWwHTRPX7ASAr4qCDNx4auPWjgzJ+gqnm3ozXbxY5t3uDgC2SYZxc
         j2Sd+YmTLLlLklva0JtIDkbDHlHliOKE15hWXIYTcWa7RgD3psK3tQWpOvAc8hyaetNU
         urKbfSTMfvNMympEEXMyqWsCpUAdIVxym4DPlSW3AAyVAIS4+Y17Ou8rgqHYqZGy4n0A
         PrP6Ffuatp0cQDiX5hYcc2QBkjDNzRkLrbIgM3z0Y6MbcalgW5ddePB3dlH9zweealaa
         49Alc+oTl5V36PGPF4HLcEPo4c7SbimMzTiCF/zf37Ih4CjERqHEuRIbHOVpUnnw2nFu
         jC7w==
X-Forwarded-Encrypted: i=1; AFNElJ8Lo0P1LoJ14JAMvOcTdvjUjwa4tiffBzlsOJw7zq7zjrXwEBnYOsq8CQRY7a+QrhY5I7atJweeFiE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhbzWEaP8RP/8r3gkWOJikpP4y6ZVSd3DgGf82RAMqgBbD0w2s
	671+Dku+Sc5rlRD7H5evC3cdc9pwFicNQR13tbvEV1N0zXOVFncuQy7k
X-Gm-Gg: Acq92OHycYWSFmqQhylMKVoy3u5xJ0yedIJYBdrK62mFy28uNpKqbZ1zSMYgjV9DJy9
	F2pAleBfups842PnxTRINqI33GdL7UOwCZQFBT5dJTOavg5pVWSotZ3ZmM8OSA3eGPpTJjt4c34
	hDd6PZ9cLMpukHdEV4MJmZGxkYrs5vvRqC//UMGGNhIixtt9Xo9YuffPMCDPDvOJ6YOgNq46Gm/
	TzLrryoA8fRPmMGSGmKREB6rbg4AyIjxjhBHPYTLqMUegnvhiiAU/ZsDLqtvZSPC4CsNkaPPgjk
	dPfenjyK5RgXqTBP2zfS4j6GBdhCDEJZRbO25FLlF1JV/hurvC3AiRe7HePKeZ8uNxQ5l8sX/bN
	wy1cHp6w3jiIc2exNS4WlG4eAkFVnNFTXXVhcBCsbgv1CgCMwNOOvJ3Nrhc8YPxPKw+8bl8yiJ1
	Z8Ana7a8efdblRoIPrV5dZb5kUKhbb/xJB0WVXCALpIfW5ZI/To9kkz8fyuYw3kW+ZPA==
X-Received: by 2002:a2e:bc09:0:b0:393:bffa:d815 with SMTP id 38308e7fff4ca-393f4f1d3edmr38453991fa.21.1778515253066;
        Mon, 11 May 2026 09:00:53 -0700 (PDT)
Message-ID: <515377c0-2d8c-4069-86d0-e50674fefc68@gmail.com>
Date: Mon, 11 May 2026 19:00:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 11/13] xen/arm: Save/restore context on suspend/resume
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
 <f87a2bcb6b09e95e07e51c27541ad91406e849d1.1775125380.git.mykola_kvach@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <f87a2bcb6b09e95e07e51c27541ad91406e849d1.1775125380.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1778515254-AC055FF4-57AE83BC/0/0
X-purgate-type: clean
X-purgate-size: 7202
X-Rspamd-Queue-Id: 5CDF7511BBE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action



On 4/2/26 13:45, Mykola Kvach wrote:

Hello Mykola

I did not spot any obvious issues with this patch. As far as I can tell, 
the save/restore register set appears to be complete and correct for the 
current codebase.

Just one observation: there is an API asymmetry between 
prepare_resume_ctx() and hyp_resume() (save uses pointer, restore 
hardcodes global) ...

> From: Mirela Simonovic <mirela.simonovic@aggios.com>
> 
> The context of CPU general purpose and system control registers must be
> saved on suspend and restored on resume. This is implemented in
> prepare_resume_ctx and before the return from the hyp_resume function.
> The prepare_resume_ctx must be invoked just before the PSCI system suspend
> call is issued to the ATF. The prepare_resume_ctx must return a non-zero
> value so that the calling 'if' statement evaluates to true, causing the
> system suspend to be invoked. Upon resume, the context saved on suspend
> will be restored, including the link register. Therefore, after
> restoring the context, the control flow will return to the address
> pointed to by the saved link register, which is the place from which
> prepare_resume_ctx was called. To ensure that the calling 'if' statement
> does not again evaluate to true and initiate system suspend, hyp_resume
> must return a zero value after restoring the context.
> 
> Note that the order of saving register context into cpu_context structure
> must match the order of restoring.
> 
> Support for ARM32 is not implemented. Instead, compilation fails with a
> build-time error if suspend is enabled for ARM32.
> 
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v8:
> - fix alignments in code
> 
> Changes in v7:
> - no changes
> ---
>   xen/arch/arm/Makefile              |  1 +
>   xen/arch/arm/arm64/head.S          | 90 +++++++++++++++++++++++++++++-
>   xen/arch/arm/include/asm/suspend.h | 26 +++++++++
>   xen/arch/arm/suspend.c             | 14 +++++
>   4 files changed, 130 insertions(+), 1 deletion(-)
>   create mode 100644 xen/arch/arm/suspend.c
> 
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 69200b2728..c36158271a 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -51,6 +51,7 @@ obj-y += setup.o
>   obj-y += shutdown.o
>   obj-y += smp.o
>   obj-y += smpboot.o
> +obj-$(CONFIG_SYSTEM_SUSPEND) += suspend.o
>   obj-$(CONFIG_SYSCTL) += sysctl.o
>   obj-y += time.o
>   obj-y += traps.o
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 596e960152..2cb02ee314 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -562,6 +562,52 @@ END(efi_xen_start)
>   #endif /* CONFIG_ARM_EFI */
>   
>   #ifdef CONFIG_SYSTEM_SUSPEND
> +/*
> + * int prepare_resume_ctx(struct cpu_context *ptr)
> + *
> + * x0 - pointer to the storage where callee's context will be saved

    ... the C signature takes a pointer (struct cpu_context *ptr) and 
the save path uses it, ...

> + *
> + * CPU context saved here will be restored on resume in hyp_resume function.
> + * prepare_resume_ctx shall return a non-zero value. Upon restoring context
> + * hyp_resume shall return value zero instead. From C code that invokes
> + * prepare_resume_ctx, the return value is interpreted to determine whether
> + * the context is saved (prepare_resume_ctx) or restored (hyp_resume).
> + */
> +FUNC(prepare_resume_ctx)
> +        /* Store callee-saved registers */
> +        stp   x19, x20, [x0], #16
> +        stp   x21, x22, [x0], #16
> +        stp   x23, x24, [x0], #16
> +        stp   x25, x26, [x0], #16
> +        stp   x27, x28, [x0], #16
> +        stp   x29, lr, [x0], #16
> +
> +        /* Store stack-pointer */
> +        mov   x2, sp
> +        str   x2, [x0], #8
> +
> +        /* Store system control registers */
> +        mrs   x2, VBAR_EL2
> +        str   x2, [x0], #8
> +        mrs   x2, VTCR_EL2
> +        str   x2, [x0], #8
> +        mrs   x2, VTTBR_EL2
> +        str   x2, [x0], #8
> +        mrs   x2, TPIDR_EL2
> +        str   x2, [x0], #8
> +        mrs   x2, MDCR_EL2
> +        str   x2, [x0], #8
> +        mrs   x2, HSTR_EL2
> +        str   x2, [x0], #8
> +        mrs   x2, CPTR_EL2
> +        str   x2, [x0], #8
> +        mrs   x2, HCR_EL2
> +        str   x2, [x0], #8
> +
> +        /* prepare_resume_ctx must return a non-zero value */
> +        mov   x0, #1
> +        ret
> +END(prepare_resume_ctx)
>   
>   FUNC(hyp_resume)
>           /* Initialize the UART if earlyprintk has been enabled. */
> @@ -580,7 +626,49 @@ FUNC(hyp_resume)
>           b     enable_secondary_cpu_mm
>   
>   mmu_resumed:
> -        b .
> +        /* Now we can access the cpu_context, so restore the context here */
> +        ldr   x0, =cpu_context

    ... but the restore path hardcodes =cpu_context, ignoring whatever 
pointer was originally passed. If a caller were to pass anything other 
than &cpu_context, the resume would load from the wrong location. Since 
the sole call site does pass &cpu_context (called from system_suspend() 
in the last patch), this works correctly today — but the API is somewhat 
misleading.

I might be missing something, but why not make prepare_resume_ctx() take 
no arguments and use =cpu_context directly inside the assembly? That way 
the save and restore paths would both use the same global, and the API 
would not be misleading.

> +
> +        /* Restore callee-saved registers */
> +        ldp   x19, x20, [x0], #16
> +        ldp   x21, x22, [x0], #16
> +        ldp   x23, x24, [x0], #16
> +        ldp   x25, x26, [x0], #16
> +        ldp   x27, x28, [x0], #16
> +        ldp   x29, lr, [x0], #16
> +
> +        /* Restore stack pointer */
> +        ldr   x2, [x0], #8
> +        mov   sp, x2
> +
> +        /* Restore system control registers */
> +        ldr   x2, [x0], #8
> +        msr   VBAR_EL2, x2
> +        ldr   x2, [x0], #8
> +        msr   VTCR_EL2, x2
> +        ldr   x2, [x0], #8
> +        msr   VTTBR_EL2, x2
> +        ldr   x2, [x0], #8
> +        msr   TPIDR_EL2, x2
> +        ldr   x2, [x0], #8
> +        msr   MDCR_EL2, x2
> +        ldr   x2, [x0], #8
> +        msr   HSTR_EL2, x2
> +        ldr   x2, [x0], #8
> +        msr   CPTR_EL2, x2
> +        ldr   x2, [x0], #8
> +        msr   HCR_EL2, x2
> +        isb
> +
> +        /*
> +         * Since context is restored return from this function will appear
> +         * as return from prepare_resume_ctx. To distinguish a return from
> +         * prepare_resume_ctx which is called upon finalizing the suspend,
> +         * as opposed to return from this function which executes on resume,
> +         * we need to return zero value here.
> +         */
> +        mov   x0, #0
> +        ret
>   END(hyp_resume)
>   
>   #endif /* CONFIG_SYSTEM_SUSPEND */


[snip]



