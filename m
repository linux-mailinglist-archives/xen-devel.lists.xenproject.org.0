Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F636A22F36
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 15:19:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879619.1289838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdVOE-0002Lf-NK; Thu, 30 Jan 2025 14:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879619.1289838; Thu, 30 Jan 2025 14:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdVOE-0002Ja-Kf; Thu, 30 Jan 2025 14:19:30 +0000
Received: by outflank-mailman (input) for mailman id 879619;
 Thu, 30 Jan 2025 14:19:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tdVOD-0002JU-DO
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 14:19:29 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36833314-df15-11ef-99a4-01e77a169b0f;
 Thu, 30 Jan 2025 15:19:27 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aaf3c3c104fso188797166b.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 06:19:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e4a320c6sm125875866b.155.2025.01.30.06.19.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 06:19:26 -0800 (PST)
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
X-Inumbo-ID: 36833314-df15-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738246767; x=1738851567; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7bh7LiGDhOhVo2P+f/nlI0xgHAPklGXZuw12L1qJ208=;
        b=Ct9Bm7JzFuyy54CdxWes8w7CkRBC/a3cgAn1bB3NoCQEN+D677umdzZV9kcSDSmHm1
         +pTroHdO5z1nId3tVaoDp580hHxzljD3RUe9X1/jXi5t0fkqx43nBG9fnX+g3X9AjTQj
         4Fv+XzsAWZuA4C937G8o4/oZ0WhlKWhsmtLvEFj0lzdsiMOu+S0PSJSvUDXB7ASoei18
         8HIsVl589PhfJRHQOykvBTWrvi7Rit2FtHLFWgWSLQVkw6cSRi97Jm68+0iLFxNullDy
         SqbhFlH2NIVD2Uvxu6sJqJnQGOtZy7+fN2Qh7olrHkixXPOipItfFK0DTczBGOflGhla
         G0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738246767; x=1738851567;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7bh7LiGDhOhVo2P+f/nlI0xgHAPklGXZuw12L1qJ208=;
        b=qgOammmz/P/82N95jpd2tDLDu96uOy2f+ZBZvH9eeOUBWe/g0E0tvtxaRhnAyDPGZG
         Zma5ntrj3kvLXrKZ027d4fWpMB74EjmWCnml82lJwjwUVBt6ynagi1ht/ncU/5+w9gjQ
         B/qfy21INZVCYVeS8JCyXBcBq2yrwphFHwE6B1CW0yK5tAn0iiPeOkbFdWooVGGAAcOy
         aIc2hXPykDMIPQ6z5jaM5fBqw7uj1pdTTVRDEB4vJRU/MJ07TkNHeMnyzKmB2d/+Mpc6
         yYdhg8P5BMbSDmnR5cVRPl8Wf7vvsT4ddc41Wk2lEuhDcsJ4wZpuHbxCNC4SJNLUny7v
         gUCw==
X-Forwarded-Encrypted: i=1; AJvYcCWfmhOCJY/U+xjbOXYgIg2HFdoXlmceb42QrvK/exVBvbjMn8x6/mHyL9XXsEZlBzxdwEBHYMKuhz4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw7d3ZTy9/Tbeg+gBXxWb2CR9j+U5UgVvmjTh1K0lVvXq312eUe
	XXRvSdrBHEDpXTgA9QYe1sLWXbqknBwF2PVKVsddOvDeHjSiW3Xt49jHmSxwuQ==
X-Gm-Gg: ASbGncsAT/IHHV2YOXGLT2aBfhJf/6R3/H2G7oIik+wH7ZOv7uktBHsfgRtjeg+y6Bp
	PgVlhJofJNHXuT0T3HLw961jfcFowR4tTW8glEPuOdhuxLPEfoe86rGb2sQvvKGYgy+DfZEq8dd
	A8ejzM3IhBLnXfu2R5xp2cnzTPOBsJfr5UPmjC//TEiSFjrU2V73YCnKdHQ/avMFsmIM+5Je0p1
	7m76xF38gtgSKdxrEpwPY3WFHKC9coFMnbLY3fDSQBr0YlWrVGGjDuznKYlzLl9ABVjtMc7w4Jk
	TR/8eSPYblD+QzMEvJj/czsrTKWLDuz+lsHYQm3vf0E2mdNNf7Wa5+4hbvmn7SP/ZM/KzDyoL9l
	k
X-Google-Smtp-Source: AGHT+IE1eDqG4Q1FgN8Z7Oua76qGWxTX2F1e6Zw/V42Wr2aC+Po6k9l9x64DhdSj1PUUPY1sunN/nw==
X-Received: by 2002:a17:907:c319:b0:aaf:4008:5e2d with SMTP id a640c23a62f3a-ab6cfbb95e4mr674264666b.0.1738246766926;
        Thu, 30 Jan 2025 06:19:26 -0800 (PST)
Message-ID: <10e34547-08f1-46dd-8c87-115cf4f6ba4a@suse.com>
Date: Thu, 30 Jan 2025 15:19:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/15] kconfig: introduce option to independently
 enable libfdt
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-5-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241226165740.29812-5-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.12.2024 17:57, Daniel P. Smith wrote:
> Currently, the inclusion of libfdt is controlled by the CONFIG_HAS_DEVICE_TREE
> kconfig flag. This flag also changes behavior in a few places, such as boot
> module processing for XSM. To support the ability to include libfdt without
> changing these behaviors, introduce CONFIG_LIB_DEVICE_TREE. The inclusion of
> libfdt is then moved under CONFIG_LIB_DEVICE_TREE.

Hmm. I'm not a DT maintainer (imo approval here needs to come from one of
its maintainers, despite the files being touched not saying so; I notice
you have the larger Cc list already), but to me the 'f' in libfdt is lost
with CONFIG_LIB_DEVICE_TREE. What's wrong with CONFIG_LIBFDT when that's
the code that you want to cover?

Jan

