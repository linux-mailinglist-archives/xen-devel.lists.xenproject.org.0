Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 605E798A935
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 17:55:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807525.1219056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svIkH-00033q-9p; Mon, 30 Sep 2024 15:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807525.1219056; Mon, 30 Sep 2024 15:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svIkH-00031w-6z; Mon, 30 Sep 2024 15:55:33 +0000
Received: by outflank-mailman (input) for mailman id 807525;
 Mon, 30 Sep 2024 15:55:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1QIX=Q4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svIkF-00031q-V2
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 15:55:31 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6acbcae9-7f44-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 17:55:29 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c8784e3bc8so5553568a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 08:55:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8824ba6a7sm4616082a12.27.2024.09.30.08.55.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 08:55:29 -0700 (PDT)
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
X-Inumbo-ID: 6acbcae9-7f44-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727711729; x=1728316529; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MIzuDrbSaxDjW0TpvFApNxyEjMBbs5HBbH/bL2du7m4=;
        b=fhW8pH0J7IMD2tgT4Cs4gAU2On/RHw1851D4mphzG4ALzzJgZ0llhGdXAxwjbHsYvW
         H4fuIGF0kgElXnlzIYylh7h6+Ffbh+ayU9qVLNqUB7+ScSfSSenaKVINlRTmlDpA19SQ
         b/Dpfk9SpXa2fX2OushTwLFbsJk1RMz4K+gDHCcP7E3WJCYPukPoJEZ57cxF2a1GQknE
         BR5gc/K0BvHuXxtTqIiG9tzEbjrWsayQkAFkCDryoH4GWOz6tEYlfHFGkU6PCZzIU82i
         jbKWZjgc9GtW1NITgqn6fk6y2HAjqsO75NlAqLnTJmb8VsMwfhl95HcYC26Uu+mVJim7
         2AUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727711729; x=1728316529;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MIzuDrbSaxDjW0TpvFApNxyEjMBbs5HBbH/bL2du7m4=;
        b=QY2GBpVv/u0MFDWwAzOhahDxVK2KXkLBbREwhHNwmTysA9ZyOnCs/Z/6KHpHgj/pH6
         Bza0pWNzC0A8W0BVtruy6dork/T9CNDfaykDQZas8TAfoTpqCjpBMqsBSIQExDS1lJ4o
         817ktC7/L8Ilizv8ttFfH4I5nV1t90MBvWuNnfwrnkEWk6nEVZAXl6VCmwidPB0xhuSf
         mBtngcgkwzikmSQh9dMxoz7m3sPXebZPfvkxbqeBsxT46yu2P0oaZEm15TBsfc8TjDQS
         ApniXC6cMWzef5wYIrksNPh4dmooJ7xVNd4Srgv/rpC7kMDzK8CsLST+cpbmfb+70Ib5
         E1RA==
X-Forwarded-Encrypted: i=1; AJvYcCVd9At5CMLRMZG/WkQi9oaJenaILFy9IzBt1kBXXlC8LDZzRzsAcBl3jM+u063uH/cdpia0uSoyCrY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6cntWWeqS66sksEgTT7yIQ+bkauV/sFoP3xKUN3/29nmM/avc
	6o1seJAzyVFBI9SOgcuxJ51r+i8P3Y3usbiPmgAslsKEvY7xyHnK0Z5O2cNgUA==
X-Google-Smtp-Source: AGHT+IH7Fgws4cTY1g1oR0JF8k11D7qpoK/B1kJ6K66hfr5MppheICHa3cSnMzoVB/JpvadcpCkW6g==
X-Received: by 2002:a05:6402:3890:b0:5c7:227f:39e4 with SMTP id 4fb4d7f45d1cf-5c882603b44mr11730744a12.31.1727711729358;
        Mon, 30 Sep 2024 08:55:29 -0700 (PDT)
Message-ID: <b68528a0-0e0b-4b8c-bd9d-b7d845905711@suse.com>
Date: Mon, 30 Sep 2024 17:55:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] x86/boot: Improve MBI2 structure check
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20240926092109.475271-1-frediano.ziglio@cloud.com>
 <20240926092109.475271-4-frediano.ziglio@cloud.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20240926092109.475271-4-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.09.2024 11:21, Frediano Ziglio wrote:
> --- a/xen/arch/x86/efi/parse-mbi2.c
> +++ b/xen/arch/x86/efi/parse-mbi2.c
> @@ -13,6 +13,7 @@ efi_multiboot2_prelude(uint32_t magic, const multiboot2_fixed_t *mbi)
>      EFI_HANDLE ImageHandle = NULL;
>      EFI_SYSTEM_TABLE *SystemTable = NULL;
>      const char *cmdline = NULL;
> +    const void *const mbi_end = (const void *)mbi + mbi->total_size;
>      bool have_bs = false;
>  
>      if ( magic != MULTIBOOT2_BOOTLOADER_MAGIC )
> @@ -21,7 +22,9 @@ efi_multiboot2_prelude(uint32_t magic, const multiboot2_fixed_t *mbi)
>      /* Skip Multiboot2 information fixed part. */
>      tag = _p(ROUNDUP((unsigned long)(mbi + 1), MULTIBOOT2_TAG_ALIGN));
>  
> -    for ( ; (const void *)tag - (const void *)mbi < mbi->total_size &&
> +    for ( ; (const void *)(tag + 1) <= mbi_end &&

It may be possible to argue away overflow concerns here. I'm not so sure though
for the case ...

> +            tag->size >= sizeof(*tag) &&
> +            (const void *)tag + tag->size <= mbi_end &&

... here. The earlier logic subtracting pointers wasn't susceptible to such.

Jan

