Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C43F736E25
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 15:59:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551894.861656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBbtZ-0003RS-R3; Tue, 20 Jun 2023 13:59:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551894.861656; Tue, 20 Jun 2023 13:59:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBbtZ-0003Pf-NG; Tue, 20 Jun 2023 13:59:45 +0000
Received: by outflank-mailman (input) for mailman id 551894;
 Tue, 20 Jun 2023 13:59:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ovpU=CI=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qBbtY-0003PZ-3K
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 13:59:44 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b45a1b75-0f72-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 15:59:42 +0200 (CEST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by support.bugseng.com (Postfix) with ESMTPSA id EF7354EE0749
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 15:59:41 +0200 (CEST)
Received: by mail-ua1-f46.google.com with SMTP id
 a1e0cc1a2514c-78f208ebf29so1221527241.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 06:59:41 -0700 (PDT)
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
X-Inumbo-ID: b45a1b75-0f72-11ee-8611-37d641c3527e
X-Gm-Message-State: AC+VfDwc1cyyTxxLvzY/LxCd52OreyEGO5nH8964hPaRRF4uKAyG/dQb
	MNI0/Hr2bQgNLF4PTWr0aIHXbOta7iUvxIBHxN8=
X-Google-Smtp-Source: ACHHUZ5hOYfYHvDFwXrlZOKCM+9FobcfyJ/FbbBKRsa2JR9pupyewF/8FlWUSfP+x1uMgPSDQDfscEv+YBNobMEG2mQ=
X-Received: by 2002:a05:6102:e4d:b0:440:980d:a569 with SMTP id
 p13-20020a0561020e4d00b00440980da569mr2963069vst.24.1687269580850; Tue, 20
 Jun 2023 06:59:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1687250177.git.gianluca.luparini@bugseng.com>
 <3560de5fd05a67cc10c9426ffd55639ebe24d98d.1687250177.git.gianluca.luparini@bugseng.com>
 <7837d4f0-ebb2-b420-7af6-d8b3c6b2daa3@suse.com>
In-Reply-To: <7837d4f0-ebb2-b420-7af6-d8b3c6b2daa3@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Date: Tue, 20 Jun 2023 15:59:28 +0200
X-Gmail-Original-Message-ID: <CAFHJcJunx5qsiZvpQ5udwmrdM5njEZS8OBiPGrjbGyr-8hkFEA@mail.gmail.com>
Message-ID: <CAFHJcJunx5qsiZvpQ5udwmrdM5njEZS8OBiPGrjbGyr-8hkFEA@mail.gmail.com>
Subject: Re: [XEN PATCH 13/13] xen: fixed violations of MISRA C:2012 Rule 7.2
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Gianluca Luparini <gianluca.luparini@bugseng.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>, Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, 
	Ayan Kumar <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000001d92105fe901067"

--00000000000001d92105fe901067
Content-Type: text/plain; charset="UTF-8"

Hi,

Il giorno mar 20 giu 2023 alle ore 15:20 Jan Beulich <jbeulich@suse.com> ha
scritto:

> On 20.06.2023 12:35, Simone Ballarin wrote:
> > --- a/xen/common/gunzip.c
> > +++ b/xen/common/gunzip.c
> > @@ -11,7 +11,7 @@ static unsigned char *__initdata window;
> >  static memptr __initdata free_mem_ptr;
> >  static memptr __initdata free_mem_end_ptr;
> >
> > -#define WSIZE           0x80000000
> > +#define WSIZE           0x80000000U
>
> This again is an imported file, which I'm not sure we want to touch like
> this. (Then again it's only a single line change.)
>

This file is not present in exclude-list.json, in any case, I can remove
the change.


>
> > --- a/xen/lib/muldiv64.c
> > +++ b/xen/lib/muldiv64.c
> > @@ -27,7 +27,7 @@ uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)
> >      rh = (uint64_t)u.l.high * (uint64_t)b;
> >      rh += (rl >> 32);
> >      res.l.high = rh / c;
> > -    res.l.low = (((rh % c) << 32) + (rl & 0xffffffff)) / c;
> > +    res.l.low = (((rh % c) << 32) + (rl & 0xffffffffU)) / c;
>
> This might be neater and more consistent with surrounding code if
> switched to (uint32_t)rl.
>
> Jan
>

Ok.

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com
<http://bugseng.com>)

--00000000000001d92105fe901067
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<br></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">Il giorno mar 20 giu 2023 alle ore=
 15:20 Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.c=
om</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On 20.06.2023 12:35, Simone Ballarin wrote:<br>
&gt; --- a/xen/common/gunzip.c<br>
&gt; +++ b/xen/common/gunzip.c<br>
&gt; @@ -11,7 +11,7 @@ static unsigned char *__initdata window;<br>
&gt;=C2=A0 static memptr __initdata free_mem_ptr;<br>
&gt;=C2=A0 static memptr __initdata free_mem_end_ptr;<br>
&gt;=C2=A0 <br>
&gt; -#define WSIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x80000000<br>
&gt; +#define WSIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x80000000U<br>
<br>
This again is an imported file, which I&#39;m not sure we want to touch lik=
e<br>
this. (Then again it&#39;s only a single line change.)<br></blockquote><div=
><br></div><div>This file is not present in exclude-list.json, in any case,=
 I can remove the change.<br> </div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
&gt; --- a/xen/lib/muldiv64.c<br>
&gt; +++ b/xen/lib/muldiv64.c<br>
&gt; @@ -27,7 +27,7 @@ uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rh =3D (uint64_t)u.l.high * (uint64_t)b;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rh +=3D (rl &gt;&gt; 32);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 res.l.high =3D rh / c;<br>
&gt; -=C2=A0 =C2=A0 res.l.low =3D (((rh % c) &lt;&lt; 32) + (rl &amp; 0xfff=
fffff)) / c;<br>
&gt; +=C2=A0 =C2=A0 res.l.low =3D (((rh % c) &lt;&lt; 32) + (rl &amp; 0xfff=
fffffU)) / c;<br>
<br>
This might be neater and more consistent with surrounding code if<br>
switched to (uint32_t)rl.<br>
<br>
Jan<br>
</blockquote></div><br clear=3D"all"><div>Ok.<br></div><div><br></div><span=
 class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr">Simone Ballarin, M.Sc.<br><br><div>Field A=
pplication Engineer, BUGSENG (<a href=3D"http://bugseng.com" target=3D"_bla=
nk">https://bugseng.com</a>)</div></div></div></div>

--00000000000001d92105fe901067--

