Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EE4CB2C1F
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 12:01:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182853.1505685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTHwa-0006LO-GE; Wed, 10 Dec 2025 11:01:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182853.1505685; Wed, 10 Dec 2025 11:01:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTHwa-0006J8-Cd; Wed, 10 Dec 2025 11:01:16 +0000
Received: by outflank-mailman (input) for mailman id 1182853;
 Wed, 10 Dec 2025 11:01:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K7qh=6Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTHwZ-0006J2-KW
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 11:01:15 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85fca3fd-d5b7-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 12:01:05 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47795f6f5c0so43601165e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Dec 2025 03:01:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a7da1dff5sm37009645e9.15.2025.12.10.03.01.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 03:01:04 -0800 (PST)
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
X-Inumbo-ID: 85fca3fd-d5b7-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765364465; x=1765969265; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHsz3Ybet+Oz3L7pfFuqVu7LnxlVqEN6KZidekt/HEQ=;
        b=dOX/UN5hI2sDBXhYkxW7/dazB7D22/11cFZGKYmt4+y3HDfpZSxGzD9IELgul3wuOk
         fnUJaAdFQ3U6e+mBtoROTHfNk1X/WBnX880itxPKtqbNiW7QKGgq9EurIWtpV2NXRZgR
         C0uvE4nzoe0IH36nnt6qctPe9Xj9oG2SoNJmLam8FKEQ2dfS0Ak72mcD0YuVZn0BGLVs
         KFPrqOfK5PclHgXGx5SkIRcqWPAZimcyH//3+d4l/5XWfZ6+aTjnpORblUnnJQLOi9QT
         0Ex40Tt5XhU5g84Jcl6Sd7aQLkW4269OAFCZdgTJNxiSBP8oJLLzdaaTHulfRxcvkVAT
         6ybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765364465; x=1765969265;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZHsz3Ybet+Oz3L7pfFuqVu7LnxlVqEN6KZidekt/HEQ=;
        b=aD3G5D4Bn43vwSNwN6Kiw/Nf8sKrsyLnwabGhN/bDjijA+GVBZsQDXXiUMSJoJZuDS
         3AhG6aEgMD+PNR/RqCJWZ9mATuK7jnw+uoA9SpZz/OfDChEOaiO3L9ncApQd5WZR5ZDg
         rpRjRz4dNHYjv1cHuOLCRA2zOvNIW3Q2QQ+zN1a7YWjKprbf+a//44LpvzpM1RvisdFl
         p++cOvLgCI5XFsn3onEC5Sqqq7VTA8akmDaSLgzF0mhf296rvc+Op1QaBCJzqwmci2qM
         zx6ir3kYlTaDqqzTE+PgpiezBarVBRxguJO9TyqEI8x6tdGRDKb2Doj+Zdsi7M6PJgKi
         VaZw==
X-Forwarded-Encrypted: i=1; AJvYcCUyBemjqE51b3lVXMoi+o0LPmo/UQv/I5IKmymT2KukpqEPHBsXaOW/VMlhzwKjdTV10ihLNY9GWPk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzAnn/Bs0y5o+O6IHVur/S4kKdo+Xlo0iihWS3J7mhZWqc2U2WM
	pHH6GvPDaVZqUtbgHCh1C8V65KL0O7uKqIig8VY6cC+hO87CL3vxqpOJY/zAFCyHDQ==
X-Gm-Gg: ASbGncsFALDkEDT0xGBXNXqHeQs6wn3MfA5b1Wcc1FBlh90daD4nuYi/twZ8qUjbUqV
	HquZlRKxDNwnx6+MUWqz6DZFy2yBGHBDVFND5eOPY0XA3o2y8Vys5zq0HyaXjrMPJaxrioE+ZJB
	WCIfGvYy3cPWHIvRiIzMZQNcsFes0FSzlgqmYFsOLCsYxDWdO6qSR0oKH5/FhI1qNQAlolyDQoF
	2JYDFQYCt3hH/0sWZAlQLGIeYIiV3yFAAgv0LgTInFVI7//XrMsmFun1xsP2KT5q/zuQi2+jK6G
	uW9qiMyeu/wE8QoHo1BtN97cYj91QfHACiGrmMp8ZSP73lt/0wHPvGb8sVspAVcPPQBTj9gdyX0
	u+xBoSRo+V0gq5UE2EfKaOaN/RF8oY/soXo80zbH1w3yWakOWo2uFknORbxfwQ1HyvuUqs2vHQ/
	iKh/aKBplK5pIJcxjqbUGn0qPN7tDyQSWOApbNzl7NKkZqCZsTtulXOGrDz4mG16boCgwPRYZQo
	mo=
X-Google-Smtp-Source: AGHT+IH5FQ+FkIbHXCiqDZ68KlhJ82E/hWR2aO7jA6uf9qUhNKZBqW1B4dG8xbEMpWPoWvSJmb+v4A==
X-Received: by 2002:a05:600c:314c:b0:477:63dc:be00 with SMTP id 5b1f17b1804b1-47a83810f28mr20675825e9.25.1765364464753;
        Wed, 10 Dec 2025 03:01:04 -0800 (PST)
Message-ID: <b2fae779-3b22-47ff-9da0-a17b61455c04@suse.com>
Date: Wed, 10 Dec 2025 12:01:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] xenpm: Add get-intel-temp subcommand
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1765300623.git.teddy.astie@vates.tech>
 <6fcfea5d3f6be1bcf1d34ea5ccec40a477100472.1765300623.git.teddy.astie@vates.tech>
 <29100824-303a-46b2-b394-d15d617131bc@suse.com>
 <3e9f828a-218e-4b20-9fe1-c8da3f06f87d@vates.tech>
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
In-Reply-To: <3e9f828a-218e-4b20-9fe1-c8da3f06f87d@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.12.2025 11:37, Teddy Astie wrote:
> Le 10/12/2025 à 09:50, Jan Beulich a écrit :
>> xc_resource_op() doesn't return errno values, so by using -EOPNOTSUPP here you
>> put the caller into a difficult position when actually looking at the return
>> value: Does -1 mean -1 or -EPERM?
> 
> That's a bit unfortunate as xc_resource_op() can return either -1 or 
> some -errno; so -1 could be either -EPERM or a internal failure of 
> xc_resource_op and we can't really know.

Can it? Assuming do_platform_op() and do_multicall_op() behave correctly,
I can't see any problematic return.

Jan

