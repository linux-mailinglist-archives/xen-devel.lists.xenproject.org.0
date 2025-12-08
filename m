Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 131ADCAD359
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 14:01:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180484.1503656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSarp-00005K-QQ; Mon, 08 Dec 2025 13:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180484.1503656; Mon, 08 Dec 2025 13:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSarp-0008Tx-ME; Mon, 08 Dec 2025 13:01:29 +0000
Received: by outflank-mailman (input) for mailman id 1180484;
 Mon, 08 Dec 2025 13:01:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSaro-0008Tr-JU
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 13:01:28 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01bea7ab-d436-11f0-9d1b-b5c5bf9af7f9;
 Mon, 08 Dec 2025 14:01:27 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-42b47f662a0so2733190f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 05:01:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d22249esm25460056f8f.25.2025.12.08.05.01.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 05:01:24 -0800 (PST)
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
X-Inumbo-ID: 01bea7ab-d436-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765198886; x=1765803686; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WXy6jB9yw+ZVDKGg8hvPvpGfExTmpiiO7+onUVRR1es=;
        b=CGhmFJ2D+Chl5ZGaOkZpcATZSOGKm6gK0Rvmx51dVyjbdEvxKWJ0ORJhHCCIaq1Bkq
         EogC7g+zdj+Vk1kXHvPxioOCSXUocXphdzCjwiyyuVUP9IxOLYFCJ4FCMXDz5ahV5BRG
         UMiw47pRM2DPRj9+gaUO7ks/5SOrvx0BRMMgaBUtaKvq5bOcAS92kmYZCqQu0G51qlXN
         ZeCg9UKi0tLvRPA5wWTcFftCjyKh8bhXs/dZdFdCFcFOadRmsxN4DD/LBIvptBtFEiTc
         eN1cnHilmYhz0kh2uJ7aa6GOpbHtGl1wTR8kwC5j0GAs/qBvK8GQLvCUuKI39g+3kks1
         nFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765198886; x=1765803686;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXy6jB9yw+ZVDKGg8hvPvpGfExTmpiiO7+onUVRR1es=;
        b=Z9N7Fsh3z/ztvup+zbTfhXDqFQnVK32dBZTsMIcnWAZRE2ah2+THYKEV0Je4GPnEMg
         Xw8paAXxzwQnUA/alRRuZAVJ5e6rCUJk1ZQDwXwPL0viKW7JlYY3u5IlJbC8p1v/9dOM
         T8Tc+uwrSfsJMfDzrBFjYMuDovZ2UWKQP9uN0yYGhZ/1Fodu9y1PPONHdOy63eD6iws+
         MUWpIjsGkf/S5XRyQ4C96fQGn2IoeeIDoqex0xNix3wVMkk3zQ72ekIIp7YO32Wt0DCI
         XDuQBrTSfqvvyAAHMMxVdkdzAx77BmOmHXwkrFCX42I6e74fH+L1ihB/RhEWJ9GIquJ1
         ha9g==
X-Forwarded-Encrypted: i=1; AJvYcCVbH+ttsDIZqLGKtfopbeMkRncmavk0LJ+bMvvwNUJT6uz6OMNjfBMj81jxAP/doPzwOxAi3RyrAmk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+hRa85D8n1J9vBz1NqNcO+uxixNrX1H5hVVEhwc5R/0TYxBE5
	HvGJqdELVmOdR6vwEwLTwhK+XVTpVyudwNCHshpreg9sPb8TfUmbvWdoCtXJ3k5x8g==
X-Gm-Gg: ASbGnctQRfmvHkVxilGATjdneAvtShh9B2lppM2tK1Re207dF04ds/W+mIvR3xrsAPu
	sB800I4sPqf7gC4j83ip201pl+wZcHZTyxl00RWpLdQNAkMyel6JvXd6PhkMjNc6LaM9WY3aP/N
	1bjJsAd2Cg28BnEaeGfj2aakHchzyHOj5HLmjVx51JTtouUUnfcpP3x8ASYVpIBtiGYG1Ai4dt5
	5TTsb3IO6IAMxo7qzoY5lvbvOzZFCKqE8gNpSzTnhisvYkt3jzyKKjgJMeBWd6DoAxjp33b+MEq
	FROtTy6AMvexEv+FmYvOpiEZcq2/daLed+Dgh4ruVkyIaoWrh6Yr2EjYVAQK8Rk8+vPyqGeAuHI
	T5V5mO5SXO6eb0mYwBqy3WWEmv3M+hUwgwTREAIaqYC95mvyqs77Fm8/YUh62QXFQbyo0JAjRUw
	sg3ir3lqeWbc88V9ctlrkmCfZtp5WC3iESDL/700Ak9oSBhW0zqitFgrJKTFoNjogU+TZQ2umIJ
	d5GtV7UhJ1yrA==
X-Google-Smtp-Source: AGHT+IEYVlXRgTNW/aZRF8MyAzZsLqRqo2xGsD6IbRuJjxUf65oqQe9WdTxQKIWiAylfZlXk84ahYg==
X-Received: by 2002:a5d:5d01:0:b0:427:374:d91e with SMTP id ffacd0b85a97d-42f89ec5df5mr10446779f8f.11.1765198886471;
        Mon, 08 Dec 2025 05:01:26 -0800 (PST)
Message-ID: <744ccf37-db6d-4fa7-95ba-36c1d54f493f@suse.com>
Date: Mon, 8 Dec 2025 14:01:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] tests: introduce Tests.mk fragment
To: dmukhin@xen.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20251204123712.721443-1-dmukhin@ford.com>
 <20251204123712.721443-3-dmukhin@ford.com>
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
In-Reply-To: <20251204123712.721443-3-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.12.2025 13:37, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Add new make fragment for unit tests with auto-generated test harness
> dependencies.

Why is this (going to be) useful? And what exactly does "auto-generated"
refer to here? Not ...

> --- /dev/null
> +++ b/tools/Tests.mk
> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Unit test fragment.
> +#
> +# Copyright 2025 Ford Motor Company
> +
> +define list-c-headers
> +$(shell sed -n \
> +    's/^[ \t]*# *include[ \t]*[<"]\([^">]*\)[">].*/\1/p' $(1) 2>/dev/null)
> +endef

... the use of this construct, I suppose? When we talk of auto-generated dependencies,
we normally mean what the compiler can be told to produce via -MMD. If you want such,
why would you introduce (and now generalize) a fragile, custom alternative? (Fragile
because afaict transitively included headers wouldn't be accounted for.

Jan

