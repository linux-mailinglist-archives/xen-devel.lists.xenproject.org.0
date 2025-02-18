Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 140F2A3A2EF
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 17:35:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892072.1301088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkQYp-0004Vv-Ox; Tue, 18 Feb 2025 16:35:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892072.1301088; Tue, 18 Feb 2025 16:35:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkQYp-0004U2-MJ; Tue, 18 Feb 2025 16:35:03 +0000
Received: by outflank-mailman (input) for mailman id 892072;
 Tue, 18 Feb 2025 16:35:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p1uV=VJ=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1tkQYo-0004Tw-As
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 16:35:02 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c660130-ee16-11ef-9aa7-95dc52dad729;
 Tue, 18 Feb 2025 17:35:01 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5dccaaca646so10324578a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 08:35:01 -0800 (PST)
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
X-Inumbo-ID: 4c660130-ee16-11ef-9aa7-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739896501; x=1740501301; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Dj2LBoPlP2eaMdS3IVdJvncbUdSQpYhPrvDkgDRG8bE=;
        b=KgGsqxqfqdrhB6IvOco+jvsNkP1anTp9bW2CjMuM1pmCpF8rc8znuAHi2V8sXp8E4C
         ss9yBz8W1132FM1953M8fG0KyLXRPV/GcnykZDSFnC/0nzDV4byE7Z6aK+Y2jQb7gp2g
         fIqvkrY6JvnZ+XYKbk81LZMmOKnoLsCA3wyCaVkF3BogOU6/zt5JcqqlRhB15E8xAUz2
         2rehtWVfSUHRVvlvx7PhR75YamID2r0Uc38zkrVjuAD9+7FcMbJahX8OHohpWF9ZJDsQ
         nTxAwgo1o5Z4Wnh+lm3iaMe40ZgtDOr8wDT2WIrGJSFCmWuZB4GIWKt1SFlwl6JFCj05
         +BlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739896501; x=1740501301;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dj2LBoPlP2eaMdS3IVdJvncbUdSQpYhPrvDkgDRG8bE=;
        b=eNzhOaWa+raAY5kGaFMjvVqv1IuB4/zrouqL7W4+w4EZqigiuA32lzb8VnOW+E9O9R
         3bOSVYQc0aj7zsOtX4ekcz9ATl0VsuVTlDQMO4wTg4h0HLAXug3mMiBiJ1usrKpE++Te
         KfxGC7bEMB3tjAqZkJggBb8xVIQ3c+lDtWUK37NBI/+PNR2pPS9JpD1/lBDjvRBIFuKo
         urx2RJHUuYlRXJIaKas4SRftUHhjc79BtGjcktUglUik8RLHcbUVRP5YhUWBPagmBmyE
         yC1/ny4CXBxsGj0IWL5kTZUHchUcPyVGWg3XnUWXGMuD+bNPdmpeOSi1NWseeAC7R0wl
         +YuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzMxdy+VM5Ecpej0CU9xIuZpXmvIr4KNXmSI0IuzBt1Xvl/mwSi+kNBp8Bpexmum23MhXEoL315lY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFBOincoavWlLI1Ab7zEGcMEaPkM374cPkZ81BihU6ZGvTcPXC
	xmz5ojbGZ5ZXxL3ygzI41fYQj/T577np8bnldxJxS5ScuCO/bkh2C9xlJe24HneydCEcHzNnlAV
	14XbmyQLc8SAQHC3XjfM9YXYMprg=
X-Gm-Gg: ASbGncvch3MW0sCg7i1uAR34nPoyiGiD6hBo3br+NmHBXeCKtfJWeo86sv80yizouiq
	VKsO2SYOTUVKT77u8m3qIFHMiKW5C7HaNAIzkChr63MOMWSAPIj3Uii33ijTM7+NYp3uO72hN
X-Google-Smtp-Source: AGHT+IFptKE1EDaXhSZKBUdIQvETT0zVarz8BMzh40VQoM/kVeseRMJeLDD9p5o6TYL2cKXADAJ8W2r79tdjY79vS6U=
X-Received: by 2002:a05:6402:26cd:b0:5de:50b4:b71f with SMTP id
 4fb4d7f45d1cf-5e088de15e2mr478824a12.12.1739896500215; Tue, 18 Feb 2025
 08:35:00 -0800 (PST)
MIME-Version: 1.0
References: <20240904161537.664189-1-edgar.iglesias@gmail.com>
 <20240904161537.664189-11-edgar.iglesias@gmail.com> <58d3fcc5-365d-4f20-ae34-5201fb9e7b3f@linaro.org>
In-Reply-To: <58d3fcc5-365d-4f20-ae34-5201fb9e7b3f@linaro.org>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Tue, 18 Feb 2025 10:34:47 -0600
X-Gm-Features: AWEUYZlrs1EjDPrUmNwtX1q2AMsgqM7n3BvGXNSheB6NGIaA_Qu6Q9Rf0LrIF6E
Message-ID: <CAJy5ezq__QCuORp5aqT7ehFamqXsO_pot9J5GyS6Tt2wEHdPtQ@mail.gmail.com>
Subject: Re: [PULL v1 10/12] hw/xen: pvh-common: Add support for creating PCIe/GPEX
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, sstabellini@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, anthony@xenproject.org, paul@xen.org, 
	peter.maydell@linaro.org, alex.bennee@linaro.org, xenia.ragiadakou@amd.com, 
	jason.andryuk@amd.com, edgar.iglesias@amd.com, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000d76709062e6d383d"

--000000000000d76709062e6d383d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 6:02=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 <philmd=
@linaro.org>
wrote:

> Hi Edgar,
>
> On 4/9/24 18:15, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> >
> > Add support for optionally creating a PCIe/GPEX controller.
> >
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > ---
> >   hw/xen/xen-pvh-common.c         | 76 ++++++++++++++++++++++++++++++++=
+
> >   include/hw/xen/xen-pvh-common.h | 29 +++++++++++++
> >   2 files changed, 105 insertions(+)
>
>
> > +/*
> > + * We use the GPEX PCIe controller with its internal INTX PCI interrup=
t
> > + * swizzling. This swizzling is emulated in QEMU and routes all INTX
> > + * interrupts from endpoints down to only 4 INTX interrupts.
> > + * See include/hw/pci/pci.h : pci_swizzle()
> > + */
> > +static inline void xenpvh_gpex_init(XenPVHMachineState *s,
> > +                                    XenPVHMachineClass *xpc,
> > +                                    MemoryRegion *sysmem)
> > +{
> > +    MemoryRegion *ecam_reg;
> > +    MemoryRegion *mmio_reg;
> > +    DeviceState *dev;
> > +    int i;
> > +
> > +    object_initialize_child(OBJECT(s), "gpex", &s->pci.gpex,
> > +                            TYPE_GPEX_HOST);
> > +    dev =3D DEVICE(&s->pci.gpex);
> > +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> > +
> > +    ecam_reg =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
> > +    memory_region_add_subregion(sysmem, s->cfg.pci_ecam.base, ecam_reg=
);
> > +
> > +    mmio_reg =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 1);
> > +
> > +    if (s->cfg.pci_mmio.size) {
> > +        memory_region_init_alias(&s->pci.mmio_alias, OBJECT(dev),
> "pcie-mmio",
> > +                                 mmio_reg,
> > +                                 s->cfg.pci_mmio.base,
> s->cfg.pci_mmio.size);
> > +        memory_region_add_subregion(sysmem, s->cfg.pci_mmio.base,
> > +                                    &s->pci.mmio_alias);
> > +    }
> > +
> > +    if (s->cfg.pci_mmio_high.size) {
> > +        memory_region_init_alias(&s->pci.mmio_high_alias, OBJECT(dev),
> > +                "pcie-mmio-high",
> > +                mmio_reg, s->cfg.pci_mmio_high.base,
> s->cfg.pci_mmio_high.size);
> > +        memory_region_add_subregion(sysmem, s->cfg.pci_mmio_high.base,
> > +                &s->pci.mmio_high_alias);
> > +    }
> > +
> > +    /*
> > +     * PVH implementations with PCI enabled must provide
> set_pci_intx_irq()
> > +     * and optionally an implementation of set_pci_link_route().
> > +     */
> > +    assert(xpc->set_pci_intx_irq);
> > +
> > +    for (i =3D 0; i < GPEX_NUM_IRQS; i++) {
> > +        qemu_irq irq =3D qemu_allocate_irq(xpc->set_pci_intx_irq, s, i=
);
> > +
> > +        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, irq);
> > +        gpex_set_irq_num(GPEX_HOST(dev), i, s->cfg.pci_intx_irq_base +
> i);
> > +        if (xpc->set_pci_link_route) {
> > +            xpc->set_pci_link_route(i, s->cfg.pci_intx_irq_base + i);
> > +        }
> > +    }
> > +}
>
> Some Kconfig selector seems missing here:
>
> /usr/bin/ld: libqemu-aarch64-softmmu.a.p/hw_xen_xen-pvh-common.c.o: in
> function `xenpvh_gpex_init':
> hw/xen/xen-pvh-common.c:174: undefined reference to `gpex_set_irq_num'
> /usr/bin/ld: libqemu-aarch64-softmmu.a.p/hw_xen_xen-hvm-common.c.o: in
> function `pci_dev_bus_num':
> include/hw/pci/pci.h:337: undefined reference to `pci_bus_num'
> /usr/bin/ld: include/hw/pci/pci.h:337: undefined reference to `pci_bus_nu=
m'
> /usr/bin/ld: include/hw/pci/pci.h:337: undefined reference to `pci_bus_nu=
m'
> /usr/bin/ld: include/hw/pci/pci.h:337: undefined reference to `pci_bus_nu=
m'
> /usr/bin/ld: include/hw/pci/pci.h:337: undefined reference to `pci_bus_nu=
m'
> /usr/bin/ld: libqemu-aarch64-softmmu.a.p/hw_xen_xen-hvm-common.c.o: in
> function `cpu_ioreq_config':
> hw/xen/xen-hvm-common.c:412: undefined reference to
> `pci_host_config_read_common'
> /usr/bin/ld: hw/xen/xen-hvm-common.c:428: undefined reference to
> `pci_host_config_read_common'
> /usr/bin/ld: hw/xen/xen-hvm-common.c:438: undefined reference to
> `pci_host_config_write_common'
>
> The current 'XEN' key represents both the "accelerator" part and
> the common Xen HW, which isn't helping to follow. Anyhow, this
> snippet fixes the build issue:
>
> -- >8 --
> diff --git a/accel/Kconfig b/accel/Kconfig
> index 794e0d18d2..4263cab722 100644
> --- a/accel/Kconfig
> +++ b/accel/Kconfig
> @@ -16,4 +16,5 @@ config KVM
>   config XEN
>       bool
>       select FSDEV_9P if VIRTFS
> +    select PCI_EXPRESS_GENERIC_BRIDGE
>       select XEN_BUS
> ---
>
> I'll post a patch later.
>


Sounds good, thanks Phil!

Cheers,
Edgar


>
> Regards,
>
> Phil.
>

--000000000000d76709062e6d383d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote gmail=
_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 18, 202=
5 at 6:02=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:phil=
md@linaro.org">philmd@linaro.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi Edgar,<br>
<br>
On 4/9/24 18:15, Edgar E. Iglesias wrote:<br>
&gt; From: &quot;Edgar E. Iglesias&quot; &lt;<a href=3D"mailto:edgar.iglesi=
as@amd.com" target=3D"_blank">edgar.iglesias@amd.com</a>&gt;<br>
&gt; <br>
&gt; Add support for optionally creating a PCIe/GPEX controller.<br>
&gt; <br>
&gt; Signed-off-by: Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.iglesias@=
amd.com" target=3D"_blank">edgar.iglesias@amd.com</a>&gt;<br>
&gt; Reviewed-by: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kern=
el.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/xen/xen-pvh-common.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 76 +++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0include/hw/xen/xen-pvh-common.h | 29 +++++++++++++<br>
&gt;=C2=A0 =C2=A02 files changed, 105 insertions(+)<br>
<br>
<br>
&gt; +/*<br>
&gt; + * We use the GPEX PCIe controller with its internal INTX PCI interru=
pt<br>
&gt; + * swizzling. This swizzling is emulated in QEMU and routes all INTX<=
br>
&gt; + * interrupts from endpoints down to only 4 INTX interrupts.<br>
&gt; + * See include/hw/pci/pci.h : pci_swizzle()<br>
&gt; + */<br>
&gt; +static inline void xenpvh_gpex_init(XenPVHMachineState *s,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 XenPVHMachineClass=
 *xpc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MemoryRegion *sysm=
em)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 MemoryRegion *ecam_reg;<br>
&gt; +=C2=A0 =C2=A0 MemoryRegion *mmio_reg;<br>
&gt; +=C2=A0 =C2=A0 DeviceState *dev;<br>
&gt; +=C2=A0 =C2=A0 int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 object_initialize_child(OBJECT(s), &quot;gpex&quot;, &a=
mp;s-&gt;pci.gpex,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TYPE_GPEX_HOST);<br>
&gt; +=C2=A0 =C2=A0 dev =3D DEVICE(&amp;s-&gt;pci.gpex);<br>
&gt; +=C2=A0 =C2=A0 sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &amp;erro=
r_fatal);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 ecam_reg =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(dev)=
, 0);<br>
&gt; +=C2=A0 =C2=A0 memory_region_add_subregion(sysmem, s-&gt;cfg.pci_ecam.=
base, ecam_reg);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 mmio_reg =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(dev)=
, 1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (s-&gt;cfg.pci_mmio.size) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_region_init_alias(&amp;s-&gt;pci.m=
mio_alias, OBJECT(dev), &quot;pcie-mmio&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mmio_reg,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;cfg.pci_mmio.base, s=
-&gt;cfg.pci_mmio.size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_region_add_subregion(sysmem, s-&gt=
;cfg.pci_mmio.base,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;s-&gt;pci.mmi=
o_alias);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (s-&gt;cfg.pci_mmio_high.size) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_region_init_alias(&amp;s-&gt;pci.m=
mio_high_alias, OBJECT(dev),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pcie-mm=
io-high&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mmio_reg, s-&=
gt;cfg.pci_mmio_high.base, s-&gt;cfg.pci_mmio_high.size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_region_add_subregion(sysmem, s-&gt=
;cfg.pci_mmio_high.base,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;s-&gt;pc=
i.mmio_high_alias);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* PVH implementations with PCI enabled must provi=
de set_pci_intx_irq()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* and optionally an implementation of set_pci_lin=
k_route().<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 assert(xpc-&gt;set_pci_intx_irq);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; GPEX_NUM_IRQS; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq irq =3D qemu_allocate_irq(xpc-&g=
t;set_pci_intx_irq, s, i);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_connect_irq(SYS_BUS_DEVICE(dev), i=
, irq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gpex_set_irq_num(GPEX_HOST(dev), i, s-&gt=
;cfg.pci_intx_irq_base + i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (xpc-&gt;set_pci_link_route) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc-&gt;set_pci_link_route(=
i, s-&gt;cfg.pci_intx_irq_base + i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
<br>
Some Kconfig selector seems missing here:<br>
<br>
/usr/bin/ld: libqemu-aarch64-softmmu.a.p/hw_xen_xen-pvh-common.c.o: in <br>
function `xenpvh_gpex_init&#39;:<br>
hw/xen/xen-pvh-common.c:174: undefined reference to `gpex_set_irq_num&#39;<=
br>
/usr/bin/ld: libqemu-aarch64-softmmu.a.p/hw_xen_xen-hvm-common.c.o: in <br>
function `pci_dev_bus_num&#39;:<br>
include/hw/pci/pci.h:337: undefined reference to `pci_bus_num&#39;<br>
/usr/bin/ld: include/hw/pci/pci.h:337: undefined reference to `pci_bus_num&=
#39;<br>
/usr/bin/ld: include/hw/pci/pci.h:337: undefined reference to `pci_bus_num&=
#39;<br>
/usr/bin/ld: include/hw/pci/pci.h:337: undefined reference to `pci_bus_num&=
#39;<br>
/usr/bin/ld: include/hw/pci/pci.h:337: undefined reference to `pci_bus_num&=
#39;<br>
/usr/bin/ld: libqemu-aarch64-softmmu.a.p/hw_xen_xen-hvm-common.c.o: in <br>
function `cpu_ioreq_config&#39;:<br>
hw/xen/xen-hvm-common.c:412: undefined reference to <br>
`pci_host_config_read_common&#39;<br>
/usr/bin/ld: hw/xen/xen-hvm-common.c:428: undefined reference to <br>
`pci_host_config_read_common&#39;<br>
/usr/bin/ld: hw/xen/xen-hvm-common.c:438: undefined reference to <br>
`pci_host_config_write_common&#39;<br>
<br>
The current &#39;XEN&#39; key represents both the &quot;accelerator&quot; p=
art and<br>
the common Xen HW, which isn&#39;t helping to follow. Anyhow, this<br>
snippet fixes the build issue:<br>
<br>
-- &gt;8 --<br>
diff --git a/accel/Kconfig b/accel/Kconfig<br>
index 794e0d18d2..4263cab722 100644<br>
--- a/accel/Kconfig<br>
+++ b/accel/Kconfig<br>
@@ -16,4 +16,5 @@ config KVM<br>
=C2=A0 config XEN<br>
=C2=A0 =C2=A0 =C2=A0 bool<br>
=C2=A0 =C2=A0 =C2=A0 select FSDEV_9P if VIRTFS<br>
+=C2=A0 =C2=A0 select PCI_EXPRESS_GENERIC_BRIDGE<br>
=C2=A0 =C2=A0 =C2=A0 select XEN_BUS<br>
---<br>
<br>
I&#39;ll post a patch later.<br></blockquote><div><br></div><div><br></div>=
<div>Sounds good, thanks Phil!</div><div><br></div><div>Cheers,</div><div>E=
dgar</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
Regards,<br>
<br>
Phil.<br>
</blockquote></div></div>

--000000000000d76709062e6d383d--

