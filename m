Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29159D24AF8
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 14:12:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1205100.1519553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgN9C-0000h1-Mw; Thu, 15 Jan 2026 13:12:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1205100.1519553; Thu, 15 Jan 2026 13:12:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgN9C-0000e9-Jh; Thu, 15 Jan 2026 13:12:22 +0000
Received: by outflank-mailman (input) for mailman id 1205100;
 Thu, 15 Jan 2026 13:12:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vgN9B-0000e3-Gm
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 13:12:21 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d13f7710-f213-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 14:12:17 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-430f5ecaa08so461571f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 05:12:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af6d909fsm5979825f8f.31.2026.01.15.05.12.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 05:12:16 -0800 (PST)
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
X-Inumbo-ID: d13f7710-f213-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768482737; x=1769087537; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LFm/I4196HgVQNwV0YmL4WM1x1A8fO4rt2IHhLxqcjs=;
        b=LuJ877eQHKGAmPR6+lNXH697xYSUMmSAM6gprkotfYAq+bKA245KAPoN/O+RpHko0w
         TO4OtRVozJIcAJ3FJoRmujS0Ymhpp9XnsbT89pDzYUlbm6Rpmd8j/3N/+AGtTpy+gRK1
         fbNUPJmQpw8k9/5NaFR8dcU8skGapx+N2TOcefdH3X8RVgC/MFKaQj5zUsU03EFysM+h
         /jfenxVGfivdA0sucur7RVnTHXg3iJrAy4/+GPrkVOULHfBMNSBIu1pxX25qmt6JdGWA
         wv/+1HU2MdH8Ukzx712dU39lrFD7Va8yfqQ5NOKzFetkJscWNVeLGTSpgpPmqluwZSb3
         W97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768482737; x=1769087537;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LFm/I4196HgVQNwV0YmL4WM1x1A8fO4rt2IHhLxqcjs=;
        b=oXIukQnVWj+Uyagzewsr7J8jA44GEjGk2/uQTeOWj9kPpTY63j2bRr/m2LCweLjIZQ
         tE1m2cS4db52PsXBG6rVkjPxxQczvTaZif78NRp9HaGt5yUdQXio3o/J8taUtJpWPbsR
         PcLwQRuazsxsdFD+ORYGtC6YZFRovm523S4VMKGjYxBEnEDmP26nNBTsby7jjb1j3TmM
         H77tKc4Mvnz3jnFUA5T+9xR8t+TbqyUFJ4iAXM/5LGFPL1hMwQo9DTd/AW7p0MWIOe0S
         k6qdrCZk9RxKYXcdUpIpqB/rEg7wAsxDgbLZemM6Y0t5c/jLJz6pzHlJuOWu+c4TttPr
         8BDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU22nWZntnkQkRwnCfczQ1Rt4dqs30r6uVH//04giKjeyQ6ZTkVJjc7nk5tbuB3eSJVGZ2ma5XtNIw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxc6z0xDYE9i4lbjfcCUTJp5mwrKl1MEbngyBRfyvSg0Phq6Uak
	9/FYqBcnKGsT64S759pK0egeh8qEwvwffBJHSB9QkXRpxIy9sf54wfpDYllEQhsHyQ==
X-Gm-Gg: AY/fxX6uXV0MEEXdnmjJg2vVfOvir+oYmXvB1SMeXRqC8a+wSB5VWEv/uMqhclzsPiN
	YSfMYXelvGz3lEIAH88KU62XoiuFTwDN7z3JwkBEuoqoVTbNeC8xRyqeYBfYKGboFFJ0Y422H9U
	G7ydqHf4aogvsm63tRUbPMGCdV115VgeoXW6pa+4ZM1lVkr6FGszZW06CoF3QUzxTh/Ty6LkrXz
	3mW2TyY35SAKdD9/eDTMwkWt0RV0CVuzeq034THLEjOeB6t2APyHFyiM9QBbLAJWyK8safkVqj0
	p2Z98e01nNUMhsEVMXZBcn9O3adp7QT/bxp4/ZWk9UbonmSYm9nW1UUNj8d2tJzP2hnGPsbIL9V
	lC7mo9Tdisvd1bJJP5XaOtECPhRFuoC4i8IBRsFi0LzkRXqPFqtSUyly4LfSXj3rxyyWgcS5+mi
	C00nNEiGYo81WJPWAKD2lDKYpPZsT276FWnVcw8NyIC0SO7/kzvob9aAojgj/Q1PRIbAKS07jq0
	co=
X-Received: by 2002:a5d:6d46:0:b0:430:fced:902 with SMTP id ffacd0b85a97d-4342c5039d8mr6429935f8f.26.1768482737282;
        Thu, 15 Jan 2026 05:12:17 -0800 (PST)
Message-ID: <8377bdc2-d92d-4c3f-893b-19c842cad3a7@suse.com>
Date: Thu, 15 Jan 2026 14:12:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: dump CSRs on unexpected traps
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260115125601.70834-1-oleksii.kurochko@gmail.com>
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
In-Reply-To: <20260115125601.70834-1-oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.01.2026 13:56, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/traps.c
> +++ b/xen/arch/riscv/traps.c
> @@ -17,6 +17,10 @@
>  #include <asm/traps.h>
>  #include <asm/vsbi.h>
>  
> +#define print_csr(csr) do { \
> +    printk("\t" #csr ": %#02lx\n", csr_read(csr)); \

Why the 02 in the format? If you wanted to align things, you'd use %016lx. (I
also don't think the 0x prefixes are overly useful in such dumping, but others
may disagree.) As an aside, the width of 2 would be fully consumed by your use
of #, except for zero which would (oddly) be printed as 00 afaict.

> +} while ( 0 )

Why the do/while wrapping, btw?

> @@ -99,12 +103,63 @@ static const char *decode_cause(unsigned long cause)
>      return decode_trap_cause(cause);
>  }
>  
> +static void dump_csrs(unsigned long cause)
> +{
> +    unsigned long hstatus;
> +    bool gva;
> +
> +    printk("\nDumping CSRs...\n");
> +
> +    printk("Supervisor CSRs\n");
> +    print_csr(CSR_STVEC);
> +    print_csr(CSR_SATP);
> +    print_csr(CSR_SEPC);
> +
> +    hstatus = csr_read(CSR_HSTATUS);
> +    gva = !!(hstatus & HSTATUS_GVA);

No need for !! when the lhs type is bool. Question is whether gva is useful
to have as a local in the first place, when ...

> +    printk("\tCSR_STVAL: %#02lx%s\n", csr_read(CSR_STVAL),
> +           gva ? ", (guest virtual address)" : "");

...  this it's sole use (you don't use where you could further down).

> +    printk("\tCSR_SCAUSE: %#02lx\n", cause);
> +    printk("\t\tDescription: %s\n", decode_cause(cause));
> +    print_csr(CSR_SSTATUS);
> +
> +    printk("\nVirtual Supervisor CSRs\n");
> +    print_csr(CSR_VSTVEC);
> +    print_csr(CSR_VSATP);
> +    print_csr(CSR_VSEPC);
> +    print_csr(CSR_VSTVAL);
> +    cause = csr_read(CSR_VSCAUSE);
> +    printk("\tCSR_VSCAUSE: %#02lx\n", cause);
> +    printk("\t\tDescription: %s\n", decode_cause(cause));
> +    print_csr(CSR_VSSTATUS);

Everything below I understand wants dumping, but for much of the above
that's less clear to me. Why would guest's values be relevant when we
have a hypervisor problem?

> +    printk("\nHypervisor CSRs\n");
> +
> +    print_csr(CSR_HSTATUS);

Above you special-case VSCAUSE, but here you re-read HSTATUS.

> +    printk("\t\thstatus.VTSR=%d\n", !!(hstatus & HSTATUS_VTSR));
> +    printk("\t\thstatus.VTVM=%d\n", !!(hstatus & HSTATUS_VTVM));
> +    printk("\t\thstatus.HU=%d\n", !!(hstatus & HSTATUS_HU));
> +    printk("\t\thstatus.SPVP=%d\n", !!(hstatus & HSTATUS_SPVP));
> +    printk("\t\thstatus.SPV=%d\n", !!(hstatus & HSTATUS_SPV));
> +    printk("\t\thstatus.GVA=%d\n", !!(hstatus & HSTATUS_GVA));

Might these better be put on a single line, e.g. in the form

  [VTSR SPVP SPV]

i.e. enumerating the (interesting) set bits textually?

> +    print_csr(CSR_HGATP);
> +    print_csr(CSR_HTVAL);
> +    print_csr(CSR_HTINST);
> +    print_csr(CSR_HEDELEG);
> +    print_csr(CSR_HIDELEG);
> +    print_csr(CSR_HSTATEEN0);
> +}
> +
>  static void do_unexpected_trap(const struct cpu_user_regs *regs)
>  {
>      unsigned long cause = csr_read(CSR_SCAUSE);
>  
>      printk("Unhandled exception: %s\n", decode_cause(cause));
>  
> +    dump_csrs(cause);
> +
>      die();
>  }

Apart from CSRs, how about also dumping GPRs?

Jan

