Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A462162E4
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 02:18:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsbIX-0000Tt-NK; Tue, 07 Jul 2020 00:17:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pYfC=AS=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1jsbIV-0000To-Mo
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 00:17:19 +0000
X-Inumbo-ID: 381ea14c-bfe7-11ea-bb8b-bc764e2007e4
Received: from mail-io1-xd42.google.com (unknown [2607:f8b0:4864:20::d42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 381ea14c-bfe7-11ea-bb8b-bc764e2007e4;
 Tue, 07 Jul 2020 00:17:18 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id e64so36388730iof.12
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2020 17:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xZHsjKeHdF8oSJPzmzNmydGOMCfVdbd//sjNZ5Rs0FA=;
 b=KqyIFaGBNvxmnVxltXTlM8plCPYeRrgISiKJM/tD9Kbd27KFI1CC7U0Ah/UKNvGvBg
 udFg++6flfZ4WUK+dzYiQSHta158kukJeZPAWj8r78SZcxpO46xXXxk1U51fbtaaN8pW
 UUCcU4MWbVB6kfLXhL8LBTDGNTCBtLlclVpwbmfb8fc3Pybi9c1feC4krWSyTbkz5e1Y
 y4Z6EjmYKfDfUXGci6vsVY6FDN+h/uZ7WFoe4Z/Mng26z5b9+VGMf5VATYlQYQgKYJbG
 M2f7j3PxAAcsq2PA3Cmtzp0bdi4S1My+kFFeorzw6Q9DCqpqjbysqVEwUzznWFoV5qpK
 AgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xZHsjKeHdF8oSJPzmzNmydGOMCfVdbd//sjNZ5Rs0FA=;
 b=jCoeHnOJQVSFl6HqDSa4bWGzsLdl5sWmmlUZB9LlPq3Bw/Eqk1Fxl2NzRjKLCnniHA
 e10DN3+vWNTqiRHAOO9J1t3BsD+QiAeYmGs8+tiXY9tHQ9K8rMXmNZOwmr6w6liKDEdi
 rlXzVqQ5HIpVT6Hdbumg3dCffMesYzKcgZMltjo+6/p1bp5L4J0RcYvMNKcNB6exK7cs
 W5RRMWmL5MwwiKrqJmW4SRkEUrlQMU8lE2eXP7KcsT0bCuu3xofd5RXJAagEPhZtJ+5h
 6ohsP2H9MypsxZJ/tshpdsSsiMV8ehwAS999C29owNHzgBqEx3fnozeWxIADBGvFeInP
 71oQ==
X-Gm-Message-State: AOAM5310WzDEnTbSXq/oQ7Gtzy/qWQfw1oznJF/0MLHg3bYLdZRqxsAo
 nKwuioRg3rE01+KQqSjOWfNYha/7cqQJd8+GKB8=
X-Google-Smtp-Source: ABdhPJwKg5wBZ5JjpthevN5ot/tUHiyPrdatBIYezb12DomQ74k4H3YD9KYALnZc1QOGl4kgMIw8ZxCjVKiXCiSB2KI=
X-Received: by 2002:a5d:97d9:: with SMTP id k25mr28308672ios.42.1594081038532; 
 Mon, 06 Jul 2020 17:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-19-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-19-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 17:07:31 -0700
Message-ID: <CAKmqyKPSpKQXAOH7A55+zJXTa_1+eDNHLbwToLFdXx0r1n8Lpw@mail.gmail.com>
Subject: Re: [PATCH 18/26] hw/usb/bus: Add usb_get_port_path()
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

On Sat, Jul 4, 2020 at 8:00 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> Refactor usb_get_full_dev_path() to take a 'want_full_path'
> argument, and add usb_get_port_path() which returns a short
> path.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/usb.h | 10 ++++++++++
>  hw/usb/bus.c     | 18 +++++++++++++-----
>  2 files changed, 23 insertions(+), 5 deletions(-)
>
> diff --git a/include/hw/usb.h b/include/hw/usb.h
> index 8c3bc920ff..7ea502d421 100644
> --- a/include/hw/usb.h
> +++ b/include/hw/usb.h
> @@ -506,6 +506,16 @@ void usb_port_location(USBPort *downstream, USBPort =
*upstream, int portnr);
>  void usb_unregister_port(USBBus *bus, USBPort *port);
>  void usb_claim_port(USBDevice *dev, Error **errp);
>  void usb_release_port(USBDevice *dev);
> +/**
> + * usb_get_port_path:
> + * @dev: the USB device
> + *
> + * The returned data must be released with g_free()
> + * when no longer required.
> + *
> + * Returns: a dynamically allocated pathname.
> + */
> +char *usb_get_port_path(USBDevice *dev);
>  void usb_device_attach(USBDevice *dev, Error **errp);
>  int usb_device_detach(USBDevice *dev);
>  void usb_check_attach(USBDevice *dev, Error **errp);
> diff --git a/hw/usb/bus.c b/hw/usb/bus.c
> index fad8194bf5..518e5b94ed 100644
> --- a/hw/usb/bus.c
> +++ b/hw/usb/bus.c
> @@ -577,12 +577,10 @@ static void usb_bus_dev_print(Monitor *mon, DeviceS=
tate *qdev, int indent)
>                     dev->attached ? ", attached" : "");
>  }
>
> -static char *usb_get_full_dev_path(DeviceState *qdev)
> +static char *usb_get_dev_path(USBDevice *dev, bool want_full_path)
>  {
> -    USBDevice *dev =3D USB_DEVICE(qdev);
> -
> -    if (dev->flags & (1 << USB_DEV_FLAG_FULL_PATH)) {
> -        DeviceState *hcd =3D qdev->parent_bus->parent;
> +    if (want_full_path && (dev->flags & (1 << USB_DEV_FLAG_FULL_PATH))) =
{
> +        DeviceState *hcd =3D DEVICE(dev)->parent_bus->parent;
>          char *id =3D qdev_get_dev_path(hcd);
>
>          if (id) {
> @@ -594,6 +592,16 @@ static char *usb_get_full_dev_path(DeviceState *qdev=
)
>      return g_strdup(dev->port->path);
>  }
>
> +static char *usb_get_full_dev_path(DeviceState *qdev)
> +{
> +    return usb_get_dev_path(USB_DEVICE(qdev), true);
> +}
> +
> +char *usb_get_port_path(USBDevice *dev)
> +{
> +    return usb_get_dev_path(dev, false);
> +}
> +
>  static char *usb_get_fw_dev_path(DeviceState *qdev)
>  {
>      USBDevice *dev =3D USB_DEVICE(qdev);
> --
> 2.21.3
>
>

