Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B76F649F651
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 10:28:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261894.453736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDNY6-0000tw-1M; Fri, 28 Jan 2022 09:28:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261894.453736; Fri, 28 Jan 2022 09:28:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDNY5-0000qm-UL; Fri, 28 Jan 2022 09:28:05 +0000
Received: by outflank-mailman (input) for mailman id 261894;
 Fri, 28 Jan 2022 09:28:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NLE7=SM=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1nDNY4-0000qf-7l
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 09:28:04 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97230064-801c-11ec-8f75-fffcc8bd4f1a;
 Fri, 28 Jan 2022 10:28:02 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id c23so9672374wrb.5
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jan 2022 01:28:02 -0800 (PST)
Received: from ?IPV6:2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec?
 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id i13sm1352067wrf.3.2022.01.28.01.28.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jan 2022 01:28:01 -0800 (PST)
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
X-Inumbo-ID: 97230064-801c-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RCTNxTMrhZWWZEvNRrN69ioKirAxESZ6gzc0RPn7GsE=;
        b=SyWRLKblVIXDs7QPjT7YN+9DOZpCj0uD7aO990szh2wszb1v4ktzzucx5217Uadgsg
         /KKAQrnh7Yjni+u3onTFtITElwmjkXHrjm363YGKWKG8fAxQNHFVndUxyVN9OL73TZwP
         gMJG0PuU2ajZPxSWV5Xw0dfRp/c8oYVa8zn9Jl7+SFARnlTgWnVFC+xqsOw4ALKrGCuA
         AWZ/FzMvygWcIk30Ov+b83EuLMPBgMqz9ctEQEZeOhRpCt/n1EIlJjsG4II02h+6SPTz
         64QMj4xQx9HizDVeILi5h24SKVV4/2ftEmiRermrhzBlr8MDOp+7OZr3M9MEOj+MLwfA
         lVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RCTNxTMrhZWWZEvNRrN69ioKirAxESZ6gzc0RPn7GsE=;
        b=ZyTI6LyJrpYcsMrlvl/H/+U2fRjKcZeGGFxGm0uch9HljZ0Blp9+QrDcZ5XzE2UDy2
         DqE5NV16+ERJFn8ihOIpdJVDMhWWkq476FXRLZko6miT3l2h48kVTruZLx+kCA95umUm
         sIImk8Ye0CKl+gRhTbc4hb013qvyhk10UWuQ/71e88JqazrUCyV1ZXL5/puWa1gEUbD1
         HXn2zJyP50k6GMPCpA3dIKH0U/QxcOKja2YVkaQB5Jfb5mGP8ZQYd2uVFRpL+kgpk8nX
         P4YSMRU0W6fil7uWtVDRDs0opkknXN7B1Hv13nWCZMQao63DzlVI7KnN0bdksO4hjPx2
         Pn/Q==
X-Gm-Message-State: AOAM5323EpxP/Tkxd+9XAPGDW/rBl1Zh07TG40zp0raD4taaJjp+fqRy
	J/axNq80E/bF8ayTWIlamUM14SPSiHo=
X-Google-Smtp-Source: ABdhPJx6x1WauUPSQXijq6mHmfrkQPZRNeg6TR/590p0SMI164jZlEU40nbu2WQWQ7tbO50VaVhCsQ==
X-Received: by 2002:a05:6000:1203:: with SMTP id e3mr6275846wrx.221.1643362082246;
        Fri, 28 Jan 2022 01:28:02 -0800 (PST)
Message-ID: <d5734fe5-4743-8034-57e8-afbc2ce2c624@gmail.com>
Date: Fri, 28 Jan 2022 09:28:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 1/4] IOMMU/x86: switch to alternatives-call patching in
 further instances
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <4b7db7ae-eb84-7ecc-4334-fe5f0f7ef46b@suse.com>
 <9f6e1b13-d53f-05d3-0f88-a05bd0da03f9@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <9f6e1b13-d53f-05d3-0f88-a05bd0da03f9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/01/2022 14:47, Jan Beulich wrote:
> This is, once again, to limit the number of indirect calls as much as
> possible. The only hook invocation which isn't sensible to convert is
> setup(). And of course Arm-only use sites are left alone as well.
> 
> Note regarding the introduction / use of local variables in pci.c:
> struct pci_dev's involved fields are const. This const propagates, via
> typeof(), to the local helper variables in the altcall macros. These
> helper variables are, however, used as outputs (and hence can't be
> const). In iommu_get_device_group() make use of the new local variables
> to also simplify some adjacent code.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -198,7 +198,7 @@ int iommu_domain_init(struct domain *d,
>           return ret;
>   
>       hd->platform_ops = iommu_get_ops();
> -    ret = hd->platform_ops->init(d);
> +    ret = iommu_call(hd->platform_ops, init, d);
>       if ( ret || is_system_domain(d) )
>           return ret;
>   
> @@ -233,7 +233,7 @@ void __hwdom_init iommu_hwdom_init(struc
>   
>       register_keyhandler('o', &iommu_dump_page_tables, "dump iommu page tables", 0);
>   
> -    hd->platform_ops->hwdom_init(d);
> +    iommu_vcall(hd->platform_ops, hwdom_init, d);
>   }
>   
>   static void iommu_teardown(struct domain *d)
> @@ -576,7 +576,7 @@ int iommu_get_reserved_device_memory(iom
>       if ( !ops->get_reserved_device_memory )
>           return 0;
>   
> -    return ops->get_reserved_device_memory(func, ctxt);
> +    return iommu_call(ops, get_reserved_device_memory, func, ctxt);
>   }
>   
>   bool_t iommu_has_feature(struct domain *d, enum iommu_feature feature)
> @@ -603,7 +603,7 @@ static void iommu_dump_page_tables(unsig
>               continue;
>           }
>   
> -        dom_iommu(d)->platform_ops->dump_page_tables(d);
> +        iommu_vcall(dom_iommu(d)->platform_ops, dump_page_tables, d);
>       }
>   
>       rcu_read_unlock(&domlist_read_lock);
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -861,15 +861,15 @@ static int deassign_device(struct domain
>           devfn += pdev->phantom_stride;
>           if ( PCI_SLOT(devfn) != PCI_SLOT(pdev->devfn) )
>               break;
> -        ret = hd->platform_ops->reassign_device(d, target, devfn,
> -                                                pci_to_dev(pdev));
> +        ret = iommu_call(hd->platform_ops, reassign_device, d, target, devfn,
> +                         pci_to_dev(pdev));
>           if ( ret )
>               goto out;
>       }
>   
>       devfn = pdev->devfn;
> -    ret = hd->platform_ops->reassign_device(d, target, devfn,
> -                                            pci_to_dev(pdev));
> +    ret = iommu_call(hd->platform_ops, reassign_device, d, target, devfn,
> +                     pci_to_dev(pdev));
>       if ( ret )
>           goto out;
>   
> @@ -1300,7 +1300,7 @@ static int iommu_add_device(struct pci_d
>   {
>       const struct domain_iommu *hd;
>       int rc;
> -    u8 devfn;
> +    unsigned int devfn = pdev->devfn;
>   
>       if ( !pdev->domain )
>           return -EINVAL;
> @@ -1311,16 +1311,16 @@ static int iommu_add_device(struct pci_d
>       if ( !is_iommu_enabled(pdev->domain) )
>           return 0;
>   
> -    rc = hd->platform_ops->add_device(pdev->devfn, pci_to_dev(pdev));
> +    rc = iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev));
>       if ( rc || !pdev->phantom_stride )
>           return rc;
>   
> -    for ( devfn = pdev->devfn ; ; )
> +    for ( ; ; )
>       {
>           devfn += pdev->phantom_stride;
>           if ( PCI_SLOT(devfn) != PCI_SLOT(pdev->devfn) )
>               return 0;
> -        rc = hd->platform_ops->add_device(devfn, pci_to_dev(pdev));
> +        rc = iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev));
>           if ( rc )
>               printk(XENLOG_WARNING "IOMMU: add %pp failed (%d)\n",
>                      &pdev->sbdf, rc);
> @@ -1341,7 +1341,7 @@ static int iommu_enable_device(struct pc
>            !hd->platform_ops->enable_device )
>           return 0;
>   
> -    return hd->platform_ops->enable_device(pci_to_dev(pdev));
> +    return iommu_call(hd->platform_ops, enable_device, pci_to_dev(pdev));
>   }
>   
>   static int iommu_remove_device(struct pci_dev *pdev)
> @@ -1363,7 +1363,8 @@ static int iommu_remove_device(struct pc
>           devfn += pdev->phantom_stride;
>           if ( PCI_SLOT(devfn) != PCI_SLOT(pdev->devfn) )
>               break;
> -        rc = hd->platform_ops->remove_device(devfn, pci_to_dev(pdev));
> +        rc = iommu_call(hd->platform_ops, remove_device, devfn,
> +                        pci_to_dev(pdev));
>           if ( !rc )
>               continue;
>   
> @@ -1371,7 +1372,9 @@ static int iommu_remove_device(struct pc
>           return rc;
>       }
>   
> -    return hd->platform_ops->remove_device(pdev->devfn, pci_to_dev(pdev));
> +    devfn = pdev->devfn;
> +
> +    return iommu_call(hd->platform_ops, remove_device, devfn, pci_to_dev(pdev));
>   }
>   
>   static int device_assigned(u16 seg, u8 bus, u8 devfn)
> @@ -1421,7 +1424,8 @@ static int assign_device(struct domain *
>   
>       pdev->fault.count = 0;
>   
> -    if ( (rc = hd->platform_ops->assign_device(d, devfn, pci_to_dev(pdev), flag)) )
> +    if ( (rc = iommu_call(hd->platform_ops, assign_device, d, devfn,
> +                          pci_to_dev(pdev), flag)) )
>           goto done;
>   
>       for ( ; pdev->phantom_stride; rc = 0 )
> @@ -1429,7 +1433,8 @@ static int assign_device(struct domain *
>           devfn += pdev->phantom_stride;
>           if ( PCI_SLOT(devfn) != PCI_SLOT(pdev->devfn) )
>               break;
> -        rc = hd->platform_ops->assign_device(d, devfn, pci_to_dev(pdev), flag);
> +        rc = iommu_call(hd->platform_ops, assign_device, d, devfn,
> +                        pci_to_dev(pdev), flag);
>       }
>   
>    done:
> @@ -1457,24 +1462,24 @@ static int iommu_get_device_group(
>       if ( !is_iommu_enabled(d) || !ops->get_device_group_id )
>           return 0;
>   
> -    group_id = ops->get_device_group_id(seg, bus, devfn);
> +    group_id = iommu_call(ops, get_device_group_id, seg, bus, devfn);
>   
>       pcidevs_lock();
>       for_each_pdev( d, pdev )
>       {
> -        if ( (pdev->seg != seg) ||
> -             ((pdev->bus == bus) && (pdev->devfn == devfn)) )
> +        unsigned int b = pdev->bus;
> +        unsigned int df = pdev->devfn;
> +
> +        if ( (pdev->seg != seg) || ((b == bus) && (df == devfn)) )
>               continue;
>   
> -        if ( xsm_get_device_group(XSM_HOOK, (seg << 16) | (pdev->bus << 8) | pdev->devfn) )
> +        if ( xsm_get_device_group(XSM_HOOK, (seg << 16) | (b << 8) | df) )
>               continue;
>   
> -        sdev_id = ops->get_device_group_id(seg, pdev->bus, pdev->devfn);
> +        sdev_id = iommu_call(ops, get_device_group_id, seg, b, df);
>           if ( (sdev_id == group_id) && (i < max_sdevs) )
>           {
> -            bdf = 0;
> -            bdf |= (pdev->bus & 0xff) << 16;
> -            bdf |= (pdev->devfn & 0xff) << 8;
> +            bdf = (b << 16) | (df << 8);

Don't we have a macro for this now? Probably best to start using it 
whilst modifying the code.

Anyway...

Reviewed-by: Paul Durrant <paul@xen.org>

>   
>               if ( unlikely(copy_to_guest_offset(buf, i, &bdf, 1)) )
>               {
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -145,7 +145,7 @@ unsigned int iommu_read_apic_from_ire(un
>   int __init iommu_setup_hpet_msi(struct msi_desc *msi)
>   {
>       const struct iommu_ops *ops = iommu_get_ops();
> -    return ops->setup_hpet_msi ? ops->setup_hpet_msi(msi) : -ENODEV;
> +    return ops->setup_hpet_msi ? iommu_call(ops, setup_hpet_msi, msi) : -ENODEV;
>   }
>   
>   void __hwdom_init arch_iommu_check_autotranslated_hwdom(struct domain *d)
> @@ -406,7 +406,7 @@ int iommu_free_pgtables(struct domain *d
>        * Pages will be moved to the free list below. So we want to
>        * clear the root page-table to avoid any potential use after-free.
>        */
> -    hd->platform_ops->clear_root_pgtable(d);
> +    iommu_vcall(hd->platform_ops, clear_root_pgtable, d);
>   
>       while ( (pg = page_list_remove_head(&hd->arch.pgtables.list)) )
>       {
> 


