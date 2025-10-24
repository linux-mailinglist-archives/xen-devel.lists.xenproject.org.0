Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BD4C076B5
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 18:58:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1150721.1481770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCL6t-00046l-0K; Fri, 24 Oct 2025 16:57:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1150721.1481770; Fri, 24 Oct 2025 16:57:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCL6s-00044A-Sn; Fri, 24 Oct 2025 16:57:50 +0000
Received: by outflank-mailman (input) for mailman id 1150721;
 Fri, 24 Oct 2025 16:57:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EH92=5B=gmail.com=samaan.dehghan@srs-se1.protection.inumbo.net>)
 id 1vCL6q-000444-Ev
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 16:57:48 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d32145d-b0fa-11f0-980a-7dc792cee155;
 Fri, 24 Oct 2025 18:57:41 +0200 (CEST)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-27ee41e074dso23200355ad.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 Oct 2025 09:57:41 -0700 (PDT)
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
X-Inumbo-ID: 8d32145d-b0fa-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761325060; x=1761929860; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KNJrqv1LdgGD9htqF+5iWwwnUHevdWmdVSMSUdoUNTA=;
        b=B+Sta8PyJLebtsBbWphTiJgXwB4lFKPA7TBkGg+1TXY+3gbnqpojwF3MJmbAJmIzUL
         6qnUz/2aH4I0ZWWh1CfSgDMdB4FvAMHPtDIBb9XLPBJAttHECIRVJp4UVdw1d0VbwnR3
         cyxjkoWaiSl0lUZ1u+XZULJP574YcagE5oQK8TQQADRWWCt3kgA4V6wsMJt8dBGZMlV9
         dPt0FSoxd8zYq0+He7OXe/xlw+YHKb/o2RXGS1hnOyNaFmrdxsE/FSDY+1OfFn+iZXDc
         uoml48sQBhNuO8ddI+9FyNm2my5awEXbvhPpwfl66tQXUrivIzINbNGaaSt2aQ3OiQso
         zphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761325060; x=1761929860;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KNJrqv1LdgGD9htqF+5iWwwnUHevdWmdVSMSUdoUNTA=;
        b=Txw5sdr3rR86E6JdRSMws8nsSpAX0Tcxf3ptA0mKcM7aeYdNy81zpbRFefudqDn9UY
         6G5OMNVbQJRKVIxKuMm8HQTstZuooJQ+4XgkhlFQ8QC+dtfjSBZYyl/IjhViJuiHorWo
         fD8J2ol6U4Ty7dbw/I7upzBR4O2NB7cknp3Kx4VupiR8ovQJqWFTauQybpyntnsum/BU
         rjkK9ZW+EvBHChVCWoRmnSjKw7xBor6bvpMgsammWr61ZbfVuh2SPi2SRaQin+RlzD3N
         NYuHyvlpDrKOQoTWaa2XhD+JgQYMxdEgBpehrMnhIZDzPviHiVHhFUNzLpr1xZ9X4KvU
         3XxQ==
X-Gm-Message-State: AOJu0Yzofsvj3/bxVo2xjhKx7AagfNZObAKLYpeIvV81srClvamGDepd
	8xmfJ2P2RLeoBWw3idkhVPyx6JlS8PIWtUakCLOFnEUauVXlu5nkCA9XcMQ2NYS/sawYSY2gXBE
	APg3MzNddrkm3pFytYKff8HNbO1sy7g==
X-Gm-Gg: ASbGncuizaMaeszGSlmI9CYRpicu2wPM6IHRv3zN5/4ZV26sJe5sMDGCfSnl6vTEV82
	N2rL+0cE9PyeED3Y8QbC6LcpLTa8z5Ja+5P3FWJpPNyx7caZbiPnTRkC0sUxrWKi2KTPItpLmMv
	Nb1puNxHvJFdMeFsCYK9wWEniv+5rEFnfC0kkPcbPtlawlrKNpbALbo64J146opneA1+dKoNndx
	yRGyN7ahxvHSxXRjAdQ1V9pAvZ8mmdqv/8NwJaOJc4jZOG3fGNEsbxTD0A27xM3tGm6
X-Google-Smtp-Source: AGHT+IEhQga1Ro4sSWNWpbqx0MH6zTfvm1Ez8rZwiQl+qaWpv9DT1yHNb1nYiy03nR+Uh4kAb92gkg4xp7SuFSApmnA=
X-Received: by 2002:a17:902:e80e:b0:293:623:3260 with SMTP id
 d9443c01a7336-2930623372dmr106086055ad.57.1761325059637; Fri, 24 Oct 2025
 09:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <20251023233408.16245-1-samaan.dehghan@gmail.com> <f61d5a29-04f0-44cc-bef6-de05f240bbc8@citrix.com>
In-Reply-To: <f61d5a29-04f0-44cc-bef6-de05f240bbc8@citrix.com>
From: saman dehghan <samaan.dehghan@gmail.com>
Date: Fri, 24 Oct 2025 11:57:28 -0500
X-Gm-Features: AS18NWAX7C4t-jfUL_sa9Kd-MFxDlmLrnQ3bnN2FrQzfuupM8DPB9D6LHY6Fw5M
Message-ID: <CAHFNDNg3TLo9vOiLcAXtMSwWVatrG5ObKqe5=zQboTG-XMY+0Q@mail.gmail.com>
Subject: Re: Support of building Xen with Clang/LLVM on Arm?
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wentao Zhang <wentaoz5@illinois.edu>
Content-Type: multipart/alternative; boundary="0000000000008384f20641ea7294"

--0000000000008384f20641ea7294
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you Andrew for your prompt clarification.
We'll see what the best we can contribute while developing our coverage
patch.

Thanks,
Saman

On Thu, Oct 23, 2025 at 6:45=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com>
wrote:

> On 24/10/2025 12:34 am, Saman Dehghan wrote:
> > Hi xen-devel,
> >
> > When preparing and testing another of my patch for LLVM coverage [1], I
> > encountered a few problems with Clang/LLVM build on ARM 64 platforms.
> >
> > The first two are clang errors.
> >
> > I observe the following errors when building the Xen master branch
> > for ARM 64 with Clang 19 and 20. If I comment out
> > "CFLAGS-$(CONFIG_ARM_64) +=3D -mgeneral-regs-only" in "xen/arch/arm/
> arch.mk"
> > the error is gone but the build fails during linking (see the third).
> >
> > Error message:
> >
> > arch/arm/arm64/vfp.c:9:18: error: instruction requires: fp-armv8
> >     9 |     asm volatile("stp q0, q1, [%1, #16 * 0]\n\t"
> >       |                  ^
> > <inline asm>:1:2: note: instantiated into assembly here
> >     1 |         stp q0, q1, [x8, #16 * 0]
> >       |         ^
> > arch/arm/arm64/vfp.c:9:46: error: instruction requires: fp-armv8
>
> >     9 |     asm volatile("stp q0, q1, [%1, #16 * 0]\n\t"
> >       |                                              ^
> > <inline asm>:2:2: note: instantiated into assembly here
> >     2 |         stp q2, q3, [x8, #16 * 2]
> >       |         ^
> > arch/arm/arm64/vfp.c:10:46: error: instruction requires: fp-armv8
> >    10 |                  "stp q2, q3, [%1, #16 * 2]\n\t"
> >       |                                              ^
> > <inline asm>:3:2: note: instantiated into assembly here
> >     3 |         stp q4, q5, [x8, #16 * 4]
> >       |         ^
> > arch/arm/arm64/vfp.c:11:46: error: instruction requires: fp-armv8
> >    11 |                  "stp q4, q5, [%1, #16 * 4]\n\t"
> >       |                                              ^
> > <inline asm>:4:2: note: instantiated into assembly here
> >     4 |         stp q6, q7, [x8, #16 * 6]
> >       |         ^
> > arch/arm/arm64/vfp.c:12:46: error: instruction requires: fp-armv8
> >    12 |                  "stp q6, q7, [%1, #16 * 6]\n\t"
> >       |                                              ^
> > <inline asm>:5:2: note: instantiated into assembly here
> >     5 |         stp q8, q9, [x8, #16 * 8]
> >       |         ^
> > arch/arm/arm64/vfp.c:13:46: error: instruction requires: fp-armv8
> >    13 |                  "stp q8, q9, [%1, #16 * 8]\n\t"
> >       |                                              ^
> > <inline asm>:6:2: note: instantiated into assembly here
> >     6 |         stp q10, q11, [x8, #16 * 10]
> >       |         ^
> >
> > Reprroduction steps:
> >
> > $ git clone https://xenbits.xen.org/git-http/xen
> > $ cd xen
> > $ git checkout eff32008be0d2718d32d60245650ff6f88fb3d13
> > $ make -C xen menuconfig clang=3Dy
> > $ make xen clang=3Dy
> >
> > Tested with the following setup:
> >
> > - Clang version: Ubuntu clang version 19.1.1 (1ubuntu1~24.04.2)
> > - Host: Ubuntu 24.04.3 LTS /  aarch64
> >
> > Second, for Clang 18 or below there are another set of errors despite
> > commenting out the "-mgeneral-regs-only" flag:
> >
> > arch/arm/arm64/mmu/head.S:288:13: error: expected writable system
> register or pstate
> >         msr TTBR0_EL2, x4
> >             ^
> > arch/arm/arm64/mmu/head.S:509:13: error: expected writable system
> register or pstate
> >         msr TTBR0_EL2, x0
> >             ^
> >
> > Tested with:
> >
> > - Clang version: Ubuntu clang version 18.1.3 (1ubuntu1)
> > - Host: Ubuntu 24.04.3 LTS /  aarch64
> >
> > This works with GCC. It also works with Clang on x86 builds.
> >
> > Third, if I specify "LD=3Dld.lld" with Clang 19 and 20 after commenting=
 out
> > the "-mgeneral-regs-only" flag. I got this linking error:
> >
> > ld.lld: error: common/device-tree/static-evtchn.init.o:(.rodata.str):
> offset is outside the section
> >
> > As I read from the project README, under "C compiler and linker - For
> ARM",
> > only GCC is listed. So my general question is whether Xen supports
> building
> > with Clang/LLVM on ARM platforms.
> >
> > Let me know if you need more details or a patch attempt.
>
> Clang/LLVM is only supported for x86.
>
> Personally I think the other architectures would benefit from using both
> compilers, but it's up to the relevant maintainers.
>
> ~Andrew
>

--0000000000008384f20641ea7294
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif">Thank you Andrew for your prompt clarification.</div><div class=3D"g=
mail_default" style=3D"font-family:georgia,serif">We&#39;ll see what the be=
st we can contribute while developing our coverage patch.<br></div><div cla=
ss=3D"gmail_default" style=3D"font-family:georgia,serif"><br></div><div cla=
ss=3D"gmail_default" style=3D"font-family:georgia,serif">Thanks,</div><div =
class=3D"gmail_default" style=3D"font-family:georgia,serif">Saman</div></di=
v><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Thu, Oct 23, 2025 at 6:45=E2=80=AFPM Andrew Cooper &lt=
;<a href=3D"mailto:andrew.cooper3@citrix.com">andrew.cooper3@citrix.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-col=
or:rgb(204,204,204);padding-left:1ex">On 24/10/2025 12:34 am, Saman Dehghan=
 wrote:<br>
&gt; Hi xen-devel,<br>
&gt;<br>
&gt; When preparing and testing another of my patch for LLVM coverage [1], =
I<br>
&gt; encountered a few problems with Clang/LLVM build on ARM 64 platforms.<=
br>
&gt;<br>
&gt; The first two are clang errors.<br>
&gt;<br>
&gt; I observe the following errors when building the Xen master branch<br>
&gt; for ARM 64 with Clang 19 and 20. If I comment out <br>
&gt; &quot;CFLAGS-$(CONFIG_ARM_64) +=3D -mgeneral-regs-only&quot; in &quot;=
xen/arch/arm/<a href=3D"http://arch.mk" rel=3D"noreferrer" target=3D"_blank=
">arch.mk</a>&quot;<br>
&gt; the error is gone but the build fails during linking (see the third). =
<br>
&gt;<br>
&gt; Error message:<br>
&gt;<br>
&gt; arch/arm/arm64/vfp.c:9:18: error: instruction requires: fp-armv8=C2=A0=
 <br>
&gt;=C2=A0 =C2=A0 =C2=A09 |=C2=A0 =C2=A0 =C2=A0asm volatile(&quot;stp q0, q=
1, [%1, #16 * 0]\n\t&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ^=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 <br>
&gt; &lt;inline asm&gt;:1:2: note: instantiated into assembly here=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A01 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stp q0, q1, [x=
8, #16 * 0]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0<br>
&gt; arch/arm/arm64/vfp.c:9:46: error: instruction requires: fp-armv8=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A09 |=C2=A0 =C2=A0 =C2=A0asm volatile(&quot;stp q0, q=
1, [%1, #16 * 0]\n\t&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 <br>
&gt; &lt;inline asm&gt;:2:2: note: instantiated into assembly here=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A02 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stp q2, q3, [x=
8, #16 * 2]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0<br>
&gt; arch/arm/arm64/vfp.c:10:46: error: instruction requires: fp-armv8<br>
&gt;=C2=A0 =C2=A0 10 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;stp q2, q3, [%1, #16 * 2]\n\t&quot;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0<br>
&gt; &lt;inline asm&gt;:3:2: note: instantiated into assembly here<br>
&gt;=C2=A0 =C2=A0 =C2=A03 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stp q4, q5, [x=
8, #16 * 4]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
&gt; arch/arm/arm64/vfp.c:11:46: error: instruction requires: fp-armv8<br>
&gt;=C2=A0 =C2=A0 11 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;stp q4, q5, [%1, #16 * 4]\n\t&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
&gt; &lt;inline asm&gt;:4:2: note: instantiated into assembly here<br>
&gt;=C2=A0 =C2=A0 =C2=A04 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stp q6, q7, [x=
8, #16 * 6]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
&gt; arch/arm/arm64/vfp.c:12:46: error: instruction requires: fp-armv8<br>
&gt;=C2=A0 =C2=A0 12 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;stp q6, q7, [%1, #16 * 6]\n\t&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
&gt; &lt;inline asm&gt;:5:2: note: instantiated into assembly here<br>
&gt;=C2=A0 =C2=A0 =C2=A05 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stp q8, q9, [x=
8, #16 * 8]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
&gt; arch/arm/arm64/vfp.c:13:46: error: instruction requires: fp-armv8<br>
&gt;=C2=A0 =C2=A0 13 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;stp q8, q9, [%1, #16 * 8]\n\t&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
&gt; &lt;inline asm&gt;:6:2: note: instantiated into assembly here<br>
&gt;=C2=A0 =C2=A0 =C2=A06 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stp q10, q11, =
[x8, #16 * 10]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
&gt;<br>
&gt; Reprroduction steps:<br>
&gt;<br>
&gt; $ git clone <a href=3D"https://xenbits.xen.org/git-http/xen" rel=3D"no=
referrer" target=3D"_blank">https://xenbits.xen.org/git-http/xen</a><br>
&gt; $ cd xen<br>
&gt; $ git checkout eff32008be0d2718d32d60245650ff6f88fb3d13<br>
&gt; $ make -C xen menuconfig clang=3Dy<br>
&gt; $ make xen clang=3Dy<br>
&gt;<br>
&gt; Tested with the following setup:<br>
&gt;<br>
&gt; - Clang version: Ubuntu clang version 19.1.1 (1ubuntu1~24.04.2)<br>
&gt; - Host: Ubuntu 24.04.3 LTS /=C2=A0 aarch64<br>
&gt;<br>
&gt; Second, for Clang 18 or below there are another set of errors despite<=
br>
&gt; commenting out the &quot;-mgeneral-regs-only&quot; flag:<br>
&gt;<br>
&gt; arch/arm/arm64/mmu/head.S:288:13: error: expected writable system regi=
ster or pstate<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msr TTBR0_EL2, x4<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
&gt; arch/arm/arm64/mmu/head.S:509:13: error: expected writable system regi=
ster or pstate<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msr TTBR0_EL2, x0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
&gt;<br>
&gt; Tested with:<br>
&gt;<br>
&gt; - Clang version: Ubuntu clang version 18.1.3 (1ubuntu1)<br>
&gt; - Host: Ubuntu 24.04.3 LTS /=C2=A0 aarch64<br>
&gt;<br>
&gt; This works with GCC. It also works with Clang on x86 builds.<br>
&gt;<br>
&gt; Third, if I specify &quot;LD=3Dld.lld&quot; with Clang 19 and 20 after=
 commenting out<br>
&gt; the &quot;-mgeneral-regs-only&quot; flag. I got this linking error:<br=
>
&gt;<br>
&gt; ld.lld: error: common/device-tree/static-evtchn.init.o:(.rodata.str): =
offset is outside the section<br>
&gt;<br>
&gt; As I read from the project README, under &quot;C compiler and linker -=
 For ARM&quot;,<br>
&gt; only GCC is listed. So my general question is whether Xen supports bui=
lding<br>
&gt; with Clang/LLVM on ARM platforms.<br>
&gt;<br>
&gt; Let me know if you need more details or a patch attempt.<br>
<br>
Clang/LLVM is only supported for x86.<br>
<br>
Personally I think the other architectures would benefit from using both<br=
>
compilers, but it&#39;s up to the relevant maintainers.<br>
<br>
~Andrew<br>
</blockquote></div>

--0000000000008384f20641ea7294--

