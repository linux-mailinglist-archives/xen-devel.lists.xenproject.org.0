Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D06B3CD5D08
	for <lists+xen-devel@lfdr.de>; Mon, 22 Dec 2025 12:30:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192056.1511412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXe7L-0003EK-Ib; Mon, 22 Dec 2025 11:30:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192056.1511412; Mon, 22 Dec 2025 11:30:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXe7L-0003Cc-Fz; Mon, 22 Dec 2025 11:30:23 +0000
Received: by outflank-mailman (input) for mailman id 1192056;
 Mon, 22 Dec 2025 11:30:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ACBk=64=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vXe7K-0003CW-HW
 for xen-devel@lists.xenproject.org; Mon, 22 Dec 2025 11:30:22 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98edd04e-df29-11f0-9cce-f158ae23cfc8;
 Mon, 22 Dec 2025 12:30:20 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-64b921d9e67so4495389a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Dec 2025 03:30:20 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037ddffd2sm1018618866b.33.2025.12.22.03.30.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 03:30:18 -0800 (PST)
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
X-Inumbo-ID: 98edd04e-df29-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766403020; x=1767007820; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q5eo1GOpbI4BsM2xcCaQjzol8h9Jvok+GrqVM+6DKoc=;
        b=mRQF5/yaU21Y0EfmN6Sqth09SftS15/kb96lwEfmg1n+U//T/mEf02+d+eaV6Ak9M3
         rV2d0mBy3gQ0goN/BnXV3ekny0NnEf84+f4wkQVQaMLHOr45uZJwq7evcyHLbZu//9sf
         g75MEnT0AbQyap5o/rWxCEnRLrY7ay/3b4MdQczPsxTwaVSVtm3IPy20wx7PknMftYzU
         9YinXKP5D7I6P3r2PY/gO6TO8O2ZX39SxgoKN4t3V9xjWBJgkJUOhTmpgE2cF0mtsKIv
         zRV5yd9oxKzhm7i4UE+1OdTT9dYCRLFR6AzpvEMT+46qLDoMfYQd7zb0L52pTRonymP+
         vkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766403020; x=1767007820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q5eo1GOpbI4BsM2xcCaQjzol8h9Jvok+GrqVM+6DKoc=;
        b=WpwGkZoSo/XrNoSVn3pupzBh0wSc/29VH6lX4TjcH68hs+vDe+T8Lh26Y7HXk/zdcq
         tpm4TBZ09F5KktT+TZ5hNrFhM+eO+Iou6plvtYCELe0pLVcgpQSzpsJRLFa5aHe2ML/T
         9HKPj/PlRP+icgf/5771lTshR2eoFVOaNgvqNi85m5c7Lg5i37jZb+3Jhk8gAOhRpcBa
         umx0WRZJYNB+ZrJmHw0c3o1CiVM2fOZRHnrPYu6/lbxVvNHVvACKae7fWW3agtWKNj7Z
         6Xdc3xclQXL3bbhVQY2gdcPyDMdNjgVdz7mNNjGRVpZLn+4QoeeGsUaDk4vsL+UHqX3l
         qTNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUf2M137fn6jJpzJqXV+S0ZMofOqvv81/frjbWmEOKfT5k52xCoBnPtHMeVRNXvvX1GGy5WmRlfaQ0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJuMvpvt4K7Bz4oGXgKY0U15MiWHW3KfSKUADY6GEYH8c8sfgR
	Vt1lJSGakBzcRl7gOjgKVSAsZgudMxjPWss0pmDrRx4pTH0TU8lnNT2H
X-Gm-Gg: AY/fxX5sOMVObzOiJhtpAFWewVj61vRfxqQVQm+T6+hH7LZK7Rb7NXJWP7Zh6a0q8FA
	0FUeCiMTbCn/m2IgLwhkzQA/TPAOSXEVPitdv9KM9LRwOY+gYv0z18PRMhUumYZlYE755u2D9TS
	aPWRDvemznN46jrxP4zFDatKV2X7DuWA20B0j7lhm9TS+mjcGFHkAKOdLqqMLXVqMLz193pnFdw
	+YBGnDY+5efl4114Yq4IdzzzqhFsqOeCJdSooRB1FWdO95ornm/GSpdT3GjBedHgzYAKUAk/oDT
	FiNxyf8VenuZ0fZZbmBWW7/UfV6uW/hIfvLa8yp9srcSY9T5nqwOxCJ7rrWgpPnwPgt/wWiIOR2
	p65wM9+ii1cCg3LVFJKw4nQc3PZ9585vymOX3aTYRxNawsy3AMj2wI60J71E03cQAsgM/0/DzYV
	4Xx6kNz9zt5t313u3OF0Trz3bBGZaQD+K6sPHme3XfvgvN3R+oGKOqNzR65j7wRv1c
X-Google-Smtp-Source: AGHT+IGriFH698Evwm6lhBBFTWiMBKqpvz5wi0TkHBwAaGzJx6oQmWQD5Rj2CQF+wL83nqapUcGk/Q==
X-Received: by 2002:a17:907:9805:b0:b80:10c0:35d9 with SMTP id a640c23a62f3a-b8036ebbe61mr1160291466b.6.1766403019240;
        Mon, 22 Dec 2025 03:30:19 -0800 (PST)
Message-ID: <9ec24ec4-2b9e-425e-b7bc-59eabdc2f421@gmail.com>
Date: Mon, 22 Dec 2025 12:30:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] acpi/arm: relax MADT GICC entry length check to
 support newer ACPI revisions
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Yann Dirson <yann.dirson@vates.tech>,
 Yann Sionneau <yann.sionneau@vates.tech>
References: <929f7a0fb8f92112d445015726db30122a05eb9f.1766060265.git.oleksii.kurochko@gmail.com>
 <36b89039-97e2-464c-8c1a-25981171b32f@xen.org>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <36b89039-97e2-464c-8c1a-25981171b32f@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Julien,

On 12/21/25 11:28 AM, Julien Grall wrote:
> Hi Oleksii,
>
> On 18/12/2025 14:22, Oleksii Kurochko wrote:
>> Newer ACPI revisions define the MADT GICC entry with Length = 82 
>> bytes [1].
>> The current BAD_MADT_GICC_ENTRY() check rejects entries whose length 
>> does not
>> match the known values, which leads to:
>>    GICv3: No valid GICC entries exist.
>> as observed on the AmpereOne platform.
>>
>> To fix this, import the logic from import from Linux commit 9eb1c92:
>
> Shouldn't this be s/from import//?

Agree, 'from import' should be dropped.

>
> Also 7 characters commit ID is too short for Linux and known to clash. 
> You want to use 12 characters (which is also the default for Xen). I 
> usually have the following in my global .gitconfig:
>
>         [core]
>                 abbrev = 12

I'll add the same, thanks for advise.

>
>>    The BAD_MADT_GICC_ENTRY check is a little too strict because
>>    it rejects MADT entries that don't match the currently known
>>    lengths. We should remove this restriction to avoid problems
>>    if the table length changes. Future code which might depend on
>>    additional fields should be written to validate those fields
>>    before using them, rather than trying to globally check
>>    known MADT version lengths.
>>
>>    Link: 
>> https://lkml.kernel.org/r/20181012192937.3819951-1-jeremy.linton@arm.com
>>    Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
>>    [lorenzo.pieralisi@arm.com: added MADT macro comments]
>>    Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
>>    Acked-by: Sudeep Holla <sudeep.holla@arm.com>
>>    Cc: Will Deacon <will.deacon@arm.com>
>>    Cc: Catalin Marinas <catalin.marinas@arm.com>
>>    Cc: Al Stone <ahs3@redhat.com>
>>    Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
>>    Signed-off-by: Will Deacon <will.deacon@arm.com>
>>
>> As ACPI_MADT_GICC_LENGTH is dropped, update the functions where it is
>> used. As we rewrite the MADT for hwdom, reuse the host GICC header 
>> length
>> instead of ACPI_MADT_GICC_LENGTH.
>>
>> [1] 
>> https://uefi.org/specs/ACPI/6.6/05_ACPI_Software_Programming_Model.html#gic-cpu-interface-gicc-structure
>>
>> Reported-By: Yann Dirson <yann.dirson@vates.tech>
>> Co-developed-by: Yann Sionneau <yann.sionneau@vates.tech>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> I ran CI tests where it made sense for this patch, as I don’t see any 
>> CI job
>> that builds Xen with CONFIG_ACPI=y:
>> https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2222160666
>>
>> I also built Xen manually with CONFIG_ACPI=y enabled and tested it on 
>> the
>> AmpereOne platform.
>> ---
>>   xen/arch/arm/gic-v2.c           |  3 ++-
>>   xen/arch/arm/gic-v3.c           |  3 ++-
>>   xen/arch/arm/gic.c              | 12 +++++++++++-
>>   xen/arch/arm/include/asm/acpi.h | 21 +++++++++++++++------
>>   4 files changed, 30 insertions(+), 9 deletions(-)
>>
>> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
>> index b23e72a3d0..aae6a7bf30 100644
>> --- a/xen/arch/arm/gic-v2.c
>> +++ b/xen/arch/arm/gic-v2.c
>> @@ -1121,7 +1121,8 @@ static int gicv2_make_hwdom_madt(const struct 
>> domain *d, u32 offset)
>>       host_gicc = container_of(header, struct 
>> acpi_madt_generic_interrupt,
>>                                header);
>>   -    size = ACPI_MADT_GICC_LENGTH;
>> +    size = host_gicc->header.length;
>> +
>>       /* Add Generic Interrupt */
>>       for ( i = 0; i < d->max_vcpus; i++ )
>>       {
>> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>> index bc07f97c16..75b89efad4 100644
>> --- a/xen/arch/arm/gic-v3.c
>> +++ b/xen/arch/arm/gic-v3.c
>> @@ -1672,7 +1672,8 @@ static int gicv3_make_hwdom_madt(const struct 
>> domain *d, u32 offset)
>>         host_gicc = container_of(header, struct 
>> acpi_madt_generic_interrupt,
>>                                header);
>> -    size = ACPI_MADT_GICC_LENGTH;
>> +    size = host_gicc->header.length;
>> +
>>       for ( i = 0; i < d->max_vcpus; i++ )
>>       {
>>           gicc = (struct acpi_madt_generic_interrupt *)(base_ptr + 
>> table_len);
>> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
>> index ee75258fc3..a0ccda14bf 100644
>> --- a/xen/arch/arm/gic.c
>> +++ b/xen/arch/arm/gic.c
>> @@ -418,8 +418,18 @@ unsigned long gic_get_hwdom_madt_size(const 
>> struct domain *d)
>>   {
>>       unsigned long madt_size;
>>   +    struct acpi_subtable_header *header;
>> +    struct acpi_madt_generic_interrupt *host_gicc;
>
> For both variables, you don't seem to modify the content. So I think 
> they should be const.
>
>> +
>> +    header = 
>> acpi_table_get_entry_madt(ACPI_MADT_TYPE_GENERIC_INTERRUPT, 0);
>> +    if ( !header )
>> +        panic("Can't get GICC entry");
>
> I would feel happier to use panic() in this function if 
> gic_get_hwdom_madt_size() is __init (its only caller is during boot)).

I am okay with making gic_get_hwdom_madt_size() as __init.

>
> An alternative is to stash the GICC size in a global variable.

We also could to return 0 in the case of ( !header ) and then check if the size is zero or not in estimate_acpi_efi_size(),
and if it is zero then just return -EINVAL. Does it make sense?

Thanks!

~ Oleksii

>
>> +
>> +    host_gicc = container_of(header, struct 
>> acpi_madt_generic_interrupt,
>> +                             header);
>> +
>>       madt_size = sizeof(struct acpi_table_madt)
>> -                + ACPI_MADT_GICC_LENGTH * d->max_vcpus
>> +                + host_gicc->header.length * d->max_vcpus
>>                   + sizeof(struct acpi_madt_generic_distributor)
>>                   + gic_hw_ops->get_hwdom_extra_madt_size(d);
>>   diff --git a/xen/arch/arm/include/asm/acpi.h 
>> b/xen/arch/arm/include/asm/acpi.h
>> index 13756dd341..30bc446d1f 100644
>> --- a/xen/arch/arm/include/asm/acpi.h
>> +++ b/xen/arch/arm/include/asm/acpi.h
>> @@ -53,13 +53,22 @@ void acpi_smp_init_cpus(void);
>>    */
>>   paddr_t acpi_get_table_offset(struct membank tbl_add[], EFI_MEM_RES 
>> index);
>>   -/* Macros for consistency checks of the GICC subtable of MADT */
>> -#define ACPI_MADT_GICC_LENGTH    \
>> -    (acpi_gbl_FADT.header.revision < 6 ? 76 : 80)
>> +/*
>> + * MADT GICC minimum length refers to the MADT GICC structure table 
>> length as
>> + * defined in the earliest ACPI version supported on arm64, ie ACPI 
>> 5.1.
>> + *
>> + * The efficiency_class member was added to the
>> + * struct acpi_madt_generic_interrupt to represent the MADT GICC 
>> structure
>> + * "Processor Power Efficiency Class" field, added in ACPI 6.0 whose 
>> offset
>> + * is therefore used to delimit the MADT GICC structure minimum length
>> + * appropriately.
>> + */
>> +#define ACPI_MADT_GICC_MIN_LENGTH   ACPI_OFFSET( \
>> +    struct acpi_madt_generic_interrupt, efficiency_class)
>>   -#define BAD_MADT_GICC_ENTRY(entry, end)                        \
>> -    (!(entry) || (unsigned long)(entry) + sizeof(*(entry)) > (end) 
>> ||    \
>> -     (entry)->header.length != ACPI_MADT_GICC_LENGTH)
>> +#define BAD_MADT_GICC_ENTRY(entry, end) \
>> +    (!(entry) || (entry)->header.length < ACPI_MADT_GICC_MIN_LENGTH 
>> || \
>> +    (unsigned long)(entry) + (entry)->header.length > (end))
>>     #ifdef CONFIG_ACPI
>>   extern bool acpi_disabled;
>
> Cheers,
>

