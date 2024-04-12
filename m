Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4309E8A2969
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 10:35:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704445.1100854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvCNQ-0006HH-Ra; Fri, 12 Apr 2024 08:35:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704445.1100854; Fri, 12 Apr 2024 08:35:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvCNQ-0006Fk-Ou; Fri, 12 Apr 2024 08:35:16 +0000
Received: by outflank-mailman (input) for mailman id 704445;
 Fri, 12 Apr 2024 08:35:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nr2e=LR=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1rvCNP-0006Fe-5Z
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 08:35:15 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94dceaad-f8a7-11ee-b908-491648fe20b8;
 Fri, 12 Apr 2024 10:35:13 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5700076a8a7so185883a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2024 01:35:13 -0700 (PDT)
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
X-Inumbo-ID: 94dceaad-f8a7-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712910913; x=1713515713; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0kPs7aqgPMC+z8Asz8tXvfqXVZJMq/lCZJNgrA+2n3c=;
        b=OkHKQF0Q50eaHn8eJSc/ypV1JJDvH6cu5yGsuVFTNfbHN+fFk2nwD9odw04M447OZv
         b9eaFz9/DnjtW/dF6Q5W+hXbeUSE04ROCegL8zwZS3lpRC8eJOQ9REbGwa/kQ+JAofrg
         RoJuAudmUmhnQ/MrwA52nKrJ1O/CN2XxveFFN/6CbhY6dbiEGGfGdPEkLhe8zVwLg11E
         Y8ASSAfBD6Yf9n36yEmDlwDI8FWgHLRWjQs++5NwyeFw3P5y1M1RHY4j0ET1NYxsbrde
         /ForWJu8HVqocX8w+f+Uu5lvwGrL3ACMgLtrerCYJZE0CxiKcMpG2vQy5+4wLLrt/9y0
         UVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712910913; x=1713515713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0kPs7aqgPMC+z8Asz8tXvfqXVZJMq/lCZJNgrA+2n3c=;
        b=v73QrRfffOISpM4PNK/+ZGvBsVWO4t1l8QZGU6aYTv2xcd0DHCQloIv5DnUh1PjbuS
         1lJFUc7kqV0f9wDf92aTidHFSiyoSfaRTkTc6IHoKcuc83khIlfOjR+3DLvjpWCegK6C
         725qHzwuwPcnSaEH/qqztnmHdLV0vomnq57pZIVRvj9/UOdzituGbjLjysjmbzqJprHO
         a2k+52F3ubKvb5lbgXYxzCummZwTMa9OtEk+bJ8YDMXY12pSvD4KD8OYC4XBeqXndqgA
         oxxigVsafQG3BlQstIdPIXQAnGUPGqFYFR/XSsJsybH4T6rv2LmkLfr6ogpd+ZDl+q6o
         NETA==
X-Forwarded-Encrypted: i=1; AJvYcCUlDk2ShHPn2/VgEqkulM16CEkEkvt5fTOJjs+wgaXmKmJKGxtDwbqPXS0TGXym4XoToI9jWutWO1MQAlh7rrS9PQ5KxTAuKQxUg0nMWpU=
X-Gm-Message-State: AOJu0Yxuf56dpQ/uDoZWpfGCZKkJhBo4pK9Jq8n+dhLirIH3wA7Bit34
	CAjhpJDCaD273lHrz5V7u6f8Qr7Zf2ixSaIYEpxufGAYU1OcoJNg0OhOGJojvKfnOdMc3NYLe0x
	BjpxtPjWTyjbLjOmas5tvaxeKL6o=
X-Google-Smtp-Source: AGHT+IERLyjFHvVRiyJCUi2Qhxw/Au2iDGtlwPEntU4VnkfGgPQXSmTVhnz9LK8GPDF5xS//2XpnM/Fa277D3BMu3Ts=
X-Received: by 2002:a50:aa98:0:b0:56e:7884:9c7 with SMTP id
 q24-20020a50aa98000000b0056e788409c7mr1312577edc.19.1712910912839; Fri, 12
 Apr 2024 01:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <PA4PR04MB95655F653BBFE3A70A8CD0FBF9682@PA4PR04MB9565.eurprd04.prod.outlook.com>
 <alpine.DEB.2.22.394.2401111627360.3675@ubuntu-linux-20-04-desktop>
 <ZaCOVSuEJtsAj9G5@amd.com> <5fb49c84-0f54-49a5-9106-7f207b3eee4c@oss.nxp.com> <alpine.DEB.2.22.394.2404111446490.997881@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2404111446490.997881@ubuntu-linux-20-04-desktop>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Fri, 12 Apr 2024 10:35:00 +0200
Message-ID: <CAJy5ezqVL0d_U-QbTw0hdGASCv=OcwZ1QnBAPcGDnXD_ssaQBQ@mail.gmail.com>
Subject: Re: [VirtIO] Support for various devices in Xen
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>, 
	"viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, "olekstysh@gmail.com" <olekstysh@gmail.com>, 
	Julien Grall <julien@xen.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrei Cherechesu <andrei.cherechesu@nxp.com>, Bertrand.Marquis@arm.com, michal.orzel@amd.com, 
	Artem_Mygaiev@epam.com, Edgar.Iglesias@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 1:23=E2=80=AFAM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> -Vikram +Edgar
>
> On Thu, 11 Apr 2024, Andrei Cherechesu wrote:
> > Hi Stefano, Vikram, Viresh,
> >
> > Thank you for your answers and support, and sorry for my late reply.
> >
> >
> > On 12/01/2024 02:56, Vikram Garhwal wrote:
> > > Hi Andrei & Stefano,
> > >
> > > Actually, QEMU patches are already upstreamed for virtio-blk and virt=
io-net
> > > devices available in v8.2.0.
> > > For virtio with grants, the patches are WiP.
> > >
> > > On Xen side, we are yet to upstream xen-tools patches which basically=
 generate
> > > the right arguments when invoking QEMU.
> > > Here are down stream patches if you want:
> > > 1. https://github.com/Xilinx/xen/commit/be35b46e907c7c78fd23888d83747=
5eb28334638
> > > 2. For Virtio disk backend:
> > >     https://github.com/Xilinx/xen/commit/947280803294bbb963f428423f67=
9d074c60d632
> > > 3. For Virtio-net:
> > >     https://github.com/Xilinx/xen/commit/32fcc702718591270e5c8928b768=
7d853249c882
> > > 4. For changing the machine name to Xenpvh(to align with QEMU changes=
):
> > >     https://github.com/Xilinx/xen/commit/5f669949c9ffdb1947cb47038956=
b5fb8eeb072a
> > >> The libxl changes are lagging behind a bit and you might have to use
> > >> device_model_args to enable virtio backends in QEMU.
> > > But QEMU 8.2.0 can still be used for virtio-net on ARM.
> > >
> > > @Andrei here is an example on how to use virtio-net with QEMU:
> > >     -device virtio-net-device,id=3Dnic0,netdev=3Dnet0,mac=3D00:16:3e:=
4f:43:05 \
> > >     -netdev type=3Dtap,id=3Dnet0,ifname=3Dvif1.0-emu,br=3Dxenbr0,scri=
pt=3Dno,downscript=3Dno\
> > >     -machine xenpvh
> > >
> > > Please make sure to use xenpvh as QEMU machine.
> >
> > I've managed to successfully get a DomU up and running with the rootfs =
based on virtio-blk. I'm running QEMU 8.2.1, Xen 4.18 + Vikram's downstream=
 patches, Linux 6.6.12-rt, built through yocto with some changes to xen-too=
ls and QEMU recipes.
> >
> > However, when also enabling PV networking through virtio-net, it seems =
that DomU cannot successfully boot. The device model args passed by xen-too=
ls when invoking QEMU look exactly like what Vikram said they should.
> >
> > While executing `xl -v create ..` I can see some error regarding the de=
vice model crashing:
> >
> >         libxl: debug: libxl_exec.c:127:libxl_report_child_exitstatus: d=
omain 1 device model (dying as expected) [300] died due to fatal signal Kil=
led
> >
> > But the error is not fatal and the DomU spawn goes on, it boots but nev=
er reaches prompt. It seems that kernel crashes silently at some point. Tho=
ugh, the networking interface is present since udev tries to rename it righ=
t before boot hangs:
> >
> >         [    4.376715] vif vif-0 enX0: renamed from eth1
> >
> > Why would the QEMU DM process be killed, though? Invalid memory access?
> >
> > Here are the full logs for the "xl create" command [0] and for DomU's d=
mesg [1].
> > Any ideas as to why that might happen, some debugging insights, or mayb=
e some configuration details I could have overlooked?
> >
> > Thank you very much for your help once again.

Hi Andrei,

I'll share some info about my setup:
I'm using:

Xen upstream/master + virtio patches that Vikram shared
Commit 63f66058b5 on this repo/branch:
https://github.com/edgarigl/xen/tree/edgar/virtio-base

QEMU 02e16ab9f4 upstream/master
Linux 09e5c48fea17 upstream/master (from March)
Yocto rootfs.

I had a look at your logs but I can't tell why it's failing on your side.
I've not tried using a virtio-blk as a rootfs on my side, perhaps related.
It would be useful to see a diff of your Xen tree compared to plain
4.18 or whatever base you've got.
You probably don't have
https://github.com/edgarigl/xen/commit/63f66058b508180107963ea37217bc88d813=
df8f
but if that was the problem, I'd thought virtio wouldn't work at all
with your kernel it could also be related.

My guest config looks like this:
name =3D "g0"
memory =3D 1024
vcpus =3D 1
kernel =3D "Image"
ramdisk =3D "core-image-minimal-qemuarm64.rootfs.cpio.gz"
extra =3D "root=3D/dev/ram0 console=3DttyAMA0"
vif =3D [ 'model=3Dvirtio-net,type=3Dioemu,bridge=3Dxenbr0' ]
disk =3D [ '/etc/xen/file.img,,xvda,backendtype=3Dqdisk,specification=3Dvir=
tio' ]

xl launches QEMU with the following args:
/usr/bin/qemu-system-aarch64 -xen-domid 1 -no-shutdown -chardev
socket,id=3Dlibxl-cmd,path=3D/var/run/xen/qmp-libxl-1,server=3Don,wait=3Dof=
f
-mon chardev=3Dlibxl-cmd,mode=3Dcontrol -chardev
socket,id=3Dlibxenstat-cmd,path=3D/var/run/xen/qmp-libxenstat-1,server=3Don=
,wait=3Doff
-mon chardev=3Dlibxenstat-cmd,mode=3Dcontrol -nodefaults -no-user-config
-xen-attach -name g0 -vnc none -display none -nographic -global
virtio-mmio.force-legacy=3Dfalse -device
virtio-net-device,id=3Dnic0,netdev=3Dnet0,mac=3D00:16:3e:13:86:9c,iommu_pla=
tform=3Don
-netdev type=3Dtap,id=3Dnet0,ifname=3Dvif1.0-emu,br=3Dxenbr0,script=3Dno,do=
wnscript=3Dno
-machine xenpvh -m 1024 -device
virtio-blk-device,drive=3Dimage,iommu_platform=3Don -drive
if=3Dnone,id=3Dimage,format=3Draw,file=3D/etc/xen/file.img -global
virtio-mmio.force-legacy=3Dfalse

Cheers,
Edgar


>
> Edgar (CCed) has recently setup a working system with QEMU and the
> xenpvh machine for ARM. He should be able to help you.
>
> Cheers,
>
> Stefano
>
>
> > [0] https://privatebin.net/?0fc1db27433dbcb5#4twCBMayizr7x89pxPzNqQ198z=
92q8YxVheHvNDsVAtd
> > [1] https://privatebin.net/?ec3cb13fe2a086a1#F1zynLYQJCUDfZiwikZtRBEPJT=
ACR2GZX6jn2ShXxmae
> > >> For SCMI, I'll let Bertrand (CCed) comment.
> > >>
> > >> Cheers,
> > >>
> > >> Stefano
> > >>
> > >>
> > >> On Thu, 11 Jan 2024, Andrei Cherechesu (OSS) wrote:
> > >>> Hello,
> > >>>
> > >>> As I've mentioned in previous discussion threads in the xen-devel
> > >>> community, we are running Xen 4.17 (uprev to 4.18 in progress) on N=
XP
> > >>> S32G automotive processors (Cortex-A53 cores) and we wanted to know=
 more
> > >>> about the support for various VirtIO device types in Xen.
> > >>>
> > >>> In the Xen 4.17 release notes, the VirtIO standalone backends menti=
oned
> > >>> as supported and tested are: virtio-disk, virtio-net, virtio-i2c an=
d
> > >>> virtio-gpio.
> > >>>
> > >>> However, we've only managed to successfully set up and try some
> > >>> use-cases with the virtio-disk standalone backend [0] (which Olexan=
dr
> > >>> provided) based on the virtio-mmio transport.
> > >>>
> > >>> As such, we have a few questions, which we haven't been able to fig=
ure
> > >>> out from the mailing list discussions and/or code:
> > >>>     1. Are there any plans for the virtio-disk repo to have a stabl=
e
> > >>>     version? Is it going to be long-term hosted and maintained in t=
he
> > >>>     xen-troops github repo? Or was it just an one-time PoC implemen=
tation
> > >>>
> > >>>     and the strategy for future VirtIO devices will be based on a m=
ore generic
> > >>>
> > >>>     approach (i.e., without need for a specific standalone app)?
> > >>>
> > >>>
> > >>>     2. With regards to the other backends, we want to try out and p=
rovide PV
> > >>>
> > >>>     networking to a DomU based on virtio-net, but we haven't found =
any available
> > >>>
> > >>>     resources for it (e.g., the standalone backend implementation i=
f needed for
> > >>>
> > >>>     control plane, configuration examples, presentations, demos, do=
cs). Does it
> > >>>
> > >>>     rely on the QEMU virtio-net or vhost implementation? Are there =
any examples
> > >>>
> > >>>     on how to set it up? Any required Xen/Linux Kernel/QEMU version=
s?
> > >>>
> > >>>
> > >>>     3. What other VirtIO device types are there planned to be suppo=
rted in Xen?
> > >>>
> > >>>     I'm supposing libxl will also need changes to accomodate new co=
nfiguration
> > >>>
> > >>>     parameters for each of them. Or is there something I'm missing?
> > >>>
> > >>>
> > >>>     4. Also, while we're at it, are there any plans regarding SCMI
> > >>>     awareness for Xen (e.g., SCMI Mediator - where the RFC thread f=
rom 2022
> > >>>
> > >>>     seems discontinued)? Or is the preferred approach for sharing S=
CMI access
> > >>>
> > >>>     to guests through virtio-scmi?
> > >>>
> > >>> Thank you very much for the support, once again, and we're also loo=
king
> > >>> forward to the progress on the rust-vmm initiative.
> > >>>
> > >>> Regards,
> > >>> Andrei Cherechesu,
> > >>> NXP Semiconductors
> > >>>
> > >>> [0] https://github.com/xen-troops/virtio-disk
> > >>>
> > >>>
> > >>>
> >

