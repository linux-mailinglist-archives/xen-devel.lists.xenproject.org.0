Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE38611AA0
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 21:07:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.432207.684968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooUgI-0002gE-LK; Fri, 28 Oct 2022 19:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432207.684968; Fri, 28 Oct 2022 19:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooUgI-0002eS-IL; Fri, 28 Oct 2022 19:06:14 +0000
Received: by outflank-mailman (input) for mailman id 432207;
 Fri, 28 Oct 2022 19:06:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SnbH=25=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1ooUgH-0002eM-98
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 19:06:13 +0000
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95d08896-56f3-11ed-8fd0-01056ac49cbb;
 Fri, 28 Oct 2022 21:06:11 +0200 (CEST)
Received: by mail-pj1-x102a.google.com with SMTP id
 z5-20020a17090a8b8500b00210a3a2364fso8601885pjn.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Oct 2022 12:06:11 -0700 (PDT)
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
X-Inumbo-ID: 95d08896-56f3-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OpySAI0m06R16LGE63jw0ivYx7e/ioZkfJWvMJn/6p4=;
        b=BJ33SXBipARpCCtD2oOUkdM2RwZNIXY+XMUdvUhKqF6VuaQ8miWtNBI/CdPbA7sUta
         oXy7ggplDYDuuUTyNOjOsHDFD9zVN0aKqUY/cewErZBNQcdZTk5TovbXo8pBbzYDTEZf
         9rp+ds87gQHxqbHI3/E3ECAWJ3dklCaqNHM7iJEPXGn1DvXXh/lRT/ghGVM9uRMn9iys
         XPN7XmGEab12vjsbRHdEHg/m0eXr0IeiaUA29O7qFu7kXN2aZXTengiSAgGOFc+izg78
         UkS93zzjWQDa8e9yZusr2WX2jmsR47czjYPH6Y0puT9tbf8JfLhY3G/p9YsjDrdoIDSR
         oyfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OpySAI0m06R16LGE63jw0ivYx7e/ioZkfJWvMJn/6p4=;
        b=G+5bwF49xuRSGHuNPN+Qg0YijTG+5aWjRTMwboHz0+J8bzPsjJ1hM4wF6w0Lqcs+vT
         YICLkW5Hon8Jd2fwcaIjo1O/JdQuvu/OOyn0O6xgIstKruFAyuSSvZMMDM8a9Lr0JGMV
         bk8tFj8YsceKP/BmQjil92Un9ZWs3kCGvIVMzi3ONfTYHyUNAMbj5PNG3XQXWWR3/nGj
         lVU68mjDYkYAPOGRwYUYLvoYWtHIlMoKkVITGyKavwe9oXAmKekh5IV6EZBP5JRZ8dtM
         eL1MIKbCuggX4dx2hEpd3dWNN6XKXtc9g6WRCPzW2ay//TxkDP5mxjvVvKs0MeNjdxpz
         SyuA==
X-Gm-Message-State: ACrzQf0Sesg6oKYhrZoid0KUcu0vEla+wcaugTDVRv0aKCY67R2VFRww
	CnxYsSvN+O3MnAuTd9XIDeGr9C0Pa0GjT7RNOiM=
X-Google-Smtp-Source: AMsMyM4xKpCtA6doHrBId4kdH/4woxsla2xyPf+PNZF/ENC+dfhwTJMgv3LlYmF2OAn5rSk4ZRzuc0DmTtr8rx9IYqg=
X-Received: by 2002:a17:902:eccc:b0:186:5f09:f9 with SMTP id
 a12-20020a170902eccc00b001865f0900f9mr490806plh.6.1666983970122; Fri, 28 Oct
 2022 12:06:10 -0700 (PDT)
MIME-Version: 1.0
References: <20221015050750.4185-1-vikram.garhwal@amd.com> <20221015050750.4185-11-vikram.garhwal@amd.com>
 <87wn8l3d3r.fsf@linaro.org> <7da20a2e-81e0-b3ad-c2d6-6012fa7edee2@xen.org>
In-Reply-To: <7da20a2e-81e0-b3ad-c2d6-6012fa7edee2@xen.org>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Fri, 28 Oct 2022 22:05:58 +0300
Message-ID: <CAPD2p-nE30z9LosUkO6OdrPnuCaSwi_s2tsfbxgcOyu087tz-w@mail.gmail.com>
Subject: Re: [PATCH v1 10/12] hw/arm: introduce xenpv machine
To: Julien Grall <julien@xen.org>, Vikram Garhwal <vikram.garhwal@amd.com>, stefano.stabellini@amd.com
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, 
	Paul Durrant <paul@xen.org>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, xen-devel@lists.xenproject.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000062afd005ec1cf34a"

--00000000000062afd005ec1cf34a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 28, 2022 at 8:58 PM Julien Grall <julien@xen.org> wrote:

> Hi,
>

Hello all.

[sorry for the possible format issues]



>
> On 27/10/2022 09:02, Alex Benn=C3=A9e wrote:
> >
> > Vikram Garhwal <vikram.garhwal@amd.com> writes:
> >
> > <snip>
> >> Optional: When CONFIG_TPM is enabled, it also creates a tpm-tis-device=
,
> adds a
> >> TPM emulator and connects to swtpm running on host machine via chardev
> socket
> >> and support TPM functionalities for a guest domain.
> >>
> >> Extra command line for aarch64 xenpv QEMU to connect to swtpm:
> >>      -chardev socket,id=3Dchrtpm,path=3D/tmp/myvtpm2/swtpm-sock \
> >>      -tpmdev emulator,id=3Dtpm0,chardev=3Dchrtpm \
> >>
> >> swtpm implements a TPM software emulator(TPM 1.2 & TPM 2) built on
> libtpms and
> >> provides access to TPM functionality over socket, chardev and CUSE
> interface.
> >> Github repo: https://github.com/stefanberger/swtpm
> >> Example for starting swtpm on host machine:
> >>      mkdir /tmp/vtpm2
> >>      swtpm socket --tpmstate dir=3D/tmp/vtpm2 \
> >>      --ctrl type=3Dunixio,path=3D/tmp/vtpm2/swtpm-sock &
> >
> > <snip>
> >> +static void xen_enable_tpm(void)
> >> +{
> >> +/* qemu_find_tpm_be is only available when CONFIG_TPM is enabled. */
> >> +#ifdef CONFIG_TPM
> >> +    Error *errp =3D NULL;
> >> +    DeviceState *dev;
> >> +    SysBusDevice *busdev;
> >> +
> >> +    TPMBackend *be =3D qemu_find_tpm_be("tpm0");
> >> +    if (be =3D=3D NULL) {
> >> +        DPRINTF("Couldn't fine the backend for tpm0\n");
> >> +        return;
> >> +    }
> >> +    dev =3D qdev_new(TYPE_TPM_TIS_SYSBUS);
> >> +    object_property_set_link(OBJECT(dev), "tpmdev", OBJECT(be), &errp=
);
> >> +    object_property_set_str(OBJECT(dev), "tpmdev", be->id, &errp);
> >> +    busdev =3D SYS_BUS_DEVICE(dev);
> >> +    sysbus_realize_and_unref(busdev, &error_fatal);
> >> +    sysbus_mmio_map(busdev, 0, GUEST_TPM_BASE);
> >
> > I'm not sure what has gone wrong here but I'm getting:
> >
> >    ../../hw/arm/xen_arm.c: In function =E2=80=98xen_enable_tpm=E2=80=99=
:
> >    ../../hw/arm/xen_arm.c:120:32: error: =E2=80=98GUEST_TPM_BASE=E2=80=
=99 undeclared
> (first use in this function); did you mean =E2=80=98GUEST_RAM_BASE=E2=80=
=99?
> >      120 |     sysbus_mmio_map(busdev, 0, GUEST_TPM_BASE);
> >          |                                ^~~~~~~~~~~~~~
> >          |                                GUEST_RAM_BASE
> >    ../../hw/arm/xen_arm.c:120:32: note: each undeclared identifier is
> reported only once for each function it appears in
> >
> > In my cross build:
> >
> >    # Configured with: '../../configure' '--disable-docs'
> '--target-list=3Daarch64-softmmu' '--disable-kvm' '--enable-xen'
> '--disable-opengl' '--disable-libudev' '--enable-tpm'
> '--disable-xen-pci-passthrough' '--cross-prefix=3Daarch64-linux-gnu-'
> '--skip-meson'
> >
> > which makes me wonder if this is a configure failure or a confusion
> > about being able to have host swtpm implementations during emulation bu=
t
> > needing target tpm for Xen?
>
> I was also wondering where is that value come from. Note that the
> memory/IRQ layout exposed to the guest is not stable.
>
> Are we expecting the user to rebuild QEMU for every Xen versions (or
> possibly every guest if we ever allow dynamic layout in Xen)?
>


This doesn't sound ideal.

I am wondering what would be the correct way here assuming that we would
likely need to have more such information in place for supporting more
use-cases...
For instance, the PCI host bridge emulation in Qemu. Xen toolstack (another
software layer) generates device-tree for the guest, so creates PCI Host
bridge node by using reserved regions from Guest OS interface (arch-arm.h):
- GUEST_VPCI_MEM_ADDR (GUEST_VPCI_MEM_SIZE)
- GUEST_VPCI_ECAM_BASE (GUEST_VPCI_ECAM_SIZE)
- GUEST_VPCI_PREFETCH_MEM_ADDR (GUEST_VPCI_PREFETCH_MEM_SIZE)
https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Dtools/libs/light/l=
ibxl_arm.c;h=3D2a5e93c28403738779863aded31d2df3ba72f8c0;hb=3DHEAD#l833

Here in Qemu when creating a PCI Host bridge we would need to use exactly
the same reserved regions which toolstack writes in the corresponding
device-tree node. So how to tell Qemu about them?
1. Introduce new cmd line arguments?
2. Using Xenstore?
3. Anything else?

I am afraid this would be related to every device that we want to emulate
in Qemu and for which the toolstack needs to generate device-tree node by
using something defined with GUEST_*, unless I really missed something.



>
> Cheers,
>
> --
> Julien Grall
>
>

--=20
Regards,

Oleksandr Tyshchenko

--00000000000062afd005ec1cf34a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 28, 2022 at 8:58 PM Julie=
n Grall &lt;<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Hi,<br></blockquote><div><br></div><div>Hello all.</div><div><br></div><=
div>[sorry for the possible format issues]</div><div><br></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
On 27/10/2022 09:02, Alex Benn=C3=A9e wrote:<br>
&gt; <br>
&gt; Vikram Garhwal &lt;<a href=3D"mailto:vikram.garhwal@amd.com" target=3D=
"_blank">vikram.garhwal@amd.com</a>&gt; writes:<br>
&gt; <br>
&gt; &lt;snip&gt;<br>
&gt;&gt; Optional: When CONFIG_TPM is enabled, it also creates a tpm-tis-de=
vice, adds a<br>
&gt;&gt; TPM emulator and connects to swtpm running on host machine via cha=
rdev socket<br>
&gt;&gt; and support TPM functionalities for a guest domain.<br>
&gt;&gt;<br>
&gt;&gt; Extra command line for aarch64 xenpv QEMU to connect to swtpm:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 -chardev socket,id=3Dchrtpm,path=3D/tmp/myvtpm=
2/swtpm-sock \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 -tpmdev emulator,id=3Dtpm0,chardev=3Dchrtpm \<=
br>
&gt;&gt;<br>
&gt;&gt; swtpm implements a TPM software emulator(TPM 1.2 &amp; TPM 2) buil=
t on libtpms and<br>
&gt;&gt; provides access to TPM functionality over socket, chardev and CUSE=
 interface.<br>
&gt;&gt; Github repo: <a href=3D"https://github.com/stefanberger/swtpm" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/stefanberger/swtpm</a>=
<br>
&gt;&gt; Example for starting swtpm on host machine:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 mkdir /tmp/vtpm2<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 swtpm socket --tpmstate dir=3D/tmp/vtpm2 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 --ctrl type=3Dunixio,path=3D/tmp/vtpm2/swtpm-s=
ock &amp;<br>
&gt; <br>
&gt; &lt;snip&gt;<br>
&gt;&gt; +static void xen_enable_tpm(void)<br>
&gt;&gt; +{<br>
&gt;&gt; +/* qemu_find_tpm_be is only available when CONFIG_TPM is enabled.=
 */<br>
&gt;&gt; +#ifdef CONFIG_TPM<br>
&gt;&gt; +=C2=A0 =C2=A0 Error *errp =3D NULL;<br>
&gt;&gt; +=C2=A0 =C2=A0 DeviceState *dev;<br>
&gt;&gt; +=C2=A0 =C2=A0 SysBusDevice *busdev;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 TPMBackend *be =3D qemu_find_tpm_be(&quot;tpm0&quot=
;);<br>
&gt;&gt; +=C2=A0 =C2=A0 if (be =3D=3D NULL) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 DPRINTF(&quot;Couldn&#39;t fine the b=
ackend for tpm0\n&quot;);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 dev =3D qdev_new(TYPE_TPM_TIS_SYSBUS);<br>
&gt;&gt; +=C2=A0 =C2=A0 object_property_set_link(OBJECT(dev), &quot;tpmdev&=
quot;, OBJECT(be), &amp;errp);<br>
&gt;&gt; +=C2=A0 =C2=A0 object_property_set_str(OBJECT(dev), &quot;tpmdev&q=
uot;, be-&gt;id, &amp;errp);<br>
&gt;&gt; +=C2=A0 =C2=A0 busdev =3D SYS_BUS_DEVICE(dev);<br>
&gt;&gt; +=C2=A0 =C2=A0 sysbus_realize_and_unref(busdev, &amp;error_fatal);=
<br>
&gt;&gt; +=C2=A0 =C2=A0 sysbus_mmio_map(busdev, 0, GUEST_TPM_BASE);<br>
&gt; <br>
&gt; I&#39;m not sure what has gone wrong here but I&#39;m getting:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 ../../hw/arm/xen_arm.c: In function =E2=80=98xen_enable_t=
pm=E2=80=99:<br>
&gt;=C2=A0 =C2=A0 ../../hw/arm/xen_arm.c:120:32: error: =E2=80=98GUEST_TPM_=
BASE=E2=80=99 undeclared (first use in this function); did you mean =E2=80=
=98GUEST_RAM_BASE=E2=80=99?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 120 |=C2=A0 =C2=A0 =C2=A0sysbus_mmio_map(busdev, 0=
, GUEST_TPM_BASE);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^~~~~~~~~~~~~~<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 GUEST_RAM_BASE<br>
&gt;=C2=A0 =C2=A0 ../../hw/arm/xen_arm.c:120:32: note: each undeclared iden=
tifier is reported only once for each function it appears in<br>
&gt; <br>
&gt; In my cross build:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 # Configured with: &#39;../../configure&#39; &#39;--disab=
le-docs&#39; &#39;--target-list=3Daarch64-softmmu&#39; &#39;--disable-kvm&#=
39; &#39;--enable-xen&#39; &#39;--disable-opengl&#39; &#39;--disable-libude=
v&#39; &#39;--enable-tpm&#39; &#39;--disable-xen-pci-passthrough&#39; &#39;=
--cross-prefix=3Daarch64-linux-gnu-&#39; &#39;--skip-meson&#39;<br>
&gt; <br>
&gt; which makes me wonder if this is a configure failure or a confusion<br=
>
&gt; about being able to have host swtpm implementations during emulation b=
ut<br>
&gt; needing target tpm for Xen?<br>
<br>
I was also wondering where is that value come from. Note that the <br>
memory/IRQ layout exposed to the guest is not stable.<br>
<br>
Are we expecting the user to rebuild QEMU for every Xen versions (or <br>
possibly every guest if we ever allow dynamic layout in Xen)?<br></blockquo=
te><div><br></div><div><br></div><div>This doesn&#39;t sound ideal.=C2=A0</=
div><div><br></div><div>I am wondering what would be the correct way here a=
ssuming that we would likely need to have more such information in place fo=
r supporting more use-cases...</div><div>For instance, the PCI host bridge =
emulation in Qemu. Xen toolstack (another software layer) generates device-=
tree for the guest, so creates PCI Host bridge node by using reserved regio=
ns from=C2=A0Guest OS interface (arch-arm.h):</div><div>- GUEST_VPCI_MEM_AD=
DR (GUEST_VPCI_MEM_SIZE)<br></div><div>- GUEST_VPCI_ECAM_BASE (GUEST_VPCI_E=
CAM_SIZE)<br></div><div>- GUEST_VPCI_PREFETCH_MEM_ADDR (GUEST_VPCI_PREFETCH=
_MEM_SIZE)<br></div><div><a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen=
.git;a=3Dblob;f=3Dtools/libs/light/libxl_arm.c;h=3D2a5e93c28403738779863ade=
d31d2df3ba72f8c0;hb=3DHEAD#l833" target=3D"_blank">https://xenbits.xen.org/=
gitweb/?p=3Dxen.git;a=3Dblob;f=3Dtools/libs/light/libxl_arm.c;h=3D2a5e93c28=
403738779863aded31d2df3ba72f8c0;hb=3DHEAD#l833</a><br></div><div><br></div>=
<div>Here in Qemu when creating a PCI Host bridge we would need to use exac=
tly the same reserved regions=C2=A0which toolstack writes in the correspond=
ing device-tree node. So how to tell Qemu about them?=C2=A0</div><div>1. In=
troduce new cmd line arguments?</div><div>2. Using Xenstore?</div><div>3. A=
nything else?</div><div><br></div><div>I am afraid this would be related to=
 every device that we want to emulate in Qemu and for which the toolstack n=
eeds to=C2=A0generate device-tree node=C2=A0by using something defined with=
 GUEST_*, unless I really missed something.</div><div><br></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><span style=
=3D"background-color:rgb(255,255,255)"><font size=3D"2"><span style=3D"colo=
r:rgb(51,51,51);font-family:Arial,sans-serif">Regards,</span></font></span>=
</div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div><span style=3D"backg=
round-color:rgb(255,255,255)"><font size=3D"2">Oleksandr Tyshchenko</font><=
/span></div></div></div></div></div></div></div></div>

--00000000000062afd005ec1cf34a--

