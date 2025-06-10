Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 937B1AD3E07
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 17:57:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011094.1389416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP1LS-0006Zh-1I; Tue, 10 Jun 2025 15:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011094.1389416; Tue, 10 Jun 2025 15:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP1LR-0006Wa-Ua; Tue, 10 Jun 2025 15:57:01 +0000
Received: by outflank-mailman (input) for mailman id 1011094;
 Tue, 10 Jun 2025 15:57:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uP1LQ-0006WR-Eq
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 15:57:00 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a9fe920-4613-11f0-a307-13f23c93f187;
 Tue, 10 Jun 2025 17:56:59 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a4fd1ba177so3836321f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 08:56:59 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5322a9bbdsm12388835f8f.21.2025.06.10.08.56.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 08:56:58 -0700 (PDT)
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
X-Inumbo-ID: 8a9fe920-4613-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749571019; x=1750175819; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sunt5VtzP9ZG9QrTQ/Rhz/Jdoh0/yOk6AR4RhSp052w=;
        b=gaa+Kp4gq0BAggsSr5snBt4UXtpymZBw+5Vra4LdmevQTZfkrLdcbBBIDEeulDi7jj
         MQ4bZB7qHaDxuVPkwT64ull9eqmGGA4bl2VPyicyTJuJbvLhy3qGFVSJn0TV/fFd+JJV
         /DEVaa5DZVJQ8N8wF6CjNKs+27VaaOU9+EPKrN5+/+9jvnBPewnLxSfY7eg5dL1WH28i
         JO9Tb4Of/kkEQx9PJG4paeHJmL4Hbs1r6X4ioJ/uPG1+pMxl+hf/sLEsOsjVXeYL0V6u
         tXiqeu4QSEQEgYNWttZeD7d6g3PFPvi5B0bzWVhdvLDTGzFhIoi6E7eWsUH6KpZxK/A+
         JDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571019; x=1750175819;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sunt5VtzP9ZG9QrTQ/Rhz/Jdoh0/yOk6AR4RhSp052w=;
        b=noutFoxEFPPm90XR/i4pIMmUcQXhuZM7aG7NABBXpALT8NTKPfBQfLc7ASvTAh7PP4
         fbNCMyxNNMVMvP6dcKNA5Gx9GVVot0iMpdtjTHP/w/5HOHCT+491NqqCs1BFtUQR7xVo
         EOxv6HkeXN03Deiz1X2qHBLBdEXuv3QTiOjTAcdw4HjOsThNNHWgY+704m3YU8aBywxT
         cMMH37O2gpOoW6NQ6oUq2qphkJQddKjR9o9a0N3f7BYZQVWCSzSx6t+W7wWN4ubv9TxH
         G6p4lDfZtJ/L28WGUwst1DTGryFAWYTt8psYy1qWDTH1FVD9reh5/8dqAXfCgLcn3qmw
         bGYQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1mhm/QraKbcHIcbWf6AOzdfH6UAOnFicu3Mx87MELW8hfLZq3P34Nl+jWqvPjvJBMwERWzwp2r60=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzFW8LX/p6mjsawdGvuubk6qmAFPFgC/Elk114vlV+QV9mqtIJC
	cpl6/zjcA4naOrh0b9IJrYqfL9QeL9EVHDPRf5Q/yyJJJEFiEYLAXjjcJxIBgiYSZw==
X-Gm-Gg: ASbGnct/lMF1v6f9rzCr4HrNGmdqhlYwzMwbm8n6WfIOzieTDkJCwigrPAaBveiL8/S
	w4RaV18m7cZkF/4lytDPYEJOck1xzFBWQmPlRS46b2dcRic+Rt5xnK1Ke1ycsp6rb9KU2v0qHrB
	b9azCCVEfYD/19JUvFzyWraCC9mRKl5brl/kGNsFayT3aUkkVwqmNWAoP43p4NPHAGU2AbokRY9
	EVOSXJ2acuspoef+r6HfvDrS0Ygk5Bcf3rYypyLiMf3sQHYikmPlPFVzd3pHkdo7lOURG1hdRhG
	yp+JpFopBxldvdonEYVLAu35XTetVQMKGjawnarjFORwtt7gn07Pt0J3KqX1GyuPpG5AqMrWmON
	sWMs/4cYbtBormI/X8ETgLP32BKZlPszIwW/+lexg6eRRZyPPT9A8AQ2ndnjYN2oX11qBezv+GE
	ehzYOo68Kk83aNTPchcKgB
X-Google-Smtp-Source: AGHT+IFF4AFjf2wTg25dFaxlfOU/Cx2UNUETw4MLpdnlRy1ZZPecWew8F4xq2+Cv4EhqNQd4v0hb8Q==
X-Received: by 2002:a05:6000:4024:b0:3a4:dc3b:5a3b with SMTP id ffacd0b85a97d-3a5513e84c2mr3508102f8f.10.1749571018790;
        Tue, 10 Jun 2025 08:56:58 -0700 (PDT)
Message-ID: <d1da1803-ad9e-4666-ac10-97f40d27aae9@suse.com>
Date: Tue, 10 Jun 2025 17:56:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] Disallow most command-line options when lockdown
 mode is enabled
To: Kevin Lampis <kevin.lampis@cloud.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20250602134656.3836280-1-kevin.lampis@cloud.com>
 <20250602134656.3836280-4-kevin.lampis@cloud.com>
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
In-Reply-To: <20250602134656.3836280-4-kevin.lampis@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.06.2025 15:46, Kevin Lampis wrote:
> A subset of command-line parameters that are specifically safe to use when
> lockdown mode is enabled are annotated as such.
> 
> These are commonly used parameters which have been audited to ensure they
> cannot be used to undermine the integrity of the system when booted in
> Secure Boot mode.

It's still being left entirely unclear what the criteria are by which an
option can / cannot be marked "safe". For example ...

> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -47,7 +47,7 @@ integer_param("cpuid_mask_thermal_ecx", opt_cpuid_mask_thermal_ecx);
>  
>  /* 1 = allow, 0 = don't allow guest creation, -1 = don't allow boot */
>  int8_t __read_mostly opt_allow_unsafe;
> -boolean_param("allow_unsafe", opt_allow_unsafe);
> +boolean_secure_param("allow_unsafe", opt_allow_unsafe);

... why's this being marked such, when already by its name its use is going
to render the system unsafe.

> --- a/xen/arch/x86/cpu/mcheck/mce.c
> +++ b/xen/arch/x86/cpu/mcheck/mce.c
> @@ -31,7 +31,7 @@
>  #include "vmce.h"
>  
>  bool __read_mostly opt_mce = true;
> -boolean_param("mce", opt_mce);
> +boolean_secure_param("mce", opt_mce);

Similarly I don't think it's a good idea to allow turning of MCE.

I won't go any further until clarification on the criteria was written
down.

Jan

