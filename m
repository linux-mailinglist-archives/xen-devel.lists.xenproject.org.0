Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DDB6115D2
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 17:27:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.432136.684881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooRFm-0004sy-3T; Fri, 28 Oct 2022 15:26:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432136.684881; Fri, 28 Oct 2022 15:26:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooRFl-0004qi-W5; Fri, 28 Oct 2022 15:26:37 +0000
Received: by outflank-mailman (input) for mailman id 432136;
 Fri, 28 Oct 2022 15:26:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SnbH=25=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1ooRFk-0004qc-6N
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 15:26:36 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e63657dc-56d4-11ed-8fd0-01056ac49cbb;
 Fri, 28 Oct 2022 17:26:32 +0200 (CEST)
Received: by mail-pl1-x632.google.com with SMTP id l2so5103622pld.13
 for <xen-devel@lists.xenproject.org>; Fri, 28 Oct 2022 08:26:32 -0700 (PDT)
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
X-Inumbo-ID: e63657dc-56d4-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xsk1CTBStwmyF2L6np0PIMN8Pxcqvpzehewr6aTD+FI=;
        b=GQSHxaCNRjiZ3+UhvMmxhHwoP5VyJAgU13N44arPMTTsBuBOaWbAwBVuzteCJKkMT3
         QjJJp5wTiO6+zkI1bcR8G/biXu3cYWqIq/gQUnfxE3BYpWjjb3a2rgQ/FkQ/noofQ3NV
         WHZZa7hvxpftlKNBzrDuhGZ1BDKz6TuejKaVJN3iuk4DlTSkIT0wjhkbq9F20n4d4IHC
         FStkAuYN4UU/qQ3EOOmszzjVKu6R9ob6tt4Biesj0TQmood4nx9JGU5CsftLvL9eKi4i
         LdH+1n3F+HCkbTaREGIjoXn9NE0dff1RNWGRHpu1ILrVeB8hb4GQIU6y5tUmzKAG30Ph
         6jgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xsk1CTBStwmyF2L6np0PIMN8Pxcqvpzehewr6aTD+FI=;
        b=2kuB2HGqvySQicyU9P8smwiqOx4NpOJN+Nzh9DpKYw49KEwoa/Rp6mu80SXsMXGvkg
         5FNQV5tUfvfMd2oGJ4KO5itGJ5LKUYEKD+++zqz6t1GvVB/4ZLY5AB49O3V/p485ADcU
         4/RxKvsMuDfarYtZ8LzrDwxZo7qck+0T+4CU/vCiYAaGUHnhjhnAQkRk0E8vxVa1zT1k
         QyDqNhMRlfNa8dk3WWuxWn8h9fuRpWWfaTN10paoV4Rs1538JhFubrz1d7EG/wRq+rlG
         SVcdjUBAolstcPGmNduqZdkMKW0l8sNBP62GjQWC7Sk+/AyU9DTaVuWrzZK6NOqRxc4Y
         4/rQ==
X-Gm-Message-State: ACrzQf2U7PD57Cn6uFg4DDigqDY+BrFX/nqiZH/k5JMx9TeMa/e44WZo
	3JCsVimMvIIrqyZ6aOJSlMOAguGdQTCJBGNhfu0=
X-Google-Smtp-Source: AMsMyM6L7JL/ZztJXo1rZOjHP1NqnUJNsQapw7FycTklZVaJpVZwXjxt4Veo1YMTgwnTW6sAz4IRYP9MYNuU24+Vz/I=
X-Received: by 2002:a17:902:b907:b0:178:2898:8084 with SMTP id
 bf7-20020a170902b90700b0017828988084mr54642133plb.140.1666970790666; Fri, 28
 Oct 2022 08:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <DD70007C-300F-44D3-B314-A5F8C4582CD3@arm.com> <75b7665f-66aa-2e11-35a0-edf20a9c0139@xen.org>
 <99E954B0-50F5-4D7B-A7D2-50D1B7B3657C@arm.com> <95470820-dc9d-dc3b-eb5f-b4db688fa5b1@amd.com>
 <CAPD2p-=PSahQR0JWe3tLEtp0-iiNH=yE96_GxNyDbhSw-fod0w@mail.gmail.com> <60B7173E-65B4-4859-8F14-5CA34368640E@arm.com>
In-Reply-To: <60B7173E-65B4-4859-8F14-5CA34368640E@arm.com>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Fri, 28 Oct 2022 18:26:18 +0300
Message-ID: <CAPD2p-mrka5aQPpGRABhmc3kY_kFEZL-YDg_iDN0TAVFgO1a6A@mail.gmail.com>
Subject: Re: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough devices
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	Xen developer discussion <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	Michal Orzel <Michal.Orzel@arm.com>, Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, 
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Content-Type: multipart/alternative; boundary="000000000000d4257c05ec19e10e"

--000000000000d4257c05ec19e10e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 27, 2022 at 7:49 PM Rahul Singh <Rahul.Singh@arm.com> wrote:

> Hi Oleksandr,
>

Hello Rahul

[sorry for the possible format issues]


>
> > On 26 Oct 2022, at 7:23 pm, Oleksandr Tyshchenko <olekstysh@gmail.com>
> wrote:
> >
> >
> >
> > On Wed, Oct 26, 2022 at 8:18 PM Michal Orzel <michal.orzel@amd.com>
> wrote:
> > Hi Rahul,
> >
> >
> > Hello all
> >
> > [sorry for the possible format issues]
> >
> >
> > On 26/10/2022 16:33, Rahul Singh wrote:
> > >
> > >
> > > Hi Julien,
> > >
> > >> On 26 Oct 2022, at 2:36 pm, Julien Grall <julien@xen.org> wrote:
> > >>
> > >>
> > >>
> > >> On 26/10/2022 14:17, Rahul Singh wrote:
> > >>> Hi All,
> > >>
> > >> Hi Rahul,
> > >>
> > >>> At Arm, we started to implement the POC to support 2 levels of page
> tables/nested translation in SMMUv3.
> > >>> To support nested translation for guest OS Xen needs to expose the
> virtual IOMMU. If we passthrough the
> > >>> device to the guest that is behind an IOMMU and virtual IOMMU is
> enabled for the guest there is a need to
> > >>> add IOMMU binding for the device in the passthrough node as per [1]=
.
> This email is to get an agreement on
> > >>> how to add the IOMMU binding for guest OS.
> > >>> Before I will explain how to add the IOMMU binding let me give a
> brief overview of how we will add support for virtual
> > >>> IOMMU on Arm. In order to implement virtual IOMMU Xen need SMMUv3
> Nested translation support. SMMUv3 hardware
> > >>> supports two stages of translation. Each stage of translation can b=
e
> independently enabled. An incoming address is logically
> > >>> translated from VA to IPA in stage 1, then the IPA is input to stag=
e
> 2 which translates the IPA to the output PA. Stage 1 is
> > >>> intended to be used by a software entity( Guest OS) to provide
> isolation or translation to buffers within the entity, for example,
> > >>> DMA isolation within an OS. Stage 2 is intended to be available in
> systems supporting the Virtualization Extensions and is
> > >>> intended to virtualize device DMA to guest VM address spaces. When
> both stage 1 and stage 2 are enabled, the translation
> > >>> configuration is called nesting.
> > >>> Stage 1 translation support is required to provide isolation betwee=
n
> different devices within the guest OS. XEN already supports
> > >>> Stage 2 translation but there is no support for Stage 1 translation
> for guests. We will add support for guests to configure
> > >>> the Stage 1 transition via virtual IOMMU. XEN will emulate the SMMU
> hardware and exposes the virtual SMMU to the guest.
> > >>> Guest can use the native SMMU driver to configure the stage 1
> translation. When the guest configures the SMMU for Stage 1,
> > >>> XEN will trap the access and configure the hardware accordingly.
> > >>> Now back to the question of how we can add the IOMMU binding betwee=
n
> the virtual IOMMU and the master devices so that
> > >>> guests can configure the IOMMU correctly. The solution that I am
> suggesting is as below:
> > >>> For dom0, while handling the DT node(handle_node()) Xen will replac=
e
> the phandle in the "iommus" property with the virtual
> > >>> IOMMU node phandle.
> > >> Below, you said that each IOMMUs may have a different ID space. So
> shouldn't we expose one vIOMMU per pIOMMU? If not, how do you expect the
> user to specify the mapping?
> > >
> > > Yes you are right we need to create one vIOMMU per pIOMMU for dom0.
> This also helps in the ACPI case
> > > where we don=E2=80=99t need to modify the tables to delete the pIOMMU=
 entries
> and create one vIOMMU.
> > > In this case, no need to replace the phandle as Xen create the vIOMMU
> with the same pIOMMU
> > > phandle and same base address.
> > >
> > > For domU guests one vIOMMU per guest will be created.
> > >
> > >>
> > >>> For domU guests, when passthrough the device to the guest as per
> [2],  add the below property in the partial device tree
> > >>> node that is required to describe the generic device tree binding
> for IOMMUs and their master(s)
> > >>> "iommus =3D < &magic_phandle 0xvMasterID>
> > >>>      =E2=80=A2 magic_phandle will be the phandle ( vIOMMU phandle i=
n xl)
> that will be documented so that the user can set that in partial DT node
> (0xfdea).
> > >>
> > >> Does this mean only one IOMMU will be supported in the guest?
> > >
> > > Yes.
> > >
> > >>
> > >>>      =E2=80=A2 vMasterID will be the virtual master ID that the use=
r will
> provide.
> > >>> The partial device tree will look like this:
> > >>> /dts-v1/;
> > >>>  / {
> > >>>     /* #*cells are here to keep DTC happy */
> > >>>     #address-cells =3D <2>;
> > >>>     #size-cells =3D <2>;
> > >>>       aliases {
> > >>>         net =3D &mac0;
> > >>>     };
> > >>>       passthrough {
> > >>>         compatible =3D "simple-bus";
> > >>>         ranges;
> > >>>         #address-cells =3D <2>;
> > >>>         #size-cells =3D <2>;
> > >>>         mac0: ethernet@10000000 {
> > >>>             compatible =3D "calxeda,hb-xgmac";
> > >>>             reg =3D <0 0x10000000 0 0x1000>;
> > >>>             interrupts =3D <0 80 4  0 81 4  0 82 4>;
> > >>>            iommus =3D <0xfdea 0x01>;
> > >>>         };
> > >>>     };
> > >>> };
> > >>>  In xl.cfg we need to define a new option to inform Xen about
> vMasterId to pMasterId mapping and to which IOMMU device this
> > >>> the master device is connected so that Xen can configure the right
> IOMMU. This is required if the system has devices that have
> > >>> the same master ID but behind a different IOMMU.
> > >>
> > >> In xl.cfg, we already pass the device-tree node path to passthrough.
> So Xen should already have all the information about the IOMMU and
> Master-ID. So it doesn't seem necessary for Device-Tree.
> > >>
> > >> For ACPI, I would have expected the information to be found in the
> IOREQ.
> > >>
> > >> So can you add more context why this is necessary for everyone?
> > >
> > > We have information for IOMMU and Master-ID but we don=E2=80=99t have
> information for linking vMaster-ID to pMaster-ID.
> > > The device tree node will be used to assign the device to the guest
> and configure the Stage-2 translation. Guest will use the
> > > vMaster-ID to configure the vIOMMU during boot. Xen needs information
> to link vMaster-ID to pMaster-ID to configure
> > > the corresponding pIOMMU. As I mention we need vMaster-ID in case a
> system could have 2 identical Master-ID but
> > > each one connected to a different SMMU and assigned to the guest.
> >
> > I think the proposed solution would work and I would just like to clear
> some issues.
> >
> > Please correct me if I'm wrong:
> >
> > In the xl config file we already need to specify dtdev to point to the
> device path in host dtb.
> > In the partial device tree we specify the vMasterId as well as magic
> phandle.
> > Isn't it that we already have all the information necessary without the
> need for iommu_devid_map?
> > For me it looks like the partial dtb provides vMasterID and dtdev
> provides pMasterID as well as physical phandle to SMMU.
> >
> > Having said that, I can also understand that specifying everything in
> one place using iommu_devid_map can be easier
> > and reduces the need for device tree parsing.
> >
> > Apart from that, what is the reason of exposing only one vSMMU to guest
> instead of one vSMMU per pSMMU?
> > In the latter solution, the whole issue with handling devices with the
> same stream ID but belonging to different SMMUs
> > would be gone. It would also result in a more natural way of the device
> tree look. Normally a guest would see
> > e.g. both SMMUs and exposing only one can be misleading.
> >
> > I also have the same question. From earlier answers as I understand it
> is going to be identity vSMMU <-> pSMMU mappings for Dom0, so why diverge
> for DomU?
> >
> > Also I am thinking how this solution would work for IPMMU-VMSA
> Gen3(Gen4), which also supports two stages of translation, so the nested
> translation could be possible in general, although there might be some
> pitfalls
> > (yes, I understand that code to emulate access to control registers
> would be different in comparison with SMMUv3, but some other code could b=
e
> common).
>
> Yes we will try to make code common so that other vIOMMU can be
> implemented easily.
> >
> >
> >
> >
> >
> > >>
> > >>>  iommu_devid_map =3D [ =E2=80=9CPMASTER_ID[@VMASTER_ID],IOMMU_BASE_=
ADDRESS=E2=80=9D ,
> =E2=80=9CPMASTER_ID[@VMASTER_ID],IOMMU_BASE_ADDRESS=E2=80=9D]
> > >>>      =E2=80=A2 PMASTER_ID is the physical master ID of the device f=
rom the
> physical DT.
> > >>>      =E2=80=A2 VMASTER_ID is the virtual master Id that the user wi=
ll
> configure in the partial device tree.
> > >>>      =E2=80=A2 IOMMU_BASE_ADDRESS is the base address of the physic=
al IOMMU
> device to which this device is connected.
> >
> >
> > If iommu_devid_map is a way to go, I have a question, would this
> configuration cover the following cases?
> > 1. Device has several stream IDs
>
> Yes in that case user needs to create the mapping for each streamIDs. For
> example if device has streamId 0x10 , 0x20 and 0x30.
> iommu_devid_map will be:
>
> iommu_devid_map =3D ["0x10@0x01,0x40000000=E2=80=9D, "0x20@0x02
> ,0x40000000=E2=80=9D,"0x30@0x03,0x40000000=E2=80=9D]
>
> Here 0x40000000 is physical IOMMU base address.
>
> > 2. Several devices share the stream ID (or several stream IDs)
>
> Let take an example of two devices :
>
> Device 1: 0x10
> Device 2: 0x10
>
> Iommu_devid_map =3D [=E2=80=9C0x10@0x1,0x40000000=E2=80=9D,"0x10@0x2,0x40=
000000=E2=80=9D]
>
> Xen will create the data structure that include vStreamID, pMasterID and
> IOMMU base address.
> With the help of three tuples we will be able to find the right physical
> IOMMU.



Thanks for the clarification, I see that iommu_devid_map is able to
describe various combinations, which is good. But, the user should be very
careful when filling in iommu_devid_map especially
if dealing with a system that has many iommus and devices with many stream
IDs, as it would be easy to make a mistake in that case.
As a real example, if I want to describe 5 DMA controllers assigned to the
guest where each has 16 uTLBs (this is an equivalent of stream IDs) I would
need to add 80 entries (quite lot) to iommu_devid_map with specifying
VMASTER_ID for each entry (as uTLBs are not unique across the system).

https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/renesas/r=
8a77951.dtsi#L1042
https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/renesas/r=
8a77951.dtsi#L1084
https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/renesas/r=
8a77951.dtsi#L1126
https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/renesas/r=
8a77951.dtsi#L2450
https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/renesas/r=
8a77951.dtsi#L2492


So I agree in general with what has been said earlier in that thread to
*better* avoid user interaction
and teach the toolstack to do this automatically. At the same time I
understand this might be quite difficult to implement, etc.



>
>
>
> Regards,
> Rahul



--=20
Regards,

Oleksandr Tyshchenko

--000000000000d4257c05ec19e10e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 27, 2022 at 7:49 PM Rahul=
 Singh &lt;<a href=3D"mailto:Rahul.Singh@arm.com" target=3D"_blank">Rahul.S=
ingh@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Hi Oleksandr,<br></blockquote><div><br></div><div>Hello=C2=A0Ra=
hul</div><div><br></div><div>[sorry for the possible format issues]</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; On 26 Oct 2022, at 7:23 pm, Oleksandr Tyshchenko &lt;<a href=3D"mailto=
:olekstysh@gmail.com" target=3D"_blank">olekstysh@gmail.com</a>&gt; wrote:<=
br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On Wed, Oct 26, 2022 at 8:18 PM Michal Orzel &lt;<a href=3D"mailto:mic=
hal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt; wrote:<br=
>
&gt; Hi Rahul,<br>
&gt;=C2=A0 <br>
&gt; <br>
&gt; Hello all<br>
&gt; <br>
&gt; [sorry for the possible format issues]<br>
&gt;=C2=A0 <br>
&gt; <br>
&gt; On 26/10/2022 16:33, Rahul Singh wrote:<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; Hi Julien,<br>
&gt; &gt; <br>
&gt; &gt;&gt; On 26 Oct 2022, at 2:36 pm, Julien Grall &lt;<a href=3D"mailt=
o:julien@xen.org" target=3D"_blank">julien@xen.org</a>&gt; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On 26/10/2022 14:17, Rahul Singh wrote:<br>
&gt; &gt;&gt;&gt; Hi All,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Hi Rahul,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt; At Arm, we started to implement the POC to support 2 leve=
ls of page tables/nested translation in SMMUv3.<br>
&gt; &gt;&gt;&gt; To support nested translation for guest OS Xen needs to e=
xpose the virtual IOMMU. If we passthrough the<br>
&gt; &gt;&gt;&gt; device to the guest that is behind an IOMMU and virtual I=
OMMU is enabled for the guest there is a need to<br>
&gt; &gt;&gt;&gt; add IOMMU binding for the device in the passthrough node =
as per [1]. This email is to get an agreement on<br>
&gt; &gt;&gt;&gt; how to add the IOMMU binding for guest OS.<br>
&gt; &gt;&gt;&gt; Before I will explain how to add the IOMMU binding let me=
 give a brief overview of how we will add support for virtual<br>
&gt; &gt;&gt;&gt; IOMMU on Arm. In order to implement virtual IOMMU Xen nee=
d SMMUv3 Nested translation support. SMMUv3 hardware<br>
&gt; &gt;&gt;&gt; supports two stages of translation. Each stage of transla=
tion can be independently enabled. An incoming address is logically<br>
&gt; &gt;&gt;&gt; translated from VA to IPA in stage 1, then the IPA is inp=
ut to stage 2 which translates the IPA to the output PA. Stage 1 is<br>
&gt; &gt;&gt;&gt; intended to be used by a software entity( Guest OS) to pr=
ovide isolation or translation to buffers within the entity, for example,<b=
r>
&gt; &gt;&gt;&gt; DMA isolation within an OS. Stage 2 is intended to be ava=
ilable in systems supporting the Virtualization Extensions and is<br>
&gt; &gt;&gt;&gt; intended to virtualize device DMA to guest VM address spa=
ces. When both stage 1 and stage 2 are enabled, the translation<br>
&gt; &gt;&gt;&gt; configuration is called nesting.<br>
&gt; &gt;&gt;&gt; Stage 1 translation support is required to provide isolat=
ion between different devices within the guest OS. XEN already supports<br>
&gt; &gt;&gt;&gt; Stage 2 translation but there is no support for Stage 1 t=
ranslation for guests. We will add support for guests to configure<br>
&gt; &gt;&gt;&gt; the Stage 1 transition via virtual IOMMU. XEN will emulat=
e the SMMU hardware and exposes the virtual SMMU to the guest.<br>
&gt; &gt;&gt;&gt; Guest can use the native SMMU driver to configure the sta=
ge 1 translation. When the guest configures the SMMU for Stage 1,<br>
&gt; &gt;&gt;&gt; XEN will trap the access and configure the hardware accor=
dingly.<br>
&gt; &gt;&gt;&gt; Now back to the question of how we can add the IOMMU bind=
ing between the virtual IOMMU and the master devices so that<br>
&gt; &gt;&gt;&gt; guests can configure the IOMMU correctly. The solution th=
at I am suggesting is as below:<br>
&gt; &gt;&gt;&gt; For dom0, while handling the DT node(handle_node()) Xen w=
ill replace the phandle in the &quot;iommus&quot; property with the virtual=
<br>
&gt; &gt;&gt;&gt; IOMMU node phandle.<br>
&gt; &gt;&gt; Below, you said that each IOMMUs may have a different ID spac=
e. So shouldn&#39;t we expose one vIOMMU per pIOMMU? If not, how do you exp=
ect the user to specify the mapping?<br>
&gt; &gt; <br>
&gt; &gt; Yes you are right we need to create one vIOMMU per pIOMMU for dom=
0. This also helps in the ACPI case<br>
&gt; &gt; where we don=E2=80=99t need to modify the tables to delete the pI=
OMMU entries and create one vIOMMU.<br>
&gt; &gt; In this case, no need to replace the phandle as Xen create the vI=
OMMU with the same pIOMMU<br>
&gt; &gt; phandle and same base address.<br>
&gt; &gt; <br>
&gt; &gt; For domU guests one vIOMMU per guest will be created.<br>
&gt; &gt; <br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt; For domU guests, when passthrough the device to the guest=
 as per [2],=C2=A0 add the below property in the partial device tree<br>
&gt; &gt;&gt;&gt; node that is required to describe the generic device tree=
 binding for IOMMUs and their master(s)<br>
&gt; &gt;&gt;&gt; &quot;iommus =3D &lt; &amp;magic_phandle 0xvMasterID&gt;<=
br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =E2=80=A2 magic_phandle will be the p=
handle ( vIOMMU phandle in xl)=C2=A0 that will be documented so that the us=
er can set that in partial DT node (0xfdea).<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Does this mean only one IOMMU will be supported in the guest?=
<br>
&gt; &gt; <br>
&gt; &gt; Yes.<br>
&gt; &gt; <br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =E2=80=A2 vMasterID will be the virtu=
al master ID that the user will provide.<br>
&gt; &gt;&gt;&gt; The partial device tree will look like this:<br>
&gt; &gt;&gt;&gt; /dts-v1/;<br>
&gt; &gt;&gt;&gt;=C2=A0 / {<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0/* #*cells are here to keep DTC happy =
*/<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0#address-cells =3D &lt;2&gt;;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0#size-cells =3D &lt;2&gt;;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0aliases {<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0net =3D &amp;mac0;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0};<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0passthrough {<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;sim=
ple-bus&quot;;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ranges;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#address-cells =3D &lt;2=
&gt;;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#size-cells =3D &lt;2&gt=
;;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mac0: ethernet@10000000 =
{<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible=
 =3D &quot;calxeda,hb-xgmac&quot;;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &l=
t;0 0x10000000 0 0x1000&gt;;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupts=
 =3D &lt;0 80 4=C2=A0 0 81 4=C2=A0 0 82 4&gt;;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iommus =3D &lt;0=
xfdea 0x01&gt;;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0};<br>
&gt; &gt;&gt;&gt; };<br>
&gt; &gt;&gt;&gt;=C2=A0 In xl.cfg we need to define a new option to inform =
Xen about vMasterId to pMasterId mapping and to which IOMMU device this<br>
&gt; &gt;&gt;&gt; the master device is connected so that Xen can configure =
the right IOMMU. This is required if the system has devices that have<br>
&gt; &gt;&gt;&gt; the same master ID but behind a different IOMMU.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; In xl.cfg, we already pass the device-tree node path to passt=
hrough. So Xen should already have all the information about the IOMMU and =
Master-ID. So it doesn&#39;t seem necessary for Device-Tree.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; For ACPI, I would have expected the information to be found i=
n the IOREQ.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; So can you add more context why this is necessary for everyon=
e?<br>
&gt; &gt; <br>
&gt; &gt; We have information for IOMMU and Master-ID but we don=E2=80=99t =
have information for linking vMaster-ID to pMaster-ID.<br>
&gt; &gt; The device tree node will be used to assign the device to the gue=
st and configure the Stage-2 translation. Guest will use the<br>
&gt; &gt; vMaster-ID to configure the vIOMMU during boot. Xen needs informa=
tion to link vMaster-ID to pMaster-ID to configure<br>
&gt; &gt; the corresponding pIOMMU. As I mention we need vMaster-ID in case=
 a system could have 2 identical Master-ID but<br>
&gt; &gt; each one connected to a different SMMU and assigned to the guest.=
<br>
&gt; <br>
&gt; I think the proposed solution would work and I would just like to clea=
r some issues.<br>
&gt; <br>
&gt; Please correct me if I&#39;m wrong:<br>
&gt; <br>
&gt; In the xl config file we already need to specify dtdev to point to the=
 device path in host dtb.<br>
&gt; In the partial device tree we specify the vMasterId as well as magic p=
handle.<br>
&gt; Isn&#39;t it that we already have all the information necessary withou=
t the need for iommu_devid_map?<br>
&gt; For me it looks like the partial dtb provides vMasterID and dtdev prov=
ides pMasterID as well as physical phandle to SMMU.<br>
&gt; <br>
&gt; Having said that, I can also understand that specifying everything in =
one place using iommu_devid_map can be easier<br>
&gt; and reduces the need for device tree parsing.<br>
&gt; <br>
&gt; Apart from that, what is the reason of exposing only one vSMMU to gues=
t instead of one vSMMU per pSMMU?<br>
&gt; In the latter solution, the whole issue with handling devices with the=
 same stream ID but belonging to different SMMUs<br>
&gt; would be gone. It would also result in a more natural way of the devic=
e tree look. Normally a guest would see<br>
&gt; e.g. both SMMUs and exposing only one can be misleading.<br>
&gt; <br>
&gt; I also have the same question. From earlier answers as I understand it=
 is going to be identity vSMMU &lt;-&gt; pSMMU mappings for Dom0, so why di=
verge for DomU?<br>
&gt; <br>
&gt; Also I am thinking how this solution would work for IPMMU-VMSA Gen3(Ge=
n4), which also supports two stages of translation, so the nested translati=
on could be possible in general, although there might be some pitfalls<br>
&gt; (yes, I understand that code to emulate access to control registers wo=
uld be different in comparison with SMMUv3, but some other code could be co=
mmon).=C2=A0 <br>
<br>
Yes we will try to make code common so that other vIOMMU can be implemented=
 easily. <br>
&gt;=C2=A0 =C2=A0 <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 <br>
&gt; <br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 iommu_devid_map =3D [ =E2=80=9CPMASTER_ID[@VMASTER_=
ID],IOMMU_BASE_ADDRESS=E2=80=9D , =E2=80=9CPMASTER_ID[@VMASTER_ID],IOMMU_BA=
SE_ADDRESS=E2=80=9D]<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =E2=80=A2 PMASTER_ID is the physical =
master ID of the device from the physical DT.<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =E2=80=A2 VMASTER_ID is the virtual m=
aster Id that the user will configure in the partial device tree.<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =E2=80=A2 IOMMU_BASE_ADDRESS is the b=
ase address of the physical IOMMU device to which this device is connected.=
<br>
&gt;=C2=A0 <br>
&gt; <br>
&gt; If iommu_devid_map is a way to go, I have a question, would this confi=
guration cover the following cases?<br>
&gt; 1. Device has several stream IDs<br>
<br>
Yes in that case user needs to create the mapping for each streamIDs. For e=
xample if device has streamId 0x10 , 0x20 and 0x30.<br>
iommu_devid_map will be:<br>
<br>
iommu_devid_map =3D [&quot;0x10@0x01,0x40000000=E2=80=9D, &quot;0x20@0x02,0=
x40000000=E2=80=9D,&quot;0x30@0x03,0x40000000=E2=80=9D]<br>
<br>
Here 0x40000000 is physical IOMMU base address.<br>
<br>
&gt; 2. Several devices share the stream ID (or several stream IDs)<br>
<br>
Let take an example of two devices :<br>
<br>
Device 1: 0x10<br>
Device 2: 0x10<br>
<br>
Iommu_devid_map =3D [=E2=80=9C0x10@0x1,0x40000000=E2=80=9D,&quot;0x10@0x2,0=
x40000000=E2=80=9D]<br>
<br>
Xen will create the data structure that include vStreamID, pMasterID and IO=
MMU base address. <br>
With the help of three tuples we will be able to find the right physical IO=
MMU.</blockquote><div><br></div><div><br></div>Thanks for the clarification=
, I see that iommu_devid_map is able to describe various combinations, whic=
h is good. But, the user should be very careful when filling in iommu_devid=
_map especially<br>if dealing with a system that has many iommus and device=
s with many stream IDs, as it would be easy to make a mistake in that case.=
<br>As a real example, if I want to describe 5 DMA controllers assigned to =
the guest where each has 16 uTLBs (this is an equivalent of stream IDs) I w=
ould need to add 80 entries (quite lot) to iommu_devid_map with specifying =
VMASTER_ID for each entry (as uTLBs are not unique across the system). <br>=
<br><a href=3D"https://github.com/torvalds/linux/blob/master/arch/arm64/boo=
t/dts/renesas/r8a77951.dtsi#L1042">https://github.com/torvalds/linux/blob/m=
aster/arch/arm64/boot/dts/renesas/r8a77951.dtsi#L1042</a><br><a href=3D"htt=
ps://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/renesas/r8a7=
7951.dtsi#L1084">https://github.com/torvalds/linux/blob/master/arch/arm64/b=
oot/dts/renesas/r8a77951.dtsi#L1084</a><br><a href=3D"https://github.com/to=
rvalds/linux/blob/master/arch/arm64/boot/dts/renesas/r8a77951.dtsi#L1126">h=
ttps://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/renesas/r8=
a77951.dtsi#L1126</a><br><a href=3D"https://github.com/torvalds/linux/blob/=
master/arch/arm64/boot/dts/renesas/r8a77951.dtsi#L2450">https://github.com/=
torvalds/linux/blob/master/arch/arm64/boot/dts/renesas/r8a77951.dtsi#L2450<=
/a><br><a href=3D"https://github.com/torvalds/linux/blob/master/arch/arm64/=
boot/dts/renesas/r8a77951.dtsi#L2492">https://github.com/torvalds/linux/blo=
b/master/arch/arm64/boot/dts/renesas/r8a77951.dtsi#L2492</a><br><br><br>So =
I agree in general with what has been said earlier in that thread to *bette=
r* avoid user interaction<br><div>and teach the toolstack to do this automa=
tically. At the same time I understand this might be quite difficult to imp=
lement, etc.=C2=A0 =C2=A0 =C2=A0<br></div><div><br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"> <br>
<br>
<br>
Regards,<br>
Rahul</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D=
"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><span st=
yle=3D"background-color:rgb(255,255,255)"><font size=3D"2"><span style=3D"c=
olor:rgb(51,51,51);font-family:Arial,sans-serif">Regards,</span></font></sp=
an></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div><span style=3D"ba=
ckground-color:rgb(255,255,255)"><font size=3D"2">Oleksandr Tyshchenko</fon=
t></span></div></div></div></div></div></div></div></div>

--000000000000d4257c05ec19e10e--

