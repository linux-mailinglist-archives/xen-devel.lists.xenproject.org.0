Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D6360E720
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 20:24:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430727.682728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onl3j-0000ww-GD; Wed, 26 Oct 2022 18:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430727.682728; Wed, 26 Oct 2022 18:23:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onl3j-0000uV-Cz; Wed, 26 Oct 2022 18:23:23 +0000
Received: by outflank-mailman (input) for mailman id 430727;
 Wed, 26 Oct 2022 18:23:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XGDX=23=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1onl3i-0000uN-1I
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 18:23:22 +0000
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 431a90af-555b-11ed-8fd0-01056ac49cbb;
 Wed, 26 Oct 2022 20:23:18 +0200 (CEST)
Received: by mail-pj1-x1032.google.com with SMTP id b11so8723541pjp.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Oct 2022 11:23:18 -0700 (PDT)
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
X-Inumbo-ID: 431a90af-555b-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MJZVoRGtRB/kzdtsP43JIicPpC6feHeGXeOHSjkuE0g=;
        b=Usr5i5Ihw1FWdDZEembcgIFwrUrvnPSsM0dQrmnEeWEH0wyS8m0VIzyQQg4j+0B31N
         rd81VC0bc+JBv/mDtdTeBmvJ1taXO1HWYnw+xpD1mgkDvNRqvKF+RtC15FuOvRX/s1J2
         dvvvlX5vIYHRhW7adIBGNPNkw7Kst6KNms0CDQO/6lnRbvkTK43ewuqQwUEFVwR4RPy+
         Xrq4+Gd5aIiYkXzOB+83HI6eHGKiDGwFgiFSaLv/C/vO8b1rx+H8B01IO+G3brJgUgWJ
         zx4SPRfLktNip1q+87+i/WUaOh5aV198SuQsz6rVM/9/FNq6o4r2fIMiE//jmSugXLBZ
         t7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJZVoRGtRB/kzdtsP43JIicPpC6feHeGXeOHSjkuE0g=;
        b=aRwoijMKl/9L3geGjnrR/pSnUbS67nbIS8sq4W56JhQZNiLAHD/gYR0fsQJzgdYTd7
         CZvQjFa8rpeS9aqpymz8KnilyI2cdDg2qvOjfG/wMi2TOSIrB9QhOsWGex/PserM6Yxw
         +FYJPLiThdUjNIe5h8DBK1rr21BTe1haMLDd6Uek7sCtpwEmODnBmGF+fhc91tFiwdiq
         9rXcAsRc/AVOOu+rI/e7/T46wBDUhpWKGgzq/Bj6ZVgLc2HJ7UPncsiCz0fzx9IIsbkt
         mQwKHeBcmQxv9FF3GMp+7n1LRdke+6s+9bT10VRxH1imbNfq+cduivlZALTIbLWZeo+d
         BHqQ==
X-Gm-Message-State: ACrzQf0OKKLreyar8CPfySJIIEZpqajI3NMIlnvHwGt4qzVh2piKkvGP
	yuwZEXNZgXBvQz5SrBfNgxBOkyl4B/MlKzOfZ/Q=
X-Google-Smtp-Source: AMsMyM73eaFBJ3KzSNvJpvoAB6IwlYBATdr15a0UMtY4p/Yu2VYs/A6yx5WVZmV+SclCgcrI8MYIAxwzMUEVSFtxzik=
X-Received: by 2002:a17:90b:1e43:b0:213:1efe:9815 with SMTP id
 pi3-20020a17090b1e4300b002131efe9815mr5734336pjb.164.1666808596818; Wed, 26
 Oct 2022 11:23:16 -0700 (PDT)
MIME-Version: 1.0
References: <DD70007C-300F-44D3-B314-A5F8C4582CD3@arm.com> <75b7665f-66aa-2e11-35a0-edf20a9c0139@xen.org>
 <99E954B0-50F5-4D7B-A7D2-50D1B7B3657C@arm.com> <95470820-dc9d-dc3b-eb5f-b4db688fa5b1@amd.com>
In-Reply-To: <95470820-dc9d-dc3b-eb5f-b4db688fa5b1@amd.com>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Wed, 26 Oct 2022 21:23:05 +0300
Message-ID: <CAPD2p-=PSahQR0JWe3tLEtp0-iiNH=yE96_GxNyDbhSw-fod0w@mail.gmail.com>
Subject: Re: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough devices
To: Michal Orzel <michal.orzel@amd.com>, Rahul Singh <rahul.singh@arm.com>
Cc: Julien Grall <julien@xen.org>, 
	Xen developer discussion <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	Michal Orzel <Michal.Orzel@arm.com>, Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, 
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Content-Type: multipart/alternative; boundary="000000000000526ed205ebf41ebc"

--000000000000526ed205ebf41ebc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 26, 2022 at 8:18 PM Michal Orzel <michal.orzel@amd.com> wrote:

> Hi Rahul,
>


Hello all

[sorry for the possible format issues]


>
> On 26/10/2022 16:33, Rahul Singh wrote:
> >
> >
> > Hi Julien,
> >
> >> On 26 Oct 2022, at 2:36 pm, Julien Grall <julien@xen.org> wrote:
> >>
> >>
> >>
> >> On 26/10/2022 14:17, Rahul Singh wrote:
> >>> Hi All,
> >>
> >> Hi Rahul,
> >>
> >>> At Arm, we started to implement the POC to support 2 levels of page
> tables/nested translation in SMMUv3.
> >>> To support nested translation for guest OS Xen needs to expose the
> virtual IOMMU. If we passthrough the
> >>> device to the guest that is behind an IOMMU and virtual IOMMU is
> enabled for the guest there is a need to
> >>> add IOMMU binding for the device in the passthrough node as per [1].
> This email is to get an agreement on
> >>> how to add the IOMMU binding for guest OS.
> >>> Before I will explain how to add the IOMMU binding let me give a brie=
f
> overview of how we will add support for virtual
> >>> IOMMU on Arm. In order to implement virtual IOMMU Xen need SMMUv3
> Nested translation support. SMMUv3 hardware
> >>> supports two stages of translation. Each stage of translation can be
> independently enabled. An incoming address is logically
> >>> translated from VA to IPA in stage 1, then the IPA is input to stage =
2
> which translates the IPA to the output PA. Stage 1 is
> >>> intended to be used by a software entity( Guest OS) to provide
> isolation or translation to buffers within the entity, for example,
> >>> DMA isolation within an OS. Stage 2 is intended to be available in
> systems supporting the Virtualization Extensions and is
> >>> intended to virtualize device DMA to guest VM address spaces. When
> both stage 1 and stage 2 are enabled, the translation
> >>> configuration is called nesting.
> >>> Stage 1 translation support is required to provide isolation between
> different devices within the guest OS. XEN already supports
> >>> Stage 2 translation but there is no support for Stage 1 translation
> for guests. We will add support for guests to configure
> >>> the Stage 1 transition via virtual IOMMU. XEN will emulate the SMMU
> hardware and exposes the virtual SMMU to the guest.
> >>> Guest can use the native SMMU driver to configure the stage 1
> translation. When the guest configures the SMMU for Stage 1,
> >>> XEN will trap the access and configure the hardware accordingly.
> >>> Now back to the question of how we can add the IOMMU binding between
> the virtual IOMMU and the master devices so that
> >>> guests can configure the IOMMU correctly. The solution that I am
> suggesting is as below:
> >>> For dom0, while handling the DT node(handle_node()) Xen will replace
> the phandle in the "iommus" property with the virtual
> >>> IOMMU node phandle.
> >> Below, you said that each IOMMUs may have a different ID space. So
> shouldn't we expose one vIOMMU per pIOMMU? If not, how do you expect the
> user to specify the mapping?
> >
> > Yes you are right we need to create one vIOMMU per pIOMMU for dom0. Thi=
s
> also helps in the ACPI case
> > where we don=E2=80=99t need to modify the tables to delete the pIOMMU e=
ntries
> and create one vIOMMU.
> > In this case, no need to replace the phandle as Xen create the vIOMMU
> with the same pIOMMU
> > phandle and same base address.
> >
> > For domU guests one vIOMMU per guest will be created.
> >
> >>
> >>> For domU guests, when passthrough the device to the guest as per [2],
> add the below property in the partial device tree
> >>> node that is required to describe the generic device tree binding for
> IOMMUs and their master(s)
> >>> "iommus =3D < &magic_phandle 0xvMasterID>
> >>>      =E2=80=A2 magic_phandle will be the phandle ( vIOMMU phandle in =
xl)  that
> will be documented so that the user can set that in partial DT node
> (0xfdea).
> >>
> >> Does this mean only one IOMMU will be supported in the guest?
> >
> > Yes.
> >
> >>
> >>>      =E2=80=A2 vMasterID will be the virtual master ID that the user =
will
> provide.
> >>> The partial device tree will look like this:
> >>> /dts-v1/;
> >>>  / {
> >>>     /* #*cells are here to keep DTC happy */
> >>>     #address-cells =3D <2>;
> >>>     #size-cells =3D <2>;
> >>>       aliases {
> >>>         net =3D &mac0;
> >>>     };
> >>>       passthrough {
> >>>         compatible =3D "simple-bus";
> >>>         ranges;
> >>>         #address-cells =3D <2>;
> >>>         #size-cells =3D <2>;
> >>>         mac0: ethernet@10000000 {
> >>>             compatible =3D "calxeda,hb-xgmac";
> >>>             reg =3D <0 0x10000000 0 0x1000>;
> >>>             interrupts =3D <0 80 4  0 81 4  0 82 4>;
> >>>            iommus =3D <0xfdea 0x01>;
> >>>         };
> >>>     };
> >>> };
> >>>  In xl.cfg we need to define a new option to inform Xen about
> vMasterId to pMasterId mapping and to which IOMMU device this
> >>> the master device is connected so that Xen can configure the right
> IOMMU. This is required if the system has devices that have
> >>> the same master ID but behind a different IOMMU.
> >>
> >> In xl.cfg, we already pass the device-tree node path to passthrough. S=
o
> Xen should already have all the information about the IOMMU and Master-ID=
.
> So it doesn't seem necessary for Device-Tree.
> >>
> >> For ACPI, I would have expected the information to be found in the
> IOREQ.
> >>
> >> So can you add more context why this is necessary for everyone?
> >
> > We have information for IOMMU and Master-ID but we don=E2=80=99t have
> information for linking vMaster-ID to pMaster-ID.
> > The device tree node will be used to assign the device to the guest and
> configure the Stage-2 translation. Guest will use the
> > vMaster-ID to configure the vIOMMU during boot. Xen needs information t=
o
> link vMaster-ID to pMaster-ID to configure
> > the corresponding pIOMMU. As I mention we need vMaster-ID in case a
> system could have 2 identical Master-ID but
> > each one connected to a different SMMU and assigned to the guest.
>
> I think the proposed solution would work and I would just like to clear
> some issues.
>
> Please correct me if I'm wrong:
>
> In the xl config file we already need to specify dtdev to point to the
> device path in host dtb.
> In the partial device tree we specify the vMasterId as well as magic
> phandle.
> Isn't it that we already have all the information necessary without the
> need for iommu_devid_map?
> For me it looks like the partial dtb provides vMasterID and dtdev provide=
s
> pMasterID as well as physical phandle to SMMU.
>
> Having said that, I can also understand that specifying everything in one
> place using iommu_devid_map can be easier
> and reduces the need for device tree parsing.
>
> Apart from that, what is the reason of exposing only one vSMMU to guest
> instead of one vSMMU per pSMMU?
> In the latter solution, the whole issue with handling devices with the
> same stream ID but belonging to different SMMUs
> would be gone. It would also result in a more natural way of the device
> tree look. Normally a guest would see
> e.g. both SMMUs and exposing only one can be misleading.
>

I also have the same question. From earlier answers as I understand it is
going to be identity vSMMU <-> pSMMU mappings for Dom0, so why diverge for
DomU?

Also I am thinking how this solution would work for IPMMU-VMSA Gen3(Gen4),
which also supports two stages of translation, so the nested translation
could be possible in general, although there might be some pitfalls
(yes, I understand that code to emulate access to control registers would
be different in comparison with SMMUv3, but some other code could be
common).




>
> >>
> >>>  iommu_devid_map =3D [ =E2=80=9CPMASTER_ID[@VMASTER_ID],IOMMU_BASE_AD=
DRESS=E2=80=9D ,
> =E2=80=9CPMASTER_ID[@VMASTER_ID],IOMMU_BASE_ADDRESS=E2=80=9D]
> >>>      =E2=80=A2 PMASTER_ID is the physical master ID of the device fro=
m the
> physical DT.
> >>>      =E2=80=A2 VMASTER_ID is the virtual master Id that the user will
> configure in the partial device tree.
> >>>      =E2=80=A2 IOMMU_BASE_ADDRESS is the base address of the physical=
 IOMMU
> device to which this device is connected.



If iommu_devid_map is a way to go, I have a question, would this
configuration cover the following cases?
1. Device has several stream IDs
2. Several devices share the stream ID (or several stream IDs)




> >>
> >> Below you give an example for Platform device. How would that fit in
> the context of PCI passthrough?
> >
> > In PCI passthrough case, xl will create the "iommu-map" property in vpc=
i
> host bridge node with phandle to vIOMMU node.
> > vSMMUv3 node will be created in xl.
> >
> >>
> >>>  Example: Let's say the user wants to assign the below physical devic=
e
> in DT to the guest.
> >>>  iommu@4f000000 {
> >>>                 compatible =3D "arm,smmu-v3";
> >>>                      interrupts =3D <0x00 0xe4 0xf04>;
> >>>                 interrupt-parent =3D <0x01>;
> >>>                 #iommu-cells =3D <0x01>;
> >>>                 interrupt-names =3D "combined";
> >>>                 reg =3D <0x00 0x4f000000 0x00 0x40000>;
> >>>                 phandle =3D <0xfdeb>;
> >>>                 name =3D "iommu";
> >>> };
> >>
> >> So I guess this node will be written by Xen. How will you the case
> where there are extra property to added (e.g. dma-coherent)?
> >
> > In this example this is physical IOMMU node. vIOMMU node wil be created
> by xl during guest creation.
> >>
> >>>  test@10000000 {
> >>>      compatible =3D "viommu-test=E2=80=9D;
> >>>      iommus =3D <0xfdeb 0x10>;
> >>
> >> I am a bit confused. Here you use 0xfdeb for the phandle but below...
> >
> > Here 0xfdeb is the physical IOMMU node phandle...
> >>
> >>>      interrupts =3D <0x00 0xff 0x04>;
> >>>      reg =3D <0x00 0x10000000 0x00 0x1000>;
> >>>      name =3D "viommu-test";
> >>> };
> >>>  The partial Device tree node will be like this:
> >>>  / {
> >>>     /* #*cells are here to keep DTC happy */
> >>>     #address-cells =3D <2>;
> >>>     #size-cells =3D <2>;
> >>>       passthrough {
> >>>         compatible =3D "simple-bus";
> >>>         ranges;
> >>>         #address-cells =3D <2>;
> >>>         #size-cells =3D <2>;
> >>>      test@10000000 {
> >>>              compatible =3D "viommu-test";
> >>>              reg =3D <0 0x10000000 0 0x1000>;
> >>>              interrupts =3D <0 80 4  0 81 4  0 82 4>;
> >>>              iommus =3D <0xfdea 0x01>;
> >>
> >> ... you use 0xfdea. Does this mean 'xl' will rewrite the phandle?
> >
> > but here user has to set the =E2=80=9Ciommus=E2=80=9D property with mag=
ic phanle as
> explained earlier. 0xfdea is magic phandle.
> >
> > Regards,
> > Rahul
>
> ~Michal
>
>
>

--=20
Regards,

Oleksandr Tyshchenko

--000000000000526ed205ebf41ebc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 26, 2022 at 8:18 PM Micha=
l Orzel &lt;<a href=3D"mailto:michal.orzel@amd.com">michal.orzel@amd.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi =
Rahul,<br></blockquote><div>=C2=A0</div><div><br></div><div>Hello all</div>=
<div><br></div><div>[sorry for the possible format issues]</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
On 26/10/2022 16:33, Rahul Singh wrote:<br>
&gt; <br>
&gt; <br>
&gt; Hi Julien,<br>
&gt; <br>
&gt;&gt; On 26 Oct 2022, at 2:36 pm, Julien Grall &lt;<a href=3D"mailto:jul=
ien@xen.org" target=3D"_blank">julien@xen.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On 26/10/2022 14:17, Rahul Singh wrote:<br>
&gt;&gt;&gt; Hi All,<br>
&gt;&gt;<br>
&gt;&gt; Hi Rahul,<br>
&gt;&gt;<br>
&gt;&gt;&gt; At Arm, we started to implement the POC to support 2 levels of=
 page tables/nested translation in SMMUv3.<br>
&gt;&gt;&gt; To support nested translation for guest OS Xen needs to expose=
 the virtual IOMMU. If we passthrough the<br>
&gt;&gt;&gt; device to the guest that is behind an IOMMU and virtual IOMMU =
is enabled for the guest there is a need to<br>
&gt;&gt;&gt; add IOMMU binding for the device in the passthrough node as pe=
r [1]. This email is to get an agreement on<br>
&gt;&gt;&gt; how to add the IOMMU binding for guest OS.<br>
&gt;&gt;&gt; Before I will explain how to add the IOMMU binding let me give=
 a brief overview of how we will add support for virtual<br>
&gt;&gt;&gt; IOMMU on Arm. In order to implement virtual IOMMU Xen need SMM=
Uv3 Nested translation support. SMMUv3 hardware<br>
&gt;&gt;&gt; supports two stages of translation. Each stage of translation =
can be independently enabled. An incoming address is logically<br>
&gt;&gt;&gt; translated from VA to IPA in stage 1, then the IPA is input to=
 stage 2 which translates the IPA to the output PA. Stage 1 is<br>
&gt;&gt;&gt; intended to be used by a software entity( Guest OS) to provide=
 isolation or translation to buffers within the entity, for example,<br>
&gt;&gt;&gt; DMA isolation within an OS. Stage 2 is intended to be availabl=
e in systems supporting the Virtualization Extensions and is<br>
&gt;&gt;&gt; intended to virtualize device DMA to guest VM address spaces. =
When both stage 1 and stage 2 are enabled, the translation<br>
&gt;&gt;&gt; configuration is called nesting.<br>
&gt;&gt;&gt; Stage 1 translation support is required to provide isolation b=
etween different devices within the guest OS. XEN already supports<br>
&gt;&gt;&gt; Stage 2 translation but there is no support for Stage 1 transl=
ation for guests. We will add support for guests to configure<br>
&gt;&gt;&gt; the Stage 1 transition via virtual IOMMU. XEN will emulate the=
 SMMU hardware and exposes the virtual SMMU to the guest.<br>
&gt;&gt;&gt; Guest can use the native SMMU driver to configure the stage 1 =
translation. When the guest configures the SMMU for Stage 1,<br>
&gt;&gt;&gt; XEN will trap the access and configure the hardware accordingl=
y.<br>
&gt;&gt;&gt; Now back to the question of how we can add the IOMMU binding b=
etween the virtual IOMMU and the master devices so that<br>
&gt;&gt;&gt; guests can configure the IOMMU correctly. The solution that I =
am suggesting is as below:<br>
&gt;&gt;&gt; For dom0, while handling the DT node(handle_node()) Xen will r=
eplace the phandle in the &quot;iommus&quot; property with the virtual<br>
&gt;&gt;&gt; IOMMU node phandle.<br>
&gt;&gt; Below, you said that each IOMMUs may have a different ID space. So=
 shouldn&#39;t we expose one vIOMMU per pIOMMU? If not, how do you expect t=
he user to specify the mapping?<br>
&gt; <br>
&gt; Yes you are right we need to create one vIOMMU per pIOMMU for dom0. Th=
is also helps in the ACPI case<br>
&gt; where we don=E2=80=99t need to modify the tables to delete the pIOMMU =
entries and create one vIOMMU.<br>
&gt; In this case, no need to replace the phandle as Xen create the vIOMMU =
with the same pIOMMU<br>
&gt; phandle and same base address.<br>
&gt; <br>
&gt; For domU guests one vIOMMU per guest will be created.<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt;&gt; For domU guests, when passthrough the device to the guest as p=
er [2],=C2=A0 add the below property in the partial device tree<br>
&gt;&gt;&gt; node that is required to describe the generic device tree bind=
ing for IOMMUs and their master(s)<br>
&gt;&gt;&gt; &quot;iommus =3D &lt; &amp;magic_phandle 0xvMasterID&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =E2=80=A2 magic_phandle will be the phandl=
e ( vIOMMU phandle in xl)=C2=A0 that will be documented so that the user ca=
n set that in partial DT node (0xfdea).<br>
&gt;&gt;<br>
&gt;&gt; Does this mean only one IOMMU will be supported in the guest?<br>
&gt; <br>
&gt; Yes.<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =E2=80=A2 vMasterID will be the virtual ma=
ster ID that the user will provide.<br>
&gt;&gt;&gt; The partial device tree will look like this:<br>
&gt;&gt;&gt; /dts-v1/;<br>
&gt;&gt;&gt;=C2=A0 / {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0/* #*cells are here to keep DTC happy */<br=
>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0#address-cells =3D &lt;2&gt;;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0#size-cells =3D &lt;2&gt;;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0aliases {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0net =3D &amp;mac0;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0passthrough {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;simple-b=
us&quot;;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ranges;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#address-cells =3D &lt;2&gt;;=
<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#size-cells =3D &lt;2&gt;;<br=
>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mac0: ethernet@10000000 {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D =
&quot;calxeda,hb-xgmac&quot;;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0 0=
x10000000 0 0x1000&gt;;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupts =3D =
&lt;0 80 4=C2=A0 0 81 4=C2=A0 0 82 4&gt;;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iommus =3D &lt;0xfdea=
 0x01&gt;;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt;&gt; };<br>
&gt;&gt;&gt;=C2=A0 In xl.cfg we need to define a new option to inform Xen a=
bout vMasterId to pMasterId mapping and to which IOMMU device this<br>
&gt;&gt;&gt; the master device is connected so that Xen can configure the r=
ight IOMMU. This is required if the system has devices that have<br>
&gt;&gt;&gt; the same master ID but behind a different IOMMU.<br>
&gt;&gt;<br>
&gt;&gt; In xl.cfg, we already pass the device-tree node path to passthroug=
h. So Xen should already have all the information about the IOMMU and Maste=
r-ID. So it doesn&#39;t seem necessary for Device-Tree.<br>
&gt;&gt;<br>
&gt;&gt; For ACPI, I would have expected the information to be found in the=
 IOREQ.<br>
&gt;&gt;<br>
&gt;&gt; So can you add more context why this is necessary for everyone?<br=
>
&gt; <br>
&gt; We have information for IOMMU and Master-ID but we don=E2=80=99t have =
information for linking vMaster-ID to pMaster-ID.<br>
&gt; The device tree node will be used to assign the device to the guest an=
d configure the Stage-2 translation. Guest will use the<br>
&gt; vMaster-ID to configure the vIOMMU during boot. Xen needs information =
to link vMaster-ID to pMaster-ID to configure<br>
&gt; the corresponding pIOMMU. As I mention we need vMaster-ID in case a sy=
stem could have 2 identical Master-ID but<br>
&gt; each one connected to a different SMMU and assigned to the guest.<br>
<br>
I think the proposed solution would work and I would just like to clear som=
e issues.<br>
<br>
Please correct me if I&#39;m wrong:<br>
<br>
In the xl config file we already need to specify dtdev to point to the devi=
ce path in host dtb.<br>
In the partial device tree we specify the vMasterId as well as magic phandl=
e.<br>
Isn&#39;t it that we already have all the information necessary without the=
 need for iommu_devid_map?<br>
For me it looks like the partial dtb provides vMasterID and dtdev provides =
pMasterID as well as physical phandle to SMMU.<br>
<br>
Having said that, I can also understand that specifying everything in one p=
lace using iommu_devid_map can be easier<br>
and reduces the need for device tree parsing.<br>
<br>
Apart from that, what is the reason of exposing only one vSMMU to guest ins=
tead of one vSMMU per pSMMU?<br>
In the latter solution, the whole issue with handling devices with the same=
 stream ID but belonging to different SMMUs<br>
would be gone. It would also result in a more natural way of the device tre=
e look. Normally a guest would see<br>
e.g. both SMMUs and exposing only one can be misleading.<br></blockquote><d=
iv><br></div>I also have the same question. From earlier answers as I under=
stand it is going to be identity vSMMU &lt;-&gt; pSMMU mappings for Dom0, s=
o why diverge for DomU?<br><br>Also I am thinking how this solution would w=
ork for IPMMU-VMSA Gen3(Gen4), which also supports two stages of translatio=
n, so the nested translation could be possible in general, although there m=
ight be some pitfalls<br><div>(yes, I understand that code to emulate acces=
s to control registers would be different in comparison with SMMUv3, but so=
me other code could be common).=C2=A0 =C2=A0 =C2=A0=C2=A0<br></div><div><br=
></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><br>
&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 iommu_devid_map =3D [ =E2=80=9CPMASTER_ID[@VMASTER_ID],I=
OMMU_BASE_ADDRESS=E2=80=9D , =E2=80=9CPMASTER_ID[@VMASTER_ID],IOMMU_BASE_AD=
DRESS=E2=80=9D]<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =E2=80=A2 PMASTER_ID is the physical maste=
r ID of the device from the physical DT.<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =E2=80=A2 VMASTER_ID is the virtual master=
 Id that the user will configure in the partial device tree.<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =E2=80=A2 IOMMU_BASE_ADDRESS is the base a=
ddress of the physical IOMMU device to which this device is connected.</blo=
ckquote><div>=C2=A0</div><div><br></div><div>If iommu_devid_map is a way to=
 go, I have a question, would this configuration cover the following cases?=
</div><div>1. Device has several stream IDs</div><div>2. Several devices sh=
are the stream ID (or several stream IDs)<br></div><div><br></div><div><br>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;&gt;<br>
&gt;&gt; Below you give an example for Platform device. How would that fit =
in the context of PCI passthrough?<br>
&gt; <br>
&gt; In PCI passthrough case, xl will create the &quot;iommu-map&quot; prop=
erty in vpci host bridge node with phandle to vIOMMU node.<br>
&gt; vSMMUv3 node will be created in xl.<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 Example: Let&#39;s say the user wants to assign the belo=
w physical device in DT to the guest.<br>
&gt;&gt;&gt;=C2=A0 iommu@4f000000 {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c=
ompatible =3D &quot;arm,smmu-v3&quot;;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 interrupts =3D &lt;0x00 0xe4 0xf04&gt;;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
nterrupt-parent =3D &lt;0x01&gt;;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#=
iommu-cells =3D &lt;0x01&gt;;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
nterrupt-names =3D &quot;combined&quot;;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r=
eg =3D &lt;0x00 0x4f000000 0x00 0x40000&gt;;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p=
handle =3D &lt;0xfdeb&gt;;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n=
ame =3D &quot;iommu&quot;;<br>
&gt;&gt;&gt; };<br>
&gt;&gt;<br>
&gt;&gt; So I guess this node will be written by Xen. How will you the case=
 where there are extra property to added (e.g. dma-coherent)?<br>
&gt; <br>
&gt; In this example this is physical IOMMU node. vIOMMU node wil be create=
d by xl during guest creation.<br>
&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 test@10000000 {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;viommu-test=E2=80=9D;=
<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 iommus =3D &lt;0xfdeb 0x10&gt;;<br>
&gt;&gt;<br>
&gt;&gt; I am a bit confused. Here you use 0xfdeb for the phandle but below=
...<br>
&gt; <br>
&gt; Here 0xfdeb is the physical IOMMU node phandle...<br>
&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 interrupts =3D &lt;0x00 0xff 0x04&gt;;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x00 0x10000000 0x00 0x1000&gt=
;;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 name =3D &quot;viommu-test&quot;;<br>
&gt;&gt;&gt; };<br>
&gt;&gt;&gt;=C2=A0 The partial Device tree node will be like this:<br>
&gt;&gt;&gt;=C2=A0 / {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0/* #*cells are here to keep DTC happy */<br=
>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0#address-cells =3D &lt;2&gt;;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0#size-cells =3D &lt;2&gt;;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0passthrough {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;simple-b=
us&quot;;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ranges;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#address-cells =3D &lt;2&gt;;=
<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#size-cells =3D &lt;2&gt;;<br=
>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 test@10000000 {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D=
 &quot;viommu-test&quot;;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0 =
0x10000000 0 0x1000&gt;;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupts =3D=
 &lt;0 80 4=C2=A0 0 81 4=C2=A0 0 82 4&gt;;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iommus =3D &lt=
;0xfdea 0x01&gt;;<br>
&gt;&gt;<br>
&gt;&gt; ... you use 0xfdea. Does this mean &#39;xl&#39; will rewrite the p=
handle?<br>
&gt; <br>
&gt; but here user has to set the =E2=80=9Ciommus=E2=80=9D property with ma=
gic phanle as explained earlier. 0xfdea is magic phandle.<br>
&gt; <br>
&gt; Regards,<br>
&gt; Rahul<br>
<br>
~Michal<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><span style=3D"background-color:rgb(255,255,255)"><font size=
=3D"2"><span style=3D"color:rgb(51,51,51);font-family:Arial,sans-serif">Reg=
ards,</span></font></span></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"=
><div><span style=3D"background-color:rgb(255,255,255)"><font size=3D"2">Ol=
eksandr Tyshchenko</font></span></div></div></div></div></div></div></div><=
/div>

--000000000000526ed205ebf41ebc--

