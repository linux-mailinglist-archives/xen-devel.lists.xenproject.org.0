Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 073259768C2
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 14:11:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797388.1207322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soiei-0002ho-9L; Thu, 12 Sep 2024 12:10:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797388.1207322; Thu, 12 Sep 2024 12:10:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soiei-0002gI-6Z; Thu, 12 Sep 2024 12:10:36 +0000
Received: by outflank-mailman (input) for mailman id 797388;
 Thu, 12 Sep 2024 12:10:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dRhM=QK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soieg-0002gC-Sk
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 12:10:34 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 027b3cce-7100-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 14:10:32 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5365c060f47so1020086e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 05:10:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd76f55sm6448854a12.69.2024.09.12.05.10.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 05:10:30 -0700 (PDT)
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
X-Inumbo-ID: 027b3cce-7100-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726143032; x=1726747832; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7KVk5ajtkoQUh4b17HzpNr6LI1LdLEhFp3rndfm4Lv4=;
        b=gpyA3aN+gkXivJLSg7l8tHmNFY5GBKBW5WdOJ0DeE4Ru0BTgB8W+Bokt+Ra6RfZDhu
         uArRL3JIMxuskjjMA6LYqpzjsjgReBjHibFlZQjw4ItEsusxOAtmdxgzMInDnTRm9/wU
         L8NrxH8aj29ncwCsoZASxqxRVCnVZAfMC9lKVrUXZXLo520akpBf2YmgjlvEm/dspAZQ
         uItwRvEx98H62xg3y/XAY/Kyks14hKPGrvtAmx0c1uHD9K8ppXEjiC/C4K7ymuq7UewX
         NLuh4cXEmrj9AWkS4zfFO+TUqvGrjx+Bawk+RBC+XKu2H5qs5DntirCBUB18WWHcYhkg
         yqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726143032; x=1726747832;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KVk5ajtkoQUh4b17HzpNr6LI1LdLEhFp3rndfm4Lv4=;
        b=dM2ASnyNCrxiU//MzRLF+jZBjTxMmBNj/Xjv4jR2BnG790GBHS5fZvjOaZ4KCQOiOK
         uG0REnBjfgeqn4AzSepNC3N5Ced7Yfh4GFV4JoiuJQGFlIDpT7/pvDcTCZZCxllJydu+
         gEEFJrLxicVoafvDGP6pPOeeEdTh6S1pyBIfKEtIXGoFwOboP0sc9sa5jUF8KjNZA0BN
         gfRUaA8Z3FvPBB7Yxl/STJnQ7kaO54CExV+O84DEyH9Q+DK4+KizRdC9q4ksdGDJ2JCF
         U5wzoly9++nG1s83mQViQVblcc+4SCpbLxeTrmnK1aHB1Nstc2Sm8lywIBGUnModHvyC
         /gqw==
X-Forwarded-Encrypted: i=1; AJvYcCVQwWmsbW0qfFZ98yYEb0tG06XrP9CIN/WWiSaI/JfS98ZjoPGG/m/LD6vrT73UAa73iTW2TrFpq9w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5enxSLbXWYBhZ2SqVojlR3q/b2yATGF1zCZDpjTJERy+KmQwW
	u2dNrXb9qrVqAFipG7/YQM0opRl09NXjTW1g4m1ZD0AUjkJSbl2jl3LIrV8ISA==
X-Google-Smtp-Source: AGHT+IH7h7zb26FjHIiNSDJsC+HZwpZ2abRua4qIiU+fO59lVQcmi0KPoz/M/i6wCbPnj7IL/wYWsw==
X-Received: by 2002:a05:6512:114b:b0:535:6400:1da8 with SMTP id 2adb3069b0e04-53678fce764mr1537880e87.28.1726143031992;
        Thu, 12 Sep 2024 05:10:31 -0700 (PDT)
Message-ID: <7e7f879c-55df-404f-b35f-edddbadc0962@suse.com>
Date: Thu, 12 Sep 2024 14:10:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: Simplify stdvga_mem_accept() further
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240912120602.1677194-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240912120602.1677194-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.09.2024 14:06, Andrew Cooper wrote:
> stdvga_mem_accept() is called on almost all IO emulations, and the
> overwhelming likely answer is to reject the ioreq.  Simply rearranging the
> expression yields an improvement:
> 
>   add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-57 (-57)
>   Function                                     old     new   delta
>   stdvga_mem_accept                            109      52     -57
> 
> which is best explained looking at the disassembly:
> 
>   Before:                                                    After:
>   f3 0f 1e fa           endbr64                              f3 0f 1e fa           endbr64
>   0f b6 4e 1e           movzbl 0x1e(%rsi),%ecx            |  0f b6 46 1e           movzbl 0x1e(%rsi),%eax
>   48 8b 16              mov    (%rsi),%rdx                |  31 d2                 xor    %edx,%edx
>   f6 c1 40              test   $0x40,%cl                  |  a8 30                 test   $0x30,%al
>   75 38                 jne    <stdvga_mem_accept+0x48>   |  75 23                 jne    <stdvga_mem_accept+0x31>
>   31 c0                 xor    %eax,%eax                  <
>   48 81 fa ff ff 09 00  cmp    $0x9ffff,%rdx              <
>   76 26                 jbe    <stdvga_mem_accept+0x41>   <
>   8b 46 14              mov    0x14(%rsi),%eax            <
>   8b 7e 10              mov    0x10(%rsi),%edi            <
>   48 0f af c7           imul   %rdi,%rax                  <
>   48 8d 54 02 ff        lea    -0x1(%rdx,%rax,1),%rdx     <
>   31 c0                 xor    %eax,%eax                  <
>   48 81 fa ff ff 0b 00  cmp    $0xbffff,%rdx              <
>   77 0c                 ja     <stdvga_mem_accept+0x41>   <
>   83 e1 30              and    $0x30,%ecx                 <
>   75 07                 jne    <stdvga_mem_accept+0x41>   <
>   83 7e 10 01           cmpl   $0x1,0x10(%rsi)               83 7e 10 01           cmpl   $0x1,0x10(%rsi)
>   0f 94 c0              sete   %al                        |  75 1d                 jne    <stdvga_mem_accept+0x31>
>   c3                    ret                               |  48 8b 0e              mov    (%rsi),%rcx
>   66 0f 1f 44 00 00     nopw   0x0(%rax,%rax,1)           |  48 81 f9 ff ff 09 00  cmp    $0x9ffff,%rcx
>   8b 46 10              mov    0x10(%rsi),%eax            |  76 11                 jbe    <stdvga_mem_accept+0x31>
>   8b 7e 14              mov    0x14(%rsi),%edi            |  8b 46 14              mov    0x14(%rsi),%eax
>   49 89 d0              mov    %rdx,%r8                   |  48 8d 44 01 ff        lea    -0x1(%rcx,%rax,1),%rax
>   48 83 e8 01           sub    $0x1,%rax                  |  48 3d ff ff 0b 00     cmp    $0xbffff,%rax
>   48 8d 54 3a ff        lea    -0x1(%rdx,%rdi,1),%rdx     |  0f 96 c2              setbe  %dl
>   48 0f af c7           imul   %rdi,%rax                  |  89 d0                 mov    %edx,%eax
>   49 29 c0              sub    %rax,%r8                   <
>   31 c0                 xor    %eax,%eax                  <
>   49 81 f8 ff ff 09 00  cmp    $0x9ffff,%r8               <
>   77 be                 ja     <stdvga_mem_accept+0x2a>   <
>   c3                    ret                                  c3                    ret
> 
> By moving the "p->count != 1" check ahead of the
> ioreq_mmio_{first,last}_byte() calls, both multiplies disappear along with a
> lot of surrounding logic.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/hvm/stdvga.c
> +++ b/xen/arch/x86/hvm/stdvga.c
> @@ -69,18 +69,14 @@ static int cf_check stdvga_mem_write(
>  static bool cf_check stdvga_mem_accept(
>      const struct hvm_io_handler *handler, const ioreq_t *p)
>  {
> -    if ( (ioreq_mmio_first_byte(p) < VGA_MEM_BASE) ||
> +    /*
> +     * Only accept single direct writes, as that's the only thing we can
> +     * accelerate using buffered ioreq handling.
> +     */
> +    if ( p->dir != IOREQ_WRITE || p->data_is_ptr || p->count != 1 ||
> +         (ioreq_mmio_first_byte(p) < VGA_MEM_BASE) ||
>           (ioreq_mmio_last_byte(p) >= (VGA_MEM_BASE + VGA_MEM_SIZE)) )

Arguably the function calls are then pointless (as generated code proves),
but maybe keeping them for doc purposes is indeed worthwhile.

Jan

