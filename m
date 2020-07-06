Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CE2215D82
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 19:56:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsVM7-0002Tr-4t; Mon, 06 Jul 2020 17:56:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiqY=AR=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1jsVM5-0002Tj-W8
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 17:56:38 +0000
X-Inumbo-ID: 0992a7cc-bfb2-11ea-8496-bc764e2007e4
Received: from mail-io1-xd41.google.com (unknown [2607:f8b0:4864:20::d41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0992a7cc-bfb2-11ea-8496-bc764e2007e4;
 Mon, 06 Jul 2020 17:56:37 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id a12so40326864ion.13
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2020 10:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/6i6SzUyP91tXZAmPR05xH5j33bfBUucUM0URzPP61A=;
 b=boamkXe9J4H35VxNzJVu2sKkuqZ5atZU6A1A5XhvxgFGrzuqn6g5Q7BEAyZTMpUh8n
 XRbR8Zv3k0pfntdT7a07EFE6ygQpqlJVA3b21L/ZK7KeNdytEnvSULDnEbDknQCWxcgX
 8bbfye39D1BUQ1BAcIRGiuZaAl7MvRJXkFgyzJlB0nYJGuCrTzE1/V8GyGEUUtzXB8lM
 +2k1yGzCz+XgJBwBT+e0m0Q+bF9LqSXCkqqxeQqvPuvyliNqKuOjs+oMEntue55kn1mj
 5tVcq8YkluSFwe7RLw7lEjbqMwpHKUCokr6yZ39bWVzbROv/rIppb5UyQ6xsvhdvU64B
 V1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/6i6SzUyP91tXZAmPR05xH5j33bfBUucUM0URzPP61A=;
 b=o4Beuq+n4ZTxkEQKFCQloMa4mOI/kYQv8W+DlJ+u1PgWrk3xZ9wvDmY+GfoQxCnbWD
 +kJGglqgeNLAFO21Xdd+XuOoivM3b2hrBhhbAWMCRPZ2FqczwFF7yiNkGlDtQZzhEkBk
 HhpRWz805Y/7SwYrz+o4bzgSx8Myfzr6nl+zM3A9UWJ6n+Gvrbl6xEk8NN0X3PvrUoRU
 6Q+w3RsrjzA6WnOe+p2MU6WyuG8wkKfrY95coSQxXXco0ertth836k6LIfn0CIeGZH2X
 L3aJF9B7w7k65QlYdi4Whc7KlmzqidouAZmz5RBaIkKkvy+beY81ibKnSLwJUEf0YoEW
 LZPQ==
X-Gm-Message-State: AOAM53341+W3/d5xiPi/p1ENO0mfGvRRjzhPez1Gl/xLqWHDPj3MZMMo
 ozmoh28fO41BbsTKqFQTL2qSR+weK66FM9m+GSA=
X-Google-Smtp-Source: ABdhPJyWgOX4whXvLnmyTPkPv87oz9JfwIp4De0q7D/H/TDK5ZXEnOeDquw+Fo5nyel8hcaNjKzEOm1ikS3FuMmOoSw=
X-Received: by 2002:a5d:9306:: with SMTP id l6mr27140837ion.105.1594058197170; 
 Mon, 06 Jul 2020 10:56:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-18-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-18-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 10:46:50 -0700
Message-ID: <CAKmqyKMk==4rbi4iqEuH1aYcUNE+zTbBst5gKp8NkePz6OmDNg@mail.gmail.com>
Subject: Re: [PATCH 17/26] hw/usb/bus: Rename usb_get_dev_path() as
 usb_get_full_dev_path()
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

On Sat, Jul 4, 2020 at 7:58 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> If the device has USB_DEV_FLAG_FULL_PATH set, usb_get_dev_path()
> returns the full port path. Rename the function accordingly.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/usb/bus.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/usb/bus.c b/hw/usb/bus.c
> index f8901e822c..fad8194bf5 100644
> --- a/hw/usb/bus.c
> +++ b/hw/usb/bus.c
> @@ -13,7 +13,7 @@
>
>  static void usb_bus_dev_print(Monitor *mon, DeviceState *qdev, int inden=
t);
>
> -static char *usb_get_dev_path(DeviceState *dev);
> +static char *usb_get_full_dev_path(DeviceState *dev);
>  static char *usb_get_fw_dev_path(DeviceState *qdev);
>  static void usb_qdev_unrealize(DeviceState *qdev);
>
> @@ -33,7 +33,7 @@ static void usb_bus_class_init(ObjectClass *klass, void=
 *data)
>      HotplugHandlerClass *hc =3D HOTPLUG_HANDLER_CLASS(klass);
>
>      k->print_dev =3D usb_bus_dev_print;
> -    k->get_dev_path =3D usb_get_dev_path;
> +    k->get_dev_path =3D usb_get_full_dev_path;
>      k->get_fw_dev_path =3D usb_get_fw_dev_path;
>      hc->unplug =3D qdev_simple_device_unplug_cb;
>  }
> @@ -577,7 +577,7 @@ static void usb_bus_dev_print(Monitor *mon, DeviceSta=
te *qdev, int indent)
>                     dev->attached ? ", attached" : "");
>  }
>
> -static char *usb_get_dev_path(DeviceState *qdev)
> +static char *usb_get_full_dev_path(DeviceState *qdev)
>  {
>      USBDevice *dev =3D USB_DEVICE(qdev);
>
> --
> 2.21.3
>
>

