Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D5F996FD4
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 17:39:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814841.1228530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syYlt-0004cl-31; Wed, 09 Oct 2024 15:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814841.1228530; Wed, 09 Oct 2024 15:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syYlt-0004Zr-0G; Wed, 09 Oct 2024 15:38:41 +0000
Received: by outflank-mailman (input) for mailman id 814841;
 Wed, 09 Oct 2024 15:38:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syYlr-0004X6-DA
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 15:38:39 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d18198e-8654-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 17:38:37 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5399041167cso11295916e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 08:38:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a994c5a219bsm507197266b.152.2024.10.09.08.38.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 08:38:36 -0700 (PDT)
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
X-Inumbo-ID: 8d18198e-8654-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728488317; x=1729093117; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wODw9eGqZU/Y4//9+2qG8H4Di9uKIKnry7vwIwp/p44=;
        b=UfZTXO6f9VNx/xybRuuQCm6X1cOjGfgu275PHa+OZENLWquhlzp+x1FMSDaWh7Tuns
         pRcixPtGUVADIIL77zJcN29UvmB2HthjTgozn/NPWgxevkIkrqqWWVsm3HTN1bTDz30Z
         7ntruHVqmeznTDW7LLWj6bE/ff21P87EfgUW8RVnVvNB+naWyeNC+g1kLdw4iN33YvRv
         VM1iTGBEN1mAx5N4teo6/L0JE+nROIODa0CtO/BL4XNjUNfvx/H1Z+j1kbHDDZyW1BJ5
         GEh1EPkF5uN3YYQkUPfiv8G7KAAEbWyKul4N9QKKi8CbNtw55rBMSpOmuGNINz3ugEiZ
         dbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728488317; x=1729093117;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wODw9eGqZU/Y4//9+2qG8H4Di9uKIKnry7vwIwp/p44=;
        b=H1V/EcEBZjl9bsD8tzPbg2l1TW0hXDcu9dmbB6bsA08lICDb6IA2OyrqM1UnvlB5uM
         VhJu/JrSGYzrbOn37cJaRTmHfa33c3J7fv5KUnj0t57aP84vUIe2ochELjPflc/1qS9G
         HzprpTnhVA4S2kwEeXk67V47UtmLLxz2irmc5fX+GeLeyPOTCRCa977WHc98yNZl1PGm
         rJb8enZI6xAK0RGDzc1VqeryalFVvPXzVa6TQwsyePT3omLAKPcTxk+0XBPn4akBy2j1
         a7fzj1D6v9FNXMQVjtZy8t8HTbpU/ft9uq8EtZJIMdL8Ib36U81qRCXSYx3o9Pyjb7MB
         9n+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWaT93fcX7dCno3xvTNHm23jVH7HxVTgUY4+GzI0q+YkbUOH/muA5R8F6wzusi+gkrnJLGFfwb8w1o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyELbPgAjh+XMb7PkBXVc4cLjLZe78esotEFPjKnIN3/6EIbt8i
	lXyuS9QSyAgXAZdtewndJwuBvcOFbdbqwcspVgN8Fz5h3eSax2V4HLCiWE6IHw==
X-Google-Smtp-Source: AGHT+IFzAeyqPKAUZlg1mRX7mW5teRBCw5QC/Qx5VyeLL52DygV6etZyqdupku0bqpcKq/000brTVQ==
X-Received: by 2002:a05:6512:acb:b0:539:94f5:bf with SMTP id 2adb3069b0e04-539c496ce0fmr2937037e87.59.1728488316798;
        Wed, 09 Oct 2024 08:38:36 -0700 (PDT)
Message-ID: <dbd4898a-38da-47d5-8655-32f96c33575d@suse.com>
Date: Wed, 9 Oct 2024 17:38:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/44] x86/boot: split bootstrap_map_addr() out of
 bootstrap_map()
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-12-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241006214956.24339-12-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.10.2024 23:49, Daniel P. Smith wrote:
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Using an interface based on addresses directly, not modules.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>  xen/arch/x86/include/asm/setup.h |  1 +
>  xen/arch/x86/setup.c             | 19 +++++++++++++------
>  2 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
> index 3d189521189d..213584b05fb2 100644
> --- a/xen/arch/x86/include/asm/setup.h
> +++ b/xen/arch/x86/include/asm/setup.h
> @@ -36,6 +36,7 @@ extern struct boot_info xen_boot_info;
>  
>  unsigned long initial_images_nrpages(nodeid_t node);
>  void discard_initial_images(void);
> +void *bootstrap_map_addr(paddr_t start, paddr_t end);

Nothing is being said about why this function needs a declaration here
and ...

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -437,24 +437,22 @@ static void __init normalise_cpu_order(void)
>   * Ensure a given physical memory range is present in the bootstrap mappings.
>   * Use superpage mappings to ensure that pagetable memory needn't be allocated.
>   */
> -void *__init bootstrap_map(const module_t *mod)
> +void *__init bootstrap_map_addr(paddr_t start, paddr_t end)

... isn't instead static here. Bugseng folks have put in quite a bit of
effort to remove such anomalies (which Misra doesn't like) from the code
base; I don't think we should introduce new ones. I didn't peek ahead
further than just the next patch, where the function gains a new use,
but could still be static, so it's possible I'm simply missing a
subsequent use from another CU. Yet then the function ought to become
non-static only there.

Jan

