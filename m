Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B4694B839
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 09:50:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773753.1184192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbxtv-0007dc-2A; Thu, 08 Aug 2024 07:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773753.1184192; Thu, 08 Aug 2024 07:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbxtu-0007ax-VM; Thu, 08 Aug 2024 07:49:34 +0000
Received: by outflank-mailman (input) for mailman id 773753;
 Thu, 08 Aug 2024 07:49:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sbxtt-0007ar-Qa
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 07:49:33 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfcb38b7-555a-11ef-bc04-fd08da9f4363;
 Thu, 08 Aug 2024 09:49:32 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5b8c2a61386so793775a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 00:49:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bbb2d34a69sm369770a12.70.2024.08.08.00.49.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Aug 2024 00:49:31 -0700 (PDT)
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
X-Inumbo-ID: bfcb38b7-555a-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723103372; x=1723708172; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dy+N9f0P7qZ431Chc19ivswpPwLGLpvsx4lm/PF1zX8=;
        b=bSgJ5NkoB7jyJz6d5WVbaE9zC603pmRHFGfM+qq/JYSQmjYYJgfCI5d8wLVtdnR0B8
         BZMDDvgqEHcvAZLBMWJBBtiDU6Jeq+in0hC/19ndifpby03pIXU1qnTJU5GRO68/kG8p
         II0lixVk6o8Ynn5fcIPcSbDpCK461jTSFZjLhUGXzvRSLY3RvR6BQx8q8LyA4Sez6x/x
         OxWjz6ar8JC22TfrEfca55M1HvSCmrBGx/hrmD9sKmGGOWdSGJsS4EaSRj1Uq6hS4WSd
         H+ABW1Ld0nuPUwXg8X2vXjGxLtJHRP5dUGoFIPbpRjZEVVM24jwXjk4msuLRTd1gGqhQ
         0skw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723103372; x=1723708172;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dy+N9f0P7qZ431Chc19ivswpPwLGLpvsx4lm/PF1zX8=;
        b=ln8XhIyECXbvS5228cPrUYmjiSs0oFEYa3gc1GT9wv8n+WE5Aira/Rx6SDpJqt0ExT
         P2XJgmHsuSph9LR1/71zLxQmqfhsFL3zYMcOimRlcePbxQXqJ8oSKBqpYQbZYpyRPE+Q
         OW6n9kZ3r82xeP1+5CP/6GdhvVyxa0ZgzYg0hRApzvjvR0TeVU1Bo7JTgKi4u1HBjfa+
         D5GlYjkEjoAFkadzaxBvdDF9CBxsFidE/guad2W3nSy28UPqRaWd13e2tgWNj6a11yVm
         z+lXPi3jtYHNJNw0FDz6mL3De9XY8d5i1E9mpU9ExGhzh5i06QbaikG4dU6oekL5kPUy
         NSUA==
X-Forwarded-Encrypted: i=1; AJvYcCWuyqfNjleaNOTB3uiNO3i8cfAiUvknkMz2e/86p/3POdIMZgnxfoS3bGcU+tryF8MnccWfCWAaVfsaz/hPkZrR38/gl3hjWGSEINLVypw=
X-Gm-Message-State: AOJu0Yx19CDDaaVZX1dnfRUm1JW0vYb/bYd6MiFJMjY8y5pcblpxLnNY
	gldbQo3QoKoXGA7pyQYMVZVwPhWgUKlI0p/oFiAktaog+z3mTC57T6Sg+1w98Q==
X-Google-Smtp-Source: AGHT+IFr/U85rnSIZALNdBIx2UOvzx6GmS6M3+hn2qhYW+AXAGBJm3ri3YpVysrhcusy8Xiajp0TNQ==
X-Received: by 2002:a05:6402:1d4d:b0:578:60a6:7c69 with SMTP id 4fb4d7f45d1cf-5bbb23def27mr701785a12.30.1723103371677;
        Thu, 08 Aug 2024 00:49:31 -0700 (PDT)
Message-ID: <7f1e17dd-d105-4f6c-87d3-69f3dca4ab82@suse.com>
Date: Thu, 8 Aug 2024 09:49:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] x86: Fix early output messages in case of EFI
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240807134819.8987-1-alejandro.vallejo@cloud.com>
 <20240807134819.8987-3-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20240807134819.8987-3-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.08.2024 15:48, Alejandro Vallejo wrote:
> If code is loaded by EFI the loader will relocate the image
> under 4GB.

This is the MB2 EFI path you're talking about? Since there are two paths,
I think this needs clearly separating in all descriptions.

If it is the MB2 path, then "relocate" isn't quite correct, I think:
Relocations aren't applied in that case, as none are present in xen.gz.
I'd rather call this "put at an address below 4G". However, that isn't
any different from the non-EFI MB1/2 paths, is it? I feel like I'm
missing something here.

> This cause offsets in x86 code generated by
> sym_offs(SYMBOL) to be relocated too (basically they won't be
> offsets from image base). In order to get real offset the
> formulae "sym_offs(SYMBOL) - sym_offs(__image_base__)" is
> used instead.

The main calculations of %esi are, if I'm not mistaken,

        /* Store Xen image load base address in place accessible for 32-bit code. */
        lea     __image_base__(%rip),%esi

and

        /* Calculate the load base address. */
        call    1f
1:      pop     %esi
        sub     $sym_offs(1b), %esi

i.e. both deliberately %rip-relative to be position-independent. What's
wrong with this?

There are many more uses of sym_esi(). Why is it only this single one
which poses a problem?

> Also, in some case %esi register (that should point to
> __image_base__ addresss) is not set so compute in all cases.

Which "some case" is this?

> Code tested forcing failures in the code.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

No Fixes: tag?

Jan

