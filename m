Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 264918CE5DF
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 15:17:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729546.1134739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAUnL-0002VL-93; Fri, 24 May 2024 13:17:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729546.1134739; Fri, 24 May 2024 13:17:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAUnL-0002Td-6U; Fri, 24 May 2024 13:17:15 +0000
Received: by outflank-mailman (input) for mailman id 729546;
 Fri, 24 May 2024 13:17:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sAUnK-0002TX-E8
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 13:17:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sAUnK-00020p-0T; Fri, 24 May 2024 13:17:14 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sAUnJ-0003Hk-O7; Fri, 24 May 2024 13:17:13 +0000
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
	bh=PZG83prhR7sl336lFyk5R5T1yEEiU5iJ5MdzhJGFSsM=; b=IqOb9/vDFzmHmhY6ZqoNlcXxgq
	PjGBlW78AojAo880NJamZdrfbRMSD9Ayl4bsXxJkhsj4cmK+fjuBJ/37UHpgZAVURdY803SspkGrl
	BJIcgvZLGWssNqsSaaTiT1PqGJa1IuUxSAXSv7j4xzgc7JcBlPYdxG3ljA5xUHa1/y8s=;
Message-ID: <2842184e-98ab-4c4c-922d-05972ef88a21@xen.org>
Date: Fri, 24 May 2024 14:17:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 4/5] xen/arm: translate virtual PCI bus topology for
 guests
Content-Language: en-GB
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240517170619.45088-1-stewart.hildebrand@amd.com>
 <20240517170619.45088-5-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240517170619.45088-5-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stewart,

On 17/05/2024 18:06, Stewart Hildebrand wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> There are three  originators for the PCI configuration space access:
> 1. The domain that owns physical host bridge: MMIO handlers are
> there so we can update vPCI register handlers with the values
> written by the hardware domain, e.g. physical view of the registers
> vs guest's view on the configuration space.
> 2. Guest access to the passed through PCI devices: we need to properly
> map virtual bus topology to the physical one, e.g. pass the configuration
> space access to the corresponding physical devices.
> 3. Emulated host PCI bridge access. It doesn't exist in the physical
> topology, e.g. it can't be mapped to some physical host bridge.
> So, all access to the host bridge itself needs to be trapped and
> emulated.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

With one remark below, for Arm:

Acked-by: Julien Grall <jgrall@amazon.com>

[...]

> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 23722634d50b..98b294f09688 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -81,6 +81,30 @@ static int add_virtual_device(struct pci_dev *pdev)
>       return 0;
>   }
>   
> +/*
> + * Find the physical device which is mapped to the virtual device
> + * and translate virtual SBDF to the physical one.
> + */
> +bool vpci_translate_virtual_device(const struct domain *d, pci_sbdf_t *sbdf)
> +{
> +    const struct pci_dev *pdev;
> +
> +    ASSERT(!is_hardware_domain(d));
> +    ASSERT(rw_is_locked(&d->pci_lock));
> +
> +    for_each_pdev ( d, pdev )

(This doesn't need to be addressed now)


I see that we have other places with for_each_pdev() in the vCPI. So are 
we expecting the list to be smallish?

If not, then we may want to consider reworking the datastructure or put 
a limit on the number of PCI devices assigned.


> +    {
> +        if ( pdev->vpci && (pdev->vpci->guest_sbdf.sbdf == sbdf->sbdf) )
> +        {
> +            /* Replace guest SBDF with the physical one. */
> +            *sbdf = pdev->sbdf;
> +            return true;
> +        }
> +    }
> +
> +    return false;
> +}
> +
>   #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
>   
>   void vpci_deassign_device(struct pci_dev *pdev)
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index 980aded26fc1..7e5a0f0c50c1 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -303,6 +303,18 @@ static inline bool __must_check vpci_process_pending(struct vcpu *v)
>   }
>   #endif
>   
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +bool vpci_translate_virtual_device(const struct domain *d, pci_sbdf_t *sbdf);
> +#else
> +static inline bool vpci_translate_virtual_device(const struct domain *d,
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

