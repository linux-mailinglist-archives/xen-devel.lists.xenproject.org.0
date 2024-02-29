Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3AA86CF6B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 17:38:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687306.1070591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjPj-0005Zs-D0; Thu, 29 Feb 2024 16:37:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687306.1070591; Thu, 29 Feb 2024 16:37:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjPj-0005Xk-A1; Thu, 29 Feb 2024 16:37:43 +0000
Received: by outflank-mailman (input) for mailman id 687306;
 Thu, 29 Feb 2024 16:37:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfjPh-0005Xa-CV
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 16:37:41 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da15868e-d720-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 17:37:39 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-564fc495d83so1561556a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 08:37:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v8-20020a1709067d8800b00a3d68aad90dsm847012ejo.97.2024.02.29.08.37.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 08:37:38 -0800 (PST)
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
X-Inumbo-ID: da15868e-d720-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709224659; x=1709829459; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KqA/Dje2EInne6YGsYiMVHRKN2X20+ifwXC7sFOgaqA=;
        b=Fq6KWZ9iB/NEkWIeaQaDZbbvy6LLfg2nZ2hcTelNJG6YWVDotASLr4yRacQDKjbL0i
         OWDer4gjacjrgc5OIW9R/wb6fUaKu5CMypD6KygxycCnBnZgI5ik73uHdZjuAhPIFRPu
         h/0GIKKaBBrPAexWzhW4S6VnIk09YuyzRCsPBtN5WIBRDy6jeZqxU1oDclxTunCl7dxo
         dS/Jqd6+oQjicm3YpLma1OjBP/mBCql8I4rPpe4TOoyPpWzW7B8UyoANYh5JF44/mMbZ
         CcGYOx4z98I1d2S8v81H84D/kXlcpMUsuh3emG8ZHicWhR97oZ2GQm5hwkTWe3Mu4i39
         nqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709224659; x=1709829459;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KqA/Dje2EInne6YGsYiMVHRKN2X20+ifwXC7sFOgaqA=;
        b=ETZ7iCUtInJKdJRZNNx2lv4VKDDFHWlZH8fvqV1sai2cACVcFrxEpB5rVEDQ2/qd4Z
         e+uNO5Y1IOLPVLrZlPr6zb+o6Q/PgmPlydlBD5waoCpZy3tHaX3i8ghQLUxU/LVZZMjZ
         YQIDwnKdbcm6B8pbl+LPYPsyJhQqcERysjcOozMAsvpocfvoCsv/VUuvxu6Ey+4sI41l
         PeoEj+cfv4yhW2/Ff+zSHyNU3T1Lb8V6LeyDdUOM4D2ASwNviKbcd5KnHVLeTclUobuu
         sEPBOutVu0uOt4jH8Ox8d+rKuTvCKelIyJLbBcq9x1OcFHfFtLfhGT345W3d4ryiGv1e
         Wy/w==
X-Forwarded-Encrypted: i=1; AJvYcCXioJVjO0Br9lZM4pTZykG87UH+hhvqpC08maAhuDpUMyZMaR/Qt7K6GNTA6OuX883GqCWFg28PPoeQWkBzAR+IlUdmGuCBDExmkJqCSHo=
X-Gm-Message-State: AOJu0YyNliDJbdIcj2A72cTJI7SUeOJUZ7PP79WacINB4FGUv/L8OEgd
	5BczuZapdpoqkfqFEEHiUzXsXTe8pNBczNAnMiscnLq2zdrSAdWnFZpVinTeuQ==
X-Google-Smtp-Source: AGHT+IEx4oa3ceXc86TvI1ftL3nMtWsjrbF6PzqJW5o9aijhBmwOL5YPH4FVQKBopipEscUwMTvokQ==
X-Received: by 2002:a17:906:5fd3:b0:a44:48dd:bcb2 with SMTP id k19-20020a1709065fd300b00a4448ddbcb2mr1678026ejv.25.1709224658901;
        Thu, 29 Feb 2024 08:37:38 -0800 (PST)
Message-ID: <14d94c7e-7cd4-4508-a74e-eddd6a592219@suse.com>
Date: Thu, 29 Feb 2024 17:37:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 03/10] x86: address some violations of MISRA C Rule
 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
 <3c9e90aaf5dde769b689468fc818e4ae61fa11f3.1709219010.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <3c9e90aaf5dde769b689468fc818e4ae61fa11f3.1709219010.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.02.2024 16:27, Nicola Vetrini wrote:
> --- a/xen/arch/x86/include/asm/irq.h
> +++ b/xen/arch/x86/include/asm/irq.h
> @@ -179,9 +179,9 @@ void cleanup_domain_irq_mapping(struct domain *d);
>      void *__ret = radix_tree_lookup(&(d)->arch.hvm.emuirq_pirq, emuirq);\
>      __ret ? radix_tree_ptr_to_int(__ret) : IRQ_UNBOUND;                 \
>  })
> -#define IRQ_UNBOUND -1
> -#define IRQ_PT -2
> -#define IRQ_MSI_EMU -3
> +#define IRQ_UNBOUND (-1)
> +#define IRQ_PT      (-2)
> +#define IRQ_MSI_EMU (-3)
>  
>  bool cpu_has_pending_apic_eoi(void);
>  

I'd be happy to ack this change right away.

> --- a/xen/arch/x86/usercopy.c
> +++ b/xen/arch/x86/usercopy.c
> @@ -106,7 +106,7 @@ unsigned int copy_from_guest_ll(void *to, const void __user *from, unsigned int
>      return n;
>  }
>  
> -#if GUARD(1) + 0
> +#if GUARD((1)) + 0

I don't even understand the need for this one, and nothing is said in
the description in that regard. Generally I'm afraid I'm averse to
such (seemingly) redundant parentheses in macro invocations.

Jan

