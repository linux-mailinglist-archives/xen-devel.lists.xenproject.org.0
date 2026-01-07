Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E974CFEAAF
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 16:48:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196836.1514559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdVlD-0001AV-1G; Wed, 07 Jan 2026 15:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196836.1514559; Wed, 07 Jan 2026 15:47:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdVlC-000196-Uf; Wed, 07 Jan 2026 15:47:46 +0000
Received: by outflank-mailman (input) for mailman id 1196836;
 Wed, 07 Jan 2026 15:47:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vdVlB-000190-2i
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 15:47:45 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33fd0a98-ebe0-11f0-9ccf-f158ae23cfc8;
 Wed, 07 Jan 2026 16:47:42 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47a8195e515so16113735e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Jan 2026 07:47:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8718b995sm14155115e9.14.2026.01.07.07.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jan 2026 07:47:41 -0800 (PST)
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
X-Inumbo-ID: 33fd0a98-ebe0-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767800862; x=1768405662; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3A9oX7xvZs1/5egiBWUN+lMzAFvp/lccgPfVOyuW6oU=;
        b=G55EyZi6MpYFGdXGVV6Zl5GXnA4WAopT7JXqg/3/pe1hLO0i9c0BC2OjebZ+fsevQV
         WnL1scu2DvMeBTBItuJRRI41M6GDiskjcokhWihbdRgguZqp9thWjRq0zXHiwFe8iBJL
         xpVJj3ig/EGdQM2RnZYodisDV/WEKXieGI/ylzwef8doqKVWqNYragUPVkVg27+Xuep8
         U4my9P3NwuN8jzs80Cw9RdTZ5yH/77gyg/nzwX4HAwtUqBkZlHGOc5Z0iTPHt3S9pW2q
         IXoGhR8W2Eumq6xtn1MaqhWIW7laL2NIQtBTJ+vNxkzjYZNYrrfmUXW4hMQ7FILcZa0F
         fXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767800862; x=1768405662;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3A9oX7xvZs1/5egiBWUN+lMzAFvp/lccgPfVOyuW6oU=;
        b=G9k2T1qWFcJct6HbKoSnitj5bV12JZ/+O/3HLEBD76K8fxEuEwKOQKP/te+83cyy3s
         aTlQoI/25YTCFqyA0GVAGJ8WInrHsrzRC8dUhAhSCkoPPxjZPt3DcjR5h/H7oPxX/7Sw
         mZ9u+fUZmIJA/Y7Fkd/wK6Nw6s9co/C9WVIVenf45rzzkaN4yXGl4TDl2VL9jsya0ohr
         HxAq3RRbYzLhEkXJUZbNuiZlivBmsQ0g19ZMOktVP2SMRCEkMPYryOAXSV5HxI0ecw6l
         mrPds5KZErcCNPG9mLnrfuZrhVJWpNA/ey1pfdJmxl4kXsrziA9hb4YHq3n/k25gPiH0
         FrlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKsoZFXc0eua7u/OpY3jvQehpJajHQYI8mwyCPWObpq7ObvTFyNYRvY2QO3xGTyTKtFRsNXujtK58=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzeBLvMkqURrp68L3D0vzjBX5dLrb+OopQw9mgKtfaUzyWyeEmP
	/U7+2d1+qF0o4/lmIIHQjzk945/vL65tq+pUcKaHbOROsEwLr6tpEhzv2UJ4kzg/5Q==
X-Gm-Gg: AY/fxX64lqyVXvIJpzbHh9qpBcRZE2Tr08VAVX93EMuozaoZYGn2CyzhLF3baOMkcsF
	0wq1czxKiOjCnlmsDeOHNUHFPbnVRrGLIqBVQ6irw723L5jdJcur9N4Zs3jYSg7xXy6GOD7UCpr
	8Xtv4t6vLNWAPU/egfchzrfI8Q+puH1S6aQ8DOfi7/8KfKCPjwJg0WcCy5+LFgZPGCaBLFE0ZuJ
	gwOUkznFvqO4xndHHgBNaI/UXNvKZXcHBOWIGUncdooMh6earR6aiW70IlzE931SvSEZg30rYiM
	ECz/1cf1a3dJ5cCUDpPBBQt5eASxmQdf80Zz+6CqVBUwdKKiHxmeRMxa4UmOcHpEsMPvntsBq3m
	PbBxMVBSzGYRijRMS+fqARAvVOEoVqXmICTZOXoqnSwHqmiXbqQ5IwnO1eCpAMwXWGrzNtg/ohs
	GQn2B0nHv2/4mmIymJY5CztH63YsBzYuvlfyB5k7wZkpYtI8sC/7E3Pd2Cxl7M/Bc3Wj+xAWMk7
	FQ=
X-Google-Smtp-Source: AGHT+IHfNuA5FeogYnNUcOKfryrmVdX9DkFD4C2MflnlyxxceUPL7ojhwBYKUm4m6A3lmkm7Bjd9SA==
X-Received: by 2002:a05:600c:1392:b0:46e:4586:57e4 with SMTP id 5b1f17b1804b1-47d84b32ef1mr39116275e9.24.1767800862098;
        Wed, 07 Jan 2026 07:47:42 -0800 (PST)
Message-ID: <319e6162-7a5b-4030-ae9f-a86a48e73605@suse.com>
Date: Wed, 7 Jan 2026 16:47:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/15] xen/riscv: implement stub for
 smp_send_event_check_mask()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <837c863f5995cc4371e82b481211b053656ec7e7.1766595589.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <837c863f5995cc4371e82b481211b053656ec7e7.1766595589.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.12.2025 18:03, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/smp.c
> +++ b/xen/arch/riscv/smp.c
> @@ -1,3 +1,4 @@
> +#include <xen/cpumask.h>
>  #include <xen/smp.h>
>  
>  /*
> @@ -13,3 +14,10 @@
>  struct pcpu_info pcpu_info[NR_CPUS] = { [0 ... NR_CPUS - 1] = {
>      .processor_id = NR_CPUS,
>  }};
> +
> +void smp_send_event_check_mask(const cpumask_t *mask)
> +{
> +#if CONFIG_NR_CPUS > 1
> +# error "smp_send_event_check_mask() unimplemented"
> +#endif
> +}

CONFIG_NR_CPUS is 64 by default for 64-bit arch-es, from all I can tell, also
for RISC-V. And there's no "override" in riscv64_defconfig. How is the above
going to work in CI? Then again I must be overlooking something, as the config
used in CI has CONFIG_NR_CPUS=1. Just that I can't tell why that is.

And no, I'm not meaning to ask that you override NR_CPUS (and wherever such an
override would live, I think it would better be dropped rather sooner than
later). Instead an option may be this:

void smp_send_event_check_mask(const cpumask_t *mask)
{
#if CONFIG_NR_CPUS > 1
    BUG_ON(!cpumask_subset(mask, cpumask_of(0)));
#endif
}

(I can't tell off the top of my head whether an empty mask may be passed to this
function. If not, cpumask_equal() could be used as well.)

Of course the #if may then not be necessary at all, and a TODO comment may want
putting there instead.

Jan

