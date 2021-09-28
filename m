Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 082AB41A781
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 07:56:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197506.350590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV65s-0002y5-4q; Tue, 28 Sep 2021 05:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197506.350590; Tue, 28 Sep 2021 05:55:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV65s-0002uS-14; Tue, 28 Sep 2021 05:55:56 +0000
Received: by outflank-mailman (input) for mailman id 197506;
 Tue, 28 Sep 2021 05:55:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9GlL=OS=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1mV65p-0002u1-T8
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 05:55:54 +0000
Received: from mail-oi1-x22e.google.com (unknown [2607:f8b0:4864:20::22e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77f6268b-5510-49a2-9c78-e114cd2ee0fb;
 Tue, 28 Sep 2021 05:55:52 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id n64so9361677oih.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Sep 2021 22:55:52 -0700 (PDT)
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
X-Inumbo-ID: 77f6268b-5510-49a2-9c78-e114cd2ee0fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5rEci0qlxlhucxbwe0MgbNSwwC4MRsbfUGnErsRIOcs=;
        b=gDUD4ch2MBk7xVOywI4CsqRw2wrGLzUsGpCiGyr8vb9/WLR0c011zWNCBced0zQg8M
         Xx6yaeqLxus6cVxXJTO8jD7ee3MLIlMcxXRF1GQ5a60gSPHPH2aEgcNb/KqoSUdz8nw8
         vsXnsGHXmxpAGR8xawClxxV9CdK6g9q6G1gpF+D3NYUb2fv1IF8o5ulJ3Yc0kPtyivYl
         fvEnnw9FRSOFVYm/XfjRSaeGGMqrMwqhjapPuJ+ZI53RBu4ouXM/rL/j2Am4YJ1rDjCX
         g92RRctSOVcbw3C7x3Jg6sw93yDp9gFqZ52uspT/46xeqk01VNiIqepsHEjcU9owwb5x
         HwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5rEci0qlxlhucxbwe0MgbNSwwC4MRsbfUGnErsRIOcs=;
        b=vPlUo9MPPsrAppCZe5VNqNNTzhH8O7CEVJprFjf4tvXkLPAorTUgzJqVEeoYn+iq5y
         lhD/gYGZWc1APT34RhhGCADmzZ0hdJVeo2wxlybur+OhdUc6CTAqM6lkj2jkuoRLfI2y
         gIrvSkmXGrS0612AOjVn/nCDsnTf2pp7DvGDgftDh3AkNPaq+DGDnpEJVbNw1j/H3AOq
         Pc6gIYnJjsYvJjqiZSkxd1iqketSslEFg2qtPkP0XPftkekGEB52JjWmXgMkn6JLUbgv
         xQkxzke1btEHDMbj5e9YA7wLkE8PxBWIYj+YaA3RQQoaIUyM/EuPCIYEsraptBSrqaO9
         P/XA==
X-Gm-Message-State: AOAM5324Wx2+u2O5fK3VQDVT5zig2p15YOJ800pMxOaLPAOynZ0DXgOA
	eTrJmgCm7rZuZmFB+lVuZYyEXvpLSyN53HBlSEg=
X-Google-Smtp-Source: ABdhPJzMAKeODXFuOEYSpKf+BUrbUt+6Q3x3vuPi193tyJYLvMcUMaV6lsTRaSjJxG1flfVBH+kFhpoO2EYiBFyhdC8=
X-Received: by 2002:a54:4d8f:: with SMTP id y15mr2293640oix.122.1632808551678;
 Mon, 27 Sep 2021 22:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <87pmsylywy.fsf@linaro.org> <YU5mW396S04IsCBr@mail-itl> <874ka68h96.fsf@linaro.org>
In-Reply-To: <874ka68h96.fsf@linaro.org>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Mon, 27 Sep 2021 22:55:40 -0700
Message-ID: <CACMJ4GbgnQVQbH1N3Duxmx10n-Qv+zzncqarNyuhmKhE-wqdqA@mail.gmail.com>
Subject: Re: [Stratos-dev] Xen Rust VirtIO demos work breakdown for Project Stratos
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Artem Mygaiev <Artem_Mygaiev@epam.com>, Oleksandr Tyshchenko <olekstysh@gmail.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Sergio Lopez <slp@redhat.com>, Wei Liu <wl@xen.org>, 
	Stefan Hajnoczi <stefanha@gmail.com>, Rust-VMM Mailing List <rust-vmm@lists.opendev.org>, 
	Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, Arnd Bergmann <arnd.bergmann@linaro.org>, 
	David Woodhouse <dwmw2@infradead.org>, 
	Stratos Mailing List <stratos-dev@op-lists.linaro.org>, Rich Persaud <persaur@gmail.com>, 
	Daniel Smith <dpsmith@apertussolutions.com>, Paul Durrant <paul@xen.org>, 
	openxt <openxt@googlegroups.com>
Content-Type: multipart/alternative; boundary="000000000000b588ee05cd07ddb6"

--000000000000b588ee05cd07ddb6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 27, 2021 at 3:06 AM Alex Benn=C3=A9e via Stratos-dev <
stratos-dev@op-lists.linaro.org> wrote:

>
> Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com> writes:
>
> > [[PGP Signed Part:Undecided]]
> > On Fri, Sep 24, 2021 at 05:02:46PM +0100, Alex Benn=C3=A9e wrote:
> >> Hi,
> >
> > Hi,
> >
> >> 2.1 Stable ABI for foreignmemory mapping to non-dom0 ([STR-57])
> >> =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
> >>
> >>   Currently the foreign memory mapping support only works for dom0 due
> >>   to reference counting issues. If we are to support backends running =
in
> >>   their own domains this will need to get fixed.
> >>
> >>   Estimate: 8w
> >>
> >>
> >> [STR-57] <https://linaro.atlassian.net/browse/STR-57>
> >
> > I'm pretty sure it was discussed before, but I can't find relevant
> > (part of) thread right now: does your model assumes the backend (runnin=
g
> > outside of dom0) will gain ability to map (or access in other way)
> > _arbitrary_ memory page of a frontend domain? Or worse: any domain?
>
> The aim is for some DomU's to host backends for other DomU's instead of
> all backends being in Dom0. Those backend DomU's would have to be
> considered trusted because as you say the default memory model of VirtIO
> is to have full access to the frontend domains memory map.
>

I share Marek's concern. I believe that there are Xen-based systems that
will want to run guests using VirtIO devices without extending this level
of trust to the backend domains.


>
> > That is a significant regression in terms of security model Xen
> > provides. It would give the backend domain _a lot more_ control over th=
e
> > system that it normally has with Xen PV drivers - negating significant
> > part of security benefits of using driver domains.
>
> It's part of the continual trade off between security and speed. For
> things like block and network backends there is a penalty if data has to
> be bounce buffered before it ends up in the guest address space.
>

I think we have significant flexibility in being able to modify several
layers of the stack here to make this efficient, and it would be beneficial
to avoid bounce buffering if possible without sacrificing the ability to
enforce isolation. I wonder if there's a viable approach possible with some
implementation of a virtual IOMMU (which enforces access control) that
would allow a backend to commission I/O on a physical device on behalf of a
guest, where the data buffers do not need to be mapped into the backend and
so avoid the need for a bounce?


>
> > So, does the above require frontend agreeing (explicitly or implicitly)
> > for accessing specific pages by the backend? There were several
> > approaches to that discussed, including using grant tables (as PV
> > drivers do), vIOMMU(?), or even drastically different model with no
> > shared memory at all (Argo). Can you clarify which (if any) approach
> > your attempt of VirtIO on Xen will use?
>
> There are separate strands of work in Stratos looking at how we could
> further secure VirtIO for architectures with distributed backends (e.g.
> you may accept the block backend having access to the whole of memory
> but an i2c multiplexer has different performance characteristics).
>
> Currently the only thing we have prototyped is "fat virtqueues" which
> Arnd has been working on. Here the only actual shared memory required is
> the VirtIO config space and the relevant virt queues.
>

I think the "fat virtqueues" work is a positive path for investigation and
I don't think shared memory between front and backend is hard requirement
for those to function: a VirtIO-Argo transport driver would be able to
operate with them without shared memory.


>
> Other approaches have been discussed including using the virtio-iommu to
> selectively make areas available to the backend or use memory zoning so
> for example network buffers are only allocated in a certain region of
> guest physical memory that is shared with the backend.
>
> > A more general idea: can we collect info on various VirtIO on Xen
> > approaches (since there is more than one) in a single place, including:
> >  - key characteristics, differences
> >  - who is involved
> >  - status
> >  - links to relevant threads, maybe
> >
> > I'd propose to revive https://wiki.xenproject.org/wiki/Virtio_On_Xen


Thanks for the reminder, Marek -- I've just overhauled that page to give an
overview of the several approaches in the Xen community to enabling VirtIO
on Xen, and have included a first pass at including the content you
describe. I'm happy to be involved in improving it further.


>
>
> From the Stratos point of view Xen is a useful proving ground for
> general VirtIO experimentation due to being both a type-1 and open
> source. Our ultimate aim is have a high degree of code sharing for
> backends regardless of the hypervisor choice so a guest can use a VirtIO
> device model without having to be locked into KVM.
>

Thanks, Alex - this context is useful.


>
> If your technology choice is already fixed with a Xen hypervisor and
> portability isn't a concern you might well just stick to the existing
> well tested Xen PV interfaces.
>

I wouldn't quite agree; there are additional reasons beyond portability to
be looking at other options than the traditional Xen PV interfaces: eg. an
Argo-based interdomain transport for PV devices will enable fine-grained
enforcement of Mandatory Access Control over the frontend / backend
communication, and will not depend on XenStore which is advantageous for
Hyperlaunch / dom0less Xen deployment configurations.

thanks,

Christopher



>
> --
> Alex Benn=C3=A9e
> --
> Stratos-dev mailing list
> Stratos-dev@op-lists.linaro.org
> https://op-lists.linaro.org/mailman/listinfo/stratos-dev
>

--000000000000b588ee05cd07ddb6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Sep 27, 2021 at 3:06 AM Alex Benn=
=C3=A9e via Stratos-dev &lt;<a href=3D"mailto:stratos-dev@op-lists.linaro.o=
rg">stratos-dev@op-lists.linaro.org</a>&gt; wrote:<br></div><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
Marek Marczykowski-G=C3=B3recki &lt;<a href=3D"mailto:marmarek@invisiblethi=
ngslab.com" target=3D"_blank">marmarek@invisiblethingslab.com</a>&gt; write=
s:<br>
<br>
&gt; [[PGP Signed Part:Undecided]]<br>
&gt; On Fri, Sep 24, 2021 at 05:02:46PM +0100, Alex Benn=C3=A9e wrote:<br>
&gt;&gt; Hi,<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt;&gt; 2.1 Stable ABI for foreignmemory mapping to non-dom0 ([STR-57])<br=
>
&gt;&gt; =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80<br>
&gt;&gt; <br>
&gt;&gt;=C2=A0 =C2=A0Currently the foreign memory mapping support only work=
s for dom0 due<br>
&gt;&gt;=C2=A0 =C2=A0to reference counting issues. If we are to support bac=
kends running in<br>
&gt;&gt;=C2=A0 =C2=A0their own domains this will need to get fixed.<br>
&gt;&gt; <br>
&gt;&gt;=C2=A0 =C2=A0Estimate: 8w<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; [STR-57] &lt;<a href=3D"https://linaro.atlassian.net/browse/STR-57=
" rel=3D"noreferrer" target=3D"_blank">https://linaro.atlassian.net/browse/=
STR-57</a>&gt;<br>
&gt;<br>
&gt; I&#39;m pretty sure it was discussed before, but I can&#39;t find rele=
vant<br>
&gt; (part of) thread right now: does your model assumes the backend (runni=
ng<br>
&gt; outside of dom0) will gain ability to map (or access in other way)<br>
&gt; _arbitrary_ memory page of a frontend domain? Or worse: any domain?<br=
>
<br>
The aim is for some DomU&#39;s to host backends for other DomU&#39;s instea=
d of<br>
all backends being in Dom0. Those backend DomU&#39;s would have to be<br>
considered trusted because as you say the default memory model of VirtIO<br=
>
is to have full access to the frontend domains memory map.<br></blockquote>=
<div><br></div><div>I share Marek&#39;s concern. I believe that there are X=
en-based systems that will want to run guests using VirtIO devices without =
extending this level of trust to=C2=A0the backend domains.</div><div>=C2=A0=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; That is a significant regression in terms of security model Xen<br>
&gt; provides. It would give the backend domain _a lot more_ control over t=
he<br>
&gt; system that it normally has with Xen PV drivers - negating significant=
<br>
&gt; part of security benefits of using driver domains.<br>
<br>
It&#39;s part of the continual trade off between security and speed. For<br=
>
things like block and network backends there is a penalty if data has to<br=
>
be bounce buffered before it ends up in the guest address space.<br></block=
quote><div><br></div><div>I think we have significant flexibility in being =
able to modify several layers of the stack here to make this efficient, and=
 it would be beneficial to avoid bounce buffering if possible without sacri=
ficing the ability to enforce isolation. I wonder if there&#39;s a viable a=
pproach possible with some implementation of a virtual IOMMU (which enforce=
s access control) that would allow a backend to commission I/O on a physica=
l device on behalf of a guest, where the data buffers do not need to be map=
ped into the backend and so avoid the need for a bounce?</div><div>=C2=A0<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; So, does the above require frontend agreeing (explicitly or implicitly=
)<br>
&gt; for accessing specific pages by the backend? There were several<br>
&gt; approaches to that discussed, including using grant tables (as PV<br>
&gt; drivers do), vIOMMU(?), or even drastically different model with no<br=
>
&gt; shared memory at all (Argo). Can you clarify which (if any) approach<b=
r>
&gt; your attempt of VirtIO on Xen will use?<br>
<br>
There are separate strands of work in Stratos looking at how we could<br>
further secure VirtIO for architectures with distributed backends (e.g.<br>
you may accept the block backend having access to the whole of memory<br>
but an i2c multiplexer has different performance characteristics).<br>
<br>
Currently the only thing we have prototyped is &quot;fat virtqueues&quot; w=
hich<br>
Arnd has been working on. Here the only actual shared memory required is<br=
>
the VirtIO config space and the relevant virt queues.<br></blockquote><div>=
<br></div><div>I think the &quot;fat virtqueues&quot; work is a positive pa=
th for investigation and I don&#39;t think shared memory between front and =
backend is hard requirement for those to function: a VirtIO-Argo transport =
driver would be able to operate with them without shared memory.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Other approaches have been discussed including using the virtio-iommu to<br=
>
selectively make areas available to the backend or use memory zoning so<br>
for example network buffers are only allocated in a certain region of<br>
guest physical memory that is shared with the backend.<br>
<br>
&gt; A more general idea: can we collect info on various VirtIO on Xen<br>
&gt; approaches (since there is more than one) in a single place, including=
:<br>
&gt;=C2=A0 - key characteristics, differences<br>
&gt;=C2=A0 - who is involved<br>
&gt;=C2=A0 - status<br>
&gt;=C2=A0 - links to relevant threads, maybe<br>
&gt;<br>
&gt; I&#39;d propose to revive <a href=3D"https://wiki.xenproject.org/wiki/=
Virtio_On_Xen" rel=3D"noreferrer" target=3D"_blank">https://wiki.xenproject=
.org/wiki/Virtio_On_Xen</a></blockquote><div><br></div><div>Thanks for the =
reminder, Marek -- I&#39;ve just overhauled that page to give an overview o=
f the several approaches in the Xen community to enabling VirtIO on Xen, an=
d have included a first pass at including the content you describe. I&#39;m=
 happy to be involved in improving it further.</div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
From the Stratos point of view Xen is a useful proving ground for<br>
general VirtIO experimentation due to being both a type-1 and open<br>
source. Our ultimate aim is have a high degree of code sharing for<br>
backends regardless of the hypervisor choice so a guest can use a VirtIO<br=
>
device model without having to be locked into KVM.<br></blockquote><div><br=
></div><div>Thanks, Alex - this context is useful.</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
If your technology choice is already fixed with a Xen hypervisor and<br>
portability isn&#39;t a concern you might well just stick to the existing<b=
r>
well tested Xen PV interfaces.<br></blockquote><div><br></div><div>I wouldn=
&#39;t quite agree; there are additional reasons beyond portability to be l=
ooking at other options than the traditional Xen PV interfaces: eg. an Argo=
-based interdomain transport for PV devices will enable fine-grained enforc=
ement of Mandatory Access Control over the frontend / backend communication=
, and will not depend on XenStore which is advantageous for Hyperlaunch / d=
om0less Xen deployment configurations.</div><div><br></div><div>thanks,</di=
v><div><br></div><div>Christopher</div><div><br></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-- <br>
Alex Benn=C3=A9e<br>
-- <br>
Stratos-dev mailing list<br>
<a href=3D"mailto:Stratos-dev@op-lists.linaro.org" target=3D"_blank">Strato=
s-dev@op-lists.linaro.org</a><br>
<a href=3D"https://op-lists.linaro.org/mailman/listinfo/stratos-dev" rel=3D=
"noreferrer" target=3D"_blank">https://op-lists.linaro.org/mailman/listinfo=
/stratos-dev</a><br>
</blockquote></div></div>

--000000000000b588ee05cd07ddb6--

