Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC64B26A69
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 17:04:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081894.1441851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umZVD-0004dc-MK; Thu, 14 Aug 2025 15:04:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081894.1441851; Thu, 14 Aug 2025 15:04:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umZVD-0004au-IX; Thu, 14 Aug 2025 15:04:27 +0000
Received: by outflank-mailman (input) for mailman id 1081894;
 Thu, 14 Aug 2025 15:04:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umZVC-0004ao-2t
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 15:04:26 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5cab187-791f-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 17:04:22 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-afcb7af30a5so169647766b.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 08:04:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af92b650c8asm2452607766b.65.2025.08.14.08.04.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 08:04:21 -0700 (PDT)
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
X-Inumbo-ID: f5cab187-791f-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755183862; x=1755788662; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iT0JmRs8SG/3DDAkdf1w8N2zE1W70t4E9Vrll9s3avw=;
        b=K5TpN4xRtEysoeHkGurjRjn5zHZpSQ3edyWe20E1qsbWtqRtn0sNQFC8SCSJh2CVDf
         vHSGP3l0C9ddcfMufyoVdVRvfQzWjqt+Er18U2ViLeDeJj04avLV5wyaJA9n/xU5dEqV
         1mP3UuaMLjwSAkWHNwiRcz/oes3/+V6RrG5OtxzTVk+FK4A6hptvisWxZv9lc7fZIMdT
         XUeQDVSAln3NcFDHX2Db+2LLgK3YEnrJx+Lk2uyOO+pRhbbsEYTTRiZ0utNOe4fKoL4R
         l3Rn/GqMjHhM/+HgfkeTzjudTjG1oz1W7QMPmYA4KRQMwTHOYVJOP0ZlZt9KMN+Jnx9s
         n8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755183862; x=1755788662;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iT0JmRs8SG/3DDAkdf1w8N2zE1W70t4E9Vrll9s3avw=;
        b=I1a4r3kp/5h7tipe2BUff35vPOiMqLM19pp5jX/YTc1n4xHiiFsojczee7Ep/T0ikh
         oSysfFWg+ZMeqn2g/Jf+vXiI8oaraYLyXiJ97/Xf8wIEaPaZ3qqGn0iWeMHF2dP3HWFd
         zJrSINq/4mI+9+sQ5elwJFM21eDJPbnNd1QJRXFW1TWnvuc3r8Xrtw/tC51gXu0whSyp
         UcQStuveDZsGw8jPwh6JN6R7lEfOK2WqUFz50PxpC+IwW9oOhj2NMDDc5t7DhMrF6bXd
         TWXvvXL7437ILmj4BSDCTK8IUpscSzKFgMaYyoZPQVZf5PWandNwos3ZsrX5RUF6UtSJ
         /c8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXw9DmLW68lbR8D6uvWimKW+Os+iYpjztepBAhx9b490Eh3MYxieUf2xHxxgP0SEjlm2dGoXAKoOvU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxdEtZPvxX359PogGPjZKnqo6i1qE7XDtxI5/4MEEPENXoqf523
	2KotXfnQznd4ich5LzJvdb8PCPoAd9FYjASj5zscLNrXuQevV8vy9C5FkQ/jwtRY1Q==
X-Gm-Gg: ASbGncuamSu9LMT+0Z5OuSdFLRkGLMTlBptocKBiQK/aWBHoQl6psqqlt6TITLiVejl
	GrCBw8cHdieztyQcVops+GtEHoAX4012mUDOPIkmZO+LZlMBCf3ZmxZGgZOwflulc0Uy5XPsIm3
	3RZzRSAEew4Ht3UGJQKZifLqgaCxiW42Fj9gW7fITTjo0MtsdBQ0ncd+8m86NKSoeJOV09BulCW
	MgKonb7K4zwEOB0H1il/GLtq+/SFPwRP0+sLByavqPnrQRD1OW6tLXc/Ocfzw0CMAMm3eq4FSZD
	UJyGG272LC+aXwMJqYtR/RoYZXFkOYZWtTNr3PxJ4mePaMxqxxDEWgBgBNnX3hvb9mH99tW097b
	zxGr11pPvsB8UHT4qwjpNzgTydq01PVxshWHfoGgeR14aXt+eIi6ZGWrplnoGZoxjkw1G3X6ris
	DptfZZrYvyBKhd0z4mSw==
X-Google-Smtp-Source: AGHT+IFxQAMs+KX9H1S8Z/q6OrNaoV/MB3D0d0AXTmj5D9mTXy9hwBeDmUTTlh93BljHsX/ahm7Jmg==
X-Received: by 2002:a17:907:94c1:b0:af9:4fa9:b132 with SMTP id a640c23a62f3a-afcb98cd087mr301705466b.33.1755183861795;
        Thu, 14 Aug 2025 08:04:21 -0700 (PDT)
Message-ID: <849fe2bf-4840-405e-ba9c-6ddec4a47983@suse.com>
Date: Thu, 14 Aug 2025 17:04:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pdx: cast PAGE_SIZE value ahead of shifting
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250813125538.78174-1-roger.pau@citrix.com>
 <e644c968-ab68-49f4-801e-0f161fd85f2e@suse.com>
 <aJ26UmemwxyyTioE@macbook.local>
 <3fbdd1fc-e739-42cf-892b-a561910a5693@suse.com>
 <aJ3eRFc7CCwVi5WE@macbook.local>
 <f707d57e-73f3-43c4-a005-f2b93ad3d1cf@suse.com>
 <aJ35SplaIL1vZAE9@macbook.local>
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
In-Reply-To: <aJ35SplaIL1vZAE9@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.08.2025 16:57, Roger Pau Monné wrote:
> I've adjusted UL -> L as requested by Andrew, and added the following
> commit message:
> 
> tests/pdx: define PAGE_SIZE as long
> 
> Otherwise Coverity complains about possibly shifting an integer more than
> 31 bits.
> 
> This also reverts the previous attempt to fix this Coverity reported
> issue, commit 4dd323029094d93dbc8d174fe744fd7f54f0a7a4.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Coverity ID: 1662707
> Fixes: cb50e4033717 ('test/pdx: add PDX compression unit tests')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Let me know if you are OK with the adjustment and commit message.

Fine with me.

Jan

