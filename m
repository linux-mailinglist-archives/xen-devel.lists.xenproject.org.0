Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCBD8C74F2
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 13:01:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723139.1127729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7YrL-0003y7-1x; Thu, 16 May 2024 11:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723139.1127729; Thu, 16 May 2024 11:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7YrK-0003wa-Uw; Thu, 16 May 2024 11:01:14 +0000
Received: by outflank-mailman (input) for mailman id 723139;
 Thu, 16 May 2024 11:01:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7YrJ-0003w4-HG
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 11:01:13 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ad18ca5-1373-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 13:01:11 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a59a0e4b773so297206866b.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 04:01:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b01968sm970196766b.166.2024.05.16.04.01.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 04:01:10 -0700 (PDT)
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
X-Inumbo-ID: 9ad18ca5-1373-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715857271; x=1716462071; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sqQ4w7l1Hd2xGalWtg1CBoGl5a/pFXWJTW4wk5umoQM=;
        b=ACi/1ROWl3j/idDpFzWP7fkQWWDAZNA6OrAgKZ2EUt2WyV9EIYXTBIFq4Isi2sgxNI
         ylWbfUGguZu5pUzeDk+9hpagD3wFNnsECf+SJLR/AsnKE6myqWO0wZTOBi0NHVX0uFRs
         HuPu5uaFHa6pRFO1ni1JHNi7+aiv80GaRiTDykGBib4l09XXHxWmpUhERx4Tl1nipgN7
         DYgCHym1WL9smJIlHpBgaVOM6h0RIVFfkeZnmKc8j1vaxBjRoq48OK+lZn1KfGaPMl6x
         8oM/PIGF+KlWbvPTlUliJZBhJw+pYQAlX+QAcWHtdnIQh5qCXfdrXN/1U1cnFwoNXPoS
         XzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715857271; x=1716462071;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sqQ4w7l1Hd2xGalWtg1CBoGl5a/pFXWJTW4wk5umoQM=;
        b=wbZu/pMmNQb4TP3RuB7UedXQvph3F1hLitvm8o9M64G4QmgUMh3hDJJNq7w+vV8Ght
         9sUCpDL9INm0rl12ssJptBYhxcIj8BKnnE8cKvwRB/2ZIv3YWGdRkZY6jj8i5645bMpB
         vUQEYehE+MTNSmpyU4NgG8Te0dBLxOghMmJNdLNkX282qTGvBli6a3gdZ9x5EepWTgsT
         wjG7rY3kjnVFRCAKS6Frdjo5QiYJa032uG/fo8E9qF4NEzrNg+Z49w14cwRrR2OpMzJS
         iV5bQvUUBWCGaZ2wW9LsntWhtR+rGgVKg5H2VXly2wYkvlJ6cWXK3WU4gmV9wmRuy7Nn
         QNfw==
X-Forwarded-Encrypted: i=1; AJvYcCUQYuac85rFiPASaXoaYsQz7r9GobjAeXN/mDYRpcYcxSiqcIyH3/1aNUBNGGqnb8Ad/+sLQoJqz1BqsEMKDgH8yxP+Onz39Muyuu7HnpM=
X-Gm-Message-State: AOJu0Ywvu993+kxpaR7zR3jOB4lMC8LKUdtS+gsHtnDaQF4q8kUhBmA4
	ZyjaYdaA+GuDgiF2tUJOYNPGRM1x2EOOctgRvDZ/a1lqlHeNNi4GkoATjUhYrA==
X-Google-Smtp-Source: AGHT+IHikjxLEl1yD+WW6Jy+WgDfU+T5kKhfhBJo0i/OpwnlOxbz6cg4fbBqhB6mHiL4M+jCs0lcnA==
X-Received: by 2002:a17:906:194a:b0:a59:9b75:b90 with SMTP id a640c23a62f3a-a5a2d53ad53mr1259918466b.2.1715857270737;
        Thu, 16 May 2024 04:01:10 -0700 (PDT)
Message-ID: <29604726-8768-4b33-a8ef-eba6ad112d44@suse.com>
Date: Thu, 16 May 2024 13:01:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 06/15] x86/p2m: guard altp2m code with
 CONFIG_ALTP2M option
Content-Language: en-US
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
 <7a6980b1c67dedb306985f73afb23db359771e8f.1715761386.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <7a6980b1c67dedb306985f73afb23db359771e8f.1715761386.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.05.2024 11:10, Sergiy Kibrik wrote:
> @@ -38,7 +38,10 @@ static inline bool altp2m_active(const struct domain *d)
>  }
>  
>  /* Only declaration is needed. DCE will optimise it out when linking. */
> +void altp2m_vcpu_initialise(struct vcpu *v);
> +void altp2m_vcpu_destroy(struct vcpu *v);
>  uint16_t altp2m_vcpu_idx(const struct vcpu *v);
> +int altp2m_vcpu_enable_ve(struct vcpu *v, gfn_t gfn);
>  void altp2m_vcpu_disable_ve(struct vcpu *v);

These additions look unrelated, as long as the description says nothing in
this regard.

> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -670,7 +670,7 @@ static inline bool hvm_hap_supported(void)
>  /* returns true if hardware supports alternate p2m's */
>  static inline bool hvm_altp2m_supported(void)
>  {
> -    return hvm_funcs.caps.altp2m;
> +    return IS_ENABLED(CONFIG_ALTP2M) && hvm_funcs.caps.altp2m;

Which in turn raises the question whether the altp2m struct field shouldn't
become conditional upon CONFIG_ALTP2M too (or rather: instead, as the change
here then would need to be done differently). Yet maybe that would entail
further changes elsewhere, so may well better be left for later.

> --- a/xen/arch/x86/mm/Makefile
> +++ b/xen/arch/x86/mm/Makefile
> @@ -1,7 +1,7 @@
>  obj-y += shadow/
>  obj-$(CONFIG_HVM) += hap/
>  
> -obj-$(CONFIG_HVM) += altp2m.o
> +obj-$(CONFIG_ALTP2M) += altp2m.o

This change I think wants to move to patch 5.

Jan

