Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE10C3EA7D
	for <lists+xen-devel@lfdr.de>; Fri, 07 Nov 2025 07:53:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157341.1486141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHGKh-000869-8s; Fri, 07 Nov 2025 06:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157341.1486141; Fri, 07 Nov 2025 06:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHGKh-00084D-4z; Fri, 07 Nov 2025 06:52:27 +0000
Received: by outflank-mailman (input) for mailman id 1157341;
 Fri, 07 Nov 2025 06:52:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QcrT=5P=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vHGKf-000847-Ps
 for xen-devel@lists.xenproject.org; Fri, 07 Nov 2025 06:52:25 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 506039bd-bba6-11f0-9d17-b5c5bf9af7f9;
 Fri, 07 Nov 2025 07:52:23 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-640d0ec9651so705695a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 22:52:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6411f813eb6sm3441479a12.14.2025.11.06.22.52.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 22:52:22 -0800 (PST)
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
X-Inumbo-ID: 506039bd-bba6-11f0-9d17-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762498343; x=1763103143; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jCC6IAiebYlEEh8DDXGJ7bMpe5CkZcWf12BH/kdOZ0U=;
        b=gBxM96cpm22YsdNA57jqaAdanBKMTFj/lgLbaUNn5zQaAIn3SbcOpfIpJjDjtMA0o9
         6IoHmOUYNCEbEF2OyqWQPKROUmTTkB6eAyY8CrR0ADN0RKOVDQ8qaphtcdp+ADh+j4Rp
         RyYFVwZR28HKfHIjlkOeJ4o6qJIQMmMg365jS0Rh4i5xlhmjJq9f5X/z/e+TglJ+w48M
         6X99nTAljZuFd5jjhnJUR4Ox3JhGbpr7rZu4RtIDM/rmtapoWoy6AAtOpf/5CTiTI6b3
         d7/vDqn2vKFo4d2GubndarcpxyRPdpmx3cMxuYSGz1pr6BOAjofnxV4ywkSfaRJ7jnQ+
         qVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762498343; x=1763103143;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCC6IAiebYlEEh8DDXGJ7bMpe5CkZcWf12BH/kdOZ0U=;
        b=R4tLRvGbnzRCJnWkwquqxNUqA1o6xWyaozctWPM6smeZ7ilv/gU4WIZnpKAi/lUF6K
         aTOwaOBxAsPe5M0I8YgqK1LxrF3xBj9sUg44aXkb1xiAi9voO5+C++XlEawACYrGkdgl
         PfJAFpDfogVauNrU7ZTrKLlp29sgSmV93PUDCipszHdVA9BjmlFeRy1zA+WnGIszN6Zq
         s0KrLmcKi/EPQSQOoLnI41gtDrn28hVwo/SDpYkttjbJwWSQrTkwrFDefmMiBIB77E3V
         gcPhwkkE+Kv1APyN20c5GqzihK8o5bBb7zlgg55z406niKGmCzW77zcYxMhI6HSirPKq
         ZJkw==
X-Forwarded-Encrypted: i=1; AJvYcCVYCAWqAoovXjQhvM3XVQg24IKbcXwBqr5b70DbEKhRNk+1NbriexY5fu5kCdKzSxwWP8czGLADITA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJJ2MRh7kGGaPFXi75wHsflX1lcTbK8Ig3yu6Sq/BoCy0D+DYd
	NlGpudjQ4re3FIqEhmTEGs+cpOgN87RHXtdSk71TouMrME+246oHI5uZSumGQlh/4A==
X-Gm-Gg: ASbGnctvzvzBNTXlultjAQdsAJd0zKuii4iZrO17kzbIMv2z8BLP7qZoRLNjXCCwTps
	hR4pPkDd5AFyEnp8oCDrAR9/wo4kxTfthJzYdEU2cndzpkTJtYYXzq6MHE6k8rTWUztFprtDqVa
	bgoEhJj0L/+ZfU8i+n+e/TyQp12OlgWG68am08IXZLc+nWJN2b5wCvhJSIdXuuSIbHRdN5dYeOc
	0QXl7Lx1skY2h2U+1XFuYS0T18qq/qWOaAv3gBn4PQm8DGTjRfY5v6ZGC3Ioq0an53A2bOA1ShH
	/8GkERRdx8z1iXmaaUJ/BAcI3ulH0ZoRg5fston8PkE1FvTrzY0hqcj4XeZ0f2CVBlkvF6Y7+OM
	FdOLCZLKzlehY/y205rtX9bi88B8QFcPu9hnKxMRViqKpXbaACfieyQGqXT6zgf7zPRgaBUIQJ7
	VlC2tSwHOPVPlz2zrZvQIKva9Tvm3UKirS+MZRhipDLSNep2wpZLT64byEF7yZDB5yvhQPXfY=
X-Google-Smtp-Source: AGHT+IGMijw0HjbCBfmvGOqOOyJr5qsQ+e1TVEJ6ZcQjXA8EVVrIQGMbSfgjnaNI63q1dYCSiMos6Q==
X-Received: by 2002:a05:6402:5355:20b0:640:aa43:1595 with SMTP id 4fb4d7f45d1cf-6413f0c2118mr1482652a12.38.1762498343203;
        Thu, 06 Nov 2025 22:52:23 -0800 (PST)
Message-ID: <0dd91607-6df5-4be8-a92a-c3046542748c@suse.com>
Date: Fri, 7 Nov 2025 07:52:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/x86: guest_access: optimize raw_x_guest() for PV
 and HVM combinations
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>
References: <20251106222630.2777457-1-grygorii_strashko@epam.com>
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
In-Reply-To: <20251106222630.2777457-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.11.2025 23:26, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Xen uses below pattern for raw_x_guest() functions:
> 
> define raw_copy_to_guest(dst, src, len)        \
>     (is_hvm_vcpu(current) ?                     \
>      copy_to_user_hvm((dst), (src), (len)) :    \
>      copy_to_guest_pv(dst, src, len))
> 
> This pattern works depending on CONFIG_PV/CONFIG_HVM as:
> - PV=y and HVM=y
>   Proper guest access function is selected depending on domain type.
> - PV=y and HVM=n
>   Only PV domains are possible. is_hvm_domain/vcpu() will constify to "false"
>   and compiler will optimize code and skip HVM specific part.
> - PV=n and HVM=y
>   Only HVM domains are possible. is_hvm_domain/vcpu() will not be constified.
>   No PV specific code will be optimized by compiler.
> - PV=n and HVM=n
>   No guests should possible. The code will still follow PV path.
> 
> Rework raw_x_guest() code to use static inline functions which account for
> above PV/HVM possible configurations with main intention to optimize code
> for (PV=n and HVM=y) case.
> 
> For the case (PV=n and HVM=n) return "len" value indicating a failure (no
> guests should be possible in this case, which means no access to guest
> memory should ever happen).
> 
> Finally build arch/x86/usercopy.c only for PV=y.
> 
> The measured (bloat-o-meter) improvement for (PV=n and HVM=y) case is:
>   add/remove: 2/9 grow/shrink: 2/90 up/down: 1678/-32560 (-30882)
>   Total: Before=1937092, After=1906210, chg -1.59%
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> [teddy.astie@vates.tech: Suggested to use static inline functions vs macro combinations]
> Suggested-by: Teddy Astie <teddy.astie@vates.tech>

Just one formal request for now: Please send patches To: the list, with individuals
on Cc: as necessary.

Jan

