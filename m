Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE129DFD4C
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 10:36:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846439.1261607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI2qg-0006jL-P6; Mon, 02 Dec 2024 09:36:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846439.1261607; Mon, 02 Dec 2024 09:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI2qg-0006h5-M2; Mon, 02 Dec 2024 09:36:10 +0000
Received: by outflank-mailman (input) for mailman id 846439;
 Mon, 02 Dec 2024 09:36:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tI2qf-0006gv-At
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 09:36:09 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d864f676-b090-11ef-99a3-01e77a169b0f;
 Mon, 02 Dec 2024 10:36:02 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aa51b8c5f4dso591857866b.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 01:36:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa599953c81sm490983466b.184.2024.12.02.01.36.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 01:36:01 -0800 (PST)
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
X-Inumbo-ID: d864f676-b090-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzQiLCJoZWxvIjoibWFpbC1lajEteDYzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQ4NjRmNjc2LWIwOTAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMzMTMyMTYyLjU3NjI3NSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733132162; x=1733736962; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ncVPVMFQselSNH82zaKBtknHPQnp5qdgaOeaIudmg2c=;
        b=BmPu7z82HPknDZvHy97v947tjHrpX4m0sWolvSx00uhBj83g4egXbIPw2yXm2rsAUk
         msuSoTG2WBpqL2Sgzu/Nz1IJLcarPApAQ4I87nbPokoohZlLPI7CJdh54ujm7n2oUKWn
         nsAwefzMIW72rImu2wwkRt0xARexBKFsgNP7OjaW5eD89nA8JIE6hcUO5BJ3wDa1WcUb
         kuKbd+E5vNxjRX8jkHKmQnBbBphUN3PgtJXrMVbu7wMQ8CHdg3XMcGqJfUrivh6jCrXB
         8B3CzZIYBrjy8m+cKgwCByT3f7K9uTbr20KLQPmAC+lMfEEto2XCYVnqyMyfqKPz6I2h
         Gy2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733132162; x=1733736962;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncVPVMFQselSNH82zaKBtknHPQnp5qdgaOeaIudmg2c=;
        b=uo2r5UssXQbMvaoq2AdF7yIzbZzo2ufqy1ZjfByX2WelLVT0mobr3BV3LwKWFM8JLU
         u78ZCyOWKBAYYYGWGGwgkt73/3ycYCqXI6DbhNt4FBHLkaFyhqB/P6KLXhedi6LQiDcm
         Iaz0o19tsjmLdre6Y/Tc1Ssr3hiZNqTu9FUnOBGlLa6QXEO3kO3DQV4tr0SuDNslXD1i
         NGJsX3WOdTmuPxL8ZiK7fQtv18mMzoS+pkT363LGUS4+Gfv7RLO89wXmA3DHLZLPeEzz
         O78bGPFUZrgCFKUY4TRx12V4eDAjCFhYFR/xx0VrV5euy4et6TMe26vAmqgcAkVN5cWt
         Xwpw==
X-Forwarded-Encrypted: i=1; AJvYcCV/ZmUJckhWVIAVmEhAoRd43N/6awA/2DFPdoM6k58UHkVnihAf7QRGJ6VHgl8uaCf1g53VTc7EZNM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzdP5HkWHPZ7q8qArbYQQJVeClTKFd+GrUXVLGT3bT6mzLOdUPs
	p8Hl7o0PB73jGDyVeITde1KmABOWGjOLHNrkQrmAZS1Pa/sJoUCG3/krwyNaLQ==
X-Gm-Gg: ASbGncvM6FYVYjBlv59u2oVeMqVcQEgQL+LfyNLc1fTgpCBRmw0+MkVKsTuubOg1E9z
	Ww31pQDiVI/4xdCJKNsUq8CLuLmQc9hARxwLk4nUuTR3/eXRhdcnmbG/rcbPX2MpMXhiKPjwunM
	YseeDJzMczpkfz+8BLu4IOPOnGh33ChUHTtH3voEO4YvCI50nFQL6ABsRHzcbkisntN/K3bboMv
	YMQyczTZYGI3fD925yUFo19zzY53YAtw2htxdY3+Sd/G45opRbu8/BGcsB7T4H5qB6Xh0PKLU7n
	7FphVAZbHju6rcahloAI/bqVuZqgwpdLWm4=
X-Google-Smtp-Source: AGHT+IEiPWT8Q61tvpFGosJkm2vcUyjrwxJ5nbL4xZDoImDYb5tV0zVyhSuiBj/DYRIgG2BseUGeAg==
X-Received: by 2002:a17:906:318d:b0:aa4:9ab1:1982 with SMTP id a640c23a62f3a-aa580ecfcf0mr1979870166b.4.1733132161944;
        Mon, 02 Dec 2024 01:36:01 -0800 (PST)
Message-ID: <31a61fa0-0e3c-4a81-9004-593608b2199a@suse.com>
Date: Mon, 2 Dec 2024 10:36:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/10] tools/hvmloader: Retrieve (x2)APIC IDs from the
 APs themselves
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
 <20241021154600.11745-5-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241021154600.11745-5-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.10.2024 17:45, Alejandro Vallejo wrote:
> --- a/tools/firmware/hvmloader/hvmloader.c
> +++ b/tools/firmware/hvmloader/hvmloader.c
> @@ -224,7 +224,7 @@ static void apic_setup(void)
>  
>      /* 8259A ExtInts are delivered through IOAPIC pin 0 (Virtual Wire Mode). */
>      ioapic_write(0x10, APIC_DM_EXTINT);
> -    ioapic_write(0x11, SET_APIC_ID(LAPIC_ID(0)));
> +    ioapic_write(0x11, SET_APIC_ID(cpu_to_x2apicid[0]));
>  }

In uses like this or ...

> --- a/tools/firmware/hvmloader/mp_tables.c
> +++ b/tools/firmware/hvmloader/mp_tables.c
> @@ -198,8 +198,10 @@ static void fill_mp_config_table(struct mp_config_table *mpct, int length)
>  /* fills in an MP processor entry for VCPU 'vcpu_id' */
>  static void fill_mp_proc_entry(struct mp_proc_entry *mppe, int vcpu_id)
>  {
> +    ASSERT(cpu_to_x2apicid[vcpu_id] < 0xFF );
> +
>      mppe->type = ENTRY_TYPE_PROCESSOR;
> -    mppe->lapic_id = LAPIC_ID(vcpu_id);
> +    mppe->lapic_id = cpu_to_x2apicid[vcpu_id];

... this one (and also in acpi_lapic_id()), I consider the "x2" in the name
actively confusing, despite ...

> --- a/tools/firmware/hvmloader/smp.c
> +++ b/tools/firmware/hvmloader/smp.c
> @@ -29,7 +29,37 @@
>  
>  #include <xen/vcpu.h>
>  
> -static int ap_callin;
> +/**
> + * Lookup table of (x2)APIC IDs.
> + *
> + * Each entry is populated its respective CPU as they come online. This is required
> + * for generating the MADT with minimal assumptions about ID relationships.
> + *
> + * While the name makes "x2" explicit, these may actually be xAPIC IDs if no
> + * x2APIC is present. "x2" merely highlights that each entry is 32 bits wide.
> + */
> +uint32_t cpu_to_x2apicid[HVM_MAX_VCPUS];

... the commentary here.

> +/** Tristate about x2apic being supported. -1=unknown */
> +static int has_x2apic = -1;

Why is this a tristate? Prior to the variable having been set, ...

> +static uint32_t read_apic_id(void)
> +{
> +    uint32_t apic_id;
> +
> +    if ( has_x2apic )
> +        cpuid(0xb, NULL, NULL, NULL, &apic_id);

... this is bogus anyway.

Jan

