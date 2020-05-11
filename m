Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5F91CD392
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 10:15:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jY3aU-00018z-V9; Mon, 11 May 2020 08:14:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AmMB=6Z=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jY3aU-00018u-1E
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 08:14:58 +0000
X-Inumbo-ID: 8002b156-935f-11ea-a1f5-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8002b156-935f-11ea-a1f5-12813bfff9fa;
 Mon, 11 May 2020 08:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589184898;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=UeP7ACtncW/BHcF27i5MYIvueaaUCsS3M5fQzbqtlQg=;
 b=hxKgY0eeeQYkitehVGFIRsfkwEHdGh+fNxhL+ghiMTKfpmGMZrsSZUjL
 73ss9jgtLXtZ/kEjH55k9bFPGX6NwQk2yPMGgnOB9TTW2iydmtfJnNr2Y
 fQl7dGufRz3KnTrUTGgKFSjVmofkHlFnaRr+P2Jd7wuxpVjj/j4ij/PgF 4=;
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: uf4chRphwK/uoRtRN4O4u9d0tVna4inFzaSQNb5d1CRDb6ML6/pR5CzUX+b1g1bcmeNi6iJB1c
 5baNIPhYKnNXPq76JySvTYpGNsTzIOQsMBqUDbwARBgDGGxziT+Y7zzWdGX1sOw1visIsgo7bp
 R01fVZAY0+Eb9/9/55QMKWjUdtnPTEFeLjJeLXNtArLjP49lKne2kZSGyh884b4ab7p7FupsA9
 na1dphxv8wrfboVK+/yJFSLNXKA0XYdTFQkGvJm9WRn69ivchb6rWC/ztbrXaOg67lKHeJyojd
 BNk=
X-SBRS: 2.7
X-MesageID: 17184668
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,379,1583211600"; d="scan'208";a="17184668"
Date: Mon, 11 May 2020 10:14:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <qemu-devel@nongnu.org>
Subject: Re: [PATCH] xen: fix build without pci passthrough
Message-ID: <20200511081449.GO1353@Air-de-Roger>
References: <20200504101443.3165-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200504101443.3165-1-roger.pau@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ping?

On Mon, May 04, 2020 at 12:14:43PM +0200, Roger Pau Monne wrote:
> has_igd_gfx_passthru is only available when QEMU is built with
> CONFIG_XEN_PCI_PASSTHROUGH, and hence shouldn't be used in common
> code without checking if it's available.
> 
> Fixes: 46472d82322d0 ('xen: convert "-machine igd-passthru" to an accelerator property')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org
> ---
>  hw/xen/xen-common.c | 4 ++++
>  hw/xen/xen_pt.h     | 7 +++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/hw/xen/xen-common.c b/hw/xen/xen-common.c
> index a15070f7f6..c800862419 100644
> --- a/hw/xen/xen-common.c
> +++ b/hw/xen/xen-common.c
> @@ -127,6 +127,7 @@ static void xen_change_state_handler(void *opaque, int running,
>      }
>  }
>  
> +#ifdef CONFIG_XEN_PCI_PASSTHROUGH
>  static bool xen_get_igd_gfx_passthru(Object *obj, Error **errp)
>  {
>      return has_igd_gfx_passthru;
> @@ -136,6 +137,7 @@ static void xen_set_igd_gfx_passthru(Object *obj, bool value, Error **errp)
>  {
>      has_igd_gfx_passthru = value;
>  }
> +#endif
>  
>  static void xen_setup_post(MachineState *ms, AccelState *accel)
>  {
> @@ -197,11 +199,13 @@ static void xen_accel_class_init(ObjectClass *oc, void *data)
>  
>      compat_props_add(ac->compat_props, compat, G_N_ELEMENTS(compat));
>  
> +#ifdef CONFIG_XEN_PCI_PASSTHROUGH
>      object_class_property_add_bool(oc, "igd-passthru",
>          xen_get_igd_gfx_passthru, xen_set_igd_gfx_passthru,
>          &error_abort);
>      object_class_property_set_description(oc, "igd-passthru",
>          "Set on/off to enable/disable igd passthrou", &error_abort);
> +#endif
>  }
>  
>  #define TYPE_XEN_ACCEL ACCEL_CLASS_NAME("xen")
> diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
> index 179775db7b..660dd8a008 100644
> --- a/hw/xen/xen_pt.h
> +++ b/hw/xen/xen_pt.h
> @@ -1,6 +1,7 @@
>  #ifndef XEN_PT_H
>  #define XEN_PT_H
>  
> +#include "qemu/osdep.h"
>  #include "hw/xen/xen_common.h"
>  #include "hw/pci/pci.h"
>  #include "xen-host-pci-device.h"
> @@ -322,7 +323,13 @@ extern void *pci_assign_dev_load_option_rom(PCIDevice *dev,
>                                              unsigned int domain,
>                                              unsigned int bus, unsigned int slot,
>                                              unsigned int function);
> +
> +#ifdef CONFIG_XEN_PCI_PASSTHROUGH
>  extern bool has_igd_gfx_passthru;
> +#else
> +# define has_igd_gfx_passthru false
> +#endif
> +
>  static inline bool is_igd_vga_passthrough(XenHostPCIDevice *dev)
>  {
>      return (has_igd_gfx_passthru
> -- 
> 2.26.2
> 

