Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F18F850FC9
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 10:32:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679420.1056854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZSfT-0000WJ-7C; Mon, 12 Feb 2024 09:32:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679420.1056854; Mon, 12 Feb 2024 09:32:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZSfT-0000TG-3N; Mon, 12 Feb 2024 09:32:03 +0000
Received: by outflank-mailman (input) for mailman id 679420;
 Mon, 12 Feb 2024 09:32:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6iVD=JV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZSfR-0000JS-5T
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 09:32:01 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9267e74d-c989-11ee-8a4c-1f161083a0e0;
 Mon, 12 Feb 2024 10:32:00 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-33b728b6981so846408f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 01:32:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bk26-20020a0560001d9a00b0033b1277e95dsm6335462wrb.77.2024.02.12.01.31.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 01:31:59 -0800 (PST)
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
X-Inumbo-ID: 9267e74d-c989-11ee-8a4c-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707730319; x=1708335119; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HfaETnidYyphApd9wup2kjg1zF8iLQfSJLe/NLyFEpE=;
        b=RvzCe1BHNDwgWT6t+yM3DiMroUoVMSTfyVNrjhctneJMp68gjPMQRXwdDejoJ9VZhV
         gagJ4UaNn1h0jwT2FEekCcFy6vfU5L2xifBEg/6nuO34WaafH6Qz3FrtJFKASJ1aj6lD
         1Yq3oH52fPT2/FdwsL5dRcLvWrO3wMoyvZ+4/G/ZOgkGUT6MC/HJyoAtLLXIAWeYALf6
         ky9pOmfLlpLa5GZfEEtTLIJoVocib5fi1chjZhJP+OfZbKHZPeAsCU3TZnQVFchppMbk
         CYEfcr9zHSdT1PYjT3Na2c//8peLU/RAhJHCWy+FB/Ff6fEWHey4KbCWMgdWHjqUF7NK
         3lkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707730319; x=1708335119;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HfaETnidYyphApd9wup2kjg1zF8iLQfSJLe/NLyFEpE=;
        b=wjL+eW+ETkUA/McS//Te9ReA+AtaGa0zwTa4Le2Pk8YVW8sRlJN1BDBXOoQmQBbjbQ
         T9gu4T+McLxMF1ju8AhqqgaRbwdNY4T5Rt1rVL1RT9OPnWJKkd8KArhuYHhYY12R4tLi
         /ukaIjIG+kCwnqftxd1wtnG1XkSggvJNcyFHS2lzpiL8Hz6aTX+yAeLcDvVlBTOe4CzE
         HTH2Ju/2fr9L9g2dIMiQVw77Ro/IBokj6tHoSUw24oR3j83JQ62+TlXCel/JqyIE6q2H
         Bdo5Omv2sPR0NSpboK+Gvjo4RPOjrKx9v0yJB9frcvIURMhei9C3sJ1edXd8CcdDPvoE
         +a/Q==
X-Gm-Message-State: AOJu0Yww0F+A9wAsLYf7Nr6S+5BfYNl17HB46BcSJ3XJ/c5tcaFwFCo8
	h9NQTFCq7km7zDCUb7NoWuFlpsE3wIYTNUcLIpbOv8jQeJ6wUcdVXcb0KYWZcA==
X-Google-Smtp-Source: AGHT+IE6l/bTmUMaI4Bp5FXIpZF81zidKgkOFOGL0Fwh0XBA+cBWJvX5iIhfvnlLnAsLI+EzQdxETQ==
X-Received: by 2002:adf:ec8d:0:b0:33b:5563:3502 with SMTP id z13-20020adfec8d000000b0033b55633502mr3995626wrn.17.1707730319505;
        Mon, 12 Feb 2024 01:31:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUCcoJ+U8ziTA8mFG5wPVz7ZY2bSjGwCpmeYKy4m/RKdz4cr7dtxfDcBGQCLkfdANYEII/g8NgauGGKVA/Fvp4JD82DxvCsiGvFKHV2Eqhq7jno
Message-ID: <8715f268-be7b-43c6-bb55-4839427014f5@suse.com>
Date: Mon, 12 Feb 2024 10:32:00 +0100
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
 <a96fe270-15f1-492e-92d6-2a7ceda11dec@suse.com> <ZcXpwtIDZ5RobRtw@macbook>
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
In-Reply-To: <ZcXpwtIDZ5RobRtw@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.02.2024 10:00, Roger Pau Monné wrote:
> On Thu, Feb 08, 2024 at 04:29:34PM +0100, Jan Beulich wrote:
>> On 08.02.2024 10:17, Roger Pau Monné wrote:
>>> On Mon, Feb 05, 2024 at 02:55:17PM +0100, Jan Beulich wrote:
>>>> +        {
>>>> +            dprintk(XENLOG_WARNING VTDPREFIX,
>>>> +                    " Non-existent device (%pp) is reported in SATC scope!\n",
>>>> +                    &PCI_SBDF(satcu->segment, b, d, f));
>>>> +            ignore = true;
>>>
>>> This is kind of reporting is incomplete: as soon as one device is
>>> found the loop is exited and no further detection happens.  If we want
>>> to print such information, we should do the full scan and avoid
>>> exiting early when a populated device is detected.
>>
>> Not sure I follow, but first of all - these are dprintk()s only, so
>> meant to only help in dev environments. Specifically ...
>>
>>>> +        }
>>>> +        else
>>>> +        {
>>>> +            ignore = false;
>>>> +            break;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    if ( ignore )
>>>> +    {
>>>> +        dprintk(XENLOG_WARNING VTDPREFIX,
>>>> +                " Ignore SATC for seg %04x as no device under its scope is PCI discoverable!\n",
>>
>> ... this message is then issued only bogus entries were found. IOW
>> when a real device was found, there's no real reason to report N
>> other bogus ones, I think.
> 
> I guess it's a question of taste.  I do find it odd (asymmetric
> maybe?) that we stop reporting non-existing devices once a valid
> device is found.  Makes me wonder what's the point of reporting them
> in the first place, if the list of non-existing devices is not
> complete?

Since you look to not be taking this into account, let me re-emphasize
that these are dprintk() only. In the event of an issue, seeing the
log messages you at least get a hint of one device that poses a
problem. That may or may not be enough of an indication for figuring
what's wrong. Making the loop run for longer than necessary when
especially in a release build there's not going to be any change (but
the logic would become [slightly] more complex, as after setting
"ignore" to true we'd need to avoid clearing it back to false) is just
pointless imo. IOW I view this 1st message as merely a courtesy for
the case where the 2nd one would end up also being logged.

>> Plus, whatever we change here ought to also / first change in
>> register_one_rmrr().
> 
> I could live with those looking differently, or register_one_rmrr()
> can be adjusted later.  Existing examples shouldn't be an argument to
> not make new additions better.

While I generally agree with this principle, in cases like this one it
needs weighing against consistency. Which I consider more important
here, to reduce the chance of making mistakes when fiddling with this
code later again.

>>>> +    satcu = xzalloc(struct acpi_satc_unit);
>>>> +    if ( !satcu )
>>>> +        return -ENOMEM;
>>>> +
>>>> +    satcu->segment = satc->segment;
>>>> +    satcu->atc_required = satc->flags & 1;
>>>
>>> I would add this as a define in actbl2.h:
>>>
>>> #define ACPI_DMAR_ATC_REQUIRED (1U << 0)
>>>
>>> Or some such (maybe just using plain 1 is also fine).
>>
>> I intended to do so, but strictly staying in line with what Linux has.
>> To my surprise they use a literal number and have no #define. Hence I
>> didn't add any either.
> 
> I would prefer the define unless you have strong objections, even if
> that means diverging from Linux.

I could probably accept such a #define living in one of dmar.[ch]. I'd
rather not see it go into actbl2.h.

>>>> +
>>>> +    dev_scope_start = (const void *)(satc + 1);
>>>> +    dev_scope_end   = (const void *)satc + header->length;
>>>> +    ret = acpi_parse_dev_scope(dev_scope_start, dev_scope_end,
>>>> +                               &satcu->scope, SATC_TYPE, satc->segment);
>>>> +
>>>> +    if ( !ret && satcu->scope.devices_cnt )
>>>> +    {
>>>> +        ret = register_one_satc(satcu);
>>>> +        /*
>>>> +         * register_one_satc() returns greater than 0 when a specified
>>>> +         * PCIe device cannot be detected. To prevent VT-d from being
>>>> +         * disabled in such cases, reset the return value to 0 here.
>>>> +         */
>>>> +        if ( ret > 0 )
>>>> +            ret = 0;
>>>> +    }
>>>> +    else
>>>> +        xfree(satcu);
>>>
>>> You can safely use scope_devices_free() even if acpi_parse_dev_scope()
>>> failed, so you could unify the freeing here, instead of doing it in
>>> register_one_satc() also.
>>
>> Moving that out of acpi_parse_dev_scope() would feel wrong - if a
>> function fails, it would better not leave cleanup to its caller(s).
> 
> Given that the caller here is the one that did the allocation my
> preference would be to also do the cleanup there - register_one_satc()
> has no need to know what needs freeing, and allows unifying the
> cleanup in a single place.

Hmm, you're right about the odd freeing behavior. I guess I really
ought to change that, but then first for register_one_rmrr() (seeing
that DRHD and ATSR parsing also do it that way). Which then of course
means also touching add_one_user_rmrr().

Jan

