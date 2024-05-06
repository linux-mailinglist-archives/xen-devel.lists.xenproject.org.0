Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA978BCC8C
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 13:03:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717544.1119854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3w6R-0001qf-U6; Mon, 06 May 2024 11:01:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717544.1119854; Mon, 06 May 2024 11:01:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3w6R-0001oH-Qs; Mon, 06 May 2024 11:01:51 +0000
Received: by outflank-mailman (input) for mailman id 717544;
 Mon, 06 May 2024 11:01:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s3w6R-0001oB-CR
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 11:01:51 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 099cfb21-0b98-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 13:01:49 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d8b2389e73so21787671fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 04:01:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z11-20020a05600c0a0b00b0041c097e20f9sm19322123wmp.25.2024.05.06.04.01.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 04:01:48 -0700 (PDT)
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
X-Inumbo-ID: 099cfb21-0b98-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714993309; x=1715598109; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vPisyKAC+kDGazaUgedMDr6re5zca91pODfF7/dPcps=;
        b=W0MGuR+0Oj4hdJSiJ45FckPaJRg2/qtwdpxtzoMAQ18rU6lFRmoGHJUL0d0iu+67YV
         PwQxuokomwzPa6XE4vVxVnkCuYx0qdiM8lLGsIJ444HxdhSOFCqRCRlhOiUnLz1CDPxk
         gtrcUbUYNpxNAIKSMaVLXdLDQ1lbCx9pbv5f41sGUn+1fLi1LsPvV+t1UOE0B9iUTG/i
         EKToVlSzrE/2KU5qcw8zrI206MOasx5aojDyD6eKQemIVaPg2MLqe/TfOfsCWXA6DCCH
         LfL6i1m1GibqLllccJf+jznQyXPIEjsByu+evMIHZ+5jWZiY/h5eJjhGIdYt/IvIGo9p
         3+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714993309; x=1715598109;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vPisyKAC+kDGazaUgedMDr6re5zca91pODfF7/dPcps=;
        b=SnHRtjm/hPDG16//ZPBU26npq+Im8uFWsag11SF9D85OU3o1rm5JvNGr1quZDs8bI/
         6IiWEMaV/H5tyDPEPO/nNAqDsbDSMeDX1Ol0ORfubw32CWL31vNTj5YWz9vEM0Oq5Y2t
         9pj4K+Rr9qPi2iX4wn4i1OoFZZe11CKD3HxpTiwRjM/dSFj32GsRCS50SckF8Hm2Hqql
         OQKN8ktcOjkEjKTrplOi2MMPsBjzBUnWyYI6WbYRleKdXJthNJyN2P1ETgNRM1Sau2FL
         JpMVPQqrvMVJP7H3629PVZcH+zDV2tuzjROT4vDBCklz4Rr9Y4vZ+0KrYkkSf8Jak4Cx
         2wfw==
X-Gm-Message-State: AOJu0YzSM1Y0jzoKjv8YpVvnMsGVsR1N55aeEWF+1PArGAZojgygeeZ3
	6jtTCi9FowvIYw0WKWfnc64dXpa9N1B/HadYB0k/I37/gNpAbsE74w+6MRsbc2bS7HB+q+QgCEw
	=
X-Google-Smtp-Source: AGHT+IH94xAQRz012cal+dtTIW78sAGXd6hKfHgDijGJnPM5PXBWmIrYOpBIfTC2T3+iyjIC+3M3Sg==
X-Received: by 2002:a2e:b8d2:0:b0:2e1:e8fa:4f4b with SMTP id s18-20020a2eb8d2000000b002e1e8fa4f4bmr7740843ljp.32.1714993309049;
        Mon, 06 May 2024 04:01:49 -0700 (PDT)
Message-ID: <fb687016-6979-4294-8426-a70d579dfb50@suse.com>
Date: Mon, 6 May 2024 13:01:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/12] VT-d: parse ACPI "SoC Integrated Address
 Translation Cache Reporting Structure"s
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>
References: <64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com>
 <c70b250d-2ec4-4254-89cf-d3241dac0d35@suse.com> <Zjiw89WKvy6vJAPn@macbook>
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
In-Reply-To: <Zjiw89WKvy6vJAPn@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.05.2024 12:29, Roger Pau Monné wrote:
> On Thu, Feb 15, 2024 at 11:14:31AM +0100, Jan Beulich wrote:
>> This is a prereq to us, in particular, respecting the "ATC required"
>> flag.
>>
>> Note that ACPI_SATC_ATC_REQUIRED has its #define put in dmar.h, as we
>> try to keep actbl*.h in sync what Linux (who in turn inherit from ACPI
>> CA) has.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Lovely: On the SPR system with the SATC I tried passing "ats" (the
>> "required" flag is clear there), just to then hit "IOMMU#4: QI dev wait
>> descriptor taking too long" while setting up Dom0. The 2nd message there
>> doesn't ever appear, so the request never completes. Not sure whether
>> that's us doing something wrong or the hardware acting up. In the former
>> case I'd generally expect an IOMMU fault to be raised, though. FTR same
>> on 4.18 with just "VT-d: correct ATS checking for root complex
>> integrated devices" backported there.
> 
> Great, so we likely have a bug in our ATS implementation?

Or there's a hardware / firmware issue. As said in the remark, while I'm
not really sure which one it is, I'd kind of expect some form of error
indication rather than just a hang if we did something wrong.

>> --- a/xen/drivers/passthrough/vtd/dmar.c
>> +++ b/xen/drivers/passthrough/vtd/dmar.c
>> @@ -47,6 +47,7 @@ LIST_HEAD_READ_MOSTLY(acpi_drhd_units);
>>  LIST_HEAD_READ_MOSTLY(acpi_rmrr_units);
>>  static LIST_HEAD_READ_MOSTLY(acpi_atsr_units);
>>  static LIST_HEAD_READ_MOSTLY(acpi_rhsa_units);
>> +static LIST_HEAD_READ_MOSTLY(acpi_satc_units);
> 
> We could even make this one RO after init.

Maybe, after first introducing LIST_HEAD_RO_AFTER_INIT() and then
perhaps switching the others up front. IOW I'd prefer to keep those
consistent and then (if so desired) update them all in one go.

>> @@ -750,6 +751,93 @@ acpi_parse_one_rhsa(struct acpi_dmar_hea
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
>> +        if ( !pci_device_detect(satcu->segment, b, d, f) )
>> +        {
>> +            dprintk(XENLOG_WARNING VTDPREFIX,
>> +                    " Non-existent device (%pp) is reported in SATC scope!\n",
>> +                    &PCI_SBDF(satcu->segment, b, d, f));
>> +            ignore = true;
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
>> +                " Ignore SATC for seg %04x as no device under its scope is PCI discoverable\n",
>> +                satcu->segment);
> 
> Re the error messages: won't it be better to print them using plain
> printk and gate on iommu_verbose being enabled if anything?
> 
> It does seem a bit odd that such messages won't be printed when
> iommu={debug,verbose} is enabled on the command line.

Well, perhaps yes. Yet I'm trying here to stay (largely) in sync with how
in particular register_one_rmrr() behaves. Do you strictly think I should
diverge here?

>> +static int __init
>> +acpi_parse_one_satc(const struct acpi_dmar_header *header)
>> +{
>> +    const struct acpi_dmar_satc *satc =
>> +        container_of(header, const struct acpi_dmar_satc, header);
>> +    struct acpi_satc_unit *satcu;
>> +    const void *dev_scope_start, *dev_scope_end;
>> +    int ret = acpi_dmar_check_length(header, sizeof(*satc));
>> +
>> +    if ( ret )
>> +        return ret;
>> +
>> +    satcu = xzalloc(struct acpi_satc_unit);
>> +    if ( !satcu )
>> +        return -ENOMEM;
>> +
>> +    satcu->segment = satc->segment;
>> +    satcu->atc_required = satc->flags & ACPI_SATC_ATC_REQUIRED;
>> +
>> +    dev_scope_start = (const void *)(satc + 1);
>> +    dev_scope_end   = (const void *)satc + header->length;
> 
> Isn't it enough to just cast to void * and inherit the const from the
> left side variable declaration?

Misra won't like the (transient) removal of const, afaict. Personally I
also consider it bad practice to omit such const.

> You could even initialize dev_scope_{start,end} at definition.

Right. This is again the way it is to be in sync with other
acpi_parse_one_...() functions. It's always hard to judge where to diverge
and where consistency is weighed higher. Whichever way you do it, you may
get comment asking for the opposite ...

Jan

