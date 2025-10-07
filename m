Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 231C8BC1FE6
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 17:53:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139067.1474607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6A0E-0004dI-Gj; Tue, 07 Oct 2025 15:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139067.1474607; Tue, 07 Oct 2025 15:53:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6A0E-0004b2-DB; Tue, 07 Oct 2025 15:53:26 +0000
Received: by outflank-mailman (input) for mailman id 1139067;
 Tue, 07 Oct 2025 15:53:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6A0D-0004aw-Ms
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 15:53:25 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1a44bd1-a395-11f0-9d15-b5c5bf9af7f9;
 Tue, 07 Oct 2025 17:53:24 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-62fa062a1abso12080234a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Oct 2025 08:53:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6394ba637fasm10344571a12.33.2025.10.07.08.53.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 08:53:23 -0700 (PDT)
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
X-Inumbo-ID: c1a44bd1-a395-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759852404; x=1760457204; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UCfA5wS/TvNHHB5wDkVbVGdcN+krHhK+HT4MBZeVcMs=;
        b=A4ELA/SiQyzZUeew5yXBiMj5PElsto2nU3Sk7k5vXmQ9mDqaI7VY/9+HX3nDjzCR3s
         mXhFRZUz1fxZltQQnoT6aL47Uaxk8mgKUakrGoW86eS1aFTm2yPYgPCZENMOFxiXC4le
         Te4pTdZLyCe8Cz0Ep+GVGMoe7YJZvBwXC30C2FNoP9O78vRnSiwKIh5pjNsLX9lPpD6z
         5+mIB9rD3d6RluFLxzxqPOCBa+SwD+aWeNxuAe9ngEGWhaFiZDyVbwO/v7gH+SjLaN6Y
         dq7rcn2lD4JOaD2+axjecImH1/zGd2l9UubeHHzeVG+mbov8Tw0RqPWXvU0/t5Uct1qb
         cR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759852404; x=1760457204;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCfA5wS/TvNHHB5wDkVbVGdcN+krHhK+HT4MBZeVcMs=;
        b=xR2EqehEhEfEbWK8HyrpLmGrnnU9hwE5/YxPbm/4ahT50EElcmvrVHZhJilfWus3R0
         VSDPUQLmmfW8LMyZfQWrWWogPau7Y16U9EQcm51Z8d69N7pQTFt5ucUWSi813wfjUdUz
         dp67v9XCCXqv83vkyJZ+2JPvO4JCS8eSiAinCryYjxK9I07MTJburTl/13x57sk5PyVF
         kAkcBy17a+gYip+qwRR7BuuElnGNf9lHp8x3JWZTJ/tOs0JnTlZh8+1SUaSXOk6Jp1QQ
         Oaz4pjnoH+HNtJzppEdiZpNTx2EKGxsXznGrS6ehXFnnF9eqSJIwAvTThJp8BhMotuHX
         PtsA==
X-Forwarded-Encrypted: i=1; AJvYcCWgTAdzkHu0WOqdCRTOWyQ2BxRCPRRsqZiFfcMUP+0/dXstg9y/k40+ZnEPs+DBd6Bntw3vU4S7dJs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwEDaqrPyVgGaBPl4ssf2mdtQTO+xNNXccC0+y+cuT+cXLY1x5t
	+Kwg51v9wmYQrI1uwJtxoI2sM0Xi0A4o2fNjwiRBk1q/R9jiJLeiPzcvBJb4A9U2Qw==
X-Gm-Gg: ASbGncuIBzOXnHfqZKtiPByH2Qldtb8z01xAKe+byx3wayqjzVNxrAuVYTZSwbiwoeS
	6hPyIOJxGAh7BzDyl0GqGErhvkR8rXnETmON0jy+kTq+gv2WHsNbnCNm6/0ITdKcuAqJ+lJDIPf
	sVE9fI9qCp5PodC7IM7Teav8G8Rcqox4QlPw2Xb7RL+Y8Q1xpB6WD49apC/gkVknTlXLgHwOU8M
	SePD4a0z8FIDTL8axnSxlLNebrx7ZlKUqqtKqVtvm8tEkpPwU0zdCW86ZIp5IKc3J7GYirBUyqb
	iFIbnRx7CI2ppy0PYA29KmKLPGknuTN7PjAVosocMC5zemAz+9CMAA2ifEr3vC8Rj3TO2do+P6n
	1ytotBtJvEoVTko72jB1Dd1Kqser+XugsPqX+DoPP8hkBbBQefCiM5BuJVAXF7owyEXmmBOEHeh
	Op6O0mVsNAObbY65YFAkoL7GKb2ypBSvQKt7XYXKJGog==
X-Google-Smtp-Source: AGHT+IFPlQtGyAQT5SrBRQI4XkJF9/CqlLRA+xtU2Jt/oMeez+jQ+P4APTmsIiaIXps4Phy6FYd1XA==
X-Received: by 2002:a05:6402:5190:b0:62f:c190:95cb with SMTP id 4fb4d7f45d1cf-63939c21c3amr18669633a12.19.1759852403791;
        Tue, 07 Oct 2025 08:53:23 -0700 (PDT)
Message-ID: <138f0c2d-8cd8-4a5b-9f5c-fa1e0890da4b@suse.com>
Date: Tue, 7 Oct 2025 17:53:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/22] x86/fsgsbase: Update fs/gs helpers to use
 wrmsrns()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
 <20251003225334.2123667-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251003225334.2123667-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.10.2025 00:53, Andrew Cooper wrote:
> ... and rdmsr() while here.
> 
> Most of these accesses are in fastpaths and do not need serialising behaviour,
> but the write side is serialising on all Intel hardware as well as older AMD
> hardware.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
in the interest of not blocking the tidying over ...

> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -2737,8 +2737,8 @@ static uint64_t cf_check vmx_get_reg(struct vcpu *v, unsigned int reg)
>      case MSR_SHADOW_GS_BASE:
>          if ( v != curr )
>              return v->arch.hvm.vmx.shadow_gs;
> -        rdmsrl(MSR_SHADOW_GS_BASE, val);
> -        return val;
> +        else
> +            return rdmsr(MSR_SHADOW_GS_BASE);

... the addition of useless (and confusing, and possibly being Misra violations)
"else" here and elsewhere. If you were to drop them, feel free to "upgrade" to
R-b.

Jan

