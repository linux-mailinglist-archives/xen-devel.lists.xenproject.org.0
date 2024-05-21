Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2B98CACFF
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 13:01:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726824.1131201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9NDc-0007bB-Gd; Tue, 21 May 2024 10:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726824.1131201; Tue, 21 May 2024 10:59:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9NDc-0007Xz-Co; Tue, 21 May 2024 10:59:44 +0000
Received: by outflank-mailman (input) for mailman id 726824;
 Tue, 21 May 2024 10:59:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLq1=MY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9NDb-0007Wj-1E
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 10:59:43 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38eea05e-1761-11ef-b4bb-af5377834399;
 Tue, 21 May 2024 12:59:40 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a59a352bbd9so1193829966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 May 2024 03:59:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17894d40sm1583862266b.75.2024.05.21.03.59.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 May 2024 03:59:40 -0700 (PDT)
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
X-Inumbo-ID: 38eea05e-1761-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716289180; x=1716893980; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E4P+xMRlYpy264pZ1nWx3xHxFBAFbv6+a31JFtHGv5w=;
        b=gCafwuSAbebqK93HryDYEyfBv63JZ7qUeYjfrAx1S3thPpBqQXDk2/no0jDFO94n53
         leeuQI0eVOqm+uOL4cCg3+x5QQTAONMpW5/d2x94tb5YN4iESlliaACCnHPon5NSGDJD
         DQewkuYa8ja/yGJiyU9qKo4B+yjPLfjHzaVh7huoPTekrM5BEzU3tlT+I3hzJVByvMEc
         TD8xqzuMXtY1hxfcmY4gIMkPyLwpZqGR2QfkFGK2XsX59QNbKJVPQU6hbVHlfoBJ8Xnk
         F1izJzpOIUzqSJkkH3lJCkg3LA3+20EAeePSZYeI4GZA+W9+kZHMLgAICv0nZ2oIOg1e
         MXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716289180; x=1716893980;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E4P+xMRlYpy264pZ1nWx3xHxFBAFbv6+a31JFtHGv5w=;
        b=GZgY+Lw7H8fNmpop0n4Vq7KF0wnOhzbPQy0IeB7Mw60+OcXq5z03lSyn2w+Ww55Boe
         NCCNrhswhxo1SdazTwPsuY+7W9Mc/zupqpFO8QfK3nnRQMTA5xdp+k2u7s5iHqjEp7wJ
         6JOV3Faqp/s3UhgxwJY+sWpjFdrCHFaHRvlvAWKsemXGzTVLNqzEI1hlGu9dXoBuT2R6
         17UVmKqObbTQPuOyzr4IgaM5ip7xB1UG5jPZcj0W2ytw5LZy3EhEi04v9frG4NNJJYHP
         9iofUIxZcEZ58n9CU0h+BgH3uOXNtbjfcWR34NQUAXvYw9fw61Df4L0bymahV8NEc769
         xA7w==
X-Forwarded-Encrypted: i=1; AJvYcCUJxlHA3GUyX+SLMTyRvFnJJJHGQ3nrtyyhhYpvl/6xDveclBuooMm52568Ddzc4jTVf7I1sXp3PLQog/nyNUQm/xd2MKdcwoDweFyx7T4=
X-Gm-Message-State: AOJu0YxsKxqcdPIsP6WQtjA/uMKXqQp5S4zMEyZbO8HjTcXUGKWw9Tce
	yl0xqmdeTnCB2pp9HfSHsB1kQ7L4TDzbAmFdii6L0Fzr3IkX1/Q474k4iqhb7A==
X-Google-Smtp-Source: AGHT+IHRyBvXRWfVhwcjl1pf9tzSU8YXLqNtxVdOePb9YckUXCx2f76jo8TpdnycEgi61MykfWY0AQ==
X-Received: by 2002:a17:907:a4e:b0:a61:a705:56f3 with SMTP id a640c23a62f3a-a61a705582fmr420057166b.35.1716289180357;
        Tue, 21 May 2024 03:59:40 -0700 (PDT)
Message-ID: <21196eb3-82ca-470b-8dc9-1a95b427f3b9@suse.com>
Date: Tue, 21 May 2024 12:59:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19? v4 4/6] x86: Make the maximum number of altp2m
 views configurable
Content-Language: en-US
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1716029860.git.w1benny@gmail.com>
 <ba5b81fdaf174a236c3963fcfd29ae3b19aff13d.1716029860.git.w1benny@gmail.com>
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
In-Reply-To: <ba5b81fdaf174a236c3963fcfd29ae3b19aff13d.1716029860.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.05.2024 13:02, Petr Beneš wrote:
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -685,6 +685,18 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>          return -EINVAL;
>      }
> 
> +    if ( config->nr_altp2m && !hvm_altp2m_supported() )
> +    {
> +        dprintk(XENLOG_INFO, "altp2m requested but not available\n");
> +        return -EINVAL;
> +    }
> +
> +    if ( config->nr_altp2m > MAX_EPTP )

The compared entities don't really fit together. I think we want a new
MAX_NR_ALTP2M, which - for the time being - could simply be

#define MAX_NR_ALTP2M MAX_EPTP

in the header. That would then be a suitable replacement for the
min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) that you're adjusting
elsewhere. Which however raises the question whether in EPT-specific
code the min() wouldn't better survive, as min(d->nr_altp2m, MAX_EPTP).

> @@ -5228,7 +5234,7 @@ void hvm_fast_singlestep(struct vcpu *v, uint16_t p2midx)
>      if ( !hvm_is_singlestep_supported() )
>          return;
> 
> -    if ( p2midx >= MAX_ALTP2M )
> +    if ( p2midx >= v->domain->nr_altp2m )
>          return;

You don't introduce a new local variable here. I'd like to ask that you also
don't ...

> @@ -403,12 +403,12 @@ long p2m_set_mem_access_multi(struct domain *d,
>      /* altp2m view 0 is treated as the hostp2m */
>      if ( altp2m_idx )
>      {
> -        if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
> -             d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
> -             mfn_x(INVALID_MFN) )
> +        if ( altp2m_idx >= d->nr_altp2m ||
> +             d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, d->nr_altp2m)]
> +             == mfn_x(INVALID_MFN) )

Please don't break previously correct style: Binary operators (here: == )
belong onto the end of the earlier line. That'll render the line too long
again, but you want to deal with that e.g. thus:

             d->arch.altp2m_eptp[array_index_nospec(altp2m_idx,
                                                    d->nr_altp2m)] ==
             mfn_x(INVALID_MFN) )

Jan

