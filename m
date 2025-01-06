Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF07A02256
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 10:58:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865624.1276872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUjsK-00053M-MP; Mon, 06 Jan 2025 09:58:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865624.1276872; Mon, 06 Jan 2025 09:58:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUjsK-00051D-Jb; Mon, 06 Jan 2025 09:58:20 +0000
Received: by outflank-mailman (input) for mailman id 865624;
 Mon, 06 Jan 2025 09:58:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9khw=T6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tUjsJ-000515-Dy
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 09:58:19 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0964890-cc14-11ef-99a4-01e77a169b0f;
 Mon, 06 Jan 2025 10:58:17 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43635796b48so85292025e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 01:58:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c832e53sm47233216f8f.27.2025.01.06.01.58.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 01:58:16 -0800 (PST)
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
X-Inumbo-ID: c0964890-cc14-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736157497; x=1736762297; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YFR5XrTJw5dYAKEH2bpp5Y5GfW32/ArmHpb8Y9iaWBw=;
        b=LBvXykIObFrWv0wqcQKndVy2xAyFcw4VA3s+kIWD5LLpRFltRw3BT07sK7T4bq89XL
         307rUpbtb59rO5+v6dTRTuP6/oYO5DOu6bSbyAUhHMByoLEV3aAeRcJvvxiCIH0M+OLY
         Cn5X8+e6efdNXAwnqvRZTpfYBFFjchMLj4FqYKE6Vc2UgWWss37g4X1buSpIKMQjpJh4
         t5cQiCqKQ61Hu6OgVsk2KNLbSxb5jIi9Xwl1wTFUpVDu5hZ3+WJJXrW9zV93S501dXvJ
         IUEqGApdwEDuHz1b8RHPMMaC0zYxw+BkF01IjwYH4lbbo91IiDFmQdp+9YsxRerM2Tas
         O6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736157497; x=1736762297;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFR5XrTJw5dYAKEH2bpp5Y5GfW32/ArmHpb8Y9iaWBw=;
        b=hUjeYUi9RDL/9ECWVqxME8uWx/NuzDz1xmOVUzqRJAxPwBcfEFDGkZQbsrtYEJrtCu
         WKq4rFVLPrhl/3OSOAUEZLmsIXQ7G6fiumwgfxE7CMEz3aMf8R9GH/HM6q9p6uIINaXW
         l7rSckUweGJ2pxt4gTgmWkUvT64edoi2odsO9SDpLVwMtFUKUs8VTpVsvi6uT8iT5q0Q
         MRwgocT66qNwnhBGLIPt3P7OwdOfCsWs23phYNSmnINp+WfNGfsFUH1d2u1YiY7BCnje
         jvx+C7sc+dPFOtjfmeuWDh3XZbc6dt1lpiJYFaLxOkA8Uc4FhNsOqgvg64gvg+Mn73xx
         7lQw==
X-Forwarded-Encrypted: i=1; AJvYcCU8ChNHM2sF88f9RWLEuyD6meJyR9RjsV0Uaxh5UuFYQ/4afivUrSzK/mQtmC2PPMG04lmdvamGQH8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtyXHiKLAsYhTrj0rUY7MKpBkj7K+QO6X84d1igm30ic5pYV1k
	ZfwhU7X9CJZUq9GsT4Bto5VtLGkVKsP+ecratUrXteCUUug/IajjX+qiRCC5Aw==
X-Gm-Gg: ASbGncti9TARRJVXMaZMqQ64bfIWPpOo8MCB8qZfRXFsvtNGNeez+aAfy8+sr6RKv9i
	QyErw2TlSjJ9eLOyy4xk9MmSqq/QkcNUV/2W9RrJGrcnFXv1TY4yOmtJwB0QcLnJlkwZd6MHuaB
	FQyw4fYkF7pxHQs+Kybxt+2p1OVKCoN2ThpmNWJnFHx4C7rycSvQny8rTBX9V433q2WfYtJZs7l
	IROp/bEy9ajmKdZTXwohx/YXSyJ50geyWRJRoce60IiUUBWoc2vA/W2wZzk8uEA62qtwk9BRNXT
	pcCKeOq/vUojsJcCw8ycx4CjprWltIFyHJWncXEd2w==
X-Google-Smtp-Source: AGHT+IFET3J/uyDf+rD2KZLDszy8WWR+VFqyCRSQLrhgqzJ892PYZQCd3pVqHgQkkjFGH+rI+Edu/w==
X-Received: by 2002:a05:600c:474f:b0:434:ff08:202e with SMTP id 5b1f17b1804b1-43682a402ecmr357824765e9.8.1736157496897;
        Mon, 06 Jan 2025 01:58:16 -0800 (PST)
Message-ID: <3b9635bc-e196-4a7e-95ea-277172ae052a@suse.com>
Date: Mon, 6 Jan 2025 10:58:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/35] xen/console: introduce console_set_owner()
To: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-19-e9aa923127eb@ford.com>
 <Z1q3COsFN3J9G60E@macbook.local>
 <Nzs8m4tgOs8mh44axM9sAfsp2GGMk34p5Oi0dtXh8rLbKzHXmMtMXK_d_AJy-gSQuGRygaZbsvhy9QFvsCc0yyMiqzXslUNID1os1CCzNrA=@proton.me>
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
In-Reply-To: <Nzs8m4tgOs8mh44axM9sAfsp2GGMk34p5Oi0dtXh8rLbKzHXmMtMXK_d_AJy-gSQuGRygaZbsvhy9QFvsCc0yyMiqzXslUNID1os1CCzNrA=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.01.2025 04:30, Denis Mukhin wrote:
> On Thursday, December 12th, 2024 at 2:12 AM, Roger Pau Monné <roger.pau@citrix.com> wrote:
>> On Thu, Dec 05, 2024 at 08:41:49PM -0800, Denis Mukhin via B4 Relay wrote:
>>> --- a/xen/drivers/char/console.c
>>> +++ b/xen/drivers/char/console.c
>>> @@ -463,82 +463,100 @@ static void cf_check dump_console_ring_key(unsigned char key)
>>>
>>> /*
>>> * CTRL-<switch_char> changes input direction, rotating among Xen, Dom0,
>>> - * and the DomUs started from Xen at boot.
>>> + * and the DomUs.
>>> /
>>> #define switch_code (opt_conswitch[0]-'a'+1)
>>> +
>>> /
>>> - * console_owner=0 => input to xen
>>> - * console_owner=1 => input to dom0 (or the sole shim domain)
>>> - * console_owner=N => input to dom(N-1)
>>> + * Current console owner domain ID: either Xen or domain w/ d->is_console ==
>>> + * true.
>>> + *
>>> + * Initialized in console_endboot().
>>> */
>>> -static unsigned int __read_mostly console_owner = 0;
>>> +static domid_t __read_mostly console_owner;
>>
>>
>> Should this be initialized to DOMID_XEN? I assume it doesn't make
>> much difference because the variable is not checked before
>> console_endboot() anyway, but it might be safer to initialize to a
>> value that assigns the console to Xen.
> 
> Fixed.
> 
>>
>>> -#define max_console_rx (max_init_domid + 1)
>>> +static struct domain *rcu_lock_domain_console_by_id(domid_t domid)
>>> +{
>>> + struct domain *d;
>>> +
>>> + d = rcu_lock_domain_by_id(domid);
>>> +
>>
>>
>> Nit: I would remove this newline.
> 
> Fixed.
> 
>>
>>> + if ( d == NULL )
>>> + return NULL;
>>> +
>>> + if ( d->is_console )
>>> + return d;
>>> +
>>> + rcu_unlock_domain(d);
>>> +
>>> + return NULL;
>>> +}
>>>
>>> -#ifdef CONFIG_SBSA_VUART_CONSOLE
>>> /* Make sure to rcu_unlock_domain after use */
>>> struct domain *rcu_lock_domain_console_owner(void)
>>> {
>>> - if ( console_owner == 0 )
>>> - return NULL;
>>> - return rcu_lock_domain_by_id(console_owner - 1);
>>> + return rcu_lock_domain_console_by_id(console_owner);
>>> }
>>> -#endif
>>>
>>> -static void console_find_owner(void)
>>> +static bool console_owner_possible(domid_t domid)
>>> {
>>> - unsigned int next_rx = console_owner;
>>> -
>>> - /*
>>> - * Rotate among Xen, dom0 and boot-time created domUs while skipping
>>> - * switching serial input to non existing domains.
>>> - /
>>> - for ( ; ; )
>>> - {
>>> - domid_t domid;
>>> - struct domain d;
>>> -
>>> - if ( next_rx++ >= max_console_rx )
>>> - {
>>> - console_owner = 0;
>>> - printk("* Serial input to Xen");
>>> - break;
>>> - }
>>> -
>>> - if ( consoled_is_enabled() && next_rx == 1 )
>>> - domid = get_initial_domain_id();
>>> - else
>>> - domid = next_rx - 1;
>>> -
>>> - d = rcu_lock_domain_by_id(domid);
>>> - if ( d == NULL )
>>> - continue;
>>> -
>>> - if ( d->is_console )
>>> - {
>>> - rcu_unlock_domain(d);
>>> - console_owner = next_rx;
>>> - printk("*** Serial input to DOM%u", domid);
>>> - break;
>>> - }
>>> + struct domain *d;
>>>
>>> + d = rcu_lock_domain_console_by_id(domid);
>>> + if ( d != NULL )
>>> rcu_unlock_domain(d);
>>> - }
>>> +
>>> + return d != NULL;
>>> +}
>>> +
>>> +int console_set_owner(domid_t domid)
>>> +{
>>> + if ( domid == DOMID_XEN )
>>> + printk("*** Serial input to Xen");
>>> + else if ( console_owner_possible(domid) )
>>> + printk("*** Serial input to DOM%u", domid);
>>> + else
>>> + return -ENOENT;
>>> +
>>> + console_owner = domid;
>>>
>>> if ( switch_code )
>>> printk(" (type 'CTRL-%c' three times to switch input)",
>>> opt_conswitch[0]);
>>> printk("\n");
>>> +
>>> + return 0;
>>> +}
>>> +
>>> +/*
>>> + * Switch console input focus.
>>> + * Rotates input focus among Xen, dom0 and boot-time created domUs while
>>> + * skipping switching serial input to non existing domains.
>>> + */
>>> +static void console_find_owner(void)
>>> +{
>>> + domid_t i, n = max_init_domid + 1;
>>
>>
>> n can be made const, I would even rename to nr for clarity, but that's
>> personal taste.
> 
> `max_init_domid` can change at run-time actually (e.g. after `xl create`).
> I kept `n` as is.

How does max_init_domid potentially changing affect (possible) const-ness of n?

However it changing, ...

>>> +
>>> + if ( console_owner == DOMID_XEN )
>>> + i = get_initial_domain_id();
>>> + else
>>> + i = console_owner + 1;
>>> +
>>> + for ( ; i < n; i++ )
>>> + if ( !console_set_owner(i) )
>>> + break;
>>
>>
>> Hm, that could be a non-trivial amount of iteration if max_init_domid
>> is bumped for every domain created as you have it in patch 11/35
>> (albeit I'm not sure that was intended?)
> 
> Yes, `max_init_domid` is advanced on each domain creation (v3).

... as you confirm here, undermines what it's used for right now (if I'm
not mistaken), and would render the variable misnamed.

Jan

