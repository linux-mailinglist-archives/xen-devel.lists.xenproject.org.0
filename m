Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA3D215CB4
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 19:10:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsUcs-0006Rb-G2; Mon, 06 Jul 2020 17:09:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiqY=AR=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1jsUcr-0006RW-2b
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 17:09:53 +0000
X-Inumbo-ID: 81a928b4-bfab-11ea-bca7-bc764e2007e4
Received: from mail-il1-x142.google.com (unknown [2607:f8b0:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 81a928b4-bfab-11ea-bca7-bc764e2007e4;
 Mon, 06 Jul 2020 17:09:52 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id i18so33555859ilk.10
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2020 10:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Qjmg6keciKQ+VOMeBpL/AW2YN1J1Kn6ACCJR6VlV+qI=;
 b=OwWaKMMMP1QFjMhkzf7cgTSnKgDIc5+avykkBDKL5ShxrEZIh2B9WQ4e2zfIOytV/S
 nT2xYaD/K/Vz5l0Ackv84a76Sz0UM/YC/GgxV/iqLEOpTvzEuxbqE411kHshEjoTjLro
 D8tn/C0W0XdheqSqYAmla8lSsnywSVsKq0WHgzdFTlrA5qHkvSACL4/4KkAEjFI5VhYv
 yu4z/Z1UQT1x3Xag1s1raH6NdSUSqtqIsUOrtWYSlMNZfedghH8nGN5g6ZLmqfd1X3fq
 1n5JPWWntS7W1kO4/RKlZkXlSU9pqI4NdubmRt+GADA2vNbCuw3/HfBUFwD2kp5Wgsvr
 AJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Qjmg6keciKQ+VOMeBpL/AW2YN1J1Kn6ACCJR6VlV+qI=;
 b=HKORv38rNyC60gVibfrL+CGaOMmEe+aJab55GTZ8xCW5sn1lRa0ZacOFWXPVdZBwbE
 cITf/08zVH3JCW6d1dhEYpiX1nfA3ptz0u/iGqMt1XnDot31I/UzExue8S50F+DXKNEu
 z0/Z9fgzx3fS4c3BgvXBfra7Sl/n7N10fsbqBWPJmkFtIcOhlyWwiZ7fhJJUYq1f0TrX
 VWSwP+aMwt7572bLOo6QvuUGC7SupXxISdM8NqlyPEcev2eg1mBpQvpNv0HDVRb7ddhD
 IqiThcIaIJV4LzQIaOIr3wzq/RqIBqINpyMzHas701Oba3VTJknW95KhJTvQDjwP+Ngb
 yRoQ==
X-Gm-Message-State: AOAM530Dz1e+C5kowEY4RTg79r5q/IoOgaN6qFrEPQllZ48WlRkI/Q/c
 4/pGXa30Px3C8GHhKUl97UeaO2PUGYLfKGMO6/c=
X-Google-Smtp-Source: ABdhPJyOwkiRiK+9nBFi1yzATBmoIi7mSBskR4fEEeJCsCiuqZAj+mTPEz50OG8NSilCy8YDtIqWGKoKN3C/V91lepU=
X-Received: by 2002:a92:bb84:: with SMTP id x4mr32234878ilk.177.1594055392114; 
 Mon, 06 Jul 2020 10:09:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-11-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-11-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 10:00:05 -0700
Message-ID: <CAKmqyKMUWZ9BsEeZkiK4-_MAhFpZO66MKQNhoZ3q1FT+XZie3g@mail.gmail.com>
Subject: Re: [PATCH 10/26] hw/usb/hcd-ehci: Move few definitions from header
 to source
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

On Sat, Jul 4, 2020 at 7:53 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> Move definitions only useful for hcd-ehci.c to this source file.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/usb/hcd-ehci.h | 11 -----------
>  hw/usb/hcd-ehci.c | 12 ++++++++++++
>  2 files changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/hw/usb/hcd-ehci.h b/hw/usb/hcd-ehci.h
> index 57b38cfc05..4577f5e31d 100644
> --- a/hw/usb/hcd-ehci.h
> +++ b/hw/usb/hcd-ehci.h
> @@ -24,17 +24,6 @@
>  #include "hw/pci/pci.h"
>  #include "hw/sysbus.h"
>
> -#ifndef EHCI_DEBUG
> -#define EHCI_DEBUG   0
> -#endif
> -
> -#if EHCI_DEBUG
> -#define DPRINTF printf
> -#else
> -#define DPRINTF(...)
> -#endif
> -
> -#define MMIO_SIZE        0x1000
>  #define CAPA_SIZE        0x10
>
>  #define NB_PORTS         6        /* Max. Number of downstream ports */
> diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
> index 256fb91e0c..a0beee527c 100644
> --- a/hw/usb/hcd-ehci.c
> +++ b/hw/usb/hcd-ehci.c
> @@ -36,6 +36,18 @@
>  #include "qemu/error-report.h"
>  #include "sysemu/runstate.h"
>
> +#ifndef EHCI_DEBUG
> +#define EHCI_DEBUG   0
> +#endif
> +
> +#if EHCI_DEBUG
> +#define DPRINTF printf
> +#else
> +#define DPRINTF(...)
> +#endif
> +
> +#define MMIO_SIZE        0x1000
> +
>  #define FRAME_TIMER_FREQ 1000
>  #define FRAME_TIMER_NS   (NANOSECONDS_PER_SECOND / FRAME_TIMER_FREQ)
>  #define UFRAME_TIMER_NS  (FRAME_TIMER_NS / 8)
> --
> 2.21.3
>
>

