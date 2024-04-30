Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF628B749D
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 13:37:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714760.1116081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1lng-0001LQ-NW; Tue, 30 Apr 2024 11:37:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714760.1116081; Tue, 30 Apr 2024 11:37:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1lng-0001Ia-KG; Tue, 30 Apr 2024 11:37:32 +0000
Received: by outflank-mailman (input) for mailman id 714760;
 Tue, 30 Apr 2024 11:37:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q3to=MD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1lne-0001IU-KL
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 11:37:30 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 066b53e5-06e6-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 13:37:29 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2dd64d6fe94so63011641fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 04:37:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f17-20020a05600c155100b00418db9e4228sm45195028wmg.29.2024.04.30.04.37.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 04:37:28 -0700 (PDT)
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
X-Inumbo-ID: 066b53e5-06e6-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714477049; x=1715081849; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0JdTW7UFSa7+SeiKezY02BJhlI6p6GliceYxuQ1A3oE=;
        b=QKCzuQoAKYhChAd1EyLtSeQEeRpYcbRcWwuGcz/cjKb4TSRFVA6vUNgjEpNJDIyp37
         Ced/WdHfNdLjox5oJk2LsDWFpEw0Afo78B4xSbTgMskmjMo9roST0+fO/3XQzeZEqYCH
         Ck1IMSupUllbx1m8K6vSDolhdyypwfQW4YqEEEJS/EDalugIMf0q5fshV9jbGBijY8lE
         PV00HDR5UWaX5fikhUw65kkbvR8v19FScugXe/b2AxNu8RWb6ZG4qs3tg856i7AXAzLb
         tiOBa4keBeHHyGFTvdECyNh0SnI62mertvPdsBSo46kxyabQVIzc7mqQkNxn38XCXbHr
         w7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714477049; x=1715081849;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0JdTW7UFSa7+SeiKezY02BJhlI6p6GliceYxuQ1A3oE=;
        b=cWegXRlxWfdE0lT6+ATJM4KWK+fWMtwR9jhR1cX6DSSp/jYK/vtxWnmiwVoz9cDoXX
         3Hkql4w8FzSqyxO8j/7foa989KsCVZg5N5fIbFEsoCqwBH4T/EUVsLdNID3w9/pKIn/H
         SmaFT0E5XCneLO1DQGPN9VHPROofHPY4pFxP+7dCh927OTWHLHruV1ksPrDR69ck+Aiy
         W5hX67kkgXA+Oa6pUfcHDRIoxdU3KxE4l9DKdP8cH5KD1PB+Ah5qqTr+K6QDNgPpPJ6E
         PZ4SxQwxd8L/12QL3ctMt53CLDv8TB6kRzBFtyKhjGIcGieOu89xtqMD6ZcAECPzigiW
         p5FA==
X-Forwarded-Encrypted: i=1; AJvYcCV62uzA5N8wlnlppIXXPs9CDBEJCELHr87xtWCmGBk6t0gJtBdq+HYXDyQClPKdPe/YhOdYjSw1BbQLec0R1ULuA7GrMTJCSuvQhOTXEb8=
X-Gm-Message-State: AOJu0YzWuiB/XiJq/JBlJLBy2+wOZD+pES+2ZsjxrVHGpSWALRQr49IP
	j0LODzEzrjsTDaVpwCC313RYiugRvL2gZPCWIDY7VsT9FA7uZmDblTK9A4petg==
X-Google-Smtp-Source: AGHT+IFwKdgSEifukpknhT+rsmgq9x8taUnxxmwAWojYuYjv/lMLXK5Pf7XVrMQe9oMt5P0dJY3Nfw==
X-Received: by 2002:a2e:3a13:0:b0:2db:218:b050 with SMTP id h19-20020a2e3a13000000b002db0218b050mr7500871lja.34.1714477048662;
        Tue, 30 Apr 2024 04:37:28 -0700 (PDT)
Message-ID: <327c7e42-9b59-4925-b746-0b59dbb5a3fb@suse.com>
Date: Tue, 30 Apr 2024 13:37:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/arm: Fix MISRA regression on R1.1, flexible array
 member not at the end
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: consulting@bugseng.com, nicola.vetrini@bugseng.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20240430110922.15052-1-luca.fancellu@arm.com>
 <20240430110922.15052-3-luca.fancellu@arm.com>
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
In-Reply-To: <20240430110922.15052-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.04.2024 13:09, Luca Fancellu wrote:
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -64,18 +64,20 @@ struct membank {
>  };
>  
>  struct membanks {
> -    unsigned int nr_banks;
> -    unsigned int max_banks;
> +    __struct_group(membanks_hdr, common, ,
> +        unsigned int nr_banks;
> +        unsigned int max_banks;
> +    );
>      struct membank bank[];
>  };

I'm afraid I can't spot why __struct_group() is needed here. Why would just
one of the two more straightforward

struct membanks {
    struct membanks_hdr {
        unsigned int nr_banks;
        unsigned int max_banks;
    );
    struct membank bank[];
};

struct membanks {
    struct membanks_hdr {
        unsigned int nr_banks;
        unsigned int max_banks;
    ) common;
    struct membank bank[];
};

not do? (Perhaps the latter, seeing that you need the field name in ...

>  struct meminfo {
> -    struct membanks common;
> +    struct membanks_hdr common;
>      struct membank bank[NR_MEM_BANKS];
>  };
>  
>  struct shared_meminfo {
> -    struct membanks common;
> +    struct membanks_hdr common;
>      struct membank bank[NR_SHMEM_BANKS];
>      struct shmem_membank_extra extra[NR_SHMEM_BANKS];
>  };
> @@ -166,25 +168,25 @@ extern domid_t max_init_domid;
>  
>  static inline struct membanks *bootinfo_get_mem(void)
>  {
> -    return &bootinfo.mem.common;
> +    return container_of(&bootinfo.mem.common, struct membanks, common);
>  }

... container_of() uses.)

Jan

