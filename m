Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C94BBAFECD8
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 16:58:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1038355.1410838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZWFC-0002X8-NM; Wed, 09 Jul 2025 14:57:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1038355.1410838; Wed, 09 Jul 2025 14:57:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZWFC-0002UG-KW; Wed, 09 Jul 2025 14:57:58 +0000
Received: by outflank-mailman (input) for mailman id 1038355;
 Wed, 09 Jul 2025 14:57:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6dDj=ZW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZWFB-0002UA-5U
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 14:57:57 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18529a9a-5cd5-11f0-a317-13f23c93f187;
 Wed, 09 Jul 2025 16:57:55 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a57c8e247cso24001f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Jul 2025 07:57:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce359ead0sm15273240b3a.8.2025.07.09.07.57.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jul 2025 07:57:54 -0700 (PDT)
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
X-Inumbo-ID: 18529a9a-5cd5-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752073075; x=1752677875; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dgXpC0fz31pZlMAKDUf5oUsOwZrmg3ja4UihDMTnO0s=;
        b=FiKMrMDRx7NrjNXSTurn5bZ5x9t+84olpQj4JJHqWyGzA8ktmz+YkrQLTNh1nNp+/1
         0T+bsC43yC6saJswHj45VvAfJhytWnhTRRUiDEYvnKLv5OaaY2YqOJ/MtJMjGFYjsNKb
         mSWetAH+ql5VDHuYFE2QrKuv46bllIDsIcEvUqUbuJRnKxnWrxzq02KbGNnyxDm/XwEP
         vd/16ZZlkTBXcGfl24ZoEP9UUmjGec6BAK8D87v2fO7VHOLNmcZMoT/cqduL+HEuPU0E
         JOl8dtQnuDP5Mp+DdAoPzVVufROjR8fO1248ABngXYi12+m/NT6xYBltK87SQJNIwL46
         w8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752073075; x=1752677875;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgXpC0fz31pZlMAKDUf5oUsOwZrmg3ja4UihDMTnO0s=;
        b=CY7Oc4gGPRhoq/L6MP32X4kiNHsh/2/E1cLXjYpYkjHNW9R99HcbWugfTD5pJM3/K9
         wxnQkAmrOh3ipKdlOmCC8LUe7L//V6kL4a7jOP3poU8ovglXTI+zFB1WLTok4RDx3IEe
         hkJMNcRbiu3c7+BigcuQUFOOPt+S0PrBG6zlI0hJ7bnasz+luv6UlQshnnmNasf4w+kD
         0TKTINeHTUeXHep4xDBkxYMWcoyF3SBdwPhZLxYu3ipuMDa++jFkuPgnyffOoCNBsjPo
         x+xXdTcEPaMSj3a0Pab1VzK49wcrWU5CL3ENTmrkhn2ach+KltDxsx4zIXpWS5apQfPx
         WOtg==
X-Forwarded-Encrypted: i=1; AJvYcCWLXYstw6UfqBk0E1U3no2U+yaTEOuBJP9VJlojzeSCEIniPTc3l5GDWIK11N86dH8kZnWl8liTV0Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzakhN71IfCz36dSa28LXKYsZE+FPmNYTlkErhOwOlQSuWgrjmU
	tpXtHwytedtjcCam74ZdI1gxGEAeblgpSArJ/y5OS7W1n932e8Y0JS3efr/3fwhMnw==
X-Gm-Gg: ASbGncscb7v3x7qSqrivAa0LqnoIp99fC6BoQaIaq1F2ROcTyNlDeB5+kQHDDD5cakZ
	fCNtqTTQ6TC4AsDdKuw0MSBY0zBDas3jI4GlCO2m3mOLa9lMdcuiJKtl3zAfr1YzW2OCxUu+4dQ
	Q0bzGvBS6U1YRhkKPWqw9v5L8dngQh84ndBeuOUFBUmznILw8czEpMJO8qJxUHe4DIfSXtCxH/j
	FZ7e1o1XL7a3efqRIKgeIhXnab1QhW0yb87RqrQ5Zz4104Na240NCCbj8EJ6NCzmwgmi+y5LzY3
	HrRkvLnleo0ijrgkxup3BWL9tt2ff5j19QbPMQLdnfq6/XwGsqME40gb2MhPZSmhUviKg7rlpFg
	OnJUn2ZGFGn6IpQnim7hqgikPfhNY+X9i7IxGOvNdH62ftvI=
X-Google-Smtp-Source: AGHT+IGoAB0GSf57B0XKICfrauphZAR/BS6cIGtmEXBPj59VuWcMELFKJyntVUfqd9tFApr8jq6YYw==
X-Received: by 2002:a05:6000:471d:b0:3a5:2694:d75f with SMTP id ffacd0b85a97d-3b5e4574640mr2314010f8f.52.1752073074956;
        Wed, 09 Jul 2025 07:57:54 -0700 (PDT)
Message-ID: <33f98fe5-9b29-43e4-a87d-19eafb30f281@suse.com>
Date: Wed, 9 Jul 2025 16:57:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/16] xen/domain: introduce domain-emu.h
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com,
 sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250624035443.344099-1-dmukhin@ford.com>
 <20250624035443.344099-13-dmukhin@ford.com>
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
In-Reply-To: <20250624035443.344099-13-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2025 05:56, dmkhn@proton.me wrote:
> @@ -458,16 +459,16 @@ struct arch_domain
>  } __cacheline_aligned;
>  
>  #ifdef CONFIG_HVM
> -#define X86_EMU_LAPIC    XEN_X86_EMU_LAPIC
> -#define X86_EMU_HPET     XEN_X86_EMU_HPET
> -#define X86_EMU_PM       XEN_X86_EMU_PM
> -#define X86_EMU_RTC      XEN_X86_EMU_RTC
> -#define X86_EMU_IOAPIC   XEN_X86_EMU_IOAPIC
> -#define X86_EMU_PIC      XEN_X86_EMU_PIC
> -#define X86_EMU_VGA      XEN_X86_EMU_VGA
> -#define X86_EMU_IOMMU    XEN_X86_EMU_IOMMU
> -#define X86_EMU_USE_PIRQ XEN_X86_EMU_USE_PIRQ
> -#define X86_EMU_VPCI     XEN_X86_EMU_VPCI

The old code deliberately used values from the public interface.

> --- /dev/null
> +++ b/xen/include/xen/domain-emu.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef XEN_DOMAIN_EMU_H
> +#define XEN_DOMAIN_EMU_H
> +
> +/*
> + * Domain emulation flags.
> + */
> +#define DOMAIN_EMU_LAPIC            (1U << 0)
> +#define DOMAIN_EMU_HPET             (1U << 1)
> +#define DOMAIN_EMU_PM               (1U << 2)
> +#define DOMAIN_EMU_RTC              (1U << 3)
> +#define DOMAIN_EMU_IOAPIC           (1U << 4)
> +#define DOMAIN_EMU_PIC              (1U << 5)
> +#define DOMAIN_EMU_VGA              (1U << 6)
> +#define DOMAIN_EMU_IOMMU            (1U << 7)
> +#define DOMAIN_EMU_PIT              (1U << 8)
> +#define DOMAIN_EMU_PIRQ             (1U << 9)
> +#define DOMAIN_EMU_PCI              (1U << 10)

There's nothing in the new code making sure that the values won't go out
of sync.

Jan

