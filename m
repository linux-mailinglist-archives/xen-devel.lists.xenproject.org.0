Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1831597F45
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 09:35:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389340.626189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOa2n-0002BT-A3; Thu, 18 Aug 2022 07:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389340.626189; Thu, 18 Aug 2022 07:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOa2n-00028x-6M; Thu, 18 Aug 2022 07:34:21 +0000
Received: by outflank-mailman (input) for mailman id 389340;
 Thu, 18 Aug 2022 07:34:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3bNE=YW=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1oOa2l-00028p-VE
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 07:34:20 +0000
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [2607:f8b0:4864:20::1031])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ac06401-1ec8-11ed-9250-1f966e50362f;
 Thu, 18 Aug 2022 09:34:18 +0200 (CEST)
Received: by mail-pj1-x1031.google.com with SMTP id pm17so900801pjb.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Aug 2022 00:34:18 -0700 (PDT)
Received: from leoy-yangtze.lan (173.242.127.92.16clouds.com. [173.242.127.92])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a170902ce9100b00172913c0e44sm722613plg.28.2022.08.18.00.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 00:34:16 -0700 (PDT)
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
X-Inumbo-ID: 2ac06401-1ec8-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=bp7TPSBfYTwE/+GP2l5HZka91zj/Q9y/P/5H/7Xrd9w=;
        b=qgS4eXfGP5IsxAoTBNkWU9ZaugSQjmdVnPE3wH2WKk65K4qq2zCWUsDVGRSSFqnRUD
         jJAX0tlIjUWNPIAho7NrQ9G/QpVJxEE7QVPnRRNcDi9j4kWyUX7Z4rt/WLTPjsrZc77O
         bUVurWGXCI41kriNaFJ988o0rr9R5c2Z7JGlcU3rvIg0AwsXc5EnW5SCWtgNGwgbxrxc
         XhDC/4F7oLOyGz10InVU3i/41u+2MNJNisteM9imGJQW7oT8Cl2dENI+J2K32Ln4lVZi
         VGWCxA8Ay9DBvS3A51qJBKr4DJHyvASKfNwguedYsFWinRthq7U8PG6VHSEwFLDYfZG3
         qwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=bp7TPSBfYTwE/+GP2l5HZka91zj/Q9y/P/5H/7Xrd9w=;
        b=xlSBTD3GJP0zpwUnRrMsBLzEwR5h+/uNr+W3wnLNUcFYBrRis4gWaO3qjMpcOmy1MA
         dNo36wTZfKzTEPwcVIANdOk/yE7ZiKJL1zI+fAc7NtLtuVSLgk1FpBqXVLrtBWX2ijQJ
         +8NdyJOG1KkdYdcEFXp1XHCKwEN6M55CRFBIGHjOtd7MByBoBLsr6+rzk9tZ2katCxa8
         73jVxUM1tzva5rpB/TAUwWukv30C7YMPuMAzXwM7/VKcQSH1pRarSjCaDqD25gUdxSL5
         Ocy0D3Zqb72fxRR6TqzqnvKY3KtlpAKLx6O/VsAOEVUkiYnp67t8XerNJWZ0/uYS9DE7
         PHQw==
X-Gm-Message-State: ACgBeo05ZfwUeFLMT/vvrLSEQU48euTekemAkjeLfwRrIKuQNXgUXYPk
	tHQUPdYbBahEr1Ba7zO3kLf4SQ==
X-Google-Smtp-Source: AA6agR46sZy8mZTwA35JUqovr2G0i8DhxuYxVWw/CzHH0koyhrDBwRv1ym1qgmIJl8hV93QsxfTxXg==
X-Received: by 2002:a17:90b:1c85:b0:1f1:d78a:512b with SMTP id oo5-20020a17090b1c8500b001f1d78a512bmr7481635pjb.92.1660808056904;
        Thu, 18 Aug 2022 00:34:16 -0700 (PDT)
Date: Thu, 18 Aug 2022 15:34:11 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Rahul Singh <Rahul.Singh@arm.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH] xen/arm: acpi: Support memory reserve configuration table
Message-ID: <Yv3rc7vNCmTrFdgB@leoy-yangtze.lan>
References: <20220817105720.111618-1-leo.yan@linaro.org>
 <fd24b049-abf2-34e8-e0b0-2c2d2d1e1b0f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd24b049-abf2-34e8-e0b0-2c2d2d1e1b0f@suse.com>

On Wed, Aug 17, 2022 at 03:17:53PM +0200, Jan Beulich wrote:

[...]

> Please make sure you Cc all maintainers of all files that you touch.
> Albeit, see below, you could indeed have avoided Cc-ing me if you
> hadn't misplaced stuff in two of the headers that you fiddle with.

Sorry for this.  When I send a new patch in next time, I will use
./scripts/get_maintainer.pl to find out the maintainers.

> > --- a/xen/arch/arm/efi/efi-dom0.c
> > +++ b/xen/arch/arm/efi/efi-dom0.c
> > @@ -38,7 +38,7 @@ size_t __init estimate_efi_size(unsigned int mem_nr_banks)
> >  {
> >      size_t size;
> >      size_t est_size = sizeof(EFI_SYSTEM_TABLE);
> > -    size_t ect_size = sizeof(EFI_CONFIGURATION_TABLE);
> > +    size_t ect_size = sizeof(EFI_CONFIGURATION_TABLE) * 2;
> >      size_t emd_size = sizeof(EFI_MEMORY_DESCRIPTOR);
> >      size_t fw_vendor_size = sizeof(xen_efi_fw_vendor);
> >      unsigned int acpi_mem_nr_banks = 0;
> > @@ -63,7 +63,8 @@ void __init acpi_create_efi_system_table(struct domain *d,
> >  
> >      table_addr = d->arch.efi_acpi_gpa
> >                   + acpi_get_table_offset(tbl_add, TBL_EFIT);
> > -    table_size = sizeof(EFI_SYSTEM_TABLE) + sizeof(EFI_CONFIGURATION_TABLE)
> > +    table_size = sizeof(EFI_SYSTEM_TABLE)
> > +	         + sizeof(EFI_CONFIGURATION_TABLE) * 2
> >                   + sizeof(xen_efi_fw_vendor);
> 
> Nit: Indentation.

Will fix.

> > @@ -75,7 +76,7 @@ void __init acpi_create_efi_system_table(struct domain *d,
> >      efi_sys_tbl->Hdr.HeaderSize = table_size;
> >  
> >      efi_sys_tbl->FirmwareRevision = 1;
> > -    efi_sys_tbl->NumberOfTableEntries = 1;
> > +    efi_sys_tbl->NumberOfTableEntries = 2;
> 
> This is the 3rd magic "2" - I think there wants to be some consolidation,
> such that it becomes obvious which "2"-s really are the same (and would
> change together if, like you do here, another entry is needed).

I will define a macro for the number of configuration table and add
comment for it.

> > @@ -86,6 +87,18 @@ void __init acpi_create_efi_system_table(struct domain *d,
> >      efi_conf_tbl->VendorTable = (VOID *)tbl_add[TBL_RSDP].start;
> >      efi_sys_tbl->ConfigurationTable = (EFI_CONFIGURATION_TABLE *)(table_addr
> >                                                                    + offset);
> > +
> > +    /*
> > +     * Configuration table for MEMRESERVE is used in Linux kernel for
> > +     * reserving pages, its main purpose is used for kexec/kdump to
> > +     * reserve persistent pages (e.g. GIC pending pages) for the secondary
> > +     * kernel.
> > +     */
> > +    offset += sizeof(EFI_CONFIGURATION_TABLE);
> > +    efi_conf_tbl = (EFI_CONFIGURATION_TABLE *)(base_ptr + offset);
> > +    efi_conf_tbl->VendorGuid = (EFI_GUID)LINUX_EFI_MEMRESERVE_TABLE_GUID;
> > +    efi_conf_tbl->VendorTable = (VOID *)tbl_add[TBL_MRSV].start;
> > +
> >      xz_crc32_init();
> >      efi_sys_tbl->Hdr.CRC32 = xz_crc32((uint8_t *)efi_sys_tbl,
> >                                        efi_sys_tbl->Hdr.HeaderSize, 0);
> 
> Rather than adjusting offset and calculating efi_conf_table fdrom scratch,
> perhaps better simply efi_conf_table++? That way there would be one less
> cast, which are always somewhat risky.

Yeah, using "efi_conf_table++" is much better.  Will do.

> > --- a/xen/include/acpi/actbl.h
> > +++ b/xen/include/acpi/actbl.h
> > @@ -302,6 +302,23 @@ struct acpi_table_fadt {
> >  #define ACPI_FADT_HW_REDUCED        (1<<20)	/* 20: [V5] ACPI hardware is not implemented (ACPI 5.0) */
> >  #define ACPI_FADT_LOW_POWER_S0      (1<<21)	/* 21: [V5] S0 power savings are equal or better than S3 (ACPI 5.0) */
> >  
> > +/*******************************************************************************
> > + *
> > + * MEMRESERVE - Dummy entry for memory reserve configuration table
> > + *
> > + ******************************************************************************/
> > +
> > +struct acpi_table_memreserve {
> > +	int size;		/* allocated size of the array */
> > +	int count;		/* number of entries used */
> > +	u64 next;		/* pa of next struct instance */
> > +	struct {
> > +		u64 base;
> > +		u64 size;
> > +	} entry[];
> > +};
> 
> This header holds ACPI spec defined data structures. This one looks
> to be a Linux one, and hence shouldn't be defined here. You use it
> in a single CU only, so I see no reason to define it there.

Okay, I will define the structure in the arm specific file, e.g. I
move it to the file xen/arch/arm/acpi/domain_build.c.

> Furthermore - what if Linux decided to change their structure? Or
> is there a guarantee that they won't? Generally such structures
> belong in the public interface, guaranteeing forward compatibility
> even if Linux decided to change / extend theirs (at which point
> consuming code there would need to do translation, but maybe using
> a Xen-defined struct [plus translation in Linux] right away would
> be best).

I saw Ard has helped to answer this question in his email.  As Ard
said, the general way is to rely on Linux EFI stub to allocate the
data structure for MEMRESERVE configuration table.

Given Xen uses pseudo EFI booting (the ACPI table is passed via DT), in
short term I don't think Xen can support Linux EFI stub, so we need to
maintain this structure in Xen as well.

This structure eventually will not change frequently, so I assume
later we will have little effort for maintainence it.

> Finally, style-wise, please don't use u64 in new code anymore; we
> are trying hard to move over to standard uint<N>_t types. Plus,
> unless indeed mandated by Linux, please avoid signed types for
> fields (or variables) which can never go negative.

Sure, will follow this and update the data structure.

> > +
> > +
> >  /* Values for preferred_profile (Preferred Power Management Profiles) */
> 
> Please don't add double blank lines anywhere.

Will do.

> > --- a/xen/include/efi/efiapi.h
> > +++ b/xen/include/efi/efiapi.h
> > @@ -882,6 +882,8 @@ typedef struct _EFI_BOOT_SERVICES {
> >  #define SAL_SYSTEM_TABLE_GUID    \
> >      { 0xeb9d2d32, 0x2d88, 0x11d3, {0x9a, 0x16, 0x0, 0x90, 0x27, 0x3f, 0xc1, 0x4d} }
> >  
> > +#define LINUX_EFI_MEMRESERVE_TABLE_GUID    \
> > +    { 0x888eb0c6, 0x8ede, 0x4ff5, {0xa8, 0xf0, 0x9a, 0xee, 0x5c, 0xb9, 0x77, 0xc2} }
> 
> This header holds EFI spec mandated definitions (generally taken
> from the gnu-efi project), when this one again looks to be a Linux
> one (and again looks to be used in only a single CU).

I will move this macro into the file xen/arch/arm/efi/efi-dom0.c, so
far only Arm64 platform uses it.

Thanks,
Leo

