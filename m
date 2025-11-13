Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1647C57E1F
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 15:19:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161678.1489572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJY9v-0001OF-Ba; Thu, 13 Nov 2025 14:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161678.1489572; Thu, 13 Nov 2025 14:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJY9v-0001Lq-8S; Thu, 13 Nov 2025 14:18:47 +0000
Received: by outflank-mailman (input) for mailman id 1161678;
 Thu, 13 Nov 2025 14:18:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJY9t-0001Lk-Qn
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 14:18:45 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a442dec9-c09b-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 15:18:35 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-641677916b5so1618196a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 06:18:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a3d7335sm1575034a12.4.2025.11.13.06.18.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 06:18:34 -0800 (PST)
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
X-Inumbo-ID: a442dec9-c09b-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763043515; x=1763648315; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H0UlQISciIBWlq/TUFTjZ1G3jilWFF0VaPN4BmedAAU=;
        b=WP64nOb2Wsn6ubdU0yLfBwwyoq6RlJijJ2LqYDYTE/1BAwAjnczT3NrlE3l/rJNB8Y
         O3qBlnovd6Og3TDe1nSJ7qxnOeRH/QC/svC2kIN124Dr/DTc0R2NE18Z9Zs7MOb9A31v
         cL8fgVqP8jJJ43lMO5ZGxjkpTypS04UO2rsKV6vY//jHuAbeop+FruwVm5CZG2z6MYIX
         Su8+LV9NyqvONKh7eeIurpvxHCwlErU39SuuyI7hIWSOAQ47UWlfR7MxRVfyMzWoQF68
         MJiAfMPxKN+X3g7GrbinCwQAowneIn3V375hKJWN+EqYABoIxRaDSSe/6ezgojblvo1L
         QKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763043515; x=1763648315;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0UlQISciIBWlq/TUFTjZ1G3jilWFF0VaPN4BmedAAU=;
        b=KsBcTF845B/XZzaIPs+yygiT5NW5dY1vphoAHUQLJFXIWFYjUurmTm/XfxTucFbzWH
         H22mjmNsx16qXvpkF/YpRvJV8wF0KBZ4MOyTHMf8DKoAxvwGVHhXONzGIjmosa0dXfdK
         NVGtqyKj/Qn+XGP0cvxSyB6110Jd6cfS7g30tYxVSQttjSGDgByzqVY/LF6sDSoET2tn
         41wcQXNV095NEmPVolFGw9PgYxP4jl3tOKx6FTaZ+vmayJP8tWReG9v1fnfn0EySFj0G
         +Vz2rIoTk5W3QBriv+0iZ3hg7VpXPBPs7ICNPQ/+Y9od84q+9mT0jhAEhj3eb56lGesq
         GlhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZoisGva5Mrv8NfmwEoiGGzttAvVsl9ROXs6Ub4A8KiMX3I6UovuvFMUSAVx8h/rLgKxfgvCD+zu8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzEOM+LREkcHukQzkbGEkIUsyljw3r66CZCBVmNPWAg82QTT5Hv
	IBu3QnueCLqVE0n/yM7aOHVKnafWgfkGOJhOfOYqGyRNrpJ4hdb0dbDmbZU69tWh/w==
X-Gm-Gg: ASbGncs1Tkk/c2TA6PW+bvWdveBym1PDSc4dZ3iF9hDtnGzGeuKY1Zx+iySsQ2x8Qhy
	v1YxPbBVZj1BPqccoDsvuY9fGo9GDXuaMRCy0E5+33eFH/6CfOJ/bYzwsC3aCCe/G1zgLr4FGZu
	TJP0kvgFaaYd4EBb2B948QO1K+IpBGCOZJ6WfxesXvp1ro2kiDP6KFlB1AqCFceuP7HgTloBCoE
	hpULsPkBODeAB1tOcMjuKXXQFL8IY4yESLIi+2gsjPREthHgLh68fapF8OJ5GE9SH3ir+uTeeiw
	hhg3JgQ6qg5D+0t2kCSZhYpWPvT5ds1M6R715tczU2w6EwifOLOMa2dluZP3SFBwPRr7Id6wg9p
	YUqbepAZ/17IjFEhCYsWPKUKwD0tHYQDtVPd1l9sL3DNyiqkptG/XqjPEQ0yF3zRy7L3M3CfPkh
	VeBnxpE3dcilsjFE7DwI83ihnqMdp2isniwyxByNAvCwaA5q8zRjrzmrnVGUgCoF0Z
X-Google-Smtp-Source: AGHT+IGsKXFg72NR7werMpfKTmmCiEsZ0Btt7tO/76v46MSY3zLxetSHNgdbnbOLmEaxYqtegH2DzA==
X-Received: by 2002:a05:6402:27ce:b0:641:72a8:c91c with SMTP id 4fb4d7f45d1cf-6431a54e90bmr6108275a12.27.1763043515253;
        Thu, 13 Nov 2025 06:18:35 -0800 (PST)
Message-ID: <0978b00a-3848-4c45-aa64-46756c43bb5b@suse.com>
Date: Thu, 13 Nov 2025 15:18:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] xen/page_alloc: Protect claimed memory against
 other allocations
To: Bernhard Kaindl <bernhard.kaindl@cloud.com>
Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1757261045.git.bernhard.kaindl@cloud.com>
 <b37634dd9a37b52030bc8196dcdeec896a5706a6.1757261045.git.bernhard.kaindl@cloud.com>
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
In-Reply-To: <b37634dd9a37b52030bc8196dcdeec896a5706a6.1757261045.git.bernhard.kaindl@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.09.2025 18:15, Bernhard Kaindl wrote:
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -980,9 +980,19 @@ static struct page_info *get_free_buddy(unsigned int zone_lo,
>      {
>          zone = zone_hi;
>          do {
> -            /* Check if target node can support the allocation. */
> -            if ( !avail[node] || (avail[node][zone] < (1UL << order)) )
> -                continue;
> +            unsigned long request = 1UL << order;
> +            /*
> +             * Check if this node is currently suitable for this allocation.
> +             * 1. It has sufficient memory in the requested zone and the
> +             * 2. request must fit in the unclaimed memory of the node minus
> +             *    outstanding claims, unless the allocation is made by a domain
> +             *    with sufficient node-claimed memory to cover the allocation.
> +             */
> +            if ( !avail[node] || (avail[node][zone] < request) ||
> +                 (insufficient_memory(node, request) &&
> +                  (!d || node != d->claim_node ||     /* a domain with claims */

What if ->claim_node is NUMA_NO_NODE?

Jan

