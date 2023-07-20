Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC8C75BA41
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 00:06:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566751.886009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMbm2-0005y9-Ft; Thu, 20 Jul 2023 22:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566751.886009; Thu, 20 Jul 2023 22:05:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMbm2-0005wP-CI; Thu, 20 Jul 2023 22:05:26 +0000
Received: by outflank-mailman (input) for mailman id 566751;
 Thu, 20 Jul 2023 22:05:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DC1w=DG=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1qMbm1-0005wJ-6K
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 22:05:25 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 865c2fd5-2749-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 00:05:23 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fb7769f15aso2043224e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jul 2023 15:05:23 -0700 (PDT)
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
X-Inumbo-ID: 865c2fd5-2749-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689890723; x=1690495523;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TzsCW0WE4lk1/FbuZcfGinVOAEgKPnTV/Hny/9okUvE=;
        b=g39Ezf+/VACCpycYMs+HzXqzxq5Vg9TJXDXvEVZUEuzoMKM28fDqzlJDd7pRmhHU0k
         sYfYClyHdfT0vffQi/KZ54cFTvFzij/2NTLkKlNfmGY6Ath5G3mfLkcmwYh+Lw/3Gysf
         v3nfqiYaZVwkcSSQq+miSP2Lzxd+6ciQ09ieoqRnKoOfZovRSCBdt1wn4sxdf3XSNF/9
         E+567qlol/06T4B5M9W1uM8B25hQXUNzR1UChTpKeeHTawxfGESD60GC87bDHeY/SbMM
         B4RsY/RZpkkFrdGfSxBFmqE6NOy+r/4mlsV7VxYcGuSTBRzwETIKRnJKPn7gVhu7c07R
         jKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689890723; x=1690495523;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TzsCW0WE4lk1/FbuZcfGinVOAEgKPnTV/Hny/9okUvE=;
        b=WgspoKIWCjzRREae4V/gAu9h0q6QtrQ3e8ENCqEwBJe95Y5XUT+qOj2x845XtPy2uU
         Apia5VI4CIaox3u06rP9Cq4ppQ3ObkmRbvwu5vQ2bWerKAmVpdUdAaQjO2mLyC0Ul/Ge
         r6az/MG2mIuiBE3dh9jjD2m+nh4piaqLYJvr+DgQ3/6uMGAXvyarjM6/SNfdOvdIeDs9
         u7RjEbgkY6d+X5unkcwOVb6spZMOLZnY4/gryxfo1sfKl/aM9HcKnVg2WBnQhPVtRVcN
         UUvhWx1RaOs1eYO7d3frmkra92ChSvs2MDyhaWUX5Z+02Bqduhn6buTPLyeEpfyzWIaI
         NPeA==
X-Gm-Message-State: ABy/qLaq9LGTSWTlyrwaaeDopqNChLHiPCvt99RB5O7m+mFcfSbtTNj6
	Uq8FtzaOTO9CkF8R92wYTyRkYpJuMrqtJBuer/s=
X-Google-Smtp-Source: APBJJlGpuplUY/o6l68vkg9pmFiFFjdbocWOnxYxQh9EoSSTQBJb/16fwj7ynJBGjvpKqFf5NxptdApnIKfeI7PLj5o=
X-Received: by 2002:a05:6512:743:b0:4f8:7568:e94b with SMTP id
 c3-20020a056512074300b004f87568e94bmr4449lfs.56.1689890722858; Thu, 20 Jul
 2023 15:05:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230701071835.41599-1-christopher.w.clark@gmail.com>
 <20230701071835.41599-3-christopher.w.clark@gmail.com> <alpine.DEB.2.22.394.2307081134270.761183@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2307081134270.761183@ubuntu-linux-20-04-desktop>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Thu, 20 Jul 2023 15:05:10 -0700
Message-ID: <CACMJ4GaVVBGqwGg237qTDU1bnhdGyQaETcxOtRaWMF_MBDEhMw@mail.gmail.com>
Subject: Re: [PATCH 02/10] x86 setup: per-arch bootmodule structure, headroom field
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, 
	Daniel Smith <dpsmith@apertussolutions.com>, stefano.stabellini@amd.com, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Luca Fancellu <luca.fancellu@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Rich Persaud <persaur@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000003ecb5b0600f2586d"

--0000000000003ecb5b0600f2586d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 8, 2023 at 12:15=E2=80=AFPM Stefano Stabellini <sstabellini@ker=
nel.org>
wrote:

> On Sat, 1 Jul 2023, Christopher Clark wrote:
> > Next step in incremental work towards adding a non-multiboot internal
> > representation of boot modules, converting the fields being accessed fo=
r
> > the startup calculations.
> >
> > Add a new array of structs for per-boot-module state, though only
> > allocate space for a single array entry in this change since that is al=
l
> > that is required for functionality modified in this patch: moving the
> > headroom field for the image decompression calculation into a new
> > per-arch boot module struct and then using it in x86 dom0 construction.
> >
> > Introduces a per-arch header for x86 for arch-specific boot module
> > structures, and add a member to the common boot module structure for
> > access to it.
> >
> > No functional change intended.
> >
> > Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> > Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>
> [...]
>
>
> > diff --git a/xen/arch/x86/include/asm/bootinfo.h
> b/xen/arch/x86/include/asm/bootinfo.h
> > new file mode 100644
> > index 0000000000..a25054f372
> > --- /dev/null
> > +++ b/xen/arch/x86/include/asm/bootinfo.h
> > @@ -0,0 +1,18 @@
> > +#ifndef __ARCH_X86_BOOTINFO_H__
> > +#define __ARCH_X86_BOOTINFO_H__
> > +
> > +struct arch_bootmodule {
> > +    unsigned headroom;
> > +};
> > +
> > +#endif
> > +
> > +/*
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: "BSD"
> > + * c-basic-offset: 4
> > + * tab-width: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */
>
> [...]
>
> > diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
> > index 6a7d55d20e..b72ae31a66 100644
> > --- a/xen/include/xen/bootinfo.h
> > +++ b/xen/include/xen/bootinfo.h
> > @@ -3,8 +3,19 @@
> >
> >  #include <xen/types.h>
> >
> > +#ifdef CONFIG_X86
> > +#include <asm/bootinfo.h>
> > +#else
> > +    struct arch_bootmodule { };
> > +#endif
> > +
> > +struct boot_module {
> > +    struct arch_bootmodule *arch;
> > +};
> > +
> >  struct boot_info {
> >      unsigned int nr_mods;
> > +    struct boot_module *mods;
>
> Also here you already made the effort of using the same data structures
> we use on ARM, you might as well use the same names too. Otherwise when
> we try to use them on ARM it will require a rename somewhere.
>

Thanks for the review. We consciously made an effort to derive from the Arm
data structures to ensure that we're able to support the logic that Arm
needs. Arm's bootmodules were a
good start as a means for abstraction, and the design for hyperlaunch was
striving to abstract even further to incorporate x86-ism and hopefully
enough foresight for PPC and Risc-V.

Christopher


>
> >  };
> >
> >  #endif
> > --
> > 2.25.1
> >
> >
>

--0000000000003ecb5b0600f2586d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul 8, 2023 at 12:15=E2=80=AF=
PM Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabel=
lini@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Sat, 1 Jul 2023, Christopher Clark wrote:<br>
&gt; Next step in incremental work towards adding a non-multiboot internal<=
br>
&gt; representation of boot modules, converting the fields being accessed f=
or<br>
&gt; the startup calculations.<br>
&gt; <br>
&gt; Add a new array of structs for per-boot-module state, though only<br>
&gt; allocate space for a single array entry in this change since that is a=
ll<br>
&gt; that is required for functionality modified in this patch: moving the<=
br>
&gt; headroom field for the image decompression calculation into a new<br>
&gt; per-arch boot module struct and then using it in x86 dom0 construction=
.<br>
&gt; <br>
&gt; Introduces a per-arch header for x86 for arch-specific boot module<br>
&gt; structures, and add a member to the common boot module structure for<b=
r>
&gt; access to it.<br>
&gt; <br>
&gt; No functional change intended.<br>
&gt; <br>
&gt; Signed-off-by: Christopher Clark &lt;<a href=3D"mailto:christopher.w.c=
lark@gmail.com" target=3D"_blank">christopher.w.clark@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Daniel P. Smith &lt;<a href=3D"mailto:dpsmith@apertusso=
lutions.com" target=3D"_blank">dpsmith@apertussolutions.com</a>&gt;<br>
<br>
[...]<br>
<br>
<br>
&gt; diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/includ=
e/asm/bootinfo.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..a25054f372<br>
&gt; --- /dev/null<br>
&gt; +++ b/xen/arch/x86/include/asm/bootinfo.h<br>
&gt; @@ -0,0 +1,18 @@<br>
&gt; +#ifndef __ARCH_X86_BOOTINFO_H__<br>
&gt; +#define __ARCH_X86_BOOTINFO_H__<br>
&gt; +<br>
&gt; +struct arch_bootmodule {<br>
&gt; +=C2=A0 =C2=A0 unsigned headroom;<br>
&gt; +};<br>
&gt; +<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Local variables:<br>
&gt; + * mode: C<br>
&gt; + * c-file-style: &quot;BSD&quot;<br>
&gt; + * c-basic-offset: 4<br>
&gt; + * tab-width: 4<br>
&gt; + * indent-tabs-mode: nil<br>
&gt; + * End:<br>
&gt; + */<br>
<br>
[...]<br>
<br>
&gt; diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h<b=
r>
&gt; index 6a7d55d20e..b72ae31a66 100644<br>
&gt; --- a/xen/include/xen/bootinfo.h<br>
&gt; +++ b/xen/include/xen/bootinfo.h<br>
&gt; @@ -3,8 +3,19 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #include &lt;xen/types.h&gt;<br>
&gt;=C2=A0 <br>
&gt; +#ifdef CONFIG_X86<br>
&gt; +#include &lt;asm/bootinfo.h&gt;<br>
&gt; +#else<br>
&gt; +=C2=A0 =C2=A0 struct arch_bootmodule { };<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +struct boot_module {<br>
&gt; +=C2=A0 =C2=A0 struct arch_bootmodule *arch;<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 struct boot_info {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 unsigned int nr_mods;<br>
&gt; +=C2=A0 =C2=A0 struct boot_module *mods;<br>
<br>
Also here you already made the effort of using the same data structures<br>
we use on ARM, you might as well use the same names too. Otherwise when<br>
we try to use them on ARM it will require a rename somewhere.<br></blockquo=
te><div><br></div><div>Thanks for the review. We consciously made an effort=
 to derive from the Arm data structures to ensure that we&#39;re able to su=
pport the logic that Arm needs. Arm&#39;s bootmodules were a</div>good star=
t as a means for abstraction, and the design for hyperlaunch was striving t=
o abstract even further to incorporate x86-ism and hopefully enough foresig=
ht for PPC and Risc-V.</div><div class=3D"gmail_quote"><br></div><div class=
=3D"gmail_quote">Christopher</div><div class=3D"gmail_quote"><div><br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #endif<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
&gt; <br>
</blockquote></div></div>

--0000000000003ecb5b0600f2586d--

