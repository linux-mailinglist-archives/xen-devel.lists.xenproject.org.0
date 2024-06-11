Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB84D90340A
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 09:43:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737962.1144494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGw9W-0006r0-8W; Tue, 11 Jun 2024 07:42:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737962.1144494; Tue, 11 Jun 2024 07:42:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGw9W-0006p8-5p; Tue, 11 Jun 2024 07:42:46 +0000
Received: by outflank-mailman (input) for mailman id 737962;
 Tue, 11 Jun 2024 07:42:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBrw=NN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGw9U-0006p0-2d
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 07:42:44 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2efbfffa-27c6-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 09:42:41 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a6ef8bf500dso83426666b.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 00:42:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f13e08c89sm323843166b.88.2024.06.11.00.42.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 00:42:41 -0700 (PDT)
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
X-Inumbo-ID: 2efbfffa-27c6-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718091761; x=1718696561; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Hv4dhT8JGFXr7CnwQDKQ4vVPjy6zfDICAYO+IVglWEA=;
        b=Wke5SrlQ6TgfThUigLz7YwdfIa1D4whedOLhdpqZ6C1l3+MVWdEZA4SgZ1KcDfX0Ct
         6z5iAE8DXsQXGU3UcZJxDtNPrgW6xV5AHIbEnkvqGa/R1jcgpi3gC0Td8dsLH1mN7ixB
         vv853OaBAwfjq3hGJSxUICEz06dxUcTg073GltP3ZT5ilxDs37H7c8DqqTc7dWm36X2g
         Cuy7tYzQTuQWttZ+8b9FqmTPKSgUesXqdmLD6MOrdx4LiYY/ZcwcmViZ4CDXFqI/p8hR
         Rq/eC+/rer8sl6VIA9Q+EvnY3j/A1WRkBCWEEl47pCRIE4HQDHojwY3YSupd+Tb1d41y
         963A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718091761; x=1718696561;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hv4dhT8JGFXr7CnwQDKQ4vVPjy6zfDICAYO+IVglWEA=;
        b=GevHSD4ymCeB1kkSiEyd00ky4gOX1ZAW5H3T2KxLhtO4d3dhte7ITdqbZf4iNs0m1R
         8V1j/0N5XPUx7Mf4nQQ6OUym5C5TssdxSlAw8ldaLCE5v5UmHxZ82Pqhj9UMRtyUTJXO
         djUiN0i+Ejecye8W0v7QX+e1JoYCwDiiYz2vh7oYI/TIDjThfaOyOcqNxEmIs3LILaC6
         jk+F4QvLv3LvmDbnW1FEn3hQRwNcOUlH0tl19CO0lgVYUm4qpoDeVXiJhDfe7qXqxbXU
         GvLJbesyhfFTEED3q9JCjRv9RX9AnRajMJy2yeP/Mp8WT8zN/nZH+PkzFdLmuVYZU2df
         d+zA==
X-Forwarded-Encrypted: i=1; AJvYcCVbc/6tQ0i6fLKO8U5f/4mMaTgyPvdWRvMY2Z+pOSvq1QJX9ybZi/HKBbIYI6PDgtZLvmtklinK8DTW1nMUYhn1TQY0cpii93WNVCIXZbE=
X-Gm-Message-State: AOJu0Yyn9QnJwgf7s0zodzo7WaPCtVDAz0R2asDwdpS1M8RFqKquxh+I
	qzEJflIhujQqYjb0wI15Yq/6PGVBMNcub+l7ghddgLbuYA6TrWaeaxYMw9P4hQ==
X-Google-Smtp-Source: AGHT+IF9XwYl+aUCSUVfoMpYlXfFFbibv6DMxCGtNyYTHPtFXUsJm0X7P5uYj6VAJIrs2XBK0x3oTw==
X-Received: by 2002:a17:907:7d9e:b0:a6f:ea6:9534 with SMTP id a640c23a62f3a-a6f0ea698d6mr610622066b.76.1718091761219;
        Tue, 11 Jun 2024 00:42:41 -0700 (PDT)
Message-ID: <615582c8-c153-424d-bce4-eb0c903d28ad@suse.com>
Date: Tue, 11 Jun 2024 09:42:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] x86/smp: do not use shorthand IPI destinations in
 CPU hot{,un}plug contexts
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240610142043.11924-1-roger.pau@citrix.com>
 <20240610142043.11924-2-roger.pau@citrix.com>
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
In-Reply-To: <20240610142043.11924-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.06.2024 16:20, Roger Pau Monne wrote:
> Due to the current rwlock logic, if the CPU calling get_cpu_maps() does so from
> a cpu_hotplug_{begin,done}() region the function will still return success,
> because a CPU taking the rwlock in read mode after having taken it in write
> mode is allowed.  Such behavior however defeats the purpose of get_cpu_maps(),

I'm not happy to see you still have this claim here. The behavior may (appear
to) defeat the purpose here, but as expressed previously I don't view that as
being a general pattern.

> as it should always return false when called with a CPU hot{,un}plug operation
> is in progress.  Otherwise the logic in send_IPI_mask() is wrong, as it could
> decide to use the shorthand even when a CPU operation is in progress.
> 
> Introduce a new helper to detect whether the current caller is between a
> cpu_hotplug_{begin,done}() region and use it in send_IPI_mask() to restrict
> shorthand usage.
> 
> Fixes: 5500d265a2a8 ('x86/smp: use APIC ALLBUT destination shorthand when possible')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - Modify send_IPI_mask() to detect CPU hotplug context.
> ---
>  xen/arch/x86/smp.c       |  2 +-
>  xen/common/cpu.c         |  5 +++++
>  xen/include/xen/cpu.h    | 10 ++++++++++
>  xen/include/xen/rwlock.h |  2 ++
>  4 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
> index 7443ad20335e..04c6a0572319 100644
> --- a/xen/arch/x86/smp.c
> +++ b/xen/arch/x86/smp.c
> @@ -88,7 +88,7 @@ void send_IPI_mask(const cpumask_t *mask, int vector)
>       * the system have been accounted for.
>       */
>      if ( system_state > SYS_STATE_smp_boot &&
> -         !unaccounted_cpus && !disabled_cpus &&
> +         !unaccounted_cpus && !disabled_cpus && !cpu_in_hotplug_context() &&
>           /* NB: get_cpu_maps lock requires enabled interrupts. */
>           local_irq_is_enabled() && (cpus_locked = get_cpu_maps()) &&
>           (park_offline_cpus ||

Along with changing the condition you also want to update the comment to
reflect the code adjustment.

If we can agree on respective wording in both places, I'd be happy to make
respective adjustments while committing; the code changes themselves are
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

