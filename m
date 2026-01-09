Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3A0D0B33A
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 17:23:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1199014.1515770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veFGX-00054r-74; Fri, 09 Jan 2026 16:23:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1199014.1515770; Fri, 09 Jan 2026 16:23:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veFGX-000533-4J; Fri, 09 Jan 2026 16:23:09 +0000
Received: by outflank-mailman (input) for mailman id 1199014;
 Fri, 09 Jan 2026 16:23:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhKM=7O=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1veFGW-00052x-7g
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 16:23:08 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ac27f48-ed77-11f0-b15e-2bf370ae4941;
 Fri, 09 Jan 2026 17:23:06 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-64b7318f1b0so6189015a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 09 Jan 2026 08:23:06 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507b8c4454sm10870768a12.3.2026.01.09.08.23.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 08:23:05 -0800 (PST)
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
X-Inumbo-ID: 7ac27f48-ed77-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767975786; x=1768580586; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8SP4g6xKEmy1Piy8k2hQRTNGClSTpFc8kS3x04C1uek=;
        b=fuktFrBeSQWnAhbkcZ+T8F/Z9aeMVScOHctMOQrMD1TSQA+D5lx/j+9RajItl069Az
         se9W3/pz4dUTzMNHcr/Rw1v7xBde8tiWRlDceNl8u+cGZos2s6VySLh1lSAf8emaH3wl
         mnP1PccQugqMFdM69v4z3wZqwwdF6uXhTECAo/lhittWMqFDW2gQkkpVQWrKUx8n3Mnc
         g69bQrHWJT9IwNGgXMUCFaWk8mFG/AeSfT2sZbu8H8DM5w3gGGKOt6c9hCRAF00nvMK5
         0XR4ruuMVUj2kkLpthmGdgh/uKtwfmIwK/Ttw+VJVjAq6MX7vf3m9TarxND9MKblWWZT
         xgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767975786; x=1768580586;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8SP4g6xKEmy1Piy8k2hQRTNGClSTpFc8kS3x04C1uek=;
        b=Apg29w5843PzgiimL77bRSsv24/jcghinOM1Smioi/Hyp//FA7hwiBozfGbu4YcyWl
         rniywoUzlb6z6B29XASg0IqveF5O9ZfbHpbdbNEocm2UsCZpzRbXXGrEoL6HMyvSzLgE
         3C+qpV3kAti8i/qerm+nlKbEspfGwNKWEbSltIz2IfMWWd1B5wByKTC/yORld0vsxpCv
         Qu+ZK/3x0MDQsER1PB2UuYcDr+4IW9k9gNtKE2gBMdBda73O+iCgN+Ej+qa4cZQJYMy3
         CTGDjTS93hG+01Ds67HvOhoctVwB0hxO99xAmlQDEKh9fMpSaCcsvPj1xFykG82XSSqh
         0vLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBvX7RD5glvjp9njFepbeEZF5RFlybkyo5sdEJSPAUJGAEdF72GxvN/qMBEkTD8o/H9eN8bUizBHM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydkH+TVwXT7ZXAxa5hM7gT8qeQHd+JUiC4Dr7RsH+vrqxDZoOS
	Q9qYMwMoKfphR0YEek7A4/L9JKXR/Ln1qKvV0psgUgnHxXInMDyz2uAP
X-Gm-Gg: AY/fxX7aiO/U6LlCN1PXBPck4b3665Bx+BbGltodAN5sq+Lm80bmicKaw2w3ciAeeyN
	ceJRNpPErzgP6NyAoonBXX6Mlhip6OBVBXCERO/kWmAqrTiyJxnEUKmubZKU0zSs8KjRo8L1oXz
	MV6j53lW31ZNb6rWsa3rkZo+ATOJOznc24UvhRUrsGP9YEVL3WZFAQVVdc2o8TbM9J4l2NaeVTI
	CLY/G5VQTAJsmtT7s9OdFlE5zqAU5jjIRzDuqII9J0DioalfJv4TQy8ZMIK7EZJdUPGOQO0M+X0
	iMJGXEtj6uzfgK6IgdwfrN6lUiuvwQeudpxsd/WmRQwggggTIkDHtC30xdrrYfLG4F2ZnJCaZnz
	i9H36gFnGbuhOYZt6S3bMEwxGwovyCjfEH9aMaSvzeleMLVxC4oquZj94maZ5gHlVcdj6v59AXN
	Hv0CXOJW9h/v+OPckxiGnOQX5t8V4847xvV1b1AZ4fLtnlxE05XykERfpU2YsmL8A=
X-Google-Smtp-Source: AGHT+IGRHZk1LG8FKDOR1B7Q/+EHi7FTpi8oRnpe4hOVE1phkaG/lxcsXYSV32JC7d3F4VlnSJzpqw==
X-Received: by 2002:a05:6402:1453:b0:650:2820:38bd with SMTP id 4fb4d7f45d1cf-65097de5b35mr10311835a12.11.1767975785826;
        Fri, 09 Jan 2026 08:23:05 -0800 (PST)
Message-ID: <ed65056b-c88e-4e94-83a7-8954d6689172@gmail.com>
Date: Fri, 9 Jan 2026 17:23:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v3] acpi/arm: relax MADT GICC entry length check to
 support newer ACPI revisions
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Yann Dirson <yann.dirson@vates.tech>,
 Yann Sionneau <yann.sionneau@vates.tech>, xen-devel@lists.xenproject.org
References: <a2234959527a420f8736b2789118326b2d3ee35e.1767950420.git.oleksii.kurochko@gmail.com>
 <ad51f470-fd08-41bd-bb0d-7058b1f18ff0@suse.com>
Content-Language: en-US
In-Reply-To: <ad51f470-fd08-41bd-bb0d-7058b1f18ff0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/9/26 11:03 AM, Jan Beulich wrote:
> On 09.01.2026 10:27, Oleksii Kurochko wrote:
>> Newer ACPI revisions define the MADT GICC entry with Length = 82 bytes [1].
>> The current BAD_MADT_GICC_ENTRY() check rejects entries whose length does not
>> match the known values, which leads to:
>>    GICv3: No valid GICC entries exist.
>> as observed on the AmpereOne platform.
>>
>> To fix this, import the logic from Linux commit 9eb1c92b47c7:
>>    The BAD_MADT_GICC_ENTRY check is a little too strict because
>>    it rejects MADT entries that don't match the currently known
>>    lengths. We should remove this restriction to avoid problems
>>    if the table length changes. Future code which might depend on
>>    additional fields should be written to validate those fields
>>    before using them, rather than trying to globally check
>>    known MADT version lengths.
>>
>>    Link:https://lkml.kernel.org/r/20181012192937.3819951-1-jeremy.linton@arm.com
>>    Signed-off-by: Jeremy Linton<jeremy.linton@arm.com>
>>    [lorenzo.pieralisi@arm.com: added MADT macro comments]
>>    Signed-off-by: Lorenzo Pieralisi<lorenzo.pieralisi@arm.com>
>>    Acked-by: Sudeep Holla<sudeep.holla@arm.com>
>>    Cc: Will Deacon<will.deacon@arm.com>
>>    Cc: Catalin Marinas<catalin.marinas@arm.com>
>>    Cc: Al Stone<ahs3@redhat.com>
>>    Cc: "Rafael J. Wysocki"<rjw@rjwysocki.net>
>>    Signed-off-by: Will Deacon<will.deacon@arm.com>
>>
>> As ACPI_MADT_GICC_LENGTH is dropped, update the functions where it is
>> used. As we rewrite the MADT for hwdom, reuse the host GICC header length
>> instead of ACPI_MADT_GICC_LENGTH.
>>
>> Mark gic_get_hwdom_madt_size() as __init since its only caller is also
>> __init.
>>
>> [1]https://uefi.org/specs/ACPI/6.6/05_ACPI_Software_Programming_Model.html#gic-cpu-interface-gicc-structure
>>
>> Reported-By: Yann Dirson<yann.dirson@vates.tech>
>> Co-developed-by: Yann Sionneau<yann.sionneau@vates.tech>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> ---
>> I ran CI tests where it made sense for this patch, as I don’t see any CI job
>> that builds Xen with CONFIG_ACPI=y:
>>    https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2252409762
>>
>> I also built Xen manually with CONFIG_ACPI=y enabled and tested it on the
>> AmpereOne platform.
>> ---
>>   xen/arch/arm/acpi/domain_build.c |  6 ++++++
>>   xen/arch/arm/gic-v2.c            |  3 ++-
>>   xen/arch/arm/gic-v3.c            |  3 ++-
>>   xen/arch/arm/gic.c               | 13 +++++++++++--
>>   xen/arch/arm/include/asm/acpi.h  | 21 +++++++++++++++------
>>   5 files changed, 36 insertions(+), 10 deletions(-)
>>
>> diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain_build.c
>> index 1c3555d814cc..959698d13ac3 100644
>> --- a/xen/arch/arm/acpi/domain_build.c
>> +++ b/xen/arch/arm/acpi/domain_build.c
>> @@ -458,6 +458,12 @@ static int __init estimate_acpi_efi_size(struct domain *d,
>>       acpi_size += ROUNDUP(sizeof(struct acpi_table_stao), 8);
>>   
>>       madt_size = gic_get_hwdom_madt_size(d);
>> +    if ( !madt_size )
>> +    {
>> +        printk("Unable to get hwdom MADT size\n");
>> +        return -EINVAL;
>> +    }
>> +
>>       acpi_size += ROUNDUP(madt_size, 8);
>>   
>>       addr = acpi_os_get_root_pointer();
>> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
>> index b23e72a3d05d..aae6a7bf3076 100644
>> --- a/xen/arch/arm/gic-v2.c
>> +++ b/xen/arch/arm/gic-v2.c
>> @@ -1121,7 +1121,8 @@ static int gicv2_make_hwdom_madt(const struct domain *d, u32 offset)
>>       host_gicc = container_of(header, struct acpi_madt_generic_interrupt,
>>                                header);
>>   
>> -    size = ACPI_MADT_GICC_LENGTH;
>> +    size = host_gicc->header.length;
>> +
>>       /* Add Generic Interrupt */
>>       for ( i = 0; i < d->max_vcpus; i++ )
>>       {
>> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>> index bc07f97c16ab..75b89efad462 100644
>> --- a/xen/arch/arm/gic-v3.c
>> +++ b/xen/arch/arm/gic-v3.c
>> @@ -1672,7 +1672,8 @@ static int gicv3_make_hwdom_madt(const struct domain *d, u32 offset)
>>   
>>       host_gicc = container_of(header, struct acpi_madt_generic_interrupt,
>>                                header);
>> -    size = ACPI_MADT_GICC_LENGTH;
>> +    size = host_gicc->header.length;
>> +
>>       for ( i = 0; i < d->max_vcpus; i++ )
>>       {
>>           gicc = (struct acpi_madt_generic_interrupt *)(base_ptr + table_len);
>> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
>> index ee75258fc3c3..e4fcfd60205d 100644
>> --- a/xen/arch/arm/gic.c
>> +++ b/xen/arch/arm/gic.c
>> @@ -414,12 +414,21 @@ int gic_make_hwdom_madt(const struct domain *d, u32 offset)
>>       return gic_hw_ops->make_hwdom_madt(d, offset);
>>   }
>>   
>> -unsigned long gic_get_hwdom_madt_size(const struct domain *d)
>> +unsigned long __init gic_get_hwdom_madt_size(const struct domain *d)
>>   {
>>       unsigned long madt_size;
>> +    const struct acpi_subtable_header *header;
>> +    const struct acpi_madt_generic_interrupt *host_gicc;
>> +
>> +    header = acpi_table_get_entry_madt(ACPI_MADT_TYPE_GENERIC_INTERRUPT, 0);
>> +    if ( !header )
>> +        return 0;
>> +
>> +    host_gicc = container_of(header, const struct acpi_madt_generic_interrupt,
>> +                             header);
>>   
>>       madt_size = sizeof(struct acpi_table_madt)
>> -                + ACPI_MADT_GICC_LENGTH * d->max_vcpus
>> +                + host_gicc->header.length * d->max_vcpus
> Just to double-check: All entries are strictly required to be of the same
> length? (Related question further down.)

If I understood the ACPI spec correctly, then yes, it should be the same length,
as|GICC->length| is defined as a well defined constant value (82 in ACPI 6.6):
  https://uefi.org/specs/ACPI/6.6/05_ACPI_Software_Programming_Model.html#gic-cpu-interface-gicc-structure

>> --- a/xen/arch/arm/include/asm/acpi.h
>> +++ b/xen/arch/arm/include/asm/acpi.h
>> @@ -53,13 +53,22 @@ void acpi_smp_init_cpus(void);
>>    */
>>   paddr_t acpi_get_table_offset(struct membank tbl_add[], EFI_MEM_RES index);
>>   
>> -/* Macros for consistency checks of the GICC subtable of MADT */
>> -#define ACPI_MADT_GICC_LENGTH	\
>> -    (acpi_gbl_FADT.header.revision < 6 ? 76 : 80)
> Given this, ...
>
>> +/*
>> + * MADT GICC minimum length refers to the MADT GICC structure table length as
>> + * defined in the earliest ACPI version supported on arm64, ie ACPI 5.1.
>> + *
>> + * The efficiency_class member was added to the
>> + * struct acpi_madt_generic_interrupt to represent the MADT GICC structure
>> + * "Processor Power Efficiency Class" field, added in ACPI 6.0 whose offset
>> + * is therefore used to delimit the MADT GICC structure minimum length
>> + * appropriately.
>> + */
>> +#define ACPI_MADT_GICC_MIN_LENGTH   ACPI_OFFSET( \
>> +    struct acpi_madt_generic_interrupt, efficiency_class)
>>   
>> -#define BAD_MADT_GICC_ENTRY(entry, end)						\
>> -    (!(entry) || (unsigned long)(entry) + sizeof(*(entry)) > (end) ||	\
>> -     (entry)->header.length != ACPI_MADT_GICC_LENGTH)
>> +#define BAD_MADT_GICC_ENTRY(entry, end) \
>> +    (!(entry) || (entry)->header.length < ACPI_MADT_GICC_MIN_LENGTH || \
>> +    (unsigned long)(entry) + (entry)->header.length > (end))
> ... is 76 a valid length when the FADT revision is 6 or higher? And 80 is a
> valid length for 6.5 or higher?

I'm not ACPI expert but my understanding that it isn't "very valid" values as I mentioned
above GICC->length is defined as a constant value. But the idea here is to provide
forward compatibility so only minumum MADT GICC length is checked and as mentioned
here [1] by one of ACPI for Arm64 maintainer:
 > - (acpi_gbl_FADT.header.revision < 6 ? 76 : 80) > +#define 
ACPI_MADT_GICC_MIN_LENGTH ACPI_OFFSET( \ > + struct 
acpi_madt_generic_interrupt, efficiency_class) >
   > This makes it 76 always which is fine, just that the first user of
   > efficiency_class should check for the length before accessing it.
   > No user of efficiency_class yet, so I am fine with this change.

And I think the same is true for ACPI 6.3 which adds spe_interrupt and ACPI 6.5
trbe_interrupt.

[1]https://lore.kernel.org/all/20181015092919.GA1778@e107155-lin/

~ Oleksii


