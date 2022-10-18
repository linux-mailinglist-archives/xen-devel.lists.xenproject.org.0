Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE8860269A
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 10:17:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424776.672459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okhmq-0002eA-KY; Tue, 18 Oct 2022 08:17:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424776.672459; Tue, 18 Oct 2022 08:17:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okhmq-0002bU-Gp; Tue, 18 Oct 2022 08:17:20 +0000
Received: by outflank-mailman (input) for mailman id 424776;
 Tue, 18 Oct 2022 08:17:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3X7+=2T=gmail.com=vsuneja63@srs-se1.protection.inumbo.net>)
 id 1okhmp-0002bO-8z
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 08:17:19 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46c39cba-4ebd-11ed-8fd0-01056ac49cbb;
 Tue, 18 Oct 2022 10:17:16 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id m15so19308677edb.13
 for <xen-devel@lists.xenproject.org>; Tue, 18 Oct 2022 01:17:18 -0700 (PDT)
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
X-Inumbo-ID: 46c39cba-4ebd-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=90ZjSDua2qyjWgYFEzx8rCopKaliM8vxbKPF7kybeyE=;
        b=KGkjnD/K9NHiN3yUUkHgYLWxVwp4zNAjMnLAsgATjM1sdEE2uwxDa1GZk32qITvTta
         fdDRhxgi5/bPwl54+/PMPPt8dYA+384fCtpZKFyin+en4F8OHIpP+JzWqmswq9+l1Ih/
         DjfFH+cRG4bXkBaUwqhY0vq4lCxitQq4T09lJFoICRFu5i81Cdtvjnja+57fzZnTkkjO
         FR+pLPG6EZW5bwaCO5oNaXYON2O1Eyyt8qRKAAK8n0RY0twwU+agkhKwKEHycApFquQ+
         NlI1PYP86HCfAX+OAeffA3G/u3+plAV1DRW7jG47OgPOF2gv0rbDAG8qe+VdK/g6tW4A
         nSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=90ZjSDua2qyjWgYFEzx8rCopKaliM8vxbKPF7kybeyE=;
        b=hWSkVXHDsK6Hx6Nu3XlqhdArHAld9jqmw5Se5DutCWg+jgQpnTVXanAqmlVhTtWMZJ
         Crqm810juswMcftLdUv/wX7zuLb882qXOrFACGy4uwV93XsSemzR1rLUCNAWCdG8/zSD
         MbwouODgnh9Xc5M7PzudidYy+0aPY5LmSxRsgnDb3Dv2hqlyvrsgD7YhyDMeeW9m4RyM
         ecVhgpbgWVv3NDlAPxnPUn4evU3xFccbkwsr8pnVfRxqnu9vHDBX6/gMcCOKwWJeQdLR
         IFyOmxN5ZuSsbdsEbbYQVlVTNR03nh8TB9Kbc7OvP6kHjNj6MHOhYOEPylJH7erH3OSm
         IY7w==
X-Gm-Message-State: ACrzQf0Mz9hYmZ5fI/1IgX2gxTBC/rAUTaDEQoOhlUKqTY6pJu8KwPAT
	PD7pawNiHtVQUfHuphKVmQ1TDCEIO9vVcqN7GyY=
X-Google-Smtp-Source: AMsMyM4Q2IlJX83NI4qcSb8utiEe2wutDuWukjsMEJgBg38ZtuApqetM/Q3NPjjMQtm/Swmc3ZFjVX4D4up8ggdAsTA=
X-Received: by 2002:a05:6402:ca:b0:45c:dbdd:8143 with SMTP id
 i10-20020a05640200ca00b0045cdbdd8143mr1528014edu.213.1666081037558; Tue, 18
 Oct 2022 01:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <CALAP8f--jyG=ufJ9WGtL6qoeGdsykjNK85G3q50SzJm5+wOzhQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2210171400570.2351079@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2210171400570.2351079@ubuntu-linux-20-04-desktop>
From: Vipul Suneja <vsuneja63@gmail.com>
Date: Tue, 18 Oct 2022 13:47:05 +0530
Message-ID: <CALAP8f81ojfVD9n5EMtD7DxY-8uomgENVEQH9Afz7Hk9rfaAsw@mail.gmail.com>
Subject: Re: Porting Xen in raspberry pi4B
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, oleksandr_andrushchenko@epam.com, 
	oleksandr_tyshchenko@epam.com, jgross@suse.com, boris.ostrovsky@oracle.com
Content-Type: multipart/alternative; boundary="00000000000069287305eb4ab819"

--00000000000069287305eb4ab819
Content-Type: text/plain; charset="UTF-8"

Hi Stefano,

Thanks for the response!

I could install tigerVNC, x11vnc & libvncserver in Dom0 xen-image-minimal
but only manage to install libvncserver(couldn't install tigervnc & x11vnc
because of x11
support missing, it's wayland) in DOMU custom graphical image. I tried
running vncviewer with IP address & port in dom0 to access the domu
graphical image display as per below commands.

* vncviewer 192.168.1.42:5901 <http://192.168.1.42:5901>*

 But it showing can't open display, below are the logs:








*root@raspberrypi4-64:~/guest1# vncviewer 192.168.1.42:5901
<http://192.168.1.42:5901>TigerVNC Viewer 64-bit v1.11.0Built on:
2020-09-08 12:16Copyright (C) 1999-2020 TigerVNC Team and many others (see
README.rst)See https://www.tigervnc.org <https://www.tigervnc.org> for
information on TigerVNC.Can't open display: root@raspberrypi4-64:~/guest1#*

I am not exactly sure what the issue is but I thought only libvncserver in
DOMU could work to get access but it did not work.
If TigerVNC is the issue here then is there any other VNC source which
could be installed for both x11 & wayland supported images?

Regards,
Vipul Kumar

On Tue, Oct 18, 2022 at 2:40 AM Stefano Stabellini <sstabellini@kernel.org>
wrote:

> VNC is typically easier to setup, because SDL needs extra libraries at
> build time and runtime. If QEMU is built without SDL support it won't
> start when you ask for SDL.
>
> VNC should work with both x11 and wayland in your domU. It doesn't work
> at the x11 level, it exposes a special fbdev device in your domU that
> should work with:
> - a graphical console in Linux domU
> - x11
> - wayland (but I haven't tested this so I am not 100% sure about it)
>
> When you say "it doesn't work", what do you mean? Do you get a black
> window?
>
> You need CONFIG_XEN_FBDEV_FRONTEND in Linux domU
> (drivers/video/fbdev/xen-fbfront.c). I would try to get a graphical text
> console up and running in your domU before attempting x11/wayland.
>
> Cheers,
>
> Stefano
>
> On Mon, 17 Oct 2022, Vipul Suneja wrote:
> > Hi,
> > Thanks!
> >
> > I have ported xen minimal image as DOM0 & custom wayland GUI based image
> as DOMU in raspberry pi4B. I am trying to make GUI display up
> > for guest machine. I tried using sdl, included below line in guest.conf
> file
> > vfb= [ 'sdl=1' ]
> >
> > But it is throwing below error:
> >
> > root@raspberrypi4-64:~/guest1# xl create -c guest1.cfg
> > Parsing config from guest1.cfg
> > libxl: error: libxl_qmp.c:1400:qmp_ev_fd_callback: Domain 3:error on QMP
> socket: Connection reset by peer
> > libxl: error: libxl_qmp.c:1439:qmp_ev_fd_callback: Domain 3:Error
> happened with the QMP connection to QEMU
> > libxl: error: libxl_dm.c:3351:device_model_postconfig_done: Domain
> 3:Post DM startup configs failed, rc=-26
> > libxl: error: libxl_create.c:1867:domcreate_devmodel_started: Domain
> 3:device model did not start: -26
> > libxl: error: libxl_aoutils.c:646:libxl__kill_xs_path: Device Model
> already exited
> > libxl: error: libxl_domain.c:1183:libxl__destroy_domid: Domain
> 3:Non-existant domain
> > libxl: error: libxl_domain.c:1137:domain_destroy_callback: Domain
> 3:Unable to destroy guest
> > libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain
> 3:Destruction of domain failed
> >
> > Another way is VNC, i could install tigervnc in DOM0 but same i couldn't
> in guest machine because it doesn't support x11(supports wayland
> > only). I am completely blocked here, Need your support to enable the
> display up.
> > Any alternative of VNC which could work in both x11 & wayland supported
> images?
> >
> > Any input on VNC, SDL or any other way to proceed on this? Looking
> forward to hearing from you.
> >
> > Regards,
> > Vipul Kumar

--00000000000069287305eb4ab819
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Stefano,<br><br>Thanks for the response!<br><br>I could=
 install tigerVNC, x11vnc &amp; libvncserver in Dom0 xen-image-minimal but =
only manage to install libvncserver(couldn&#39;t install tigervnc &amp; x11=
vnc because of x11<br>support missing, it&#39;s wayland) in DOMU custom gra=
phical image. I tried running vncviewer with IP address &amp; port in dom0 =
to access the domu graphical image display as per below commands.<br>=C2=A0=
<br><b><i>=C2=A0vncviewer <a href=3D"http://192.168.1.42:5901">192.168.1.42=
:5901</a></i></b><br>=C2=A0<br>=C2=A0But it showing can&#39;t open display,=
 below are the logs:<br>=C2=A0<br><b><i>root@raspberrypi4-64:~/guest1# vncv=
iewer <a href=3D"http://192.168.1.42:5901">192.168.1.42:5901</a><br><br>Tig=
erVNC Viewer 64-bit v1.11.0<br>Built on: 2020-09-08 12:16<br>Copyright (C) =
1999-2020 TigerVNC Team and many others (see README.rst)<br>See <a href=3D"=
https://www.tigervnc.org">https://www.tigervnc.org</a> for information on T=
igerVNC.<br>Can&#39;t open display: <br>root@raspberrypi4-64:~/guest1#</i><=
/b><br><div><b><i><br></i></b></div><div>I am not exactly=C2=A0sure what th=
e issue is but I thought only libvncserver in DOMU could work to get access=
 but it did not work.=C2=A0</div><div>If TigerVNC is the issue here then is=
 there any other VNC source which could be installed for both x11 &amp; way=
land supported images?</div><div><br></div><div>Regards,</div><div>Vipul Ku=
mar</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Tue, Oct 18, 2022 at 2:40 AM Stefano Stabellini &lt;<a href=3D"=
mailto:sstabellini@kernel.org">sstabellini@kernel.org</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">VNC is typically easie=
r to setup, because SDL needs extra libraries at<br>
build time and runtime. If QEMU is built without SDL support it won&#39;t<b=
r>
start when you ask for SDL.<br>
<br>
VNC should work with both x11 and wayland in your domU. It doesn&#39;t work=
<br>
at the x11 level, it exposes a special fbdev device in your domU that<br>
should work with:<br>
- a graphical console in Linux domU<br>
- x11<br>
- wayland (but I haven&#39;t tested this so I am not 100% sure about it)<br=
>
<br>
When you say &quot;it doesn&#39;t work&quot;, what do you mean? Do you get =
a black<br>
window?<br>
<br>
You need CONFIG_XEN_FBDEV_FRONTEND in Linux domU<br>
(drivers/video/fbdev/xen-fbfront.c). I would try to get a graphical text<br=
>
console up and running in your domU before attempting x11/wayland.<br>
<br>
Cheers,<br>
<br>
Stefano<br>
<br>
On Mon, 17 Oct 2022, Vipul Suneja wrote:<br>
&gt; Hi,<br>
&gt; Thanks!<br>
&gt; <br>
&gt; I have ported xen minimal image as DOM0 &amp; custom wayland GUI based=
 image as DOMU in raspberry pi4B. I am trying to make GUI display up<br>
&gt; for=C2=A0guest machine. I tried using=C2=A0sdl, included below line in=
 guest.conf file<br>
&gt; vfb=3D [ &#39;sdl=3D1&#39; ]<br>
&gt; <br>
&gt; But it is throwing below error:<br>
&gt; <br>
&gt; root@raspberrypi4-64:~/guest1# xl create -c guest1.cfg<br>
&gt; Parsing config from guest1.cfg<br>
&gt; libxl: error: libxl_qmp.c:1400:qmp_ev_fd_callback: Domain 3:error on Q=
MP socket: Connection reset by peer<br>
&gt; libxl: error: libxl_qmp.c:1439:qmp_ev_fd_callback: Domain 3:Error happ=
ened with the QMP connection to QEMU<br>
&gt; libxl: error: libxl_dm.c:3351:device_model_postconfig_done: Domain 3:P=
ost DM startup configs failed, rc=3D-26<br>
&gt; libxl: error: libxl_create.c:1867:domcreate_devmodel_started: Domain 3=
:device model did not start: -26<br>
&gt; libxl: error: libxl_aoutils.c:646:libxl__kill_xs_path: Device Model al=
ready exited<br>
&gt; libxl: error: libxl_domain.c:1183:libxl__destroy_domid: Domain 3:Non-e=
xistant domain<br>
&gt; libxl: error: libxl_domain.c:1137:domain_destroy_callback: Domain 3:Un=
able to destroy guest<br>
&gt; libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain 3:Destruct=
ion of domain failed<br>
&gt; <br>
&gt; Another way is VNC, i could install tigervnc in DOM0 but same i couldn=
&#39;t in guest machine because it doesn&#39;t support x11(supports wayland=
<br>
&gt; only). I am completely blocked here, Need your support to enable the d=
isplay up.<br>
&gt; Any alternative of VNC which could work in both x11 &amp; wayland supp=
orted images?<br>
&gt; <br>
&gt; Any input on VNC, SDL or any other way to proceed on this? Looking for=
ward to hearing from you.<br>
&gt; <br>
&gt; Regards,<br>
&gt; Vipul Kumar</blockquote></div>

--00000000000069287305eb4ab819--

