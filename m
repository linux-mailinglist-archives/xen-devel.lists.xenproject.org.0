Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CC82F95E6
	for <lists+xen-devel@lfdr.de>; Sun, 17 Jan 2021 23:24:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69345.124048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1GRh-0000bB-UE; Sun, 17 Jan 2021 22:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69345.124048; Sun, 17 Jan 2021 22:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1GRh-0000ar-R2; Sun, 17 Jan 2021 22:22:53 +0000
Received: by outflank-mailman (input) for mailman id 69345;
 Sun, 17 Jan 2021 22:22:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i0Xk=GU=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l1GRf-0000am-QJ
 for xen-devel@lists.xenproject.org; Sun, 17 Jan 2021 22:22:51 +0000
Received: from mail-lj1-x22a.google.com (unknown [2a00:1450:4864:20::22a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 130f717e-243f-4f74-9eb5-33d09988629c;
 Sun, 17 Jan 2021 22:22:49 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id b10so16278251ljp.6
 for <xen-devel@lists.xenproject.org>; Sun, 17 Jan 2021 14:22:49 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id h23sm1517281ljh.115.2021.01.17.14.22.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jan 2021 14:22:48 -0800 (PST)
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
X-Inumbo-ID: 130f717e-243f-4f74-9eb5-33d09988629c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=0JnzGYtOKqerBzRqE7IvlVH4q9oMu3huJkislzXIAks=;
        b=hNSnxfSiTUhyJPGi2LvXBiCIM66/rlhRt4mzgP0wxYDgcTaPXSgv64TPyD5ltymsqL
         m0XAxi59YwPuXuKjQWaBhaLPkfR6y4I7Fd3JP6zlCp6cSUy4yUz+8dXA7I1gE5d/y5xJ
         hLexpwh79ndFt0AtyaVZ8xFr/7b3cL50GjUGjqaFpHFVL0IZKiWhgVrdA7oV1sJ69ze3
         HbXL+/HOrZOUA6pkYlIQLtsSWFty78/Ul0EdVEy+AW0JMNqN/PWWMtFlI4cqVrj6av+n
         tPvxemYX+e6NQ52KMdR6i8cIAPBboOm6TBu2bUXJWmjMs/CwRoUUPEChn0yE4YPip4is
         QshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=0JnzGYtOKqerBzRqE7IvlVH4q9oMu3huJkislzXIAks=;
        b=luCSRvq+yzOnX2m71hx98QxyEoJFffNu+OfCT25Ph27Ut72W+WswdxhF7ZKu4y3WKF
         lzgMv03t6Om9j7iOT1gwzK7m0+GJokwHWjoUtpMHyl14K544KIcxWNdWooNjM3h/yQyD
         CJry1cR5WmbkZiwz7hQ15ySnC8swSm7vwlKnvhxmJqLncYE5H3qVMb37tzGkMHj7d/CD
         PJORgL+UUmNNtzaIzJIjJKOD/Cnqec9waq0i2s4uc2yzzsLPmhZsXdyA3iFO86sVXQxm
         eZVl7OxkWxTWN8zXpYgdk9Xk4X443a/onXgx3/zM8PnIjFsQxtKSG59AwOdd0ZKUF872
         wVBg==
X-Gm-Message-State: AOAM530QcZbCkALKhfBjUHT0NiArtUdiXxJmiKymXmpMfZ/5UX7xtb0P
	w/9Jm8d2VM/Jz8ZuEBMk+zs=
X-Google-Smtp-Source: ABdhPJyR32vBPkR9Zjke6H2y02RVdCWWgwyxYYPRxng4yUK7BEgz32tntIQGjtuRnmQNUJw6MnZINA==
X-Received: by 2002:a2e:9acd:: with SMTP id p13mr9917691ljj.394.1610922168685;
        Sun, 17 Jan 2021 14:22:48 -0800 (PST)
Subject: Re: [PATCH V4 23/24] libxl: Introduce basic virtio-mmio support on
 Arm
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-24-git-send-email-olekstysh@gmail.com>
 <25b62097-9ea9-31f3-0f8f-92a7f0d01d7c@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <51d44085-f178-3985-9324-da6494cd9d2e@gmail.com>
Date: Mon, 18 Jan 2021 00:22:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <25b62097-9ea9-31f3-0f8f-92a7f0d01d7c@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 15.01.21 23:30, Julien Grall wrote:
> Hi Oleksandr,


Hi Julien


>
> On 12/01/2021 21:52, Oleksandr Tyshchenko wrote:
>> From: Julien Grall <julien.grall@arm.com>
>>
>> This patch creates specific device node in the Guest device-tree
>> with allocated MMIO range and SPI interrupt if specific 'virtio'
>> property is present in domain config.
>
> From my understanding, for each virtio device use the MMIO transparent,
> we would need to reserve an area in memory for its exclusive use.
>
> If I were an admin, I would expect to only describe the list of virtio 
> devices I want to assign to my guest and then let the toolstack figure 
> out how to expose them.

Yes, I think in the same way.


>
>
> So I am not quite too sure how this new parameter can be used. Could 
> you expand it?
The original idea was to set it if we are going to assign virtio 
device(s) to the guest.
Being honest, I have a plan to remove this extra parameter. It might not 
be obvious looking at the current patch, but next patch will show that 
we can avoid introducing it at all.


>
>
>>
>> Signed-off-by: Julien Grall <julien.grall@arm.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> [On Arm only]
>> Tested-by: Wei Chen <Wei.Chen@arm.com>
>>
>> ---
>> Please note, this is a split/cleanup/hardening of Julien's PoC:
>> "Add support for Guest IO forwarding to a device emulator"
>>
>> Changes RFC -> V1:
>>     - was squashed with:
>>       "[RFC PATCH V1 09/12] libxl: Handle virtio-mmio irq in more 
>> correct way"
>>       "[RFC PATCH V1 11/12] libxl: Insert "dma-coherent" property 
>> into virtio-mmio device node"
>>       "[RFC PATCH V1 12/12] libxl: Fix duplicate memory node in DT"
>>     - move VirtIO MMIO #define-s to xen/include/public/arch-arm.h
>>
>> Changes V1 -> V2:
>>     - update the author of a patch
>>
>> Changes V2 -> V3:
>>     - no changes
>>
>> Changes V3 -> V4:
>>     - no changes
>> ---
>>   tools/libs/light/libxl_arm.c     | 58 
>> ++++++++++++++++++++++++++++++++++++++--
>>   tools/libs/light/libxl_types.idl |  1 +
>>   tools/xl/xl_parse.c              |  1 +
>>   xen/include/public/arch-arm.h    |  5 ++++
>>   4 files changed, 63 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
>> index 66e8a06..588ee5a 100644
>> --- a/tools/libs/light/libxl_arm.c
>> +++ b/tools/libs/light/libxl_arm.c
>> @@ -26,8 +26,8 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>>   {
>>       uint32_t nr_spis = 0;
>>       unsigned int i;
>> -    uint32_t vuart_irq;
>> -    bool vuart_enabled = false;
>> +    uint32_t vuart_irq, virtio_irq;
>> +    bool vuart_enabled = false, virtio_enabled = false;
>>         /*
>>        * If pl011 vuart is enabled then increment the nr_spis to 
>> allow allocation
>> @@ -39,6 +39,17 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>>           vuart_enabled = true;
>>       }
>>   +    /*
>> +     * XXX: Handle properly virtio
>> +     * A proper solution would be the toolstack to allocate the 
>> interrupts
>> +     * used by each virtio backend and let the backend now which one 
>> is used
>> +     */
>> +    if (libxl_defbool_val(d_config->b_info.arch_arm.virtio)) {
>> +        nr_spis += (GUEST_VIRTIO_MMIO_SPI - 32) + 1;
>> +        virtio_irq = GUEST_VIRTIO_MMIO_SPI;
>> +        virtio_enabled = true;
>> +    }
>> +
>>       for (i = 0; i < d_config->b_info.num_irqs; i++) {
>>           uint32_t irq = d_config->b_info.irqs[i];
>>           uint32_t spi;
>> @@ -58,6 +69,12 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>>               return ERROR_FAIL;
>>           }
>>   +        /* The same check as for vpl011 */
>> +        if (virtio_enabled && irq == virtio_irq) {
>> +            LOG(ERROR, "Physical IRQ %u conflicting with virtio 
>> SPI\n", irq);
>> +            return ERROR_FAIL;
>> +        }
>> +
>>           if (irq < 32)
>>               continue;
>>   @@ -658,6 +675,39 @@ static int make_vpl011_uart_node(libxl__gc 
>> *gc, void *fdt,
>>       return 0;
>>   }
>>   +static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
>> +                                 uint64_t base, uint32_t irq)
>> +{
>> +    int res;
>> +    gic_interrupt intr;
>> +    /* Placeholder for virtio@ + a 64-bit number + \0 */
>> +    char buf[24];
>> +
>> +    snprintf(buf, sizeof(buf), "virtio@%"PRIx64, base);
>> +    res = fdt_begin_node(fdt, buf);
>> +    if (res) return res;
>> +
>> +    res = fdt_property_compat(gc, fdt, 1, "virtio,mmio");
>> +    if (res) return res;
>> +
>> +    res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, 
>> GUEST_ROOT_SIZE_CELLS,
>> +                            1, base, GUEST_VIRTIO_MMIO_SIZE);
>> +    if (res) return res;
>> +
>> +    set_interrupt(intr, irq, 0xf, DT_IRQ_TYPE_EDGE_RISING);
>> +    res = fdt_property_interrupts(gc, fdt, &intr, 1);
>> +    if (res) return res;
>> +
>> +    res = fdt_property(fdt, "dma-coherent", NULL, 0);
>> +    if (res) return res;
>> +
>> +    res = fdt_end_node(fdt);
>> +    if (res) return res;
>> +
>> +    return 0;
>> +
>> +}
>> +
>>   static const struct arch_info *get_arch_info(libxl__gc *gc,
>>                                                const struct 
>> xc_dom_image *dom)
>>   {
>> @@ -961,6 +1011,9 @@ next_resize:
>>           if (info->tee == LIBXL_TEE_TYPE_OPTEE)
>>               FDT( make_optee_node(gc, fdt) );
>>   +        if (libxl_defbool_val(info->arch_arm.virtio))
>> +            FDT( make_virtio_mmio_node(gc, fdt, 
>> GUEST_VIRTIO_MMIO_BASE, GUEST_VIRTIO_MMIO_SPI) ); > +
>>           if (pfdt)
>>               FDT( copy_partial_fdt(gc, fdt, pfdt) );
>>   @@ -1178,6 +1231,7 @@ void 
>> libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
>>   {
>>       /* ACPI is disabled by default */
>>       libxl_defbool_setdefault(&b_info->acpi, false);
>> +    libxl_defbool_setdefault(&b_info->arch_arm.virtio, false);
>>         if (b_info->type != LIBXL_DOMAIN_TYPE_PV)
>>           return;
>> diff --git a/tools/libs/light/libxl_types.idl 
>> b/tools/libs/light/libxl_types.idl
>> index 0532473..839df86 100644
>> --- a/tools/libs/light/libxl_types.idl
>> +++ b/tools/libs/light/libxl_types.idl
>> @@ -640,6 +640,7 @@ libxl_domain_build_info = 
>> Struct("domain_build_info",[
>>           ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
>> +                               ("virtio", libxl_defbool),
>
> Regardless the question above, this doesn't sound very Arm specific.

yes


>
>
>
> I think we want to get the virtio configuration arch-agnostic because 
> an admin should not need to know the arch internal to be able to 
> assign virtio devices.

sounds reasonable


>
>
> That said, you can leave it completely unimplemented for anything 
> other than Arm.

got it


>
>
> If you add new parameters in the idl, you will also want to introduce 
> a define in libxl.h so an external toolstack (such as libvirt) can 
> detect whether the field is supported by the installed version of 
> libxl. See the other LIBXL_HAVE_*.

hmm, I didn't know about that, thank you.


>
>>                                  ("vuart", libxl_vuart_type),
>>                                 ])),
>>       # Alternate p2m is not bound to any architecture or guest type, 
>> as it is
>> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
>> index 4ebf396..2a3364b 100644
>> --- a/tools/xl/xl_parse.c
>> +++ b/tools/xl/xl_parse.c
>> @@ -2581,6 +2581,7 @@ skip_usbdev:
>>       }
>>         xlu_cfg_get_defbool(config, "dm_restrict", 
>> &b_info->dm_restrict, 0);
>> +    xlu_cfg_get_defbool(config, "virtio", &b_info->arch_arm.virtio, 0);
>
> Regardless the question above, any addition in the configuration file 
> should be documented docs/man/xl.cfg.5.pod.in.

yes, documentation is my nearest plan.


>
>
>>         if (c_info->type == LIBXL_DOMAIN_TYPE_HVM) {
>>           if (!xlu_cfg_get_string (config, "vga", &buf, 0)) {
>> diff --git a/xen/include/public/arch-arm.h 
>> b/xen/include/public/arch-arm.h
>> index c365b1b..be7595f 100644
>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -464,6 +464,11 @@ typedef uint64_t xen_callback_t;
>>   #define PSCI_cpu_on      2
>>   #define PSCI_migrate     3
>>   +/* VirtIO MMIO definitions */
>> +#define GUEST_VIRTIO_MMIO_BASE  xen_mk_ullong(0x02000000)
>
> You will want to define any new region with the other *_{BASE, SIZE} 
> above. Note that they should be ordered from bottom to the top of the 
> memory layout.

I got it, this one should be put at the very beginning (before vGIC v2 
mappings).


>
>
>> +#define GUEST_VIRTIO_MMIO_SIZE xen_mk_ullong(0x200)
>
> AFAICT, the size of the virtio mmio region should be 0x100. So why is 
> it 0x200?


I didn't find the total size requirement for the mmio region in virtio 
specification v1.1 (the size of control registers is indeed 0x100 and 
device-specific configuration registers starts at the offset 0x100, 
however it's size depends on the device and the driver).

kvmtool uses 0x200 [1], in some Linux device-trees we can see 0x200 [2] 
(however, device-tree bindings example has 0x100 [3]), so what would be 
the proper value for Xen code?


>
>> +#define GUEST_VIRTIO_MMIO_SPI   33
>
> This will want to be defined with the other GUEST_*_SPI above.

ok


>
>
> Most likely, you will want to reserve a range

it seems yes, good point. BTW, the range is needed for the mmio region 
as well, correct?


>
> Cheers,
>
[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git/tree/include/kvm/virtio-mmio.h#n9
[2] 
https://elixir.bootlin.com/linux/v5.11-rc3/source/arch/arm64/boot/dts/arm/foundation-v8.dtsi#L226
[3] 
https://elixir.bootlin.com/linux/v5.11-rc3/source/Documentation/devicetree/bindings/virtio/mmio.txt#L31


-- 
Regards,

Oleksandr Tyshchenko


