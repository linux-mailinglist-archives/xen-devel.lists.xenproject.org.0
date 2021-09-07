Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D189F40224B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 04:43:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180322.326917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNR3j-00068x-HR; Tue, 07 Sep 2021 02:42:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180322.326917; Tue, 07 Sep 2021 02:42:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNR3j-00066q-EJ; Tue, 07 Sep 2021 02:42:03 +0000
Received: by outflank-mailman (input) for mailman id 180322;
 Tue, 07 Sep 2021 02:42:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M3oQ=N5=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1mNR3i-00066k-JU
 for xen-devel@lists.xen.org; Tue, 07 Sep 2021 02:42:02 +0000
Received: from mail-oi1-x22b.google.com (unknown [2607:f8b0:4864:20::22b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bacbc3a1-6530-4402-99d4-5ffb8b8e8b8b;
 Tue, 07 Sep 2021 02:42:00 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id q39so10977071oiw.12
 for <xen-devel@lists.xen.org>; Mon, 06 Sep 2021 19:42:00 -0700 (PDT)
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
X-Inumbo-ID: bacbc3a1-6530-4402-99d4-5ffb8b8e8b8b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DW9xyVq0VMsOnG7pEIDynSXF5/evQSkaZLzLtVFxop8=;
        b=MYeiHb2HeVfr6ZyokGIU//eh9yOTOkLkp/PvkD60nIV4JNNddtRjL9TxKpAjVa5tUS
         T5G0Nhb33f0j6xoP5yIqx8wgfGn5cFoy8zb0JtJ5qYwG1Yp8ao19CH2/UVoPZjHJtz6k
         SIrMQuNabuaI65bwrtyLZ9A1yHM2rpCNFA+otPGstCW02Zax1VsJd926iy9WVyd/YPoD
         BaGAxD9WJJf8m188fypJuYTVeeyFMLC0kO+cg5HKuLyPpojsh/pwMM0FC4XgwZbrmQGQ
         wASM7bwRFAs0iMBvPiNqa4qJ0uNLtZ9+ASyFijT+t9aYMH76u797wCLvu7jKKFI2U325
         1A2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DW9xyVq0VMsOnG7pEIDynSXF5/evQSkaZLzLtVFxop8=;
        b=YnMpDEpRf8JFVELI4RFrBeb26f2iAYmmedG9kFLRX8gejD+UuSO4YF1teNJWplJVdt
         +TQkqztBvxrlvo2zbSad9ni0pzfg5XMNb/cgTBkM03db29s4dgJjCc1ndDlqhpDfa5XY
         5V1Bc32oaXZndj+E9ZRnm3CRUByx65EDfTUamHBgDRTieVsqDN44hj1ysh5EokTDBYkX
         IrxXED9sX0T6/14rX5JeHeGUCAWE+rllCWclnx34x+jB5SNKo6QXwgHZoSVvFZ18UMBP
         1dzUyFTfzfKeGn1Gd3TSdfwgaas+l9ifbVUT21emrIXuUYe8GZDrVCAwFYsAM0a6ieDk
         5tww==
X-Gm-Message-State: AOAM532/6U4cR/V9hqj8wq0QIVaghyfNskzBDdI15XE0pt/A1WOSE/Pq
	z+hJtsd1dpCHSjxtq+SzO4R5q448dHi7ZEiLAE4=
X-Google-Smtp-Source: ABdhPJz5qwyNwRm9AtgL03IQFlT0nPkWIPMKhsYmaWd2teMLjVt7RoQQburO6AFCfN6vWU1lbvUjcSX6Rx6V6uTzTMI=
X-Received: by 2002:a54:4197:: with SMTP id 23mr1373584oiy.122.1630982520003;
 Mon, 06 Sep 2021 19:42:00 -0700 (PDT)
MIME-Version: 1.0
References: <87v94ldrqq.fsf@linaro.org> <alpine.DEB.2.21.2108041055390.9768@sstabellini-ThinkPad-T480s>
 <YRuSPT9075NuWRYS@stefanha-x1.localdomain> <875yvkh1p1.fsf@linaro.org>
 <20210903080609.GD47953@laputa> <87czpqq9qu.fsf@linaro.org> <20210906022356.GD40187@laputa>
In-Reply-To: <20210906022356.GD40187@laputa>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Mon, 6 Sep 2021 19:41:48 -0700
Message-ID: <CACMJ4GaJyAnguzAEH87DSNN_+GhEa5jRbw11hVj-yWMAXx8V7w@mail.gmail.com>
Subject: Re: [Stratos-dev] Enabling hypervisor agnosticism for VirtIO backends
To: AKASHI Takahiro <takahiro.akashi@linaro.org>
Cc: "Alex Benn??e" <alex.bennee@linaro.org>, Wei Chen <Wei.Chen@arm.com>, 
	Paul Durrant <paul@xen.org>, Stratos Mailing List <stratos-dev@op-lists.linaro.org>, 
	virtio-dev@lists.oasis-open.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Arnd Bergmann <arnd.bergmann@linaro.org>, 
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, 
	Carl van Schaik <cvanscha@qti.qualcomm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>, 
	Xen-devel <xen-devel@lists.xen.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>, 
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Elena Afanasova <eafanasova@gmail.com>, 
	James McKenzie <james@bromium.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Rich Persaud <persaur@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, 
	Jason Andryuk <jandryuk@gmail.com>, eric chanudet <eric.chanudet@gmail.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000bd5eb305cb5eb55e"

--000000000000bd5eb305cb5eb55e
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 5, 2021 at 7:24 PM AKASHI Takahiro via Stratos-dev <
stratos-dev@op-lists.linaro.org> wrote:

> Alex,
>
> On Fri, Sep 03, 2021 at 10:28:06AM +0100, Alex Benn??e wrote:
> >
> > AKASHI Takahiro <takahiro.akashi@linaro.org> writes:
> >
> > > Alex,
> > >
> > > On Wed, Sep 01, 2021 at 01:53:34PM +0100, Alex Benn??e wrote:
> > >>
> > >> Stefan Hajnoczi <stefanha@redhat.com> writes:
> > >>
> > >> > [[PGP Signed Part:Undecided]]
> > >> > On Wed, Aug 04, 2021 at 12:20:01PM -0700, Stefano Stabellini wrote:
> > >> >> > Could we consider the kernel internally converting IOREQ
> messages from
> > >> >> > the Xen hypervisor to eventfd events? Would this scale with
> other kernel
> > >> >> > hypercall interfaces?
> > >> >> >
> > >> >> > So any thoughts on what directions are worth experimenting with?
> > >> >>
> > >> >> One option we should consider is for each backend to connect to
> Xen via
> > >> >> the IOREQ interface. We could generalize the IOREQ interface and
> make it
> > >> >> hypervisor agnostic. The interface is really trivial and easy to
> add.
> > >> >> The only Xen-specific part is the notification mechanism, which is
> an
> > >> >> event channel. If we replaced the event channel with something
> else the
> > >> >> interface would be generic. See:
> > >> >>
> https://gitlab.com/xen-project/xen/-/blob/staging/xen/include/public/hvm/ioreq.h#L52
> > >> >
> > >> > There have been experiments with something kind of similar in KVM
> > >> > recently (see struct ioregionfd_cmd):
> > >> >
> https://lore.kernel.org/kvm/dad3d025bcf15ece11d9df0ff685e8ab0a4f2edd.1613828727.git.eafanasova@gmail.com/
> > >>
> > >> Reading the cover letter was very useful in showing how this provides
> a
> > >> separate channel for signalling IO events to userspace instead of
> using
> > >> the normal type-2 vmexit type event. I wonder how deeply tied the
> > >> userspace facing side of this is to KVM? Could it provide a common FD
> > >> type interface to IOREQ?
> > >
> > > Why do you stick to a "FD" type interface?
> >
> > I mean most user space interfaces on POSIX start with a file descriptor
> > and the usual read/write semantics or a series of ioctls.
>
> Who do you assume is responsible for implementing this kind of
> fd semantics, OSs on BE or hypervisor itself?
>
> I think such interfaces can only be easily implemented on type-2
> hypervisors.
>
> # In this sense, I don't think rust-vmm, as it is, cannot be
> # a general solution.
>
> > >> As I understand IOREQ this is currently a direct communication between
> > >> userspace and the hypervisor using the existing Xen message bus. My
> > >
> > > With IOREQ server, IO event occurrences are notified to BE via Xen's
> event
> > > channel, while the actual contexts of IO events (see struct ioreq in
> ioreq.h)
> > > are put in a queue on a single shared memory page which is to be
> assigned
> > > beforehand with xenforeignmemory_map_resource hypervisor call.
> >
> > If we abstracted the IOREQ via the kernel interface you would probably
> > just want to put the ioreq structure on a queue rather than expose the
> > shared page to userspace.
>
> Where is that queue?
>
> > >> worry would be that by adding knowledge of what the underlying
> > >> hypervisor is we'd end up with excess complexity in the kernel. For
> one
> > >> thing we certainly wouldn't want an API version dependency on the
> kernel
> > >> to understand which version of the Xen hypervisor it was running on.
> > >
> > > That's exactly what virtio-proxy in my proposal[1] does; All the
> hypervisor-
> > > specific details of IO event handlings are contained in virtio-proxy
> > > and virtio BE will communicate with virtio-proxy through a virtqueue
> > > (yes, virtio-proxy is seen as yet another virtio device on BE) and will
> > > get IO event-related *RPC* callbacks, either MMIO read or write, from
> > > virtio-proxy.
> > >
> > > See page 8 (protocol flow) and 10 (interfaces) in [1].
> >
> > There are two areas of concern with the proxy approach at the moment.
> > The first is how the bootstrap of the virtio-proxy channel happens and
>
> As I said, from BE point of view, virtio-proxy would be seen
> as yet another virtio device by which BE could talk to "virtio
> proxy" vm or whatever else.
>
> This way we guarantee BE's hypervisor-agnosticism instead of having
> "common" hypervisor interfaces. That is the base of my idea.
>
> > the second is how many context switches are involved in a transaction.
> > Of course with all things there is a trade off. Things involving the
> > very tightest latency would probably opt for a bare metal backend which
> > I think would imply hypervisor knowledge in the backend binary.
>
> In configuration phase of virtio device, the latency won't be a big matter.
> In device operations (i.e. read/write to block devices), if we can
> resolve 'mmap' issue, as Oleksandr is proposing right now, the only issue
> is
> how efficiently we can deliver notification to the opposite side. Right?
> And this is a very common problem whatever approach we would take.
>
> Anyhow, if we do care the latency in my approach, most of virtio-proxy-
> related code can be re-implemented just as a stub (or shim?) library
> since the protocols are defined as RPCs.
> In this case, however, we would lose the benefit of providing "single
> binary"
> BE.
> (I know this is is an arguable requirement, though.)
>
> # Would we better discuss what "hypervisor-agnosticism" means?
>
> Is there a call that you could recommend that we join to discuss this and
the topics of this thread?
There is definitely interest in pursuing a new interface for Argo that can
be implemented in other hypervisors and enable guest binary portability
between them, at least on the same hardware architecture, with VirtIO
transport as a primary use case.

The notes from the Xen Summit Design Session on VirtIO Cross-Project BoF
for Xen and Guest OS, which include context about the several separate
approaches to VirtIO on Xen, have now been posted here:
https://lists.xenproject.org/archives/html/xen-devel/2021-09/msg00472.html

Christopher



> -Takahiro Akashi
>
>
>

--000000000000bd5eb305cb5eb55e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 5, 2021 at 7:24 PM AKASHI=
 Takahiro via Stratos-dev &lt;<a href=3D"mailto:stratos-dev@op-lists.linaro=
.org">stratos-dev@op-lists.linaro.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Alex,<br>
<br>
On Fri, Sep 03, 2021 at 10:28:06AM +0100, Alex Benn??e wrote:<br>
&gt; <br>
&gt; AKASHI Takahiro &lt;<a href=3D"mailto:takahiro.akashi@linaro.org" targ=
et=3D"_blank">takahiro.akashi@linaro.org</a>&gt; writes:<br>
&gt; <br>
&gt; &gt; Alex,<br>
&gt; &gt;<br>
&gt; &gt; On Wed, Sep 01, 2021 at 01:53:34PM +0100, Alex Benn??e wrote:<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt; Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" ta=
rget=3D"_blank">stefanha@redhat.com</a>&gt; writes:<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt; &gt; [[PGP Signed Part:Undecided]]<br>
&gt; &gt;&gt; &gt; On Wed, Aug 04, 2021 at 12:20:01PM -0700, Stefano Stabel=
lini wrote:<br>
&gt; &gt;&gt; &gt;&gt; &gt; Could we consider the kernel internally convert=
ing IOREQ messages from<br>
&gt; &gt;&gt; &gt;&gt; &gt; the Xen hypervisor to eventfd events? Would thi=
s scale with other kernel<br>
&gt; &gt;&gt; &gt;&gt; &gt; hypercall interfaces?<br>
&gt; &gt;&gt; &gt;&gt; &gt; <br>
&gt; &gt;&gt; &gt;&gt; &gt; So any thoughts on what directions are worth ex=
perimenting with?<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt; One option we should consider is for each backend to=
 connect to Xen via<br>
&gt; &gt;&gt; &gt;&gt; the IOREQ interface. We could generalize the IOREQ i=
nterface and make it<br>
&gt; &gt;&gt; &gt;&gt; hypervisor agnostic. The interface is really trivial=
 and easy to add.<br>
&gt; &gt;&gt; &gt;&gt; The only Xen-specific part is the notification mecha=
nism, which is an<br>
&gt; &gt;&gt; &gt;&gt; event channel. If we replaced the event channel with=
 something else the<br>
&gt; &gt;&gt; &gt;&gt; interface would be generic. See:<br>
&gt; &gt;&gt; &gt;&gt; <a href=3D"https://gitlab.com/xen-project/xen/-/blob=
/staging/xen/include/public/hvm/ioreq.h#L52" rel=3D"noreferrer" target=3D"_=
blank">https://gitlab.com/xen-project/xen/-/blob/staging/xen/include/public=
/hvm/ioreq.h#L52</a><br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; There have been experiments with something kind of simil=
ar in KVM<br>
&gt; &gt;&gt; &gt; recently (see struct ioregionfd_cmd):<br>
&gt; &gt;&gt; &gt; <a href=3D"https://lore.kernel.org/kvm/dad3d025bcf15ece1=
1d9df0ff685e8ab0a4f2edd.1613828727.git.eafanasova@gmail.com/" rel=3D"norefe=
rrer" target=3D"_blank">https://lore.kernel.org/kvm/dad3d025bcf15ece11d9df0=
ff685e8ab0a4f2edd.1613828727.git.eafanasova@gmail.com/</a><br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt; Reading the cover letter was very useful in showing how this =
provides a<br>
&gt; &gt;&gt; separate channel for signalling IO events to userspace instea=
d of using<br>
&gt; &gt;&gt; the normal type-2 vmexit type event. I wonder how deeply tied=
 the<br>
&gt; &gt;&gt; userspace facing side of this is to KVM? Could it provide a c=
ommon FD<br>
&gt; &gt;&gt; type interface to IOREQ?<br>
&gt; &gt;<br>
&gt; &gt; Why do you stick to a &quot;FD&quot; type interface?<br>
&gt; <br>
&gt; I mean most user space interfaces on POSIX start with a file descripto=
r<br>
&gt; and the usual read/write semantics or a series of ioctls.<br>
<br>
Who do you assume is responsible for implementing this kind of<br>
fd semantics, OSs on BE or hypervisor itself?<br>
<br>
I think such interfaces can only be easily implemented on type-2 hypervisor=
s.<br>
<br>
# In this sense, I don&#39;t think rust-vmm, as it is, cannot be<br>
# a general solution.<br>
<br>
&gt; &gt;&gt; As I understand IOREQ this is currently a direct communicatio=
n between<br>
&gt; &gt;&gt; userspace and the hypervisor using the existing Xen message b=
us. My<br>
&gt; &gt;<br>
&gt; &gt; With IOREQ server, IO event occurrences are notified to BE via Xe=
n&#39;s event<br>
&gt; &gt; channel, while the actual contexts of IO events (see struct ioreq=
 in ioreq.h)<br>
&gt; &gt; are put in a queue on a single shared memory page which is to be =
assigned<br>
&gt; &gt; beforehand with xenforeignmemory_map_resource hypervisor call.<br=
>
&gt; <br>
&gt; If we abstracted the IOREQ via the kernel interface you would probably=
<br>
&gt; just want to put the ioreq structure on a queue rather than expose the=
<br>
&gt; shared page to userspace. <br>
<br>
Where is that queue?<br>
<br>
&gt; &gt;&gt; worry would be that by adding knowledge of what the underlyin=
g<br>
&gt; &gt;&gt; hypervisor is we&#39;d end up with excess complexity in the k=
ernel. For one<br>
&gt; &gt;&gt; thing we certainly wouldn&#39;t want an API version dependenc=
y on the kernel<br>
&gt; &gt;&gt; to understand which version of the Xen hypervisor it was runn=
ing on.<br>
&gt; &gt;<br>
&gt; &gt; That&#39;s exactly what virtio-proxy in my proposal[1] does; All =
the hypervisor-<br>
&gt; &gt; specific details of IO event handlings are contained in virtio-pr=
oxy<br>
&gt; &gt; and virtio BE will communicate with virtio-proxy through a virtqu=
eue<br>
&gt; &gt; (yes, virtio-proxy is seen as yet another virtio device on BE) an=
d will<br>
&gt; &gt; get IO event-related *RPC* callbacks, either MMIO read or write, =
from<br>
&gt; &gt; virtio-proxy.<br>
&gt; &gt;<br>
&gt; &gt; See page 8 (protocol flow) and 10 (interfaces) in [1].<br>
&gt; <br>
&gt; There are two areas of concern with the proxy approach at the moment.<=
br>
&gt; The first is how the bootstrap of the virtio-proxy channel happens and=
<br>
<br>
As I said, from BE point of view, virtio-proxy would be seen<br>
as yet another virtio device by which BE could talk to &quot;virtio<br>
proxy&quot; vm or whatever else.<br>
<br>
This way we guarantee BE&#39;s hypervisor-agnosticism instead of having<br>
&quot;common&quot; hypervisor interfaces. That is the base of my idea.<br>
<br>
&gt; the second is how many context switches are involved in a transaction.=
<br>
&gt; Of course with all things there is a trade off. Things involving the<b=
r>
&gt; very tightest latency would probably opt for a bare metal backend whic=
h<br>
&gt; I think would imply hypervisor knowledge in the backend binary.<br>
<br>
In configuration phase of virtio device, the latency won&#39;t be a big mat=
ter.<br>
In device operations (i.e. read/write to block devices), if we can<br>
resolve &#39;mmap&#39; issue, as Oleksandr is proposing right now, the only=
 issue is<br>
how efficiently we can deliver notification to the opposite side. Right?<br=
>
And this is a very common problem whatever approach we would take.<br>
<br>
Anyhow, if we do care the latency in my approach, most of virtio-proxy-<br>
related code can be re-implemented just as a stub (or shim?) library<br>
since the protocols are defined as RPCs.<br>
In this case, however, we would lose the benefit of providing &quot;single =
binary&quot;<br>
BE.<br>
(I know this is is an arguable requirement, though.)<br>
<br>
# Would we better discuss what &quot;hypervisor-agnosticism&quot; means?<br=
>
<br></blockquote><div>Is there a call that you could recommend that we join=
 to discuss this and the topics of this thread?</div><div>There is definite=
ly interest in pursuing a new interface for Argo that can be implemented in=
 other hypervisors and enable guest binary portability between them, at lea=
st on the same hardware architecture, with VirtIO transport as a primary us=
e case.</div><div><br></div><div>The notes from the Xen Summit Design Sessi=
on on VirtIO Cross-Project BoF for Xen and Guest OS, which include context =
about the several separate approaches to VirtIO on Xen, have now been poste=
d here:</div><div><a href=3D"https://lists.xenproject.org/archives/html/xen=
-devel/2021-09/msg00472.html">https://lists.xenproject.org/archives/html/xe=
n-devel/2021-09/msg00472.html</a><br></div><div><br></div><div>Christopher<=
/div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
-Takahiro Akashi<br>
<br><br>
</blockquote></div></div>

--000000000000bd5eb305cb5eb55e--

