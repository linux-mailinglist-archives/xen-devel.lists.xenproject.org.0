Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D99984E412
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 16:30:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678275.1055372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY6LM-0007rq-0Q; Thu, 08 Feb 2024 15:29:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678275.1055372; Thu, 08 Feb 2024 15:29:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY6LL-0007qJ-Tx; Thu, 08 Feb 2024 15:29:39 +0000
Received: by outflank-mailman (input) for mailman id 678275;
 Thu, 08 Feb 2024 15:29:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nVk9=JR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rY6LK-0007qD-KQ
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 15:29:38 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dda62a31-c696-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 16:29:36 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40fdc63f4feso18361465e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2024 07:29:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bv7-20020a0560001f0700b0033b525dbc70sm2625796wrb.79.2024.02.08.07.29.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 07:29:35 -0800 (PST)
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
X-Inumbo-ID: dda62a31-c696-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707406176; x=1708010976; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oEYIBMj4q82gAihAcQrBobhfSf02eMg+M+fb0JV5aNw=;
        b=bXa9C0CqFR+eMmo1uvMocIt+XaG4xxus35i2dRvjNU9Gj4UA7PxETGyk+WZFF/03+8
         3aiCLHEN/tdeRSs6IpR96avDnVWSzXAiqGvNhTNlD+AmjTNEWYN1cUTB8+JTHTBqmVME
         HUslw7xhpTLaSVY3RfhNQ7zmXwdd93lDWE6YGeb1B9utZnCoS/fvlWwBfAuQs9ZuPlsD
         YZFG4mV26Q9m06V/W1Co/cwGlMCOLA+M3+FHeIDGoWteXwYSRhTzQv112ckgx65ILsxq
         G5hPXm/IDnC/QzLQvV2vL2FQmC28BFyyoP8qm6+b2vgyS15P8uKZLnmFEWtPR/daYd5S
         +QCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707406176; x=1708010976;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oEYIBMj4q82gAihAcQrBobhfSf02eMg+M+fb0JV5aNw=;
        b=LIi+LRTBjFJCGs2A7yYpTqC7Urfw2awr3c9Xn8856YUirG3Iz1tXwx74HMyNTIfBik
         RHRNFHr2jZGhcn1X5UkwB93nZHL3eCmer3wxVHrF7UK44LQWffBKynRDsYY+cobvwP8o
         +gvVoU3aQAgv8XSIdgbtWINENVQbSSze+iKlyaTgGjuxZzdKKrkTXa1bLJEL2qI6v6ei
         DYCNb4OtUIoKPUr40zvmIKXOzjGlCifJkhr8xC3U/AtBBTjYx2w1rc45sxqJQROJAhZx
         byihLLq8QGph3kFt6B55AGSI9xt5cHbi/RlUDDfNXzPg3zlb5K+wHKeOs2vKkLl7iUPu
         ZHlw==
X-Gm-Message-State: AOJu0YwKqDeJmpguyV/PcMLno07mx8QrJKTYKfmGfylaEEVm9d3FigqN
	tYD2aravP4NqCODKfj0GhgIHJJo9c3larMfesT4UzABaro+5+rxPNtoa7OANwQ==
X-Google-Smtp-Source: AGHT+IH0JHFkLXsmYTwGwWLjWi5WyJrKcrGATWjR0rAhQyA9G5zeCsZo+AG+8UhW2VESqJKVfAwm2w==
X-Received: by 2002:a5d:4e86:0:b0:33b:401f:bd3e with SMTP id e6-20020a5d4e86000000b0033b401fbd3emr4723804wru.41.1707406175655;
        Thu, 08 Feb 2024 07:29:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWSfeAq7Fjb25QTB1r/6B/lo6jcwb8sbcuBxJmJkgn8CzeFFnjobnSP8xRjnRuB+1JOBqtktkgT3FY4cdpcOm8EXBMZHGCfvMlL0i+gWd4AL7Fg
Message-ID: <a96fe270-15f1-492e-92d6-2a7ceda11dec@suse.com>
Date: Thu, 8 Feb 2024 16:29:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] VT-d: parse ACPI "SoC Integrated Address Translation
 Cache Reporting Structure"s
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
References: <25506838-b818-4686-8c16-3a198338af44@suse.com>
 <b5a58dee-9a4c-4833-be59-b52c62f7137d@suse.com> <ZcScJvAhI7CRJhAZ@macbook>
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
In-Reply-To: <ZcScJvAhI7CRJhAZ@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.02.2024 10:17, Roger Pau Monné wrote:
> On Mon, Feb 05, 2024 at 02:55:17PM +0100, Jan Beulich wrote:
>> This is a prereq to us, in particular, respecting the "ATC required"
>> flag.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Should we check scope entries for appropriate types? (If so, then also
>> for e.g. ATSR.)
> 
> Hm, I guess we could do so in acpi_parse_dev_scope() since that
> function already gets passed a 'type' argument.

Right, I transiently had it there, but then dropped it again for being
inconsistent with what we have right now. I'll try to remember to add
another patch.

>> @@ -764,6 +765,95 @@ acpi_parse_one_rhsa(struct acpi_dmar_hea
>>      return ret;
>>  }
>>  
>> +static int __init register_one_satc(struct acpi_satc_unit *satcu)
>> +{
>> +    bool ignore = false;
>> +    unsigned int i = 0;
>> +    int ret = 0;
>> +
>> +    /* Skip checking if segment is not accessible yet. */
>> +    if ( !pci_known_segment(satcu->segment) )
>> +        i = UINT_MAX;
>> +
>> +    for ( ; i < satcu->scope.devices_cnt; i++ )
>> +    {
>> +        uint8_t b = PCI_BUS(satcu->scope.devices[i]);
>> +        uint8_t d = PCI_SLOT(satcu->scope.devices[i]);
>> +        uint8_t f = PCI_FUNC(satcu->scope.devices[i]);
>> +
>> +        if ( pci_device_detect(satcu->segment, b, d, f) == 0 )
> 
> Any reason to explicitly compare against 0?
> 
> if ( !pci_device_detect(satcu->segment, b, d, f) )
> ...
> 
> The function returns a boolean.

Hmm, right - simply a result of copy-and-paste.

>> +        {
>> +            dprintk(XENLOG_WARNING VTDPREFIX,
>> +                    " Non-existent device (%pp) is reported in SATC scope!\n",
>> +                    &PCI_SBDF(satcu->segment, b, d, f));
>> +            ignore = true;
> 
> This is kind of reporting is incomplete: as soon as one device is
> found the loop is exited and no further detection happens.  If we want
> to print such information, we should do the full scan and avoid
> exiting early when a populated device is detected.

Not sure I follow, but first of all - these are dprintk()s only, so
meant to only help in dev environments. Specifically ...

>> +        }
>> +        else
>> +        {
>> +            ignore = false;
>> +            break;
>> +        }
>> +    }
>> +
>> +    if ( ignore )
>> +    {
>> +        dprintk(XENLOG_WARNING VTDPREFIX,
>> +                " Ignore SATC for seg %04x as no device under its scope is PCI discoverable!\n",

... this message is then issued only bogus entries were found. IOW
when a real device was found, there's no real reason to report N
other bogus ones, I think.

Plus, whatever we change here ought to also / first change in
register_one_rmrr().

> (I would drop the '!' at the end, here and above, I don't think they
> add much to the error message)

Sure; copy-and-paste again.

>  I would also use the '#' flag to avoid
> confusion, as in the weird case we have a segment '1234' then without
> the zero padding I wouldn't really know whether it's decimal or hex.

Not really, no. If there's any place we log segment numbers in
decimal, we should change that. They ought to be possible to match
with the usual ssss:bb:dd.f coordinates we log.

>> +    satcu = xzalloc(struct acpi_satc_unit);
>> +    if ( !satcu )
>> +        return -ENOMEM;
>> +
>> +    satcu->segment = satc->segment;
>> +    satcu->atc_required = satc->flags & 1;
> 
> I would add this as a define in actbl2.h:
> 
> #define ACPI_DMAR_ATC_REQUIRED (1U << 0)
> 
> Or some such (maybe just using plain 1 is also fine).

I intended to do so, but strictly staying in line with what Linux has.
To my surprise they use a literal number and have no #define. Hence I
didn't add any either.

>> +
>> +    dev_scope_start = (const void *)(satc + 1);
>> +    dev_scope_end   = (const void *)satc + header->length;
>> +    ret = acpi_parse_dev_scope(dev_scope_start, dev_scope_end,
>> +                               &satcu->scope, SATC_TYPE, satc->segment);
>> +
>> +    if ( !ret && satcu->scope.devices_cnt )
>> +    {
>> +        ret = register_one_satc(satcu);
>> +        /*
>> +         * register_one_satc() returns greater than 0 when a specified
>> +         * PCIe device cannot be detected. To prevent VT-d from being
>> +         * disabled in such cases, reset the return value to 0 here.
>> +         */
>> +        if ( ret > 0 )
>> +            ret = 0;
>> +    }
>> +    else
>> +        xfree(satcu);
> 
> You can safely use scope_devices_free() even if acpi_parse_dev_scope()
> failed, so you could unify the freeing here, instead of doing it in
> register_one_satc() also.

Moving that out of acpi_parse_dev_scope() would feel wrong - if a
function fails, it would better not leave cleanup to its caller(s).

> Also why not make register_one_satc() return a boolean instead of 0/1?

To leave room to also return errors, like register_one_rmrr() does.

For both of these aspects you raise: I'd really like to avoid these
sibling functions going too much out of sync.

>> @@ -817,6 +907,11 @@ static int __init cf_check acpi_parse_dm
>>                  printk(VTDPREFIX "found ACPI_DMAR_RHSA:\n");
>>              ret = acpi_parse_one_rhsa(entry_header);
>>              break;
>> +        case ACPI_DMAR_TYPE_SATC:
>> +            if ( iommu_verbose )
>> +                printk(VTDPREFIX "found ACPI_DMAR_SATC:\n");
>> +            ret = acpi_parse_one_satc(entry_header);
>> +            break;
> 
> I know the surrounding code doesn't use it, but readability would
> benefit from adding a blank line after the break statement.

Well, yes, done so. I'm not generally in favor of introducing such
inconsistencies, but it looks tolerable here. (In cases like this
I do - and did here - consider this as an option, but in most cases
I end up valuing uniform look slightly higher.)

Jan

