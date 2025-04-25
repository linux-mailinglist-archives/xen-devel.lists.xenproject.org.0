Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C59CBA9C317
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 11:16:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967562.1357340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8F9x-0007BI-5r; Fri, 25 Apr 2025 09:15:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967562.1357340; Fri, 25 Apr 2025 09:15:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8F9x-00079s-2Q; Fri, 25 Apr 2025 09:15:49 +0000
Received: by outflank-mailman (input) for mailman id 967562;
 Fri, 25 Apr 2025 09:15:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u8F9w-00079m-4S
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 09:15:48 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df488273-21b5-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 11:15:46 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-39ac56756f6so1953606f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 02:15:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e5c68esm1703053f8f.82.2025.04.25.02.15.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 02:15:46 -0700 (PDT)
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
X-Inumbo-ID: df488273-21b5-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745572546; x=1746177346; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VPkxJkrmdguKWsoDLSMzCT326SLERXlANpD29MtWkA0=;
        b=cFMjhdYelIdr3hChwyJIQLUKlM7vtxJCJQBXXQ9DxZrdImarbf7gg5toooQPQ6p8rb
         taqfc3MXBf3pqhiZ/XxcIekLa7Q4syy0GEP7uTABf/G1kVcFnzHklES7+d3ju2Xrgk6P
         iLFNvjPC017worBN5HBCyi76pXBt3uKgfeB0NpxEx49AFCsQeBIqMALQ0KF5CDIxJQ4a
         NCdai/ZSpjurs04XA3CE0UTIvJftRFVVkQl13CkEPcvaeAvLtP31VOb+2JqynaaT5LZ+
         3h+Vqw3CXz3aELvcizqegWsfOPxu8n16Jh7I5sMzteyh6esPXkGC3UqxEWEMggWDMcB9
         nZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745572546; x=1746177346;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPkxJkrmdguKWsoDLSMzCT326SLERXlANpD29MtWkA0=;
        b=qMDAGEO912T14JsFJOcMsTSfZU2bMvYog3WxJHH+HrZ0zl2chD28iAa6tW0X7Q+KJG
         s9hOdj4ote3TGuES8ZIIXCwjLc4efBx1L6vzmnnEijeqqfD6+TPtnvLNOi4tpq9Z6t0b
         Iaaj2Yo8J2eH1xt2Kjb8tjCQHXDXpKVxVfQUpeJx8G9QIEf0XhbuPx7DY2hoDI0ik48t
         FORGCE1+8aNGRwI92Z82hysdwa5uu8SWlwDTJwSVUVqHaGYJ55WEQeElR8FbtTt9SMEI
         BLcAxqEODU507dF7tXRK13Ybu9JM87wvGuxxU+E9qCdH1IrdrmM+cEzQz0ppLSikO/kt
         iWqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUz2APlfqXROrdAjbJ0eqIOerCcEWS7OiQ8pxLJVP66Gl34isYJzFUWAIrGssLzl37yqSO+AcMv/0Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YymAxFixklzyGVFfm2maU5fQogN9NGKTe/9d7KgXu5fymw/7Nmw
	9W3Z2hpleRvvaOQVpXIas78Hwa3C/ew1CXuiBtjjZBvQ7iEJF/WzDAQ4SWxveQ==
X-Gm-Gg: ASbGncubG01Aa3NxsOic1h6hwwc0zAwbebovImIX2GC368fHy4eZPBFtA2+On/OzX7O
	ltsgcM0SGgE9rG5AfRvpYrxwCqK72hjesvocJ23bmOC2plnoOhDfneMgZG4TBi4zDpVfFl6CFjf
	tN5irI3cCHFv+2wkOFDOzk4xQObRKpbulNUegAxmVa1dGREni/Pi3XNjQ6vIZVfvbrjC295BzHl
	6q6sbNsVpfZA8McZIkayq3posyp6IKkFozILvHANREmocTsSfJFWZ0+noOnRgLhh/3OWgpIrvb1
	iC+9q92Wtn/aDAMgNvIpBrIOC6Dxj6BqMumMiGylhhzxH00nnAXuhHw4SttzNv3OK51OFFa+yYV
	f3oEURYMHoKkS2qCsHOq/rOPwGA==
X-Google-Smtp-Source: AGHT+IEgcYwJuL/d71ij0Zbnl+fYaFlZ7C+KzbHw2hzSaZEO1jiI0P5imMVXrx6qgAnkXr0JGET0qA==
X-Received: by 2002:a05:6000:4308:b0:39c:2665:2c13 with SMTP id ffacd0b85a97d-3a074f76f29mr1086975f8f.54.1745572546330;
        Fri, 25 Apr 2025 02:15:46 -0700 (PDT)
Message-ID: <a5a44168-1c4e-4e16-b00d-557975862bfb@suse.com>
Date: Fri, 25 Apr 2025 11:15:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hyperv: Adjust hypercall page placement
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20250424124505.42156-1-agarciav@amd.com>
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
In-Reply-To: <20250424124505.42156-1-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.04.2025 14:45, Alejandro Vallejo wrote:
> Xen nowadays crashes under some Hyper-V configurations when
> paddr_bits>36. At the 44bit boundary we reach an edge case in which the
> end of the guest physical address space is not representable using 32bit
> MFNs. Furthermore, it's an act of faith that the tail of the physical
> address space has no reserved regions already.
> 
> This commit uses the first unused MFN rather than the last, thus
> ensuring the hypercall page placement is more resilient against such
> corner cases.
> 
> While at this, add an extra BUG_ON() to explicitly test for the
> hypercall page being correctly set, and mark hcall_page_ready as
> __ro_after_init.
> 
> Fixes: 620fc734f854("x86/hyperv: setup hypercall page")
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

Just in case you re-submit (as per later discussion), and respective code
was to stay, two style nits:

> --- a/xen/arch/x86/e820.c
> +++ b/xen/arch/x86/e820.c
> @@ -582,6 +582,20 @@ int __init e820_add_range(uint64_t s, uint64_t e, uint32_t type)
>      return 1;
>  }
>  
> +uint64_t __init e820_reserve_hole(void)
> +{
> +    for ( unsigned int i = 0; i < e820.nr_map; i++ )
> +    {
> +        uint64_t hole = e820.map[i].addr + e820.map[i].size;
> +        if ( e820_add_range(hole, hole + PAGE_SIZE, E820_RESERVED) )

Blank line between declaration(s) and statement8s) please.

> +            return hole;
> +    }
> +
> +    print_e820_memory_map(e820.map, e820.nr_map);
> +    panic("Unable to find a hole in e820");
> +}
> +
> +

No double blank lines please.

Jan

