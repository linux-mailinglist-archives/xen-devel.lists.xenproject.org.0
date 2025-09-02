Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C840B40953
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 17:43:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107020.1457590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utTAP-0003oh-Sx; Tue, 02 Sep 2025 15:43:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107020.1457590; Tue, 02 Sep 2025 15:43:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utTAP-0003lq-Pr; Tue, 02 Sep 2025 15:43:29 +0000
Received: by outflank-mailman (input) for mailman id 1107020;
 Tue, 02 Sep 2025 15:43:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0Jg=3N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1utTAO-0003kW-G7
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 15:43:28 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90639adf-8813-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 17:43:25 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-afcb78ead12so908090666b.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 08:43:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff032125e2sm1109337966b.77.2025.09.02.08.43.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 08:43:24 -0700 (PDT)
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
X-Inumbo-ID: 90639adf-8813-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756827805; x=1757432605; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s27sYcfBo5BedRsyoGQGSf1YPSKtWJMTiIniCWlPGGY=;
        b=C/b9lL+EH4uK0OFc5j7JqESxucXVTCu7jJ1iznTiMTO9XPERn2xBMqyc2PuL0w8a2m
         r12xr+TdPiCTuJt+7eRtIClhxD/iS/D3qC5/MjRHiMKhRdzg+WdmX9tTEosnuuU1AA6o
         aGKLYbN9ykKdp85rTGuS+/BG6N64BE2ngXv60AqZvKXiwa4JPcCetne9WU4eVGchtZsi
         BbyUb9wirNEIpxbdnReW22SzdgLuNtYM1VCKi+T+VMYubQe5Q/0otoCCVmkNEgVLjsLQ
         /Cd9v1k1PkR1budypjWMpEw4MzRMx8uku8F73IrNrYkVi2hje62CAkM9kQVSR9dNYZCW
         BomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756827805; x=1757432605;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s27sYcfBo5BedRsyoGQGSf1YPSKtWJMTiIniCWlPGGY=;
        b=N9wOi+tkq79FGxWuyJuzGJEqS1209UvxtpdOfQYZmpMCRuMGxPz7Nnvs4j3DWsoSpF
         /+13/h4gV6TIFhY3UacGHSRXSwfSVeYkuc+HsW/KC7deRBxAzHl7Vz5jeZaOn0L8j+Ql
         S0kQUZRo6pAFtj5tVwmjCqXqGlp+wuREYlCIoqUv9W6CFTjNvvGRvEpEA6g6q8IwJPUO
         LnrAJEmGJsVCZMuB6wjXnwZBOeUjUEL/S2bUrfVUrgBlFYq/07I8zgxJXrH655R7KVda
         kvfxPqN69fC/CLRRpieZSI5Oyo1drjKRoQn5iwHJ6rOVygf0X3GKKg60HPVnqf8QZoLg
         dRnA==
X-Forwarded-Encrypted: i=1; AJvYcCU4GiELvn2WTejblpQtf6t1u1BHpPO7LdwLcm+eY6x4Ml8TH8AmOYUpf3gwFoDTjqhMGlWN7naK+70=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZ2CTf87hIPOAGoqnfmOPFlHoNkHRiZRKLchGjQf+XUW/CyXIr
	QDPhtzGT0aeZgokE4jDZgQ5OXllC3y2zezIklsXDjflWVk8kUQ8sQfJ+ZZRFqLX+ow==
X-Gm-Gg: ASbGncvk/Fu58o6w0AxRdIMqjhrkDcnqAq9pu1jognESnJhvBX3ON8bSVzlSo3vc9f6
	Yu+VKFxKpFrJ84k1WY61J7odr7+sIgWEMq9ezrkjJEWhcAKZyxL4eQz0KtEM8neADMNj0/h7PWE
	Fu261xzlTmNMG9y/F6anOvpfzKDT6VRyUNGWda3klmA2WSoAeJ2B8ZjwEzcaE03V5OoqsS874hm
	6uzX1cqpozTGTpvqzVnLflTcNMpeko0xH3Me/fUueiAdpOUpokWAmQnSYI//jbpUZAIAmlElZ91
	UsZfM/GymUMG1HtS6KKU7K4s/R36x2mQkxXXXDOKF2ZJZbCpLvVlxjQjXWueFhpAXDLgRGCZZLg
	es+HaJgAlsesdtu2C9fzzPCgDzSDD7cg5mZkRFNfydiSbnQI5E9lsPeY+MBmpnfWQxX986QRWjA
	6CnjjSxUc=
X-Google-Smtp-Source: AGHT+IGAGzP55INN6cbP87P1zEYMrcsF/s7z7vfo8PiifqpoLeyrXfsAOg8lIVV2TgH3ciDcNbsHhQ==
X-Received: by 2002:a17:907:3e84:b0:afe:b818:a6bc with SMTP id a640c23a62f3a-b01f20ca2a4mr1150556666b.56.1756827805219;
        Tue, 02 Sep 2025 08:43:25 -0700 (PDT)
Message-ID: <28e78684-ff7b-4902-89cd-c341ba236d57@suse.com>
Date: Tue, 2 Sep 2025 17:43:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
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
References: <cover.1756803419.git.mykola_kvach@epam.com>
 <53cc6a9cf7a73d12c632bf8b8eee2f7069e6b0f1.1756803419.git.mykola_kvach@epam.com>
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
In-Reply-To: <53cc6a9cf7a73d12c632bf8b8eee2f7069e6b0f1.1756803419.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.09.2025 11:03, Mykola Kvach wrote:
> ---
>  xen/arch/arm/domain.c                 |  37 ++++++++
>  xen/arch/arm/include/asm/domain.h     |   6 ++
>  xen/arch/arm/include/asm/perfc_defn.h |   1 +
>  xen/arch/arm/include/asm/psci.h       |   2 +
>  xen/arch/arm/include/asm/suspend.h    |  18 ++++
>  xen/arch/arm/include/asm/vpsci.h      |   5 +-
>  xen/arch/arm/vpsci.c                  | 116 +++++++++++++++++++++-----
>  xen/common/domain.c                   |   9 ++
>  xen/include/xen/domain.h              |  11 +++
>  9 files changed, 183 insertions(+), 22 deletions(-)
>  create mode 100644 xen/arch/arm/include/asm/suspend.h

Note, btw, how this way you won't need x86, ppc, and riscv acks.

> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -8,6 +8,10 @@
>  
>  #include <public/xen.h>
>  
> +#if __has_include(<asm/suspend.h>)
> +#include <asm/suspend.h>
> +#endif
> +
>  struct guest_area {
>      struct page_info *pg;
>      void *map;
> @@ -109,6 +113,13 @@ int arch_domain_soft_reset(struct domain *d);
>  
>  void arch_domain_creation_finished(struct domain *d);
>  
> +#if !__has_include(<asm/suspend.h>)
> +static inline int arch_domain_resume(struct domain *d)
> +{
> +    return 0;
> +}
> +#endif /* !__has_include(<asm/suspend.h>) */
> +
>  void arch_p2m_set_access_required(struct domain *d, bool access_required);
>  
>  int arch_set_info_guest(struct vcpu *v, vcpu_guest_context_u c);

Imo it would be preferable to have such in a single #if/#else. There's nothing
wrong with an #include not sitting at the very top.

(Another question is whether to put this in xen/domain.h at all. There could
be a xen/suspend.h having - for now at least - just this and nothing else.)

Jan

