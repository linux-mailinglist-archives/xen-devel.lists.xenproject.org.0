Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B425917B6A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 10:52:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748525.1156259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMOO5-0002jq-B3; Wed, 26 Jun 2024 08:52:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748525.1156259; Wed, 26 Jun 2024 08:52:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMOO5-0002gz-8P; Wed, 26 Jun 2024 08:52:21 +0000
Received: by outflank-mailman (input) for mailman id 748525;
 Wed, 26 Jun 2024 08:52:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sMOO3-0002gt-Ha
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 08:52:19 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64ad6ef4-3399-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 10:52:18 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2eaea28868dso84891581fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 01:52:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb329b83sm94479965ad.115.2024.06.26.01.52.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 01:52:17 -0700 (PDT)
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
X-Inumbo-ID: 64ad6ef4-3399-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719391938; x=1719996738; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KnFVdy4+ae2BUOnNtfAoMiKw5cr1cs0xDtfUlQA/s0g=;
        b=WNILZdt+wMiK04D9QYh+624XHHGv0bpdl3K65R36ndJkflkuNAQ6flWDV3ngiZ/u2h
         sAaOguh79KIGKDUmTc0qkflVPaqB48o88AyBEFKbodGMm89D5qKxhFBUIpkXkQxD85Yu
         eUx8BNFrMLKDVWT607z3uEVaCeqRkNXKpiObW30WgyEaKJX7lG485UOZHDcb/sXX1z8G
         vUrN3sPeZi2rgWppc2OPXLdg/PuU/nmsziT0nHx89IxozjkeSgM0Nl2hEnclknqHsM14
         w8E+X1GmhsK0pv3LdcC2C6xGBOxBl924HQCYafunxloCvjd29ioqvhZNR9RX4zbWpu/c
         AoYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719391938; x=1719996738;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KnFVdy4+ae2BUOnNtfAoMiKw5cr1cs0xDtfUlQA/s0g=;
        b=S+98VTcFoemc3AspMYMNo4vJAZe6ejAErWhJMdFdMce34mvOtoybiYeRBt8hqPPQ+9
         bzN7dH8kLSTT61UFA3FwPjPYqcJ3vDk+T9Ko+PFMrVyZr6m4yls/ptBab3iMlcTFcm7U
         3gGi1q4a8KWUilPmuMqJNtgTsxl+IJDvZ0Alkk/KC3TRP3kKPIasJDeig+vHjfPijneH
         kslqyAJCCny5N3DwWC6VoesB1XRwekSZdHbbKsP6BTXXuz8aF3kVqYrL8VxHscgbTT1Z
         Rdmx+fKFRy8jZEGd5WK9rXATMFZz6kLpY2XtCNBNij/MQ+IMKuedzFZ02UlYFyX7THm1
         ae/g==
X-Gm-Message-State: AOJu0YxrjzYtmP3pXrfBAMKyvqkT8fKXxmoNh+NHl2uxM7SrUvHD3/Su
	SowUGuGfmCtX+//a2UCBsOkDpvYp43zvHpiKQr3/6eiNUhY6jbLD0d3hultUoQ==
X-Google-Smtp-Source: AGHT+IEuFuL4yWPCdBXokIYl02WfiKm6TAR4Czd6HSjI2CaAH/tBF03BEkRSssAGep22B7jjqefRwQ==
X-Received: by 2002:a2e:7c07:0:b0:2ec:4f0c:36f9 with SMTP id 38308e7fff4ca-2ec5b31d140mr78269471fa.36.1719391937973;
        Wed, 26 Jun 2024 01:52:17 -0700 (PDT)
Message-ID: <0b55dcb7-dbba-4c90-b0a2-9e158317f88a@suse.com>
Date: Wed, 26 Jun 2024 10:52:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Fix null pointer dereference in xen_init_lock_cpu()
To: Ma Ke <make24@iscas.ac.cn>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 jgross@suse.com, boris.ostrovsky@oracle.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com
References: <20240626074339.2820381-1-make24@iscas.ac.cn>
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
In-Reply-To: <20240626074339.2820381-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.06.2024 09:43, Ma Ke wrote:
> kasprintf() is used for formatting strings and dynamically allocating
> memory space. If memory allocation fails, kasprintf() will return NULL.
> We should add a check to ensure that failure does not occur.
> 
> Fixes: d5de8841355a ("x86: split spinlock implementations out into their own files")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
> Found this error through static analysis.
> ---
>  arch/x86/xen/spinlock.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/x86/xen/spinlock.c b/arch/x86/xen/spinlock.c
> index 5c6fc16e4b92..fe3cd95c1604 100644
> --- a/arch/x86/xen/spinlock.c
> +++ b/arch/x86/xen/spinlock.c
> @@ -75,6 +75,8 @@ void xen_init_lock_cpu(int cpu)
>  	     cpu, per_cpu(lock_kicker_irq, cpu));
>  
>  	name = kasprintf(GFP_KERNEL, "spinlock%d", cpu);
> +	if (!name)
> +		return;
>  	per_cpu(irq_name, cpu) = name;
>  	irq = bind_ipi_to_irqhandler(XEN_SPIN_UNLOCK_VECTOR,
>  				     cpu,

While yes, error checking would better be added here, this isn't enough.
You're treating an easy to diagnose issue (at the point where the NULL
would be attempted to be de-referenced) for a possibly more difficult to
diagnose issue: Any such failure will also need propagating back up the
call stack.

Jan

