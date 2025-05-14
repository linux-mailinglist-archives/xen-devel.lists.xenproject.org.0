Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23575AB6380
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 08:54:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983809.1369984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF606-0007B3-MI; Wed, 14 May 2025 06:53:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983809.1369984; Wed, 14 May 2025 06:53:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF606-00078D-JS; Wed, 14 May 2025 06:53:58 +0000
Received: by outflank-mailman (input) for mailman id 983809;
 Wed, 14 May 2025 06:53:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uF605-000786-7J
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 06:53:57 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3473f36b-3090-11f0-9eb6-5ba50f476ded;
 Wed, 14 May 2025 08:53:56 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5f62d3ed994so4501548a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 23:53:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fd0142152bsm6243801a12.19.2025.05.13.23.53.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 23:53:55 -0700 (PDT)
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
X-Inumbo-ID: 3473f36b-3090-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747205636; x=1747810436; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=J/kTozl755Qv9cr9hPNKPoioNh/TJBsjvMKXLZxq5yc=;
        b=ZON1JUKaWEABuMussHaLvCPreTxQ1Wm6qYV16PjTq6/CW70A1XbST6s+AqKngKGNL+
         RABF7VBLwULdCbdEucqMUTs4bDTerJJIm6TnIXVz9TR/H3GL6W8mAVZs9Jd2fvO7fabh
         tXlfbA/KMym+r6iwBm1MxkcbKlaVJtTklI7uQrMZ72vp+UzUMKMk6TcKNBm3vMCHhUF1
         NoIOmN6qomHSVwqv5gKuuX37+WyqFkhn2SXWJgd1pgww1kBs4FPMYHdJuHpXIE7ar/Mt
         /noWyNgNZy0pGRb3zx2cM+Dn8RbuSlWwF/1yBmml5BL9+qD0y8IEhpi8KauC57Lp7d+d
         EFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747205636; x=1747810436;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/kTozl755Qv9cr9hPNKPoioNh/TJBsjvMKXLZxq5yc=;
        b=Kx8Sj60y10qSbnrVB/J4pHxmwl6n2flZUwIrGJAtli3yjWxZJuJAkq1kT0yekQZVkw
         kJ9AgJMQSuJF5LCiuXGVWz6qieh29qJ96ce2SxAf6U0+qeQ1cHHl9D6D9mnqr3OHidG+
         U9T0O2Pj451EYx5pgXSptjynRBlvLwis7GIqgpCgFESuhCwjJwQp96R6JfenQGgclCTd
         ir64EaRaJgI/Gp5skHGTcEMCI0QHZgPQFo+pnEmTdSbipHi9cF94yK56iqYoB0bhmHvc
         T3oEmiNetkkeXJsAxP+Xho0UmPipPo9a9RFlkVPJlqXQ9rt62Zu9d4jPy4m4HQIk0ihE
         DBwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGtMO/R4+oWz8bDf9JOruKEUJvoVUNKlPE+uMVPA+EeF/+6NlVSDyziA3E+cIk2lGI4iWLnFbWaNI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwrulBz/3CFL0DXTx/0ZtRdq80fxfiCD09zYGpa4Cf/clMbTgbZ
	xTWkJci7K5iZfZr25mSWpsIbq2YybEUTfLxMArTPZpOUs2gnzU6v8DLn/mwzfg==
X-Gm-Gg: ASbGncsjhDqO4gHgjYoDGNowcOOfkNsJuyLbvp2AkGx4wv6p2Ci/hoPQFbRrDP4p8LM
	088ymI+yYoGLv4g2DyLlNClksp2HXs9J63J+N5jgY2hyEI7MYNJyaDUfBzdNuYMT1v6n3Y2vpsT
	82JuhhVJfyI4Ywj6NOF72+3e6UAZCx7yfWIICeEtLjoTvJgKFDfrNklU8GgRLZOeDb2E/226HZQ
	uo08mY8vOya6nAsisf7LfzKHvS4C/23uZ1QjAuTuGN8l5wU6J0VfOTpf7zv8iaGBHUJBetHES8Y
	ttCCs3G+V1b7CezE8rdKkQ3M1WiFSzBOIWp0jrP4sFa+6hDGhIlFBCqPMaZk9skPlxt32w9Zlwe
	HsMqRJalGJrUbdRPHF6pLt7NpjxzS0QLcA5pb
X-Google-Smtp-Source: AGHT+IHdDZl0DmDd9cVtLhxASmM6LQG6u5F60bGICyRUUcX6GXNuH8mj20gcP8CXMuCaMO/orYM9UQ==
X-Received: by 2002:a05:6402:5113:b0:5f6:2249:d424 with SMTP id 4fb4d7f45d1cf-5ff988d1551mr1609776a12.24.1747205635738;
        Tue, 13 May 2025 23:53:55 -0700 (PDT)
Message-ID: <50830693-c540-424d-b040-b059d8d8557a@suse.com>
Date: Wed, 14 May 2025 08:53:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/dom0less: mark domain_p2m_set_allocation __init
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
References: <20250513171810.668370-1-stewart.hildebrand@amd.com>
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
In-Reply-To: <20250513171810.668370-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.05.2025 19:18, Stewart Hildebrand wrote:
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -730,8 +730,8 @@ static int __init domain_p2m_set_allocation(struct domain *d, uint64_t mem,
>      return rc;
>  }
>  #else /* !CONFIG_ARCH_PAGING_MEMPOOL */
> -static inline int domain_p2m_set_allocation(struct domain *d, uint64_t mem,
> -                                            const struct dt_device_node *node)
> +static inline int __init domain_p2m_set_allocation(
> +    struct domain *d, uint64_t mem, const struct dt_device_node *node)
>  {
>      return 0;
>  }

Imo the better fix would be to move the #ifdef into the body of a
function. That would then also get rid of the stray "inline", which
generally we want only in header files. For a (stub) function like
this one inlining should be left entirely to the discretion of the
compiler.

Jan

