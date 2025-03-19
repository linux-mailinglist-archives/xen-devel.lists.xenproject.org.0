Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C92EA68F16
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 15:29:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920802.1324859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuuQI-0002Pi-IV; Wed, 19 Mar 2025 14:29:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920802.1324859; Wed, 19 Mar 2025 14:29:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuuQI-0002Np-FT; Wed, 19 Mar 2025 14:29:34 +0000
Received: by outflank-mailman (input) for mailman id 920802;
 Wed, 19 Mar 2025 14:29:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuuQG-0002NT-O6
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 14:29:32 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92280bd7-04ce-11f0-9ffa-bf95429c2676;
 Wed, 19 Mar 2025 15:29:31 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso33315505e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 07:29:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43fdeb6esm20456365e9.31.2025.03.19.07.29.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 07:29:30 -0700 (PDT)
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
X-Inumbo-ID: 92280bd7-04ce-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742394570; x=1742999370; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9chD1AXAcocFm5UVDi2Gr5S/mJL+Pr0m8lUaZ6dNcoE=;
        b=K5sg0Pigv3hw7ENknke3sFGtli9eCKAY96nakl6eGbr+yhGBuHDwyJUa8cUI4cYyLG
         3mOiP/OGhOGVtc/ku8BHpj9JIjFCYLzZrHpP3rgVozNRS8OoPDPjXzn+cAFyDYsQ7fKZ
         X6MRWGSqgigKa0kO39tlCAKHuJPL1ccLN9v2Cjwa1tYxm6jEy7q6+TXXMN/+NoDindV+
         3VEj5UDK6uUNkWlTGDhBVnMJLtaD3lro89PVGkuzAzxEFEKrSHyQkpdSSZanQtERCx9p
         h0WOBjSSUpxiyBsQLyvmq+bC5Tar4Q77cJCM/8q/ayobtPEW9k3PNXhU9PzbjXZbrD3D
         twVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742394570; x=1742999370;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9chD1AXAcocFm5UVDi2Gr5S/mJL+Pr0m8lUaZ6dNcoE=;
        b=TCNRX6cjECexWz7p3MRflScPz+PyWywM+fuKUFRyN2v9d2C5vvIE+OK/cPACHR/iuP
         4OW6CBG9DeXIC8pWm4TZ1jRJLz4wKcIl4L/lG0eLJ27psQrH21c+NDWfFyAbfvQuNuY8
         a1RFXKN5CKXnoStjewxTzy49c/pFcVdFNcQ4id5rg+Z24S4TVKzC08Gq0U4/YEnKKvF4
         y+vY5lGrfCc/IJB7LLlMvztdtmOaDo5IZT+D+Ib+mp987z/KHX0uT8xXy3ZpIcC7Zss7
         JcUrbSkzlOwMQpiIvPO6p65Bj/DBSfx3GUW2Bj3Dp57donrytrFUGkglKffKnFJEkLn6
         AKEA==
X-Forwarded-Encrypted: i=1; AJvYcCUdzcKlkOWJGFr5Qh4WeFvtVeSWDNGKOdA3b0VxEullDJCvq/1OkGd5eUQFFYpTu1PSoVy6MqojwkE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzH6elZ4msc7nhxSPu3vOpGvRoQcIl15Ea16s64FITcnbSlpd7z
	vNbpPzu16F4zeMzvYLNghbhzC0WpOHlMSS+PS1nPm3dTW1IEf9yCx6q2d5vm+tYKZ9K4wOInx8E
	=
X-Gm-Gg: ASbGncuJuW6rZSd1DC66nasl6PJQkdcq+F8RRYQMOSk0c3jttHgjI43iVAplX4Vm8qu
	3HZ1N8ypiil1majLLl5+YGEDyuEUhkn8j/o5o+7piiDOzO0NntpwVOVZBCiNSKSgBkXDMXi0Vrb
	bQNyn6EF1wPRgswsYrFoVScJ9BjnFQsTZByxUsG/7S+cqe6YGv7lS84xXbbTAhHnyPY0aQPEE7m
	Q8SrxV0Td3llg2Lw9kPfzHlLgKTwjl+3pgpcXe98oKrTq/wrafYO3pni/Chu5vFGgs2Q8DJsJ2F
	/Hz8Z+SU0bdP2kfcO/SrrBJbfUlRamjwG1a1w+jbV71dvm2qwuU9XW5zL4dLYG0maHXUGZvpPbO
	EvgTKRylpSFgSAd8Wt+nfYWPxDEQ8lQ==
X-Google-Smtp-Source: AGHT+IFsxTgL+bKmE0gwr0Yb0P+6nsMiFF0YBFBZmG6RGM/0xTkklJYFabNZiG0efbaZHsev/j0Jgw==
X-Received: by 2002:a05:600c:3b07:b0:43b:cf12:2ca5 with SMTP id 5b1f17b1804b1-43d4378d067mr22324505e9.8.1742394570414;
        Wed, 19 Mar 2025 07:29:30 -0700 (PDT)
Message-ID: <79bf742f-d472-4744-afda-1b47bd88f04d@suse.com>
Date: Wed, 19 Mar 2025 15:29:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mm: Fix IS_ALIGNED() check in IS_LnE_ALIGNED()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20250319142011.138250-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250319142011.138250-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.03.2025 15:20, Andrew Cooper wrote:
> The current CI failures happen to be a latent bug triggered by a narrow set of
> properties of the initrd, which CI encountered by chance.

Plus properties of the host memory map.

> One step during boot involves constructing directmap mappings for modules.
> With some probing at the point of creation, it is observed that there's a 4k
> mapping missing towards the end of the initrd.
> 
>   (XEN) === Mapped Mod1 [0000000394001000, 00000003be1ff6dc] to Directmap
>   (XEN) Probing paddr 394001000, va ffff830394001000
>   (XEN) Probing paddr 3be1ff6db, va ffff8303be1ff6db
>   (XEN) Probing paddr 3bdffffff, va ffff8303bdffffff
>   (XEN) Probing paddr 3be001000, va ffff8303be001000
>   (XEN) Probing paddr 3be000000, va ffff8303be000000
>   (XEN) Early fatal page fault at e008:ffff82d04032014c (cr2=ffff8303be000000, ec=0000)
> 
> The conditions for this bug appear to be map_pages_to_xen() call with a non-2M
> aligned start address, some number of full 2M pages, then a tail needing 4k
> pages.
> 
> Anyway, the condition for spotting superpage boundaries in map_pages_to_xen()
> is wrong.  The IS_ALIGNED() macro expects a power of two for the alignment
> argument, and subtracts 1 itself.
> 
> Fixing this causes the failing case to now boot.
> 
> Fixes: 97fb6fcf26e8 ("x86/mm: introduce helpers to detect super page alignment")
> Debugged-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> Judging by how IS_ALIGNED() is wrong, I think the pre-condition might be
> exactly 4k past a 2M boundary, not just simply a non-2M boundary.

That's the understanding I have gained, yes.

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -5505,7 +5505,7 @@ int map_pages_to_xen(
>                                                                  \
>      ASSERT(!mfn_eq(m_, INVALID_MFN));                           \
>      IS_ALIGNED(PFN_DOWN(v) | mfn_x(m_),                         \
> -               (1UL << (PAGETABLE_ORDER * ((n) - 1))) - 1);     \
> +               (1UL << (PAGETABLE_ORDER * ((n) - 1))));         \

Can we also get rid of the now unnecessary outermost pair of parentheses
of that operand, please? Imo any reduction in parentheses in constructs
like this helps readability.

Jan

