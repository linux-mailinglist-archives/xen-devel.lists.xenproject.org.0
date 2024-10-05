Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9F299170F
	for <lists+xen-devel@lfdr.de>; Sat,  5 Oct 2024 15:44:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810935.1223614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sx54k-00022N-CQ; Sat, 05 Oct 2024 13:44:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810935.1223614; Sat, 05 Oct 2024 13:44:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sx54k-000206-8y; Sat, 05 Oct 2024 13:44:02 +0000
Received: by outflank-mailman (input) for mailman id 810935;
 Sat, 05 Oct 2024 13:44:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AzXh=RB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sx54j-000200-3U
 for xen-devel@lists.xenproject.org; Sat, 05 Oct 2024 13:44:01 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id deebd314-831f-11ef-99a2-01e77a169b0f;
 Sat, 05 Oct 2024 15:43:58 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c5bca59416so3882706a12.1
 for <xen-devel@lists.xenproject.org>; Sat, 05 Oct 2024 06:43:58 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e78628fsm134392066b.135.2024.10.05.06.43.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Oct 2024 06:43:56 -0700 (PDT)
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
X-Inumbo-ID: deebd314-831f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728135837; x=1728740637; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UrcD1Bq1gk6XBF5nsPVkuGgrPiLUxEFjfiQYh34Tya0=;
        b=E0I31pSByhOQiW6jYm5DSnIzqOMzSJFn0j5iBnrHHla7th/4NwacnCE5NfK181PEXb
         L/ULDWU2yVJHM9P8ald2qGEsYya0iDMBZUgfrY09umJo5D66X0323gfk8eNg+t0IoT67
         BBtATAyIx+1lmuXT9VQmOJcOmI0CuFm88kdRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728135837; x=1728740637;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UrcD1Bq1gk6XBF5nsPVkuGgrPiLUxEFjfiQYh34Tya0=;
        b=AeYDlzmwxXKN3BRLUSIstbA/i3kPZIKnbeWhu5XoSRT7gW+D1wLlD96Yb/alikdJE9
         3Ho1d4/dAozNg7Tx5k3+XDIHSvUkl/+ZX5wc3L+0MdrCxBcNw587xJgM/dazEjAmpU2X
         Ww7mEQ6trRR5W5rTqPbsfQcm4u37zbBNJyKWaMD800sBh84MwTBlFi8d2SpFNiV2pTeG
         eP/UkffNjqERnKVJOjZSOHCWc8Jg2XTkclKl7Qm+IBy6GR7E/X/zy9UZkjkJLJ2cIrpL
         NPoQ9p/MDRJTNbxwme6OBoc3NlbYLDC0z0d+yFRvVtmlE7Y1bAdO9Vdx9QkYEnR4yaTf
         8Xbg==
X-Forwarded-Encrypted: i=1; AJvYcCUWBbXF+Gicbe56jJVeuunFT98IuqJOY6KtwZaS0G1mvnMxloHhSAmlExcxD1gOfSxmZ2h7PI+z4mQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyOck4lKSvZ7G3wIUrHTOhWz9ioCd9hvSNjlcLmw9JTPCuJflmZ
	hsT3X4lqdpfCNEQLFhaW+2AC6aT+XE2pouDLvRFM1Rr+geN32YUHJ2Gz3WF8Y/U=
X-Google-Smtp-Source: AGHT+IGxjMpbgayEEY0nG/NZ/ffiBVr7JmOHl1M7xflksUjhCMpJStIJnJwM+lUzyYP6ot4jj5cg4A==
X-Received: by 2002:a17:907:745:b0:a86:9d39:a2a with SMTP id a640c23a62f3a-a991bcfbc70mr611577766b.8.1728135837422;
        Sat, 05 Oct 2024 06:43:57 -0700 (PDT)
Message-ID: <10890c99-f1ed-4e59-a86b-f79cb6065aa9@citrix.com>
Date: Sat, 5 Oct 2024 14:43:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/boot: Use boot_vid_info and trampoline_phys
 variables directly from C code
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241005080233.1248850-1-frediano.ziglio@cloud.com>
 <20241005080233.1248850-4-frediano.ziglio@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241005080233.1248850-4-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/10/2024 9:02 am, Frediano Ziglio wrote:
> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> index ade2c5c43d..dcda91cfda 100644
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -510,22 +510,10 @@ trampoline_setup:
>          mov     %esi, sym_esi(xen_phys_start)
>          mov     %esi, sym_esi(trampoline_xen_phys_start)
>  
> -        /* Get bottom-most low-memory stack address. */
> -        mov     sym_esi(trampoline_phys), %ecx
> -        add     $TRAMPOLINE_SPACE,%ecx
> -
> -#ifdef CONFIG_VIDEO
> -        lea     sym_esi(boot_vid_info), %edx
> -#else
> -        xor     %edx, %edx
> -#endif
> -
>          /* Save Multiboot / PVH info struct (after relocation) for later use. */
> -        push    %edx                /* Boot video info to be filled from MB2. */
>          mov     %ebx, %edx          /* Multiboot / PVH information address. */
> -        /*      reloc(magic/eax, info/edx, trampoline/ecx, video/stk) using fastcall. */
> +        /*      reloc(magic/eax, info/edx) using fastcall. */
>          call    reloc
> -        add     $4, %esp
>  

Please split this patch in two.  Just for testing sanity sake if nothing
else.

Now, while I think the patch is a correct transform of the code, ...

>  #ifdef CONFIG_PVH_GUEST
>          cmpb    $0, sym_esi(pvh_boot)
> diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
> index 94b078d7b1..8527fa8d01 100644
> --- a/xen/arch/x86/boot/reloc.c
> +++ b/xen/arch/x86/boot/reloc.c
> @@ -185,7 +188,7 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out, memctx
>      memory_map_t *mmap_dst;
>      multiboot_info_t *mbi_out;
>  #ifdef CONFIG_VIDEO
> -    struct boot_video_info *video = NULL;
> +    struct boot_video_info *video = &boot_vid_info;

... doesn't this demonstrate that we're again writing into the
trampoline in-Xen, prior to it placing it in low memory?

> @@ -346,10 +347,10 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out, memctx
>  }
>  
>  /* SAF-1-safe */
> -void *reloc(uint32_t magic, uint32_t in, uint32_t trampoline,
> -            uint32_t video_info)
> +void *reloc(uint32_t magic, uint32_t in)
>  {
> -    memctx ctx = { trampoline };
> +    /* Get bottom-most low-memory stack address. */
> +    memctx ctx = { (uint32_t)((long)trampoline_phys + TRAMPOLINE_SPACE) };

Again, while this is a correct transformation (best as I can tell),
wtf?  Doesn't this mean we're bump-allocating downwards into our own stack?

~Andrew

