Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B941E600281
	for <lists+xen-devel@lfdr.de>; Sun, 16 Oct 2022 19:49:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.423885.670957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ok7kC-0008Rw-4I; Sun, 16 Oct 2022 17:48:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 423885.670957; Sun, 16 Oct 2022 17:48:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ok7kC-0008Q0-0u; Sun, 16 Oct 2022 17:48:12 +0000
Received: by outflank-mailman (input) for mailman id 423885;
 Sun, 16 Oct 2022 17:48:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ok7k9-0008Pu-RS
 for xen-devel@lists.xenproject.org; Sun, 16 Oct 2022 17:48:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ok7k2-0003KP-Pk; Sun, 16 Oct 2022 17:48:02 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226] helo=[10.85.34.141])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ok7k2-0002PU-Hd; Sun, 16 Oct 2022 17:48:02 +0000
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
	bh=mXglPGHiPe5q3CHx27YFdei2t2Cv9ep68EGI7/Nw+zQ=; b=Ea8+iCd9f1V/VxiUYrfaPkYw1x
	U+GwNCEagFGhBRCy294gY06ayqPNKvvQvchxC/H9wGQ1zeRnk17wKUj5Ioh9Vdwuh2w7gmFOUyhev
	i87S73CNwfeYrPEF79HNTHLtHwIuAXb2jF5Z6fHTvTkzZI0fdk49LKoARw1EqqogDnxc=;
Message-ID: <3e504b1b-197d-b77b-16e1-86530eb3d64c@xen.org>
Date: Sun, 16 Oct 2022 18:47:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH v1 10/12] hw/arm: introduce xenpv machine
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: stefano.stabellini@amd.com, Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-11-vikram.garhwal@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221015050750.4185-11-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

There seem to be some missing patches on xen-devel (including the cover 
letter). Is that expected?

On 15/10/2022 06:07, Vikram Garhwal wrote:
> Add a new machine xenpv which creates a IOREQ server to register/connect with
> Xen Hypervisor.

I don't like the name 'xenpv' because it doesn't convey the fact that 
some of the HW may be emulated rather than para-virtualized. In fact one 
may only want to use for emulating devices.

Potential name would be 'xen-arm' or re-using 'virt' but with 
'accel=xen' to select a Xen layout.

> 
> Xen IOREQ connection expect the TARGET_PAGE_SIZE to 4096, and the xenpv machine
> on ARM will have no CPU definitions. We need to define TARGET_PAGE_SIZE
> appropriately ourselves.
> 
> Optional: When CONFIG_TPM is enabled, it also creates a tpm-tis-device, adds a
> TPM emulator and connects to swtpm running on host machine via chardev socket
> and support TPM functionalities for a guest domain.
> 
> Extra command line for aarch64 xenpv QEMU to connect to swtpm:
>      -chardev socket,id=chrtpm,path=/tmp/myvtpm2/swtpm-sock \
>      -tpmdev emulator,id=tpm0,chardev=chrtpm \
> 
> swtpm implements a TPM software emulator(TPM 1.2 & TPM 2) built on libtpms and
> provides access to TPM functionality over socket, chardev and CUSE interface.
> Github repo: https://github.com/stefanberger/swtpm
> Example for starting swtpm on host machine:
>      mkdir /tmp/vtpm2
>      swtpm socket --tpmstate dir=/tmp/vtpm2 \
>      --ctrl type=unixio,path=/tmp/vtpm2/swtpm-sock &

I see patches for QEMU but not Xen. How can this be tested with existing 
Xen? Will libxl ever create QEMU?

[...]

> +static int xen_init_ioreq(XenIOState *state, unsigned int max_cpus)
> +{
> +    xen_dmod = xendevicemodel_open(0, 0);
> +    xen_xc = xc_interface_open(0, 0, 0);
> +
> +    if (xen_xc == NULL) {

You are checking xen_xc but not xen_dmod. Why?

> +        perror("xen: can't open xen interface\n");
> +        return -1;
> +    }
> +
> +    xen_fmem = xenforeignmemory_open(0, 0);
> +    if (xen_fmem == NULL) {
> +        perror("xen: can't open xen fmem interface\n");
> +        xc_interface_close(xen_xc);
> +        return -1;
> +    }
> +
> +    xen_register_ioreq(state, max_cpus, xen_memory_listener);
> +
> +    xenstore_record_dm_state(xenstore, "running");
> +
> +    return 0;
> +}
> +
> +static void xen_enable_tpm(void)
> +{
> +/* qemu_find_tpm_be is only available when CONFIG_TPM is enabled. */
> +#ifdef CONFIG_TPM
> +    Error *errp = NULL;
> +    DeviceState *dev;
> +    SysBusDevice *busdev;
> +
> +    TPMBackend *be = qemu_find_tpm_be("tpm0");
> +    if (be == NULL) {
> +        DPRINTF("Couldn't fine the backend for tpm0\n");
> +        return;
> +    }
> +    dev = qdev_new(TYPE_TPM_TIS_SYSBUS);
> +    object_property_set_link(OBJECT(dev), "tpmdev", OBJECT(be), &errp);
> +    object_property_set_str(OBJECT(dev), "tpmdev", be->id, &errp);
> +    busdev = SYS_BUS_DEVICE(dev);
> +    sysbus_realize_and_unref(busdev, &error_fatal);
> +    sysbus_mmio_map(busdev, 0, GUEST_TPM_BASE);

I can't find where GUEST_TPM_BASE is defined. But then the guest memory 
layout is not expected to be stable. With your current approach, it 
means QEMU would need to be rebuilt for every Xen version. Is it what we 
want?

> +
> +    DPRINTF("Connected tpmdev at address 0x%lx\n", GUEST_TPM_BASE);
> +#endif
> +}
> +
> +static void xen_arm_init(MachineState *machine)
> +{
> +    XenArmState *xam = XEN_ARM(machine);
> +
> +    xam->state =  g_new0(XenIOState, 1);
> +
> +    if (xen_init_ioreq(xam->state, machine->smp.cpus)) {
> +        return;

In another patch, you said the IOREQ would be optional. IHMO, I think 
this is a bad idea to register it by default because one may only want 
to use PV drivers. Registering IOREQ will add unnecessary overhead in Xen.

Furthermore, it means that someone selecting TPM but Xen is not built 
with CONFIG_IOREQ=y (BTW This is still a tech preview but there are 
security holes on Arm...) will not get an error. Instead, the OS will 
until it crashes when trying to access the TPM.

Overall I think it would be better if IOREQ is only registered when a 
device requires (like TPM) it *and* throw an error if there is a problem 
during the initialization.

> +    } > +
> +    xen_enable_tpm();
> +
> +    return;
> +}
> +
> +static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
> +{
> +
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +    mc->desc = "Xen Para-virtualized PC";
> +    mc->init = xen_arm_init;
> +    mc->max_cpus = 1;
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);

Shouldn't this be protected with #ifdef CONFIG_TPM?

> +}
> +
> +static const TypeInfo xen_arm_machine_type = {
> +    .name = TYPE_XEN_ARM,
> +    .parent = TYPE_MACHINE,
> +    .class_init = xen_arm_machine_class_init,
> +    .instance_size = sizeof(XenArmState),
> +};
> +
> +static void xen_arm_machine_register_types(void)
> +{
> +    type_register_static(&xen_arm_machine_type);
> +}
> +
> +type_init(xen_arm_machine_register_types)
> diff --git a/include/hw/arm/xen_arch_hvm.h b/include/hw/arm/xen_arch_hvm.h
> new file mode 100644
> index 0000000000..f645dfec28
> --- /dev/null
> +++ b/include/hw/arm/xen_arch_hvm.h
> @@ -0,0 +1,12 @@
> +#ifndef HW_XEN_ARCH_ARM_HVM_H
> +#define HW_XEN_ARCH_ARM_HVM_H
> +
> +#include <xen/hvm/ioreq.h>
> +void arch_handle_ioreq(XenIOState *state, ioreq_t *req);
> +void arch_xen_set_memory(XenIOState *state,
> +                         MemoryRegionSection *section,
> +                         bool add);
> +
> +#undef TARGET_PAGE_SIZE

I am a bit puzzled with this #undef. In the commit message you said that 
there will be no CPU definition. So the implications is this should not 
be defined.

If it is defined, then what guarantees that all the source will use the 
correct value?


> +#define TARGET_PAGE_SIZE 4096

It would be better to use XC_PAGE_SIZE (or similar) rather than 
hardcoding it.

> +#endif
> diff --git a/include/hw/xen/arch_hvm.h b/include/hw/xen/arch_hvm.h
> index 26674648d8..c7c515220d 100644
> --- a/include/hw/xen/arch_hvm.h
> +++ b/include/hw/xen/arch_hvm.h
> @@ -1,3 +1,5 @@
>   #if defined(TARGET_I386) || defined(TARGET_X86_64)
>   #include "hw/i386/xen_arch_hvm.h"
> +#elif defined(TARGET_ARM) || defined(TARGET_ARM_64)
> +#include "hw/arm/xen_arch_hvm.h"
>   #endif

Cheers,

-- 
Julien Grall

