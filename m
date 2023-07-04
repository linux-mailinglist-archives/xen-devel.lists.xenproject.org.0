Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C32747795
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 19:15:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558581.872806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGjcS-0004qB-8S; Tue, 04 Jul 2023 17:15:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558581.872806; Tue, 04 Jul 2023 17:15:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGjcS-0004nz-5S; Tue, 04 Jul 2023 17:15:16 +0000
Received: by outflank-mailman (input) for mailman id 558581;
 Tue, 04 Jul 2023 17:15:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Q6u=CW=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1qGjcR-0004nt-1u
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 17:15:15 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 555009b9-1a8e-11ee-8611-37d641c3527e;
 Tue, 04 Jul 2023 19:15:12 +0200 (CEST)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1b89e10d356so10624025ad.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Jul 2023 10:15:12 -0700 (PDT)
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
X-Inumbo-ID: 555009b9-1a8e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688490911; x=1691082911;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tKZ68cydAkPbtFvf5MYcmHYlMLMsBvPQpIORG93kvps=;
        b=ZJ+6K+Cc+zO2x+/Th/Qw8/RImWEGtcIwUEk++smcOi9U6oAFmmnjoAbx+stgg2cR/7
         naPTqEYWvJQHzJtSeumaeHo0mrR8ryAAm/wzB4Vy3HBkpPAv5KQ20lknynVb/WjDtClb
         1av1OBA8XA626AlD4hIdcr2LYmnEXkmsJE2a6hLYvy9bHpJYrjRirtuWjhB1QOFIXNJ+
         AnJxaRvrGEWPf6p4pvwbW43Wzpan7P8Y02St28Bg4sVaQJDjakJ3/TYx8QgReuPuhJyk
         PVDPN4gPZShhEbFxYzHnmixDKIVMxe/FIc6+WYr3TqaBPw/7ACdfNPXLJzvgjNZw2eHi
         QW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688490911; x=1691082911;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tKZ68cydAkPbtFvf5MYcmHYlMLMsBvPQpIORG93kvps=;
        b=JkBxBHnrq/Vy7KbNSmcR63Z7HVfvkxLs8uKHVvfrkbcQqQC31lBWvcU+n5oPe9pKMQ
         +riq1kw0q1SFbc1kYksE58PC8jHIi2ITA9UJUpOUsaBkktTiV+YR4GWQ0JNhF6x+K1P7
         eqaZy45HuevFgrCAizasDofZs5vHcFfSFBWMTP4E2i7ijIhIZlSjYl1tV1sWofGe2I+3
         1S2QalNqNyFuIwv2d+j/HJ03HE62o/hERFCX6tWihBvErgwZLrkb+aBfofUzQvOC8e+M
         Lswfys+WagO2AIgVibfAJaBF5z4FI3mDflyb9nC5QroBFp4Mpf4sCNbZbJUZoNiNimH7
         wTSA==
X-Gm-Message-State: ABy/qLYwysa+JnMcRVd3yQeShkVUc+OHktlftnVxyL32YzWrpizXN7hu
	GzLHmUwhNmvNmv97UoQ6HQbrGvqPzuvT1uIAHl8=
X-Google-Smtp-Source: APBJJlGxG6QAD6OaWx4SUrnqUir385+eBtxw6rU9uUeMEDOPkEm+/+Wd+dYB2Wxyx8tymUh/paezx1Ygwf6kN3stRZw=
X-Received: by 2002:a17:90a:7b87:b0:263:8083:bdcf with SMTP id
 z7-20020a17090a7b8700b002638083bdcfmr10927832pjc.15.1688490910662; Tue, 04
 Jul 2023 10:15:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230621131214.9398-1-petr.pavlu@suse.com> <20230621131214.9398-3-petr.pavlu@suse.com>
 <15e31609-6c45-7372-76ee-0adf7a64fe88@epam.com> <alpine.DEB.2.22.394.2306281745010.3936094@ubuntu-linux-20-04-desktop>
 <b21398eb-2fb2-4fca-dd90-d2c81d8df1c4@epam.com> <alpine.DEB.2.22.394.2306291502150.3936094@ubuntu-linux-20-04-desktop>
 <ZKPO5WbFGblXU5hX@MacBook-Air-de-Roger.local> <e5eda26f-9a31-dc3a-d97f-33d2efa20efa@suse.com>
 <ZKQF8qq8Oh5E+Fxx@mail-itl> <ZKQxZY03x30rjdoF@MacBook-Air-de-Roger.local>
In-Reply-To: <ZKQxZY03x30rjdoF@MacBook-Air-de-Roger.local>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Tue, 4 Jul 2023 20:14:59 +0300
Message-ID: <CAPD2p-nG8SbNYF6Ob262bP71qXNGmWLZcYTLO-DnnmTQX2VHvw@mail.gmail.com>
Subject: Re: [PATCH 2/2] xen/virtio: Avoid use of the dom0 backend in dom0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, vikram.garhwal@amd.com
Content-Type: multipart/alternative; boundary="000000000000efc60b05ffac6c55"

--000000000000efc60b05ffac6c55
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 4, 2023 at 5:49=E2=80=AFPM Roger Pau Monn=C3=A9 <roger.pau@citr=
ix.com> wrote:

Hello all.

[sorry for the possible format issues]


On Tue, Jul 04, 2023 at 01:43:46PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> > Hi,
> >
> > FWIW, I have ran into this issue some time ago too. I run Xen on top of
> > KVM and then passthrough some of the virtio devices (network one
> > specifically) into a (PV) guest. So, I hit both cases, the dom0 one and
> > domU one. As a temporary workaround I needed to disable
> > CONFIG_XEN_VIRTIO completely (just disabling
> > CONFIG_XEN_VIRTIO_FORCE_GRANT was not enough to fix it).
> > With that context in place, the actual response below.
> >
> > On Tue, Jul 04, 2023 at 12:39:40PM +0200, Juergen Gross wrote:
> > > On 04.07.23 09:48, Roger Pau Monn=C3=A9 wrote:
> > > > On Thu, Jun 29, 2023 at 03:44:04PM -0700, Stefano Stabellini wrote:
> > > > > On Thu, 29 Jun 2023, Oleksandr Tyshchenko wrote:
> > > > > > On 29.06.23 04:00, Stefano Stabellini wrote:
> > > > > > > I think we need to add a second way? It could be anything tha=
t
> can help
> > > > > > > us distinguish between a non-grants-capable virtio backend an=
d
> a
> > > > > > > grants-capable virtio backend, such as:
> > > > > > > - a string on xenstore
> > > > > > > - a xen param
> > > > > > > - a special PCI configuration register value
> > > > > > > - something in the ACPI tables
> > > > > > > - the QEMU machine type
> > > > > >
> > > > > >
> > > > > > Yes, I remember there was a discussion regarding that. The poin=
t
> is to
> > > > > > choose a solution to be functional for both PV and HVM *and* to
> be able
> > > > > > to support a hotplug. IIRC, the xenstore could be a possible
> candidate.
> > > > >
> > > > > xenstore would be among the easiest to make work. The only
> downside is
> > > > > the dependency on xenstore which otherwise virtio+grants doesn't
> have.
> > > >
> > > > I would avoid introducing a dependency on xenstore, if nothing else
> we
> > > > know it's a performance bottleneck.
> > > >
> > > > We would also need to map the virtio device topology into xenstore,
> so
> > > > that we can pass different options for each device.
> > >
> > > This aspect (different options) is important. How do you want to pass
> virtio
> > > device configuration parameters from dom0 to the virtio backend
> domain? You
> > > probably need something like Xenstore (a virtio based alternative lik=
e
> virtiofs
> > > would work, too) for that purpose.
> > >
> > > Mapping the topology should be rather easy via the PCI-Id, e.g.:
> > >
> > > /local/domain/42/device/virtio/0000:00:1c.0/backend
> >
> > While I agree this would probably be the simplest to implement, I don't
> > like introducing xenstore dependency into virtio frontend either.
> > Toolstack -> backend communication is probably easier to solve, as it's
> > much more flexible (could use qemu cmdline, QMP, other similar
> > mechanisms for non-qemu backends etc).
>
> I also think features should be exposed uniformly for devices, it's at
> least weird to have certain features exposed in the PCI config space
> while other features exposed in xenstore.
>
> For virtio-mmio this might get a bit confusing, are we going to add
> xenstore entries based on the position of the device config mmio
> region?
>
> I think on Arm PCI enumeration is not (usually?) done by the firmware,
> at which point the SBDF expected by the tools/backend might be
> different than the value assigned by the guest OS.
>
> I think there are two slightly different issues, one is how to pass
> information to virtio backends, I think doing this initially based on
> xenstore is not that bad, because it's an internal detail of the
> backend implementation. However passing information to virtio
> frontends using xenstore is IMO a bad idea, there's already a way to
> negotiate features between virtio frontends and backends, and Xen
> should just expand and use that.
>
>

On Arm with device-tree we have a special bindings which purpose is to
inform us whether we need to use grants for virtio and backend domid for a
particular device.Here on x86, we don't have a device tree, so cannot
(easily?) reuse this logic.

I have just recollected one idea suggested by Stefano some time ago [1].
The context of discussion was about what to do when device-tree and ACPI
cannot be reused (or something like that).The idea won't cover virtio-mmio,
but I have heard that virtio-mmio usage with x86 Xen is rather unusual case=
.

I will paste the text below for convenience.

**********

Part 1 (intro):

We could reuse a PCI config space register to expose the backend id.
However this solution requires a backend change (QEMU) to expose the
backend id via an emulated register for each emulated device.

To avoid having to introduce a special config space register in all
emulated PCI devices (virtio-net, virtio-block, etc) I wonder if we
could add a special PCI config space register at the emulated PCI Root
Complex level.

Basically the workflow would be as follow:

- Linux recognizes the PCI Root Complex as a Xen PCI Root Complex
- Linux writes to special PCI config space register of the Xen PCI Root
  Complex the PCI device id (basically the BDF)
- The Xen PCI Root Complex emulated by Xen answers by writing back to
  the same location the backend id (domid of the backend)
- Linux reads back the same PCI config space register of the Xen PCI
  Root Complex and learn the relevant domid

Part 2 (clarification):

I think using a special config space register in the root complex would
not be terrible in terms of guest changes because it is easy to
introduce a new root complex driver in Linux and other OSes. The root
complex would still be ECAM compatible so the regular ECAM driver would
still work. A new driver would only be necessary if you want to be able
to access the special config space register.


**********
What do you think about it? Are there any pitfalls, etc? This also requires
system changes, but at least without virtio spec changes.

[1]
https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2210061747590.3690179=
@ubuntu-linux-20-04-desktop/


--=20
Regards,

Oleksandr Tyshchenko

--000000000000efc60b05ffac6c55
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 4, 2023 at 5:49=E2=80=AFP=
M Roger Pau Monn=C3=A9 &lt;<a href=3D"mailto:roger.pau@citrix.com">roger.pa=
u@citrix.com</a>&gt; wrote:<br></div><div dir=3D"ltr" class=3D"gmail_attr">=
<br></div><div class=3D"gmail_attr">Hello all.</div><div dir=3D"ltr" class=
=3D"gmail_attr"><br></div><div class=3D"gmail_attr">[sorry for the possible=
 format issues]</div><div dir=3D"ltr" class=3D"gmail_attr"><br></div><div d=
ir=3D"ltr" class=3D"gmail_attr"><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Tue, Jul 04, 2023 at 01:43:46PM +0200, Marek Marczykows=
ki-G=C3=B3recki wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; FWIW, I have ran into this issue some time ago too. I run Xen on top o=
f<br>
&gt; KVM and then passthrough some of the virtio devices (network one<br>
&gt; specifically) into a (PV) guest. So, I hit both cases, the dom0 one an=
d<br>
&gt; domU one. As a temporary workaround I needed to disable<br>
&gt; CONFIG_XEN_VIRTIO completely (just disabling<br>
&gt; CONFIG_XEN_VIRTIO_FORCE_GRANT was not enough to fix it).<br>
&gt; With that context in place, the actual response below.<br>
&gt; <br>
&gt; On Tue, Jul 04, 2023 at 12:39:40PM +0200, Juergen Gross wrote:<br>
&gt; &gt; On 04.07.23 09:48, Roger Pau Monn=C3=A9 wrote:<br>
&gt; &gt; &gt; On Thu, Jun 29, 2023 at 03:44:04PM -0700, Stefano Stabellini=
 wrote:<br>
&gt; &gt; &gt; &gt; On Thu, 29 Jun 2023, Oleksandr Tyshchenko wrote:<br>
&gt; &gt; &gt; &gt; &gt; On 29.06.23 04:00, Stefano Stabellini wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; I think we need to add a second way? It could=
 be anything that can help<br>
&gt; &gt; &gt; &gt; &gt; &gt; us distinguish between a non-grants-capable v=
irtio backend and a<br>
&gt; &gt; &gt; &gt; &gt; &gt; grants-capable virtio backend, such as:<br>
&gt; &gt; &gt; &gt; &gt; &gt; - a string on xenstore<br>
&gt; &gt; &gt; &gt; &gt; &gt; - a xen param<br>
&gt; &gt; &gt; &gt; &gt; &gt; - a special PCI configuration register value<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; - something in the ACPI tables<br>
&gt; &gt; &gt; &gt; &gt; &gt; - the QEMU machine type<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; Yes, I remember there was a discussion regarding t=
hat. The point is to<br>
&gt; &gt; &gt; &gt; &gt; choose a solution to be functional for both PV and=
 HVM *and* to be able<br>
&gt; &gt; &gt; &gt; &gt; to support a hotplug. IIRC, the xenstore could be =
a possible candidate.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; xenstore would be among the easiest to make work. The o=
nly downside is<br>
&gt; &gt; &gt; &gt; the dependency on xenstore which otherwise virtio+grant=
s doesn&#39;t have.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; I would avoid introducing a dependency on xenstore, if nothi=
ng else we<br>
&gt; &gt; &gt; know it&#39;s a performance bottleneck.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; We would also need to map the virtio device topology into xe=
nstore, so<br>
&gt; &gt; &gt; that we can pass different options for each device.<br>
&gt; &gt; <br>
&gt; &gt; This aspect (different options) is important. How do you want to =
pass virtio<br>
&gt; &gt; device configuration parameters from dom0 to the virtio backend d=
omain? You<br>
&gt; &gt; probably need something like Xenstore (a virtio based alternative=
 like virtiofs<br>
&gt; &gt; would work, too) for that purpose.<br>
&gt; &gt; <br>
&gt; &gt; Mapping the topology should be rather easy via the PCI-Id, e.g.:<=
br>
&gt; &gt; <br>
&gt; &gt; /local/domain/42/device/virtio/0000:00:1c.0/backend<br>
&gt; <br>
&gt; While I agree this would probably be the simplest to implement, I don&=
#39;t<br>
&gt; like introducing xenstore dependency into virtio frontend either.<br>
&gt; Toolstack -&gt; backend communication is probably easier to solve, as =
it&#39;s<br>
&gt; much more flexible (could use qemu cmdline, QMP, other similar<br>
&gt; mechanisms for non-qemu backends etc).<br>
<br>
I also think features should be exposed uniformly for devices, it&#39;s at<=
br>
least weird to have certain features exposed in the PCI config space<br>
while other features exposed in xenstore.<br>
<br>
For virtio-mmio this might get a bit confusing, are we going to add<br>
xenstore entries based on the position of the device config mmio<br>
region?<br>
<br>
I think on Arm PCI enumeration is not (usually?) done by the firmware,<br>
at which point the SBDF expected by the tools/backend might be<br>
different than the value assigned by the guest OS.<br>
<br>
I think there are two slightly different issues, one is how to pass<br>
information to virtio backends, I think doing this initially based on<br>
xenstore is not that bad, because it&#39;s an internal detail of the<br>
backend implementation. However passing information to virtio<br>
frontends using xenstore is IMO a bad idea, there&#39;s already a way to<br=
>
negotiate features between virtio frontends and backends, and Xen<br>
should just expand and use that.<br><br></blockquote><div><br></div><div><b=
r></div><div>On Arm with device-tree we have a special bindings which purpo=
se is to inform us whether we need to use grants for virtio and backend dom=
id for a particular device.Here on x86, we don&#39;t have a device tree, so=
 cannot (easily?) reuse this logic.</div><div><br>I have just recollected o=
ne idea suggested by Stefano some time ago [1]. The context of discussion w=
as about what to do when device-tree and ACPI cannot be reused (or somethin=
g like that).The idea won&#39;t cover virtio-mmio, but I have heard that vi=
rtio-mmio usage with x86 Xen is rather unusual case.</div><div><br>I will p=
aste the text below for convenience.=C2=A0</div><div><br></div><div>*******=
***</div><div><br>Part 1 (intro):</div><div><br>We could reuse a PCI config=
 space register to expose the backend id.<br>However this solution requires=
 a backend change (QEMU) to expose the<br>backend id via an emulated regist=
er for each emulated device.<br><br>To avoid having to introduce a special =
config space register in all<br>emulated PCI devices (virtio-net, virtio-bl=
ock, etc) I wonder if we<br>could add a special PCI config space register a=
t the emulated PCI Root<br>Complex level.<br><br>Basically the workflow wou=
ld be as follow:<br><br>- Linux recognizes the PCI Root Complex as a Xen PC=
I Root Complex<br>- Linux writes to special PCI config space register of th=
e Xen PCI Root<br>=C2=A0 Complex the PCI device id (basically the BDF)<br>-=
 The Xen PCI Root Complex emulated by Xen answers by writing back to<br>=C2=
=A0 the same location the backend id (domid of the backend)<br>- Linux read=
s back the same PCI config space register of the Xen PCI<br>=C2=A0 Root Com=
plex and learn the relevant domid</div><div><br>Part 2 (clarification):</di=
v><div><br>I think using a special config space register in the root comple=
x would<br>not be terrible in terms of guest changes because it is easy to<=
br>introduce a new root complex driver in Linux and other OSes. The root<br=
>complex would still be ECAM compatible so the regular ECAM driver would<br=
>still work. A new driver would only be necessary if you want to be able<br=
>to access the special config space register.<br><br><br>**********<br>What=
 do=C2=A0you=C2=A0think about it? Are there any pitfalls, etc? This also re=
quires system changes, but at least without virtio spec changes.=C2=A0=C2=
=A0<br><br></div><div>[1]=C2=A0<a href=3D"https://lore.kernel.org/xen-devel=
/alpine.DEB.2.22.394.2210061747590.3690179@ubuntu-linux-20-04-desktop/">htt=
ps://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2210061747590.3690179@ub=
untu-linux-20-04-desktop/</a><br></div><div><br></div><div><br></div></div>=
<span class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=
=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=
=3D"ltr"><span style=3D"background-color:rgb(255,255,255)"><font size=3D"2"=
><span style=3D"color:rgb(51,51,51);font-family:Arial,sans-serif">Regards,<=
/span></font></span></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div>=
<span style=3D"background-color:rgb(255,255,255)"><font size=3D"2">Oleksand=
r Tyshchenko</font></span></div></div></div></div></div></div></div></div>

--000000000000efc60b05ffac6c55--

