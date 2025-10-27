Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71850C0D245
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 12:24:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151507.1482044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDLJz-0000l4-AK; Mon, 27 Oct 2025 11:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151507.1482044; Mon, 27 Oct 2025 11:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDLJz-0000ic-6K; Mon, 27 Oct 2025 11:23:31 +0000
Received: by outflank-mailman (input) for mailman id 1151507;
 Mon, 27 Oct 2025 11:23:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UVx/=5E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vDLJx-0000iW-Ff
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 11:23:29 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b89d6a6-b327-11f0-980a-7dc792cee155;
 Mon, 27 Oct 2025 12:23:27 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-4285169c005so2089233f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Oct 2025 04:23:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952d5773sm14607684f8f.27.2025.10.27.04.23.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 04:23:26 -0700 (PDT)
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
X-Inumbo-ID: 5b89d6a6-b327-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761564206; x=1762169006; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BkwsnQODftF4uCX0TVyMWbqOUknjJKQ7lA5pGWE3VHA=;
        b=Pf7V/SSZB9Zy0kaOBnjD5J1RKbHwnZabdOSIIgZyIOtiQIlXz3TukK4uZRjT+I4jmG
         evwsORco1lUDlXQDpEhpioydz8I6Bos9UqaBZhXQ14eDDorGefzx6xpBhF6jio95r01L
         B8DRPeBqkYNgobuklzxst6mbADStB+tZBR4iz9H4D52wFyR/+eeRbBypa3Dd7flzK18j
         D5JQQhnyCJ6dKK3ngN2zhuEaWy3dAYyFOyJM0w/CS1uT2S1nJii6sk7PJH2PAcEZ8Gg1
         4RAqWvzY8o+E6OKO/6pxeirzdK2VRRYYfQ7md5Hk6JZL4woJhgUIZs22Dp5ly4aNahjS
         CsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761564206; x=1762169006;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BkwsnQODftF4uCX0TVyMWbqOUknjJKQ7lA5pGWE3VHA=;
        b=Kq5b9haLVZYtl6m8SBTboR7vqOwtX+ZLtE3f7sCFB03mK9xRhchPgA/iDu1rGqIFnr
         oTRcMmU8DY5tlH+ZZ/az6DVLYa6ZvN2c8oY1GzD4A0PTuO49y6FZeCgawpIyHyVfYmtk
         FBmUoBqO8C6XgCyp4RKYZA+AxpU2zmjVhPj0nuEGAEKrLQQ6m+ov32oozUkV8wwjE8jR
         7Edo9fq3Y0jNePzNI7B7eAZtrMUY82E1so5gUsyPHft45iU62DH3GdjE7JJoLArSewbU
         hZ1O/YDBWkie9vIk6RRwlNFF+t3xaq8UNaEPq+SqQZj+eord/J59Y0X/nMfMMOaz3EH0
         mk+g==
X-Forwarded-Encrypted: i=1; AJvYcCUgM3ZTBS7l3J6Ue9FUZDMTdcioAB89nnd6Bb9QPm/a5cf2cduaUwjmcX5APLKHH3Uum0BQQsWtOKo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxRei6PjE/tN7MFcm2zr22FNChFy1NQAXkuCfdEM/7xSbWTn0ch
	d458l1sV7ozsJxXYkrIYi6zGWBpClOiYX1qF/DINYSZCFZESZQma4+qnSn2yzuZgbg==
X-Gm-Gg: ASbGnctS8ZsKwtigX7tbY5eSYCmXK1G+V/s9XjDiuJYv+lMNQrhZ6+ZWd0b7ykjHo7u
	T7rekuE5iaBralK8ceSI3yjjquc2gMhIKEt8LtDj1+E9xx1lPpkiyf+FJ75knGb8gh19XrpwYAu
	qoV6Ek2b2o+Htj8+0YLNlpefUIjdobeR0OQ/CsoAilE2ROsU0V6GnaCenoHLkiUpDr/0aE97PB8
	va72mht2zigvBgpEUz7h3qypmf1YP1hz0i5Lp00KHqRAH850rwMNTFSi3VMCp/ldmEdI5RdyMr+
	PY+mBzLmFVeradfY5OFBFt9ScRSem+jgQbELZKHNHYM71ZGAB3aNY0TUOAXDLNikiYMFZSpThkN
	WE7uzUUY50rrRHiVmWS9fDBUG04a8TE/iEqCGC8G3bbGBJ8FQ9MSSIi4H1w4bre8AMIx+Ezstfc
	+7i4sThA+fu9rGsqK09mvGn54D78R5iKP6oJY4q8AhrA8dCjKSibKyXLIdmjTpWxt665bT9wQ=
X-Google-Smtp-Source: AGHT+IE2Y82AeaV5oSbXpvnEYhiWxKJU3Wuu1S3Hx8z73zucAE+K63bW1gUL9Yshm9sXYTKbmlVC5Q==
X-Received: by 2002:a05:6000:1848:b0:428:4354:aa27 with SMTP id ffacd0b85a97d-4284354abc4mr19933932f8f.46.1761564206418;
        Mon, 27 Oct 2025 04:23:26 -0700 (PDT)
Message-ID: <39bad1c0-d134-4766-a051-273740caab14@suse.com>
Date: Mon, 27 Oct 2025 12:23:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/12] VT-d: respect ACPI SATC's ATC_REQUIRED flag
To: Teddy Astie <teddy.astie@vates.tech>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com>
 <e98daa41-c6b6-4f4e-b41d-84006011068d@suse.com>
 <61df4103-7969-4f06-ad0f-374c17195653@vates.tech>
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
In-Reply-To: <61df4103-7969-4f06-ad0f-374c17195653@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.10.2025 15:30, Teddy Astie wrote:
> Le 23/10/2025 à 15:14, Jan Beulich a écrit :
>> When the flag is set, permit Dom0 to control the device (no worse than
>> what we had before and in line with other "best effort" behavior we use
>> when it comes to Dom0), but suppress passing through to DomU-s unless
>> ATS can actually be enabled for such devices (and was explicitly enabled
>> on the command line).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v2: Re-base over new earlier patches.
>>
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -225,7 +225,11 @@ exceptions (watchdog NMIs and unexpected
>>   > Default: `false`
>>   
>>   Permits Xen to set up and use PCI Address Translation Services.  This is a
>> -performance optimisation for PCI Passthrough.
>> +performance optimisation for PCI Passthrough.  Note that firmware may indicate
>> +that certain devices need to have ATS enabled for proper operation. For such
>> +devices ATS will be enabled by default, unless the option is used in its
>> +negative form.  Such devices will still not be eligible for passing through to
>> +guests, unless the option is used in its positive form.
>>   
>>   **WARNING: Xen cannot currently safely use ATS because of its synchronous wait
>>   loops for Queued Invalidation completions.**
> 
> Do we want to address the warning before attempting to unconditionnaly 
> enable ATS in these scenarios ? A unstable hypervisor is likely worse 
> than a non-functionning device to me.

Addressing this requires, afaict, lots of changes. Such devices also can still
only be used by Dom0 unless ATS is explicitly enabled from the command line.
Whether a non-functioning device is worse than a (only possibly) "unstable"
hypervisor is also hard to tell. Dom0 may fail to boot if the "right" device is
affected. ("Possibly" because the synchronous wait loops of course are of
concern only if they end up taking long.)

> Or at least log a warning that ATS is enabled due to a device requiring it.

This would need to be a per-device message, which may not scale very well.

>> --- a/xen/drivers/passthrough/vtd/iommu.c
>> +++ b/xen/drivers/passthrough/vtd/iommu.c
>> @@ -2364,6 +2364,26 @@ static int cf_check intel_iommu_add_devi
>>       if ( ret )
>>           dprintk(XENLOG_ERR VTDPREFIX, "%pd: context mapping failed\n",
>>                   pdev->domain);
>> +    else if ( !pdev->broken )
>> +    {
>> +        const struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
>> +        const struct acpi_satc_unit *satc = acpi_find_matched_satc_unit(pdev);
>> +
>> +        /*
>> +         * Prevent the device from getting assigned to an unprivileged domain
>> +         * when firmware indicates ATS is required, but ATS could not be enabled
>> +         * or was not explicitly enabled via command line option.
>> +         */
>> +        if ( satc && satc->atc_required &&
>> +             (!drhd || ats_device(pdev, drhd) <= 0 ||
>> +              !pci_ats_enabled(pdev->seg, pdev->bus, pdev->devfn) ||
>> +              opt_ats < 0) )
>> +        {
>> +            printk(XENLOG_WARNING "ATS: %pp is not eligible for pass-through\n",
>> +                   &pdev->sbdf);
>> +            pdev->broken = true;
>> +        }
>> +    }
> 
> I don't feel pdev->broken is the right way for signaling ineligibility 
> for passthrough due to policy (ATS required).
> Especially if we eventually consider in the future allowing on a 
> per-domain basis the ability to use ATS (starting with Dom0).

Well, pdev->broken is what we have available. Anything better can come later,
imo. For now the goal has been to at least get in line with the spec. That said,
while - afaik - not written down anywhere, back at the time I got indications
that the "required" in ATC_REQUIRED may not be as strict an indication as the
word may suggest.

Jan

