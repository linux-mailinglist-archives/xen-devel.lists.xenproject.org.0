Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CAAAE5C3E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 07:58:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023092.1398997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTwfs-0007Qm-6X; Tue, 24 Jun 2025 05:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023092.1398997; Tue, 24 Jun 2025 05:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTwfs-0007O6-2r; Tue, 24 Jun 2025 05:58:28 +0000
Received: by outflank-mailman (input) for mailman id 1023092;
 Tue, 24 Jun 2025 05:58:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTwfr-0007O0-CZ
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 05:58:27 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3df94715-50c0-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 07:58:25 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45363645a8eso122345e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 22:58:25 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f2f9:d2d:164b:59bd:2475?
 (p200300cab711f2f90d2d164b59bd2475.dip0.t-ipconnect.de.
 [2003:ca:b711:f2f9:d2d:164b:59bd:2475])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453769da7f6sm49058255e9.40.2025.06.23.22.58.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 22:58:24 -0700 (PDT)
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
X-Inumbo-ID: 3df94715-50c0-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750744705; x=1751349505; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fA64XLLXaOWg/barh+VGMBQmAJDfhHcRQX2io5oVFKQ=;
        b=E8IFGIwVFa4s5ovrNhJtmpRBkpq9mfdPAe4Y9QL9ZyAr6ypoLewLRYmlXIctHSRaZJ
         nyHmYyaMfOSG2RdrUdbGE91nO6g5ktHFbj3IMXErFAbS56SMxO0nQmxsXNFsW1KXicwb
         LOa5Qg14HBnVx5hnV4eFkxsJJwm5p3vPs6FcghwYXOqJqmtHdRMF8HBVDEuKJxauYcFw
         0JGUUmV2RSchJbOvH6XmRH0Fsh0uhdICu1TlvUnWKkT7lJpC+p5OhQr+mNoLSk90Gx7B
         5lZXF5MHGJqqjsUtHrniDTiFxrpyh8uBdVqSzuX1C4+7ZhkO5VZe9iALAFvFeDeHTcct
         RCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750744705; x=1751349505;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fA64XLLXaOWg/barh+VGMBQmAJDfhHcRQX2io5oVFKQ=;
        b=WSAleYch7LZMZQ3JgdFEkMPMtgCVMjkGDVQk5O6eTBKHEX2TflBcRyPmeKXIHQPeDk
         qKtd6xX9SFRFBiwQN18rR4JKGWuOqRAFDDwnqqDO7Miiea1K1cOct5JJDcH5OkPj9MKi
         Znv8jpj7T7pw9Pnyxqno1TE1CksMBZGAUvVEzzV2lvg9UFy00qoowvmMkxLpxuW3Uvoz
         p/v2Iqqs+Ww5p8ydIYCsQ8ugPaIUCLSj4w3DM7Qy+uBb6Ku8i37H/VmTCCcfkODW/OX2
         5uMUxKYn3uZTrfZUa4u37YSeRn6z17j7Kd/M15faffJik6GLGyUqViM4V1Db5TP50cK2
         kWsA==
X-Forwarded-Encrypted: i=1; AJvYcCU1zXdwLEaIUy3WAMS8FpUFjwVZHMAyWLql+MhxbQlY2iY7C3bOs4iq3M3l+9cep64T7m7dnZDVS9E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwO/wihai2H/9G7GeUuU4b7+SBCVSkplwbnOVV55GRcFG4E2d3l
	KMLXYBxW0pyHDZqiBhKfq+QFva/V2Np5dtq7mqkbpZ1+L5IdJnWYBC+pb2G2Ibvc7w==
X-Gm-Gg: ASbGncuoHmMzzgI4P1deJWG7zjdtdDqDAcRtAoViUjm6mGGucFnIwo4ymacK72lBjfm
	Ku4m8GCUvTmlheSlpy663GQeBeMpCUTkXDyxsYDU6EA+rsb1XVtc2Nlt5Cx91RF1Ovo+CcGg+hy
	Pgd1fcGLC8BOQubh52Zit1pntcWsmy074OZqoKjNULqcpz3oqfQJNeigMZzlQceSkuV2tdpS0Eu
	CdXPVQwY+EFSJu773NYm1AO3GsU8lsqb7aY84mwYQtwREY5GvJnkDLLKeUKJkU92iL/5dBWYYqy
	Y2IBWPf+g/fwFaOTk3bmi8JRTosMRPjWpy9Jmv7HWYuX914yEzca0QFRK4DS2XrpYD7+v4ZNAgi
	U6bv6qiYvliKc7BgK4UImVbirfqSlS28yLVHskxNTAonWE9lh3/dDbdQ2sQk1BuFdSIXCl/auRl
	vvYPZZQrhZ4JIiRHbDSw==
X-Google-Smtp-Source: AGHT+IGz1u0VS0S47EcvyuhHVrICLkRvQhA5/UfUCwgSXjPcak+OSlCJfS9SuH8qq5yFhzq0AVittQ==
X-Received: by 2002:a05:600c:1f14:b0:453:5d8d:d1b8 with SMTP id 5b1f17b1804b1-453659c4169mr151058945e9.30.1750744704722;
        Mon, 23 Jun 2025 22:58:24 -0700 (PDT)
Message-ID: <5ddcd969-cdb8-4ec7-8272-d7d733865fab@suse.com>
Date: Tue, 24 Jun 2025 07:58:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/3] xen/domain: unify domain ID allocation
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250623182721.194238-1-dmukhin@ford.com>
 <20250623182721.194238-2-dmukhin@ford.com>
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
In-Reply-To: <20250623182721.194238-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.06.2025 20:28, dmkhn@proton.me wrote:
> @@ -2433,6 +2443,71 @@ void thaw_domains(void)
>      rcu_read_unlock(&domlist_read_lock);
>  }
>  
> +domid_t domid_alloc(domid_t domid)
> +{
> +    static domid_t domid_last;
> +
> +    spin_lock(&domid_lock);
> +
> +    /* Exact match. */
> +    if ( domid < DOMID_FIRST_RESERVED )
> +    {
> +        if ( __test_and_set_bit(domid, domid_bitmap) )
> +            domid = DOMID_INVALID;
> +    }
> +    /*
> +     * Exhaustive search.
> +     *
> +     * Domain ID#0 is reserved for the first boot domain (e.g. control domain)
> +     * and excluded from allocation.
> +     *
> +     * In dom0less build, domains are not dynamically destroyed, so there's no
> +     * need to do a wraparound of the IDs.
> +     */
> +#ifdef CONFIG_DOM0LESS_BOOT
> +    else if ( domid_last + 1 >= DOMID_FIRST_RESERVED )
> +    {
> +        domid = DOMID_INVALID;
> +    }
> +#endif

With this, ...

> +    else
> +    {
> +        domid = find_next_zero_bit(domid_bitmap,
> +                                   DOMID_FIRST_RESERVED,
> +                                   domid_last + 1);
> +#ifdef CONFIG_DOM0LESS_BOOT

... was this meant to be #ifndef?

> +        if ( domid == DOMID_FIRST_RESERVED )

This needs to be >=.

> +            domid = find_next_zero_bit(domid_bitmap,
> +                                       DOMID_FIRST_RESERVED,
> +                                       1);
> +#endif
> +
> +        if ( domid < DOMID_FIRST_RESERVED )
> +        {
> +            __set_bit(domid, domid_bitmap);
> +            domid_last = domid;
> +        }
> +        else
> +        {
> +            domid = DOMID_INVALID;
> +        }
> +    }
> +
> +    spin_unlock(&domid_lock);
> +
> +    return domid;
> +}
> +
> +void domid_free(domid_t domid)
> +{
> +    if ( domid < DOMID_FIRST_RESERVED )

Is this legitimate to happen? IOW doesn't this want to be some kind of
assertion?

Jan

