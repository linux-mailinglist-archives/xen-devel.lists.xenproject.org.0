Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D5AAD11C0
	for <lists+xen-devel@lfdr.de>; Sun,  8 Jun 2025 11:50:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1009830.1388184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOCeO-0002if-7P; Sun, 08 Jun 2025 09:49:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1009830.1388184; Sun, 08 Jun 2025 09:49:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOCeO-0002gx-0v; Sun, 08 Jun 2025 09:49:12 +0000
Received: by outflank-mailman (input) for mailman id 1009830;
 Sun, 08 Jun 2025 09:49:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I6AZ=YX=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1uOCeM-0002gr-Nb
 for xen-devel@lists.xenproject.org; Sun, 08 Jun 2025 09:49:10 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2566a88-444d-11f0-b894-0df219b8e170;
 Sun, 08 Jun 2025 11:49:08 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-32a806ef504so26740581fa.3
 for <xen-devel@lists.xenproject.org>; Sun, 08 Jun 2025 02:49:08 -0700 (PDT)
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
X-Inumbo-ID: d2566a88-444d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749376147; x=1749980947; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lho+8TmrzraE4kuO5oYi+PN34j0t0i7LoT4n3zIzQ3A=;
        b=c8mwwYC4YDDmnbX/mNwjbJo4fEvu/xTZvhZqBKaIrBdg4zlESa/ZWTl1R5IIgCiSHt
         7nVV813zPsh9HAMvEBTmzceAdnMsa8R9RHpo6WFux/m4ZsCGIVzjENX7Py6khJ3h58+y
         uYctVWmCXjaUCWdqjjLrczc/SGk1Kn5o5t/KlG+BXkq9jC9Ygi8RxyP4SCmDTP5BRNRe
         gATwXHwNMPrb89N0h17CB5I6wsfrqvvW73uVhO8m+ahBsKDmitbJX/KBRGldh7n9B83+
         ZxH+xNrMPI9n5YlxM3TnbWpCwPZKEf1+/sWKNIecDWZVL+0Fvg3PFptVaJ/QV6Wr6SR8
         GcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749376147; x=1749980947;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lho+8TmrzraE4kuO5oYi+PN34j0t0i7LoT4n3zIzQ3A=;
        b=mry6XNIW4Wz9JS5AUUof10Motna46Opyrbt1Eu6EjHFR16MAuQMxfZQgYBWtQByYj+
         EeIjvaCo0TUm0NMq4y9ltFaM9R8Gw9obZa15Gk0gPaspOFBc2bZIXYLBUPFghnplGcox
         Qnut2hbg9TbgVlOXt9kPYUrcKahot71RNpcyxO3LPZZIWZWkocZmfxg76NOwBBarIse1
         uus/oi/D5isu8GGLkYwTj1NdJZs+SvorlZ0Fv/DX4DAEZ9nCu5EOnHbMKETY6PQ1Rc8e
         fpsaoCb5HBwXP76dz6qGcPLapswxY2VVDPDK5kyEhSGYAdtUB1aYdM8NoGvBLOFEr8A5
         IwIA==
X-Forwarded-Encrypted: i=1; AJvYcCXkFUmRoOWWZ0Oc7JEiXsPfRENwMeRSOQHwlIzeqQTPtAA2Of+IRRZIadt9fkYnawHT+g3M1oflZl0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2KxJjE46BV/Ee27/8ZSZRKTs28w7OsXxC7C4FOY2pA9hRMay1
	J6K7av45tbbMcGQETduskvSFCTUTy3XYpzHdhJqf1FG6M4Pr4H4DNL1u6v8B4pxe78eaKra8bAY
	rkic1m7W3/MflDrM05kdt3LJ5Vn7gYyE=
X-Gm-Gg: ASbGnctFwFDXNOKE0r9tYo9mKEPPjri9qj2eeVLs7tX05v1VMNBHjMx7/J64qGVDB5J
	a/hPFPX1hkF0YMEAtU/sgicATh62nS2X3/fxqrxSxfdwaVN4pmulOmPJd2SjgRfxWzuMgvh3Lz7
	2ag4RPOg7OTVA2PDecNljWuy0UPwhh7fo=
X-Google-Smtp-Source: AGHT+IGjYMGUINRU+YhQ9P2FvvafnAs0jQvZxnhTwX4KyJObpxEKGNsqlbaqhxrmfo6c7lhSK8xUacgk5ias5CFs3Rs=
X-Received: by 2002:a2e:a9a0:0:b0:32a:6c8a:570c with SMTP id
 38308e7fff4ca-32adfc0efcfmr26379681fa.25.1749376146894; Sun, 08 Jun 2025
 02:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250528211040.10562-1-christopher.w.clark@gmail.com>
 <f05fb94f-91ba-4abe-b59a-c14e25388e68@vates.tech> <c6e91b58-ea4f-4ea2-a820-bad97cf19306@amd.com>
In-Reply-To: <c6e91b58-ea4f-4ea2-a820-bad97cf19306@amd.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Sun, 8 Jun 2025 10:48:55 +0100
X-Gm-Features: AX0GCFuww2J3Al28WE4LiPuwCmhymMegSf7S2NkFJuP_X3ENL6lx_6GSii_0p2Y
Message-ID: <CACMJ4Gb35EAy2igefhzH5=g=cQstNvbJCZdiMHA7QHQ+v=4cOg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] docs: add documentation for Argo as a feature
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org, 
	Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000d0778206370c5f92"

--000000000000d0778206370c5f92
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 5:14=E2=80=AFPM Jason Andryuk <jason.andryuk@amd.com=
> wrote:

> On 2025-05-29 18:40, Teddy Astie wrote:
> > Hello Christopher,
> >
> > Le 28/05/2025 =C3=A0 23:13, Christopher Clark a =C3=A9crit :
>
> >> +## Argo and VirtIO
> >> +
> >> +References to design documentation for the development of an Argo
> >> +transport for VirtIO are available via:
> >> +https://wiki.xenproject.org/wiki/Virtio_On_Xen
> >> +
> >
> > Are there news regarding this ?
> >
> > There is work done on virtio-msg [1], which looks fairly similar to
> > virtio-argo (or at least, virtio-msg could work with Argo in a similar
> > fashion to what's described on the virtio-argo design).
> >
> > [1] https://linaro.atlassian.net/wiki/spaces/HVAC/overview


I appreciate the interest - I don't have additional material on it at the
moment.


>
> I think this should be dropped.  We don't need a link to a design
> document without an implementation.  You can add it once you've
> upstreamed the implementation.
>

OK, I'll remove this section for the next version of the series.


>
> >> +# Known issues
> >> +
> >> +* For development: sysctl/domctls for toolstack to control per-VM
> access
> >> +  to Argo
> >> +
> >
> > Is it regarding disabling the argo on a per-guest basis, or regarding i=
f
> > a specific VM can communicate with another VM ? i.e can the toolstack
> > decide to prevent 2 guest from communicating ?
> >
> > IIRC, in Argo, a guest on his own can decide who can communicate with
> > him using separate registered rings. But I am not sure if there is more
> > on that regard.
>

It's to do with enabling administrative controls for the toolstack to be
able to govern access to Argo by individual VMs on a per-VM basis. At the
moment there is a host boot option that turns it on or off for the system
and there are XSM/Flask policy controls that govern access to Argo by
individual VMs on a per-VM basis, but that is less accessible for a system
administrator to apply changes to VM access and less dynamic than some use
cases may require.


>
> Yes, I think the existing text needs to be rephrased to be more explicit
> on the issue.  I can guess what it is, but I shouldn't have to.  I'd
> recommend stating the issue as it exists, and then optionally clearly
> state a proposed solution.
>

Fair, thanks, will revise it.

Christopher

--000000000000d0778206370c5f92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Jun 4, 2025 at 5:14=E2=80=AFPM Ja=
son Andryuk &lt;<a href=3D"mailto:jason.andryuk@amd.com">jason.andryuk@amd.=
com</a>&gt; wrote:</div><div class=3D"gmail_quote gmail_quote_container"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On 2025-05-29 18:40, Teddy =
Astie wrote:<br>
&gt; Hello Christopher,<br>
&gt; <br>
&gt; Le 28/05/2025 =C3=A0 23:13, Christopher Clark a =C3=A9crit=C2=A0:<br>
<br>
&gt;&gt; +## Argo and VirtIO<br>
&gt;&gt; +<br>
&gt;&gt; +References to design documentation for the development of an Argo=
<br>
&gt;&gt; +transport for VirtIO are available via:<br>
&gt;&gt; +<a href=3D"https://wiki.xenproject.org/wiki/Virtio_On_Xen" rel=3D=
"noreferrer" target=3D"_blank">https://wiki.xenproject.org/wiki/Virtio_On_X=
en</a><br>
&gt;&gt; +<br>
&gt; <br>
&gt; Are there news regarding this ?<br>
&gt; <br>
&gt; There is work done on virtio-msg [1], which looks fairly similar to<br=
>
&gt; virtio-argo (or at least, virtio-msg could work with Argo in a similar=
<br>
&gt; fashion to what&#39;s described on the virtio-argo design).<br>
&gt; <br>
&gt; [1] <a href=3D"https://linaro.atlassian.net/wiki/spaces/HVAC/overview"=
 rel=3D"noreferrer" target=3D"_blank">https://linaro.atlassian.net/wiki/spa=
ces/HVAC/overview</a></blockquote><div><br></div><div>I appreciate the inte=
rest - I don&#39;t have additional material on it at the moment.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
I think this should be dropped.=C2=A0 We don&#39;t need a link to a design =
<br>
document without an implementation.=C2=A0 You can add it once you&#39;ve <b=
r>
upstreamed the implementation.<br></blockquote><div><br></div><div>OK, I&#3=
9;ll remove this section for the next version of the series.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;&gt; +# Known issues<br>
&gt;&gt; +<br>
&gt;&gt; +* For development: sysctl/domctls for toolstack to control per-VM=
 access<br>
&gt;&gt; +=C2=A0 to Argo<br>
&gt;&gt; +<br>
&gt; <br>
&gt; Is it regarding disabling the argo on a per-guest basis, or regarding =
if<br>
&gt; a specific VM can communicate with another VM ? i.e can the toolstack<=
br>
&gt; decide to prevent 2 guest from communicating ?<br>
&gt; <br>
&gt; IIRC, in Argo, a guest on his own can decide who can communicate with<=
br>
&gt; him using separate registered rings. But I am not sure if there is mor=
e<br>
&gt; on that regard.<br></blockquote><div><br></div><div>It&#39;s to do wit=
h enabling administrative controls for the toolstack to be able to govern a=
ccess to Argo by individual VMs on a per-VM basis. At the moment there is a=
 host boot option that turns it on or off for the system and there are XSM/=
Flask policy controls that govern access=C2=A0to Argo by individual VMs on =
a per-VM basis, but that is less accessible for a system administrator to a=
pply changes to VM access and less dynamic than some use cases may require.=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Yes, I think the existing text needs to be rephrased to be more explicit <b=
r>
on the issue.=C2=A0 I can guess what it is, but I shouldn&#39;t have to.=C2=
=A0 I&#39;d <br>
recommend stating the issue as it exists, and then optionally clearly <br>
state a proposed solution.<br></blockquote><div><br></div><div>Fair, thanks=
, will revise it.</div><div><br></div><div>Christopher</div></div></div>

--000000000000d0778206370c5f92--

