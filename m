Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8F1A7137B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 10:20:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927349.1330098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txMvp-0006ZA-TQ; Wed, 26 Mar 2025 09:20:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927349.1330098; Wed, 26 Mar 2025 09:20:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txMvp-0006Wg-QQ; Wed, 26 Mar 2025 09:20:17 +0000
Received: by outflank-mailman (input) for mailman id 927349;
 Wed, 26 Mar 2025 09:20:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SgUP=WN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txMvo-0006WV-7Y
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 09:20:16 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86296d31-0a23-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 10:20:14 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3965c995151so3254246f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 02:20:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9a3f36sm16581776f8f.32.2025.03.26.02.20.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 02:20:13 -0700 (PDT)
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
X-Inumbo-ID: 86296d31-0a23-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742980813; x=1743585613; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6x6Xzw17i7W34eT4rjlNmRZic6sk9RWhrWSqzLaKa0s=;
        b=OVUWZgiqQfsQiwElKLCu6VCdlmNIZo06OfWCCxF1NPFKHbpbInfYEANMxFgOOIGVJx
         m6Lj7OLd4xzqkG59GSnuOSq6vvUzCUeMFAHNDoQ98TaV9tWOkpwkfkgEoOtPJdU+4wCY
         HCoE52ljr3fzBo/Clq8/wNixGihRM7YBfG1MZlsJZBE8A9ELuQHaRP7zjWKZCQaBPxQ4
         vlWEIb1V3sV8CwT0PEbSNc6k2TUzQn4Lwl2Sl89naxojAzb+g7tx1yNXbhwQU50Fdu7+
         ILgvkGfdJC05UtVWM1isJtR3rsa68d541OPHrJNTRJc6hXZyTmYYhKSwbOv2eT9ls8CD
         XLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742980813; x=1743585613;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6x6Xzw17i7W34eT4rjlNmRZic6sk9RWhrWSqzLaKa0s=;
        b=PW9ejhyXXt2GzQsrYWzxqz9qOKvcfvpMjxMEojRi8EvhKEPzyqlNf4FMsYEuxVtzU3
         Ptp0iS73HdhTQBUz+EHKgYg6yZkcGGioaBai3zCP93CM7L+diNKqQ2bAJahS986520ZP
         ivJufHaVKWUUsdrNHSW0ab0faTTdV0UvDVp/LCQa4BQEOdET6FhgHv/WfF0O3kiSE2Og
         /glDWntt3TN4YW5C8qYCzqR3AiSInntsY7yN1bEd6I2FDLzt5Nw2wVKoLqa8DNCLUKm6
         p0mll/3Q1b1X3piiecTUE5PqBFQy5ZtD+G+ESygX0LJiiG0vg2hGuFjNiJipQSms4bdn
         3rRA==
X-Forwarded-Encrypted: i=1; AJvYcCVa9UPgHmuowNt1tyWx+saZ+qDOpmxKOPrhjn/WDRTUCU0w+FCO4ryNsylRtmFqaR9jgzsmR7qhx38=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0l0rxP8qAOr9FlYGrrqAtt1hn3jELSYFLWW7LqzV4VtbMNLbU
	K9qD2y5cHHh7GvfteeSg0SuYij5PcMjc/ikOT6dXGqqgQXzSHnvm/lfDcRgLieFzfGH2BtETGUk
	=
X-Gm-Gg: ASbGncsxwLBudA0ajZMT/08IKlSI59La+BmHi17xa1LaAMw2mv02pMvBD567oiRlrLM
	RAd27IImnteVBuqKYGo5EwnRZYTwo4QmWu33tQhfjmEN2tg3UvV190SvajK0OGsqg5MyRBn2Lg2
	eDz/jpO4WkNHGPtl2FHqYfJ9G1FdfE0gX6RCyhiB0IQl2i3H+/H/mFDOdCT67Kjp+G0WD9ulNFP
	agRrpjILxQnX9s3k9kuQbvT/9uDemj9hXrtBnkkbiLVNMjjlu8bc3KqFTeMdVeDfEcIZnAZSfK3
	ZspHEiW8bZiR37K2dDWoJ8UlKcbZkOvCIOI62eAydNyD+64xGQmRBvkV+08OwRxod/DwY3wj5xV
	ztXaXZkYIwfRwpWhrimqbfD1z/y+oYOWKz7myyTCt
X-Google-Smtp-Source: AGHT+IGtf5AfBXOSlt1QHOhpthcwkp5Pe5p+a0xztQIoLYyNB+mk93IWCkcoaDYUMk9Le20XO86/Ng==
X-Received: by 2002:a05:6000:1ac7:b0:39a:ca59:a61d with SMTP id ffacd0b85a97d-39aca59a89amr4027133f8f.47.1742980813450;
        Wed, 26 Mar 2025 02:20:13 -0700 (PDT)
Message-ID: <56fbd614-2b46-4cc2-88f3-e244aedd5479@suse.com>
Date: Wed, 26 Mar 2025 10:20:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/bitops: Account for POPCNT errata on earlier Intel
 CPUs
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250325185219.315319-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250325185219.315319-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.03.2025 19:52, Andrew Cooper wrote:
> Manually break the false dependency for the benefit of cases such as
> bitmap_weight() which is a reasonable hotpath.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> Not sure if this warrants a fixes or not, but:
> 
> Fixes: 6978602334d9 ("x86/bitops: Use the POPCNT instruction when available")
> 
> Many examples online suggest a 2x improvement perf improvement on tight loops
> by breaking this dependency.  cpumasks in particular make frequent use of this
> loop.
> 
> Still TODO:
> 
>  1) Put a double CS prefix on the CALL instruction to avoid a trailing 2-byte
>     NOP, but this depends on x86_decode_lite() in order to work.
> 
>  2) Revert a buggy GAS diagnostic:
> 
>     ./arch/x86/include/asm/bitops.h: Assembler messages:
>     ./arch/x86/include/asm/bitops.h:493: Error: same type of prefix used twice
>     ./arch/x86/include/asm/bitops.h:493: Error: same type of prefix used twice
> 
>     Multiple prefixes are not an error, and are sometimes the best choice
>     available.

Well. Sane insns have every kind of prefix at most once. The assembler
has (effectively) boolean markers for that. Thing is that multiple
different prefixes of the same kind are ambiguous to encode: Which order
should they be emitted in? One programmer may think "first wins" while
another may expect "last wins". It may be possible to special case "same
prefix", by converting the boolean-ness to a count. Yet I expect more
often than not multiple prefixes of the same type are a mistake. Hence
we probably would then still want to warn about that, requiring a new
way to silence that warning.

However, imo it is better to leave the assembler unaltered, and continue
to require people who want such unusual encodings to specify the prefixes
they want as separate kind-of-insns. Such unusual encodings are likely to
also mean certain positioning of those prefixes relative to other possible
ones; there's no prescribed order the assembler would emit prefixes of
different kinds (REX and REX2 always coming last of course) when they're
part of a real insn.

> It turns out that LZCNT/TZCNT have the same input dependent bug, prior to
> Skylake.

These two do, but BSF/BSR don't? Pretty odd.

> --- a/xen/arch/x86/include/asm/bitops.h
> +++ b/xen/arch/x86/include/asm/bitops.h
> @@ -488,10 +488,16 @@ static always_inline unsigned int arch_hweightl(unsigned long x)
>       *
>       * This limits the POPCNT instruction to using the same ABI as a function
>       * call (input in %rdi, output in %eax) but that's fine.
> +     *
> +     * On Intel CPUs prior to Cannon Lake, the POPCNT instruction has a false
> +     * input dependency on it's destination register (errata HSD146, SKL029
> +     * amongst others), impacting loops such as bitmap_weight().  Insert an
> +     * XOR to manually break the dependency.
>       */

With this being an Intel-only issue, wouldn't we better ...

>      alternative_io("call arch_generic_hweightl",
> +                   "xor %k[res], %k[res]\n\t"

... put this line in #ifdef CONFIG_INTEL then? The extra overhead is small, but
I see no reason not to avoid it if we can. (I realize that's not quite as
straightforward as it reads, for alternative_io() being a macro.)

Jan

>                     "popcnt %[val], %q[res]", X86_FEATURE_POPCNT,
> -                   ASM_OUTPUT2([res] "=a" (r) ASM_CALL_CONSTRAINT),
> +                   ASM_OUTPUT2([res] "=&a" (r) ASM_CALL_CONSTRAINT),
>                     [val] "D" (x));
>  
>      return r;


