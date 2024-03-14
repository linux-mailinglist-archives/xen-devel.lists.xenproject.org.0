Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 681A287BE01
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 14:50:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693249.1081101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rklTD-0000DC-RL; Thu, 14 Mar 2024 13:50:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693249.1081101; Thu, 14 Mar 2024 13:50:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rklTD-00009g-Nr; Thu, 14 Mar 2024 13:50:07 +0000
Received: by outflank-mailman (input) for mailman id 693249;
 Thu, 14 Mar 2024 13:50:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rklTB-0008R1-H9
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 13:50:05 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2989781-e209-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 14:50:04 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5683247fd0fso1415271a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 06:50:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fe4-20020a056402390400b00567e27c72c4sm724838edb.62.2024.03.14.06.50.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 06:50:02 -0700 (PDT)
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
X-Inumbo-ID: c2989781-e209-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710424204; x=1711029004; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jyMhEAcE+ONrg9SbjkT2CneQMZ+uB2RNa9WH9aBaYxg=;
        b=O+DTg6aP1C8ylTngN/zZHoH6wueaD9gZDOCEQ+JIk7/04U4P0lEGMkrWOA2Y3y0w8S
         smG8ljqL1eWv+lXwDWi0qNZMexywc+sTiSuv23eCeSOEnuTkmbhQZN6RouvQ855EJin/
         oWuYkfC51ppCPVZLL2NRKyvS3TuL3shCTayk4KAvZ68eOE9/ZGoJVBOLDkWL8n1UVR4L
         eR9Uh13vfNKRpf3b4Z0Aqoltbtw8PpUFly5DF7bsMpUFuoy9516Z3XuL45CYVpOAJD1+
         vDSkgrAIWYKR3petmuAPPWu81UGYrBkiJ8JJHW4AxOlzvGLes4d9MHEf10X/BP9yj4wh
         cPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710424204; x=1711029004;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jyMhEAcE+ONrg9SbjkT2CneQMZ+uB2RNa9WH9aBaYxg=;
        b=kIgsIdocMYrD/PW7qKatPVjf2B6H4m/U8HuMWTvqgLaTMGOw+e1oUqIxJB3Cp49lhs
         96gpK4Qrc0uhfM51s3rxOx8jITdxICRQUWSyyPgYoj8iq6HL72e9mpQfQ8jFwhrXdykL
         C41QdHh5w9Wx40FWx+U3rmXy+jfrk8XTSZwxmyYzbVRXQ3ys3h0EIer4hRRYMgjFakJ3
         65iNcV1ruwNsuYCwz33hKWHGb00BbjhlQClzHtY9dbfUKloazTNhmGlLNl7QQBTTw408
         lItYErLaWzztmpxCNzBG9uYmPFLhJYz/col/uk2Rde5L1Md5j8f4QQOyG3xATxPkZB2P
         KWAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTI05OAQmeFCz6TCcH8M5nQxhAP6rlh7seclnu/+NVRmjSozeWhYD17CNP92OxH7zRCNFWVkiVjIjxRF4+jhU6m6RX6luIvAa1sY8q7jw=
X-Gm-Message-State: AOJu0Yyr2dUYeWWj55NcPjkQy43jBlNfGlFSHPd7jdTkR+rqI8bt9JGV
	QpTaDSyzg2jioaB7FNw22Ho5ke9Ypeyye+XBrb33iJ4fjbbBnRgZJPpCi3mZpg==
X-Google-Smtp-Source: AGHT+IHWv+HiTqJ6lVR/STiwd80AwDbiWqmn8BjWNFxebSXvCOkJFrKSL42QuecRwSLuHFykJcDSPA==
X-Received: by 2002:a05:6402:4495:b0:566:777:af4f with SMTP id er21-20020a056402449500b005660777af4fmr560442edb.1.1710424203799;
        Thu, 14 Mar 2024 06:50:03 -0700 (PDT)
Message-ID: <32a4de1e-94fe-4b44-b95c-55cd1ec7e7e4@suse.com>
Date: Thu, 14 Mar 2024 14:50:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] tools: add x2APIC entries in MADT based on APIC ID
Content-Language: en-US
To: Matthew Barnes <matthew.barnes@cloud.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <cd1a3ce14790af8c1bb4372ef0be5a6cbbb50b1c.1710338145.git.matthew.barnes@cloud.com>
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
In-Reply-To: <cd1a3ce14790af8c1bb4372ef0be5a6cbbb50b1c.1710338145.git.matthew.barnes@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.03.2024 16:35, Matthew Barnes wrote:
> libacpi is a tool that is used by libxl (for PVH guests) and hvmloader
> (for HVM guests) to construct ACPI tables for guests.
> 
> Currently, libacpi only uses APIC entries to enumerate processors for
> guests in the MADT.
> 
> The APIC ID field in APIC entries is an octet big, which is fine for
> xAPIC IDs, but not so for sufficiently large x2APIC IDs.

Yet where would those come from? I can see that down the road we will
have such, but right now I don't think we do. Without saying so, this
change could be mistaken for a fix of an active bug.

> This patch scans each APIC ID before constructing the MADT, and uses the
> x2APIC entry for each vCPU whose APIC ID exceeds the size limit imposed
> by regular APIC entries.

It is my understanding that if you use any x2APIC entry, every CPU needs
to have one.

> @@ -134,27 +151,45 @@ static struct acpi_20_madt *construct_madt(struct acpi_ctxt *ctxt,
>          io_apic->ioapic_id   = config->ioapic_id;
>          io_apic->ioapic_addr = config->ioapic_base_address;
>  
> -        lapic = (struct acpi_20_madt_lapic *)(io_apic + 1);
> +        apicid_entry = io_apic + 1;
>      }
>      else
> -        lapic = (struct acpi_20_madt_lapic *)(madt + 1);
> +        apicid_entry = madt + 1;
>  
>      info->nr_cpus = hvminfo->nr_vcpus;
> -    info->madt_lapic0_addr = ctxt->mem_ops.v2p(ctxt, lapic);
> +    info->madt_lapic0_addr = ctxt->mem_ops.v2p(ctxt, apicid_entry);
>      for ( i = 0; i < hvminfo->nr_vcpus; i++ )
>      {
> -        memset(lapic, 0, sizeof(*lapic));
> -        lapic->type    = ACPI_PROCESSOR_LOCAL_APIC;
> -        lapic->length  = sizeof(*lapic);
> -        /* Processor ID must match processor-object IDs in the DSDT. */
> -        lapic->acpi_processor_id = i;
> -        lapic->apic_id = config->lapic_id(i);
> -        lapic->flags = (test_bit(i, hvminfo->vcpu_online)
> -                        ? ACPI_LOCAL_APIC_ENABLED : 0);
> -        lapic++;
> +        uint32_t apic_id = config->lapic_id(i);
> +        if ( apic_id < 255 )

Nit (here and below): This file uses hypervisor coding style. and hence a
blank line is wanted between declaration(s) and statement(s).

> +        {
> +            struct acpi_20_madt_lapic *lapic = apicid_entry;
> +            memset(lapic, 0, sizeof(*lapic));
> +            lapic->type    = ACPI_PROCESSOR_LOCAL_APIC;
> +            lapic->length  = sizeof(*lapic);
> +            /* Processor ID must match processor-object IDs in the DSDT. */
> +            lapic->acpi_processor_id = i;
> +            lapic->apic_id = apic_id;
> +            lapic->flags = (test_bit(i, hvminfo->vcpu_online)
> +                            ? ACPI_LOCAL_APIC_ENABLED : 0);
> +            apicid_entry = lapic + 1;
> +        }
> +        else
> +        {
> +            struct acpi_20_madt_x2apic *x2apic = apicid_entry;
> +            memset(x2apic, 0, sizeof(*x2apic));
> +            x2apic->type    = ACPI_PROCESSOR_LOCAL_X2APIC;
> +            x2apic->length  = sizeof(*x2apic);
> +            x2apic->apic_id = apic_id;
> +            x2apic->flags   = (test_bit(i, hvminfo->vcpu_online)
> +                                ? ACPI_LOCAL_APIC_ENABLED : 0);

Nit: Indentation off by 1.

Jan

