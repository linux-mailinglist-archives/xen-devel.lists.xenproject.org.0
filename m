Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E88E992B05E
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 08:40:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755871.1164375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR4Wc-00051q-Hp; Tue, 09 Jul 2024 06:40:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755871.1164375; Tue, 09 Jul 2024 06:40:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR4Wc-0004yf-Ev; Tue, 09 Jul 2024 06:40:30 +0000
Received: by outflank-mailman (input) for mailman id 755871;
 Tue, 09 Jul 2024 06:40:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uARp=OJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sR4Wa-0004yT-W8
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 06:40:29 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 203e6be2-3dbe-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 08:40:26 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ee91d9cb71so44759251fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 23:40:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c99a92a430sm9380919a91.4.2024.07.08.23.40.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 23:40:25 -0700 (PDT)
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
X-Inumbo-ID: 203e6be2-3dbe-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720507226; x=1721112026; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7GHixLYQ2ebze7nShu37lQqC/dPJuIAaOjuzoELZjBI=;
        b=IYZW+VsCmwpFGOWvbKr+7TexhLPZbD+70Va4HbwLupyAQadQqqX2hHwhvPaIBZ7Vfr
         kcl9YgilsAqZtcYnZUfqxbZvVbbL33Owrv2FPRhgoqOF+mMOsGDcg0QhH92ckX+iViyI
         AWmSKvHJMVKmLNm8B9zRGfz7WQRVop15AUnr05N7NvKX13LPAmZekjSwIBRs8ld+UmmD
         qdiHBGDAJsej+tgnSJ89Qt7twxPNK5fM9L1y5Nq1SzY7Io1EOJLpMQdsr+L19/DzbVNL
         K5+ya+g9ikV8qr09+Zvw156ljgPiLd7B3TGrEGfwaOzpCseNJI2FTCREn5hqiNG0TvSy
         LesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720507226; x=1721112026;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GHixLYQ2ebze7nShu37lQqC/dPJuIAaOjuzoELZjBI=;
        b=TPm1jFmEchWVQFaBvLY05JqQxvboxPHVPnao1WtR+o+d7Tdzp2waHhoN/u3vAngX1c
         IEMjqt2fgga+U8XesoinYsA3LjKCKPijJ8U0NF/XcaeMlep2Z8b4lsgb/7NeuiXDgnex
         pZ1r9H049CWsSRGKSz9uExPWys92h4C9aigKuSQ/JaXam6I/hhtpYhgPAx+YFQLRM9oh
         gENAgw/MGzr72k5y20vkKkq6HQHERO1aPVe45IP0WrMJxvx+DKLYQbw8PC6CzGrXMTue
         XcrHrbK8BNSVx1cIpbZKR96HjRWR5OsbiDowLj6gFBBcUvBuDzAoKNmbkLORibrucPf5
         /CTA==
X-Forwarded-Encrypted: i=1; AJvYcCWgnDME9Ppzr0yxPOV/ypYN+fMwlBWbN3hb6f3nEJ4w62Mw1J5ROkKzXXhGS6oO7i2fHBv1qzTSRBXM44izW0L90gyKq2EfHXg6UlUDWMM=
X-Gm-Message-State: AOJu0YxZUgZrz088tPjcErBE3ExWF1w7Q9SkDXPhnakLZfttBMMhAhM0
	zEW4UsFeEl/ePE3HV6hG/wFj93YKRlfY0FYU1OMi6J/io0/Qr9lIE8j+B4OCFQ==
X-Google-Smtp-Source: AGHT+IEOec8ZrfQ+RmQE/NvvJ1AmbK9Q7mm4TcXeb4XxqFJy+95b8cN+ny5Rqn6KWlcaOzYbVuG5iA==
X-Received: by 2002:a2e:9ed4:0:b0:2ec:5759:bf2f with SMTP id 38308e7fff4ca-2eeb30bc32emr10645091fa.7.1720507226019;
        Mon, 08 Jul 2024 23:40:26 -0700 (PDT)
Message-ID: <103d60b6-001b-43f0-bbff-a0806cebda73@suse.com>
Date: Tue, 9 Jul 2024 08:40:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH] x86/cpuid: Expose max_vcpus field in HVM
 hypervisor leaf
To: Matthew Barnes <matthew.barnes@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <c0a9f52107e22957daaa5b1b0e05e4160db5f064.1720452354.git.matthew.barnes@cloud.com>
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
In-Reply-To: <c0a9f52107e22957daaa5b1b0e05e4160db5f064.1720452354.git.matthew.barnes@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.07.2024 17:42, Matthew Barnes wrote:
> Currently, OVMF is hard-coded to set up a maximum of 64 vCPUs on
> startup.
> 
> There are efforts to support a maximum of 128 vCPUs, which would involve
> bumping the OVMF constant from 64 to 128.
> 
> However, it would be more future-proof for OVMF to access the maximum
> number of vCPUs for a domain and set itself up appropriately at
> run-time.
> 
> For OVMF to access the maximum vCPU count, Xen will have to expose this
> property via cpuid.

Why "have to"? The information is available from xenstore, isn't it?

> This patch exposes the max_vcpus field via cpuid on the HVM hypervisor
> leaf in edx.

If exposing via CPUID, why only for HVM?

> --- a/xen/include/public/arch-x86/cpuid.h
> +++ b/xen/include/public/arch-x86/cpuid.h
> @@ -87,6 +87,7 @@
>   * Sub-leaf 0: EAX: Features
>   * Sub-leaf 0: EBX: vcpu id (iff EAX has XEN_HVM_CPUID_VCPU_ID_PRESENT flag)
>   * Sub-leaf 0: ECX: domain id (iff EAX has XEN_HVM_CPUID_DOMID_PRESENT flag)
> + * Sub-leaf 0: EDX: max vcpus (iff EAX has XEN_HVM_CPUID_MAX_VCPUS_PRESENT flag)
>   */

Unlike EBX and ECX, the proposed value for EDX cannot be zero. I'm therefore
not entirely convinced that we need a qualifying flag. Things would be
different if the field was "highest possible vCPU ID", which certainly would
be the better approach if the field wasn't occupying the entire register.
Even with it being 32 bits, I'd still suggest switching its meaning this way.

Jan

