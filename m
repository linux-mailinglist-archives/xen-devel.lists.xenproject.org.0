Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 154A2CAC792
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 09:18:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180058.1503304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSWRZ-0000AR-HU; Mon, 08 Dec 2025 08:18:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180058.1503304; Mon, 08 Dec 2025 08:18:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSWRZ-00007b-EZ; Mon, 08 Dec 2025 08:18:05 +0000
Received: by outflank-mailman (input) for mailman id 1180058;
 Mon, 08 Dec 2025 08:18:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSWRY-00007V-GE
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 08:18:04 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a4776b5-d40e-11f0-9d1b-b5c5bf9af7f9;
 Mon, 08 Dec 2025 09:18:03 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4775ae5684fso20823395e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 00:18:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d331e62sm24538905f8f.35.2025.12.08.00.18.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 00:18:01 -0800 (PST)
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
X-Inumbo-ID: 6a4776b5-d40e-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765181882; x=1765786682; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uaelIxKgZbg/vTI+hjRH0f2tHh1thJuCEDAmmPig8u4=;
        b=G7ij4SUIh9uK1ERiWP4qCgZ67tnkZ8KgPZ1VU7v+54EKjoYX5XKRbDTwDc/E8b2srZ
         uNZQJHc6CtpdlCm+d1sYuZNJjqlQhHkL6XihEJO+ec86hhILnnLfDaeiyHUzbfKLXNsB
         TbXaUYmGDxoD2PZVPtnw+tm7n/RZDxaKruMGYe1mKoQdy1nr7pDisq/3umAnWPtuSWeZ
         wtGRRHbyjHIqRiK2ihDJ1E96WVDZL8ZIuJIaRCMOR/iqc8tYa8b7RtfTTyKzPmkuVf3q
         Us4enO0lJ7DanC0QSEkR7INbdZyUD9OQpvyscHMCnRlrOqEaDHCAbAs5m5HJt04X2jxA
         Ce1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765181882; x=1765786682;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uaelIxKgZbg/vTI+hjRH0f2tHh1thJuCEDAmmPig8u4=;
        b=vt5gMw+dQmeLUIwFvbjfD+0CBNu0ZhSn//lj25bchGI+WY5bmmCMXF0lWzv3fQiYQl
         IgEvIjuS5E+MJHNy9pnToFsAs3fTSU41iuX1w7CT7kGrdvl5G2qddHi7A/bws8LQ4ZfA
         6XvZ7XIpUnywZEoXz3mHkozblJ0EYF1v4Lac/OU5rD3el7ay8j/ZtuDztFjYmQGIYK7t
         vSX6elHXnx0HA71Hq+rpgyfQ5e9ZUMANMA6PpK1zD+b9a/9EE/VtiCZarRa8xMr2jbD2
         G39NGtCOLEMYvCOZbIt3Y6BVYR6tRni+Ek5a4QdZJ/Yy9LhQG/ApXQdWjb/fEzPsLyF7
         WW3g==
X-Forwarded-Encrypted: i=1; AJvYcCXAJzWsLqkJKYrZAjsu1Qz4j7Q49DKT4r/FOxld5J91sakshfQbRIIaTdTXh1ftw8iSajFpcuY2XXo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxmH548BeFHr4lAsXMhZJL+nmJ1LuWBH8/t2a37tjwPOsMD/SL1
	EEONYfeB3A69Z394pG/zFCVn/y6RZCgxRwPFdfXvV8hShbuEzSRabz+3RM6pJXczz6+227+4PUF
	P788=
X-Gm-Gg: ASbGncsyCinz/kltc3+YbjchNYYnhKKZ35FlHdROctbEFPrmJwOSsAR/ncWHwFm1LD+
	eKYPtbrDdpd2ZCAaAzYmTR4RlnqRuMf67Rl0SapjUohMyqcWa0SsokjcEt0eLzLREGYv3EaoKI6
	aOd8yNr8LaYHSe2/UOkUr669nGsGiDWB2ddJbuLRC01BU5+5K7Qk/hRqOK7lCHh3hNf9jkasKR/
	LC9qcv+4BjxiYYXzSZuknYQtD9bKGgvu+27TNQf+YpmbVKFoUiFdXqXQM/IEuhFNtwidwOn+Phr
	fJ0nyyEqO5h1BnRczLFnL7Bl7PAk5nerIz9FCvB5U7QzY+bTeQwPRFT2dwiSgAUPwFAr0vxE8DR
	3b0ugyePa5pK6GiK7C066pUv4fh1sf2xpHAdRJHpA8zhHEJD34b9WyF8EQTooOr9dK/eO5F5h7p
	j8JeDZejQ11PnTMP4T5xYSIpj7pPHKfh+vxZvlA2XrMyuSoIwYjEtqZAEfLGKxrv6FIxdVAY5jK
	tQ7kEgQj7A9Bg==
X-Google-Smtp-Source: AGHT+IG4fHwbqdIaDwDKIiaV1wPZHApgf8r0cpC323o9sdviAUfa2+BWbM4tFLrcQtOXuQtoUly9gQ==
X-Received: by 2002:a05:600c:5489:b0:477:2f7c:314f with SMTP id 5b1f17b1804b1-47939dfb990mr74560975e9.10.1765181882121;
        Mon, 08 Dec 2025 00:18:02 -0800 (PST)
Message-ID: <530ca67a-926c-4b38-93af-230f302bd6a7@suse.com>
Date: Mon, 8 Dec 2025 09:18:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/kexec: Replace CALL+UD2 pattern with JMP
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251205152905.1925700-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251205152905.1925700-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.12.2025 16:29, Andrew Cooper wrote:
> Linux jumps to the target image rather than calling it.  Switch to using JMP,
> and drop the trailing UD2s.
> 
> Linux does have a mode, named CONFIG_KEXEC_JUMP, where the target image can be
> returned from, but that involves extra metadata and setting up a stack within
> the target image which Xen doesn't support at the moment.
> 
> No functional change.
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I wonder though why CALL was used in the first place. Usually this would be
to e.g. have the callee have a call frame in order to e.g. unwind. For kexec
that may not be overly relevant though.

Jan

> --- a/xen/arch/x86/x86_64/kexec_reloc.S
> +++ b/xen/arch/x86/x86_64/kexec_reloc.S
> @@ -75,10 +75,8 @@ FUNC(kexec_reloc, PAGE_SIZE)
>          testq   $KEXEC_RELOC_FLAG_COMPAT, %r8
>          jnz     .L_call_32_bit
>  
> -.L_call_64_bit:
> -        /* Call the image entry point.  This should never return. */
> -        callq   *%rbp
> -        ud2
> +        /* Jump to the image entry point */
> +        jmp     *%rbp
>  
>  .L_call_32_bit:
>          /* Setup IDT. */
> @@ -170,9 +168,8 @@ FUNC_LOCAL(compatibility_mode)
>          xorl    %eax, %eax
>          movl    %eax, %cr4
>  
> -        /* Call the image entry point.  This should never return. */
> -        call    *%ebp
> -        ud2
> +        /* Jump to the image entry point. */
> +        jmp     *%ebp
>  END(compatibility_mode)
>  
>          /* Separate code and data into into different cache lines */
> 
> base-commit: 351d41e8aecc3f7566a0baa7b4066d06dedd7113


