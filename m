Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D89A045B8
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 17:15:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866632.1277958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVCEA-0004Ff-5v; Tue, 07 Jan 2025 16:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866632.1277958; Tue, 07 Jan 2025 16:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVCEA-0004Cs-1R; Tue, 07 Jan 2025 16:14:46 +0000
Received: by outflank-mailman (input) for mailman id 866632;
 Tue, 07 Jan 2025 16:14:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVCE8-0004Cm-MJ
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 16:14:44 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 816cf858-cd12-11ef-a0df-8be0dac302b0;
 Tue, 07 Jan 2025 17:14:43 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3862a921123so10611129f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 08:14:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e528sm51375696f8f.83.2025.01.07.08.14.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 08:14:42 -0800 (PST)
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
X-Inumbo-ID: 816cf858-cd12-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736266483; x=1736871283; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ccNMf9aGsRxc3mwx8N5SPs7WkprCMCSuBkc4OZMaO4U=;
        b=byqYaYiE799ABJv+dyMI5Ns4wc0R2/08XMpazScAiGNOkygYet+OQWLgoclWp2AcSa
         7Hj7FTF8v5NpuawnSRFamcYOwYUsK8XN7Q4bxVK+unC+RrX10jyzh64dZAu2f3c3pr6k
         URrSSgWo2FhKsqa2SWCCSuPfo7eFslHM8OpZkB7SUSTfje8zONVm4eKvxf049dw2WJu/
         IkHR4eGPbcpcI6VraYfY+pDpRj+U36sTpcDEPunFfN5rOXtYLXWYMwm51eSdAi+PdT9d
         P1I9WBR1LxUhEYnw49J2Fr5RG5tmVcfI/IgoDKE7N3p2p1L1vwi0D5J9WVxRfgMN2uc1
         xAdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736266483; x=1736871283;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccNMf9aGsRxc3mwx8N5SPs7WkprCMCSuBkc4OZMaO4U=;
        b=mZQXnp/IeHy4BoRq08KFHjp/VqFFrUst05ir46Bz88n8edsrASb0q0K+uEA9/2oAiv
         ABCwL+V+Ozf9CLuJZp+jMwOWbINY+oivzLUk//7KhoUilnZQt6jwmxYhcIGX31yu84MH
         zzSbx9bNZ62DH9rlufUqgpJc4SRPuyuKUG2ZC49Wdr8nT5DeRi8HNd95RVDWB94N77KM
         ODeNgXdrya8CMNTyl9vNvS8zaQ8NuxZLK/L5qSIUbUdxB1uEWfhSbsZA2xtB2jfZf6bg
         XQgrhu6ncJ855jwQa3kenCRHulA7H87bNhcWGzyVxOaP3Kh0qOg+bMALn44d49hVW9nV
         0USA==
X-Forwarded-Encrypted: i=1; AJvYcCUBYYb8ZDpDYOXNfOhVspmeqhASz2W7NMIWR9uU8/IIVCqtEErurOu2cjRo6OJyKSJL6wkfv1JlHdw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyg72Gz/B9hKf07nVq5Jk+fyKcBncQayTm31ZJE4I3yYQhTEldt
	mwhU0opogIlWil0Y09uZn07dfUvZcwx7rO+A69UslS8XMGXa9u+E167p1BsJ2Q==
X-Gm-Gg: ASbGncut6jwzxa41ABwKuSEB8GKhOMYiJb/WeX9Tv509/JXFL6i8gy0kOgWvKBxFUg9
	65gSsvrRV41TZKLazdNxX//g05r2Ssv1LhxMJnTxHE5lX7qa8BUPXLoooBT5Ov4Ry+ZjINi2ODo
	tlZrmfsKSwuLizMkU75/FcITd9kuvdVMjA2UA36F5eBo+3i+STXQIm55NcwXm7JR+aRk8pM0l+Z
	wyAazexnQ35OXf02j1O4UaL/aY+xh5oaFVxKn2ntg4TCzh7SUw1S9L1BljrLFioAugabGK8zeWq
	0H27jMnLRkCbvJ7uguFcaxK9epHL6ug1cIabs5aLrA==
X-Google-Smtp-Source: AGHT+IEh5S9o++FY10HMcDxqByzXqKj2xXDQiqOc21TtQOBAQtNDznakvr41N6oR7HeINGtdfrPcrQ==
X-Received: by 2002:a5d:5f4f:0:b0:386:3329:6a04 with SMTP id ffacd0b85a97d-38a223f5b4cmr58182990f8f.39.1736266483150;
        Tue, 07 Jan 2025 08:14:43 -0800 (PST)
Message-ID: <b77141df-fa14-426a-937f-42693d1caeb9@suse.com>
Date: Tue, 7 Jan 2025 17:14:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] xen: add bitmap to indicate per-domain state
 changes
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250107101711.5980-1-jgross@suse.com>
 <20250107101711.5980-5-jgross@suse.com>
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
In-Reply-To: <20250107101711.5980-5-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.01.2025 11:17, Juergen Gross wrote:
> Add a bitmap with one bit per possible domid indicating the respective
> domain has changed its state (created, deleted, dying, crashed,
> shutdown).
> 
> Registering the VIRQ_DOM_EXC event will result in setting the bits for
> all existing domains and resetting all other bits.
> 
> As the usage of this bitmap is tightly coupled with the VIRQ_DOM_EXC
> event, it is meant to be used only by a single consumer in the system,
> just like the VIRQ_DOM_EXC event.
> 
> Resetting a bit will be done in a future patch.
> 
> This information is needed for Xenstore to keep track of all domains.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - use DOMID_FIRST_RESERVED instead of DOMID_MASK + 1 (Jan Beulich)
> - use const (Jan Beulich)
> - move call of domain_reset_states() into evtchn_bind_virq() (Jan Beulich)
> - dynamically allocate dom_state_changed bitmap (Jan Beulich)
> V3:
> - use xvzalloc_array() (Jan Beulich)
> - don't rename existing label (Jan Beulich)
> V4:
> - add __read_mostly (Jan Beulich)
> - use __set_bit() (Jan Beulich)

This change looks to have been lost, ...

> - fix error handling in evtchn_bind_virq() (Jan Beulich)
> V5:
> - domain_init_states() may be called only if evtchn_bind_virq() has been
>   called validly (Jan Beulich)
> V6:
> - guard dom_state_changed bitmap with d->event_lock (Jan Beulich)

... without it being mentioned anywhere, and without it becoming clear why
it would have needed undoing.

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -35,6 +35,7 @@
>  #include <xen/irq.h>
>  #include <xen/argo.h>
>  #include <xen/llc-coloring.h>
> +#include <xen/xvmalloc.h>
>  #include <asm/p2m.h>
>  #include <asm/processor.h>
>  #include <public/sched.h>
> @@ -139,6 +140,51 @@ bool __read_mostly vmtrace_available;
>  
>  bool __read_mostly vpmu_is_available;
>  
> +static unsigned long *__read_mostly dom_state_changed;
> +
> +int domain_init_states(void)
> +{
> +    const struct domain *d;
> +
> +    ASSERT(!dom_state_changed);
> +    ASSERT(rw_is_write_locked(&current->domain->event_lock));

rw_is_write_locked_by_me()?

> +    dom_state_changed = xvzalloc_array(unsigned long,
> +                                       BITS_TO_LONGS(DOMID_FIRST_RESERVED));
> +    if ( !dom_state_changed )
> +        return -ENOMEM;
> +
> +    rcu_read_lock(&domlist_read_lock);
> +
> +    for_each_domain ( d )
> +        set_bit(d->domain_id, dom_state_changed);
> +
> +    rcu_read_unlock(&domlist_read_lock);
> +
> +    return 0;
> +}
> +
> +void domain_deinit_states(const struct domain *d)
> +{
> +    ASSERT(rw_is_write_locked(&d->event_lock));

Again.

Jan

