Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98581AFB7B8
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 17:43:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035681.1408032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYnzi-0006Gp-8Y; Mon, 07 Jul 2025 15:43:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035681.1408032; Mon, 07 Jul 2025 15:43:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYnzi-0006EX-5r; Mon, 07 Jul 2025 15:43:02 +0000
Received: by outflank-mailman (input) for mailman id 1035681;
 Mon, 07 Jul 2025 15:43:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uYnzg-0006ER-Se
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 15:43:00 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e6c509b-5b49-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 17:42:58 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a548a73ff2so3222101f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Jul 2025 08:42:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c845999e0sm88143035ad.202.2025.07.07.08.42.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 08:42:57 -0700 (PDT)
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
X-Inumbo-ID: 0e6c509b-5b49-11f0-a316-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751902978; x=1752507778; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tDtekhLQ7Ia0ZmXcNg2xYqi79Ye/TDna2+7UnXpz6iI=;
        b=ZCFp5CUH2IQnBD6NpMn/gZePqG6bTWYKFNzBmoMOrkN1xzhoKBpjItcT7SdHW1+ADQ
         OxfIl+/BkJpYyG60/hs+N6lgKxYxuvy2oJtfWM9rDt2t3Sl+7jbDT2J/faiH9NZa8O70
         7EPuGM5jzrqxnqWZSf/Rj6TS5NCgB2N0xAD6afAZ8XzMbnWnDQ8w1Wyq5lFzXzeRm+Dj
         TWE14ucnqmH86kLz0Tjz8cRhi1qyiE2PV1c5IPIkXL3TcUSpE3Z+GtVew9oFaX/a33+j
         Mm+AYfGrHdjJlPL+uvujhBqtNDrMdsfT6Z6liYLvaX0A4VXcptMIADNelPaAieH0oJMl
         /sSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751902978; x=1752507778;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDtekhLQ7Ia0ZmXcNg2xYqi79Ye/TDna2+7UnXpz6iI=;
        b=BA8LzP0SexYrR+zWs72h+WFOzVQJsmrPAHm8ohfktxzctk1GrWkOn8FVAgU+pkG/Ni
         UvGLcBbsSjW45/b+n3W1rEWH5axyJw7Aepolz+DNti3ob7SWP4zEZSreXf6Nx1w0hZLl
         yy2d4H411qSgAbg9tLbMlaNqgFWYWLVayzreZOWXV8ZpuQyw6FtV04eCAPfR8V+PjLKQ
         +7aCrdz62K2j7qwGB6kqqLtv8L7LWgHTVxhwaMZAJ3q6jZ7I1m4vC5aKERuqnRjkUz/h
         DXAubRCNFbBEp33Z2AhhEQZJAhfgzXHYZ1f04sY0pHuzqixR+XJELzAwJZ7V94ReyPHq
         0kJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBDjsSI4ENMGIMzuFaY7dzJP3IDe6dJtkTXquwFUn2s1prBmSw5Bsvw2QFsHme3P0C7PthT2Bz+vA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVBYiKdGrUgZ9h1tf6XpRWhxmejLeHJMOp62KM69pOUkHQN2e9
	lBPAP2lUH/7ccLis58Nv1pdlGMWJsOzHIlGCUIBczqnNl5aOPH2IARA9QuwMUQ2BxA==
X-Gm-Gg: ASbGncveFCWsHU2im8cAi+wb12cLNSXyZN0nq8ugdS/mv/EiAE/IOY2ubaoZT5uNGNn
	fxHHyVPATojbSdr7B9AR+//Dt7UJapHzZ/OC2Pl//M04VNPR7KqmU0akRmkJW4N7Cgee0urgj82
	PkNRLdaKT2MFNegf9Yg+d2rEj3iF04QezrZPIIKqKc6GcFonvCAqu3pqZqGZTL8cYWC19wCzwVn
	5w7791Pj8byCYvFDS/kX/ZNeUJFACgzt16lRwMx6S6lBi5mQqS+vEqBLAyYaJbAIHbssETzeJSW
	YaZ6ysgXzj0faA0a1m3npnirlsLWKvpkrCIHWwX/Xthvk+xsZa7D1GsqnWZK//1T1PG9dlk1MCB
	wfGIOKQW06l3y5E7wxpL6c42B36GFRSBoMLWZTUrL80D8IVI=
X-Google-Smtp-Source: AGHT+IE0rdh3XIOZbG4+4FXHqLt6vkO0WwWV3E8WPTuJrb39D/nhJNvRTObs/ZWFPFhkNlIJ2k2iGA==
X-Received: by 2002:a05:6000:2dc3:b0:3a5:1241:c1a3 with SMTP id ffacd0b85a97d-3b49aa828f8mr7154391f8f.50.1751902977564;
        Mon, 07 Jul 2025 08:42:57 -0700 (PDT)
Message-ID: <ab5d830a-8b59-46d6-9e97-12b351bcf221@suse.com>
Date: Mon, 7 Jul 2025 17:42:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/efi: Fix crash with initial empty EFI options
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20250707151122.292272-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20250707151122.292272-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.07.2025 17:11, Frediano Ziglio wrote:
> EFI code path split options from EFI LoadOptions fields in 2
> pieces, first EFI options, second Xen options.
> "get_argv" function is called first to get the number of arguments
> in the LoadOptions, second, after allocating enough space, to
> fill some "argc"/"argv" variable. However the first parsing could
> be different from second as second is able to detect "--" argument
> separator. So it was possible that "argc" was bigger that the "argv"
> array leading to potential buffer overflows, in particular
> a string like "-- a b c" would lead to buffer overflow in "argv"
> resulting in crashes.
> Using EFI shell is possible to pass any kind of string in
> LoadOptions.
> 
> Fixes: 201f261e859e ("EFI: move x86 boot/runtime code to common/efi")

This only moves the function, but doesn't really introduce any issue afaics.

> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -345,6 +345,7 @@ static unsigned int __init get_argv(unsigned int argc, CHAR16 **argv,
>                                      VOID *data, UINTN size, UINTN *offset,
>                                      CHAR16 **options)
>  {
> +    CHAR16 **const orig_argv = argv;
>      CHAR16 *ptr = (CHAR16 *)(argv + argc + 1), *prev = NULL, *cmdline = NULL;
>      bool prev_sep = true;
>  
> @@ -384,7 +385,7 @@ static unsigned int __init get_argv(unsigned int argc, CHAR16 **argv,
>                  {
>                      cmdline = data + *offset;
>                      /* Cater for the image name as first component. */
> -                    ++argc;
> +                    ++argv;

We're on the argc == 0 and argv == NULL path here. Incrementing NULL is UB,
if I'm not mistaken.

> @@ -402,7 +403,7 @@ static unsigned int __init get_argv(unsigned int argc, CHAR16 **argv,
>          {
>              if ( cur_sep )
>                  ++ptr;
> -            else if ( argv )
> +            else if ( orig_argv )
>              {
>                  *ptr = *cmdline;
>                  *++ptr = 0;
> @@ -410,8 +411,8 @@ static unsigned int __init get_argv(unsigned int argc, CHAR16 **argv,
>          }
>          else if ( !cur_sep )
>          {
> -            if ( !argv )
> -                ++argc;
> +            if ( !orig_argv )
> +                ++argv;
>              else if ( prev && wstrcmp(prev, L"--") == 0 )
>              {
>                  --argv;

As per this, it looks like that on the 1st pass we may indeed overcount
arguments. But ...

> @@ -428,9 +429,9 @@ static unsigned int __init get_argv(unsigned int argc, CHAR16 **argv,
>          }
>          prev_sep = cur_sep;
>      }
> -    if ( argv )
> +    if ( orig_argv )
>          *argv = NULL;
> -    return argc;
> +    return argv - orig_argv;
>  }
>  
>  static EFI_FILE_HANDLE __init get_parent_handle(const EFI_LOADED_IMAGE *loaded_image,
> @@ -1348,8 +1349,8 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
>                                    (argc + 1) * sizeof(*argv) +
>                                        loaded_image->LoadOptionsSize,
>                                    (void **)&argv) == EFI_SUCCESS )
> -            get_argv(argc, argv, loaded_image->LoadOptions,
> -                     loaded_image->LoadOptionsSize, &offset, &options);
> +            argc = get_argv(argc, argv, loaded_image->LoadOptions,
> +                            loaded_image->LoadOptionsSize, &offset, &options);

... wouldn't this change alone cure that problem? And even that I don't
follow. Below here we have

        for ( i = 1; i < argc; ++i )
        {
            CHAR16 *ptr = argv[i];

            if ( !ptr )
                break;

and the 2nd pass of get_argv() properly terminates the (possibly too large)
array with a NULL sentinel. So I wonder what it is that I'm overlooking and
that is broken.

Jan

