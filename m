Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D389B670EA2
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 01:33:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480034.744197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHwOJ-0002JL-KR; Wed, 18 Jan 2023 00:33:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480034.744197; Wed, 18 Jan 2023 00:33:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHwOJ-0002Gl-HG; Wed, 18 Jan 2023 00:33:23 +0000
Received: by outflank-mailman (input) for mailman id 480034;
 Wed, 18 Jan 2023 00:33:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fuL9=5P=gmail.com=julien.grall@srs-se1.protection.inumbo.net>)
 id 1pHwOI-0002Gf-Ao
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 00:33:22 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4c597d2-96c7-11ed-b8d0-410ff93cb8f0;
 Wed, 18 Jan 2023 01:33:19 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id ss4so72188349ejb.11
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jan 2023 16:33:19 -0800 (PST)
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
X-Inumbo-ID: b4c597d2-96c7-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0O0fNqSjOCmHJ7YEyu+NfYWhs4mN0JgFNhe8XAV3gEQ=;
        b=ZyXIEH8s2WcKyX/TKVAbw3URKTjTCTlSjs5/5XKJiVHD6k+zjAIMxlXVcxFv8K6cWE
         yl4AEEQI5lgg12JN51gNzyH235Fo9GOMGtsctMClC+LbYiSKVaLonAEhOfGy6ecRIQQR
         BDhi915vn82g05YELOvD17eQQLPpk680qkeoZJnnmQaizqa0g+r9AhRhzmOY+n1SjFui
         u6+JdPGUHCEjIgGSJ5PHgmxQcjgcF4B/2MOJq3v7aPP4wSGvLUdc8F0DlD1+DR4eZKSX
         i1ulw6KnTt6hQYOnw/a77AqWHdGvcswd3Xh6M9llXEi/0+x+nSpY4oA7pNBIpCEjGDN5
         6laQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0O0fNqSjOCmHJ7YEyu+NfYWhs4mN0JgFNhe8XAV3gEQ=;
        b=U7qsrS+mQH/n9Bc+F0frM54UWJ0m8yL9ODLnEy/gm0XQy7LDIPw+KqKe3ncWD27X1S
         9zAjNnxtH4nPGUTbAucrqF5no1/Sjw4kjyd6hfKOJJh8948FmF0okNTrnoVrmd2f4K/G
         odblHVQ86RZcyq6NXJIsCC7flrp3zHmZMFYec8ZVojkQ3oKvtL09VWQdLDMcWFbVnqTI
         cyV+fNNmBVnkpPlgOqBWT66jQSZPmANhhgFl9KmqOekjxG251Ybmc56j4zUdZuzWX89s
         L/35nsFxkrr0Qs9Xw2ogHsGuxkWGFquV9J1ep7NyZ46wQjwVaY5uiwU8xrrGc3WxmdO4
         OTBg==
X-Gm-Message-State: AFqh2kpH3HJ8NYyAqO+wVGMs2GCthXvXX6i8FlDKxC5DW5HhupXGIwtL
	FyxFrNgzLpHwya/x9gTQU6hEYXy5O14586yIqZU=
X-Google-Smtp-Source: AMrXdXtc59Xba6R6XpxF4vSslUNprZYwfNUw6kAL7Am0ntV8BN41cLM7g0CCCV91VFvu0+ec/6NCNVE5UmzXEXFufrs=
X-Received: by 2002:a17:906:5c8:b0:86b:914a:572 with SMTP id
 t8-20020a17090605c800b0086b914a0572mr446015ejt.39.1674001999039; Tue, 17 Jan
 2023 16:33:19 -0800 (PST)
MIME-Version: 1.0
References: <cover.1673877778.git.oleksii.kurochko@gmail.com>
 <915bd184c6648a1a3bf0ac6a79b5274972bb33dd.1673877778.git.oleksii.kurochko@gmail.com>
 <d0cabe82-315e-408c-7364-33e2b5093ee6@citrix.com>
In-Reply-To: <d0cabe82-315e-408c-7364-33e2b5093ee6@citrix.com>
From: Julien Grall <julien.grall@gmail.com>
Date: Wed, 18 Jan 2023 00:33:08 +0000
Message-ID: <CAF3u54C2ewEfBN+ZT6VPaVu4vsqS_+12gr3YJ_jsg1sGHDhZ1A@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] xen/riscv: introduce early_printk basic stuff
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Bobby Eshleman <bobby.eshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, 
	Gianluca Guida <gianluca@rivosinc.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="00000000000081931c05f27ef684"

--00000000000081931c05f27ef684
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 17 Jan 2023 at 23:57, Andrew Cooper <Andrew.Cooper3@citrix.com>
wrote:

> On 16/01/2023 2:39 pm, Oleksii Kurochko wrote:
> > diff --git a/xen/arch/riscv/Kconfig.debug b/xen/arch/riscv/Kconfig.debu=
g
> > index e69de29bb2..e139e44873 100644
> > --- a/xen/arch/riscv/Kconfig.debug
> > +++ b/xen/arch/riscv/Kconfig.debug
> > @@ -0,0 +1,6 @@
> > +config EARLY_PRINTK
> > +    bool "Enable early printk"
> > +    default DEBUG
> > +    help
> > +
> > +      Enables early printk debug messages
>
> Kconfig indentation is a little hard to get used to.
>
> It's one tab for the main block, and one tab + 2 spaces for the help text=
.
>
> Also, drop the blank line after help.
>
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
> > index 0000000000..6bc29a1942
> > --- /dev/null
> > +++ b/xen/arch/riscv/early_printk.c
> > @@ -0,0 +1,45 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * RISC-V early printk using SBI
> > + *
> > + * Copyright (C) 2021 Bobby Eshleman <bobbyeshleman@gmail.com>
> > + */
> > +#include <asm/early_printk.h>
> > +#include <asm/sbi.h>
> > +
> > +/*
> > + * early_*() can be called from head.S with MMU-off.
> > + *
> > + * The following requiremets should be honoured for early_*() to
> > + * work correctly:
> > + *    It should use PC-relative addressing for accessing symbols.
> > + *    To achieve that GCC cmodel=3Dmedany should be used.
> > + */
> > +#ifndef __riscv_cmodel_medany
> > +#error "early_*() can be called from head.S before relocate so it
> should not use absolute addressing."
> > +#endif
>
> This is incorrect.


Aside the part about the relocation, I do not see what is wrong with it
(see below)

>
>
> What *this* file is compiled with has no bearing on how head.S calls
> us.  The RISC-V documentation explaining __riscv_cmodel_medany vs
> __riscv_cmodel_medlow calls this point out specifically.  There's
> nothing you can put here to check that head.S gets compiled with medany.


I believe you misunderstood the goal here. It is not to check how head.S
will call it but to ensure the function is safe to be called when the MMU
is off (e.g VA !=3D VA).


>
> Right now, there's nothing in this file dependent on either mode, and
> it's not liable to change in the short term.


The whole point is to make sure this don=E2=80=99t change without us knowin=
g.


  Furthermore, Xen isn't
> doing any relocation in the first place.
>
> We will want to support XIP in due course, and that will be compiled
> __riscv_cmodel_medlow, which is a fine and legitimate usecase.
>
>
> The build system sets the model up consistently.  All you are doing by
> putting this in is creating work that someone is going to have to delete
> for legitimate reasons in the future.



Are you saying that a code compiled with medlow can also work with MMU off
and no relocation needed?

If not, then the check is correct. It would avoid hours of debugging=E2=80=
=A6

Cheers,


>
> > diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> > index 13e24e2fe1..9c9412152a 100644
> > --- a/xen/arch/riscv/setup.c
> > +++ b/xen/arch/riscv/setup.c
> > @@ -1,13 +1,17 @@
> >  #include <xen/compile.h>
> >  #include <xen/init.h>
> >
> > +#include <asm/early_printk.h>
> > +
> >  /* Xen stack for bringing up the first CPU. */
> >  unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
> >      __aligned(STACK_SIZE);
> >
> >  void __init noreturn start_xen(void)
> >  {
> > -    for ( ;; )
> > +    early_printk("Hello from C env\n");
> > +
> > +    for ( ; ; )
>
> Rebasing error?
>
> ~Andrew
>
--=20
Julien Grall

--00000000000081931c05f27ef684
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, 17 Jan 2023 at 23:57, Andrew Cooper &lt;<a href=3D"=
mailto:Andrew.Cooper3@citrix.com">Andrew.Cooper3@citrix.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-lef=
t-color:rgb(204,204,204)">On 16/01/2023 2:39 pm, Oleksii Kurochko wrote:<br=
>
&gt; diff --git a/xen/arch/riscv/Kconfig.debug b/xen/arch/riscv/Kconfig.deb=
ug<br>
&gt; index e69de29bb2..e139e44873 100644<br>
&gt; --- a/xen/arch/riscv/Kconfig.debug<br>
&gt; +++ b/xen/arch/riscv/Kconfig.debug<br>
&gt; @@ -0,0 +1,6 @@<br>
&gt; +config EARLY_PRINTK<br>
&gt; +=C2=A0 =C2=A0 bool &quot;Enable early printk&quot;<br>
&gt; +=C2=A0 =C2=A0 default DEBUG<br>
&gt; +=C2=A0 =C2=A0 help<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Enables early printk debug messages<br>
<br>
Kconfig indentation is a little hard to get used to.<br>
<br>
It&#39;s one tab for the main block, and one tab + 2 spaces for the help te=
xt.<br>
<br>
Also, drop the blank line after help.<br>
<br>
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
&gt; index 0000000000..6bc29a1942<br>
&gt; --- /dev/null<br>
&gt; +++ b/xen/arch/riscv/early_printk.c<br>
&gt; @@ -0,0 +1,45 @@<br>
&gt; +/* SPDX-License-Identifier: GPL-2.0 */<br>
&gt; +/*<br>
&gt; + * RISC-V early printk using SBI<br>
&gt; + *<br>
&gt; + * Copyright (C) 2021 Bobby Eshleman &lt;<a href=3D"mailto:bobbyeshle=
man@gmail.com" target=3D"_blank">bobbyeshleman@gmail.com</a>&gt;<br>
&gt; + */<br>
&gt; +#include &lt;asm/early_printk.h&gt;<br>
&gt; +#include &lt;asm/sbi.h&gt;<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * early_*() can be called from head.S with MMU-off.<br>
&gt; + *<br>
&gt; + * The following requiremets should be honoured for early_*() to<br>
&gt; + * work correctly:<br>
&gt; + *=C2=A0 =C2=A0 It should use PC-relative addressing for accessing sy=
mbols.<br>
&gt; + *=C2=A0 =C2=A0 To achieve that GCC cmodel=3Dmedany should be used.<b=
r>
&gt; + */<br>
&gt; +#ifndef __riscv_cmodel_medany<br>
&gt; +#error &quot;early_*() can be called from head.S before relocate so i=
t should not use absolute addressing.&quot;<br>
&gt; +#endif<br>
<br>
This is incorrect.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto=
">Aside the part about the relocation, I do not see what is wrong with it (=
see below)</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bor=
der-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
What *this* file is compiled with has no bearing on how head.S calls<br>
us.=C2=A0 The RISC-V documentation explaining __riscv_cmodel_medany vs<br>
__riscv_cmodel_medlow calls this point out specifically.=C2=A0 There&#39;s<=
br>
nothing you can put here to check that head.S gets compiled with medany.</b=
lockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I believe you misun=
derstood the goal here. It is not to check how head.S will call it but to e=
nsure the function is safe to be called when the MMU is off (e.g VA !=3D VA=
).</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Right now, there&#39;s nothing in this file dependent on either mode, and<b=
r>
it&#39;s not liable to change in the short term.</blockquote><div dir=3D"au=
to"><br></div><div dir=3D"auto">The whole point is to make sure this don=E2=
=80=99t change without us knowing.=C2=A0</div><div dir=3D"auto"><br></div><=
div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-l=
eft:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto">=C2=A0 Furthermore=
, Xen isn&#39;t<br>
doing any relocation in the first place.<br>
<br>
We will want to support XIP in due course, and that will be compiled<br>
__riscv_cmodel_medlow, which is a fine and legitimate usecase.<br>
<br>
<br>
The build system sets the model up consistently.=C2=A0 All you are doing by=
<br>
putting this in is creating work that someone is going to have to delete<br=
>
for legitimate reasons in the future.</blockquote><div dir=3D"auto"><br></d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">Are you saying that a code=
 compiled with medlow can also work with MMU off and no relocation needed?<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">If not, then the check i=
s correct. It would avoid hours of debugging=E2=80=A6</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Cheers,</div><div dir=3D"auto"><br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(2=
04,204,204)" dir=3D"auto"><br>
<br>
&gt; diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c<br>
&gt; index 13e24e2fe1..9c9412152a 100644<br>
&gt; --- a/xen/arch/riscv/setup.c<br>
&gt; +++ b/xen/arch/riscv/setup.c<br>
&gt; @@ -1,13 +1,17 @@<br>
&gt;=C2=A0 #include &lt;xen/compile.h&gt;<br>
&gt;=C2=A0 #include &lt;xen/init.h&gt;<br>
&gt;=C2=A0 <br>
&gt; +#include &lt;asm/early_printk.h&gt;<br>
&gt; +<br>
&gt;=C2=A0 /* Xen stack for bringing up the first CPU. */<br>
&gt;=C2=A0 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 __aligned(STACK_SIZE);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 void __init noreturn start_xen(void)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 for ( ;; )<br>
&gt; +=C2=A0 =C2=A0 early_printk(&quot;Hello from C env\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for ( ; ; )<br>
<br>
Rebasing error?<br>
<br>
~Andrew<br>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature">Julien Grall</div>

--00000000000081931c05f27ef684--

