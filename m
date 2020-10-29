Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 663B429F444
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 19:49:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14574.35977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYCyj-0005eM-FQ; Thu, 29 Oct 2020 18:48:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14574.35977; Thu, 29 Oct 2020 18:48:53 +0000
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
	id 1kYCyj-0005dx-By; Thu, 29 Oct 2020 18:48:53 +0000
Received: by outflank-mailman (input) for mailman id 14574;
 Thu, 29 Oct 2020 18:48:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wm+X=EE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kYCyh-0005ds-L2
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 18:48:51 +0000
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55e4c43a-eabd-457b-889b-0ad6f0345e5f;
 Thu, 29 Oct 2020 18:48:50 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a72so784205wme.5
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2020 11:48:50 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Wm+X=EE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kYCyh-0005ds-L2
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 18:48:51 +0000
X-Inumbo-ID: 55e4c43a-eabd-457b-889b-0ad6f0345e5f
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 55e4c43a-eabd-457b-889b-0ad6f0345e5f;
	Thu, 29 Oct 2020 18:48:50 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a72so784205wme.5
        for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2020 11:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N4de3iPKUftnlFpf5FnF9kPaolR5meis5keMRhND+JY=;
        b=Pmc7WdVth87fJUeF9gvezBoM39x722fkjjp2rwBe4iDwf1FKYDFuDqevwYlvdDwg+1
         Uk/mQ8eAGsGNjIV5+g5lRDS1HxrCrklwdMUXkfHs5F8eGt28QKghvcWMpiYIm9tmT+GD
         kylGlJzWM10+5K3VLC6wR6Swnwub+VnL1NqrGrplOG7+/CbMsYzyVrEJJDnP4l5t9jP2
         APoyUa4NAYiEdONV/VgUZGdYHJ0Xdv0VigkimLvQkcQNPpnb5n3sTJ7CRpTAVqqapfmU
         K8lbl1NePf1qIENQ+4FgoUsxkl7k2edi1ReMcFwz9ZPJLkjunXJiDdQEE+fXWACGOdwP
         p7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N4de3iPKUftnlFpf5FnF9kPaolR5meis5keMRhND+JY=;
        b=ge73Udl2FRYRaCfo0zGyvuztSQL6MJT7+YLaer1+dRArS+WvKUKugK+tNA6UOHNN1w
         w9zMjXLDn77/NNe0r8VCNsqo5y2OaRZ108z7JkEr23/dm5QThdEiz/cbsbj68+HFu33Q
         0rfvGyCDzDMIl9jwb3UOFx4SLgfEuf7zGLmXuiccLC3qBWl5Su/RT0d9McAfJ8Hd7gK+
         P2G6mHukq51VUwRPGCyGQ56TQShB5JzPcLPqYHo603GJuBfHtGvz86XBfkYK4j/bSRBN
         jPEbefgVSV8Eih7IorsEkzJ7tbdJWnWVhxMpAkZcRQbiEA35JOVLHFHgOU+/d2v5Z1s3
         ajFw==
X-Gm-Message-State: AOAM5337WE38lc2fGfHvHhwGiPSZt1cpAr7dxWJP8Z8WNLVyTrNhYkBc
	JdpLlquPwZjCGkans0uYZfVvkwxt5Os7mUvDk9Y=
X-Google-Smtp-Source: ABdhPJy//taBYNrhU1ensXWXY2Tv5+OM89IPdVdRGTvQl3nVRLm4AbABsDjwxZE2bwTmElAaJNjlgLCcO0lkBd8+Ex0=
X-Received: by 2002:a1c:acc1:: with SMTP id v184mr223201wme.63.1603997329636;
 Thu, 29 Oct 2020 11:48:49 -0700 (PDT)
MIME-Version: 1.0
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com> <CAA93ih0o3XmD9neBu1fAkP1iBETu1-4qaQaEsZfEWRfYo7VCZA@mail.gmail.com>
In-Reply-To: <CAA93ih0o3XmD9neBu1fAkP1iBETu1-4qaQaEsZfEWRfYo7VCZA@mail.gmail.com>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Thu, 29 Oct 2020 20:48:38 +0200
Message-ID: <CAPD2p-npnQz+7NtMH81s2C3dsAt_6kxQ68n7LhwYbOuTFaUEvw@mail.gmail.com>
Subject: Re: [PATCH V2 00/23] IOREQ feature (+ virtio-mmio) on Arm
To: Masami Hiramatsu <masami.hiramatsu@linaro.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Paul Durrant <paul@xen.org>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	Julien Grall <julien.grall@arm.com>, George Dunlap <george.dunlap@citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>, 
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	Anthony PERARD <anthony.perard@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Content-Type: multipart/alternative; boundary="0000000000000dc0df05b2d3bb4e"

--0000000000000dc0df05b2d3bb4e
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 29, 2020 at 9:42 AM Masami Hiramatsu <
masami.hiramatsu@linaro.org> wrote:

> Hi Oleksandr,
>
Hi Masami

[sorry for the possible format issue]


>
> I would like to try this on my arm64 board.
>
Glad to hear you are interested in this topic.


>
> According to your comments in the patch, I made this config file.
> # cat debian.conf
> name = "debian"
> type = "pvh"
> vcpus = 8
> memory = 512
> kernel = "/opt/agl/vmlinuz-5.9.0-1-arm64"
> ramdisk = "/opt/agl/initrd.img-5.9.0-1-arm64"
> cmdline= "console=hvc0 earlyprintk=xen root=/dev/xvda1 rw"
> disk = [ '/opt/agl/debian.qcow2,qcow2,hda' ]
> vif = [ 'mac=00:16:3E:74:3d:76,bridge=xenbr0' ]
> virtio = 1
> vdisk = [ 'backend=Dom0, disks=ro:/dev/sda1' ]
>
> And tried to boot a DomU, but I got below error.
>
> # xl create -c debian.conf
> Parsing config from debian.conf
> libxl: error: libxl_create.c:1863:domcreate_attach_devices: Domain
> 1:unable to add virtio_disk devices
> libxl: error: libxl_domain.c:1218:destroy_domid_pci_done: Domain
> 1:xc_domain_pause failed
> libxl: error: libxl_dom.c:39:libxl__domain_type: unable to get domain
> type for domid=1
> libxl: error: libxl_domain.c:1136:domain_destroy_callback: Domain
> 1:Unable to destroy guest
> libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain
> 1:Destruction of domain failed
>
>
> Could you tell me how can I test it?
>

I assume it is due to the lack of the virtio-disk backend (which I haven't
shared yet as I focused on the IOREQ/DM support on Arm in the first place).
Could you wait a little bit, I am going to share it soon.


-- 
Regards,

Oleksandr Tyshchenko

--0000000000000dc0df05b2d3bb4e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 29, 2020 at 9:42 AM Masam=
i Hiramatsu &lt;<a href=3D"mailto:masami.hiramatsu@linaro.org">masami.hiram=
atsu@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Hi Oleksandr,<br></blockquote><div>Hi Masami</div><div><br><=
/div><div>[sorry for the possible format issue]</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
I would like to try this on my arm64 board.<br></blockquote><div>Glad to he=
ar you are interested in this topic.=C2=A0</div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<br>
According to your comments in the patch, I made this config file.<br>
# cat debian.conf<br>
name =3D &quot;debian&quot;<br>
type =3D &quot;pvh&quot;<br>
vcpus =3D 8<br>
memory =3D 512<br>
kernel =3D &quot;/opt/agl/vmlinuz-5.9.0-1-arm64&quot;<br>
ramdisk =3D &quot;/opt/agl/initrd.img-5.9.0-1-arm64&quot;<br>
cmdline=3D &quot;console=3Dhvc0 earlyprintk=3Dxen root=3D/dev/xvda1 rw&quot=
;<br>
disk =3D [ &#39;/opt/agl/debian.qcow2,qcow2,hda&#39; ]<br>
vif =3D [ &#39;mac=3D00:16:3E:74:3d:76,bridge=3Dxenbr0&#39; ]<br>
virtio =3D 1<br>
vdisk =3D [ &#39;backend=3DDom0, disks=3Dro:/dev/sda1&#39; ]<br>
<br>
And tried to boot a DomU, but I got below error.<br>
<br>
# xl create -c debian.conf<br>
Parsing config from debian.conf<br>
libxl: error: libxl_create.c:1863:domcreate_attach_devices: Domain<br>
1:unable to add virtio_disk devices<br>
libxl: error: libxl_domain.c:1218:destroy_domid_pci_done: Domain<br>
1:xc_domain_pause failed<br>
libxl: error: libxl_dom.c:39:libxl__domain_type: unable to get domain<br>
type for domid=3D1<br>
libxl: error: libxl_domain.c:1136:domain_destroy_callback: Domain<br>
1:Unable to destroy guest<br>
libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain<br>
1:Destruction of domain failed<br>
<br>
<br>
Could you tell me how can I test it?<br></blockquote><div><br></div><div>I =
assume it is due to the lack of the virtio-disk backend (which I haven&#39;=
t shared yet as I focused on the IOREQ/DM support on Arm in the first place=
).</div><div>Could you wait a little bit, I am going to share it soon.=C2=
=A0</div></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr" cla=
ss=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=
=3D"ltr"><span style=3D"background-color:rgb(255,255,255)"><font size=3D"2"=
><span style=3D"color:rgb(51,51,51);font-family:Arial,sans-serif">Regards,<=
/span></font></span></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div>=
<span style=3D"background-color:rgb(255,255,255)"><font size=3D"2">Oleksand=
r Tyshchenko</font></span></div></div></div></div></div></div></div></div>

--0000000000000dc0df05b2d3bb4e--

