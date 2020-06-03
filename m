Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4550E1ED4B7
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 19:09:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgWt0-0004iH-7c; Wed, 03 Jun 2020 17:09:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CLKU=7Q=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1jgWsy-0004iB-7X
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 17:09:04 +0000
X-Inumbo-ID: ec1d692a-a5bc-11ea-81bc-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id ec1d692a-a5bc-11ea-81bc-bc764e2007e4;
 Wed, 03 Jun 2020 17:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591204142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rS446/KGlPZUtACxgdHjhWpFjUqIoulxEPtmo1bYVf0=;
 b=NFkfD1y/1cjBscvec3lcAChFOdAToCC6gclyRgZKKQq6K2F623VNuW2fSp1l4xw16pI37/
 YyajD2h1RxpnTzwKFWke7jPIPXScXf+OOjzr8WhABgK9a+dcxTZMW61g4ENPt/XV0B7fky
 keFKrp842tIic09fgajZMwbnMuTBSlM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-NY8uc4IjMZuSSMc4ajEDUQ-1; Wed, 03 Jun 2020 13:09:00 -0400
X-MC-Unique: NY8uc4IjMZuSSMc4ajEDUQ-1
Received: by mail-wm1-f69.google.com with SMTP id t145so1105005wmt.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2020 10:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rS446/KGlPZUtACxgdHjhWpFjUqIoulxEPtmo1bYVf0=;
 b=c65Ry72VaXhSG2wMKjY4a780gCZ4+Je9EIji4j3H9ClkxUrjl8TJw0Ncd/lvYMp1Xs
 IkxO4d/yfkfnW0RVzHBXInOIIJce8Y7yxClao7538UXVMi75sCgThXUCqARh/4Jt1jzm
 3Sa6z9tSf0DGEb9gTVeo6yHr1aOQaqNcyG8pNXDmw4y9ywPnZacoJC7PiydPMJvPpPD7
 HJNXxZcf2bn13vaSoac9f1Q77Zy10dUOS4n8wA5o9aHHffwVRWDi9PerAH2T2GHmXIL6
 m7G9j9TRQHSx/JoSY9gUQxc8DOuqL2DkD5T582ks8Q0OdTexe5DWBNgH1VDVwVTucqmR
 JrtA==
X-Gm-Message-State: AOAM530i2vknsAdW5q2apEatc0TYQOgshocBzBjS5qMSj92Lt2/mOUiC
 t7aGjZlo4plu5KY4CmpfAGSd2IIyMBuflMftbBx9iP9VGi0i0Jxg8hqZn2ypm1tHCLZaGL5Hh3q
 a3qXwFrBtc29VUFQ6Vn8IGTLBXks=
X-Received: by 2002:a1c:a74f:: with SMTP id q76mr154438wme.65.1591204138900;
 Wed, 03 Jun 2020 10:08:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwkCPAEMXCpG0Na33VwxpLRawCgnRsNwVIi22brbtvYEWZ1vj1f5fkIdqzSEPamlLCfBJurw==
X-Received: by 2002:a1c:a74f:: with SMTP id q76mr154409wme.65.1591204138545;
 Wed, 03 Jun 2020 10:08:58 -0700 (PDT)
Received: from [192.168.178.58] ([151.20.243.176])
 by smtp.gmail.com with ESMTPSA id j5sm4281911wrm.57.2020.06.03.10.08.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2020 10:08:57 -0700 (PDT)
Subject: Re: [PATCH v3] xen: fix build without pci passthrough
To: Anthony PERARD <anthony.perard@citrix.com>, qemu-devel@nongnu.org
References: <20200603160442.3151170-1-anthony.perard@citrix.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8bf5371c-713a-c9f4-fffb-4a2ddc50dd1b@redhat.com>
Date: Wed, 3 Jun 2020 19:08:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200603160442.3151170-1-anthony.perard@citrix.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paul Durrant <paul@xen.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03/06/20 18:04, Anthony PERARD wrote:
> From: Roger Pau Monne <roger.pau@citrix.com>
> 
> Xen PCI passthrough support may not be available and thus the global
> variable "has_igd_gfx_passthru" might be compiled out. Common code
> should not access it in that case.
> 
> Unfortunately, we can't use CONFIG_XEN_PCI_PASSTHROUGH directly in
> xen-common.c so this patch instead move access to the
> has_igd_gfx_passthru variable via function and those functions are
> also implemented as stubs. The stubs will be used when QEMU is built
> without passthrough support.
> 
> Now, when one will want to enable igd-passthru via the -machine
> property, they will get an error message if QEMU is built without
> passthrough support.
> 
> Fixes: 46472d82322d0 ('xen: convert "-machine igd-passthru" to an accelerator property')
> Reported-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> 
> Notes:
>     Changes in v3:
>     - reworked to use stubs instead of #ifdef CONFIG_XEN_PCI_PASSTHROUGH
>       CONFIG_XEN_PCI_PASSTHROUGH isn't available in xen-common.c
>     
>       moving CONFIG_XEN_PCI_PASSTHROUGH to be in config_host_mak isn't
>       really possible, or at least I didn't managed to make that work.
> 
>  hw/i386/pc_piix.c   |  2 +-
>  hw/xen/xen-common.c |  4 ++--
>  hw/xen/xen_pt.c     | 12 +++++++++++-
>  hw/xen/xen_pt.h     |  6 ++++--
>  stubs/Makefile.objs |  1 +
>  stubs/xen-pt.c      | 22 ++++++++++++++++++++++
>  6 files changed, 41 insertions(+), 6 deletions(-)
>  create mode 100644 stubs/xen-pt.c
> 
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index f66e1d73ce0b..347fb8c6c807 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -375,7 +375,7 @@ static void pc_init_isa(MachineState *machine)
>  #ifdef CONFIG_XEN
>  static void pc_xen_hvm_init_pci(MachineState *machine)
>  {
> -    const char *pci_type = has_igd_gfx_passthru ?
> +    const char *pci_type = xen_igd_gfx_pt_enabled() ?
>                  TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE : TYPE_I440FX_PCI_DEVICE;
>  
>      pc_init1(machine,
> diff --git a/hw/xen/xen-common.c b/hw/xen/xen-common.c
> index 70564cc952d5..dd2c22cc4c0b 100644
> --- a/hw/xen/xen-common.c
> +++ b/hw/xen/xen-common.c
> @@ -129,12 +129,12 @@ static void xen_change_state_handler(void *opaque, int running,
>  
>  static bool xen_get_igd_gfx_passthru(Object *obj, Error **errp)
>  {
> -    return has_igd_gfx_passthru;
> +    return xen_igd_gfx_pt_enabled();
>  }
>  
>  static void xen_set_igd_gfx_passthru(Object *obj, bool value, Error **errp)
>  {
> -    has_igd_gfx_passthru = value;
> +    xen_igd_gfx_pt_set(value, errp);
>  }
>  
>  static void xen_setup_post(MachineState *ms, AccelState *accel)
> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
> index 81d5ad8da7f0..ab84443d5ec8 100644
> --- a/hw/xen/xen_pt.c
> +++ b/hw/xen/xen_pt.c
> @@ -65,7 +65,17 @@
>  #include "qemu/range.h"
>  #include "exec/address-spaces.h"
>  
> -bool has_igd_gfx_passthru;
> +static bool has_igd_gfx_passthru;
> +
> +bool xen_igd_gfx_pt_enabled(void)
> +{
> +    return has_igd_gfx_passthru;
> +}
> +
> +void xen_igd_gfx_pt_set(bool value, Error **errp)
> +{
> +    has_igd_gfx_passthru = value;
> +}
>  
>  #define XEN_PT_NR_IRQS (256)
>  static uint8_t xen_pt_mapped_machine_irq[XEN_PT_NR_IRQS] = {0};
> diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
> index 179775db7b22..6e9cec95f3b7 100644
> --- a/hw/xen/xen_pt.h
> +++ b/hw/xen/xen_pt.h
> @@ -5,6 +5,9 @@
>  #include "hw/pci/pci.h"
>  #include "xen-host-pci-device.h"
>  
> +bool xen_igd_gfx_pt_enabled(void);
> +void xen_igd_gfx_pt_set(bool value, Error **errp);
> +
>  void xen_pt_log(const PCIDevice *d, const char *f, ...) GCC_FMT_ATTR(2, 3);
>  
>  #define XEN_PT_ERR(d, _f, _a...) xen_pt_log(d, "%s: Error: "_f, __func__, ##_a)
> @@ -322,10 +325,9 @@ extern void *pci_assign_dev_load_option_rom(PCIDevice *dev,
>                                              unsigned int domain,
>                                              unsigned int bus, unsigned int slot,
>                                              unsigned int function);
> -extern bool has_igd_gfx_passthru;
>  static inline bool is_igd_vga_passthrough(XenHostPCIDevice *dev)
>  {
> -    return (has_igd_gfx_passthru
> +    return (xen_igd_gfx_pt_enabled()
>              && ((dev->class_code >> 0x8) == PCI_CLASS_DISPLAY_VGA));
>  }
>  int xen_pt_register_vga_regions(XenHostPCIDevice *dev);
> diff --git a/stubs/Makefile.objs b/stubs/Makefile.objs
> index 6a9e3135e8f9..564527e00997 100644
> --- a/stubs/Makefile.objs
> +++ b/stubs/Makefile.objs
> @@ -40,6 +40,7 @@ stub-obj-y += target-get-monitor-def.o
>  stub-obj-y += vmgenid.o
>  stub-obj-y += xen-common.o
>  stub-obj-y += xen-hvm.o
> +stub-obj-y += xen-pt.o
>  stub-obj-y += pci-host-piix.o
>  stub-obj-y += ram-block.o
>  stub-obj-y += ramfb.o
> diff --git a/stubs/xen-pt.c b/stubs/xen-pt.c
> new file mode 100644
> index 000000000000..2d8cac8d54b9
> --- /dev/null
> +++ b/stubs/xen-pt.c
> @@ -0,0 +1,22 @@
> +/*
> + * Copyright (C) 2020       Citrix Systems UK Ltd.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/xen/xen_pt.h"
> +#include "qapi/error.h"
> +
> +bool xen_igd_gfx_pt_enabled(void)
> +{
> +    return false;
> +}
> +
> +void xen_igd_gfx_pt_set(bool value, Error **errp)
> +{
> +    if (value) {
> +        error_setg(errp, "Xen PCI passthrough support not built in");
> +    }
> +}
> 
Queued, thanks (I have other conflicting patches in the queue).

Paolo


