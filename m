Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0033B2F87AF
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 22:30:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68644.122904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Wfe-0000ll-TS; Fri, 15 Jan 2021 21:30:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68644.122904; Fri, 15 Jan 2021 21:30:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Wfe-0000lM-PK; Fri, 15 Jan 2021 21:30:14 +0000
Received: by outflank-mailman (input) for mailman id 68644;
 Fri, 15 Jan 2021 21:30:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l0Wfd-0000lH-Hj
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 21:30:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0WfZ-0004wA-Io; Fri, 15 Jan 2021 21:30:09 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0WfZ-0007Tq-4J; Fri, 15 Jan 2021 21:30:09 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Hg8hYEwkzKhBs/8xcgW8anIkr6jaQkP+4tcrB0w+yDU=; b=3Vk47lBqMSh7pVY7fBnpYfubRH
	iJtjtHMLDAA7Bj+Raf5OW/mHSMiYgd/FGCi0J7PdPk+5BEjB7aP8vdwofSjDP+bbx1EtSmXAhL2Fz
	4NrUQF41ClzMbTFti6YC4xi87a1cdyqyJ0E6AfTMTFpTGsZkUzwa92nGr9z44CD3NXV8=;
Subject: Re: [PATCH V4 23/24] libxl: Introduce basic virtio-mmio support on
 Arm
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-24-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <25b62097-9ea9-31f3-0f8f-92a7f0d01d7c@xen.org>
Date: Fri, 15 Jan 2021 21:30:06 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1610488352-18494-24-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 12/01/2021 21:52, Oleksandr Tyshchenko wrote:
> From: Julien Grall <julien.grall@arm.com>
> 
> This patch creates specific device node in the Guest device-tree
> with allocated MMIO range and SPI interrupt if specific 'virtio'
> property is present in domain config.

 From my understanding, for each virtio device use the MMIO transparent,
we would need to reserve an area in memory for its exclusive use.

If I were an admin, I would expect to only describe the list of virtio 
devices I want to assign to my guest and then let the toolstack figure 
out how to expose them.

So I am not quite too sure how this new parameter can be used. Could you 
expand it?

> 
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> [On Arm only]
> Tested-by: Wei Chen <Wei.Chen@arm.com>
> 
> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
> 
> Changes RFC -> V1:
>     - was squashed with:
>       "[RFC PATCH V1 09/12] libxl: Handle virtio-mmio irq in more correct way"
>       "[RFC PATCH V1 11/12] libxl: Insert "dma-coherent" property into virtio-mmio device node"
>       "[RFC PATCH V1 12/12] libxl: Fix duplicate memory node in DT"
>     - move VirtIO MMIO #define-s to xen/include/public/arch-arm.h
> 
> Changes V1 -> V2:
>     - update the author of a patch
> 
> Changes V2 -> V3:
>     - no changes
> 
> Changes V3 -> V4:
>     - no changes
> ---
>   tools/libs/light/libxl_arm.c     | 58 ++++++++++++++++++++++++++++++++++++++--
>   tools/libs/light/libxl_types.idl |  1 +
>   tools/xl/xl_parse.c              |  1 +
>   xen/include/public/arch-arm.h    |  5 ++++
>   4 files changed, 63 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 66e8a06..588ee5a 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -26,8 +26,8 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>   {
>       uint32_t nr_spis = 0;
>       unsigned int i;
> -    uint32_t vuart_irq;
> -    bool vuart_enabled = false;
> +    uint32_t vuart_irq, virtio_irq;
> +    bool vuart_enabled = false, virtio_enabled = false;
>   
>       /*
>        * If pl011 vuart is enabled then increment the nr_spis to allow allocation
> @@ -39,6 +39,17 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>           vuart_enabled = true;
>       }
>   
> +    /*
> +     * XXX: Handle properly virtio
> +     * A proper solution would be the toolstack to allocate the interrupts
> +     * used by each virtio backend and let the backend now which one is used
> +     */
> +    if (libxl_defbool_val(d_config->b_info.arch_arm.virtio)) {
> +        nr_spis += (GUEST_VIRTIO_MMIO_SPI - 32) + 1;
> +        virtio_irq = GUEST_VIRTIO_MMIO_SPI;
> +        virtio_enabled = true;
> +    }
> +
>       for (i = 0; i < d_config->b_info.num_irqs; i++) {
>           uint32_t irq = d_config->b_info.irqs[i];
>           uint32_t spi;
> @@ -58,6 +69,12 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>               return ERROR_FAIL;
>           }
>   
> +        /* The same check as for vpl011 */
> +        if (virtio_enabled && irq == virtio_irq) {
> +            LOG(ERROR, "Physical IRQ %u conflicting with virtio SPI\n", irq);
> +            return ERROR_FAIL;
> +        }
> +
>           if (irq < 32)
>               continue;
>   
> @@ -658,6 +675,39 @@ static int make_vpl011_uart_node(libxl__gc *gc, void *fdt,
>       return 0;
>   }
>   
> +static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
> +                                 uint64_t base, uint32_t irq)
> +{
> +    int res;
> +    gic_interrupt intr;
> +    /* Placeholder for virtio@ + a 64-bit number + \0 */
> +    char buf[24];
> +
> +    snprintf(buf, sizeof(buf), "virtio@%"PRIx64, base);
> +    res = fdt_begin_node(fdt, buf);
> +    if (res) return res;
> +
> +    res = fdt_property_compat(gc, fdt, 1, "virtio,mmio");
> +    if (res) return res;
> +
> +    res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> +                            1, base, GUEST_VIRTIO_MMIO_SIZE);
> +    if (res) return res;
> +
> +    set_interrupt(intr, irq, 0xf, DT_IRQ_TYPE_EDGE_RISING);
> +    res = fdt_property_interrupts(gc, fdt, &intr, 1);
> +    if (res) return res;
> +
> +    res = fdt_property(fdt, "dma-coherent", NULL, 0);
> +    if (res) return res;
> +
> +    res = fdt_end_node(fdt);
> +    if (res) return res;
> +
> +    return 0;
> +
> +}
> +
>   static const struct arch_info *get_arch_info(libxl__gc *gc,
>                                                const struct xc_dom_image *dom)
>   {
> @@ -961,6 +1011,9 @@ next_resize:
>           if (info->tee == LIBXL_TEE_TYPE_OPTEE)
>               FDT( make_optee_node(gc, fdt) );
>   
> +        if (libxl_defbool_val(info->arch_arm.virtio))
> +            FDT( make_virtio_mmio_node(gc, fdt, GUEST_VIRTIO_MMIO_BASE, GUEST_VIRTIO_MMIO_SPI) ); > +
>           if (pfdt)
>               FDT( copy_partial_fdt(gc, fdt, pfdt) );
>   
> @@ -1178,6 +1231,7 @@ void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
>   {
>       /* ACPI is disabled by default */
>       libxl_defbool_setdefault(&b_info->acpi, false);
> +    libxl_defbool_setdefault(&b_info->arch_arm.virtio, false);
>   
>       if (b_info->type != LIBXL_DOMAIN_TYPE_PV)
>           return;
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 0532473..839df86 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -640,6 +640,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>   
>   
>       ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
> +                               ("virtio", libxl_defbool),

Regardless the question above, this doesn't sound very Arm specific.


I think we want to get the virtio configuration arch-agnostic because an 
admin should not need to know the arch internal to be able to assign 
virtio devices.

That said, you can leave it completely unimplemented for anything other 
than Arm.

If you add new parameters in the idl, you will also want to introduce a 
define in libxl.h so an external toolstack (such as libvirt) can detect 
whether the field is supported by the installed version of libxl. See 
the other LIBXL_HAVE_*.

>                                  ("vuart", libxl_vuart_type),
>                                 ])),
>       # Alternate p2m is not bound to any architecture or guest type, as it is
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 4ebf396..2a3364b 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -2581,6 +2581,7 @@ skip_usbdev:
>       }
>   
>       xlu_cfg_get_defbool(config, "dm_restrict", &b_info->dm_restrict, 0);
> +    xlu_cfg_get_defbool(config, "virtio", &b_info->arch_arm.virtio, 0);

Regardless the question above, any addition in the configuration file 
should be documented docs/man/xl.cfg.5.pod.in.

>   
>       if (c_info->type == LIBXL_DOMAIN_TYPE_HVM) {
>           if (!xlu_cfg_get_string (config, "vga", &buf, 0)) {
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index c365b1b..be7595f 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -464,6 +464,11 @@ typedef uint64_t xen_callback_t;
>   #define PSCI_cpu_on      2
>   #define PSCI_migrate     3
>   
> +/* VirtIO MMIO definitions */
> +#define GUEST_VIRTIO_MMIO_BASE  xen_mk_ullong(0x02000000)

You will want to define any new region with the other *_{BASE, SIZE} 
above. Note that they should be ordered from bottom to the top of the 
memory layout.

> +#define GUEST_VIRTIO_MMIO_SIZE  xen_mk_ullong(0x200)

AFAICT, the size of the virtio mmio region should be 0x100. So why is it 
0x200?

> +#define GUEST_VIRTIO_MMIO_SPI   33

This will want to be defined with the other GUEST_*_SPI above.

Most likely, you will want to reserve a range

Cheers,

-- 
Julien Grall

