Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7609DC04C
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2024 09:13:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845764.1261104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGw7X-0004UE-E0; Fri, 29 Nov 2024 08:12:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845764.1261104; Fri, 29 Nov 2024 08:12:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGw7X-0004S7-BB; Fri, 29 Nov 2024 08:12:59 +0000
Received: by outflank-mailman (input) for mailman id 845764;
 Fri, 29 Nov 2024 08:12:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFrC=SY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGw7V-0004S1-OH
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2024 08:12:57 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbd25fe2-ae29-11ef-99a3-01e77a169b0f;
 Fri, 29 Nov 2024 09:12:54 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-434ab938e37so9638575e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 29 Nov 2024 00:12:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385d6e60909sm2677044f8f.76.2024.11.29.00.12.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 00:12:53 -0800 (PST)
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
X-Inumbo-ID: bbd25fe2-ae29-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmIiLCJoZWxvIjoibWFpbC13bTEteDMyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImJiZDI1ZmUyLWFlMjktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyODY3OTc0LjE3ODU4NSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732867973; x=1733472773; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NRDqfmivmeZPSFuTGzi7SjRWi5211xG82lAX2XUtMs4=;
        b=BiSHTG1MZJIh5y/9v4j/5OOWBhPvqtDYdKvhgdGMq0aGQz5gy4X7JyOTLa2PAxPD34
         t+2Yd58QllRi2G1lATzwmh6nzo7sZLuq+6DAm5tPW2N8MqEY3rWOY/51uBA87sP6uj28
         rRgQTNzbMupIJwZUw3mco1Rfn1tq30IWWbwU4AIGPJMHUksW7Xg2Tf+LQt6dfzGWezy+
         /y1ydLU5evJEzhz64IwijA0pFL4XAwfaHvmAXOkPeJrN2uwZHuBY7UxpcAPureWcMsPP
         n9TO9OgZSRFmyuJYAqDmjWhto01iJ+tGk5irNNdltaDr4+Lu7VuZDmOwfLryWs445vDJ
         VqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732867973; x=1733472773;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRDqfmivmeZPSFuTGzi7SjRWi5211xG82lAX2XUtMs4=;
        b=ARh2p1t8PoeWxnPJNeorO0euyC3DiTMC5sAJtvhtNVwlzUuiOt8IJnD+aOvSQJh4dN
         J0k9UtyNQreJS/GH98CpnvBf1ozgn9lOimvqEl/82iaO4c0a7zm89UUHUXR9pHl27DfR
         V6MiC0JCrIHf+6QXuIk4fvtKSvxqx6TSH3/SSOpf43IpgerAOvj4xQXAchZ3e/MXMZu2
         r1JI7AcME7KZxCAT8RoaLl5+ylGGlSone5YUorIwk96t7ZMzO9v7wYJmo93wVIgzUZI2
         UhZzDn87l9m82jdN3bTx8MJvu5E+nGki5KcfYslnN7xCMfzvukZBSTuwm2CKK3JpouiW
         Qqew==
X-Forwarded-Encrypted: i=1; AJvYcCUNo6j5RWYkXpra/iX7zhe76LIfx11vB9Av2pDEcwNElzT4mbRrZpdPhADJpE2JG4k9JDlvKz5JclI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1cct9AkytlirdklmWFt67zE4XfKoRBOMfSY5DoB02MbGlPj/6
	OtomRYleGFbPXfp3lrtnSz0QqopvDg5qO5tUsEBkCm364omJNHdpmtA2QEZB8g==
X-Gm-Gg: ASbGnct83KctU8nPQEF0OWBAEeDdv2oumRWJG6F9Ox88byHBv7zRBV4WtLkLkeoLNLl
	sDltGdCzPRJ6eEhkS7sgLORi9EMWK/Grc2Im+6MFbnN9vHN2+f4e2xLZEu7Z4NVsyliC4Pqqgrw
	jnp+X/rFoy8qV0Or4Q+pjjJ/5C2nfKr1rpmnNkpT5nN8/ynE0NH4cbWuw8ENOs1lOnNP+74OIGf
	uKpIm5bF/0pL/zvcl+V39j8oB4k535urPTUq4HGySl5YQwEHIk1QfpzVEibp2hNCOsLO8vz1qXu
	8DHquTwkgK9c18F6HDX/EjLOOkmunAayBT8=
X-Google-Smtp-Source: AGHT+IHwI5cKlITEuvHoxWotbl/oD4lwkuyNc0Nf5vlWvONT4nmv028Yq1PPc9a1UUk42jHJT6/8nQ==
X-Received: by 2002:a05:600c:3b1a:b0:434:a968:89b5 with SMTP id 5b1f17b1804b1-434a9dc35f7mr99590645e9.9.1732867973580;
        Fri, 29 Nov 2024 00:12:53 -0800 (PST)
Message-ID: <1d1684b2-ed0e-47cb-ab78-72cd2f51aafc@suse.com>
Date: Fri, 29 Nov 2024 09:12:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] xen: arm64: remove -mgeneral-regs-only for vfp.c
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20241129014850.2852844-1-volodymyr_babchuk@epam.com>
 <20241129014850.2852844-6-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20241129014850.2852844-6-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.11.2024 02:49, Volodymyr Babchuk wrote:
> vfp.c actually accesses VFP registers, so it can't be built with
> -mgeneral-regs-only flag when using clang, as clang will complain
> about this:
> 
> arch/arm/arm64/vfp.c:9:18: error: instruction requires: fp-armv8
>     9 |     asm volatile("stp q0, q1, [%1, #16 * 0]\n\t"
>       |

Imo this needs addressing by inserting appropriate .arch_extension directives
in the asm(), to limit the scope of where VFP registers can be used to _just_
where we want them used.

> --- a/xen/arch/arm/arm64/Makefile
> +++ b/xen/arch/arm/arm64/Makefile
> @@ -18,3 +18,5 @@ obj-$(CONFIG_ARM64_SVE) += sve.o sve-asm.o
>  obj-y += traps.o
>  obj-y += vfp.o
>  obj-y += vsysreg.o
> +
> +$(obj)/vfp.o: CFLAGS_REMOVE += -mgeneral-regs-only

This, after all, allows the compiler to also use them behind our backs.

Jan

