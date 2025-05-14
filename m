Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B705AB6378
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 08:50:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983800.1369974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF5wC-0005Wt-62; Wed, 14 May 2025 06:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983800.1369974; Wed, 14 May 2025 06:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF5wC-0005UH-33; Wed, 14 May 2025 06:49:56 +0000
Received: by outflank-mailman (input) for mailman id 983800;
 Wed, 14 May 2025 06:49:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uF5wA-0005UA-Cq
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 06:49:54 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2479e27-308f-11f0-9eb6-5ba50f476ded;
 Wed, 14 May 2025 08:49:51 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5f4d0da2d2cso12290608a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 23:49:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad23da570desm664757466b.118.2025.05.13.23.49.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 23:49:50 -0700 (PDT)
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
X-Inumbo-ID: a2479e27-308f-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747205390; x=1747810190; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B3bkkKEXdm1Ipi31r9dCGffV54KWhkwL2eW1cj/BPC4=;
        b=JNJz8QKbaFTn+WH5UIuHE9axYa2UPix2/gdFWnQ8wUepM+DiPufsHytjAWgXw6mX7A
         h6Ug1v4m9yt6jxQhRx5s0rmeb8PCvw0Td5RLrE2XjjYRsuQ1IoBHbRTMGN7lup7RkwvW
         3TgA2Fbe4fjpdBy9TZt1mwzVcVKFJC+hYGzlVZkI6O1nJ3zit38Vqp8Hf/3Hos5yA5Wj
         P9zZo6sj4rV1NiFW/Kp31WsHla4RDHAoon2qD0kU8it4jAzNiWmVpoM2Jl7vDdfSdd+9
         51PLN3g7v1l6vHd/PfnkoxSLHNDmBwbf2Spjv3Je1AoAwtGPKo4untPOcFGmI1KLXsLA
         4ihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747205390; x=1747810190;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B3bkkKEXdm1Ipi31r9dCGffV54KWhkwL2eW1cj/BPC4=;
        b=aIfgqXRkY/HcMqg9BwNf9kRbhwCeKZSb4myOqWwM1zjR1DkgyKWntEVHv0bPMPB4DS
         wzLRPQMpYHIS7ONbXsYf/DS0kWx3q8/4KBOv+RDCdWD3FEAbyB968CAffR6a9Dm0qwpP
         /qvOnjk9YRxIX+fSmDNk2LCWqEpLXj8mXuKCdLBIsK/FX5hB8e2pxr1tnlbQgZSXUoju
         SLjmOYmAew89gc1T83CPamjMwyna1hLG2mlGQnF20Xmea/QA91T0/2Kixs8M6EIEZYJ4
         cDiRk6qjfDOgrwGsoB2gK5eVSclxXPB62p/OVTw+PL0GFow9vHU1TBlqRNgmZi5uCtbQ
         IFxA==
X-Forwarded-Encrypted: i=1; AJvYcCXfWer2QaaTjxVoUHbS+TzEY2VcDyHL9ZoDsyO+29Qqd55CKz/Anb+R8OH7sH1DNEnZMyc61iqQIRc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwqnffkfC8M7MxxFmu4Uf046wb/q9BHzYYoFEJagLaQfj3CYEy6
	0/6IkIlmOq0e3np9g64HD083HHY887S7U8XW8tOMEgMwhlpW5yvUbQzKLMvOjQ==
X-Gm-Gg: ASbGncuLUyzHyqQctPAgCBLIrwC5onVCJ+peO7me4dLub+6rSnPBYrxDnANaytS2+n/
	+LnAYj2DZlS9jUKtYGG3J0if2LKq8AA5q935F4QKZVCkOSMI1A4mI+MfnR1hv1JsgSofMQ/BL/p
	syE7nPrFbK7/sZKHPIgYBk1kcsCsVOFBESLcQCE7hOaaFFEL6tBoFKcLsHWZZcZQxgTt2nTNnwe
	hcikWDUM/m4YMVeWQAy2ExUjzzlfiIL/amv8wdOV5GP3hZaPIRg+k8xB/jnUHyTMSw+tQF6JOU2
	n1eLLUjQqbXBO/tG7QS2epCkAH413rZt+uwYMsBTGxbFZawDMmoADCBFnTLuj/zDphu8T69LVi2
	J6JbJ03dsfXQFLaY4dYM6rW3SHR/i9EMFqkex
X-Google-Smtp-Source: AGHT+IFszv7hvi17mGx5kazwDh3l2onptVcgIt1gYwLTo9m0VvUtKSkIubrEXHJOIjM0BLEx4XuC2Q==
X-Received: by 2002:a17:907:2cc4:b0:ad4:f5ed:add2 with SMTP id a640c23a62f3a-ad4f74c8195mr205901666b.38.1747205390405;
        Tue, 13 May 2025 23:49:50 -0700 (PDT)
Message-ID: <2491389a-cd47-4917-9ade-7082f1ebc678@suse.com>
Date: Wed, 14 May 2025 08:49:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] xen/arm: exclude xen,reg from direct-map domU
 extended regions
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250513195452.699600-1-stewart.hildebrand@amd.com>
 <20250513195452.699600-2-stewart.hildebrand@amd.com>
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
In-Reply-To: <20250513195452.699600-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.05.2025 21:54, Stewart Hildebrand wrote:
> --- a/xen/common/rangeset.c
> +++ b/xen/common/rangeset.c
> @@ -433,6 +433,20 @@ bool rangeset_is_empty(
>      return ((r == NULL) || list_empty(&r->range_list));
>  }
>  
> +int rangeset_count_ranges(const struct rangeset *r)
> +{
> +    int nr = 0;

Ehem - this and the function's return type want to be unsigned.

> +    struct list_head *list;
> +
> +    if ( r == NULL )
> +        return 0;
> +
> +    list_for_each( list, &r->range_list )

Nit: Either you deem list_for_each a pseudo-keyword (then a blank is
missing) or you don't (then there are excess blanks).

Further I don't think this is valid to do without holding the rangeset's
lock in read mode (irrespective of the function return value potentially
being stale by the time the caller gets to look at it, which is no
different from other functions, i.e. falls in the caller's
responsibilities).

> +        nr++;

And then, if already abstraction is wanted, wouldn't this loop better be
yet another helper (macro?) in xen/list.h?

> +    return nr;
> +}

Finally: If this is to be commonly used in several places, having such a
helper is likely fine. As it stands, the sole caller is an __init
function, and hence this is unreachable code post-init (which while not
formally a Misra violation in my eyes effectively still is one). Aiui
the same can be achieved using rangeset_report_ranges(), with a new
(__init and static) callback function.

Jan

