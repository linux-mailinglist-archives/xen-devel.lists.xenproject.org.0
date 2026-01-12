Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F00D12038
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 11:50:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200049.1516063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfFUZ-0004ii-JC; Mon, 12 Jan 2026 10:49:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200049.1516063; Mon, 12 Jan 2026 10:49:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfFUZ-0004gk-GY; Mon, 12 Jan 2026 10:49:47 +0000
Received: by outflank-mailman (input) for mailman id 1200049;
 Mon, 12 Jan 2026 10:49:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qluw=7R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfFUY-0004ga-2Z
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 10:49:46 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6739b950-efa4-11f0-9ccf-f158ae23cfc8;
 Mon, 12 Jan 2026 11:49:43 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-477a2ab455fso57018215e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 02:49:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8636e588sm137320895e9.0.2026.01.12.02.49.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 02:49:42 -0800 (PST)
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
X-Inumbo-ID: 6739b950-efa4-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768214983; x=1768819783; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nLQganLMBoeE7/Xz9tgB4N14tSzNp/xN8SUtKQ8gP0I=;
        b=ZA1xqmtHOLSAPKSl49Xz/VBm3lkTvWuJwx+vvVa8Fcuyk3ORGeoJsNuld43IcqMGIN
         BX7kafcPc2gCXXISepMEAhotbwjA090KQaJJyK3dWHw88BejEbhuT4O3sz76O4BP20no
         jWjiTYp7kXQ3xQkYgwNonDa2Iz/kPAhV9xUOYa2NG1jPYV6e2LXUx1zHS8Ln/UCxamAX
         lb4iAJxPFOAqLrEkXl2fzJa5KlYLIdZgV6IhxuqNWpdiTUs2rQXIq1pwmOjbHCtmPIq5
         NuDGdRmfgHvd0s2GxYVuVksoywGWS/xgU+41MV72W+OwW55Xftit60SZ+sG1Z49oufyU
         v+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214983; x=1768819783;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLQganLMBoeE7/Xz9tgB4N14tSzNp/xN8SUtKQ8gP0I=;
        b=NcN0bY0PIKkTZV2DtBITGpjs3nPoAvBUdkK5Ab5jrnJv4/yraWLJm8mw1BhRjFdvu8
         dX69L07X8HyZAHMC5hJmHTfOl+ePe7wq0MLYEwdT75Ym1bzqO+VPFl7g12jnG1nWMl7s
         7Ae9OXOrvvcfVdJVOxE7KNWFopCMMgxPd5hzUi7NYJAsJcMrS9PB2hujSNmB+yBzP+uc
         kdwhPEwSQwxTG7/sSez1E8VuFiK++S9G9qtgQLKzxe5motOxUXs3zOfJmB7HiN5igTll
         U0l4vgMA8XYOVcsPHTqV6bAdt8MFEY2Ey92KqAPSQmhekB7ecZcNZnVIJL4isoAMUGKR
         Cqyg==
X-Forwarded-Encrypted: i=1; AJvYcCVQfW5hdjF90BZnXqjHMUdh/G5VwcdRZi6O9On7dgvQvdQQwcRKDKB0I/igYM1ExAROL5BcHgxQiSQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywssuqd1TiR3QQzyDz9Ln7r5kt4TmkQAPG8T+uwdPGGaaNw623t
	OrZK9u2WSSaP4uj/hwzf/N8iS10uvN0FMBx+DTo0hcHPB0fNitQtK8S/VRZ9czXrFA==
X-Gm-Gg: AY/fxX6lto29VvKZpqYTAr4G0X36Gbwbgj10s9k2l2vTFsoDYIE6o9Lrd2s56C332uU
	6Wf31ChbksVCZ5uB0FWzYET2+82qQ5t6mq7fglz/f/5lr7PETHb3r6F6d5pmFuG6SuLYWs/JNUb
	T6zLyIpykDQ8zDxE8iocy57zyfSr7zPoohIPH8WZf/gNeky/1HH2B3/N8omEQSHYTcpMMaJl9Jx
	JrFc3TjaxGC/6ymuQ7xWHlblXsGaYbhxYFpjuTwsLaOkOqgUKAK2MGn7QhqosTZ+REJ97H49x8L
	1XCX85ynQGB8qvYljpyUWkxXigo2+XAhyLkYzUgVtmdAv3QROsmUkZGgOWxzHpUzkewuwXCIoVf
	sXefLezGaCRvsy4wRxjC9Stpqohpb5zV/FIXg5GRUVNSDHKCHbSkFeUMSQSjWtRiKYafEHG44/m
	NwjWu3ppKWLbXtyUidw25WcC0QOqsz1kgDy46lbiuLZpLZxk+84td1ifGNdflUxJSbTXFCYVQa8
	bk=
X-Google-Smtp-Source: AGHT+IFRyxlk85ePILke1/Z9tzh7zoD0dvnHhNOhnYsrxWGHGY0mZBQOzPnpj0tD3qRzwuoxbndseg==
X-Received: by 2002:a05:600c:1f13:b0:47d:3ead:7440 with SMTP id 5b1f17b1804b1-47d84b3b772mr198537255e9.32.1768214982872;
        Mon, 12 Jan 2026 02:49:42 -0800 (PST)
Message-ID: <9eda3a84-2a29-416d-80d6-ea0e5c9b4bb5@suse.com>
Date: Mon, 12 Jan 2026 11:49:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] acpi/arm: relax MADT GICC entry length check to
 support newer ACPI revisions
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Yann Dirson <yann.dirson@vates.tech>,
 Yann Sionneau <yann.sionneau@vates.tech>, xen-devel@lists.xenproject.org
References: <a2234959527a420f8736b2789118326b2d3ee35e.1767950420.git.oleksii.kurochko@gmail.com>
 <ad51f470-fd08-41bd-bb0d-7058b1f18ff0@suse.com>
 <ed65056b-c88e-4e94-83a7-8954d6689172@gmail.com>
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
In-Reply-To: <ed65056b-c88e-4e94-83a7-8954d6689172@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.01.2026 17:23, Oleksii Kurochko wrote:
> 
> On 1/9/26 11:03 AM, Jan Beulich wrote:
>> On 09.01.2026 10:27, Oleksii Kurochko wrote:
>>> Newer ACPI revisions define the MADT GICC entry with Length = 82 bytes [1].
>>> The current BAD_MADT_GICC_ENTRY() check rejects entries whose length does not
>>> match the known values, which leads to:
>>>    GICv3: No valid GICC entries exist.
>>> as observed on the AmpereOne platform.
>>>
>>> To fix this, import the logic from Linux commit 9eb1c92b47c7:
>>>    The BAD_MADT_GICC_ENTRY check is a little too strict because
>>>    it rejects MADT entries that don't match the currently known
>>>    lengths. We should remove this restriction to avoid problems
>>>    if the table length changes. Future code which might depend on
>>>    additional fields should be written to validate those fields
>>>    before using them, rather than trying to globally check
>>>    known MADT version lengths.
>>>
>>>    Link:https://lkml.kernel.org/r/20181012192937.3819951-1-jeremy.linton@arm.com
>>>    Signed-off-by: Jeremy Linton<jeremy.linton@arm.com>
>>>    [lorenzo.pieralisi@arm.com: added MADT macro comments]
>>>    Signed-off-by: Lorenzo Pieralisi<lorenzo.pieralisi@arm.com>
>>>    Acked-by: Sudeep Holla<sudeep.holla@arm.com>
>>>    Cc: Will Deacon<will.deacon@arm.com>
>>>    Cc: Catalin Marinas<catalin.marinas@arm.com>
>>>    Cc: Al Stone<ahs3@redhat.com>
>>>    Cc: "Rafael J. Wysocki"<rjw@rjwysocki.net>
>>>    Signed-off-by: Will Deacon<will.deacon@arm.com>
>>>
>>> As ACPI_MADT_GICC_LENGTH is dropped, update the functions where it is
>>> used. As we rewrite the MADT for hwdom, reuse the host GICC header length
>>> instead of ACPI_MADT_GICC_LENGTH.
>>>
>>> Mark gic_get_hwdom_madt_size() as __init since its only caller is also
>>> __init.
>>>
>>> [1]https://uefi.org/specs/ACPI/6.6/05_ACPI_Software_Programming_Model.html#gic-cpu-interface-gicc-structure
>>>
>>> Reported-By: Yann Dirson<yann.dirson@vates.tech>
>>> Co-developed-by: Yann Sionneau<yann.sionneau@vates.tech>
>>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>>> ---
>>> I ran CI tests where it made sense for this patch, as I don’t see any CI job
>>> that builds Xen with CONFIG_ACPI=y:
>>>    https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2252409762
>>>
>>> I also built Xen manually with CONFIG_ACPI=y enabled and tested it on the
>>> AmpereOne platform.
>>> ---
>>>   xen/arch/arm/acpi/domain_build.c |  6 ++++++
>>>   xen/arch/arm/gic-v2.c            |  3 ++-
>>>   xen/arch/arm/gic-v3.c            |  3 ++-
>>>   xen/arch/arm/gic.c               | 13 +++++++++++--
>>>   xen/arch/arm/include/asm/acpi.h  | 21 +++++++++++++++------
>>>   5 files changed, 36 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain_build.c
>>> index 1c3555d814cc..959698d13ac3 100644
>>> --- a/xen/arch/arm/acpi/domain_build.c
>>> +++ b/xen/arch/arm/acpi/domain_build.c
>>> @@ -458,6 +458,12 @@ static int __init estimate_acpi_efi_size(struct domain *d,
>>>       acpi_size += ROUNDUP(sizeof(struct acpi_table_stao), 8);
>>>   
>>>       madt_size = gic_get_hwdom_madt_size(d);
>>> +    if ( !madt_size )
>>> +    {
>>> +        printk("Unable to get hwdom MADT size\n");
>>> +        return -EINVAL;
>>> +    }
>>> +
>>>       acpi_size += ROUNDUP(madt_size, 8);
>>>   
>>>       addr = acpi_os_get_root_pointer();
>>> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
>>> index b23e72a3d05d..aae6a7bf3076 100644
>>> --- a/xen/arch/arm/gic-v2.c
>>> +++ b/xen/arch/arm/gic-v2.c
>>> @@ -1121,7 +1121,8 @@ static int gicv2_make_hwdom_madt(const struct domain *d, u32 offset)
>>>       host_gicc = container_of(header, struct acpi_madt_generic_interrupt,
>>>                                header);
>>>   
>>> -    size = ACPI_MADT_GICC_LENGTH;
>>> +    size = host_gicc->header.length;
>>> +
>>>       /* Add Generic Interrupt */
>>>       for ( i = 0; i < d->max_vcpus; i++ )
>>>       {
>>> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>>> index bc07f97c16ab..75b89efad462 100644
>>> --- a/xen/arch/arm/gic-v3.c
>>> +++ b/xen/arch/arm/gic-v3.c
>>> @@ -1672,7 +1672,8 @@ static int gicv3_make_hwdom_madt(const struct domain *d, u32 offset)
>>>   
>>>       host_gicc = container_of(header, struct acpi_madt_generic_interrupt,
>>>                                header);
>>> -    size = ACPI_MADT_GICC_LENGTH;
>>> +    size = host_gicc->header.length;
>>> +
>>>       for ( i = 0; i < d->max_vcpus; i++ )
>>>       {
>>>           gicc = (struct acpi_madt_generic_interrupt *)(base_ptr + table_len);
>>> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
>>> index ee75258fc3c3..e4fcfd60205d 100644
>>> --- a/xen/arch/arm/gic.c
>>> +++ b/xen/arch/arm/gic.c
>>> @@ -414,12 +414,21 @@ int gic_make_hwdom_madt(const struct domain *d, u32 offset)
>>>       return gic_hw_ops->make_hwdom_madt(d, offset);
>>>   }
>>>   
>>> -unsigned long gic_get_hwdom_madt_size(const struct domain *d)
>>> +unsigned long __init gic_get_hwdom_madt_size(const struct domain *d)
>>>   {
>>>       unsigned long madt_size;
>>> +    const struct acpi_subtable_header *header;
>>> +    const struct acpi_madt_generic_interrupt *host_gicc;
>>> +
>>> +    header = acpi_table_get_entry_madt(ACPI_MADT_TYPE_GENERIC_INTERRUPT, 0);
>>> +    if ( !header )
>>> +        return 0;
>>> +
>>> +    host_gicc = container_of(header, const struct acpi_madt_generic_interrupt,
>>> +                             header);
>>>   
>>>       madt_size = sizeof(struct acpi_table_madt)
>>> -                + ACPI_MADT_GICC_LENGTH * d->max_vcpus
>>> +                + host_gicc->header.length * d->max_vcpus
>> Just to double-check: All entries are strictly required to be of the same
>> length? (Related question further down.)
> 
> If I understood the ACPI spec correctly, then yes, it should be the same length,
> as|GICC->length| is defined as a well defined constant value (82 in ACPI 6.6):
>   https://uefi.org/specs/ACPI/6.6/05_ACPI_Software_Programming_Model.html#gic-cpu-interface-gicc-structure

It's not entirely explicit there, but my reading would concur. Then ...

>>> --- a/xen/arch/arm/include/asm/acpi.h
>>> +++ b/xen/arch/arm/include/asm/acpi.h
>>> @@ -53,13 +53,22 @@ void acpi_smp_init_cpus(void);
>>>    */
>>>   paddr_t acpi_get_table_offset(struct membank tbl_add[], EFI_MEM_RES index);
>>>   
>>> -/* Macros for consistency checks of the GICC subtable of MADT */
>>> -#define ACPI_MADT_GICC_LENGTH	\
>>> -    (acpi_gbl_FADT.header.revision < 6 ? 76 : 80)
>> Given this, ...
>>
>>> +/*
>>> + * MADT GICC minimum length refers to the MADT GICC structure table length as
>>> + * defined in the earliest ACPI version supported on arm64, ie ACPI 5.1.
>>> + *
>>> + * The efficiency_class member was added to the
>>> + * struct acpi_madt_generic_interrupt to represent the MADT GICC structure
>>> + * "Processor Power Efficiency Class" field, added in ACPI 6.0 whose offset
>>> + * is therefore used to delimit the MADT GICC structure minimum length
>>> + * appropriately.
>>> + */
>>> +#define ACPI_MADT_GICC_MIN_LENGTH   ACPI_OFFSET( \
>>> +    struct acpi_madt_generic_interrupt, efficiency_class)
>>>   
>>> -#define BAD_MADT_GICC_ENTRY(entry, end)						\
>>> -    (!(entry) || (unsigned long)(entry) + sizeof(*(entry)) > (end) ||	\
>>> -     (entry)->header.length != ACPI_MADT_GICC_LENGTH)
>>> +#define BAD_MADT_GICC_ENTRY(entry, end) \
>>> +    (!(entry) || (entry)->header.length < ACPI_MADT_GICC_MIN_LENGTH || \
>>> +    (unsigned long)(entry) + (entry)->header.length > (end))
>> ... is 76 a valid length when the FADT revision is 6 or higher? And 80 is a
>> valid length for 6.5 or higher?
> 
> I'm not ACPI expert but my understanding that it isn't "very valid" values as I mentioned
> above GICC->length is defined as a constant value. But the idea here is to provide
> forward compatibility so only minumum MADT GICC length is checked and as mentioned
> here [1] by one of ACPI for Arm64 maintainer:
>  > - (acpi_gbl_FADT.header.revision < 6 ? 76 : 80) > +#define 
> ACPI_MADT_GICC_MIN_LENGTH ACPI_OFFSET( \ > + struct 
> acpi_madt_generic_interrupt, efficiency_class) >
>    > This makes it 76 always which is fine, just that the first user of
>    > efficiency_class should check for the length before accessing it.
>    > No user of efficiency_class yet, so I am fine with this change.
> 
> And I think the same is true for ACPI 6.3 which adds spe_interrupt and ACPI 6.5
> trbe_interrupt.

... imo precise checks for the version dependent length should be done.

Jan

> [1]https://lore.kernel.org/all/20181015092919.GA1778@e107155-lin/
> 
> ~ Oleksii
> 


