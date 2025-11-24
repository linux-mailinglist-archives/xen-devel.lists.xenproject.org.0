Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8CFC7FF07
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 11:38:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170243.1495312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNTxW-0002vq-9S; Mon, 24 Nov 2025 10:38:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170243.1495312; Mon, 24 Nov 2025 10:38:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNTxW-0002uO-6Z; Mon, 24 Nov 2025 10:38:14 +0000
Received: by outflank-mailman (input) for mailman id 1170243;
 Mon, 24 Nov 2025 10:38:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qo8f=6A=gmail.com=samaan.dehghan@srs-se1.protection.inumbo.net>)
 id 1vNTxV-0002uI-9i
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 10:38:13 +0000
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [2607:f8b0:4864:20::102f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac1deb83-c921-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 11:38:11 +0100 (CET)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-343774bd9b4so3103624a91.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 02:38:11 -0800 (PST)
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
X-Inumbo-ID: ac1deb83-c921-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763980690; x=1764585490; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7VP0F2YDQhM1UAEb+OotVHt48VMNkmXGbwBnpKUQtmw=;
        b=EHUVJ1cr8bBlGAvGo3utgYwvu1IDREwODH9WPsRuPY0biBnBjoeCE/+F/Pwwt1Hf2S
         spJvF6RjPqXyg3oubWhdFUHNr8jaUKgV2fCKhESLIfy6jKMMyZm2iXigAdXha9POfyoL
         8WA8102sBQyx4HPJciTH+JNDnpKuCGqZOUVHEVFro3JYOR+Bgyd9jypLarpBSwPlOVBO
         PlncvqiIHZkUYPEKVc21xcLYGeicct1DqlxfgRbXqgufx3+XxW8XRxjUlXSFcsx7uSOP
         H6zAU38TIuGLQTjE4LfLujls97+EnIrAyoIlrOC0YJOR8OZx4W9ApHE+G6JCMNpy7OKk
         9YXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763980690; x=1764585490;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7VP0F2YDQhM1UAEb+OotVHt48VMNkmXGbwBnpKUQtmw=;
        b=I0n7YDry5TOKrH3dNkXgAc/GFgkcWPhobXacIrAxaiC1w88jRZ/lzvYTkgEibQsKcC
         DiCUymsYt8cn6VhOO89za1nwn1KgfruVPK0GXri4LFvMj81otpkX8uRzURQOd0+5zSnb
         OtWT4Dr1RE59AoQjAbl/gESXULwpiGOMJC0pk6yiybQNmKPipOGQWIDsziz0pSmZygc/
         RnP1y+wNi3NREr66R289Ce8M/poEWoZW2N9KMjKbO7wTAAM9NtdRm1TfKjHdp7ftW0Ym
         JBemembBK6cOYpOsp3BBQi+US7mlpy8b8mStLXDBBi4C55tBWx9rMwsKR1Dp+58D+5+i
         Lmuw==
X-Forwarded-Encrypted: i=1; AJvYcCVF50V7VtZETSoOpNkpginJejP0vYbcxLIXoSha5ljId3sgKgI1S2UCCelqbmf7Hfejob/UpaRjWCU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxEsZ0GPBGNEzA8mU4M7fWlnrHzlr2QsscHcuY9wVkOTqRDnrlM
	nrv0UShVxhf7rTQaJSAYdIwVBKU9LzZt5OlOrWXNpoWrcgPf99MpL/NCP0bdr8uNxNCk4692Egk
	6wRCyC8O6NGysc0ed6ZJbGWXgVRLQsQ==
X-Gm-Gg: ASbGncvEnNsWrUyqMlSd2XVDYTm3u5mOZggJezAMW5+WlT/NeEfYz+34hOLd5sm8fUK
	7giPffMQkCjbsZ3JNDOApUzq5FtmEuJn9mLCnYkjEKU0aS8H3XnOXdJLHzNxne/J5sJWOGiAS1y
	fAwephgKNhBigKpeZpxYinTXtOc1ugeH3dpfwRhXc9iOSrcmb7qy/v+bV1FQbg28XQklETC1MF6
	m0y+6Pkw2wmdmsvlg0j+MPt1cxmVkv4/Zmbm2ReU9ozra98fyVMbf8h1YQ8N6/2Ry6+Kz0afR3e
	LJyw/ii3+LQDvCZhYPr9zVfd
X-Google-Smtp-Source: AGHT+IEpVbyPVBMX6vC0C2K84jh7dJ+EwqjR8L5bLMaWnWdIC792jLHDgVn0mn6RfiyeJyZxI5XygaM5H9cEDxd+KfY=
X-Received: by 2002:a17:90b:3503:b0:340:be44:dd0b with SMTP id
 98e67ed59e1d1-34733f5d2femr9284651a91.34.1763980690095; Mon, 24 Nov 2025
 02:38:10 -0800 (PST)
MIME-Version: 1.0
References: <3bb418ae6a36a9ac89c697a417fa0745fa9ac702.1763949990.git.samaan.dehghan@gmail.com>
 <f75bd206-47a5-450e-a4ab-920dbc4574b0@suse.com>
In-Reply-To: <f75bd206-47a5-450e-a4ab-920dbc4574b0@suse.com>
From: Saman Dehghan <samaan.dehghan@gmail.com>
Date: Mon, 24 Nov 2025 04:37:58 -0600
X-Gm-Features: AWmQ_bkECJdnkXdIt0ENZNTqjsSTOSFKa2Wk_lW7QmEiIg0KggRduKYvxXNMgSg
Message-ID: <CAHFNDNi9Z3VzAoMdenar_ehs4cgt7ohckq3ffyPsUcDi+WX-gA@mail.gmail.com>
Subject: Re: [PATCH] XEN: enable MC/DC coverage for Clang
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000006c83fc064454c22a"

--0000000000006c83fc064454c22a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 3:40=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 24.11.2025 03:18, Saman Dehghan wrote:
> > Clang >=3D 18 supports Modified Condition/Decision Coverage (MC/DC).
> > This patch enables the detection and usage of this feature when
> > compiling Xen with Clang.
> >
> > - Update detection logic to check for '-fcoverage-mcdc' when using
Clang.
>
> You check for ...
>
> > - Update llvm.c to handle the profile format changes (bitmap section)
> >   required for MC/DC.
> > - Guard -Wno-error=3Dcoverage-too-many-conditions with CONFIG_CC_IS_GCC
> >   to avoid passing a GCC-only warning option to Clang
> >
> > Signed-off-by: Saman Dehghan <samaan.dehghan@gmail.com>
> > ---
> >  xen/Kconfig                |  2 +-
> >  xen/Rules.mk               |  1 +
> >  xen/arch/x86/Makefile      |  4 +++-
> >  xen/common/coverage/llvm.c | 24 +++++++++++++++++++++++-
> >  4 files changed, 28 insertions(+), 3 deletions(-)
> >
> > diff --git a/xen/Kconfig b/xen/Kconfig
> > index a5e5af3b76..5508993f02 100644
> > --- a/xen/Kconfig
> > +++ b/xen/Kconfig
> > @@ -53,7 +53,7 @@ config CC_HAS_ASM_GOTO_OUTPUT
> >
> >  # Compiler supports -fcondition-coverage aka MC/DC
> >  config CC_HAS_MCDC
> > -     def_bool $(cc-option,-fcondition-coverage)
> > +     def_bool $(cc-option,-fcondition-coverage) ||
$(cc-option,-fprofile-instr-generate -fcoverage-mapping -fcoverage-mcdc)
>
> ... more than that one option here. Presumably because the option alone
> wouldn't be liked by the compiler? (May want mentioning in that part of
the
> description.)
>
Yes, That is because '-fcoverage-mcdc' only allowed with
'-fcoverage-mapping' and '-fcoverage-mapping' only allowed with
'-fprofile-instr-generate'.
I will add this to the description.
Thanks.

> > --- a/xen/arch/x86/Makefile
> > +++ b/xen/arch/x86/Makefile
> > @@ -99,7 +99,9 @@ ifneq ($(CONFIG_HVM),y)
> >  $(obj)/x86_emulate.o: CFLAGS-y +=3D -Wno-unused-label
> >  endif
> >  ifeq ($(CONFIG_CONDITION_COVERAGE),y)
> > -$(obj)/x86_emulate.o: CFLAGS-y +=3D
-Wno-error=3Dcoverage-too-many-conditions
> > +    ifeq ($(CONFIG_CC_IS_GCC),y)
> > +        $(obj)/x86_emulate.o: CFLAGS-y +=3D
-Wno-error=3Dcoverage-too-many-conditions
> > +    endif
> >  endif
>
> Please can the two conditionals be combined, like I think we do elsewhere=
:
>
> ifeq ($(CONFIG_CONDITION_COVERAGE)$(CONFIG_CC_IS_GCC),yy)
>
> or
>
> ifeq ($(CONFIG_CONDITION_COVERAGE)_$(CONFIG_CC_IS_GCC),y_y)
>
> ?

I initially kept the nesting because I found several similar cases in the c=
ode
base that weren=E2=80=99t merged , so I assumed it was intentional.
No problem at all, I will combine them.
Thanks.

>
> Jan

--0000000000006c83fc064454c22a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Mon, Nov 24, 2025 at 3:40=E2=80=AFAM Jan Beulich &lt;<a=
 href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br>&gt;=
<br>&gt; On 24.11.2025 03:18, Saman Dehghan wrote:<br>&gt; &gt; Clang &gt;=
=3D 18 supports Modified Condition/Decision Coverage (MC/DC).<br>&gt; &gt; =
This patch enables the detection and usage of this feature when<br>&gt; &gt=
; compiling Xen with Clang.<br>&gt; &gt;<br>&gt; &gt; - Update detection lo=
gic to check for &#39;-fcoverage-mcdc&#39; when using Clang.<br>&gt;<br>&gt=
; You check for ...<br>&gt;<br>&gt; &gt; - Update llvm.c to handle the prof=
ile format changes (bitmap section)<br>&gt; &gt; =C2=A0 required for MC/DC.=
<br>&gt; &gt; - Guard -Wno-error=3Dcoverage-too-many-conditions with CONFIG=
_CC_IS_GCC<br>&gt; &gt; =C2=A0 to avoid passing a GCC-only warning option t=
o Clang<br>&gt; &gt;<br>&gt; &gt; Signed-off-by: Saman Dehghan &lt;<a href=
=3D"mailto:samaan.dehghan@gmail.com">samaan.dehghan@gmail.com</a>&gt;<br>&g=
t; &gt; ---<br>&gt; &gt; =C2=A0xen/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A02 +-<br>&gt; &gt; =C2=A0xen/Rules.mk =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A01 +<br>&gt; &gt; =C2=A0x=
en/arch/x86/Makefile =C2=A0 =C2=A0 =C2=A0| =C2=A04 +++-<br>&gt; &gt; =C2=A0=
xen/common/coverage/llvm.c | 24 +++++++++++++++++++++++-<br>&gt; &gt; =C2=
=A04 files changed, 28 insertions(+), 3 deletions(-)<br>&gt; &gt;<br>&gt; &=
gt; diff --git a/xen/Kconfig b/xen/Kconfig<br>&gt; &gt; index a5e5af3b76..5=
508993f02 100644<br>&gt; &gt; --- a/xen/Kconfig<br>&gt; &gt; +++ b/xen/Kcon=
fig<br>&gt; &gt; @@ -53,7 +53,7 @@ config CC_HAS_ASM_GOTO_OUTPUT<br>&gt; &g=
t; <br>&gt; &gt; =C2=A0# Compiler supports -fcondition-coverage aka MC/DC<b=
r>&gt; &gt; =C2=A0config CC_HAS_MCDC<br>&gt; &gt; - =C2=A0 =C2=A0 def_bool =
$(cc-option,-fcondition-coverage)<br>&gt; &gt; + =C2=A0 =C2=A0 def_bool $(c=
c-option,-fcondition-coverage) || $(cc-option,-fprofile-instr-generate -fco=
verage-mapping -fcoverage-mcdc)<br>&gt;<br>&gt; ... more than that one opti=
on here. Presumably because the option alone<br>&gt; wouldn&#39;t be liked =
by the compiler? (May want mentioning in that part of the<br>&gt; descripti=
on.)<br>&gt;<div><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif"></div><div class=3D"gmail_default" style=3D"font-family:georgia,seri=
f">Yes, That is because &#39;-fcoverage-mcdc&#39; only allowed with &#39;-f=
coverage-mapping&#39; and=C2=A0<span style=3D"font-family:Arial,Helvetica,s=
ans-serif">&#39;-fcoverage-mapping&#39; only allowed with &#39;-fprofile-in=
str-generate&#39;.</span></div><div class=3D"gmail_default" style=3D"font-f=
amily:georgia,serif"><span style=3D"font-family:Arial,Helvetica,sans-serif"=
>I will add this to the description.</span></div><div class=3D"gmail_defaul=
t" style=3D"font-family:georgia,serif"><span style=3D"font-family:Arial,Hel=
vetica,sans-serif">Thanks.</span></div><div class=3D"gmail_default" style=
=3D"font-family:georgia,serif"><span style=3D"font-family:Arial,Helvetica,s=
ans-serif"><br></span></div>&gt; &gt; --- a/xen/arch/x86/Makefile<br>&gt; &=
gt; +++ b/xen/arch/x86/Makefile<br>&gt; &gt; @@ -99,7 +99,9 @@ ifneq ($(CON=
FIG_HVM),y)<br>&gt; &gt; =C2=A0$(obj)/x86_emulate.o: CFLAGS-y +=3D -Wno-unu=
sed-label<br>&gt; &gt; =C2=A0endif<br>&gt; &gt; =C2=A0ifeq ($(CONFIG_CONDIT=
ION_COVERAGE),y)<br>&gt; &gt; -$(obj)/x86_emulate.o: CFLAGS-y +=3D -Wno-err=
or=3Dcoverage-too-many-conditions<br>&gt; &gt; + =C2=A0 =C2=A0ifeq ($(CONFI=
G_CC_IS_GCC),y)<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0$(obj)/x86_emulat=
e.o: CFLAGS-y +=3D -Wno-error=3Dcoverage-too-many-conditions<br>&gt; &gt; +=
 =C2=A0 =C2=A0endif<br>&gt; &gt; =C2=A0endif<br>&gt;<br>&gt; Please can the=
 two conditionals be combined, like I think we do elsewhere:<br>&gt;<br>&gt=
; ifeq ($(CONFIG_CONDITION_COVERAGE)$(CONFIG_CC_IS_GCC),yy)<br>&gt;<br>&gt;=
 or<br>&gt;<br>&gt; ifeq ($(CONFIG_CONDITION_COVERAGE)_$(CONFIG_CC_IS_GCC),=
y_y)<br>&gt;<br>&gt; ?</div><div><br></div><div>I initially kept the nestin=
g because I found several similar cases in the=C2=A0<span class=3D"gmail_de=
fault" style=3D"font-family:georgia,serif">code base</span> that weren=E2=
=80=99t merged<span class=3D"gmail_default" style=3D"font-family:georgia,se=
rif">=C2=A0</span>, so I assumed it was intentional<span class=3D"gmail_def=
ault" style=3D"font-family:georgia,serif">.</span></div><div>No problem at =
all<span class=3D"gmail_default" style=3D"font-family:georgia,serif">, I wi=
ll combine them.</span></div><div><span class=3D"gmail_default" style=3D"fo=
nt-family:georgia,serif">Thanks.</span></div><div><span class=3D"gmail_defa=
ult" style=3D"font-family:georgia,serif"><br></span></div><div>&gt;</div><d=
iv>&gt; Jan</div></div>

--0000000000006c83fc064454c22a--

