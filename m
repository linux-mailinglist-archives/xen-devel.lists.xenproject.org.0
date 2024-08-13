Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEC694FF15
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 09:50:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776030.1186185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdmIS-0005ft-LJ; Tue, 13 Aug 2024 07:50:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776030.1186185; Tue, 13 Aug 2024 07:50:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdmIS-0005dD-Hx; Tue, 13 Aug 2024 07:50:24 +0000
Received: by outflank-mailman (input) for mailman id 776030;
 Tue, 13 Aug 2024 07:50:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wdkt=PM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sdmIR-0005d7-58
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 07:50:23 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0eed6cd-5948-11ef-8776-851b0ebba9a2;
 Tue, 13 Aug 2024 09:50:21 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a7a975fb47eso53349766b.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 00:50:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f3f4d20dsm46422766b.7.2024.08.13.00.50.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 00:50:20 -0700 (PDT)
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
X-Inumbo-ID: b0eed6cd-5948-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723535421; x=1724140221; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iU16W9vrjcNSJGiegNTNZzPvUXM7To+t+VTlQLrW9mU=;
        b=ZcB3VC/ZD6pL2MBo491/jOS9WEtiUIeprYWynM+9sfzH89wxPeOLpEJgxlFbZ663pj
         H8UPC2LQv8CIIpa9uxO1A6Ps51+LEQ5//u5ysvVVmD3jtQCgEdy0L4cIBVcHd5CJ/6tx
         TPGz5DCu1E29DS+zQ9ddDBH4svFE6YA5NDv2qZR4kK6OT2b6cloqgwJPWKpjnBk/LWHz
         CBW3av3gimJXjZHAYQj9ODLfZc/D8f8kUsusPLg5s2wP7So8wIO6amADIyuCdpsMcT/b
         lT97J4T8Mq4IfQEWbUMMs6gWFen0l3l3I8FxyW4nWaTZbltfHm7gX9saLTRiSKzV4fOR
         LJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723535421; x=1724140221;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iU16W9vrjcNSJGiegNTNZzPvUXM7To+t+VTlQLrW9mU=;
        b=bsBE5fYEubzayHtWPiWbDbW51meJL/yTajofpI+KTsNqDhibgRq2INGKis/OEv7K/Q
         vaMbqhUACVcTN7Kni8q6HVuAduS4UfWLhOh/TD4+TAyVe4pYAs09b0aYYr2Dpi0r0D6q
         h/lMFKsRAnS1QvAQmVuwOeyWPLDFfLkssloBeblAAxWk0y/hV2ZWPnTSweDe+UtIia28
         +ZdA7e6Lh9NRWcIfl9Gc7hpwU+4ThfRQ8NH4iL35uI+jrQrjKhdjDBRONQEFVw8sZ9lW
         sjVrx3dc4tqwPDap+uhuZc2kWCc73KUB/iZVm7rMHOmtC1uS5QkiLti0vQxsEtAaMn+r
         ZHvA==
X-Forwarded-Encrypted: i=1; AJvYcCVuK0gcusXQAXMHgWxkPp8gRPNgDIIfsAme2Vy6lEn8nY72675eO7GqeZHBMGQbyZaWneGgQAsSoeY48XlhAzbm+l3gdFa9KwbpVd1k8i8=
X-Gm-Message-State: AOJu0Yw5V5+lHuApCvwr30BKgqk0KbyLQIaF6gjig61/5QJaaL3aRrVt
	EZgf0ye9v33elX187YxaZkh531QFqYMfqkCb+w5KW+aLr4Tlpaffc47ta3VWdw==
X-Google-Smtp-Source: AGHT+IGvCAgRnWyZF4QJnS+ktMfHnZIMGIjjnPqFA2h7vfrG/ZtJLLTdsfk5Rklatab0Yy0Ecp5KNA==
X-Received: by 2002:a17:907:2d8f:b0:a80:f7db:3e7 with SMTP id a640c23a62f3a-a80f7db06e0mr70556166b.5.1723535420538;
        Tue, 13 Aug 2024 00:50:20 -0700 (PDT)
Message-ID: <abdac4dc-b8e4-46ad-bd4b-c39caa868a9f@suse.com>
Date: Tue, 13 Aug 2024 09:50:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 2/2] x86/amd: optional build of amd.c
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1723196909.git.Sergiy_Kibrik@epam.com>
 <5632b05e993cca78a58b800dd37165ccd80b944f.1723196909.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <5632b05e993cca78a58b800dd37165ccd80b944f.1723196909.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.08.2024 12:11, Sergiy Kibrik wrote:
> --- a/xen/arch/x86/include/asm/amd.h
> +++ b/xen/arch/x86/include/asm/amd.h
> @@ -158,13 +158,21 @@
>  #define is_zen4_uarch()   boot_cpu_has(X86_FEATURE_AUTO_IBRS)
>  
>  struct cpuinfo_x86;
> +#ifdef CONFIG_AMD
>  int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, int osvw_id, ...);
> +#else
> +static inline int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, int osvw_id, ...)

Nit: Too long line.

> +{
> +    return false;

I wouldn't mind if you consistently changed the function to return
bool, but as long as it returns int I don't think it should be returning
false.

> @@ -173,5 +181,19 @@ extern bool amd_virt_spec_ctrl;
>  bool amd_setup_legacy_ssbd(void);
>  void amd_set_legacy_ssbd(bool enable);
>  void amd_set_cpuid_user_dis(bool enable);
> +#else
> +static inline void amd_set_cpuid_user_dis(bool enable) {}
> +static inline void amd_set_legacy_ssbd(bool enable) {}
> +static inline bool amd_setup_legacy_ssbd(void)
> +{
> +    return false;
> +}

Nit: Would be a little nicer if these were in the same order as their
corresponding declarations. However, along the lines of one of my
comments on the Intel counterpart patch ...

> +#define amd_acpi_c1e_quirk (false)
> +#define amd_virt_spec_ctrl (false)
> +#define amd_legacy_ssbd (false)
> +
> +static inline void amd_check_disable_c1e(unsigned int port, u8 value) {}
> +#endif

... question overall is how many of these stubs are really required,
once clearly AMD-only code is properly taken care of (perhaps not just
in spec_ctrl.c).

Jan

