Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CBF880149
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 16:59:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695478.1085271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmbrR-0000Co-PM; Tue, 19 Mar 2024 15:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695478.1085271; Tue, 19 Mar 2024 15:58:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmbrR-00009m-MN; Tue, 19 Mar 2024 15:58:45 +0000
Received: by outflank-mailman (input) for mailman id 695478;
 Tue, 19 Mar 2024 15:58:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aOUF=KZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmbrQ-000065-1l
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 15:58:44 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ed16f56-e609-11ee-a1ee-f123f15fe8a2;
 Tue, 19 Mar 2024 16:58:42 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a46cd9e7fcaso246255766b.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 08:58:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bk10-20020a170907360a00b00a46e2f89a9csm739689ejc.32.2024.03.19.08.58.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 08:58:41 -0700 (PDT)
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
X-Inumbo-ID: 8ed16f56-e609-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710863921; x=1711468721; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EDfo9dp2beKkhcxcX+gQIIWYKul4uhwmLTf4Y6egGwE=;
        b=Fv3pIQdeVO26A4OZdDy6NAm6LFF8kvwasMRLD71vkrrbgQkE0qYoUbFAPW82GcSWYy
         861h3lxwDrGNZ3rR43wxbUbjSnnkhZj//o4/Y5W9IBCqrWRBvnJ3f5igZJkqc4o6Ka11
         8L5X1bUgZZv1jd2RIFZutgCMNZY6a19ulMDzujcG6S1is+AFetnSeA1k0Fv6kyO8e/UN
         FM7HHpd8pnb6yjnGZeHEoBwGHkT4ATxE/TPydt2YzN2OlELDik7o/V1QbOCpE94/CwW/
         xKQ46scHwMUCOL4iTJ0SEtmWK2Me2RMysx+IOsdQMrHZ8m6wHSeXJKRoNJ++pKyxnwDV
         Cwgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710863921; x=1711468721;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EDfo9dp2beKkhcxcX+gQIIWYKul4uhwmLTf4Y6egGwE=;
        b=DyR3Axsy+w19vwVrt8NUSuUqN9dM4i6Asbxqo52gw4Qw2B8xZtcry1XrRSWxts9Y2H
         QFlUzCJJWJzda4ovXnQcQzUYf7audQtBIfOHmkjjzJNrJSESYpPyiQj6x8DwVyMxQNdG
         T9khQSpHJa18WsRngzH6Q25Cz5p7NS/MDrcA7LF2g9t0/AxEOm+SYg3Bhnt1AiV1y8a6
         5hGfiKMemQ3RdnW5FmJEg43lY3h0u1SZK07sdyxb2rjVtz+yTJs8+lFiqFUMqx92e7qy
         ILgYeBZ7aVx3xY1gHyOWuao/1w0fSQeeYyF4ojnrzjlhY9+QUdmKbzXyFu6PfL/w2cgd
         yZBA==
X-Forwarded-Encrypted: i=1; AJvYcCVEMJSXgNGkrvuQG/5hWK2KR3ZdFrGOFdBaFRY4kNNr1rLigqhrbPfRwNJ4J8h4w0HikLvtTVF9mmHSzHqPm1YRZh8gEbvYdxky8zMBQ9E=
X-Gm-Message-State: AOJu0YwPV3tCxOu7ZSJeQtT9XAfpL0uAmPFT/nAKzTK335GRq5fwzH9T
	gFique2Ot/MxllLqmqc3+6eQtmI+NTMZsnCVprT4NP9Z0g6dwr4zdJzgD/48Ew==
X-Google-Smtp-Source: AGHT+IHwuHWyMVXmfcJf6/LhQyl+4N4FqW3NpqQEOd5910hrOhIXHjNnYHkWSZaehMA5TDpd8DIMyw==
X-Received: by 2002:a17:906:d8b2:b0:a44:b9e0:8592 with SMTP id qc18-20020a170906d8b200b00a44b9e08592mr2004099ejb.8.1710863921660;
        Tue, 19 Mar 2024 08:58:41 -0700 (PDT)
Message-ID: <147ba010-3776-4ebd-a871-894921bcd4c4@suse.com>
Date: Tue, 19 Mar 2024 16:58:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 14/14] xen/arm: add cache coloring support for Xen
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-15-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20240315105902.160047-15-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.03.2024 11:59, Carlo Nonato wrote:
> @@ -326,6 +328,27 @@ unsigned int get_max_nr_llc_colors(void)
>      return max_nr_colors;
>  }
>  
> +paddr_t __init xen_colored_map_size(void)
> +{
> +    return ROUNDUP((_end - _start) * max_nr_colors, XEN_PADDR_ALIGN);
> +}

XEN_PADDR_ALIGN is an inherently Arm thing. Such better wouldn't appear
in common code.

Jan

