Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 010E5942DE5
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 14:15:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768530.1179360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ8E9-00017d-86; Wed, 31 Jul 2024 12:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768530.1179360; Wed, 31 Jul 2024 12:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ8E9-000150-4a; Wed, 31 Jul 2024 12:14:45 +0000
Received: by outflank-mailman (input) for mailman id 768530;
 Wed, 31 Jul 2024 12:14:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZ8E7-00014u-Ng
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 12:14:43 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77876909-4f36-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 14:14:42 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5a10835487fso8244649a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 05:14:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac631b03a0sm8697508a12.2.2024.07.31.05.14.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 05:14:34 -0700 (PDT)
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
X-Inumbo-ID: 77876909-4f36-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722428082; x=1723032882; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=n2h2kIRU4A4fL9+3qfAXXgYBMuZB+dVtUhe1Z8YY1HM=;
        b=gvCi7LVRtfS6QBgKFa6ZroKJaOD90NxT/n+4aSghcpO9QJdbxbpZ5QWX14mW2lQIUv
         9NRq5ZrwhTd8oy2GBtQaYAGwxiFIwjo/gNzKshmJp8gaee7BUK/zPZ03Lv1JVxRMA+3E
         YPB1cegQYsgIwrHFyZGvqBV9mM/6v41YOivzn12WlFQZtX/C8EPBrrXUDOU42sKDHu7N
         jPqfaJShbFbbIZ8v3VNsk6SU+JPzKOaV4xTF2iOsAbxj89pPJwNGp5wClFZF9irsTLFV
         bOXcIc3HyBD1cJMcyeBJLg7eRr7cQTAEyA8mXY/Ay3zJ+4Wm+fiIPnOiLz5VO1S8RxPD
         rMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722428082; x=1723032882;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2h2kIRU4A4fL9+3qfAXXgYBMuZB+dVtUhe1Z8YY1HM=;
        b=BPBPTGiEFor61/sXlzoWAyhqrekqFdGHYbHA07xTUeo8J2G1jhlMfhp5U9tHgqkqst
         CpMpwHseKXfTJvxu3IWiAVvZMC7Uft2JdmvYJXvCMS76VSAgZ4HpooWJkB12mtgkemQx
         r+h7uaZinOyxVa+U99gEEGMhWbtUzMIEc65Ha+D/DYEHzLHBfF0D/Cgy8mtYOk7liDmh
         +Hi5N7gbCZWG/jtvKBGolfXudAWW+CGEXMN1rYuiPvDDRxGvm1v9vvqbD8aK+ddpt1TP
         FfF6GnM4JiIa3XP/fqWvYYy+lloGXWnCDFSSzJlRb+k3VnZ+o48LqMeNkS2qqCX4PvyC
         D+DQ==
X-Forwarded-Encrypted: i=1; AJvYcCV68qgi33ejtmo3L5w2+YztkoEUEPjNwpphSQgRuaXlQOTzgQvKbJn6+pwLiI7jdTaufmjnZMd09FacLTrdfm83bIBFLMj8jp3mfF+jdtY=
X-Gm-Message-State: AOJu0YySZGo+szyaht43m5sXrfothUnaTSNNFt6nRN+0CVfBqR+1DE/9
	rWRkLhdSM2d1G003yvBNlpYOiIu+dQeQQ7/TsR+QxqBu2l5A2nOXl/N0qjDhhyci5luOjPf9eRM
	=
X-Google-Smtp-Source: AGHT+IF6piW/5duYTi6cuQzY8jDKxZCaCteHTwGraI7V4uusak1GgVZ65MYa/qUBL6t8qRN+Jc3mlQ==
X-Received: by 2002:a50:aa8d:0:b0:5a7:d986:6e4 with SMTP id 4fb4d7f45d1cf-5b021f0c48bmr9747845a12.28.1722428074905;
        Wed, 31 Jul 2024 05:14:34 -0700 (PDT)
Message-ID: <33cde4c7-e00a-47e0-b752-82e514df99d3@suse.com>
Date: Wed, 31 Jul 2024 14:14:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/domain: Factor domlist_{insert,remove}() out of
 domain_{create,destroy}()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240731120406.3429430-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240731120406.3429430-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2024 14:04, Andrew Cooper wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -64,6 +64,57 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
>  static struct domain *domain_hash[DOMAIN_HASH_SIZE];
>  struct domain *domain_list;
>  
> +/*
> + * Insert a domain into the domlist/hash.  This allows the domain to be looked
> + * up by domid, and therefore to be the subject of hypercalls/etc.
> + */
> +static void domlist_insert(struct domain *d)
> +{
> +    struct domain **pd;
> +
> +    spin_lock(&domlist_update_lock);
> +
> +    /* domain_list is maintained in domid order. */
> +    pd = &domain_list;

Make this the initializer of the variable, if ...

> +    for ( ; *pd != NULL; pd = &(*pd)->next_in_list )

... isn't to be the starting clause of the for()?

> +        if ( (*pd)->domain_id > d->domain_id )
> +            break;
> +
> +    d->next_in_list = *pd;
> +    d->next_in_hashbucket = domain_hash[DOMAIN_HASH(d->domain_id)];
> +    rcu_assign_pointer(*pd, d);
> +    rcu_assign_pointer(domain_hash[DOMAIN_HASH(d->domain_id)], d);

Maybe worth putting the hash in a local variable?

> +    spin_unlock(&domlist_update_lock);
> +}
> +
> +/*
> + * Remove a domain from the domlist/hash.  This means the domain can no longer
> + * be looked up by domid, and therefore can no longer be the subject of
> + * *subsequent* hypercalls/etc.  In-progress hypercalls/etc can still operate
> + * on the domain.
> + */
> +static void domlist_remove(struct domain *d)
> +{
> +    struct domain **pd = &domain_list;
> +
> +    spin_lock(&domlist_update_lock);
> +
> +    pd = &domain_list;

pd already has an initializer.

With at least the pd related adjustments
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

