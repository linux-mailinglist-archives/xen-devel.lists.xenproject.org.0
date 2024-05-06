Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0782C8BCC00
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 12:29:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717512.1119824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vaq-0006NQ-2d; Mon, 06 May 2024 10:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717512.1119824; Mon, 06 May 2024 10:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vap-0006L3-VY; Mon, 06 May 2024 10:29:11 +0000
Received: by outflank-mailman (input) for mailman id 717512;
 Mon, 06 May 2024 10:29:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VpOg=MJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s3vao-0006Ku-8q
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 10:29:10 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7901f49f-0b93-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 12:29:09 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-34dc129accaso1386250f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 03:29:09 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 dn15-20020a0560000c0f00b0034d9012e74bsm10443802wrb.72.2024.05.06.03.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 03:29:08 -0700 (PDT)
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
X-Inumbo-ID: 7901f49f-0b93-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714991348; x=1715596148; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YcGCF7Q0lu5pxj6ACuevUFrYdYThmWpEF7jjA1jhM2E=;
        b=M7AzAPt1VFurnlr69Aw0BBu3EpZDGNn6B4HJCvSHBtaRvdPTB8hJ6QRI9hMYS2oDd0
         aefbqp5X8lmV/gzkCZ3sZfXsZDO3/UZ6scMNE4ydFNp6dEH4tZ7PHysvrP9ceVZkJZ6G
         QGXkxW2jMh6N7p9bsAB3YL6YY+YoRQOx6YEMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714991348; x=1715596148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcGCF7Q0lu5pxj6ACuevUFrYdYThmWpEF7jjA1jhM2E=;
        b=nrXs/EQbCeQhGx4lPHMM+b64ixCAB6u9hyNKMA1tjZCWIkMIz+Mp4RVnRwM5h+GRb8
         ITpyUyAdvaez4TVg94oB7qVjEFz1/hzTFPSqTewxKRaq7unViP/aI4+4aZUTYORyyby1
         7S3q3pksnvlTJ2x6I0UVBocvGOtLzTgeUrF7m5Y7r36M2rquUapkMyKa+AktRBD94/Cz
         v6WrvgQW1JtlDC43WlnVMB5Uuovlx7GAfuJ2FVFh4lr1F6Z5+me4avSSG0ErCrYNJDfE
         eWNufMObtA0cJYIpFlTOCRvSlKGdTPfK5JcYziMtdKq/Oiw/TeIYHmAiYhuBLQSNa9y1
         Vbkg==
X-Gm-Message-State: AOJu0YwxciKFrOefHal5nKHb54i/TNkYxSIXNrRQSWI1KeG5VlsvIdz4
	YrGfmoRZeM3tH0LToJ2wEaiICDONTXiR7iIouDaCkLYBYr1E30V8jH/SrqcmXmk=
X-Google-Smtp-Source: AGHT+IG4kgIUjJxuDfyYFyAfju6Y246/ifMlX/Ke2KT7cRQT4SFAxUB750pQJIK2XOzw60sODbd4ng==
X-Received: by 2002:a5d:67c4:0:b0:34c:c1c:8413 with SMTP id n4-20020a5d67c4000000b0034c0c1c8413mr7162485wrw.58.1714991348495;
        Mon, 06 May 2024 03:29:08 -0700 (PDT)
Date: Mon, 6 May 2024 12:29:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 03/12] VT-d: parse ACPI "SoC Integrated Address
 Translation Cache Reporting Structure"s
Message-ID: <Zjiw89WKvy6vJAPn@macbook>
References: <64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com>
 <c70b250d-2ec4-4254-89cf-d3241dac0d35@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c70b250d-2ec4-4254-89cf-d3241dac0d35@suse.com>

On Thu, Feb 15, 2024 at 11:14:31AM +0100, Jan Beulich wrote:
> This is a prereq to us, in particular, respecting the "ATC required"
> flag.
> 
> Note that ACPI_SATC_ATC_REQUIRED has its #define put in dmar.h, as we
> try to keep actbl*.h in sync what Linux (who in turn inherit from ACPI
> CA) has.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Lovely: On the SPR system with the SATC I tried passing "ats" (the
> "required" flag is clear there), just to then hit "IOMMU#4: QI dev wait
> descriptor taking too long" while setting up Dom0. The 2nd message there
> doesn't ever appear, so the request never completes. Not sure whether
> that's us doing something wrong or the hardware acting up. In the former
> case I'd generally expect an IOMMU fault to be raised, though. FTR same
> on 4.18 with just "VT-d: correct ATS checking for root complex
> integrated devices" backported there.

Great, so we likely have a bug in our ATS implementation?

> 
> Should we check scope entries for appropriate types? (If so, then also
> for e.g. ATSR.)
> ---
> v2: Move error case freeing to acpi_parse_one_satc(). Introduce #define
>     for the flag bit. Style.
> 
> --- a/xen/drivers/passthrough/vtd/dmar.c
> +++ b/xen/drivers/passthrough/vtd/dmar.c
> @@ -47,6 +47,7 @@ LIST_HEAD_READ_MOSTLY(acpi_drhd_units);
>  LIST_HEAD_READ_MOSTLY(acpi_rmrr_units);
>  static LIST_HEAD_READ_MOSTLY(acpi_atsr_units);
>  static LIST_HEAD_READ_MOSTLY(acpi_rhsa_units);
> +static LIST_HEAD_READ_MOSTLY(acpi_satc_units);

We could even make this one RO after init.

>  
>  static struct acpi_table_header *__read_mostly dmar_table;
>  static int __read_mostly dmar_flags;
> @@ -750,6 +751,93 @@ acpi_parse_one_rhsa(struct acpi_dmar_hea
>      return ret;
>  }
>  
> +static int __init register_one_satc(struct acpi_satc_unit *satcu)
> +{
> +    bool ignore = false;
> +    unsigned int i = 0;
> +    int ret = 0;
> +
> +    /* Skip checking if segment is not accessible yet. */
> +    if ( !pci_known_segment(satcu->segment) )
> +        i = UINT_MAX;
> +
> +    for ( ; i < satcu->scope.devices_cnt; i++ )
> +    {
> +        uint8_t b = PCI_BUS(satcu->scope.devices[i]);
> +        uint8_t d = PCI_SLOT(satcu->scope.devices[i]);
> +        uint8_t f = PCI_FUNC(satcu->scope.devices[i]);
> +
> +        if ( !pci_device_detect(satcu->segment, b, d, f) )
> +        {
> +            dprintk(XENLOG_WARNING VTDPREFIX,
> +                    " Non-existent device (%pp) is reported in SATC scope!\n",
> +                    &PCI_SBDF(satcu->segment, b, d, f));
> +            ignore = true;
> +        }
> +        else
> +        {
> +            ignore = false;
> +            break;
> +        }
> +    }
> +
> +    if ( ignore )
> +    {
> +        dprintk(XENLOG_WARNING VTDPREFIX,
> +                " Ignore SATC for seg %04x as no device under its scope is PCI discoverable\n",
> +                satcu->segment);

Re the error messages: won't it be better to print them using plain
printk and gate on iommu_verbose being enabled if anything?

It does seem a bit odd that such messages won't be printed when
iommu={debug,verbose} is enabled on the command line.

> +        return 1;
> +    }
> +
> +    if ( iommu_verbose )
> +        printk(VTDPREFIX " ATC required: %d\n", satcu->atc_required);
> +
> +    list_add(&satcu->list, &acpi_satc_units);
> +
> +    return ret;
> +}
> +
> +static int __init
> +acpi_parse_one_satc(const struct acpi_dmar_header *header)
> +{
> +    const struct acpi_dmar_satc *satc =
> +        container_of(header, const struct acpi_dmar_satc, header);
> +    struct acpi_satc_unit *satcu;
> +    const void *dev_scope_start, *dev_scope_end;
> +    int ret = acpi_dmar_check_length(header, sizeof(*satc));
> +
> +    if ( ret )
> +        return ret;
> +
> +    satcu = xzalloc(struct acpi_satc_unit);
> +    if ( !satcu )
> +        return -ENOMEM;
> +
> +    satcu->segment = satc->segment;
> +    satcu->atc_required = satc->flags & ACPI_SATC_ATC_REQUIRED;
> +
> +    dev_scope_start = (const void *)(satc + 1);
> +    dev_scope_end   = (const void *)satc + header->length;

Isn't it enough to just cast to void * and inherit the const from the
left side variable declaration?

You could even initialize dev_scope_{start,end} at definition.

Thanks, Roger.

