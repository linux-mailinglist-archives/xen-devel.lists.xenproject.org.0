Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F854A22516
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 21:21:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879317.1289538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdEYa-0005IC-5T; Wed, 29 Jan 2025 20:21:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879317.1289538; Wed, 29 Jan 2025 20:21:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdEYa-0005Gl-1Z; Wed, 29 Jan 2025 20:21:04 +0000
Received: by outflank-mailman (input) for mailman id 879317;
 Wed, 29 Jan 2025 20:21:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lGVs=UV=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1tdEYY-0005Gf-Cd
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 20:21:02 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e04aa00-de7e-11ef-a0e6-8be0dac302b0;
 Wed, 29 Jan 2025 21:21:00 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-38a8b17d7a7so34091f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2025 12:21:00 -0800 (PST)
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
X-Inumbo-ID: 8e04aa00-de7e-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738182060; x=1738786860; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/Kf0EGJPK46ugt4tD3iaXD+lziBwDACFREctfvQbJEI=;
        b=Bi+aa9gfCSgBKnERGrhgt8Qvbors77deg8BzQeGuZC9bVduvJ5ViTBOmUyTLb4CcS2
         lmnpUUCN1X9nsmv91bgs68K1ecyLqlD4Tf+BENF3p3Ve8jigbFGmzqnKGa+I33OXGuIQ
         +ah4igwmkPau8nVfDHVV/M5NH2c/BqTv5V5LRhOP1D17GKvPs599GF5yqaZB2pjyrdIn
         bSMZByqiemWTuacUI7vOTfrpWh8QwwBovUtUXNt8n+oj6xsIC4BQBMkuk0wN6ScYgvvz
         nUmUR8NuWsXdXRW6yh8ArySm3+cpINRDnz85KhS4Zmv2Y0UnpFX6BvTU/GVZ1EZPew8Q
         cLvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738182060; x=1738786860;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Kf0EGJPK46ugt4tD3iaXD+lziBwDACFREctfvQbJEI=;
        b=iiXIG5Loo3mrzT+ontVIn2pQFKsRIzm5t0YT3ONFPZQvJiNR/dDD7/cvnXGYauLzGn
         gv8smj7ZcWu3HcMDyg85w+vcTo8WJgj3gVrrBUy2g6VICmjARPS/2muWIU5W3MX3yeDT
         ubK4GhZQAIAniQHHOxI7xqmFI8cIVoXKqrid+M3rsxUla2vB5PAE1kYpd5kTUpThjyJZ
         JxT11u9iZsK8xETyBPBqxCgH63sj3PiskFVLrSR0swJNP4davOiGPo2FiOg7NDzBq4xc
         rSZlJRZePoYseOCqhyCqvfB7r+MM2bvKT9OEN6crIeBIwny+gqMGVOxS1mLOdLS+IlhE
         Og8w==
X-Forwarded-Encrypted: i=1; AJvYcCVvb9CjGy0mMSBgwE0hrWB8tGzk4K7dIrvaDwYUOm8xUdeLiU4J7YHu0ZaM6H+QrVLiqDgqy5189aM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzyd35Po7g/Rmv1Cq9SoprbRE+ZMs8KoYOsrq/ZcthK7vjQquva
	PN9WvEHRkrOkPIbDCfRtnUnH+uJrocH+fHj0obppxbitAfHkRW5wAOs12G4k02KsgBVosBSjdrB
	qh8bozhsZ1HKVq7iOXammiXXRDqY=
X-Gm-Gg: ASbGnctkmG+QyT2Zsj7aQn7AAeuJEaigDFaJgmNbt/nSywg/fssc4okNoydaWQ8nLot
	2k6scrnKmCUiU3/d4E3bWBM1S3FT9889NYrVtVhWjK29I9VFHnEH83BG57xVzw/es7wfqHa6Fkq
	8=
X-Google-Smtp-Source: AGHT+IFJik1XjuEld/u9mraiLpO7C4xGvEHTZEmkFxNkgHvb/La9ni7s3ZvFanJUAQSORI8GF3nR3LakvyfaSUMVRzY=
X-Received: by 2002:a05:6000:1fac:b0:38a:614b:8632 with SMTP id
 ffacd0b85a97d-38c52093f16mr4928254f8f.39.1738182059535; Wed, 29 Jan 2025
 12:20:59 -0800 (PST)
MIME-Version: 1.0
References: <20250114195010.3409094-1-ayan.kumar.halder@amd.com>
 <20250114195010.3409094-2-ayan.kumar.halder@amd.com> <CAJ=z9a1ynFU86ac=1Q7i=xSNh2bjnZJ3+tPjsjWvfw7294n_NA@mail.gmail.com>
 <E930B9A0-6C32-476C-8829-7FD4C991F4A9@arm.com>
In-Reply-To: <E930B9A0-6C32-476C-8829-7FD4C991F4A9@arm.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Wed, 29 Jan 2025 17:20:46 -0300
X-Gm-Features: AWEUYZm1PfxBgVBQgrZVOnkLuZiJ-7DfP6viWcXVDrva-9R95ubC2FTEL645fQs
Message-ID: <CAJ=z9a3dqKDzPN9w_b5EnA+zOdezvBg0SQL+3aiNt9GhyU40bw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] docs: fusa: Add the requirements for some of the
 commands of XEN_VERSION
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, 
	Artem Mygaiev <artem_mygaiev@epam.com>
Content-Type: multipart/alternative; boundary="00000000000036b3fe062cde0c76"

--00000000000036b3fe062cde0c76
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 29 Jan 2025 at 12:49, Bertrand Marquis <Bertrand.Marquis@arm.com>
wrote:

> Hi Julien,
>
> Welcome back :-)


I am not fully back yet but I have a bit of spare time to go through
xen-devel :).


>
> > On 29 Jan 2025, at 16:33, Julien Grall <julien.grall.oss@gmail.com>
> wrote:
> >
> > Hi,
> >
> > On Tue, 14 Jan 2025 at 16:50, Ayan Kumar Halder <
> ayan.kumar.halder@amd.com> wrote:
> > We have written the requirements for some of the commands of the
> XEN_VERSION
> > hypercall.
> >
> > Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> > ---
> >  .../design-reqs/arm64/version_hypercall.rst   | 33 ++++++++
> >  .../reqs/design-reqs/version_hypercall.rst    | 65 +++++++++++++++
> >  docs/fusa/reqs/index.rst                      |  2 +
> >  .../reqs/product-reqs/version_hypercall.rst   | 82 +++++++++++++++++++
> >  4 files changed, 182 insertions(+)
> >  create mode 100644
> docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
> >  create mode 100644 docs/fusa/reqs/design-reqs/version_hypercall.rst
> >
> > diff --git a/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
> b/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
> > new file mode 100644
> > index 0000000000..1dad2b84c2
> > --- /dev/null
> > +++ b/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
> > @@ -0,0 +1,33 @@
> > +.. SPDX-License-Identifier: CC-BY-4.0
> > +
> > +Capabilities
> > +------------
> > +
> > +`XenSwdgn~arm64_capabilities~1`
> > +
> > +Description:
> > +Xen shall have a internal constant string storing "xen-3.0-aarch64".
> >
> > Can you explain why we need to specify how Xen is storing the string? A=
t
> least to me this feels a bit overkill. What matters is what/how the VM is
> seen.
>
> This is a design requirement and as such it should be testable so it woul=
d
> be easier to have something saying:
> Xen shall have a constant named XXX storing YYY.


Reading this, would it be better to tie to the variable in the makefile?
This would be closer to how a user would set it and how one would test it.



>
> Just saying "an internal constant" seem a bit limited here and not saying
> much that could be tested easily.
>
> Why do you think this would be an overkill ? do you expect the constant
> name to change a lot ?


I don=E2=80=99t expect the constant name to change. It is more that this is=
 an
internal implementation quite far to how the user would set it (see above).

Cheers,


> I would see more as an overkill the fact that the value is stored in a
> requirement.
>
> Cheers
> Bertrand
>
>

--00000000000036b3fe062cde0c76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, 29 Jan 2025 at 12:49, Bertrand Marquis &lt;<a =
href=3D"mailto:Bertrand.Marquis@arm.com">Bertrand.Marquis@arm.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bord=
er-left-color:rgb(204,204,204)">Hi Julien,<br>
<br>
Welcome back :-)</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">=
I am not fully back yet but I have a bit of spare time to go through xen-de=
vel :).</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:s=
olid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
&gt; On 29 Jan 2025, at 16:33, Julien Grall &lt;<a href=3D"mailto:julien.gr=
all.oss@gmail.com" target=3D"_blank">julien.grall.oss@gmail.com</a>&gt; wro=
te:<br>
&gt; <br>
&gt; Hi,<br>
&gt; <br>
&gt; On Tue, 14 Jan 2025 at 16:50, Ayan Kumar Halder &lt;<a href=3D"mailto:=
ayan.kumar.halder@amd.com" target=3D"_blank">ayan.kumar.halder@amd.com</a>&=
gt; wrote:<br>
&gt; We have written the requirements for some of the commands of the XEN_V=
ERSION<br>
&gt; hypercall.<br>
&gt; <br>
&gt; Signed-off-by: Ayan Kumar Halder &lt;<a href=3D"mailto:ayan.kumar.hald=
er@amd.com" target=3D"_blank">ayan.kumar.halder@amd.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../design-reqs/arm64/version_hypercall.rst=C2=A0 =C2=A0| 33 +++=
+++++<br>
&gt;=C2=A0 .../reqs/design-reqs/version_hypercall.rst=C2=A0 =C2=A0 | 65 +++=
++++++++++++<br>
&gt;=C2=A0 docs/fusa/reqs/index.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +<br>
&gt;=C2=A0 .../reqs/product-reqs/version_hypercall.rst=C2=A0 =C2=A0| 82 +++=
++++++++++++++++<br>
&gt;=C2=A0 4 files changed, 182 insertions(+)<br>
&gt;=C2=A0 create mode 100644 docs/fusa/reqs/design-reqs/arm64/version_hype=
rcall.rst<br>
&gt;=C2=A0 create mode 100644 docs/fusa/reqs/design-reqs/version_hypercall.=
rst<br>
&gt; <br>
&gt; diff --git a/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst b/=
docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..1dad2b84c2<br>
&gt; --- /dev/null<br>
&gt; +++ b/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst<br>
&gt; @@ -0,0 +1,33 @@<br>
&gt; +.. SPDX-License-Identifier: CC-BY-4.0<br>
&gt; +<br>
&gt; +Capabilities<br>
&gt; +------------<br>
&gt; +<br>
&gt; +`XenSwdgn~arm64_capabilities~1`<br>
&gt; +<br>
&gt; +Description:<br>
&gt; +Xen shall have a internal constant string storing &quot;xen-3.0-aarch=
64&quot;.<br>
&gt; <br>
&gt; Can you explain why we need to specify how Xen is storing the string? =
At least to me this feels a bit overkill. What matters is what/how the VM i=
s seen.<br>
<br>
This is a design requirement and as such it should be testable so it would =
be easier to have something saying:<br>
Xen shall have a constant named XXX storing YYY.</blockquote><div dir=3D"au=
to"><br></div><div dir=3D"auto">Reading this, would it be better to tie to =
the variable in the makefile? This would be closer to how a user would set =
it and how one would test it.</div><div dir=3D"auto"><br></div><div dir=3D"=
auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bor=
der-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Just saying &quot;an internal constant&quot; seem a bit limited here and no=
t saying much that could be tested easily.<br>
<br>
Why do you think this would be an overkill ? do you expect the constant nam=
e to change a lot ?</blockquote><div dir=3D"auto"><br></div><div dir=3D"aut=
o">I don=E2=80=99t expect the constant name to change. It is more that this=
 is an internal implementation quite far to how the user would set it (see =
above).</div><div dir=3D"auto"><br></div><div dir=3D"auto">Cheers,</div><di=
v dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-lef=
t:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
I would see more as an overkill the fact that the value is stored in a requ=
irement.<br>
<br>
Cheers<br>
Bertrand<br>
<br>
</blockquote></div></div>

--00000000000036b3fe062cde0c76--

