Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 013AFDB0F4
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 17:19:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iL7Vp-000279-TN; Thu, 17 Oct 2019 15:16:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ihif=YK=gmail.com=aleksandar.m.mail@srs-us1.protection.inumbo.net>)
 id 1iL7Vo-000272-4G
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 15:16:24 +0000
X-Inumbo-ID: 1462eed6-f0f1-11e9-bbab-bc764e2007e4
Received: from mail-oi1-x242.google.com (unknown [2607:f8b0:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1462eed6-f0f1-11e9-bbab-bc764e2007e4;
 Thu, 17 Oct 2019 15:16:23 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id k20so2480574oih.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2019 08:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=AyW8NM6SJoGlUUn/caesoONpoZFYdqbED9wtAipUY7Q=;
 b=LRnSB184BsuH9LrV/bwFshWgP2XeAAUH44yEASK7+n3o/THTEY8W/7incOAx2V/GjU
 4qAt8d6oUwfPefR0gITGLKjTUnalbjKED/56rYlVo6ycBjq6hjHhUa/goMJotZYS5+aj
 5ro9nrjVMhogoJRPwY7aldvdb3Urf6a/FhANETyOinuxiHUWPyVzMVrlr6ugVGvlmee+
 F+3hNk3jPQwtGPVYnLIa2bxL+0wUglY3oCxCrR0qpL6NLAJLK4ZR6m1gKYdnA7t33j/Q
 HFwx8SfyzL+uZkBRotKzVJm+frxNfdbPd25QlLy0q0Enf1ELYAe7aLyOeilLrwrRlJPB
 mIZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=AyW8NM6SJoGlUUn/caesoONpoZFYdqbED9wtAipUY7Q=;
 b=a+D2OMh8mD3sTntwu/f8vNMxF+O/g4Fx9tC2epzhxR8PtYFAKkQA40GVPHRZDGxNVd
 M3V3529HmFnAVAUCQw+vOKMRJWZ5HEYlBTQsn9W24qBEXUojSdIYPRGcMpaVHvxVf6mT
 Bvan5czgB9ZibtT7eNfM7a6TrNu0QUDzegqnjTYL+eX15pROBCZk16+It6MeutlYyjqn
 jwM2unQIneOCks1yk50uUYA497qchPHQLPztemr8N5S+UvTxlMVzfxLTtx8K3ngW7Tcc
 Ia71dTSpWo37h+NxpLRlGhXMcymCFhHqTPCiiNtTY46pDaoSt3HurA3aWm1qFaaNs5c5
 gw3w==
X-Gm-Message-State: APjAAAU/Cm5yfA1uYyo0uB5Sp5H/AKSgJhPTfANkk7lg/X2c99yQYp0p
 lwAXsChwsBGoYT55rfOeQ/xjiVNwn9I/dCSi8ng=
X-Google-Smtp-Source: APXvYqw07qJjPokcVhwk/D87QvKmD4UjYp48DXnEdjIzgiiW8ZjoAHftG/wPAwoPFRE9z8BKjwAVnW0sE6vYehgJDDk=
X-Received: by 2002:aca:4e56:: with SMTP id c83mr3701878oib.53.1571325382899; 
 Thu, 17 Oct 2019 08:16:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Thu, 17 Oct 2019 08:16:22
 -0700 (PDT)
In-Reply-To: <20191015162705.28087-22-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
 <20191015162705.28087-22-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 17 Oct 2019 17:16:22 +0200
Message-ID: <CAL1e-=hLUDDqFiV8W1f2PFGYJMomvmZUXmjA55X7WEEYMykjHQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH 21/32] hw/i386/pc: Reduce gsi_handler scope
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
Content-Type: multipart/mixed; boundary="===============2098913198238968809=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============2098913198238968809==
Content-Type: multipart/alternative; boundary="000000000000463b3505951cb36b"

--000000000000463b3505951cb36b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m>
wrote:

> pc_gsi_create() is the single function that uses gsi_handler.
> Make it a static variable.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/i386/pc.c         | 2 +-
>  include/hw/i386/pc.h | 2 --
>  2 files changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index a7597c6c44..59de0c8a1f 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -346,7 +346,7 @@ GlobalProperty pc_compat_1_4[] =3D {
>  };
>  const size_t pc_compat_1_4_len =3D G_N_ELEMENTS(pc_compat_1_4);
>
> -void gsi_handler(void *opaque, int n, int level)
> +static void gsi_handler(void *opaque, int n, int level)
>  {
>      GSIState *s =3D opaque;
>
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index d0c6b9d469..75b44e156c 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -172,8 +172,6 @@ typedef struct GSIState {
>      qemu_irq ioapic_irq[IOAPIC_NUM_PINS];
>  } GSIState;
>
> -void gsi_handler(void *opaque, int n, int level);
> -
>  GSIState *pc_gsi_create(qemu_irq **irqs, bool pci_enabled);
>
>
Philippe, this 2-line deletion seems not to belong to this patch. If true,
please place it in another or a separate patch.

A.



>  /* vmport.c */
> --
> 2.21.0
>
>
>

--000000000000463b3505951cb36b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">pc_gsi_create() is the single function that uses gs=
i_handler.<br>
Make it a static variable.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/i386/pc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0include/hw/i386/pc.h | 2 --<br>
=C2=A02 files changed, 1 insertion(+), 3 deletions(-)<br>
<br>
diff --git a/hw/i386/pc.c b/hw/i386/pc.c<br>
index a7597c6c44..59de0c8a1f 100644<br>
--- a/hw/i386/pc.c<br>
+++ b/hw/i386/pc.c<br>
@@ -346,7 +346,7 @@ GlobalProperty pc_compat_1_4[] =3D {<br>
=C2=A0};<br>
=C2=A0const size_t pc_compat_1_4_len =3D G_N_ELEMENTS(pc_compat_1_4);<br>
<br>
-void gsi_handler(void *opaque, int n, int level)<br>
+static void gsi_handler(void *opaque, int n, int level)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0GSIState *s =3D opaque;<br>
<br>
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h<br>
index d0c6b9d469..75b44e156c 100644<br>
--- a/include/hw/i386/pc.h<br>
+++ b/include/hw/i386/pc.h<br>
@@ -172,8 +172,6 @@ typedef struct GSIState {<br>
=C2=A0 =C2=A0 =C2=A0qemu_irq ioapic_irq[IOAPIC_NUM_PINS];<br>
=C2=A0} GSIState;<br>
<br>
-void gsi_handler(void *opaque, int n, int level);<br>
-<br>
=C2=A0GSIState *pc_gsi_create(qemu_irq **irqs, bool pci_enabled);<br>
<br></blockquote><div><br></div><div>Philippe, this 2-line deletion seems n=
ot to belong to this patch. If true, please place it in another or a separa=
te patch.</div><div><br></div><div>A.</div><div><br></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
=C2=A0/* vmport.c */<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote>

--000000000000463b3505951cb36b--


--===============2098913198238968809==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2098913198238968809==--

