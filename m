Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50483380091
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 00:59:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127106.238814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhKIh-0001ip-B5; Thu, 13 May 2021 22:59:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127106.238814; Thu, 13 May 2021 22:59:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhKIh-0001gd-7E; Thu, 13 May 2021 22:59:27 +0000
Received: by outflank-mailman (input) for mailman id 127106;
 Thu, 13 May 2021 22:59:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zrL7=KI=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1lhKIf-0001gT-Ns
 for xen-devel@lists.xenproject.org; Thu, 13 May 2021 22:59:25 +0000
Received: from mail-ej1-x632.google.com (unknown [2a00:1450:4864:20::632])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9aef104c-0bfb-4de3-a30f-f3b27be6dfd3;
 Thu, 13 May 2021 22:59:24 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id u21so42028182ejo.13
 for <xen-devel@lists.xenproject.org>; Thu, 13 May 2021 15:59:24 -0700 (PDT)
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
X-Inumbo-ID: 9aef104c-0bfb-4de3-a30f-f3b27be6dfd3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iHbZSskysz//rzg/J/U/CPVDeQUSyKDFXBsEtO6wAsk=;
        b=c4IiTnwj5ZjXKB15fI1gV8Jew6IFfOEirnZKZGW+PQf7m9+u+zYsfzsTmNKOzcYCf2
         TufKQQjfu+4uu3JQ4SB+eLT1FOWlXzUKPXBdIMprlScFAFSTZpD5gToIPRhPzIH/YeIF
         d0p8v4ykEh3DYmLa6FZ8QKT5nBH/1xCCzoIv/wiOU3SWd7n8/LWLphVLMLT5SuJoFP4U
         8s3HYNxGpS36X0ZRPPUVhzizSmzSgP9Tq7Knjby12nf3dI/frygAUc3YE97nd4uHXqBQ
         MokHJqAMxAVAxTxMY1RiFWZFyxGKw4c/w+tG3vBvXEKkyMG7E9krUpFiD9+wZDaXy1Qy
         RZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iHbZSskysz//rzg/J/U/CPVDeQUSyKDFXBsEtO6wAsk=;
        b=eknWbGHbid2m8PJG7AVkX+mUqBCq6X0mL7pgWDCJyvcyfNIy31/9/gqg7yU8LxfbI+
         /9JrLM8mF0JqWXBA/CR7r48+/oCxGRDDumgaZY4/UZtU605maD/znY13HRBgiHYQm4pG
         vq6tttLGAHjziYsFgb8hweFYOyzZ+rEWMV/tiR4ftOpZZ0EONOc5YV4he9AaCRGStLHJ
         ixrfEkiec4arnPU3H1rHDYmOas91Km6EFViyCqLTfnSsNmRvSCjA+VkTWlbIz9eMuzEp
         MxAfDg5XJ3LQqHwgJqqOCiuYqXOJXt7RqPGCW6HZa3G+hOok3VXBHwaaa8Q5mpyqQhiz
         dMbg==
X-Gm-Message-State: AOAM532rIC2xVxP2bETgMudovWb4Tltn4lMRpD+JU2Sh0R2Gwbd2+4w9
	VwJTf6pS0U8+bBlEuR9RzKqTPj5goa0eIZQyRXk=
X-Google-Smtp-Source: ABdhPJxE/CH8XOP455+qI0x7WsL04Do3u1JmWZNPPEWo6czS+atSjxl6pF4Xtowu/DWbujf1MOanWlE3MNZD1HrHr4w=
X-Received: by 2002:a17:906:e28c:: with SMTP id gg12mr45600715ejb.483.1620946763640;
 Thu, 13 May 2021 15:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210425201318.15447-1-julien@xen.org> <20210425201318.15447-9-julien@xen.org>
 <alpine.DEB.2.21.2105121448090.5018@sstabellini-ThinkPad-T480s>
 <caec9741-8c0e-b80a-1020-c985beb1e100@xen.org> <alpine.DEB.2.21.2105131528230.5018@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2105131528230.5018@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Thu, 13 May 2021 23:59:13 +0100
Message-ID: <CAJ=z9a18zq06AKTGRJHHzR1JeabdO+-FKTmu77ZmdPdQQi=NMA@mail.gmail.com>
Subject: Re: [PATCH RFCv2 08/15] xen/arm32: mm: Check if the virtual address
 is shared before updating it
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, Henry.Wang@arm.com, 
	Penny.Zheng@arm.com, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	Julien Grall <jgrall@amazon.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: multipart/alternative; boundary="0000000000000bf2b905c23e143d"

--0000000000000bf2b905c23e143d
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 May 2021, 23:32 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> On Wed, 12 May 2021, Julien Grall wrote:
> > Hi Stefano,
> >
> > On 12/05/2021 23:00, Stefano Stabellini wrote:
> > > On Sun, 25 Apr 2021, Julien Grall wrote:
> > > > From: Julien Grall <jgrall@amazon.com>
> > > >
> > > > Only the first 2GB of the virtual address space is shared between all
> > > > the page-tables on Arm32.
> > > >
> > > > There is a long outstanding TODO in xen_pt_update() stating that the
> > > > function is can only work with shared mapping. Nobody has ever called
> > >             ^ remove
> > >
> > > > the function with private mapping, however as we add more callers
> > > > there is a risk to mess things up.
> > > >
> > > > Introduce a new define to mark the ened of the shared mappings and
> use
> > >                                       ^end
> > >
> > > > it in xen_pt_update() to verify if the address is correct.
> > > >
> > > > Note that on Arm64, all the mappings are shared. Some compiler may
> > > > complain about an always true check, so the new define is not
> introduced
> > > > for arm64 and the code is protected with an #ifdef.
> > >   On arm64 we could maybe define SHARED_VIRT_END to an arbitrarely
> large
> > > value, such as:
> > >
> > > #define SHARED_VIRT_END (1UL<<48)
> > >
> > > or:
> > >
> > > #define SHARED_VIRT_END DIRECTMAP_VIRT_END
> > >
> > > ?
> >
> > I thought about it but I didn't want to define to a random value... I
> felt not
> > define it was better.
>
> Yeah, I see your point: any restrictions in addressing (e.g. 48bits)
> are physical address restrictions. Here we are talking about virtual
> address restriction, and I don't think there are actually any
> restrictions there?  We could validly map something at
> 0xffff_ffff_ffff_ffff. So even (1<<48) which makes sense at the physical
> level, doesn't make sense in terms of virtual addresses.
>

The limit for the virtual address is 2^64.


>
> > > > Signed-off-by: Julien Grall <jgrall@amazon.com>
> > > >
> > > > ---
> > > >      Changes in v2:
> > > >          - New patch
> > > > ---
> > > >   xen/arch/arm/mm.c            | 11 +++++++++--
> > > >   xen/include/asm-arm/config.h |  4 ++++
> > > >   2 files changed, 13 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> > > > index 8fac24d80086..5c17cafff847 100644
> > > > --- a/xen/arch/arm/mm.c
> > > > +++ b/xen/arch/arm/mm.c
> > > > @@ -1275,11 +1275,18 @@ static int xen_pt_update(unsigned long virt,
> > > >        * For arm32, page-tables are different on each CPUs. Yet, they
> > > > share
> > > >        * some common mappings. It is assumed that only common
> mappings
> > > >        * will be modified with this function.
> > > > -     *
> > > > -     * XXX: Add a check.
> > > >        */
> > > >       const mfn_t root = virt_to_mfn(THIS_CPU_PGTABLE);
> > > >   +#ifdef SHARED_VIRT_END
> > > > +    if ( virt > SHARED_VIRT_END ||
> > > > +         (SHARED_VIRT_END - virt) < nr_mfns )
> > >
> > > The following would be sufficient, right?
> > >
> > >      if ( virt + nr_mfns > SHARED_VIRT_END )
> >
> > This would not protect against an overflow. So I think it is best if we
> keep
> > my version.
>
> But there can be no overflow with the way SHARED_VIRT_END is defined.

Even if SHARED_VIRT_END was defined at (1<<48) there can be no overflow.
> Only if we defined SHARED_VIRT_END as 0xffff_ffff_ffff_ffff we would
> have an overflow, but you wrote above that your preference is not to do
> that.
>

You can have an overflow regardless the value of SHARED_VIRT_END.

Imagine virt = 2^64 - 1 and nr_mfs = 1. The addition would result to 0.

As a consequence the check would pass when it should not.

One can argue that the caller will always provide sane values. However
given the simplicity of the check, this is not worth the trouble if a
caller is buggy.

Now, the problem with SHARED_VIRT_END equals to 2^64 - 1 is not the
overflow but the compiler that may throw an error/warning for always true
check. Hence the reason of not defining SHARED_VIRT_END on arm64.

Cheers,

--0000000000000bf2b905c23e143d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, 13 May 2021, 23:32 Stefano Stabellini, &lt;<a =
href=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Wed, 12 May 2021, Julien Grall=
 wrote:<br>
&gt; Hi Stefano,<br>
&gt; <br>
&gt; On 12/05/2021 23:00, Stefano Stabellini wrote:<br>
&gt; &gt; On Sun, 25 Apr 2021, Julien Grall wrote:<br>
&gt; &gt; &gt; From: Julien Grall &lt;<a href=3D"mailto:jgrall@amazon.com" =
target=3D"_blank" rel=3D"noreferrer">jgrall@amazon.com</a>&gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Only the first 2GB of the virtual address space is shared be=
tween all<br>
&gt; &gt; &gt; the page-tables on Arm32.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; There is a long outstanding TODO in xen_pt_update() stating =
that the<br>
&gt; &gt; &gt; function is can only work with shared mapping. Nobody has ev=
er called<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^ remove<br>
&gt; &gt; <br>
&gt; &gt; &gt; the function with private mapping, however as we add more ca=
llers<br>
&gt; &gt; &gt; there is a risk to mess things up.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Introduce a new define to mark the ened of the shared mappin=
gs and use<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^e=
nd<br>
&gt; &gt; <br>
&gt; &gt; &gt; it in xen_pt_update() to verify if the address is correct.<b=
r>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Note that on Arm64, all the mappings are shared. Some compil=
er may<br>
&gt; &gt; &gt; complain about an always true check, so the new define is no=
t introduced<br>
&gt; &gt; &gt; for arm64 and the code is protected with an #ifdef.<br>
&gt; &gt;=C2=A0 =C2=A0On arm64 we could maybe define SHARED_VIRT_END to an =
arbitrarely large<br>
&gt; &gt; value, such as:<br>
&gt; &gt; <br>
&gt; &gt; #define SHARED_VIRT_END (1UL&lt;&lt;48)<br>
&gt; &gt; <br>
&gt; &gt; or:<br>
&gt; &gt; <br>
&gt; &gt; #define SHARED_VIRT_END DIRECTMAP_VIRT_END<br>
&gt; &gt; <br>
&gt; &gt; ?<br>
&gt; <br>
&gt; I thought about it but I didn&#39;t want to define to a random value..=
. I felt not<br>
&gt; define it was better.<br>
<br>
Yeah, I see your point: any restrictions in addressing (e.g. 48bits)<br>
are physical address restrictions. Here we are talking about virtual<br>
address restriction, and I don&#39;t think there are actually any<br>
restrictions there?=C2=A0 We could validly map something at<br>
0xffff_ffff_ffff_ffff. So even (1&lt;&lt;48) which makes sense at the physi=
cal<br>
level, doesn&#39;t make sense in terms of virtual addresses.<br></blockquot=
e></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">The limit for t=
he virtual address is 2^64.</div><div dir=3D"auto"><br></div><div dir=3D"au=
to"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
<br>
&gt; &gt; &gt; Signed-off-by: Julien Grall &lt;<a href=3D"mailto:jgrall@ama=
zon.com" target=3D"_blank" rel=3D"noreferrer">jgrall@amazon.com</a>&gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 Changes in v2:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - New patch<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 =C2=A0xen/arch/arm/mm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 11 +++++++++--<br>
&gt; &gt; &gt;=C2=A0 =C2=A0xen/include/asm-arm/config.h |=C2=A0 4 ++++<br>
&gt; &gt; &gt;=C2=A0 =C2=A02 files changed, 13 insertions(+), 2 deletions(-=
)<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c<br>
&gt; &gt; &gt; index 8fac24d80086..5c17cafff847 100644<br>
&gt; &gt; &gt; --- a/xen/arch/arm/mm.c<br>
&gt; &gt; &gt; +++ b/xen/arch/arm/mm.c<br>
&gt; &gt; &gt; @@ -1275,11 +1275,18 @@ static int xen_pt_update(unsigned lo=
ng virt,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * For arm32, page-tables are diff=
erent on each CPUs. Yet, they<br>
&gt; &gt; &gt; share<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * some common mappings. It is ass=
umed that only common mappings<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * will be modified with this func=
tion.<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0*<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0* XXX: Add a check.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const mfn_t root =3D virt_to_mfn(T=
HIS_CPU_PGTABLE);<br>
&gt; &gt; &gt;=C2=A0 =C2=A0+#ifdef SHARED_VIRT_END<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 if ( virt &gt; SHARED_VIRT_END ||<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(SHARED_VIRT_END - virt) =
&lt; nr_mfns )<br>
&gt; &gt; <br>
&gt; &gt; The following would be sufficient, right?<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if ( virt + nr_mfns &gt; SHARED_VIRT_END )<br=
>
&gt; <br>
&gt; This would not protect against an overflow. So I think it is best if w=
e keep<br>
&gt; my version.<br>
<br>
But there can be no overflow with the way SHARED_VIRT_END is defined.</bloc=
kquote></div></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">
Even if SHARED_VIRT_END was defined at (1&lt;&lt;48) there can be no overfl=
ow.<br>
Only if we defined SHARED_VIRT_END as 0xffff_ffff_ffff_ffff we would<br>
have an overflow, but you wrote above that your preference is not to do<br>
that.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">You can have an overflow regardless the value of SHARED_VIRT_END.</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">Imagine virt =3D 2^64 - 1 an=
d nr_mfs =3D 1. The addition would result to 0.</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">As a consequence the check would pass when it shoul=
d not.</div><div dir=3D"auto"><br></div><div dir=3D"auto">One can argue tha=
t the caller will always provide sane values. However given the simplicity =
of the check, this is not worth the trouble if a caller is buggy.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Now, the problem with SHARED_VIRT=
_END equals to 2^64 - 1 is not the overflow but the compiler that may throw=
 an error/warning for always true check. Hence the reason of not defining S=
HARED_VIRT_END on arm64.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Cheers,</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--0000000000000bf2b905c23e143d--

