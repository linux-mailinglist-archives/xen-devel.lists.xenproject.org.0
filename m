Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5009560C5D6
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 09:50:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429615.680698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onEhk-0006Ro-U4; Tue, 25 Oct 2022 07:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429615.680698; Tue, 25 Oct 2022 07:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onEhk-0006Ot-QW; Tue, 25 Oct 2022 07:50:32 +0000
Received: by outflank-mailman (input) for mailman id 429615;
 Tue, 25 Oct 2022 07:50:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qdjd=22=gmail.com=vsuneja63@srs-se1.protection.inumbo.net>)
 id 1onEhj-0006On-3Y
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 07:50:31 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1f95e30-5439-11ed-91b5-6bf2151ebd3b;
 Tue, 25 Oct 2022 09:50:29 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id b2so10417991eja.6
 for <xen-devel@lists.xenproject.org>; Tue, 25 Oct 2022 00:50:29 -0700 (PDT)
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
X-Inumbo-ID: b1f95e30-5439-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSdKgLbT+qddTsa8l5SAlwxgpn6twTeI8D1SKYVHR/c=;
        b=jZTWY/OJC7nfJlRYUz0fZT0IBXvhBGsXdjrtRbny/KkfBqd16v3r3YGEJWUfu7i/L4
         IhXED9e3fHUSHP6dtwi6R9ZWbJR9z5QTWIqEqPSiEEnRFbq4Nq7CMXlU8P2w1YsfauIf
         i4/ZVegdxOtCLZny/KjYhP2A+GbgSn1u66AsDJZvSn17wX+lxeSCdmJPjaLFyAcLrDRz
         aTH3BAC6J/lm55LwrpEnxCpvisDbIxvCI2daJvMIyo925Y3+uactbc4Z+44GDtNe+sZp
         xcTpRNrE4kTLdhzI67AL0pcfYgSIrK8pFTnefaS39EGLgOOlLJUlEqBQkO1IEpEGBwsK
         Lj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZSdKgLbT+qddTsa8l5SAlwxgpn6twTeI8D1SKYVHR/c=;
        b=FwIM/fig334v5/TELTgC+8mG5A6qTRXAxw8zPZca0wEPP2dKBTPIMWLVKE3XvDTd92
         uwZkEloGKelHOA0NSY+lD1sDGX1CKPOslyS2vxpdoDlOVQknfLedqDCVxJr0tJtcE0L6
         2POPKioQrZPYdfC47OF52TA3wTPIqVCK6WN8GviVhKTtlhHCRgiOI+voS83VLBrG8tQL
         x4zi5TSBNJaMce2Svw6fC+VUKXmg5KyIuOn0RI6xCOdWg9iJmnXuy3HTyKKqQ4qHIP27
         T2wyBoXrF1eOqlmto2ajHvof266dUoI931s4CtaG88wsK+CjHc+A/p1euUs2AUhPN5sz
         6WIg==
X-Gm-Message-State: ACrzQf1MHLjVMqYtYfWRrgfRkaiymRVu7F/0kuF/gQJPfNQnW5T2aOIN
	3dYMl0NJh3yUtL5rjjdGxvPgYWgVvyu2lujJ4Og=
X-Google-Smtp-Source: AMsMyM5zyEBIsw7zMR4fIR0uBXbvENNyG3ihO+5VWWEh9kStr/ldUM6Xbz5GNcWMqETP9YpDV9ZZiMG8kCvui/nd4tk=
X-Received: by 2002:a17:906:5a4b:b0:78d:8790:d4a1 with SMTP id
 my11-20020a1709065a4b00b0078d8790d4a1mr31264783ejc.329.1666684228901; Tue, 25
 Oct 2022 00:50:28 -0700 (PDT)
MIME-Version: 1.0
References: <CALAP8f--jyG=ufJ9WGtL6qoeGdsykjNK85G3q50SzJm5+wOzhQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2210171400570.2351079@ubuntu-linux-20-04-desktop>
 <CALAP8f81ojfVD9n5EMtD7DxY-8uomgENVEQH9Afz7Hk9rfaAsw@mail.gmail.com>
 <alpine.DEB.2.22.394.2210181213370.4587@ubuntu-linux-20-04-desktop> <CALAP8f9Zgue6WfAk2uRGkg=1Up2Z+eQWqvQ1_Z2=r66Z5fvKoA@mail.gmail.com>
In-Reply-To: <CALAP8f9Zgue6WfAk2uRGkg=1Up2Z+eQWqvQ1_Z2=r66Z5fvKoA@mail.gmail.com>
From: Vipul Suneja <vsuneja63@gmail.com>
Date: Tue, 25 Oct 2022 13:20:16 +0530
Message-ID: <CALAP8f-qr5523h7tmz+URaXiEYPuMEQggvqXSm+B6f_Zo9B7aA@mail.gmail.com>
Subject: Re: Porting Xen in raspberry pi4B
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, oleksandr_andrushchenko@epam.com, 
	oleksandr_tyshchenko@epam.com, jgross@suse.com, boris.ostrovsky@oracle.com, 
	Bertrand.Marquis@arm.com
Content-Type: multipart/alternative; boundary="0000000000006aa06005ebd729fb"

--0000000000006aa06005ebd729fb
Content-Type: text/plain; charset="UTF-8"

Hi Stefano,

Thanks!

Any input further as per the logs attached?

Regards,
Vipul Kumar

On Wed, Oct 19, 2022 at 10:49 PM Vipul Suneja <vsuneja63@gmail.com> wrote:

> Hi Stefano,
>
> Thanks for the response!
>
> I am following the same link you shared from the beginning. Tried the
> command "vncviewer localhost:0" in DOM0 but same issue "Can't open
> display", below are the logs:
>
>
>
>
>
>
>
> *root@raspberrypi4-64:~# vncviewer localhost:0TigerVNC Viewer 64-bit
> v1.11.0Built on: 2020-09-08 12:16Copyright (C) 1999-2020 TigerVNC Team and
> many others (see README.rst)See https://www.tigervnc.org
> <https://www.tigervnc.org> for information on TigerVNC.Can't open display:*
>
> Below are the netstat logs, i couldn't see anything running at port 5900
> or 5901:
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
> *root@raspberrypi4-64:~# netstat -tuwx Active Internet connections (w/o
> servers)Proto Recv-Q Send-Q Local Address           Foreign Address
> State       tcp        0    164 192.168.1.39:ssh        192.168.1.38:37472
> <http://192.168.1.38:37472>      ESTABLISHED Active UNIX domain sockets
> (w/o servers)Proto RefCnt Flags       Type       State         I-Node
> Pathunix  8      [ ]         DGRAM      CONNECTED      10565 /dev/logunix
>  3      [ ]         STREAM     CONNECTED      10891
> /var/run/xenstored/socketunix  3      [ ]         STREAM     CONNECTED
>  13791 unix  3      [ ]         STREAM     CONNECTED      10843
> /var/run/xenstored/socketunix  3      [ ]         STREAM     CONNECTED
>  10573 /var/run/xenstored/socketunix  2      [ ]         DGRAM
>  CONNECTED      14510 unix  3      [ ]         STREAM     CONNECTED
>  13249 unix  2      [ ]         DGRAM      CONNECTED      13887 unix  2
>  [ ]         DGRAM      CONNECTED      10599 unix  3      [ ]
> STREAM     CONNECTED      14005 unix  3      [ ]         STREAM
> CONNECTED      13258 unix  3      [ ]         STREAM     CONNECTED
>  13248 unix  3      [ ]         STREAM     CONNECTED      14003 unix  3
>  [ ]         STREAM     CONNECTED      10572 /var/run/xenstored/socketunix
>  3      [ ]         STREAM     CONNECTED      10786
> /var/run/xenstored/socketunix  3      [ ]         DGRAM      CONNECTED
>  13186 unix  3      [ ]         STREAM     CONNECTED      10864
> /var/run/xenstored/socketunix  3      [ ]         STREAM     CONNECTED
>  10812 /var/run/xenstored/socketunix  2      [ ]         DGRAM
>  CONNECTED      14083 unix  3      [ ]         STREAM     CONNECTED
>  10813 /var/run/xenstored/socket*
>
>
>
>
>
>
>
>
>
> *unix  3      [ ]         STREAM     CONNECTED      14068 unix  3      [ ]
>         STREAM     CONNECTED      13256 unix  3      [ ]         STREAM
> CONNECTED      10571 /var/run/xenstored/socketunix  3      [ ]
> STREAM     CONNECTED      10842 unix  3      [ ]         STREAM
> CONNECTED      13985 unix  3      [ ]         DGRAM      CONNECTED
>  13185 unix  2      [ ]         STREAM     CONNECTED      13884 unix  2
>  [ ]         DGRAM      CONNECTED      14528 unix  2      [ ]         DGRAM
>      CONNECTED      13785 unix  3      [ ]         STREAM     CONNECTED
>  14034 *
>
> Attaching xen log files of /var/log/xen.
> I didn't get the role of QEMU here because as mentioned earlier, I am
> porting in raspberrypi 4B.
>
> Regards,
> Vipul Kumar
>
> On Wed, Oct 19, 2022 at 12:43 AM Stefano Stabellini <
> sstabellini@kernel.org> wrote:
>
>> It usually works the way it is described in the guide:
>>
>>
>> https://www.virtuatopia.com/index.php?title=Configuring_a_VNC_based_Graphical_Console_for_a_Xen_Paravirtualized_domainU_Guest
>>
>> You don't need to install any VNC-related server software because it is
>> already provided by Xen (to be precise it is provided by QEMU working
>> together with Xen.)
>>
>> You only need the vnc client in dom0 so that you can connect, but you
>> could also run the vnc client outside from another host. So basically
>> the following should work when executed in Dom0 after creating DomU:
>>
>>   vncviewer localhost:0
>>
>> Can you attach the Xen and QEMU logs (/var/log/xen/*)? And also use
>> netstat -taunp to check if there is anything running at port 5900 or
>> 5901?
>>
>> Cheers,
>>
>> Stefano
>>
>>
>> On Tue, 18 Oct 2022, Vipul Suneja wrote:
>> > Hi Stefano,
>> >
>> > Thanks for the response!
>> >
>> > I could install tigerVNC, x11vnc & libvncserver in Dom0
>> xen-image-minimal but only manage to install libvncserver(couldn't install
>> tigervnc
>> > & x11vnc because of x11
>> > support missing, it's wayland) in DOMU custom graphical image. I tried
>> running vncviewer with IP address & port in dom0 to access the domu
>> > graphical image display as per below commands.
>> >
>> >  vncviewer 192.168.1.42:5901
>> >
>> >  But it showing can't open display, below are the logs:
>> >
>> > root@raspberrypi4-64:~/guest1# vncviewer 192.168.1.42:5901
>> >
>> > TigerVNC Viewer 64-bit v1.11.0
>> > Built on: 2020-09-08 12:16
>> > Copyright (C) 1999-2020 TigerVNC Team and many others (see README.rst)
>> > See https://www.tigervnc.org for information on TigerVNC.
>> > Can't open display:
>> > root@raspberrypi4-64:~/guest1#
>> >
>> > I am not exactly sure what the issue is but I thought only libvncserver
>> in DOMU could work to get access but it did not work.
>> > If TigerVNC is the issue here then is there any other VNC source which
>> could be installed for both x11 & wayland supported images?
>> >
>> > Regards,
>> > Vipul Kumar
>> >
>> > On Tue, Oct 18, 2022 at 2:40 AM Stefano Stabellini <
>> sstabellini@kernel.org> wrote:
>> >       VNC is typically easier to setup, because SDL needs extra
>> libraries at
>> >       build time and runtime. If QEMU is built without SDL support it
>> won't
>> >       start when you ask for SDL.
>> >
>> >       VNC should work with both x11 and wayland in your domU. It
>> doesn't work
>> >       at the x11 level, it exposes a special fbdev device in your domU
>> that
>> >       should work with:
>> >       - a graphical console in Linux domU
>> >       - x11
>> >       - wayland (but I haven't tested this so I am not 100% sure about
>> it)
>> >
>> >       When you say "it doesn't work", what do you mean? Do you get a
>> black
>> >       window?
>> >
>> >       You need CONFIG_XEN_FBDEV_FRONTEND in Linux domU
>> >       (drivers/video/fbdev/xen-fbfront.c). I would try to get a
>> graphical text
>> >       console up and running in your domU before attempting x11/wayland.
>> >
>> >       Cheers,
>> >
>> >       Stefano
>> >
>> >       On Mon, 17 Oct 2022, Vipul Suneja wrote:
>> >       > Hi,
>> >       > Thanks!
>> >       >
>> >       > I have ported xen minimal image as DOM0 & custom wayland GUI
>> based image as DOMU in raspberry pi4B. I am trying to make GUI
>> >       display up
>> >       > for guest machine. I tried using sdl, included below line in
>> guest.conf file
>> >       > vfb= [ 'sdl=1' ]
>> >       >
>> >       > But it is throwing below error:
>> >       >
>> >       > root@raspberrypi4-64:~/guest1# xl create -c guest1.cfg
>> >       > Parsing config from guest1.cfg
>> >       > libxl: error: libxl_qmp.c:1400:qmp_ev_fd_callback: Domain
>> 3:error on QMP socket: Connection reset by peer
>> >       > libxl: error: libxl_qmp.c:1439:qmp_ev_fd_callback: Domain
>> 3:Error happened with the QMP connection to QEMU
>> >       > libxl: error: libxl_dm.c:3351:device_model_postconfig_done:
>> Domain 3:Post DM startup configs failed, rc=-26
>> >       > libxl: error: libxl_create.c:1867:domcreate_devmodel_started:
>> Domain 3:device model did not start: -26
>> >       > libxl: error: libxl_aoutils.c:646:libxl__kill_xs_path: Device
>> Model already exited
>> >       > libxl: error: libxl_domain.c:1183:libxl__destroy_domid: Domain
>> 3:Non-existant domain
>> >       > libxl: error: libxl_domain.c:1137:domain_destroy_callback:
>> Domain 3:Unable to destroy guest
>> >       > libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain
>> 3:Destruction of domain failed
>> >       >
>> >       > Another way is VNC, i could install tigervnc in DOM0 but same i
>> couldn't in guest machine because it doesn't support
>> >       x11(supports wayland
>> >       > only). I am completely blocked here, Need your support to
>> enable the display up.
>> >       > Any alternative of VNC which could work in both x11 & wayland
>> supported images?
>> >       >
>> >       > Any input on VNC, SDL or any other way to proceed on this?
>> Looking forward to hearing from you.
>> >       >
>> >       > Regards,
>> >       > Vipul Kumar
>> >
>> >
>> >
>
>

--0000000000006aa06005ebd729fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Stefano,<div><br></div><div>Thanks!</div><div><br></div=
><div>Any input further as per the logs attached?</div><div><br></div><div>=
Regards,</div><div>Vipul Kumar</div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 19, 2022 at 10:49 PM Vipul =
Suneja &lt;<a href=3D"mailto:vsuneja63@gmail.com">vsuneja63@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr">Hi Stefano,<br><br>Thanks for the response!<br><br>I am followin=
g the same link you shared from the beginning. Tried the command &quot;vncv=
iewer localhost:0&quot; in DOM0 but same issue &quot;Can&#39;t open display=
&quot;, below are the logs:<br><br><b>root@raspberrypi4-64:~# vncviewer loc=
alhost:0<br><br>TigerVNC Viewer 64-bit v1.11.0<br>Built on: 2020-09-08 12:1=
6<br>Copyright (C) 1999-2020 TigerVNC Team and many others (see README.rst)=
<br>See <a href=3D"https://www.tigervnc.org" target=3D"_blank">https://www.=
tigervnc.org</a> for information on TigerVNC.<br>Can&#39;t open display:</b=
><br><br>Below are the netstat logs, i couldn&#39;t see anything running at=
 port 5900 or 5901:<br><br><b>root@raspberrypi4-64:~# netstat -tuwx <br>Act=
ive Internet connections (w/o servers)<br>Proto Recv-Q Send-Q Local Address=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Foreign Address =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 State =C2=A0 =C2=A0 =C2=A0 <br>tcp =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=
=A0 =C2=A0164 192.168.1.39:ssh =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http:/=
/192.168.1.38:37472" target=3D"_blank">192.168.1.38:37472</a> =C2=A0 =C2=A0=
 =C2=A0ESTABLISHED <br>Active UNIX domain sockets (w/o servers)<br>Proto Re=
fCnt Flags =C2=A0 =C2=A0 =C2=A0 Type =C2=A0 =C2=A0 =C2=A0 State =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 I-Node Path<br>unix =C2=A08 =C2=A0 =C2=A0 =C2=A0[ ] =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 DGRAM =C2=A0 =C2=A0 =C2=A0CONNECTED =C2=A0 =C2=A0 =
=C2=A010565 /dev/log<br>unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A010891 /var=
/run/xenstored/socket<br>unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A013791 <br=
>unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =
=C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A010843 /var/run/xenstored/socket=
<br>unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM=
 =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A010573 /var/run/xenstored/socke=
t<br>unix =C2=A02 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 DGRAM=
 =C2=A0 =C2=A0 =C2=A0CONNECTED =C2=A0 =C2=A0 =C2=A014510 <br>unix =C2=A03 =
=C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CO=
NNECTED =C2=A0 =C2=A0 =C2=A013249 <br>unix =C2=A02 =C2=A0 =C2=A0 =C2=A0[ ] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DGRAM =C2=A0 =C2=A0 =C2=A0CONNECTED =C2=A0 =C2=
=A0 =C2=A013887 <br>unix =C2=A02 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 DGRAM =C2=A0 =C2=A0 =C2=A0CONNECTED =C2=A0 =C2=A0 =C2=A010599 <b=
r>unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =
=C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A014005 <br>unix =C2=A03 =C2=A0 =
=C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED=
 =C2=A0 =C2=A0 =C2=A013258 <br>unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A0132=
48 <br>unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STR=
EAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A014003 <br>unix =C2=A03 =C2=
=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNE=
CTED =C2=A0 =C2=A0 =C2=A010572 /var/run/xenstored/socket<br>unix =C2=A03 =
=C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CO=
NNECTED =C2=A0 =C2=A0 =C2=A010786 /var/run/xenstored/socket<br>unix =C2=A03=
 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 DGRAM =C2=A0 =C2=A0 =
=C2=A0CONNECTED =C2=A0 =C2=A0 =C2=A013186 <br>unix =C2=A03 =C2=A0 =C2=A0 =
=C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0=
 =C2=A0 =C2=A010864 /var/run/xenstored/socket<br>unix =C2=A03 =C2=A0 =C2=A0=
 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=
=A0 =C2=A0 =C2=A010812 /var/run/xenstored/socket<br>unix =C2=A02 =C2=A0 =C2=
=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 DGRAM =C2=A0 =C2=A0 =C2=A0CONNECT=
ED =C2=A0 =C2=A0 =C2=A014083 <br>unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=
=A010813 /var/run/xenstored/socket</b><br><b>unix =C2=A03 =C2=A0 =C2=A0 =C2=
=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =
=C2=A0 =C2=A014068 <br>unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A013256 <br>=
unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=
=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A010571 /var/run/xenstored/socket<br=
>unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =
=C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A010842 <br>unix =C2=A03 =C2=A0 =
=C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED=
 =C2=A0 =C2=A0 =C2=A013985 <br>unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 DGRAM =C2=A0 =C2=A0 =C2=A0CONNECTED =C2=A0 =C2=A0 =C2=
=A013185 <br>unix =C2=A02 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A013884 <br>unix =C2=
=A02 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 DGRAM =C2=A0 =C2=
=A0 =C2=A0CONNECTED =C2=A0 =C2=A0 =C2=A014528 <br>unix =C2=A02 =C2=A0 =C2=
=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 DGRAM =C2=A0 =C2=A0 =C2=A0CONNECT=
ED =C2=A0 =C2=A0 =C2=A013785 <br>unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=
=A014034 </b><br><br>Attaching xen log files of /var/log/xen.<br>I didn&#39=
;t get the role of QEMU here because as mentioned earlier, I am porting in =
raspberrypi 4B.<br><div><br></div><div>Regards,</div><div>Vipul Kumar</div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Wed, Oct 19, 2022 at 12:43 AM Stefano Stabellini &lt;<a href=3D"mailto:s=
stabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">It usually w=
orks the way it is described in the guide:<br>
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
</blockquote></div>

--0000000000006aa06005ebd729fb--

