Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE554755A0
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 10:58:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247307.426427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxR2d-0001i1-EP; Wed, 15 Dec 2021 09:57:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247307.426427; Wed, 15 Dec 2021 09:57:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxR2d-0001en-BL; Wed, 15 Dec 2021 09:57:43 +0000
Received: by outflank-mailman (input) for mailman id 247307;
 Wed, 15 Dec 2021 09:57:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uCzL=RA=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mxR2b-0001eh-OQ
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 09:57:41 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 709c7e45-5d8d-11ec-85d3-df6b77346a89;
 Wed, 15 Dec 2021 10:57:40 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id s1so3018832wrg.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 Dec 2021 01:57:40 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 709c7e45-5d8d-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a48mFvuUcnCIP9cUd4qhU8qQ0bb/d/xrOxAOQhxTyq8=;
        b=X3e3owUVcUqJYstARIdMCgY949jtyGhpYJV70LWkIO0Jf9SCF1lNOMBanK3cUt+cq2
         aoPjrs4uM2ZjBNKdYUcG2FxIR2Klx1cfi8T+FBCajQbvum4QoqHtyTk39KgVgdcsIxCC
         Q3pi3QxGJ7LBuWL5DjEpKQqS5/xIcVQidtwx1hiLd81Y429WS7Qex06ISXIYwfyI+5Lu
         YAzlnEPCVJFL0k7RbxrnEHo12nAXhMTFrEgydyIExkIOr5VYst5Bob7wka1fXRK3gnIA
         DErB6d6ndll7zrT6yW50nV5OvdmJj+jrxZitNHhwYgOiUDr7XKLQ/Dul1mal1nGhvLoB
         UcHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a48mFvuUcnCIP9cUd4qhU8qQ0bb/d/xrOxAOQhxTyq8=;
        b=jVp+9TGAhqy5mlhyTW6xPGzL1hFjxkpIu5XNHyvHvu3zqdb7Ce8Tn1U/KWCx/zY0jZ
         +yt8enHpmSYNXQ6WFQ8+fYj86noOKsVLeNMbfGZrRfCNsxR8ockZnuSn1WwjdBlZDstu
         KYShImJ/tDpNGIocJryM8SMhgm5xa2qNmGRHJKtphmSOziagqfKxiwVeMuMP2zokF6Xj
         CdN3kiaMWEUber/yG3GbSYcbInBsfEFjmiVhiDuNBSg/q2pQdyx1FU/sJ4XWyqSY6nj6
         TAkh102JYXnCrjD+xcSBaUw0gM16EeyfK0ySOAPh5fjKyYjOGzVmGDt2hBTwDrCNJhC8
         sBJw==
X-Gm-Message-State: AOAM533bnz0jxJLqYUNbILyLrdvy7X03x7QAX6xNQpGMbGrPeHw0AWCy
	KK6PnvqIrFWW19SogZICB59i93cDdfcgCb8fb34=
X-Google-Smtp-Source: ABdhPJzfiaeA6axviDewYMYN45aOZj4gzclrDCiPKIkEhIXDoiQEa5vnifzLr6G/KdiMowZQI/2XzWnCbDV0HY154eg=
X-Received: by 2002:adf:ef4f:: with SMTP id c15mr3696725wrp.226.1639562259957;
 Wed, 15 Dec 2021 01:57:39 -0800 (PST)
MIME-Version: 1.0
References: <cover.1639472078.git.oleksii_moisieiev@epam.com> <7ac8512b5479cf192b4aa399fa2501d0bccaaf48.1639472078.git.oleksii_moisieiev@epam.com>
In-Reply-To: <7ac8512b5479cf192b4aa399fa2501d0bccaaf48.1639472078.git.oleksii_moisieiev@epam.com>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Wed, 15 Dec 2021 11:57:29 +0200
Message-ID: <CAPD2p-mWWUT=kLFDOfsYrZp7hGLLbbU4SiPaFg1SKjF3Tkj5kQ@mail.gmail.com>
Subject: Re: [RFC v1 1/5] xen/arm: add support for Renesas R-Car Gen3 platform
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Content-Type: multipart/alternative; boundary="000000000000178b5e05d32c56b8"

--000000000000178b5e05d32c56b8
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 14, 2021 at 11:35 AM Oleksii Moisieiev <
Oleksii_Moisieiev@epam.com> wrote:

Hi Oleksii

[sorry for the possible format issues]

Implementation includes platform-specific smc handler for rcar3 platform.
>
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
>  xen/arch/arm/platforms/Makefile |  1 +
>  xen/arch/arm/platforms/rcar3.c  | 46 +++++++++++++++++++++++++++++++++
>  2 files changed, 47 insertions(+)
>  create mode 100644 xen/arch/arm/platforms/rcar3.c
>
> diff --git a/xen/arch/arm/platforms/Makefile
> b/xen/arch/arm/platforms/Makefile
> index 8632f4115f..b64c25de6c 100644
> --- a/xen/arch/arm/platforms/Makefile
> +++ b/xen/arch/arm/platforms/Makefile
> @@ -4,6 +4,7 @@ obj-$(CONFIG_ALL32_PLAT) += exynos5.o
>  obj-$(CONFIG_ALL32_PLAT) += midway.o
>  obj-$(CONFIG_ALL32_PLAT) += omap5.o
>  obj-$(CONFIG_ALL32_PLAT) += rcar2.o
> +obj-$(CONFIG_RCAR3) += rcar3.o
>  obj-$(CONFIG_ALL64_PLAT) += seattle.o
>  obj-$(CONFIG_ALL_PLAT)   += sunxi.o
>  obj-$(CONFIG_ALL64_PLAT) += thunderx.o
> diff --git a/xen/arch/arm/platforms/rcar3.c
> b/xen/arch/arm/platforms/rcar3.c
> new file mode 100644
> index 0000000000..d740145c71
> --- /dev/null
> +++ b/xen/arch/arm/platforms/rcar3.c
> @@ -0,0 +1,46 @@
> +/*
> + * xen/arch/arm/platforms/rcar3.c
> + *
> + * Renesas R-Car Gen3 specific settings
> + *
> + * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> + * Copyright (C) 2021 EPAM Systems
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <asm/platform.h>
> +
> +static bool rcar3_smc(struct cpu_user_regs *regs)
> +{
> +    return false;
> +}
> +
> +static const char *const rcar3_dt_compat[] __initconst =
> +{
> +    "renesas,r8a7795",
> +    "renesas,r8a7796",
>


Please note that since Linux commit:
"9c9f7891093b02eb64ca4e1c7ab776a4296c058f soc: renesas: Identify R-Car
M3-W+"
the compatible string for R-Car M3-W+ (ES3.0) SoC is "renesas,r8a77961". So
in case we want to have vSCMI feature on this new SoC revision as well we
will need
to extend the compatible list.


+    NULL
> +};
> +
> +PLATFORM_START(rcar3, "Renesas R-Car Gen3")
> +    .compatible = rcar3_dt_compat,
> +    .smc = rcar3_smc
> +PLATFORM_END
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> --
> 2.27.0
>
>

-- 
Regards,

Oleksandr Tyshchenko

--000000000000178b5e05d32c56b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 14, 2021 at 11:35 AM Olek=
sii Moisieiev &lt;<a href=3D"mailto:Oleksii_Moisieiev@epam.com" target=3D"_=
blank">Oleksii_Moisieiev@epam.com</a>&gt; wrote:<br></div><div dir=3D"ltr" =
class=3D"gmail_attr"><br></div><div class=3D"gmail_attr">Hi Oleksii</div><d=
iv dir=3D"ltr" class=3D"gmail_attr"><br></div><div class=3D"gmail_attr">[so=
rry for the possible format issues]</div><div dir=3D"ltr" class=3D"gmail_at=
tr"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Implementat=
ion includes platform-specific smc handler for rcar3 platform.<br>
<br>
Signed-off-by: Oleksii Moisieiev &lt;<a href=3D"mailto:oleksii_moisieiev@ep=
am.com" target=3D"_blank">oleksii_moisieiev@epam.com</a>&gt;<br>
---<br>
=C2=A0xen/arch/arm/platforms/Makefile |=C2=A0 1 +<br>
=C2=A0xen/arch/arm/platforms/rcar3.c=C2=A0 | 46 +++++++++++++++++++++++++++=
++++++<br>
=C2=A02 files changed, 47 insertions(+)<br>
=C2=A0create mode 100644 xen/arch/arm/platforms/rcar3.c<br>
<br>
diff --git a/xen/arch/arm/platforms/Makefile b/xen/arch/arm/platforms/Makef=
ile<br>
index 8632f4115f..b64c25de6c 100644<br>
--- a/xen/arch/arm/platforms/Makefile<br>
+++ b/xen/arch/arm/platforms/Makefile<br>
@@ -4,6 +4,7 @@ obj-$(CONFIG_ALL32_PLAT) +=3D exynos5.o<br>
=C2=A0obj-$(CONFIG_ALL32_PLAT) +=3D midway.o<br>
=C2=A0obj-$(CONFIG_ALL32_PLAT) +=3D omap5.o<br>
=C2=A0obj-$(CONFIG_ALL32_PLAT) +=3D rcar2.o<br>
+obj-$(CONFIG_RCAR3) +=3D rcar3.o<br>
=C2=A0obj-$(CONFIG_ALL64_PLAT) +=3D seattle.o<br>
=C2=A0obj-$(CONFIG_ALL_PLAT)=C2=A0 =C2=A0+=3D sunxi.o<br>
=C2=A0obj-$(CONFIG_ALL64_PLAT) +=3D thunderx.o<br>
diff --git a/xen/arch/arm/platforms/rcar3.c b/xen/arch/arm/platforms/rcar3.=
c<br>
new file mode 100644<br>
index 0000000000..d740145c71<br>
--- /dev/null<br>
+++ b/xen/arch/arm/platforms/rcar3.c<br>
@@ -0,0 +1,46 @@<br>
+/*<br>
+ * xen/arch/arm/platforms/rcar3.c<br>
+ *<br>
+ * Renesas R-Car Gen3 specific settings<br>
+ *<br>
+ * Oleksii Moisieiev &lt;<a href=3D"mailto:oleksii_moisieiev@epam.com" tar=
get=3D"_blank">oleksii_moisieiev@epam.com</a>&gt;<br>
+ * Copyright (C) 2021 EPAM Systems<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify<br=
>
+ * it under the terms of the GNU General Public License as published by<br=
>
+ * the Free Software Foundation; either version 2 of the License, or<br>
+ * (at your option) any later version.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful,<br>
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the<br>
+ * GNU General Public License for more details.<br>
+ */<br>
+<br>
+#include &lt;asm/platform.h&gt;<br>
+<br>
+static bool rcar3_smc(struct cpu_user_regs *regs)<br>
+{<br>
+=C2=A0 =C2=A0 return false;<br>
+}<br>
+<br>
+static const char *const rcar3_dt_compat[] __initconst =3D<br>
+{<br>
+=C2=A0 =C2=A0 &quot;renesas,r8a7795&quot;,<br>
+=C2=A0 =C2=A0 &quot;renesas,r8a7796&quot;,<br></blockquote><div><br></div>=
<div><br></div><div>Please note that since Linux commit: &quot;9c9f7891093b=
02eb64ca4e1c7ab776a4296c058f soc: renesas: Identify R-Car M3-W+&quot;<br>th=
e compatible string for R-Car M3-W+ (ES3.0) SoC is &quot;renesas,r8a77961&q=
uot;. So in case we want to have vSCMI feature on this new SoC revision as =
well we will need<br>to extend the compatible list.=C2=A0<br></div><div><br=
></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 NULL<br>
+};<br>
+<br>
+PLATFORM_START(rcar3, &quot;Renesas R-Car Gen3&quot;)<br>
+=C2=A0 =C2=A0 .compatible =3D rcar3_dt_compat,<br>
+=C2=A0 =C2=A0 .smc =3D rcar3_smc<br>
+PLATFORM_END<br>
+<br>
+/*<br>
+ * Local variables:<br>
+ * mode: C<br>
+ * c-file-style: &quot;BSD&quot;<br>
+ * c-basic-offset: 4<br>
+ * indent-tabs-mode: nil<br>
+ * End:<br>
+ */<br>
-- <br>
2.27.0<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><span style=
=3D"background-color:rgb(255,255,255)"><font size=3D"2"><span style=3D"colo=
r:rgb(51,51,51);font-family:Arial,sans-serif">Regards,</span></font></span>=
</div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div><span style=3D"backg=
round-color:rgb(255,255,255)"><font size=3D"2">Oleksandr Tyshchenko</font><=
/span></div></div></div></div></div></div></div></div>

--000000000000178b5e05d32c56b8--

