Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9DCAB3BC6
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 17:16:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981708.1368120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEUsx-0007Tb-Be; Mon, 12 May 2025 15:16:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981708.1368120; Mon, 12 May 2025 15:16:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEUsx-0007RM-7A; Mon, 12 May 2025 15:16:07 +0000
Received: by outflank-mailman (input) for mailman id 981708;
 Mon, 12 May 2025 15:16:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEUsw-0007RG-41
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 15:16:06 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0529d887-2f44-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 17:16:04 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5fbeadf2275so7965182a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 08:16:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2290a4cc2sm521517166b.183.2025.05.12.08.16.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 08:16:03 -0700 (PDT)
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
X-Inumbo-ID: 0529d887-2f44-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747062963; x=1747667763; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1vaOAeO+2iZcxputsDsvjqYlnmGm22ZI4rH48ZJ96VM=;
        b=D6wk1Jt7beSU76p6reZgCuDmgIi7BUpsAjKR1j11WJtpM1UHtDftvvhssOHlK0Ssss
         O4ZmKiX0AjDinuuAgkg8EmHbtknSGeWpIxA/U95vN5kp5C4PwHHmK6ijzJwikgPHvr5Q
         xXdUtYmNDQeDWRFNMKwL1OfhbJiGWlGs9P59Ch6Rk8Y3T0dc0mGiY4VMzSJEjeyNrjzq
         cbYBd7SQ4fWplu9zx1gJtObVEstihArOPaMjiOzUhDqYTRekEYvd7OAwz+1ZcW+TOpaa
         qpUeJq5LCau7aIs2QuWUenhW+w4u5cR9QMm1C6Mx8Zf9KquKquNf3Y75q/Y4CSbLsGTK
         SKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747062963; x=1747667763;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vaOAeO+2iZcxputsDsvjqYlnmGm22ZI4rH48ZJ96VM=;
        b=eYvJfveu8BVwM8ViKKwxDZUyHcNEXVkIJfJ3cdJebJyoUn0ufPA4nX/WFK8uh3mqPt
         q/SSB/dOnduPHdKturQbzN8lndaKJAlsWwyKQXUCf05ZwBZqA37Ps7eqvO9MXYo//+iH
         S+HYXlZ7Ht/5icXDC7ASK89bB2rQFmBi+/dXDtzv0HYI7475DXNlNOktj/wZj73srQpC
         yri9z5bJ9koSJ7sgXuw+akb+wcZGV172bDmgXAZaDZtZBvXlNOi/gaqIhcrg8vp53qPT
         A6OYg2Wd0mmGQ83COKYlAgJM9KZC9O5BQMzPhgMY6Qwy8tv38Tu8hr+nW9ujR7qMfzmP
         +fcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrUTNwHNcbWjLr/QGl7vZRxrL/dsDXJ4XJSzLDCNXyCA0wY70T/lDW03M/5aD5aIpO5SIdq2nslHs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxEiAsST0Qqq9JGEC+9f5muEV3nBTLr+N9AOft0E8Lwq0eSnLx0
	PQNrJGGQRAZigYOklmKR5zMdaiUXEmqBvR4kbsll83nC9Twh103VT6YLHCtWlw==
X-Gm-Gg: ASbGnct8xputuiwUQPZ/T8Zoelnv1c0Fa7ZDo9DovmARBsp8mXTiQEeRDJUZc+uLEQ2
	PREOh3UglQwdBSJzQ+2NWKb4ORLZIahIcj3dXnxuRKP+0b13MqosPEHAhM3p2FpWlBUuGWv9Egq
	+HEB+azNYMgkrTyC6gevas0bpsSGf9T1mUZB+FDPO4blsgT/jUM8mV6Q0Xp8BtxvZe7gsNqYLGY
	HAtkpGF9bBhlc4WWXhu2Uh9dfCloO5gREJvaKfe6PX1sXSxaKn4LUiJnkUZE49QpfroxOlB+BDc
	1sniyqbtfN5tRs2xRqiVck431onWqW8msIt6BsKqrv7hPZTnqSoRqfzc55vNMAAMSoXk91vgqt/
	Lu0hu/FxYdzVaiCAzaCX9/CBsMS0AazkkFcvO
X-Google-Smtp-Source: AGHT+IGT/brKM2IUCwhqhCRK+2J/fKmc59SeAAQTZPOM1JcySiQGkMtb1Oqj/p+yiR6kqDc8FOmzkw==
X-Received: by 2002:a17:907:8990:b0:ad2:2ba6:2012 with SMTP id a640c23a62f3a-ad22ba6342fmr912545966b.11.1747062963445;
        Mon, 12 May 2025 08:16:03 -0700 (PDT)
Message-ID: <e2396e92-79b6-487a-88d6-725cd9e173a9@suse.com>
Date: Mon, 12 May 2025 17:16:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] xen/x86: rename cache_flush_permitted() to
 has_arch_io_resources()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-8-roger.pau@citrix.com>
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
In-Reply-To: <20250506083148.34963-8-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.05.2025 10:31, Roger Pau Monne wrote:
> To better describe the underlying implementation.  Define
> cache_flush_permitted() as an alias of has_arch_io_resources(), so that
> current users of cache_flush_permitted() are not effectively modified.
> 
> With the introduction of the new handler, change some of the call sites of
> cache_flush_permitted() to instead use has_arch_io_resources() as such
> callers are not after whether cache flush is enabled, but rather whether
> the domain has any IO resources assigned.
> 
> Take the opportunity to adjust l1_disallow_mask() to use the newly
> introduced has_arch_io_resources() macro.

While I'm happy with everything else here, to me it's at least on the
edge whether cache_flush_permitted() wouldn't be the better predicate
to use there, for this being about ...

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -172,8 +172,7 @@ static DEFINE_SPINLOCK(subpage_ro_lock);
>  
>  #define l1_disallow_mask(d)                                     \
>      (((d) != dom_io) &&                                         \
> -     (rangeset_is_empty((d)->iomem_caps) &&                     \
> -      rangeset_is_empty((d)->arch.ioport_caps) &&               \
> +     (!has_arch_io_resources(d) &&                              \
>        !has_arch_pdevs(d) &&                                     \
>        is_pv_domain(d)) ?                                        \
>       L1_DISALLOW_MASK : (L1_DISALLOW_MASK & ~PAGE_CACHE_ATTRS))

... cachability, which goes hand in hand with the ability to also
flush cache contents.

Tangentially - is it plausible for has_arch_io_resources() to return
false when has_arch_pdevs() returns true? Perhaps there are exotic
PCI devices (but non-bridges) which work with no BARs at all ...

Jan

