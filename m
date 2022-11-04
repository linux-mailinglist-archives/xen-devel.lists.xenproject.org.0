Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E537619562
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 12:32:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437535.691987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oquul-0000fs-AB; Fri, 04 Nov 2022 11:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437535.691987; Fri, 04 Nov 2022 11:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oquul-0000cl-77; Fri, 04 Nov 2022 11:31:11 +0000
Received: by outflank-mailman (input) for mailman id 437535;
 Fri, 04 Nov 2022 11:31:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9sUE=3E=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1oquuk-0000cf-5u
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 11:31:10 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c54eb23-5c34-11ed-8fd1-01056ac49cbb;
 Fri, 04 Nov 2022 12:31:07 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id z24so5932001ljn.4
 for <xen-devel@lists.xenproject.org>; Fri, 04 Nov 2022 04:31:07 -0700 (PDT)
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
X-Inumbo-ID: 2c54eb23-5c34-11ed-8fd1-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TPf0Soipi+B+XneUdLGpWDaxYvecmd98mchm9m+5YaM=;
        b=IowpJ9ZOqVUH/Bsh2ItImHNPyrUnAi5GCovN0rcG7OImthLIuI+d7fhVZgqcBF3fXL
         6aCC4eGkCmyClBFhCK8KL1E0RcFseD0gJEWqa/z70HpTU3RbyqSTxeNtOnaOja0KDuzZ
         W1mlddyeHaG8HXO5o2zFybjqrQbHGSiTgtsCFk/adg0W/G9qMyTyK5coZw/L4b/VPJZd
         FLQUXUOvfx6gTaUT0cTItb0SpRfEw18RGXRKrgqPlY2vKAHc2Aqp6iJneNqR7f4vJaIp
         QjeElVDe8QgwvAxBJsKKgP5PifQza35ietDO9nIsA6Ren4GaajwLkbPBholEvx7/kmVT
         ZmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TPf0Soipi+B+XneUdLGpWDaxYvecmd98mchm9m+5YaM=;
        b=h9HK6BcPbKmF+x8DJVsuecSXR8UCqX2qhwjbOggX58+2CEOdYjsK5pE/grEptmy8GY
         z6gTp4HoG9Xr07RZ9CS8yK2Me1FVRDsKl/R+aPeXqf2A2o98OYlyByQE1oGq5//lVU1I
         vgk9bV8HhhUjjLj/JzzO63hlhDlCoJkgryuAPutx+NsyLA3hGWJdeLLI5b7YmepLp6t2
         0wSK7/A0H7GnBAZi3Cv1fwvMrpqGlfPXrVnXVD5psdHdVCgnmZhiJvmNq5R4xENC6Wbo
         gBxt95zkCcN6yEjuXc3KcfZRBS8FZobP+0P34/Ah0j6fT8xcloNHeb9KlO/et4Mf6K5b
         d8FA==
X-Gm-Message-State: ACrzQf3dXyYVgGlYvY6tiNsaXg5UHPslRhCkvZxor1THvMt/LLSMrFyF
	nzwa5G3Q//nShM812BBThhTP8TsqQB6z+vaxadw=
X-Google-Smtp-Source: AMsMyM6RqE+iQ+XZpO2aK1M09aSbM8pZAzdVOVc+Stz4k1eerMNIz7fevp2zTUA8Ns7rOYGpf5Oi5YZm7xQnF8JQVIU=
X-Received: by 2002:a2e:b63a:0:b0:277:40bb:d32b with SMTP id
 s26-20020a2eb63a000000b0027740bbd32bmr12863946ljn.396.1667561467059; Fri, 04
 Nov 2022 04:31:07 -0700 (PDT)
MIME-Version: 1.0
References: <20221031151326.22634-1-ayankuma@amd.com> <20221031151326.22634-13-ayankuma@amd.com>
 <45df5e11-9697-96ca-3c89-39bdbba48637@amd.com> <09b11bfe-6b7b-2da7-84ed-ad7c7c89b516@amd.com>
In-Reply-To: <09b11bfe-6b7b-2da7-84ed-ad7c7c89b516@amd.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Fri, 4 Nov 2022 12:30:55 +0100
Message-ID: <CAJ=z9a3cbtjzkfWpibE9ArFOS7LVntXKoH-hxhFEqXJPD0VXZQ@mail.gmail.com>
Subject: Re: [XEN v2 12/12] xen/Arm: GICv3: Enable GICv3 for AArch32
To: Ayan Kumar Halder <ayankuma@amd.com>
Cc: Bertrand.Marquis@arm.com, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr_Babchuk@epam.com, burzalodowa@gmail.com, sstabellini@kernel.org, 
	stefanos@xilinx.com, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000e2b47705eca368f4"

--000000000000e2b47705eca368f4
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Nov 2022 at 12:09, Ayan Kumar Halder <ayankuma@amd.com> wrote:

>
> On 04/11/2022 09:55, Michal Orzel wrote:
> > Hi Ayan,
> Hi Michal,
> >
> > On 31/10/2022 16:13, Ayan Kumar Halder wrote:
> >>
> >> Refer ARM DDI 0487G.b ID072021,
> >> D13.2.86 -
> >> ID_PFR1_EL1, AArch32 Processor Feature Register 1
> >>
> >> GIC, bits[31:28] == 0b0001 for GIC3.0 on Aarch32
> >>
> >> One can now enable GICv3 on AArch32 systems. However, ITS is not
> supported.
> >> The reason being currently we are trying to validate GICv3 on an
> AArch32_v8R
> >> system. Refer ARM DDI 0568A.c ID110520, B1.3.1,
> >> "A Generic Interrupt Controller (GIC) implemented with an Armv8-R PE
> must not
> >> implement LPI support."
> >>
> >> Updated SUPPORT.md.
> >>
> >> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> >> ---
> >>
> >> Changed from :-
> >> v1 - 1. Remove "ARM_64 || ARM_32" as it is always true.
> >> 2. Updated SUPPORT.md.
> >>
> >>   SUPPORT.md                            | 6 ++++++
> >>   xen/arch/arm/Kconfig                  | 4 ++--
> >>   xen/arch/arm/include/asm/cpufeature.h | 1 +
> >>   3 files changed, 9 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/SUPPORT.md b/SUPPORT.md
> >> index cf2ddfacaf..0137855c66 100644
> >> --- a/SUPPORT.md
> >> +++ b/SUPPORT.md
> >> @@ -82,6 +82,12 @@ Extension to the GICv3 interrupt controller to
> support MSI.
> >>
> >>       Status: Experimental
> >>
> >> +### ARM/GICv3 + AArch32 ARM v8
> >> +
> >> +GICv3 is supported on AArch32 ARMv8 (besides AArch64)
> > Looking at the CONFIG_GICV3, it can be enabled on arm32, which at the
> moment
> > supports only ARMv7 (see __lookup_processor_type -> proc-v7.S).
> > What will prevent the user from enabling GICv3 for ARMv7 based CPU?


> Yes, this is my mistake.
>
> ARMv7 does not support GICv3.


The same could be said for Xen on Aarch32 Armv8. This is not officially
supported but works with some tweak in the lookup function.


>
> I should have introduced a new macro AArch32_v8R so that GICV3 is
> defined for it.


I would rather not have such config. There are no issue to allow someone to
build it for 32-bit because Xen is perfectly capable to detect which GIC
version is in use.

Instead we could simply disable GICv3 by default for arm32.


>
>   config GICV3
>          bool "GICv3 driver"
> -       depends on ARM_64 && !NEW_VGIC
> +       depends on ARM_64 || AArch32_v8R !NEW_VGIC
>          default y
>          ---help---
>
> >
> >> +
> >> +    Status: Supported, not security supported
> >> +
> >>   ## Guest Type
> >>
> >>   ### x86/PV
> >> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> >> index 1fe5faf847..7c3c6eb3bd 100644
> >> --- a/xen/arch/arm/Kconfig
> >> +++ b/xen/arch/arm/Kconfig
> >> @@ -41,7 +41,7 @@ config ARM_EFI
> >>
> >>   config GICV3
> >>          bool "GICv3 driver"
> >> -       depends on ARM_64 && !NEW_VGIC
> >> +       depends on !NEW_VGIC
> >>          default y
> >>          ---help---
> >>
> >> @@ -50,7 +50,7 @@ config GICV3
> >>
> >>   config HAS_ITS
> >>           bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if
> UNSUPPORTED
> >> -        depends on GICV3 && !NEW_VGIC
> >> +        depends on GICV3 && !NEW_VGIC && !ARM_32
> >>
> >>   config HVM
> >>           def_bool y
> >> diff --git a/xen/arch/arm/include/asm/cpufeature.h
> b/xen/arch/arm/include/asm/cpufeature.h
> >> index c86a2e7f29..c62cf6293f 100644
> >> --- a/xen/arch/arm/include/asm/cpufeature.h
> >> +++ b/xen/arch/arm/include/asm/cpufeature.h
> >> @@ -33,6 +33,7 @@
> >>   #define cpu_has_aarch32   (cpu_has_arm || cpu_has_thumb)
> >>
> >>   #ifdef CONFIG_ARM_32
> >> +#define cpu_has_gicv3     (boot_cpu_feature32(gic) >= 1)
> > What is the purpose of defining this macro if it is not used?
>
> It is used in xen/arch/arm/gic-v3.c, gicv3_init().
>
> - Ayan
>
> >
> >>   #define cpu_has_gentimer  (boot_cpu_feature32(gentimer) == 1)
> >>   /*
> >>    * On Armv7, the value 0 is used to indicate that PMUv2 is not
> >> --
> >> 2.17.1
> >>
> >>
> > ~Michal
>

--000000000000e2b47705eca368f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, 4 Nov 2022 at 12:09, Ayan Kumar Halder &lt;<a href=
=3D"mailto:ayankuma@amd.com">ayankuma@amd.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-=
width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(20=
4,204,204)" dir=3D"auto"><br>
On 04/11/2022 09:55, Michal Orzel wrote:<br>
&gt; Hi Ayan,<br>
Hi Michal,<br>
&gt;<br>
&gt; On 31/10/2022 16:13, Ayan Kumar Halder wrote:<br>
&gt;&gt;<br>
&gt;&gt; Refer ARM DDI 0487G.b ID072021,<br>
&gt;&gt; D13.2.86 -<br>
&gt;&gt; ID_PFR1_EL1, AArch32 Processor Feature Register 1<br>
&gt;&gt;<br>
&gt;&gt; GIC, bits[31:28] =3D=3D 0b0001 for GIC3.0 on Aarch32<br>
&gt;&gt;<br>
&gt;&gt; One can now enable GICv3 on AArch32 systems. However, ITS is not s=
upported.<br>
&gt;&gt; The reason being currently we are trying to validate GICv3 on an A=
Arch32_v8R<br>
&gt;&gt; system. Refer ARM DDI 0568A.c ID110520, B1.3.1,<br>
&gt;&gt; &quot;A Generic Interrupt Controller (GIC) implemented with an Arm=
v8-R PE must not<br>
&gt;&gt; implement LPI support.&quot;<br>
&gt;&gt;<br>
&gt;&gt; Updated SUPPORT.md.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Ayan Kumar Halder &lt;<a href=3D"mailto:ayankuma@am=
d.com" target=3D"_blank">ayankuma@amd.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;<br>
&gt;&gt; Changed from :-<br>
&gt;&gt; v1 - 1. Remove &quot;ARM_64 || ARM_32&quot; as it is always true.<=
br>
&gt;&gt; 2. Updated SUPPORT.md.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0SUPPORT.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 ++++++<br>
&gt;&gt;=C2=A0 =C2=A0xen/arch/arm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
&gt;&gt;=C2=A0 =C2=A0xen/arch/arm/include/asm/cpufeature.h | 1 +<br>
&gt;&gt;=C2=A0 =C2=A03 files changed, 9 insertions(+), 2 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/SUPPORT.md b/SUPPORT.md<br>
&gt;&gt; index cf2ddfacaf..0137855c66 100644<br>
&gt;&gt; --- a/SUPPORT.md<br>
&gt;&gt; +++ b/SUPPORT.md<br>
&gt;&gt; @@ -82,6 +82,12 @@ Extension to the GICv3 interrupt controller to =
support MSI.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Status: Experimental<br>
&gt;&gt;<br>
&gt;&gt; +### ARM/GICv3 + AArch32 ARM v8<br>
&gt;&gt; +<br>
&gt;&gt; +GICv3 is supported on AArch32 ARMv8 (besides AArch64)<br>
&gt; Looking at the CONFIG_GICV3, it can be enabled on arm32, which at the =
moment<br>
&gt; supports only ARMv7 (see __lookup_processor_type -&gt; proc-v7.S).<br>
&gt; What will prevent the user from enabling GICv3 for ARMv7 based CPU?</b=
lockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-le=
ft-color:rgb(204,204,204)" dir=3D"auto"><br>
Yes, this is my mistake.<br>
<br>
ARMv7 does not support GICv3.</blockquote><div dir=3D"auto"><br></div><div =
dir=3D"auto">The same could be said for Xen on Aarch32 Armv8. This is not o=
fficially supported but works with some tweak in the lookup function.</div>=
<div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-=
left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
I should have introduced a new macro AArch32_v8R so that GICV3 is <br>
defined for it.</blockquote><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-=
left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"></blockquote><div=
 dir=3D"auto"><br></div><div dir=3D"auto">I would rather not have such conf=
ig. There are no issue to allow someone to build it for 32-bit because Xen =
is perfectly capable to detect which GIC version is in use.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Instead we could simply disable GICv3=
 by default for arm32.</div><div dir=3D"auto"><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" =
dir=3D"auto"><br>
<br>
=C2=A0=C2=A0config GICV3<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool &quot;GICv3 driver&qu=
ot;<br>
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on ARM_64 &amp;&amp; !NEW_VGI=
C<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on ARM_64 || AArch32_v8R !NEW=
_VGIC<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default y<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ---help---<br>
<br>
&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 Status: Supported, not security supported<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0## Guest Type<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0### x86/PV<br>
&gt;&gt; diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig<br>
&gt;&gt; index 1fe5faf847..7c3c6eb3bd 100644<br>
&gt;&gt; --- a/xen/arch/arm/Kconfig<br>
&gt;&gt; +++ b/xen/arch/arm/Kconfig<br>
&gt;&gt; @@ -41,7 +41,7 @@ config ARM_EFI<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0config GICV3<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;GICv3 driver&quot;<br=
>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on ARM_64 &amp;&amp; !NEW_VGIC=
<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !NEW_VGIC<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default y<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ---help---<br>
&gt;&gt;<br>
&gt;&gt; @@ -50,7 +50,7 @@ config GICV3<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0config HAS_ITS<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;GICv3 ITS MSI c=
ontroller support (UNSUPPORTED)&quot; if UNSUPPORTED<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on GICV3 &amp;&amp; !NEW_VGIC=
<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on GICV3 &amp;&amp; !NEW_VGIC=
 &amp;&amp; !ARM_32<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0config HVM<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0def_bool y<br>
&gt;&gt; diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/=
include/asm/cpufeature.h<br>
&gt;&gt; index c86a2e7f29..c62cf6293f 100644<br>
&gt;&gt; --- a/xen/arch/arm/include/asm/cpufeature.h<br>
&gt;&gt; +++ b/xen/arch/arm/include/asm/cpufeature.h<br>
&gt;&gt; @@ -33,6 +33,7 @@<br>
&gt;&gt;=C2=A0 =C2=A0#define cpu_has_aarch32=C2=A0 =C2=A0(cpu_has_arm || cp=
u_has_thumb)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0#ifdef CONFIG_ARM_32<br>
&gt;&gt; +#define cpu_has_gicv3=C2=A0 =C2=A0 =C2=A0(boot_cpu_feature32(gic)=
 &gt;=3D 1)<br>
&gt; What is the purpose of defining this macro if it is not used?<br>
<br>
It is used in xen/arch/arm/gic-v3.c, gicv3_init().<br>
<br>
- Ayan<br>
<br>
&gt;<br>
&gt;&gt;=C2=A0 =C2=A0#define cpu_has_gentimer=C2=A0 (boot_cpu_feature32(gen=
timer) =3D=3D 1)<br>
&gt;&gt;=C2=A0 =C2=A0/*<br>
&gt;&gt;=C2=A0 =C2=A0 * On Armv7, the value 0 is used to indicate that PMUv=
2 is not<br>
&gt;&gt; --<br>
&gt;&gt; 2.17.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; ~Michal<br>
</blockquote></div></div>

--000000000000e2b47705eca368f4--

