Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 806F7FA9E1
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 06:54:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUlXw-0003Ls-Dk; Wed, 13 Nov 2019 05:50:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u0j9=ZF=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iUlXu-0003Ln-1l
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 05:50:26 +0000
X-Inumbo-ID: 7c2c1e46-05d9-11ea-984a-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c2c1e46-05d9-11ea-984a-bc764e2007e4;
 Wed, 13 Nov 2019 05:50:24 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id t5so1139316ljk.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2019 21:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qs9/F/SR5MeYzfD6wLEksc6fT3Q/RKeIhloVvLPkkig=;
 b=vV1KA0BCAX04UiOGB7eK63MieH6GNJsxPWkij1xDZo0Tunq4dyz8kh6VvUZ3oB9KeB
 /JEQvURHK1VN5yz8+PItXa84L7o0uw6bbfu3QF9uhF5axiqhuolKTKkOpESwQJjzgrgP
 jMj9l9je6RAKr+BC7EAJECGkyYq1clxASbQFb18bVPYATqL21E3OKhMsg8t53kTGI5nP
 OQ971jPvehcAqaAsLKVA1AmvbDfrzoayFxld768k2sfKmFvkC8oDvS/DYBDGkM7Ksnc5
 1H4hDOCUs05r/ibuRTIr47FrdP1scJk93F+UHPyJ41SUXe5mLgYPjwjAkTId1U6E9UFf
 mqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qs9/F/SR5MeYzfD6wLEksc6fT3Q/RKeIhloVvLPkkig=;
 b=WWODR66Y91r1J1L5n+T9WPI+XzrDjFxK+8wd5Lw5EmMgoyexEc6aF8mnALzloB+nig
 pYWzlkDn5Y9NsaZTmClzbOWCvVg/wzZDBgszfspOwREk0A1metymTuEWwOkRNVaGkNnB
 jVqYnF0lDCzup5nIbObOziIa2U1yLXRHlzvbaXrlHh339CbMm7m3v5ypCZtS+XGEhs0c
 09nsHJuHcbdKSa4YSe/AsuDyyneqdhUQVnoiHwQY9Duj0E6Rf8cK/2y2fucqxfiN15SN
 GEjVHPPR9v4D+ziO7bMCvRsCBwXpUj3WqKcJLDKXe11lq00nkl+/fEsceNZb2sBKLcEa
 EJpw==
X-Gm-Message-State: APjAAAVYE11Q+vpHSgEnCes38LaQRg6P/4qinOrn/zeQchdtUSxmO2xW
 +pOJywQZqCkCjDF3gkpv/UPhXveQyuoKG9ua+uc=
X-Google-Smtp-Source: APXvYqwXRa0GRvNfZR8CRjno3cMlqKivFwznjI+hHjiC+YMCyBdnlKwIx5VKHwTi2dzeKqocVAuGnCi0qEWh4DtiRC8=
X-Received: by 2002:a05:651c:20a:: with SMTP id
 y10mr1109932ljn.76.1573624223375; 
 Tue, 12 Nov 2019 21:50:23 -0800 (PST)
MIME-Version: 1.0
References: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
 <1573031953-12894-6-git-send-email-andrii.anisov@gmail.com>
 <alpine.DEB.2.21.1911111303040.2677@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1911111303040.2677@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Wed, 13 Nov 2019 14:50:10 +0900
Message-ID: <CAJ=z9a0OreBvHN9gdfBcQCG7qORo-XpReXz7MyTPEnguCTDYiQ@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [Xen-devel] [RFC 5/7] WIP:arm64:armds: Build XEN with ARM
 Compiler 6.6
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Andrii Anisov <andrii.anisov@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: multipart/mixed; boundary="===============7000746368081187454=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7000746368081187454==
Content-Type: multipart/alternative; boundary="000000000000d823e2059733f0a8"

--000000000000d823e2059733f0a8
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Nov 2019, 06:27 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> On Wed, 6 Nov 2019, Andrii Anisov wrote:
> > From: Andrii Anisov <andrii_anisov@epam.com>
> >
> > Here several ARM Compiler 6.6 issues are solved or provided a
> work-around:
> >
> >  - Scatter file is pretty primitive, it has no feature to define symbols
> >  - ARM linker defined symbols are not counted as referred if only
> mentioned
> >    in a steering file for rename or resolve, so a header file is used to
> >    redefine GNU linker script symbols into armlink defined symbols.
> >
> >  - _srodata type clashes by type with __start_bug_frames so can not be
> both
> >    redefined as Load$$_rodata_bug_frames_0$$Base. Use resolve feature of
> armlink
> >    steering file.
>
> Why _srodata and __start_bug_frames cannot both be defined as
> Load$$_rodata_bug_frames_0$$Base when actually in the case of:
>
> > +#define __per_cpu_data_end          Load$$_bss_percpu$$Limit
> > +#define __bss_end                   Load$$_bss_percpu$$Limit
> > +#define _end                        Load$$_bss_percpu$$Limit
>
> They are all defined as "Load$$_bss_percpu$$Limit"? And:
>
> > +#define __init_end                  Load$$_bss$$Base
> > +#define __bss_start                 Load$$_bss$$Base
>
> They are both defined as "Load$$_bss$$Base"? What's special about
> "Load$$_rodata_bug_frames_0$$Base"?
>
>
> >  - C style shift operators are missed among supported scatter file
> expressions,
> >    so some needed values are hardcoded in scatter file.
> >
> >  - Rename correspondent ARM Linker defined symbols to those needed by
> `symbols` tool
> >    using steering file feature.
> >
> >  - ARM Compiler 6.6 tools are not able to rename sections, so we still
> need
> >    GNU toolchain's objcopy for this.
> >
> > Signed-off-by: Andrii Anisov <andrii_anisov@epam.com>
> > ---
> >  xen/Rules.mk                |   6 +
> >  xen/arch/arm/Makefile       |  24 ++++
> >  xen/arch/arm/xen.scat.S     | 266
> ++++++++++++++++++++++++++++++++++++++++++++
>
> I would strongly suggest to rename this file with something not
> potentially related to scat
>

To be honest, I don't think this file should even exist. This looks like a
copy of xen.lds.S with a different syntax. Furthermore, the comments from
Stefano shows that is going to be hard to maintain/check everything has
been written correctly.

So how about trying to abstract xen.lds.S?


>
> > +/*
> > + * armlink does not understand shifts in scat file expressions
> > + * so hardcode needed values
> > + */
>

Please give a pointer to the doc of the armlink in the commit message. So
we can easily cross-check what's happening.

In this case, I don't particularly like the re-definition of the defines
outside of their header. This is going to make more difficult if we have to
update them in the future.

I can see a few ways to do it:

 - Avoid using shifts in the definitions
 - Find a way to evaluate the value (maybe similar to asn-offset) before
using them.

My preference would be the latter but I could be convinced for the former.

Cheers,

--000000000000d823e2059733f0a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, 12 Nov 2019, 06:27 Stefano Stabellini, &lt;<a =
href=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Wed, 6 Nov 2019, Andrii Anisov=
 wrote:<br>
&gt; From: Andrii Anisov &lt;<a href=3D"mailto:andrii_anisov@epam.com" targ=
et=3D"_blank" rel=3D"noreferrer">andrii_anisov@epam.com</a>&gt;<br>
&gt; <br>
&gt; Here several ARM Compiler 6.6 issues are solved or provided a work-aro=
und:<br>
&gt; <br>
&gt;=C2=A0 - Scatter file is pretty primitive, it has no feature to define =
symbols<br>
&gt;=C2=A0 - ARM linker defined symbols are not counted as referred if only=
 mentioned<br>
&gt;=C2=A0 =C2=A0 in a steering file for rename or resolve, so a header fil=
e is used to<br>
&gt;=C2=A0 =C2=A0 redefine GNU linker script symbols into armlink defined s=
ymbols.<br>
&gt; <br>
&gt;=C2=A0 - _srodata type clashes by type with __start_bug_frames so can n=
ot be both<br>
&gt;=C2=A0 =C2=A0 redefined as Load$$_rodata_bug_frames_0$$Base. Use resolv=
e feature of armlink<br>
&gt;=C2=A0 =C2=A0 steering file.<br>
<br>
Why _srodata and __start_bug_frames cannot both be defined as<br>
Load$$_rodata_bug_frames_0$$Base when actually in the case of:<br>
<br>
&gt; +#define __per_cpu_data_end=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Load$$_b=
ss_percpu$$Limit<br>
&gt; +#define __bss_end=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Load$$_bss_percpu$$Limit<br>
&gt; +#define _end=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Load$$_bss_percpu$$Limit<br>
<br>
They are all defined as &quot;Load$$_bss_percpu$$Limit&quot;? And:<br>
<br>
&gt; +#define __init_end=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Load$$_bss$$Base<br>
&gt; +#define __bss_start=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0Load$$_bss$$Base<br>
<br>
They are both defined as &quot;Load$$_bss$$Base&quot;? What&#39;s special a=
bout<br>
&quot;Load$$_rodata_bug_frames_0$$Base&quot;?<br>
<br>
<br>
&gt;=C2=A0 - C style shift operators are missed among supported scatter fil=
e expressions,<br>
&gt;=C2=A0 =C2=A0 so some needed values are hardcoded in scatter file.<br>
&gt; <br>
&gt;=C2=A0 - Rename correspondent ARM Linker defined symbols to those neede=
d by `symbols` tool<br>
&gt;=C2=A0 =C2=A0 using steering file feature.<br>
&gt; <br>
&gt;=C2=A0 - ARM Compiler 6.6 tools are not able to rename sections, so we =
still need<br>
&gt;=C2=A0 =C2=A0 GNU toolchain&#39;s objcopy for this.<br>
&gt; <br>
&gt; Signed-off-by: Andrii Anisov &lt;<a href=3D"mailto:andrii_anisov@epam.=
com" target=3D"_blank" rel=3D"noreferrer">andrii_anisov@epam.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 xen/Rules.mk=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A06 +<br>
&gt;=C2=A0 xen/arch/arm/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 24 ++++<=
br>
&gt;=C2=A0 xen/arch/arm/xen.scat.S=C2=A0 =C2=A0 =C2=A0| 266 +++++++++++++++=
+++++++++++++++++++++++++++++<br>
<br>
I would strongly suggest to rename this file with something not<br>
potentially related to scat<br></blockquote></div></div><div dir=3D"auto"><=
br></div><div dir=3D"auto">To be honest, I don&#39;t think this file should=
 even exist. This looks like a copy of xen.lds.S with a different syntax. F=
urthermore, the comments from Stefano shows that is going to be hard to mai=
ntain/check everything has been written correctly.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">So how about trying to abstract xen.lds.S?</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">
<br>
<br>
&gt; +/*<br>
&gt; + * armlink does not understand shifts in scat file expressions<br>
&gt; + * so hardcode needed values<br>
&gt; + */<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Please give a pointer to the doc of the armlink in the commit mes=
sage. So we can easily cross-check what&#39;s happening.</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">In this case, I don&#39;t particularly lik=
e the re-definition of the defines outside of their header. This is going t=
o make more difficult if we have to update them in the future.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">I can see a few ways to do it:</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">=C2=A0- Avoid using shifts in=
 the definitions</div><div dir=3D"auto">=C2=A0- Find a way to evaluate the =
value (maybe similar to asn-offset) before using them.</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">My preference would be the latter but I coul=
d be convinced for the former.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Cheers,</div></div>

--000000000000d823e2059733f0a8--


--===============7000746368081187454==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7000746368081187454==--

