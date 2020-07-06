Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCF3215CAC
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 19:08:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsUbX-0006JG-0r; Mon, 06 Jul 2020 17:08:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiqY=AR=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1jsUbV-0006J7-0k
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 17:08:29 +0000
X-Inumbo-ID: 4f9cddca-bfab-11ea-bb8b-bc764e2007e4
Received: from mail-il1-x144.google.com (unknown [2607:f8b0:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f9cddca-bfab-11ea-bb8b-bc764e2007e4;
 Mon, 06 Jul 2020 17:08:28 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id r12so26334875ilh.4
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2020 10:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aJ+NMNUyWOSeU76/wZH/xOla8z/F8BGLKK6NO+daT7c=;
 b=DCtHRVbfbNdZdHrkno7Pg0sSHF/TO28JTJSsk4CQyuv3rpTGwPimzgtRdeipMmeYC8
 aUYtMHdn8ZYb548p0TC5sD7ZpYCJiiGQvNkmx5Fh+Y1+2AWdNXgyTbZF5g/nSA0CaFXC
 xiRGdWCgbqjAb5Jb4EW+JexNsAlDtpzx8H6+qoa4BE4MW1vaDJzHgM4Qc/aMXC3ErDa+
 xscFDbu167g1VZgMknCoWSYpzxdRsorPrRCP5QF0sWCErssL7NXmx5bWwMfBYg4XsY6P
 iFeF9TqxPGvbOg5sN22Y7ZvG9cGuDvhz6MRZPNAzvoxaV4xjYoy11GgiUBRGvz6pcpCz
 OlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aJ+NMNUyWOSeU76/wZH/xOla8z/F8BGLKK6NO+daT7c=;
 b=cio/iDavFzDTP3UQLIxEkoBIKZ/7bt2jOHiEPrIBP2UmHRG8SENCtLcbQMu2TCeB34
 AnkP7hI+MhMlzB3+owM49MW8VmWz5edOSJ8flnLRWISThNQH3Bb9boPhSAveiBAcsB6l
 XQMSk9W0omZCl4OjypAI4GH8VG5mxyQUcYzEmBMmkOrlmPwi7yCNAeWtaMVQhqSsMg9B
 6zimV2xw1HkMODoPCzgGVkxYb+6TJWUu/MamvTX4GfEbdHCnlrazZNaIxJrO6sORycaW
 NOEw9yzRnMCaPUxQeqEaQBVPrpzdm+Wmc9ooAu0SMvOVWe176RinvZ4hedxe1/A1Vbth
 aITw==
X-Gm-Message-State: AOAM530jPdt7yeDSg4PEtZg5l72/i8YP90pDqq9gni1yedP3n0+2y+R6
 LQsL8UXrT+tcnnx60ft1Q0HTz8LXkg8LOt+CxvU=
X-Google-Smtp-Source: ABdhPJztbbycqoucR5VA9L3J/eqZEps73vsP7bMZlYGOF7l5+CP/IDu5wRU4G+LaN3QoYCbBFL9miKesApB55IKBhTM=
X-Received: by 2002:a92:c213:: with SMTP id j19mr31628274ilo.40.1594055308108; 
 Mon, 06 Jul 2020 10:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-13-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-13-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 09:58:41 -0700
Message-ID: <CAKmqyKP1PJVHc=At4EM_60NZrdkokwOW9iwvqTHBoaYShWLUYg@mail.gmail.com>
Subject: Re: [PATCH 12/26] hw/usb/hcd-musb: Restrict header scope
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
> "hcd-musb.h" is only required by USB device implementions.
> As we keep these implementations in the hw/usb/ directory,
> move the header there.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  {include/hw =3D> hw}/usb/hcd-musb.h | 0
>  hw/usb/hcd-musb.c                 | 2 +-
>  hw/usb/tusb6010.c                 | 2 +-
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename {include/hw =3D> hw}/usb/hcd-musb.h (100%)
>
> diff --git a/include/hw/usb/hcd-musb.h b/hw/usb/hcd-musb.h
> similarity index 100%
> rename from include/hw/usb/hcd-musb.h
> rename to hw/usb/hcd-musb.h
> diff --git a/hw/usb/hcd-musb.c b/hw/usb/hcd-musb.c
> index 85f5ff5bd4..b8d8766a4a 100644
> --- a/hw/usb/hcd-musb.c
> +++ b/hw/usb/hcd-musb.c
> @@ -23,9 +23,9 @@
>  #include "qemu/osdep.h"
>  #include "qemu/timer.h"
>  #include "hw/usb.h"
> -#include "hw/usb/hcd-musb.h"
>  #include "hw/irq.h"
>  #include "hw/hw.h"
> +#include "hcd-musb.h"
>
>  /* Common USB registers */
>  #define MUSB_HDRC_FADDR                0x00    /* 8-bit */
> diff --git a/hw/usb/tusb6010.c b/hw/usb/tusb6010.c
> index 27eb28d3e4..9f9b81b09d 100644
> --- a/hw/usb/tusb6010.c
> +++ b/hw/usb/tusb6010.c
> @@ -23,11 +23,11 @@
>  #include "qemu/module.h"
>  #include "qemu/timer.h"
>  #include "hw/usb.h"
> -#include "hw/usb/hcd-musb.h"
>  #include "hw/arm/omap.h"
>  #include "hw/hw.h"
>  #include "hw/irq.h"
>  #include "hw/sysbus.h"
> +#include "hcd-musb.h"
>
>  #define TYPE_TUSB6010 "tusb6010"
>  #define TUSB(obj) OBJECT_CHECK(TUSBState, (obj), TYPE_TUSB6010)
> --
> 2.21.3
>
>

