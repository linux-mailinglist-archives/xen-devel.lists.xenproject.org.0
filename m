Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B72674AC73
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 10:04:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560256.876028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHgS1-0001TP-3N; Fri, 07 Jul 2023 08:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560256.876028; Fri, 07 Jul 2023 08:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHgS1-0001R3-0f; Fri, 07 Jul 2023 08:04:25 +0000
Received: by outflank-mailman (input) for mailman id 560256;
 Fri, 07 Jul 2023 08:04:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kjyJ=CZ=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qHgRz-0001Qx-IV
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 08:04:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0ecd79e-1c9c-11ee-8611-37d641c3527e;
 Fri, 07 Jul 2023 10:04:21 +0200 (CEST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43])
 by support.bugseng.com (Postfix) with ESMTPSA id D28C54EE0C81
 for <xen-devel@lists.xenproject.org>; Fri,  7 Jul 2023 10:04:20 +0200 (CEST)
Received: by mail-vs1-f43.google.com with SMTP id
 ada2fe7eead31-4435fa903f2so461218137.1
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jul 2023 01:04:20 -0700 (PDT)
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
X-Inumbo-ID: e0ecd79e-1c9c-11ee-8611-37d641c3527e
X-Gm-Message-State: ABy/qLYOezixCXspRO7VZuj4cAb3CngAUx7xEbKseMHrMRaupj1Nulh0
	xaDVKwLb6rRcDU1U7ScrpE6weEc8jpGNN6pm9ss=
X-Google-Smtp-Source: APBJJlHJt/ErQDGaFXVOzwKh40ls2rwgzcKDTlwc65574Q5c4UNx7l3WZ6j2Bfz71WCQSWvnC+zS71ZUZQZLl+G+9OM=
X-Received: by 2002:a67:d095:0:b0:443:8a2a:9481 with SMTP id
 s21-20020a67d095000000b004438a2a9481mr1824643vsi.2.1688717059564; Fri, 07 Jul
 2023 01:04:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <e414542d76d4a4a0df6ad969cc6332e355d6ef38.1688559115.git.gianluca.luparini@bugseng.com>
 <a343fc97-84df-48e6-1c91-cd933c6e5210@suse.com> <CAFHJcJu=S2JtFJy_XnMhrr0gP7+sPfvrS_1940qzL9rc_j60nA@mail.gmail.com>
 <f93f0561-abea-bdae-223e-d69932e435c4@suse.com> <CAFHJcJuP7hH01ZiwNe0HHBM=JpBtsF9sDD7fushyBxDQ9UZicw@mail.gmail.com>
 <fb29cca6-454c-82ed-b6a8-ac9814f81cfa@suse.com>
In-Reply-To: <fb29cca6-454c-82ed-b6a8-ac9814f81cfa@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Date: Fri, 7 Jul 2023 10:04:08 +0200
X-Gmail-Original-Message-ID: <CAFHJcJuCddmwMAB=26tVBfgThQWLZb5kZU3GBdC0aTTcvJ4O1w@mail.gmail.com>
Message-ID: <CAFHJcJuCddmwMAB=26tVBfgThQWLZb5kZU3GBdC0aTTcvJ4O1w@mail.gmail.com>
Subject: Re: [XEN PATCH v2 12/13] xen/x86: fix violations of MISRA C:2012 Rule 7.2
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Gianluca Luparini <gianluca.luparini@bugseng.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Michal Orzel <michal.orzel@amd.com>, Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, 
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000762c8405ffe11458"

--000000000000762c8405ffe11458
Content-Type: text/plain; charset="UTF-8"

Il giorno ven 7 lug 2023 alle ore 09:04 Jan Beulich <jbeulich@suse.com> ha
scritto:

> On 07.07.2023 08:50, Simone Ballarin wrote:
> > Il giorno gio 6 lug 2023 alle ore 18:22 Jan Beulich <jbeulich@suse.com>
> ha
> > scritto:
> >
> >> On 06.07.2023 18:08, Simone Ballarin wrote:
> >>> Il giorno gio 6 lug 2023 alle ore 10:26 Jan Beulich <jbeulich@suse.com
> >
> >> ha
> >>> scritto:
> >>>
> >>>> On 05.07.2023 17:26, Simone Ballarin wrote:
> >>>>> --- a/xen/arch/x86/apic.c
> >>>>> +++ b/xen/arch/x86/apic.c
> >>>>> @@ -1211,7 +1211,7 @@ static void __init calibrate_APIC_clock(void)
> >>>>>       * Setup the APIC counter to maximum. There is no way the lapic
> >>>>>       * can underflow in the 100ms detection time frame.
> >>>>>       */
> >>>>> -    __setup_APIC_LVTT(0xffffffff);
> >>>>> +    __setup_APIC_LVTT(0xffffffffU);
> >>>>
> >>>> While making the change less mechanical, we want to consider to switch
> >>>> to ~0 in this and similar cases.
> >>>>
> >>>
> >>> Changing ~0U is more than not mechanical: it is possibly dangerous.
> >>> The resulting value could be different depending on the architecture,
> >>> I prefer to not make such kind of changes in a MISRA-related patch.
> >>
> >> What do you mean by "depending on the architecture", when this is
> >> x86-only code _and_ you can check what type parameter the called
> >> function has?
> >
> > Ok, I will change these literals in ~0U in the next submission.
>
> Except that I specifically meant ~0, not ~0U. We mean "maximum value"
> here, and at the call site it doesn't matter how wide the function
> parameter's type is. If it was 64-bit, ~0U would not do what is wanted.
>
> Jan
>

~0 is not a MISRA-compliant solution since bitwise operations on signed
integers have implementation-defined behavior. This solution definitively
violates Rule 10.1.
As you said ~0 is different than ~0U, 0xffffffffU, and 0xffffffff, so using
~0 means changing the semantics of the code: this is not the aim of the
patch.

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com
<http://bugseng.com>)

--000000000000762c8405ffe11458
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"ltr"><br></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">Il giorno ven 7 lug 2023 alle or=
e 09:04 Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.=
com</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On 07.07.2023 08:50, Simone Ballarin wrote:<br>
&gt; Il giorno gio 6 lug 2023 alle ore 18:22 Jan Beulich &lt;<a href=3D"mai=
lto:jbeulich@suse.com" target=3D"_blank">jbeulich@suse.com</a>&gt; ha<br>
&gt; scritto:<br>
&gt; <br>
&gt;&gt; On 06.07.2023 18:08, Simone Ballarin wrote:<br>
&gt;&gt;&gt; Il giorno gio 6 lug 2023 alle ore 10:26 Jan Beulich &lt;<a hre=
f=3D"mailto:jbeulich@suse.com" target=3D"_blank">jbeulich@suse.com</a>&gt;<=
br>
&gt;&gt; ha<br>
&gt;&gt;&gt; scritto:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On 05.07.2023 17:26, Simone Ballarin wrote:<br>
&gt;&gt;&gt;&gt;&gt; --- a/xen/arch/x86/apic.c<br>
&gt;&gt;&gt;&gt;&gt; +++ b/xen/arch/x86/apic.c<br>
&gt;&gt;&gt;&gt;&gt; @@ -1211,7 +1211,7 @@ static void __init calibrate_API=
C_clock(void)<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* Setup the APIC counter to =
maximum. There is no way the lapic<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* can underflow in the 100ms=
 detection time frame.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 __setup_APIC_LVTT(0xffffffff);<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 __setup_APIC_LVTT(0xffffffffU);<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; While making the change less mechanical, we want to consid=
er to switch<br>
&gt;&gt;&gt;&gt; to ~0 in this and similar cases.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Changing ~0U is more than not mechanical: it is possibly dange=
rous.<br>
&gt;&gt;&gt; The resulting value could be different depending on the archit=
ecture,<br>
&gt;&gt;&gt; I prefer to not make such kind of changes in a MISRA-related p=
atch.<br>
&gt;&gt;<br>
&gt;&gt; What do you mean by &quot;depending on the architecture&quot;, whe=
n this is<br>
&gt;&gt; x86-only code _and_ you can check what type parameter the called<b=
r>
&gt;&gt; function has?<br>
&gt; <br>
&gt; Ok, I will change these literals in ~0U in the next submission.<br>
<br>
Except that I specifically meant ~0, not ~0U. We mean &quot;maximum value&q=
uot;<br>
here, and at the call site it doesn&#39;t matter how wide the function<br>
parameter&#39;s type is. If it was 64-bit, ~0U would not do what is wanted.=
<br>
<br>
Jan<br>
</blockquote></div><br clear=3D"all"></div>~0 is not a MISRA-compliant solu=
tion since bitwise operations on signed integers have implementation-define=
d behavior. This solution definitively violates Rule 10.1. <br>As you said =
~0 is different than ~0U, 0xffffffffU, and 0xffffffff, so using ~0 means ch=
anging the semantics of the code: this is not the aim of the patch.<div><br=
></div><div><span class=3D"gmail_signature_prefix">-- </span><br><div dir=
=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr">Simone Ballarin, M.Sc.<=
br><br><div>Field Application Engineer, BUGSENG (<a href=3D"http://bugseng.=
com" target=3D"_blank">https://bugseng.com</a>)</div></div></div></div></di=
v>

--000000000000762c8405ffe11458--

