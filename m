Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA560852C2B
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 10:20:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679822.1057532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZowl-0001f5-7I; Tue, 13 Feb 2024 09:19:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679822.1057532; Tue, 13 Feb 2024 09:19:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZowl-0001dX-3n; Tue, 13 Feb 2024 09:19:23 +0000
Received: by outflank-mailman (input) for mailman id 679822;
 Tue, 13 Feb 2024 09:19:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W/Jz=JW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZowj-0001br-4y
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 09:19:21 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f766fdf1-ca50-11ee-98f5-efadbce2ee36;
 Tue, 13 Feb 2024 10:19:19 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5118290fcd8so2793126e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 01:19:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 jh3-20020a05600ca08300b0040fc2f07ed5sm11216065wmb.27.2024.02.13.01.19.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 01:19:18 -0800 (PST)
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
X-Inumbo-ID: f766fdf1-ca50-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707815959; x=1708420759; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nKj/+wciyxJwE0z01LK1QsewmS+8/rBBWDtjfT3M9Q0=;
        b=JLQraWFi7q6gWCGvcNuNWGqL3AzoRGtbGE9T4WEfjFP2/gSmQi+yqg4bh8IR4gLauU
         ayhLpEJ2qLQNNNw2XH+An4kNkVKmBZUQpoehV10PblIGNe7x20AI3eZ7mwW9xN3lY421
         e8wAVhK7fwjRXoROtsTaROA6xqCDo06Ubf007hvK94AmtEHV0uqK2vVUGiOI0inz8Ous
         1f0G99sl9Ir33wBtOin05ahCZDlCK1MTSZqLCi78E7TtDWR3yY+Ynf1GCSVx6SU28Tzb
         svYXl5xpONcJAu6yuwiU1nRzrnSk57Pk9HFS7tAce5jaGU9JZaPYw7JfhieFXRHJLu23
         8BpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707815959; x=1708420759;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nKj/+wciyxJwE0z01LK1QsewmS+8/rBBWDtjfT3M9Q0=;
        b=AYEppFVr4jre+652/fTGryKzZTHIq7EwgdjwZIQyctpc88amcjD+y9hRK3oyIkC8C1
         iB47n5hjLlOY3tMw2VNdUYb8ddH9BzeYBoY10RJ8L8+FopsEjXUzklze4RWl4De9LTuF
         FctndcgV4bOZPBPiZt/KwLJ1HnZeHXSfate55Z3S7363vfM6OkRzwf+jv2nK0T7PBD+Y
         ZoYqCOK8qD/kZRDm540y98eY5eBTRge/0MmrdLsrAMY+MgswYV12EszEhMUREIvyu4A1
         dMS/WCLkp4kja7WwhSiywl0EPdNLLSWc44tg5VutvuBZ5FZaI4x8CLJjQs0JUtUtPpQB
         lSCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnCgknNLj8iFdlw5azZoPZHMzhv2yP55VNJ8IF+3qzRdhtyuIMZcbFfBGrJmYHp7EL1TwJqo6C4LezvuimQrtUscyeDurcdCDHy4IVnE4=
X-Gm-Message-State: AOJu0Yx/0bVGsPe0OL/FXpYLHOJQi32PbfnG0q1XH7+lq6Ro2CArWQDZ
	24vpI/7yPT0U63Hgku94lEQbLYTekoSZGnwYlVbxnQR8PQmWKzwZXF+WPN3yqA==
X-Google-Smtp-Source: AGHT+IFT20TzYtnYSW2IvS5yNTIqq1fIVMYvqpDzh9tdyUr70orVtw/WpHosKChqq8Hv8psiSAJZFg==
X-Received: by 2002:ac2:5312:0:b0:511:79f3:c217 with SMTP id c18-20020ac25312000000b0051179f3c217mr5748067lfh.39.1707815958701;
        Tue, 13 Feb 2024 01:19:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXtMCFHiUKWCIpFwkdxYIPbHjbeLMLUU0+uIL3tj5yVJDtiGRkN5dO1egUKZ3jogj0T6AlFCfE1lIXMCnIrWhu45vjHuaTLDPEYK7az5csXgXG+zCjpJu27iOombErRQMnxRjrbRxMT87Br71X6by8Cij9xkqd9/pMsR2utBGKEhP5u30JIa5BwxeFJR69bfco/iRA5zvbXUPBbtu94/JvQJpkQTh6bYMZBnmzbtvar8ndqWgOtF/KFOEvntVyspNy5Nz6OQNP5+hKFtT6Nf7pCa+ujEhHXKIXxT+mNv3BaOjwAwmF0v5k=
Message-ID: <28b843a6-cf88-4443-b9c8-54561b9e753a@suse.com>
Date: Tue, 13 Feb 2024 10:19:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/30] xen/riscv: introduce bitops.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <f76bd85f4b64a47c59c0b306ce425036819fa380.1707146506.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <f76bd85f4b64a47c59c0b306ce425036819fa380.1707146506.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2024 16:32, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -50,6 +50,8 @@
>  # error "Unsupported RISCV variant"
>  #endif
>  
> +#define BITS_PER_BYTE 8
> +
>  #define BYTES_PER_LONG (1 << LONG_BYTEORDER)
>  #define BITS_PER_LONG  (BYTES_PER_LONG << 3)
>  #define POINTER_ALIGN  BYTES_PER_LONG

How does this change relate to this patch? I can't see the new symbol
being used anywhere.

> --- /dev/null
> +++ b/xen/include/asm-generic/bitops/__ffs.h
> @@ -0,0 +1,47 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_GENERIC_BITOPS___FFS_H_
> +#define _ASM_GENERIC_BITOPS___FFS_H_
> +
> +/**
> + * ffs - find first bit in word.

__ffs ? Or wait, ...

> + * @word: The word to search
> + *
> + * Returns 0 if no bit exists, otherwise returns 1-indexed bit location.

... this actually describes ffs(), not __ffs(), and the implementation
doesn't match the description. The correct description for this function
(as Linux also has it)

 * Undefined if no bit exists, so code should check against 0 first.

Which raises a question regarding "Taken from Linux-6.4.0-rc1" in the
description. ffs.h pretty clearly also doesn't come from there.

I first I thought I might withdraw my earlier request to split all of
this up. But with just these two observations I now feel it's even
more important that you do, so every piece can be properly attributed
to (and then checked for) its origin.

Jan

