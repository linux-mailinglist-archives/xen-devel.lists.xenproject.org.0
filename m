Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A9D43266E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 20:33:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212517.370390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcXRO-0007w9-Q6; Mon, 18 Oct 2021 18:32:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212517.370390; Mon, 18 Oct 2021 18:32:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcXRO-0007uJ-Md; Mon, 18 Oct 2021 18:32:54 +0000
Received: by outflank-mailman (input) for mailman id 212517;
 Mon, 18 Oct 2021 18:32:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mcXRM-0007uD-KO
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 18:32:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mcXRM-00039e-59; Mon, 18 Oct 2021 18:32:52 +0000
Received: from [54.239.6.185] (helo=[192.168.19.91])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mcXRL-0005hd-Uc; Mon, 18 Oct 2021 18:32:52 +0000
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
	bh=FpD3UpnW9Nxhki4OwA10RgZLqjawutR26jY2yHoHd+M=; b=w2vv1l16LOk2xMYreNIeZdWATm
	neblr/Gob4E5eBjM+DfsTiN68wol8/MlLWd50C4m7TZh7L/DHfv3Y5aOnWImIaWhMjdXfwbnqFPlx
	SqW8MmCUSMtq9WRz3kR92mdNjMKkgqPOd/hSwYUkDyzLL3PIr/GfMFPtuKx04rnUPHHw=;
Message-ID: <69d6abd2-55e4-e821-1aaa-828cc49baae6@xen.org>
Date: Mon, 18 Oct 2021 19:32:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v3 11/11] xen/arm: Translate virtual PCI bus topology for
 guests
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 jbeulich@suse.com, bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-12-andr2000@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20210930075223.860329-12-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 30/09/2021 08:52, Oleksandr Andrushchenko wrote:
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
> 
> ---
> Since v2:
>   - pass struct domain instead of struct vcpu
>   - constify arguments where possible
>   - gate relevant code with CONFIG_HAS_VPCI_GUEST_SUPPORT
> New in v2
> ---
>   xen/arch/arm/domain.c         |  1 +
>   xen/arch/arm/vpci.c           | 86 +++++++++++++++++++++++++++++++----
>   xen/arch/arm/vpci.h           |  3 ++
>   xen/drivers/passthrough/pci.c | 25 ++++++++++
>   xen/include/asm-arm/pci.h     |  1 +
>   xen/include/xen/pci.h         |  1 +
>   xen/include/xen/sched.h       |  2 +
>   7 files changed, 111 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index fa6fcc5e467c..095671742ad8 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -797,6 +797,7 @@ void arch_domain_destroy(struct domain *d)
>                          get_order_from_bytes(d->arch.efi_acpi_len));
>   #endif
>       domain_io_free(d);
> +    domain_vpci_free(d);
>   }
>   
>   void arch_domain_shutdown(struct domain *d)
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> index 5d6c29c8dcd9..26ec2fa7cf2d 100644
> --- a/xen/arch/arm/vpci.c
> +++ b/xen/arch/arm/vpci.c
> @@ -17,6 +17,14 @@
>   
>   #define REGISTER_OFFSET(addr)  ( (addr) & 0x00000fff)
>   
> +struct vpci_mmio_priv {
> +    /*
> +     * Set to true if the MMIO handlers were set up for the emulated
> +     * ECAM host PCI bridge.
> +     */
> +    bool is_virt_ecam;
> +};
> +
>   /* Do some sanity checks. */
>   static bool vpci_mmio_access_allowed(unsigned int reg, unsigned int len)
>   {
> @@ -38,6 +46,7 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>       pci_sbdf_t sbdf;
>       unsigned long data = ~0UL;
>       unsigned int size = 1U << info->dabt.size;
> +    struct vpci_mmio_priv *priv = (struct vpci_mmio_priv *)p;

This cast is unnecessary. Same...

>   
>       sbdf.sbdf = MMCFG_BDF(info->gpa);
>       reg = REGISTER_OFFSET(info->gpa);
> @@ -45,6 +54,13 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>       if ( !vpci_mmio_access_allowed(reg, size) )
>           return 0;
>   
> +    /*
> +     * For the passed through devices we need to map their virtual SBDF
> +     * to the physical PCI device being passed through.
> +     */
> +    if ( priv->is_virt_ecam && !pci_translate_virtual_device(v->domain, &sbdf) )
> +            return 1;
> +
>       data = vpci_read(sbdf, reg, min(4u, size));
>       if ( size == 8 )
>           data |= (uint64_t)vpci_read(sbdf, reg + 4, 4) << 32;
> @@ -61,6 +77,7 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
>       pci_sbdf_t sbdf;
>       unsigned long data = r;
>       unsigned int size = 1U << info->dabt.size;
> +    struct vpci_mmio_priv *priv = (struct vpci_mmio_priv *)p;

... here. But is it meant to be modified? If not, then I think you want 
to turn it to add a const in both cases.

>   
>       sbdf.sbdf = MMCFG_BDF(info->gpa);
>       reg = REGISTER_OFFSET(info->gpa);
> @@ -68,6 +85,13 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
>       if ( !vpci_mmio_access_allowed(reg, size) )
>           return 0;
>   
> +    /*
> +     * For the passed through devices we need to map their virtual SBDF
> +     * to the physical PCI device being passed through.
> +     */
> +    if ( priv->is_virt_ecam && !pci_translate_virtual_device(v->domain, &sbdf) )
> +            return 1;
> +
>       vpci_write(sbdf, reg, min(4u, size), data);
>       if ( size == 8 )
>           vpci_write(sbdf, reg + 4, 4, data >> 32);
> @@ -80,13 +104,48 @@ static const struct mmio_handler_ops vpci_mmio_handler = {
>       .write = vpci_mmio_write,
>   };
>   
> +/*
> + * There are three  originators for the PCI configuration space access:
> + * 1. The domain that owns physical host bridge: MMIO handlers are
> + *    there so we can update vPCI register handlers with the values
> + *    written by the hardware domain, e.g. physical view of the registers/
> + *    configuration space.
> + * 2. Guest access to the passed through PCI devices: we need to properly
> + *    map virtual bus topology to the physical one, e.g. pass the configuration
> + *    space access to the corresponding physical devices.
> + * 3. Emulated host PCI bridge access. It doesn't exist in the physical
> + *    topology, e.g. it can't be mapped to some physical host bridge.
> + *    So, all access to the host bridge itself needs to be trapped and
> + *    emulated.
> + */
>   static int vpci_setup_mmio_handler(struct domain *d,
>                                      struct pci_host_bridge *bridge)
>   {
> -    struct pci_config_window *cfg = bridge->cfg;
> +    struct vpci_mmio_priv *priv;
> +
> +    priv = xzalloc(struct vpci_mmio_priv);
> +    if ( !priv )
> +        return -ENOMEM;
> +
> +    priv->is_virt_ecam = !is_hardware_domain(d);
>   
> -    register_mmio_handler(d, &vpci_mmio_handler,
> -                          cfg->phys_addr, cfg->size, NULL);
> +    if ( is_hardware_domain(d) )
> +    {
> +        struct pci_config_window *cfg = bridge->cfg;
> +
> +        bridge->mmio_priv = priv;
> +        register_mmio_handler(d, &vpci_mmio_handler,
> +                              cfg->phys_addr, cfg->size,
> +                              priv);
> +    }
> +    else
> +    {
> +        d->vpci_mmio_priv = priv;

Something feels odd to me in this code. The if ( !is_hardware_domain(d) 
) part seems to suggests that this can be called on multiple bridge. But 
here you are directly assigning priv to d->vpci_mmio_priv.

The call...

> +        /* Guest domains use what is programmed in their device tree. */
> +        register_mmio_handler(d, &vpci_mmio_handler,
> +                              GUEST_VPCI_ECAM_BASE, GUEST_VPCI_ECAM_SIZE,
> +                              priv);
> +    }
>       return 0;
>   }
>   
> @@ -95,14 +154,25 @@ int domain_vpci_init(struct domain *d)
>       if ( !has_vpci(d) )
>           return 0;
>   
> +    return pci_host_iterate_bridges(d, vpci_setup_mmio_handler);

... here seems to confirm that you may (in theory) have multiple 
bridges. So the 'else' would want some rework to avoid assuming a single 
bridge.

> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 5b963d75d1ba..b7dffb769cfd 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -889,6 +889,31 @@ int pci_remove_virtual_device(struct domain *d, const struct pci_dev *pdev)
>       xfree(vdev);
>       return 0;
>   }
> +
> +/*
> + * Find the physical device which is mapped to the virtual device
> + * and translate virtual SBDF to the physical one.
> + */
> +bool pci_translate_virtual_device(const struct domain *d, pci_sbdf_t *sbdf)
> +{
> +    struct vpci_dev *vdev;
> +    bool found = false;
> +
> +    pcidevs_lock();
> +    list_for_each_entry ( vdev, &d->vdev_list, list )

I haven't looked at the rest of the series yet. But I am a bit concerned 
to see code to iterate through a list accessible by the guest.
   1) What safety mechanism do we have in place to ensure that the list 
is going to be small
   2) If there is a limit, do we have any documentation on top of this 
limit to make clear this can't be bumped without removing the list?

Cheers,

-- 
Julien Grall

