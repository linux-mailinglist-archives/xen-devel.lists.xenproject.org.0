Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 853798B7A86
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 16:48:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714970.1116388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1oli-0004TG-61; Tue, 30 Apr 2024 14:47:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714970.1116388; Tue, 30 Apr 2024 14:47:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1oli-0004Rk-2v; Tue, 30 Apr 2024 14:47:42 +0000
Received: by outflank-mailman (input) for mailman id 714970;
 Tue, 30 Apr 2024 14:47:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q3to=MD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1olg-0004Re-HZ
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 14:47:40 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9694b580-0700-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 16:47:38 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-41ba1ba55e9so32014095e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 07:47:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n18-20020a05600c4f9200b004169836bf9asm49080558wmq.23.2024.04.30.07.47.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 07:47:37 -0700 (PDT)
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
X-Inumbo-ID: 9694b580-0700-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714488457; x=1715093257; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=46tskrF92hLUMV+B1R/GuJlMBvlIuA3gaMSqcfZbiSc=;
        b=dHFWR8R6YWoe8WVFqB0LRW+f2JWdL/KODt4U0mdbcljVLACayVUOuBGmh3OKAYJKhO
         q3HMQkhSFym+NgKMQddGvN0xA/wCaHHwCihruiZdev5fOUQ6djx3qiurlUkSDwgBTx5O
         x3rT+Iecm/YFTbYWB6tRcBr1gonh859YLrmLvTQxOgQ2XCaSQOspfll2cu0w5Zqv2Fa0
         4gQ+4/3wHbZuHqumrZTODPgGQ3nIP45Cw5pxrqZ/T0cxxeJv7D6IR58bHWRKoKpZDuDu
         DylWirQsqqYCDyXXTWR4hSXDTbkKEhm4ZrXmMN8uoL5osQEC7Cx/pnebBzholBEPY8i7
         SRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714488457; x=1715093257;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=46tskrF92hLUMV+B1R/GuJlMBvlIuA3gaMSqcfZbiSc=;
        b=caZg1JG+/ZRx8c9Dh4NLU6jyJpeJFqPYEzrLo17YDMjgYrYrnKfQQGSUnuZRDKTw7i
         UYyJ0ea2EXUlDEk+u2gjHCRPyZ/hJwJ6sbNFjI9EzKtKOeQtsEsLr+gOOv2mNuVi2XYA
         /3v/Vxt+TSWBtxSHHB9XYBgGtM0teZNY9HiUVx/UG4VXnMAzPfsDlcNxiW1TXwPO1m0z
         y1rwczYZkMZtUl79OLR4v4M2oPa6suWJKzm8ZaYkBzh7iPOeqCiW3jl1lLAVXRJ05g9b
         27oXelvzofe84BLjTlS81OiewL+pDECffaMXyiN4gcqe4L46aQ/6FrXpqYVAHuun3aXo
         qVZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLoo68mM7vWeE0dhXWrXiz5E17EZkoUWOA1Nwe7AazEGR+5VkktWhJGLwASVt3Bk6lTCwGIf+Xj/B4txVulJraFYbhEy+GRjDYlXu4D2g=
X-Gm-Message-State: AOJu0Yy68ctCFQx7AHyhffak27HclEnQY1dJo1SAHuddXJPoWltaMTvN
	2VcKAPG3ej4H6EJEUeLNucp6qQ1+/HtyvN6HybD6mCMXMXmnyMiaRo5hzzT5hQ==
X-Google-Smtp-Source: AGHT+IFGfYOKD1Ew6vAwLQwXYErXklb+XrKRE4ydayaDumhsA9MRBoz14X1djwOZyHQB/LMwhwTP8g==
X-Received: by 2002:a05:600c:1d9f:b0:41c:97e:20b9 with SMTP id p31-20020a05600c1d9f00b0041c097e20b9mr2566449wms.14.1714488457539;
        Tue, 30 Apr 2024 07:47:37 -0700 (PDT)
Message-ID: <4d9930d4-4379-4440-83b2-14ebffc7c03d@suse.com>
Date: Tue, 30 Apr 2024 16:47:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] x86/hap: Increase the number of initial
 mempool_size to 1024 pages
Content-Language: en-US
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Anthony PERARD <anthony@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1714322424.git.w1benny@gmail.com>
 <a26bc4aeba89f7895c79df7e320adfc695b16d50.1714322424.git.w1benny@gmail.com>
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
In-Reply-To: <a26bc4aeba89f7895c79df7e320adfc695b16d50.1714322424.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.04.2024 18:52, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
> 
> This change anticipates scenarios where `max_altp2m` is set to its maximum
> supported value (i.e., 512), ensuring sufficient memory is allocated upfront
> to accommodate all altp2m tables without initialization failure.

And guests with fewer or even no altp2m-s still need the same bump? You
know the number of altp2m-s upon domain creation, so why bump by any more
than what's strictly needed for that?

> The necessity for this increase arises from the current mechanism where altp2m
> tables are allocated at initialization, requiring one page from the mempool
> for each altp2m view.

So that's the p2m_alloc_table() out of hap_enable()? If you're permitting
up to 512 altp2m-s, I think it needs considering to not waste up to 2Mb
without knowing how many of the altp2m-s are actually going to be used.
How complicate on-demand allocation would be I can't tell though, I have
to admit.

> --- a/tools/tests/paging-mempool/test-paging-mempool.c
> +++ b/tools/tests/paging-mempool/test-paging-mempool.c
> @@ -35,7 +35,7 @@ static struct xen_domctl_createdomain create = {
>  
>  static uint64_t default_mempool_size_bytes =
>  #if defined(__x86_64__) || defined(__i386__)
> -    256 << 12; /* Only x86 HAP for now.  x86 Shadow needs more work. */
> +    1024 << 12; /* Only x86 HAP for now.  x86 Shadow needs more work. */

I also can't derive from the description why we'd need to go from 256 to
1024 here and ...

> --- a/xen/arch/x86/mm/hap/hap.c
> +++ b/xen/arch/x86/mm/hap/hap.c
> @@ -468,7 +468,7 @@ int hap_enable(struct domain *d, u32 mode)
>      if ( old_pages == 0 )
>      {
>          paging_lock(d);
> -        rv = hap_set_allocation(d, 256, NULL);
> +        rv = hap_set_allocation(d, 1024, NULL);

... here. You talk of (up to) 512 pages there only.

Also isn't there at least one more place where the tool stack (libxl I
think) would need changing, where Dom0 ballooning needs are calculated?
And/or doesn't the pool size have a default calculation in the tool
stack, too?

Jan

