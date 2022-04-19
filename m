Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3EE50768C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 19:31:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308424.524179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngrh9-0001gJ-Jv; Tue, 19 Apr 2022 17:31:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308424.524179; Tue, 19 Apr 2022 17:31:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngrh9-0001d5-G8; Tue, 19 Apr 2022 17:31:19 +0000
Received: by outflank-mailman (input) for mailman id 308424;
 Tue, 19 Apr 2022 17:31:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WtTZ=U5=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1ngrh7-0001cz-TR
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 17:31:18 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 841a9c5a-c006-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 19:31:16 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 o20-20020a05600c511400b0038ebbbb2ad8so1995809wms.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Apr 2022 10:31:16 -0700 (PDT)
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
X-Inumbo-ID: 841a9c5a-c006-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/v2X/IWEkNMqAvV2DAnl/r/uJBQ8nv5MJNPp35CwEWM=;
        b=qQjGfz56IlbFmugfznWhmGFVY+fxLRGYudPpTqx6hBxAz2mBQ29ZftiZkZWov05EFZ
         mDn/0IbHyzRX+i8xdSrPD49Tc4cRIW2BhBUsHTvfoiPXIhvcwF4Af9L8CbYPTSXBy4kL
         mTfEhJRnPXJXi0HwSUX1ha0xWgkGaENGSGPdUUAiI8IGcgKQwWysCejMKJ6OAKg7qaHv
         /eJSYwnl0wXUCzzPqjeKI47rHOM1ugcO8si9ILMR8G9MK1SA7OoeqcM+jUsA7fYSlJii
         ywVcdZtDsR+fskv0Nn/3dODSyylxBM+f/TzDGmX3NqYEvoJCYgsbx/cjZfk8+VeM/7sE
         ifRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/v2X/IWEkNMqAvV2DAnl/r/uJBQ8nv5MJNPp35CwEWM=;
        b=x5iHnKUnu9G3mSAt6gjSgzkJGupW0It8JkBwVc0ZsZwhvjR33rzSX8zk1WlC1W5HMS
         2TWu+5F5BC4yVsUONXMJkZZay+gCog3s7JtTr2y3BAIqENabS2y4eo+MTCJjf3/T6MJe
         JOgMfXttL5XiM+i8eHvdcm+A1WyAfENnqr5gYD1oxEfbizgkOzgHayzMvOv/PhGLSH+R
         VyG7FGJ0rfSz0dATWlx0+qCYSfieFqs5TRZhd7D2XAUZPZPp4V68S0n7NjbvLHa7/cYM
         mICF5nVIRdn98qLEOkiV6ieYdfmnyh4i2u336OMMfkV0/yfpCy3vSpgsIjaZU2tvUVaA
         bF0A==
X-Gm-Message-State: AOAM530eaW9sHXgHlBvMGbGKJwULcyQsyZmn1FWK2+lJ/p48GUJizRw9
	vIlYwk0Jp57Tz8zUxSDC2dcfC+2ecTeDkd9g7v0JoIuS
X-Google-Smtp-Source: ABdhPJxb7HOiHFivsd8jVuyhThpUPGqrWYOy/SgM5YR3tmOh2GAwN36rH4mZSyHh/RQ9jZslvSSPYSQo0yjbLxyh0nU=
X-Received: by 2002:a1c:ed01:0:b0:38b:5a39:220c with SMTP id
 l1-20020a1ced01000000b0038b5a39220cmr20738700wmh.167.1650389475639; Tue, 19
 Apr 2022 10:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220419154126.GA1518@DESKTOP-NK4TH6S.localdomain>
 <CAJ=z9a37_y3B4aAfiK5C-bHJYyWqCo0+g+jB6cdDCmOzLuXLJw@mail.gmail.com>
 <925421bc-680b-df61-5a75-681d752c4820@gmail.com> <b8a0feed-1dde-3b36-646e-1e5413de8395@gmail.com>
In-Reply-To: <b8a0feed-1dde-3b36-646e-1e5413de8395@gmail.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Tue, 19 Apr 2022 17:31:03 +0000
Message-ID: <CAJ=z9a2n0bWEk-7cpOj2q_4fUqetjkQdkgBGYKoQeGeDJ8MxTQ@mail.gmail.com>
Subject: Re: [PATCH] xen/arm: silence ambiguous integer casting warning error
To: Paran Lee <p4ranlee@gmail.com>
Cc: Austin Kim <austindh.kim@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="0000000000006fc46305dd053e72"

--0000000000006fc46305dd053e72
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, 19 Apr 2022, 17:09 Paran Lee, <p4ranlee@gmail.com> wrote:

> Debugging with GDB from head.S with QEMU runtime was very convenient for
> analysis(linux). so I have trying it in Xen. As I built it.
>

I don't understand how this is related to adding extra cflags. Can you
clarify it?


> Wouldn't it be helpful if I fixed the code little by little?


I am all to make Xen more robust. However, you are now implicitly casting a
signed int to unsigned int. I am not convinced this is a good move.

I think it would be better to fix the other side of the equation or
properly modify the function return.

Cheers,


> 2022-04-20 =EC=98=A4=EC=A0=84 1:31=EC=97=90 Paran Lee =EC=9D=B4(=EA=B0=80=
) =EC=93=B4 =EA=B8=80:
> > Hi, Julien Grall.
> >
> > Thank you for checking it out. I'm sorry I forgot to attach the make lo=
g
> > as well.
> >
> > My build configuration (include CFLGAS)
> >
> > export ARCH=3Darm64
> > export XEN_TARGET_ARCH=3Darm64
> > export $(dpkg-architecture -aarm64);
> > export CROSS_COMPILE=3Daarch64-linux-gnu-
> > export CFLAGS=3D"-g -Wall -Wextra -Wno-unused-parameter"
> >
> > And i did     make dist-xen
> >
> > my arm64 compiler information are here.
> > gcc version 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04.1)
> >
> > ~/xen$ aarch64-linux-gnu-gcc -v
> > Using built-in specs.
> > COLLECT_GCC=3Daarch64-linux-gnu-gcc
> > COLLECT_LTO_WRAPPER=3D/usr/lib/gcc-cross/aarch64-linux-gnu/9/lto-wrappe=
r
> > Target: aarch64-linux-gnu
> > Configured with: ../src/configure -v --with-pkgversion=3D'Ubuntu
> > 9.4.0-1ubuntu1~20.04.1'
> > --with-bugurl=3Dfile:///usr/share/doc/gcc-9/README.Bugs
> > --enable-languages=3Dc,ada,c++,go,d,fortran,objc,obj-c++,gm2 --prefix=
=3D/usr
> > --with-gcc-major-version-only --program-suffix=3D-9 --enable-shared
> > --enable-linker-build-id --libexecdir=3D/usr/lib
> > --without-included-gettext --enable-threads=3Dposix --libdir=3D/usr/lib
> > --enable-nls --with-sysroot=3D/ --enable-clocale=3Dgnu
> > --enable-libstdcxx-debug --enable-libstdcxx-time=3Dyes
> > --with-default-libstdcxx-abi=3Dnew --enable-gnu-unique-object
> > --disable-libquadmath --disable-libquadmath-support --enable-plugin
> > --enable-default-pie --with-system-zlib --without-target-system-zlib
> > --enable-libpth-m2 --enable-multiarch --enable-fix-cortex-a53-843419
> > --disable-werror --enable-checking=3Drelease --build=3Dx86_64-linux-gnu
> > --host=3Dx86_64-linux-gnu --target=3Daarch64-linux-gnu
> > --program-prefix=3Daarch64-linux-gnu-
> > --includedir=3D/usr/aarch64-linux-gnu/include
> > Thread model: posix
> > gcc version 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04.1)
> >
> > In arch/arm/gic-v3.c files.
> >
> > arch/arm/gic-v3.c: In function =E2=80=98gicv3_compute_target_list=E2=80=
=99:
> > arch/arm/gic-v3.c:926:17: error: comparison of integer expressions of
> > different signedness: =E2=80=98int=E2=80=99 and =E2=80=98unsigned int=
=E2=80=99 [-Werror=3Dsign-compare]
> >   926 |     while ( cpu < nr_cpu_ids )
> >       |                 ^
> > arch/arm/gic-v3.c:936:18: error: comparison of integer expressions of
> > different signedness: =E2=80=98int=E2=80=99 and =E2=80=98unsigned int=
=E2=80=99 [-Werror=3Dsign-compare]
> >   936 |         if ( cpu =3D=3D nr_cpu_ids )
> >       |                  ^~                           ^
> >
> > In arch/arm/setup.c files.
> >
> > arch/arm/setup.c: In function =E2=80=98start_xen=E2=80=99:
> > ./include/xen/cpumask.h:374:13: error: comparison of integer expression=
s
> > of different signedness: =E2=80=98int=E2=80=99 and =E2=80=98unsigned in=
t=E2=80=99 [-Werror=3Dsign-compare]
> >   374 |       (cpu) < nr_cpu_ids;  \
> >       |             ^
> > ./include/xen/cpumask.h:459:36: note: in expansion of macro
> =E2=80=98for_each_cpu=E2=80=99
> >   459 | #define for_each_present_cpu(cpu)  for_each_cpu(cpu,
> > &cpu_present_map)
> >       |                                    ^~~~~~~~~~~~
> > arch/arm/setup.c:989:5: note: in expansion of macro
> =E2=80=98for_each_present_cpu=E2=80=99
> >   989 |     for_each_present_cpu ( i )
> >       |     ^~~~~~~~~~~~~~~~~~~~             ^
> >
> > Thank you!
> >
> > 2022-04-20 =EC=98=A4=EC=A0=84 12:50=EC=97=90 Julien Grall =EC=9D=B4(=EA=
=B0=80) =EC=93=B4 =EA=B8=80:
> >> Hi,
> >>
> >> On Tue, 19 Apr 2022, 15:41 Paran Lee, <p4ranlee@gmail.com> wrote:
> >>
> >>> GCC with "-g -Wall -Wextra" option throws warning message as below:
> >>
> >>
> >> Which version of the compiler? Also you specify the exact cflags, did
> you
> >> tweak Xen?
> >>
> >>
> >>> error: comparison of integer expressions of different signedness:
> >>>  =E2=80=98int=E2=80=99 and =E2=80=98unsigned int=E2=80=99 [-Werror=3D=
sign-compare]
> >>>
> >>
> >> GCC should give you a line/file. Can you provide it?
> >>
> >> Cheers,
> >>
> >>
> >>> Silence the warning by correcting the integer type.
> >>>
> >>> Signed-off-by: Paran Lee <p4ranlee@gmail.com>
> >>> ---
> >>>  xen/arch/arm/gic-v3.c | 5 +++--
> >>>  xen/arch/arm/setup.c  | 2 +-
> >>>  2 files changed, 4 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> >>> index 3c472ed768..81ac25f528 100644
> >>> --- a/xen/arch/arm/gic-v3.c
> >>> +++ b/xen/arch/arm/gic-v3.c
> >>> @@ -916,7 +916,8 @@ static void gicv3_hyp_disable(void)
> >>>      isb();
> >>>  }
> >>>
> >>> -static u16 gicv3_compute_target_list(int *base_cpu, const struct
> cpumask
> >>> *mask,
> >>> +static u16 gicv3_compute_target_list(unsigned int *base_cpu,
> >>> +                                     const struct cpumask *mask,
> >>>                                       uint64_t cluster_id)
> >>>  {
> >>>      int cpu =3D *base_cpu;
> >>> @@ -953,7 +954,7 @@ out:
> >>>
> >>>  static void gicv3_send_sgi_list(enum gic_sgi sgi, const cpumask_t
> >>> *cpumask)
> >>>  {
> >>> -    int cpu =3D 0;
> >>> +    unsigned int cpu =3D 0;
> >>>      uint64_t val;
> >>>
> >>>      for_each_cpu(cpu, cpumask)
> >>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> >>> index d5d0792ed4..5ab2aaecaf 100644
> >>> --- a/xen/arch/arm/setup.c
> >>> +++ b/xen/arch/arm/setup.c
> >>> @@ -862,7 +862,7 @@ void __init start_xen(unsigned long
> boot_phys_offset,
> >>>                        unsigned long fdt_paddr)
> >>>  {
> >>>      size_t fdt_size;
> >>> -    int cpus, i;
> >>> +    unsigned int cpus, i;
> >>>      const char *cmdline;
> >>>      struct bootmodule *xen_bootmodule;
> >>>      struct domain *d;
> >>> --
> >>> 2.25.1
> >>>
> >>>
> >>
>

--0000000000006fc46305dd053e72
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi,<br><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, 19 Apr 2022, 17:09 Paran Lee, &lt;<a href=
=3D"mailto:p4ranlee@gmail.com">p4ranlee@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">Debugging with GDB from head.S with QEMU runt=
ime was very convenient for<br>
analysis(linux). so I have trying it in Xen. As I built it.<br></blockquote=
></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I don&#39;t unde=
rstand how this is related to adding extra cflags. Can you clarify it?</div=
><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
<br>
Wouldn&#39;t it be helpful if I fixed the code little by little?</blockquot=
e></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I am all to mak=
e Xen more robust. However, you are now implicitly casting a signed int to =
unsigned int. I am not convinced this is a good move.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">I think it would be better to fix the other s=
ide of the equation or properly modify the function return.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Cheers,</div><div dir=3D"auto"><br></=
div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">
<br>
2022-04-20 =EC=98=A4=EC=A0=84 1:31=EC=97=90 Paran Lee =EC=9D=B4(=EA=B0=80) =
=EC=93=B4 =EA=B8=80:<br>
&gt; Hi, Julien Grall.<br>
&gt; <br>
&gt; Thank you for checking it out. I&#39;m sorry I forgot to attach the ma=
ke log<br>
&gt; as well.<br>
&gt; <br>
&gt; My build configuration (include CFLGAS)<br>
&gt; <br>
&gt; export ARCH=3Darm64<br>
&gt; export XEN_TARGET_ARCH=3Darm64<br>
&gt; export $(dpkg-architecture -aarm64);<br>
&gt; export CROSS_COMPILE=3Daarch64-linux-gnu-<br>
&gt; export CFLAGS=3D&quot;-g -Wall -Wextra -Wno-unused-parameter&quot;<br>
&gt; <br>
&gt; And i did=C2=A0 =C2=A0 =C2=A0make dist-xen<br>
&gt; <br>
&gt; my arm64 compiler information are here.<br>
&gt; gcc version 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04.1)<br>
&gt; <br>
&gt; ~/xen$ aarch64-linux-gnu-gcc -v<br>
&gt; Using built-in specs.<br>
&gt; COLLECT_GCC=3Daarch64-linux-gnu-gcc<br>
&gt; COLLECT_LTO_WRAPPER=3D/usr/lib/gcc-cross/aarch64-linux-gnu/9/lto-wrapp=
er<br>
&gt; Target: aarch64-linux-gnu<br>
&gt; Configured with: ../src/configure -v --with-pkgversion=3D&#39;Ubuntu<b=
r>
&gt; 9.4.0-1ubuntu1~20.04.1&#39;<br>
&gt; --with-bugurl=3Dfile:///usr/share/doc/gcc-9/README.Bugs<br>
&gt; --enable-languages=3Dc,ada,c++,go,d,fortran,objc,obj-c++,gm2 --prefix=
=3D/usr<br>
&gt; --with-gcc-major-version-only --program-suffix=3D-9 --enable-shared<br=
>
&gt; --enable-linker-build-id --libexecdir=3D/usr/lib<br>
&gt; --without-included-gettext --enable-threads=3Dposix --libdir=3D/usr/li=
b<br>
&gt; --enable-nls --with-sysroot=3D/ --enable-clocale=3Dgnu<br>
&gt; --enable-libstdcxx-debug --enable-libstdcxx-time=3Dyes<br>
&gt; --with-default-libstdcxx-abi=3Dnew --enable-gnu-unique-object<br>
&gt; --disable-libquadmath --disable-libquadmath-support --enable-plugin<br=
>
&gt; --enable-default-pie --with-system-zlib --without-target-system-zlib<b=
r>
&gt; --enable-libpth-m2 --enable-multiarch --enable-fix-cortex-a53-843419<b=
r>
&gt; --disable-werror --enable-checking=3Drelease --build=3Dx86_64-linux-gn=
u<br>
&gt; --host=3Dx86_64-linux-gnu --target=3Daarch64-linux-gnu<br>
&gt; --program-prefix=3Daarch64-linux-gnu-<br>
&gt; --includedir=3D/usr/aarch64-linux-gnu/include<br>
&gt; Thread model: posix<br>
&gt; gcc version 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04.1)<br>
&gt; <br>
&gt; In arch/arm/gic-v3.c files.<br>
&gt; <br>
&gt; arch/arm/gic-v3.c: In function =E2=80=98gicv3_compute_target_list=E2=
=80=99:<br>
&gt; arch/arm/gic-v3.c:926:17: error: comparison of integer expressions of<=
br>
&gt; different signedness: =E2=80=98int=E2=80=99 and =E2=80=98unsigned int=
=E2=80=99 [-Werror=3Dsign-compare]<br>
&gt;=C2=A0 =C2=A0926 |=C2=A0 =C2=A0 =C2=A0while ( cpu &lt; nr_cpu_ids )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0^<br>
&gt; arch/arm/gic-v3.c:936:18: error: comparison of integer expressions of<=
br>
&gt; different signedness: =E2=80=98int=E2=80=99 and =E2=80=98unsigned int=
=E2=80=99 [-Werror=3Dsign-compare]<br>
&gt;=C2=A0 =C2=A0936 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( cpu =3D=3D nr_=
cpu_ids )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ^~=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
&gt; <br>
&gt; In arch/arm/setup.c files.<br>
&gt; <br>
&gt; arch/arm/setup.c: In function =E2=80=98start_xen=E2=80=99:<br>
&gt; ./include/xen/cpumask.h:374:13: error: comparison of integer expressio=
ns<br>
&gt; of different signedness: =E2=80=98int=E2=80=99 and =E2=80=98unsigned i=
nt=E2=80=99 [-Werror=3Dsign-compare]<br>
&gt;=C2=A0 =C2=A0374 |=C2=A0 =C2=A0 =C2=A0 =C2=A0(cpu) &lt; nr_cpu_ids;=C2=
=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0^<br>
&gt; ./include/xen/cpumask.h:459:36: note: in expansion of macro =E2=80=98f=
or_each_cpu=E2=80=99<br>
&gt;=C2=A0 =C2=A0459 | #define for_each_present_cpu(cpu)=C2=A0 for_each_cpu=
(cpu,<br>
&gt; &amp;cpu_present_map)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^~~~~~~~~~~~<br>
&gt; arch/arm/setup.c:989:5: note: in expansion of macro =E2=80=98for_each_=
present_cpu=E2=80=99<br>
&gt;=C2=A0 =C2=A0989 |=C2=A0 =C2=A0 =C2=A0for_each_present_cpu ( i )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
&gt; <br>
&gt; Thank you!<br>
&gt; <br>
&gt; 2022-04-20 =EC=98=A4=EC=A0=84 12:50=EC=97=90 Julien Grall =EC=9D=B4(=
=EA=B0=80) =EC=93=B4 =EA=B8=80:<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; On Tue, 19 Apr 2022, 15:41 Paran Lee, &lt;<a href=3D"mailto:p4ranl=
ee@gmail.com" target=3D"_blank" rel=3D"noreferrer">p4ranlee@gmail.com</a>&g=
t; wrote:<br>
&gt;&gt;<br>
&gt;&gt;&gt; GCC with &quot;-g -Wall -Wextra&quot; option throws warning me=
ssage as below:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Which version of the compiler? Also you specify the exact cflags, =
did you<br>
&gt;&gt; tweak Xen?<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt; error: comparison of integer expressions of different signedne=
ss:<br>
&gt;&gt;&gt;=C2=A0 =E2=80=98int=E2=80=99 and =E2=80=98unsigned int=E2=80=99=
 [-Werror=3Dsign-compare]<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; GCC should give you a line/file. Can you provide it?<br>
&gt;&gt;<br>
&gt;&gt; Cheers,<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt; Silence the warning by correcting the integer type.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Paran Lee &lt;<a href=3D"mailto:p4ranlee@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">p4ranlee@gmail.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 xen/arch/arm/gic-v3.c | 5 +++--<br>
&gt;&gt;&gt;=C2=A0 xen/arch/arm/setup.c=C2=A0 | 2 +-<br>
&gt;&gt;&gt;=C2=A0 2 files changed, 4 insertions(+), 3 deletions(-)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c<br>
&gt;&gt;&gt; index 3c472ed768..81ac25f528 100644<br>
&gt;&gt;&gt; --- a/xen/arch/arm/gic-v3.c<br>
&gt;&gt;&gt; +++ b/xen/arch/arm/gic-v3.c<br>
&gt;&gt;&gt; @@ -916,7 +916,8 @@ static void gicv3_hyp_disable(void)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 isb();<br>
&gt;&gt;&gt;=C2=A0 }<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -static u16 gicv3_compute_target_list(int *base_cpu, const str=
uct cpumask<br>
&gt;&gt;&gt; *mask,<br>
&gt;&gt;&gt; +static u16 gicv3_compute_target_list(unsigned int *base_cpu,<=
br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0co=
nst struct cpumask *mask,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0uint64_t cluster_id)<br>
&gt;&gt;&gt;=C2=A0 {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 int cpu =3D *base_cpu;<br>
&gt;&gt;&gt; @@ -953,7 +954,7 @@ out:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 static void gicv3_send_sgi_list(enum gic_sgi sgi, const =
cpumask_t<br>
&gt;&gt;&gt; *cpumask)<br>
&gt;&gt;&gt;=C2=A0 {<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 int cpu =3D 0;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 unsigned int cpu =3D 0;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t val;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 for_each_cpu(cpu, cpumask)<br>
&gt;&gt;&gt; diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c<br>
&gt;&gt;&gt; index d5d0792ed4..5ab2aaecaf 100644<br>
&gt;&gt;&gt; --- a/xen/arch/arm/setup.c<br>
&gt;&gt;&gt; +++ b/xen/arch/arm/setup.c<br>
&gt;&gt;&gt; @@ -862,7 +862,7 @@ void __init start_xen(unsigned long boot_p=
hys_offset,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 unsigned long fdt_paddr)<br>
&gt;&gt;&gt;=C2=A0 {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 size_t fdt_size;<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 int cpus, i;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 unsigned int cpus, i;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 const char *cmdline;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 struct bootmodule *xen_bootmodule;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 struct domain *d;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; 2.25.1<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
</blockquote></div></div></div>

--0000000000006fc46305dd053e72--

