Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAB71F0B73
	for <lists+xen-devel@lfdr.de>; Sun,  7 Jun 2020 15:33:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhvPa-000327-9R; Sun, 07 Jun 2020 13:32:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mQbd=7U=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jhvPY-000321-EY
 for xen-devel@lists.xenproject.org; Sun, 07 Jun 2020 13:32:28 +0000
X-Inumbo-ID: 541ece20-a8c3-11ea-ba62-bc764e2007e4
Received: from mail-il1-x142.google.com (unknown [2607:f8b0:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 541ece20-a8c3-11ea-ba62-bc764e2007e4;
 Sun, 07 Jun 2020 13:32:27 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id v11so14228129ilh.1
 for <xen-devel@lists.xenproject.org>; Sun, 07 Jun 2020 06:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WY9MvnPJeP94VgXHjtnTqNiyQwhIoobiIF0OrIddSEU=;
 b=bP88d+f5zV/TUrMXwGmfLOgcY5TtNYpUtCUGlYTZtzaNwG9RCFNUrKuEfYagyi+HL8
 SCHEMxw7he7c/jZy9jj6RZGwgZKqk3afILOqkWF4iyUYiWWB2+BWcEF5hi5X+JBEHK/Q
 15k0Sn3HMGQ3WX3bzh+rN+rbRTiQ5QtpElobYbl29WSCW+L5Vm6efkEtbNJLYsOZ1TuW
 BpLews/IGcDQoMVXj0irCN9Jo55eqAUD6nzd33JveRDoARn8CqhIlY30IJRcUHhcAAwG
 4ioR5wPakWmQ8Vd0DXx0sU2NDPr4uX1OLwVLWO5QxzJfDN7990Fj+WB8GZZIroL6faLD
 s9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WY9MvnPJeP94VgXHjtnTqNiyQwhIoobiIF0OrIddSEU=;
 b=TnILfyqe8lcmiwDI8zNjjIo/rgqG7STRilDGcRA3b6hDMbFjL8WcKZfHQLJYT0Ps9u
 ktUFIIEdYO4060ybYVQkFAXMzQ+JnMf89ptedBcJ5nl4ch7kEhY6zpGKLyBiGXe2w4yx
 sNto0vtKWOqvCdqtySbLge9FRmDeV2xZHNFGJmyomSpRVmQhLtBvciDqlE6D0yY7+HGc
 o1iLYtJBVZX7PV5B0Qy+r9/Zdm4u0eTgW3s5o+JCqxEYfd5Ny677Me49QEKXdoxNsw4j
 yMFO+4Yx8ITcd7DfWvd1YMxnfE1VmnZ87l5uy0UTopFB2f0x9bCnX0f+Y86GmVjCQN9e
 YrRQ==
X-Gm-Message-State: AOAM531WebLUlaiIL1qVCwWsyfv2acBtQ2i2B4xK1vkMa8FvvZvS2jJ6
 AMhn7V8dv60zl+Zlwsy4uGj8FKlW5dN/YsAt3dg=
X-Google-Smtp-Source: ABdhPJwR+SStGDjRo7STvOtanReR5Gci/6gS2rM+7VCXLyBpzmC1+yeTeN23YvCpwMoGPv4/o3jDTawiItnbHryU7G0=
X-Received: by 2002:a05:6e02:13a9:: with SMTP id
 h9mr17369093ilo.20.1591536746888; 
 Sun, 07 Jun 2020 06:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <3b4dbb2f-7a0a-29a8-cca7-0cb641e8338d@suse.com>
 <000501d63b29$496ce6e0$dc46b4a0$@xen.org>
 <000701d63b2c$10536930$30fa3b90$@xen.org>
 <0296d5d6-cc7f-6e34-2403-acf34b870b5b@suse.com>
 <002101d63b3f$4e9dc830$ebd95890$@xen.org>
 <e2b8dd67-59c2-7e59-36f6-ce30b2df8b86@suse.com>
 <002201d63b40$1e135ee0$5a3a1ca0$@xen.org>
 <002f01d63b50$c8b49a70$5a1dcf50$@xen.org> <20200605171353.GG6329@mail-itl>
 <001501d63b5e$26a991a0$73fcb4e0$@xen.org> <20200605204310.GK98582@mail-itl>
In-Reply-To: <20200605204310.GK98582@mail-itl>
From: Paul Durrant <xadimgnik@gmail.com>
Date: Sun, 7 Jun 2020 14:32:15 +0100
Message-ID: <CAAgS=S=Tj-fLFW=ee4OpG_N8Z3nN7kXcq59dL=XNz7JZPgj3gA@mail.gmail.com>
Subject: Re: handle_pio looping during domain shutdown,
 with qemu 4.2.0 in stubdom
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Content-Type: multipart/alternative; boundary="0000000000007204a005a77e863d"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--0000000000007204a005a77e863d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 5 Jun 2020, 21:43 Marek Marczykowski-G=C3=B3recki, <
marmarek@invisiblethingslab.com> wrote:

> On Fri, Jun 05, 2020 at 06:24:20PM +0100, Paul Durrant wrote:
> > > -----Original Message-----
> > > From: 'Marek Marczykowski-G=C3=B3recki' <marmarek@invisiblethingslab.=
com>
> > > Sent: 05 June 2020 18:14
> > > To: paul@xen.org
> > > Cc: 'Jan Beulich' <jbeulich@suse.com>; 'Andrew Cooper' <
> andrew.cooper3@citrix.com>; 'xen-devel' <xen-
> > > devel@lists.xenproject.org>
> > > Subject: Re: handle_pio looping during domain shutdown, with qemu
> 4.2.0 in stubdom
> > >
> > > On Fri, Jun 05, 2020 at 04:48:39PM +0100, Paul Durrant wrote:
> > > > This (untested) patch might help:
> > >
> > > It is different now. I don't get domain_crash because of
> > > X86EMUL_UNHANDLEABLE anymore, but I still see handle_pio looping for
> > > some time. But it eventually ends, not really sure why.
> >
> > That'll be the shutdown deferral, which I realised later that I forgot
> about...
> >
> > >
> > > I've tried the patch with a modification to make it build:
> > >
> > > > diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
> > > > index c55c4bc4bc..8aa8779ba2 100644
> > > > --- a/xen/arch/x86/hvm/ioreq.c
> > > > +++ b/xen/arch/x86/hvm/ioreq.c
> > > > @@ -109,12 +109,7 @@ static void hvm_io_assist(struct hvm_ioreq_vcp=
u
> *sv, uint64_t data)
> > > >      ioreq_t *ioreq =3D &v->arch.hvm.hvm_io.io_req;
> > > >
> > > >      if ( hvm_ioreq_needs_completion(ioreq) )
> > > > -    {
> > > > -        ioreq->state =3D STATE_IORESP_READY;
> > > >          ioreq->data =3D data;
> > > > -    }
> > > > -    else
> > > > -        ioreq->state =3D STATE_IOREQ_NONE;
> > > >
> > > >      msix_write_completion(v);
> > > >      vcpu_end_shutdown_deferral(v);
> >
> > In fact, move both of these lines...
> >
> > > > @@ -209,6 +204,9 @@ bool handle_hvm_io_completion(struct vcpu *v)
> > > >          }
> > > >      }
> > > >
> > > > +    ioreq->state =3D hvm_ioreq_needs_completion(&vio->ioreq) ?
> > >        vio->io_req->state ... &vio->io_req
> > >
> > > > +        STATE_IORESP_READY : STATE_IOREQ_NONE;
> > > > +
> >
> > ... to here too.
> >
> > > >      io_completion =3D vio->io_completion;
> > > >      vio->io_completion =3D HVMIO_no_completion;
> > > >
> > >
> > > The full patch (together with my debug prints):
> > > https://gist.github.com/marmarek/da37da3722179057a6e7add4fb361e06
>
> The current patch:
> https://gist.github.com/marmarek/5ae795129c1be2dae13bfc517547c0f1
>
> > I guess it is the destroy being held off by the shutdown deferral?
> Hopefully the above tweaks should sort that out.
>
> Yes, now it works (tried 5 times in a row, previously it crashed on
> the first or the second one). Thanks!
>
> --
> Best Regards,
> Marek Marczykowski-G=C3=B3recki
> Invisible Things Lab
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
>

Cool. I will send a proper patch tomorrow.

  Paul

--0000000000007204a005a77e863d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Fri, 5 Jun 2020, 21:43 Marek Marczykowski-G=C3=B3recki,=
 &lt;<a href=3D"mailto:marmarek@invisiblethingslab.com">marmarek@invisiblet=
hingslab.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri,=
 Jun 05, 2020 at 06:24:20PM +0100, Paul Durrant wrote:<br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: &#39;Marek Marczykowski-G=C3=B3recki&#39; &lt;<a href=3D"ma=
ilto:marmarek@invisiblethingslab.com" target=3D"_blank" rel=3D"noreferrer">=
marmarek@invisiblethingslab.com</a>&gt;<br>
&gt; &gt; Sent: 05 June 2020 18:14<br>
&gt; &gt; To: <a href=3D"mailto:paul@xen.org" target=3D"_blank" rel=3D"nore=
ferrer">paul@xen.org</a><br>
&gt; &gt; Cc: &#39;Jan Beulich&#39; &lt;<a href=3D"mailto:jbeulich@suse.com=
" target=3D"_blank" rel=3D"noreferrer">jbeulich@suse.com</a>&gt;; &#39;Andr=
ew Cooper&#39; &lt;<a href=3D"mailto:andrew.cooper3@citrix.com" target=3D"_=
blank" rel=3D"noreferrer">andrew.cooper3@citrix.com</a>&gt;; &#39;xen-devel=
&#39; &lt;xen-<br>
&gt; &gt; <a href=3D"mailto:devel@lists.xenproject.org" target=3D"_blank" r=
el=3D"noreferrer">devel@lists.xenproject.org</a>&gt;<br>
&gt; &gt; Subject: Re: handle_pio looping during domain shutdown, with qemu=
 4.2.0 in stubdom<br>
&gt; &gt; <br>
&gt; &gt; On Fri, Jun 05, 2020 at 04:48:39PM +0100, Paul Durrant wrote:<br>
&gt; &gt; &gt; This (untested) patch might help:<br>
&gt; &gt; <br>
&gt; &gt; It is different now. I don&#39;t get domain_crash because of<br>
&gt; &gt; X86EMUL_UNHANDLEABLE anymore, but I still see handle_pio looping =
for<br>
&gt; &gt; some time. But it eventually ends, not really sure why.<br>
&gt; <br>
&gt; That&#39;ll be the shutdown deferral, which I realised later that I fo=
rgot about...<br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; I&#39;ve tried the patch with a modification to make it build:<br=
>
&gt; &gt; <br>
&gt; &gt; &gt; diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ior=
eq.c<br>
&gt; &gt; &gt; index c55c4bc4bc..8aa8779ba2 100644<br>
&gt; &gt; &gt; --- a/xen/arch/x86/hvm/ioreq.c<br>
&gt; &gt; &gt; +++ b/xen/arch/x86/hvm/ioreq.c<br>
&gt; &gt; &gt; @@ -109,12 +109,7 @@ static void hvm_io_assist(struct hvm_io=
req_vcpu *sv, uint64_t data)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 ioreq_t *ioreq =3D &amp;v-&gt;arch.hvm.h=
vm_io.io_req;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 if ( hvm_ioreq_needs_completion(ioreq) )=
<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 {<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ioreq-&gt;state =3D STATE_IORES=
P_READY;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ioreq-&gt;data =3D data;<b=
r>
&gt; &gt; &gt; -=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 else<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ioreq-&gt;state =3D STATE_IOREQ=
_NONE;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 msix_write_completion(v);<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 vcpu_end_shutdown_deferral(v);<br>
&gt; <br>
&gt; In fact, move both of these lines...<br>
&gt; <br>
&gt; &gt; &gt; @@ -209,6 +204,9 @@ bool handle_hvm_io_completion(struct vcp=
u *v)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 ioreq-&gt;state =3D hvm_ioreq_needs_completio=
n(&amp;vio-&gt;ioreq) ?<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 vio-&gt;io_req-&gt;state ... &amp;vio-=
&gt;io_req<br>
&gt; &gt; <br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 STATE_IORESP_READY : STATE_IORE=
Q_NONE;<br>
&gt; &gt; &gt; +<br>
&gt; <br>
&gt; ... to here too.<br>
&gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 io_completion =3D vio-&gt;io_completion;=
<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 vio-&gt;io_completion =3D HVMIO_no_compl=
etion;<br>
&gt; &gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt; The full patch (together with my debug prints):<br>
&gt; &gt; <a href=3D"https://gist.github.com/marmarek/da37da3722179057a6e7a=
dd4fb361e06" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gist.g=
ithub.com/marmarek/da37da3722179057a6e7add4fb361e06</a><br>
<br>
The current patch:<br>
<a href=3D"https://gist.github.com/marmarek/5ae795129c1be2dae13bfc517547c0f=
1" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gist.github.com/=
marmarek/5ae795129c1be2dae13bfc517547c0f1</a><br>
<br>
&gt; I guess it is the destroy being held off by the shutdown deferral? Hop=
efully the above tweaks should sort that out.<br>
<br>
Yes, now it works (tried 5 times in a row, previously it crashed on<br>
the first or the second one). Thanks!<br><br>
-- <br>
Best Regards,<br>
Marek Marczykowski-G=C3=B3recki<br>
Invisible Things Lab<br>
A: Because it messes up the order in which people normally read text.<br>
Q: Why is top-posting such a bad thing?<br></blockquote></div></div><div di=
r=3D"auto"><br></div><div dir=3D"auto"><span style=3D"font-family:sans-seri=
f">Cool. I will send a proper patch tomorrow.</span><div dir=3D"auto" style=
=3D"font-family:sans-serif"><br></div><div dir=3D"auto" style=3D"font-famil=
y:sans-serif">=C2=A0 Paul=C2=A0</div><br style=3D"font-family:sans-serif"><=
/div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">
</blockquote></div></div></div>

--0000000000007204a005a77e863d--

