Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C705D2AF428
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 15:54:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24983.52505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcrVp-00050D-Qi; Wed, 11 Nov 2020 14:54:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24983.52505; Wed, 11 Nov 2020 14:54:17 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcrVp-0004zo-Mv; Wed, 11 Nov 2020 14:54:17 +0000
Received: by outflank-mailman (input) for mailman id 24983;
 Wed, 11 Nov 2020 14:54:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cwX6=ER=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kcrVo-0004zj-0L
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 14:54:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bcd39f8c-0d95-47b7-a7c5-62464082190c;
 Wed, 11 Nov 2020 14:54:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 136EBABD1;
 Wed, 11 Nov 2020 14:54:14 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=cwX6=ER=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kcrVo-0004zj-0L
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 14:54:16 +0000
X-Inumbo-ID: bcd39f8c-0d95-47b7-a7c5-62464082190c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id bcd39f8c-0d95-47b7-a7c5-62464082190c;
	Wed, 11 Nov 2020 14:54:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605106454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9zhveKXFN05PgIsHJThMQR3aVRjiUTFRaKeo/Uh9GU8=;
	b=nnjJrY2qBLWk9sD76JVFpWBqQMu9zeRAb5XIgB2LfDvGOOF6ux/ScHzw/8x6OXPvWH2fsc
	crWR0wAgApDe0ZH5Guvi3p+l8fAYJBz91ZVRHBEkgRzYTR35bNk1vxfUTvi1Gwy6j8Qd/E
	UgY/+hpKTl5ycm1ghIVV/67jVk6AdSQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 136EBABD1;
	Wed, 11 Nov 2020 14:54:14 +0000 (UTC)
Subject: Re: [PATCH 02/10] arm/pci: Maintain PCI assignable list
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: iwj@xenproject.org, wl@xen.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com,
 julien.grall@arm.com, sstabellini@kernel.org, roger.pau@citrix.com,
 Rahul.Singh@arm.com
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-3-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6a2dc03e-202b-b8f9-46a5-9c90d9de8a6d@suse.com>
Date: Wed, 11 Nov 2020 15:54:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201109125031.26409-3-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.11.2020 13:50, Oleksandr Andrushchenko wrote:
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -879,6 +879,43 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>      return ret;
>  }
>  
> +#ifdef CONFIG_ARM
> +int pci_device_set_assigned(u16 seg, u8 bus, u8 devfn, bool assigned)
> +{
> +    struct pci_dev *pdev;
> +
> +    pdev = pci_get_pdev(seg, bus, devfn);
> +    if ( !pdev )
> +    {
> +        printk(XENLOG_ERR "Can't find PCI device %04x:%02x:%02x.%u\n",
> +               seg, bus, PCI_SLOT(devfn), PCI_FUNC(devfn));
> +        return -ENODEV;
> +    }
> +
> +    pdev->assigned = assigned;
> +    printk(XENLOG_ERR "pciback %sassign PCI device %04x:%02x:%02x.%u\n",
> +           assigned ? "" : "de-",
> +           seg, bus, PCI_SLOT(devfn), PCI_FUNC(devfn));
> +
> +    return 0;
> +}
> +
> +int pci_device_get_assigned(u16 seg, u8 bus, u8 devfn)
> +{
> +    struct pci_dev *pdev;
> +
> +    pdev = pci_get_pdev(seg, bus, devfn);
> +    if ( !pdev )
> +    {
> +        printk(XENLOG_ERR "Can't find PCI device %04x:%02x:%02x.%u\n",
> +               seg, bus, PCI_SLOT(devfn), PCI_FUNC(devfn));
> +        return -ENODEV;
> +    }
> +
> +    return pdev->assigned ? 0 : -ENODEV;
> +}
> +#endif
> +
>  #ifndef CONFIG_ARM
>  /*TODO :Implement MSI support for ARM  */
>  static int pci_clean_dpci_irq(struct domain *d,
> @@ -1821,6 +1858,62 @@ int iommu_do_pci_domctl(
>      return ret;
>  }
>  
> +#ifdef CONFIG_ARM
> +struct list_assigned {
> +    uint32_t cur_idx;
> +    uint32_t from_idx;
> +    bool assigned;
> +    domid_t *domain;
> +    uint32_t *machine_sbdf;
> +};
> +
> +static int _enum_assigned_pci_devices(struct pci_seg *pseg, void *arg)
> +{
> +    struct list_assigned *ctxt = arg;
> +    struct pci_dev *pdev;
> +
> +    list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
> +    {
> +        if ( pdev->assigned == ctxt->assigned )
> +        {
> +            if ( ctxt->cur_idx == ctxt->from_idx )
> +            {
> +                *ctxt->domain = pdev->domain->domain_id;
> +                *ctxt->machine_sbdf = pdev->sbdf.sbdf;
> +                return 1;
> +            }
> +            ctxt->cur_idx++;
> +        }
> +    }
> +    return 0;
> +}
> +
> +int pci_device_enum_assigned(bool report_not_assigned,
> +                             uint32_t from_idx, domid_t *domain,
> +                             uint32_t *machine_sbdf)
> +{
> +    struct list_assigned ctxt = {
> +        .assigned = !report_not_assigned,
> +        .cur_idx = 0,
> +        .from_idx = from_idx,
> +        .domain = domain,
> +        .machine_sbdf = machine_sbdf,
> +    };
> +    int ret;
> +
> +    pcidevs_lock();
> +    ret = pci_segments_iterate(_enum_assigned_pci_devices, &ctxt);
> +    pcidevs_unlock();
> +    /*
> +     * If not found then report as EINVAL to mark
> +     * enumeration process finished.
> +     */
> +    if ( !ret )
> +        return -EINVAL;
> +    return 0;
> +}
> +#endif

Just in case the earlier comments you've got don't lead to removal
of this code - unless there's a real need for them to be put here,
under #ifdef, please add a new xen/drivers/passthrough/arm/pci.c
instead. Even if for just part of the code, this would then also
help with more clear maintainership of this Arm specific code.

Jan

