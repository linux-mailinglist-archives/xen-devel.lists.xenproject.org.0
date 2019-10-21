Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E360DE321
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 06:22:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMP8l-00069Q-3n; Mon, 21 Oct 2019 04:17:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3IRp=YO=gmail.com=liq3ea@srs-us1.protection.inumbo.net>)
 id 1iMLyw-0007OF-DI
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 00:55:34 +0000
X-Inumbo-ID: 7c59c416-f39d-11e9-a531-bc764e2007e4
Received: from mail-oi1-x244.google.com (unknown [2607:f8b0:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c59c416-f39d-11e9-a531-bc764e2007e4;
 Mon, 21 Oct 2019 00:55:33 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id g81so9611172oib.8
 for <xen-devel@lists.xenproject.org>; Sun, 20 Oct 2019 17:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Px+dFPcwELRuXJvQgwLp4nDQ4IO/i1z6c3QaH8sRTMk=;
 b=IlyOPFM+cffb/t4/WyKQo+ToXKvEs61aANkYZ6FJB1TBiQBZQIbGPRyHOke7tW9NAE
 j59xhPjvSiprIkl0tNATiDuUTy9oFcgwNV/GzKYCVunV46ZQ5OrWQfj/mpBfrBfbPppj
 rp3gS2jOLILeizXDlhc+m9RkOMvRn/X64LDPkc4S5k2W9YHIGg7UqwZo87hqYvN+RT9s
 VUB3IicIuRbpn0Xj+6mBGKCVqTbGC3TeYW+tmg6b1YtQ64ra5E4PpHpKFHwjYmK1CcMO
 DBrxAS+9/fOUjM3xxLYdgEv+7d9g4Uj7KHIwZ4ncdfaL2fEV8do4WCVbH7gwVIr8gMDV
 4Wwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Px+dFPcwELRuXJvQgwLp4nDQ4IO/i1z6c3QaH8sRTMk=;
 b=eNf76EEwRkAiT+zcaE0qTL/PyVg2G0ZMS/AbcmdI4OLyWwhUK+EDtd6Ue1g0gdA7F4
 QH1Man82XAJGzAYs+VNvjpvBkiMc2Cby+EkMrWzhMjc0xH1/sOmBXL4i1B5eS/NYdddd
 9b7yTH7Ajko3azC07bidNnv48lCOJC3jbv0etIpH2t8spkavgdKcSS8QCqPMi0I+XlZS
 Rk9B4PavlBA4fE0CNfoh5jYUqrBxYIIE4OCwyHFm6Z63unY2bXtutexDPbRXwrak7VPl
 DPKPdfA0HK5KVMb3dyk8zDcE/W23aZLlZxqDfXQ5UUEX/Qv2N77/l0mEJBNknbShWlA7
 gIjg==
X-Gm-Message-State: APjAAAWSABjnBljkFQcTCZEO+XdMtr+Ud+3/EQnQG1youcDuDOr/MgOo
 VLC+ApeqrUv9BrZIfU1TmAL3gTnvzB3S372s+qI=
X-Google-Smtp-Source: APXvYqzCXkWP7wOeHO66a0D3ZD2TyEEIN4dX82WdcLESzy5DfLyI5AVxJvb0zf8PQaqGqHI5yAd7wFS3j47uVIBWseQ=
X-Received: by 2002:aca:280e:: with SMTP id 14mr16953796oix.129.1571619333032; 
 Sun, 20 Oct 2019 17:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <20191018134754.16362-1-philmd@redhat.com>
 <20191018134754.16362-2-philmd@redhat.com>
In-Reply-To: <20191018134754.16362-2-philmd@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Mon, 21 Oct 2019 08:54:57 +0800
Message-ID: <CAKXe6S+hmwVbszWT4ALmh+TnKZ=0hPLQbT+hHiUEG-r8EZM1Nw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
X-Mailman-Approved-At: Mon, 21 Oct 2019 04:17:53 +0000
Subject: Re: [Xen-devel] [PATCH v2 01/20] MAINTAINERS: Keep PIIX4 South
 Bridge separate from PC Chipsets
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: multipart/mixed; boundary="===============7448964124504704794=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7448964124504704794==
Content-Type: multipart/alternative; boundary="000000000000114f4e05956124e5"

--000000000000114f4e05956124e5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> =E4=BA=8E2019=E5=B9=B410=E6=
=9C=8818=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=889:50=E5=86=99=E9=81=
=93=EF=BC=9A

> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> The PIIX4 Southbridge is not used by the PC machine,
> but by the Malta board (MIPS). Add a new section to
> keep it covered.
>
> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>

Reviewed-by: Li Qiang <liq3ea@163.com>


> ---
>  MAINTAINERS | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe4dc51b08..c9f625fc2e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1230,7 +1230,6 @@ F: hw/pci-host/q35.c
>  F: hw/pci-host/pam.c
>  F: include/hw/pci-host/q35.h
>  F: include/hw/pci-host/pam.h
> -F: hw/isa/piix4.c
>  F: hw/isa/lpc_ich9.c
>  F: hw/i2c/smbus_ich9.c
>  F: hw/acpi/piix4.c
> @@ -1716,6 +1715,12 @@ F: hw/display/edid*
>  F: include/hw/display/edid.h
>  F: qemu-edid.c
>
> +PIIX4 South Bridge (i82371AB)
> +M: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
> +M: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> +S: Maintained
> +F: hw/isa/piix4.c
> +
>  Firmware configuration (fw_cfg)
>  M: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>  R: Laszlo Ersek <lersek@redhat.com>
> --
> 2.21.0
>
>
>

--000000000000114f4e05956124e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; =E4=BA=8E2019=E5=
=B9=B410=E6=9C=8818=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=889:50=E5=86=
=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">From: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.o=
rg" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
<br>
The PIIX4 Southbridge is not used by the PC machine,<br>
but by the Malta board (MIPS). Add a new section to<br>
keep it covered.<br>
<br>
Suggested-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" targ=
et=3D"_blank">mst@redhat.com</a>&gt;<br>
Reviewed-by: Aleksandar Markovic &lt;<a href=3D"mailto:amarkovic@wavecomp.c=
om" target=3D"_blank">amarkovic@wavecomp.com</a>&gt;<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br></blockquote><div><br><=
/div><div>Reviewed-by: Li Qiang &lt;<a href=3D"mailto:liq3ea@163.com">liq3e=
a@163.com</a>&gt;<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
---<br>
=C2=A0MAINTAINERS | 7 ++++++-<br>
=C2=A01 file changed, 6 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index fe4dc51b08..c9f625fc2e 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -1230,7 +1230,6 @@ F: hw/pci-host/q35.c<br>
=C2=A0F: hw/pci-host/pam.c<br>
=C2=A0F: include/hw/pci-host/q35.h<br>
=C2=A0F: include/hw/pci-host/pam.h<br>
-F: hw/isa/piix4.c<br>
=C2=A0F: hw/isa/lpc_ich9.c<br>
=C2=A0F: hw/i2c/smbus_ich9.c<br>
=C2=A0F: hw/acpi/piix4.c<br>
@@ -1716,6 +1715,12 @@ F: hw/display/edid*<br>
=C2=A0F: include/hw/display/edid.h<br>
=C2=A0F: qemu-edid.c<br>
<br>
+PIIX4 South Bridge (i82371AB)<br>
+M: Herv=C3=A9 Poussineau &lt;<a href=3D"mailto:hpoussin@reactos.org" targe=
t=3D"_blank">hpoussin@reactos.org</a>&gt;<br>
+M: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org" targ=
et=3D"_blank">f4bug@amsat.org</a>&gt;<br>
+S: Maintained<br>
+F: hw/isa/piix4.c<br>
+<br>
=C2=A0Firmware configuration (fw_cfg)<br>
=C2=A0M: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.co=
m" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
=C2=A0R: Laszlo Ersek &lt;<a href=3D"mailto:lersek@redhat.com" target=3D"_b=
lank">lersek@redhat.com</a>&gt;<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote></div></div>

--000000000000114f4e05956124e5--


--===============7448964124504704794==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7448964124504704794==--

