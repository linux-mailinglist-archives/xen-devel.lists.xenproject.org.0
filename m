Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99303572025
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 18:00:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365817.596145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBIIm-0004nR-Vz; Tue, 12 Jul 2022 15:59:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365817.596145; Tue, 12 Jul 2022 15:59:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBIIm-0004kj-T3; Tue, 12 Jul 2022 15:59:56 +0000
Received: by outflank-mailman (input) for mailman id 365817;
 Tue, 12 Jul 2022 15:59:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xDJC=XR=cachengo.com=brad@srs-se1.protection.inumbo.net>)
 id 1oBIIl-0004kb-M8
 for xen-devel@lists.xen.org; Tue, 12 Jul 2022 15:59:56 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aaf180bd-01fb-11ed-bd2d-47488cf2e6aa;
 Tue, 12 Jul 2022 17:59:53 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id k30so10685115edk.8
 for <xen-devel@lists.xen.org>; Tue, 12 Jul 2022 08:59:53 -0700 (PDT)
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
X-Inumbo-ID: aaf180bd-01fb-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cachengo.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EHbL74lI6W7LMVgt8i3KkYlRuQ9ZKvV6xgX1unhHuOU=;
        b=ZMoiyb5TrJ4j4wjO/MNa8dlJKtd65ZXPKOVB9HAgoOO9fDYFeqT8K/Dx3MNRLgxcN0
         4T6OtP8/twCaxGTYd1JeU0C0xiKmMsNtNmAbRVgIJfX2yeaZDZSAXm4gRdGrDe9Y6cEx
         D0RSivZgwZttmHwCc3/U/bIaAj4TmWpUhRV/TTi1d1sdrDXZhCmn8s9u997Gurqn9xT5
         iXJaWe3D2rjY8xt8gsGOcV18xuspBo26hhW57Hb9Q4BAp1Cut93ChbFgBB7r6paj0FCD
         tiOzxfo+xtgNn5yRXBs9aGyFEMA7aOVeuugHgRDdGmmzcnsQONj964buxaKUhjM+VyLI
         KmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EHbL74lI6W7LMVgt8i3KkYlRuQ9ZKvV6xgX1unhHuOU=;
        b=s+OYUTOUpW+RPgV2me6VxSylkgeHAxqwTla7u9cwYAXM+A/Yr2CsuOypvzA1AJYecV
         JEHBQOXMxdvY4KDjomlPqBjU/UeF9OZ7PRtJBh2cjmB7jSBM7uoCkZWrNhfXCwVcyAbq
         rK+6xZAMHqFNlhi3nT/mEXNI8GEI+33ynpr/L8qVTPlICu/VaX388u//wB0cltfi3X+j
         vCNB4CnasdojoaJP6mMJ6D40zd4DT6zGSGittftVH4gIlWhp7lhQm7Qs6aJwxp/7OhxE
         MLHLntAZfFd4SIPgTmbXTI9BoIP+2bZ0h6wy88SwTfpl3moG6oXVkWTv/YYUlePB3Sni
         Gzxg==
X-Gm-Message-State: AJIora/ItLpEQCbQHFaqXQstvto4Q6bMH24aujRfbu/1830wXvh9EfP8
	Rj7Mj4hzMEilqE2uUU0EONiDfvlh+8rGKykW3V63KfZ5lpmCpA==
X-Google-Smtp-Source: AGRyM1sCyZF7OtQL/aYMuRcX0LPiqwXVSGTRopZfSLruJB2bgbAKbwYsx0H77kTE6PlcNa9vebPRypyRCkfXBLz1wWI=
X-Received: by 2002:a05:6402:d57:b0:43a:f611:fe40 with SMTP id
 ec23-20020a0564020d5700b0043af611fe40mr2094999edb.392.1657641593178; Tue, 12
 Jul 2022 08:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAMdBLPN183W-t5bNJvxGb=t0kL4QHFQNQ7O3LZAd_yXUOrSStA@mail.gmail.com>
 <C84A929A-CCFC-497E-96C8-8D5EC3DE9AFD@arm.com>
In-Reply-To: <C84A929A-CCFC-497E-96C8-8D5EC3DE9AFD@arm.com>
From: Brad Churchwell <brad@cachengo.com>
Date: Tue, 12 Jul 2022 10:59:41 -0500
Message-ID: <CAMdBLPP62J250=ZTAM=vMR-a0rD_AdFxnbP5WVtybDiLisEV9w@mail.gmail.com>
Subject: Re: Xen on rk3399
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Type: multipart/mixed; boundary="00000000000053c7ca05e39dc2f5"

--00000000000053c7ca05e39dc2f5
Content-Type: multipart/alternative; boundary="00000000000053c7c805e39dc2f3"

--00000000000053c7c805e39dc2f3
Content-Type: text/plain; charset="UTF-8"

Hi Bertrand,

Thanks so much for the quick response!

I should have mentioned previously that this device tree and kernel Image
(5.15.16) does boot properly with the rootfs without XEN. The interrupt
errors are only present when booting with XEN.

These are custom boards and they do have usb c, however we are unable to
boot from usb as it doesn't receive power.  We currently only use the usb
to flash u-boot to spi which requires us to use a separate power adapter.
These boards get power and networking through a custom backplane and
interface with the backplane via a sata style justice (I'm not sure what
the proper terminology would be here).

Since I cannot boot to rootfs with XEN, I'm unable to show the device tree
there. The only bit that I added to accommodate XEN is this bit here:

chosen {
    stdout-path = "serial2:1500000n8";
    bootargs = "hmp-unsafe=true";
    xen,dom0-bootargs = "console=hvc0 earlyprintk=xen clk_ignore_unused
root=/dev/nvme0n1p2 rw init=/sbin/init rootwait rootfstype=ext4
ignore_loglevel";
    modules {
        #address-cells = <2>;
        #size-cells = <2>;

        module@1 {
            compatible = "xen,linux-zimage", "xen,multiboot-module";
            reg = <0x0 0x03F80000 0x0 0x01aa8008>;
        };
        module@2 {
            compatible = "xen,linux-initrd", "xen,multiboot-module";
            reg = <0x0 0x06000000 0x0 0x02000000>;
        };
    };

};

The gic declaration is in the vanilla rk3399.dtsi file and hasn't been
modified:

        gic: interrupt-controller@fee00000 {
                compatible = "arm,gic-v3";
                #interrupt-cells = <4>;
                #address-cells = <2>;
                #size-cells = <2>;
                ranges;
                interrupt-controller;

                reg = <0x0 0xfee00000 0 0x10000>, /* GICD */
                      <0x0 0xfef00000 0 0xc0000>, /* GICR */
                      <0x0 0xfff00000 0 0x10000>, /* GICC */
                      <0x0 0xfff10000 0 0x10000>, /* GICH */
                      <0x0 0xfff20000 0 0x10000>; /* GICV */
                interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
                its: interrupt-controller@fee20000 {
                        compatible = "arm,gic-v3-its";
                        msi-controller;
                        #msi-cells = <1>;
                        reg = <0x0 0xfee20000 0x0 0x20000>;
                };

                ppi-partitions {
                        ppi_cluster0: interrupt-partition-0 {
                                affinity = <&cpu_l0 &cpu_l1 &cpu_l2
&cpu_l3>;
                        };

                        ppi_cluster1: interrupt-partition-1 {
                                affinity = <&cpu_b0 &cpu_b1>;
                        };
                };
        };

I've attached the device tree and include files just in case you'd like to
take a look at those.

Thanks so much for your help! I've been at this for weeks with very little
progress.

Cheers,
Brad


On Tue, Jul 12, 2022 at 10:05 AM Bertrand Marquis <Bertrand.Marquis@arm.com>
wrote:

> Hi Brad,
>
> > On 11 Jul 2022, at 19:38, Brad Churchwell <brad@cachengo.com> wrote:
> >
> > Hello,
> >
> > I've been trying to get Xen to boot dom0 with my kernel for weeks on an
> rk3399 based board and thought I'd reach out for help. It looks like either
> Xen is not properly recreating the device tree or the interrupt controller
> is just failing. The hypervisor boots but falls to initramfs because it
> cannot find the root device (nvme on pcie). Any help would be greatly
> appreciated. Here is the complete boot log
>
> From the logs you have an issue with the interrupt controller and the fact
> that your NVME is behind PCIE and as such depends on ITS is probably not
> helping.
>
> I would suggest to try to boot on usb as root fs for a try.
>
> Also it could be useful to compare the device tree on xen and without xen
> to understand what is going on (using /proc/device-tree).
>
> Xen seems to be ok but Linux is not happy with interrupts and is showing
> several issues around this area on your logs.
> Could you show us an extract of your device tree around the gic
> declaration ?
>
> Cheers
> Bertrand
>
>
> IMPORTANT NOTICE: The contents of this email and any attachments are
> confidential and may also be privileged. If you are not the intended
> recipient, please notify the sender immediately and do not disclose the
> contents to any other person, use it for any purpose, or store or copy the
> information in any medium. Thank you.
>

--00000000000053c7c805e39dc2f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Bertrand,<div><br></div><div>Thanks so much for the qui=
ck response!=C2=A0</div><div><br></div><div>I should have mentioned previou=
sly that this device tree and kernel Image (5.15.16) does boot properly wit=
h the rootfs without XEN. The interrupt errors are only present when bootin=
g with XEN.</div><div><br></div><div>These are custom boards and they do ha=
ve usb c, however we are unable to boot from usb as it doesn&#39;t receive =
power.=C2=A0 We currently only use the usb to flash u-boot to spi which req=
uires us to use a separate power adapter. These boards get power and networ=
king through a custom backplane and interface with the backplane via a sata=
 style justice (I&#39;m not sure what the proper terminology would be here)=
.=C2=A0</div><div><br></div><div>Since I cannot boot to rootfs with XEN, I&=
#39;m unable to show the device tree there. The only bit that I added to ac=
commodate=C2=A0XEN is this bit here:</div><div><br></div><div>chosen {<br>=
=C2=A0 =C2=A0 stdout-path =3D &quot;serial2:1500000n8&quot;;<br>=C2=A0 =C2=
=A0 bootargs =3D &quot;hmp-unsafe=3Dtrue&quot;;<br>=C2=A0 =C2=A0 xen,dom0-b=
ootargs =3D &quot;console=3Dhvc0 earlyprintk=3Dxen clk_ignore_unused root=
=3D/dev/nvme0n1p2 rw init=3D/sbin/init rootwait rootfstype=3Dext4 ignore_lo=
glevel&quot;;<br>=C2=A0 =C2=A0 modules {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 #ad=
dress-cells =3D &lt;2&gt;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 #size-cells =3D &=
lt;2&gt;;<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 module@1 {<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;xen,linux-zimage&quot;, &q=
uot;xen,multiboot-module&quot;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 reg =3D &lt;0x0 0x03F80000 0x0 0x01aa8008&gt;;<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 };<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 module@2 {<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;xen,linux-initrd&quot;, &quot;xe=
n,multiboot-module&quot;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =
=3D &lt;0x0 0x06000000 0x0 0x02000000&gt;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }=
;<br>=C2=A0 =C2=A0 };<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 <br>	};<br></div><div><br></div><div>The gic declaration is in the v=
anilla rk3399.dtsi file and hasn&#39;t been modified:</div><div><br></div><=
div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 gic: interrupt-controller@fee00000 {<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;a=
rm,gic-v3&quot;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 #interrupt-cells =3D &lt;4&gt;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 #address-cells =3D &lt;2&gt;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #size-cells =3D &lt;2&gt;;<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ranges;<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupt-controller;<br><br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x0 0xfee00000 0 =
0x10000&gt;, /* GICD */<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;0x0 0xfef00000 0 0xc0000&gt;, /* GICR */<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &lt;0x0 0xfff00000 0 0x10000&gt;, /* GICC */<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;0x0 0xfff10000 =
0 0x10000&gt;, /* GICH */<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;0x0 0xfff20000 0 0x10000&gt;; /* GICV *=
/<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupts =3D=
 &lt;GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0&gt;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 its: interrupt-controller@fee20000 {<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 compatible =3D &quot;arm,gic-v3-its&quot;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msi-controller;=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 #msi-cells =3D &lt;1&gt;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x0 0xfee2=
0000 0x0 0x20000&gt;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 };<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pp=
i-partitions {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ppi_cluster0: interrupt-partition-0 {<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 affinity =3D &lt;&amp;cpu_l0 &amp;cpu_l1 &a=
mp;cpu_l2 &amp;cpu_l3&gt;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ppi_cluster1: i=
nterrupt-partition-1 {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 affinity =3D=
 &lt;&amp;cpu_b0 &amp;cpu_b1&gt;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>=
</div><div><br></div><div>I&#39;ve attached the device tree and include fil=
es just in case you&#39;d like to take a look at those.</div><div><br></div=
><div>Thanks so much for your help! I&#39;ve been at this for weeks with ve=
ry little progress.</div><div><br></div><div>Cheers,</div><div>Brad<br></di=
v><div>=C2=A0<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Tue, Jul 12, 2022 at 10:05 AM Bertrand Marquis &l=
t;<a href=3D"mailto:Bertrand.Marquis@arm.com">Bertrand.Marquis@arm.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Br=
ad,<br>
<br>
&gt; On 11 Jul 2022, at 19:38, Brad Churchwell &lt;<a href=3D"mailto:brad@c=
achengo.com" target=3D"_blank">brad@cachengo.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello,<br>
&gt;<br>
&gt; I&#39;ve been trying to get Xen to boot dom0 with my kernel for weeks =
on an rk3399 based board and thought I&#39;d reach out for help. It looks l=
ike either Xen is not properly recreating the device tree or the interrupt =
controller is just failing. The hypervisor boots but falls to initramfs bec=
ause it cannot find the root device (nvme on pcie). Any help would be great=
ly appreciated. Here is the complete boot log<br>
<br>
From the logs you have an issue with the interrupt controller and the fact =
that your NVME is behind PCIE and as such depends on ITS is probably not he=
lping.<br>
<br>
I would suggest to try to boot on usb as root fs for a try.<br>
<br>
Also it could be useful to compare the device tree on xen and without xen t=
o understand what is going on (using /proc/device-tree).<br>
<br>
Xen seems to be ok but Linux is not happy with interrupts and is showing se=
veral issues around this area on your logs.<br>
Could you show us an extract of your device tree around the gic declaration=
 ?<br>
<br>
Cheers<br>
Bertrand<br>
<br>
<br>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.<br>
</blockquote></div>

--00000000000053c7c805e39dc2f3--
--00000000000053c7ca05e39dc2f5
Content-Type: audio/vnd.dts; name="rk3399-zaku.dts"
Content-Disposition: attachment; filename="rk3399-zaku.dts"
Content-Transfer-Encoding: base64
Content-ID: <f_l5iczs940>
X-Attachment-Id: f_l5iczs940

Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wKyBPUiBNSVQpCi8qCiAqIENvcHly
aWdodCAoYykgMjAxOCBMaW5hcm8gTHRkLgogKi8KCi9kdHMtdjEvOwojaW5jbHVkZSAicmszMzk5
LXpha3UuZHRzaSIKCi8gewoJbW9kZWwgPSAiVmFtcnMgUkszMzk5IFpBS1UiOwoJY29tcGF0aWJs
ZSA9ICJ2YW1ycyxyb2NrOTYwIiwgInJvY2tjaGlwLHJrMzM5OSI7CgoJY2hvc2VuIHsKCQlzdGRv
dXQtcGF0aCA9ICJzZXJpYWwyOjE1MDAwMDBuOCI7CgkJYm9vdGFyZ3MgPSAiaG1wLXVuc2FmZT10
cnVlIjsKICAgICAgICAgICAgICAgIHhlbixkb20wLWJvb3RhcmdzID0gImNvbnNvbGU9aHZjMCBl
YXJseXByaW50az14ZW4gY2xrX2lnbm9yZV91bnVzZWQgcm9vdD0vZGV2L252bWUwbjFwMiBydyBp
bml0PS9zYmluL2luaXQgcm9vdHdhaXQgcm9vdGZzdHlwZT1leHQ0IGlnbm9yZV9sb2dsZXZlbCI7
CgkJbW9kdWxlcyB7CgkJCSNhZGRyZXNzLWNlbGxzID0gPDI+OwoJCQkjc2l6ZS1jZWxscyA9IDwy
PjsKCgkJCW1vZHVsZUAxIHsKCQkJCWNvbXBhdGlibGUgPSAieGVuLGxpbnV4LXppbWFnZSIsICJ4
ZW4sbXVsdGlib290LW1vZHVsZSI7CgkJCQlyZWcgPSA8MHgwIDB4MDNGODAwMDAgMHgwIDB4MDFh
YTgwMDg+OwoJCQl9OwogICAgICAgICAgICAgICAgICAgICAgICBtb2R1bGVAMiB7CiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ4ZW4sbGludXgtaW5pdHJkIiwg
InhlbixtdWx0aWJvb3QtbW9kdWxlIjsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBy
ZWcgPSA8MHgwIDB4MDYwMDAwMDAgMHgwIDB4MDIwMDAwMDA+OwogICAgICAgICAgICAgICAgICAg
ICAgICB9OwogICAgICAgICAgICAgICAgfTsKICAgICAgICAgICAgICAgIAoJfTsKCQoJbGVkcyB7
CgkJY29tcGF0aWJsZSA9ICJncGlvLWxlZHMiOwoJCXN0YXR1cyA9ICJva2F5IjsKCgkJd29yay1s
ZWQgewoJCQlsYWJlbCA9ICJ6YWt1OndvcmsiOwoJCQlncGlvcyA9IDwmZ3BpbzQgUktfUEQ2IEdQ
SU9fQUNUSVZFX0hJR0g+OwoJCQlsaW51eCxkZWZhdWx0LXRyaWdnZXIgPSAiaGVhcnRiZWF0IjsK
CQkJZGVmYXVsdC1zdGF0ZSA9ICJvbiI7CgkJfTsKCX07CgoKfTsKCiZjcHVfYWxlcnQwIHsKCXRl
bXBlcmF0dXJlID0gPDY1MDAwPjsKfTsKCiZjcHVfdGhlcm1hbCB7CglzdXN0YWluYWJsZS1wb3dl
ciA9IDwxNTUwPjsKCgljb29saW5nLW1hcHMgewoJCW1hcDAgewoJCQl0cmlwID0gPCZjcHVfYWxl
cnQxPjsKCQl9OwoJfTsKfTsKCiZwY2llMCB7CgllcC1ncGlvcyA9IDwmZ3BpbzIgUktfUEQ0IEdQ
SU9fQUNUSVZFX0hJR0g+Owp9OwoKJnBpbmN0cmwgewoKCWdtYWMgewoJCXJnbWlpX3NsZWVwX3Bp
bnM6IHJnbWlpLXNsZWVwLXBpbnMgewoJCQlyb2NrY2hpcCxwaW5zID0KCQkJCTwzIFJLX1BCNyBS
S19GVU5DX0dQSU8gJnBjZmdfb3V0cHV0X2xvdz47CgkJfTsKCX07CgoJbGVkcyB7CgkJdXNlcl9s
ZWQxX3BpbjogdXNlci1sZWQxLXBpbiB7CgkJCXJvY2tjaGlwLHBpbnMgPQoJCQkJPDQgUktfUEMy
IFJLX0ZVTkNfR1BJTyAmcGNmZ19wdWxsX25vbmU+OwoJCX07CgoJCXVzZXJfbGVkMl9waW46IHVz
ZXItbGVkMi1waW4gewoJCQlyb2NrY2hpcCxwaW5zID0KCQkJCTw0IFJLX1BDNiBSS19GVU5DX0dQ
SU8gJnBjZmdfcHVsbF9ub25lPjsKCQl9OwoKCQl1c2VyX2xlZDNfcGluOiB1c2VyLWxlZDMtcGlu
IHsKCQkJcm9ja2NoaXAscGlucyA9CgkJCQk8NCBSS19QRDAgUktfRlVOQ19HUElPICZwY2ZnX3B1
bGxfbm9uZT47CgkJfTsKCgkJdXNlcl9sZWQ0X3BpbjogdXNlci1sZWQ0LXBpbiB7CgkJCXJvY2tj
aGlwLHBpbnMgPQoJCQkJPDQgUktfUEQ0IFJLX0ZVTkNfR1BJTyAmcGNmZ19wdWxsX25vbmU+OwoJ
CX07CgoJCXdsYW5fbGVkX3Bpbjogd2xhbi1sZWQtcGluIHsKCQkJcm9ja2NoaXAscGlucyA9CgkJ
CQk8NCBSS19QRDUgUktfRlVOQ19HUElPICZwY2ZnX3B1bGxfbm9uZT47CgkJfTsKCgkJYnRfbGVk
X3BpbjogYnQtbGVkLXBpbiB7CgkJCXJvY2tjaGlwLHBpbnMgPQoJCQkJPDQgUktfUEQ2IFJLX0ZV
TkNfR1BJTyAmcGNmZ19wdWxsX25vbmU+OwoJCX07Cgl9OwoKCXBjaWUgewoJCXBjaWVfZHJ2OiBw
Y2llLWRydiB7CgkJCXJvY2tjaGlwLHBpbnMgPQoJCQkJPDQgUktfUEMyIFJLX0ZVTkNfR1BJTyAm
cGNmZ19wdWxsX3VwXzIwbWE+OwoJCQl9OwoJfTsKCgl1c2IyIHsKCQlzYXRhX3B3cl9vbjogc2F0
YV9wd3Jfb24gewoJCQlyb2NrY2hpcCxwaW5zID0KCQkJCTw0IFJLX1BEMyBSS19GVU5DX0dQSU8g
JnBjZmdfcHVsbF9ub25lPjsKCQl9OwoJfTsKfTsKCiZ1c2JkcmRfZHdjM18wIHsKCWRyX21vZGUg
PSAib3RnIjsKfTsKCiZ1c2JkcmRfZHdjM18xIHsKCWRyX21vZGUgPSAiaG9zdCI7Cn07Ci8qIENo
YW5nZWQgUGluICovCiZ2Y2MzdjNfcGNpZSB7CglncGlvID0gPCZncGlvNCAxOCBHUElPX0FDVElW
RV9ISUdIPjsKfTsKLyogQ2hhbmdlZCBQaW4gYW5kIGxhYmVsICovCiZ2Y2M1djBfdXNiIHsKCWdw
aW8gPSA8JmdwaW80IDI3IEdQSU9fQUNUSVZFX0hJR0g+Owp9OwoK
--00000000000053c7ca05e39dc2f5
Content-Type: application/octet-stream; name="rk3399-zaku.dtsi"
Content-Disposition: attachment; filename="rk3399-zaku.dtsi"
Content-Transfer-Encoding: base64
Content-ID: <f_l5iczs9v2>
X-Attachment-Id: f_l5iczs9v2

Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wKyBPUiBNSVQpCi8qCiAqIENvcHly
aWdodCAoYykgMjAxOCBDb2xsYWJvcmEgTHRkLgogKiBDb3B5cmlnaHQgKGMpIDIwMTggRnV6aG91
IFJvY2tjaGlwIEVsZWN0cm9uaWNzIENvLiwgTHRkLgogKiBDb3B5cmlnaHQgKGMpIDIwMTggTGlu
YXJvIEx0ZC4KICovCgojaW5jbHVkZSAicmszMzk5LmR0c2kiCiNpbmNsdWRlICJyazMzOTktb3Bw
LmR0c2kiCgovIHsKCWFsaWFzZXMgewoJCW1tYzAgPSAmc2RpbzA7CgkJbW1jMSA9ICZzZG1tYzsK
CQltbWMyID0gJnNkaGNpOwoJfTsKCglzZGlvX3B3cnNlcTogc2Rpby1wd3JzZXEgewoJCXN0YXR1
cyA9ICJkaXNhYmxlZCI7CgkJY29tcGF0aWJsZSA9ICJtbWMtcHdyc2VxLXNpbXBsZSI7CgkJY2xv
Y2tzID0gPCZyazgwOCAxPjsKCQljbG9jay1uYW1lcyA9ICJleHRfY2xvY2siOwoJCXBpbmN0cmwt
bmFtZXMgPSAiZGVmYXVsdCI7CgkJcGluY3RybC0wID0gPCZ3aWZpX2VuYWJsZV9oPjsKCQlyZXNl
dC1ncGlvcyA9IDwmZ3BpbzAgUktfUEIyIEdQSU9fQUNUSVZFX0xPVz47Cgl9OwoKCXZjYzEydl9k
Y2luOiB2Y2MxMnYtZGNpbiB7CgkJY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOwoJCXJl
Z3VsYXRvci1uYW1lID0gInZjYzEydl9kY2luIjsKCQlyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9
IDwxMjAwMDAwMD47CgkJcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MTIwMDAwMDA+OwoJCXJl
Z3VsYXRvci1hbHdheXMtb247CgkJcmVndWxhdG9yLWJvb3Qtb247Cgl9OwoKCXZjYzF2OF9zMDog
dmNjMXY4LXMwIHsKCQljb21wYXRpYmxlID0gInJlZ3VsYXRvci1maXhlZCI7CgkJcmVndWxhdG9y
LW5hbWUgPSAidmNjMXY4X3MwIjsKCQlyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwxODAwMDAw
PjsKCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwxODAwMDAwPjsKCQlyZWd1bGF0b3ItYWx3
YXlzLW9uOwoJfTsKCgl2Y2M1djBfc3lzOiB2Y2M1djAtc3lzIHsKCQljb21wYXRpYmxlID0gInJl
Z3VsYXRvci1maXhlZCI7CgkJcmVndWxhdG9yLW5hbWUgPSAidmNjNXYwX3N5cyI7CgkJcmVndWxh
dG9yLW1pbi1taWNyb3ZvbHQgPSA8NTAwMDAwMD47CgkJcmVndWxhdG9yLW1heC1taWNyb3ZvbHQg
PSA8NTAwMDAwMD47CgkJcmVndWxhdG9yLWFsd2F5cy1vbjsKCQl2aW4tc3VwcGx5ID0gPCZ2Y2Mx
MnZfZGNpbj47Cgl9OwoKCWNsa2luX2dtYWM6IGV4dGVybmFsLWdtYWMtY2xvY2sgewoJCWNvbXBh
dGlibGUgPSAiZml4ZWQtY2xvY2siOwoJCWNsb2NrLWZyZXF1ZW5jeSA9IDwxMjUwMDAwMDA+OwoJ
CWNsb2NrLW91dHB1dC1uYW1lcyA9ICJjbGtpbl9nbWFjIjsKCQkjY2xvY2stY2VsbHMgPSA8MD47
Cgl9OwoKCXZjY19waHk6IHZjYy1waHktcmVndWxhdG9yIHsKCQljb21wYXRpYmxlID0gInJlZ3Vs
YXRvci1maXhlZCI7CgkJcmVndWxhdG9yLW5hbWUgPSAidmNjX3BoeSI7CgkJcmVndWxhdG9yLWFs
d2F5cy1vbjsKCQlyZWd1bGF0b3ItYm9vdC1vbjsKCX07CgoJdmNjM3YzX3N5czogdmNjM3YzLXN5
cyB7CgkJY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOwoJCXJlZ3VsYXRvci1uYW1lID0g
InZjYzN2M19zeXMiOwoJCXJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDMzMDAwMDA+OwoJCXJl
Z3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDMzMDAwMDA+OwoJCXJlZ3VsYXRvci1hbHdheXMtb247
CgkJdmluLXN1cHBseSA9IDwmdmNjNXYwX3N5cz47Cgl9OwoKCXZjYzN2M19wY2llOiB2Y2MzdjMt
cGNpZS1yZWd1bGF0b3IgewoJCWNvbXBhdGlibGUgPSAicmVndWxhdG9yLWZpeGVkIjsKCQllbmFi
bGUtYWN0aXZlLWhpZ2g7CgkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKCQlwaW5jdHJsLTAg
PSA8JnBjaWVfZHJ2PjsKCQlyZWd1bGF0b3ItYm9vdC1vbjsKCQlyZWd1bGF0b3ItbmFtZSA9ICJ2
Y2MzdjNfcGNpZSI7CgkJcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MzMwMDAwMD47CgkJcmVn
dWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MzMwMDAwMD47CgkJdmluLXN1cHBseSA9IDwmdmNjM3Yz
X3N5cz47Cgl9OwoKCXZjYzV2MF91c2I6IHZjYzV2MC11c2ItcmVndWxhdG9yIHsKCQljb21wYXRp
YmxlID0gInJlZ3VsYXRvci1maXhlZCI7CgkJZW5hYmxlLWFjdGl2ZS1oaWdoOwoJCXBpbmN0cmwt
bmFtZXMgPSAiZGVmYXVsdCI7CgkJcGluY3RybC0wID0gPCZzYXRhX3B3cl9vbj47CgkJcmVndWxh
dG9yLW5hbWUgPSAidmNjNXYwX3VzYiI7CgkJcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8NTAw
MDAwMD47CgkJcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8NTAwMDAwMD47CgkJcmVndWxhdG9y
LWFsd2F5cy1vbjsKCQl2aW4tc3VwcGx5ID0gPCZ2Y2M1djBfc3lzPjsKCX07CgoJdmNjXzB2OTog
dmNjLTB2OSB7CgkJY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOwoJCXJlZ3VsYXRvci1u
YW1lID0gInZjY18wdjkiOwoJCXJlZ3VsYXRvci1hbHdheXMtb247CgkJcmVndWxhdG9yLW1pbi1t
aWNyb3ZvbHQgPSA8OTAwMDAwPjsKCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDw5MDAwMDA+
OwoJCXZpbi1zdXBwbHkgPSA8JnZjYzN2M19zeXM+OwoJfTsKCgp9OwoKJmNwdV9sMCB7CgljcHUt
c3VwcGx5ID0gPCZ2ZGRfY3B1X2w+Owp9OwoKJmNwdV9sMSB7CgljcHUtc3VwcGx5ID0gPCZ2ZGRf
Y3B1X2w+Owp9OwoKJmNwdV9sMiB7CgljcHUtc3VwcGx5ID0gPCZ2ZGRfY3B1X2w+Owp9OwoKJmNw
dV9sMyB7CgljcHUtc3VwcGx5ID0gPCZ2ZGRfY3B1X2w+Owp9OwoKJmNwdV9iMCB7CgljcHUtc3Vw
cGx5ID0gPCZ2ZGRfY3B1X2I+Owp9OwoKJmNwdV9iMSB7CgljcHUtc3VwcGx5ID0gPCZ2ZGRfY3B1
X2I+Owp9OwoKJmVtbWNfcGh5IHsKCXN0YXR1cyA9ICJva2F5IjsKfTsKCiZnbWFjIHsKCXBoeS1z
dXBwbHkgPSA8JnZjY19waHk+OwoJcGh5LW1vZGUgPSAicmdtaWkiOwoJY2xvY2tfaW5fb3V0ID0g
ImlucHV0IjsKCXNucHMscmVzZXQtZ3BpbyA9IDwmZ3BpbzMgMTUgR1BJT19BQ1RJVkVfTE9XPjsK
CXNucHMscmVzZXQtYWN0aXZlLWxvdzsKCXNucHMscmVzZXQtZGVsYXlzLXVzID0gPDAgMTAwMDAg
NTAwMDA+OwoJYXNzaWduZWQtY2xvY2tzID0gPCZjcnUgU0NMS19STUlJX1NSQz47Cglhc3NpZ25l
ZC1jbG9jay1wYXJlbnRzID0gPCZjbGtpbl9nbWFjPjsKCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVs
dCIsICJzbGVlcCI7CglwaW5jdHJsLTAgPSA8JnJnbWlpX3BpbnM+OwoJcGluY3RybC0xID0gPCZy
Z21paV9zbGVlcF9waW5zPjsKCXR4X2RlbGF5ID0gPDB4Mjg+OwoJcnhfZGVsYXkgPSA8MHgxMT47
CglzdGF0dXMgPSAib2theSI7Cn07CgomZ3B1IHsKCW1hbGktc3VwcGx5ID0gPCZ2ZGRfZ3B1PjsK
CXN0YXR1cyA9ICJva2F5IjsKfTsKCiZoZG1pIHsKCWRkYy1pMmMtYnVzID0gPCZpMmMzPjsKCXBp
bmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CglwaW5jdHJsLTAgPSA8JmhkbWlfY2VjPjsKCXN0YXR1
cyA9ICJva2F5IjsKfTsKCiZoZG1pX3NvdW5kIHsKCXN0YXR1cyA9ICJva2F5IjsKfTsKCiZpMmMw
IHsKCWNsb2NrLWZyZXF1ZW5jeSA9IDw0MDAwMDA+OwoJaTJjLXNjbC1yaXNpbmctdGltZS1ucyA9
IDwxNjg+OwoJaTJjLXNjbC1mYWxsaW5nLXRpbWUtbnMgPSA8ND47CglzdGF0dXMgPSAib2theSI7
CgoJdmRkX2NwdV9iOiByZWd1bGF0b3JANDAgewoJCWNvbXBhdGlibGUgPSAic2lsZXJneSxzeXI4
MjciOwoJCXJlZyA9IDwweDQwPjsKCQlmY3Msc3VzcGVuZC12b2x0YWdlLXNlbGVjdG9yID0gPDE+
OwoJCXJlZ3VsYXRvci1uYW1lID0gInZkZF9jcHVfYiI7CgkJcmVndWxhdG9yLW1pbi1taWNyb3Zv
bHQgPSA8NzEyNTAwPjsKCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwxNTAwMDAwPjsKCQly
ZWd1bGF0b3ItcmFtcC1kZWxheSA9IDwxMDAwPjsKCQlyZWd1bGF0b3ItYWx3YXlzLW9uOwoJCXJl
Z3VsYXRvci1ib290LW9uOwoJCXZpbi1zdXBwbHkgPSA8JnZjYzV2MF9zeXM+OwoJCXN0YXR1cyA9
ICJva2F5IjsKCgkJcmVndWxhdG9yLXN0YXRlLW1lbSB7CgkJCXJlZ3VsYXRvci1vZmYtaW4tc3Vz
cGVuZDsKCQl9OwoJfTsKCgl2ZGRfZ3B1OiByZWd1bGF0b3JANDEgewoJCWNvbXBhdGlibGUgPSAi
c2lsZXJneSxzeXI4MjgiOwoJCXJlZyA9IDwweDQxPjsKCQlmY3Msc3VzcGVuZC12b2x0YWdlLXNl
bGVjdG9yID0gPDE+OwoJCXJlZ3VsYXRvci1uYW1lID0gInZkZF9ncHUiOwoJCXJlZ3VsYXRvci1t
aW4tbWljcm92b2x0ID0gPDcxMjUwMD47CgkJcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MTUw
MDAwMD47CgkJcmVndWxhdG9yLXJhbXAtZGVsYXkgPSA8MTAwMD47CgkJcmVndWxhdG9yLWFsd2F5
cy1vbjsKCQlyZWd1bGF0b3ItYm9vdC1vbjsKCQl2aW4tc3VwcGx5ID0gPCZ2Y2M1djBfc3lzPjsK
CQlyZWd1bGF0b3Itc3RhdGUtbWVtIHsKCQkJcmVndWxhdG9yLW9mZi1pbi1zdXNwZW5kOwoJCX07
Cgl9OwoKCXJrODA4OiBwbWljQDFiIHsKCQljb21wYXRpYmxlID0gInJvY2tjaGlwLHJrODA4IjsK
CQlyZWcgPSA8MHgxYj47CgkJaW50ZXJydXB0LXBhcmVudCA9IDwmZ3BpbzE+OwoJCWludGVycnVw
dHMgPSA8MjEgSVJRX1RZUEVfTEVWRUxfTE9XPjsKCQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQi
OwoJCXBpbmN0cmwtMCA9IDwmcG1pY19pbnRfbD47CgkJcm9ja2NoaXAsc3lzdGVtLXBvd2VyLWNv
bnRyb2xsZXI7CgkJd2FrZXVwLXNvdXJjZTsKCQkjY2xvY2stY2VsbHMgPSA8MT47CgkJY2xvY2st
b3V0cHV0LW5hbWVzID0gInhpbjMyayIsICJyazgwOC1jbGtvdXQyIjsKCgkJdmNjMS1zdXBwbHkg
PSA8JnZjYzV2MF9zeXM+OwoJCXZjYzItc3VwcGx5ID0gPCZ2Y2M1djBfc3lzPjsKCQl2Y2MzLXN1
cHBseSA9IDwmdmNjNXYwX3N5cz47CgkJdmNjNC1zdXBwbHkgPSA8JnZjYzV2MF9zeXM+OwoJCXZj
YzYtc3VwcGx5ID0gPCZ2Y2M1djBfc3lzPjsKCQl2Y2M3LXN1cHBseSA9IDwmdmNjNXYwX3N5cz47
CgkJdmNjOC1zdXBwbHkgPSA8JnZjYzN2M19zeXM+OwoJCXZjYzktc3VwcGx5ID0gPCZ2Y2M1djBf
c3lzPjsKCQl2Y2MxMC1zdXBwbHkgPSA8JnZjYzV2MF9zeXM+OwoJCXZjYzExLXN1cHBseSA9IDwm
dmNjNXYwX3N5cz47CgkJdmNjMTItc3VwcGx5ID0gPCZ2Y2MzdjNfc3lzPjsKCQl2ZGRpby1zdXBw
bHkgPSA8JnZjY18xdjg+OwoKCQlyZWd1bGF0b3JzIHsKCQkJdmRkX2NlbnRlcjogRENEQ19SRUcx
IHsKCQkJCXJlZ3VsYXRvci1uYW1lID0gInZkZF9jZW50ZXIiOwoJCQkJcmVndWxhdG9yLW1pbi1t
aWNyb3ZvbHQgPSA8NzUwMDAwPjsKCQkJCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDEzNTAw
MDA+OwoJCQkJcmVndWxhdG9yLWFsd2F5cy1vbjsKCQkJCXJlZ3VsYXRvci1ib290LW9uOwoJCQkJ
cmVndWxhdG9yLXN0YXRlLW1lbSB7CgkJCQkJcmVndWxhdG9yLW9mZi1pbi1zdXNwZW5kOwoJCQkJ
fTsKCQkJfTsKCgkJCXZkZF9jcHVfbDogRENEQ19SRUcyIHsKCQkJCXJlZ3VsYXRvci1uYW1lID0g
InZkZF9jcHVfbCI7CgkJCQlyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDw3NTAwMDA+OwoJCQkJ
cmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MTM1MDAwMD47CgkJCQlyZWd1bGF0b3ItYWx3YXlz
LW9uOwoJCQkJcmVndWxhdG9yLWJvb3Qtb247CgkJCQlyZWd1bGF0b3Itc3RhdGUtbWVtIHsKCQkJ
CQlyZWd1bGF0b3Itb2ZmLWluLXN1c3BlbmQ7CgkJCQl9OwoJCQl9OwoKCQkJdmNjX2RkcjogRENE
Q19SRUczIHsKCQkJCXJlZ3VsYXRvci1uYW1lID0gInZjY19kZHIiOwoJCQkJcmVndWxhdG9yLWFs
d2F5cy1vbjsKCQkJCXJlZ3VsYXRvci1ib290LW9uOwoJCQkJcmVndWxhdG9yLXN0YXRlLW1lbSB7
CgkJCQkJcmVndWxhdG9yLW9uLWluLXN1c3BlbmQ7CgkJCQl9OwoJCQl9OwoKCQkJdmNjXzF2ODog
RENEQ19SRUc0IHsKCQkJCXJlZ3VsYXRvci1uYW1lID0gInZjY18xdjgiOwoJCQkJcmVndWxhdG9y
LW1pbi1taWNyb3ZvbHQgPSA8MTgwMDAwMD47CgkJCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9
IDwxODAwMDAwPjsKCQkJCXJlZ3VsYXRvci1hbHdheXMtb247CgkJCQlyZWd1bGF0b3ItYm9vdC1v
bjsKCQkJCXJlZ3VsYXRvci1zdGF0ZS1tZW0gewoJCQkJCXJlZ3VsYXRvci1vbi1pbi1zdXNwZW5k
OwoJCQkJCXJlZ3VsYXRvci1zdXNwZW5kLW1pY3Jvdm9sdCA9IDwxODAwMDAwPjsKCQkJCX07CgkJ
CX07CgoJCQl2Y2MxdjhfZHZwOiBMRE9fUkVHMSB7CgkJCQlyZWd1bGF0b3ItbmFtZSA9ICJ2Y2Mx
djhfZHZwIjsKCQkJCXJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDE4MDAwMDA+OwoJCQkJcmVn
dWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MTgwMDAwMD47CgkJCQlyZWd1bGF0b3ItYWx3YXlzLW9u
OwoJCQkJcmVndWxhdG9yLWJvb3Qtb247CgkJCQlyZWd1bGF0b3Itc3RhdGUtbWVtIHsKCQkJCQly
ZWd1bGF0b3Itb24taW4tc3VzcGVuZDsKCQkJCQlyZWd1bGF0b3Itc3VzcGVuZC1taWNyb3ZvbHQg
PSA8MTgwMDAwMD47CgkJCQl9OwoJCQl9OwoKCQkJdmNjYTF2OF9oZG1pOiBMRE9fUkVHMiB7CgkJ
CQlyZWd1bGF0b3ItbmFtZSA9ICJ2Y2NhMXY4X2hkbWkiOwoJCQkJcmVndWxhdG9yLW1pbi1taWNy
b3ZvbHQgPSA8MTgwMDAwMD47CgkJCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwxODAwMDAw
PjsKCQkJCXJlZ3VsYXRvci1hbHdheXMtb247CgkJCQlyZWd1bGF0b3ItYm9vdC1vbjsKCQkJCXJl
Z3VsYXRvci1zdGF0ZS1tZW0gewoJCQkJCXJlZ3VsYXRvci1vbi1pbi1zdXNwZW5kOwoJCQkJCXJl
Z3VsYXRvci1zdXNwZW5kLW1pY3Jvdm9sdCA9IDwxODAwMDAwPjsKCQkJCX07CgkJCX07CgoJCQl2
Y2NhXzF2ODogTERPX1JFRzMgewoJCQkJcmVndWxhdG9yLW5hbWUgPSAidmNjYV8xdjgiOwoJCQkJ
cmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MTgwMDAwMD47CgkJCQlyZWd1bGF0b3ItbWF4LW1p
Y3Jvdm9sdCA9IDwxODAwMDAwPjsKCQkJCXJlZ3VsYXRvci1hbHdheXMtb247CgkJCQlyZWd1bGF0
b3ItYm9vdC1vbjsKCQkJCXJlZ3VsYXRvci1zdGF0ZS1tZW0gewoJCQkJCXJlZ3VsYXRvci1vbi1p
bi1zdXNwZW5kOwoJCQkJCXJlZ3VsYXRvci1zdXNwZW5kLW1pY3Jvdm9sdCA9IDwxODAwMDAwPjsK
CQkJCX07CgkJCX07CgoJCQl2Y2Nfc2Q6IExET19SRUc0IHsKCQkJCXJlZ3VsYXRvci1uYW1lID0g
InZjY19zZCI7CgkJCQlyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwxODAwMDAwPjsKCQkJCXJl
Z3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDMzMDAwMDA+OwoJCQkJcmVndWxhdG9yLWFsd2F5cy1v
bjsKCQkJCXJlZ3VsYXRvci1ib290LW9uOwoJCQkJcmVndWxhdG9yLXN0YXRlLW1lbSB7CgkJCQkJ
cmVndWxhdG9yLW9uLWluLXN1c3BlbmQ7CgkJCQkJcmVndWxhdG9yLXN1c3BlbmQtbWljcm92b2x0
ID0gPDMzMDAwMDA+OwoJCQkJfTsKCQkJfTsKCgkJCXZjYzN2MF9zZDogTERPX1JFRzUgewoJCQkJ
cmVndWxhdG9yLW5hbWUgPSAidmNjM3YwX3NkIjsKCQkJCXJlZ3VsYXRvci1taW4tbWljcm92b2x0
ID0gPDMwMDAwMDA+OwoJCQkJcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MzAwMDAwMD47CgkJ
CQlyZWd1bGF0b3ItYWx3YXlzLW9uOwoJCQkJcmVndWxhdG9yLWJvb3Qtb247CgkJCQlyZWd1bGF0
b3Itc3RhdGUtbWVtIHsKCQkJCQlyZWd1bGF0b3Itb24taW4tc3VzcGVuZDsKCQkJCQlyZWd1bGF0
b3Itc3VzcGVuZC1taWNyb3ZvbHQgPSA8MzAwMDAwMD47CgkJCQl9OwoJCQl9OwoKCQkJdmNjXzF2
NTogTERPX1JFRzYgewoJCQkJcmVndWxhdG9yLW5hbWUgPSAidmNjXzF2NSI7CgkJCQlyZWd1bGF0
b3ItbWluLW1pY3Jvdm9sdCA9IDwxNTAwMDAwPjsKCQkJCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0
ID0gPDE1MDAwMDA+OwoJCQkJcmVndWxhdG9yLWFsd2F5cy1vbjsKCQkJCXJlZ3VsYXRvci1ib290
LW9uOwoJCQkJcmVndWxhdG9yLXN0YXRlLW1lbSB7CgkJCQkJcmVndWxhdG9yLW9uLWluLXN1c3Bl
bmQ7CgkJCQkJcmVndWxhdG9yLXN1c3BlbmQtbWljcm92b2x0ID0gPDE1MDAwMDA+OwoJCQkJfTsK
CQkJfTsKCgkJCXZjY2EwdjlfaGRtaTogTERPX1JFRzcgewoJCQkJcmVndWxhdG9yLW5hbWUgPSAi
dmNjYTB2OV9oZG1pIjsKCQkJCXJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDkwMDAwMD47CgkJ
CQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDw5MDAwMDA+OwoJCQkJcmVndWxhdG9yLWFsd2F5
cy1vbjsKCQkJCXJlZ3VsYXRvci1ib290LW9uOwoJCQkJcmVndWxhdG9yLXN0YXRlLW1lbSB7CgkJ
CQkJcmVndWxhdG9yLW9uLWluLXN1c3BlbmQ7CgkJCQkJcmVndWxhdG9yLXN1c3BlbmQtbWljcm92
b2x0ID0gPDkwMDAwMD47CgkJCQl9OwoJCQl9OwoKCQkJdmNjXzN2MDogTERPX1JFRzggewoJCQkJ
cmVndWxhdG9yLW5hbWUgPSAidmNjXzN2MCI7CgkJCQlyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9
IDwzMDAwMDAwPjsKCQkJCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDMwMDAwMDA+OwoJCQkJ
cmVndWxhdG9yLWFsd2F5cy1vbjsKCQkJCXJlZ3VsYXRvci1ib290LW9uOwoJCQkJcmVndWxhdG9y
LXN0YXRlLW1lbSB7CgkJCQkJcmVndWxhdG9yLW9uLWluLXN1c3BlbmQ7CgkJCQkJcmVndWxhdG9y
LXN1c3BlbmQtbWljcm92b2x0ID0gPDMwMDAwMDA+OwoJCQkJfTsKCQkJfTsKCgkJCXZjYzN2M19z
MzogU1dJVENIX1JFRzEgewoJCQkJcmVndWxhdG9yLW5hbWUgPSAidmNjM3YzX3MzIjsKCQkJCXJl
Z3VsYXRvci1hbHdheXMtb247CgkJCQlyZWd1bGF0b3ItYm9vdC1vbjsKCQkJCXJlZ3VsYXRvci1z
dGF0ZS1tZW0gewoJCQkJCXJlZ3VsYXRvci1vbi1pbi1zdXNwZW5kOwoJCQkJfTsKCQkJfTsKCgkJ
CXZjYzN2M19zMDogU1dJVENIX1JFRzIgewoJCQkJcmVndWxhdG9yLW5hbWUgPSAidmNjM3YzX3Mw
IjsKCQkJCXJlZ3VsYXRvci1hbHdheXMtb247CgkJCQlyZWd1bGF0b3ItYm9vdC1vbjsKCQkJCXJl
Z3VsYXRvci1zdGF0ZS1tZW0gewoJCQkJCXJlZ3VsYXRvci1vbi1pbi1zdXNwZW5kOwoJCQkJfTsK
CQkJfTsKCQl9OwoJfTsKfTsKCiZpMmMxIHsKCXN0YXR1cyA9ICJva2F5IjsKfTsKCiZpMmMyIHsK
CXN0YXR1cyA9ICJva2F5IjsKfTsKCiZpMmMzIHsKCXN0YXR1cyA9ICJva2F5IjsKfTsKCiZpMmM0
IHsKCXN0YXR1cyA9ICJva2F5IjsKfTsKCiZpMnMyIHsKICAgICAgICBzdGF0dXMgPSAib2theSI7
Cn07CgomaW9fZG9tYWlucyB7CglidDY1Ni1zdXBwbHkgPSA8JnZjYzF2OF9zMD47IC8qIGJ0NjU2
X2dwaW8yYWJfbXMgKi8KCWF1ZGlvLXN1cHBseSA9IDwmdmNjMXY4X3MwPjsgLyogYXVkaW9fZ3Bp
bzNkNGFfbXMgKi8KCXNkbW1jLXN1cHBseSA9IDwmdmNjX3NkPjsgLyogc2RtbWNfZ3BpbzRiX21z
ICovCglncGlvMTgzMC1zdXBwbHkgPSA8JnZjY18zdjA+OyAvKiBncGlvMTgzM19ncGlvNGNkX21z
ICovCglzdGF0dXMgPSAib2theSI7Cn07CgomcGNpZV9waHkgewoJc3RhdHVzID0gIm9rYXkiOwp9
OwoKJnBjaWUwIHsKCW51bS1sYW5lcyA9IDw0PjsKCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7
CglwaW5jdHJsLTAgPSA8JnBjaWVfY2xrcmVxbl9jcG0+OwoJdnBjaWUwdjktc3VwcGx5ID0gPCZ2
Y2NfMHY5PjsKCXZwY2llMXY4LXN1cHBseSA9IDwmdmNjYV8xdjg+OwoJdnBjaWUzdjMtc3VwcGx5
ID0gPCZ2Y2MzdjNfcGNpZT47CglzdGF0dXMgPSAib2theSI7Cn07CgomcG11X2lvX2RvbWFpbnMg
ewoJcG11MTgzMC1zdXBwbHkgPSA8JnZjY18xdjg+OwoJc3RhdHVzID0gIm9rYXkiOwp9OwoKJnBp
bmN0cmwgewoJYnQgewoJCWJ0X2VuYWJsZV9oOiBidC1lbmFibGUtaCB7CgkJCXJvY2tjaGlwLHBp
bnMgPSA8MCBSS19QQjEgUktfRlVOQ19HUElPICZwY2ZnX3B1bGxfbm9uZT47CgkJfTsKCgkJYnRf
aG9zdF93YWtlX2w6IGJ0LWhvc3Qtd2FrZS1sIHsKCQkJcm9ja2NoaXAscGlucyA9IDwwIFJLX1BB
NCBSS19GVU5DX0dQSU8gJnBjZmdfcHVsbF9ub25lPjsKCQl9OwoKCQlidF93YWtlX2w6IGJ0LXdh
a2UtbCB7CgkJCXJvY2tjaGlwLHBpbnMgPSA8MiBSS19QRDMgUktfRlVOQ19HUElPICZwY2ZnX3B1
bGxfbm9uZT47CgkJfTsKCX07CgoJc2RtbWMgewoJCXNkbW1jX2J1czE6IHNkbW1jLWJ1czEgewoJ
CQlyb2NrY2hpcCxwaW5zID0KCQkJCTw0IFJLX1BCMCAxICZwY2ZnX3B1bGxfdXBfOG1hPjsKCQl9
OwoKCQlzZG1tY19idXM0OiBzZG1tYy1idXM0IHsKCQkJcm9ja2NoaXAscGlucyA9CgkJCQk8NCBS
S19QQjAgMSAmcGNmZ19wdWxsX3VwXzhtYT4sCgkJCQk8NCBSS19QQjEgMSAmcGNmZ19wdWxsX3Vw
XzhtYT4sCgkJCQk8NCBSS19QQjIgMSAmcGNmZ19wdWxsX3VwXzhtYT4sCgkJCQk8NCBSS19QQjMg
MSAmcGNmZ19wdWxsX3VwXzhtYT47CgkJfTsKCgkJc2RtbWNfY2xrOiBzZG1tYy1jbGsgewoJCQly
b2NrY2hpcCxwaW5zID0KCQkJCTw0IFJLX1BCNCAxICZwY2ZnX3B1bGxfbm9uZV8xOG1hPjsKCQl9
OwoKCQlzZG1tY19jbWQ6IHNkbW1jLWNtZCB7CgkJCXJvY2tjaGlwLHBpbnMgPQoJCQkJPDQgUktf
UEI1IDEgJnBjZmdfcHVsbF91cF84bWE+OwoJCX07Cgl9OwoKCXNkaW8wIHsKCQlzZGlvMF9idXM0
OiBzZGlvMC1idXM0IHsKCQkJcm9ja2NoaXAscGlucyA9CgkJCQk8MiBSS19QQzQgMSAmcGNmZ19w
dWxsX3VwXzIwbWE+LAoJCQkJPDIgUktfUEM1IDEgJnBjZmdfcHVsbF91cF8yMG1hPiwKCQkJCTwy
IFJLX1BDNiAxICZwY2ZnX3B1bGxfdXBfMjBtYT4sCgkJCQk8MiBSS19QQzcgMSAmcGNmZ19wdWxs
X3VwXzIwbWE+OwoJCX07CgoJCXNkaW8wX2NtZDogc2RpbzAtY21kIHsKCQkJcm9ja2NoaXAscGlu
cyA9CgkJCQk8MiBSS19QRDAgMSAmcGNmZ19wdWxsX3VwXzIwbWE+OwoJCX07CgoJCXNkaW8wX2Ns
azogc2RpbzAtY2xrIHsKCQkJcm9ja2NoaXAscGlucyA9CgkJCQk8MiBSS19QRDEgMSAmcGNmZ19w
dWxsX25vbmVfMjBtYT47CgkJfTsKCX07CgoJcG1pYyB7CgkJcG1pY19pbnRfbDogcG1pYy1pbnQt
bCB7CgkJCXJvY2tjaGlwLHBpbnMgPQoJCQkJPDEgUktfUEM1IFJLX0ZVTkNfR1BJTyAmcGNmZ19w
dWxsX3VwPjsKCQl9OwoKCQl2c2VsMV9waW46IHZzZWwxLXBpbiB7CgkJCXJvY2tjaGlwLHBpbnMg
PQoJCQkJPDEgUktfUEMxIFJLX0ZVTkNfR1BJTyAmcGNmZ19wdWxsX2Rvd24+OwoJCX07CgoJCXZz
ZWwyX3BpbjogdnNlbDItcGluIHsKCQkJcm9ja2NoaXAscGlucyA9CgkJCQk8MSBSS19QQjYgUktf
RlVOQ19HUElPICZwY2ZnX3B1bGxfZG93bj47CgkJfTsKCX07CgoJc2Rpby1wd3JzZXEgewoJCXdp
ZmlfZW5hYmxlX2g6IHdpZmktZW5hYmxlLWggewoJCQlyb2NrY2hpcCxwaW5zID0KCQkJCTwwIFJL
X1BCMiBSS19GVU5DX0dQSU8gJnBjZmdfcHVsbF9ub25lPjsKCQl9OwoJfTsKCgl3aWZpIHsKCQl3
aWZpX2hvc3Rfd2FrZV9sOiB3aWZpLWhvc3Qtd2FrZS1sIHsKCQkJcm9ja2NoaXAscGlucyA9IDww
IFJLX1BBMyBSS19GVU5DX0dQSU8gJnBjZmdfcHVsbF9ub25lPjsKCQl9OwoJfTsKCQoJa2V5IHsK
CQlwd3JidG46IHB3cmJ0biB7CgkJCXJvY2tjaGlwLHBpbnMgPSA8MCBSS19QQjEgUktfRlVOQ19H
UElPICZwY2ZnX3B1bGxfdXA+OwoJCX07Cgl9Owp9OwoKJnB3bTIgewoJc3RhdHVzID0gIm9rYXki
Owp9OwoKJnB3bTMgewoJc3RhdHVzID0gIm9rYXkiOwp9OwoKJnNkaW8wIHsKCWJ1cy13aWR0aCA9
IDw0PjsKCWNsb2NrLWZyZXF1ZW5jeSA9IDw1MDAwMDAwMD47CgljYXAtc2Rpby1pcnE7CgljYXAt
c2QtaGlnaHNwZWVkOwoJa2VlcC1wb3dlci1pbi1zdXNwZW5kOwoJbW1jLXB3cnNlcSA9IDwmc2Rp
b19wd3JzZXE+OwoJbm9uLXJlbW92YWJsZTsKCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cglw
aW5jdHJsLTAgPSA8JnNkaW8wX2J1czQgJnNkaW8wX2NtZCAmc2RpbzBfY2xrPjsKCXNkLXVocy1z
ZHIxMDQ7CgkjYWRkcmVzcy1jZWxscyA9IDwxPjsKCSNzaXplLWNlbGxzID0gPDA+OwoJc3RhdHVz
ID0gIm9rYXkiOwoKCWJyY21mOiB3aWZpQDEgewoJCWNvbXBhdGlibGUgPSAiYnJjbSxiY200MzI5
LWZtYWMiOwoJCXJlZyA9IDwxPjsKCQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZncGlvMD47CgkJaW50
ZXJydXB0cyA9IDxSS19QQTMgR1BJT19BQ1RJVkVfSElHSD47CgkJaW50ZXJydXB0LW5hbWVzID0g
Imhvc3Qtd2FrZSI7CgkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKCQlwaW5jdHJsLTAgPSA8
JndpZmlfaG9zdF93YWtlX2w+OwoJfTsKfTsKCiZzZGhjaSB7CglidXMtd2lkdGggPSA8OD47Cglt
bWMtaHM0MDAtMV84djsKCW1tYy1oczQwMC1lbmhhbmNlZC1zdHJvYmU7Cglub24tcmVtb3ZhYmxl
OwoJc3RhdHVzID0gIm9rYXkiOwp9OwoKJnNkbW1jIHsKCWJ1cy13aWR0aCA9IDw0PjsKCWNhcC1t
bWMtaGlnaHNwZWVkOwoJY2FwLXNkLWhpZ2hzcGVlZDsKCWNsb2NrLWZyZXF1ZW5jeSA9IDwxMDAw
MDAwMDA+OwoJbWF4LWZyZXF1ZW5jeSA9IDwxMDAwMDAwMDA+OwoJY2QtZ3Bpb3MgPSA8JmdwaW8w
IDcgR1BJT19BQ1RJVkVfTE9XPjsKCWRpc2FibGUtd3A7CglzZC11aHMtc2RyMTA0OwoJdnFtbWMt
c3VwcGx5ID0gPCZ2Y2Nfc2Q+OwoJY2FyZC1kZXRlY3QtZGVsYXkgPSA8ODAwPjsKCXBpbmN0cmwt
bmFtZXMgPSAiZGVmYXVsdCI7CglwaW5jdHJsLTAgPSA8JnNkbW1jX2NsayAmc2RtbWNfY21kICZz
ZG1tY19jZCAmc2RtbWNfYnVzND47CglzdGF0dXMgPSAiZGlzYWJsZWQiOwp9OwoKJnRzYWRjIHsK
CXJvY2tjaGlwLGh3LXRzaHV0LW1vZGUgPSA8MT47Cglyb2NrY2hpcCxody10c2h1dC1wb2xhcml0
eSA9IDwxPjsKCXJvY2tjaGlwLGh3LXRzaHV0LXRlbXAgPSA8MTEwMDAwPjsKCXN0YXR1cyA9ICJv
a2F5IjsKfTsKCiZ1YXJ0MCB7CglwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwoJcGluY3RybC0w
ID0gPCZ1YXJ0MF94ZmVyICZ1YXJ0MF9jdHMgJnVhcnQwX3J0cz47CglzdGF0dXMgPSAiZGlzYWJs
ZWQiOwoKCWJsdWV0b290aCB7CgkJY29tcGF0aWJsZSA9ICJicmNtLGJjbTQzNDM4LWJ0IjsKCQlj
bG9ja3MgPSA8JnJrODA4IDE+OwoJCWNsb2NrLW5hbWVzID0gImV4dF9jbG9jayI7CgkJZGV2aWNl
LXdha2V1cC1ncGlvcyA9IDwmZ3BpbzIgUktfUEQzIEdQSU9fQUNUSVZFX0hJR0g+OwoJCWhvc3Qt
d2FrZXVwLWdwaW9zID0gPCZncGlvMCBSS19QQTQgR1BJT19BQ1RJVkVfSElHSD47CgkJc2h1dGRv
d24tZ3Bpb3MgPSA8JmdwaW8wIFJLX1BCMSBHUElPX0FDVElWRV9ISUdIPjsKCQlwaW5jdHJsLW5h
bWVzID0gImRlZmF1bHQiOwoJCXBpbmN0cmwtMCA9IDwmYnRfaG9zdF93YWtlX2wgJmJ0X3dha2Vf
bCAmYnRfZW5hYmxlX2g+OwoJfTsKfTsKCiZ1YXJ0MiB7CglzdGF0dXMgPSAib2theSI7Cn07Cgom
dGNwaHkwIHsKCXN0YXR1cyA9ICJva2F5IjsKfTsKCiZ0Y3BoeTEgewoJc3RhdHVzID0gIm9rYXki
Owp9OwoKJnUycGh5MCB7CglzdGF0dXMgPSAib2theSI7CgllbmFibGUtYWN0aXZlLWhpZ2g7Cgkv
KiBvdGctdmJ1cy1ncGlvcyA9IDwmZ3BpbzEgMyBHUElPX0FDVElWRV9ISUdIPjsqLwoJZ3BpbyA9
IDwmZ3BpbzEgMyBHUElPX0FDVElWRV9ISUdIPjsKfTsKCiZ1MnBoeTEgewoJc3RhdHVzID0gIm9r
YXkiOwp9OwoKJnUycGh5MF9ob3N0IHsKCXBoeS1zdXBwbHkgPSA8JnZjYzV2MF91c2I+OwoJc3Rh
dHVzID0gIm9rYXkiOwp9OwoKJnUycGh5MV9ob3N0IHsKCXBoeS1zdXBwbHkgPSA8JnZjYzV2MF91
c2I+OwoJc3RhdHVzID0gIm9rYXkiOwp9OwoKJnUycGh5MF9vdGcgewoJc3RhdHVzID0gIm9rYXki
Owp9OwoKJnUycGh5MV9vdGcgewoJc3RhdHVzID0gIm9rYXkiOwp9OwoKJnVzYl9ob3N0MF9laGNp
IHsKCXN0YXR1cyA9ICJva2F5IjsKfTsKCiZ1c2JfaG9zdDBfb2hjaSB7CglzdGF0dXMgPSAib2th
eSI7Cn07CgomdXNiX2hvc3QxX2VoY2kgewoJc3RhdHVzID0gIm9rYXkiOwp9OwoKJnVzYl9ob3N0
MV9vaGNpIHsKCXN0YXR1cyA9ICJva2F5IjsKfTsKCiZ1c2JkcmQzXzAgewoJZXh0Y29uID0gPCZ1
MnBoeTA+OwoJc3RhdHVzID0gIm9rYXkiOwp9OwoKJnVzYmRyZF9kd2MzXzAgewoJc3RhdHVzID0g
Im9rYXkiOwp9OwoKJnVzYmRyZDNfMSB7CglzdGF0dXMgPSAib2theSI7Cn07CgomdXNiZHJkX2R3
YzNfMSB7CglzdGF0dXMgPSAib2theSI7Cn07Cgomdm9wYiB7CglzdGF0dXMgPSAib2theSI7Cn07
Cgomdm9wYl9tbXUgewoJc3RhdHVzID0gIm9rYXkiOwp9OwoKJnZvcGwgewoJc3RhdHVzID0gIm9r
YXkiOwp9OwoKJnZvcGxfbW11IHsKCXN0YXR1cyA9ICJva2F5IjsKfTsKCg==
--00000000000053c7ca05e39dc2f5
Content-Type: application/octet-stream; name="rk3399.dtsi"
Content-Disposition: attachment; filename="rk3399.dtsi"
Content-Transfer-Encoding: base64
Content-ID: <f_l5iczs9u1>
X-Attachment-Id: f_l5iczs9u1

Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wKyBPUiBNSVQpCi8qCiAqIENvcHly
aWdodCAoYykgMjAxNiBGdXpob3UgUm9ja2NoaXAgRWxlY3Ryb25pY3MgQ28uLCBMdGQKICovCgoj
aW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svcmszMzk5LWNydS5oPgojaW5jbHVkZSA8ZHQtYmlu
ZGluZ3MvZ3Bpby9ncGlvLmg+CiNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJv
bGxlci9hcm0tZ2ljLmg+CiNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxl
ci9pcnEuaD4KI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3BpbmN0cmwvcm9ja2NoaXAuaD4KI2luY2x1
ZGUgPGR0LWJpbmRpbmdzL3Bvd2VyL3JrMzM5OS1wb3dlci5oPgojaW5jbHVkZSA8ZHQtYmluZGlu
Z3MvdGhlcm1hbC90aGVybWFsLmg+CgovIHsKCWNvbXBhdGlibGUgPSAicm9ja2NoaXAscmszMzk5
IjsKCglpbnRlcnJ1cHQtcGFyZW50ID0gPCZnaWM+OwoJI2FkZHJlc3MtY2VsbHMgPSA8Mj47Cgkj
c2l6ZS1jZWxscyA9IDwyPjsKCglhbGlhc2VzIHsKCQlldGhlcm5ldDAgPSAmZ21hYzsKCQlpMmMw
ID0gJmkyYzA7CgkJaTJjMSA9ICZpMmMxOwoJCWkyYzIgPSAmaTJjMjsKCQlpMmMzID0gJmkyYzM7
CgkJaTJjNCA9ICZpMmM0OwoJCWkyYzUgPSAmaTJjNTsKCQlpMmM2ID0gJmkyYzY7CgkJaTJjNyA9
ICZpMmM3OwoJCWkyYzggPSAmaTJjODsKCQlzZXJpYWwwID0gJnVhcnQwOwoJCXNlcmlhbDEgPSAm
dWFydDE7CgkJc2VyaWFsMiA9ICZ1YXJ0MjsKCQlzZXJpYWwzID0gJnVhcnQzOwoJCXNlcmlhbDQg
PSAmdWFydDQ7Cgl9OwoKCWNwdXMgewoJCSNhZGRyZXNzLWNlbGxzID0gPDI+OwoJCSNzaXplLWNl
bGxzID0gPDA+OwoKCQljcHUtbWFwIHsKCQkJY2x1c3RlcjAgewoJCQkJY29yZTAgewoJCQkJCWNw
dSA9IDwmY3B1X2wwPjsKCQkJCX07CgkJCQljb3JlMSB7CgkJCQkJY3B1ID0gPCZjcHVfbDE+OwoJ
CQkJfTsKCQkJCWNvcmUyIHsKCQkJCQljcHUgPSA8JmNwdV9sMj47CgkJCQl9OwoJCQkJY29yZTMg
ewoJCQkJCWNwdSA9IDwmY3B1X2wzPjsKCQkJCX07CgkJCX07CgoJCQljbHVzdGVyMSB7CgkJCQlj
b3JlMCB7CgkJCQkJY3B1ID0gPCZjcHVfYjA+OwoJCQkJfTsKCQkJCWNvcmUxIHsKCQkJCQljcHUg
PSA8JmNwdV9iMT47CgkJCQl9OwoJCQl9OwoJCX07CgoJCWNwdV9sMDogY3B1QDAgewoJCQlkZXZp
Y2VfdHlwZSA9ICJjcHUiOwoJCQljb21wYXRpYmxlID0gImFybSxjb3J0ZXgtYTUzIjsKCQkJcmVn
ID0gPDB4MCAweDA+OwoJCQllbmFibGUtbWV0aG9kID0gInBzY2kiOwoJCQljYXBhY2l0eS1kbWlw
cy1taHogPSA8NDg1PjsKCQkJY2xvY2tzID0gPCZjcnUgQVJNQ0xLTD47CgkJCSNjb29saW5nLWNl
bGxzID0gPDI+OyAvKiBtaW4gZm9sbG93ZWQgYnkgbWF4ICovCgkJCWR5bmFtaWMtcG93ZXItY29l
ZmZpY2llbnQgPSA8MTAwPjsKCQkJY3B1LWlkbGUtc3RhdGVzID0gPCZDUFVfU0xFRVAgJkNMVVNU
RVJfU0xFRVA+OwoJCX07CgoJCWNwdV9sMTogY3B1QDEgewoJCQlkZXZpY2VfdHlwZSA9ICJjcHUi
OwoJCQljb21wYXRpYmxlID0gImFybSxjb3J0ZXgtYTUzIjsKCQkJcmVnID0gPDB4MCAweDE+OwoJ
CQllbmFibGUtbWV0aG9kID0gInBzY2kiOwoJCQljYXBhY2l0eS1kbWlwcy1taHogPSA8NDg1PjsK
CQkJY2xvY2tzID0gPCZjcnUgQVJNQ0xLTD47CgkJCSNjb29saW5nLWNlbGxzID0gPDI+OyAvKiBt
aW4gZm9sbG93ZWQgYnkgbWF4ICovCgkJCWR5bmFtaWMtcG93ZXItY29lZmZpY2llbnQgPSA8MTAw
PjsKCQkJY3B1LWlkbGUtc3RhdGVzID0gPCZDUFVfU0xFRVAgJkNMVVNURVJfU0xFRVA+OwoJCX07
CgoJCWNwdV9sMjogY3B1QDIgewoJCQlkZXZpY2VfdHlwZSA9ICJjcHUiOwoJCQljb21wYXRpYmxl
ID0gImFybSxjb3J0ZXgtYTUzIjsKCQkJcmVnID0gPDB4MCAweDI+OwoJCQllbmFibGUtbWV0aG9k
ID0gInBzY2kiOwoJCQljYXBhY2l0eS1kbWlwcy1taHogPSA8NDg1PjsKCQkJY2xvY2tzID0gPCZj
cnUgQVJNQ0xLTD47CgkJCSNjb29saW5nLWNlbGxzID0gPDI+OyAvKiBtaW4gZm9sbG93ZWQgYnkg
bWF4ICovCgkJCWR5bmFtaWMtcG93ZXItY29lZmZpY2llbnQgPSA8MTAwPjsKCQkJY3B1LWlkbGUt
c3RhdGVzID0gPCZDUFVfU0xFRVAgJkNMVVNURVJfU0xFRVA+OwoJCX07CgoJCWNwdV9sMzogY3B1
QDMgewoJCQlkZXZpY2VfdHlwZSA9ICJjcHUiOwoJCQljb21wYXRpYmxlID0gImFybSxjb3J0ZXgt
YTUzIjsKCQkJcmVnID0gPDB4MCAweDM+OwoJCQllbmFibGUtbWV0aG9kID0gInBzY2kiOwoJCQlj
YXBhY2l0eS1kbWlwcy1taHogPSA8NDg1PjsKCQkJY2xvY2tzID0gPCZjcnUgQVJNQ0xLTD47CgkJ
CSNjb29saW5nLWNlbGxzID0gPDI+OyAvKiBtaW4gZm9sbG93ZWQgYnkgbWF4ICovCgkJCWR5bmFt
aWMtcG93ZXItY29lZmZpY2llbnQgPSA8MTAwPjsKCQkJY3B1LWlkbGUtc3RhdGVzID0gPCZDUFVf
U0xFRVAgJkNMVVNURVJfU0xFRVA+OwoJCX07CgoJCWNwdV9iMDogY3B1QDEwMCB7CgkJCWRldmlj
ZV90eXBlID0gImNwdSI7CgkJCWNvbXBhdGlibGUgPSAiYXJtLGNvcnRleC1hNzIiOwoJCQlyZWcg
PSA8MHgwIDB4MTAwPjsKCQkJZW5hYmxlLW1ldGhvZCA9ICJwc2NpIjsKCQkJY2FwYWNpdHktZG1p
cHMtbWh6ID0gPDEwMjQ+OwoJCQljbG9ja3MgPSA8JmNydSBBUk1DTEtCPjsKCQkJI2Nvb2xpbmct
Y2VsbHMgPSA8Mj47IC8qIG1pbiBmb2xsb3dlZCBieSBtYXggKi8KCQkJZHluYW1pYy1wb3dlci1j
b2VmZmljaWVudCA9IDw0MzY+OwoJCQljcHUtaWRsZS1zdGF0ZXMgPSA8JkNQVV9TTEVFUCAmQ0xV
U1RFUl9TTEVFUD47CgkJfTsKCgkJY3B1X2IxOiBjcHVAMTAxIHsKCQkJZGV2aWNlX3R5cGUgPSAi
Y3B1IjsKCQkJY29tcGF0aWJsZSA9ICJhcm0sY29ydGV4LWE3MiI7CgkJCXJlZyA9IDwweDAgMHgx
MDE+OwoJCQllbmFibGUtbWV0aG9kID0gInBzY2kiOwoJCQljYXBhY2l0eS1kbWlwcy1taHogPSA8
MTAyND47CgkJCWNsb2NrcyA9IDwmY3J1IEFSTUNMS0I+OwoJCQkjY29vbGluZy1jZWxscyA9IDwy
PjsgLyogbWluIGZvbGxvd2VkIGJ5IG1heCAqLwoJCQlkeW5hbWljLXBvd2VyLWNvZWZmaWNpZW50
ID0gPDQzNj47CgkJCWNwdS1pZGxlLXN0YXRlcyA9IDwmQ1BVX1NMRUVQICZDTFVTVEVSX1NMRUVQ
PjsKCQl9OwoKCQlpZGxlLXN0YXRlcyB7CgkJCWVudHJ5LW1ldGhvZCA9ICJwc2NpIjsKCgkJCUNQ
VV9TTEVFUDogY3B1LXNsZWVwIHsKCQkJCWNvbXBhdGlibGUgPSAiYXJtLGlkbGUtc3RhdGUiOwoJ
CQkJbG9jYWwtdGltZXItc3RvcDsKCQkJCWFybSxwc2NpLXN1c3BlbmQtcGFyYW0gPSA8MHgwMDEw
MDAwPjsKCQkJCWVudHJ5LWxhdGVuY3ktdXMgPSA8MTIwPjsKCQkJCWV4aXQtbGF0ZW5jeS11cyA9
IDwyNTA+OwoJCQkJbWluLXJlc2lkZW5jeS11cyA9IDw5MDA+OwoJCQl9OwoKCQkJQ0xVU1RFUl9T
TEVFUDogY2x1c3Rlci1zbGVlcCB7CgkJCQljb21wYXRpYmxlID0gImFybSxpZGxlLXN0YXRlIjsK
CQkJCWxvY2FsLXRpbWVyLXN0b3A7CgkJCQlhcm0scHNjaS1zdXNwZW5kLXBhcmFtID0gPDB4MTAx
MDAwMD47CgkJCQllbnRyeS1sYXRlbmN5LXVzID0gPDQwMD47CgkJCQlleGl0LWxhdGVuY3ktdXMg
PSA8NTAwPjsKCQkJCW1pbi1yZXNpZGVuY3ktdXMgPSA8MjAwMD47CgkJCX07CgkJfTsKCX07CgoJ
ZGlzcGxheS1zdWJzeXN0ZW0gewoJCWNvbXBhdGlibGUgPSAicm9ja2NoaXAsZGlzcGxheS1zdWJz
eXN0ZW0iOwoJCXBvcnRzID0gPCZ2b3BsX291dD4sIDwmdm9wYl9vdXQ+OwoJfTsKCglwbXVfYTUz
IHsKCQljb21wYXRpYmxlID0gImFybSxjb3J0ZXgtYTUzLXBtdSI7CgkJaW50ZXJydXB0cyA9IDxH
SUNfUFBJIDcgSVJRX1RZUEVfTEVWRUxfTE9XICZwcGlfY2x1c3RlcjA+OwoJfTsKCglwbXVfYTcy
IHsKCQljb21wYXRpYmxlID0gImFybSxjb3J0ZXgtYTcyLXBtdSI7CgkJaW50ZXJydXB0cyA9IDxH
SUNfUFBJIDcgSVJRX1RZUEVfTEVWRUxfTE9XICZwcGlfY2x1c3RlcjE+OwoJfTsKCglwc2NpIHsK
CQljb21wYXRpYmxlID0gImFybSxwc2NpLTEuMCI7CgkJbWV0aG9kID0gInNtYyI7Cgl9OwoKCXRp
bWVyIHsKCQljb21wYXRpYmxlID0gImFybSxhcm12OC10aW1lciI7CgkJaW50ZXJydXB0cyA9IDxH
SUNfUFBJIDEzIElSUV9UWVBFX0xFVkVMX0xPVyAwPiwKCQkJICAgICA8R0lDX1BQSSAxNCBJUlFf
VFlQRV9MRVZFTF9MT1cgMD4sCgkJCSAgICAgPEdJQ19QUEkgMTEgSVJRX1RZUEVfTEVWRUxfTE9X
IDA+LAoJCQkgICAgIDxHSUNfUFBJIDEwIElSUV9UWVBFX0xFVkVMX0xPVyAwPjsKCQlhcm0sbm8t
dGljay1pbi1zdXNwZW5kOwoJfTsKCgl4aW4yNG06IHhpbjI0bSB7CgkJY29tcGF0aWJsZSA9ICJm
aXhlZC1jbG9jayI7CgkJY2xvY2stZnJlcXVlbmN5ID0gPDI0MDAwMDAwPjsKCQljbG9jay1vdXRw
dXQtbmFtZXMgPSAieGluMjRtIjsKCQkjY2xvY2stY2VsbHMgPSA8MD47Cgl9OwoKCXBjaWUwOiBw
Y2llQGY4MDAwMDAwIHsKCQljb21wYXRpYmxlID0gInJvY2tjaGlwLHJrMzM5OS1wY2llIjsKCQly
ZWcgPSA8MHgwIDB4ZjgwMDAwMDAgMHgwIDB4MjAwMDAwMD4sCgkJICAgICAgPDB4MCAweGZkMDAw
MDAwIDB4MCAweDEwMDAwMDA+OwoJCXJlZy1uYW1lcyA9ICJheGktYmFzZSIsICJhcGItYmFzZSI7
CgkJZGV2aWNlX3R5cGUgPSAicGNpIjsKCQkjYWRkcmVzcy1jZWxscyA9IDwzPjsKCQkjc2l6ZS1j
ZWxscyA9IDwyPjsKCQkjaW50ZXJydXB0LWNlbGxzID0gPDE+OwoJCWFzcG0tbm8tbDBzOwoJCWJ1
cy1yYW5nZSA9IDwweDAgMHgxZj47CgkJY2xvY2tzID0gPCZjcnUgQUNMS19QQ0lFPiwgPCZjcnUg
QUNMS19QRVJGX1BDSUU+LAoJCQkgPCZjcnUgUENMS19QQ0lFPiwgPCZjcnUgU0NMS19QQ0lFX1BN
PjsKCQljbG9jay1uYW1lcyA9ICJhY2xrIiwgImFjbGstcGVyZiIsCgkJCSAgICAgICJoY2xrIiwg
InBtIjsKCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNDkgSVJRX1RZUEVfTEVWRUxfSElHSCAwPiwK
CQkJICAgICA8R0lDX1NQSSA1MCBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+LAoJCQkgICAgIDxHSUNf
U1BJIDUxIElSUV9UWVBFX0xFVkVMX0hJR0ggMD47CgkJaW50ZXJydXB0LW5hbWVzID0gInN5cyIs
ICJsZWdhY3kiLCAiY2xpZW50IjsKCQlpbnRlcnJ1cHQtbWFwLW1hc2sgPSA8MCAwIDAgNz47CgkJ
aW50ZXJydXB0LW1hcCA9IDwwIDAgMCAxICZwY2llMF9pbnRjIDA+LAoJCQkJPDAgMCAwIDIgJnBj
aWUwX2ludGMgMT4sCgkJCQk8MCAwIDAgMyAmcGNpZTBfaW50YyAyPiwKCQkJCTwwIDAgMCA0ICZw
Y2llMF9pbnRjIDM+OwoJCW1heC1saW5rLXNwZWVkID0gPDE+OwoJCW1zaS1tYXAgPSA8MHgwICZp
dHMgMHgwIDB4MTAwMD47CgkJcGh5cyA9IDwmcGNpZV9waHkgMD4sIDwmcGNpZV9waHkgMT4sCgkJ
ICAgICAgIDwmcGNpZV9waHkgMj4sIDwmcGNpZV9waHkgMz47CgkJcGh5LW5hbWVzID0gInBjaWUt
cGh5LTAiLCAicGNpZS1waHktMSIsCgkJCSAgICAicGNpZS1waHktMiIsICJwY2llLXBoeS0zIjsK
CQlyYW5nZXMgPSA8MHg4MjAwMDAwMCAweDAgMHhmYTAwMDAwMCAweDAgMHhmYTAwMDAwMCAweDAg
MHgxZTAwMDAwPiwKCQkJIDwweDgxMDAwMDAwIDB4MCAweGZiZTAwMDAwIDB4MCAweGZiZTAwMDAw
IDB4MCAweDEwMDAwMD47CgkJcmVzZXRzID0gPCZjcnUgU1JTVF9QQ0lFX0NPUkU+LCA8JmNydSBT
UlNUX1BDSUVfTUdNVD4sCgkJCSA8JmNydSBTUlNUX1BDSUVfTUdNVF9TVElDS1k+LCA8JmNydSBT
UlNUX1BDSUVfUElQRT4sCgkJCSA8JmNydSBTUlNUX1BDSUVfUE0+LCA8JmNydSBTUlNUX1BfUENJ
RT4sCgkJCSA8JmNydSBTUlNUX0FfUENJRT47CgkJcmVzZXQtbmFtZXMgPSAiY29yZSIsICJtZ210
IiwgIm1nbXQtc3RpY2t5IiwgInBpcGUiLAoJCQkgICAgICAicG0iLCAicGNsayIsICJhY2xrIjsK
CQlzdGF0dXMgPSAiZGlzYWJsZWQiOwoKCQlwY2llMF9pbnRjOiBpbnRlcnJ1cHQtY29udHJvbGxl
ciB7CgkJCWludGVycnVwdC1jb250cm9sbGVyOwoJCQkjYWRkcmVzcy1jZWxscyA9IDwwPjsKCQkJ
I2ludGVycnVwdC1jZWxscyA9IDwxPjsKCQl9OwoJfTsKCglnbWFjOiBldGhlcm5ldEBmZTMwMDAw
MCB7CgkJY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxyazMzOTktZ21hYyI7CgkJcmVnID0gPDB4MCAw
eGZlMzAwMDAwIDB4MCAweDEwMDAwPjsKCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTIgSVJRX1RZ
UEVfTEVWRUxfSElHSCAwPjsKCQlpbnRlcnJ1cHQtbmFtZXMgPSAibWFjaXJxIjsKCQljbG9ja3Mg
PSA8JmNydSBTQ0xLX01BQz4sIDwmY3J1IFNDTEtfTUFDX1JYPiwKCQkJIDwmY3J1IFNDTEtfTUFD
X1RYPiwgPCZjcnUgU0NMS19NQUNSRUY+LAoJCQkgPCZjcnUgU0NMS19NQUNSRUZfT1VUPiwgPCZj
cnUgQUNMS19HTUFDPiwKCQkJIDwmY3J1IFBDTEtfR01BQz47CgkJY2xvY2stbmFtZXMgPSAic3Rt
bWFjZXRoIiwgIm1hY19jbGtfcngiLAoJCQkgICAgICAibWFjX2Nsa190eCIsICJjbGtfbWFjX3Jl
ZiIsCgkJCSAgICAgICJjbGtfbWFjX3JlZm91dCIsICJhY2xrX21hYyIsCgkJCSAgICAgICJwY2xr
X21hYyI7CgkJcG93ZXItZG9tYWlucyA9IDwmcG93ZXIgUkszMzk5X1BEX0dNQUM+OwoJCXJlc2V0
cyA9IDwmY3J1IFNSU1RfQV9HTUFDPjsKCQlyZXNldC1uYW1lcyA9ICJzdG1tYWNldGgiOwoJCXJv
Y2tjaGlwLGdyZiA9IDwmZ3JmPjsKCQlzbnBzLHR4cGJsID0gPDB4ND47CgkJc3RhdHVzID0gImRp
c2FibGVkIjsKCX07CgoJc2RpbzA6IG1tY0BmZTMxMDAwMCB7CgkJY29tcGF0aWJsZSA9ICJyb2Nr
Y2hpcCxyazMzOTktZHctbXNoYyIsCgkJCSAgICAgInJvY2tjaGlwLHJrMzI4OC1kdy1tc2hjIjsK
CQlyZWcgPSA8MHgwIDB4ZmUzMTAwMDAgMHgwIDB4NDAwMD47CgkJaW50ZXJydXB0cyA9IDxHSUNf
U1BJIDY0IElSUV9UWVBFX0xFVkVMX0hJR0ggMD47CgkJbWF4LWZyZXF1ZW5jeSA9IDwxNTAwMDAw
MDA+OwoJCWNsb2NrcyA9IDwmY3J1IEhDTEtfU0RJTz4sIDwmY3J1IFNDTEtfU0RJTz4sCgkJCSA8
JmNydSBTQ0xLX1NESU9fRFJWPiwgPCZjcnUgU0NMS19TRElPX1NBTVBMRT47CgkJY2xvY2stbmFt
ZXMgPSAiYml1IiwgImNpdSIsICJjaXUtZHJpdmUiLCAiY2l1LXNhbXBsZSI7CgkJZmlmby1kZXB0
aCA9IDwweDEwMD47CgkJcG93ZXItZG9tYWlucyA9IDwmcG93ZXIgUkszMzk5X1BEX1NESU9BVURJ
Tz47CgkJcmVzZXRzID0gPCZjcnUgU1JTVF9TRElPMD47CgkJcmVzZXQtbmFtZXMgPSAicmVzZXQi
OwoJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cgl9OwoKCXNkbW1jOiBtbWNAZmUzMjAwMDAgewoJCWNv
bXBhdGlibGUgPSAicm9ja2NoaXAscmszMzk5LWR3LW1zaGMiLAoJCQkgICAgICJyb2NrY2hpcCxy
azMyODgtZHctbXNoYyI7CgkJcmVnID0gPDB4MCAweGZlMzIwMDAwIDB4MCAweDQwMDA+OwoJCWlu
dGVycnVwdHMgPSA8R0lDX1NQSSA2NSBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+OwoJCW1heC1mcmVx
dWVuY3kgPSA8MTUwMDAwMDAwPjsKCQlhc3NpZ25lZC1jbG9ja3MgPSA8JmNydSBIQ0xLX1NEPjsK
CQlhc3NpZ25lZC1jbG9jay1yYXRlcyA9IDwyMDAwMDAwMDA+OwoJCWNsb2NrcyA9IDwmY3J1IEhD
TEtfU0RNTUM+LCA8JmNydSBTQ0xLX1NETU1DPiwKCQkJIDwmY3J1IFNDTEtfU0RNTUNfRFJWPiwg
PCZjcnUgU0NMS19TRE1NQ19TQU1QTEU+OwoJCWNsb2NrLW5hbWVzID0gImJpdSIsICJjaXUiLCAi
Y2l1LWRyaXZlIiwgImNpdS1zYW1wbGUiOwoJCWZpZm8tZGVwdGggPSA8MHgxMDA+OwoJCXBvd2Vy
LWRvbWFpbnMgPSA8JnBvd2VyIFJLMzM5OV9QRF9TRD47CgkJcmVzZXRzID0gPCZjcnUgU1JTVF9T
RE1NQz47CgkJcmVzZXQtbmFtZXMgPSAicmVzZXQiOwoJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cgl9
OwoKCXNkaGNpOiBtbWNAZmUzMzAwMDAgewoJCWNvbXBhdGlibGUgPSAicm9ja2NoaXAscmszMzk5
LXNkaGNpLTUuMSIsICJhcmFzYW4sc2RoY2ktNS4xIjsKCQlyZWcgPSA8MHgwIDB4ZmUzMzAwMDAg
MHgwIDB4MTAwMDA+OwoJCWludGVycnVwdHMgPSA8R0lDX1NQSSAxMSBJUlFfVFlQRV9MRVZFTF9I
SUdIIDA+OwoJCWFyYXNhbixzb2MtY3RsLXN5c2NvbiA9IDwmZ3JmPjsKCQlhc3NpZ25lZC1jbG9j
a3MgPSA8JmNydSBTQ0xLX0VNTUM+OwoJCWFzc2lnbmVkLWNsb2NrLXJhdGVzID0gPDIwMDAwMDAw
MD47CgkJY2xvY2tzID0gPCZjcnUgU0NMS19FTU1DPiwgPCZjcnUgQUNMS19FTU1DPjsKCQljbG9j
ay1uYW1lcyA9ICJjbGtfeGluIiwgImNsa19haGIiOwoJCWNsb2NrLW91dHB1dC1uYW1lcyA9ICJl
bW1jX2NhcmRjbG9jayI7CgkJI2Nsb2NrLWNlbGxzID0gPDA+OwoJCXBoeXMgPSA8JmVtbWNfcGh5
PjsKCQlwaHktbmFtZXMgPSAicGh5X2FyYXNhbiI7CgkJcG93ZXItZG9tYWlucyA9IDwmcG93ZXIg
UkszMzk5X1BEX0VNTUM+OwoJCWRpc2FibGUtY3FlLWRjbWQ7CgkJc3RhdHVzID0gImRpc2FibGVk
IjsKCX07CgoJdXNiX2hvc3QwX2VoY2k6IHVzYkBmZTM4MDAwMCB7CgkJY29tcGF0aWJsZSA9ICJn
ZW5lcmljLWVoY2kiOwoJCXJlZyA9IDwweDAgMHhmZTM4MDAwMCAweDAgMHgyMDAwMD47CgkJaW50
ZXJydXB0cyA9IDxHSUNfU1BJIDI2IElSUV9UWVBFX0xFVkVMX0hJR0ggMD47CgkJY2xvY2tzID0g
PCZjcnUgSENMS19IT1NUMD4sIDwmY3J1IEhDTEtfSE9TVDBfQVJCPiwKCQkJIDwmdTJwaHkwPjsK
CQlwaHlzID0gPCZ1MnBoeTBfaG9zdD47CgkJcGh5LW5hbWVzID0gInVzYiI7CgkJc3RhdHVzID0g
ImRpc2FibGVkIjsKCX07CgoJdXNiX2hvc3QwX29oY2k6IHVzYkBmZTNhMDAwMCB7CgkJY29tcGF0
aWJsZSA9ICJnZW5lcmljLW9oY2kiOwoJCXJlZyA9IDwweDAgMHhmZTNhMDAwMCAweDAgMHgyMDAw
MD47CgkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDI4IElSUV9UWVBFX0xFVkVMX0hJR0ggMD47CgkJ
Y2xvY2tzID0gPCZjcnUgSENMS19IT1NUMD4sIDwmY3J1IEhDTEtfSE9TVDBfQVJCPiwKCQkJIDwm
dTJwaHkwPjsKCQlwaHlzID0gPCZ1MnBoeTBfaG9zdD47CgkJcGh5LW5hbWVzID0gInVzYiI7CgkJ
c3RhdHVzID0gImRpc2FibGVkIjsKCX07CgoJdXNiX2hvc3QxX2VoY2k6IHVzYkBmZTNjMDAwMCB7
CgkJY29tcGF0aWJsZSA9ICJnZW5lcmljLWVoY2kiOwoJCXJlZyA9IDwweDAgMHhmZTNjMDAwMCAw
eDAgMHgyMDAwMD47CgkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDMwIElSUV9UWVBFX0xFVkVMX0hJ
R0ggMD47CgkJY2xvY2tzID0gPCZjcnUgSENMS19IT1NUMT4sIDwmY3J1IEhDTEtfSE9TVDFfQVJC
PiwKCQkJIDwmdTJwaHkxPjsKCQlwaHlzID0gPCZ1MnBoeTFfaG9zdD47CgkJcGh5LW5hbWVzID0g
InVzYiI7CgkJc3RhdHVzID0gImRpc2FibGVkIjsKCX07CgoJdXNiX2hvc3QxX29oY2k6IHVzYkBm
ZTNlMDAwMCB7CgkJY29tcGF0aWJsZSA9ICJnZW5lcmljLW9oY2kiOwoJCXJlZyA9IDwweDAgMHhm
ZTNlMDAwMCAweDAgMHgyMDAwMD47CgkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDMyIElSUV9UWVBF
X0xFVkVMX0hJR0ggMD47CgkJY2xvY2tzID0gPCZjcnUgSENMS19IT1NUMT4sIDwmY3J1IEhDTEtf
SE9TVDFfQVJCPiwKCQkJIDwmdTJwaHkxPjsKCQlwaHlzID0gPCZ1MnBoeTFfaG9zdD47CgkJcGh5
LW5hbWVzID0gInVzYiI7CgkJc3RhdHVzID0gImRpc2FibGVkIjsKCX07CgoJdXNiZHJkM18wOiB1
c2JAZmU4MDAwMDAgewoJCWNvbXBhdGlibGUgPSAicm9ja2NoaXAscmszMzk5LWR3YzMiOwoJCSNh
ZGRyZXNzLWNlbGxzID0gPDI+OwoJCSNzaXplLWNlbGxzID0gPDI+OwoJCXJhbmdlczsKCQljbG9j
a3MgPSA8JmNydSBTQ0xLX1VTQjNPVEcwX1JFRj4sIDwmY3J1IFNDTEtfVVNCM09URzBfU1VTUEVO
RD4sCgkJCSA8JmNydSBBQ0xLX1VTQjNPVEcwPiwgPCZjcnUgQUNMS19VU0IzX1JLU09DX0FYSV9Q
RVJGPiwKCQkJIDwmY3J1IEFDTEtfVVNCMz4sIDwmY3J1IEFDTEtfVVNCM19HUkY+OwoJCWNsb2Nr
LW5hbWVzID0gInJlZl9jbGsiLCAic3VzcGVuZF9jbGsiLAoJCQkgICAgICAiYnVzX2NsayIsICJh
Y2xrX3VzYjNfcmtzb2NfYXhpX3BlcmYiLAoJCQkgICAgICAiYWNsa191c2IzIiwgImdyZl9jbGsi
OwoJCXJlc2V0cyA9IDwmY3J1IFNSU1RfQV9VU0IzX09URzA+OwoJCXJlc2V0LW5hbWVzID0gInVz
YjMtb3RnIjsKCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwoKCQl1c2JkcmRfZHdjM18wOiB1c2JAZmU4
MDAwMDAgewoJCQljb21wYXRpYmxlID0gInNucHMsZHdjMyI7CgkJCXJlZyA9IDwweDAgMHhmZTgw
MDAwMCAweDAgMHgxMDAwMDA+OwoJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTA1IElSUV9UWVBF
X0xFVkVMX0hJR0ggMD47CgkJCWNsb2NrcyA9IDwmY3J1IFNDTEtfVVNCM09URzBfUkVGPiwgPCZj
cnUgQUNMS19VU0IzT1RHMD4sCgkJCQkgPCZjcnUgU0NMS19VU0IzT1RHMF9TVVNQRU5EPjsKCQkJ
Y2xvY2stbmFtZXMgPSAicmVmIiwgImJ1c19lYXJseSIsICJzdXNwZW5kIjsKCQkJZHJfbW9kZSA9
ICJvdGciOwoJCQlwaHlzID0gPCZ1MnBoeTBfb3RnPiwgPCZ0Y3BoeTBfdXNiMz47CgkJCXBoeS1u
YW1lcyA9ICJ1c2IyLXBoeSIsICJ1c2IzLXBoeSI7CgkJCXBoeV90eXBlID0gInV0bWlfd2lkZSI7
CgkJCXNucHMsZGlzX2VuYmxzbHBtX3F1aXJrOwoJCQlzbnBzLGRpcy11Mi1mcmVlY2xrLWV4aXN0
cy1xdWlyazsKCQkJc25wcyxkaXNfdTJfc3VzcGh5X3F1aXJrOwoJCQlzbnBzLGRpcy1kZWwtcGh5
LXBvd2VyLWNoZy1xdWlyazsKCQkJc25wcyxkaXMtdHgtaXBnYXAtbGluZWNoZWNrLXF1aXJrOwoJ
CQlwb3dlci1kb21haW5zID0gPCZwb3dlciBSSzMzOTlfUERfVVNCMz47CgkJCXN0YXR1cyA9ICJk
aXNhYmxlZCI7CgkJfTsKCX07CgoJdXNiZHJkM18xOiB1c2JAZmU5MDAwMDAgewoJCWNvbXBhdGli
bGUgPSAicm9ja2NoaXAscmszMzk5LWR3YzMiOwoJCSNhZGRyZXNzLWNlbGxzID0gPDI+OwoJCSNz
aXplLWNlbGxzID0gPDI+OwoJCXJhbmdlczsKCQljbG9ja3MgPSA8JmNydSBTQ0xLX1VTQjNPVEcx
X1JFRj4sIDwmY3J1IFNDTEtfVVNCM09URzFfU1VTUEVORD4sCgkJCSA8JmNydSBBQ0xLX1VTQjNP
VEcxPiwgPCZjcnUgQUNMS19VU0IzX1JLU09DX0FYSV9QRVJGPiwKCQkJIDwmY3J1IEFDTEtfVVNC
Mz4sIDwmY3J1IEFDTEtfVVNCM19HUkY+OwoJCWNsb2NrLW5hbWVzID0gInJlZl9jbGsiLCAic3Vz
cGVuZF9jbGsiLAoJCQkgICAgICAiYnVzX2NsayIsICJhY2xrX3VzYjNfcmtzb2NfYXhpX3BlcmYi
LAoJCQkgICAgICAiYWNsa191c2IzIiwgImdyZl9jbGsiOwoJCXJlc2V0cyA9IDwmY3J1IFNSU1Rf
QV9VU0IzX09URzE+OwoJCXJlc2V0LW5hbWVzID0gInVzYjMtb3RnIjsKCQlzdGF0dXMgPSAiZGlz
YWJsZWQiOwoKCQl1c2JkcmRfZHdjM18xOiB1c2JAZmU5MDAwMDAgewoJCQljb21wYXRpYmxlID0g
InNucHMsZHdjMyI7CgkJCXJlZyA9IDwweDAgMHhmZTkwMDAwMCAweDAgMHgxMDAwMDA+OwoJCQlp
bnRlcnJ1cHRzID0gPEdJQ19TUEkgMTEwIElSUV9UWVBFX0xFVkVMX0hJR0ggMD47CgkJCWNsb2Nr
cyA9IDwmY3J1IFNDTEtfVVNCM09URzFfUkVGPiwgPCZjcnUgQUNMS19VU0IzT1RHMT4sCgkJCQkg
PCZjcnUgU0NMS19VU0IzT1RHMV9TVVNQRU5EPjsKCQkJY2xvY2stbmFtZXMgPSAicmVmIiwgImJ1
c19lYXJseSIsICJzdXNwZW5kIjsKCQkJZHJfbW9kZSA9ICJvdGciOwoJCQlwaHlzID0gPCZ1MnBo
eTFfb3RnPiwgPCZ0Y3BoeTFfdXNiMz47CgkJCXBoeS1uYW1lcyA9ICJ1c2IyLXBoeSIsICJ1c2Iz
LXBoeSI7CgkJCXBoeV90eXBlID0gInV0bWlfd2lkZSI7CgkJCXNucHMsZGlzX2VuYmxzbHBtX3F1
aXJrOwoJCQlzbnBzLGRpcy11Mi1mcmVlY2xrLWV4aXN0cy1xdWlyazsKCQkJc25wcyxkaXNfdTJf
c3VzcGh5X3F1aXJrOwoJCQlzbnBzLGRpcy1kZWwtcGh5LXBvd2VyLWNoZy1xdWlyazsKCQkJc25w
cyxkaXMtdHgtaXBnYXAtbGluZWNoZWNrLXF1aXJrOwoJCQlwb3dlci1kb21haW5zID0gPCZwb3dl
ciBSSzMzOTlfUERfVVNCMz47CgkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CgkJfTsKCX07CgoJY2Ru
X2RwOiBkcEBmZWMwMDAwMCB7CgkJY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxyazMzOTktY2RuLWRw
IjsKCQlyZWcgPSA8MHgwIDB4ZmVjMDAwMDAgMHgwIDB4MTAwMDAwPjsKCQlpbnRlcnJ1cHRzID0g
PEdJQ19TUEkgOSBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+OwoJCWFzc2lnbmVkLWNsb2NrcyA9IDwm
Y3J1IFNDTEtfRFBfQ09SRT4sIDwmY3J1IFNDTEtfU1BESUZfUkVDX0RQVFg+OwoJCWFzc2lnbmVk
LWNsb2NrLXJhdGVzID0gPDEwMDAwMDAwMD4sIDwyMDAwMDAwMDA+OwoJCWNsb2NrcyA9IDwmY3J1
IFNDTEtfRFBfQ09SRT4sIDwmY3J1IFBDTEtfRFBfQ1RSTD4sCgkJCSA8JmNydSBTQ0xLX1NQRElG
X1JFQ19EUFRYPiwgPCZjcnUgUENMS19WSU9fR1JGPjsKCQljbG9jay1uYW1lcyA9ICJjb3JlLWNs
ayIsICJwY2xrIiwgInNwZGlmIiwgImdyZiI7CgkJcGh5cyA9IDwmdGNwaHkwX2RwPiwgPCZ0Y3Bo
eTFfZHA+OwoJCXBvd2VyLWRvbWFpbnMgPSA8JnBvd2VyIFJLMzM5OV9QRF9IRENQPjsKCQlyZXNl
dHMgPSA8JmNydSBTUlNUX0RQVFhfU1BESUZfUkVDPiwgPCZjcnUgU1JTVF9QX1VQSFkwX0RQVFg+
LAoJCQkgPCZjcnUgU1JTVF9QX1VQSFkwX0FQQj4sIDwmY3J1IFNSU1RfRFBfQ09SRT47CgkJcmVz
ZXQtbmFtZXMgPSAic3BkaWYiLCAiZHB0eCIsICJhcGIiLCAiY29yZSI7CgkJcm9ja2NoaXAsZ3Jm
ID0gPCZncmY+OwoJCSNzb3VuZC1kYWktY2VsbHMgPSA8MT47CgkJc3RhdHVzID0gImRpc2FibGVk
IjsKCgkJcG9ydHMgewoJCQlkcF9pbjogcG9ydCB7CgkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsK
CQkJCSNzaXplLWNlbGxzID0gPDA+OwoKCQkJCWRwX2luX3ZvcGI6IGVuZHBvaW50QDAgewoJCQkJ
CXJlZyA9IDwwPjsKCQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JnZvcGJfb3V0X2RwPjsKCQkJCX07
CgoJCQkJZHBfaW5fdm9wbDogZW5kcG9pbnRAMSB7CgkJCQkJcmVnID0gPDE+OwoJCQkJCXJlbW90
ZS1lbmRwb2ludCA9IDwmdm9wbF9vdXRfZHA+OwoJCQkJfTsKCQkJfTsKCQl9OwoJfTsKCglnaWM6
IGludGVycnVwdC1jb250cm9sbGVyQGZlZTAwMDAwIHsKCQljb21wYXRpYmxlID0gImFybSxnaWMt
djMiOwoJCSNpbnRlcnJ1cHQtY2VsbHMgPSA8ND47CgkJI2FkZHJlc3MtY2VsbHMgPSA8Mj47CgkJ
I3NpemUtY2VsbHMgPSA8Mj47CgkJcmFuZ2VzOwoJCWludGVycnVwdC1jb250cm9sbGVyOwoKCQly
ZWcgPSA8MHgwIDB4ZmVlMDAwMDAgMCAweDEwMDAwPiwgLyogR0lDRCAqLwoJCSAgICAgIDwweDAg
MHhmZWYwMDAwMCAwIDB4YzAwMDA+LCAvKiBHSUNSICovCgkJICAgICAgPDB4MCAweGZmZjAwMDAw
IDAgMHgxMDAwMD4sIC8qIEdJQ0MgKi8KCQkgICAgICA8MHgwIDB4ZmZmMTAwMDAgMCAweDEwMDAw
PiwgLyogR0lDSCAqLwoJCSAgICAgIDwweDAgMHhmZmYyMDAwMCAwIDB4MTAwMDA+OyAvKiBHSUNW
ICovCgkJaW50ZXJydXB0cyA9IDxHSUNfUFBJIDkgSVJRX1RZUEVfTEVWRUxfSElHSCAwPjsKCQlp
dHM6IGludGVycnVwdC1jb250cm9sbGVyQGZlZTIwMDAwIHsKCQkJY29tcGF0aWJsZSA9ICJhcm0s
Z2ljLXYzLWl0cyI7CgkJCW1zaS1jb250cm9sbGVyOwoJCQkjbXNpLWNlbGxzID0gPDE+OwoJCQly
ZWcgPSA8MHgwIDB4ZmVlMjAwMDAgMHgwIDB4MjAwMDA+OwoJCX07CgoJCXBwaS1wYXJ0aXRpb25z
IHsKCQkJcHBpX2NsdXN0ZXIwOiBpbnRlcnJ1cHQtcGFydGl0aW9uLTAgewoJCQkJYWZmaW5pdHkg
PSA8JmNwdV9sMCAmY3B1X2wxICZjcHVfbDIgJmNwdV9sMz47CgkJCX07CgoJCQlwcGlfY2x1c3Rl
cjE6IGludGVycnVwdC1wYXJ0aXRpb24tMSB7CgkJCQlhZmZpbml0eSA9IDwmY3B1X2IwICZjcHVf
YjE+OwoJCQl9OwoJCX07Cgl9OwoKCXNhcmFkYzogc2FyYWRjQGZmMTAwMDAwIHsKCQljb21wYXRp
YmxlID0gInJvY2tjaGlwLHJrMzM5OS1zYXJhZGMiOwoJCXJlZyA9IDwweDAgMHhmZjEwMDAwMCAw
eDAgMHgxMDA+OwoJCWludGVycnVwdHMgPSA8R0lDX1NQSSA2MiBJUlFfVFlQRV9MRVZFTF9ISUdI
IDA+OwoJCSNpby1jaGFubmVsLWNlbGxzID0gPDE+OwoJCWNsb2NrcyA9IDwmY3J1IFNDTEtfU0FS
QURDPiwgPCZjcnUgUENMS19TQVJBREM+OwoJCWNsb2NrLW5hbWVzID0gInNhcmFkYyIsICJhcGJf
cGNsayI7CgkJcmVzZXRzID0gPCZjcnUgU1JTVF9QX1NBUkFEQz47CgkJcmVzZXQtbmFtZXMgPSAi
c2FyYWRjLWFwYiI7CgkJc3RhdHVzID0gImRpc2FibGVkIjsKCX07CgoJaTJjMTogaTJjQGZmMTEw
MDAwIHsKCQljb21wYXRpYmxlID0gInJvY2tjaGlwLHJrMzM5OS1pMmMiOwoJCXJlZyA9IDwweDAg
MHhmZjExMDAwMCAweDAgMHgxMDAwPjsKCQlhc3NpZ25lZC1jbG9ja3MgPSA8JmNydSBTQ0xLX0ky
QzE+OwoJCWFzc2lnbmVkLWNsb2NrLXJhdGVzID0gPDIwMDAwMDAwMD47CgkJY2xvY2tzID0gPCZj
cnUgU0NMS19JMkMxPiwgPCZjcnUgUENMS19JMkMxPjsKCQljbG9jay1uYW1lcyA9ICJpMmMiLCAi
cGNsayI7CgkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDU5IElSUV9UWVBFX0xFVkVMX0hJR0ggMD47
CgkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKCQlwaW5jdHJsLTAgPSA8JmkyYzFfeGZlcj47
CgkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CgkJI3NpemUtY2VsbHMgPSA8MD47CgkJc3RhdHVzID0g
ImRpc2FibGVkIjsKCX07CgoJaTJjMjogaTJjQGZmMTIwMDAwIHsKCQljb21wYXRpYmxlID0gInJv
Y2tjaGlwLHJrMzM5OS1pMmMiOwoJCXJlZyA9IDwweDAgMHhmZjEyMDAwMCAweDAgMHgxMDAwPjsK
CQlhc3NpZ25lZC1jbG9ja3MgPSA8JmNydSBTQ0xLX0kyQzI+OwoJCWFzc2lnbmVkLWNsb2NrLXJh
dGVzID0gPDIwMDAwMDAwMD47CgkJY2xvY2tzID0gPCZjcnUgU0NMS19JMkMyPiwgPCZjcnUgUENM
S19JMkMyPjsKCQljbG9jay1uYW1lcyA9ICJpMmMiLCAicGNsayI7CgkJaW50ZXJydXB0cyA9IDxH
SUNfU1BJIDM1IElSUV9UWVBFX0xFVkVMX0hJR0ggMD47CgkJcGluY3RybC1uYW1lcyA9ICJkZWZh
dWx0IjsKCQlwaW5jdHJsLTAgPSA8JmkyYzJfeGZlcj47CgkJI2FkZHJlc3MtY2VsbHMgPSA8MT47
CgkJI3NpemUtY2VsbHMgPSA8MD47CgkJc3RhdHVzID0gImRpc2FibGVkIjsKCX07CgoJaTJjMzog
aTJjQGZmMTMwMDAwIHsKCQljb21wYXRpYmxlID0gInJvY2tjaGlwLHJrMzM5OS1pMmMiOwoJCXJl
ZyA9IDwweDAgMHhmZjEzMDAwMCAweDAgMHgxMDAwPjsKCQlhc3NpZ25lZC1jbG9ja3MgPSA8JmNy
dSBTQ0xLX0kyQzM+OwoJCWFzc2lnbmVkLWNsb2NrLXJhdGVzID0gPDIwMDAwMDAwMD47CgkJY2xv
Y2tzID0gPCZjcnUgU0NMS19JMkMzPiwgPCZjcnUgUENMS19JMkMzPjsKCQljbG9jay1uYW1lcyA9
ICJpMmMiLCAicGNsayI7CgkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDM0IElSUV9UWVBFX0xFVkVM
X0hJR0ggMD47CgkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKCQlwaW5jdHJsLTAgPSA8Jmky
YzNfeGZlcj47CgkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CgkJI3NpemUtY2VsbHMgPSA8MD47CgkJ
c3RhdHVzID0gImRpc2FibGVkIjsKCX07CgoJaTJjNTogaTJjQGZmMTQwMDAwIHsKCQljb21wYXRp
YmxlID0gInJvY2tjaGlwLHJrMzM5OS1pMmMiOwoJCXJlZyA9IDwweDAgMHhmZjE0MDAwMCAweDAg
MHgxMDAwPjsKCQlhc3NpZ25lZC1jbG9ja3MgPSA8JmNydSBTQ0xLX0kyQzU+OwoJCWFzc2lnbmVk
LWNsb2NrLXJhdGVzID0gPDIwMDAwMDAwMD47CgkJY2xvY2tzID0gPCZjcnUgU0NMS19JMkM1Piwg
PCZjcnUgUENMS19JMkM1PjsKCQljbG9jay1uYW1lcyA9ICJpMmMiLCAicGNsayI7CgkJaW50ZXJy
dXB0cyA9IDxHSUNfU1BJIDM4IElSUV9UWVBFX0xFVkVMX0hJR0ggMD47CgkJcGluY3RybC1uYW1l
cyA9ICJkZWZhdWx0IjsKCQlwaW5jdHJsLTAgPSA8JmkyYzVfeGZlcj47CgkJI2FkZHJlc3MtY2Vs
bHMgPSA8MT47CgkJI3NpemUtY2VsbHMgPSA8MD47CgkJc3RhdHVzID0gImRpc2FibGVkIjsKCX07
CgoJaTJjNjogaTJjQGZmMTUwMDAwIHsKCQljb21wYXRpYmxlID0gInJvY2tjaGlwLHJrMzM5OS1p
MmMiOwoJCXJlZyA9IDwweDAgMHhmZjE1MDAwMCAweDAgMHgxMDAwPjsKCQlhc3NpZ25lZC1jbG9j
a3MgPSA8JmNydSBTQ0xLX0kyQzY+OwoJCWFzc2lnbmVkLWNsb2NrLXJhdGVzID0gPDIwMDAwMDAw
MD47CgkJY2xvY2tzID0gPCZjcnUgU0NMS19JMkM2PiwgPCZjcnUgUENMS19JMkM2PjsKCQljbG9j
ay1uYW1lcyA9ICJpMmMiLCAicGNsayI7CgkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDM3IElSUV9U
WVBFX0xFVkVMX0hJR0ggMD47CgkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKCQlwaW5jdHJs
LTAgPSA8JmkyYzZfeGZlcj47CgkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CgkJI3NpemUtY2VsbHMg
PSA8MD47CgkJc3RhdHVzID0gImRpc2FibGVkIjsKCX07CgoJaTJjNzogaTJjQGZmMTYwMDAwIHsK
CQljb21wYXRpYmxlID0gInJvY2tjaGlwLHJrMzM5OS1pMmMiOwoJCXJlZyA9IDwweDAgMHhmZjE2
MDAwMCAweDAgMHgxMDAwPjsKCQlhc3NpZ25lZC1jbG9ja3MgPSA8JmNydSBTQ0xLX0kyQzc+OwoJ
CWFzc2lnbmVkLWNsb2NrLXJhdGVzID0gPDIwMDAwMDAwMD47CgkJY2xvY2tzID0gPCZjcnUgU0NM
S19JMkM3PiwgPCZjcnUgUENMS19JMkM3PjsKCQljbG9jay1uYW1lcyA9ICJpMmMiLCAicGNsayI7
CgkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDM2IElSUV9UWVBFX0xFVkVMX0hJR0ggMD47CgkJcGlu
Y3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKCQlwaW5jdHJsLTAgPSA8JmkyYzdfeGZlcj47CgkJI2Fk
ZHJlc3MtY2VsbHMgPSA8MT47CgkJI3NpemUtY2VsbHMgPSA8MD47CgkJc3RhdHVzID0gImRpc2Fi
bGVkIjsKCX07CgoJdWFydDA6IHNlcmlhbEBmZjE4MDAwMCB7CgkJY29tcGF0aWJsZSA9ICJyb2Nr
Y2hpcCxyazMzOTktdWFydCIsICJzbnBzLGR3LWFwYi11YXJ0IjsKCQlyZWcgPSA8MHgwIDB4ZmYx
ODAwMDAgMHgwIDB4MTAwPjsKCQljbG9ja3MgPSA8JmNydSBTQ0xLX1VBUlQwPiwgPCZjcnUgUENM
S19VQVJUMD47CgkJY2xvY2stbmFtZXMgPSAiYmF1ZGNsayIsICJhcGJfcGNsayI7CgkJaW50ZXJy
dXB0cyA9IDxHSUNfU1BJIDk5IElSUV9UWVBFX0xFVkVMX0hJR0ggMD47CgkJcmVnLXNoaWZ0ID0g
PDI+OwoJCXJlZy1pby13aWR0aCA9IDw0PjsKCQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwoJ
CXBpbmN0cmwtMCA9IDwmdWFydDBfeGZlcj47CgkJc3RhdHVzID0gImRpc2FibGVkIjsKCX07CgoJ
dWFydDE6IHNlcmlhbEBmZjE5MDAwMCB7CgkJY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxyazMzOTkt
dWFydCIsICJzbnBzLGR3LWFwYi11YXJ0IjsKCQlyZWcgPSA8MHgwIDB4ZmYxOTAwMDAgMHgwIDB4
MTAwPjsKCQljbG9ja3MgPSA8JmNydSBTQ0xLX1VBUlQxPiwgPCZjcnUgUENMS19VQVJUMT47CgkJ
Y2xvY2stbmFtZXMgPSAiYmF1ZGNsayIsICJhcGJfcGNsayI7CgkJaW50ZXJydXB0cyA9IDxHSUNf
U1BJIDk4IElSUV9UWVBFX0xFVkVMX0hJR0ggMD47CgkJcmVnLXNoaWZ0ID0gPDI+OwoJCXJlZy1p
by13aWR0aCA9IDw0PjsKCQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwoJCXBpbmN0cmwtMCA9
IDwmdWFydDFfeGZlcj47CgkJc3RhdHVzID0gImRpc2FibGVkIjsKCX07CgoJdWFydDI6IHNlcmlh
bEBmZjFhMDAwMCB7CgkJY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxyazMzOTktdWFydCIsICJzbnBz
LGR3LWFwYi11YXJ0IjsKCQlyZWcgPSA8MHgwIDB4ZmYxYTAwMDAgMHgwIDB4MTAwPjsKCQljbG9j
a3MgPSA8JmNydSBTQ0xLX1VBUlQyPiwgPCZjcnUgUENMS19VQVJUMj47CgkJY2xvY2stbmFtZXMg
PSAiYmF1ZGNsayIsICJhcGJfcGNsayI7CgkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDEwMCBJUlFf
VFlQRV9MRVZFTF9ISUdIIDA+OwoJCXJlZy1zaGlmdCA9IDwyPjsKCQlyZWctaW8td2lkdGggPSA8
ND47CgkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKCQlwaW5jdHJsLTAgPSA8JnVhcnQyY194
ZmVyPjsKCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwoJfTsKCgl1YXJ0Mzogc2VyaWFsQGZmMWIwMDAw
IHsKCQljb21wYXRpYmxlID0gInJvY2tjaGlwLHJrMzM5OS11YXJ0IiwgInNucHMsZHctYXBiLXVh
cnQiOwoJCXJlZyA9IDwweDAgMHhmZjFiMDAwMCAweDAgMHgxMDA+OwoJCWNsb2NrcyA9IDwmY3J1
IFNDTEtfVUFSVDM+LCA8JmNydSBQQ0xLX1VBUlQzPjsKCQljbG9jay1uYW1lcyA9ICJiYXVkY2xr
IiwgImFwYl9wY2xrIjsKCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTAxIElSUV9UWVBFX0xFVkVM
X0hJR0ggMD47CgkJcmVnLXNoaWZ0ID0gPDI+OwoJCXJlZy1pby13aWR0aCA9IDw0PjsKCQlwaW5j
dHJsLW5hbWVzID0gImRlZmF1bHQiOwoJCXBpbmN0cmwtMCA9IDwmdWFydDNfeGZlcj47CgkJc3Rh
dHVzID0gImRpc2FibGVkIjsKCX07CgoJc3BpMDogc3BpQGZmMWMwMDAwIHsKCQljb21wYXRpYmxl
ID0gInJvY2tjaGlwLHJrMzM5OS1zcGkiLCAicm9ja2NoaXAscmszMDY2LXNwaSI7CgkJcmVnID0g
PDB4MCAweGZmMWMwMDAwIDB4MCAweDEwMDA+OwoJCWNsb2NrcyA9IDwmY3J1IFNDTEtfU1BJMD4s
IDwmY3J1IFBDTEtfU1BJMD47CgkJY2xvY2stbmFtZXMgPSAic3BpY2xrIiwgImFwYl9wY2xrIjsK
CQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNjggSVJRX1RZUEVfTEVWRUxfSElHSCAwPjsKCQlkbWFz
ID0gPCZkbWFjX3BlcmkgMTA+LCA8JmRtYWNfcGVyaSAxMT47CgkJZG1hLW5hbWVzID0gInR4Iiwg
InJ4IjsKCQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwoJCXBpbmN0cmwtMCA9IDwmc3BpMF9j
bGsgJnNwaTBfdHggJnNwaTBfcnggJnNwaTBfY3MwPjsKCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsK
CQkjc2l6ZS1jZWxscyA9IDwwPjsKCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwoJfTsKCglzcGkxOiBz
cGlAZmYxZDAwMDAgewoJCWNvbXBhdGlibGUgPSAicm9ja2NoaXAscmszMzk5LXNwaSIsICJyb2Nr
Y2hpcCxyazMwNjYtc3BpIjsKCQlyZWcgPSA8MHgwIDB4ZmYxZDAwMDAgMHgwIDB4MTAwMD47CgkJ
Y2xvY2tzID0gPCZjcnUgU0NMS19TUEkxPiwgPCZjcnUgUENMS19TUEkxPjsKCQljbG9jay1uYW1l
cyA9ICJzcGljbGsiLCAiYXBiX3BjbGsiOwoJCWludGVycnVwdHMgPSA8R0lDX1NQSSA1MyBJUlFf
VFlQRV9MRVZFTF9ISUdIIDA+OwoJCWRtYXMgPSA8JmRtYWNfcGVyaSAxMj4sIDwmZG1hY19wZXJp
IDEzPjsKCQlkbWEtbmFtZXMgPSAidHgiLCAicngiOwoJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVs
dCI7CgkJcGluY3RybC0wID0gPCZzcGkxX2NsayAmc3BpMV90eCAmc3BpMV9yeCAmc3BpMV9jczA+
OwoJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwoJCSNzaXplLWNlbGxzID0gPDA+OwoJCXN0YXR1cyA9
ICJkaXNhYmxlZCI7Cgl9OwoKCXNwaTI6IHNwaUBmZjFlMDAwMCB7CgkJY29tcGF0aWJsZSA9ICJy
b2NrY2hpcCxyazMzOTktc3BpIiwgInJvY2tjaGlwLHJrMzA2Ni1zcGkiOwoJCXJlZyA9IDwweDAg
MHhmZjFlMDAwMCAweDAgMHgxMDAwPjsKCQljbG9ja3MgPSA8JmNydSBTQ0xLX1NQSTI+LCA8JmNy
dSBQQ0xLX1NQSTI+OwoJCWNsb2NrLW5hbWVzID0gInNwaWNsayIsICJhcGJfcGNsayI7CgkJaW50
ZXJydXB0cyA9IDxHSUNfU1BJIDUyIElSUV9UWVBFX0xFVkVMX0hJR0ggMD47CgkJZG1hcyA9IDwm
ZG1hY19wZXJpIDE0PiwgPCZkbWFjX3BlcmkgMTU+OwoJCWRtYS1uYW1lcyA9ICJ0eCIsICJyeCI7
CgkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKCQlwaW5jdHJsLTAgPSA8JnNwaTJfY2xrICZz
cGkyX3R4ICZzcGkyX3J4ICZzcGkyX2NzMD47CgkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CgkJI3Np
emUtY2VsbHMgPSA8MD47CgkJc3RhdHVzID0gImRpc2FibGVkIjsKCX07CgoJc3BpNDogc3BpQGZm
MWYwMDAwIHsKCQljb21wYXRpYmxlID0gInJvY2tjaGlwLHJrMzM5OS1zcGkiLCAicm9ja2NoaXAs
cmszMDY2LXNwaSI7CgkJcmVnID0gPDB4MCAweGZmMWYwMDAwIDB4MCAweDEwMDA+OwoJCWNsb2Nr
cyA9IDwmY3J1IFNDTEtfU1BJND4sIDwmY3J1IFBDTEtfU1BJND47CgkJY2xvY2stbmFtZXMgPSAi
c3BpY2xrIiwgImFwYl9wY2xrIjsKCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNjcgSVJRX1RZUEVf
TEVWRUxfSElHSCAwPjsKCQlkbWFzID0gPCZkbWFjX3BlcmkgMTg+LCA8JmRtYWNfcGVyaSAxOT47
CgkJZG1hLW5hbWVzID0gInR4IiwgInJ4IjsKCQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwoJ
CXBpbmN0cmwtMCA9IDwmc3BpNF9jbGsgJnNwaTRfdHggJnNwaTRfcnggJnNwaTRfY3MwPjsKCQkj
YWRkcmVzcy1jZWxscyA9IDwxPjsKCQkjc2l6ZS1jZWxscyA9IDwwPjsKCQlzdGF0dXMgPSAiZGlz
YWJsZWQiOwoJfTsKCglzcGk1OiBzcGlAZmYyMDAwMDAgewoJCWNvbXBhdGlibGUgPSAicm9ja2No
aXAscmszMzk5LXNwaSIsICJyb2NrY2hpcCxyazMwNjYtc3BpIjsKCQlyZWcgPSA8MHgwIDB4ZmYy
MDAwMDAgMHgwIDB4MTAwMD47CgkJY2xvY2tzID0gPCZjcnUgU0NMS19TUEk1PiwgPCZjcnUgUENM
S19TUEk1PjsKCQljbG9jay1uYW1lcyA9ICJzcGljbGsiLCAiYXBiX3BjbGsiOwoJCWludGVycnVw
dHMgPSA8R0lDX1NQSSAxMzIgSVJRX1RZUEVfTEVWRUxfSElHSCAwPjsKCQlkbWFzID0gPCZkbWFj
X2J1cyA4PiwgPCZkbWFjX2J1cyA5PjsKCQlkbWEtbmFtZXMgPSAidHgiLCAicngiOwoJCXBpbmN0
cmwtbmFtZXMgPSAiZGVmYXVsdCI7CgkJcGluY3RybC0wID0gPCZzcGk1X2NsayAmc3BpNV90eCAm
c3BpNV9yeCAmc3BpNV9jczA+OwoJCXBvd2VyLWRvbWFpbnMgPSA8JnBvd2VyIFJLMzM5OV9QRF9T
RElPQVVESU8+OwoJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwoJCSNzaXplLWNlbGxzID0gPDA+OwoJ
CXN0YXR1cyA9ICJkaXNhYmxlZCI7Cgl9OwoKCXRoZXJtYWxfem9uZXM6IHRoZXJtYWwtem9uZXMg
ewoJCWNwdV90aGVybWFsOiBjcHUtdGhlcm1hbCB7CgkJCXBvbGxpbmctZGVsYXktcGFzc2l2ZSA9
IDwxMDA+OwoJCQlwb2xsaW5nLWRlbGF5ID0gPDEwMDA+OwoKCQkJdGhlcm1hbC1zZW5zb3JzID0g
PCZ0c2FkYyAwPjsKCgkJCXRyaXBzIHsKCQkJCWNwdV9hbGVydDA6IGNwdV9hbGVydDAgewoJCQkJ
CXRlbXBlcmF0dXJlID0gPDcwMDAwPjsKCQkJCQloeXN0ZXJlc2lzID0gPDIwMDA+OwoJCQkJCXR5
cGUgPSAicGFzc2l2ZSI7CgkJCQl9OwoJCQkJY3B1X2FsZXJ0MTogY3B1X2FsZXJ0MSB7CgkJCQkJ
dGVtcGVyYXR1cmUgPSA8NzUwMDA+OwoJCQkJCWh5c3RlcmVzaXMgPSA8MjAwMD47CgkJCQkJdHlw
ZSA9ICJwYXNzaXZlIjsKCQkJCX07CgkJCQljcHVfY3JpdDogY3B1X2NyaXQgewoJCQkJCXRlbXBl
cmF0dXJlID0gPDk1MDAwPjsKCQkJCQloeXN0ZXJlc2lzID0gPDIwMDA+OwoJCQkJCXR5cGUgPSAi
Y3JpdGljYWwiOwoJCQkJfTsKCQkJfTsKCgkJCWNvb2xpbmctbWFwcyB7CgkJCQltYXAwIHsKCQkJ
CQl0cmlwID0gPCZjcHVfYWxlcnQwPjsKCQkJCQljb29saW5nLWRldmljZSA9CgkJCQkJCTwmY3B1
X2IwIFRIRVJNQUxfTk9fTElNSVQgVEhFUk1BTF9OT19MSU1JVD4sCgkJCQkJCTwmY3B1X2IxIFRI
RVJNQUxfTk9fTElNSVQgVEhFUk1BTF9OT19MSU1JVD47CgkJCQl9OwoJCQkJbWFwMSB7CgkJCQkJ
dHJpcCA9IDwmY3B1X2FsZXJ0MT47CgkJCQkJY29vbGluZy1kZXZpY2UgPQoJCQkJCQk8JmNwdV9s
MCBUSEVSTUFMX05PX0xJTUlUIFRIRVJNQUxfTk9fTElNSVQ+LAoJCQkJCQk8JmNwdV9sMSBUSEVS
TUFMX05PX0xJTUlUIFRIRVJNQUxfTk9fTElNSVQ+LAoJCQkJCQk8JmNwdV9sMiBUSEVSTUFMX05P
X0xJTUlUIFRIRVJNQUxfTk9fTElNSVQ+LAoJCQkJCQk8JmNwdV9sMyBUSEVSTUFMX05PX0xJTUlU
IFRIRVJNQUxfTk9fTElNSVQ+LAoJCQkJCQk8JmNwdV9iMCBUSEVSTUFMX05PX0xJTUlUIFRIRVJN
QUxfTk9fTElNSVQ+LAoJCQkJCQk8JmNwdV9iMSBUSEVSTUFMX05PX0xJTUlUIFRIRVJNQUxfTk9f
TElNSVQ+OwoJCQkJfTsKCQkJfTsKCQl9OwoKCQlncHVfdGhlcm1hbDogZ3B1LXRoZXJtYWwgewoJ
CQlwb2xsaW5nLWRlbGF5LXBhc3NpdmUgPSA8MTAwPjsKCQkJcG9sbGluZy1kZWxheSA9IDwxMDAw
PjsKCgkJCXRoZXJtYWwtc2Vuc29ycyA9IDwmdHNhZGMgMT47CgoJCQl0cmlwcyB7CgkJCQlncHVf
YWxlcnQwOiBncHVfYWxlcnQwIHsKCQkJCQl0ZW1wZXJhdHVyZSA9IDw3NTAwMD47CgkJCQkJaHlz
dGVyZXNpcyA9IDwyMDAwPjsKCQkJCQl0eXBlID0gInBhc3NpdmUiOwoJCQkJfTsKCQkJCWdwdV9j
cml0OiBncHVfY3JpdCB7CgkJCQkJdGVtcGVyYXR1cmUgPSA8OTUwMDA+OwoJCQkJCWh5c3RlcmVz
aXMgPSA8MjAwMD47CgkJCQkJdHlwZSA9ICJjcml0aWNhbCI7CgkJCQl9OwoJCQl9OwoKCQkJY29v
bGluZy1tYXBzIHsKCQkJCW1hcDAgewoJCQkJCXRyaXAgPSA8JmdwdV9hbGVydDA+OwoJCQkJCWNv
b2xpbmctZGV2aWNlID0KCQkJCQkJPCZncHUgVEhFUk1BTF9OT19MSU1JVCBUSEVSTUFMX05PX0xJ
TUlUPjsKCQkJCX07CgkJCX07CgkJfTsKCX07CgoJdHNhZGM6IHRzYWRjQGZmMjYwMDAwIHsKCQlj
b21wYXRpYmxlID0gInJvY2tjaGlwLHJrMzM5OS10c2FkYyI7CgkJcmVnID0gPDB4MCAweGZmMjYw
MDAwIDB4MCAweDEwMD47CgkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDk3IElSUV9UWVBFX0xFVkVM
X0hJR0ggMD47CgkJYXNzaWduZWQtY2xvY2tzID0gPCZjcnUgU0NMS19UU0FEQz47CgkJYXNzaWdu
ZWQtY2xvY2stcmF0ZXMgPSA8NzUwMDAwPjsKCQljbG9ja3MgPSA8JmNydSBTQ0xLX1RTQURDPiwg
PCZjcnUgUENMS19UU0FEQz47CgkJY2xvY2stbmFtZXMgPSAidHNhZGMiLCAiYXBiX3BjbGsiOwoJ
CXJlc2V0cyA9IDwmY3J1IFNSU1RfVFNBREM+OwoJCXJlc2V0LW5hbWVzID0gInRzYWRjLWFwYiI7
CgkJcm9ja2NoaXAsZ3JmID0gPCZncmY+OwoJCXJvY2tjaGlwLGh3LXRzaHV0LXRlbXAgPSA8OTUw
MDA+OwoJCXBpbmN0cmwtbmFtZXMgPSAiaW5pdCIsICJkZWZhdWx0IiwgInNsZWVwIjsKCQlwaW5j
dHJsLTAgPSA8Jm90cF9waW4+OwoJCXBpbmN0cmwtMSA9IDwmb3RwX291dD47CgkJcGluY3RybC0y
ID0gPCZvdHBfcGluPjsKCQkjdGhlcm1hbC1zZW5zb3ItY2VsbHMgPSA8MT47CgkJc3RhdHVzID0g
ImRpc2FibGVkIjsKCX07CgoJcW9zX2VtbWM6IHFvc0BmZmE1ODAwMCB7CgkJY29tcGF0aWJsZSA9
ICJyb2NrY2hpcCxyazMzOTktcW9zIiwgInN5c2NvbiI7CgkJcmVnID0gPDB4MCAweGZmYTU4MDAw
IDB4MCAweDIwPjsKCX07CgoJcW9zX2dtYWM6IHFvc0BmZmE1YzAwMCB7CgkJY29tcGF0aWJsZSA9
ICJyb2NrY2hpcCxyazMzOTktcW9zIiwgInN5c2NvbiI7CgkJcmVnID0gPDB4MCAweGZmYTVjMDAw
IDB4MCAweDIwPjsKCX07CgoJcW9zX3BjaWU6IHFvc0BmZmE2MDA4MCB7CgkJY29tcGF0aWJsZSA9
ICJyb2NrY2hpcCxyazMzOTktcW9zIiwgInN5c2NvbiI7CgkJcmVnID0gPDB4MCAweGZmYTYwMDgw
IDB4MCAweDIwPjsKCX07CgoJcW9zX3VzYl9ob3N0MDogcW9zQGZmYTYwMTAwIHsKCQljb21wYXRp
YmxlID0gInJvY2tjaGlwLHJrMzM5OS1xb3MiLCAic3lzY29uIjsKCQlyZWcgPSA8MHgwIDB4ZmZh
NjAxMDAgMHgwIDB4MjA+OwoJfTsKCglxb3NfdXNiX2hvc3QxOiBxb3NAZmZhNjAxODAgewoJCWNv
bXBhdGlibGUgPSAicm9ja2NoaXAscmszMzk5LXFvcyIsICJzeXNjb24iOwoJCXJlZyA9IDwweDAg
MHhmZmE2MDE4MCAweDAgMHgyMD47Cgl9OwoKCXFvc191c2Jfb3RnMDogcW9zQGZmYTcwMDAwIHsK
CQljb21wYXRpYmxlID0gInJvY2tjaGlwLHJrMzM5OS1xb3MiLCAic3lzY29uIjsKCQlyZWcgPSA8
MHgwIDB4ZmZhNzAwMDAgMHgwIDB4MjA+OwoJfTsKCglxb3NfdXNiX290ZzE6IHFvc0BmZmE3MDA4
MCB7CgkJY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxyazMzOTktcW9zIiwgInN5c2NvbiI7CgkJcmVn
ID0gPDB4MCAweGZmYTcwMDgwIDB4MCAweDIwPjsKCX07CgoJcW9zX3NkOiBxb3NAZmZhNzQwMDAg
ewoJCWNvbXBhdGlibGUgPSAicm9ja2NoaXAscmszMzk5LXFvcyIsICJzeXNjb24iOwoJCXJlZyA9
IDwweDAgMHhmZmE3NDAwMCAweDAgMHgyMD47Cgl9OwoKCXFvc19zZGlvYXVkaW86IHFvc0BmZmE3
NjAwMCB7CgkJY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxyazMzOTktcW9zIiwgInN5c2NvbiI7CgkJ
cmVnID0gPDB4MCAweGZmYTc2MDAwIDB4MCAweDIwPjsKCX07CgoJcW9zX2hkY3A6IHFvc0BmZmE5
MDAwMCB7CgkJY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxyazMzOTktcW9zIiwgInN5c2NvbiI7CgkJ
cmVnID0gPDB4MCAweGZmYTkwMDAwIDB4MCAweDIwPjsKCX07CgoJcW9zX2llcDogcW9zQGZmYTk4
MDAwIHsKCQljb21wYXRpYmxlID0gInJvY2tjaGlwLHJrMzM5OS1xb3MiLCAic3lzY29uIjsKCQly
ZWcgPSA8MHgwIDB4ZmZhOTgwMDAgMHgwIDB4MjA+OwoJfTsKCglxb3NfaXNwMF9tMDogcW9zQGZm
YWEwMDAwIHsKCQljb21wYXRpYmxlID0gInJvY2tjaGlwLHJrMzM5OS1xb3MiLCAic3lzY29uIjsK
CQlyZWcgPSA8MHgwIDB4ZmZhYTAwMDAgMHgwIDB4MjA+OwoJfTsKCglxb3NfaXNwMF9tMTogcW9z
QGZmYWEwMDgwIHsKCQljb21wYXRpYmxlID0gInJvY2tjaGlwLHJrMzM5OS1xb3MiLCAic3lzY29u
IjsKCQlyZWcgPSA8MHgwIDB4ZmZhYTAwODAgMHgwIDB4MjA+OwoJfTsKCglxb3NfaXNwMV9tMDog
cW9zQGZmYWE4MDAwIHsKCQljb21wYXRpYmxlID0gInJvY2tjaGlwLHJrMzM5OS1xb3MiLCAic3lz
Y29uIjsKCQlyZWcgPSA8MHgwIDB4ZmZhYTgwMDAgMHgwIDB4MjA+OwoJfTsKCglxb3NfaXNwMV9t
MTogcW9zQGZmYWE4MDgwIHsKCQljb21wYXRpYmxlID0gInJvY2tjaGlwLHJrMzM5OS1xb3MiLCAi
c3lzY29uIjsKCQlyZWcgPSA8MHgwIDB4ZmZhYTgwODAgMHgwIDB4MjA+OwoJfTsKCglxb3Nfcmdh
X3I6IHFvc0BmZmFiMDAwMCB7CgkJY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxyazMzOTktcW9zIiwg
InN5c2NvbiI7CgkJcmVnID0gPDB4MCAweGZmYWIwMDAwIDB4MCAweDIwPjsKCX07CgoJcW9zX3Jn
YV93OiBxb3NAZmZhYjAwODAgewoJCWNvbXBhdGlibGUgPSAicm9ja2NoaXAscmszMzk5LXFvcyIs
ICJzeXNjb24iOwoJCXJlZyA9IDwweDAgMHhmZmFiMDA4MCAweDAgMHgyMD47Cgl9OwoKCXFvc192
aWRlb19tMDogcW9zQGZmYWI4MDAwIHsKCQljb21wYXRpYmxlID0gInJvY2tjaGlwLHJrMzM5OS1x
b3MiLCAic3lzY29uIjsKCQlyZWcgPSA8MHgwIDB4ZmZhYjgwMDAgMHgwIDB4MjA+OwoJfTsKCglx
b3NfdmlkZW9fbTFfcjogcW9zQGZmYWMwMDAwIHsKCQljb21wYXRpYmxlID0gInJvY2tjaGlwLHJr
MzM5OS1xb3MiLCAic3lzY29uIjsKCQlyZWcgPSA8MHgwIDB4ZmZhYzAwMDAgMHgwIDB4MjA+OwoJ
fTsKCglxb3NfdmlkZW9fbTFfdzogcW9zQGZmYWMwMDgwIHsKCQljb21wYXRpYmxlID0gInJvY2tj
aGlwLHJrMzM5OS1xb3MiLCAic3lzY29uIjsKCQlyZWcgPSA8MHgwIDB4ZmZhYzAwODAgMHgwIDB4
MjA+OwoJfTsKCglxb3Nfdm9wX2JpZ19yOiBxb3NAZmZhYzgwMDAgewoJCWNvbXBhdGlibGUgPSAi
cm9ja2NoaXAscmszMzk5LXFvcyIsICJzeXNjb24iOwoJCXJlZyA9IDwweDAgMHhmZmFjODAwMCAw
eDAgMHgyMD47Cgl9OwoKCXFvc192b3BfYmlnX3c6IHFvc0BmZmFjODA4MCB7CgkJY29tcGF0aWJs
ZSA9ICJyb2NrY2hpcCxyazMzOTktcW9zIiwgInN5c2NvbiI7CgkJcmVnID0gPDB4MCAweGZmYWM4
MDgwIDB4MCAweDIwPjsKCX07CgoJcW9zX3ZvcF9saXR0bGU6IHFvc0BmZmFkMDAwMCB7CgkJY29t
cGF0aWJsZSA9ICJyb2NrY2hpcCxyazMzOTktcW9zIiwgInN5c2NvbiI7CgkJcmVnID0gPDB4MCAw
eGZmYWQwMDAwIDB4MCAweDIwPjsKCX07CgoJcW9zX3BlcmlocDogcW9zQGZmYWQ4MDgwIHsKCQlj
b21wYXRpYmxlID0gInJvY2tjaGlwLHJrMzM5OS1xb3MiLCAic3lzY29uIjsKCQlyZWcgPSA8MHgw
IDB4ZmZhZDgwODAgMHgwIDB4MjA+OwoJfTsKCglxb3NfZ3B1OiBxb3NAZmZhZTAwMDAgewoJCWNv
bXBhdGlibGUgPSAicm9ja2NoaXAscmszMzk5LXFvcyIsICJzeXNjb24iOwoJCXJlZyA9IDwweDAg
MHhmZmFlMDAwMCAweDAgMHgyMD47Cgl9OwoKCXBtdTogcG93ZXItbWFuYWdlbWVudEBmZjMxMDAw
MCB7CgkJY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxyazMzOTktcG11IiwgInN5c2NvbiIsICJzaW1w
bGUtbWZkIjsKCQlyZWcgPSA8MHgwIDB4ZmYzMTAwMDAgMHgwIDB4MTAwMD47CgoJCS8qCgkJICog
Tm90ZTogUkszMzk5IHN1cHBvcnRzIDYgdm9sdGFnZSBkb21haW5zIGluY2x1ZGluZyBWRF9DT1JF
X0wsCgkJICogVkRfQ09SRV9CLCBWRF9DRU5URVIsIFZEX0dQVSwgVkRfTE9HSUMgYW5kIFZEX1BN
VS4KCQkgKiBTb21lIG9mIHRoZSBwb3dlciBkb21haW5zIGFyZSBncm91cGVkIHRvZ2V0aGVyIGZv
ciBldmVyeQoJCSAqIHZvbHRhZ2UgZG9tYWluLgoJCSAqIFRoZSBkZXRhaWwgY29udGVudHMgYXMg
YmVsb3cuCgkJICovCgkJcG93ZXI6IHBvd2VyLWNvbnRyb2xsZXIgewoJCQljb21wYXRpYmxlID0g
InJvY2tjaGlwLHJrMzM5OS1wb3dlci1jb250cm9sbGVyIjsKCQkJI3Bvd2VyLWRvbWFpbi1jZWxs
cyA9IDwxPjsKCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CgkJCSNzaXplLWNlbGxzID0gPDA+OwoK
CQkJLyogVGhlc2UgcG93ZXIgZG9tYWlucyBhcmUgZ3JvdXBlZCBieSBWRF9DRU5URVIgKi8KCQkJ
cG93ZXItZG9tYWluQFJLMzM5OV9QRF9JRVAgewoJCQkJcmVnID0gPFJLMzM5OV9QRF9JRVA+OwoJ
CQkJY2xvY2tzID0gPCZjcnUgQUNMS19JRVA+LAoJCQkJCSA8JmNydSBIQ0xLX0lFUD47CgkJCQlw
bV9xb3MgPSA8JnFvc19pZXA+OwoJCQkJI3Bvd2VyLWRvbWFpbi1jZWxscyA9IDwwPjsKCQkJfTsK
CQkJcG93ZXItZG9tYWluQFJLMzM5OV9QRF9SR0EgewoJCQkJcmVnID0gPFJLMzM5OV9QRF9SR0E+
OwoJCQkJY2xvY2tzID0gPCZjcnUgQUNMS19SR0E+LAoJCQkJCSA8JmNydSBIQ0xLX1JHQT47CgkJ
CQlwbV9xb3MgPSA8JnFvc19yZ2Ffcj4sCgkJCQkJIDwmcW9zX3JnYV93PjsKCQkJCSNwb3dlci1k
b21haW4tY2VsbHMgPSA8MD47CgkJCX07CgkJCXBvd2VyLWRvbWFpbkBSSzMzOTlfUERfVkNPREVD
IHsKCQkJCXJlZyA9IDxSSzMzOTlfUERfVkNPREVDPjsKCQkJCWNsb2NrcyA9IDwmY3J1IEFDTEtf
VkNPREVDPiwKCQkJCQkgPCZjcnUgSENMS19WQ09ERUM+OwoJCQkJcG1fcW9zID0gPCZxb3Nfdmlk
ZW9fbTA+OwoJCQkJI3Bvd2VyLWRvbWFpbi1jZWxscyA9IDwwPjsKCQkJfTsKCQkJcG93ZXItZG9t
YWluQFJLMzM5OV9QRF9WRFUgewoJCQkJcmVnID0gPFJLMzM5OV9QRF9WRFU+OwoJCQkJY2xvY2tz
ID0gPCZjcnUgQUNMS19WRFU+LAoJCQkJCSA8JmNydSBIQ0xLX1ZEVT47CgkJCQlwbV9xb3MgPSA8
JnFvc192aWRlb19tMV9yPiwKCQkJCQkgPCZxb3NfdmlkZW9fbTFfdz47CgkJCQkjcG93ZXItZG9t
YWluLWNlbGxzID0gPDA+OwoJCQl9OwoKCQkJLyogVGhlc2UgcG93ZXIgZG9tYWlucyBhcmUgZ3Jv
dXBlZCBieSBWRF9HUFUgKi8KCQkJcG93ZXItZG9tYWluQFJLMzM5OV9QRF9HUFUgewoJCQkJcmVn
ID0gPFJLMzM5OV9QRF9HUFU+OwoJCQkJY2xvY2tzID0gPCZjcnUgQUNMS19HUFU+OwoJCQkJcG1f
cW9zID0gPCZxb3NfZ3B1PjsKCQkJCSNwb3dlci1kb21haW4tY2VsbHMgPSA8MD47CgkJCX07CgoJ
CQkvKiBUaGVzZSBwb3dlciBkb21haW5zIGFyZSBncm91cGVkIGJ5IFZEX0xPR0lDICovCgkJCXBv
d2VyLWRvbWFpbkBSSzMzOTlfUERfRURQIHsKCQkJCXJlZyA9IDxSSzMzOTlfUERfRURQPjsKCQkJ
CWNsb2NrcyA9IDwmY3J1IFBDTEtfRURQX0NUUkw+OwoJCQkJI3Bvd2VyLWRvbWFpbi1jZWxscyA9
IDwwPjsKCQkJfTsKCQkJcG93ZXItZG9tYWluQFJLMzM5OV9QRF9FTU1DIHsKCQkJCXJlZyA9IDxS
SzMzOTlfUERfRU1NQz47CgkJCQljbG9ja3MgPSA8JmNydSBBQ0xLX0VNTUM+OwoJCQkJcG1fcW9z
ID0gPCZxb3NfZW1tYz47CgkJCQkjcG93ZXItZG9tYWluLWNlbGxzID0gPDA+OwoJCQl9OwoJCQlw
b3dlci1kb21haW5AUkszMzk5X1BEX0dNQUMgewoJCQkJcmVnID0gPFJLMzM5OV9QRF9HTUFDPjsK
CQkJCWNsb2NrcyA9IDwmY3J1IEFDTEtfR01BQz4sCgkJCQkJIDwmY3J1IFBDTEtfR01BQz47CgkJ
CQlwbV9xb3MgPSA8JnFvc19nbWFjPjsKCQkJCSNwb3dlci1kb21haW4tY2VsbHMgPSA8MD47CgkJ
CX07CgkJCXBvd2VyLWRvbWFpbkBSSzMzOTlfUERfU0QgewoJCQkJcmVnID0gPFJLMzM5OV9QRF9T
RD47CgkJCQljbG9ja3MgPSA8JmNydSBIQ0xLX1NETU1DPiwKCQkJCQkgPCZjcnUgU0NMS19TRE1N
Qz47CgkJCQlwbV9xb3MgPSA8JnFvc19zZD47CgkJCQkjcG93ZXItZG9tYWluLWNlbGxzID0gPDA+
OwoJCQl9OwoJCQlwb3dlci1kb21haW5AUkszMzk5X1BEX1NESU9BVURJTyB7CgkJCQlyZWcgPSA8
UkszMzk5X1BEX1NESU9BVURJTz47CgkJCQljbG9ja3MgPSA8JmNydSBIQ0xLX1NESU8+OwoJCQkJ
cG1fcW9zID0gPCZxb3Nfc2Rpb2F1ZGlvPjsKCQkJCSNwb3dlci1kb21haW4tY2VsbHMgPSA8MD47
CgkJCX07CgkJCXBvd2VyLWRvbWFpbkBSSzMzOTlfUERfVENQRDAgewoJCQkJcmVnID0gPFJLMzM5
OV9QRF9UQ1BEMD47CgkJCQljbG9ja3MgPSA8JmNydSBTQ0xLX1VQSFkwX1RDUERDT1JFPiwKCQkJ
CQkgPCZjcnUgU0NMS19VUEhZMF9UQ1BEUEhZX1JFRj47CgkJCQkjcG93ZXItZG9tYWluLWNlbGxz
ID0gPDA+OwoJCQl9OwoJCQlwb3dlci1kb21haW5AUkszMzk5X1BEX1RDUEQxIHsKCQkJCXJlZyA9
IDxSSzMzOTlfUERfVENQRDE+OwoJCQkJY2xvY2tzID0gPCZjcnUgU0NMS19VUEhZMV9UQ1BEQ09S
RT4sCgkJCQkJIDwmY3J1IFNDTEtfVVBIWTFfVENQRFBIWV9SRUY+OwoJCQkJI3Bvd2VyLWRvbWFp
bi1jZWxscyA9IDwwPjsKCQkJfTsKCQkJcG93ZXItZG9tYWluQFJLMzM5OV9QRF9VU0IzIHsKCQkJ
CXJlZyA9IDxSSzMzOTlfUERfVVNCMz47CgkJCQljbG9ja3MgPSA8JmNydSBBQ0xLX1VTQjM+OwoJ
CQkJcG1fcW9zID0gPCZxb3NfdXNiX290ZzA+LAoJCQkJCSA8JnFvc191c2Jfb3RnMT47CgkJCQkj
cG93ZXItZG9tYWluLWNlbGxzID0gPDA+OwoJCQl9OwoJCQlwb3dlci1kb21haW5AUkszMzk5X1BE
X1ZJTyB7CgkJCQlyZWcgPSA8UkszMzk5X1BEX1ZJTz47CgkJCQkjcG93ZXItZG9tYWluLWNlbGxz
ID0gPDE+OwoJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CgkJCQkjc2l6ZS1jZWxscyA9IDwwPjsK
CgkJCQlwb3dlci1kb21haW5AUkszMzk5X1BEX0hEQ1AgewoJCQkJCXJlZyA9IDxSSzMzOTlfUERf
SERDUD47CgkJCQkJY2xvY2tzID0gPCZjcnUgQUNMS19IRENQPiwKCQkJCQkJIDwmY3J1IEhDTEtf
SERDUD4sCgkJCQkJCSA8JmNydSBQQ0xLX0hEQ1A+OwoJCQkJCXBtX3FvcyA9IDwmcW9zX2hkY3A+
OwoJCQkJCSNwb3dlci1kb21haW4tY2VsbHMgPSA8MD47CgkJCQl9OwoJCQkJcG93ZXItZG9tYWlu
QFJLMzM5OV9QRF9JU1AwIHsKCQkJCQlyZWcgPSA8UkszMzk5X1BEX0lTUDA+OwoJCQkJCWNsb2Nr
cyA9IDwmY3J1IEFDTEtfSVNQMD4sCgkJCQkJCSA8JmNydSBIQ0xLX0lTUDA+OwoJCQkJCXBtX3Fv
cyA9IDwmcW9zX2lzcDBfbTA+LAoJCQkJCQkgPCZxb3NfaXNwMF9tMT47CgkJCQkJI3Bvd2VyLWRv
bWFpbi1jZWxscyA9IDwwPjsKCQkJCX07CgkJCQlwb3dlci1kb21haW5AUkszMzk5X1BEX0lTUDEg
ewoJCQkJCXJlZyA9IDxSSzMzOTlfUERfSVNQMT47CgkJCQkJY2xvY2tzID0gPCZjcnUgQUNMS19J
U1AxPiwKCQkJCQkJIDwmY3J1IEhDTEtfSVNQMT47CgkJCQkJcG1fcW9zID0gPCZxb3NfaXNwMV9t
MD4sCgkJCQkJCSA8JnFvc19pc3AxX20xPjsKCQkJCQkjcG93ZXItZG9tYWluLWNlbGxzID0gPDA+
OwoJCQkJfTsKCQkJCXBvd2VyLWRvbWFpbkBSSzMzOTlfUERfVk8gewoJCQkJCXJlZyA9IDxSSzMz
OTlfUERfVk8+OwoJCQkJCSNwb3dlci1kb21haW4tY2VsbHMgPSA8MT47CgkJCQkJI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47CgkJCQkJI3NpemUtY2VsbHMgPSA8MD47CgoJCQkJCXBvd2VyLWRvbWFpbkBS
SzMzOTlfUERfVk9QQiB7CgkJCQkJCXJlZyA9IDxSSzMzOTlfUERfVk9QQj47CgkJCQkJCWNsb2Nr
cyA9IDwmY3J1IEFDTEtfVk9QMD4sCgkJCQkJCQkgPCZjcnUgSENMS19WT1AwPjsKCQkJCQkJcG1f
cW9zID0gPCZxb3Nfdm9wX2JpZ19yPiwKCQkJCQkJCSA8JnFvc192b3BfYmlnX3c+OwoJCQkJCQkj
cG93ZXItZG9tYWluLWNlbGxzID0gPDA+OwoJCQkJCX07CgkJCQkJcG93ZXItZG9tYWluQFJLMzM5
OV9QRF9WT1BMIHsKCQkJCQkJcmVnID0gPFJLMzM5OV9QRF9WT1BMPjsKCQkJCQkJY2xvY2tzID0g
PCZjcnUgQUNMS19WT1AxPiwKCQkJCQkJCSA8JmNydSBIQ0xLX1ZPUDE+OwoJCQkJCQlwbV9xb3Mg
PSA8JnFvc192b3BfbGl0dGxlPjsKCQkJCQkJI3Bvd2VyLWRvbWFpbi1jZWxscyA9IDwwPjsKCQkJ
CQl9OwoJCQkJfTsKCQkJfTsKCQl9OwoJfTsKCglwbXVncmY6IHN5c2NvbkBmZjMyMDAwMCB7CgkJ
Y29tcGF0aWJsZSA9ICJyb2NrY2hpcCxyazMzOTktcG11Z3JmIiwgInN5c2NvbiIsICJzaW1wbGUt
bWZkIjsKCQlyZWcgPSA8MHgwIDB4ZmYzMjAwMDAgMHgwIDB4MTAwMD47CgoJCXBtdV9pb19kb21h
aW5zOiBpby1kb21haW5zIHsKCQkJY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxyazMzOTktcG11LWlv
LXZvbHRhZ2UtZG9tYWluIjsKCQkJc3RhdHVzID0gImRpc2FibGVkIjsKCQl9OwoJfTsKCglzcGkz
OiBzcGlAZmYzNTAwMDAgewoJCWNvbXBhdGlibGUgPSAicm9ja2NoaXAscmszMzk5LXNwaSIsICJy
b2NrY2hpcCxyazMwNjYtc3BpIjsKCQlyZWcgPSA8MHgwIDB4ZmYzNTAwMDAgMHgwIDB4MTAwMD47
CgkJY2xvY2tzID0gPCZwbXVjcnUgU0NMS19TUEkzX1BNVT4sIDwmcG11Y3J1IFBDTEtfU1BJM19Q
TVU+OwoJCWNsb2NrLW5hbWVzID0gInNwaWNsayIsICJhcGJfcGNsayI7CgkJaW50ZXJydXB0cyA9
IDxHSUNfU1BJIDYwIElSUV9UWVBFX0xFVkVMX0hJR0ggMD47CgkJcGluY3RybC1uYW1lcyA9ICJk
ZWZhdWx0IjsKCQlwaW5jdHJsLTAgPSA8JnNwaTNfY2xrICZzcGkzX3R4ICZzcGkzX3J4ICZzcGkz
X2NzMD47CgkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CgkJI3NpemUtY2VsbHMgPSA8MD47CgkJc3Rh
dHVzID0gImRpc2FibGVkIjsKCX07CgoJdWFydDQ6IHNlcmlhbEBmZjM3MDAwMCB7CgkJY29tcGF0
aWJsZSA9ICJyb2NrY2hpcCxyazMzOTktdWFydCIsICJzbnBzLGR3LWFwYi11YXJ0IjsKCQlyZWcg
PSA8MHgwIDB4ZmYzNzAwMDAgMHgwIDB4MTAwPjsKCQljbG9ja3MgPSA8JnBtdWNydSBTQ0xLX1VB
UlQ0X1BNVT4sIDwmcG11Y3J1IFBDTEtfVUFSVDRfUE1VPjsKCQljbG9jay1uYW1lcyA9ICJiYXVk
Y2xrIiwgImFwYl9wY2xrIjsKCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTAyIElSUV9UWVBFX0xF
VkVMX0hJR0ggMD47CgkJcmVnLXNoaWZ0ID0gPDI+OwoJCXJlZy1pby13aWR0aCA9IDw0PjsKCQlw
aW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwoJCXBpbmN0cmwtMCA9IDwmdWFydDRfeGZlcj47CgkJ
c3RhdHVzID0gImRpc2FibGVkIjsKCX07CgoJaTJjMDogaTJjQGZmM2MwMDAwIHsKCQljb21wYXRp
YmxlID0gInJvY2tjaGlwLHJrMzM5OS1pMmMiOwoJCXJlZyA9IDwweDAgMHhmZjNjMDAwMCAweDAg
MHgxMDAwPjsKCQlhc3NpZ25lZC1jbG9ja3MgPSA8JnBtdWNydSBTQ0xLX0kyQzBfUE1VPjsKCQlh
c3NpZ25lZC1jbG9jay1yYXRlcyA9IDwyMDAwMDAwMDA+OwoJCWNsb2NrcyA9IDwmcG11Y3J1IFND
TEtfSTJDMF9QTVU+LCA8JnBtdWNydSBQQ0xLX0kyQzBfUE1VPjsKCQljbG9jay1uYW1lcyA9ICJp
MmMiLCAicGNsayI7CgkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDU3IElSUV9UWVBFX0xFVkVMX0hJ
R0ggMD47CgkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKCQlwaW5jdHJsLTAgPSA8JmkyYzBf
eGZlcj47CgkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CgkJI3NpemUtY2VsbHMgPSA8MD47CgkJc3Rh
dHVzID0gImRpc2FibGVkIjsKCX07CgoJaTJjNDogaTJjQGZmM2QwMDAwIHsKCQljb21wYXRpYmxl
ID0gInJvY2tjaGlwLHJrMzM5OS1pMmMiOwoJCXJlZyA9IDwweDAgMHhmZjNkMDAwMCAweDAgMHgx
MDAwPjsKCQlhc3NpZ25lZC1jbG9ja3MgPSA8JnBtdWNydSBTQ0xLX0kyQzRfUE1VPjsKCQlhc3Np
Z25lZC1jbG9jay1yYXRlcyA9IDwyMDAwMDAwMDA+OwoJCWNsb2NrcyA9IDwmcG11Y3J1IFNDTEtf
STJDNF9QTVU+LCA8JnBtdWNydSBQQ0xLX0kyQzRfUE1VPjsKCQljbG9jay1uYW1lcyA9ICJpMmMi
LCAicGNsayI7CgkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDU2IElSUV9UWVBFX0xFVkVMX0hJR0gg
MD47CgkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKCQlwaW5jdHJsLTAgPSA8JmkyYzRfeGZl
cj47CgkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CgkJI3NpemUtY2VsbHMgPSA8MD47CgkJc3RhdHVz
ID0gImRpc2FibGVkIjsKCX07CgoJaTJjODogaTJjQGZmM2UwMDAwIHsKCQljb21wYXRpYmxlID0g
InJvY2tjaGlwLHJrMzM5OS1pMmMiOwoJCXJlZyA9IDwweDAgMHhmZjNlMDAwMCAweDAgMHgxMDAw
PjsKCQlhc3NpZ25lZC1jbG9ja3MgPSA8JnBtdWNydSBTQ0xLX0kyQzhfUE1VPjsKCQlhc3NpZ25l
ZC1jbG9jay1yYXRlcyA9IDwyMDAwMDAwMDA+OwoJCWNsb2NrcyA9IDwmcG11Y3J1IFNDTEtfSTJD
OF9QTVU+LCA8JnBtdWNydSBQQ0xLX0kyQzhfUE1VPjsKCQljbG9jay1uYW1lcyA9ICJpMmMiLCAi
cGNsayI7CgkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDU4IElSUV9UWVBFX0xFVkVMX0hJR0ggMD47
CgkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKCQlwaW5jdHJsLTAgPSA8JmkyYzhfeGZlcj47
CgkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CgkJI3NpemUtY2VsbHMgPSA8MD47CgkJc3RhdHVzID0g
ImRpc2FibGVkIjsKCX07CgoJcHdtMDogcHdtQGZmNDIwMDAwIHsKCQljb21wYXRpYmxlID0gInJv
Y2tjaGlwLHJrMzM5OS1wd20iLCAicm9ja2NoaXAscmszMjg4LXB3bSI7CgkJcmVnID0gPDB4MCAw
eGZmNDIwMDAwIDB4MCAweDEwPjsKCQkjcHdtLWNlbGxzID0gPDM+OwoJCXBpbmN0cmwtbmFtZXMg
PSAiZGVmYXVsdCI7CgkJcGluY3RybC0wID0gPCZwd20wX3Bpbj47CgkJY2xvY2tzID0gPCZwbXVj
cnUgUENMS19SS1BXTV9QTVU+OwoJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cgl9OwoKCXB3bTE6IHB3
bUBmZjQyMDAxMCB7CgkJY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxyazMzOTktcHdtIiwgInJvY2tj
aGlwLHJrMzI4OC1wd20iOwoJCXJlZyA9IDwweDAgMHhmZjQyMDAxMCAweDAgMHgxMD47CgkJI3B3
bS1jZWxscyA9IDwzPjsKCQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwoJCXBpbmN0cmwtMCA9
IDwmcHdtMV9waW4+OwoJCWNsb2NrcyA9IDwmcG11Y3J1IFBDTEtfUktQV01fUE1VPjsKCQlzdGF0
dXMgPSAiZGlzYWJsZWQiOwoJfTsKCglwd20yOiBwd21AZmY0MjAwMjAgewoJCWNvbXBhdGlibGUg
PSAicm9ja2NoaXAscmszMzk5LXB3bSIsICJyb2NrY2hpcCxyazMyODgtcHdtIjsKCQlyZWcgPSA8
MHgwIDB4ZmY0MjAwMjAgMHgwIDB4MTA+OwoJCSNwd20tY2VsbHMgPSA8Mz47CgkJcGluY3RybC1u
YW1lcyA9ICJkZWZhdWx0IjsKCQlwaW5jdHJsLTAgPSA8JnB3bTJfcGluPjsKCQljbG9ja3MgPSA8
JnBtdWNydSBQQ0xLX1JLUFdNX1BNVT47CgkJc3RhdHVzID0gImRpc2FibGVkIjsKCX07CgoJcHdt
MzogcHdtQGZmNDIwMDMwIHsKCQljb21wYXRpYmxlID0gInJvY2tjaGlwLHJrMzM5OS1wd20iLCAi
cm9ja2NoaXAscmszMjg4LXB3bSI7CgkJcmVnID0gPDB4MCAweGZmNDIwMDMwIDB4MCAweDEwPjsK
CQkjcHdtLWNlbGxzID0gPDM+OwoJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CgkJcGluY3Ry
bC0wID0gPCZwd20zYV9waW4+OwoJCWNsb2NrcyA9IDwmcG11Y3J1IFBDTEtfUktQV01fUE1VPjsK
CQlzdGF0dXMgPSAiZGlzYWJsZWQiOwoJfTsKCgl2cHU6IHZpZGVvLWNvZGVjQGZmNjUwMDAwIHsK
CQljb21wYXRpYmxlID0gInJvY2tjaGlwLHJrMzM5OS12cHUiOwoJCXJlZyA9IDwweDAgMHhmZjY1
MDAwMCAweDAgMHg4MDA+OwoJCWludGVycnVwdHMgPSA8R0lDX1NQSSAxMTQgSVJRX1RZUEVfTEVW
RUxfSElHSCAwPiwKCQkJICAgICA8R0lDX1NQSSAxMTMgSVJRX1RZUEVfTEVWRUxfSElHSCAwPjsK
CQlpbnRlcnJ1cHQtbmFtZXMgPSAidmVwdSIsICJ2ZHB1IjsKCQljbG9ja3MgPSA8JmNydSBBQ0xL
X1ZDT0RFQz4sIDwmY3J1IEhDTEtfVkNPREVDPjsKCQljbG9jay1uYW1lcyA9ICJhY2xrIiwgImhj
bGsiOwoJCWlvbW11cyA9IDwmdnB1X21tdT47CgkJcG93ZXItZG9tYWlucyA9IDwmcG93ZXIgUksz
Mzk5X1BEX1ZDT0RFQz47Cgl9OwoKCXZwdV9tbXU6IGlvbW11QGZmNjUwODAwIHsKCQljb21wYXRp
YmxlID0gInJvY2tjaGlwLGlvbW11IjsKCQlyZWcgPSA8MHgwIDB4ZmY2NTA4MDAgMHgwIDB4NDA+
OwoJCWludGVycnVwdHMgPSA8R0lDX1NQSSAxMTUgSVJRX1RZUEVfTEVWRUxfSElHSCAwPjsKCQlp
bnRlcnJ1cHQtbmFtZXMgPSAidnB1X21tdSI7CgkJY2xvY2tzID0gPCZjcnUgQUNMS19WQ09ERUM+
LCA8JmNydSBIQ0xLX1ZDT0RFQz47CgkJY2xvY2stbmFtZXMgPSAiYWNsayIsICJpZmFjZSI7CgkJ
I2lvbW11LWNlbGxzID0gPDA+OwoJCXBvd2VyLWRvbWFpbnMgPSA8JnBvd2VyIFJLMzM5OV9QRF9W
Q09ERUM+OwoJfTsKCgl2ZGVjOiB2aWRlby1jb2RlY0BmZjY2MDAwMCB7CgkJY29tcGF0aWJsZSA9
ICJyb2NrY2hpcCxyazMzOTktdmRlYyI7CgkJcmVnID0gPDB4MCAweGZmNjYwMDAwIDB4MCAweDQw
MD47CgkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDExNiBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+OwoJ
CWNsb2NrcyA9IDwmY3J1IEFDTEtfVkRVPiwgPCZjcnUgSENMS19WRFU+LAoJCQkgPCZjcnUgU0NM
S19WRFVfQ0E+LCA8JmNydSBTQ0xLX1ZEVV9DT1JFPjsKCQljbG9jay1uYW1lcyA9ICJheGkiLCAi
YWhiIiwgImNhYmFjIiwgImNvcmUiOwoJCWlvbW11cyA9IDwmdmRlY19tbXU+OwoJCXBvd2VyLWRv
bWFpbnMgPSA8JnBvd2VyIFJLMzM5OV9QRF9WRFU+OwoJfTsKCgl2ZGVjX21tdTogaW9tbXVAZmY2
NjA0ODAgewoJCWNvbXBhdGlibGUgPSAicm9ja2NoaXAsaW9tbXUiOwoJCXJlZyA9IDwweDAgMHhm
ZjY2MDQ4MCAweDAgMHg0MD4sIDwweDAgMHhmZjY2MDRjMCAweDAgMHg0MD47CgkJaW50ZXJydXB0
cyA9IDxHSUNfU1BJIDExNyBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+OwoJCWludGVycnVwdC1uYW1l
cyA9ICJ2ZGVjX21tdSI7CgkJY2xvY2tzID0gPCZjcnUgQUNMS19WRFU+LCA8JmNydSBIQ0xLX1ZE
VT47CgkJY2xvY2stbmFtZXMgPSAiYWNsayIsICJpZmFjZSI7CgkJcG93ZXItZG9tYWlucyA9IDwm
cG93ZXIgUkszMzk5X1BEX1ZEVT47CgkJI2lvbW11LWNlbGxzID0gPDA+OwoJfTsKCglpZXBfbW11
OiBpb21tdUBmZjY3MDgwMCB7CgkJY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxpb21tdSI7CgkJcmVn
ID0gPDB4MCAweGZmNjcwODAwIDB4MCAweDQwPjsKCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNDIg
SVJRX1RZUEVfTEVWRUxfSElHSCAwPjsKCQlpbnRlcnJ1cHQtbmFtZXMgPSAiaWVwX21tdSI7CgkJ
Y2xvY2tzID0gPCZjcnUgQUNMS19JRVA+LCA8JmNydSBIQ0xLX0lFUD47CgkJY2xvY2stbmFtZXMg
PSAiYWNsayIsICJpZmFjZSI7CgkJI2lvbW11LWNlbGxzID0gPDA+OwoJCXN0YXR1cyA9ICJkaXNh
YmxlZCI7Cgl9OwoKCXJnYTogcmdhQGZmNjgwMDAwIHsKCQljb21wYXRpYmxlID0gInJvY2tjaGlw
LHJrMzM5OS1yZ2EiOwoJCXJlZyA9IDwweDAgMHhmZjY4MDAwMCAweDAgMHgxMDAwMD47CgkJaW50
ZXJydXB0cyA9IDxHSUNfU1BJIDU1IElSUV9UWVBFX0xFVkVMX0hJR0ggMD47CgkJY2xvY2tzID0g
PCZjcnUgQUNMS19SR0E+LCA8JmNydSBIQ0xLX1JHQT4sIDwmY3J1IFNDTEtfUkdBX0NPUkU+OwoJ
CWNsb2NrLW5hbWVzID0gImFjbGsiLCAiaGNsayIsICJzY2xrIjsKCQlyZXNldHMgPSA8JmNydSBT
UlNUX1JHQV9DT1JFPiwgPCZjcnUgU1JTVF9BX1JHQT4sIDwmY3J1IFNSU1RfSF9SR0E+OwoJCXJl
c2V0LW5hbWVzID0gImNvcmUiLCAiYXhpIiwgImFoYiI7CgkJcG93ZXItZG9tYWlucyA9IDwmcG93
ZXIgUkszMzk5X1BEX1JHQT47Cgl9OwoKCWVmdXNlMDogZWZ1c2VAZmY2OTAwMDAgewoJCWNvbXBh
dGlibGUgPSAicm9ja2NoaXAscmszMzk5LWVmdXNlIjsKCQlyZWcgPSA8MHgwIDB4ZmY2OTAwMDAg
MHgwIDB4ODA+OwoJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwoJCSNzaXplLWNlbGxzID0gPDE+OwoJ
CWNsb2NrcyA9IDwmY3J1IFBDTEtfRUZVU0UxMDI0TlM+OwoJCWNsb2NrLW5hbWVzID0gInBjbGtf
ZWZ1c2UiOwoKCQkvKiBEYXRhIGNlbGxzICovCgkJY3B1X2lkOiBjcHUtaWRANyB7CgkJCXJlZyA9
IDwweDA3IDB4MTA+OwoJCX07CgkJY3B1Yl9sZWFrYWdlOiBjcHUtbGVha2FnZUAxNyB7CgkJCXJl
ZyA9IDwweDE3IDB4MT47CgkJfTsKCQlncHVfbGVha2FnZTogZ3B1LWxlYWthZ2VAMTggewoJCQly
ZWcgPSA8MHgxOCAweDE+OwoJCX07CgkJY2VudGVyX2xlYWthZ2U6IGNlbnRlci1sZWFrYWdlQDE5
IHsKCQkJcmVnID0gPDB4MTkgMHgxPjsKCQl9OwoJCWNwdWxfbGVha2FnZTogY3B1LWxlYWthZ2VA
MWEgewoJCQlyZWcgPSA8MHgxYSAweDE+OwoJCX07CgkJbG9naWNfbGVha2FnZTogbG9naWMtbGVh
a2FnZUAxYiB7CgkJCXJlZyA9IDwweDFiIDB4MT47CgkJfTsKCQl3YWZlcl9pbmZvOiB3YWZlci1p
bmZvQDFjIHsKCQkJcmVnID0gPDB4MWMgMHgxPjsKCQl9OwoJfTsKCglkbWFjX2J1czogZG1hLWNv
bnRyb2xsZXJAZmY2ZDAwMDAgewoJCWNvbXBhdGlibGUgPSAiYXJtLHBsMzMwIiwgImFybSxwcmlt
ZWNlbGwiOwoJCXJlZyA9IDwweDAgMHhmZjZkMDAwMCAweDAgMHg0MDAwPjsKCQlpbnRlcnJ1cHRz
ID0gPEdJQ19TUEkgNSBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+LAoJCQkgICAgIDxHSUNfU1BJIDYg
SVJRX1RZUEVfTEVWRUxfSElHSCAwPjsKCQkjZG1hLWNlbGxzID0gPDE+OwoJCWFybSxwbDMzMC1w
ZXJpcGgtYnVyc3Q7CgkJY2xvY2tzID0gPCZjcnUgQUNMS19ETUFDMF9QRVJJTFA+OwoJCWNsb2Nr
LW5hbWVzID0gImFwYl9wY2xrIjsKCX07CgoJZG1hY19wZXJpOiBkbWEtY29udHJvbGxlckBmZjZl
MDAwMCB7CgkJY29tcGF0aWJsZSA9ICJhcm0scGwzMzAiLCAiYXJtLHByaW1lY2VsbCI7CgkJcmVn
ID0gPDB4MCAweGZmNmUwMDAwIDB4MCAweDQwMDA+OwoJCWludGVycnVwdHMgPSA8R0lDX1NQSSA3
IElSUV9UWVBFX0xFVkVMX0hJR0ggMD4sCgkJCSAgICAgPEdJQ19TUEkgOCBJUlFfVFlQRV9MRVZF
TF9ISUdIIDA+OwoJCSNkbWEtY2VsbHMgPSA8MT47CgkJYXJtLHBsMzMwLXBlcmlwaC1idXJzdDsK
CQljbG9ja3MgPSA8JmNydSBBQ0xLX0RNQUMxX1BFUklMUD47CgkJY2xvY2stbmFtZXMgPSAiYXBi
X3BjbGsiOwoJfTsKCglwbXVjcnU6IHBtdS1jbG9jay1jb250cm9sbGVyQGZmNzUwMDAwIHsKCQlj
b21wYXRpYmxlID0gInJvY2tjaGlwLHJrMzM5OS1wbXVjcnUiOwoJCXJlZyA9IDwweDAgMHhmZjc1
MDAwMCAweDAgMHgxMDAwPjsKCQlyb2NrY2hpcCxncmYgPSA8JnBtdWdyZj47CgkJI2Nsb2NrLWNl
bGxzID0gPDE+OwoJCSNyZXNldC1jZWxscyA9IDwxPjsKCQlhc3NpZ25lZC1jbG9ja3MgPSA8JnBt
dWNydSBQTExfUFBMTD47CgkJYXNzaWduZWQtY2xvY2stcmF0ZXMgPSA8Njc2MDAwMDAwPjsKCX07
CgoJY3J1OiBjbG9jay1jb250cm9sbGVyQGZmNzYwMDAwIHsKCQljb21wYXRpYmxlID0gInJvY2tj
aGlwLHJrMzM5OS1jcnUiOwoJCXJlZyA9IDwweDAgMHhmZjc2MDAwMCAweDAgMHgxMDAwPjsKCQly
b2NrY2hpcCxncmYgPSA8JmdyZj47CgkJI2Nsb2NrLWNlbGxzID0gPDE+OwoJCSNyZXNldC1jZWxs
cyA9IDwxPjsKCQlhc3NpZ25lZC1jbG9ja3MgPQoJCQk8JmNydSBQTExfR1BMTD4sIDwmY3J1IFBM
TF9DUExMPiwKCQkJPCZjcnUgUExMX05QTEw+LAoJCQk8JmNydSBBQ0xLX1BFUklIUD4sIDwmY3J1
IEhDTEtfUEVSSUhQPiwKCQkJPCZjcnUgUENMS19QRVJJSFA+LAoJCQk8JmNydSBBQ0xLX1BFUklM
UDA+LCA8JmNydSBIQ0xLX1BFUklMUDA+LAoJCQk8JmNydSBQQ0xLX1BFUklMUDA+LCA8JmNydSBB
Q0xLX0NDST4sCgkJCTwmY3J1IEhDTEtfUEVSSUxQMT4sIDwmY3J1IFBDTEtfUEVSSUxQMT4sCgkJ
CTwmY3J1IEFDTEtfVklPPiwgPCZjcnUgQUNMS19IRENQPiwKCQkJPCZjcnUgQUNMS19HSUNfUFJF
PiwKCQkJPCZjcnUgUENMS19ERFI+OwoJCWFzc2lnbmVkLWNsb2NrLXJhdGVzID0KCQkJIDw1OTQw
MDAwMDA+LCAgPDgwMDAwMDAwMD4sCgkJCTwxMDAwMDAwMDAwPiwKCQkJIDwxNTAwMDAwMDA+LCAg
IDw3NTAwMDAwMD4sCgkJCSAgPDM3NTAwMDAwPiwKCQkJIDwxMDAwMDAwMDA+LCAgPDEwMDAwMDAw
MD4sCgkJCSAgPDUwMDAwMDAwPiwgPDYwMDAwMDAwMD4sCgkJCSA8MTAwMDAwMDAwPiwgICA8NTAw
MDAwMDA+LAoJCQkgPDQwMDAwMDAwMD4sIDw0MDAwMDAwMDA+LAoJCQkgPDIwMDAwMDAwMD4sCgkJ
CSA8MjAwMDAwMDAwPjsKCX07CgoJZ3JmOiBzeXNjb25AZmY3NzAwMDAgewoJCWNvbXBhdGlibGUg
PSAicm9ja2NoaXAscmszMzk5LWdyZiIsICJzeXNjb24iLCAic2ltcGxlLW1mZCI7CgkJcmVnID0g
PDB4MCAweGZmNzcwMDAwIDB4MCAweDEwMDAwPjsKCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKCQkj
c2l6ZS1jZWxscyA9IDwxPjsKCgkJaW9fZG9tYWluczogaW8tZG9tYWlucyB7CgkJCWNvbXBhdGli
bGUgPSAicm9ja2NoaXAscmszMzk5LWlvLXZvbHRhZ2UtZG9tYWluIjsKCQkJc3RhdHVzID0gImRp
c2FibGVkIjsKCQl9OwoKCQltaXBpX2RwaHlfcngwOiBtaXBpLWRwaHktcngwIHsKCQkJY29tcGF0
aWJsZSA9ICJyb2NrY2hpcCxyazMzOTktbWlwaS1kcGh5LXJ4MCI7CgkJCWNsb2NrcyA9IDwmY3J1
IFNDTEtfTUlQSURQSFlfUkVGPiwKCQkJCSA8JmNydSBTQ0xLX0RQSFlfUlgwX0NGRz4sCgkJCQkg
PCZjcnUgUENMS19WSU9fR1JGPjsKCQkJY2xvY2stbmFtZXMgPSAiZHBoeS1yZWYiLCAiZHBoeS1j
ZmciLCAiZ3JmIjsKCQkJcG93ZXItZG9tYWlucyA9IDwmcG93ZXIgUkszMzk5X1BEX1ZJTz47CgkJ
CSNwaHktY2VsbHMgPSA8MD47CgkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CgkJfTsKCgkJdTJwaHkw
OiB1c2IycGh5QGU0NTAgewoJCQljb21wYXRpYmxlID0gInJvY2tjaGlwLHJrMzM5OS11c2IycGh5
IjsKCQkJcmVnID0gPDB4ZTQ1MCAweDEwPjsKCQkJY2xvY2tzID0gPCZjcnUgU0NMS19VU0IyUEhZ
MF9SRUY+OwoJCQljbG9jay1uYW1lcyA9ICJwaHljbGsiOwoJCQkjY2xvY2stY2VsbHMgPSA8MD47
CgkJCWNsb2NrLW91dHB1dC1uYW1lcyA9ICJjbGtfdXNicGh5MF80ODBtIjsKCQkJc3RhdHVzID0g
ImRpc2FibGVkIjsKCgkJCXUycGh5MF9ob3N0OiBob3N0LXBvcnQgewoJCQkJI3BoeS1jZWxscyA9
IDwwPjsKCQkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAyNyBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+
OwoJCQkJaW50ZXJydXB0LW5hbWVzID0gImxpbmVzdGF0ZSI7CgkJCQlzdGF0dXMgPSAiZGlzYWJs
ZWQiOwoJCQl9OwoKCQkJdTJwaHkwX290Zzogb3RnLXBvcnQgewoJCQkJI3BoeS1jZWxscyA9IDww
PjsKCQkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAxMDMgSVJRX1RZUEVfTEVWRUxfSElHSCAwPiwK
CQkJCQkgICAgIDxHSUNfU1BJIDEwNCBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+LAoJCQkJCSAgICAg
PEdJQ19TUEkgMTA2IElSUV9UWVBFX0xFVkVMX0hJR0ggMD47CgkJCQlpbnRlcnJ1cHQtbmFtZXMg
PSAib3RnLWJ2YWxpZCIsICJvdGctaWQiLAoJCQkJCQkgICJsaW5lc3RhdGUiOwoJCQkJc3RhdHVz
ID0gImRpc2FibGVkIjsKCQkJfTsKCQl9OwoKCQl1MnBoeTE6IHVzYjJwaHlAZTQ2MCB7CgkJCWNv
bXBhdGlibGUgPSAicm9ja2NoaXAscmszMzk5LXVzYjJwaHkiOwoJCQlyZWcgPSA8MHhlNDYwIDB4
MTA+OwoJCQljbG9ja3MgPSA8JmNydSBTQ0xLX1VTQjJQSFkxX1JFRj47CgkJCWNsb2NrLW5hbWVz
ID0gInBoeWNsayI7CgkJCSNjbG9jay1jZWxscyA9IDwwPjsKCQkJY2xvY2stb3V0cHV0LW5hbWVz
ID0gImNsa191c2JwaHkxXzQ4MG0iOwoJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwoKCQkJdTJwaHkx
X2hvc3Q6IGhvc3QtcG9ydCB7CgkJCQkjcGh5LWNlbGxzID0gPDA+OwoJCQkJaW50ZXJydXB0cyA9
IDxHSUNfU1BJIDMxIElSUV9UWVBFX0xFVkVMX0hJR0ggMD47CgkJCQlpbnRlcnJ1cHQtbmFtZXMg
PSAibGluZXN0YXRlIjsKCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CgkJCX07CgoJCQl1MnBoeTFf
b3RnOiBvdGctcG9ydCB7CgkJCQkjcGh5LWNlbGxzID0gPDA+OwoJCQkJaW50ZXJydXB0cyA9IDxH
SUNfU1BJIDEwOCBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+LAoJCQkJCSAgICAgPEdJQ19TUEkgMTA5
IElSUV9UWVBFX0xFVkVMX0hJR0ggMD4sCgkJCQkJICAgICA8R0lDX1NQSSAxMTEgSVJRX1RZUEVf
TEVWRUxfSElHSCAwPjsKCQkJCWludGVycnVwdC1uYW1lcyA9ICJvdGctYnZhbGlkIiwgIm90Zy1p
ZCIsCgkJCQkJCSAgImxpbmVzdGF0ZSI7CgkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwoJCQl9OwoJ
CX07CgoJCWVtbWNfcGh5OiBwaHlAZjc4MCB7CgkJCWNvbXBhdGlibGUgPSAicm9ja2NoaXAscmsz
Mzk5LWVtbWMtcGh5IjsKCQkJcmVnID0gPDB4Zjc4MCAweDI0PjsKCQkJY2xvY2tzID0gPCZzZGhj
aT47CgkJCWNsb2NrLW5hbWVzID0gImVtbWNjbGsiOwoJCQkjcGh5LWNlbGxzID0gPDA+OwoJCQlz
dGF0dXMgPSAiZGlzYWJsZWQiOwoJCX07CgoJCXBjaWVfcGh5OiBwY2llLXBoeSB7CgkJCWNvbXBh
dGlibGUgPSAicm9ja2NoaXAscmszMzk5LXBjaWUtcGh5IjsKCQkJY2xvY2tzID0gPCZjcnUgU0NM
S19QQ0lFUEhZX1JFRj47CgkJCWNsb2NrLW5hbWVzID0gInJlZmNsayI7CgkJCSNwaHktY2VsbHMg
PSA8MT47CgkJCXJlc2V0cyA9IDwmY3J1IFNSU1RfUENJRVBIWT47CgkJCWRyaXZlLWltcGVkYW5j
ZS1vaG0gPSA8NTA+OwoJCQlyZXNldC1uYW1lcyA9ICJwaHkiOwoJCQlzdGF0dXMgPSAiZGlzYWJs
ZWQiOwoJCX07Cgl9OwoKCXRjcGh5MDogcGh5QGZmN2MwMDAwIHsKCQljb21wYXRpYmxlID0gInJv
Y2tjaGlwLHJrMzM5OS10eXBlYy1waHkiOwoJCXJlZyA9IDwweDAgMHhmZjdjMDAwMCAweDAgMHg0
MDAwMD47CgkJY2xvY2tzID0gPCZjcnUgU0NMS19VUEhZMF9UQ1BEQ09SRT4sCgkJCSA8JmNydSBT
Q0xLX1VQSFkwX1RDUERQSFlfUkVGPjsKCQljbG9jay1uYW1lcyA9ICJ0Y3BkY29yZSIsICJ0Y3Bk
cGh5LXJlZiI7CgkJYXNzaWduZWQtY2xvY2tzID0gPCZjcnUgU0NMS19VUEhZMF9UQ1BEQ09SRT47
CgkJYXNzaWduZWQtY2xvY2stcmF0ZXMgPSA8NTAwMDAwMDA+OwoJCXBvd2VyLWRvbWFpbnMgPSA8
JnBvd2VyIFJLMzM5OV9QRF9UQ1BEMD47CgkJcmVzZXRzID0gPCZjcnUgU1JTVF9VUEhZMD4sCgkJ
CSA8JmNydSBTUlNUX1VQSFkwX1BJUEVfTDAwPiwKCQkJIDwmY3J1IFNSU1RfUF9VUEhZMF9UQ1BI
WT47CgkJcmVzZXQtbmFtZXMgPSAidXBoeSIsICJ1cGh5LXBpcGUiLCAidXBoeS10Y3BoeSI7CgkJ
cm9ja2NoaXAsZ3JmID0gPCZncmY+OwoJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CgoJCXRjcGh5MF9k
cDogZHAtcG9ydCB7CgkJCSNwaHktY2VsbHMgPSA8MD47CgkJfTsKCgkJdGNwaHkwX3VzYjM6IHVz
YjMtcG9ydCB7CgkJCSNwaHktY2VsbHMgPSA8MD47CgkJfTsKCX07CgoJdGNwaHkxOiBwaHlAZmY4
MDAwMDAgewoJCWNvbXBhdGlibGUgPSAicm9ja2NoaXAscmszMzk5LXR5cGVjLXBoeSI7CgkJcmVn
ID0gPDB4MCAweGZmODAwMDAwIDB4MCAweDQwMDAwPjsKCQljbG9ja3MgPSA8JmNydSBTQ0xLX1VQ
SFkxX1RDUERDT1JFPiwKCQkJIDwmY3J1IFNDTEtfVVBIWTFfVENQRFBIWV9SRUY+OwoJCWNsb2Nr
LW5hbWVzID0gInRjcGRjb3JlIiwgInRjcGRwaHktcmVmIjsKCQlhc3NpZ25lZC1jbG9ja3MgPSA8
JmNydSBTQ0xLX1VQSFkxX1RDUERDT1JFPjsKCQlhc3NpZ25lZC1jbG9jay1yYXRlcyA9IDw1MDAw
MDAwMD47CgkJcG93ZXItZG9tYWlucyA9IDwmcG93ZXIgUkszMzk5X1BEX1RDUEQxPjsKCQlyZXNl
dHMgPSA8JmNydSBTUlNUX1VQSFkxPiwKCQkJIDwmY3J1IFNSU1RfVVBIWTFfUElQRV9MMDA+LAoJ
CQkgPCZjcnUgU1JTVF9QX1VQSFkxX1RDUEhZPjsKCQlyZXNldC1uYW1lcyA9ICJ1cGh5IiwgInVw
aHktcGlwZSIsICJ1cGh5LXRjcGh5IjsKCQlyb2NrY2hpcCxncmYgPSA8JmdyZj47CgkJc3RhdHVz
ID0gImRpc2FibGVkIjsKCgkJdGNwaHkxX2RwOiBkcC1wb3J0IHsKCQkJI3BoeS1jZWxscyA9IDww
PjsKCQl9OwoKCQl0Y3BoeTFfdXNiMzogdXNiMy1wb3J0IHsKCQkJI3BoeS1jZWxscyA9IDwwPjsK
CQl9OwoJfTsKCgl3YXRjaGRvZ0BmZjg0ODAwMCB7CgkJY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxy
azMzOTktd2R0IiwgInNucHMsZHctd2R0IjsKCQlyZWcgPSA8MHgwIDB4ZmY4NDgwMDAgMHgwIDB4
MTAwPjsKCQljbG9ja3MgPSA8JmNydSBQQ0xLX1dEVD47CgkJaW50ZXJydXB0cyA9IDxHSUNfU1BJ
IDEyMCBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+OwoJfTsKCglya3RpbWVyOiBya3RpbWVyQGZmODUw
MDAwIHsKCQljb21wYXRpYmxlID0gInJvY2tjaGlwLHJrMzM5OS10aW1lciI7CgkJcmVnID0gPDB4
MCAweGZmODUwMDAwIDB4MCAweDEwMDA+OwoJCWludGVycnVwdHMgPSA8R0lDX1NQSSA4MSBJUlFf
VFlQRV9MRVZFTF9ISUdIIDA+OwoJCWNsb2NrcyA9IDwmY3J1IFBDTEtfVElNRVIwPiwgPCZjcnUg
U0NMS19USU1FUjAwPjsKCQljbG9jay1uYW1lcyA9ICJwY2xrIiwgInRpbWVyIjsKCX07CgoJc3Bk
aWY6IHNwZGlmQGZmODcwMDAwIHsKCQljb21wYXRpYmxlID0gInJvY2tjaGlwLHJrMzM5OS1zcGRp
ZiI7CgkJcmVnID0gPDB4MCAweGZmODcwMDAwIDB4MCAweDEwMDA+OwoJCWludGVycnVwdHMgPSA8
R0lDX1NQSSA2NiBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+OwoJCWRtYXMgPSA8JmRtYWNfYnVzIDc+
OwoJCWRtYS1uYW1lcyA9ICJ0eCI7CgkJY2xvY2stbmFtZXMgPSAibWNsayIsICJoY2xrIjsKCQlj
bG9ja3MgPSA8JmNydSBTQ0xLX1NQRElGXzhDSD4sIDwmY3J1IEhDTEtfU1BESUY+OwoJCXBpbmN0
cmwtbmFtZXMgPSAiZGVmYXVsdCI7CgkJcGluY3RybC0wID0gPCZzcGRpZl9idXM+OwoJCXBvd2Vy
LWRvbWFpbnMgPSA8JnBvd2VyIFJLMzM5OV9QRF9TRElPQVVESU8+OwoJCSNzb3VuZC1kYWktY2Vs
bHMgPSA8MD47CgkJc3RhdHVzID0gImRpc2FibGVkIjsKCX07CgoJaTJzMDogaTJzQGZmODgwMDAw
IHsKCQljb21wYXRpYmxlID0gInJvY2tjaGlwLHJrMzM5OS1pMnMiLCAicm9ja2NoaXAscmszMDY2
LWkycyI7CgkJcmVnID0gPDB4MCAweGZmODgwMDAwIDB4MCAweDEwMDA+OwoJCXJvY2tjaGlwLGdy
ZiA9IDwmZ3JmPjsKCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMzkgSVJRX1RZUEVfTEVWRUxfSElH
SCAwPjsKCQlkbWFzID0gPCZkbWFjX2J1cyAwPiwgPCZkbWFjX2J1cyAxPjsKCQlkbWEtbmFtZXMg
PSAidHgiLCAicngiOwoJCWNsb2NrLW5hbWVzID0gImkyc19jbGsiLCAiaTJzX2hjbGsiOwoJCWNs
b2NrcyA9IDwmY3J1IFNDTEtfSTJTMF84Q0g+LCA8JmNydSBIQ0xLX0kyUzBfOENIPjsKCQlwaW5j
dHJsLW5hbWVzID0gImRlZmF1bHQiOwoJCXBpbmN0cmwtMCA9IDwmaTJzMF84Y2hfYnVzPjsKCQlw
b3dlci1kb21haW5zID0gPCZwb3dlciBSSzMzOTlfUERfU0RJT0FVRElPPjsKCQkjc291bmQtZGFp
LWNlbGxzID0gPDA+OwoJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cgl9OwoKCWkyczE6IGkyc0BmZjg5
MDAwMCB7CgkJY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxyazMzOTktaTJzIiwgInJvY2tjaGlwLHJr
MzA2Ni1pMnMiOwoJCXJlZyA9IDwweDAgMHhmZjg5MDAwMCAweDAgMHgxMDAwPjsKCQlpbnRlcnJ1
cHRzID0gPEdJQ19TUEkgNDAgSVJRX1RZUEVfTEVWRUxfSElHSCAwPjsKCQlkbWFzID0gPCZkbWFj
X2J1cyAyPiwgPCZkbWFjX2J1cyAzPjsKCQlkbWEtbmFtZXMgPSAidHgiLCAicngiOwoJCWNsb2Nr
LW5hbWVzID0gImkyc19jbGsiLCAiaTJzX2hjbGsiOwoJCWNsb2NrcyA9IDwmY3J1IFNDTEtfSTJT
MV84Q0g+LCA8JmNydSBIQ0xLX0kyUzFfOENIPjsKCQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQi
OwoJCXBpbmN0cmwtMCA9IDwmaTJzMV8yY2hfYnVzPjsKCQlwb3dlci1kb21haW5zID0gPCZwb3dl
ciBSSzMzOTlfUERfU0RJT0FVRElPPjsKCQkjc291bmQtZGFpLWNlbGxzID0gPDA+OwoJCXN0YXR1
cyA9ICJkaXNhYmxlZCI7Cgl9OwoKCWkyczI6IGkyc0BmZjhhMDAwMCB7CgkJY29tcGF0aWJsZSA9
ICJyb2NrY2hpcCxyazMzOTktaTJzIiwgInJvY2tjaGlwLHJrMzA2Ni1pMnMiOwoJCXJlZyA9IDww
eDAgMHhmZjhhMDAwMCAweDAgMHgxMDAwPjsKCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNDEgSVJR
X1RZUEVfTEVWRUxfSElHSCAwPjsKCQlkbWFzID0gPCZkbWFjX2J1cyA0PiwgPCZkbWFjX2J1cyA1
PjsKCQlkbWEtbmFtZXMgPSAidHgiLCAicngiOwoJCWNsb2NrLW5hbWVzID0gImkyc19jbGsiLCAi
aTJzX2hjbGsiOwoJCWNsb2NrcyA9IDwmY3J1IFNDTEtfSTJTMl84Q0g+LCA8JmNydSBIQ0xLX0ky
UzJfOENIPjsKCQlwb3dlci1kb21haW5zID0gPCZwb3dlciBSSzMzOTlfUERfU0RJT0FVRElPPjsK
CQkjc291bmQtZGFpLWNlbGxzID0gPDA+OwoJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cgl9OwoKCXZv
cGw6IHZvcEBmZjhmMDAwMCB7CgkJY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxyazMzOTktdm9wLWxp
dCI7CgkJcmVnID0gPDB4MCAweGZmOGYwMDAwIDB4MCAweDNlZmM+OwoJCWludGVycnVwdHMgPSA8
R0lDX1NQSSAxMTkgSVJRX1RZUEVfTEVWRUxfSElHSCAwPjsKCQlhc3NpZ25lZC1jbG9ja3MgPSA8
JmNydSBBQ0xLX1ZPUDE+LCA8JmNydSBIQ0xLX1ZPUDE+OwoJCWFzc2lnbmVkLWNsb2NrLXJhdGVz
ID0gPDQwMDAwMDAwMD4sIDwxMDAwMDAwMDA+OwoJCWNsb2NrcyA9IDwmY3J1IEFDTEtfVk9QMT4s
IDwmY3J1IERDTEtfVk9QMT4sIDwmY3J1IEhDTEtfVk9QMT47CgkJY2xvY2stbmFtZXMgPSAiYWNs
a192b3AiLCAiZGNsa192b3AiLCAiaGNsa192b3AiOwoJCWlvbW11cyA9IDwmdm9wbF9tbXU+OwoJ
CXBvd2VyLWRvbWFpbnMgPSA8JnBvd2VyIFJLMzM5OV9QRF9WT1BMPjsKCQlyZXNldHMgPSA8JmNy
dSBTUlNUX0FfVk9QMT4sIDwmY3J1IFNSU1RfSF9WT1AxPiwgPCZjcnUgU1JTVF9EX1ZPUDE+OwoJ
CXJlc2V0LW5hbWVzID0gImF4aSIsICJhaGIiLCAiZGNsayI7CgkJc3RhdHVzID0gImRpc2FibGVk
IjsKCgkJdm9wbF9vdXQ6IHBvcnQgewoJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKCQkJI3NpemUt
Y2VsbHMgPSA8MD47CgoJCQl2b3BsX291dF9taXBpOiBlbmRwb2ludEAwIHsKCQkJCXJlZyA9IDww
PjsKCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmbWlwaV9pbl92b3BsPjsKCQkJfTsKCgkJCXZvcGxf
b3V0X2VkcDogZW5kcG9pbnRAMSB7CgkJCQlyZWcgPSA8MT47CgkJCQlyZW1vdGUtZW5kcG9pbnQg
PSA8JmVkcF9pbl92b3BsPjsKCQkJfTsKCgkJCXZvcGxfb3V0X2hkbWk6IGVuZHBvaW50QDIgewoJ
CQkJcmVnID0gPDI+OwoJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZoZG1pX2luX3ZvcGw+OwoJCQl9
OwoKCQkJdm9wbF9vdXRfbWlwaTE6IGVuZHBvaW50QDMgewoJCQkJcmVnID0gPDM+OwoJCQkJcmVt
b3RlLWVuZHBvaW50ID0gPCZtaXBpMV9pbl92b3BsPjsKCQkJfTsKCgkJCXZvcGxfb3V0X2RwOiBl
bmRwb2ludEA0IHsKCQkJCXJlZyA9IDw0PjsKCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZHBfaW5f
dm9wbD47CgkJCX07CgkJfTsKCX07CgoJdm9wbF9tbXU6IGlvbW11QGZmOGYzZjAwIHsKCQljb21w
YXRpYmxlID0gInJvY2tjaGlwLGlvbW11IjsKCQlyZWcgPSA8MHgwIDB4ZmY4ZjNmMDAgMHgwIDB4
MTAwPjsKCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTE5IElSUV9UWVBFX0xFVkVMX0hJR0ggMD47
CgkJaW50ZXJydXB0LW5hbWVzID0gInZvcGxfbW11IjsKCQljbG9ja3MgPSA8JmNydSBBQ0xLX1ZP
UDE+LCA8JmNydSBIQ0xLX1ZPUDE+OwoJCWNsb2NrLW5hbWVzID0gImFjbGsiLCAiaWZhY2UiOwoJ
CXBvd2VyLWRvbWFpbnMgPSA8JnBvd2VyIFJLMzM5OV9QRF9WT1BMPjsKCQkjaW9tbXUtY2VsbHMg
PSA8MD47CgkJc3RhdHVzID0gImRpc2FibGVkIjsKCX07CgoJdm9wYjogdm9wQGZmOTAwMDAwIHsK
CQljb21wYXRpYmxlID0gInJvY2tjaGlwLHJrMzM5OS12b3AtYmlnIjsKCQlyZWcgPSA8MHgwIDB4
ZmY5MDAwMDAgMHgwIDB4M2VmYz47CgkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDExOCBJUlFfVFlQ
RV9MRVZFTF9ISUdIIDA+OwoJCWFzc2lnbmVkLWNsb2NrcyA9IDwmY3J1IEFDTEtfVk9QMD4sIDwm
Y3J1IEhDTEtfVk9QMD47CgkJYXNzaWduZWQtY2xvY2stcmF0ZXMgPSA8NDAwMDAwMDAwPiwgPDEw
MDAwMDAwMD47CgkJY2xvY2tzID0gPCZjcnUgQUNMS19WT1AwPiwgPCZjcnUgRENMS19WT1AwPiwg
PCZjcnUgSENMS19WT1AwPjsKCQljbG9jay1uYW1lcyA9ICJhY2xrX3ZvcCIsICJkY2xrX3ZvcCIs
ICJoY2xrX3ZvcCI7CgkJaW9tbXVzID0gPCZ2b3BiX21tdT47CgkJcG93ZXItZG9tYWlucyA9IDwm
cG93ZXIgUkszMzk5X1BEX1ZPUEI+OwoJCXJlc2V0cyA9IDwmY3J1IFNSU1RfQV9WT1AwPiwgPCZj
cnUgU1JTVF9IX1ZPUDA+LCA8JmNydSBTUlNUX0RfVk9QMD47CgkJcmVzZXQtbmFtZXMgPSAiYXhp
IiwgImFoYiIsICJkY2xrIjsKCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwoKCQl2b3BiX291dDogcG9y
dCB7CgkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwoJCQkjc2l6ZS1jZWxscyA9IDwwPjsKCgkJCXZv
cGJfb3V0X2VkcDogZW5kcG9pbnRAMCB7CgkJCQlyZWcgPSA8MD47CgkJCQlyZW1vdGUtZW5kcG9p
bnQgPSA8JmVkcF9pbl92b3BiPjsKCQkJfTsKCgkJCXZvcGJfb3V0X21pcGk6IGVuZHBvaW50QDEg
ewoJCQkJcmVnID0gPDE+OwoJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZtaXBpX2luX3ZvcGI+OwoJ
CQl9OwoKCQkJdm9wYl9vdXRfaGRtaTogZW5kcG9pbnRAMiB7CgkJCQlyZWcgPSA8Mj47CgkJCQly
ZW1vdGUtZW5kcG9pbnQgPSA8JmhkbWlfaW5fdm9wYj47CgkJCX07CgoJCQl2b3BiX291dF9taXBp
MTogZW5kcG9pbnRAMyB7CgkJCQlyZWcgPSA8Mz47CgkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8Jm1p
cGkxX2luX3ZvcGI+OwoJCQl9OwoKCQkJdm9wYl9vdXRfZHA6IGVuZHBvaW50QDQgewoJCQkJcmVn
ID0gPDQ+OwoJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZkcF9pbl92b3BiPjsKCQkJfTsKCQl9OwoJ
fTsKCgl2b3BiX21tdTogaW9tbXVAZmY5MDNmMDAgewoJCWNvbXBhdGlibGUgPSAicm9ja2NoaXAs
aW9tbXUiOwoJCXJlZyA9IDwweDAgMHhmZjkwM2YwMCAweDAgMHgxMDA+OwoJCWludGVycnVwdHMg
PSA8R0lDX1NQSSAxMTggSVJRX1RZUEVfTEVWRUxfSElHSCAwPjsKCQlpbnRlcnJ1cHQtbmFtZXMg
PSAidm9wYl9tbXUiOwoJCWNsb2NrcyA9IDwmY3J1IEFDTEtfVk9QMD4sIDwmY3J1IEhDTEtfVk9Q
MD47CgkJY2xvY2stbmFtZXMgPSAiYWNsayIsICJpZmFjZSI7CgkJcG93ZXItZG9tYWlucyA9IDwm
cG93ZXIgUkszMzk5X1BEX1ZPUEI+OwoJCSNpb21tdS1jZWxscyA9IDwwPjsKCQlzdGF0dXMgPSAi
ZGlzYWJsZWQiOwoJfTsKCglpc3AwOiBpc3AwQGZmOTEwMDAwIHsKCQljb21wYXRpYmxlID0gInJv
Y2tjaGlwLHJrMzM5OS1jaWYtaXNwIjsKCQlyZWcgPSA8MHgwIDB4ZmY5MTAwMDAgMHgwIDB4NDAw
MD47CgkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDQzIElSUV9UWVBFX0xFVkVMX0hJR0ggMD47CgkJ
Y2xvY2tzID0gPCZjcnUgU0NMS19JU1AwPiwKCQkJIDwmY3J1IEFDTEtfSVNQMF9XUkFQUEVSPiwK
CQkJIDwmY3J1IEhDTEtfSVNQMF9XUkFQUEVSPjsKCQljbG9jay1uYW1lcyA9ICJpc3AiLCAiYWNs
ayIsICJoY2xrIjsKCQlpb21tdXMgPSA8JmlzcDBfbW11PjsKCQlwaHlzID0gPCZtaXBpX2RwaHlf
cngwPjsKCQlwaHktbmFtZXMgPSAiZHBoeSI7CgkJcG93ZXItZG9tYWlucyA9IDwmcG93ZXIgUksz
Mzk5X1BEX0lTUDA+OwoJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CgoJCXBvcnRzIHsKCQkJI2FkZHJl
c3MtY2VsbHMgPSA8MT47CgkJCSNzaXplLWNlbGxzID0gPDA+OwoKCQkJcG9ydEAwIHsKCQkJCXJl
ZyA9IDwwPjsKCQkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwoJCQkJI3NpemUtY2VsbHMgPSA8MD47
CgkJCX07CgkJfTsKCX07CgoJaXNwMF9tbXU6IGlvbW11QGZmOTE0MDAwIHsKCQljb21wYXRpYmxl
ID0gInJvY2tjaGlwLGlvbW11IjsKCQlyZWcgPSA8MHgwIDB4ZmY5MTQwMDAgMHgwIDB4MTAwPiwg
PDB4MCAweGZmOTE1MDAwIDB4MCAweDEwMD47CgkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDQzIElS
UV9UWVBFX0xFVkVMX0hJR0ggMD47CgkJaW50ZXJydXB0LW5hbWVzID0gImlzcDBfbW11IjsKCQlj
bG9ja3MgPSA8JmNydSBBQ0xLX0lTUDBfV1JBUFBFUj4sIDwmY3J1IEhDTEtfSVNQMF9XUkFQUEVS
PjsKCQljbG9jay1uYW1lcyA9ICJhY2xrIiwgImlmYWNlIjsKCQkjaW9tbXUtY2VsbHMgPSA8MD47
CgkJcG93ZXItZG9tYWlucyA9IDwmcG93ZXIgUkszMzk5X1BEX0lTUDA+OwoJCXJvY2tjaGlwLGRp
c2FibGUtbW11LXJlc2V0OwoJfTsKCglpc3AxX21tdTogaW9tbXVAZmY5MjQwMDAgewoJCWNvbXBh
dGlibGUgPSAicm9ja2NoaXAsaW9tbXUiOwoJCXJlZyA9IDwweDAgMHhmZjkyNDAwMCAweDAgMHgx
MDA+LCA8MHgwIDB4ZmY5MjUwMDAgMHgwIDB4MTAwPjsKCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkg
NDQgSVJRX1RZUEVfTEVWRUxfSElHSCAwPjsKCQlpbnRlcnJ1cHQtbmFtZXMgPSAiaXNwMV9tbXUi
OwoJCWNsb2NrcyA9IDwmY3J1IEFDTEtfSVNQMV9XUkFQUEVSPiwgPCZjcnUgSENMS19JU1AxX1dS
QVBQRVI+OwoJCWNsb2NrLW5hbWVzID0gImFjbGsiLCAiaWZhY2UiOwoJCSNpb21tdS1jZWxscyA9
IDwwPjsKCQlwb3dlci1kb21haW5zID0gPCZwb3dlciBSSzMzOTlfUERfSVNQMT47CgkJcm9ja2No
aXAsZGlzYWJsZS1tbXUtcmVzZXQ7Cgl9OwoKCWhkbWlfc291bmQ6IGhkbWktc291bmQgewoJCWNv
bXBhdGlibGUgPSAic2ltcGxlLWF1ZGlvLWNhcmQiOwoJCXNpbXBsZS1hdWRpby1jYXJkLGZvcm1h
dCA9ICJpMnMiOwoJCXNpbXBsZS1hdWRpby1jYXJkLG1jbGstZnMgPSA8MjU2PjsKCQlzaW1wbGUt
YXVkaW8tY2FyZCxuYW1lID0gImhkbWktc291bmQiOwoJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CgoJ
CXNpbXBsZS1hdWRpby1jYXJkLGNwdSB7CgkJCXNvdW5kLWRhaSA9IDwmaTJzMj47CgkJfTsKCQlz
aW1wbGUtYXVkaW8tY2FyZCxjb2RlYyB7CgkJCXNvdW5kLWRhaSA9IDwmaGRtaT47CgkJfTsKCX07
CgoJaGRtaTogaGRtaUBmZjk0MDAwMCB7CgkJY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxyazMzOTkt
ZHctaGRtaSI7CgkJcmVnID0gPDB4MCAweGZmOTQwMDAwIDB4MCAweDIwMDAwPjsKCQlpbnRlcnJ1
cHRzID0gPEdJQ19TUEkgMjMgSVJRX1RZUEVfTEVWRUxfSElHSCAwPjsKCQljbG9ja3MgPSA8JmNy
dSBQQ0xLX0hETUlfQ1RSTD4sCgkJCSA8JmNydSBTQ0xLX0hETUlfU0ZSPiwKCQkJIDwmY3J1IFBM
TF9WUExMPiwKCQkJIDwmY3J1IFBDTEtfVklPX0dSRj4sCgkJCSA8JmNydSBTQ0xLX0hETUlfQ0VD
PjsKCQljbG9jay1uYW1lcyA9ICJpYWhiIiwgImlzZnIiLCAidnBsbCIsICJncmYiLCAiY2VjIjsK
CQlwb3dlci1kb21haW5zID0gPCZwb3dlciBSSzMzOTlfUERfSERDUD47CgkJcmVnLWlvLXdpZHRo
ID0gPDQ+OwoJCXJvY2tjaGlwLGdyZiA9IDwmZ3JmPjsKCQkjc291bmQtZGFpLWNlbGxzID0gPDA+
OwoJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CgoJCXBvcnRzIHsKCQkJaGRtaV9pbjogcG9ydCB7CgkJ
CQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKCQkJCSNzaXplLWNlbGxzID0gPDA+OwoKCQkJCWhkbWlf
aW5fdm9wYjogZW5kcG9pbnRAMCB7CgkJCQkJcmVnID0gPDA+OwoJCQkJCXJlbW90ZS1lbmRwb2lu
dCA9IDwmdm9wYl9vdXRfaGRtaT47CgkJCQl9OwoJCQkJaGRtaV9pbl92b3BsOiBlbmRwb2ludEAx
IHsKCQkJCQlyZWcgPSA8MT47CgkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZ2b3BsX291dF9oZG1p
PjsKCQkJCX07CgkJCX07CgkJfTsKCX07CgoJbWlwaV9kc2k6IG1pcGlAZmY5NjAwMDAgewoJCWNv
bXBhdGlibGUgPSAicm9ja2NoaXAscmszMzk5LW1pcGktZHNpIiwgInNucHMsZHctbWlwaS1kc2ki
OwoJCXJlZyA9IDwweDAgMHhmZjk2MDAwMCAweDAgMHg4MDAwPjsKCQlpbnRlcnJ1cHRzID0gPEdJ
Q19TUEkgNDUgSVJRX1RZUEVfTEVWRUxfSElHSCAwPjsKCQljbG9ja3MgPSA8JmNydSBTQ0xLX0RQ
SFlfUExMPiwgPCZjcnUgUENMS19NSVBJX0RTSTA+LAoJCQkgPCZjcnUgU0NMS19EUEhZX1RYMF9D
Rkc+LCA8JmNydSBQQ0xLX1ZJT19HUkY+OwoJCWNsb2NrLW5hbWVzID0gInJlZiIsICJwY2xrIiwg
InBoeV9jZmciLCAiZ3JmIjsKCQlwb3dlci1kb21haW5zID0gPCZwb3dlciBSSzMzOTlfUERfVklP
PjsKCQlyZXNldHMgPSA8JmNydSBTUlNUX1BfTUlQSV9EU0kwPjsKCQlyZXNldC1uYW1lcyA9ICJh
cGIiOwoJCXJvY2tjaGlwLGdyZiA9IDwmZ3JmPjsKCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKCQkj
c2l6ZS1jZWxscyA9IDwwPjsKCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwoKCQlwb3J0cyB7CgkJCSNh
ZGRyZXNzLWNlbGxzID0gPDE+OwoJCQkjc2l6ZS1jZWxscyA9IDwwPjsKCgkJCW1pcGlfaW46IHBv
cnRAMCB7CgkJCQlyZWcgPSA8MD47CgkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKCQkJCSNzaXpl
LWNlbGxzID0gPDA+OwoKCQkJCW1pcGlfaW5fdm9wYjogZW5kcG9pbnRAMCB7CgkJCQkJcmVnID0g
PDA+OwoJCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmdm9wYl9vdXRfbWlwaT47CgkJCQl9OwoJCQkJ
bWlwaV9pbl92b3BsOiBlbmRwb2ludEAxIHsKCQkJCQlyZWcgPSA8MT47CgkJCQkJcmVtb3RlLWVu
ZHBvaW50ID0gPCZ2b3BsX291dF9taXBpPjsKCQkJCX07CgkJCX07CgkJfTsKCX07CgoJbWlwaV9k
c2kxOiBtaXBpQGZmOTY4MDAwIHsKCQljb21wYXRpYmxlID0gInJvY2tjaGlwLHJrMzM5OS1taXBp
LWRzaSIsICJzbnBzLGR3LW1pcGktZHNpIjsKCQlyZWcgPSA8MHgwIDB4ZmY5NjgwMDAgMHgwIDB4
ODAwMD47CgkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDQ2IElSUV9UWVBFX0xFVkVMX0hJR0ggMD47
CgkJY2xvY2tzID0gPCZjcnUgU0NMS19EUEhZX1BMTD4sIDwmY3J1IFBDTEtfTUlQSV9EU0kxPiwK
CQkJIDwmY3J1IFNDTEtfRFBIWV9UWDFSWDFfQ0ZHPiwgPCZjcnUgUENMS19WSU9fR1JGPjsKCQlj
bG9jay1uYW1lcyA9ICJyZWYiLCAicGNsayIsICJwaHlfY2ZnIiwgImdyZiI7CgkJcG93ZXItZG9t
YWlucyA9IDwmcG93ZXIgUkszMzk5X1BEX1ZJTz47CgkJcmVzZXRzID0gPCZjcnUgU1JTVF9QX01J
UElfRFNJMT47CgkJcmVzZXQtbmFtZXMgPSAiYXBiIjsKCQlyb2NrY2hpcCxncmYgPSA8JmdyZj47
CgkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CgkJI3NpemUtY2VsbHMgPSA8MD47CgkJc3RhdHVzID0g
ImRpc2FibGVkIjsKCgkJcG9ydHMgewoJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKCQkJI3NpemUt
Y2VsbHMgPSA8MD47CgoJCQltaXBpMV9pbjogcG9ydEAwIHsKCQkJCXJlZyA9IDwwPjsKCQkJCSNh
ZGRyZXNzLWNlbGxzID0gPDE+OwoJCQkJI3NpemUtY2VsbHMgPSA8MD47CgoJCQkJbWlwaTFfaW5f
dm9wYjogZW5kcG9pbnRAMCB7CgkJCQkJcmVnID0gPDA+OwoJCQkJCXJlbW90ZS1lbmRwb2ludCA9
IDwmdm9wYl9vdXRfbWlwaTE+OwoJCQkJfTsKCgkJCQltaXBpMV9pbl92b3BsOiBlbmRwb2ludEAx
IHsKCQkJCQlyZWcgPSA8MT47CgkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZ2b3BsX291dF9taXBp
MT47CgkJCQl9OwoJCQl9OwoJCX07Cgl9OwoKCWVkcDogZWRwQGZmOTcwMDAwIHsKCQljb21wYXRp
YmxlID0gInJvY2tjaGlwLHJrMzM5OS1lZHAiOwoJCXJlZyA9IDwweDAgMHhmZjk3MDAwMCAweDAg
MHg4MDAwPjsKCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTAgSVJRX1RZUEVfTEVWRUxfSElHSCAw
PjsKCQljbG9ja3MgPSA8JmNydSBQQ0xLX0VEUD4sIDwmY3J1IFBDTEtfRURQX0NUUkw+LCA8JmNy
dSBQQ0xLX1ZJT19HUkY+OwoJCWNsb2NrLW5hbWVzID0gImRwIiwgInBjbGsiLCAiZ3JmIjsKCQlw
aW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwoJCXBpbmN0cmwtMCA9IDwmZWRwX2hwZD47CgkJcG93
ZXItZG9tYWlucyA9IDwmcG93ZXIgUkszMzk5X1BEX0VEUD47CgkJcmVzZXRzID0gPCZjcnUgU1JT
VF9QX0VEUF9DVFJMPjsKCQlyZXNldC1uYW1lcyA9ICJkcCI7CgkJcm9ja2NoaXAsZ3JmID0gPCZn
cmY+OwoJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CgoJCXBvcnRzIHsKCQkJI2FkZHJlc3MtY2VsbHMg
PSA8MT47CgkJCSNzaXplLWNlbGxzID0gPDA+OwoJCQllZHBfaW46IHBvcnRAMCB7CgkJCQlyZWcg
PSA8MD47CgkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKCQkJCSNzaXplLWNlbGxzID0gPDA+OwoK
CQkJCWVkcF9pbl92b3BiOiBlbmRwb2ludEAwIHsKCQkJCQlyZWcgPSA8MD47CgkJCQkJcmVtb3Rl
LWVuZHBvaW50ID0gPCZ2b3BiX291dF9lZHA+OwoJCQkJfTsKCgkJCQllZHBfaW5fdm9wbDogZW5k
cG9pbnRAMSB7CgkJCQkJcmVnID0gPDE+OwoJCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmdm9wbF9v
dXRfZWRwPjsKCQkJCX07CgkJCX07CgkJfTsKCX07CgoJZ3B1OiBncHVAZmY5YTAwMDAgewoJCWNv
bXBhdGlibGUgPSAicm9ja2NoaXAscmszMzk5LW1hbGkiLCAiYXJtLG1hbGktbWlkZ2FyZCI7CgkJ
cmVnID0gPDB4MCAweGZmOWEwMDAwIDB4MCAweDEwMDAwPjsKCQlpbnRlcnJ1cHRzID0gPEdJQ19T
UEkgMjAgSVJRX1RZUEVfTEVWRUxfSElHSCAwPiwKCQkJICAgICA8R0lDX1NQSSAyMSBJUlFfVFlQ
RV9MRVZFTF9ISUdIIDA+LAoJCQkgICAgIDxHSUNfU1BJIDE5IElSUV9UWVBFX0xFVkVMX0hJR0gg
MD47CgkJaW50ZXJydXB0LW5hbWVzID0gImpvYiIsICJtbXUiLCAiZ3B1IjsKCQljbG9ja3MgPSA8
JmNydSBBQ0xLX0dQVT47CgkJI2Nvb2xpbmctY2VsbHMgPSA8Mj47CgkJcG93ZXItZG9tYWlucyA9
IDwmcG93ZXIgUkszMzk5X1BEX0dQVT47CgkJc3RhdHVzID0gImRpc2FibGVkIjsKCX07CgoJcGlu
Y3RybDogcGluY3RybCB7CgkJY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxyazMzOTktcGluY3RybCI7
CgkJcm9ja2NoaXAsZ3JmID0gPCZncmY+OwoJCXJvY2tjaGlwLHBtdSA9IDwmcG11Z3JmPjsKCQkj
YWRkcmVzcy1jZWxscyA9IDwyPjsKCQkjc2l6ZS1jZWxscyA9IDwyPjsKCQlyYW5nZXM7CgoJCWdw
aW8wOiBncGlvMEBmZjcyMDAwMCB7CgkJCWNvbXBhdGlibGUgPSAicm9ja2NoaXAsZ3Bpby1iYW5r
IjsKCQkJcmVnID0gPDB4MCAweGZmNzIwMDAwIDB4MCAweDEwMD47CgkJCWNsb2NrcyA9IDwmcG11
Y3J1IFBDTEtfR1BJTzBfUE1VPjsKCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDE0IElSUV9UWVBF
X0xFVkVMX0hJR0ggMD47CgoJCQlncGlvLWNvbnRyb2xsZXI7CgkJCSNncGlvLWNlbGxzID0gPDB4
Mj47CgoJCQlpbnRlcnJ1cHQtY29udHJvbGxlcjsKCQkJI2ludGVycnVwdC1jZWxscyA9IDwweDI+
OwoJCX07CgoJCWdwaW8xOiBncGlvMUBmZjczMDAwMCB7CgkJCWNvbXBhdGlibGUgPSAicm9ja2No
aXAsZ3Bpby1iYW5rIjsKCQkJcmVnID0gPDB4MCAweGZmNzMwMDAwIDB4MCAweDEwMD47CgkJCWNs
b2NrcyA9IDwmcG11Y3J1IFBDTEtfR1BJTzFfUE1VPjsKCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJ
IDE1IElSUV9UWVBFX0xFVkVMX0hJR0ggMD47CgoJCQlncGlvLWNvbnRyb2xsZXI7CgkJCSNncGlv
LWNlbGxzID0gPDB4Mj47CgoJCQlpbnRlcnJ1cHQtY29udHJvbGxlcjsKCQkJI2ludGVycnVwdC1j
ZWxscyA9IDwweDI+OwoJCX07CgoJCWdwaW8yOiBncGlvMkBmZjc4MDAwMCB7CgkJCWNvbXBhdGli
bGUgPSAicm9ja2NoaXAsZ3Bpby1iYW5rIjsKCQkJcmVnID0gPDB4MCAweGZmNzgwMDAwIDB4MCAw
eDEwMD47CgkJCWNsb2NrcyA9IDwmY3J1IFBDTEtfR1BJTzI+OwoJCQlpbnRlcnJ1cHRzID0gPEdJ
Q19TUEkgMTYgSVJRX1RZUEVfTEVWRUxfSElHSCAwPjsKCgkJCWdwaW8tY29udHJvbGxlcjsKCQkJ
I2dwaW8tY2VsbHMgPSA8MHgyPjsKCgkJCWludGVycnVwdC1jb250cm9sbGVyOwoJCQkjaW50ZXJy
dXB0LWNlbGxzID0gPDB4Mj47CgkJfTsKCgkJZ3BpbzM6IGdwaW8zQGZmNzg4MDAwIHsKCQkJY29t
cGF0aWJsZSA9ICJyb2NrY2hpcCxncGlvLWJhbmsiOwoJCQlyZWcgPSA8MHgwIDB4ZmY3ODgwMDAg
MHgwIDB4MTAwPjsKCQkJY2xvY2tzID0gPCZjcnUgUENMS19HUElPMz47CgkJCWludGVycnVwdHMg
PSA8R0lDX1NQSSAxNyBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+OwoKCQkJZ3Bpby1jb250cm9sbGVy
OwoJCQkjZ3Bpby1jZWxscyA9IDwweDI+OwoKCQkJaW50ZXJydXB0LWNvbnRyb2xsZXI7CgkJCSNp
bnRlcnJ1cHQtY2VsbHMgPSA8MHgyPjsKCQl9OwoKCQlncGlvNDogZ3BpbzRAZmY3OTAwMDAgewoJ
CQljb21wYXRpYmxlID0gInJvY2tjaGlwLGdwaW8tYmFuayI7CgkJCXJlZyA9IDwweDAgMHhmZjc5
MDAwMCAweDAgMHgxMDA+OwoJCQljbG9ja3MgPSA8JmNydSBQQ0xLX0dQSU80PjsKCQkJaW50ZXJy
dXB0cyA9IDxHSUNfU1BJIDE4IElSUV9UWVBFX0xFVkVMX0hJR0ggMD47CgoJCQlncGlvLWNvbnRy
b2xsZXI7CgkJCSNncGlvLWNlbGxzID0gPDB4Mj47CgoJCQlpbnRlcnJ1cHQtY29udHJvbGxlcjsK
CQkJI2ludGVycnVwdC1jZWxscyA9IDwweDI+OwoJCX07CgoJCXBjZmdfcHVsbF91cDogcGNmZy1w
dWxsLXVwIHsKCQkJYmlhcy1wdWxsLXVwOwoJCX07CgoJCXBjZmdfcHVsbF9kb3duOiBwY2ZnLXB1
bGwtZG93biB7CgkJCWJpYXMtcHVsbC1kb3duOwoJCX07CgoJCXBjZmdfcHVsbF9ub25lOiBwY2Zn
LXB1bGwtbm9uZSB7CgkJCWJpYXMtZGlzYWJsZTsKCQl9OwoKCQlwY2ZnX3B1bGxfbm9uZV8xMm1h
OiBwY2ZnLXB1bGwtbm9uZS0xMm1hIHsKCQkJYmlhcy1kaXNhYmxlOwoJCQlkcml2ZS1zdHJlbmd0
aCA9IDwxMj47CgkJfTsKCgkJcGNmZ19wdWxsX25vbmVfMTNtYTogcGNmZy1wdWxsLW5vbmUtMTNt
YSB7CgkJCWJpYXMtZGlzYWJsZTsKCQkJZHJpdmUtc3RyZW5ndGggPSA8MTM+OwoJCX07CgoJCXBj
ZmdfcHVsbF9ub25lXzE4bWE6IHBjZmctcHVsbC1ub25lLTE4bWEgewoJCQliaWFzLWRpc2FibGU7
CgkJCWRyaXZlLXN0cmVuZ3RoID0gPDE4PjsKCQl9OwoKCQlwY2ZnX3B1bGxfbm9uZV8yMG1hOiBw
Y2ZnLXB1bGwtbm9uZS0yMG1hIHsKCQkJYmlhcy1kaXNhYmxlOwoJCQlkcml2ZS1zdHJlbmd0aCA9
IDwyMD47CgkJfTsKCgkJcGNmZ19wdWxsX3VwXzJtYTogcGNmZy1wdWxsLXVwLTJtYSB7CgkJCWJp
YXMtcHVsbC11cDsKCQkJZHJpdmUtc3RyZW5ndGggPSA8Mj47CgkJfTsKCgkJcGNmZ19wdWxsX3Vw
XzhtYTogcGNmZy1wdWxsLXVwLThtYSB7CgkJCWJpYXMtcHVsbC11cDsKCQkJZHJpdmUtc3RyZW5n
dGggPSA8OD47CgkJfTsKCgkJcGNmZ19wdWxsX3VwXzE4bWE6IHBjZmctcHVsbC11cC0xOG1hIHsK
CQkJYmlhcy1wdWxsLXVwOwoJCQlkcml2ZS1zdHJlbmd0aCA9IDwxOD47CgkJfTsKCgkJcGNmZ19w
dWxsX3VwXzIwbWE6IHBjZmctcHVsbC11cC0yMG1hIHsKCQkJYmlhcy1wdWxsLXVwOwoJCQlkcml2
ZS1zdHJlbmd0aCA9IDwyMD47CgkJfTsKCgkJcGNmZ19wdWxsX2Rvd25fNG1hOiBwY2ZnLXB1bGwt
ZG93bi00bWEgewoJCQliaWFzLXB1bGwtZG93bjsKCQkJZHJpdmUtc3RyZW5ndGggPSA8ND47CgkJ
fTsKCgkJcGNmZ19wdWxsX2Rvd25fOG1hOiBwY2ZnLXB1bGwtZG93bi04bWEgewoJCQliaWFzLXB1
bGwtZG93bjsKCQkJZHJpdmUtc3RyZW5ndGggPSA8OD47CgkJfTsKCgkJcGNmZ19wdWxsX2Rvd25f
MTJtYTogcGNmZy1wdWxsLWRvd24tMTJtYSB7CgkJCWJpYXMtcHVsbC1kb3duOwoJCQlkcml2ZS1z
dHJlbmd0aCA9IDwxMj47CgkJfTsKCgkJcGNmZ19wdWxsX2Rvd25fMThtYTogcGNmZy1wdWxsLWRv
d24tMThtYSB7CgkJCWJpYXMtcHVsbC1kb3duOwoJCQlkcml2ZS1zdHJlbmd0aCA9IDwxOD47CgkJ
fTsKCgkJcGNmZ19wdWxsX2Rvd25fMjBtYTogcGNmZy1wdWxsLWRvd24tMjBtYSB7CgkJCWJpYXMt
cHVsbC1kb3duOwoJCQlkcml2ZS1zdHJlbmd0aCA9IDwyMD47CgkJfTsKCgkJcGNmZ19vdXRwdXRf
aGlnaDogcGNmZy1vdXRwdXQtaGlnaCB7CgkJCW91dHB1dC1oaWdoOwoJCX07CgoJCXBjZmdfb3V0
cHV0X2xvdzogcGNmZy1vdXRwdXQtbG93IHsKCQkJb3V0cHV0LWxvdzsKCQl9OwoKCQljbG9jayB7
CgkJCWNsa18zMms6IGNsay0zMmsgewoJCQkJcm9ja2NoaXAscGlucyA9IDwwIFJLX1BBMCAyICZw
Y2ZnX3B1bGxfbm9uZT47CgkJCX07CgkJfTsKCgkJZWRwIHsKCQkJZWRwX2hwZDogZWRwLWhwZCB7
CgkJCQlyb2NrY2hpcCxwaW5zID0KCQkJCQk8NCBSS19QQzcgMiAmcGNmZ19wdWxsX25vbmU+OwoJ
CQl9OwoJCX07CgoJCWdtYWMgewoJCQlyZ21paV9waW5zOiByZ21paS1waW5zIHsKCQkJCXJvY2tj
aGlwLHBpbnMgPQoJCQkJCS8qIG1hY190eGNsayAqLwoJCQkJCTwzIFJLX1BDMSAxICZwY2ZnX3B1
bGxfbm9uZV8xM21hPiwKCQkJCQkvKiBtYWNfcnhjbGsgKi8KCQkJCQk8MyBSS19QQjYgMSAmcGNm
Z19wdWxsX25vbmU+LAoJCQkJCS8qIG1hY19tZGlvICovCgkJCQkJPDMgUktfUEI1IDEgJnBjZmdf
cHVsbF9ub25lPiwKCQkJCQkvKiBtYWNfdHhlbiAqLwoJCQkJCTwzIFJLX1BCNCAxICZwY2ZnX3B1
bGxfbm9uZV8xM21hPiwKCQkJCQkvKiBtYWNfY2xrICovCgkJCQkJPDMgUktfUEIzIDEgJnBjZmdf
cHVsbF9ub25lPiwKCQkJCQkvKiBtYWNfcnhkdiAqLwoJCQkJCTwzIFJLX1BCMSAxICZwY2ZnX3B1
bGxfbm9uZT4sCgkJCQkJLyogbWFjX21kYyAqLwoJCQkJCTwzIFJLX1BCMCAxICZwY2ZnX3B1bGxf
bm9uZT4sCgkJCQkJLyogbWFjX3J4ZDEgKi8KCQkJCQk8MyBSS19QQTcgMSAmcGNmZ19wdWxsX25v
bmU+LAoJCQkJCS8qIG1hY19yeGQwICovCgkJCQkJPDMgUktfUEE2IDEgJnBjZmdfcHVsbF9ub25l
PiwKCQkJCQkvKiBtYWNfdHhkMSAqLwoJCQkJCTwzIFJLX1BBNSAxICZwY2ZnX3B1bGxfbm9uZV8x
M21hPiwKCQkJCQkvKiBtYWNfdHhkMCAqLwoJCQkJCTwzIFJLX1BBNCAxICZwY2ZnX3B1bGxfbm9u
ZV8xM21hPiwKCQkJCQkvKiBtYWNfcnhkMyAqLwoJCQkJCTwzIFJLX1BBMyAxICZwY2ZnX3B1bGxf
bm9uZT4sCgkJCQkJLyogbWFjX3J4ZDIgKi8KCQkJCQk8MyBSS19QQTIgMSAmcGNmZ19wdWxsX25v
bmU+LAoJCQkJCS8qIG1hY190eGQzICovCgkJCQkJPDMgUktfUEExIDEgJnBjZmdfcHVsbF9ub25l
XzEzbWE+LAoJCQkJCS8qIG1hY190eGQyICovCgkJCQkJPDMgUktfUEEwIDEgJnBjZmdfcHVsbF9u
b25lXzEzbWE+OwoJCQl9OwoKCQkJcm1paV9waW5zOiBybWlpLXBpbnMgewoJCQkJcm9ja2NoaXAs
cGlucyA9CgkJCQkJLyogbWFjX21kaW8gKi8KCQkJCQk8MyBSS19QQjUgMSAmcGNmZ19wdWxsX25v
bmU+LAoJCQkJCS8qIG1hY190eGVuICovCgkJCQkJPDMgUktfUEI0IDEgJnBjZmdfcHVsbF9ub25l
XzEzbWE+LAoJCQkJCS8qIG1hY19jbGsgKi8KCQkJCQk8MyBSS19QQjMgMSAmcGNmZ19wdWxsX25v
bmU+LAoJCQkJCS8qIG1hY19yeGVyICovCgkJCQkJPDMgUktfUEIyIDEgJnBjZmdfcHVsbF9ub25l
PiwKCQkJCQkvKiBtYWNfcnhkdiAqLwoJCQkJCTwzIFJLX1BCMSAxICZwY2ZnX3B1bGxfbm9uZT4s
CgkJCQkJLyogbWFjX21kYyAqLwoJCQkJCTwzIFJLX1BCMCAxICZwY2ZnX3B1bGxfbm9uZT4sCgkJ
CQkJLyogbWFjX3J4ZDEgKi8KCQkJCQk8MyBSS19QQTcgMSAmcGNmZ19wdWxsX25vbmU+LAoJCQkJ
CS8qIG1hY19yeGQwICovCgkJCQkJPDMgUktfUEE2IDEgJnBjZmdfcHVsbF9ub25lPiwKCQkJCQkv
KiBtYWNfdHhkMSAqLwoJCQkJCTwzIFJLX1BBNSAxICZwY2ZnX3B1bGxfbm9uZV8xM21hPiwKCQkJ
CQkvKiBtYWNfdHhkMCAqLwoJCQkJCTwzIFJLX1BBNCAxICZwY2ZnX3B1bGxfbm9uZV8xM21hPjsK
CQkJfTsKCQl9OwoKCQlpMmMwIHsKCQkJaTJjMF94ZmVyOiBpMmMwLXhmZXIgewoJCQkJcm9ja2No
aXAscGlucyA9CgkJCQkJPDEgUktfUEI3IDIgJnBjZmdfcHVsbF9ub25lPiwKCQkJCQk8MSBSS19Q
QzAgMiAmcGNmZ19wdWxsX25vbmU+OwoJCQl9OwoJCX07CgoJCWkyYzEgewoJCQlpMmMxX3hmZXI6
IGkyYzEteGZlciB7CgkJCQlyb2NrY2hpcCxwaW5zID0KCQkJCQk8NCBSS19QQTIgMSAmcGNmZ19w
dWxsX25vbmU+LAoJCQkJCTw0IFJLX1BBMSAxICZwY2ZnX3B1bGxfbm9uZT47CgkJCX07CgkJfTsK
CgkJaTJjMiB7CgkJCWkyYzJfeGZlcjogaTJjMi14ZmVyIHsKCQkJCXJvY2tjaGlwLHBpbnMgPQoJ
CQkJCTwyIFJLX1BBMSAyICZwY2ZnX3B1bGxfbm9uZV8xMm1hPiwKCQkJCQk8MiBSS19QQTAgMiAm
cGNmZ19wdWxsX25vbmVfMTJtYT47CgkJCX07CgkJfTsKCgkJaTJjMyB7CgkJCWkyYzNfeGZlcjog
aTJjMy14ZmVyIHsKCQkJCXJvY2tjaGlwLHBpbnMgPQoJCQkJCTw0IFJLX1BDMSAxICZwY2ZnX3B1
bGxfbm9uZT4sCgkJCQkJPDQgUktfUEMwIDEgJnBjZmdfcHVsbF9ub25lPjsKCQkJfTsKCQl9OwoK
CQlpMmM0IHsKCQkJaTJjNF94ZmVyOiBpMmM0LXhmZXIgewoJCQkJcm9ja2NoaXAscGlucyA9CgkJ
CQkJPDEgUktfUEI0IDEgJnBjZmdfcHVsbF9ub25lPiwKCQkJCQk8MSBSS19QQjMgMSAmcGNmZ19w
dWxsX25vbmU+OwoJCQl9OwoJCX07CgoJCWkyYzUgewoJCQlpMmM1X3hmZXI6IGkyYzUteGZlciB7
CgkJCQlyb2NrY2hpcCxwaW5zID0KCQkJCQk8MyBSS19QQjMgMiAmcGNmZ19wdWxsX25vbmU+LAoJ
CQkJCTwzIFJLX1BCMiAyICZwY2ZnX3B1bGxfbm9uZT47CgkJCX07CgkJfTsKCgkJaTJjNiB7CgkJ
CWkyYzZfeGZlcjogaTJjNi14ZmVyIHsKCQkJCXJvY2tjaGlwLHBpbnMgPQoJCQkJCTwyIFJLX1BC
MiAyICZwY2ZnX3B1bGxfbm9uZT4sCgkJCQkJPDIgUktfUEIxIDIgJnBjZmdfcHVsbF9ub25lPjsK
CQkJfTsKCQl9OwoKCQlpMmM3IHsKCQkJaTJjN194ZmVyOiBpMmM3LXhmZXIgewoJCQkJcm9ja2No
aXAscGlucyA9CgkJCQkJPDIgUktfUEIwIDIgJnBjZmdfcHVsbF9ub25lPiwKCQkJCQk8MiBSS19Q
QTcgMiAmcGNmZ19wdWxsX25vbmU+OwoJCQl9OwoJCX07CgoJCWkyYzggewoJCQlpMmM4X3hmZXI6
IGkyYzgteGZlciB7CgkJCQlyb2NrY2hpcCxwaW5zID0KCQkJCQk8MSBSS19QQzUgMSAmcGNmZ19w
dWxsX25vbmU+LAoJCQkJCTwxIFJLX1BDNCAxICZwY2ZnX3B1bGxfbm9uZT47CgkJCX07CgkJfTsK
CgkJaTJzMCB7CgkJCWkyczBfMmNoX2J1czogaTJzMC0yY2gtYnVzIHsKCQkJCXJvY2tjaGlwLHBp
bnMgPQoJCQkJCTwzIFJLX1BEMCAxICZwY2ZnX3B1bGxfbm9uZT4sCgkJCQkJPDMgUktfUEQxIDEg
JnBjZmdfcHVsbF9ub25lPiwKCQkJCQk8MyBSS19QRDIgMSAmcGNmZ19wdWxsX25vbmU+LAoJCQkJ
CTwzIFJLX1BEMyAxICZwY2ZnX3B1bGxfbm9uZT4sCgkJCQkJPDMgUktfUEQ3IDEgJnBjZmdfcHVs
bF9ub25lPiwKCQkJCQk8NCBSS19QQTAgMSAmcGNmZ19wdWxsX25vbmU+OwoJCQl9OwoKCQkJaTJz
MF84Y2hfYnVzOiBpMnMwLThjaC1idXMgewoJCQkJcm9ja2NoaXAscGlucyA9CgkJCQkJPDMgUktf
UEQwIDEgJnBjZmdfcHVsbF9ub25lPiwKCQkJCQk8MyBSS19QRDEgMSAmcGNmZ19wdWxsX25vbmU+
LAoJCQkJCTwzIFJLX1BEMiAxICZwY2ZnX3B1bGxfbm9uZT4sCgkJCQkJPDMgUktfUEQzIDEgJnBj
ZmdfcHVsbF9ub25lPiwKCQkJCQk8MyBSS19QRDQgMSAmcGNmZ19wdWxsX25vbmU+LAoJCQkJCTwz
IFJLX1BENSAxICZwY2ZnX3B1bGxfbm9uZT4sCgkJCQkJPDMgUktfUEQ2IDEgJnBjZmdfcHVsbF9u
b25lPiwKCQkJCQk8MyBSS19QRDcgMSAmcGNmZ19wdWxsX25vbmU+LAoJCQkJCTw0IFJLX1BBMCAx
ICZwY2ZnX3B1bGxfbm9uZT47CgkJCX07CgkJfTsKCgkJaTJzMSB7CgkJCWkyczFfMmNoX2J1czog
aTJzMS0yY2gtYnVzIHsKCQkJCXJvY2tjaGlwLHBpbnMgPQoJCQkJCTw0IFJLX1BBMyAxICZwY2Zn
X3B1bGxfbm9uZT4sCgkJCQkJPDQgUktfUEE0IDEgJnBjZmdfcHVsbF9ub25lPiwKCQkJCQk8NCBS
S19QQTUgMSAmcGNmZ19wdWxsX25vbmU+LAoJCQkJCTw0IFJLX1BBNiAxICZwY2ZnX3B1bGxfbm9u
ZT4sCgkJCQkJPDQgUktfUEE3IDEgJnBjZmdfcHVsbF9ub25lPjsKCQkJfTsKCQl9OwoKCQlzZGlv
MCB7CgkJCXNkaW8wX2J1czE6IHNkaW8wLWJ1czEgewoJCQkJcm9ja2NoaXAscGlucyA9CgkJCQkJ
PDIgUktfUEM0IDEgJnBjZmdfcHVsbF91cD47CgkJCX07CgoJCQlzZGlvMF9idXM0OiBzZGlvMC1i
dXM0IHsKCQkJCXJvY2tjaGlwLHBpbnMgPQoJCQkJCTwyIFJLX1BDNCAxICZwY2ZnX3B1bGxfdXA+
LAoJCQkJCTwyIFJLX1BDNSAxICZwY2ZnX3B1bGxfdXA+LAoJCQkJCTwyIFJLX1BDNiAxICZwY2Zn
X3B1bGxfdXA+LAoJCQkJCTwyIFJLX1BDNyAxICZwY2ZnX3B1bGxfdXA+OwoJCQl9OwoKCQkJc2Rp
bzBfY21kOiBzZGlvMC1jbWQgewoJCQkJcm9ja2NoaXAscGlucyA9CgkJCQkJPDIgUktfUEQwIDEg
JnBjZmdfcHVsbF91cD47CgkJCX07CgoJCQlzZGlvMF9jbGs6IHNkaW8wLWNsayB7CgkJCQlyb2Nr
Y2hpcCxwaW5zID0KCQkJCQk8MiBSS19QRDEgMSAmcGNmZ19wdWxsX25vbmU+OwoJCQl9OwoKCQkJ
c2RpbzBfY2Q6IHNkaW8wLWNkIHsKCQkJCXJvY2tjaGlwLHBpbnMgPQoJCQkJCTwyIFJLX1BEMiAx
ICZwY2ZnX3B1bGxfdXA+OwoJCQl9OwoKCQkJc2RpbzBfcHdyOiBzZGlvMC1wd3IgewoJCQkJcm9j
a2NoaXAscGlucyA9CgkJCQkJPDIgUktfUEQzIDEgJnBjZmdfcHVsbF91cD47CgkJCX07CgoJCQlz
ZGlvMF9ia3B3cjogc2RpbzAtYmtwd3IgewoJCQkJcm9ja2NoaXAscGlucyA9CgkJCQkJPDIgUktf
UEQ0IDEgJnBjZmdfcHVsbF91cD47CgkJCX07CgoJCQlzZGlvMF93cDogc2RpbzAtd3AgewoJCQkJ
cm9ja2NoaXAscGlucyA9CgkJCQkJPDAgUktfUEEzIDEgJnBjZmdfcHVsbF91cD47CgkJCX07CgoJ
CQlzZGlvMF9pbnQ6IHNkaW8wLWludCB7CgkJCQlyb2NrY2hpcCxwaW5zID0KCQkJCQk8MCBSS19Q
QTQgMSAmcGNmZ19wdWxsX3VwPjsKCQkJfTsKCQl9OwoKCQlzZG1tYyB7CgkJCXNkbW1jX2J1czE6
IHNkbW1jLWJ1czEgewoJCQkJcm9ja2NoaXAscGlucyA9CgkJCQkJPDQgUktfUEIwIDEgJnBjZmdf
cHVsbF91cD47CgkJCX07CgoJCQlzZG1tY19idXM0OiBzZG1tYy1idXM0IHsKCQkJCXJvY2tjaGlw
LHBpbnMgPQoJCQkJCTw0IFJLX1BCMCAxICZwY2ZnX3B1bGxfdXA+LAoJCQkJCTw0IFJLX1BCMSAx
ICZwY2ZnX3B1bGxfdXA+LAoJCQkJCTw0IFJLX1BCMiAxICZwY2ZnX3B1bGxfdXA+LAoJCQkJCTw0
IFJLX1BCMyAxICZwY2ZnX3B1bGxfdXA+OwoJCQl9OwoKCQkJc2RtbWNfY2xrOiBzZG1tYy1jbGsg
ewoJCQkJcm9ja2NoaXAscGlucyA9CgkJCQkJPDQgUktfUEI0IDEgJnBjZmdfcHVsbF9ub25lPjsK
CQkJfTsKCgkJCXNkbW1jX2NtZDogc2RtbWMtY21kIHsKCQkJCXJvY2tjaGlwLHBpbnMgPQoJCQkJ
CTw0IFJLX1BCNSAxICZwY2ZnX3B1bGxfdXA+OwoJCQl9OwoKCQkJc2RtbWNfY2Q6IHNkbW1jLWNk
IHsKCQkJCXJvY2tjaGlwLHBpbnMgPQoJCQkJCTwwIFJLX1BBNyAxICZwY2ZnX3B1bGxfdXA+OwoJ
CQl9OwoKCQkJc2RtbWNfd3A6IHNkbW1jLXdwIHsKCQkJCXJvY2tjaGlwLHBpbnMgPQoJCQkJCTww
IFJLX1BCMCAxICZwY2ZnX3B1bGxfdXA+OwoJCQl9OwoJCX07CgoJCXN1c3BlbmQgewoJCQlhcF9w
d3JvZmY6IGFwLXB3cm9mZiB7CgkJCQlyb2NrY2hpcCxwaW5zID0gPDEgUktfUEE1IDEgJnBjZmdf
cHVsbF9ub25lPjsKCQkJfTsKCgkJCWRkcmlvX3B3cm9mZjogZGRyaW8tcHdyb2ZmIHsKCQkJCXJv
Y2tjaGlwLHBpbnMgPSA8MCBSS19QQTEgMSAmcGNmZ19wdWxsX25vbmU+OwoJCQl9OwoJCX07CgoJ
CXNwZGlmIHsKCQkJc3BkaWZfYnVzOiBzcGRpZi1idXMgewoJCQkJcm9ja2NoaXAscGlucyA9CgkJ
CQkJPDQgUktfUEM1IDEgJnBjZmdfcHVsbF9ub25lPjsKCQkJfTsKCgkJCXNwZGlmX2J1c18xOiBz
cGRpZi1idXMtMSB7CgkJCQlyb2NrY2hpcCxwaW5zID0KCQkJCQk8MyBSS19QQzAgMyAmcGNmZ19w
dWxsX25vbmU+OwoJCQl9OwoJCX07CgoJCXNwaTAgewoJCQlzcGkwX2Nsazogc3BpMC1jbGsgewoJ
CQkJcm9ja2NoaXAscGlucyA9CgkJCQkJPDMgUktfUEE2IDIgJnBjZmdfcHVsbF91cD47CgkJCX07
CgkJCXNwaTBfY3MwOiBzcGkwLWNzMCB7CgkJCQlyb2NrY2hpcCxwaW5zID0KCQkJCQk8MyBSS19Q
QTcgMiAmcGNmZ19wdWxsX3VwPjsKCQkJfTsKCQkJc3BpMF9jczE6IHNwaTAtY3MxIHsKCQkJCXJv
Y2tjaGlwLHBpbnMgPQoJCQkJCTwzIFJLX1BCMCAyICZwY2ZnX3B1bGxfdXA+OwoJCQl9OwoJCQlz
cGkwX3R4OiBzcGkwLXR4IHsKCQkJCXJvY2tjaGlwLHBpbnMgPQoJCQkJCTwzIFJLX1BBNSAyICZw
Y2ZnX3B1bGxfdXA+OwoJCQl9OwoJCQlzcGkwX3J4OiBzcGkwLXJ4IHsKCQkJCXJvY2tjaGlwLHBp
bnMgPQoJCQkJCTwzIFJLX1BBNCAyICZwY2ZnX3B1bGxfdXA+OwoJCQl9OwoJCX07CgoJCXNwaTEg
ewoJCQlzcGkxX2Nsazogc3BpMS1jbGsgewoJCQkJcm9ja2NoaXAscGlucyA9CgkJCQkJPDEgUktf
UEIxIDIgJnBjZmdfcHVsbF91cD47CgkJCX07CgkJCXNwaTFfY3MwOiBzcGkxLWNzMCB7CgkJCQly
b2NrY2hpcCxwaW5zID0KCQkJCQk8MSBSS19QQjIgMiAmcGNmZ19wdWxsX3VwPjsKCQkJfTsKCQkJ
c3BpMV9yeDogc3BpMS1yeCB7CgkJCQlyb2NrY2hpcCxwaW5zID0KCQkJCQk8MSBSS19QQTcgMiAm
cGNmZ19wdWxsX3VwPjsKCQkJfTsKCQkJc3BpMV90eDogc3BpMS10eCB7CgkJCQlyb2NrY2hpcCxw
aW5zID0KCQkJCQk8MSBSS19QQjAgMiAmcGNmZ19wdWxsX3VwPjsKCQkJfTsKCQl9OwoKCQlzcGky
IHsKCQkJc3BpMl9jbGs6IHNwaTItY2xrIHsKCQkJCXJvY2tjaGlwLHBpbnMgPQoJCQkJCTwyIFJL
X1BCMyAxICZwY2ZnX3B1bGxfdXA+OwoJCQl9OwoJCQlzcGkyX2NzMDogc3BpMi1jczAgewoJCQkJ
cm9ja2NoaXAscGlucyA9CgkJCQkJPDIgUktfUEI0IDEgJnBjZmdfcHVsbF91cD47CgkJCX07CgkJ
CXNwaTJfcng6IHNwaTItcnggewoJCQkJcm9ja2NoaXAscGlucyA9CgkJCQkJPDIgUktfUEIxIDEg
JnBjZmdfcHVsbF91cD47CgkJCX07CgkJCXNwaTJfdHg6IHNwaTItdHggewoJCQkJcm9ja2NoaXAs
cGlucyA9CgkJCQkJPDIgUktfUEIyIDEgJnBjZmdfcHVsbF91cD47CgkJCX07CgkJfTsKCgkJc3Bp
MyB7CgkJCXNwaTNfY2xrOiBzcGkzLWNsayB7CgkJCQlyb2NrY2hpcCxwaW5zID0KCQkJCQk8MSBS
S19QQzEgMSAmcGNmZ19wdWxsX3VwPjsKCQkJfTsKCQkJc3BpM19jczA6IHNwaTMtY3MwIHsKCQkJ
CXJvY2tjaGlwLHBpbnMgPQoJCQkJCTwxIFJLX1BDMiAxICZwY2ZnX3B1bGxfdXA+OwoJCQl9OwoJ
CQlzcGkzX3J4OiBzcGkzLXJ4IHsKCQkJCXJvY2tjaGlwLHBpbnMgPQoJCQkJCTwxIFJLX1BCNyAx
ICZwY2ZnX3B1bGxfdXA+OwoJCQl9OwoJCQlzcGkzX3R4OiBzcGkzLXR4IHsKCQkJCXJvY2tjaGlw
LHBpbnMgPQoJCQkJCTwxIFJLX1BDMCAxICZwY2ZnX3B1bGxfdXA+OwoJCQl9OwoJCX07CgoJCXNw
aTQgewoJCQlzcGk0X2Nsazogc3BpNC1jbGsgewoJCQkJcm9ja2NoaXAscGlucyA9CgkJCQkJPDMg
UktfUEEyIDIgJnBjZmdfcHVsbF91cD47CgkJCX07CgkJCXNwaTRfY3MwOiBzcGk0LWNzMCB7CgkJ
CQlyb2NrY2hpcCxwaW5zID0KCQkJCQk8MyBSS19QQTMgMiAmcGNmZ19wdWxsX3VwPjsKCQkJfTsK
CQkJc3BpNF9yeDogc3BpNC1yeCB7CgkJCQlyb2NrY2hpcCxwaW5zID0KCQkJCQk8MyBSS19QQTAg
MiAmcGNmZ19wdWxsX3VwPjsKCQkJfTsKCQkJc3BpNF90eDogc3BpNC10eCB7CgkJCQlyb2NrY2hp
cCxwaW5zID0KCQkJCQk8MyBSS19QQTEgMiAmcGNmZ19wdWxsX3VwPjsKCQkJfTsKCQl9OwoKCQlz
cGk1IHsKCQkJc3BpNV9jbGs6IHNwaTUtY2xrIHsKCQkJCXJvY2tjaGlwLHBpbnMgPQoJCQkJCTwy
IFJLX1BDNiAyICZwY2ZnX3B1bGxfdXA+OwoJCQl9OwoJCQlzcGk1X2NzMDogc3BpNS1jczAgewoJ
CQkJcm9ja2NoaXAscGlucyA9CgkJCQkJPDIgUktfUEM3IDIgJnBjZmdfcHVsbF91cD47CgkJCX07
CgkJCXNwaTVfcng6IHNwaTUtcnggewoJCQkJcm9ja2NoaXAscGlucyA9CgkJCQkJPDIgUktfUEM0
IDIgJnBjZmdfcHVsbF91cD47CgkJCX07CgkJCXNwaTVfdHg6IHNwaTUtdHggewoJCQkJcm9ja2No
aXAscGlucyA9CgkJCQkJPDIgUktfUEM1IDIgJnBjZmdfcHVsbF91cD47CgkJCX07CgkJfTsKCgkJ
dGVzdGNsayB7CgkJCXRlc3RfY2xrb3V0MDogdGVzdC1jbGtvdXQwIHsKCQkJCXJvY2tjaGlwLHBp
bnMgPQoJCQkJCTwwIFJLX1BBMCAxICZwY2ZnX3B1bGxfbm9uZT47CgkJCX07CgoJCQl0ZXN0X2Ns
a291dDE6IHRlc3QtY2xrb3V0MSB7CgkJCQlyb2NrY2hpcCxwaW5zID0KCQkJCQk8MiBSS19QRDEg
MiAmcGNmZ19wdWxsX25vbmU+OwoJCQl9OwoKCQkJdGVzdF9jbGtvdXQyOiB0ZXN0LWNsa291dDIg
ewoJCQkJcm9ja2NoaXAscGlucyA9CgkJCQkJPDAgUktfUEIwIDMgJnBjZmdfcHVsbF9ub25lPjsK
CQkJfTsKCQl9OwoKCQl0c2FkYyB7CgkJCW90cF9waW46IG90cC1waW4gewoJCQkJcm9ja2NoaXAs
cGlucyA9IDwxIFJLX1BBNiBSS19GVU5DX0dQSU8gJnBjZmdfcHVsbF9ub25lPjsKCQkJfTsKCgkJ
CW90cF9vdXQ6IG90cC1vdXQgewoJCQkJcm9ja2NoaXAscGlucyA9IDwxIFJLX1BBNiAxICZwY2Zn
X3B1bGxfbm9uZT47CgkJCX07CgkJfTsKCgkJdWFydDAgewoJCQl1YXJ0MF94ZmVyOiB1YXJ0MC14
ZmVyIHsKCQkJCXJvY2tjaGlwLHBpbnMgPQoJCQkJCTwyIFJLX1BDMCAxICZwY2ZnX3B1bGxfdXA+
LAoJCQkJCTwyIFJLX1BDMSAxICZwY2ZnX3B1bGxfbm9uZT47CgkJCX07CgoJCQl1YXJ0MF9jdHM6
IHVhcnQwLWN0cyB7CgkJCQlyb2NrY2hpcCxwaW5zID0KCQkJCQk8MiBSS19QQzIgMSAmcGNmZ19w
dWxsX25vbmU+OwoJCQl9OwoKCQkJdWFydDBfcnRzOiB1YXJ0MC1ydHMgewoJCQkJcm9ja2NoaXAs
cGlucyA9CgkJCQkJPDIgUktfUEMzIDEgJnBjZmdfcHVsbF9ub25lPjsKCQkJfTsKCQl9OwoKCQl1
YXJ0MSB7CgkJCXVhcnQxX3hmZXI6IHVhcnQxLXhmZXIgewoJCQkJcm9ja2NoaXAscGlucyA9CgkJ
CQkJPDMgUktfUEI0IDIgJnBjZmdfcHVsbF91cD4sCgkJCQkJPDMgUktfUEI1IDIgJnBjZmdfcHVs
bF9ub25lPjsKCQkJfTsKCQl9OwoKCQl1YXJ0MmEgewoJCQl1YXJ0MmFfeGZlcjogdWFydDJhLXhm
ZXIgewoJCQkJcm9ja2NoaXAscGlucyA9CgkJCQkJPDQgUktfUEIwIDIgJnBjZmdfcHVsbF91cD4s
CgkJCQkJPDQgUktfUEIxIDIgJnBjZmdfcHVsbF9ub25lPjsKCQkJfTsKCQl9OwoKCQl1YXJ0MmIg
ewoJCQl1YXJ0MmJfeGZlcjogdWFydDJiLXhmZXIgewoJCQkJcm9ja2NoaXAscGlucyA9CgkJCQkJ
PDQgUktfUEMwIDIgJnBjZmdfcHVsbF91cD4sCgkJCQkJPDQgUktfUEMxIDIgJnBjZmdfcHVsbF9u
b25lPjsKCQkJfTsKCQl9OwoKCQl1YXJ0MmMgewoJCQl1YXJ0MmNfeGZlcjogdWFydDJjLXhmZXIg
ewoJCQkJcm9ja2NoaXAscGlucyA9CgkJCQkJPDQgUktfUEMzIDEgJnBjZmdfcHVsbF91cD4sCgkJ
CQkJPDQgUktfUEM0IDEgJnBjZmdfcHVsbF9ub25lPjsKCQkJfTsKCQl9OwoKCQl1YXJ0MyB7CgkJ
CXVhcnQzX3hmZXI6IHVhcnQzLXhmZXIgewoJCQkJcm9ja2NoaXAscGlucyA9CgkJCQkJPDMgUktf
UEI2IDIgJnBjZmdfcHVsbF91cD4sCgkJCQkJPDMgUktfUEI3IDIgJnBjZmdfcHVsbF9ub25lPjsK
CQkJfTsKCgkJCXVhcnQzX2N0czogdWFydDMtY3RzIHsKCQkJCXJvY2tjaGlwLHBpbnMgPQoJCQkJ
CTwzIFJLX1BDMCAyICZwY2ZnX3B1bGxfbm9uZT47CgkJCX07CgoJCQl1YXJ0M19ydHM6IHVhcnQz
LXJ0cyB7CgkJCQlyb2NrY2hpcCxwaW5zID0KCQkJCQk8MyBSS19QQzEgMiAmcGNmZ19wdWxsX25v
bmU+OwoJCQl9OwoJCX07CgoJCXVhcnQ0IHsKCQkJdWFydDRfeGZlcjogdWFydDQteGZlciB7CgkJ
CQlyb2NrY2hpcCxwaW5zID0KCQkJCQk8MSBSS19QQTcgMSAmcGNmZ19wdWxsX3VwPiwKCQkJCQk8
MSBSS19QQjAgMSAmcGNmZ19wdWxsX25vbmU+OwoJCQl9OwoJCX07CgoJCXVhcnRoZGNwIHsKCQkJ
dWFydGhkY3BfeGZlcjogdWFydGhkY3AteGZlciB7CgkJCQlyb2NrY2hpcCxwaW5zID0KCQkJCQk8
NCBSS19QQzUgMiAmcGNmZ19wdWxsX3VwPiwKCQkJCQk8NCBSS19QQzYgMiAmcGNmZ19wdWxsX25v
bmU+OwoJCQl9OwoJCX07CgoJCXB3bTAgewoJCQlwd20wX3BpbjogcHdtMC1waW4gewoJCQkJcm9j
a2NoaXAscGlucyA9CgkJCQkJPDQgUktfUEMyIDEgJnBjZmdfcHVsbF9ub25lPjsKCQkJfTsKCgkJ
CXB3bTBfcGluX3B1bGxfZG93bjogcHdtMC1waW4tcHVsbC1kb3duIHsKCQkJCXJvY2tjaGlwLHBp
bnMgPQoJCQkJCTw0IFJLX1BDMiAxICZwY2ZnX3B1bGxfZG93bj47CgkJCX07CgoJCQl2b3AwX3B3
bV9waW46IHZvcDAtcHdtLXBpbiB7CgkJCQlyb2NrY2hpcCxwaW5zID0KCQkJCQk8NCBSS19QQzIg
MiAmcGNmZ19wdWxsX25vbmU+OwoJCQl9OwoKCQkJdm9wMV9wd21fcGluOiB2b3AxLXB3bS1waW4g
ewoJCQkJcm9ja2NoaXAscGlucyA9CgkJCQkJPDQgUktfUEMyIDMgJnBjZmdfcHVsbF9ub25lPjsK
CQkJfTsKCQl9OwoKCQlwd20xIHsKCQkJcHdtMV9waW46IHB3bTEtcGluIHsKCQkJCXJvY2tjaGlw
LHBpbnMgPQoJCQkJCTw0IFJLX1BDNiAxICZwY2ZnX3B1bGxfbm9uZT47CgkJCX07CgoJCQlwd20x
X3Bpbl9wdWxsX2Rvd246IHB3bTEtcGluLXB1bGwtZG93biB7CgkJCQlyb2NrY2hpcCxwaW5zID0K
CQkJCQk8NCBSS19QQzYgMSAmcGNmZ19wdWxsX2Rvd24+OwoJCQl9OwoJCX07CgoJCXB3bTIgewoJ
CQlwd20yX3BpbjogcHdtMi1waW4gewoJCQkJcm9ja2NoaXAscGlucyA9CgkJCQkJPDEgUktfUEMz
IDEgJnBjZmdfcHVsbF9ub25lPjsKCQkJfTsKCgkJCXB3bTJfcGluX3B1bGxfZG93bjogcHdtMi1w
aW4tcHVsbC1kb3duIHsKCQkJCXJvY2tjaGlwLHBpbnMgPQoJCQkJCTwxIFJLX1BDMyAxICZwY2Zn
X3B1bGxfZG93bj47CgkJCX07CgkJfTsKCgkJcHdtM2EgewoJCQlwd20zYV9waW46IHB3bTNhLXBp
biB7CgkJCQlyb2NrY2hpcCxwaW5zID0KCQkJCQk8MCBSS19QQTYgMSAmcGNmZ19wdWxsX25vbmU+
OwoJCQl9OwoJCX07CgoJCXB3bTNiIHsKCQkJcHdtM2JfcGluOiBwd20zYi1waW4gewoJCQkJcm9j
a2NoaXAscGlucyA9CgkJCQkJPDEgUktfUEI2IDEgJnBjZmdfcHVsbF9ub25lPjsKCQkJfTsKCQl9
OwoKCQloZG1pIHsKCQkJaGRtaV9pMmNfeGZlcjogaGRtaS1pMmMteGZlciB7CgkJCQlyb2NrY2hp
cCxwaW5zID0KCQkJCQk8NCBSS19QQzEgMyAmcGNmZ19wdWxsX25vbmU+LAoJCQkJCTw0IFJLX1BD
MCAzICZwY2ZnX3B1bGxfbm9uZT47CgkJCX07CgoJCQloZG1pX2NlYzogaGRtaS1jZWMgewoJCQkJ
cm9ja2NoaXAscGlucyA9CgkJCQkJPDQgUktfUEM3IDEgJnBjZmdfcHVsbF9ub25lPjsKCQkJfTsK
CQl9OwoKCQlwY2llIHsKCQkJcGNpZV9jbGtyZXFuX2NwbTogcGNpLWNsa3JlcW4tY3BtIHsKCQkJ
CXJvY2tjaGlwLHBpbnMgPQoJCQkJCTwyIFJLX1BEMiBSS19GVU5DX0dQSU8gJnBjZmdfcHVsbF9u
b25lPjsKCQkJfTsKCgkJCXBjaWVfY2xrcmVxbmJfY3BtOiBwY2ktY2xrcmVxbmItY3BtIHsKCQkJ
CXJvY2tjaGlwLHBpbnMgPQoJCQkJCTw0IFJLX1BEMCBSS19GVU5DX0dQSU8gJnBjZmdfcHVsbF9u
b25lPjsKCQkJfTsKCQl9OwoKCX07Cn07Cg==
--00000000000053c7ca05e39dc2f5--

