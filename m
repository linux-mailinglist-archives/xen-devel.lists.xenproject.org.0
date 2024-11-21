Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF1D9D4B1C
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 11:55:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841335.1256818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE4pt-0007vM-AB; Thu, 21 Nov 2024 10:54:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841335.1256818; Thu, 21 Nov 2024 10:54:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE4pt-0007tI-7H; Thu, 21 Nov 2024 10:54:57 +0000
Received: by outflank-mailman (input) for mailman id 841335;
 Thu, 21 Nov 2024 10:54:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0oSv=SQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tE4ps-0007tC-8z
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 10:54:56 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08e1f50f-a7f7-11ef-99a3-01e77a169b0f;
 Thu, 21 Nov 2024 11:54:52 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3823e45339bso590972f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 02:54:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38254933d39sm4750361f8f.83.2024.11.21.02.54.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2024 02:54:51 -0800 (PST)
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
X-Inumbo-ID: 08e1f50f-a7f7-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmEiLCJoZWxvIjoibWFpbC13cjEteDQyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjA4ZTFmNTBmLWE3ZjctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMTg2NDkyLjE1NjAzLCJzZW5kZXIiOiJqYmV1bGljaEBzdXNlLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732186491; x=1732791291; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=54Bo96MKWLNTw6NxwyaGGj7N9kGQ6B+p66118aKot90=;
        b=EKJIgwmcWYW/ont0eEQfjO7a6gbfUeeoUoXZdzIQB1Qd3R9cp8W3jdmpmhV1aRvu+1
         ARD/lfamL3odSMb89Da+f/NThO5N0BmBhyoBKk97K9OJrQBCNJwF8CkSOfYgt4Bll23C
         Ef9ddApgQk8NQo8fRP4ckNU7z2ODpYn/u3jSnijTLPDHmPg08YcWWr9gZsnrPIigeW8Y
         rbf42KfwNmc6pjr2GznUsB7TRGBPuaV/TBXZ5S0ouHbI7sjs6ihf4agzw+ZMXfAemt6z
         CAqZjo5Y+ilkS3qlgIeasLVrYkcbkFJmiugUCTyTPdllU7b+ZycIygOsTgdydPw2Eub3
         5bLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732186491; x=1732791291;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54Bo96MKWLNTw6NxwyaGGj7N9kGQ6B+p66118aKot90=;
        b=ukU1aS8XCwtSw4KB4kqw7twxlsq62jnipUpQ4W4HjfgP0kGiUSk/x9t/kthz0ha/ky
         blxw25USmKfWmZUxmz3Wn2/6kgQNmKNu3WWLh1rFrXihXRzNPu0y3U+kCUHCCpPjbV5I
         GY/RIDcv9U3zWrVhskGnf8eqhki3/QzID865MRL9+fUfbmAKrCf0qQbBHP3ighy0amRR
         cMguBRHxE1KhR/3+idYfY5R3cxzn/G+tZLKdvi338kBF+0CXhuiaqNAhWK2I47bzwF8I
         Jod+sQyZA2FaNHeWuSjdb+zd7hCVxR4jy7tF8A+N7MvPuYorltsOPkAbCbevwC9aXxmq
         Mc/A==
X-Forwarded-Encrypted: i=1; AJvYcCWWgSxvMgp0Sge1k3ECkogrDxWrihWpbYENsFkK6DS5KlZjMIsq2UQcNIMhm/klICthjPKWCu3/Irg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4vY9PmIV/ErN2AKyNoiyTrDocQHaLQ9wmC3Q2AFBGDFGKyChB
	cXRUwHuEGd6Y5i/U0IaHI0wkO0/znOuRp5Jo6ybbu7E51gX8O4O2xmVtMG1kUw==
X-Gm-Gg: ASbGnctlyPPYpFmWx5a4SFDiSZaryQZ1uXbepEfGrZQaUEUUV3z47bGivo0OJmDyWWF
	Mj+BNeIxXKWvWaBhzCWs16BQjV6XbkdUMTK69aJyc6dDQG180Y28jpqE8EkxLRthuSFmmgEyCrb
	GEc+Fxsm0zu4EOrLCKOWX4u1uylfnzvP1fy6cyN228vTTPkoOR820jyzkH8cUS4KkpLPqRwSZXf
	SF6LOyeokviP7whGvwwn4B6os/g8BpBK7kanjwU7FJEky/8ppR0X/a28PJOMSP1YeRhJwp2azsC
	IeP9ZIOb18lUUfL39Nfe5uS7n0rnonUMQCo=
X-Google-Smtp-Source: AGHT+IGTW4zYU0NipV/07Q9JtqqvJqVAW9hJYON/sKBOZTAZSvwG5/qr1++FzRAsvpdNdOGCZQmCJQ==
X-Received: by 2002:a05:6000:2c8:b0:382:2e9e:d688 with SMTP id ffacd0b85a97d-38254b290bfmr4891291f8f.51.1732186491485;
        Thu, 21 Nov 2024 02:54:51 -0800 (PST)
Message-ID: <25fb7dfe-50e0-446a-9057-050fd3c2edb2@suse.com>
Date: Thu, 21 Nov 2024 11:54:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/pvh: also print hardware domain pIRQ limit for
 PVH
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20241120113555.38146-1-roger.pau@citrix.com>
 <20241120113555.38146-3-roger.pau@citrix.com>
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
In-Reply-To: <20241120113555.38146-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.11.2024 12:35, Roger Pau Monne wrote:
> Do not return early in the PVH/HVM case, so that the number of pIRQs is also
> printed.

What you're printing ...

> Fixes: 17f6d398f765 ('cmdline: document and enforce "extra_guest_irqs" upper bounds')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/io_apic.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
> index bd5ad61c85e4..d9db2efc4f58 100644
> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -2754,11 +2754,13 @@ unsigned int __hwdom_init arch_hwdom_irqs(const struct domain *d)
>  
>      /* PVH (generally: HVM) can't use PHYSDEVOP_pirq_eoi_gmfn_v{1,2}. */
>      if ( is_hvm_domain(d) )
> -        return nr_irqs;
> -
> -    if ( !d->domain_id )
> -        n = min(n, dom0_max_vcpus());
> -    n = min(nr_irqs_gsi + n * NR_DYNAMIC_VECTORS, max_irqs);
> +        n = nr_irqs;

... is rather the number of IRQs we picked for the system. That may happen to
end up being the upper bound for PVH Dom0, yet not logging this at all was
because of the limited use pIRQ-s have there. Granted at the time I was still
under the impression they have no use there at all, so this isn't really an
objection to the change. I would have been nice though if the description had
mentioned why significance pIRQ-s actually have in PVH Dom0.

Jan

> +    else
> +    {
> +        if ( !d->domain_id )
> +            n = min(n, dom0_max_vcpus());
> +        n = min(nr_irqs_gsi + n * NR_DYNAMIC_VECTORS, max_irqs);
> +    }
>  
>      printk("%pd has maximum %u PIRQs\n", d, n);
>  


