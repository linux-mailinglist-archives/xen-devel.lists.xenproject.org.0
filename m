Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C998E984770
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 16:15:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802979.1213349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st6Js-0002Ej-Ku; Tue, 24 Sep 2024 14:15:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802979.1213349; Tue, 24 Sep 2024 14:15:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st6Js-0002CD-HF; Tue, 24 Sep 2024 14:15:12 +0000
Received: by outflank-mailman (input) for mailman id 802979;
 Tue, 24 Sep 2024 14:15:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4pT6=QW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1st6Jr-0002C7-8O
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 14:15:11 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67caa5e2-7a7f-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 16:15:09 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a8d6ac24a3bso262790966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 07:15:09 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f541adsm88817866b.67.2024.09.24.07.15.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 07:15:07 -0700 (PDT)
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
X-Inumbo-ID: 67caa5e2-7a7f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727187309; x=1727792109; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p7Bb3EP1MmKXjEMaYKZwR0gXar6IJYVriKC0xJ8PmPk=;
        b=liSiXR35mYL+U8S4PL3DvwRE4Y1HJuAXWelvK+doyaNC6UZm/uylZSKEd9mtBT6Umn
         fEkFXt3Nq7lwAzquomHzacXWsEH5BTqYn1LWghg2h9wWA/9Y0HU+BB/IuMkzrvZRsiFU
         jjQTVXgchBk45nacC7E7WgJu/w8esL2dER0Ao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727187309; x=1727792109;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7Bb3EP1MmKXjEMaYKZwR0gXar6IJYVriKC0xJ8PmPk=;
        b=MHf3tSSuNKjKiosycFn/nkCBswPaxfvEofjrtkEKjt/f3vVJGJpEaiUD2o/xvOUgVl
         bPsGVbjidh4QCpJA7ILsaNGSWEjOtYt0Mz8LmTlqtUJs+a7bAGOIxp+Qdjzq33/8Bc2H
         IW91yrfEHNq0cVfpQ/Vk4QX4J04ptecF68v7eb3hxpPbN4SU9BSr6C9tea08K55mVztE
         5dGh10e+KjcHyNhn5oJCbLDq9vDso9QqWyYvP4C9SDYCSbBP5RkG2XfM1e3xLeLmLu2T
         Fa7xjD4PHDJCSKWsMMe85z2Khm+1xb6zKY+LK/P12UO0BggKTiSsP4Rz9Eiw63fKM0k6
         jLEg==
X-Forwarded-Encrypted: i=1; AJvYcCX6Es9a44+CZ599fD0ib1uP7a5040l2EL+iQGZmOlTYsp9KfK1n255PxNaNrWp+9pxT3eKdcyPd0Ww=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzEGgOxxGng6sGS8xN0mucIaMG6zVKBe6LWbAlLaN/l2x/y8T74
	eNv4LObd2cLs9xoJSjjA+IYvhjdQUqG10Az3im0koc8Ou7gObbVo8LasZ1BI2us=
X-Google-Smtp-Source: AGHT+IF32EZZzSKhPK5g1A87ynpsw9GWIYW9vknPq+hhdoMz9qNDqnkQ5C93vtiqV4XnQ9vaskCL/A==
X-Received: by 2002:a17:907:3f8f:b0:a72:5967:b34 with SMTP id a640c23a62f3a-a92d55a1241mr388186466b.22.1727187308754;
        Tue, 24 Sep 2024 07:15:08 -0700 (PDT)
Message-ID: <8846df10-196f-48e2-8271-c5a57fba925d@citrix.com>
Date: Tue, 24 Sep 2024 15:15:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] x86/boot: Improve MBI2 structure check
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240924102811.86884-1-frediano.ziglio@cloud.com>
 <20240924102811.86884-5-frediano.ziglio@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240924102811.86884-5-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/09/2024 11:28 am, Frediano Ziglio wrote:
> Tag structure should contain at least the tag header.
> Entire tag structure must be contained inside MBI2 data.
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
>  xen/arch/x86/efi/parse-mbi2.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/efi/parse-mbi2.c b/xen/arch/x86/efi/parse-mbi2.c
> index 6038f35b16..7efda8fab2 100644
> --- a/xen/arch/x86/efi/parse-mbi2.c
> +++ b/xen/arch/x86/efi/parse-mbi2.c
> @@ -22,6 +22,7 @@ efi_parse_mbi2(uint32_t magic, const multiboot2_fixed_t *mbi)
>      EFI_HANDLE ImageHandle = NULL;
>      EFI_SYSTEM_TABLE *SystemTable = NULL;
>      const char *cmdline = NULL;
> +    const void *const mbi_end = (const void *)mbi + mbi->total_size;
>      bool have_bs = false;
>  
>      if ( magic != MULTIBOOT2_BOOTLOADER_MAGIC )
> @@ -30,7 +31,9 @@ efi_parse_mbi2(uint32_t magic, const multiboot2_fixed_t *mbi)
>      /* Skip Multiboot2 information fixed part. */
>      tag = _p(ROUNDUP((unsigned long)(mbi + 1), MULTIBOOT2_TAG_ALIGN));
>  
> -    for ( ; (const void *)tag - (const void *)mbi < mbi->total_size
> +    for ( ; (const void *)(tag + 1) <= mbi_end
> +            && tag->size >= sizeof(*tag)
> +            && (const void *)tag + tag->size <= mbi_end
>              && tag->type != MULTIBOOT2_TAG_TYPE_END;
>            tag = _p(ROUNDUP((unsigned long)((const void *)tag + tag->size),
>                     MULTIBOOT2_TAG_ALIGN)) )

I'd merge this into the previous patch.  There's no reason to keep it
separate.

Also a minor style note I forgot, &&'s on the end of the previous line
please.

~Andrew

