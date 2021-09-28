Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C8B41A9C4
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 09:34:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197678.350865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV7d5-0003CD-47; Tue, 28 Sep 2021 07:34:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197678.350865; Tue, 28 Sep 2021 07:34:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV7d5-00039w-05; Tue, 28 Sep 2021 07:34:19 +0000
Received: by outflank-mailman (input) for mailman id 197678;
 Tue, 28 Sep 2021 07:34:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sHmr=OS=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1mV7d3-00039k-Nu
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 07:34:17 +0000
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d5c09d3-1437-4560-9ee4-9c0485e98a36;
 Tue, 28 Sep 2021 07:34:16 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id x20so11609018wrg.10
 for <xen-devel@lists.xenproject.org>; Tue, 28 Sep 2021 00:34:16 -0700 (PDT)
Received: from ?IPV6:2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec?
 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id f17sm8890400wrm.83.2021.09.28.00.34.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 00:34:15 -0700 (PDT)
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
X-Inumbo-ID: 2d5c09d3-1437-4560-9ee4-9c0485e98a36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NNakOyTZYGeX/Mb0ow/VeI5lJM8wKzbBa+NgDqXeOU8=;
        b=E9TbSX7TmQh18kx3b27rLiP9HQvBG+JL+iPCYZXwky1q3gpDGkay40e42z8Gf8TJ7B
         9ykc/grdjD1xcQMZCA6E+fc91CBDOmbtCgACWPVCnWpu0zSALSDH/08ciPP4sgZBboA7
         vOrXoR0bVFZzqP/0cSThUqiYQ/V2lsHZsn5fCQJjybMbvY6j3JaN835+evbVciV5lVKI
         6eSbo4En8EfXezy5K8aKwoVj5I/r+xV7AQRaJKMG8fiF+WuG4SGTs7m0uEtCFpx4I60i
         wGJbejchXO1j8YcbheFDOembvYM6FcQSBnnTpXLLIucotEpU18Npa9FixrE0BVG3gac8
         XIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NNakOyTZYGeX/Mb0ow/VeI5lJM8wKzbBa+NgDqXeOU8=;
        b=okXuP0z2V76cEW4jJWuGKTv+g4YJpY9HKiHsgJfotp8CjBO+yR7ae76dHpUZYnde5Z
         Fswe8wgLMRMhTULn0cOhGKFJG7HJ4LqyoL+GqxgLd5SiTXAsyE3MuFBKOQ69Mc76xLuB
         y+Dfoml2GRehyy2Xy5qUq2mUy6jvaMmmqb9Zm6ZQcZyhs4r0+P23WYdVFN+N/HWnZnmF
         w+gg3l2Imai40ynP9OyMCxbSA7aTX1poEJR7z3lcD7vcgkUc4oCM9DhTcRJRF50XVrTx
         1zemR76drWML18bcO/U3tMEXPSPEWknjFe+ELkC6QfjUFljFAZ6sQpMS4+3RY45FdR+N
         C2Yg==
X-Gm-Message-State: AOAM531EyVGmysNgr0A/ZkpYWO76M5kNsBhLvwERoLBvxC3nB5BaFSnh
	/Lr7P5LhzcQrTlHRORIMphM=
X-Google-Smtp-Source: ABdhPJwFbrXFBdbMbM9F7/OkBTJLFxXjBBygzt8cz5jlzteoOF6YfShY252y1hyqZU8/RuE5gM1AhQ==
X-Received: by 2002:adf:eb12:: with SMTP id s18mr4669884wrn.97.1632814455618;
        Tue, 28 Sep 2021 00:34:15 -0700 (PDT)
Message-ID: <d300aaf7-dbe9-1bf8-6abc-1693bb13ec56@gmail.com>
Date: Tue, 28 Sep 2021 08:34:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Reply-To: paul@xen.org
Subject: Re: [PATCH v8 4/6] AMD/IOMMU: respect AtsDisabled device flag
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <d249a759-188a-d689-316a-4743922827e5@suse.com>
 <14d1c1e1-d2d0-d041-e206-608e876d43a0@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <14d1c1e1-d2d0-d041-e206-608e876d43a0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/09/2021 15:37, Jan Beulich wrote:
> IVHD entries may specify that ATS is to be blocked for a device or range
> of devices. Honor firmware telling us so.
> 
> While adding respective checks I noticed that the 2nd conditional in
> amd_iommu_setup_domain_device() failed to check the IOMMU's capability.
> Add the missing part of the condition there, as no good can come from
> enabling ATS on a device when the IOMMU is not capable of dealing with
> ATS requests.
> 
> For actually using ACPI_IVHD_ATS_DISABLED, make its expansion no longer
> exhibit UB.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> TBD: As an alternative to adding the missing IOMMU capability check, we
>       may want to consider simply using dte->i in the 2nd conditional in
>       amd_iommu_setup_domain_device().
> Note that while ATS enabling/disabling gets invoked without any locks
> held, the two functions should not be possible to race with one another
> for any individual device (or else we'd be in trouble already, as ATS
> might then get re-enabled immediately after it was disabled, with the
> DTE out of sync with this setting).
> ---
> v7: New.
> 
> --- a/xen/drivers/passthrough/amd/iommu.h
> +++ b/xen/drivers/passthrough/amd/iommu.h
> @@ -120,6 +120,7 @@ struct ivrs_mappings {
>       uint16_t dte_requestor_id;
>       bool valid:1;
>       bool dte_allow_exclusion:1;
> +    bool block_ats:1;
>   
>       /* ivhd device data settings */
>       uint8_t device_flags;
> --- a/xen/drivers/passthrough/amd/iommu_acpi.c
> +++ b/xen/drivers/passthrough/amd/iommu_acpi.c
> @@ -55,8 +55,8 @@ union acpi_ivhd_device {
>   };
>   
>   static void __init add_ivrs_mapping_entry(
> -    uint16_t bdf, uint16_t alias_id, uint8_t flags, bool alloc_irt,
> -    struct amd_iommu *iommu)
> +    uint16_t bdf, uint16_t alias_id, uint8_t flags, unsigned int ext_flags,
> +    bool alloc_irt, struct amd_iommu *iommu)
>   {
>       struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(iommu->seg);
>   
> @@ -66,6 +66,7 @@ static void __init add_ivrs_mapping_entr
>       ivrs_mappings[bdf].dte_requestor_id = alias_id;
>   
>       /* override flags for range of devices */
> +    ivrs_mappings[bdf].block_ats = ext_flags & ACPI_IVHD_ATS_DISABLED;
>       ivrs_mappings[bdf].device_flags = flags;

I'm assuming the above indentation problem (which appears to be repeated 
in a few places below) is more to do with patch email generation rather 
than the actual code modifications so...

Reviewed-by: Paul Durrant <paul@xen.org>

>   
>       /* Don't map an IOMMU by itself. */
> @@ -499,7 +500,7 @@ static u16 __init parse_ivhd_device_sele
>           return 0;
>       }
>   
> -    add_ivrs_mapping_entry(bdf, bdf, select->header.data_setting, false,
> +    add_ivrs_mapping_entry(bdf, bdf, select->header.data_setting, 0, false,
>                              iommu);
>   
>       return sizeof(*select);
> @@ -545,7 +546,7 @@ static u16 __init parse_ivhd_device_rang
>       AMD_IOMMU_DEBUG(" Dev_Id Range: %#x -> %#x\n", first_bdf, last_bdf);
>   
>       for ( bdf = first_bdf; bdf <= last_bdf; bdf++ )
> -        add_ivrs_mapping_entry(bdf, bdf, range->start.header.data_setting,
> +        add_ivrs_mapping_entry(bdf, bdf, range->start.header.data_setting, 0,
>                                  false, iommu);
>   
>       return dev_length;
> @@ -580,7 +581,7 @@ static u16 __init parse_ivhd_device_alia
>   
>       AMD_IOMMU_DEBUG(" Dev_Id Alias: %#x\n", alias_id);
>   
> -    add_ivrs_mapping_entry(bdf, alias_id, alias->header.data_setting, true,
> +    add_ivrs_mapping_entry(bdf, alias_id, alias->header.data_setting, 0, true,
>                              iommu);
>   
>       return dev_length;
> @@ -636,7 +637,7 @@ static u16 __init parse_ivhd_device_alia
>   
>       for ( bdf = first_bdf; bdf <= last_bdf; bdf++ )
>           add_ivrs_mapping_entry(bdf, alias_id, range->alias.header.data_setting,
> -                               true, iommu);
> +                               0, true, iommu);
>   
>       return dev_length;
>   }
> @@ -661,7 +662,8 @@ static u16 __init parse_ivhd_device_exte
>           return 0;
>       }
>   
> -    add_ivrs_mapping_entry(bdf, bdf, ext->header.data_setting, false, iommu);
> +    add_ivrs_mapping_entry(bdf, bdf, ext->header.data_setting,
> +                           ext->extended_data, false, iommu);
>   
>       return dev_length;
>   }
> @@ -708,7 +710,7 @@ static u16 __init parse_ivhd_device_exte
>   
>       for ( bdf = first_bdf; bdf <= last_bdf; bdf++ )
>           add_ivrs_mapping_entry(bdf, bdf, range->extended.header.data_setting,
> -                               false, iommu);
> +                               range->extended.extended_data, false, iommu);
>   
>       return dev_length;
>   }
> @@ -800,7 +802,7 @@ static u16 __init parse_ivhd_device_spec
>   
>       AMD_IOMMU_DEBUG("IVHD Special: %pp variety %#x handle %#x\n",
>                       &PCI_SBDF2(seg, bdf), special->variety, special->handle);
> -    add_ivrs_mapping_entry(bdf, bdf, special->header.data_setting, true,
> +    add_ivrs_mapping_entry(bdf, bdf, special->header.data_setting, 0, true,
>                              iommu);
>   
>       switch ( special->variety )
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -105,6 +105,7 @@ static int __must_check amd_iommu_setup_
>       int req_id, valid = 1, rc;
>       u8 bus = pdev->bus;
>       struct domain_iommu *hd = dom_iommu(domain);
> +    const struct ivrs_mappings *ivrs_dev;
>   
>       if ( QUARANTINE_SKIP(domain) )
>           return 0;
> @@ -122,20 +123,18 @@ static int __must_check amd_iommu_setup_
>       req_id = get_dma_requestor_id(iommu->seg, PCI_BDF2(bus, devfn));
>       table = iommu->dev_table.buffer;
>       dte = &table[req_id];
> +    ivrs_dev = &get_ivrs_mappings(iommu->seg)[req_id];
>   
>       spin_lock_irqsave(&iommu->lock, flags);
>   
>       if ( !dte->v || !dte->tv )
>       {
> -        const struct ivrs_mappings *ivrs_dev;
> -
>           /* bind DTE to domain page-tables */
>           amd_iommu_set_root_page_table(
>               dte, page_to_maddr(hd->arch.amd.root_table),
>               domain->domain_id, hd->arch.amd.paging_mode, valid);
>   
>           /* Undo what amd_iommu_disable_domain_device() may have done. */
> -        ivrs_dev = &get_ivrs_mappings(iommu->seg)[req_id];
>           if ( dte->it_root )
>           {
>               dte->int_ctl = IOMMU_DEV_TABLE_INT_CONTROL_TRANSLATED;
> @@ -146,6 +145,7 @@ static int __must_check amd_iommu_setup_
>           dte->sys_mgt = MASK_EXTR(ivrs_dev->device_flags, ACPI_IVHD_SYSTEM_MGMT);
>   
>           if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
> +             !ivrs_dev->block_ats &&
>                iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) )
>               dte->i = ats_enabled;
>   
> @@ -166,6 +166,8 @@ static int __must_check amd_iommu_setup_
>       ASSERT(pcidevs_locked());
>   
>       if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
> +         !ivrs_dev->block_ats &&
> +         iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
>            !pci_ats_enabled(iommu->seg, bus, pdev->devfn) )
>       {
>           if ( devfn == pdev->devfn )
> --- a/xen/include/acpi/actbl2.h
> +++ b/xen/include/acpi/actbl2.h
> @@ -851,7 +851,7 @@ struct acpi_ivrs_device8b {
>   
>   /* Values for extended_data above */
>   
> -#define ACPI_IVHD_ATS_DISABLED      (1<<31)
> +#define ACPI_IVHD_ATS_DISABLED      (1u << 31)
>   
>   /* Type 72: 8-byte device entry */
>   
> 


