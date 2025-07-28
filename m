Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2E3B1386C
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 11:57:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061185.1426689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugKbE-0000kg-2b; Mon, 28 Jul 2025 09:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061185.1426689; Mon, 28 Jul 2025 09:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugKbD-0000j9-Vz; Mon, 28 Jul 2025 09:56:51 +0000
Received: by outflank-mailman (input) for mailman id 1061185;
 Mon, 28 Jul 2025 09:56:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ScRH=2J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugKbC-0000j3-Oz
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 09:56:50 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26715c76-6b99-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 11:56:36 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3b78776fb25so573621f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 02:56:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe4fcc5csm50196245ad.80.2025.07.28.02.56.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 02:56:35 -0700 (PDT)
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
X-Inumbo-ID: 26715c76-6b99-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753696596; x=1754301396; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AcdkNbx/NBFDRvP3l8uCPw0+UnVn5Ompis1QF+jV72w=;
        b=fsTEIFL9tBqnGH2bKJroe/QHBSZyz8QPRT4lr/cETpobbG8X18MTB1LJeHYO4o2wyx
         wKlFEUBXqxkZjzkYZdtNZqGiJJoi18UD2Vda7axDN6DJgxfwZVSDuIevumVuyOnFxp3l
         7AyW7wLOwAUACQoYVRFBLOCBeqSDp45T4YWAxmwqi8hlwObP4Ifk9pUaWJBx9E12IG/K
         mbVg/YmzVwAA7nCIiNm4ynmAios+ZoJujRoPROA4dLYWJTF7WHzmv4L9tiHrBmRqB+wz
         8YFN5WJqLta8Um3CqDYut/cbyUnpOJGrZaS/thpR8VDeMDw7zAuwvorWf0JJATW3q5Vy
         OPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753696596; x=1754301396;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcdkNbx/NBFDRvP3l8uCPw0+UnVn5Ompis1QF+jV72w=;
        b=DWr9p5QvIDnBGfzGg7jlyHS/6FC5ISqmNi1joQO9vhPxJgrgoQm5lFxfIcxaV8d8Cn
         I3XvnjXj7ygFtZLw+kDlVw3/cCqXt1+jjqH+WEaRurD9lk+/HqEGjxH2rWT8R05AwJ6v
         9TeChHX8cJohHxzEi/xsizqLHCIK/a6WRj2M1H+PsJMgVu/uPmWlYLwilw724OUes0wY
         GNQG3ZigFdu1f1wKNRBeynrJVqdh6FHRefGBlxDC9/mc4H/H7vtbPul6SSiTv6ODSWPW
         Yvff0fN9vraz/Qxyg3HbMlZVI1ZeZdmFxnXJDYQrDZxjj1u9PBO8kE4Jut9X1betxyHI
         w6ZA==
X-Forwarded-Encrypted: i=1; AJvYcCXmDQMunNQ+EnqqgFH0azK7Le3ZpHZTXPetdo0YohKG18PnYqh8Rnzh/bLO640W3oPjLSPVsTp8QX4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy94HoNf6IQtmjdJKsml/wGQ20GAReC3L+KJRm+Q0xvskrHsSHj
	ERWugOXAnUPsLjDoTMtL9x++cz++hFF4rhUywQy1C2OuQOMk69lSuwYkypjrtq7H+Q==
X-Gm-Gg: ASbGncv8jyhCWXTOKlMvsFX70OEJ7aO5PK2Z2oy7DYcw5SQhootSSO3QiFpGpFz0z8s
	zi0uZ2FJHgJrfREFYOji0c+swj0b5QEnkARgaqQLdTezZXDZePO16nO65reXW8bk8S8M6vf10zr
	bIdtdj7qa71jKjP31lx37Fqgl41rWpiAJ78B9X6fy+2wTEEBCO1gyPC8CJLYN7zvj+tqCfzvVnB
	vjts8HCSuQ8EWrlQ7lHqLeDhvqiS/yP3efpUdMOXZeEhLN/RTBIeLfm6fwTrbcJ/vEQclDc6j5s
	BQV9KL7HjkJrUYWFyeJlRjuihdo5d/DD9xJPbIRV3rdXGbhD9wnSfFcL5NtBd6EusOzEdPRGpBu
	+p0LxVvROFtVa8RUz92HJ43WLh1Wb4Kx37FBtMkwRLZFkoJmrDP0UVtfH6HCJLgbiwu9//Rv4Kj
	ihYB66QCQ=
X-Google-Smtp-Source: AGHT+IHleS3+yrf4uWWwMZl5l3kv0FQl0qzqpf5yhyWodr0AXT3ZiXxc3mvfBd0u596jZZuKxrsaYQ==
X-Received: by 2002:a05:6000:1787:b0:3b4:9b82:d42c with SMTP id ffacd0b85a97d-3b7765ecb43mr7610074f8f.17.1753696596112;
        Mon, 28 Jul 2025 02:56:36 -0700 (PDT)
Message-ID: <093601d7-691a-48ee-a0f4-2e86a0f2015e@suse.com>
Date: Mon, 28 Jul 2025 11:56:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: deviate explicit cast for Rule 11.1
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <181a03d5c7625d42c06cf9fa0cf48a9bc6825361.1753647875.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <181a03d5c7625d42c06cf9fa0cf48a9bc6825361.1753647875.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.07.2025 22:27, Dmytro Prokopchuk1 wrote:
> Explicitly cast 'halt_this_cpu' when passing it
> to 'smp_call_function' to match the required
> function pointer type '(void (*)(void *info))'.
> 
> Document and justify a MISRA C R11.1 deviation
> (explicit cast).
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

All you talk about is the rule that you violate by adding a cast. But what is
the problem you're actually trying to resolve by adding a cast?

> --- a/xen/arch/arm/shutdown.c
> +++ b/xen/arch/arm/shutdown.c
> @@ -25,7 +25,8 @@ void machine_halt(void)
>      watchdog_disable();
>      console_start_sync();
>      local_irq_enable();
> -    smp_call_function(halt_this_cpu, NULL, 0);
> +    /* SAF-15-safe */
> +    smp_call_function((void (*)(void *))halt_this_cpu, NULL, 0);

Now this is the kind of cast that is very dangerous. The function's signature
changing will go entirely unnoticed (by the compiler) with such a cast in place.

If Misra / Eclair are unhappy about such an extra (benign here) attribute, I'd
be interested to know what their suggestion is to deal with the situation
without making the code worse (as in: more risky). I first thought about having
a new helper function that then simply chains to halt_this_cpu(), yet that
would result in a function which can't return, but has no noreturn attribute.

Jan

