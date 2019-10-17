Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 357FBDB03F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 16:40:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iL6sm-0004vc-Oo; Thu, 17 Oct 2019 14:36:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ihif=YK=gmail.com=aleksandar.m.mail@srs-us1.protection.inumbo.net>)
 id 1iL6sl-0004vX-8M
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 14:36:03 +0000
X-Inumbo-ID: 70e6cd54-f0eb-11e9-bbab-bc764e2007e4
Received: from mail-oi1-x243.google.com (unknown [2607:f8b0:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 70e6cd54-f0eb-11e9-bbab-bc764e2007e4;
 Thu, 17 Oct 2019 14:36:01 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id 83so2365074oii.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2019 07:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=uoqXoNs2LoAPyrbyhO0NvR/1ERyd3K1Kj3cNdM/97VE=;
 b=S4jJb2tTjU1v0Phn8M2EinnGzwqHSvgXonbZAfrcmHKzccKBbcH3yJ2obqyYvLSQDf
 Vwr0/6fwNHsz4cD0VBGZsrOzQJURDmtu32j/xUbSLWGti+LScimHfQDwNoIKr1zk+nRA
 /rENa0Nvog76k28mXnV/rRXsfMJ2EpwIQt6ETsvAjYcYm6BtH+DTQae1DmbcUxHId0Q2
 kg5XvgThOdYm2RGO7E4asizKNRdvWzhUPxb0rn9IGIgUQrN1vV8BXhU4CqDLnr4DajWO
 +tsHNxq+j4Tb+fL6ZpuZtkqMtrj2kSQ7YjVMEw1HSZeNKo6rXJ2fkk3UfNeI5kqcJ4V/
 +Vhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=uoqXoNs2LoAPyrbyhO0NvR/1ERyd3K1Kj3cNdM/97VE=;
 b=CrapE2Xu0sHZdSrzM6PzdRfMEtA7py6TVGpWEtK/g1aub5lMMHDJM2l8WKIIEiLGDD
 xEIKi2VH6vUSshPN1xBLmv6pmEaH0r9qetuslNYYHa2Fb0bcfTpRM5Gv49VCCvm/t8JM
 dHcfH38ubukYMDSiKtQsjkSqgTmI7F8gX7y58VbAi2GZoCaHMp7btzGQxvmiUbkbdpmX
 qQCKOyRohKuPgKZ8nXAXp6Uvi+7z+nkrbvLMXnUMhZKxzv1orQtzE6H4WZMIhQ0xGbtH
 fFJkDmG0LK74gW8ml9BLUBjveGFpRPg7iA47zgaCiTLiR7kMbyYBOMDMg+aVFY8PVKX/
 OstA==
X-Gm-Message-State: APjAAAVNJucuA0gp0XmMswOYo6WYThhf8+RWcSuOwLnHKW91RY/TXmvX
 PSYVmxzBIHO5PlqRX2vpPhto51STTe6/GFRh0fE=
X-Google-Smtp-Source: APXvYqyxc0yZOuJXvIGCMLrVsxo/ln5gqaCZCg/wBkXk/+HjIK69V2xpYVAOGOqcyHe0/x0BJ5BKi6eRlE94PQIoo4s=
X-Received: by 2002:aca:4e56:: with SMTP id c83mr3526497oib.53.1571322958328; 
 Thu, 17 Oct 2019 07:35:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Thu, 17 Oct 2019 07:35:57
 -0700 (PDT)
In-Reply-To: <20191015162705.28087-8-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
 <20191015162705.28087-8-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 17 Oct 2019 16:35:57 +0200
Message-ID: <CAL1e-=iYAY006fj-vWELCVaqNkYr19oM3rCQf8CfTScZg0+0uA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH 07/32] MAINTAINERS: Keep PIIX4 South Bridge
 separate from PC Chipsets
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
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: multipart/mixed; boundary="===============6489342697634436539=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6489342697634436539==
Content-Type: multipart/alternative; boundary="000000000000c23a7205951c2233"

--000000000000c23a7205951c2233
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m>
wrote:

> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> The PIIX4 Southbridge is not used by the PC machine,
> but by the Malta board (MIPS). Add a new section to
> keep it covered.
>
> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  MAINTAINERS | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)


Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>


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

--000000000000c23a7205951c2233
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">From: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"ma=
ilto:f4bug@amsat.org">f4bug@amsat.org</a>&gt;<br>
<br>
The PIIX4 Southbridge is not used by the PC machine,<br>
but by the Malta board (MIPS). Add a new section to<br>
keep it covered.<br>
<br>
Suggested-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@=
redhat.com</a>&gt;<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0MAINTAINERS | 7 ++++++-<br>
=C2=A01 file changed, 6 insertions(+), 1 deletion(-)</blockquote><div><div =
id=3D"cvcmsg_16dbfeb33c93ed97" class=3D"yh  " style=3D"border-top-left-radi=
us:0px;border-top-right-radius:0px;margin-bottom:11px;overflow:visible"><di=
v class=3D"Vh" id=3D"cvcfullmsg_16dbfeb33c93ed97"><div id=3D"cvcmsgbod_16db=
feb33c93ed97" class=3D"aj"><div class=3D"Ni"><div class=3D"ni pi " dir=3D"l=
tr"><p dir=3D"ltr"><br></p><p dir=3D"ltr">Reviewed-by: Aleksandar Markovic =
&lt;<a href=3D"mailto:amarkovic@wavecomp.com" target=3D"_blank">amarkovic@w=
avecomp.com</a>&gt;</p><div style=3D"clear:both"></div></div><div style=3D"=
clear:both"></div><div><div class=3D"M j T b hc Aj S" tabindex=3D"0"><div c=
lass=3D"V j hf"></div></div></div><div style=3D"clear:both"></div></div></d=
iv></div></div><div id=3D"cvcmsg_16dbfecd588da1f7" class=3D"yh" style=3D"ma=
rgin-bottom:11px"><div class=3D"Vh" id=3D"cvcfullmsg_16dbfecd588da1f7"><div=
 class=3D"M j Zi Mi  " tabindex=3D"0"><div id=3D"cvcreply_16dbfecd588da1f7"=
 class=3D"M j T b hc xh S  " tabindex=3D"0"><div class=3D"V j td"></div></d=
iv></div></div></div></div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
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
+M: Herv=C3=A9 Poussineau &lt;<a href=3D"mailto:hpoussin@reactos.org">hpous=
sin@reactos.org</a>&gt;<br>
+M: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bu=
g@amsat.org</a>&gt;<br>
+S: Maintained<br>
+F: hw/isa/piix4.c<br>
+<br>
=C2=A0Firmware configuration (fw_cfg)<br>
=C2=A0M: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.co=
m">philmd@redhat.com</a>&gt;<br>
=C2=A0R: Laszlo Ersek &lt;<a href=3D"mailto:lersek@redhat.com">lersek@redha=
t.com</a>&gt;<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote>

--000000000000c23a7205951c2233--


--===============6489342697634436539==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6489342697634436539==--

