Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 496ADDB0DF
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 17:15:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iL7S8-0001aJ-Be; Thu, 17 Oct 2019 15:12:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ihif=YK=gmail.com=aleksandar.m.mail@srs-us1.protection.inumbo.net>)
 id 1iL7S6-0001a0-Gr
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 15:12:34 +0000
X-Inumbo-ID: 8b5efee0-f0f0-11e9-a531-bc764e2007e4
Received: from mail-oi1-x244.google.com (unknown [2607:f8b0:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b5efee0-f0f0-11e9-a531-bc764e2007e4;
 Thu, 17 Oct 2019 15:12:33 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id w6so2430149oie.11
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2019 08:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=2jAu/qr6uBIVCI+Q6Qy4LmkqdXZ3twhcXalugYNwP3k=;
 b=DquGuD/20zOJj5Y8gcynm9u1114iRnu5bv6VPCKjRvP37n/xM5VMnr1fyntffzuAfh
 K9cccLyzJ7F4ddZ3boljaZrFeCwqeCnXrJUttLoraruMkwjHRzPg6xMOwsAWaZiTyzoq
 k46MPa2566PH93k13U0RNIzGPOF6/2ANl5evkH2LKxxUnTRhe3qFn57v2oSPLxklZNDk
 BE6LZXtLTghBy2Tz41hSW7MrTMs8aI4aDUbR2dsSNWEelyXoaTRM6642zBu1/lGMuFiC
 TPtaz90J9327SojyOJ89fBSBXLS1jd1y/F5G5f+FeJo7FgbhlH+YfBPZ+0owntspv4tW
 xT2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=2jAu/qr6uBIVCI+Q6Qy4LmkqdXZ3twhcXalugYNwP3k=;
 b=bt4Oha3Xlpj6SnNiffK/mhbRQO/C++MDPZBTyqhYtO/h/YgtJLvH+zerQCfb6W7Lg+
 Zj05Hcv1Yed3YA1inl9OlKTaP8Z2oOUZCL31W1QZihdrAla0GvsiqzjEpswr4uWmv6h3
 LX50e9VhdCpIq6y5gzabPZhVr9nKSKb+zrgFM8DdMgNtYI4rwW2bd/qBLL28J35Oy+nb
 8T+z0WxC3OnbaxySkS9Gg+JR3q1YP9FjCJSfKQfW6/B2B1gO6MGGgG7uQY1idhpe7+zx
 wbVfiU1r5n1xBEvXh7LFBvc563/2AntrJ7jGYY9fjdP0R+mbyJPbSEywwf7yQaKQMQB5
 6XNQ==
X-Gm-Message-State: APjAAAULU/Q2yE6Bv3lMdiFIW/oXKNcCqMAHmowKHzKie2cXegqCy4MS
 2b4FkxLUaAKempCsl7I0DMEKFrmldfN2jgantwU=
X-Google-Smtp-Source: APXvYqw/GTnto9fEDbJDUD1ifq6r8Mil/8EDkH1fyroSrCqveDSxmO8wft/JaT9zt/VCZSmPcOXYaaUTwsULaT52kJI=
X-Received: by 2002:aca:4d12:: with SMTP id a18mr3536205oib.79.1571325152987; 
 Thu, 17 Oct 2019 08:12:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Thu, 17 Oct 2019 08:12:30
 -0700 (PDT)
In-Reply-To: <20191015162705.28087-21-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
 <20191015162705.28087-21-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 17 Oct 2019 17:12:30 +0200
Message-ID: <CAL1e-=hoogYN55pWrQCe1XQ7ZW40ymYTy1kx-JzQe=MX8ir0uA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH 20/32] hw/i386/pc: Extract pc_gsi_create()
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
Content-Type: multipart/mixed; boundary="===============6540641776533106945=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6540641776533106945==
Content-Type: multipart/alternative; boundary="00000000000092115c05951ca51b"

--00000000000092115c05951ca51b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m>
wrote:

> The GSI creation code is common to all PC machines, extract the
> common code.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/i386/pc.c         | 15 +++++++++++++++
>  hw/i386/pc_piix.c    |  9 +--------
>  hw/i386/pc_q35.c     |  9 +--------
>  include/hw/i386/pc.h |  2 ++
>  4 files changed, 19 insertions(+), 16 deletions(-)
>
>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>


> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index bcda50efcc..a7597c6c44 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -357,6 +357,21 @@ void gsi_handler(void *opaque, int n, int level)
>      qemu_set_irq(s->ioapic_irq[n], level);
>  }
>
> +GSIState *pc_gsi_create(qemu_irq **irqs, bool pci_enabled)
> +{
> +    GSIState *s;
> +
> +    s =3D g_new0(GSIState, 1);
> +    if (kvm_ioapic_in_kernel()) {
> +        kvm_pc_setup_irq_routing(pci_enabled);
> +        *irqs =3D qemu_allocate_irqs(kvm_pc_gsi_handler, s, GSI_NUM_PINS=
);
> +    } else {
> +        *irqs =3D qemu_allocate_irqs(gsi_handler, s, GSI_NUM_PINS);
> +    }
> +
> +    return s;
> +}
> +
>  static void ioport80_write(void *opaque, hwaddr addr, uint64_t data,
>                             unsigned size)
>  {
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 431965d921..452b107e1b 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -188,14 +188,7 @@ static void pc_init1(MachineState *machine,
>          xen_load_linux(pcms);
>      }
>
> -    gsi_state =3D g_malloc0(sizeof(*gsi_state));
> -    if (kvm_ioapic_in_kernel()) {
> -        kvm_pc_setup_irq_routing(pcmc->pci_enabled);
> -        pcms->gsi =3D qemu_allocate_irqs(kvm_pc_gsi_handler, gsi_state,
> -                                       GSI_NUM_PINS);
> -    } else {
> -        pcms->gsi =3D qemu_allocate_irqs(gsi_handler, gsi_state,
> GSI_NUM_PINS);
> -    }
> +    gsi_state =3D pc_gsi_create(&pcms->gsi, pcmc->pci_enabled);
>
>      if (pcmc->pci_enabled) {
>          pci_bus =3D i440fx_init(host_type,
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 8fad20f314..52261962b8 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -210,14 +210,7 @@ static void pc_q35_init(MachineState *machine)
>      }
>
>      /* irq lines */
> -    gsi_state =3D g_malloc0(sizeof(*gsi_state));
> -    if (kvm_ioapic_in_kernel()) {
> -        kvm_pc_setup_irq_routing(pcmc->pci_enabled);
> -        pcms->gsi =3D qemu_allocate_irqs(kvm_pc_gsi_handler, gsi_state,
> -                                       GSI_NUM_PINS);
> -    } else {
> -        pcms->gsi =3D qemu_allocate_irqs(gsi_handler, gsi_state,
> GSI_NUM_PINS);
> -    }
> +    gsi_state =3D pc_gsi_create(&pcms->gsi, pcmc->pci_enabled);
>
>      /* create pci host bus */
>      q35_host =3D Q35_HOST_DEVICE(qdev_create(NULL, TYPE_Q35_HOST_DEVICE)=
);
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index b63fc7631e..d0c6b9d469 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -174,6 +174,8 @@ typedef struct GSIState {
>
>  void gsi_handler(void *opaque, int n, int level);
>
> +GSIState *pc_gsi_create(qemu_irq **irqs, bool pci_enabled);
> +
>  /* vmport.c */
>  #define TYPE_VMPORT "vmport"
>  typedef uint32_t (VMPortReadFunc)(void *opaque, uint32_t address);
> --
> 2.21.0
>
>
>

--00000000000092115c05951ca51b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">The GSI creation code is common to all PC machines,=
 extract the<br>
common code.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/i386/pc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 15 +++++++++++++++<br=
>
=C2=A0hw/i386/pc_piix.c=C2=A0 =C2=A0 |=C2=A0 9 +--------<br>
=C2=A0hw/i386/pc_q35.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 9 +--------<br>
=C2=A0include/hw/i386/pc.h |=C2=A0 2 ++<br>
=C2=A04 files changed, 19 insertions(+), 16 deletions(-)<br>
<br></blockquote><div><br></div><div><div id=3D"cvcmsg_16dbfeb33c93ed97" cl=
ass=3D"yh  " style=3D"border-top-left-radius:0px;border-top-right-radius:0p=
x;margin-bottom:11px;overflow:visible"><div class=3D"Vh" id=3D"cvcfullmsg_1=
6dbfeb33c93ed97"><div id=3D"cvcmsgbod_16dbfeb33c93ed97" class=3D"aj"><div c=
lass=3D"Ni"><div class=3D"ni pi " dir=3D"ltr"><p dir=3D"ltr">Reviewed-by: A=
leksandar Markovic &lt;<a href=3D"mailto:amarkovic@wavecomp.com" target=3D"=
_blank">amarkovic@wavecomp.com</a>&gt;</p><div style=3D"clear:both"></div><=
/div><div style=3D"clear:both"></div><div><div class=3D"M j T b hc Aj S" ta=
bindex=3D"0"><div class=3D"V j hf"></div></div></div><div style=3D"clear:bo=
th"></div></div></div></div></div><div id=3D"cvcmsg_16dbfecd588da1f7" class=
=3D"yh" style=3D"margin-bottom:11px"><div class=3D"Vh" id=3D"cvcfullmsg_16d=
bfecd588da1f7"><div class=3D"M j Zi Mi  " tabindex=3D"0"><div id=3D"cvcrepl=
y_16dbfecd588da1f7" class=3D"M j T b hc xh S  " tabindex=3D"0"><div class=
=3D"V j td"></div></div></div></div></div></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
diff --git a/hw/i386/pc.c b/hw/i386/pc.c<br>
index bcda50efcc..a7597c6c44 100644<br>
--- a/hw/i386/pc.c<br>
+++ b/hw/i386/pc.c<br>
@@ -357,6 +357,21 @@ void gsi_handler(void *opaque, int n, int level)<br>
=C2=A0 =C2=A0 =C2=A0qemu_set_irq(s-&gt;ioapic_irq[n], level);<br>
=C2=A0}<br>
<br>
+GSIState *pc_gsi_create(qemu_irq **irqs, bool pci_enabled)<br>
+{<br>
+=C2=A0 =C2=A0 GSIState *s;<br>
+<br>
+=C2=A0 =C2=A0 s =3D g_new0(GSIState, 1);<br>
+=C2=A0 =C2=A0 if (kvm_ioapic_in_kernel()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kvm_pc_setup_irq_routing(pci_<wbr>enabled);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *irqs =3D qemu_allocate_irqs(kvm_pc_gsi_<wbr>h=
andler, s, GSI_NUM_PINS);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *irqs =3D qemu_allocate_irqs(gsi_<wbr>handler,=
 s, GSI_NUM_PINS);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return s;<br>
+}<br>
+<br>
=C2=A0static void ioport80_write(void *opaque, hwaddr addr, uint64_t data,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 unsigned size)<br>
=C2=A0{<br>
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c<br>
index 431965d921..452b107e1b 100644<br>
--- a/hw/i386/pc_piix.c<br>
+++ b/hw/i386/pc_piix.c<br>
@@ -188,14 +188,7 @@ static void pc_init1(MachineState *machine,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xen_load_linux(pcms);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 gsi_state =3D g_malloc0(sizeof(*gsi_state));<br>
-=C2=A0 =C2=A0 if (kvm_ioapic_in_kernel()) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 kvm_pc_setup_irq_routing(pcmc-<wbr>&gt;pci_ena=
bled);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pcms-&gt;gsi =3D qemu_allocate_irqs(kvm_pc_gsi=
_<wbr>handler, gsi_state,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GSI_NUM_P=
INS);<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pcms-&gt;gsi =3D qemu_allocate_irqs(gsi_<wbr>h=
andler, gsi_state, GSI_NUM_PINS);<br>
-=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 gsi_state =3D pc_gsi_create(&amp;pcms-&gt;gsi, pcmc-&gt;pci_=
enabled);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (pcmc-&gt;pci_enabled) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pci_bus =3D i440fx_init(host_type,<br>
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c<br>
index 8fad20f314..52261962b8 100644<br>
--- a/hw/i386/pc_q35.c<br>
+++ b/hw/i386/pc_q35.c<br>
@@ -210,14 +210,7 @@ static void pc_q35_init(MachineState *machine)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* irq lines */<br>
-=C2=A0 =C2=A0 gsi_state =3D g_malloc0(sizeof(*gsi_state));<br>
-=C2=A0 =C2=A0 if (kvm_ioapic_in_kernel()) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 kvm_pc_setup_irq_routing(pcmc-<wbr>&gt;pci_ena=
bled);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pcms-&gt;gsi =3D qemu_allocate_irqs(kvm_pc_gsi=
_<wbr>handler, gsi_state,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GSI_NUM_P=
INS);<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pcms-&gt;gsi =3D qemu_allocate_irqs(gsi_<wbr>h=
andler, gsi_state, GSI_NUM_PINS);<br>
-=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 gsi_state =3D pc_gsi_create(&amp;pcms-&gt;gsi, pcmc-&gt;pci_=
enabled);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* create pci host bus */<br>
=C2=A0 =C2=A0 =C2=A0q35_host =3D Q35_HOST_DEVICE(qdev_create(<wbr>NULL, TYP=
E_Q35_HOST_DEVICE));<br>
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h<br>
index b63fc7631e..d0c6b9d469 100644<br>
--- a/include/hw/i386/pc.h<br>
+++ b/include/hw/i386/pc.h<br>
@@ -174,6 +174,8 @@ typedef struct GSIState {<br>
<br>
=C2=A0void gsi_handler(void *opaque, int n, int level);<br>
<br>
+GSIState *pc_gsi_create(qemu_irq **irqs, bool pci_enabled);<br>
+<br>
=C2=A0/* vmport.c */<br>
=C2=A0#define TYPE_VMPORT &quot;vmport&quot;<br>
=C2=A0typedef uint32_t (VMPortReadFunc)(void *opaque, uint32_t address);<br=
>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote>

--00000000000092115c05951ca51b--


--===============6540641776533106945==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6540641776533106945==--

