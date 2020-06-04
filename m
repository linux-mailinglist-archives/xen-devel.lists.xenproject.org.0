Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5DC1EE880
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 18:23:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgseC-0002Vl-Ez; Thu, 04 Jun 2020 16:23:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gPub=7R=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1jgseB-0002Vg-AK
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 16:23:15 +0000
X-Inumbo-ID: b060eee8-a67f-11ea-aeba-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b060eee8-a67f-11ea-aeba-12813bfff9fa;
 Thu, 04 Jun 2020 16:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591287793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B9O2XRCyHbxIKDpgPXguyD8DdCt9q+W4Q9datrk8x4s=;
 b=ItApGjCZH0NMikyQeVk5tCc3wuXuo4QXBNvsyGVc16gRrax8ByWAo3hH+x+uVm93EfH254
 2cwv0ZRACG8tylIwwAKlc0B04J5fz884Jh2AT8+dbOjzDna1K+IJRl1fCNGdpcrE9ww9wg
 heTUoQoDaVFhrM700z4yiXkEypo7B1o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-BMnhRSqjMo279_wER0NzJw-1; Thu, 04 Jun 2020 12:23:11 -0400
X-MC-Unique: BMnhRSqjMo279_wER0NzJw-1
Received: by mail-wr1-f69.google.com with SMTP id s7so2630487wrm.16
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2020 09:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B9O2XRCyHbxIKDpgPXguyD8DdCt9q+W4Q9datrk8x4s=;
 b=UBjY16q8lCdThyRRpZ6KYb8W0lAjfhUvUL28mFi629AgoZyQRdkrhlLXXHOCxLGgXF
 bd5hsUEJ0lU5jZzyhL43Gj8j044TFZ9DDtPQEfUDsLn3GubHe6NLjusqFo5UBOFjBTMu
 Jf5kBrX4ZREMkBCR0TL4KLFlee4H82lwEjp6qOyFNHErXT8SFZtPJxJA+rdTWXI8uUgY
 8B9sOfzyQPzoQgyqqzHWy2Nz751PgpHLyjYJmS40eJPbZQ2FkIiMdvgQMcz/kCJIUex2
 l9UyvIqh+Qpw9RsYFprZAU8zfiV/bvPkIEyJ8fbcVIKVb+KOkJczl9ZaA3Y1uI77E8wd
 /cag==
X-Gm-Message-State: AOAM532sHQ4f7faBNVZWdH2NdJJ5uXWfao53j5Gc6hEE/97hdUD/GfxR
 j3sfYChT2mrTUnr+iT1rUl9cXamXhAOFeoHRtlrOn2im2aVwxEWyuEaNbfn2+k8tdXYkzL5vZW7
 2V8m7YLEwjVSz9C3uZUMI8o1QHpw=
X-Received: by 2002:a1c:a906:: with SMTP id s6mr4990769wme.171.1591287790592; 
 Thu, 04 Jun 2020 09:23:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycKqtmToIFUJXoVJkBh8yjxsCrh0nHVi0wwyICMooJNi/z+/a+wLrtUjUmghlHzqr7a90aQA==
X-Received: by 2002:a1c:a906:: with SMTP id s6mr4990745wme.171.1591287790313; 
 Thu, 04 Jun 2020 09:23:10 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:a0c0:5d2e:1d35:17bb?
 ([2001:b07:6468:f312:a0c0:5d2e:1d35:17bb])
 by smtp.gmail.com with ESMTPSA id p1sm8323048wrx.44.2020.06.04.09.23.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2020 09:23:09 -0700 (PDT)
Subject: Re: [PATCH v4] xen: fix build without pci passthrough
To: Anthony PERARD <anthony.perard@citrix.com>, qemu-devel@nongnu.org
References: <159120627656.23398.3742621530752770397@45ef0f9c86ae>
 <20200604133042.3380585-1-anthony.perard@citrix.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b822be29-66ce-fb68-849b-af0a8e1e7174@redhat.com>
Date: Thu, 4 Jun 2020 18:23:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200604133042.3380585-1-anthony.perard@citrix.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04/06/20 15:30, Anthony PERARD wrote:
>     - fix build when Xen headers aren't available.
>       By building stubs/xen-pt.c only when CONFIG_XEN=y
>       (The alternative would be to move the prototypes used by the stub into
>       xen.h, which doesn't depends on xen headers.)

Good catch.  I think we can also drop the whole hw/xen/ directory when
CONFIG_XEN=n, and move stubs/xen-pt.c there.  I'll send a v5 myself.

Paolo

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
> index 6a9e3135e8f9..e0427158132f 100644
> --- a/stubs/Makefile.objs
> +++ b/stubs/Makefile.objs
> @@ -40,6 +40,7 @@ stub-obj-y += target-get-monitor-def.o
>  stub-obj-y += vmgenid.o
>  stub-obj-y += xen-common.o
>  stub-obj-y += xen-hvm.o
> +stub-obj-$(CONFIG_XEN) += xen-pt.o
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


