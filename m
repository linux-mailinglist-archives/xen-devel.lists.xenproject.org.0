Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B5F8B7598
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 14:20:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714792.1116109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1mSU-00008F-DS; Tue, 30 Apr 2024 12:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714792.1116109; Tue, 30 Apr 2024 12:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1mSU-00006I-Ao; Tue, 30 Apr 2024 12:19:42 +0000
Received: by outflank-mailman (input) for mailman id 714792;
 Tue, 30 Apr 2024 12:19:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q3to=MD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1mSS-00006C-W3
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 12:19:40 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eac904c5-06eb-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 14:19:39 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41bca450fa3so24516275e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 05:19:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ay24-20020a05600c1e1800b0041bf29ab003sm11347260wmb.30.2024.04.30.05.19.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 05:19:39 -0700 (PDT)
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
X-Inumbo-ID: eac904c5-06eb-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714479579; x=1715084379; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ZcUjqyzVTdpHgn1iZtxhz6bg4bk+ZqghakK4jIbI3U=;
        b=HSbHQPaa4nsB3VzCoeaLgNb5e/ZftRieQ7BkDBSqVv0B/zRxBJzIM1o9W4dZRdPJ5U
         mjIhgTA56o9oXbRdXnQiVSfU4Uob/1LRi4QibLIDRbFfpAj4pZnTjfWBDJYInt2OWU1S
         zc6QQWhwSi4gaxxuZbUDR5Twu/MIszKocCYT/a/0gwjix+4GgYCd6GgmMKG5PDrqhe5O
         Rm4Vc8cnrhGweaAqHObXdx/7D4uA4iT4Mvamn4xuDnYjdddf7ZnbeqNTrzrWOXfRPX3Q
         c+BxYCK+zzHzbUMyPXiwuCUwrK6NsNliXx1+wcNoEEA+bmpU6kpFwQK061hu1pKSWI6S
         KXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714479579; x=1715084379;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ZcUjqyzVTdpHgn1iZtxhz6bg4bk+ZqghakK4jIbI3U=;
        b=C//cHz7opj+jukD5PZ8aVv8ZkwJM5Jq6LRGXoW/JjQntoJBY0FQYVMlUz0/ZBLgYHt
         JSALVyX7eEUIe5FmsBANpZqEKiT4H21qoagtdBur7ZwezrTA1c8Rqy8uN8vLM5hl7uly
         loRSOsjWdT/wzHLh1Ua10Jiuon5WzcoTSRktRgYvgZjOdo+uVxoZEarTBC0GCtsMrJ+F
         wy0AdtUZT+KABTsGWaYfLQmuRlAZeWbvby3QDCmEjljut8WToN1rSwx7PfvdHISZiKuU
         3BjmjHWTtW6gtENp0le+XaR/HKZTNEsnBbR4uAFwderMAn7oJ34jBdQTisKklcGba2cZ
         GRag==
X-Forwarded-Encrypted: i=1; AJvYcCU+ohgvamgVFX9X7eosQImtuh0NSC53qkhKRkG2V3yrgYOXzEBAlBzvUBGQmgKcNDCykYuxcEdOzNhpZYxHZKNomxjz9HyMk7mQ6ZyaiB0=
X-Gm-Message-State: AOJu0YwBQufxB2B5MOkiaKKS3x3Gd2sQfAyCn49I44V2h55HkS2yOC3t
	OEoo8uyeJiVPZN8IId8VDPyavbZxDr1SLWV/3J0ssWosRlcE0Dmyge7eXzlB7A==
X-Google-Smtp-Source: AGHT+IGpKrBFV867hg0YDA93yqRIRqMa2Ji1EqYvK6/gijYaWKwCg8haPzx6BMn9KRbpsdVgwq6nmg==
X-Received: by 2002:a05:600c:468d:b0:418:427e:21f0 with SMTP id p13-20020a05600c468d00b00418427e21f0mr2045825wmo.8.1714479579333;
        Tue, 30 Apr 2024 05:19:39 -0700 (PDT)
Message-ID: <249214ee-9c2d-4f12-8af5-0779493323b1@suse.com>
Date: Tue, 30 Apr 2024 14:19:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/2] evtchn: Add error status indicators for
 evtchn_status hypercall
Content-Language: en-US
To: Matthew Barnes <matthew.barnes@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1714148012.git.matthew.barnes@cloud.com>
 <2f9544433fd9bb5c4b7ccccbacc27bc928f57dfb.1714148012.git.matthew.barnes@cloud.com>
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
In-Reply-To: <2f9544433fd9bb5c4b7ccccbacc27bc928f57dfb.1714148012.git.matthew.barnes@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.04.2024 15:42, Matthew Barnes wrote:
> When the evtchn_status hypercall fails, it is not possible to determine
> the cause of the error, since the library call returns -1 to the tool
> and not the errno.

That's normal behavior for such library functions. If you want to know the
specific error number, you ought to look at the errno variable. Or are
you saying that errno isn't set correctly in this case (I can't spot such
an issue when looking at do_evtchn_op(), backing xc_evtchn_status())?

> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -1030,7 +1030,17 @@ int evtchn_status(evtchn_status_t *status)
>  
>      d = rcu_lock_domain_by_any_id(dom);
>      if ( d == NULL )
> -        return -ESRCH;
> +    {
> +        status->status = EVTCHNSTAT_dom_invalid;
> +        return 0;

This surely ought to remain -ESRCH. You may not break existing callers.

> +    }
> +
> +    if ( !port_is_valid(d, port) )
> +    {
> +        status->status = EVTCHNSTAT_port_invalid;
> +        rcu_unlock_domain(d);
> +        return 0;
> +    }

I can see that for the purpose of patch 2 this wants distinguishing from

>      chn = _evtchn_from_port(d, port);
>      if ( !chn )

... the -EINVAL returned here. Yet "success" doesn't look correct there
either. -ENOENT, -EBADF, -ENFILE, or -EDOM maybe?

> --- a/xen/include/public/event_channel.h
> +++ b/xen/include/public/event_channel.h
> @@ -200,6 +200,8 @@ struct evtchn_status {
>  #define EVTCHNSTAT_pirq         3  /* Channel is bound to a phys IRQ line.   */
>  #define EVTCHNSTAT_virq         4  /* Channel is bound to a virtual IRQ line */
>  #define EVTCHNSTAT_ipi          5  /* Channel is bound to a virtual IPI line */
> +#define EVTCHNSTAT_dom_invalid  6  /* Given domain ID is not a valid domain  */
> +#define EVTCHNSTAT_port_invalid 7  /* Given port is not within valid range   */
>      uint32_t status;
>      uint32_t vcpu;                 /* VCPU to which this channel is bound.   */
>      union {

If such indicators are to be added, I'm pretty sure they want to be discontiguous
from the presently used range. Sadly, with status having unsigned type, using
negative values wouldn't feel quite right.

Jan

