Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC69B0DFB3
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 16:56:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052804.1421588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueEQ6-0004GM-Qp; Tue, 22 Jul 2025 14:56:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052804.1421588; Tue, 22 Jul 2025 14:56:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueEQ6-0004EP-ND; Tue, 22 Jul 2025 14:56:42 +0000
Received: by outflank-mailman (input) for mailman id 1052804;
 Tue, 22 Jul 2025 14:56:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueEQ4-0004EJ-PL
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 14:56:40 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10a099b0-670c-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 16:56:36 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a575a988f9so3396917f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 07:56:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23f8c0026fasm16553795ad.66.2025.07.22.07.56.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 07:56:35 -0700 (PDT)
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
X-Inumbo-ID: 10a099b0-670c-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753196196; x=1753800996; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=legUo6ni8It0YpU8vMhmybwjX0pgtsEaYfz4IKrW8Jw=;
        b=Igk9FzJNx5uZKM4ZV2wIyzvP2X/twMHqFcrd2WBh1A0L0WzmJO8DNVfNl+tAxdshVu
         q3uGjVM38s3ZPQ3n9oXYN0BdnwhClpNeWLqw/lZZtx22En4alxdb2qAQW/tlukN8kfuH
         JcHvT/IjMNaZHHknRoKMe++H4WSBsENF4bYJUuweGB5tFFMs5ipQQGWIHoTpRhhPApdF
         3Y8pTdxd6eASco2MODtWRALeJAvRRZjri6lTniHecWE9GdS9CQwb0c0d3lHPu6ayFpj/
         TnQHOXfcQr24gn5bW6f/ZgsJbDOXBpi9e4fpnqtHhUsgPuhcmvouP2kushyqUnisX03+
         r3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753196196; x=1753800996;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=legUo6ni8It0YpU8vMhmybwjX0pgtsEaYfz4IKrW8Jw=;
        b=QjaICx0LOy3MEQLUBuT22ffLJlOC+tgax22x7eD+zMaDcDog7mz8qEJUpqQqcixNA5
         aG7SMvP4xZUvert3VJT0C1jEfbOB2r3C9X/mEP0fwx+wJCzkyg7reT+Mdl+FTcIvGigx
         7JSrn/H7+9rMMn2dKA5UVyjd/l2eH/P1d4fe+Oa7ZCiiqROionIkDtb7JiMHyrnOI6Es
         eoRMoBR0TU2NjuJsC0+Fu2GpD49VUBRWHYXoGGc1ZhuQuiepI4KSSRqT3ocD4kE+boGA
         aGlAzclLQC9BvirjpIL8c/iyYzweYaoCcqpzOJG0OlPXN6H/1yqO97FUz25WX0WfqOJQ
         jfIg==
X-Forwarded-Encrypted: i=1; AJvYcCVafdJe8C6BitxVYjWl21q3uLmRC9yrsmV5iQtiqgZ0pG8VmbFNSLkk0UmfqHw522AKTxr2gQN832E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIiCIhAD9UYRjZjNlMOKk461uvFH3dBiOuKPrXo55LmBjUwzvq
	KZmu2vd0K5TFxKrbnl01OJLA3qHpoXpFPFQyIoFkSd0n2SEla/pDiMniK1rVHataLg==
X-Gm-Gg: ASbGncvHLBIHpMiumGDz1oNT5ZfTXqXHKIDlce4ZUEIWiHMdD2nDK9IcwdiGYWsS51K
	8tUzQ8q9AGzCpMg2v/4vLUV5+KdIS1zI4PeYHRgGbHMc/tebRb5wcRHaZ849lh2HQHUrmsW4TnA
	844zSFaEGI4o2/Zvk6hEri1eTK3emi4piD0UqEZ/rGlEiCYUHKL/6DZnOgMDfmHmN00LMSk91Qd
	7yQx9K3yJdUAuVpxYDIm2HcBFH2rkiL2l8bleIRlHcRGGRVv8JoG0ptr0W4nXIYTbxy5TSXax9H
	ll0dB95PPaBJKeSxFLADYidnTw58kviRDF84+euXXuuXrOjYOulAFlqosFXrEBiY1jqKFBSdVY3
	jDZSordcsyUgR3rMC0pD+Cp7lkaGRjY8mBaEfHwdFA3z1RDZNZ17K/c9x1HD2AWX3QYcZ+dWgc4
	Uj360gvOA=
X-Google-Smtp-Source: AGHT+IF0469chihYceXMCvkYWKZgv/vsI5gme/FrzXT0FheL2hBRYpej1/LJNlTaTE4tp9FQaWQ2IQ==
X-Received: by 2002:a5d:64cd:0:b0:3a4:f7e6:284b with SMTP id ffacd0b85a97d-3b61b0ec05bmr14360596f8f.10.1753196195766;
        Tue, 22 Jul 2025 07:56:35 -0700 (PDT)
Message-ID: <888b0ca0-4fe0-4457-a614-fb853dec7a98@suse.com>
Date: Tue, 22 Jul 2025 16:56:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/9] x86/altp2m: Remove p2m_altp2m_check stubs from
 unsupported architectures
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1752691429.git.w1benny@gmail.com>
 <3c46e6bd09b2481360fbdf812926d199c5416198.1752691429.git.w1benny@gmail.com>
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
In-Reply-To: <3c46e6bd09b2481360fbdf812926d199c5416198.1752691429.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.07.2025 22:15, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
> 
> The p2m_altp2m_check() stub was previously declared on all architectures,
> even though the altp2m feature is only supported on x86. This patch removes
> the unused stub definitions from ARM, PPC, and RISC-V, and wraps the actual
> usage sites in #ifdef CONFIG_ALTP2M instead.

Hmm, using IS_ENABLED() would certainly be preferred. That would apparently
require ...

> --- a/xen/arch/x86/include/asm/p2m.h
> +++ b/xen/arch/x86/include/asm/p2m.h
> @@ -962,17 +962,16 @@ int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
>  /* Set a specific p2m view visibility */
>  int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int altp2m_idx,
>                                     uint8_t visible);
> -#else /* !CONFIG_HVM */
> -struct p2m_domain *p2m_get_altp2m(struct vcpu *v);
> -#endif /* CONFIG_HVM */
>  
>  #ifdef CONFIG_ALTP2M
>  /* Check to see if vcpu should be switched to a different p2m. */
>  void p2m_altp2m_check(struct vcpu *v, uint16_t idx);

... the declaration to be generally visible (likely also outside of x86).

> --- a/xen/common/vm_event.c
> +++ b/xen/common/vm_event.c
> @@ -430,9 +430,11 @@ static int vm_event_resume(struct domain *d, struct vm_event_domain *ved)
>               */
>              vm_event_toggle_singlestep(d, v, &rsp);
>  
> +#ifdef CONFIG_ALTP2M
>              /* Check for altp2m switch */
>              if ( rsp.flags & VM_EVENT_FLAG_ALTERNATE_P2M )
>                  p2m_altp2m_check(v, rsp.altp2m_idx);
> +#endif

Is (and was) this actually correct? Shouldn't the caller be notified
somehow that its use of VM_EVENT_FLAG_ALTERNATE_P2M had no effect when
ALTP2M=n?

Jan

