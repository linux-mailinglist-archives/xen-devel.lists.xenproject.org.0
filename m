Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B394765B60E
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jan 2023 18:48:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470373.729859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCOtr-0005kP-34; Mon, 02 Jan 2023 17:47:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470373.729859; Mon, 02 Jan 2023 17:47:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCOtq-0005iD-VB; Mon, 02 Jan 2023 17:47:02 +0000
Received: by outflank-mailman (input) for mailman id 470373;
 Mon, 02 Jan 2023 17:47:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wEdB=47=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1pCOtp-0005i7-K5
 for xen-devel@lists.xenproject.org; Mon, 02 Jan 2023 17:47:02 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73bfb719-8ac5-11ed-b8d0-410ff93cb8f0;
 Mon, 02 Jan 2023 18:46:58 +0100 (CET)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-563-STQ25Pb-PuC45ur2pQwQaQ-1; Mon, 02 Jan 2023 12:46:55 -0500
Received: by mail-wm1-f71.google.com with SMTP id
 m38-20020a05600c3b2600b003d1fc5f1f80so18795768wms.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jan 2023 09:46:55 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 bo19-20020a056000069300b00294176c2c01sm7280930wrb.86.2023.01.02.09.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 09:46:53 -0800 (PST)
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
X-Inumbo-ID: 73bfb719-8ac5-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672681617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UEwMEVORwGQdUkaE8aygrUja5mjHxP1iCKWj4zKLawg=;
	b=b9j4b2WJh/hMUN9HVjw95rHqJFkAe0A9GUeWljyrD+0F5WyW3F6J9EW67bysgQtCvOy2pa
	wTDqmRAg3UlAzT/JF6j0ovYqoSm7L1ixlauWHEvxVvURagigSkfe+840IQsSwX9uuqhMnX
	c1iMy6PQY/ee9Ie7wuNPu63J7zxM+9I=
X-MC-Unique: STQ25Pb-PuC45ur2pQwQaQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEwMEVORwGQdUkaE8aygrUja5mjHxP1iCKWj4zKLawg=;
        b=rjpjM5M0jhdX60KDfM5Xah0bwGWOPnFmMfXoi7NSA9QdWYyFVHMaAtYypuMFClgqkO
         1OSqBQJm6jReFaY2Z3k7J94GvdX/zsffrNatGLQZlSK23KuR9dOF/4KaEIv6mWM5b6Oa
         vNgnfbzQOw6Cde50miQVcKBLnfydy4K90TxVk5G0gIWV9DIv6d66+YZ0c8SyvJfdFnRv
         IoiRiysEcgeNB25MN4Ru9v6kIZN0jc0l7GnkyHVCrce2d9MLajNKyiq2OSlZlCtKedAI
         CVLFB9Au0tB5nPLpXbOyiFNO7RnjKLXpKxH6ANrfMHFMvvFoa32a/PJ2tudyn2n0TEu6
         C3cA==
X-Gm-Message-State: AFqh2kqHiC4lbRnT0yLN1qFYFFt8/INs4I7DGKbXaApNd9keS+4RthuH
	9Qm8Ee/vqfzi2RaD2Y0HKtFgngxSTnn4UXh4fvP/gXq09XkKK8ysFOJrHyy2Wa1MGARwBh7JFjR
	Bi4xjQBC//nO4a4zbXbG8/P3DOKA=
X-Received: by 2002:adf:9dd1:0:b0:242:165c:95ed with SMTP id q17-20020adf9dd1000000b00242165c95edmr25290017wre.48.1672681614740;
        Mon, 02 Jan 2023 09:46:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt0p5m4ylYbBESCUKrBIMR1ZDEWRey8pWymXQEuhRcdaKS8YrAUzdmCxicDkxYUA8Ea68YynA==
X-Received: by 2002:adf:9dd1:0:b0:242:165c:95ed with SMTP id q17-20020adf9dd1000000b00242165c95edmr25290000wre.48.1672681614461;
        Mon, 02 Jan 2023 09:46:54 -0800 (PST)
Date: Mon, 2 Jan 2023 12:46:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Chuck Zmudzinski <brchuckz@aol.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org, alex.williamson@redhat.com
Subject: Re: [PATCH v6] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Message-ID: <20230102124605-mutt-send-email-mst@kernel.org>
References: <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz.ref@aol.com>
 <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz@aol.com>
MIME-Version: 1.0
In-Reply-To: <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz@aol.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 01, 2023 at 06:52:03PM -0500, Chuck Zmudzinski wrote:
> Intel specifies that the Intel IGD must occupy slot 2 on the PCI bus,
> as noted in docs/igd-assign.txt in the Qemu source code.
> 
> Currently, when the xl toolstack is used to configure a Xen HVM guest with
> Intel IGD passthrough to the guest with the Qemu upstream device model,
> a Qemu emulated PCI device will occupy slot 2 and the Intel IGD will occupy
> a different slot. This problem often prevents the guest from booting.
> 
> The only available workaround is not good: Configure Xen HVM guests to use
> the old and no longer maintained Qemu traditional device model available
> from xenbits.xen.org which does reserve slot 2 for the Intel IGD.
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

I'm not sure why is the issue xen specific. Can you explain?
Doesn't it affect kvm too?

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
>     Sorry for the extra noise.
> 
>  hw/i386/pc_piix.c    |  3 +++
>  hw/xen/xen_pt.c      | 46 +++++++++++++++++++++++++++++++++++---------
>  hw/xen/xen_pt.h      | 16 +++++++++++++++
>  hw/xen/xen_pt_stub.c |  4 ++++
>  4 files changed, 60 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index b48047f50c..bc5efa4f59 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -405,6 +405,9 @@ static void pc_xen_hvm_init(MachineState *machine)
>      }
>  
>      pc_xen_hvm_init_pci(machine);
> +    if (xen_igd_gfx_pt_enabled()) {
> +        xen_igd_reserve_slot(pcms->bus);
> +    }
>      pci_create_simple(pcms->bus, -1, "xen-platform");
>  }
>  #endif
> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
> index 0ec7e52183..7fae1e7a6f 100644
> --- a/hw/xen/xen_pt.c
> +++ b/hw/xen/xen_pt.c
> @@ -780,15 +780,6 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
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
> @@ -950,11 +941,47 @@ static void xen_pci_passthrough_instance_init(Object *obj)
>      PCI_DEVICE(obj)->cap_present |= QEMU_PCI_CAP_EXPRESS;
>  }
>  
> +void xen_igd_reserve_slot(PCIBus *pci_bus)
> +{
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
> +    if (is_igd_vga_passthrough(&s->real_device) &&
> +        s->real_device.domain == 0 && s->real_device.bus == 0 &&
> +        s->real_device.dev == 2 && s->real_device.func == 0 &&
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
> @@ -977,6 +1004,7 @@ static const TypeInfo xen_pci_passthrough_info = {
>      .instance_size = sizeof(XenPCIPassthroughState),
>      .instance_finalize = xen_pci_passthrough_finalize,
>      .class_init = xen_pci_passthrough_class_init,
> +    .class_size = sizeof(XenPTDeviceClass),
>      .instance_init = xen_pci_passthrough_instance_init,
>      .interfaces = (InterfaceInfo[]) {
>          { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
> index e7c4316a7d..40b31b5263 100644
> --- a/hw/xen/xen_pt.h
> +++ b/hw/xen/xen_pt.h
> @@ -3,6 +3,7 @@
>  
>  #include "hw/xen/xen_common.h"
>  #include "hw/pci/pci.h"
> +#include "hw/pci/pci_bus.h"
>  #include "xen-host-pci-device.h"
>  #include "qom/object.h"
>  
> @@ -41,7 +42,20 @@ typedef struct XenPTReg XenPTReg;
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
> @@ -76,6 +90,8 @@ typedef int (*xen_pt_conf_byte_read)
>  
>  #define XEN_PCI_INTEL_OPREGION 0xfc
>  
> +#define XEN_PCI_IGD_SLOT_MASK 0x4UL /* Intel IGD slot_reserved_mask */
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


