Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA889901B8
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 12:58:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810283.1222969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swg0w-0000Lg-U5; Fri, 04 Oct 2024 10:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810283.1222969; Fri, 04 Oct 2024 10:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swg0w-0000Iv-RM; Fri, 04 Oct 2024 10:58:26 +0000
Received: by outflank-mailman (input) for mailman id 810283;
 Fri, 04 Oct 2024 10:58:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E5lv=RA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1swg0u-0000Im-Po
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 10:58:24 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91ae568d-823f-11ef-99a2-01e77a169b0f;
 Fri, 04 Oct 2024 12:58:21 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c5b9d2195eso2666263a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 03:58:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99102857cfsm208131966b.21.2024.10.04.03.58.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2024 03:58:20 -0700 (PDT)
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
X-Inumbo-ID: 91ae568d-823f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728039500; x=1728644300; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pJHY43u++/9hd8n0obFvhAsIuIpCNjbLCRWO9BzBGKY=;
        b=CB0yiDUPDtQm4GE+wj1BDtjHufdJ8PH4gafAchfQHTRxmjiT5FfXEszpmK3x1RsTkW
         A1yQXUxYJ5Y8w4HBqovrvrF1rbgV/tp+Sjrax4YBI3o2BNyx25ABOMEZe+CXvq6A39Ad
         CvjhNO/JNmnxLuSUzBAz+JCo7egrmrihGXlQCNzUd77BscvXV9RK5B+TLkunUMJkPQ4y
         galxaqtsXRnHbrnRdaYaZNGEe+lFftdI8xC9WkEnKATZJ8+y+QilJ7WBtAbLP1qr2Z2d
         iGGFhMdjkWUT682OscneZw9i2rlF5t9jsQg5NQfi9esLCeoLsHWqx/Uqpq7XypXpSTgk
         eMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728039500; x=1728644300;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJHY43u++/9hd8n0obFvhAsIuIpCNjbLCRWO9BzBGKY=;
        b=SS67bMxHF32NWlRsda5s44MW1xGLdxAY1VdavVdPxoMQTG280Kh/3PVx04y9dvVfAi
         0nJRYT/oqHkfnHRe1RnGhdVIiskpDgvjJ4Fwss3IyPHynvg3Uu6mTLc5kdzRPl82T09L
         6BDu7152VSpuw3VF4jcXKofcgTyucEEedVRhELMQjwma8RaKw8pJ1Ux2QsaVPIYZ1OFA
         BVHgBC1gn4kX4ByRSirIux+W77U59zwIax0+OX/thMxm3SPJlf61GgQ10AG/f+VdVwfS
         wAZfoR1f8HOczYp1fvDz4Cr+Rr4NVKIFu7odut81tn+R4+eDR6/0tOQATcJ7BYrUxocq
         Z6Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVDXKfsSU0CUzf6W4kMIbV8wENCA/jn1azKFx0XqNWAOb55HMWAFrWPLuQEn32D+IwVl9x5tE2j1W0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYzE6IaENKdnuG9urCrNXMSi6Rcl2KNA69AOTcwlRqnQ1/sqb3
	mfIua8YEUEDb7qS2klG55HiKvIZ5gKXV1MMPfz1lfjSHdfQiag2IEIrpIffSVA==
X-Google-Smtp-Source: AGHT+IFwfb0sT1jP1aMKvSgAurvnuGD2XFfXHbXMAKo5IvZNOvyo/WtiK5QVyHsq9kIJXYPU98la0w==
X-Received: by 2002:a17:907:1c9b:b0:a8c:78a5:8fb7 with SMTP id a640c23a62f3a-a991c0314acmr245958966b.45.1728039500510;
        Fri, 04 Oct 2024 03:58:20 -0700 (PDT)
Message-ID: <c43de126-f79b-4c8f-a255-417a2aa27da1@suse.com>
Date: Fri, 4 Oct 2024 12:58:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: minor file line updates
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241004095526.889790-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20241004095526.889790-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.10.2024 11:55, Frediano Ziglio wrote:
> "xen/arch/arm/include/asm/tee" is a directory and should be terminated
> by a slash ("/").
> "xen/arch/*/include/asm/*/mem_access.h" did not match any files
> from shell, all "mem_access.h" files are directly under "asm" directory.

The latter is intentional though to allow sub-arch-specific files; in fact ...

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -517,7 +517,7 @@ F:	stubdom/
>  TEE MEDIATORS
>  M:	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>  S:	Supported
> -F:	xen/arch/arm/include/asm/tee
> +F:	xen/arch/arm/include/asm/tee/
>  F:	xen/arch/arm/tee/
>  
>  TOOLSTACK
> @@ -545,7 +545,7 @@ F:	tools/misc/xen-access.c
>  F:	xen/arch/*/*/mem_access.c
>  F:	xen/arch/*/*/monitor.c
>  F:	xen/arch/*/*/vm_event.c
> -F:	xen/arch/*/include/asm/*/mem_access.h
> +F:	xen/arch/*/include/asm/mem_access.h
>  F:	xen/arch/*/include/asm/*/monitor.h
>  F:	xen/arch/*/include/asm/*/vm_event.h
>  F:	xen/arch/*/include/asm/mem_access.h

... you're now duplicating this last line visible in context.

Jan

