Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E49FE803AED
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 17:54:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647193.1010005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rACDF-0006J4-B5; Mon, 04 Dec 2023 16:54:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647193.1010005; Mon, 04 Dec 2023 16:54:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rACDF-0006Gm-8O; Mon, 04 Dec 2023 16:54:29 +0000
Received: by outflank-mailman (input) for mailman id 647193;
 Mon, 04 Dec 2023 16:54:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rACDD-0006Gg-MO
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 16:54:27 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c85f9f2c-92c5-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 17:54:26 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40c039e9719so25886745e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 08:54:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c444b00b003fefaf299b6sm15608248wmn.38.2023.12.04.08.54.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Dec 2023 08:54:25 -0800 (PST)
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
X-Inumbo-ID: c85f9f2c-92c5-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701708866; x=1702313666; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1A6QnzPypumBV3mDGEut2cRF7BruW14XQb66UfO1we8=;
        b=eQLurn4VVq3g7qVWBuiMUiFnCOQdBP6hvrhCph9tmPkIho4rmiW1NPRGa6EY1lc20U
         aVFOx0QJLFO4w7fkjIMC9u8iMHxocluoxFU+DrUKJf0hFuloLXJxqn/Oo1P89yUPZ3gF
         M2oYGL2IFUHiCAyN6GLprV1DTdJOh20/F0bGoafmyEYOV+36LpnEAWedNToTLR806iOc
         5kn9tbZCJlHdzglGdwmqFJwlC+1hmeVRX2rsR9KN+XSbTGkqVQXmuT+peBXMpT3Xt15K
         BD+HJ+7mXGIgqMZnm2hDmj6QYp7l3xYbCvj2OqhZyc8zDG7JGn3QMW2XtyOBNx8xHn9l
         AWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701708866; x=1702313666;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1A6QnzPypumBV3mDGEut2cRF7BruW14XQb66UfO1we8=;
        b=d5fbnKNtNoeoNxfu2w/Y8rGmepSPvzD1WpT2fo2y41SZ3iH1PAgP+g8Z1DZc2O8Mzb
         gpJ35vFnlFfKwl6lc2sLYlugCMH1KDLcd2yS0R2lMZRU778I7QLLwzIAYehrQYYxD3vC
         ikWpsddrOhX2qE8GW//OMfpvlGWzrlorxwW3T8ryTCOwj1u7zq8a5cE4apon1CEM1WAK
         kIC2pn2owwiaQpyn7V2Z7AQxWjEemaQGyjFf5cG7YBmIc4NZncldg/UDP3bPPfgyVZOh
         wezM9ppwPF48cYVHi9oUFf2J8jujK6KBuQn/hM1FAMcwdB4KW9IFIh9qPDKbYfpxZLYI
         OvxA==
X-Gm-Message-State: AOJu0YzzDvdD9HyMqZJrsU3xGztAX+cYJ8HaT+9/wMqZV+to/duUV1f6
	vREdOarDOMbfCGSF7EB7GDr1
X-Google-Smtp-Source: AGHT+IFmrBekvPQ1oZmxmni/DNjAet7c46s5dooGC5cY6A4dww3NJmQ1f8ypWKFZofeKw3qC2TebNA==
X-Received: by 2002:a05:600c:2195:b0:401:bd2e:49fc with SMTP id e21-20020a05600c219500b00401bd2e49fcmr1477959wme.24.1701708865934;
        Mon, 04 Dec 2023 08:54:25 -0800 (PST)
Message-ID: <3c7abc30-20d7-4a4e-b963-27339952e7a3@suse.com>
Date: Mon, 4 Dec 2023 17:54:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen: address violations of MISRA C:2012 Rule 11.8.
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, maria.celeste.cesario@bugseng.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <de2bfb322d91e99cf794c233461a04e638ee93aa.1701707356.git.maria.celeste.cesario@bugseng.com>
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
In-Reply-To: <de2bfb322d91e99cf794c233461a04e638ee93aa.1701707356.git.maria.celeste.cesario@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.12.2023 17:32, Simone Ballarin wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> Remove or amend casts to comply with Rule 11.8.
> 
> Fix violations by adding missing const qualifier in cast.
> Fix violations by removing unnecessary cast.
> Change type of operands from char* to uintptr_t: uintptr_t is
> the appropriate type for memory address operations.
> 
> No functional changes.
> 
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>

I consider it good practice to at least briefly say what the rule is
about, so it is clear why certain changes need doing.

> --- a/xen/arch/arm/include/asm/atomic.h
> +++ b/xen/arch/arm/include/asm/atomic.h
> @@ -154,7 +154,7 @@ static always_inline void write_atomic_size(volatile void *p,
>   */
>  static inline int atomic_read(const atomic_t *v)
>  {
> -    return *(volatile int *)&v->counter;
> +    return *(const volatile int *)&v->counter;
>  }

What about PPC's identical code?

> --- a/xen/arch/x86/include/asm/regs.h
> +++ b/xen/arch/x86/include/asm/regs.h
> @@ -6,7 +6,7 @@
>  
>  #define guest_mode(r)                                                         \
>  ({                                                                            \
> -    unsigned long diff = (char *)guest_cpu_user_regs() - (char *)(r);         \
> +    unsigned long diff = (uintptr_t)guest_cpu_user_regs() - (uintptr_t)(r);   \
>      /* Frame pointer must point into current CPU stack. */                    \
>      ASSERT(diff < STACK_SIZE);                                                \
>      /* If not a guest frame, it must be a hypervisor frame. */                \

This part
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

