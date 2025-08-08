Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEF4B1E25D
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 08:33:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074059.1436765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukGfc-0003sc-Ty; Fri, 08 Aug 2025 06:33:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074059.1436765; Fri, 08 Aug 2025 06:33:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukGfc-0003qZ-R3; Fri, 08 Aug 2025 06:33:40 +0000
Received: by outflank-mailman (input) for mailman id 1074059;
 Fri, 08 Aug 2025 06:33:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=illN=2U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ukGfb-0003qS-EG
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 06:33:39 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9de2c0d9-7421-11f0-a324-13f23c93f187;
 Fri, 08 Aug 2025 08:33:38 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-af9618282a5so350451366b.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 23:33:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af919e96050sm1435296066b.0.2025.08.07.23.33.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 23:33:37 -0700 (PDT)
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
X-Inumbo-ID: 9de2c0d9-7421-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754634817; x=1755239617; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Mgnlu6T6dibGuDZ36cwuOck/YnogbGDvuR1nQdpOTso=;
        b=QjKkFdTWuTTLk6oRHorSEU3C1FRbCJI906SFEOXsrYjBi6Bp4qwPOjXuBVu9ewG3oi
         BwEJ+py8FJMF4xgac+Nc8g9Ws4qiwio+dXN/jZNS+HPi+wRRMw8gC08kbZTP+HjHo3Gq
         cW7fMMHZteUjg3fRJaVw20U2laV4OQAbXK0KQS2WL3Tp9DMwZotwV9fEWCX0pQBJXZww
         tWXi9cyAUBIxy3snMA/XQYtHF/aQPGj3pJcqFNFOJ5ErmY5Sq98+qAUNR9uYYUFBH6+3
         U6FQq4BkuUvaBVZof2nG6xUZ5W6y3j+1UtZwmLeJ3WdVmmn4PNPsk4WrA99PZSP/iuLp
         ys4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754634817; x=1755239617;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mgnlu6T6dibGuDZ36cwuOck/YnogbGDvuR1nQdpOTso=;
        b=WkLlesFUbQeanjl0NWgw+sQpWa1YdOpk9WJNoBFn0r78Om/BHMm4UvKFWebcJnx5N5
         zBrQe2IVRHkSr+PoiE5LuBg6Tv1sk/2L7d3jfhHVpaWHSp3uS9hSF2ebdR0PM/G7Zp2y
         d3wVOGPbnk0upNJVbzAi9N0r+/lP5y38AM8qBW8M9g6lITZt/JlXD4dhA6m5J+RFLac4
         PSbCrAR5uKsKsV6tRKIe5C3PgoXgJ5v9UO/L8ZqzzYOhnVYJqak3PKS0pFRmh6IJkAJf
         7hTE1uAx0PCkLRYpABaNIMFlYuzEo1b01X6oT25DqI/bmWe7eE1EkJrgoy3eYieN7Vcm
         OCtw==
X-Forwarded-Encrypted: i=1; AJvYcCV3tTfecQ4HNIjjNOFFC/30EUIYGy1PgckigufnHBYMoV2O5D7b5BzKvtpFZ6zkPMyitBLfeaPj2yg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8QjxA8zyy0977r+921OUkKbO60gNqmeVDYj+fpTh7mKavWQUt
	0YC+eBd3xJNploigePaPgj00tQiN5u1rPg0BaolCx92s7FAEj789+j+xYfTYSCy/xw==
X-Gm-Gg: ASbGncumZXlY4INlekF7QKLACu9bqkFiNb0TweqHBXPKj4F1L/efevCwpqFoZsEkkK9
	+UXBNko+7GWv9fspR9yDdt922Cxe/m35Q4X9TsVccONjsJD7EXEbqrVDzRshPzxvwLfkgBw39c1
	1tgvLP2oOEQcpfpiC/rKg7HAmEjRtB/fGZ5ecXM8fh30SWfwxfn7zeAyGP0MtAe+pGRak4NNwVV
	uVGHoVXUYiMAsQ86uc8TOdVxBoTIPas8JsbHM74EAdUg8n6xJmqtpKclWXTWCuo6epn5n8H+bbp
	ei08KnFs3GYMKss9/DUiqkLR60qo+4qjE0LpBzRb97Y5M6QdGmJ1MC54X2iWCsJTWqDEvdQhqbj
	ARN6CPh/8Q7D4XM1vFkPUC8JLmsljFwKDggLTHPsaqFzB2B8O3fq5pVw4DMJYmnlDFFZ9dMxogU
	fC7gwRk0E=
X-Google-Smtp-Source: AGHT+IHqTH8yjlMm/py9+saZQJO/izF+hW9c5Wd3C5bG8IpOHt1X5x0TgT8wi1Loe44XVR9/F2fP7w==
X-Received: by 2002:a17:906:4796:b0:af9:1720:425a with SMTP id a640c23a62f3a-af9c65528afmr152590166b.30.1754634817516;
        Thu, 07 Aug 2025 23:33:37 -0700 (PDT)
Message-ID: <f3973f06-8305-4895-97f9-6d52f03d03b3@suse.com>
Date: Fri, 8 Aug 2025 08:33:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1754595198.git.mykola_kvach@epam.com>
 <64cbfa58af7935c47141a2b1c0560e8d63e3d712.1754595198.git.mykola_kvach@epam.com>
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
In-Reply-To: <64cbfa58af7935c47141a2b1c0560e8d63e3d712.1754595198.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.08.2025 21:39, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> This patch adds support for the PSCI SYSTEM_SUSPEND function in the vPSCI
> (virtual PSCI) interface, allowing guests to request suspend via the PSCI
> v1.0 SYSTEM_SUSPEND call (both 32-bit and 64-bit variants).
> 
> The implementation:
> - Adds SYSTEM_SUSPEND function IDs to PSCI definitions
> - Implements trapping and handling of SYSTEM_SUSPEND in vPSCI
> - Allows only non-hardware domains to invoke SYSTEM_SUSPEND; for the
>   hardware domain, PSCI_NOT_SUPPORTED is returned to avoid halting the
>   system in hwdom_shutdown() called from domain_shutdown
> - Ensures all secondary VCPUs of the calling domain are offline before
>   allowing suspend due to PSCI spec
> 
> GIC and virtual timer context must be saved when the domain suspends.
> This is done by moving the respective code in ctxt_switch_from
> before the return that happens if the domain suspended.
> 
> Usage:
> 
> For Linux-based guests, suspend can be initiated with:
>     echo mem > /sys/power/state
> or via:
>     systemctl suspend
> 
> Resuming the guest is performed from control domain using:
>       xl resume <domain>
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

Nothing is being said on why domain_resume_nopause() would be needed. While this
may be entirely obvious to Arm people, the change is done in common code.

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1343,16 +1343,13 @@ int domain_shutdown(struct domain *d, u8 reason)
>      return 0;
>  }
>  
> -void domain_resume(struct domain *d)
> +#ifndef CONFIG_ARM
> +static
> +#endif
> +void domain_resume_nopause(struct domain *d)
>  {
>      struct vcpu *v;
>  
> -    /*
> -     * Some code paths assume that shutdown status does not get reset under
> -     * their feet (e.g., some assertions make this assumption).
> -     */
> -    domain_pause(d);
> -
>      spin_lock(&d->shutdown_lock);
>  
>      d->is_shutting_down = d->is_shut_down = 0;
> @@ -1360,13 +1357,24 @@ void domain_resume(struct domain *d)
>  
>      for_each_vcpu ( d, v )
>      {
> +        clear_bit(_VPF_suspended, &v->pause_flags);

Similarly it's not becoming clear why unconditionally doing this here would
be correct (now and going forward). There are other calls to this function,
after all.

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -814,6 +814,9 @@ void domain_destroy(struct domain *d);
>  int domain_kill(struct domain *d);
>  int domain_shutdown(struct domain *d, u8 reason);
>  void domain_resume(struct domain *d);
> +#ifdef CONFIG_ARM
> +void domain_resume_nopause(struct domain *d);
> +#endif
>  
>  int domain_soft_reset(struct domain *d, bool resuming);
>  
> @@ -1010,6 +1013,9 @@ static inline struct domain *next_domain_in_cpupool(
>  /* VCPU is parked. */
>  #define _VPF_parked          8
>  #define VPF_parked           (1UL<<_VPF_parked)
> +/* VCPU is suspended. */
> +#define _VPF_suspended 9
> +#define VPF_suspended (1UL<<_VPF_suspended)

And then, even if it's "only" style: With how adjacent code is formatted,
how come there's no suitable blank padding here? If anything wants (and
really needs) doing differently from pre-existing code, then to have
blanks around the << as well.

Jan

