Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0DD29F6B5
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 22:14:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14917.37166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYFFG-0000Ry-Tj; Thu, 29 Oct 2020 21:14:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14917.37166; Thu, 29 Oct 2020 21:14:06 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYFFG-0000RY-QF; Thu, 29 Oct 2020 21:14:06 +0000
Received: by outflank-mailman (input) for mailman id 14917;
 Thu, 29 Oct 2020 21:14:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wm+X=EE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kYFFF-0000RM-9U
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 21:14:05 +0000
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a7bbdfb-12ad-4d87-9930-5f3852a3d78e;
 Thu, 29 Oct 2020 21:14:03 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id w23so1107662wmi.4
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2020 14:14:03 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Wm+X=EE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kYFFF-0000RM-9U
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 21:14:05 +0000
X-Inumbo-ID: 8a7bbdfb-12ad-4d87-9930-5f3852a3d78e
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8a7bbdfb-12ad-4d87-9930-5f3852a3d78e;
	Thu, 29 Oct 2020 21:14:03 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id w23so1107662wmi.4
        for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2020 14:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D8eSB78EFRLXythUPCXWl4F9Wn1YnT4u0iH1EGYuYfw=;
        b=iy3yWpN/lBOR/vjfFY3UbQ9P1W3O79OVJNRecMBc6P5FVsznAr7L6gjasOgAC0GH5P
         M5xTeKNeiZokJLh6kfCy9xWoGXvhm984woBtVu/PVVJiGEAttUEiPb77CcviTG+/ZO3v
         4BLVCsjzgkP7eRq3L5iazPLC7Qr33qRJtLEQg3xmnFiv9pRmypOwwZM/bc0757QxQxrv
         clEZIA/QcoQkfUakAuMPA6IunPgOiB3wZOrt8iQaHMoJdSGGFaGnnM1vC6q3jF7qiSIe
         NlN5dxUbf4py6dR9siuE+vEd2dVlYJeo4f/A/On9uYR4pwGp5QlWwmBKXHrVh1rzqDHG
         dqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D8eSB78EFRLXythUPCXWl4F9Wn1YnT4u0iH1EGYuYfw=;
        b=CDHvtP4RCAEif48IExYYn4mjySy83mhDnx0TqahAvYryEv1lEEYtlIJjxAfzom8mBk
         MKUMr2NC2lTp8MyEJgJm/aQQ8yqKYX+Ms1/04KwjHIhzkOitDcLNkOopA1xaBmafJOSP
         TFa5FOxHrYSZwbd3JwV3Eri4Og4y+StrnVsOqZ9i656PCt7KNXqT3+tTGJ+gduIltDSh
         7RgM3NzrCACMgDZnsGR7wYtBXk9QfajaFm7GMWqEpSE8YyEfzD5zxgWC+eJnZbG6EGhi
         r3U8E/674NnCfbkAp1Mh+18pHO8A6fdWpc3NmZRwwwbz8Rz8xLXv3xxtTcD1vcSbU0kg
         8Cfg==
X-Gm-Message-State: AOAM530dX7+K56+m0pxJM2JsaTqMdpYHcJDbNFxDlzyy9why6iSBBIKE
	o+hb+uvPdZeTLnOsk0rAkk4WaOiDUn6iYOv/gok=
X-Google-Smtp-Source: ABdhPJyNiCh2YgVlVzX55ffL1sEm/QYthO4nJNqfoowwh4t07Ek7ExLl31U3s1X09+qzexbbc398gr/bI5Pp1ABmXoM=
X-Received: by 2002:a1c:acc1:: with SMTP id v184mr808495wme.63.1604006043018;
 Thu, 29 Oct 2020 14:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <CAA93ih0o3XmD9neBu1fAkP1iBETu1-4qaQaEsZfEWRfYo7VCZA@mail.gmail.com>
 <CAPD2p-npnQz+7NtMH81s2C3dsAt_6kxQ68n7LhwYbOuTFaUEvw@mail.gmail.com> <alpine.DEB.2.21.2010291252410.12247@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2010291252410.12247@sstabellini-ThinkPad-T480s>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Thu, 29 Oct 2020 23:13:51 +0200
Message-ID: <CAPD2p-mH0Hi+JOUB-mt+aZR_gN86EZCpnMPTww0ErMESTwZ=AA@mail.gmail.com>
Subject: Re: [PATCH V2 00/23] IOREQ feature (+ virtio-mmio) on Arm
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Masami Hiramatsu <masami.hiramatsu@linaro.org>, xen-devel <xen-devel@lists.xenproject.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Paul Durrant <paul@xen.org>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	Julien Grall <julien.grall@arm.com>, George Dunlap <george.dunlap@citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Tim Deegan <tim@xen.org>, 
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	Anthony PERARD <anthony.perard@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Content-Type: multipart/alternative; boundary="000000000000696d0f05b2d5c215"

--000000000000696d0f05b2d5c215
Content-Type: text/plain; charset="UTF-8"

Hi Stefano

[sorry for the possible format issue]

On Thu, Oct 29, 2020 at 9:53 PM Stefano Stabellini <sstabellini@kernel.org>
wrote:

> On Thu, 29 Oct 2020, Oleksandr Tyshchenko wrote:
> > On Thu, Oct 29, 2020 at 9:42 AM Masami Hiramatsu <
> masami.hiramatsu@linaro.org> wrote:
> >       Hi Oleksandr,
> >
> > Hi Masami
> >
> > [sorry for the possible format issue]
> >
> >
> >       I would like to try this on my arm64 board.
> >
> > Glad to hear you are interested in this topic.
> >
> >
> >       According to your comments in the patch, I made this config file.
> >       # cat debian.conf
> >       name = "debian"
> >       type = "pvh"
> >       vcpus = 8
> >       memory = 512
> >       kernel = "/opt/agl/vmlinuz-5.9.0-1-arm64"
> >       ramdisk = "/opt/agl/initrd.img-5.9.0-1-arm64"
> >       cmdline= "console=hvc0 earlyprintk=xen root=/dev/xvda1 rw"
> >       disk = [ '/opt/agl/debian.qcow2,qcow2,hda' ]
> >       vif = [ 'mac=00:16:3E:74:3d:76,bridge=xenbr0' ]
> >       virtio = 1
> >       vdisk = [ 'backend=Dom0, disks=ro:/dev/sda1' ]
> >
> >       And tried to boot a DomU, but I got below error.
> >
> >       # xl create -c debian.conf
> >       Parsing config from debian.conf
> >       libxl: error: libxl_create.c:1863:domcreate_attach_devices: Domain
> >       1:unable to add virtio_disk devices
> >       libxl: error: libxl_domain.c:1218:destroy_domid_pci_done: Domain
> >       1:xc_domain_pause failed
> >       libxl: error: libxl_dom.c:39:libxl__domain_type: unable to get
> domain
> >       type for domid=1
> >       libxl: error: libxl_domain.c:1136:domain_destroy_callback: Domain
> >       1:Unable to destroy guest
> >       libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain
> >       1:Destruction of domain failed
> >
> >
> >       Could you tell me how can I test it?
> >
> >
> > I assume it is due to the lack of the virtio-disk backend (which I
> haven't shared yet as I focused on the IOREQ/DM support on Arm in the
> > first place).
> > Could you wait a little bit, I am going to share it soon.
>
> Do you have a quick-and-dirty hack you can share in the meantime? Even
> just on github as a special branch? It would be very useful to be able
> to have a test-driver for the new feature.

Well, I will provide a branch on github with our PoC virtio-disk backend by
the end of this week. It will be possible to test this series with it.


-- 
Regards,

Oleksandr Tyshchenko

--000000000000696d0f05b2d5c215
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Stefano</div><div><br></div><div>[sorry for the po=
ssible format issue]</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Thu, Oct 29, 2020 at 9:53 PM Stefano Stabellini &lt;=
<a href=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 29 =
Oct 2020, Oleksandr Tyshchenko wrote:<br>
&gt; On Thu, Oct 29, 2020 at 9:42 AM Masami Hiramatsu &lt;<a href=3D"mailto=
:masami.hiramatsu@linaro.org" target=3D"_blank">masami.hiramatsu@linaro.org=
</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Hi Oleksandr,<br>
&gt; <br>
&gt; Hi Masami<br>
&gt; <br>
&gt; [sorry for the possible format issue]<br>
&gt; =C2=A0<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0I would like to try this on my arm64 board.<=
br>
&gt; <br>
&gt; Glad to hear you are interested in this topic.=C2=A0<br>
&gt; =C2=A0<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0According to your comments in the patch, I m=
ade this config file.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# cat debian.conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0name =3D &quot;debian&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0type =3D &quot;pvh&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0vcpus =3D 8<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0memory =3D 512<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0kernel =3D &quot;/opt/agl/vmlinuz-5.9.0-1-ar=
m64&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ramdisk =3D &quot;/opt/agl/initrd.img-5.9.0-=
1-arm64&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cmdline=3D &quot;console=3Dhvc0 earlyprintk=
=3Dxen root=3D/dev/xvda1 rw&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0disk =3D [ &#39;/opt/agl/debian.qcow2,qcow2,=
hda&#39; ]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0vif =3D [ &#39;mac=3D00:16:3E:74:3d:76,bridg=
e=3Dxenbr0&#39; ]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0virtio =3D 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0vdisk =3D [ &#39;backend=3DDom0, disks=3Dro:=
/dev/sda1&#39; ]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0And tried to boot a DomU, but I got below er=
ror.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# xl create -c debian.conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Parsing config from debian.conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0libxl: error: libxl_create.c:1863:domcreate_=
attach_devices: Domain<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A01:unable to add virtio_disk devices<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0libxl: error: libxl_domain.c:1218:destroy_do=
mid_pci_done: Domain<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A01:xc_domain_pause failed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0libxl: error: libxl_dom.c:39:libxl__domain_t=
ype: unable to get domain<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0type for domid=3D1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0libxl: error: libxl_domain.c:1136:domain_des=
troy_callback: Domain<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A01:Unable to destroy guest<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0libxl: error: libxl_domain.c:1063:domain_des=
troy_cb: Domain<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A01:Destruction of domain failed<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Could you tell me how can I test it?<br>
&gt; <br>
&gt; <br>
&gt; I assume it is due to the lack of the virtio-disk backend (which I hav=
en&#39;t shared yet as I focused on the IOREQ/DM support on Arm in the<br>
&gt; first place).<br>
&gt; Could you wait a little bit, I am going to share it soon.=C2=A0<br>
<br>
Do you have a quick-and-dirty hack you can share in the meantime? Even<br>
just on github as a special branch? It would be very useful to be able<br>
to have a test-driver for the new feature.</blockquote><div>Well, I will pr=
ovide a branch on github with our PoC virtio-disk backend by the end of thi=
s week. It will be possible to test this series with it.=C2=A0</div></div><=
br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_sign=
ature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><span s=
tyle=3D"background-color:rgb(255,255,255)"><font size=3D"2"><span style=3D"=
color:rgb(51,51,51);font-family:Arial,sans-serif">Regards,</span></font></s=
pan></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div><span style=3D"b=
ackground-color:rgb(255,255,255)"><font size=3D"2">Oleksandr Tyshchenko</fo=
nt></span></div></div></div></div></div></div></div></div>

--000000000000696d0f05b2d5c215--

