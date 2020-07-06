Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B513F215D80
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 19:56:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsVKh-0002LU-D6; Mon, 06 Jul 2020 17:55:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiqY=AR=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1jsVKf-0002LO-Ax
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 17:55:09 +0000
X-Inumbo-ID: d4879182-bfb1-11ea-8496-bc764e2007e4
Received: from mail-il1-x142.google.com (unknown [2607:f8b0:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d4879182-bfb1-11ea-8496-bc764e2007e4;
 Mon, 06 Jul 2020 17:55:08 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id t4so20519178iln.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2020 10:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZmQuG2AsZpbcelM7uL4uy958NUT2KgddZYhFWXtMNSA=;
 b=sw3EFcVvNcwfVu/7C/5MKee4SfHxGIkTeN62Bpx/IWWA6WEjBoEsPgTFuyYd6ZY1Gr
 Qwm/uOcoKwEe7yPYLDyX6FKsDnnjIKYbDfhXcIVJoaIWO51pxpebtQvXo1r77bVQsIV2
 snUKierNhFsvQkA+r4nhTOEPGaPvgQucQE7v1hXTNwuO6Bflgp9C4akbtRkZFD2Bn56i
 Va703Rt1blJoaKzcsdzSBGIjNvCPgsv8s+J8CuUiWFaVS09XY83K4ePMKOa2uI/x5fBF
 ilYijGKucyyL6AqRX03DPpw8PttqRUK+wW2UNv+aMLPfL/FGkxT/vFWlOeK6Jh5ql4cc
 xxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZmQuG2AsZpbcelM7uL4uy958NUT2KgddZYhFWXtMNSA=;
 b=Vhrw77KXdKbU0Dlm/8dKZAIXfd8YAke3HxZCXe4/HyY23dwVDur5McxKQfEhBtls/5
 hzorqKNeG3eHI2IO3yMOdwFvqRZG96cipAikenaqvw8PBxzSBSZism41X2Ezk/P2cpol
 yFXgrd3+dO2oHFzaMknZFk+T9IRl5iX10y33m318Y1g1wZuM4CHfH6dz+p6jyfmiReiU
 oT+CumscLi3v+55BitDdXyg4o5/AwffrO1pDEanYTgWrzwA3RaCCIunQ+iYJ0ZCM4Sxx
 KKQzNAW5PnADCggrzEIwtlDVHwHWpnxqs1tO8wjzwAh/l1hil8H4ZSrn1t9brqcrkcRA
 rPDQ==
X-Gm-Message-State: AOAM531pFd05vIKQpHWonJEPwitsCzOslbRzMbeCHBfp+fsBtqtFyOQe
 hXBcOIlTbgwZAWyigNHA+SoA8JaX5Zy6V+GZ/30=
X-Google-Smtp-Source: ABdhPJzISbzqletUc82Eswi6ouHI51/TKv7NeZldaWm+9iDTc1RF7eyNcAo0E5IEVoJI+14cfVcFe8k3uljOlhawiqg=
X-Received: by 2002:a92:d186:: with SMTP id z6mr33477001ilz.227.1594058108088; 
 Mon, 06 Jul 2020 10:55:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-16-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-16-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 10:45:21 -0700
Message-ID: <CAKmqyKMk1b28i9xh_w1tp2hUcbxWNPUxWthy9VbRbnMtkrVpcQ@mail.gmail.com>
Subject: Re: [PATCH 15/26] hw/usb: Add new 'usb-quirks.h' local header
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Paul Zimmerman <pauldzim@gmail.com>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, Jul 4, 2020 at 7:56 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> Only redirect.c consumes the quirks API. Reduce the big "hw/usb.h"
> header by moving the quirks related declaration into their own
> header. As nothing out of hw/usb/ requires it, keep it local.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/usb/usb-quirks.h | 27 +++++++++++++++++++++++++++
>  include/hw/usb.h    | 11 -----------
>  hw/usb/quirks.c     |  1 +
>  hw/usb/redirect.c   |  1 +
>  4 files changed, 29 insertions(+), 11 deletions(-)
>  create mode 100644 hw/usb/usb-quirks.h
>
> diff --git a/hw/usb/usb-quirks.h b/hw/usb/usb-quirks.h
> new file mode 100644
> index 0000000000..542889efc4
> --- /dev/null
> +++ b/hw/usb/usb-quirks.h
> @@ -0,0 +1,27 @@
> +/*
> + * USB quirk handling
> + *
> + * Copyright (c) 2012 Red Hat, Inc.
> + *
> + * Red Hat Authors:
> + * Hans de Goede <hdegoede@redhat.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#ifndef HW_USB_QUIRKS_H
> +#define HW_USB_QUIRKS_H
> +
> +/* In bulk endpoints are streaming data sources (iow behave like isoc ep=
s) */
> +#define USB_QUIRK_BUFFER_BULK_IN        0x01
> +/* Bulk pkts in FTDI format, need special handling when combining packet=
s */
> +#define USB_QUIRK_IS_FTDI               0x02
> +
> +int usb_get_quirks(uint16_t vendor_id, uint16_t product_id,
> +                   uint8_t interface_class, uint8_t interface_subclass,
> +                   uint8_t interface_protocol);
> +
> +#endif
> diff --git a/include/hw/usb.h b/include/hw/usb.h
> index 18f1349bdc..8c3bc920ff 100644
> --- a/include/hw/usb.h
> +++ b/include/hw/usb.h
> @@ -549,15 +549,4 @@ int usb_device_alloc_streams(USBDevice *dev, USBEndp=
oint **eps, int nr_eps,
>                               int streams);
>  void usb_device_free_streams(USBDevice *dev, USBEndpoint **eps, int nr_e=
ps);
>
> -/* quirks.c */
> -
> -/* In bulk endpoints are streaming data sources (iow behave like isoc ep=
s) */
> -#define USB_QUIRK_BUFFER_BULK_IN       0x01
> -/* Bulk pkts in FTDI format, need special handling when combining packet=
s */
> -#define USB_QUIRK_IS_FTDI              0x02
> -
> -int usb_get_quirks(uint16_t vendor_id, uint16_t product_id,
> -                   uint8_t interface_class, uint8_t interface_subclass,
> -                   uint8_t interface_protocol);
> -
>  #endif
> diff --git a/hw/usb/quirks.c b/hw/usb/quirks.c
> index 655b36f2d5..b0d0f87e35 100644
> --- a/hw/usb/quirks.c
> +++ b/hw/usb/quirks.c
> @@ -15,6 +15,7 @@
>  #include "qemu/osdep.h"
>  #include "quirks.inc.c"
>  #include "hw/usb.h"
> +#include "usb-quirks.h"
>
>  static bool usb_id_match(const struct usb_device_id *ids,
>                           uint16_t vendor_id, uint16_t product_id,
> diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
> index 417a60a2e6..4c5925a039 100644
> --- a/hw/usb/redirect.c
> +++ b/hw/usb/redirect.c
> @@ -45,6 +45,7 @@
>  #include "hw/usb.h"
>  #include "migration/qemu-file-types.h"
>  #include "migration/vmstate.h"
> +#include "usb-quirks.h"
>
>  /* ERROR is defined below. Remove any previous definition. */
>  #undef ERROR
> --
> 2.21.3
>
>

