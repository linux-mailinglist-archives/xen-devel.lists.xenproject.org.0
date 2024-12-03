Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0179E165E
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 09:55:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847469.1262550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIOgC-0004ja-04; Tue, 03 Dec 2024 08:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847469.1262550; Tue, 03 Dec 2024 08:54:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIOgB-0004hv-Tp; Tue, 03 Dec 2024 08:54:47 +0000
Received: by outflank-mailman (input) for mailman id 847469;
 Tue, 03 Dec 2024 08:54:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D5Za=S4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tIOgB-0004hp-0B
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 08:54:47 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e2e8b08-b154-11ef-99a3-01e77a169b0f;
 Tue, 03 Dec 2024 09:54:45 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aa531a70416so339033066b.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2024 00:54:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d097db0a6esm5846455a12.27.2024.12.03.00.54.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 00:54:44 -0800 (PST)
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
X-Inumbo-ID: 3e2e8b08-b154-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733216084; x=1733820884; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jPUNVDWkogcynT8pGLDTi0w2gyUNXgK+hXK8tDXrm4w=;
        b=YYoi9Tdnt1YEg1Bf6UQJisNwZ/Q7xiMnEYogWHM7n+62XsoAOkLHhqRWWGR61WYKQC
         779TTmk4WngqOP4jOxtbikUyT28ee1Am8SrSfKqWgNVXmaPm/CHtMA0Wopz1dU/WIxX1
         QQlewaa0r2zCzevo6QeslZK+WP+Gf0+wegXi5CX+xTOVus/a5kALfQXBZOa5/QLNvi3d
         ZPHBexMJYO8+CbfY/00wIp5Aw0FvjS7Kr7JEBoNtXrdobDEGD9P4zrT9sktwen/Ghg7S
         ytvjLeGRcJKD5AXV0KW7Y7HX+WVQd5cfYUHlVTFJ8UTpqhKj+8n6MI2auGrWYKNfz2Ej
         HoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733216084; x=1733820884;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPUNVDWkogcynT8pGLDTi0w2gyUNXgK+hXK8tDXrm4w=;
        b=s8Wvzgu0xxBCDYb4Y9Fd5Rfe7Q9GqTJS8DLmiFqicdc8oAl74l1KKn+EJA9vkcZ/Td
         hnKrEI0o87vzIQghT2vzJM2lfhKVfeNGssXiROTJbSR3aRPNFrSqLioZlgdsGhoUDnog
         fG4g93iI0J7pIZzq0ycYRbA+C7hKKfjqQin9lYDAJAbW2nWPPW+Vz7CqP7cwZtKde5XC
         LFeVIHI7Ng008qtcPBwnNwZoYfDdJM9ePj/hwDTOo4WqIOkgPeJa+YTdm29293jkum/h
         z3tVae+3GLYWSpWEDxIbnQatTqDonbEXdvrTIdi0m7pqpKn5Zm2Wus/wJNBaK/E6E1EZ
         6tKg==
X-Forwarded-Encrypted: i=1; AJvYcCXGbL8tCBkhhA6WVSSaXmPLcOj7nuDWl+mQoIFQrIC7q58qX24+0oGyoMn8vpF0f92GqlrUHkSedqs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwB4OBXGZq9nyrJIEc6qO/tuPNTNfiUpqQZC6PrhPkXHNNuvlJu
	yCw6Jbe2ZVXzytvZHLT8CWgj0COgTDKPO46Tp9f9vq/AewYe2k8n7JwR1idzvg==
X-Gm-Gg: ASbGncsdLIb0nTvlAcpafuldiIj7dh1FI5EJMoaSS4aQTXrTsoUdvw9XEJCbJXkHGgp
	R7J1SKbIaMYc9SbdbJoZ4koy0OSVrsetM1PsbmvpfT3qV0fLBNtvX26WBLwxp1OUzHp4EdcBzWP
	yRHLxIUVweGgH+AJw+v3+CGTh1gcqXNidqBt+v+IMDEz59hhdpbgfWwhMWsNR2qsOvYHV1FPgLr
	bj6kBoUkBLD9qei607p/yTP1jS7FI7izt0yT9yul19prMjkTREFV0TPSBO+BfQf4PpBhteHzTVf
	Urh8kze6NROy4lTcHMhJyr1MzNAMcbw3Jdc=
X-Google-Smtp-Source: AGHT+IFXi2GLytIYV7oO6QRxR5PHJZFrbuv2c1s/CiYg21PquypfTwtStZfIczn8XTlfneOL2ybtyw==
X-Received: by 2002:a05:6402:42c3:b0:5d0:d2ed:ebb with SMTP id 4fb4d7f45d1cf-5d10cb4e70amr1966772a12.3.1733216084619;
        Tue, 03 Dec 2024 00:54:44 -0800 (PST)
Message-ID: <5b98f7cd-fb84-4a67-af3a-9c81a687b291@suse.com>
Date: Tue, 3 Dec 2024 09:54:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 08/12] xen/page_alloc: introduce preserved page flags
 macro
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
 <20241202165921.249585-9-carlo.nonato@minervasys.tech>
 <CAG+AhRXrnZbX=0Dic4zRTddYx7+tbounnB9tT4vrt-MHsp9ikw@mail.gmail.com>
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
In-Reply-To: <CAG+AhRXrnZbX=0Dic4zRTddYx7+tbounnB9tT4vrt-MHsp9ikw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.12.2024 18:33, Carlo Nonato wrote:
> Sorry guys, this patch is wrong.
> Here's the correct one.

Which looks okay to me now, just that imo ...

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -161,6 +161,7 @@
>  #endif
> 
>  #define PGC_no_buddy_merge PGC_static
> +#define PGC_preserved (PGC_extra | PGC_static)

... this new #define now wants a comment, to clarify where the constant is
to be used (or specifically not to be used). Unlike for PGC_no_buddy_merge
this can't be easily deduced from the name.

Jan

