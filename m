Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFC41C3703
	for <lists+xen-devel@lfdr.de>; Mon,  4 May 2020 12:36:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVYRx-00052p-MC; Mon, 04 May 2020 10:35:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1i/5=6S=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jVYRv-00052j-Tu
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 10:35:48 +0000
X-Inumbo-ID: 03ac53c7-8df3-11ea-9d10-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 03ac53c7-8df3-11ea-9d10-12813bfff9fa;
 Mon, 04 May 2020 10:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588588547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p7qjpECM+aCBLbyZzL1R9qYhC5J3RWAlBF99gihbx48=;
 b=HIFaBJLu8wmQmemuVUG5SSd2g+Ojrp1HVErTdpFwcQOh6q/0qaaHEWsxelklCf78l/fjiu
 kUy3jXaJMkIydyN8zRTU6IWtNcTlh8oWzUBIbykRP8/LxxHwIArH/sfq1M8wBhY+I+hGrf
 kbkh65CvQpZCkkgp6lOKwj1vPXj3Nnc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-0aJGlC4TOKa8VYfm0kvVpw-1; Mon, 04 May 2020 06:35:42 -0400
X-MC-Unique: 0aJGlC4TOKa8VYfm0kvVpw-1
Received: by mail-wm1-f72.google.com with SMTP id 71so3269765wmb.8
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2020 03:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=65qtTvM5Bdj416dEt86Eaggl2O6nVd/jv4X1UlNrfBg=;
 b=Np2PtVw2rwXJJpDJVuSiGjeJZvrFpW66W0KNUnA1puXKcUltg7Q1I5BQ2DnC5qJ+KB
 MlCA+bLg4eLL1sO8ak/GRIjtcF0HHvDtb4pAnv3/hPcMykkx7MzxZ9JaMwFlZm1s8Ojf
 ZEdkeFTymewMsgt2gFRGxyfBAw5WJUtzL2yXyBT0RJmn5CuXNMTfrQpUln129h87l8YQ
 BqjNGN29TYZ1CYXPj4Cs/kocK6iLVG9A0WVl8F3wWIH9+uwHIw/pf2/KEahbPBNiq1XA
 EJFPMkfknVND7dSa1f3+xn/bqosAcl88W0w4zphsTQoNxif4DDwkTtWp25/pw3CKCTe4
 bjKA==
X-Gm-Message-State: AGi0PuYIVFGx4Amm6ODGrnq5N/de2Vrbo/3CMMx0jHHP/j8Je8XRQq0T
 tyF21eqCI9EU0psx7T9dZAHzaR0gtn5daougZ1RPOdLm5TZIkwmskDSztBo2hme5bu1nlxgqdhG
 /wl4kG29jLSARS1ezhlfVv4+4r8E=
X-Received: by 2002:a5d:66c5:: with SMTP id k5mr9244267wrw.17.1588588541487;
 Mon, 04 May 2020 03:35:41 -0700 (PDT)
X-Google-Smtp-Source: APiQypKyJu1SMZNPQhE0tcEAXzN/rWndTUAqQVqX8t6qJaWFe5I/Z+N5VZ1io0MxIvHn6HTRdzqEog==
X-Received: by 2002:a5d:66c5:: with SMTP id k5mr9244239wrw.17.1588588541200;
 Mon, 04 May 2020 03:35:41 -0700 (PDT)
Received: from [192.168.1.39] (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id l19sm13335878wmj.14.2020.05.04.03.35.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2020 03:35:40 -0700 (PDT)
Subject: Re: [PATCH] xen: fix build without pci passthrough
To: Roger Pau Monne <roger.pau@citrix.com>, qemu-devel@nongnu.org
References: <20200504101443.3165-1-roger.pau@citrix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ccf11b67-4aaa-5fb2-e23f-674380b47a13@redhat.com>
Date: Mon, 4 May 2020 12:35:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200504101443.3165-1-roger.pau@citrix.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
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

Hi Roger,

On 5/4/20 12:14 PM, Roger Pau Monne wrote:
> has_igd_gfx_passthru is only available when QEMU is built with
> CONFIG_XEN_PCI_PASSTHROUGH, and hence shouldn't be used in common
> code without checking if it's available.
>=20
> Fixes: 46472d82322d0 ('xen: convert "-machine igd-passthru" to an acceler=
ator property')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

See Kconfig fix suggested here:
https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg61844.html

> ---
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org
> ---
>   hw/xen/xen-common.c | 4 ++++
>   hw/xen/xen_pt.h     | 7 +++++++
>   2 files changed, 11 insertions(+)
>=20
> diff --git a/hw/xen/xen-common.c b/hw/xen/xen-common.c
> index a15070f7f6..c800862419 100644
> --- a/hw/xen/xen-common.c
> +++ b/hw/xen/xen-common.c
> @@ -127,6 +127,7 @@ static void xen_change_state_handler(void *opaque, in=
t running,
>       }
>   }
>  =20
> +#ifdef CONFIG_XEN_PCI_PASSTHROUGH
>   static bool xen_get_igd_gfx_passthru(Object *obj, Error **errp)
>   {
>       return has_igd_gfx_passthru;
> @@ -136,6 +137,7 @@ static void xen_set_igd_gfx_passthru(Object *obj, boo=
l value, Error **errp)
>   {
>       has_igd_gfx_passthru =3D value;
>   }
> +#endif
>  =20
>   static void xen_setup_post(MachineState *ms, AccelState *accel)
>   {
> @@ -197,11 +199,13 @@ static void xen_accel_class_init(ObjectClass *oc, v=
oid *data)
>  =20
>       compat_props_add(ac->compat_props, compat, G_N_ELEMENTS(compat));
>  =20
> +#ifdef CONFIG_XEN_PCI_PASSTHROUGH
>       object_class_property_add_bool(oc, "igd-passthru",
>           xen_get_igd_gfx_passthru, xen_set_igd_gfx_passthru,
>           &error_abort);
>       object_class_property_set_description(oc, "igd-passthru",
>           "Set on/off to enable/disable igd passthrou", &error_abort);
> +#endif
>   }
>  =20
>   #define TYPE_XEN_ACCEL ACCEL_CLASS_NAME("xen")
> diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
> index 179775db7b..660dd8a008 100644
> --- a/hw/xen/xen_pt.h
> +++ b/hw/xen/xen_pt.h
> @@ -1,6 +1,7 @@
>   #ifndef XEN_PT_H
>   #define XEN_PT_H
>  =20
> +#include "qemu/osdep.h"
>   #include "hw/xen/xen_common.h"
>   #include "hw/pci/pci.h"
>   #include "xen-host-pci-device.h"
> @@ -322,7 +323,13 @@ extern void *pci_assign_dev_load_option_rom(PCIDevic=
e *dev,
>                                               unsigned int domain,
>                                               unsigned int bus, unsigned =
int slot,
>                                               unsigned int function);
> +
> +#ifdef CONFIG_XEN_PCI_PASSTHROUGH
>   extern bool has_igd_gfx_passthru;
> +#else
> +# define has_igd_gfx_passthru false
> +#endif
> +
>   static inline bool is_igd_vga_passthrough(XenHostPCIDevice *dev)
>   {
>       return (has_igd_gfx_passthru
>=20


