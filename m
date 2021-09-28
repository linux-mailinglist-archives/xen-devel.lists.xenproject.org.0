Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8419841B842
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 22:20:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198408.351881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVJZF-00027F-GT; Tue, 28 Sep 2021 20:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198408.351881; Tue, 28 Sep 2021 20:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVJZF-00024d-DK; Tue, 28 Sep 2021 20:19:09 +0000
Received: by outflank-mailman (input) for mailman id 198408;
 Tue, 28 Sep 2021 20:19:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q7JL=OS=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mVJZD-00024X-6r
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 20:19:07 +0000
Received: from mail-wm1-x32e.google.com (unknown [2a00:1450:4864:20::32e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29e99244-c8fa-4ff3-a0d9-4b5cbd0ee0b4;
 Tue, 28 Sep 2021 20:19:05 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id s24so7858wmh.4
 for <xen-devel@lists.xenproject.org>; Tue, 28 Sep 2021 13:19:05 -0700 (PDT)
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
X-Inumbo-ID: 29e99244-c8fa-4ff3-a0d9-4b5cbd0ee0b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y+fMd4RTS2D4OXvXgqrntp+86PEPSos3v6YDgp1EsMg=;
        b=mpTnH8XNnCJyV9bOOdc+UyyisgWimas/3NVgbzQ8TnikvXrxEzc4VLSGHGAI4cGXVF
         E3McmRKMYEWKzGPuj9LwW9QUYqWnXPJx+pPPxBDM52VcVNqg7K491dWGyZWrzyWyoISr
         Gl0/G4FwsBVVIjJ/1Mespx0myvFlGvCSnuYm480vPap7T4k+Z2jHOXl9yX0LR1TJmU1m
         T8YtCPS+q6HPJkHyBKn6vYFcPY0D+aFle0q8gfJtSsHqlGwkGPMIeVwgD2/CqTstJ4gj
         MWmJ4AOFx9MBw0QUFdZv5IagINAqmt6T9cZomMyRk72K7HcKgJdt2dparf2u9cLXxhWL
         TOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y+fMd4RTS2D4OXvXgqrntp+86PEPSos3v6YDgp1EsMg=;
        b=iAglU1EJ4FBx7LLeYzQWOKIvWdEeNm/5w3khgsZTIvLTcjCoHj+OmnEMMVfGM8XLof
         Bw08OSkPd64ENzc9wK8oHFKc8T092nVPmonclqW6U1V/ScPT8PUyAZlmKk6PAieLr/jX
         Fz5KlGi7ZSzwmTD9WV8h0WhfFsfXkiU6zL18vQtTuYog+n3sKCjiFV+vi5UGH6yItEaV
         Hih4pKSBxY6s3jYHL3Ba6mwgy9d+iIkkLobl7Tzx6sx/2L6r/PFBeRn0uoizl5OIL6+q
         O1ZpSbPkSv9KjGiCPrRLevCKfzGrWpWAUlKwj0LnS08mm5MIQbvc4kaP58av1WWTpBxG
         rF1A==
X-Gm-Message-State: AOAM533wAF6ZMGC1d1p7YyQrGpEQs1cttHGST+waV1TstROuHjtD/qvc
	cNvncmIaW7m2U7V8yMTnt5eLJNilF5JTyR6JsI0=
X-Google-Smtp-Source: ABdhPJxqFVoNAliDhBwpjCCTIRD4B75LaUGT9z/EtbJpuvy/F6c0IPHLEBfnGuJ6ltFSPfJ+84S7qWx0IcSv/BylLVo=
X-Received: by 2002:a05:600c:350f:: with SMTP id h15mr6692437wmq.144.1632860344161;
 Tue, 28 Sep 2021 13:19:04 -0700 (PDT)
MIME-Version: 1.0
References: <87pmsylywy.fsf@linaro.org> <YU5mW396S04IsCBr@mail-itl>
 <874ka68h96.fsf@linaro.org> <CACMJ4GbgnQVQbH1N3Duxmx10n-Qv+zzncqarNyuhmKhE-wqdqA@mail.gmail.com>
 <alpine.DEB.2.21.2109272323160.5022@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109272323160.5022@sstabellini-ThinkPad-T480s>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Tue, 28 Sep 2021 23:18:53 +0300
Message-ID: <CAPD2p-=MdGB_a+oEsFrPQpLo7GeKkMwYyAWcQt3z0qrGr3vR7w@mail.gmail.com>
Subject: Re: [Stratos-dev] Xen Rust VirtIO demos work breakdown for Project Stratos
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Christopher Clark <christopher.w.clark@gmail.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Artem Mygaiev <Artem_Mygaiev@epam.com>, Sergio Lopez <slp@redhat.com>, Wei Liu <wl@xen.org>, 
	Stefan Hajnoczi <stefanha@gmail.com>, Rust-VMM Mailing List <rust-vmm@lists.opendev.org>, 
	Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Arnd Bergmann <arnd.bergmann@linaro.org>, David Woodhouse <dwmw2@infradead.org>, 
	Stratos Mailing List <stratos-dev@op-lists.linaro.org>, Rich Persaud <persaur@gmail.com>, 
	Daniel Smith <dpsmith@apertussolutions.com>, Paul Durrant <paul@xen.org>, 
	openxt <openxt@googlegroups.com>
Content-Type: multipart/alternative; boundary="000000000000c8170e05cd13ec94"

--000000000000c8170e05cd13ec94
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 28, 2021 at 9:26 AM Stefano Stabellini <sstabellini@kernel.org>
wrote:

Hi Stefano, all

[Sorry for the possible format issues]


On Mon, 27 Sep 2021, Christopher Clark wrote:
> > On Mon, Sep 27, 2021 at 3:06 AM Alex Benn=C3=A9e via Stratos-dev <
> stratos-dev@op-lists.linaro.org> wrote:
> >
> >       Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> writes:
> >
> >       > [[PGP Signed Part:Undecided]]
> >       > On Fri, Sep 24, 2021 at 05:02:46PM +0100, Alex Benn=C3=A9e wrot=
e:
> >       >> Hi,
> >       >
> >       > Hi,
> >       >
> >       >> 2.1 Stable ABI for foreignmemory mapping to non-dom0 ([STR-57]=
)
> >       >> =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
> >       >>
> >       >>   Currently the foreign memory mapping support only works for
> dom0 due
> >       >>   to reference counting issues. If we are to support backends
> running in
> >       >>   their own domains this will need to get fixed.
> >       >>
> >       >>   Estimate: 8w
> >       >>
> >       >>
> >       >> [STR-57] <https://linaro.atlassian.net/browse/STR-57>
> >       >
> >       > I'm pretty sure it was discussed before, but I can't find
> relevant
> >       > (part of) thread right now: does your model assumes the backend
> (running
> >       > outside of dom0) will gain ability to map (or access in other
> way)
> >       > _arbitrary_ memory page of a frontend domain? Or worse: any
> domain?
> >
> >       The aim is for some DomU's to host backends for other DomU's
> instead of
> >       all backends being in Dom0. Those backend DomU's would have to be
> >       considered trusted because as you say the default memory model of
> VirtIO
> >       is to have full access to the frontend domains memory map.
> >
> >
> > I share Marek's concern. I believe that there are Xen-based systems tha=
t
> will want to run guests using VirtIO devices without extending
> > this level of trust to the backend domains.
>
> From a safety perspective, it would be challenging to deploy a system
> with privileged backends. From a safety perspective, it would be a lot
> easier if the backend were unprivileged.
>
> This is one of those times where safety and security requirements are
> actually aligned.


Well, the foreign memory mapping has one advantage in the context of Virtio
use-case
which is that Virtio infrastructure in Guest doesn't require any
modifications to run on top Xen.
The only issue with foreign memory here is that Guest memory actually
mapped without its agreement
which doesn't perfectly fit into the security model. (although there is one
more issue with XSA-300,
but I think it will go away sooner or later, at least there are some
attempts to eliminate it).
While the ability to map any part of Guest memory is not an issue for the
backend running in Dom0
(which we usually trust), this will certainly violate Xen security model if
we want to run it in other
domain, so I completely agree with the existing concern.

It was discussed before [1], but I couldn't find any decisions regarding
that. As I understand,
the one of the possible ideas is to have some entity in Xen (PV
IOMMU/virtio-iommu/whatever)
that works in protection mode, so it denies all foreign mapping requests
from the backend running in DomU
by default and only allows requests with mapping which were *implicitly*
granted by the Guest before.
For example, Xen could be informed which MMIOs hold the queue PFN and
notify registers
(as it traps the accesses to these registers anyway) and could
theoretically parse the frontend request
and retrieve descriptors to make a decision which GFNs are actually
*allowed*.

I can't say for sure (sorry not familiar enough with the topic), but
implementing the virtio-iommu device
in Xen we could probably avoid Guest modifications at all. Of course, for
this to work
the Virtio infrastructure in Guest should use DMA API as mentioned in [1].

Would the =E2=80=9Crestricted foreign mapping=E2=80=9D solution retain the =
Xen security
model and be accepted
by the Xen community? I wonder, has someone already looked in this
direction, are there any
pitfalls here or is this even feasible?

[1]
https://lore.kernel.org/xen-devel/464e91ec-2b53-2338-43c7-a018087fc7f6@arm.=
com/



--=20
Regards,

Oleksandr Tyshchenko

--000000000000c8170e05cd13ec94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 28, 2021 at 9:26 AM Stefa=
no Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabellini@ker=
nel.org</a>&gt; wrote:<br></div><div dir=3D"ltr" class=3D"gmail_attr"><br><=
/div><div class=3D"gmail_attr">Hi Stefano, all</div><div class=3D"gmail_att=
r"><br></div><div class=3D"gmail_attr">[Sorry for the possible format issue=
s]</div><div dir=3D"ltr" class=3D"gmail_attr"><br></div><div dir=3D"ltr" cl=
ass=3D"gmail_attr"><br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On Mon, 27 Sep 2021, Christopher Clark wrote:<br>
&gt; On Mon, Sep 27, 2021 at 3:06 AM Alex Benn=C3=A9e via Stratos-dev &lt;<=
a href=3D"mailto:stratos-dev@op-lists.linaro.org" target=3D"_blank">stratos=
-dev@op-lists.linaro.org</a>&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Marek Marczykowski-G=C3=B3recki &lt;<a href=
=3D"mailto:marmarek@invisiblethingslab.com" target=3D"_blank">marmarek@invi=
siblethingslab.com</a>&gt; writes:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [[PGP Signed Part:Undecided]]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; On Fri, Sep 24, 2021 at 05:02:46PM +010=
0, Alex Benn=C3=A9e wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; Hi,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hi,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; 2.1 Stable ABI for foreignmemory ma=
pping to non-dom0 ([STR-57])<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; =E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0Currently the foreign m=
emory mapping support only works for dom0 due<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0to reference counting i=
ssues. If we are to support backends running in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0their own domains this =
will need to get fixed.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0Estimate: 8w<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; [STR-57] &lt;<a href=3D"https://lin=
aro.atlassian.net/browse/STR-57" rel=3D"noreferrer" target=3D"_blank">https=
://linaro.atlassian.net/browse/STR-57</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I&#39;m pretty sure it was discussed be=
fore, but I can&#39;t find relevant<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (part of) thread right now: does your m=
odel assumes the backend (running<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; outside of dom0) will gain ability to m=
ap (or access in other way)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; _arbitrary_ memory page of a frontend d=
omain? Or worse: any domain?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0The aim is for some DomU&#39;s to host backe=
nds for other DomU&#39;s instead of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0all backends being in Dom0. Those backend Do=
mU&#39;s would have to be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0considered trusted because as you say the de=
fault memory model of VirtIO<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0is to have full access to the frontend domai=
ns memory map.<br>
&gt; <br>
&gt; <br>
&gt; I share Marek&#39;s concern. I believe that there are Xen-based system=
s that will want to run guests using VirtIO devices without extending<br>
&gt; this level of trust to=C2=A0the backend domains.<br>
<br>
From a safety perspective, it would be challenging to deploy a system<br>
with privileged backends. From a safety perspective, it would be a lot<br>
easier if the backend were unprivileged.<br>
<br>
This is one of those times where safety and security requirements are<br>
actually aligned.</blockquote><div><br></div><div>Well, the foreign memory =
mapping has one advantage in the context of Virtio use-case<br>which is tha=
t Virtio infrastructure in Guest doesn&#39;t require any modifications to r=
un on top Xen. <br>The only issue with foreign memory here is that Guest me=
mory actually mapped without its agreement<br>which doesn&#39;t perfectly f=
it into=C2=A0the security model. (although there is one more issue with XSA=
-300,<br>but I think it will go away sooner or later, at least there are so=
me attempts to eliminate it).<br>While the ability to map any part of Guest=
 memory is not an issue for the backend running in Dom0<br>(which we usuall=
y trust), this will certainly violate Xen security model if we want to run =
it in other<br>domain, so I completely agree with the existing concern.<br>=
<br>It was discussed before [1], but I couldn&#39;t find any decisions rega=
rding that. As I understand,<br>the one of the possible ideas is to have so=
me entity in Xen (PV IOMMU/virtio-iommu/whatever)<br>that works in protecti=
on mode, so it denies all foreign mapping requests from the backend running=
 in DomU<br>by default and only allows requests with mapping which were *im=
plicitly* granted by the Guest before.<br>For example, Xen could be informe=
d which MMIOs hold the queue PFN and notify registers<br>(as it traps the a=
ccesses to these registers anyway) and could theoretically parse the fronte=
nd request<br>and retrieve descriptors to make a decision which GFNs are ac=
tually *allowed*.<br><br>I can&#39;t say for sure (sorry not familiar enoug=
h with the topic), but implementing the virtio-iommu device<br>in Xen we co=
uld probably avoid Guest modifications at all. Of course, for this to work<=
br>the Virtio infrastructure in Guest should use DMA API as mentioned in [1=
].</div><div><br>Would the =E2=80=9Crestricted foreign mapping=E2=80=9D sol=
ution retain the Xen security model and be accepted<br>by the Xen community=
? I wonder, has someone already looked in this direction, are there any<br>=
pitfalls here or is this even feasible?<br><br>[1] <a href=3D"https://lore.=
kernel.org/xen-devel/464e91ec-2b53-2338-43c7-a018087fc7f6@arm.com/">https:/=
/lore.kernel.org/xen-devel/464e91ec-2b53-2338-43c7-a018087fc7f6@arm.com/</a=
><br></div></div><div class=3D"gmail_quote"><br><div>=C2=A0</div></div><div=
><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"lt=
r"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><span style=3D"background-co=
lor:rgb(255,255,255)"><font size=3D"2"><span style=3D"color:rgb(51,51,51);f=
ont-family:Arial,sans-serif">Regards,</span></font></span></div><div dir=3D=
"ltr"><br></div><div dir=3D"ltr"><div><span style=3D"background-color:rgb(2=
55,255,255)"><font size=3D"2">Oleksandr Tyshchenko</font></span></div></div=
></div></div></div></div></div></div>

--000000000000c8170e05cd13ec94--

