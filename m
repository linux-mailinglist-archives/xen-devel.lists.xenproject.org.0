Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C9E9986D7
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 14:57:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816116.1230293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sysjG-0008Dy-AZ; Thu, 10 Oct 2024 12:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816116.1230293; Thu, 10 Oct 2024 12:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sysjG-0008CT-7q; Thu, 10 Oct 2024 12:57:18 +0000
Received: by outflank-mailman (input) for mailman id 816116;
 Thu, 10 Oct 2024 12:57:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T2t6=RG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sysjE-00084R-RI
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 12:57:16 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c74e85d-8707-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 14:57:15 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a9950d27234so131959366b.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2024 05:57:15 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a80deb5bsm85650366b.184.2024.10.10.05.57.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Oct 2024 05:57:14 -0700 (PDT)
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
X-Inumbo-ID: 2c74e85d-8707-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728565035; x=1729169835; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RweS2iE+qgiFTmVH6l2MVyIGdgJqqWloo7IiMvnmYjU=;
        b=UZHa5F3x57pFbdXSfyL1yXmDneu63g4dXG99rk4bnnWPVc6gSpCVqP6ZF++EHk7ylL
         5aytGWqXpNx6j1RoQ8BwtcRDDgYOvHQ7AZUu6vBXNfo5k+zdLep/9AWA568X64UQlghU
         8VTxseJb9Ytdo+m3IBcq8d43D2oWnbOM90jiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728565035; x=1729169835;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RweS2iE+qgiFTmVH6l2MVyIGdgJqqWloo7IiMvnmYjU=;
        b=gd0CnCDyfyLQbU5yOPAuy7I2oGWQ/ANDjxoFOxWq3rheMVWDEa7MStty3TP2G1l1eM
         B0+rlLjuwHKyW4YuQ7Q2oTDEVPeEe7HFpY/XhneubK1yAxBitS2gIFIMpVY9QBMHwtbx
         vAteLKJneR7iO90QXSBfhR+oHl8bC79VvLXA8ze/itzIjmQy2cqHVsDmilkQhbVTnzis
         TLdrC5mA2bf1ddZS1Fe9ifkkjgdDY0m8z325RugzaKHt/oKtnCNXzdSb0UvTFRRDA7Nn
         oq+VTBsY3x2txHp9aC1S9TejCC3NYleom+aYj9uDb2GV4ElyTZq9Soq58vhCytqyPs4f
         miGg==
X-Forwarded-Encrypted: i=1; AJvYcCW+hUu1wZPzXaE67s/0i9ZRCBpXHqq18xGSV9M+OFPvRrFuHvQWINGrxl0oYehpFyoRpelm/Iyxet8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHCrRTQaRv+uBzdcQxjm2SZawnaiygDAirtp4VLBKcRPW1W6h5
	cNUtNZJSrPb3vRbAco64FUHEyFYJGRzTS5XdgpIUNYqwGCEq2bvW7Y6etKiqkM4=
X-Google-Smtp-Source: AGHT+IFtjBSo3rZbs/LCBQPmGi0tuIjKBBKAtkYFW+7j6M3750s4gGsvUBoMsGpEfgxVQcAI4PyRWQ==
X-Received: by 2002:a17:907:6094:b0:a99:8a0f:3c14 with SMTP id a640c23a62f3a-a998d313419mr509569266b.42.1728565034672;
        Thu, 10 Oct 2024 05:57:14 -0700 (PDT)
Message-ID: <c7b0092f-9e47-47ae-9a7f-fe28c49c82a3@citrix.com>
Date: Thu, 10 Oct 2024 13:57:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] x86/boot: Use trampoline_phys variable directly
 from C code
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241007141539.1899350-1-frediano.ziglio@cloud.com>
 <20241007141539.1899350-6-frediano.ziglio@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241007141539.1899350-6-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/10/2024 3:15 pm, Frediano Ziglio wrote:
> No more need to pass from assembly code.
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
> Changes since v1:
> - split the 2 variable changes into 2 commits.
> ---
>  xen/arch/x86/boot/head.S  | 13 ++++---------
>  xen/arch/x86/boot/reloc.c |  9 ++++++---
>  2 files changed, 10 insertions(+), 12 deletions(-)
>
> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> index ade2c5c43d..32b658fa2b 100644
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -510,22 +510,17 @@ trampoline_setup:
>          mov     %esi, sym_esi(xen_phys_start)
>          mov     %esi, sym_esi(trampoline_xen_phys_start)
>  
> -        /* Get bottom-most low-memory stack address. */
> -        mov     sym_esi(trampoline_phys), %ecx
> -        add     $TRAMPOLINE_SPACE,%ecx
> -
> +        /* Boot video info to be filled from MB2. */
>  #ifdef CONFIG_VIDEO
> -        lea     sym_esi(boot_vid_info), %edx
> +        lea     sym_esi(boot_vid_info), %ecx
>  #else
> -        xor     %edx, %edx
> +        xor     %ecx, %ecx
>  #endif
>  
>          /* Save Multiboot / PVH info struct (after relocation) for later use. */
> -        push    %edx                /* Boot video info to be filled from MB2. */
>          mov     %ebx, %edx          /* Multiboot / PVH information address. */
> -        /*      reloc(magic/eax, info/edx, trampoline/ecx, video/stk) using fastcall. */
> +        /*      reloc(magic/eax, info/edx, video/stk) using fastcall. */
>          call    reloc
> -        add     $4, %esp

Sorry - I was expecting you split the patches the other way around.

If you drop video first, then trampoline second, there's no churn
changing video from being on the stack to being in ecx.

As it stands the "video/stk" needs to become "video/ecx".

>  
>  #ifdef CONFIG_PVH_GUEST
>          cmpb    $0, sym_esi(pvh_boot)
> diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
> index 94b078d7b1..4cca61adec 100644
> --- a/xen/arch/x86/boot/reloc.c
> +++ b/xen/arch/x86/boot/reloc.c
> @@ -19,6 +19,9 @@
>  #include <xen/kconfig.h>
>  #include <xen/multiboot.h>
>  #include <xen/multiboot2.h>
> +#include <xen/page-size.h>
> +
> +#include <asm/trampoline.h>
>  
>  #include <public/arch-x86/hvm/start_info.h>
>  
> @@ -346,10 +349,10 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out, memctx
>  }
>  
>  /* SAF-1-safe */
> -void *reloc(uint32_t magic, uint32_t in, uint32_t trampoline,
> -            uint32_t video_info)
> +void *reloc(uint32_t magic, uint32_t in, uint32_t video_info)
>  {
> -    memctx ctx = { trampoline };
> +    /* Get bottom-most low-memory stack address. */
> +    memctx ctx = { (uint32_t)((long)trampoline_phys + TRAMPOLINE_SPACE) };

You don't need any casts here.  The result can't exceed 1<<20.


Again, I agree this is a correct transform of the code, but the comment
you've moved is incorrect AFAICT, and conflicts with

typedef struct memctx {
    /*
     * Simple bump allocator.
     *
     * It starts from the base of the trampoline and allocates downwards.
     */
    uint32_t ptr;
} memctx;

which is probably my fault, but needs resolving.

What does the trampoline layout actually look like?  Can we see about
correcting the comments?

~Andrew

