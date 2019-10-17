Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3750DB100
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 17:22:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iL7Zq-00036l-9Y; Thu, 17 Oct 2019 15:20:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ihif=YK=gmail.com=aleksandar.m.mail@srs-us1.protection.inumbo.net>)
 id 1iL7Zo-00036e-I8
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 15:20:32 +0000
X-Inumbo-ID: a8859f5a-f0f1-11e9-8aca-bc764e2007e4
Received: from mail-oi1-x241.google.com (unknown [2607:f8b0:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8859f5a-f0f1-11e9-8aca-bc764e2007e4;
 Thu, 17 Oct 2019 15:20:31 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id i16so2489851oie.4
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2019 08:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=iqo5Zqlpayd6YjxQ6ZC6U0axC1xiHVVt/ytQk8CZqoU=;
 b=FxoYp4701kd/Tx4mEdNgThP6veWBjD1NUwXrFLwPlGpHZqLxezuETbuI/AwWTCMvt3
 k/tj4DwU4dMcSACeS8lXexuzK30ikswhDp4VPl45ULpT/qOiVSJG8QunQ+BKtG4IcRWN
 TsMnieYGLWpS++u2VDkGODm53r/1SodLSPcEUB82SrUq/ObI2pmMtp4qJOnzoXVd9NID
 OprVaRQ0Pcll8lBOZrLlHvLQ8NVTFfcmgJBOraw7FTqLgqlyxg+o7My8jztwMvq3o+PY
 IHelmaWKXFA6Ny+aERAEmoUR1fZSFRTNs263B4MhY418IuPmJ1uVxOP7A0PwDWrHNOx3
 aAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=iqo5Zqlpayd6YjxQ6ZC6U0axC1xiHVVt/ytQk8CZqoU=;
 b=iMF0N7ecfU9wkp9tF3U8e9fmStBZJglpfzT3kBY6u8hP/Hoijz8HmeiHBU5c0iUC7w
 JpqC95pAG24zXCLSgZXA8czcGZmSNJDuJwKdnPNU4HTomnlEIuwA/4d9m0dyBHORjgjX
 xBSd6fgMaFpjXSJ6rhqX8eFy3/vt8XvTzTc/V9J7wKEOa4txHiD6qVVHWgMRUagB+Bnw
 8MNpb/4ygq8Da2KP63Rk8O/MMBarJAmRytDWcpp+EHqplgdWUg2yUs+0zAS65VdiCIue
 nyGgnGptHGLlWvhOA80qpbnW65hS2zQ0pZ5SNguUSG9gowVLZD7J+1n9nXpjP1SIzDTA
 Zu8A==
X-Gm-Message-State: APjAAAUIvln2GP6w55JbMO4jbXS3RsyKKwVesVR8QpRqBgvKtbUVt94i
 n+5JqzlScK1B8aGVJrff0JzDWYGbx8EpPkwtmQ0=
X-Google-Smtp-Source: APXvYqxNu/gR9TK/dcdH4fLfXS8yFZKhTLSUj9bWdFFVazUJOuFTi6v56ofGqB7Yzl3bM1hSKJ/G3uKh5wre3qx8rWc=
X-Received: by 2002:a05:6808:341:: with SMTP id
 j1mr3611992oie.106.1571325631407; 
 Thu, 17 Oct 2019 08:20:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Thu, 17 Oct 2019 08:20:30
 -0700 (PDT)
In-Reply-To: <20191015162705.28087-23-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
 <20191015162705.28087-23-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 17 Oct 2019 17:20:30 +0200
Message-ID: <CAL1e-=hW5uO6DyNZvAqeoA=4QwHt5QhgYD4GiWdKujzqrMURdA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH 22/32] hw/i386/pc: Move gsi_state creation
 code
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: multipart/mixed; boundary="===============0925108020275879975=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0925108020275879975==
Content-Type: multipart/alternative; boundary="000000000000162b0205951cc290"

--000000000000162b0205951cc290
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m>
wrote:

> The block code related to IRQ start few lines later. Move


block code -> code block
start -> starts

the comment and the pc_gsi_create() call

where we start


call -> invocation


> to use the IRQs.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/i386/pc_q35.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 52261962b8..6d096eff28 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -209,9 +209,6 @@ static void pc_q35_init(MachineState *machine)
>                         rom_memory, &ram_memory);
>      }
>
> -    /* irq lines */
> -    gsi_state =3D pc_gsi_create(&pcms->gsi, pcmc->pci_enabled);
> -
>      /* create pci host bus */
>      q35_host =3D Q35_HOST_DEVICE(qdev_create(NULL, TYPE_Q35_HOST_DEVICE)=
);
>
> @@ -245,6 +242,9 @@ static void pc_q35_init(MachineState *machine)
>      object_property_set_link(OBJECT(machine), OBJECT(lpc),
>                               PC_MACHINE_ACPI_DEVICE_PROP, &error_abort);
>
> +    /* irq lines */
> +    gsi_state =3D pc_gsi_create(&pcms->gsi, pcmc->pci_enabled);
> +
>      ich9_lpc =3D ICH9_LPC_DEVICE(lpc);
>      lpc_dev =3D DEVICE(lpc);
>      for (i =3D 0; i < GSI_NUM_PINS; i++) {
> --
> 2.21.0
>
>
>

--000000000000162b0205951cc290
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">The block code related to IRQ start few lines later=
. Move</blockquote><div><br></div><div>block code -&gt; code block</div><di=
v>start -&gt; starts</div><div><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
the comment and the pc_gsi_create() call=C2=A0</blockquote><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">where we start</blockquote><div><br></div><div>call -&gt; in=
vocation</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
to use the IRQs.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/i386/pc_q35.c | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c<br>
index 52261962b8..6d096eff28 100644<br>
--- a/hw/i386/pc_q35.c<br>
+++ b/hw/i386/pc_q35.c<br>
@@ -209,9 +209,6 @@ static void pc_q35_init(MachineState *machine)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rom_memory, &amp;ram_memory);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 /* irq lines */<br>
-=C2=A0 =C2=A0 gsi_state =3D pc_gsi_create(&amp;pcms-&gt;gsi, pcmc-&gt;pci_=
enabled);<br>
-<br>
=C2=A0 =C2=A0 =C2=A0/* create pci host bus */<br>
=C2=A0 =C2=A0 =C2=A0q35_host =3D Q35_HOST_DEVICE(qdev_create(<wbr>NULL, TYP=
E_Q35_HOST_DEVICE));<br>
<br>
@@ -245,6 +242,9 @@ static void pc_q35_init(MachineState *machine)<br>
=C2=A0 =C2=A0 =C2=A0object_property_set_link(<wbr>OBJECT(machine), OBJECT(l=
pc),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PC_MACHINE_ACPI_DEVICE_PROP, &amp;error_abo=
rt);<br>
<br>
+=C2=A0 =C2=A0 /* irq lines */<br>
+=C2=A0 =C2=A0 gsi_state =3D pc_gsi_create(&amp;pcms-&gt;gsi, pcmc-&gt;pci_=
enabled);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0ich9_lpc =3D ICH9_LPC_DEVICE(lpc);<br>
=C2=A0 =C2=A0 =C2=A0lpc_dev =3D DEVICE(lpc);<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; GSI_NUM_PINS; i++) {<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote>

--000000000000162b0205951cc290--


--===============0925108020275879975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0925108020275879975==--

