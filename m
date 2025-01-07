Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C07CA039E5
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 09:38:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866115.1277385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV569-0003CR-EQ; Tue, 07 Jan 2025 08:38:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866115.1277385; Tue, 07 Jan 2025 08:38:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV569-0003Aj-Bf; Tue, 07 Jan 2025 08:38:01 +0000
Received: by outflank-mailman (input) for mailman id 866115;
 Tue, 07 Jan 2025 08:37:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tV567-0003Ad-F7
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 08:37:59 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b262c1aa-ccd2-11ef-a0df-8be0dac302b0;
 Tue, 07 Jan 2025 09:37:58 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-385e27c75f4so10942026f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 00:37:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436611ea387sm596268605e9.6.2025.01.07.00.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 00:37:57 -0800 (PST)
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
X-Inumbo-ID: b262c1aa-ccd2-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736239077; x=1736843877; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KbKs+W0RntRsoWrSaFzkuGq0iYhfflCE8MYl6byIj9Y=;
        b=Y/4l+IPZitgQH2Fz+IhiiVjbvABbm8QGFDkWFTTry99of8sFdktpvKkGfgwG5aZeWP
         VruwlkB7UOQWJFgp2tWqgVbgGt8qmOsS6ynPkeUwBVpFuzDZe9CKPh2CVZrnud94EGAJ
         5ekykll/D6wXtAjlz6X3I+fze29n+MPIq987LkHcUEYIchGw5X5Xh7WjX5nt2TnIHdyf
         1DXji/1rDSoWDi5YxHUw5cU8BJ4Dd9hQSsdJzEUvZWUSlbmYzHIw16evRaLJ5ASvjJby
         xiCKsd/KXVfk9J0Sfoh849WGZG23b5uRDCh4ZIVuP9X/FE3tAvC/lWT58JLuUtAMmN+Z
         IxRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736239077; x=1736843877;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KbKs+W0RntRsoWrSaFzkuGq0iYhfflCE8MYl6byIj9Y=;
        b=vCHu+a1A4bzvsnSNSknyUrPFe9Gy0V7luBiClUA/eZA0v5TAS2ODF69r0kitW+iK5j
         g9Xj4xbNSz0pszUYyDpT3DJR4aXAS2/1r0eN9iEdOekmc+B8jIiQRKRJx0ikYpu/viRQ
         PQeFCJe4SC34G5a1iiq82YhGYD7LH9oLVNSGc0fgDeJ5PNHzLPGL2E43hFp0kMx+as5j
         eDoFh4gKyZwo8Fe7GEGud97c86QhNLIWE4tH0bYk0hOTUCUmC1puKxuzyGG2mt5wztLI
         CuegshTEsfpVLKr4c2fjiUtYaEzS/8hliFuN3WbKPOYvUdrkXony/pbqadmnktQBk4F3
         ggSw==
X-Forwarded-Encrypted: i=1; AJvYcCVJrXoexd/dcVaImyJ3fH5pGomkO2mmHQOJTK93dbdJtsicfd6+XKIt4ex2jCBZlZNpo68yBa6geQQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyOoo4AC2U2PS4X3zHnMkyE2orZuIuTYiNVwiAIWhMlta8u98N/
	hktG5OWr9mYWIy88ChXy1qE6rd/x/QiPaheRPUJd1SjvhPIVvYAGGqnm6lrGbg==
X-Gm-Gg: ASbGncstq5gvVxExrknImQd/mw3codX1fs7Xy15RU+BtDMKJ+kFPUgAWxiUeRzIOgsD
	LBDdl7MHbK0rMq2p/bDnRKJ0q04V/88lxkcMkLcs61wZrg3cACT11pZ+EMW4w0rc3nz3DDnk1hs
	uozF9yIFZ9bCG2yUIfyz7C58/NcQ/RNaoFrTj6TdHhCYzTt3PuSpnHrj0X12rLl01bx58zFE4va
	+CyIkFVl3zOhxKjXGmZ9277iNNnPg9As76F6Z9tRgKqGzXeSTRG4BXobymjG+c8ZsaTdKAs4nZA
	ZQFeNmRH0XjQ7tn2vu3QaBkFdTJ13xPjNkfeTfygSQ==
X-Google-Smtp-Source: AGHT+IG0vmTppxEsgz8G6IZFXT62bNiYG3xAYtHaYa2j/jlqWbImpSvB9JdCH3lLi1E1r6hnpbtR6g==
X-Received: by 2002:a5d:5f51:0:b0:385:dedb:a12f with SMTP id ffacd0b85a97d-38a221e27a4mr49780160f8f.6.1736239077531;
        Tue, 07 Jan 2025 00:37:57 -0800 (PST)
Message-ID: <a8b4601c-8c91-4b18-8b4a-2aa3f4655994@suse.com>
Date: Tue, 7 Jan 2025 09:37:55 +0100
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
 <3b9635bc-e196-4a7e-95ea-277172ae052a@suse.com>
 <WdwwQV5SUUes7R0BWeDutEQWGvnv_YSB8yc-jMeij_uOqMPVYTpAkpmojwppDdKmact1UU3eXZ61TMZZf7s3JKMlG8EnNEaCGbPbd_7Qo30=@proton.me>
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
In-Reply-To: <WdwwQV5SUUes7R0BWeDutEQWGvnv_YSB8yc-jMeij_uOqMPVYTpAkpmojwppDdKmact1UU3eXZ61TMZZf7s3JKMlG8EnNEaCGbPbd_7Qo30=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.01.2025 21:03, Denis Mukhin wrote:
> 
> On Monday, January 6th, 2025 at 1:58 AM, Jan Beulich <jbeulich@suse.com> wrote:
> 
>>
>>
>> On 04.01.2025 04:30, Denis Mukhin wrote:
>>
>>> On Thursday, December 12th, 2024 at 2:12 AM, Roger Pau Monné roger.pau@citrix.com wrote:
>>>
>>>> On Thu, Dec 05, 2024 at 08:41:49PM -0800, Denis Mukhin via B4 Relay wrote:
>>>>
>>>>> --- a/xen/drivers/char/console.c
>>>>> +++ b/xen/drivers/char/console.c
>>>>> @@ -463,82 +463,100 @@ static void cf_check dump_console_ring_key(unsigned char key)
>>>>>
>>>>> /*
>>>>> * CTRL-<switch_char> changes input direction, rotating among Xen, Dom0,
>>>>> - * and the DomUs started from Xen at boot.
>>>>> + * and the DomUs.
>>>>> /
>>>>> #define switch_code (opt_conswitch[0]-'a'+1)
>>>>> +
>>>>> /
>>>>> - * console_owner=0 => input to xen
>>>>> - * console_owner=1 => input to dom0 (or the sole shim domain)
>>>>> - * console_owner=N => input to dom(N-1)
>>>>> + * Current console owner domain ID: either Xen or domain w/ d->is_console ==
>>>>> + * true.
>>>>> + *
>>>>> + * Initialized in console_endboot().
>>>>> */
>>>>> -static unsigned int __read_mostly console_owner = 0;
>>>>> +static domid_t __read_mostly console_owner;
>>>>
>>>> Should this be initialized to DOMID_XEN? I assume it doesn't make
>>>> much difference because the variable is not checked before
>>>> console_endboot() anyway, but it might be safer to initialize to a
>>>> value that assigns the console to Xen.
>>>
>>> Fixed.
>>>
>>>>> -#define max_console_rx (max_init_domid + 1)
>>>>> +static struct domain *rcu_lock_domain_console_by_id(domid_t domid)
>>>>> +{
>>>>> + struct domain *d;
>>>>> +
>>>>> + d = rcu_lock_domain_by_id(domid);
>>>>> +
>>>>
>>>> Nit: I would remove this newline.
>>>
>>> Fixed.
>>>
>>>>> + if ( d == NULL )
>>>>> + return NULL;
>>>>> +
>>>>> + if ( d->is_console )
>>>>> + return d;
>>>>> +
>>>>> + rcu_unlock_domain(d);
>>>>> +
>>>>> + return NULL;
>>>>> +}
>>>>>
>>>>> -#ifdef CONFIG_SBSA_VUART_CONSOLE
>>>>> /* Make sure to rcu_unlock_domain after use */
>>>>> struct domain *rcu_lock_domain_console_owner(void)
>>>>> {
>>>>> - if ( console_owner == 0 )
>>>>> - return NULL;
>>>>> - return rcu_lock_domain_by_id(console_owner - 1);
>>>>> + return rcu_lock_domain_console_by_id(console_owner);
>>>>> }
>>>>> -#endif
>>>>>
>>>>> -static void console_find_owner(void)
>>>>> +static bool console_owner_possible(domid_t domid)
>>>>> {
>>>>> - unsigned int next_rx = console_owner;
>>>>> -
>>>>> - /*
>>>>> - * Rotate among Xen, dom0 and boot-time created domUs while skipping
>>>>> - * switching serial input to non existing domains.
>>>>> - /
>>>>> - for ( ; ; )
>>>>> - {
>>>>> - domid_t domid;
>>>>> - struct domain d;
>>>>> -
>>>>> - if ( next_rx++ >= max_console_rx )
>>>>> - {
>>>>> - console_owner = 0;
>>>>> - printk("* Serial input to Xen");
>>>>> - break;
>>>>> - }
>>>>> -
>>>>> - if ( consoled_is_enabled() && next_rx == 1 )
>>>>> - domid = get_initial_domain_id();
>>>>> - else
>>>>> - domid = next_rx - 1;
>>>>> -
>>>>> - d = rcu_lock_domain_by_id(domid);
>>>>> - if ( d == NULL )
>>>>> - continue;
>>>>> -
>>>>> - if ( d->is_console )
>>>>> - {
>>>>> - rcu_unlock_domain(d);
>>>>> - console_owner = next_rx;
>>>>> - printk("*** Serial input to DOM%u", domid);
>>>>> - break;
>>>>> - }
>>>>> + struct domain *d;
>>>>>
>>>>> + d = rcu_lock_domain_console_by_id(domid);
>>>>> + if ( d != NULL )
>>>>> rcu_unlock_domain(d);
>>>>> - }
>>>>> +
>>>>> + return d != NULL;
>>>>> +}
>>>>> +
>>>>> +int console_set_owner(domid_t domid)
>>>>> +{
>>>>> + if ( domid == DOMID_XEN )
>>>>> + printk("*** Serial input to Xen");
>>>>> + else if ( console_owner_possible(domid) )
>>>>> + printk("*** Serial input to DOM%u", domid);
>>>>> + else
>>>>> + return -ENOENT;
>>>>> +
>>>>> + console_owner = domid;
>>>>>
>>>>> if ( switch_code )
>>>>> printk(" (type 'CTRL-%c' three times to switch input)",
>>>>> opt_conswitch[0]);
>>>>> printk("\n");
>>>>> +
>>>>> + return 0;
>>>>> +}
>>>>> +
>>>>> +/*
>>>>> + * Switch console input focus.
>>>>> + * Rotates input focus among Xen, dom0 and boot-time created domUs while
>>>>> + * skipping switching serial input to non existing domains.
>>>>> + */
>>>>> +static void console_find_owner(void)
>>>>> +{
>>>>> + domid_t i, n = max_init_domid + 1;
>>>>
>>>> n can be made const, I would even rename to nr for clarity, but that's
>>>> personal taste.
>>>
>>> `max_init_domid` can change at run-time actually (e.g. after `xl create`).
>>> I kept `n` as is.
>>
>>
>> How does max_init_domid potentially changing affect (possible) const-ness of n?
> 
> Sorry, what I meant is I kept the original name as is in v3.
> Forgot to address `const`.
> 
>>
>> However it changing, ...
>>
>>>>> +
>>>>> + if ( console_owner == DOMID_XEN )
>>>>> + i = get_initial_domain_id();
>>>>> + else
>>>>> + i = console_owner + 1;
>>>>> +
>>>>> + for ( ; i < n; i++ )
>>>>> + if ( !console_set_owner(i) )
>>>>> + break;
>>>>
>>>> Hm, that could be a non-trivial amount of iteration if max_init_domid
>>>> is bumped for every domain created as you have it in patch 11/35
>>>> (albeit I'm not sure that was intended?)
>>>
>>> Yes, `max_init_domid` is advanced on each domain creation (v3).
>>
>>
>> ... as you confirm here, undermines what it's used for right now (if I'm
>> not mistaken), and would render the variable misnamed.
> 
> Yes, the name will be a bit confusing.
> Will something like `last_domid` work?

Well. First and foremost you need to make sure that existing uses of the
variable will continue to function as-is. Aiui that contradicts your
re-purposing of it. Which in turn would eliminate the question of how to
best rename it.

Jan

