Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ADF6787C1
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 21:28:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483205.749218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK3QE-0002Ii-45; Mon, 23 Jan 2023 20:28:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483205.749218; Mon, 23 Jan 2023 20:28:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK3QE-0002Gf-1A; Mon, 23 Jan 2023 20:28:06 +0000
Received: by outflank-mailman (input) for mailman id 483205;
 Mon, 23 Jan 2023 20:28:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QMpG=5U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pK3QC-0002GX-1m
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 20:28:04 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6dd05750-9b5c-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 21:28:01 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 810A761029;
 Mon, 23 Jan 2023 20:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 314CEC433D2;
 Mon, 23 Jan 2023 20:27:57 +0000 (UTC)
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
X-Inumbo-ID: 6dd05750-9b5c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674505678;
	bh=pTUgUj0rudWGkaabcAfieQ/Wga7zg1phd06XWWevQoM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=h9/ou6rQLxZs2xz2xXYqaZL8Mntkl4pJr0XJQKOZzCZPIxqThKJ0UYYvZ85/q81t3
	 FWjkk9Ft2XS8XUUtwxKzfiZv2OCmnHmuSa4SIBwJNKV1215HDInSy2ArCAWwNynMKh
	 OnniTykvy8zaApiSjg0cp8Ibdx8yUYj5NdHo3vDsREx9qeH9M9Riie8woOdWt5/m44
	 x0bpREPgLQ0+BfrgQKzg8QEEGeGnHxXbJ7YnDvvL40/SLuHKe0vd9diHXFtwGTzOnk
	 WZitmV1KIW57SDM+qt2WSFKvBv8tw0pOqPz7t3+JPFuHEOrEwEuE4LGGkzXp1hPaUe
	 tRVJwKt8Vd/4Q==
Date: Mon, 23 Jan 2023 12:27:55 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Chuck Zmudzinski <brchuckz@aol.com>
cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    Paolo Bonzini <pbonzini@redhat.com>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Eduardo Habkost <eduardo@habkost.net>, 
    "Michael S. Tsirkin" <mst@redhat.com>, 
    Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
    Igor Mammedov <imammedo@redhat.com>, xen-devel@lists.xenproject.org, 
    qemu-stable@nongnu.org
Subject: Re: [PATCH v11] xen/pt: reserve PCI slot 2 for Intel igd-passthru
In-Reply-To: <b1b4a21fe9a600b1322742dda55a40e9961daa57.1674346505.git.brchuckz@aol.com>
Message-ID: <alpine.DEB.2.22.394.2301231227430.1978264@ubuntu-linux-20-04-desktop>
References: <b1b4a21fe9a600b1322742dda55a40e9961daa57.1674346505.git.brchuckz.ref@aol.com> <b1b4a21fe9a600b1322742dda55a40e9961daa57.1674346505.git.brchuckz@aol.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 21 Jan 2023, Chuck Zmudzinski wrote:
> Intel specifies that the Intel IGD must occupy slot 2 on the PCI bus,
> as noted in docs/igd-assign.txt in the Qemu source code.
> 
> Currently, when the xl toolstack is used to configure a Xen HVM guest with
> Intel IGD passthrough to the guest with the Qemu upstream device model,
> a Qemu emulated PCI device will occupy slot 2 and the Intel IGD will occupy
> a different slot. This problem often prevents the guest from booting.
> 
> The only available workarounds are not good: Configure Xen HVM guests to
> use the old and no longer maintained Qemu traditional device model
> available from xenbits.xen.org which does reserve slot 2 for the Intel
> IGD or use the "pc" machine type instead of the "xenfv" machine type and
> add the xen platform device at slot 3 using a command line option
> instead of patching qemu to fix the "xenfv" machine type directly. The
> second workaround causes some degredation in startup performance such as
> a longer boot time and reduced resolution of the grub menu that is
> displayed on the monitor. This patch avoids that reduced startup
> performance when using the Qemu upstream device model for Xen HVM guests
> configured with the igd-passthru=on option.
> 
> To implement this feature in the Qemu upstream device model for Xen HVM
> guests, introduce the following new functions, types, and macros:
> 
> * XEN_PT_DEVICE_CLASS declaration, based on the existing TYPE_XEN_PT_DEVICE
> * XEN_PT_DEVICE_GET_CLASS macro helper function for XEN_PT_DEVICE_CLASS
> * typedef XenPTQdevRealize function pointer
> * XEN_PCI_IGD_SLOT_MASK, the value of slot_reserved_mask to reserve slot 2
> * xen_igd_reserve_slot and xen_igd_clear_slot functions
> 
> Michael Tsirkin:
> * Introduce XEN_PCI_IGD_DOMAIN, XEN_PCI_IGD_BUS, XEN_PCI_IGD_DEV, and
>   XEN_PCI_IGD_FN - use them to compute the value of XEN_PCI_IGD_SLOT_MASK
> 
> The new xen_igd_reserve_slot function uses the existing slot_reserved_mask
> member of PCIBus to reserve PCI slot 2 for Xen HVM guests configured using
> the xl toolstack with the gfx_passthru option enabled, which sets the
> igd-passthru=on option to Qemu for the Xen HVM machine type.
> 
> The new xen_igd_reserve_slot function also needs to be implemented in
> hw/xen/xen_pt_stub.c to prevent FTBFS during the link stage for the case
> when Qemu is configured with --enable-xen and --disable-xen-pci-passthrough,
> in which case it does nothing.
> 
> The new xen_igd_clear_slot function overrides qdev->realize of the parent
> PCI device class to enable the Intel IGD to occupy slot 2 on the PCI bus
> since slot 2 was reserved by xen_igd_reserve_slot when the PCI bus was
> created in hw/i386/pc_piix.c for the case when igd-passthru=on.
> 
> Move the call to xen_host_pci_device_get, and the associated error
> handling, from xen_pt_realize to the new xen_igd_clear_slot function to
> initialize the device class and vendor values which enables the checks for
> the Intel IGD to succeed. The verification that the host device is an
> Intel IGD to be passed through is done by checking the domain, bus, slot,
> and function values as well as by checking that gfx_passthru is enabled,
> the device class is VGA, and the device vendor in Intel.
> 
> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
> ---
> Notes that might be helpful to reviewers of patched code in hw/xen:
> 
> The new functions and types are based on recommendations from Qemu docs:
> https://qemu.readthedocs.io/en/latest/devel/qom.html
> 
> Notes that might be helpful to reviewers of patched code in hw/i386:
> 
> The small patch to hw/i386/pc_piix.c is protected by CONFIG_XEN so it does
> not affect builds that do not have CONFIG_XEN defined.
> 
> xen_igd_gfx_pt_enabled() in the patched hw/i386/pc_piix.c file is an
> existing function that is only true when Qemu is built with
> xen-pci-passthrough enabled and the administrator has configured the Xen
> HVM guest with Qemu's igd-passthru=on option.
> 
> v2: Remove From: <email address> tag at top of commit message
> 
> v3: Changed the test for the Intel IGD in xen_igd_clear_slot:
> 
>     if (is_igd_vga_passthrough(&s->real_device) &&
>         (s->real_device.vendor_id == PCI_VENDOR_ID_INTEL)) {
> 
>     is changed to
> 
>     if (xen_igd_gfx_pt_enabled() && (s->hostaddr.slot == 2)
>         && (s->hostaddr.function == 0)) {
> 
>     I hoped that I could use the test in v2, since it matches the
>     other tests for the Intel IGD in Qemu and Xen, but those tests
>     do not work because the necessary data structures are not set with
>     their values yet. So instead use the test that the administrator
>     has enabled gfx_passthru and the device address on the host is
>     02.0. This test does detect the Intel IGD correctly.
> 
> v4: Use brchuckz@aol.com instead of brchuckz@netscape.net for the author's
>     email address to match the address used by the same author in commits
>     be9c61da and c0e86b76
>     
>     Change variable for XEN_PT_DEVICE_CLASS: xptc changed to xpdc
> 
> v5: The patch of xen_pt.c was re-worked to allow a more consistent test
>     for the Intel IGD that uses the same criteria as in other places.
>     This involved moving the call to xen_host_pci_device_get from
>     xen_pt_realize to xen_igd_clear_slot and updating the checks for the
>     Intel IGD in xen_igd_clear_slot:
>     
>     if (xen_igd_gfx_pt_enabled() && (s->hostaddr.slot == 2)
>         && (s->hostaddr.function == 0)) {
> 
>     is changed to
> 
>     if (is_igd_vga_passthrough(&s->real_device) &&
>         s->real_device.domain == 0 && s->real_device.bus == 0 &&
>         s->real_device.dev == 2 && s->real_device.func == 0 &&
>         s->real_device.vendor_id == PCI_VENDOR_ID_INTEL) {
> 
>     Added an explanation for the move of xen_host_pci_device_get from
>     xen_pt_realize to xen_igd_clear_slot to the commit message.
> 
>     Rebase.
> 
> v6: Fix logging by removing these lines from the move from xen_pt_realize
>     to xen_igd_clear_slot that was done in v5:
> 
>     XEN_PT_LOG(d, "Assigning real physical device %02x:%02x.%d"
>                " to devfn 0x%x\n",
>                s->hostaddr.bus, s->hostaddr.slot, s->hostaddr.function,
>                s->dev.devfn);
> 
>     This log needs to be in xen_pt_realize because s->dev.devfn is not
>     set yet in xen_igd_clear_slot.
> 
> v7: The v7 that was posted to the mailing list was incorrect. v8 is what
>     v7 was intended to be.
> 
> v8: Inhibit out of context log message and needless processing by
>     adding 2 lines at the top of the new xen_igd_clear_slot function:
> 
>     if (!(pci_bus->slot_reserved_mask & XEN_PCI_IGD_SLOT_MASK))
>         return;
> 
>     Rebase. This removed an unnecessary header file from xen_pt.h 
> 
> v9: Move check for xen_igd_gfx_pt_enabled() from pc_piix.c to xen_pt.c
> 
>     Move #include "hw/pci/pci_bus.h" from xen_pt.h to xen_pt.c
> 
>     Introduce macros for the IGD devfn constants and use them to compute
>     the value of XEN_PCI_IGD_SLOT_MASK
> 
>     Also use the new macros at an appropriate place in xen_pt_realize
> 
>     Add Cc: to stable - This has been broken for a long time, ever since
>                         support for igd-passthru was added to Qemu 7
>                         years ago.
> 
>     Mention new macros in the commit message (Michael Tsirkin)
> 
>     N.B.: I could not follow the suggestion to move the statement
>     pci_bus->slot_reserved_mask &= ~XEN_PCI_IGD_SLOT_MASK; to after
>     pci_qdev_realize for symmetry. Doing that results in an error when
>     creating the guest:
>     
>     libxl: error: libxl_qmp.c:1837:qmp_ev_parse_error_messages: Domain 4:PCI: slot 2 function 0 not available for xen-pci-passthrough, reserved
>     libxl: error: libxl_pci.c:1809:device_pci_add_done: Domain 4:libxl__device_pci_add failed for PCI device 0:0:2.0 (rc -28)
>     libxl: error: libxl_create.c:1921:domcreate_attach_devices: Domain 4:unable to add pci devices
> 
> v10: Change in xen_pt.c at xen_igd_clear_slot from
> 
>     if (!(pci_bus->slot_reserved_mask & XEN_PCI_IGD_SLOT_MASK))
>         return;
> 
>     xen_host_pci_device_get(&s->real_device,
>                             s->hostaddr.domain, s->hostaddr.bus,
>                             s->hostaddr.slot, s->hostaddr.function,
>                             errp);
>     if (*errp) {
>         error_append_hint(errp, "Failed to \"open\" the real pci device");
>         return;
>     }
> 
> to:
> 
>     xen_host_pci_device_get(&s->real_device,
>                             s->hostaddr.domain, s->hostaddr.bus,
>                             s->hostaddr.slot, s->hostaddr.function,
>                             errp);
>     if (*errp) {
>         error_append_hint(errp, "Failed to \"open\" the real pci device");
>         return;
>     }
> 
>     if (!(pci_bus->slot_reserved_mask & XEN_PCI_IGD_SLOT_MASK)) {
>         xpdc->pci_qdev_realize(qdev, errp);
>         return;
>     }
> 
>      Testing shows this fixes the problem of xen_host_pci_device_get
>      and xpdc->pci_qdev_realize not being called if xen_igd_clear_slot
>      returns because the bit to reserve slot 2 in slot_reserved_mask is
>      not set. Without this change, guest creation fails in the cases
>      when the bit to reserve slot 2 in slot_reserved_mask is not set.
>      Thanks, Stefano!
>      
>      Also, in addition to mentioning the workaround of using the
>      traditional qemu device model available from xenbits.xen.org in the
>      commit message, also mention in the commit message the workaround
>      of using the "pc" machine type instead of the "xenfv" machine type,
>      which results in reduced startup performance.
>      
>      Rebase.
>      
>      Add Igor Mammedov <imammedo@redhat.com> to Cc.
> 
> v11: I noticed a style mistake that has been present in the past few
>      versions that no one noticed. This version fixes it. No
>      functional change in v11. I also did more tests on different guests
>      such as guests that don't have igd-passthru=on set. No regressions
>      were observed.
>      
>      The style mistake (missing braces) is fixed as follows:
> 
> xen_pt.c at xen_igd_reserve_slot is changed from
> 
>     if (!xen_igd_gfx_pt_enabled())
>         return;
> 
> to
> 
>     if (!xen_igd_gfx_pt_enabled()) {
>         return;
>     }
> 
>  hw/i386/pc_piix.c    |  1 +
>  hw/xen/xen_pt.c      | 64 ++++++++++++++++++++++++++++++++++++--------
>  hw/xen/xen_pt.h      | 20 ++++++++++++++
>  hw/xen/xen_pt_stub.c |  4 +++
>  4 files changed, 78 insertions(+), 11 deletions(-)

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index df64dd8dcc..a9d535c815 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -421,6 +421,7 @@ static void pc_xen_hvm_init(MachineState *machine)
>      }
>  
>      pc_xen_hvm_init_pci(machine);
> +    xen_igd_reserve_slot(pcms->bus);
>      pci_create_simple(pcms->bus, -1, "xen-platform");
>  }
>  #endif
> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
> index 8db0532632..85c93cffcf 100644
> --- a/hw/xen/xen_pt.c
> +++ b/hw/xen/xen_pt.c
> @@ -57,6 +57,7 @@
>  #include <sys/ioctl.h>
>  
>  #include "hw/pci/pci.h"
> +#include "hw/pci/pci_bus.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/qdev-properties-system.h"
>  #include "hw/xen/xen.h"
> @@ -780,15 +781,6 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
>                 s->hostaddr.bus, s->hostaddr.slot, s->hostaddr.function,
>                 s->dev.devfn);
>  
> -    xen_host_pci_device_get(&s->real_device,
> -                            s->hostaddr.domain, s->hostaddr.bus,
> -                            s->hostaddr.slot, s->hostaddr.function,
> -                            errp);
> -    if (*errp) {
> -        error_append_hint(errp, "Failed to \"open\" the real pci device");
> -        return;
> -    }
> -
>      s->is_virtfn = s->real_device.is_virtfn;
>      if (s->is_virtfn) {
>          XEN_PT_LOG(d, "%04x:%02x:%02x.%d is a SR-IOV Virtual Function\n",
> @@ -803,8 +795,10 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
>      s->io_listener = xen_pt_io_listener;
>  
>      /* Setup VGA bios for passthrough GFX */
> -    if ((s->real_device.domain == 0) && (s->real_device.bus == 0) &&
> -        (s->real_device.dev == 2) && (s->real_device.func == 0)) {
> +    if ((s->real_device.domain == XEN_PCI_IGD_DOMAIN) &&
> +        (s->real_device.bus == XEN_PCI_IGD_BUS) &&
> +        (s->real_device.dev == XEN_PCI_IGD_DEV) &&
> +        (s->real_device.func == XEN_PCI_IGD_FN)) {
>          if (!is_igd_vga_passthrough(&s->real_device)) {
>              error_setg(errp, "Need to enable igd-passthru if you're trying"
>                      " to passthrough IGD GFX");
> @@ -950,11 +944,58 @@ static void xen_pci_passthrough_instance_init(Object *obj)
>      PCI_DEVICE(obj)->cap_present |= QEMU_PCI_CAP_EXPRESS;
>  }
>  
> +void xen_igd_reserve_slot(PCIBus *pci_bus)
> +{
> +    if (!xen_igd_gfx_pt_enabled()) {
> +        return;
> +    }
> +
> +    XEN_PT_LOG(0, "Reserving PCI slot 2 for IGD\n");
> +    pci_bus->slot_reserved_mask |= XEN_PCI_IGD_SLOT_MASK;
> +}
> +
> +static void xen_igd_clear_slot(DeviceState *qdev, Error **errp)
> +{
> +    ERRP_GUARD();
> +    PCIDevice *pci_dev = (PCIDevice *)qdev;
> +    XenPCIPassthroughState *s = XEN_PT_DEVICE(pci_dev);
> +    XenPTDeviceClass *xpdc = XEN_PT_DEVICE_GET_CLASS(s);
> +    PCIBus *pci_bus = pci_get_bus(pci_dev);
> +
> +    xen_host_pci_device_get(&s->real_device,
> +                            s->hostaddr.domain, s->hostaddr.bus,
> +                            s->hostaddr.slot, s->hostaddr.function,
> +                            errp);
> +    if (*errp) {
> +        error_append_hint(errp, "Failed to \"open\" the real pci device");
> +        return;
> +    }
> +
> +    if (!(pci_bus->slot_reserved_mask & XEN_PCI_IGD_SLOT_MASK)) {
> +        xpdc->pci_qdev_realize(qdev, errp);
> +        return;
> +    }
> +
> +    if (is_igd_vga_passthrough(&s->real_device) &&
> +        s->real_device.domain == XEN_PCI_IGD_DOMAIN &&
> +        s->real_device.bus == XEN_PCI_IGD_BUS &&
> +        s->real_device.dev == XEN_PCI_IGD_DEV &&
> +        s->real_device.func == XEN_PCI_IGD_FN &&
> +        s->real_device.vendor_id == PCI_VENDOR_ID_INTEL) {
> +        pci_bus->slot_reserved_mask &= ~XEN_PCI_IGD_SLOT_MASK;
> +        XEN_PT_LOG(pci_dev, "Intel IGD found, using slot 2\n");
> +    }
> +    xpdc->pci_qdev_realize(qdev, errp);
> +}
> +
>  static void xen_pci_passthrough_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>  
> +    XenPTDeviceClass *xpdc = XEN_PT_DEVICE_CLASS(klass);
> +    xpdc->pci_qdev_realize = dc->realize;
> +    dc->realize = xen_igd_clear_slot;
>      k->realize = xen_pt_realize;
>      k->exit = xen_pt_unregister_device;
>      k->config_read = xen_pt_pci_read_config;
> @@ -977,6 +1018,7 @@ static const TypeInfo xen_pci_passthrough_info = {
>      .instance_size = sizeof(XenPCIPassthroughState),
>      .instance_finalize = xen_pci_passthrough_finalize,
>      .class_init = xen_pci_passthrough_class_init,
> +    .class_size = sizeof(XenPTDeviceClass),
>      .instance_init = xen_pci_passthrough_instance_init,
>      .interfaces = (InterfaceInfo[]) {
>          { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
> index cf10fc7bbf..e184699740 100644
> --- a/hw/xen/xen_pt.h
> +++ b/hw/xen/xen_pt.h
> @@ -40,7 +40,20 @@ typedef struct XenPTReg XenPTReg;
>  #define TYPE_XEN_PT_DEVICE "xen-pci-passthrough"
>  OBJECT_DECLARE_SIMPLE_TYPE(XenPCIPassthroughState, XEN_PT_DEVICE)
>  
> +#define XEN_PT_DEVICE_CLASS(klass) \
> +    OBJECT_CLASS_CHECK(XenPTDeviceClass, klass, TYPE_XEN_PT_DEVICE)
> +#define XEN_PT_DEVICE_GET_CLASS(obj) \
> +    OBJECT_GET_CLASS(XenPTDeviceClass, obj, TYPE_XEN_PT_DEVICE)
> +
> +typedef void (*XenPTQdevRealize)(DeviceState *qdev, Error **errp);
> +
> +typedef struct XenPTDeviceClass {
> +    PCIDeviceClass parent_class;
> +    XenPTQdevRealize pci_qdev_realize;
> +} XenPTDeviceClass;
> +
>  uint32_t igd_read_opregion(XenPCIPassthroughState *s);
> +void xen_igd_reserve_slot(PCIBus *pci_bus);
>  void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val);
>  void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
>                                             XenHostPCIDevice *dev);
> @@ -75,6 +88,13 @@ typedef int (*xen_pt_conf_byte_read)
>  
>  #define XEN_PCI_INTEL_OPREGION 0xfc
>  
> +#define XEN_PCI_IGD_DOMAIN 0
> +#define XEN_PCI_IGD_BUS 0
> +#define XEN_PCI_IGD_DEV 2
> +#define XEN_PCI_IGD_FN 0
> +#define XEN_PCI_IGD_SLOT_MASK \
> +    (1UL << PCI_SLOT(PCI_DEVFN(XEN_PCI_IGD_DEV, XEN_PCI_IGD_FN)))
> +
>  typedef enum {
>      XEN_PT_GRP_TYPE_HARDWIRED = 0,  /* 0 Hardwired reg group */
>      XEN_PT_GRP_TYPE_EMU,            /* emul reg group */
> diff --git a/hw/xen/xen_pt_stub.c b/hw/xen/xen_pt_stub.c
> index 2d8cac8d54..5c108446a8 100644
> --- a/hw/xen/xen_pt_stub.c
> +++ b/hw/xen/xen_pt_stub.c
> @@ -20,3 +20,7 @@ void xen_igd_gfx_pt_set(bool value, Error **errp)
>          error_setg(errp, "Xen PCI passthrough support not built in");
>      }
>  }
> +
> +void xen_igd_reserve_slot(PCIBus *pci_bus)
> +{
> +}
> -- 
> 2.39.0
> 

