Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A9194B8F9
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 10:26:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773778.1184212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbySf-0006aL-2u; Thu, 08 Aug 2024 08:25:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773778.1184212; Thu, 08 Aug 2024 08:25:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbySf-0006Xs-0M; Thu, 08 Aug 2024 08:25:29 +0000
Received: by outflank-mailman (input) for mailman id 773778;
 Thu, 08 Aug 2024 08:25:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sbySd-0006Xm-MH
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 08:25:27 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c23b752f-555f-11ef-8776-851b0ebba9a2;
 Thu, 08 Aug 2024 10:25:25 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a7d2a9a23d9so77859866b.3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 01:25:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9e849a0sm713084766b.186.2024.08.08.01.25.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Aug 2024 01:25:23 -0700 (PDT)
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
X-Inumbo-ID: c23b752f-555f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723105524; x=1723710324; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tbDcsWIOxquofFn6/C3Fg72f8HmtE3hKT4qBwwY9+so=;
        b=L8ZzE3IBmzLBC7ZeF9GgHRX/xdKO2lPNRH7DgMTJsWkTdnx/iwf6zYQNOFauKcWOzl
         oAQOrLmjMTKs/9eC7lfTUSQ/ZKYVuoCQtBnG28ch3CjLlCXB9bO5oIVKZLTYmrpxOxw0
         rPDIKWQZTdCYm9XVIBkbiWzG4aTFBt1/iuXUP/1NkTa4CsNkMP97vhmrAsEMJyVq78MY
         kjd4ZGqpg7m2yYPN0rUbpIvDziJIlZWdnZpjijpbx9Fm/w9di7JlY+t3iiscSpJqf8OD
         54KIa4Dj7Ixqi3h7kb37RkdsT4e5t9iiC/qnY4YN2QQ3LWyMG7jxNAeN/tSbq4OpLlIm
         kk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723105524; x=1723710324;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbDcsWIOxquofFn6/C3Fg72f8HmtE3hKT4qBwwY9+so=;
        b=so7QQxmu0qViqizukUpwgTHZl5ppv/2crMkfOA5J5aqSnHwzdGdRs/s+fFRr8g2zzI
         49x+SqwaQX9p56cbv/aUZj5Fj2VDtnxj7wi4zSwCj3uf/j9OoVER93PVPkSL1rdmfxJ/
         aUTfVzbiX2c6wz+DfZz/p2rO5BN/GMRjI2InPFVo66/wK1PO7Ja/u7nofAT4+mFaf6IC
         gB+dQ1uZ3ZDjp5ZtKaKxShdhq871/fC+6f/npE8T7PKlmRYbiZb5X86OnU5QAUZQFwxf
         5X+98k6B4d2O2H4akby7Jxz6ze3syS0/HnxKHMPI33RTFNt8ENElEJGQjliQn9VKcXAP
         RmLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZ55KGLuUpW06c3HfXUq+cRfkH/HTWhh3aQsokdWXwFj506RA4K720CV+ztwmnxIwZcwOkQ+fBX66lo7q8Gp7G6aXugp5mcLrtcuIrOfo=
X-Gm-Message-State: AOJu0YwGt4UDBZW84ftjPzJPmHAGwuAGPmsZAKy79yINviEcrS0kAwc6
	/xu+epTm20gHOvzNAs/iWGXG3qxsnZzpAcHDpjC1ICSbn0Fr10VVQGrUsH406A==
X-Google-Smtp-Source: AGHT+IGhvO0jeCi7OjizkFBa1xmuedP4VzCRoAXWil4FYJGjw9wQUd497/Qlun6BwlXzPK+UWyOa7w==
X-Received: by 2002:a17:907:9815:b0:a77:c26c:a571 with SMTP id a640c23a62f3a-a8090e63227mr72824566b.54.1723105523588;
        Thu, 08 Aug 2024 01:25:23 -0700 (PDT)
Message-ID: <cf819b39-6ce8-4446-b7b6-a1b247f45400@suse.com>
Date: Thu, 8 Aug 2024 10:25:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] x86: Set xen_phys_start and trampoline_xen_phys_start
 earlier
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240807134819.8987-1-alejandro.vallejo@cloud.com>
 <20240807134819.8987-4-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20240807134819.8987-4-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.08.2024 15:48, Alejandro Vallejo wrote:
> No reason to wait, if Xen image is loaded by EFI (not multiboot
> EFI path) these are set in efi_arch_load_addr_check, but
> not in the multiboot EFI code path.
> This change makes the 2 code paths more similar and allows
> the usage of these variables if needed.

I'm afraid I'm struggling with any "similarity" argument here. Imo it
would be better what, if anything, needs (is going to need) either or
both of these set earlier. Which isn't to say it's wrong to do early
what can be done early, just that ...

> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -259,6 +259,11 @@ __efi64_mb2_start:
>          jmp     x86_32_switch
>  
>  .Lefi_multiboot2_proto:
> +        /* Save Xen image load base address for later use. */
> +        lea     __image_base__(%rip),%rsi
> +        movq    %rsi, xen_phys_start(%rip)
> +        movl    %esi, trampoline_xen_phys_start(%rip)

... this path is EFI only if I'm not mistaken, while ...

> @@ -605,10 +610,6 @@ trampoline_setup:
>           * Called on legacy BIOS and EFI platforms.
>           */
>  
> -        /* Save Xen image load base address for later use. */
> -        mov     %esi, sym_esi(xen_phys_start)
> -        mov     %esi, sym_esi(trampoline_xen_phys_start)

... the comment in context is pretty clear about this code also being
used in the non-EFI case. It is, however, the case that %esi is 0 in
that case. Yet surely you want to mention this in the description, to
clarify the correctness of the change.

Also in the code you move please consistently omit insn suffixes when
they're not needed. Just like it was in the original code, and just
like you already omit the q from "lea".

Finally, if you used a register other than %rsi (say %r14) you could
replace the "lea" after x86_32_switch by a 2nd "mov", similar to the
one that's already there to load %edi. (You'd need to move the new
code up by yet a few more lines, to cover the jump to x86_32_switch
there, too.)

Jan

