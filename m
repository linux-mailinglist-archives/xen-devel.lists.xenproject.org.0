Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9917604E7E
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 19:20:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425969.674116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olCjj-00084L-F8; Wed, 19 Oct 2022 17:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425969.674116; Wed, 19 Oct 2022 17:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olCjj-00081g-C7; Wed, 19 Oct 2022 17:20:11 +0000
Received: by outflank-mailman (input) for mailman id 425969;
 Wed, 19 Oct 2022 17:20:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e9yj=2U=gmail.com=vsuneja63@srs-se1.protection.inumbo.net>)
 id 1olCji-00081a-26
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 17:20:10 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47871c0a-4fd2-11ed-8fd0-01056ac49cbb;
 Wed, 19 Oct 2022 19:20:08 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id b12so26281245edd.6
 for <xen-devel@lists.xenproject.org>; Wed, 19 Oct 2022 10:20:08 -0700 (PDT)
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
X-Inumbo-ID: 47871c0a-4fd2-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lMyZl1HIk5QbkfXnvfl3s8oUJiKRV8LFjyWmV1q/nj8=;
        b=QwRN7cwYOuoYua00YLen2/+kdC+R68qSIpBLR87GglmMV9M2HK6nfZznxYh97wlSJr
         xaDsov3wSX96O3VAZcVZ/Re0Jxzcxg+Nn2xGuk9xR7goKCRCwUmQ8S0VqHvrzW6oY3n7
         mbG7joZf6/a0Qiktg3173MloNOxFReYZuG/CDGkCdlOCsCz7L4QI+ufInXMfVN+L+PUQ
         7wUPDxEj7e9Rw0gDTjcVyKamcFCD7jJFp/wbH9ekirM4EtnUmWjNoA+fGrn0rnB5DmWW
         tDv53oLy2P+eD+kNQ+QhqiHvFbL1wU9e/6eM/2N2XoSDRaMPyKZ059vRM6tJ8YTvXvxK
         j11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMyZl1HIk5QbkfXnvfl3s8oUJiKRV8LFjyWmV1q/nj8=;
        b=yrI4NOa0IrYKeFhBlvpILds71PRLAukW5+z4aH7E6jDBBnugE7UWUXHsOOa5DX5a5C
         qQEHaUdFs0w89XIwwAQF8u8a4T4HQrcLT3zccfy5AgvZMAKWgjuy4mAPlc9eB0xD0IAO
         I44zgnb2oSODhdl6V5tDzX3Gx5F38SW11eqD1SajVzr+pXl/BUNr3gh/AexyL2UG2pgg
         OsakCXnNvI8YOKodSWSgzPwgaI6Zh/redI3x3HdMytlTt87/qjfG0y4Tmz8e0APldDbz
         9jWpwHnlXixzIUMHWu3LcokwYbkq8Ic4cO9+jZPAvcGtuqzxIIZqNDWgJoNM5h0LQ5ns
         ly9w==
X-Gm-Message-State: ACrzQf1+DbMnoP+I8hNMwv980TBAcKqS8OZkBdzl0b349f3HdbAaYv71
	NlAdfuMLMraPJMVgel0Ie595YPDKdyx+jyCQ+2o=
X-Google-Smtp-Source: AMsMyM7Pdj1LGRdJaiR74nkHHSZSxW9JuEVhx/SDAmdD6B+VMNZadI6OMNCiMMo4h6CR6wCJqX+Ota46yUD2N+fGZBc=
X-Received: by 2002:a05:6402:ca:b0:45c:dbdd:8143 with SMTP id
 i10-20020a05640200ca00b0045cdbdd8143mr8465933edu.213.1666200007592; Wed, 19
 Oct 2022 10:20:07 -0700 (PDT)
MIME-Version: 1.0
References: <CALAP8f--jyG=ufJ9WGtL6qoeGdsykjNK85G3q50SzJm5+wOzhQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2210171400570.2351079@ubuntu-linux-20-04-desktop>
 <CALAP8f81ojfVD9n5EMtD7DxY-8uomgENVEQH9Afz7Hk9rfaAsw@mail.gmail.com> <alpine.DEB.2.22.394.2210181213370.4587@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2210181213370.4587@ubuntu-linux-20-04-desktop>
From: Vipul Suneja <vsuneja63@gmail.com>
Date: Wed, 19 Oct 2022 22:49:55 +0530
Message-ID: <CALAP8f9Zgue6WfAk2uRGkg=1Up2Z+eQWqvQ1_Z2=r66Z5fvKoA@mail.gmail.com>
Subject: Re: Porting Xen in raspberry pi4B
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, oleksandr_andrushchenko@epam.com, 
	oleksandr_tyshchenko@epam.com, jgross@suse.com, boris.ostrovsky@oracle.com, 
	Bertrand.Marquis@arm.com
Content-Type: multipart/mixed; boundary="000000000000942cc805eb666b30"

--000000000000942cc805eb666b30
Content-Type: multipart/alternative; boundary="000000000000942cc405eb666b2e"

--000000000000942cc405eb666b2e
Content-Type: text/plain; charset="UTF-8"

Hi Stefano,

Thanks for the response!

I am following the same link you shared from the beginning. Tried the
command "vncviewer localhost:0" in DOM0 but same issue "Can't open
display", below are the logs:







*root@raspberrypi4-64:~# vncviewer localhost:0TigerVNC Viewer 64-bit
v1.11.0Built on: 2020-09-08 12:16Copyright (C) 1999-2020 TigerVNC Team and
many others (see README.rst)See https://www.tigervnc.org
<https://www.tigervnc.org> for information on TigerVNC.Can't open display:*

Below are the netstat logs, i couldn't see anything running at port 5900 or
5901:


























*root@raspberrypi4-64:~# netstat -tuwx Active Internet connections (w/o
servers)Proto Recv-Q Send-Q Local Address           Foreign Address
State       tcp        0    164 192.168.1.39:ssh        192.168.1.38:37472
<http://192.168.1.38:37472>      ESTABLISHED Active UNIX domain sockets
(w/o servers)Proto RefCnt Flags       Type       State         I-Node
Pathunix  8      [ ]         DGRAM      CONNECTED      10565 /dev/logunix
 3      [ ]         STREAM     CONNECTED      10891
/var/run/xenstored/socketunix  3      [ ]         STREAM     CONNECTED
 13791 unix  3      [ ]         STREAM     CONNECTED      10843
/var/run/xenstored/socketunix  3      [ ]         STREAM     CONNECTED
 10573 /var/run/xenstored/socketunix  2      [ ]         DGRAM
 CONNECTED      14510 unix  3      [ ]         STREAM     CONNECTED
 13249 unix  2      [ ]         DGRAM      CONNECTED      13887 unix  2
 [ ]         DGRAM      CONNECTED      10599 unix  3      [ ]
STREAM     CONNECTED      14005 unix  3      [ ]         STREAM
CONNECTED      13258 unix  3      [ ]         STREAM     CONNECTED
 13248 unix  3      [ ]         STREAM     CONNECTED      14003 unix  3
 [ ]         STREAM     CONNECTED      10572 /var/run/xenstored/socketunix
 3      [ ]         STREAM     CONNECTED      10786
/var/run/xenstored/socketunix  3      [ ]         DGRAM      CONNECTED
 13186 unix  3      [ ]         STREAM     CONNECTED      10864
/var/run/xenstored/socketunix  3      [ ]         STREAM     CONNECTED
 10812 /var/run/xenstored/socketunix  2      [ ]         DGRAM
 CONNECTED      14083 unix  3      [ ]         STREAM     CONNECTED
 10813 /var/run/xenstored/socket*









*unix  3      [ ]         STREAM     CONNECTED      14068 unix  3      [ ]
        STREAM     CONNECTED      13256 unix  3      [ ]         STREAM
CONNECTED      10571 /var/run/xenstored/socketunix  3      [ ]
STREAM     CONNECTED      10842 unix  3      [ ]         STREAM
CONNECTED      13985 unix  3      [ ]         DGRAM      CONNECTED
 13185 unix  2      [ ]         STREAM     CONNECTED      13884 unix  2
 [ ]         DGRAM      CONNECTED      14528 unix  2      [ ]         DGRAM
     CONNECTED      13785 unix  3      [ ]         STREAM     CONNECTED
 14034 *

Attaching xen log files of /var/log/xen.
I didn't get the role of QEMU here because as mentioned earlier, I am
porting in raspberrypi 4B.

Regards,
Vipul Kumar

On Wed, Oct 19, 2022 at 12:43 AM Stefano Stabellini <sstabellini@kernel.org>
wrote:

> It usually works the way it is described in the guide:
>
>
> https://www.virtuatopia.com/index.php?title=Configuring_a_VNC_based_Graphical_Console_for_a_Xen_Paravirtualized_domainU_Guest
>
> You don't need to install any VNC-related server software because it is
> already provided by Xen (to be precise it is provided by QEMU working
> together with Xen.)
>
> You only need the vnc client in dom0 so that you can connect, but you
> could also run the vnc client outside from another host. So basically
> the following should work when executed in Dom0 after creating DomU:
>
>   vncviewer localhost:0
>
> Can you attach the Xen and QEMU logs (/var/log/xen/*)? And also use
> netstat -taunp to check if there is anything running at port 5900 or
> 5901?
>
> Cheers,
>
> Stefano
>
>
> On Tue, 18 Oct 2022, Vipul Suneja wrote:
> > Hi Stefano,
> >
> > Thanks for the response!
> >
> > I could install tigerVNC, x11vnc & libvncserver in Dom0
> xen-image-minimal but only manage to install libvncserver(couldn't install
> tigervnc
> > & x11vnc because of x11
> > support missing, it's wayland) in DOMU custom graphical image. I tried
> running vncviewer with IP address & port in dom0 to access the domu
> > graphical image display as per below commands.
> >
> >  vncviewer 192.168.1.42:5901
> >
> >  But it showing can't open display, below are the logs:
> >
> > root@raspberrypi4-64:~/guest1# vncviewer 192.168.1.42:5901
> >
> > TigerVNC Viewer 64-bit v1.11.0
> > Built on: 2020-09-08 12:16
> > Copyright (C) 1999-2020 TigerVNC Team and many others (see README.rst)
> > See https://www.tigervnc.org for information on TigerVNC.
> > Can't open display:
> > root@raspberrypi4-64:~/guest1#
> >
> > I am not exactly sure what the issue is but I thought only libvncserver
> in DOMU could work to get access but it did not work.
> > If TigerVNC is the issue here then is there any other VNC source which
> could be installed for both x11 & wayland supported images?
> >
> > Regards,
> > Vipul Kumar
> >
> > On Tue, Oct 18, 2022 at 2:40 AM Stefano Stabellini <
> sstabellini@kernel.org> wrote:
> >       VNC is typically easier to setup, because SDL needs extra
> libraries at
> >       build time and runtime. If QEMU is built without SDL support it
> won't
> >       start when you ask for SDL.
> >
> >       VNC should work with both x11 and wayland in your domU. It doesn't
> work
> >       at the x11 level, it exposes a special fbdev device in your domU
> that
> >       should work with:
> >       - a graphical console in Linux domU
> >       - x11
> >       - wayland (but I haven't tested this so I am not 100% sure about
> it)
> >
> >       When you say "it doesn't work", what do you mean? Do you get a
> black
> >       window?
> >
> >       You need CONFIG_XEN_FBDEV_FRONTEND in Linux domU
> >       (drivers/video/fbdev/xen-fbfront.c). I would try to get a
> graphical text
> >       console up and running in your domU before attempting x11/wayland.
> >
> >       Cheers,
> >
> >       Stefano
> >
> >       On Mon, 17 Oct 2022, Vipul Suneja wrote:
> >       > Hi,
> >       > Thanks!
> >       >
> >       > I have ported xen minimal image as DOM0 & custom wayland GUI
> based image as DOMU in raspberry pi4B. I am trying to make GUI
> >       display up
> >       > for guest machine. I tried using sdl, included below line in
> guest.conf file
> >       > vfb= [ 'sdl=1' ]
> >       >
> >       > But it is throwing below error:
> >       >
> >       > root@raspberrypi4-64:~/guest1# xl create -c guest1.cfg
> >       > Parsing config from guest1.cfg
> >       > libxl: error: libxl_qmp.c:1400:qmp_ev_fd_callback: Domain
> 3:error on QMP socket: Connection reset by peer
> >       > libxl: error: libxl_qmp.c:1439:qmp_ev_fd_callback: Domain
> 3:Error happened with the QMP connection to QEMU
> >       > libxl: error: libxl_dm.c:3351:device_model_postconfig_done:
> Domain 3:Post DM startup configs failed, rc=-26
> >       > libxl: error: libxl_create.c:1867:domcreate_devmodel_started:
> Domain 3:device model did not start: -26
> >       > libxl: error: libxl_aoutils.c:646:libxl__kill_xs_path: Device
> Model already exited
> >       > libxl: error: libxl_domain.c:1183:libxl__destroy_domid: Domain
> 3:Non-existant domain
> >       > libxl: error: libxl_domain.c:1137:domain_destroy_callback:
> Domain 3:Unable to destroy guest
> >       > libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain
> 3:Destruction of domain failed
> >       >
> >       > Another way is VNC, i could install tigervnc in DOM0 but same i
> couldn't in guest machine because it doesn't support
> >       x11(supports wayland
> >       > only). I am completely blocked here, Need your support to enable
> the display up.
> >       > Any alternative of VNC which could work in both x11 & wayland
> supported images?
> >       >
> >       > Any input on VNC, SDL or any other way to proceed on this?
> Looking forward to hearing from you.
> >       >
> >       > Regards,
> >       > Vipul Kumar
> >
> >
> >

--000000000000942cc405eb666b2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Stefano,<br><br>Thanks for the response!<br><br>I am fo=
llowing the same link you shared from the beginning. Tried the command &quo=
t;vncviewer localhost:0&quot; in DOM0 but same issue &quot;Can&#39;t open d=
isplay&quot;, below are the logs:<br><br><b>root@raspberrypi4-64:~# vncview=
er localhost:0<br><br>TigerVNC Viewer 64-bit v1.11.0<br>Built on: 2020-09-0=
8 12:16<br>Copyright (C) 1999-2020 TigerVNC Team and many others (see READM=
E.rst)<br>See <a href=3D"https://www.tigervnc.org">https://www.tigervnc.org=
</a> for information on TigerVNC.<br>Can&#39;t open display:</b><br><br>Bel=
ow are the netstat logs, i couldn&#39;t see anything running at port 5900 o=
r 5901:<br><br><b>root@raspberrypi4-64:~# netstat -tuwx <br>Active Internet=
 connections (w/o servers)<br>Proto Recv-Q Send-Q Local Address =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 Foreign Address =C2=A0 =C2=A0 =C2=A0 =C2=A0 State =
=C2=A0 =C2=A0 =C2=A0 <br>tcp =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0164 =
192.168.1.39:ssh =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://192.168.1.38:=
37472">192.168.1.38:37472</a> =C2=A0 =C2=A0 =C2=A0ESTABLISHED <br>Active UN=
IX domain sockets (w/o servers)<br>Proto RefCnt Flags =C2=A0 =C2=A0 =C2=A0 =
Type =C2=A0 =C2=A0 =C2=A0 State =C2=A0 =C2=A0 =C2=A0 =C2=A0 I-Node Path<br>=
unix =C2=A08 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 DGRAM =C2=
=A0 =C2=A0 =C2=A0CONNECTED =C2=A0 =C2=A0 =C2=A010565 /dev/log<br>unix =C2=
=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=
=A0 CONNECTED =C2=A0 =C2=A0 =C2=A010891 /var/run/xenstored/socket<br>unix =
=C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =
=C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A013791 <br>unix =C2=A03 =C2=A0 =C2=A0 =
=C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0=
 =C2=A0 =C2=A010843 /var/run/xenstored/socket<br>unix =C2=A03 =C2=A0 =C2=A0=
 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=
=A0 =C2=A0 =C2=A010573 /var/run/xenstored/socket<br>unix =C2=A02 =C2=A0 =C2=
=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 DGRAM =C2=A0 =C2=A0 =C2=A0CONNECT=
ED =C2=A0 =C2=A0 =C2=A014510 <br>unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=
=A013249 <br>unix =C2=A02 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 DGRAM =C2=A0 =C2=A0 =C2=A0CONNECTED =C2=A0 =C2=A0 =C2=A013887 <br>unix =
=C2=A02 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 DGRAM =C2=A0 =
=C2=A0 =C2=A0CONNECTED =C2=A0 =C2=A0 =C2=A010599 <br>unix =C2=A03 =C2=A0 =
=C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED=
 =C2=A0 =C2=A0 =C2=A014005 <br>unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A0132=
58 <br>unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STR=
EAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A013248 <br>unix =C2=A03 =C2=
=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNE=
CTED =C2=A0 =C2=A0 =C2=A014003 <br>unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=
=A010572 /var/run/xenstored/socket<br>unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =
=C2=A010786 /var/run/xenstored/socket<br>unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[=
 ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 DGRAM =C2=A0 =C2=A0 =C2=A0CONNECTED =C2=A0 =
=C2=A0 =C2=A013186 <br>unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A010864 /var=
/run/xenstored/socket<br>unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A010812 /va=
r/run/xenstored/socket<br>unix =C2=A02 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 DGRAM =C2=A0 =C2=A0 =C2=A0CONNECTED =C2=A0 =C2=A0 =C2=A01=
4083 <br>unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 S=
TREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A010813 /var/run/xenstored/=
socket</b><br><b>unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A014068 <br>unix =
=C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =
=C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A013256 <br>unix =C2=A03 =C2=A0 =C2=A0 =
=C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0=
 =C2=A0 =C2=A010571 /var/run/xenstored/socket<br>unix =C2=A03 =C2=A0 =C2=A0=
 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=
=A0 =C2=A0 =C2=A010842 <br>unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A013985 =
<br>unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 DGRAM =
=C2=A0 =C2=A0 =C2=A0CONNECTED =C2=A0 =C2=A0 =C2=A013185 <br>unix =C2=A02 =
=C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CO=
NNECTED =C2=A0 =C2=A0 =C2=A013884 <br>unix =C2=A02 =C2=A0 =C2=A0 =C2=A0[ ] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DGRAM =C2=A0 =C2=A0 =C2=A0CONNECTED =C2=A0 =C2=
=A0 =C2=A014528 <br>unix =C2=A02 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 DGRAM =C2=A0 =C2=A0 =C2=A0CONNECTED =C2=A0 =C2=A0 =C2=A013785 <b=
r>unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =
=C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A014034 </b><br><br>Attaching xen=
 log files of /var/log/xen.<br>I didn&#39;t get the role of QEMU here becau=
se as mentioned earlier, I am porting in raspberrypi 4B.<br><div><br></div>=
<div>Regards,</div><div>Vipul Kumar</div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 19, 2022 at 12:43 AM S=
tefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabellini=
@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">It usually works the way it is described in the guide:<br>
<br>
<a href=3D"https://www.virtuatopia.com/index.php?title=3DConfiguring_a_VNC_=
based_Graphical_Console_for_a_Xen_Paravirtualized_domainU_Guest" rel=3D"nor=
eferrer" target=3D"_blank">https://www.virtuatopia.com/index.php?title=3DCo=
nfiguring_a_VNC_based_Graphical_Console_for_a_Xen_Paravirtualized_domainU_G=
uest</a><br>
<br>
You don&#39;t need to install any VNC-related server software because it is=
<br>
already provided by Xen (to be precise it is provided by QEMU working<br>
together with Xen.)<br>
<br>
You only need the vnc client in dom0 so that you can connect, but you<br>
could also run the vnc client outside from another host. So basically<br>
the following should work when executed in Dom0 after creating DomU:<br>
<br>
=C2=A0 vncviewer localhost:0<br>
<br>
Can you attach the Xen and QEMU logs (/var/log/xen/*)? And also use<br>
netstat -taunp to check if there is anything running at port 5900 or<br>
5901?<br>
<br>
Cheers,<br>
<br>
Stefano<br>
<br>
<br>
On Tue, 18 Oct 2022, Vipul Suneja wrote:<br>
&gt; Hi Stefano,<br>
&gt; <br>
&gt; Thanks for the response!<br>
&gt; <br>
&gt; I could install tigerVNC, x11vnc &amp; libvncserver in Dom0 xen-image-=
minimal but only manage to install libvncserver(couldn&#39;t install tigerv=
nc<br>
&gt; &amp; x11vnc because of x11<br>
&gt; support missing, it&#39;s wayland) in DOMU custom graphical image. I t=
ried running vncviewer with IP address &amp; port in dom0 to access the dom=
u<br>
&gt; graphical image display as per below commands.<br>
&gt; =C2=A0<br>
&gt; =C2=A0vncviewer <a href=3D"http://192.168.1.42:5901" rel=3D"noreferrer=
" target=3D"_blank">192.168.1.42:5901</a><br>
&gt; =C2=A0<br>
&gt; =C2=A0But it showing can&#39;t open display, below are the logs:<br>
&gt; =C2=A0<br>
&gt; root@raspberrypi4-64:~/guest1# vncviewer <a href=3D"http://192.168.1.4=
2:5901" rel=3D"noreferrer" target=3D"_blank">192.168.1.42:5901</a><br>
&gt; <br>
&gt; TigerVNC Viewer 64-bit v1.11.0<br>
&gt; Built on: 2020-09-08 12:16<br>
&gt; Copyright (C) 1999-2020 TigerVNC Team and many others (see README.rst)=
<br>
&gt; See <a href=3D"https://www.tigervnc.org" rel=3D"noreferrer" target=3D"=
_blank">https://www.tigervnc.org</a> for information on TigerVNC.<br>
&gt; Can&#39;t open display:<br>
&gt; root@raspberrypi4-64:~/guest1#<br>
&gt; <br>
&gt; I am not exactly=C2=A0sure what the issue is but I thought only libvnc=
server in DOMU could work to get access but it did not work.=C2=A0<br>
&gt; If TigerVNC is the issue here then is there any other VNC source which=
 could be installed for both x11 &amp; wayland supported images?<br>
&gt; <br>
&gt; Regards,<br>
&gt; Vipul Kumar<br>
&gt; <br>
&gt; On Tue, Oct 18, 2022 at 2:40 AM Stefano Stabellini &lt;<a href=3D"mail=
to:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;=
 wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VNC is typically easier to setup, because SD=
L needs extra libraries at<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0build time and runtime. If QEMU is built wit=
hout SDL support it won&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0start when you ask for SDL.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VNC should work with both x11 and wayland in=
 your domU. It doesn&#39;t work<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0at the x11 level, it exposes a special fbdev=
 device in your domU that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0should work with:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- a graphical console in Linux domU<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- x11<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- wayland (but I haven&#39;t tested this so =
I am not 100% sure about it)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0When you say &quot;it doesn&#39;t work&quot;=
, what do you mean? Do you get a black<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0window?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0You need CONFIG_XEN_FBDEV_FRONTEND in Linux =
domU<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(drivers/video/fbdev/xen-fbfront.c). I would=
 try to get a graphical text<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0console up and running in your domU before a=
ttempting x11/wayland.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Cheers,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Stefano<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On Mon, 17 Oct 2022, Vipul Suneja wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hi,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Thanks!<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I have ported xen minimal image as DOM0=
 &amp; custom wayland GUI based image as DOMU in raspberry pi4B. I am tryin=
g to make GUI<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0display up<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; for=C2=A0guest machine. I tried using=
=C2=A0sdl, included below line in guest.conf file<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; vfb=3D [ &#39;sdl=3D1&#39; ]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; But it is throwing below error:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; root@raspberrypi4-64:~/guest1# xl creat=
e -c guest1.cfg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Parsing config from guest1.cfg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; libxl: error: libxl_qmp.c:1400:qmp_ev_f=
d_callback: Domain 3:error on QMP socket: Connection reset by peer<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; libxl: error: libxl_qmp.c:1439:qmp_ev_f=
d_callback: Domain 3:Error happened with the QMP connection to QEMU<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; libxl: error: libxl_dm.c:3351:device_mo=
del_postconfig_done: Domain 3:Post DM startup configs failed, rc=3D-26<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; libxl: error: libxl_create.c:1867:domcr=
eate_devmodel_started: Domain 3:device model did not start: -26<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; libxl: error: libxl_aoutils.c:646:libxl=
__kill_xs_path: Device Model already exited<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; libxl: error: libxl_domain.c:1183:libxl=
__destroy_domid: Domain 3:Non-existant domain<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; libxl: error: libxl_domain.c:1137:domai=
n_destroy_callback: Domain 3:Unable to destroy guest<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; libxl: error: libxl_domain.c:1064:domai=
n_destroy_cb: Domain 3:Destruction of domain failed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Another way is VNC, i could install tig=
ervnc in DOM0 but same i couldn&#39;t in guest machine because it doesn&#39=
;t support<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0x11(supports wayland<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; only). I am completely blocked here, Ne=
ed your support to enable the display up.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Any alternative of VNC which could work=
 in both x11 &amp; wayland supported images?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Any input on VNC, SDL or any other way =
to proceed on this? Looking forward to hearing from you.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Vipul Kumar<br>
&gt; <br>
&gt; <br>
&gt; </blockquote></div>

--000000000000942cc405eb666b2e--
--000000000000942cc805eb666b30
Content-Type: application/octet-stream; name="qemu-dm-guest1.log"
Content-Disposition: attachment; filename="qemu-dm-guest1.log"
Content-Transfer-Encoding: base64
Content-ID: <f_l9fvyqy40>
X-Attachment-Id: f_l9fvyqy40

Vk5DIHNlcnZlciBydW5uaW5nIG9uIDEyNy4wLjAuMTo1OTAwCnFlbXUtc3lzdGVtLWkzODY6IHRl
cm1pbmF0aW5nIG9uIHNpZ25hbCAxIGZyb20gcGlkIDY5OCAoeGwpCg==
--000000000000942cc805eb666b30
Content-Type: application/octet-stream; name="xl-guest1.log"
Content-Disposition: attachment; filename="xl-guest1.log"
Content-Transfer-Encoding: base64
Content-ID: <f_l9fvyqyk1>
X-Attachment-Id: f_l9fvyqyk1

V2FpdGluZyBmb3IgZG9tYWluIGd1ZXN0MSAoZG9taWQgMSkgdG8gZGllIFtwaWQgNjY1XQpEb21h
aW4gMSBoYXMgYmVlbiBkZXN0cm95ZWQuCg==
--000000000000942cc805eb666b30--

