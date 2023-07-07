Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC3474AB5F
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 08:50:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560188.875900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHfIW-0004qu-Fi; Fri, 07 Jul 2023 06:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560188.875900; Fri, 07 Jul 2023 06:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHfIW-0004oz-Cv; Fri, 07 Jul 2023 06:50:32 +0000
Received: by outflank-mailman (input) for mailman id 560188;
 Fri, 07 Jul 2023 06:50:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kjyJ=CZ=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qHfIV-0004ot-Oo
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 06:50:31 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8feb7c99-1c92-11ee-b237-6b7b168915f2;
 Fri, 07 Jul 2023 08:50:30 +0200 (CEST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47])
 by support.bugseng.com (Postfix) with ESMTPSA id C25094EE0C8A
 for <xen-devel@lists.xenproject.org>; Fri,  7 Jul 2023 08:50:29 +0200 (CEST)
Received: by mail-vs1-f47.google.com with SMTP id
 ada2fe7eead31-440d1ba5662so444368137.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jul 2023 23:50:29 -0700 (PDT)
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
X-Inumbo-ID: 8feb7c99-1c92-11ee-b237-6b7b168915f2
X-Gm-Message-State: ABy/qLa6TTUUk7lhm5Tkzw5bQSaor7onN2gw70to/QQkyj4TAq3r/Kku
	JFuDFfwirnX3I0btc4iKnqdS8O6424+skbaBFIk=
X-Google-Smtp-Source: APBJJlEUqloS7arAgvE4VvKY/f3qIKSNai+0lSuTslQ6l8PyeHrZUBWmHGZImZ0a6iZsuLCkJ7R3bVEDKbf6Fmux6rA=
X-Received: by 2002:a67:fdc7:0:b0:444:c7fa:15e6 with SMTP id
 l7-20020a67fdc7000000b00444c7fa15e6mr1633497vsq.9.1688712628641; Thu, 06 Jul
 2023 23:50:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <e414542d76d4a4a0df6ad969cc6332e355d6ef38.1688559115.git.gianluca.luparini@bugseng.com>
 <a343fc97-84df-48e6-1c91-cd933c6e5210@suse.com> <CAFHJcJu=S2JtFJy_XnMhrr0gP7+sPfvrS_1940qzL9rc_j60nA@mail.gmail.com>
 <f93f0561-abea-bdae-223e-d69932e435c4@suse.com>
In-Reply-To: <f93f0561-abea-bdae-223e-d69932e435c4@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Date: Fri, 7 Jul 2023 08:50:16 +0200
X-Gmail-Original-Message-ID: <CAFHJcJuP7hH01ZiwNe0HHBM=JpBtsF9sDD7fushyBxDQ9UZicw@mail.gmail.com>
Message-ID: <CAFHJcJuP7hH01ZiwNe0HHBM=JpBtsF9sDD7fushyBxDQ9UZicw@mail.gmail.com>
Subject: Re: [XEN PATCH v2 12/13] xen/x86: fix violations of MISRA C:2012 Rule 7.2
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Gianluca Luparini <gianluca.luparini@bugseng.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Michal Orzel <michal.orzel@amd.com>, Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, 
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000005ba44a05ffe00cc6"

--0000000000005ba44a05ffe00cc6
Content-Type: text/plain; charset="UTF-8"

Il giorno gio 6 lug 2023 alle ore 18:22 Jan Beulich <jbeulich@suse.com> ha
scritto:

> On 06.07.2023 18:08, Simone Ballarin wrote:
> > Il giorno gio 6 lug 2023 alle ore 10:26 Jan Beulich <jbeulich@suse.com>
> ha
> > scritto:
> >
> >> On 05.07.2023 17:26, Simone Ballarin wrote:
> >>> --- a/xen/arch/x86/apic.c
> >>> +++ b/xen/arch/x86/apic.c
> >>> @@ -1211,7 +1211,7 @@ static void __init calibrate_APIC_clock(void)
> >>>       * Setup the APIC counter to maximum. There is no way the lapic
> >>>       * can underflow in the 100ms detection time frame.
> >>>       */
> >>> -    __setup_APIC_LVTT(0xffffffff);
> >>> +    __setup_APIC_LVTT(0xffffffffU);
> >>
> >> While making the change less mechanical, we want to consider to switch
> >> to ~0 in this and similar cases.
> >>
> >
> > Changing ~0U is more than not mechanical: it is possibly dangerous.
> > The resulting value could be different depending on the architecture,
> > I prefer to not make such kind of changes in a MISRA-related patch.
>
> What do you mean by "depending on the architecture", when this is
> x86-only code _and_ you can check what type parameter the called
> function has?
>
> Jan
>

Ok, I will change these literals in ~0U in the next submission.
-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com
<http://bugseng.com>)

--0000000000005ba44a05ffe00cc6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"ltr"><br></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">Il giorno gio 6 lug 2023 alle or=
e 18:22 Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.=
com</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On 06.07.2023 18:08, Simone Ballarin wrote:<br>
&gt; Il giorno gio 6 lug 2023 alle ore 10:26 Jan Beulich &lt;<a href=3D"mai=
lto:jbeulich@suse.com" target=3D"_blank">jbeulich@suse.com</a>&gt; ha<br>
&gt; scritto:<br>
&gt; <br>
&gt;&gt; On 05.07.2023 17:26, Simone Ballarin wrote:<br>
&gt;&gt;&gt; --- a/xen/arch/x86/apic.c<br>
&gt;&gt;&gt; +++ b/xen/arch/x86/apic.c<br>
&gt;&gt;&gt; @@ -1211,7 +1211,7 @@ static void __init calibrate_APIC_clock(=
void)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* Setup the APIC counter to maximum.=
 There is no way the lapic<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* can underflow in the 100ms detecti=
on time frame.<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 __setup_APIC_LVTT(0xffffffff);<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 __setup_APIC_LVTT(0xffffffffU);<br>
&gt;&gt;<br>
&gt;&gt; While making the change less mechanical, we want to consider to sw=
itch<br>
&gt;&gt; to ~0 in this and similar cases.<br>
&gt;&gt;<br>
&gt; <br>
&gt; Changing ~0U is more than not mechanical: it is possibly dangerous.<br=
>
&gt; The resulting value could be different depending on the architecture,<=
br>
&gt; I prefer to not make such kind of changes in a MISRA-related patch.<br=
>
<br>
What do you mean by &quot;depending on the architecture&quot;, when this is=
<br>
x86-only code _and_ you can check what type parameter the called<br>
function has?<br>
<br>
Jan<br>
</blockquote></div><br clear=3D"all"></div>Ok, I will change these literals=
 in ~0U in the next submission.<br><div><span class=3D"gmail_signature_pref=
ix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"lt=
r">Simone Ballarin, M.Sc.<br><br><div>Field Application Engineer, BUGSENG (=
<a href=3D"http://bugseng.com" target=3D"_blank">https://bugseng.com</a>)</=
div></div></div></div></div>

--0000000000005ba44a05ffe00cc6--

