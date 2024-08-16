Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D1C9546D3
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 12:40:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778465.1188495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seuMy-00047s-R2; Fri, 16 Aug 2024 10:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778465.1188495; Fri, 16 Aug 2024 10:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seuMy-000461-Nl; Fri, 16 Aug 2024 10:39:44 +0000
Received: by outflank-mailman (input) for mailman id 778465;
 Fri, 16 Aug 2024 10:39:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LMSQ=PP=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1seuMx-00045v-8E
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 10:39:43 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d84f040c-5bbb-11ef-a505-bb4a2ccca743;
 Fri, 16 Aug 2024 12:39:42 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5ba482282d3so2322136a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 Aug 2024 03:39:41 -0700 (PDT)
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
X-Inumbo-ID: d84f040c-5bbb-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723804781; x=1724409581; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HxaT/G/a9C9d36zMJfUOotU5H2JIbQHX2nL8czHz2/8=;
        b=PdO5TW80ey40kZBG8zh5YYPdAFJ6CCDe+Jg04fx5dNc7/MZivEHxyhxj1lxjL66Gjv
         FJx1YJzl+9JM9+yBYEIjDgO58Saqy9iirrzkUuQ7TH9ooYvh8i6Pj+TRqG32W5+/inu+
         tkBUhp4QwexuQe9yC1ngR08Rg7hbu5NdhHFyTXsxIbT23lrhSt6q98seUdM8MaBg/pju
         +kneD6jnOBV5LEWfadSb3vB1isnamIXvH11T5atE/8XdxOzyy0ogZw9PFvLQWGouWKJl
         typCo8neU7k9UtRASRdmuCZKPffg0IYZSqTO7mG2DnYQl86Q3OuHpSpz2/PespavCL7g
         1j0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723804781; x=1724409581;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HxaT/G/a9C9d36zMJfUOotU5H2JIbQHX2nL8czHz2/8=;
        b=tAQW/KQT0l0tfCxv0Cm0vQIFMr0NBeNztczfRktR42UN1wxfhTrtWnp8dRySvba9Bg
         rSSpYhfu55OaE0vdRZOYxt+E5ZDtxxuJuXZLk0x7hRzrNT1zJU+/81xn76IN9tBDwoC+
         FtBLQ1wu0b4ZVdYYnmpe8PVE0sOQTAvFrugNMjBSEII6qmpjpBluuS6rPJwp7WZsWiA3
         OWkJ9LURckl/LYgRuKS8rnCskE/MMuxqrsELX3uFwMrtU8Jk9zpqlm1ejxVtFHPf1Abu
         qOTom878yd0Smgb8djKt1w/WhoMNLp+ASYGv17+uo1dF9Bh/7FQXw/NXXFqsUPXubQwY
         nw/g==
X-Forwarded-Encrypted: i=1; AJvYcCVqJnQXJHcKX3xEqYHJljQwDWMwQYAPHpXaqMwx3bEnLjbJVmurllx/p929cTZsItMzGDgoF7TKb1k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyo4bdyT39oAnrV0Z0jG/oP1IOg280qhkPhejR+PBMT9rhb5ikg
	q4hRIZM5TPluulIJGvfJi5WURtWtBmgAKE9wj757VuKBSN9fAk8w/CB9tLpnOpNLq6zk/G8I8FD
	KOSZKQ8zgWs7YJs7/ToLoOwAZBb0=
X-Google-Smtp-Source: AGHT+IFe/aw2okEbnHGGh2K6rt+9/+4BQBHsFxWSaNJv2/16ZXE9cadhwAxXurr0h1HWpgjn9PaKtCpCdDlbRj0J9JQ=
X-Received: by 2002:a05:6402:5206:b0:5a2:1f7b:e017 with SMTP id
 4fb4d7f45d1cf-5beca4da60dmr1723171a12.4.1723804780681; Fri, 16 Aug 2024
 03:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240812130606.90410-1-edgar.iglesias@gmail.com>
 <20240812130606.90410-5-edgar.iglesias@gmail.com> <alpine.DEB.2.22.394.2408121650590.298534@ubuntu-linux-20-04-desktop>
 <ZruRm34zIMtUm7oH@zapote> <alpine.DEB.2.22.394.2408131550080.298534@ubuntu-linux-20-04-desktop>
 <ZryZwOoadeb1UWK8@zapote> <alpine.DEB.2.22.394.2408141719400.298534@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2408141719400.298534@ubuntu-linux-20-04-desktop>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Fri, 16 Aug 2024 12:39:28 +0200
Message-ID: <CAJy5ezrUbGZCaF=HiYhyLCoXRL3d=t-QbmLeKvu7ByWksV888g@mail.gmail.com>
Subject: Re: [PATCH v1 04/10] hw/arm: xenpvh: Add support for SMP guests
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: qemu-devel@nongnu.org, anthony@xenproject.org, paul@xen.org, 
	peter.maydell@linaro.org, alex.bennee@linaro.org, xenia.ragiadakou@amd.com, 
	jason.andryuk@amd.com, edgar.iglesias@amd.com, xen-devel@lists.xenproject.org, 
	qemu-arm@nongnu.org, andrew.cooper3@citrix.com
Content-Type: multipart/alternative; boundary="0000000000009d62ae061fca9383"

--0000000000009d62ae061fca9383
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 2:30=E2=80=AFAM Stefano Stabellini <sstabellini@ker=
nel.org>
wrote:

> On Wed, 14 Aug 2024, Edgar E. Iglesias wrote:
> > On Tue, Aug 13, 2024 at 03:52:32PM -0700, Stefano Stabellini wrote:
> > > On Tue, 13 Aug 2024, Edgar E. Iglesias wrote:
> > > > On Mon, Aug 12, 2024 at 06:47:17PM -0700, Stefano Stabellini wrote:
> > > > > On Mon, 12 Aug 2024, Edgar E. Iglesias wrote:
> > > > > > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> > > > > >
> > > > > > Add SMP support for Xen PVH ARM guests. Create max_cpus ioreq
> > > > > > servers to handle hotplug.
> > > > > >
> > > > > > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > > > > > ---
> > > > > >  hw/arm/xen_arm.c | 5 +++--
> > > > > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> > > > > > index 5f75cc3779..ef8315969c 100644
> > > > > > --- a/hw/arm/xen_arm.c
> > > > > > +++ b/hw/arm/xen_arm.c
> > > > > > @@ -173,7 +173,7 @@ static void xen_arm_init(MachineState
> *machine)
> > > > > >
> > > > > >      xen_init_ram(machine);
> > > > > >
> > > > > > -    xen_register_ioreq(xam->state, machine->smp.cpus,
> &xen_memory_listener);
> > > > > > +    xen_register_ioreq(xam->state, machine->smp.max_cpus,
> &xen_memory_listener);
> > > > > >
> > > > > >      xen_create_virtio_mmio_devices(xam);
> > > > > >
> > > > > > @@ -218,7 +218,8 @@ static void
> xen_arm_machine_class_init(ObjectClass *oc, void *data)
> > > > > >      MachineClass *mc =3D MACHINE_CLASS(oc);
> > > > > >      mc->desc =3D "Xen PVH ARM machine";
> > > > > >      mc->init =3D xen_arm_init;
> > > > > > -    mc->max_cpus =3D 1;
> > > > > > +    /* MAX number of vcpus supported by Xen.  */
> > > > > > +    mc->max_cpus =3D GUEST_MAX_VCPUS;
> > > > >
> > > > > Will this cause allocations of data structures with 128 elements?
> > > > > Looking at hw/xen/xen-hvm-common.c:xen_do_ioreq_register it seems
> > > > > possible? Or hw/xen/xen-hvm-common.c:xen_do_ioreq_register is
> called
> > > >
> > > > Yes, in theory there's probably overhead with this but as you
> correctly
> > > > noted below, a PVH aware xl will set the max_cpus option to a lower
> value.
> > > >
> > > > With a non-pvh aware xl, I was a little worried about the overhead
> > > > but I couldn't see any visible slow-down on ARM neither in boot or
> in network
> > > > performance (I didn't run very sophisticated benchmarks).
> > >
> > > What do you mean by "non-pvh aware xl"? All useful versions of xl
> > > support pvh?
> >
> >
> > I mean an xl without our PVH patches merged.
> > xl in upstream doesn't know much about PVH yet.
> > Even for ARM, we're still carrying significant patches in our tree.
>
> Oh I see. In that case, I don't think we need to support "non-pvh aware
> xl".
>
>
> > > > > later on with the precise vCPU value which should be provided to
> QEMU
> > > > > via the -smp command line option
> > > > > (tools/libs/light/libxl_dm.c:libxl__build_device_model_args_new)?
> > > >
> > > > Yes, a pvh aware xl will for example pass -smp 2,maxcpus=3D4 based =
on
> > > > values from the xl.cfg. If the user doesn't set maxvcpus in xl.cfg,
> xl
> > > > will set maxvcpus to the same value as vcpus.
> > >
> > > OK good. In that case if this is just an initial value meant to be
> > > overwritten, I think it is best to keep it as 1.
> >
> > Sorry but that won't work. I think the confusion here may be that
> > it's easy to mix up mc->max_cpus and machine->smp.max_cpus, these are
> > not the same. They have different purposes.
> >
> > I'll try to clarify the 3 values in play.
> >
> > machine-smp.cpus:
> > Number of guest vcpus active at boot.
> > Passed to QEMU via the -smp command-line option.
> > We don't use this value in QEMU's ARM PVH machines.
> >
> > machine->smp.max_cpus:
> > Max number of vcpus that the guest can use (equal or larger than
> machine-smp.cpus).
> > Will be set by xl via the "-smp X,maxcpus=3DY" command-line option to Q=
EMU.
> > Taken from maxvcpus from xl.cfg, same as XEN_DMOP_nr_vcpus.
> > This is what we use for xen_register_ioreq().
> >
> > mc->max_cpus:
> > Absolute MAX in QEMU used to cap the -smp command-line options.
> > If xl tries to set -smp (machine->smp.max_cpus) larger than this, QEMU
> will bail out.
> > Used to setup xen_register_ioreq() ONLY if -smp maxcpus was NOT set (i.=
e
> by a non PVH aware xl).
> > Cannot be 1 because that would limit QEMU to MAX 1 vcpu.
> >
> > I guess we could set mc->max_cpus to what XEN_DMOP_nr_vcpus returns but
> I'll
> > have to check if we can even issue that hypercall this early in QEMU
> since
> > mc->max_cpus is setup before we even parse the machine options. We may
> > not yet know what domid we're attaching to yet.
>
> If mc->max_cpus is the absolute max and it will not be used if -smp is
> passed to QEMU, then I think it is OK to use GUEST_MAX_VCPUS
>


Looking at this a little more. If users (xl) don't pass an -smp option we
actually default to smp.max_cpus=3D1.
So, another option is to simply remove the upper limit in QEMU (e.g we can
set mc->max_cpus to something very large like UINT32_MAX).
That would avoid early hypercalls, avoid using GUEST_MAX_VCPUS and always
let xl dictate the max_cpus value using the -smp cmdline option.

--0000000000009d62ae061fca9383
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Aug 15, 2024 at 2:30=E2=80=AFAM S=
tefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabellini=
@kernel.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Wed, 14 Aug 2024, Edgar E. Iglesia=
s wrote:<br>
&gt; On Tue, Aug 13, 2024 at 03:52:32PM -0700, Stefano Stabellini wrote:<br=
>
&gt; &gt; On Tue, 13 Aug 2024, Edgar E. Iglesias wrote:<br>
&gt; &gt; &gt; On Mon, Aug 12, 2024 at 06:47:17PM -0700, Stefano Stabellini=
 wrote:<br>
&gt; &gt; &gt; &gt; On Mon, 12 Aug 2024, Edgar E. Iglesias wrote:<br>
&gt; &gt; &gt; &gt; &gt; From: &quot;Edgar E. Iglesias&quot; &lt;<a href=3D=
"mailto:edgar.iglesias@amd.com" target=3D"_blank">edgar.iglesias@amd.com</a=
>&gt;<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; Add SMP support for Xen PVH ARM guests. Create max=
_cpus ioreq<br>
&gt; &gt; &gt; &gt; &gt; servers to handle hotplug.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; Signed-off-by: Edgar E. Iglesias &lt;<a href=3D"ma=
ilto:edgar.iglesias@amd.com" target=3D"_blank">edgar.iglesias@amd.com</a>&g=
t;<br>
&gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 hw/arm/xen_arm.c | 5 +++--<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 1 file changed, 3 insertions(+), 2 deletions=
(-)<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c<b=
r>
&gt; &gt; &gt; &gt; &gt; index 5f75cc3779..ef8315969c 100644<br>
&gt; &gt; &gt; &gt; &gt; --- a/hw/arm/xen_arm.c<br>
&gt; &gt; &gt; &gt; &gt; +++ b/hw/arm/xen_arm.c<br>
&gt; &gt; &gt; &gt; &gt; @@ -173,7 +173,7 @@ static void xen_arm_init(Machi=
neState *machine)<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 xen_init_ram(machine);<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 xen_register_ioreq(xam-&gt;state, m=
achine-&gt;smp.cpus, &amp;xen_memory_listener);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 xen_register_ioreq(xam-&gt;state, m=
achine-&gt;smp.max_cpus, &amp;xen_memory_listener);<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 xen_create_virtio_mmio_devices=
(xam);<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; &gt; @@ -218,7 +218,8 @@ static void xen_arm_machine_cl=
ass_init(ObjectClass *oc, void *data)<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 MachineClass *mc =3D MACHINE_C=
LASS(oc);<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 mc-&gt;desc =3D &quot;Xen PVH =
ARM machine&quot;;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 mc-&gt;init =3D xen_arm_init;<=
br>
&gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 mc-&gt;max_cpus =3D 1;<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* MAX number of vcpus supported by=
 Xen.=C2=A0 */<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 mc-&gt;max_cpus =3D GUEST_MAX_VCPUS=
;<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Will this cause allocations of data structures with 128=
 elements?<br>
&gt; &gt; &gt; &gt; Looking at hw/xen/xen-hvm-common.c:xen_do_ioreq_registe=
r it seems<br>
&gt; &gt; &gt; &gt; possible? Or hw/xen/xen-hvm-common.c:xen_do_ioreq_regis=
ter is called<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Yes, in theory there&#39;s probably overhead with this but a=
s you correctly<br>
&gt; &gt; &gt; noted below, a PVH aware xl will set the max_cpus option to =
a lower value.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; With a non-pvh aware xl, I was a little worried about the ov=
erhead<br>
&gt; &gt; &gt; but I couldn&#39;t see any visible slow-down on ARM neither =
in boot or in network<br>
&gt; &gt; &gt; performance (I didn&#39;t run very sophisticated benchmarks)=
.<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; What do you mean by &quot;non-pvh aware xl&quot;? All useful vers=
ions of xl<br>
&gt; &gt; support pvh?<br>
&gt; <br>
&gt; <br>
&gt; I mean an xl without our PVH patches merged.<br>
&gt; xl in upstream doesn&#39;t know much about PVH yet.<br>
&gt; Even for ARM, we&#39;re still carrying significant patches in our tree=
.<br>
<br>
Oh I see. In that case, I don&#39;t think we need to support &quot;non-pvh =
aware xl&quot;.<br>
<br>
<br>
&gt; &gt; &gt; &gt; later on with the precise vCPU value which should be pr=
ovided to QEMU<br>
&gt; &gt; &gt; &gt; via the -smp command line option<br>
&gt; &gt; &gt; &gt; (tools/libs/light/libxl_dm.c:libxl__build_device_model_=
args_new)?<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Yes, a pvh aware xl will for example pass -smp 2,maxcpus=3D4=
 based on<br>
&gt; &gt; &gt; values from the xl.cfg. If the user doesn&#39;t set maxvcpus=
 in xl.cfg, xl<br>
&gt; &gt; &gt; will set maxvcpus to the same value as vcpus.<br>
&gt; &gt; <br>
&gt; &gt; OK good. In that case if this is just an initial value meant to b=
e<br>
&gt; &gt; overwritten, I think it is best to keep it as 1.<br>
&gt; <br>
&gt; Sorry but that won&#39;t work. I think the confusion here may be that<=
br>
&gt; it&#39;s easy to mix up mc-&gt;max_cpus and machine-&gt;smp.max_cpus, =
these are<br>
&gt; not the same. They have different purposes.<br>
&gt; <br>
&gt; I&#39;ll try to clarify the 3 values in play.<br>
&gt; <br>
&gt; machine-smp.cpus:<br>
&gt; Number of guest vcpus active at boot.<br>
&gt; Passed to QEMU via the -smp command-line option.<br>
&gt; We don&#39;t use this value in QEMU&#39;s ARM PVH machines.<br>
&gt; <br>
&gt; machine-&gt;smp.max_cpus:<br>
&gt; Max number of vcpus that the guest can use (equal or larger than machi=
ne-smp.cpus).<br>
&gt; Will be set by xl via the &quot;-smp X,maxcpus=3DY&quot; command-line =
option to QEMU.<br>
&gt; Taken from maxvcpus from xl.cfg, same as XEN_DMOP_nr_vcpus.<br>
&gt; This is what we use for xen_register_ioreq().<br>
&gt; <br>
&gt; mc-&gt;max_cpus:<br>
&gt; Absolute MAX in QEMU used to cap the -smp command-line options.<br>
&gt; If xl tries to set -smp (machine-&gt;smp.max_cpus) larger than this, Q=
EMU will bail out.<br>
&gt; Used to setup xen_register_ioreq() ONLY if -smp maxcpus was NOT set (i=
.e by a non PVH aware xl).<br>
&gt; Cannot be 1 because that would limit QEMU to MAX 1 vcpu.<br>
&gt; <br>
&gt; I guess we could set mc-&gt;max_cpus to what XEN_DMOP_nr_vcpus returns=
 but I&#39;ll<br>
&gt; have to check if we can even issue that hypercall this early in QEMU s=
ince<br>
&gt; mc-&gt;max_cpus is setup before we even parse the machine options. We =
may<br>
&gt; not yet know what domid we&#39;re attaching to yet.<br>
<br>
If mc-&gt;max_cpus is the absolute max and it will not be used if -smp is<b=
r>
passed to QEMU, then I think it is OK to use GUEST_MAX_VCPUS<br></blockquot=
e><div><br></div><div><br></div><div>Looking at this a little more. If user=
s (xl) don&#39;t pass an -smp option we actually default to smp.max_cpus=3D=
1.</div><div>So, another option is to simply remove the upper limit in QEMU=
 (e.g we can set mc-&gt;max_cpus to something very large like UINT32_MAX).<=
/div><div>That would avoid early hypercalls, avoid using GUEST_MAX_VCPUS an=
d always let xl dictate the max_cpus value using the -smp cmdline option.=
=C2=A0</div></div></div>

--0000000000009d62ae061fca9383--

