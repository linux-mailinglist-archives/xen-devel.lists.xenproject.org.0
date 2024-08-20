Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB016958072
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 10:04:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780091.1189677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgJpT-00036H-Gu; Tue, 20 Aug 2024 08:02:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780091.1189677; Tue, 20 Aug 2024 08:02:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgJpT-00034k-DF; Tue, 20 Aug 2024 08:02:59 +0000
Received: by outflank-mailman (input) for mailman id 780091;
 Tue, 20 Aug 2024 08:02:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yfvp=PT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sgJpS-00034e-Lu
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 08:02:58 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98d01c13-5eca-11ef-8776-851b0ebba9a2;
 Tue, 20 Aug 2024 10:02:51 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5bed83488b3so3818537a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 01:02:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bebc081db4sm6417283a12.88.2024.08.20.01.02.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 01:02:50 -0700 (PDT)
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
X-Inumbo-ID: 98d01c13-5eca-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724140971; x=1724745771; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1FJt9eAEABnZpwBHrjTH5qZRhZMkcYzlKlXsfayNvI=;
        b=dKgFWgbAteO3ZUo03QKuiXe0Tq0BfiZZeEhaQ15Mzts7JcNy4W+LhRLSDx7c5nk9Qj
         KWFsSRpy89x8WFQ6Uncl1vrNncvmgEwHse5jqgR8iyMzK1rG56m5jSdvZmxvYWFg0bqH
         envmcTe7AXhTq+S1omjyttFloTNlLP4ALh3plJiQ6bWXzqfzUaim44FEZMOzPIqh5nMx
         5daZlHVu4GDbVwkpo27IEWP17904p35wHrbfDa3t6XJAqU5mj6fZ3ZJXlicG0/xDSvI+
         cNjl6suwEmhM7J+Lri4+a35CuZ6cnB5uzR/nO035hK90nYQUUsl4IHuWsk2sD1unKw4d
         gIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724140971; x=1724745771;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1FJt9eAEABnZpwBHrjTH5qZRhZMkcYzlKlXsfayNvI=;
        b=TTLmof03fcyDMMFYjNKdY+VA5ow3ZdbtzI5lkjOxAQFfHtFZWVaZMac+C8ede3mnk6
         nYaFNVthD6RcZphJakTyVmu+AuOYo5d9VY611OQG3pH2N3Hco5pyDm5aK2ZsfbgNtagk
         cI9ArBMm4ks0nf9v+SJeICGgyy0Ho+rlFcCHCzRZqQx06shg9NfE5ouF81Gc6mQqEzWf
         UONtaL7Tfh2UP+VWTxB065PlzvHl3du4GpO+uawbzSZaphG+l9YgwaQyHCWuRQJCKlgc
         OWDQRUYt2JQoTPMvzaK11JVpS5sL5vjYFINFMRMNDNc6HNkToRCl33HCYJ/0ZhJPnJSS
         T0oA==
X-Forwarded-Encrypted: i=1; AJvYcCVqwnpfpyY+4G/WRiBaPLDBS0lGigJXNXFMK3gaqD69aEPA+4+hKOUhLL/Z42ady7hLfdljf/JDGS0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDFEw2oS4g2W8hV9Svdaaedprg0ObIUHjub7wzoiQWhB8WYQ7k
	UdM2d/BspgNIupHRJ7PNWxku4nBLImEcj/rlAmcjXMkjCSlpaze+g7Vrbd0lWg==
X-Google-Smtp-Source: AGHT+IFxefm2gVt2u9I63nMfavTQwHp2RZkmlnXqMDx4XNixhmwJ9sCj+14+ww1fBA4JqYnED9tyqQ==
X-Received: by 2002:a05:6402:13d5:b0:5be:ee30:9951 with SMTP id 4fb4d7f45d1cf-5beee309fbemr5662468a12.7.1724140970522;
        Tue, 20 Aug 2024 01:02:50 -0700 (PDT)
Message-ID: <9a0d75a9-bd0b-4caf-83f7-d24cadf80ed8@suse.com>
Date: Tue, 20 Aug 2024 10:02:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] x86: Set xen_phys_start and
 trampoline_xen_phys_start earlier
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240814083428.3012-1-frediano.ziglio@cloud.com>
 <20240814083428.3012-3-frediano.ziglio@cloud.com>
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
In-Reply-To: <20240814083428.3012-3-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.08.2024 10:34, Frediano Ziglio wrote:
> No reason to wait, if Xen image is loaded by EFI (not multiboot
> EFI path) these are set in efi_arch_load_addr_check, but
> not in the multiboot EFI code path.
> This change makes the 2 EFI code paths more similar and allows
> the usage of these variables if needed.

It still remains a just-in-case change this way. It's init-only code,
so the code size increase doesn't really matter, yet having such
redundant code without a good explanation is at risk of being
confusing down the road. Therefore - if this change is needed in a
later patch in this series, please mention the intended use case
here, or perhaps simply fold both patches.

> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
>  xen/arch/x86/boot/head.S | 5 +++++
>  1 file changed, 5 insertions(+)
> ---
> Changes since v1:
> - Do not remove other hunk, used for BIOS;

As indicated on the v1 thread: The writes simply write 0 in the BIOS
case. It's the PVH case which needs them. With that I see two options:
Move the existing code to ahead of __pvh_start's jump to
trampoline_setup (my preference), or at least make sure that in the
MB2 case we don't write the two variables a 2nd time (else raising
the question of whether the same value is written, or why the value is
okay to change.)

> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -240,6 +240,11 @@ __efi64_mb2_start:
>          jmp     x86_32_switch
>  
>  .Lefi_multiboot2_proto:
> +        /* Save Xen image load base address for later use. */
> +        lea     __image_base__(%rip), %esi
> +        mov     %rsi, xen_phys_start(%rip)
> +        mov     %esi, trampoline_xen_phys_start(%rip)

As iirc also indicated in reply to v1 already: The existing code you
clone uses two 32-bit writes. What's the point of using a mix here?
If the address was really above 4G, we'd have an issue anyway, wouldn't
we? (Leaving aside that the LEA already truncates the value anyway.)

Finally I'd like to recommend to avoid the use of %esi here. It gives
the wrong impression of sym_esi() becoming usable, when in fact %esi is
zeroed ...

>          /* Zero EFI SystemTable, EFI ImageHandle addresses and cmdline. */
>          xor     %esi,%esi

... immediately afterwards.

Jan

