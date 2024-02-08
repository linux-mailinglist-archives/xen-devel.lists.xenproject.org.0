Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B9484DCA1
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 10:17:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678053.1055103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY0XF-0000G1-Os; Thu, 08 Feb 2024 09:17:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678053.1055103; Thu, 08 Feb 2024 09:17:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY0XF-0000Dl-LU; Thu, 08 Feb 2024 09:17:33 +0000
Received: by outflank-mailman (input) for mailman id 678053;
 Thu, 08 Feb 2024 09:17:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mdps=JR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rY0XE-0000Cj-NV
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 09:17:32 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e11ace83-c662-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 10:17:28 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4103fc91755so1859975e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2024 01:17:28 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 u7-20020a05600c19c700b004101e93d276sm1025574wmq.14.2024.02.08.01.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 01:17:27 -0800 (PST)
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
X-Inumbo-ID: e11ace83-c662-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707383848; x=1707988648; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wifhZVtfwjB84gHV1kh+uI3PlWaqN45zcQPThhjzTNk=;
        b=BwPSLma/RuoxmzFZ4vaVOm+CiVCiSlTTh/Mo/c2rnNn43Xdfu09wN8Ekx+YCgfVWni
         pjt/iZs3NeVQGsIDmkHidpLRh8X5GQy1A0WjRFMepTbA+3nD9dm092I2TsvUXOy8Mbmh
         XfgKCBwk6+sqkCIqoy6HuzttfWClnJzujlPIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707383848; x=1707988648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wifhZVtfwjB84gHV1kh+uI3PlWaqN45zcQPThhjzTNk=;
        b=aaZ+huSwgsFHGATcqI9zQZNt9PjhcsNKfCnPIIiYq4SbQt5X0Koaa0mCVEWeLX9apd
         IIXbEQmxxQJ6TauNH7r73j4YAujWzV7Xc+Ht+gpUgiMn9RnampgxcU7PLKtWLmE9EHDB
         iL7VLJxi0D98tUjwNnwU2OP169+R3fMNtminc5tm1a7gpMKetFGknN6d93yQGo3jyfKm
         4Ymvmx9MgA/p7SMfnVXCdtim1fMyQPt3yapsK8BkMRJXXUCYTbfuSV6NB3E5T6SfVfSe
         WtcUqS5MXHhwQ7vmCuS5cCSGdqxY2Vbxjlo1BmJO198HMCh6PTv6XjRddml8AFYnUYBI
         clZw==
X-Gm-Message-State: AOJu0YzM9w4Db2vwu3O4anR+2Vt0os2H9sio3w5ou09JqijMRIQh4Mgm
	udyOxp/sMBKESKfzVbmnmuVWFeIkrgLSwEahpDg2qm0v2PSY/77C85m8uaSIDv4=
X-Google-Smtp-Source: AGHT+IF1DIAJ5Gd8CwZHSU73tvvB0duAIpkpweIixYv6rPbFRESMnotdJF0K3KyQQfVWHPGjggxEXQ==
X-Received: by 2002:a05:600c:35c7:b0:40f:e1e8:38f1 with SMTP id r7-20020a05600c35c700b0040fe1e838f1mr5690607wmq.1.1707383847572;
        Thu, 08 Feb 2024 01:17:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXcPGstiI5nHahmBpIIs2mKAmtNL/kbxUY/F0WNeXcI0GvAs7A0V7Q4pKnJ4DiYvwX+1Lw27v92Hs+tzzaW6VYrypVobY/a/N0xnJtnUnKw3iil
Date: Thu, 8 Feb 2024 10:17:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH 1/7] VT-d: parse ACPI "SoC Integrated Address Translation
 Cache Reporting Structure"s
Message-ID: <ZcScJvAhI7CRJhAZ@macbook>
References: <25506838-b818-4686-8c16-3a198338af44@suse.com>
 <b5a58dee-9a4c-4833-be59-b52c62f7137d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b5a58dee-9a4c-4833-be59-b52c62f7137d@suse.com>

On Mon, Feb 05, 2024 at 02:55:17PM +0100, Jan Beulich wrote:
> This is a prereq to us, in particular, respecting the "ATC required"
> flag.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Should we check scope entries for appropriate types? (If so, then also
> for e.g. ATSR.)

Hm, I guess we could do so in acpi_parse_dev_scope() since that
function already gets passed a 'type' argument.

> 
> --- a/xen/drivers/passthrough/vtd/dmar.c
> +++ b/xen/drivers/passthrough/vtd/dmar.c
> @@ -47,6 +47,7 @@ LIST_HEAD_READ_MOSTLY(acpi_drhd_units);
>  LIST_HEAD_READ_MOSTLY(acpi_rmrr_units);
>  static LIST_HEAD_READ_MOSTLY(acpi_atsr_units);
>  static LIST_HEAD_READ_MOSTLY(acpi_rhsa_units);
> +static LIST_HEAD_READ_MOSTLY(acpi_satc_units);
>  
>  static struct acpi_table_header *__read_mostly dmar_table;
>  static int __read_mostly dmar_flags;
> @@ -764,6 +765,95 @@ acpi_parse_one_rhsa(struct acpi_dmar_hea
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
> +        if ( pci_device_detect(satcu->segment, b, d, f) == 0 )

Any reason to explicitly compare against 0?

if ( !pci_device_detect(satcu->segment, b, d, f) )
...

The function returns a boolean.

> +        {
> +            dprintk(XENLOG_WARNING VTDPREFIX,
> +                    " Non-existent device (%pp) is reported in SATC scope!\n",
> +                    &PCI_SBDF(satcu->segment, b, d, f));
> +            ignore = true;

This is kind of reporting is incomplete: as soon as one device is
found the loop is exited and no further detection happens.  If we want
to print such information, we should do the full scan and avoid
exiting early when a populated device is detected.

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
> +                " Ignore SATC for seg %04x as no device under its scope is PCI discoverable!\n",

(I would drop the '!' at the end, here and above, I don't think they
add much to the error message)  I would also use the '#' flag to avoid
confusion, as in the weird case we have a segment '1234' then without
the zero padding I wouldn't really know whether it's decimal or hex.

> +                satcu->segment);
> +        scope_devices_free(&satcu->scope);
> +        xfree(satcu);
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
> +    int ret;
> +
> +    if ( (ret = acpi_dmar_check_length(header, sizeof(*satc))) != 0 )
> +        return ret;

A very stupid nit, but I would rather prefer:

int ret = acpi_dmar_check_length(header, sizeof(*satc));

if ( ret )
    return ret;

Which has the same number of lines and is IMO easier to read.

> +
> +    satcu = xzalloc(struct acpi_satc_unit);
> +    if ( !satcu )
> +        return -ENOMEM;
> +
> +    satcu->segment = satc->segment;
> +    satcu->atc_required = satc->flags & 1;

I would add this as a define in actbl2.h:

#define ACPI_DMAR_ATC_REQUIRED (1U << 0)

Or some such (maybe just using plain 1 is also fine).

> +
> +    dev_scope_start = (const void *)(satc + 1);
> +    dev_scope_end   = (const void *)satc + header->length;
> +    ret = acpi_parse_dev_scope(dev_scope_start, dev_scope_end,
> +                               &satcu->scope, SATC_TYPE, satc->segment);
> +
> +    if ( !ret && satcu->scope.devices_cnt )
> +    {
> +        ret = register_one_satc(satcu);
> +        /*
> +         * register_one_satc() returns greater than 0 when a specified
> +         * PCIe device cannot be detected. To prevent VT-d from being
> +         * disabled in such cases, reset the return value to 0 here.
> +         */
> +        if ( ret > 0 )
> +            ret = 0;
> +    }
> +    else
> +        xfree(satcu);

You can safely use scope_devices_free() even if acpi_parse_dev_scope()
failed, so you could unify the freeing here, instead of doing it in
register_one_satc() also.

Also why not make register_one_satc() return a boolean instead of 0/1?

if ( ret || !satcu->scope.devices_cnt || register_one_satc(satcu) )
{
    scope_devices_free(&satcu->scope);
    xfree(satcu);
}

> +
> +    return ret;
> +}
> +
>  static int __init cf_check acpi_parse_dmar(struct acpi_table_header *table)
>  {
>      struct acpi_table_dmar *dmar;
> @@ -817,6 +907,11 @@ static int __init cf_check acpi_parse_dm
>                  printk(VTDPREFIX "found ACPI_DMAR_RHSA:\n");
>              ret = acpi_parse_one_rhsa(entry_header);
>              break;
> +        case ACPI_DMAR_TYPE_SATC:
> +            if ( iommu_verbose )
> +                printk(VTDPREFIX "found ACPI_DMAR_SATC:\n");
> +            ret = acpi_parse_one_satc(entry_header);
> +            break;

I know the surrounding code doesn't use it, but readability would
benefit from adding a blank line after the break statement.

Thanks, Roger.

