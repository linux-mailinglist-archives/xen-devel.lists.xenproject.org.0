Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B6D658751
	for <lists+xen-devel@lfdr.de>; Wed, 28 Dec 2022 23:32:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469575.728953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAeyG-0006WY-9W; Wed, 28 Dec 2022 22:32:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469575.728953; Wed, 28 Dec 2022 22:32:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAeyG-0006Tv-6f; Wed, 28 Dec 2022 22:32:24 +0000
Received: by outflank-mailman (input) for mailman id 469575;
 Wed, 28 Dec 2022 22:32:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8kIe=42=gmail.com=julien.grall@srs-se1.protection.inumbo.net>)
 id 1pAeyE-0006Tn-Ee
 for xen-devel@lists.xenproject.org; Wed, 28 Dec 2022 22:32:22 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e07971a-86ff-11ed-8fd4-01056ac49cbb;
 Wed, 28 Dec 2022 23:32:21 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id i15so24585513edf.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Dec 2022 14:32:20 -0800 (PST)
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
X-Inumbo-ID: 7e07971a-86ff-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L6Oe9gh+QCMLZ80pgdkjv0IZjE/LDgrYSjhGU+VbuqQ=;
        b=n/Osieg8TAs42R8BZf58Os5c7XjBa8ga1IE0+JV9YuF/gptXVe8L/J6JrRFBxwYBr/
         cYhJCCfuMmrhCfypXGTerCxRWg16qcUHYGim5MRu6sLK30MGa6ORu4zbee4kNaxZWyHk
         NP+u/dOrWvtP5SKxkqn37J6IAfH1S8DrYS+DYE9Kfic6lzrItNccRFV3v2piH01gc55t
         y6YDzRA4B6B7XdE+wm8QP21vPt1Z44jWhlD2uKVwqpGQXgPs+9+J9Q6vSG8kLjS6Qtit
         UnonNnGxP8FGfHu4SgfIpao5t6BzN/Aab3BLt/JYr4zOxUcxmx3+Py1dKCxVKHlYe5TU
         Pdug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L6Oe9gh+QCMLZ80pgdkjv0IZjE/LDgrYSjhGU+VbuqQ=;
        b=n5NE+f4fzVCIg4t/vuouvd/A06PTIuJJ9SD99W9Oh+eflVUigha0ESgimQ1X9lsbdE
         U5WYkYy1iz9iBGyZG3a2c+W+xs3vK6iblJW/xlwMLOH5GN8Nncac3YJ6w78NE3CQ5jEP
         yRWbTdDZaBPImeiN/j71ffy8XdhCECTvjxKt9nZS7+hzY6pqEu8rwW60tbeCQq1ekP8n
         jIX7WGaGb0YFkk8i1k3XVpIWtiq/zkTCuJZ3loH68Ua2V5DuITki8uln5XIPqmffDGFf
         8VnlMVYJw2r/PtnlQj2CaEyYa0f9VeREQA2H/HMz36y/ovibmGRbsNpau0pDSpD2Eexi
         Tkfg==
X-Gm-Message-State: AFqh2kpfbhcyXMViCl+J2g1pRoa2zezNogG5wMRdjS/pq3Ii0/XNiiSv
	x27zixEKCYBr549AkYgdDCq+fdNPgPDJTsHCwDk=
X-Google-Smtp-Source: AMrXdXuYj891U9GSowLcMIBKpQ0NpCwZ0yFkWKB6u7wS/Xc+rWFnlVPn166cUMsjCchw+YIaxP2QMT1Voj3RgKvNLAQ=
X-Received: by 2002:a05:6402:895:b0:46b:2979:7397 with SMTP id
 e21-20020a056402089500b0046b29797397mr3416500edy.332.1672266740246; Wed, 28
 Dec 2022 14:32:20 -0800 (PST)
MIME-Version: 1.0
References: <cover.1671789736.git.oleksii.kurochko@gmail.com>
 <5d5ec5fbd8787ed8f86bf84a5ac291d07a20b307.1671789736.git.oleksii.kurochko@gmail.com>
 <3343c927-0f27-e285-5b6e-281c61939bb4@xen.org> <43d726761900ba3d8b4919fc29fe7cb1991ac656.camel@gmail.com>
In-Reply-To: <43d726761900ba3d8b4919fc29fe7cb1991ac656.camel@gmail.com>
From: Julien Grall <julien.grall@gmail.com>
Date: Wed, 28 Dec 2022 22:22:44 +0000
Message-ID: <CAF3u54A+Qqn+7dyBqh8utnN04b-DYkHbtL5DEEWuw9HQ2EQzTQ@mail.gmail.com>
Subject: Re: [XEN PATCH v1 1/4] arch/riscv: initial RISC-V support to
 build/run minimal Xen
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@citrix.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Connor Davis <connojdavis@gmail.com>, Gianluca Guida <gianluca@rivosinc.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000005ae3905f0eaf1a7"

--00000000000005ae3905f0eaf1a7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Dec 2022 at 12:14, Oleksii <oleksii.kurochko@gmail.com> wrote:

> >
> > > +/*
> > > + * PAGE_SIZE is defined in <{asm,xen}/page-*.h> but to
> > > + * remove unnecessary headers for minimal
> > > + * build headers it will be better to set PAGE_SIZE
> > > + * explicitly.
> >
> > TBH, I think this is a shortcut that is unnecessary and will only
> > introduce extra churn in the future (for instance, you will need to
> > modify the include in xen.lds.S).
> >
> > But I am not the maintainer, so I will leave that decision to them
> > whether this is acceptable.
>
> I didn't get what you mean by a shortcut here.


config.h is automatically included everywhere. So anything defined in the
header will also be available everywhere. Once you move the definition in a
separate header, then you will have have to chase where the definition is
used.

An alternative would be to include the new header in config.h. However,
this is not always wanted (we are trying to limit the scope of some
definitions).

So maybe you are saving a few minutes now. But you will spend a lot more to
chase the places where the new header needs to be included.


> >
> > > + *
> > > + * TODO: remove it when <asm/page-*.h> will be needed
> > > + *       defintion of PAGE_SIZE should be remove from
> >
> > s/defintion/definition/
>
> Thanks for finding the typo. Will update it in the next version of
> the patch.
>
> >
> > > + *       this header.
> > > + */
> > > +#define PAGE_SIZE       4096 > +
> > >   #endif /* __RISCV_CONFIG_H__ */
> > >   /*
> > >    * Local variables:
> > > diff --git a/xen/arch/riscv/include/asm/types.h
> > > b/xen/arch/riscv/include/asm/types.h
> > > new file mode 100644
> > > index 0000000000..afbca6b15c
> > > --- /dev/null
> > > +++ b/xen/arch/riscv/include/asm/types.h
> > > @@ -0,0 +1,11 @@
> > > +#ifndef __TYPES_H__
> > > +#define __TYPES_H__
> > > +
> > > +/*
> > > + *
> > > + * asm/types.h is required for xen-syms.S file which
> > > + * is produced by tools/symbols.
> > > + *
> > > + */
> > > +
> > > +#endif
> > > diff --git a/xen/arch/riscv/riscv64/Makefile
> > > b/xen/arch/riscv/riscv64/Makefile
> > > index 15a4a65f66..3340058c08 100644
> > > --- a/xen/arch/riscv/riscv64/Makefile
> > > +++ b/xen/arch/riscv/riscv64/Makefile
> > > @@ -1 +1 @@
> > > -extra-y +=3D head.o
> > > +obj-y +=3D head.o
> >
> > This changes want to be explained. So does...
>
> RISC-V 64 would be supported now and minimal build is built
> now only obj-y stuff.


I am a bit confused. It thought what was checked in was meant to work. Did
I misremembered?

>
>
> >
> > > diff --git a/xen/arch/riscv/riscv64/head.S
> > > b/xen/arch/riscv/riscv64/head.S
> > > index 0dbc27ba75..0330b29c01 100644
> > > --- a/xen/arch/riscv/riscv64/head.S
> > > +++ b/xen/arch/riscv/riscv64/head.S
> > > @@ -1,6 +1,6 @@
> > >   #include <asm/config.h>
> > >
> > > -        .text
> > > +        .section .text.header, "ax", %progbits
> >
> > ... AFAICT this is to match the recent change in the build system.
>
> I am not sure that I get you here but it was done to make 'start'
> instructions to be the first instructions that will be executed and
> to make 'start' symbol to be the first in xen-syms.map file otherwise
> gdb shows that Xen starts from the wrong instructions, fails to find
> correct source file and goes crazy.


When the file head.S was originally created, there was no section
.text.header. Instead head.S was included at the top with some different
runes.

>
> >
> > > +  } :text
> > > +
> >
> > I am assuming you are going to add .init.* afterwards?
> >
> > > +  . =3D ALIGN(PAGE_SIZE);
> > > +  .bss : {
> > > +       __bss_start =3D .;
> > > +       *(.bss .bss.*)
> > > +       . =3D ALIGN(POINTER_ALIGN);
> > > +       __bss_end =3D .;
> >
> > Same as .data, I would recommend to properly populate it.
>
> Do you mean to add .bss.stack_aligned, .bss.page_aligned, .bss.percpu*?
> One of the reasons they were skipped is they aren't used now and one
> more reason if to believe xen.lds.S file from ARM
> .bss.percpu.read_mostly should be aligned by SMP_CACHE_BYTES which
> requires dummy <asm/cache.h> (or not ?) which will increase the patch
> with unneeded stuff for now.


I will answer your reply to Alistair here at the same time.

The problem is .bss.* will include any section start with .bss.. IOW
section like .bss.page_aligned will also be covered and therefore you will
not get a linker failure.

Instead , the linker will fold the section wherever it wants. Therefore,
there is no guarantee, the content will be page aligned. When using the
binary, you could end up with weird behavior that will be hard to debug.

I understand you are trying to get a basic build. But, I feel the linker is
not something you want to quickly rush. 1h may turn into hours lost in a
few months because not everyone may remember that you didn=E2=80=99t specia=
l case
.bss.page_aligned.

Short of suggesting to have a common linker script,  you could simply not
use * (IOW explictly list the section).  With that, you should get a
linking warning/error if the section is not listed.

Cheers,
--=20
Julien Grall

--00000000000005ae3905f0eaf1a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div style=3D"background-color:rgba(0,0,0,0)!important;borde=
r-color:rgb(255,255,255)!important;color:rgb(255,255,255)!important"><br><d=
iv class=3D"gmail_quote" style=3D"background-color:rgba(0,0,0,0)!important;=
border-color:rgb(255,255,255)!important;color:rgb(255,255,255)!important"><=
div dir=3D"ltr" class=3D"gmail_attr">On Mon, 26 Dec 2022 at 12:14, Oleksii =
&lt;<a href=3D"mailto:oleksii.kurochko@gmail.com">oleksii.kurochko@gmail.co=
m</a>&gt; wrote:</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1=
ex;border-left-color:rgb(204,204,204)" dir=3D"auto">
&gt; <br>
&gt; &gt; +/*<br>
&gt; &gt; + * PAGE_SIZE is defined in &lt;{asm,xen}/page-*.h&gt; but to<br>
&gt; &gt; + * remove unnecessary headers for minimal<br>
&gt; &gt; + * build headers it will be better to set PAGE_SIZE<br>
&gt; &gt; + * explicitly.<br>
&gt; <br>
&gt; TBH, I think this is a shortcut that is unnecessary and will only <br>
&gt; introduce extra churn in the future (for instance, you will need to <b=
r>
&gt; modify the include in xen.lds.S).<br>
&gt; <br>
&gt; But I am not the maintainer, so I will leave that decision to them <br=
>
&gt; whether this is acceptable.<br>
<br>
I didn&#39;t get what you mean by a shortcut here.</blockquote><div dir=3D"=
auto"><br></div><div dir=3D"auto">config.h is automatically included everyw=
here. So anything defined in the header will also be available everywhere. =
Once you move the definition in a separate header, then you will have have =
to chase where the definition is used.</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">An alternative would be to include the new header in config.=
h. However, this is not always wanted (we are trying to limit the scope of =
some definitions).</div><div dir=3D"auto"><br></div><div dir=3D"auto">So ma=
ybe you are saving a few minutes now. But you will spend a lot more to chas=
e the places where the new header needs to be included.</div><div dir=3D"au=
to"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;borde=
r-left-color:rgb(204,204,204)" dir=3D"auto">
<br>
&gt; <br>
&gt; &gt; + *<br>
&gt; &gt; + * TODO: remove it when &lt;asm/page-*.h&gt; will be needed<br>
&gt; &gt; + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 defintion of PAGE_SIZE sh=
ould be remove from<br>
&gt; <br>
&gt; s/defintion/definition/<br>
<br>
Thanks for finding the typo. Will update it in the next version of<br>
the patch.<br>
<br>
&gt; <br>
&gt; &gt; + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 this header.<br>
&gt; &gt; + */<br>
&gt; &gt; +#define PAGE_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4096 &gt; =
+<br>
&gt; &gt; =C2=A0 #endif /* __RISCV_CONFIG_H__ */<br>
&gt; &gt; =C2=A0 /*<br>
&gt; &gt; =C2=A0=C2=A0 * Local variables:<br>
&gt; &gt; diff --git a/xen/arch/riscv/include/asm/types.h<br>
&gt; &gt; b/xen/arch/riscv/include/asm/types.h<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..afbca6b15c<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/xen/arch/riscv/include/asm/types.h<br>
&gt; &gt; @@ -0,0 +1,11 @@<br>
&gt; &gt; +#ifndef __TYPES_H__<br>
&gt; &gt; +#define __TYPES_H__<br>
&gt; &gt; +<br>
&gt; &gt; +/*<br>
&gt; &gt; + *<br>
&gt; &gt; + * asm/types.h is required for xen-syms.S file which<br>
&gt; &gt; + * is produced by tools/symbols.<br>
&gt; &gt; + *<br>
&gt; &gt; + */<br>
&gt; &gt; +<br>
&gt; &gt; +#endif<br>
&gt; &gt; diff --git a/xen/arch/riscv/riscv64/Makefile<br>
&gt; &gt; b/xen/arch/riscv/riscv64/Makefile<br>
&gt; &gt; index 15a4a65f66..3340058c08 100644<br>
&gt; &gt; --- a/xen/arch/riscv/riscv64/Makefile<br>
&gt; &gt; +++ b/xen/arch/riscv/riscv64/Makefile<br>
&gt; &gt; @@ -1 +1 @@<br>
&gt; &gt; -extra-y +=3D head.o<br>
&gt; &gt; +obj-y +=3D head.o<br>
&gt; <br>
&gt; This changes want to be explained. So does...<br>
<br>
RISC-V 64 would be supported now and minimal build is built<br>
now only obj-y stuff.</blockquote><div dir=3D"auto"><br></div><div dir=3D"a=
uto">I am a bit confused. It thought what was checked in was meant to work.=
 Did I misremembered?</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-l=
eft:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
&gt; <br>
&gt; &gt; diff --git a/xen/arch/riscv/riscv64/head.S<br>
&gt; &gt; b/xen/arch/riscv/riscv64/head.S<br>
&gt; &gt; index 0dbc27ba75..0330b29c01 100644<br>
&gt; &gt; --- a/xen/arch/riscv/riscv64/head.S<br>
&gt; &gt; +++ b/xen/arch/riscv/riscv64/head.S<br>
&gt; &gt; @@ -1,6 +1,6 @@<br>
&gt; &gt; =C2=A0 #include &lt;asm/config.h&gt;<br>
&gt; &gt; =C2=A0 <br>
&gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .text<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .section .text.header=
, &quot;ax&quot;, %progbits<br>
&gt; <br>
&gt; ... AFAICT this is to match the recent change in the build system.<br>
<br>
I am not sure that I get you here but it was done to make &#39;start&#39;<b=
r>
instructions to be the first instructions that will be executed and<br>
to make &#39;start&#39; symbol to be the first in xen-syms.map file otherwi=
se<br>
gdb shows that Xen starts from the wrong instructions, fails to find<br>
correct source file and goes crazy.</blockquote><div dir=3D"auto"><br></div=
><div dir=3D"auto">When the file head.S was originally created, there was n=
o section .text.header. Instead head.S was included at the top with some di=
fferent runes.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex=
;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
&gt; <br>
&gt; &gt; +=C2=A0 } :text<br>
&gt; &gt; +<br>
&gt; <br>
&gt; I am assuming you are going to add .init.* afterwards?<br>
&gt; <br>
&gt; &gt; +=C2=A0 . =3D ALIGN(PAGE_SIZE);<br>
&gt; &gt; +=C2=A0 .bss : {<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __bss_start =3D .;<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.bss .bss.*)<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D ALIGN(POINTER_ALIGN);=
<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __bss_end =3D .;<br>
&gt; <br>
&gt; Same as .data, I would recommend to properly populate it.<br>
<br>
Do you mean to add .bss.stack_aligned, .bss.page_aligned, .bss.percpu*?<br>
One of the reasons they were skipped is they aren&#39;t used now and one<br=
>
more reason if to believe xen.lds.S file from ARM<br>
.bss.percpu.read_mostly should be aligned by SMP_CACHE_BYTES which<br>
requires dummy &lt;asm/cache.h&gt; (or not ?) which will increase the patch=
<br>
with unneeded stuff for now. </blockquote><div dir=3D"auto"><br></div><div =
dir=3D"auto">I will answer your reply to Alistair here at the same time.</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">The problem is .bss.* will=
 include any section start with .bss.. IOW section like .bss.page_aligned w=
ill also be covered and therefore you will not get a linker failure.</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Instead , the linker will fold=
 the section wherever it wants. Therefore, there is no guarantee, the conte=
nt will be page aligned. When using the binary, you could end up with weird=
 behavior that will be hard to debug.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">I understand you are trying to get a basic build. But, I feel=
 the linker is not something you want to quickly rush. 1h may turn into hou=
rs lost in a few months because not everyone may remember that you didn=E2=
=80=99t special case .bss.page_aligned.</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Short of suggesting to have a common linker script, =C2=A0y=
ou could simply not use * (IOW explictly list the section).=C2=A0 With that=
, you should get a linking warning/error if the section is not listed.</div=
><div dir=3D"auto"><br></div><div dir=3D"auto" style=3D"background-color:rg=
ba(0,0,0,0)!important;border-color:rgb(255,255,255)!important;color:rgb(255=
,255,255)!important"><font style=3D"border-left-color:rgb(204,204,204);colo=
r:rgb(0,0,0)">Cheers,</font></div></div></div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">Julien Grall</div>

--00000000000005ae3905f0eaf1a7--

