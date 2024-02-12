Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 211A18511C6
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 12:07:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679539.1057007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZU8o-0002R3-5T; Mon, 12 Feb 2024 11:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679539.1057007; Mon, 12 Feb 2024 11:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZU8o-0002O2-2N; Mon, 12 Feb 2024 11:06:26 +0000
Received: by outflank-mailman (input) for mailman id 679539;
 Mon, 12 Feb 2024 11:06:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6iVD=JV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZU8n-0002Nw-Ff
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 11:06:25 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1d82173-c996-11ee-98f5-efadbce2ee36;
 Mon, 12 Feb 2024 12:06:23 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-410da137230so4689415e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 03:06:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l13-20020a056000022d00b0033b1b1da2adsm6508190wrz.99.2024.02.12.03.06.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 03:06:22 -0800 (PST)
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
X-Inumbo-ID: c1d82173-c996-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707735982; x=1708340782; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qUnkmWNBQc/+wtjuqNVBCSD2zqxzcbd7I2CDtGO4YNQ=;
        b=I7jz3jihBxy2uf/tNfkf7Mdatv71ZvexW2kZG+EccyiM3c/nWQONYhzu9SKKlFyCUk
         ahytaqWnPX84fmP5kSO8l/vGG6N16O4SaafFfJ9EE9w3v0zvLdiyDNvxBeLVIdFEjlhm
         4Gs+lLQul5sNTFH3OZutyCSV6C3Z6qHARlDgeF5nTz5gWQl8pRfe080K97EqhTt6LcwT
         mFHiM7C+xdG5l5c7KJTmCoBL/AHIlYuljYSjcZFtNg+b1ZUOdxXXEtcC93meHS8pISpy
         F1EzMlcPyxzZWGt4jAGKulTHP+095ucRtcWM6KlfI2PFHTW5VC7Q0rYDHFCeJ2lrveDa
         MjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707735982; x=1708340782;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qUnkmWNBQc/+wtjuqNVBCSD2zqxzcbd7I2CDtGO4YNQ=;
        b=wj7EACvHYzaTxPh3Ai96fwsBtz8qREKI5zqjXy75y9fYNTtaOijet4APog6knOnNuG
         NkDs5pbDy5KG5ABT5Tz841G7zrkd+Dc6HfjX8tletbONxcHTUW+qDV74lRN6vmnH+NXu
         /3EWdiKqxpgxBo3uYdo/6HhZUeQwm5rjBMwludR0ljys+m4IUH4Je+1YdymhupCr0tD9
         58zlEl8JSRuluHxG9fIMeijpJ8kgB+dwW+WPUTzs1mV6zEChjQNO1vQrqCFLb5/kT3Bi
         NYItuzz+pYlWowtrpHQa5L7efF7KHXL8xZTRw8fGT4kg41XnVkRIgyD+DqKprossutf1
         5q2A==
X-Gm-Message-State: AOJu0Yw5JzLWNzly9QCvq2M7GtGAvqa+0SVdRKql5+1NjN+CCXBsgybv
	RVRi/1ozg0/2Ig0yMoEUIwB4fbFf1hRbu3GJBIDVAhvIHPJs04hqzClKiVPZBQ==
X-Google-Smtp-Source: AGHT+IGg30SJb2SYCqeEXMX4oYCrPVQOqaOxZ4UENOU93suGmLWaV2lB474W2j6Dn272i1p0ZjbDyQ==
X-Received: by 2002:a5d:4987:0:b0:33b:3ad8:22c5 with SMTP id r7-20020a5d4987000000b0033b3ad822c5mr4085479wrq.68.1707735982544;
        Mon, 12 Feb 2024 03:06:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWhYkGuE6gMRxFt+7QVih3RnX5OHvBWaUKfIRHMupXDTKBrFNjPJi9I2LjusY5PVfFSCIfnnUyPxm2HLGX/7esm/9ZdkEllKZGxUYAg/ZaIVfZ7
Message-ID: <f4ed0cbb-0a3a-400f-afc7-19716b403ca1@suse.com>
Date: Mon, 12 Feb 2024 12:06:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] VT-d: respect ACPI SATC's ATC_REQUIRED flag
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
References: <25506838-b818-4686-8c16-3a198338af44@suse.com>
 <72496fb7-8835-4d45-bd92-7e7d612861c7@suse.com> <ZcTMNkGvBT5S5z7L@macbook>
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
In-Reply-To: <ZcTMNkGvBT5S5z7L@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.02.2024 13:42, Roger Pau Monné wrote:
> On Mon, Feb 05, 2024 at 02:56:14PM +0100, Jan Beulich wrote:
>> When the flag is set, permit Dom0 to control the device (no worse than
>> what we had before and in line with other "best effort" behavior we use
>> when it comes to Dom0), but suppress passing through to DomU-s unless
>> ATS can actually be enabled for such devices.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Is ats_device() using acpi_find_matched_atsr_unit() unconditionally
>> actually correct? Shouldn't that check be skipped for root complex
>> integrated devices?
> 
> Yes, I think so, ATSR only lists root ports supporting ATS, because
> the root complex is assumed to always be ATS capable.
> 
> None of this seems to be working then for PCIe endpoints directly in
> the root complex, as ats_device() will always return 0?

That's my understanding. I've now added a bugfix patch near the front of
the series.

>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -225,7 +225,10 @@ exceptions (watchdog NMIs and unexpected
>>  > Default: `false`
>>  
>>  Permits Xen to set up and use PCI Address Translation Services.  This is a
>> -performance optimisation for PCI Passthrough.
>> +performance optimisation for PCI Passthrough.  Note that firmware may indicate
>> +that certain devices need to have ATS enabled for proper operation. For such
>> +devices ATS will be enabled by default, unless the option is used in its
>> +negative form.
> 
> I'm kind of worried that we add this support while maintaining the
> WARNING below.  If I was an admin I would certainly be worried whether
> my system could lock-up during normal operations, even with the
> devices assigned to dom0 and not a malicious domain.
> 
> I know that enabling ATS is forced on us from DMAR, but still.

I'm with you; see below.

>> --- a/xen/drivers/passthrough/vtd/iommu.c
>> +++ b/xen/drivers/passthrough/vtd/iommu.c
>> @@ -2364,6 +2364,25 @@ static int cf_check intel_iommu_add_devi
>>      if ( ret )
>>          dprintk(XENLOG_ERR VTDPREFIX, "%pd: context mapping failed\n",
>>                  pdev->domain);
>> +    else if ( !pdev->broken )
>> +    {
>> +        const struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
>> +        const struct acpi_satc_unit *satc = acpi_find_matched_satc_unit(pdev);
>> +
>> +        /*
>> +         * Prevent the device from getting assigned to an unprivileged domain
>> +         * when firmware indicates ATS is required, but ATS could not be enabled
>> +         * (e.g. because of being suppressed via command line option).
>> +         */
> 
> I think a safer policy would be to prevent assigning any device that
> has atc_required set unless opt_ats > 1 (ie: the user has explicitly
> opted-in to the usage of ATS).
> 
> While we can't likely avoid ATS being enabled for devices having the
> ATC_REQUIRED flag, we shouldn't allow passthrough to possibly
> untrusted guests without notice.

Switched to that model, including respective wording in the cmdline doc.

Jan

