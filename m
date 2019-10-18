Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A50DC101
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 11:32:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLOZo-0008GW-FI; Fri, 18 Oct 2019 09:29:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BpLK=YL=gmail.com=aleksandar.m.mail@srs-us1.protection.inumbo.net>)
 id 1iLOZn-0008GN-1u
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 09:29:39 +0000
X-Inumbo-ID: ce07ece0-f189-11e9-8aca-bc764e2007e4
Received: from mail-ot1-x342.google.com (unknown [2607:f8b0:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce07ece0-f189-11e9-8aca-bc764e2007e4;
 Fri, 18 Oct 2019 09:29:38 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id k32so4414048otc.4
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2019 02:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=KYWKqtUkh9BqJGl2SbWKMzH82HouTEciguc/48h5hwI=;
 b=G5YJS806ov4UYJubdBlCdMd5BW9y9d3DiaqPyFbJNCv4XQiuh+dEyHFrYo3V36cHZi
 /eQC8NAa2olB2ArztYgrxip1P0msIUth3O1AIvtHdVier8D3H9zfGrweEErkUnXHiEk2
 iev83RjZYZ9sdLezfrnYBH+sPM/fiui02HLisv9l5WJMYKri/7znDaGlh13+20UnI/WP
 IjCPB1HCg5AB6OYwefpBYLoM11YxekCC5sD7pHkt0+9Ofxy3wyOmb/XdFPwwpMuUDIyx
 pMSwHqKPNgJU6IrexMsuvZqopUM6FiIDDHtauD8JlxJ24aOUooX2DlT+zThuN0kP/YoH
 2BoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=KYWKqtUkh9BqJGl2SbWKMzH82HouTEciguc/48h5hwI=;
 b=iNO3h56q/iFxHM0hmPrjhm+67gKLWxs8zXnEC52tHL4kl9K74sRPQZ2bC37ck7+1Ly
 ZyCedxv1LymC5nKRtHmuAewwLt6oQT1GL8/tyniziqAcphqzvCiZtQ2a98STcBflA6t9
 ZHNy6hDJhBaVZ1yPkEZy2NenRYX6hcAhhIwPlwj4NmYP9gFpO2AVd6P7Y+tiaxv3J1T7
 5ulkmC3KQAg6CNaSsLFNF2/OOOz6Y8LwWbmOBS2vcK/UwonEnknKjnFvACRCDd+oAWrC
 Tb85wUrbu07CSJaYreB3+6o0Vb9H7SuFjG2j8kPjBMuT3STUu++eQHpsBWHDB3Qjaos5
 tetg==
X-Gm-Message-State: APjAAAWWerJICuo8tY+YPo5sXARUfVtVqCDjm8Tt8A0j5kFSv5kiCGir
 RJn7bSXSFVkP/bppJOiGLXRVHZObYq/j0RXvmqc=
X-Google-Smtp-Source: APXvYqyVYAp//gIwumC/0ACMQhOZINyCeSipNRrnNmghB2vtZ9XahmZwrYy6ZXBIzv90igP4gMHSQIjniOaYKf/lnL0=
X-Received: by 2002:a9d:684c:: with SMTP id c12mr7025115oto.341.1571390977890; 
 Fri, 18 Oct 2019 02:29:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Fri, 18 Oct 2019 02:29:37
 -0700 (PDT)
In-Reply-To: <20191015162705.28087-30-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
 <20191015162705.28087-30-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Fri, 18 Oct 2019 11:29:37 +0200
Message-ID: <CAL1e-=gfcT=3Hx+qJYcFKHSfnNP5w7dtbxivEHeX=nLDZP1zyA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH 29/32] hw/pci-host/piix: Fix code style
 issues
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
Content-Type: multipart/mixed; boundary="===============6039910525556158154=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6039910525556158154==
Content-Type: multipart/alternative; boundary="0000000000000a600d05952bf99e"

--0000000000000a600d05952bf99e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m>
wrote:

> We will move this code, fix its style first.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/pci-host/piix.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>


> diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
> index 0b5da5bc94..61f91ff561 100644
> --- a/hw/pci-host/piix.c
> +++ b/hw/pci-host/piix.c
> @@ -133,9 +133,10 @@ static PCIINTxRoute piix3_route_intx_pin_to_irq(void
> *opaque, int pci_intx);
>  static void piix3_write_config_xen(PCIDevice *dev,
>                                 uint32_t address, uint32_t val, int len);
>
> -/* return the global irq number corresponding to a given device irq
> -   pin. We could also use the bus number to have a more precise
> -   mapping. */
> +/*
> + * Return the global irq number corresponding to a given device irq
> + * pin. We could also use the bus number to have a more precise mapping.
> + */
>  static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
>  {
>      int slot_addend;
> --
> 2.21.0
>
>
>

--0000000000000a600d05952bf99e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">We will move this code, fix its style first.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/pci-host/piix.c | 7 ++++---<br>
=C2=A01 file changed, 4 insertions(+), 3 deletions(-)<br>
<br></blockquote><div><br></div><div><span style=3D"color:rgb(34,34,34);fon=
t-size:14px;line-height:22.1200008392334px">Reviewed-by: Aleksandar Markovi=
c &lt;</span><a href=3D"mailto:amarkovic@wavecomp.com" target=3D"_blank" st=
yle=3D"font-size:14px;line-height:22.1200008392334px">amarkovic@wavecomp.co=
m</a><span style=3D"color:rgb(34,34,34);font-size:14px;line-height:22.12000=
08392334px">&gt;</span><br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">
diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c<br>
index 0b5da5bc94..61f91ff561 100644<br>
--- a/hw/pci-host/piix.c<br>
+++ b/hw/pci-host/piix.c<br>
@@ -133,9 +133,10 @@ static PCIINTxRoute piix3_route_intx_pin_to_irq(<wbr>v=
oid *opaque, int pci_intx);<br>
=C2=A0static void piix3_write_config_xen(<wbr>PCIDevice *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t address, uint32_t val, int =
len);<br>
<br>
-/* return the global irq number corresponding to a given device irq<br>
-=C2=A0 =C2=A0pin. We could also use the bus number to have a more precise<=
br>
-=C2=A0 =C2=A0mapping. */<br>
+/*<br>
+ * Return the global irq number corresponding to a given device irq<br>
+ * pin. We could also use the bus number to have a more precise mapping.<b=
r>
+ */<br>
=C2=A0static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int slot_addend;<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote>

--0000000000000a600d05952bf99e--


--===============6039910525556158154==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6039910525556158154==--

