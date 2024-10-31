Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C34379B797C
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 12:16:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828609.1243551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6TAC-0001Lp-EN; Thu, 31 Oct 2024 11:16:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828609.1243551; Thu, 31 Oct 2024 11:16:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6TAC-0001Ib-BB; Thu, 31 Oct 2024 11:16:28 +0000
Received: by outflank-mailman (input) for mailman id 828609;
 Thu, 31 Oct 2024 11:16:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zW4/=R3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t6TAA-0001HC-3A
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 11:16:26 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ee285b3-9779-11ef-99a3-01e77a169b0f;
 Thu, 31 Oct 2024 12:16:21 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4316cce103dso8492965e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 04:16:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4327d5ab297sm22619415e9.8.2024.10.31.04.16.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 04:16:20 -0700 (PDT)
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
X-Inumbo-ID: 8ee285b3-9779-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzUiLCJoZWxvIjoibWFpbC13bTEteDMzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjhlZTI4NWIzLTk3NzktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMzczMzgxLjc4OTQwNiwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730373381; x=1730978181; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g3odNZV4CogQF3+Zos5AOhrfJMGrmNPdP21SWJ1C5ZQ=;
        b=MYhbEIIPLpsOV8pWJTAr44Q42VQW0DTj/QOOxjYWhA50Orj8r/1VlMtrs6WEknZcNP
         asGt7FoceJ6Yim4XrcBp595UzPwwb5cZyJt9XBOoq0QKo46F9QxiT0KsB2gQ7RIPiBrn
         EDJBWysAf/OmsmcQnkiR3WBCBf5PtN57bjfMkMVyCyhay7rWDvOaFvZBsnp99ZeuoKD0
         xQfCCWPlMn8MTi7+7mY0pVbAqS3YLWtt4GWk0btiKIS+Xa+8tAKstYUPgIZtT13WW3fC
         6r0o2RfIHrew69d9HUrnAe+GgNs+fKQOJ5exJA/fB4teuBv1rfQ/ehfuWYe4TIuTF9Jr
         uwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730373381; x=1730978181;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3odNZV4CogQF3+Zos5AOhrfJMGrmNPdP21SWJ1C5ZQ=;
        b=LK7eyC/3BvZlz/+iZGu4KU8ALtNeH+AFZOejeDWD9yCKDASdFDGLOjIMFmMRGLzKWD
         nTHVwiuhdASBQWcPLPyXK6TNiMLfThPoCTV6FKzZk1OSdA8NB9FX0ys006AUcRvGGRD7
         vosZjY1CLxDzZkl/uQzWpN/7CkkBblhibhxZoYXvmsjH9iojKmPoMb89M8xj4Gh0rztU
         C79U8PD5L572+A2LlpVMlMZs+tR0D26C2FDKZlV8SaZa6v1L/KH7PwFlFEdp+QR3+XK0
         PSPzfbHgq/fe6S4sBdPuLdgI/IwlYgJcfTAwVO0FS8H3g9i0aGt771ZosM0iaIDpFH+c
         BbSg==
X-Forwarded-Encrypted: i=1; AJvYcCXtjQobdcoz+Yr6JIKjVCsHJCg6PqZmzo0Yp0blD7fsSkKNlCM/bHuDyKzbC7neV4Zf0qboyBozCi8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxMrj9kn+HUEG/FLEeMIf3xrHsQUQGtir3vqKHwtpPV05Hp4TT3
	jOJBrr1UrpJlyQLilMbzVO8mP7LA3bFArE3VTtpgccHHxYAesOT2Do6Li1WdvtTO/KN0xaSwqpM
	=
X-Google-Smtp-Source: AGHT+IFmqsY38XzEmBBMpJBk9xl/sTzz+97kh2j6A/8BOFZRdiHbJdWF0c7nth/NylU/zFxGXa44Yg==
X-Received: by 2002:a05:600c:4fce:b0:431:4f29:9539 with SMTP id 5b1f17b1804b1-4319ad29f7cmr210715865e9.32.1730373381075;
        Thu, 31 Oct 2024 04:16:21 -0700 (PDT)
Message-ID: <f4791b83-67ce-4530-8ea3-581ee8c90631@suse.com>
Date: Thu, 31 Oct 2024 12:16:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] xen: add new domctl get_changed_domain
To: Juergen Gross <jgross@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-4-jgross@suse.com>
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
In-Reply-To: <20241023131005.32144-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.10.2024 15:10, Juergen Gross wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -154,6 +154,57 @@ void domain_reset_states(void)
>      rcu_read_unlock(&domlist_read_lock);
>  }
>  
> +static void set_domain_state_info(struct xen_domctl_get_domain_state *info,
> +                                  const struct domain *d)
> +{
> +    info->state = XEN_DOMCTL_GETDOMSTATE_STATE_EXIST;
> +    if ( d->is_shut_down )
> +        info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_SHUTDOWN;
> +    if ( d->is_dying == DOMDYING_dead )
> +        info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_DYING;
> +    info->unique_id = d->unique_id;
> +}
> +
> +int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d)
> +{
> +    unsigned int dom;
> +
> +    memset(info, 0, sizeof(*info));

Would this better go into set_domain_state_info()? Ah, no, you ...

> +    if ( d )
> +    {
> +        set_domain_state_info(info, d);
> +
> +        return 0;
> +    }
> +
> +    while ( (dom = find_first_bit(dom_state_changed, DOMID_MASK + 1)) <
> +            DOMID_FIRST_RESERVED )
> +    {
> +        d = rcu_lock_domain_by_id(dom);

... acquiring the lock early and then ...

> +        if ( test_and_clear_bit(dom, dom_state_changed) )
> +        {
> +            info->domid = dom;
> +            if ( d )
> +            {
> +                set_domain_state_info(info, d);

... potentially bypassing the call (with just the domid set) requires it
that way.

As to the point in time when the lock is acquired: Why is that, seeing that
it complicates the unlocking a little, by requiring a 2nd unlock a few
lines down?

> +                rcu_unlock_domain(d);
> +            }
> +
> +            return 0;
> +        }
> +
> +        if ( d )
> +        {
> +            rcu_unlock_domain(d);
> +        }

Nit: No need for the braces.

> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -969,11 +969,18 @@ static struct domain *global_virq_handlers[NR_VIRQS] __read_mostly;
>  
>  static DEFINE_SPINLOCK(global_virq_handlers_lock);
>  
> +struct domain *get_global_virq_handler(uint32_t virq)
> +{
> +    ASSERT(virq_is_global(virq));
> +
> +    return global_virq_handlers[virq] ?: hardware_domain;
> +}
> +
>  void send_global_virq(uint32_t virq)
>  {
>      ASSERT(virq_is_global(virq));
>  
> -    send_guest_global_virq(global_virq_handlers[virq] ?: hardware_domain, virq);
> +    send_guest_global_virq(get_global_virq_handler(virq), virq);
>  }

Is this a stale leftover from an earlier version? There's no other caller of
get_global_virq_handler() here, hence the change looks unmotivated here.

> @@ -1236,7 +1237,37 @@ struct xen_domctl_dt_overlay {
>  };
>  #endif
>  
> +/*
> + * XEN_DOMCTL_get_domain_state (stable interface)
> + *
> + * Get state information of a domain.
> + *
> + * In case domain is DOMID_INVALID, return information about a domain having
> + * changed state and reset the state change indicator for that domain. This
> + * function is usable only by a domain having registered the VIRQ_DOM_EXC
> + * event (normally Xenstore).
> + *
> + * Supported interface versions: 0x00000000
> + */
> +#define XEN_DOMCTL_GETDOMSTATE_VERS_MAX    0
> +struct xen_domctl_get_domain_state {
> +    domid_t domid;

Despite the DOMID_INVALID special case the redundant domid here is odd.
You actually add the new sub-op to the special casing of op->domain at the
top of do_domctl(), so the sole difference to most other sub-ops would be
that this then is an IN/OUT (rather than the field here being an output
only when DOMID_INVALID was passed in via the common domid field).

> +    uint16_t state;
> +#define XEN_DOMCTL_GETDOMSTATE_STATE_EXIST     0x0001  /* Domain is existing. */
> +#define XEN_DOMCTL_GETDOMSTATE_STATE_SHUTDOWN  0x0002  /* Shutdown finished. */
> +#define XEN_DOMCTL_GETDOMSTATE_STATE_DYING     0x0004  /* Domain dying. */
> +    uint32_t pad1;           /* Returned as 0. */
> +    uint64_t unique_id;      /* Unique domain identifier. */
> +    uint64_t pad2[6];        /* Returned as 0. */
> +};

What are the intentions with this padding array?

Jan

