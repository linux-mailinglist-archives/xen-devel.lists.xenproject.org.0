Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2010A1D51E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 12:12:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877725.1287867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcN2B-0004bH-RT; Mon, 27 Jan 2025 11:12:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877725.1287867; Mon, 27 Jan 2025 11:12:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcN2B-0004XT-OU; Mon, 27 Jan 2025 11:12:03 +0000
Received: by outflank-mailman (input) for mailman id 877725;
 Mon, 27 Jan 2025 11:12:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O4xJ=UT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcN2A-0004W9-0C
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 11:12:02 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87470e83-dc9f-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 12:12:00 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aafc9d75f8bso813399266b.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 03:12:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab693c63541sm316732166b.67.2025.01.27.03.11.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 03:11:59 -0800 (PST)
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
X-Inumbo-ID: 87470e83-dc9f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737976319; x=1738581119; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9BLjtbNMLBZ5w8uegTIY6Tfu0zDz5HDRnWszrYj6B6g=;
        b=NqTxZ3KVWAbE/9mCWLNkk9n8vJCrfQzYGa9b467eup++OpUQ502I1gtcu9l3mE8TuQ
         A8pPmdHsG4g0/duH5bPfHAdQ+eKJ8UY+Fd5w35w2WP+1f5SlVIWjUL1YW2stwRxn5hBE
         G5WA9PgaqoFsE4B3YbdWy4smFZ+VcXaviEd48EkzgTcwM9XKMCR2ptBCuvFtueSEI9tS
         2QlvepQTt7OUOb4nYV5FpV1h65ekOD8cGckXFEf62+lJuu3C/FFTALB150pDTpdnIj0a
         01YcUMjAV6zjiiJu+8ZG/bWrISYIr/oMpmU6g/VeEkFUoVT5OILzuMNl6ZMxd2Olm1BM
         GfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737976319; x=1738581119;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9BLjtbNMLBZ5w8uegTIY6Tfu0zDz5HDRnWszrYj6B6g=;
        b=EYqvnC+Skjf7OTHAqI2oQkJqHd6KbXoMQSuobm3oZbxWgmUcLwl82uk9sDHGcsDjAO
         R6D4ZyStVTZvpXCn942cGCOyby2+7ZxbN0F+saMjvbJ/6W5pSFm6UH0t408dgRZDWufx
         AgXTFbBP/l+9OAHve971rGf+YEmqR80YSvNUWwhK1M3ZtYnqiFYfWIgJSri42BojaMPx
         Od3v6Urc0DPWRdANur4OjL6ZEh4eM+5SAJhMjCGsUWVmp41xp8vQdLqHQDcXG2iz9p8W
         +X+zbdjkeYljZwYVX53nZI4kekdLnlHLWbr5ZgxWYJ8DMNoAL4gp24+CJbrvminFOgcg
         6WKA==
X-Forwarded-Encrypted: i=1; AJvYcCUYXWAFwnqXe4xJBIi9ro+iXW1Xr9pixdn/6HyykdPbV7yO/85nPk/zLR2jzV/c6ZYh36If3aAZre8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4mUgLnUOYn3ANBfZST3RmwXL9pyVDgb3NiS/mJ6Q0Oynn4lwt
	p02fRAPRwUjAXs8BVtW40hLVty7hHb7AWnBWU//0bI7vOy9dyjc9TRQ28JJSEw==
X-Gm-Gg: ASbGncszIW5qsv0WiJaum6MaNM0CaYxL/Ul/OToiBlyF+bT6tThhfRkOvtSc8Zi8EAJ
	pK1HB+p2fThiQb+S+rahZcN1I2nAHAYc51PzSbsY87K2vxNKKVZEWAtv+xropEROLYlWe8jnYX3
	dm4gcw6FjkglZNfrrzOSGIyMkqver7c5Rly2hP9xorGs33qKAtbRffuIto2aKfaGrku2h3rsHM/
	TZ/NnZ1Ts7bWAthu4iRNCPl22X+nqyxqNh5xn/fh9W1LhzgIc5PcLi35oF/C4TSSqaDHY6JJLpb
	XpWldJ5NRco8EsmvzMMVQ95nbvb8aJBcN+y8f/YfM2ZLS1EhY1TINC7oWjJMOPUHEw==
X-Google-Smtp-Source: AGHT+IEAEdk/RqrYYymah7FRX5KJ+Fp7SUGg427RKIRz1nTOIGFLHCiwWjlW3qBBiGVsXFYxy5+X4Q==
X-Received: by 2002:a17:907:60cc:b0:aab:c35e:509b with SMTP id a640c23a62f3a-ab38b4bb44bmr3656920766b.55.1737976319384;
        Mon, 27 Jan 2025 03:11:59 -0800 (PST)
Message-ID: <f8d4a1d4-a332-4dad-ba6e-5a127ae2187e@suse.com>
Date: Mon, 27 Jan 2025 12:12:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/9] xen/common: dom0less: make some parts of Arm's
 CONFIG_DOM0LESS common
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1736334615.git.oleksii.kurochko@gmail.com>
 <396a60496844c8a86667f4ee57c5bedc9899f5ad.1736334615.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <396a60496844c8a86667f4ee57c5bedc9899f5ad.1736334615.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.01.2025 12:13, Oleksii Kurochko wrote:
> Unify the API for creating DomUs and checking for Dom0less mode across
> architectures, including Arm and RISC-V, with potential applicability
> for PPC.

That is you mean to re-use it for RISC-V?

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -12,6 +12,15 @@ config CORE_PARKING
>  	bool
>  	depends on NR_CPUS > 1
>  
> +config DOM0LESS_BOOT
> +	bool "Dom0less boot support" if EXPERT
> +	depends on ARM
> +	default ARM

This then would better be converted to "depends on HAVE_DOM0LESS", which
for now only Arm would select. With a dependency on XYZ the default also
doesn't need to name XYZ again, i.e. can simply be "default y".

Jan

