Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0974A75CFD
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 00:00:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931823.1334008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tz0hF-0002iV-V3; Sun, 30 Mar 2025 22:00:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931823.1334008; Sun, 30 Mar 2025 22:00:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tz0hF-0002f9-SF; Sun, 30 Mar 2025 22:00:01 +0000
Received: by outflank-mailman (input) for mailman id 931823;
 Sun, 30 Mar 2025 22:00:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tz0hF-0002XI-4B
 for xen-devel@lists.xenproject.org; Sun, 30 Mar 2025 22:00:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tz0hD-000WXs-1e;
 Sun, 30 Mar 2025 21:59:59 +0000
Received: from [2a02:8012:3a1:0:51d5:4bad:16b9:5cff]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tz0hD-00AW29-0z;
 Sun, 30 Mar 2025 21:59:59 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=t7p4rh3pV01dTLtrBZcmMrQoP0cmtVFiiVXoWGxmV2c=; b=SzwCT11UNUAWKg5sIhZ41Rpn2I
	Np3yHdsMS51xjKeejOQRhxKUDQUHw1C/V5GbA16ce6+bSfHiiDvjdHP2A9GBo+6+63+x/xxpkM5k2
	PXn9tbqcfBg1s4PZ25cVvUuDF1OGnLlC7Wejl1V7eLzHGCi/CVPOsYo8UumHxQp2n9w0=;
Message-ID: <346fadbb-deff-4403-88d7-b77b7002f913@xen.org>
Date: Sun, 30 Mar 2025 22:59:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 1/2] xen/arm: translate virtual PCI bus topology for
 guests
Content-Language: en-GB
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jiqian Chen <Jiqian.Chen@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
References: <20250325172727.600716-1-stewart.hildebrand@amd.com>
 <20250325172727.600716-2-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250325172727.600716-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stewart,

I realize this series is at v18, but there are a few bits security-wise 
that concerns me. They don't have to be handled now because vPCI is 
still in tech preview. But we probably want to keep track of any issues 
if this hasn't yet been done in the code.

On 25/03/2025 17:27, Stewart Hildebrand wrote:
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 1e6aa5d799b9..49c9444195d7 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -81,6 +81,32 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
>       return 0;
>   }
>   
> +/*
> + * Find the physical device which is mapped to the virtual device
> + * and translate virtual SBDF to the physical one.
> + */
> +bool vpci_translate_virtual_device(struct domain *d, pci_sbdf_t *sbdf)
> +{
> +    const struct pci_dev *pdev;
> +
> +    ASSERT(!is_hardware_domain(d));
> +    read_lock(&d->pci_lock);
> +
> +    for_each_pdev ( d, pdev )

I can't remember whether this was discussed before (there is no 
indication in the commit message). What's the maximum number of PCI 
devices supported? Do we limit it?

Asking because iterating through the list could end up to be quite 
expensive.

Also, not a change for this patch, but it seems vcpi_{read,write} will 
also do another lookup. This is quite innefficient. We should consider 
return a pdev and use it for vcpi_{read,write}.

> +    {
> +        if ( pdev->vpci && (pdev->vpci->guest_sbdf.sbdf == sbdf->sbdf) )
> +        {
> +            /* Replace guest SBDF with the physical one. */
> +            *sbdf = pdev->sbdf;
> +            read_unlock(&d->pci_lock);
> +            return true;
> +        }
> +    }
> +
> +    read_unlock(&d->pci_lock);

At the point this is unlocked, what prevent the sbdf to be detached from 
the domain? If nothing, would this mean the domain can access something 
it should not?

 > +    return false;> +}
> +
>   #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
>   
>   void vpci_deassign_device(struct pci_dev *pdev)
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index 807401b2eaa2..e355329913ef 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -311,6 +311,18 @@ static inline int __must_check vpci_reset_device(struct pci_dev *pdev)
>       return vpci_assign_device(pdev);
>   }
>   
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +bool vpci_translate_virtual_device(struct domain *d, pci_sbdf_t *sbdf);
> +#else
> +static inline bool vpci_translate_virtual_device(struct domain *d,
> +                                                 pci_sbdf_t *sbdf)
> +{
> +    ASSERT_UNREACHABLE();
> +
> +    return false;
> +}
> +#endif
> +
>   #endif
>   
>   /*

Cheers,

-- 
Julien Grall


