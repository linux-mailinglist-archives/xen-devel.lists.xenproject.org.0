Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF2D215D7F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 19:56:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsVLT-0002PO-RU; Mon, 06 Jul 2020 17:55:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiqY=AR=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1jsVLS-0002PH-25
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 17:55:58 +0000
X-Inumbo-ID: f1c96b12-bfb1-11ea-8496-bc764e2007e4
Received: from mail-io1-xd43.google.com (unknown [2607:f8b0:4864:20::d43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1c96b12-bfb1-11ea-8496-bc764e2007e4;
 Mon, 06 Jul 2020 17:55:57 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id a12so40324641ion.13
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2020 10:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mSCfOyGk5eR0zmUJmXHZ59WLz9pikUBhIKrsmcLRwKY=;
 b=j8eXVMxaY8jrHLiJej23Zer/m3spONPlFZ4KX79ZeAzpTiTZv8QpRQThnjOB9bjZEz
 9XqRX+ZacKvhEpEkSiAFCBRMsBRSLouiILP7wtr57JI+XSK4o9JxmLpHI2oc0Q86y5LI
 gKZaeo5iEWUhOrVi4VXiejkfsAXXi1Jok0jj0Lf06WbI9xEOKdvw0l2w9Ddex+SQocdw
 XLAtjlWIGAf3HjvdQdebloODZ+hOYtihnQpNOqqLzXX50FzndxNMA7kTZPk8LHDy3Eqy
 yQzhSTGA0MNqrwk/qGgrvgHt1PhK5+f5Ta5eL+9/+kmDpG8FN1o8jhVPg/ep/hzRREdv
 u/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mSCfOyGk5eR0zmUJmXHZ59WLz9pikUBhIKrsmcLRwKY=;
 b=mFunRm7m/ZT9RI4mFBmkdjBh0b49qMtxKc2udn96BwsCbZLhF4ayMCexDkEWROnpS7
 uPO4mTILP0gU9yuWy+6aH6xxrEVBKeY5GMkwvG0ytwdy8JDUWd5SENgA9nUxBL5jvJ1+
 Pq7z+ne4Bw3GxU6rCeiHTvEmz1080mU+Pm6Fqr/4WRVPP6g0PpyxDSTMfPAXRVNZJYul
 M7SZb32wJq5OlBncGOGMcpsTTkYNTtCYInltQPa/5wBtRwpgLP1UymiTyxH69zkb7TzV
 va4fHjbNs+k56kSDcsS8Eqa89wKboUycczNqv39LhyMbS0a9B4T7IYqnJ5BS12pHY9aD
 E+QA==
X-Gm-Message-State: AOAM533cCi5aiIPj6xNXP0275vtrcQqxHy9lcxmxN52EQqimyBwEYNak
 B7bSnupgiMqW8VKByUeUrZDYEDBVfO/7virSXnE=
X-Google-Smtp-Source: ABdhPJwgU07aL+RYrZdIeE1eEIZgLeMLC2jE22itCYBokk5fp9t9EJA/ZYEPpHOeXw6oU4TodkfjqRVYChow5WL9Imc=
X-Received: by 2002:a5d:9ed0:: with SMTP id a16mr26452978ioe.176.1594058157255; 
 Mon, 06 Jul 2020 10:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-17-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-17-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 10:46:09 -0700
Message-ID: <CAKmqyKNj_iiadDJEYme-HWxSNm5y7cE=ESRtxxXd4XvToGsRHw@mail.gmail.com>
Subject: Re: [PATCH 16/26] hw/usb/bus: Simplify usb_get_dev_path()
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
> Simplify usb_get_dev_path() a bit.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/usb/bus.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/hw/usb/bus.c b/hw/usb/bus.c
> index 111c3af7c1..f8901e822c 100644
> --- a/hw/usb/bus.c
> +++ b/hw/usb/bus.c
> @@ -580,19 +580,18 @@ static void usb_bus_dev_print(Monitor *mon, DeviceS=
tate *qdev, int indent)
>  static char *usb_get_dev_path(DeviceState *qdev)
>  {
>      USBDevice *dev =3D USB_DEVICE(qdev);
> -    DeviceState *hcd =3D qdev->parent_bus->parent;
> -    char *id =3D NULL;
>
>      if (dev->flags & (1 << USB_DEV_FLAG_FULL_PATH)) {
> -        id =3D qdev_get_dev_path(hcd);
> -    }
> -    if (id) {
> -        char *ret =3D g_strdup_printf("%s/%s", id, dev->port->path);
> -        g_free(id);
> -        return ret;
> -    } else {
> -        return g_strdup(dev->port->path);
> +        DeviceState *hcd =3D qdev->parent_bus->parent;
> +        char *id =3D qdev_get_dev_path(hcd);
> +
> +        if (id) {
> +            char *ret =3D g_strdup_printf("%s/%s", id, dev->port->path);
> +            g_free(id);
> +            return ret;
> +        }
>      }
> +    return g_strdup(dev->port->path);
>  }
>
>  static char *usb_get_fw_dev_path(DeviceState *qdev)
> --
> 2.21.3
>
>

