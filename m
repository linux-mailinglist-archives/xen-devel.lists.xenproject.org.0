Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 336409D8519
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 13:09:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842457.1257983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFXtw-00035S-36; Mon, 25 Nov 2024 12:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842457.1257983; Mon, 25 Nov 2024 12:09:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFXtw-00033z-0M; Mon, 25 Nov 2024 12:09:12 +0000
Received: by outflank-mailman (input) for mailman id 842457;
 Mon, 25 Nov 2024 12:09:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mqqh=SU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFXtu-00033t-JZ
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 12:09:10 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 125d97ad-ab26-11ef-a0cd-8be0dac302b0;
 Mon, 25 Nov 2024 13:09:07 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4315e9e9642so39825755e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 04:09:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434a07ecf88sm19942745e9.1.2024.11.25.04.09.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 04:09:07 -0800 (PST)
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
X-Inumbo-ID: 125d97ad-ab26-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzMiLCJoZWxvIjoibWFpbC13bTEteDMzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjEyNWQ5N2FkLWFiMjYtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTM2NTQ3Ljk3ODE2NCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732536547; x=1733141347; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UZS27RWxq7A2PBYi1WDCjAMc5+ZhlfnhwsFWiPghie4=;
        b=flOhO+O/9EyHJaPshMxM72Is3RKDsefbhp0JXHcLLMzwmRjPHrTrFwHHsFG/3YlCTG
         i313uSH5g7CF1P8GH3E/tFNljjM+6ovW6egzAHaLAaM2dPzSt695cHdyEzZeLkrMamck
         4ilDgKYHQET3TR28lEDBJwHo5HNqtK36MPwNVq/nWQ5j3Ict6MHDx1EgnSZDd/ofASMx
         n4mrzKNg9qWKkmAWokfYSpxlsWmGI6srrQiKG6rl+TegpXCzmCg+KR+5kcGCinP7hh5j
         MLARdoW3kqIekB278f1FR0zzJgnlY1u5znZaW1GIv33OfXPHP2FUORzn27Q0y1OjejDd
         Lvfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536547; x=1733141347;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZS27RWxq7A2PBYi1WDCjAMc5+ZhlfnhwsFWiPghie4=;
        b=gfl31D2YQAt8o2MKXUUOLWZcBFf/LWAdV47A0tZkrz2NblN5HOFGZdnrO4VHZm9NNG
         4PCPf65d1Faaj0iE4zXHMV7pkIWYgGJWQpT5IHj0J7T4faEtZzSXULGmuMJSWrkTzEkW
         K1R+9HyVHMjNNtg/8ImTaXx3/Qis7ygMFWAbqxLc/9Ck89xAQ4LfGGrDu9U1GayHuxNh
         MO6oSzk3af5lCbqsx6s9LveSjLY8sWV5zMa1euP9S0Jel8AykYCF6MN7niGM9X/89eX0
         X/D1lVVu/2sOFGBo8oQPl04m925yDiQ8GcDGi++7ygzGpQYuTlZnYGckj0K2KmkqhxF8
         iA5A==
X-Forwarded-Encrypted: i=1; AJvYcCUSwlHMN3LVBPHeFI8lT16Wa26wDkEQ3XPky7f9QXcWjv0gIJd34Q7rAEHVUV2fPm7eN/O6MKuj4d4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyxud6CVJ24f8Kmu4bu8m1H2gx0srzPpEyB0DwOotrtmw9YGyw9
	IOnddxRwgK8SupviIgzSHrf6f9PAX47u5RSmEiC7Qlg5r52CA45eOgsOUuQYFw==
X-Gm-Gg: ASbGncv8ExQTXRrhvS3NVc8Wj1cqMcZAeKJ8CMg17cwTAvWGv8pRoFbUaUIh/WWFHV5
	NYd1i7q0yaf7CpbvetpzoHKryBOV+7o49VR/UTl0nBMgyuv7P7tx1VUjaFfnDg5jrtEX33Tv6gI
	t4jnukxgI5Jdei3/i6Fbq15AtFsPRwLi4aUm6dHR+Xl3ypJnCVXKDYXM213MutjnDy1xac+0JA5
	5m3mHawBmXrnFHiqXKTP9qsev3rbbOwHk8AkqChK8jim5cKCARN2anC4PDUHr99X4dtxVQKi3Jm
	4xJNs2rJdNwDIaq/tHFcSDT68tyYsN6mb/g=
X-Google-Smtp-Source: AGHT+IFySCpnpclATnq3g/arzN2N/WvERfwci2zgw0BmZdEOtqzEhvzq35JxFMse26WaOAN8AaC1ZQ==
X-Received: by 2002:a05:600c:4fd6:b0:434:a1d3:a326 with SMTP id 5b1f17b1804b1-434a1d3a436mr9719765e9.6.1732536547338;
        Mon, 25 Nov 2024 04:09:07 -0800 (PST)
Message-ID: <f0c46c9a-9ff1-4627-9692-13e2483f7187@suse.com>
Date: Mon, 25 Nov 2024 13:09:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 16/25] xen/x86: Replace hand-crafted
 xen_arch_domainconfig with autogenerated one
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
 <20241115115200.2824-17-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241115115200.2824-17-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.11.2024 12:51, Alejandro Vallejo wrote:
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>  tools/libs/light/libxl_x86.c                  |  4 +-
>  tools/ocaml/libs/xc/xenctrl_stubs.c           |  4 +-
>  .../extra/arch-x86/domainconfig.toml          | 87 +++++++++++++++++++
>  .../xenbindgen/extra/domctl/createdomain.toml |  6 ++
>  xen/arch/x86/domain.c                         |  8 +-
>  xen/arch/x86/include/asm/domain.h             |  4 +-
>  xen/arch/x86/setup.c                          |  2 +-
>  xen/include/public/arch-x86/xen.h             | 51 -----------
>  xen/include/public/autogen/arch_x86.h         | 52 +++++++++++

Nit: If at all possible, please avoid underscores in the names of new files.

Jan

