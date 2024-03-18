Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B958B87EB7E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 15:57:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694774.1083881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmEQU-0007r3-2V; Mon, 18 Mar 2024 14:57:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694774.1083881; Mon, 18 Mar 2024 14:57:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmEQT-0007oG-VW; Mon, 18 Mar 2024 14:57:21 +0000
Received: by outflank-mailman (input) for mailman id 694774;
 Mon, 18 Mar 2024 14:57:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=emy9=KY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmEQT-0007oA-56
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 14:57:21 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1843e76-e537-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 15:57:19 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a46cc855600so118880966b.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 07:57:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l20-20020a1709067d5400b00a46bed423a0sm1170690ejp.23.2024.03.18.07.57.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 07:57:19 -0700 (PDT)
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
X-Inumbo-ID: d1843e76-e537-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710773839; x=1711378639; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vaPg+rnST4a2xz31vCnYXXNma73H0XKOPY4z7JssaZk=;
        b=X9r5kvVm40K5yb9o301x9jIMgotHo9zbdP89YDym8zui7CONhLxQ5qd466YQqb2x+L
         X3Y7cw5Z+oNrd2VyWvb3SfPyfD2kyQHtaejznzhWWaUkGlgX0Kuuf3JSXYgaBR9+R8WA
         jARR9TtkKI9WPnr62zcunZ6QHzOHwdr4q6EtwWZoB0h1WXGuP5XGxVH8a0RZwqGE7hvm
         bxyMffjsb6hHOchbi+i78D/ZKLNp5BaPpObBVZIrEJ1X09lbb7lp9ypQDuDfJq604RZ0
         QDiCxIPVHPHR6DPL49VVtPH8mZd5+376kAPGLlWC+MhD+hDnTArH3Qud1aL8tU7OIQDB
         Uw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710773839; x=1711378639;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vaPg+rnST4a2xz31vCnYXXNma73H0XKOPY4z7JssaZk=;
        b=hU8oONtU45kYVZXykEDYQWtJD9I4BklC/1A6RZfK0f8CuOCiAbAMr8OJ8bcfzeSXjd
         whre/yFmqaWbwcq9cZejNoACHn05fJv9MXRFkRJXbTRmtRiUSGyvPplVmsveo1uCOaN5
         aHb1lQpfpb11c8MX9kVFLGBYFCi72MC8Co4b2GO3AzpfTHM/xolDFFlQ93HY7jvrKGmg
         foCbtHzMdAxyhSMptEaUY/n6eBUuA4Trp9+NsIt/QVEdg/SzHq6R1IAADHwOyg1rrltn
         AO7DyrcbQsbUV98XOujH46CCJBRx/hkf8vc47hzgr6ry57yucGm6Ee1PS1NnMW1bxHpq
         RxNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUB2NBHyFSZtZejRSyOATHoQgjVLtnHR3EuNnwFtm5BVjjW9AuhW1ipROdMZX6GHqwcw4FFeoedTcbJGlvFlTZIhHbXjGi20gA/Uawc6fk=
X-Gm-Message-State: AOJu0YxOTRgOAoUZWALPrJjMlddxoe2dt5KYyc2loNN8LlJGlRLKKGLH
	KZYyaUNdfm2tcEswM3OKFTCHG+EuzKQ7/ldoOBsRUegD9zqXMssAThOZINSleQ==
X-Google-Smtp-Source: AGHT+IG5ibjyMQwRKzdG7XcJfHQj5hiPJH7hWMKT4SPwg+9pxK6Fmg6J+bMyuLtg9HAUgn+RZoamAA==
X-Received: by 2002:a17:906:6bd4:b0:a44:1e32:a503 with SMTP id t20-20020a1709066bd400b00a441e32a503mr8582452ejs.22.1710773839286;
        Mon, 18 Mar 2024 07:57:19 -0700 (PDT)
Message-ID: <ceb2083a-0d57-44fb-bd78-d8f44ae0bc9b@suse.com>
Date: Mon, 18 Mar 2024 15:57:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/13] xen/spinlock: add missing rspin_is_locked() and
 rspin_barrier()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240314072029.16937-1-jgross@suse.com>
 <20240314072029.16937-9-jgross@suse.com>
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
In-Reply-To: <20240314072029.16937-9-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2024 08:20, Juergen Gross wrote:
> --- a/xen/common/spinlock.c
> +++ b/xen/common/spinlock.c
> @@ -395,14 +395,7 @@ static bool always_inline spin_is_locked_common(const spinlock_tickets_t *t)
>  
>  int _spin_is_locked(const spinlock_t *lock)
>  {
> -    /*
> -     * Recursive locks may be locked by another CPU, yet we return
> -     * "false" here, making this function suitable only for use in
> -     * ASSERT()s and alike.
> -     */
> -    return lock->recurse_cpu == SPINLOCK_NO_CPU
> -           ? spin_is_locked_common(&lock->tickets)
> -           : lock->recurse_cpu == smp_processor_id();
> +    return spin_is_locked_common(&lock->tickets);
>  }

The "only suitable for ASSERT()s and alike" part of the comment wants
to survive here, I think.

> @@ -465,6 +458,23 @@ void _spin_barrier(spinlock_t *lock)
>      spin_barrier_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR);
>  }
>  
> +bool _rspin_is_locked(const rspinlock_t *lock)
> +{
> +    /*
> +     * Recursive locks may be locked by another CPU, yet we return
> +     * "false" here, making this function suitable only for use in
> +     * ASSERT()s and alike.
> +     */
> +    return lock->recurse_cpu == SPINLOCK_NO_CPU
> +           ? spin_is_locked_common(&lock->tickets)
> +           : lock->recurse_cpu == smp_processor_id();
> +}

Here otoh I wonder if both the comment and the spin_is_locked_common()
part of the condition are actually correct. Oh, the latter needs
retaining as long as we have nrspin_*() functions, I suppose. But the
comment could surely do with improving a little - at the very least
"yet we return "false"" isn't quite right; minimally there's a "may"
missing.

In principle, without any nrspin_*() functions, the result here ought
to be usable generally, not just for ASSERT()s. Whether having its
and _spin_is_locked()'s behavior differ would be a good idea is a
separate question, of course.

Jan

