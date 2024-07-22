Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA42938EDD
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 14:10:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761803.1171839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVrqx-0004Cx-Iy; Mon, 22 Jul 2024 12:09:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761803.1171839; Mon, 22 Jul 2024 12:09:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVrqx-0004AH-GN; Mon, 22 Jul 2024 12:09:19 +0000
Received: by outflank-mailman (input) for mailman id 761803;
 Mon, 22 Jul 2024 12:09:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sVrqw-0004A9-71
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 12:09:18 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37e2d922-4823-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 14:09:17 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5a108354819so3563429a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 05:09:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30a4d6e67sm6041345a12.17.2024.07.22.05.09.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 05:09:16 -0700 (PDT)
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
X-Inumbo-ID: 37e2d922-4823-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721650156; x=1722254956; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1ODGjjIkswPcEwduhZfJL5a1ukg2QuJ74+piOzsw6g=;
        b=UrEaZXM3DBsq0Zmvlw1szr1skh4c2JnwFrg5Tj7hDa06ULwSzWgzA98yCHep2IgV6c
         auqR0JdoD0C1xbgL4b8towDp9SQ1rI7lhY7pyE0rZpokolLhnSl7ZwPy4EekETj1/7uT
         i8F88cfwiod7udYzREf0Inh51X7kRYoUMO/XYdgIrxU/vBRJKEypHjRyBKS9iQi4ZCs0
         IhsnId6BjBL8eiqdXbeV+m1TDUWKviLYDbJ8ml8nZa8nANmJsAJYaPg86Q9tCRfonG/U
         lmlTUl4tg/BKRn7JjFKorXpDbnfzP4oiOAlgGTzN8VKEJvfHuylIcPq+8QQoq4xoAp3T
         vGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721650156; x=1722254956;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1ODGjjIkswPcEwduhZfJL5a1ukg2QuJ74+piOzsw6g=;
        b=aFMPyDpjzerGUkCfZXplhrW04x7WMOfLEZfv9nzVftSB/wE8Ec0hkz5FEfuIaULSjY
         5eZDzzT1Vq37/60XcN+0hsOHU7j1zrxC8VTGqMl88DEDfjrG461nkH9zgJJzrkFFLWZx
         ugIGv63v9PmftTjDeZejXEQGSy6j4QdIu3G8KZhHEBmYnfFbUiZlbfGqQMja5h7UlQmu
         Qgb08+OO2KNroAI0VRfQuZdEjVqn6LyRLqEHtTzj+XQVliwDRzgs4RUapGdesOreNfGz
         7rK7X3lJbn/dAvMVt9IRVgQVTUfOnXr5U+jx9UXA1THLgGiI+m/peCqio5RWsd093pgn
         z17Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1B5e5X8kY2KPQfL8wAfH9rw3B1LjzSvbhUXQtX1C9ONvpul0bdccfZMfyJ2e+id2We6LKZ5HQscKfwW/o5e4dOffXCfo8nNDsXeh3RCM=
X-Gm-Message-State: AOJu0YyHbeObbPqlGpwzjDldnOURCuaINbKDWQ6FsQWTbRivvWckQeYH
	Odq5rSSNO6yYzvED5PVfOpGuSfJNHL7ydTEKIZus2NKQ78Pyerrr+ULEnNw/hw==
X-Google-Smtp-Source: AGHT+IEqEm3kMlveM6LuDWgYK7mEv9UNyWyWbDjpC5W4BIcpLCu501EmdQ6HypF4tqpQ7YiD/hg0xw==
X-Received: by 2002:a50:d514:0:b0:5a2:a808:a2e0 with SMTP id 4fb4d7f45d1cf-5a478b64758mr3867686a12.4.1721650156570;
        Mon, 22 Jul 2024 05:09:16 -0700 (PDT)
Message-ID: <dce600a3-4b1c-47e9-b336-42ca32e309c5@suse.com>
Date: Mon, 22 Jul 2024 14:09:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] x86/mm: add API for marking only part of a MMIO
 page read only
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.8c9972382c46fce22682bcec2ee28fe2501dd18f.1721356393.git-series.marmarek@invisiblethingslab.com>
 <f0b36fb78b87d2f06c0d33da28ba16cd1d2fa8b9.1721356393.git-series.marmarek@invisiblethingslab.com>
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
In-Reply-To: <f0b36fb78b87d2f06c0d33da28ba16cd1d2fa8b9.1721356393.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.07.2024 04:33, Marek Marczykowski-Górecki wrote:
> @@ -4910,6 +4921,254 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      return rc;
>  }
>  
> +static void __iomem *subpage_mmio_find_page(mfn_t mfn)
> +{
> +    struct subpage_ro_range *entry;

With the function returning void*, my first reaction was to ask why this
isn't pointer-to-const. Yet then ...

> +    list_for_each_entry(entry, &subpage_ro_ranges, list)
> +        if ( mfn_eq(entry->mfn, mfn) )
> +            return entry;

... you're actually returning entry here, just with its type zapped for
no apparent reason. I also question the __iomem in the return type.

> +static int __init subpage_mmio_ro_add_page(
> +    mfn_t mfn,
> +    unsigned int offset_s,
> +    unsigned int offset_e)
> +{
> +    struct subpage_ro_range *entry = NULL, *iter;
> +    unsigned int i;
> +
> +    entry = subpage_mmio_find_page(mfn);
> +    if ( !entry )
> +    {
> +        /* iter == NULL marks it was a newly allocated entry */
> +        iter = NULL;

Yet you don't use "iter" for other purposes anymore. I think the variable
wants renaming and shrinking to e.g. a simple bool.

> +        entry = xzalloc(struct subpage_ro_range);
> +        if ( !entry )
> +            return -ENOMEM;
> +        entry->mfn = mfn;
> +    }
> +
> +    for ( i = offset_s; i <= offset_e; i += MMIO_RO_SUBPAGE_GRAN )
> +    {
> +        bool oldbit = __test_and_set_bit(i / MMIO_RO_SUBPAGE_GRAN,
> +                                        entry->ro_elems);

Nit: Indentation looks to be off by 1 here.

> +        ASSERT(!oldbit);
> +    }
> +
> +    if ( !iter )
> +        list_add(&entry->list, &subpage_ro_ranges);

What's wrong with doing this right in the earlier conditional?

> +int __init subpage_mmio_ro_add(
> +    paddr_t start,
> +    size_t size)
> +{
> +    mfn_t mfn_start = maddr_to_mfn(start);
> +    paddr_t end = start + size - 1;
> +    mfn_t mfn_end = maddr_to_mfn(end);
> +    unsigned int offset_end = 0;
> +    int rc;
> +    bool subpage_start, subpage_end;
> +
> +    ASSERT(IS_ALIGNED(start, MMIO_RO_SUBPAGE_GRAN));
> +    ASSERT(IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN));
> +    if ( !IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN) )
> +        return -EINVAL;

I think I had asked before: Why is misaligned size something that wants a
release build fallback to the assertion, but not misaligned start?

> +static void subpage_mmio_write_emulate(
> +    mfn_t mfn,
> +    unsigned int offset,
> +    const void *data,
> +    unsigned int len)
> +{
> +    struct subpage_ro_range *entry;
> +    volatile void __iomem *addr;
> +
> +    entry = subpage_mmio_find_page(mfn);
> +    if ( !entry )
> +        /* Do not print message for pages without any writable parts. */
> +        return;
> +
> +    if ( test_bit(offset / MMIO_RO_SUBPAGE_GRAN, entry->ro_elems) )
> +    {
> +write_ignored:

Nit: Like you have it further up, labels indented by at least one blank please.

Jan

