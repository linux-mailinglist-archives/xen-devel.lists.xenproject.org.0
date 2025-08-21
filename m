Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A7AB2F40E
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 11:36:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088296.1446054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up1i5-0003Pb-D1; Thu, 21 Aug 2025 09:35:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088296.1446054; Thu, 21 Aug 2025 09:35:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up1i5-0003NJ-9Y; Thu, 21 Aug 2025 09:35:53 +0000
Received: by outflank-mailman (input) for mailman id 1088296;
 Thu, 21 Aug 2025 09:35:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Hha=3B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1up1i4-0003Jz-3Q
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 09:35:52 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3955a7d9-7e72-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 11:35:50 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-afcb6856dfbso148846266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 02:35:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afded479868sm356327766b.58.2025.08.21.02.35.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 02:35:49 -0700 (PDT)
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
X-Inumbo-ID: 3955a7d9-7e72-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755768950; x=1756373750; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RbYrYvSmDJU5K4UC2r7hitotey+GrqoypZRKUkZHyuY=;
        b=O9Uh/Eb6TjgzYp0yriGZLcMiQbP/yr25A3xSlUJgEyrohKhKgyi2tN5Xt5RH3M+4fH
         kM3Grqx4tEGfaL/aBtqfNbvobmFTjcwUPhq/h5Xm5fUW6BqUQ6ZFVJvw+KwehVuGQT9l
         CL1lytUEPT/LOhpw5gWtrwwbEdwV8komdpxsQvxOZBejxb60j7JK38BKPTNSnDuQcY9d
         5+EYFmFvxzo4JVKIbTbtONxXOZUOZQyXupYZcwuPXWeACA/JA8j3gJm9qMJNpqB+Urui
         kHO6w5jdWjzIUDSAAiU3KVN74ec62vNq8HqMIgjKe3dL11/fcSSTnRBM272nZhrmJhbN
         lXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755768950; x=1756373750;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbYrYvSmDJU5K4UC2r7hitotey+GrqoypZRKUkZHyuY=;
        b=Rv+8t8Rw9AFzG2yUSNul7dYQC/2ZrzS5043G6XvLW1rW53XeXnUnrafHBi0rLF/IjP
         D7+hQmwbS8gdJcApiXXbbzxq/BV9a/FQJjJUnrvNZ556mEZPRdqT+YCLNrQj+glF9axe
         E7of8XtPsM/z+dBmw7mA5Y0stPp/Kt2FeqY71XcRxryQda4NONxbIHYlAnxEeMSWw1H+
         silZFmfnprrPTMRItG390MwjzPnf/WPMF17Eaj8N3VquaJrme2cmnCJ4om9d36v2Lt0g
         frvEd5rWM+d96p8ETXq6V5FsuZu95W0R2i30QJe4x8cySum8GqWDA/OAKiMBoWxGuIti
         mxgg==
X-Forwarded-Encrypted: i=1; AJvYcCUygBIyfflKWVJ1m4ViDR0nts8iHitLsJYmeHjNM8YFDNfe0vrWh+ElGKwsM1jz7ifwKDgKv3qrFpE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzstY88wsKojy6GI/IWdpH/lYAXwOkDjK6f56sSMBar4dxYasXX
	18AFjhFOYVAnDqDl96VPp9je/KL4lCgoJ5CLoZCColFlUfleIXPdIvygTr0HQmUzAA==
X-Gm-Gg: ASbGncvYsyHEb3qgHhHW99G+cZcn0ZGpRToy7bEWKYSj2MpgAuft7kk5fa3Nu5dG3aJ
	I7uCsELN0mPPgfOFD7zecuGuvw5wJwe8ZwHe8MKMnMzey0pqWhCitT5mE2YzlJ0SX7dRoJBIy1i
	lgS6ykP18s+DyfdPwYvbYLz5grKNxpY5Z859ANsYemh0o5fATvHbLLxFotgXx+IFcuqDT1oxfr+
	igVPfJF/JoJ2ePMi2427+j0P4zxSuP9UxF1sP+QlQaRmHoN+cVn1Sr65dSZk0Ol1cMtT8/s8MmF
	qMJaAWB+ck91pJAWa+c+lQOTJ1jmCHV6EfK2pAqKTMrOwQ+3jo5Y0eUH7Xkn+IjhW+nlCGlex4m
	zekJenHEGkqyNsCkT4ejMrtpCm/VepGEFz3LZuegG/A0sS2bOxjRBh8aP9eYmTXGtmm2OtLxFow
	h0lcZMmvjgxYJA16laiQ==
X-Google-Smtp-Source: AGHT+IE2A+Mb8/ORucK97YKaEfK+9uQPcVYwU7VADy7wqTjiAcm4zPwO9yWXBDcQ+93T9Fuiawm0PA==
X-Received: by 2002:a17:907:7e84:b0:afc:d7ee:282d with SMTP id a640c23a62f3a-afe0ba8d568mr165366366b.20.1755768949721;
        Thu, 21 Aug 2025 02:35:49 -0700 (PDT)
Message-ID: <79663681-466b-43d9-9845-3f16f8a33cb5@suse.com>
Date: Thu, 21 Aug 2025 11:35:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: fix Rule 11.3 violation in
 'vcpu_mark_events_pending'
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7210337994620b60ed123ec6fc73e469c287adf6.1755676142.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <7210337994620b60ed123ec6fc73e469c287adf6.1755676142.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.08.2025 10:00, Dmytro Prokopchuk1 wrote:
> MISRA C:2012 Rule 11.3 states: "A cast shall not be performed between
> a pointer to object type and a pointer to a different object type."
> 
> The function 'vcpu_mark_events_pending' contains a non-compliant cast
> to (unsigned long*). Remove the explicit cast and pass the compatible
> pointer type to the 'guest_test_and_set_bit' macro.

No-where up to here (incl the subject) it is said that this is an Arm-
only issue. Hence why I ended up looking in the first place.

> Fixes: c626aa1a5a (arm: implement event injection, 2012-06-01)
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
> Test CI pipeline:
> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/1993054203
> ---
>  xen/arch/arm/domain.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 310c578909..6371e68cc7 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -1166,7 +1166,7 @@ void arch_dump_vcpu_info(struct vcpu *v)
>  void vcpu_mark_events_pending(struct vcpu *v)
>  {
>      bool already_pending = guest_test_and_set_bit(v->domain,
> -        0, (unsigned long *)&vcpu_info(v, evtchn_upcall_pending));
> +        0, &vcpu_info(v, evtchn_upcall_pending));

It'll be Arm maintainers to judge, but my take is that the previously
questionable construct better wouldn't be made yet more questionable.
What's missing, at least for Arm32 aiui, is a (build-time) check that
the field actually lives at a 32-bit boundary and that read-modify-
write operations carried out on it at 32-bit width (this is true even
for Arm64) won't have an impact on what follows (this may be possible
to cover by just a comment, as you can't really check for the absence
of struct fields).

Jan

