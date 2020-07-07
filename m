Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C757F2162E5
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 02:18:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsbIn-0000Up-3W; Tue, 07 Jul 2020 00:17:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pYfC=AS=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1jsbIm-0000Uf-An
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 00:17:36 +0000
X-Inumbo-ID: 422cbb56-bfe7-11ea-b7bb-bc764e2007e4
Received: from mail-il1-x142.google.com (unknown [2607:f8b0:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 422cbb56-bfe7-11ea-b7bb-bc764e2007e4;
 Tue, 07 Jul 2020 00:17:35 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id x9so34538872ila.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2020 17:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oT6h3FPPrO2frJk8eR6JrALI5YXxXiAsbZ1+5VELi6s=;
 b=IGZ7nFq1jPrJASsShupXRZ987k64O5ZF1peALAk0W9yQa/epc+jZ7vJemnzFRm7qQ0
 XwUCGVF4g7dXUL32MNSRP5OIl5XaEN5kqPkXvDFiw/reJhMLCjqVVM3JcyDTXftTKGCv
 l6VDo3EsePWKMENABCDslc18HsS205LYm9FU8ogayVgsnxjJILxEIynzpk6/Y4tTZIXY
 wybT1mS6TNxf/py8eH90SCc/1SxghIT0cqTDZQfDr7lkBtsbfeh9HyTS8S44H1WgDtnY
 H3IkdCsGUXjn2fTUA3Rjd0Coqk2SxNNZqZqW15ZC3DY2I0HXIZiiII8qF6hnubRW5de6
 Pf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oT6h3FPPrO2frJk8eR6JrALI5YXxXiAsbZ1+5VELi6s=;
 b=bgfk/68IbpdlShsfG+3ikDMDXAGxZWZIBTNQfxOzLElBzQajgyGAm739rVss/yCekh
 Hvs8K69Cjbn5UwjlDMDWoNFfVlJZWOHkIuPSxzhI6+QXypbzXLG62mjyjXFZntdhxdQ8
 KHee/0nBF5+q74D5c+Q4HRrekcfNa2s4facZSMoFEqzr2+rCA8AFadSrmggWohovKgvn
 Uz027CkDosuL2DeX7qnkddFzTG0jLjIaFTbhOnn76i9rNUhxY/9IjuQcrvvCcbbZHVqT
 AhKPoJrQXnnKD+6IkjgYJDwUrnm37mlj0ELxTcvSXJ4HNx5H5FDtXocfyUPA5c3hclAF
 DdZA==
X-Gm-Message-State: AOAM530pa26r+oD5z7XlUuERgIMsobEJME97OGuFRRNTugV/Bnqc4T70
 9HNvp2Xm3ui1BEgYGOOu5qnqrdcdZfSq8LpyVTM=
X-Google-Smtp-Source: ABdhPJzycshpPdNG1lvs8VoNh6fTd7DN0RtstWqgoBIV2gMFAMvggj4/NTvj4Gb9y16ym2XuomQHcm42Kq1Ixg4TWS4=
X-Received: by 2002:a92:bb84:: with SMTP id x4mr34079638ilk.177.1594081055408; 
 Mon, 06 Jul 2020 17:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-20-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-20-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 17:07:47 -0700
Message-ID: <CAKmqyKNW1V_vOPw4AdBP5BpD2ueOT1NFz4hUON82VMyErLzgyw@mail.gmail.com>
Subject: Re: [PATCH 19/26] hw/ppc/spapr: Use usb_get_port_path()
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

On Sat, Jul 4, 2020 at 7:59 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> To avoid to access the USBDevice internals, and use the
> recently added usb_get_port_path() helper instead.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/ppc/spapr.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index f6f034d039..221d3e7a8c 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3121,7 +3121,8 @@ static char *spapr_get_fw_dev_path(FWPathProvider *=
p, BusState *bus,
>               * We use SRP luns of the form 01000000 | (usb-port << 16) |=
 lun
>               * in the top 32 bits of the 64-bit LUN
>               */
> -            unsigned usb_port =3D atoi(usb->port->path);
> +            g_autofree char *usb_port_path =3D usb_get_port_path(usb);
> +            unsigned usb_port =3D atoi(usb_port_path);
>              unsigned id =3D 0x1000000 | (usb_port << 16) | d->lun;
>              return g_strdup_printf("%s@%"PRIX64, qdev_fw_name(dev),
>                                     (uint64_t)id << 32);
> @@ -3137,7 +3138,8 @@ static char *spapr_get_fw_dev_path(FWPathProvider *=
p, BusState *bus,
>      if (strcmp("usb-host", qdev_fw_name(dev)) =3D=3D 0) {
>          USBDevice *usbdev =3D CAST(USBDevice, dev, TYPE_USB_DEVICE);
>          if (usb_host_dev_is_scsi_storage(usbdev)) {
> -            return g_strdup_printf("storage@%s/disk", usbdev->port->path=
);
> +            g_autofree char *usb_port_path =3D usb_get_port_path(usbdev)=
;
> +            return g_strdup_printf("storage@%s/disk", usb_port_path);
>          }
>      }
>
> --
> 2.21.3
>
>

