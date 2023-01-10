Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 840356639FA
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 08:29:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474302.735401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF94L-0003bM-0N; Tue, 10 Jan 2023 07:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474302.735401; Tue, 10 Jan 2023 07:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF94K-0003ZE-TH; Tue, 10 Jan 2023 07:29:12 +0000
Received: by outflank-mailman (input) for mailman id 474302;
 Tue, 10 Jan 2023 07:29:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qhNV=5H=gmail.com=bobbyeshleman@srs-se1.protection.inumbo.net>)
 id 1pF94I-0003Z8-Fc
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 07:29:10 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77ef4fcd-90b8-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 08:29:08 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id fc4so26233009ejc.12
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jan 2023 23:29:07 -0800 (PST)
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
X-Inumbo-ID: 77ef4fcd-90b8-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9ssIX2bpuLjHtHr5+BBTQqOChORvzTDNQnsLLcvt2qg=;
        b=e7oCwnl55++94Q2FyIhXiOCmNMMWEE7hSeTcjnM0OwwZ7iZMByeN4dDjGkAaCzTSN+
         A+tUo3V6c6bqBLWWMJUZKKcPp79cNKGBrQ/1KRKyIb2mTPooruC9hx4w2QXm17FKfmmw
         eh3F0FZD4LFseycTQZF/n9uSMZqPRBU+oGrHj786Tx4tJSs9CWPLu9Ds6Iu0wjVGa0LU
         MQTmmPR0ka59gBy23Q6qvq4hRs7BvqTCWGUenKwuvKl/RhDtqGxEP2zBgLStq/e+/4VW
         dFAptn70skTjRrbIBGhG7AsqzPbMZN0IQklb2gZkFprPDWo7Il1U0/peARTjzbWAoAog
         dJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ssIX2bpuLjHtHr5+BBTQqOChORvzTDNQnsLLcvt2qg=;
        b=xA52JBM/GRL5wQkKmCkdRRSGrsHILgb04CVfeZDz8P6R+t81NZ/TI19BffyHGQU2BI
         W25O1P48NhipYuyZshkv16gDyvTOUuWHMWLHA44BU9vPqMhaoO/L4NdUaQBmLzpaQodr
         M+ba9LNiGR8dOryw13TL3mwJAtguLHSAVRuutGywdDSPyeRxGz/TYU9pEPl4Wyb6rmcy
         DqY/teP0cT64fnu6qP5gafBjYkXch0OraGTVhksOpV0AceT5RPLxFvFYVQxIzg3/WKIF
         zXvR9Cm+g7tamzH0dHTELXyE2ZdyfVvady+O3DsFNExgMTwzadEaV1D+iYGAriywgkW0
         HZ1w==
X-Gm-Message-State: AFqh2koK3fa8pGmnEFXFgtPugHVvDjLF9TFkwRxcb//h7HPB9dqqrfR9
	xXBQg053xeC2AiZlYJKQf1CKLYgrwKDezCJIdx8=
X-Google-Smtp-Source: AMrXdXs0ZjD9l52k6wjoRYK84dhQ5fuBp/z+R2mnzmEK3FIS0kye8yaVmQ+EiNEJQKbIhhqMW3V/y85D2ea9g8InJlM=
X-Received: by 2002:a17:906:ac2:b0:78d:dddb:3974 with SMTP id
 z2-20020a1709060ac200b0078ddddb3974mr6322536ejf.411.1673335747386; Mon, 09
 Jan 2023 23:29:07 -0800 (PST)
MIME-Version: 1.0
References: <cover.1673278109.git.oleksii.kurochko@gmail.com>
 <527727b2c9e26e6ef7714fe9a3fbe580caf1ae13.1673278109.git.oleksii.kurochko@gmail.com>
 <CAKmqyKNyRfAhyP-3uZwEf3OZEv5be4KNdGvNjUiQGu8w-vf_8g@mail.gmail.com>
In-Reply-To: <CAKmqyKNyRfAhyP-3uZwEf3OZEv5be4KNdGvNjUiQGu8w-vf_8g@mail.gmail.com>
From: Bobby Eshleman <bobby.eshleman@gmail.com>
Date: Mon, 9 Jan 2023 23:28:56 -0800
Message-ID: <CAKB00G3nVtcBppt2TJa-dFzz4TKqVT6B-1swjzkZwqsRkFxwsA@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] xen/riscv: introduce early_printk basic stuff
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Connor Davis <connojdavis@gmail.com>, Gianluca Guida <gianluca@rivosinc.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000d0230205f1e3d6f0"

--000000000000d0230205f1e3d6f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 9, 2023 at 4:28 PM Alistair Francis <alistair23@gmail.com>
wrote:

> On Tue, Jan 10, 2023 at 1:47 AM Oleksii Kurochko
> <oleksii.kurochko@gmail.com> wrote:
> >
> > The patch introduces a basic stuff of early_printk functionality
> > which will be enough to print 'hello from C environment".
> > early_printk() function was changed in comparison with original as
> > common isn't being built now so there is no vscnprintf.
> >
> > Because printk() relies on a serial driver (like the ns16550 driver)
> > and drivers require working virtual memory (ioremap()) there is not
> > print functionality early in Xen boot.
> >
> > This commit adds early printk implementation built on the putc SBI call=
.
> >
> > As sbi_console_putchar() is being already planned for deprecation
> > it is used temporary now and will be removed or reworked after
> > real uart will be ready.
>
> There was a discussion to add a new SBI putchar replacement. It
> doesn't seem to be completed yet, but there might be an SBI
> replacement for this in the future as well.
>
> Alistair
>

Are you referring to the Debug Console Extension (EID #0x4442434E "DBCN")=
=E2=80=9D?

https://lists.riscv.org/g/tech-prs/topic/96051183#84

Best,
Bobby


> >
> > Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V2:
> >     - add license to early_printk.c
> >     - add signed-off-by Bobby
> >     - add RISCV_32 to Kconfig.debug to EARLY_PRINTK config
> >     - update commit message
> >     - order the files alphabetically in Makefile
> > ---
> >  xen/arch/riscv/Kconfig.debug              |  7 +++++
> >  xen/arch/riscv/Makefile                   |  1 +
> >  xen/arch/riscv/early_printk.c             | 33 +++++++++++++++++++++++
> >  xen/arch/riscv/include/asm/early_printk.h | 12 +++++++++
> >  4 files changed, 53 insertions(+)
> >  create mode 100644 xen/arch/riscv/early_printk.c
> >  create mode 100644 xen/arch/riscv/include/asm/early_printk.h
> >
> > diff --git a/xen/arch/riscv/Kconfig.debug b/xen/arch/riscv/Kconfig.debu=
g
> > index e69de29bb2..6ba0bd1e5a 100644
> > --- a/xen/arch/riscv/Kconfig.debug
> > +++ b/xen/arch/riscv/Kconfig.debug
> > @@ -0,0 +1,7 @@
> > +config EARLY_PRINTK
> > +    bool "Enable early printk config"
> > +    default DEBUG
> > +    depends on RISCV_64 || RISCV_32
> > +    help
> > +
> > +      Enables early printk debug messages
> > diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> > index fd916e1004..1a4f1a6015 100644
> > --- a/xen/arch/riscv/Makefile
> > +++ b/xen/arch/riscv/Makefile
> > @@ -1,3 +1,4 @@
> > +obj-$(CONFIG_EARLY_PRINTK) +=3D early_printk.o
> >  obj-$(CONFIG_RISCV_64) +=3D riscv64/
> >  obj-y +=3D sbi.o
> >  obj-y +=3D setup.o
> > diff --git a/xen/arch/riscv/early_printk.c
> b/xen/arch/riscv/early_printk.c
> > new file mode 100644
> > index 0000000000..88da5169ed
> > --- /dev/null
> > +++ b/xen/arch/riscv/early_printk.c
> > @@ -0,0 +1,33 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * RISC-V early printk using SBI
> > + *
> > + * Copyright (C) 2021 Bobby Eshleman <bobbyeshleman@gmail.com>
> > + */
> > +#include <asm/sbi.h>
> > +#include <asm/early_printk.h>
> > +
> > +/*
> > + * TODO:
> > + *   sbi_console_putchar is already planned for deprication
> > + *   so it should be reworked to use UART directly.
> > +*/
> > +void early_puts(const char *s, size_t nr)
> > +{
> > +    while ( nr-- > 0 )
> > +    {
> > +        if (*s =3D=3D '\n')
> > +            sbi_console_putchar('\r');
> > +        sbi_console_putchar(*s);
> > +        s++;
> > +    }
> > +}
> > +
> > +void early_printk(const char *str)
> > +{
> > +    while (*str)
> > +    {
> > +        early_puts(str, 1);
> > +        str++;
> > +    }
> > +}
> > diff --git a/xen/arch/riscv/include/asm/early_printk.h
> b/xen/arch/riscv/include/asm/early_printk.h
> > new file mode 100644
> > index 0000000000..05106e160d
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/early_printk.h
> > @@ -0,0 +1,12 @@
> > +#ifndef __EARLY_PRINTK_H__
> > +#define __EARLY_PRINTK_H__
> > +
> > +#include <xen/early_printk.h>
> > +
> > +#ifdef CONFIG_EARLY_PRINTK
> > +void early_printk(const char *str);
> > +#else
> > +static inline void early_printk(const char *s) {};
> > +#endif
> > +
> > +#endif /* __EARLY_PRINTK_H__ */
> > --
> > 2.38.1
> >
> >
>

--000000000000d0230205f1e3d6f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div style=3D"background-color:rgba(0,0,0,0)!important;borde=
r-color:rgb(0,0,0)!important"><br><div class=3D"gmail_quote" style=3D"backg=
round-color:rgba(0,0,0,0)!important;border-color:rgb(0,0,0)!important"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 9, 2023 at 4:28 PM Alistair F=
rancis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1e=
x;border-left-color:rgb(204,204,204)">On Tue, Jan 10, 2023 at 1:47 AM Oleks=
ii Kurochko<br>
&lt;<a href=3D"mailto:oleksii.kurochko@gmail.com" target=3D"_blank">oleksii=
.kurochko@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The patch introduces a basic stuff of early_printk functionality<br>
&gt; which will be enough to print &#39;hello from C environment&quot;.<br>
&gt; early_printk() function was changed in comparison with original as<br>
&gt; common isn&#39;t being built now so there is no vscnprintf.<br>
&gt;<br>
&gt; Because printk() relies on a serial driver (like the ns16550 driver)<b=
r>
&gt; and drivers require working virtual memory (ioremap()) there is not<br=
>
&gt; print functionality early in Xen boot.<br>
&gt;<br>
&gt; This commit adds early printk implementation built on the putc SBI cal=
l.<br>
&gt;<br>
&gt; As sbi_console_putchar() is being already planned for deprecation<br>
&gt; it is used temporary now and will be removed or reworked after<br>
&gt; real uart will be ready.<br>
<br>
There was a discussion to add a new SBI putchar replacement. It<br>
doesn&#39;t seem to be completed yet, but there might be an SBI<br>
replacement for this in the future as well.<br>
<br>
Alistair<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto" style=3D"backgro=
und-color:rgba(0,0,0,0)!important;border-color:rgb(0,0,0)!important"><span =
style=3D"background-color:rgba(0,0,0,0);border-color:rgb(49,49,49)">Are you=
 referring to the=C2=A0</span><span style=3D"word-spacing:1px;color:rgb(49,=
49,49)">Debug Console Extension (EID #0x4442434E &quot;DBCN&quot;)=E2=80=9D=
?</span></div><div dir=3D"auto" style=3D"background-color:rgba(0,0,0,0);bor=
der-color:rgb(0,0,0)"><font style=3D"color:rgb(49,49,49)"><span style=3D"wo=
rd-spacing:1px"><br></span></font><span style=3D"word-spacing:1px;color:rgb=
(49,49,49)"><div><a href=3D"https://lists.riscv.org/g/tech-prs/topic/960511=
83#84">https://lists.riscv.org/g/tech-prs/topic/96051183#84</a></div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Best,</div><div dir=3D"auto">Bobby<=
/div></span></div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-st=
yle:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><br>
&gt;<br>
&gt; Signed-off-by: Bobby Eshleman &lt;<a href=3D"mailto:bobby.eshleman@gma=
il.com" target=3D"_blank">bobby.eshleman@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Oleksii Kurochko &lt;<a href=3D"mailto:oleksii.kurochko=
@gmail.com" target=3D"_blank">oleksii.kurochko@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; Changes in V2:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- add license to early_printk.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0- add signed-off-by Bobby<br>
&gt;=C2=A0 =C2=A0 =C2=A0- add RISCV_32 to Kconfig.debug to EARLY_PRINTK con=
fig<br>
&gt;=C2=A0 =C2=A0 =C2=A0- update commit message<br>
&gt;=C2=A0 =C2=A0 =C2=A0- order the files alphabetically in Makefile<br>
&gt; ---<br>
&gt;=C2=A0 xen/arch/riscv/Kconfig.debug=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 7 +++++<br>
&gt;=C2=A0 xen/arch/riscv/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 xen/arch/riscv/early_printk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 33 +++++++++++++++++++++++<br>
&gt;=C2=A0 xen/arch/riscv/include/asm/early_printk.h | 12 +++++++++<br>
&gt;=C2=A0 4 files changed, 53 insertions(+)<br>
&gt;=C2=A0 create mode 100644 xen/arch/riscv/early_printk.c<br>
&gt;=C2=A0 create mode 100644 xen/arch/riscv/include/asm/early_printk.h<br>
&gt;<br>
&gt; diff --git a/xen/arch/riscv/Kconfig.debug b/xen/arch/riscv/Kconfig.deb=
ug<br>
&gt; index e69de29bb2..6ba0bd1e5a 100644<br>
&gt; --- a/xen/arch/riscv/Kconfig.debug<br>
&gt; +++ b/xen/arch/riscv/Kconfig.debug<br>
&gt; @@ -0,0 +1,7 @@<br>
&gt; +config EARLY_PRINTK<br>
&gt; +=C2=A0 =C2=A0 bool &quot;Enable early printk config&quot;<br>
&gt; +=C2=A0 =C2=A0 default DEBUG<br>
&gt; +=C2=A0 =C2=A0 depends on RISCV_64 || RISCV_32<br>
&gt; +=C2=A0 =C2=A0 help<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Enables early printk debug messages<br>
&gt; diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile<br>
&gt; index fd916e1004..1a4f1a6015 100644<br>
&gt; --- a/xen/arch/riscv/Makefile<br>
&gt; +++ b/xen/arch/riscv/Makefile<br>
&gt; @@ -1,3 +1,4 @@<br>
&gt; +obj-$(CONFIG_EARLY_PRINTK) +=3D early_printk.o<br>
&gt;=C2=A0 obj-$(CONFIG_RISCV_64) +=3D riscv64/<br>
&gt;=C2=A0 obj-y +=3D sbi.o<br>
&gt;=C2=A0 obj-y +=3D setup.o<br>
&gt; diff --git a/xen/arch/riscv/early_printk.c b/xen/arch/riscv/early_prin=
tk.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..88da5169ed<br>
&gt; --- /dev/null<br>
&gt; +++ b/xen/arch/riscv/early_printk.c<br>
&gt; @@ -0,0 +1,33 @@<br>
&gt; +/* SPDX-License-Identifier: GPL-2.0 */<br>
&gt; +/*<br>
&gt; + * RISC-V early printk using SBI<br>
&gt; + *<br>
&gt; + * Copyright (C) 2021 Bobby Eshleman &lt;<a href=3D"mailto:bobbyeshle=
man@gmail.com" target=3D"_blank">bobbyeshleman@gmail.com</a>&gt;<br>
&gt; + */<br>
&gt; +#include &lt;asm/sbi.h&gt;<br>
&gt; +#include &lt;asm/early_printk.h&gt;<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * TODO:<br>
&gt; + *=C2=A0 =C2=A0sbi_console_putchar is already planned for deprication=
<br>
&gt; + *=C2=A0 =C2=A0so it should be reworked to use UART directly.<br>
&gt; +*/<br>
&gt; +void early_puts(const char *s, size_t nr)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 while ( nr-- &gt; 0 )<br>
&gt; +=C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*s =3D=3D &#39;\n&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sbi_console_putchar(&#39;\r=
&#39;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sbi_console_putchar(*s);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s++;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +void early_printk(const char *str)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 while (*str)<br>
&gt; +=C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 early_puts(str, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 str++;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; diff --git a/xen/arch/riscv/include/asm/early_printk.h b/xen/arch/risc=
v/include/asm/early_printk.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..05106e160d<br>
&gt; --- /dev/null<br>
&gt; +++ b/xen/arch/riscv/include/asm/early_printk.h<br>
&gt; @@ -0,0 +1,12 @@<br>
&gt; +#ifndef __EARLY_PRINTK_H__<br>
&gt; +#define __EARLY_PRINTK_H__<br>
&gt; +<br>
&gt; +#include &lt;xen/early_printk.h&gt;<br>
&gt; +<br>
&gt; +#ifdef CONFIG_EARLY_PRINTK<br>
&gt; +void early_printk(const char *str);<br>
&gt; +#else<br>
&gt; +static inline void early_printk(const char *s) {};<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +#endif /* __EARLY_PRINTK_H__ */<br>
&gt; --<br>
&gt; 2.38.1<br>
&gt;<br>
&gt;<br>
</blockquote></div></div>

--000000000000d0230205f1e3d6f0--

