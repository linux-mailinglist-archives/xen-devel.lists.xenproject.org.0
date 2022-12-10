Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAF2649007
	for <lists+xen-devel@lfdr.de>; Sat, 10 Dec 2022 18:39:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458579.716396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p43nh-00084G-Mo; Sat, 10 Dec 2022 17:38:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458579.716396; Sat, 10 Dec 2022 17:38:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p43nh-00080v-J6; Sat, 10 Dec 2022 17:38:13 +0000
Received: by outflank-mailman (input) for mailman id 458579;
 Sat, 10 Dec 2022 17:38:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6AtV=4I=gmail.com=vsuneja63@srs-se1.protection.inumbo.net>)
 id 1p43nf-00080n-TX
 for xen-devel@lists.xenproject.org; Sat, 10 Dec 2022 17:38:12 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67cb66d0-78b1-11ed-8fd2-01056ac49cbb;
 Sat, 10 Dec 2022 18:38:06 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id m18so18512122eji.5
 for <xen-devel@lists.xenproject.org>; Sat, 10 Dec 2022 09:38:06 -0800 (PST)
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
X-Inumbo-ID: 67cb66d0-78b1-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ropQCoQX8YRN5bOKbWqoIGfAYYJUFoRMhocrLW0s/wQ=;
        b=Cgazc42OVx1tuItZD2cqqsVbZTZg3rxG7R/+QYjQ07mihKP6l6Xe/wANRknxsFJBVg
         LZC8nuNmdWUGKay3BGYQaCaNN8NKx8lUr2RNucUytsPUXHqfPuzC8w+9BnvKWHHv1Ums
         i4rbrBXJUdrGJjl2icxM1hmbLXV3nGEyYum+t6K3eehsdqQ2xkQwR14gpAYQEDZlwu9k
         eeCy//eyZ9xQg7pel1qat+6W8EhuPdbGZZSWSF7cUEb840i+7r1U1hSzLNOYU5/QqFjL
         7FW2aUynxW/4Ghal57C7uyr6t5+2WTZxEg4QUIOnhQ4bjlnE5RvZfcPUiVvT0VPoP/Qj
         xHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ropQCoQX8YRN5bOKbWqoIGfAYYJUFoRMhocrLW0s/wQ=;
        b=X9+WBnwQc57aa3+5Bn0AXa1mj6A4BGaHywCgCDu3238/Mm9me+HFvw2Z5MmUMJezXZ
         qyBkyp6HVrlHgfnOakmI6BLfsojGC9e2IjtwDeGry6rljNBDROXt+CEqTNLAAKq6yI7z
         NsW7Eht47upyWWC63RWmDA3YRWa9p/uAg1ACc4UKgoj9s4MjViSTda2AgoITb/SzMCx5
         HxbkB9hM8qf8z7iTHeg322JZcduvrtF/F3533N3QPoZbbFt3Yxv3NVxFPOJ440BJg33i
         nj6BNSBMkuaK8TUaF2nfpr6podGkBPnW8NvwUcwSEWzvpQ2aX8CCMrAw9CNxk95Bk8MV
         BtRw==
X-Gm-Message-State: ANoB5pk5zGpunYUV0MtAbRFaEC2ObigR+7ffGDPeHc+v5s7X+pFv0RGl
	fvx2Snma0dGYbqz1fosgZb0YcPzn70eZ85gBOPE=
X-Google-Smtp-Source: AA0mqf5yj88sBc4l97bfuYVwFVsGIex1YrQed/62gN6n0eEWrZXoHEV0/tKcr+rINx6aKVNKRfX+wGDq8TfIOT03new=
X-Received: by 2002:a17:906:72cc:b0:7c1:1c1:c7d6 with SMTP id
 m12-20020a17090672cc00b007c101c1c7d6mr11476130ejl.556.1670693885874; Sat, 10
 Dec 2022 09:38:05 -0800 (PST)
MIME-Version: 1.0
References: <CALAP8f--jyG=ufJ9WGtL6qoeGdsykjNK85G3q50SzJm5+wOzhQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2210171400570.2351079@ubuntu-linux-20-04-desktop>
 <CALAP8f81ojfVD9n5EMtD7DxY-8uomgENVEQH9Afz7Hk9rfaAsw@mail.gmail.com>
 <alpine.DEB.2.22.394.2210181213370.4587@ubuntu-linux-20-04-desktop>
 <CALAP8f9Zgue6WfAk2uRGkg=1Up2Z+eQWqvQ1_Z2=r66Z5fvKoA@mail.gmail.com>
 <alpine.DEB.2.22.394.2210251641540.1397955@ubuntu-linux-20-04-desktop>
 <CALAP8f8Z8A2u8h56EJWOCN7nJFDvyEvM-Q85XMnUP6Y6mZDg3w@mail.gmail.com>
 <CALAP8f_n2okQ-Ss_kGACAq3BVYXS_D2P_8AyhOzUxqgWpz9f4g@mail.gmail.com>
 <alpine.DEB.2.22.394.2211101702250.50442@ubuntu-linux-20-04-desktop>
 <CALAP8f8zGfNA_CZU4UQXy7-rPT6dqih9XpzuKM3vvkoBvy6usg@mail.gmail.com>
 <alpine.DEB.2.22.394.2211221605470.1049131@ubuntu-linux-20-04-desktop>
 <CALAP8f_QiHN4dP3z+LQgKdGeo8-=9DMyk0W7+x6P2eHvnOD_wQ@mail.gmail.com> <alpine.DEB.2.22.394.2212011128430.4039@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2212011128430.4039@ubuntu-linux-20-04-desktop>
From: Vipul Suneja <vsuneja63@gmail.com>
Date: Sat, 10 Dec 2022 23:07:53 +0530
Message-ID: <CALAP8f_b=0m0dqj9a50UYXYfw9X873i07sG9eyxFSqxF0yEneQ@mail.gmail.com>
Subject: Re: Porting Xen in raspberry pi4B
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, oleksandr_andrushchenko@epam.com, 
	oleksandr_tyshchenko@epam.com, jgross@suse.com, boris.ostrovsky@oracle.com, 
	Bertrand.Marquis@arm.com
Content-Type: multipart/alternative; boundary="0000000000009896a005ef7cbba0"

--0000000000009896a005ef7cbba0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefano,

Thanks!

I have included printk debug logs in the xen-fbfront.c source file. While
cross compiling to generate .ko with "xen-guest-image-minimal" toolchain
it's throwing a modpost
not found error. I could see the modpost.c source file but the final script
is missing. Any input on this, Below are the logs:
























*agl@agl-OptiPlex-7010:~/Automotive/ADAS_Infotainment/project/Application/X=
en/Framebuffer$
makemake ARCH=3Darm64
-I/opt/poky/4.0.5/sysroots/cortexa72-poky-linux/usr/include/asm -C
/opt/poky/4.0.5/sysroots/cortexa72-poky-linux/lib/modules/5.15.72-yocto-sta=
ndard/build
M=3D/home/agl/Automotive/ADAS_Infotainment/project/Application/Xen/Framebuf=
fer
modulesmake[1]: Entering directory
'/opt/poky/4.0.5/sysroots/cortexa72-poky-linux/lib/modules/5.15.72-yocto-st=
andard/build'arch/arm64/Makefile:36:
Detected assembler with broken .inst; disassembly will be
unreliablewarning: the compiler differs from the one used to build the
kernel  The kernel was built by: gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0
You are using:           aarch64-poky-linux-gcc (GCC) 11.3.0  CC [M]
 /home/agl/Automotive/ADAS_Infotainment/project/Application/Xen/Framebuffer=
/xen-fbfront.o
MODPOST
/home/agl/Automotive/ADAS_Infotainment/project/Application/Xen/Framebuffer/=
Module.symvers/bin/sh:
1: scripts/mod/modpost: not foundmake[2]: ***
[scripts/Makefile.modpost:133:
/home/agl/Automotive/ADAS_Infotainment/project/Application/Xen/Framebuffer/=
Module.symvers]
Error 127make[1]: *** [Makefile:1813: modules] Error 2make[1]: Leaving
directory
'/opt/poky/4.0.5/sysroots/cortexa72-poky-linux/lib/modules/5.15.72-yocto-st=
andard/build'make:
*** [Makefile:5: all] Error
2agl@agl-OptiPlex-7010:~/Automotive/ADAS_Infotainment/project/Application/X=
en/Framebuffer$
ls -ltotal 324-rwxrwxrwx 1 agl agl    359 Dec 10 22:41 Makefile-rw-rw-r-- 1
agl agl     90 Dec 10 22:49 modules.order-rw-r--r-- 1 agl agl  18331 Dec  1
20:32 xen-fbfront.c-rw-rw-r-- 1 agl agl     90 Dec 10 22:49
xen-fbfront.mod-rw-rw-r-- 1 agl agl 297832 Dec 10 22:49
xen-fbfront.oagl@agl-OptiPlex-7010:~/Automotive/ADAS_Infotainment/project/A=
pplication/Xen/Framebuffer$
file xen-fbfront.oxen-fbfront.o: ELF 64-bit LSB relocatable, ARM aarch64,
version 1 (SYSV), with debug_info, not
strippedagl@agl-OptiPlex-7010:~/Automotive/ADAS_Infotainment/project/Applic=
ation/Xen/Framebuffer$*

I have connected a HDMI based 1980x1024 resolution display screen to
raspberrypi4 for testing purposes. I hope connecting this display to rpi4
should be ok.

Is there any other way we can connect also for detailed discussion on the
display bringup issue? This will really help to resolve this issue.

Thanks & Regards,
Vipul Kumar

On Fri, Dec 2, 2022 at 1:02 AM Stefano Stabellini <sstabellini@kernel.org>
wrote:

> On Thu, 1 Dec 2022, Vipul Suneja wrote:
> > Hi Stefano,
> > Thanks!
> >
> > I am exploring both options here, modification of framebuffer source
> file & setting up x11vnc server in guest.
> > Other than these I would like to share a few findings with you.
> >
> > 1. If i keep "CONFIG_XEN_FBDEV_FRONTEND=3Dy" then xen-fbfront.ko is not
> generating but if i keep "CONFIG_XEN_FBDEV_FRONTEND=3Dm"
> > then could see xen-fbfront.ko & its loading also. Same things with othe=
r
> frontend/backend drivers also. Do we need to configure these
> > drivers as a module(m) only?
>
> xen-fbfront should work both as a module (xen-fbfront.ko) or built-in
> (CONFIG_XEN_FBDEV_FRONTEND=3Dy).
>
>
>
> > 2. I could see xenstored service is running for the host but it's alway=
s
> failing for the guest machine. I could see it in bootup logs & via
> > systemctl status also.
>
> That is normal. xenstored is only meant to be run in Dom0, not in the
> domUs. If you use the same rootfs for Dom0 and DomU then xenstored will
> fail starting in the DomU (but should succeed in Dom0), which is what we
> want.
>
> If you run "xenstore-ls" in Dom0, you'll see a bunch of entries,
> including some of them related to "vfb" which is the virtual framebuffer
> protocol. You should also see an entry called "state" set to "4" which
> means "connected". state =3D 4 is usually when everything works. Normally
> when things don't work state !=3D 4.
>
>
>
> > Below are the logs:
> > [  OK  ] Reached target Basic System.
> > [  OK  ] Started Kernel Logging Service.
> > [  OK  ] Started System Logging Service.
> >          Starting D-Bus System Message Bus...
> >          Starting User Login Management...
> >          Starting Permit User Sessions...
> >          Starting The Xen xenstore...
> >          Starting OpenSSH Key Generation...
> > [FAILED] Failed to start The Xen xenstore.
> > See 'systemctl status xenstored.service' for details.
> > [DEPEND] Dependency failed for qemu for xen dom0 disk backend.
> > [DEPEND] Dependency failed for Xend=E2=80=A6p guests on boot and shutdo=
wn.
> > [DEPEND] Dependency failed for xen-=E2=80=A6des, JSON configuration stu=
b).
> > [DEPEND] Dependency failed for Xenc=E2=80=A6guest consoles and hypervis=
or.
> > [  OK  ] Finished Permit User Sessions.
> > [  OK  ] Started Getty on tty1.
> > [  OK  ] Started Serial Getty on hvc0.
> > [  OK  ] Started Serial Getty on ttyS0.
> > [  OK  ] Reached target Login Prompts.
> >          Starting Xen-watchdog - run xen watchdog daemon...
> > [  OK  ] Started D-Bus System Message Bus.
> > [  OK  ] Started Xen-watchdog - run xen watchdog daemon.
> > [  OK  ] Finished OpenSSH Key Generation.
> > [  OK  ] Started User Login Management.
> > [  OK  ] Reached target Multi-User System.
> >          Starting Record Runlevel Change in UTMP...
> > [  OK  ] Finished Record Runlevel Change in UTMP.
> > fbcon: Taking over console
> >
> > Poky (Yocto Project Reference Distro) 4.0.4 raspberrypi4-64 hvc0
> >
> > raspberrypi4-64 login: root
> > root@raspberrypi4-64:~#
> > root@raspberrypi4-64:~#
> > root@raspberrypi4-64:~# systemctl status xenstored.service
> > x xenstored.service - The Xen xenstore
> >      Loaded: loaded (/lib/systemd/system/xenstored.service; enabled;
> vendor preset: enabled)
> >      Active: failed (Result: exit-code) since Thu 2022-12-01 06:12:05
> UTC; 26s ago
> >     Process: 195 ExecStartPre=3D/bin/grep -q control_d
> /proc/xen/capabilities (code=3Dexited, status=3D1/FAILURE)
> >
> > Dec 01 06:12:04 raspberrypi4-64 systemd[1]: Starting The Xen xenstore..=
.
> > Dec 01 06:12:05 raspberrypi4-64 systemd[1]: xenstored.service: Control
> pro...URE
> > Dec 01 06:12:05 raspberrypi4-64 systemd[1]: xenstored.service: Failed
> with...e'.
> > Dec 01 06:12:05 raspberrypi4-64 systemd[1]: Failed to start The Xen
> xenstore.
> > Hint: Some lines were ellipsized, use -l to show in full.
> > root@raspberrypi4-64:~#
> >
> > Any input on these?
> >
> > Thanks & Regards,
> > Vipul Kumar
> >
> > On Wed, Nov 23, 2022 at 5:41 AM Stefano Stabellini <
> sstabellini@kernel.org> wrote:
> >       Hi Vipul,
> >
> >       I cannot spot any issue in the configuration, in particual you
> have:
> >
> >       CONFIG_XEN_FBDEV_FRONTEND=3Dy
> >
> >       which is what you need.
> >
> >       The only thing I can suggest is to add printks to the Linux
> frontend
> >       driver (the one running in the domU) which is
> >       drivers/video/fbdev/xen-fbfront.c and printfs to the QEMU backend
> >       (running in Dom0) which is hw/display/xenfb.c to figure out what =
is
> >       going on.
> >
> >
> >       Alternatively, you can setup PV network with the domU, such as:
> >
> >         vif=3D['']
> >
> >       and then run x11 and a x11vnc server in your domU. You should be
> able to
> >       connect to it using vncviewer at the network IP of your domU.
> >
> >       Basically you are skipping the problem because instead of using
> the PV
> >       framebuffer protocol, you just use VNC over the network with the
> domU.
> >
> >
> >       Cheers,
> >
> >       Stefano
> >
> >
> >       On Tue, 22 Nov 2022, Vipul Suneja wrote:
> >       > Hi Stefano,
> >       > Thanks for the support!
> >       >
> >       > Looks like I have tried all the combinations & possible ways to
> get display up but failed. Is there any document or pdf for
> >       porting xen on
> >       > raspberrypi4.
> >       > I could find lot's of links telling the same but couldn't see
> any official user guide or document from the xen community on
> >       the same. If
> >       > there is something to refer
> >       > to please share with me.
> >       > I am attaching the kernel configuration file also, just take a
> look if i have missed anything.
> >       > Any other suggestions or input from your end could be really
> helpful?
> >       >
> >       > Regards,
> >       > Vipul Kumar
> >       >
> >       > On Fri, Nov 11, 2022 at 6:40 AM Stefano Stabellini <
> sstabellini@kernel.org> wrote:
> >       >       Hi Vipul,
> >       >
> >       >       Sorry for the late reply. From the earlier logs that you
> sent, it looks
> >       >       like everything should be working correctly. Specifically=
:
> >       >
> >       >            vfb =3D ""
> >       >             1 =3D ""
> >       >              0 =3D ""
> >       >               frontend =3D "/local/domain/1/device/vfb/0"
> >       >               frontend-id =3D "1"
> >       >               online =3D "1"
> >       >               state =3D "4"
> >       >               vnc =3D "1"
> >       >               vnclisten =3D "127.0.0.1"
> >       >               vncdisplay =3D "0"
> >       >               vncunused =3D "1"
> >       >               sdl =3D "0"
> >       >               opengl =3D "0"
> >       >               feature-resize =3D "1"
> >       >               hotplug-status =3D "connected"
> >       >               request-update =3D "1"
> >       >
> >       >       state "4" means "connected". So I would expect that you
> should be able
> >       >       to connect to the vnc server using vncviewer. You might
> not see anything
> >       >       (black screen) but you should definitely be able to
> connect.
> >       >
> >       >       I wouldn't try to launch x11 in the guest just yet. fbcon
> in Linux is
> >       >       enough to render something on the screen. You should be
> able to see the
> >       >       Linux text-based console rendered graphically, connecting
> to it via vnc.
> >       >
> >       >       Sorry for the basic question, but have you tried all the
> following?
> >       >
> >       >       vncviewer 127.0.0.1:0
> >       >       vncviewer 127.0.0.1:1
> >       >       vncviewer 127.0.0.1:2
> >       >       vncviewer 127.0.0.1:5900
> >       >       vncviewer 127.0.0.1:5901
> >       >       vncviewer 127.0.0.1:5902
> >       >
> >       >       Given that from the xenstore-ls logs everything seems to
> work correctly
> >       >       I am not sure what else to suggest. You might have to add
> printf to QEMU
> >       >       ui/vnc.c and hw/display/xenfb.c to see what is going wron=
g.
> >       >
> >       >       Cheers,
> >       >
> >       >       Stefano
> >       >
> >       >
> >       >       On Mon, 7 Nov 2022, Vipul Suneja wrote:
> >       >       > Hi Stefano,
> >       >       > Thanks!
> >       >       >
> >       >       > Any input further on "xenstore-ls" logs?
> >       >       >
> >       >       > I am trying to run the x0vncserver & x11vnc server
> manually on guest machine(xen_guest_image_minimal) image but it's
> >       failing
> >       >       with the below
> >       >       > error.
> >       >       >
> >       >       > root@raspberrypi4-64:/usr/bin# x0vncserver
> >       >       > x0vncserver: unable to open display ""
> >       >       > root@raspberrypi4-64:/usr/bin#
> >       >       > root@raspberrypi4-64:/usr/bin# x11vnc
> >       >       >
> ###############################################################
> >       >       >
> #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
> >       >       > #@
>     @#
> >       >       > #@  **  WARNING  **  WARNING  **  WARNING  **  WARNING
>  **   @#
> >       >       > #@
>     @#
> >       >       > #@        YOU ARE RUNNING X11VNC WITHOUT A PASSWORD!!
>      @#
> >       >       > #@
>     @#
> >       >       > #@  This means anyone with network access to this
> computer   @#
> >       >       > #@  may be able to view and control your desktop.
>      @#
> >       >       > #@
>     @#
> >       >       > #@ >>> If you did not mean to do this Press CTRL-C now!=
!
> <<< @#
> >       >       > #@
>     @#
> >       >       >
> #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
> >       >       > #@
>     @#
> >       >       > #@  You can create an x11vnc password file by running:
>     @#
> >       >       > #@
>     @#
> >       >       > #@       x11vnc -storepasswd password /path/to/passfile
>      @#
> >       >       > #@  or   x11vnc -storepasswd /path/to/passfile
>     @#
> >       >       > #@  or   x11vnc -storepasswd
>     @#
> >       >       > #@
>     @#
> >       >       > #@  (the last one will use ~/.vnc/passwd)
>      @#
> >       >       > #@
>     @#
> >       >       > #@  and then starting x11vnc via:
>      @#
> >       >       > #@
>     @#
> >       >       > #@      x11vnc -rfbauth /path/to/passfile
>      @#
> >       >       > #@
>     @#
> >       >       > #@  an existing ~/.vnc/passwd file from another VNC
>      @#
> >       >       > #@  application will work fine too.
>      @#
> >       >       > #@
>     @#
> >       >       > #@  You can also use the -passwdfile or -passwd options=
.
>     @#
> >       >       > #@  (note -passwd is unsafe if local users are not
> trusted)  @#
> >       >       > #@
>     @#
> >       >       > #@  Make sure any -rfbauth and -passwdfile password
> files    @#
> >       >       > #@  cannot be read by untrusted users.
>     @#
> >       >       > #@
>     @#
> >       >       > #@  Use x11vnc -usepw to automatically use your
>      @#
> >       >       > #@  ~/.vnc/passwd or ~/.vnc/passwdfile password files.
>     @#
> >       >       > #@  (and prompt you to create ~/.vnc/passwd if neither
>     @#
> >       >       > #@  file exists.)  Under -usepw, x11vnc will exit if it
>      @#
> >       >       > #@  cannot find a password to use.
>     @#
> >       >       > #@
>     @#
> >       >       > #@
>     @#
> >       >       > #@  Even with a password, the subsequent VNC traffic is
>      @#
> >       >       > #@  sent in the clear.  Consider tunnelling via ssh(1):
>      @#
> >       >       > #@
>     @#
> >       >       > #@    http://www.karlrunge.com/x11vnc/#tunnelling
>      @#
> >       >       > #@
>     @#
> >       >       > #@  Or using the x11vnc SSL options: -ssl and -stunnel
>     @#
> >       >       > #@
>     @#
> >       >       > #@  Please Read the documentation for more info about
>      @#
> >       >       > #@  passwords, security, and encryption.
>     @#
> >       >       > #@
>     @#
> >       >       > #@
> http://www.karlrunge.com/x11vnc/faq.html#faq-passwd    @#
> >       >       > #@
>     @#
> >       >       > #@  To disable this warning use the -nopw option, or pu=
t
>     @#
> >       >       > #@  'nopw' on a line in your ~/.x11vncrc file.
>     @#
> >       >       > #@
>     @#
> >       >       >
> #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
> >       >       >
> ###############################################################
> >       >       > 09/03/2018 12:58:41 x11vnc version: 0.9.16 lastmod:
> 2019-01-05  pid: 424
> >       >       > 09/03/2018 12:58:41 XOpenDisplay("") failed.
> >       >       > 09/03/2018 12:58:41 Trying again with
> XAUTHLOCALHOSTNAME=3Dlocalhost ...
> >       >       > 09/03/2018 12:58:41
> >       >       > 09/03/2018 12:58:41 *** XOpenDisplay failed. No -displa=
y
> or DISPLAY.
> >       >       > 09/03/2018 12:58:41 *** Trying ":0" in 4 seconds.  Pres=
s
> Ctrl-C to abort.
> >       >       > 09/03/2018 12:58:41 *** 1 2 3 4
> >       >       > 09/03/2018 12:58:45 XOpenDisplay(":0") failed.
> >       >       > 09/03/2018 12:58:45 Trying again with
> XAUTHLOCALHOSTNAME=3Dlocalhost ...
> >       >       > 09/03/2018 12:58:45 XOpenDisplay(":0") failed.
> >       >       > 09/03/2018 12:58:45 Trying again with unset
> XAUTHLOCALHOSTNAME ...
> >       >       > 09/03/2018 12:58:45
> >       >       >
> >       >       > 09/03/2018 12:58:45
> ***************************************
> >       >       > 09/03/2018 12:58:45 *** XOpenDisplay failed (:0)
> >       >       >
> >       >       > *** x11vnc was unable to open the X DISPLAY: ":0", it
> cannot continue.
> >       >       > *** There may be "Xlib:" error messages above with
> details about the failure.
> >       >       >
> >       >       > Some tips and guidelines:
> >       >       >
> >       >       > ** An X server (the one you wish to view) must be
> running before x11vnc is
> >       >       >    started: x11vnc does not start the X server.
>  (however, see the -create
> >       >       >    option if that is what you really want).
> >       >       >
> >       >       > ** You must use -display <disp>, -OR- set and export
> your $DISPLAY
> >       >       >    environment variable to refer to the display of the
> desired X server.
> >       >       >  - Usually the display is simply ":0" (in fact x11vnc
> uses this if you forget
> >       >       >    to specify it), but in some multi-user situations it
> could be ":1", ":2",
> >       >       >    or even ":137".  Ask your administrator or a guru if
> you are having
> >       >       >    difficulty determining what your X DISPLAY is.
> >       >       >
> >       >       > ** Next, you need to have sufficient permissions
> (Xauthority)
> >       >       >    to connect to the X DISPLAY.   Here are some Tips:
> >       >       >
> >       >       >  - Often, you just need to run x11vnc as the user logge=
d
> into the X session.
> >       >       >    So make sure to be that user when you type x11vnc.
> >       >       >  - Being root is usually not enough because the
> incorrect MIT-MAGIC-COOKIE
> >       >       >    file may be accessed.  The cookie file contains the
> secret key that
> >       >       >    allows x11vnc to connect to the desired X DISPLAY.
> >       >       >  - You can explicitly indicate which MIT-MAGIC-COOKIE
> file should be used
> >       >       >    by the -auth option, e.g.:
> >       >       >        x11vnc -auth /home/someuser/.Xauthority -display
> :0
> >       >       >        x11vnc -auth /tmp/.gdmzndVlR -display :0
> >       >       >    you must have read permission for the auth file.
> >       >       >    See also '-auth guess' and '-findauth' discussed
> below.
> >       >       >
> >       >       > ** If NO ONE is logged into an X session yet, but there
> is a greeter login
> >       >       >    program like "gdm", "kdm", "xdm", or "dtlogin"
> running, you will need
> >       >       >    to find and use the raw display manager
> MIT-MAGIC-COOKIE file.
> >       >       >    Some examples for various display managers:
> >       >       >
> >       >       >      gdm:     -auth /var/gdm/:0.Xauth
> >       >       >               -auth /var/lib/gdm/:0.Xauth
> >       >       >      kdm:     -auth /var/lib/kdm/A:0-crWk72
> >       >       >               -auth /var/run/xauth/A:0-crWk72
> >       >       >      xdm:     -auth
> /var/lib/xdm/authdir/authfiles/A:0-XQvaJk
> >       >       >      dtlogin: -auth /var/dt/A:0-UgaaXa
> >       >       >
> >       >       >    Sometimes the command "ps wwwwaux | grep auth" can
> reveal the file location.
> >       >       >
> >       >       >    Starting with x11vnc 0.9.9 you can have it try to
> guess by using:
> >       >       >
> >       >       >               -auth guess
> >       >       >
> >       >       >    (see also the x11vnc -findauth option.)
> >       >       >
> >       >       >    Only root will have read permission for the file, an=
d
> so x11vnc must be run
> >       >       >    as root (or copy it).  The random characters in the
> filenames will of course
> >       >       >    change and the directory the cookie file resides in
> is system dependent.
> >       >       >
> >       >       > See also: http://www.karlrunge.com/x11vnc/faq.html
> >       >       >
> >       >       > Regards,
> >       >       > Vipul Kumar
> >       >       >
> >       >       > On Thu, Nov 3, 2022 at 10:27 PM Vipul Suneja <
> vsuneja63@gmail.com> wrote:
> >       >       >       Hi Stefano,
> >       >       > Thanks!
> >       >       >
> >       >       > I used xen-guest-image-minimal(simple console based
> image) as a guest with fbcon & fbdev enabled in kernel
> >       configurations but
> >       >       still
> >       >       > the same error can't open the display.
> >       >       > below are the outcome of "xenstore-ls":
> >       >       >
> >       >       > root@raspberrypi4-64:~/guest1# xenstore-ls
> >       >       > tool =3D ""
> >       >       >  xenstored =3D ""
> >       >       > local =3D ""
> >       >       >  domain =3D ""
> >       >       >   0 =3D ""
> >       >       >    control =3D ""
> >       >       >     feature-poweroff =3D "1"
> >       >       >     feature-reboot =3D "1"
> >       >       >    domid =3D "0"
> >       >       >    name =3D "Domain-0"
> >       >       >    device-model =3D ""
> >       >       >     0 =3D ""
> >       >       >      backends =3D ""
> >       >       >       console =3D ""
> >       >       >       vkbd =3D ""
> >       >       >       vfb =3D ""
> >       >       >       qnic =3D ""
> >       >       >      state =3D "running"
> >       >       >     1 =3D ""
> >       >       >      backends =3D ""
> >       >       >       console =3D ""
> >       >       >       vkbd =3D ""
> >       >       >       vfb =3D ""
> >       >       >       qnic =3D ""
> >       >       >      state =3D "running"
> >       >       >    backend =3D ""
> >       >       >     vbd =3D ""
> >       >       >      1 =3D ""
> >       >       >       51712 =3D ""
> >       >       >        frontend =3D "/local/domain/1/device/vbd/51712"
> >       >       >        params =3D
> "/home/root/guest2/xen-guest-image-minimal-raspberrypi4-64.ext3"
> >       >       >        script =3D "/etc/xen/scripts/block"
> >       >       >        frontend-id =3D "1"
> >       >       >        online =3D "1"
> >       >       >        removable =3D "0"
> >       >       >        bootable =3D "1"
> >       >       >        state =3D "4"
> >       >       >        dev =3D "xvda"
> >       >       >        type =3D "phy"
> >       >       >        mode =3D "w"
> >       >       >        device-type =3D "disk"
> >       >       >        discard-enable =3D "1"
> >       >       >        feature-max-indirect-segments =3D "256"
> >       >       >        multi-queue-max-queues =3D "4"
> >       >       >        max-ring-page-order =3D "4"
> >       >       >        node =3D "/dev/loop0"
> >       >       >        physical-device =3D "7:0"
> >       >       >        physical-device-path =3D "/dev/loop0"
> >       >       >        hotplug-status =3D "connected"
> >       >       >        feature-flush-cache =3D "1"
> >       >       >        discard-granularity =3D "4096"
> >       >       >        discard-alignment =3D "0"
> >       >       >        discard-secure =3D "0"
> >       >       >        feature-discard =3D "1"
> >       >       >        feature-barrier =3D "1"
> >       >       >        feature-persistent =3D "1"
> >       >       >        sectors =3D "1794048"
> >       >       >        info =3D "0"
> >       >       >        sector-size =3D "512"
> >       >       >        physical-sector-size =3D "512"
> >       >       >     vfb =3D ""
> >       >       >      1 =3D ""
> >       >       >       0 =3D ""
> >       >       >        frontend =3D "/local/domain/1/device/vfb/0"
> >       >       >        frontend-id =3D "1"
> >       >       >        online =3D "1"
> >       >       >        state =3D "4"
> >       >       >        vnc =3D "1"
> >       >       >        vnclisten =3D "127.0.0.1"
> >       >       >        vncdisplay =3D "0"
> >       >       >        vncunused =3D "1"
> >       >       >        sdl =3D "0"
> >       >       >        opengl =3D "0"
> >       >       >        feature-resize =3D "1"
> >       >       >        hotplug-status =3D "connected"
> >       >       >        request-update =3D "1"
> >       >       >     vkbd =3D ""
> >       >       >      1 =3D ""
> >       >       >       0 =3D ""
> >       >       >        frontend =3D "/local/domain/1/device/vkbd/0"
> >       >       >        frontend-id =3D "1"
> >       >       >        online =3D "1"
> >       >       >        state =3D "4"
> >       >       >        feature-abs-pointer =3D "1"
> >       >       >        feature-raw-pointer =3D "1"
> >       >       >        hotplug-status =3D "connected"
> >       >       >     console =3D ""
> >       >       >      1 =3D ""
> >       >       >       0 =3D ""
> >       >       >        frontend =3D "/local/domain/1/console"
> >       >       >        frontend-id =3D "1"
> >       >       >        online =3D "1"
> >       >       >        state =3D "1"
> >       >       >        protocol =3D "vt100"
> >       >       >     vif =3D ""
> >       >       >      1 =3D ""
> >       >       >       0 =3D ""
> >       >       >        frontend =3D "/local/domain/1/device/vif/0"
> >       >       >        frontend-id =3D "1"
> >       >       >        online =3D "1"
> >       >       >        state =3D "4"
> >       >       >        script =3D "/etc/xen/scripts/vif-bridge"
> >       >       >        mac =3D "e4:5f:01:cd:7b:dd"
> >       >       >        bridge =3D "xenbr0"
> >       >       >        handle =3D "0"
> >       >       >        type =3D "vif"
> >       >       >        hotplug-status =3D "connected"
> >       >       >        feature-sg =3D "1"
> >       >       >        feature-gso-tcpv4 =3D "1"
> >       >       >        feature-gso-tcpv6 =3D "1"
> >       >       >        feature-ipv6-csum-offload =3D "1"
> >       >       >        feature-rx-copy =3D "1"
> >       >       >        feature-xdp-headroom =3D "1"
> >       >       >        feature-rx-flip =3D "0"
> >       >       >        feature-multicast-control =3D "1"
> >       >       >        feature-dynamic-multicast-control =3D "1"
> >       >       >        feature-split-event-channels =3D "1"
> >       >       >        multi-queue-max-queues =3D "4"
> >       >       >        feature-ctrl-ring =3D "1"
> >       >       >   1 =3D ""
> >       >       >    vm =3D "/vm/d81ec5a9-5bf9-4f2b-89e8-0f60d6da948f"
> >       >       >    name =3D "guest2"
> >       >       >    cpu =3D ""
> >       >       >     0 =3D ""
> >       >       >      availability =3D "online"
> >       >       >     1 =3D ""
> >       >       >      availability =3D "online"
> >       >       >    memory =3D ""
> >       >       >     static-max =3D "2097152"
> >       >       >     target =3D "2097152"
> >       >       >     videoram =3D "0"
> >       >       >    device =3D ""
> >       >       >     suspend =3D ""
> >       >       >      event-channel =3D ""
> >       >       >     vbd =3D ""
> >       >       >      51712 =3D ""
> >       >       >       backend =3D "/local/domain/0/backend/vbd/1/51712"
> >       >       >       backend-id =3D "0"
> >       >       >       state =3D "4"
> >       >       >       virtual-device =3D "51712"
> >       >       >       device-type =3D "disk"
> >       >       >       multi-queue-num-queues =3D "2"
> >       >       >       queue-0 =3D ""
> >       >       >        ring-ref =3D "8"
> >       >       >        event-channel =3D "4"
> >       >       >       queue-1 =3D ""
> >       >       >        ring-ref =3D "9"
> >       >       >        event-channel =3D "5"
> >       >       >       protocol =3D "arm-abi"
> >       >       >       feature-persistent =3D "1"
> >       >       >     vfb =3D ""
> >       >       >      0 =3D ""
> >       >       >       backend =3D "/local/domain/0/backend/vfb/1/0"
> >       >       >       backend-id =3D "0"
> >       >       >       state =3D "4"
> >       >       >       page-ref =3D "275022"
> >       >       >       event-channel =3D "3"
> >       >       >       protocol =3D "arm-abi"
> >       >       >       feature-update =3D "1"
> >       >       >     vkbd =3D ""
> >       >       >      0 =3D ""
> >       >       >       backend =3D "/local/domain/0/backend/vkbd/1/0"
> >       >       >       backend-id =3D "0"
> >       >       >       state =3D "4"
> >       >       >       request-abs-pointer =3D "1"
> >       >       >       page-ref =3D "275322"
> >       >       >       page-gref =3D "1284"
> >       >       >       event-channel =3D "10"
> >       >       >     vif =3D ""
> >       >       >      0 =3D ""
> >       >       >       backend =3D "/local/domain/0/backend/vif/1/0"
> >       >       >       backend-id =3D "0"
> >       >       >       state =3D "4"
> >       >       >       handle =3D "0"
> >       >       >       mac =3D "e4:5f:01:cd:7b:dd"
> >       >       >       mtu =3D "1500"
> >       >       >       xdp-headroom =3D "0"
> >       >       >       multi-queue-num-queues =3D "2"
> >       >       >       queue-0 =3D ""
> >       >       >        tx-ring-ref =3D "1280"
> >       >       >        rx-ring-ref =3D "1281"
> >       >       >        event-channel-tx =3D "6"
> >       >       >        event-channel-rx =3D "7"
> >       >       >       queue-1 =3D ""
> >       >       >        tx-ring-ref =3D "1282"
> >       >       >        rx-ring-ref =3D "1283"
> >       >       >        event-channel-tx =3D "8"
> >       >       >        event-channel-rx =3D "9"
> >       >       >       request-rx-copy =3D "1"
> >       >       >       feature-rx-notify =3D "1"
> >       >       >       feature-sg =3D "1"
> >       >       >       feature-gso-tcpv4 =3D "1"
> >       >       >       feature-gso-tcpv6 =3D "1"
> >       >       >       feature-ipv6-csum-offload =3D "1"
> >       >       >    control =3D ""
> >       >       >     shutdown =3D ""
> >       >       >     feature-poweroff =3D "1"
> >       >       >     feature-reboot =3D "1"
> >       >       >     feature-suspend =3D ""
> >       >       >     sysrq =3D ""
> >       >       >     platform-feature-multiprocessor-suspend =3D "1"
> >       >       >     platform-feature-xs_reset_watches =3D "1"
> >       >       >    data =3D ""
> >       >       >    drivers =3D ""
> >       >       >    feature =3D ""
> >       >       >    attr =3D ""
> >       >       >    error =3D ""
> >       >       >    domid =3D "1"
> >       >       >    store =3D ""
> >       >       >     port =3D "1"
> >       >       >     ring-ref =3D "233473"
> >       >       >    console =3D ""
> >       >       >     backend =3D "/local/domain/0/backend/console/1/0"
> >       >       >     backend-id =3D "0"
> >       >       >     limit =3D "1048576"
> >       >       >     type =3D "xenconsoled"
> >       >       >     output =3D "pty"
> >       >       >     tty =3D "/dev/pts/1"
> >       >       >     port =3D "2"
> >       >       >     ring-ref =3D "233472"
> >       >       >     vnc-listen =3D "127.0.0.1"
> >       >       >     vnc-port =3D "5900"
> >       >       >    image =3D ""
> >       >       >     device-model-pid =3D "788"
> >       >       > vm =3D ""
> >       >       >  d81ec5a9-5bf9-4f2b-89e8-0f60d6da948f =3D ""
> >       >       >   name =3D "guest2"
> >       >       >   uuid =3D "d81ec5a9-5bf9-4f2b-89e8-0f60d6da948f"
> >       >       >   start_time =3D "1520600274.27"
> >       >       > libxl =3D ""
> >       >       >  1 =3D ""
> >       >       >   device =3D ""
> >       >       >    vbd =3D ""
> >       >       >     51712 =3D ""
> >       >       >      frontend =3D "/local/domain/1/device/vbd/51712"
> >       >       >      backend =3D "/local/domain/0/backend/vbd/1/51712"
> >       >       >      params =3D
> "/home/root/guest2/xen-guest-image-minimal-raspberrypi4-64.ext3"
> >       >       >      script =3D "/etc/xen/scripts/block"
> >       >       >      frontend-id =3D "1"
> >       >       >      online =3D "1"
> >       >       >      removable =3D "0"
> >       >       >      bootable =3D "1"
> >       >       >      state =3D "1"
> >       >       >      dev =3D "xvda"
> >       >       >      type =3D "phy"
> >       >       >      mode =3D "w"
> >       >       >      device-type =3D "disk"
> >       >       >      discard-enable =3D "1"
> >       >       >    vfb =3D ""
> >       >       >     0 =3D ""
> >       >       >      frontend =3D "/local/domain/1/device/vfb/0"
> >       >       >      backend =3D "/local/domain/0/backend/vfb/1/0"
> >       >       >      frontend-id =3D "1"
> >       >       >      online =3D "1"
> >       >       >      state =3D "1"
> >       >       >      vnc =3D "1"
> >       >       >      vnclisten =3D "127.0.0.1"
> >       >       >      vncdisplay =3D "0"
> >       >       >      vncunused =3D "1"
> >       >       >      sdl =3D "0"
> >       >       >      opengl =3D "0"
> >       >       >    vkbd =3D ""
> >       >       >     0 =3D ""
> >       >       >      frontend =3D "/local/domain/1/device/vkbd/0"
> >       >       >      backend =3D "/local/domain/0/backend/vkbd/1/0"
> >       >       >      frontend-id =3D "1"
> >       >       >      online =3D "1"
> >       >       >      state =3D "1"
> >       >       >    console =3D ""
> >       >       >     0 =3D ""
> >       >       >      frontend =3D "/local/domain/1/console"
> >       >       >      backend =3D "/local/domain/0/backend/console/1/0"
> >       >       >      frontend-id =3D "1"
> >       >       >      online =3D "1"
> >       >       >      state =3D "1"
> >       >       >      protocol =3D "vt100"
> >       >       >    vif =3D ""
> >       >       >     0 =3D ""
> >       >       >      frontend =3D "/local/domain/1/device/vif/0"
> >       >       >      backend =3D "/local/domain/0/backend/vif/1/0"
> >       >       >      frontend-id =3D "1"
> >       >       >      online =3D "1"
> >       >       >      state =3D "1"
> >       >       >      script =3D "/etc/xen/scripts/vif-bridge"
> >       >       >      mac =3D "e4:5f:01:cd:7b:dd"
> >       >       >      bridge =3D "xenbr0"
> >       >       >      handle =3D "0"
> >       >       >      type =3D "vif"
> >       >       >      hotplug-status =3D ""
> >       >       >   type =3D "pvh"
> >       >       >   dm-version =3D "qemu_xen"
> >       >       > root@raspberrypi4-64:~/guest1#
> >       >       >
> >       >       > Any input as per above? Looking forward to hearing from
> you.
> >       >       >
> >       >       > Regards,
> >       >       > Vipul Kumar
> >       >       >
> >       >       > On Wed, Oct 26, 2022 at 5:21 AM Stefano Stabellini <
> sstabellini@kernel.org> wrote:
> >       >       >       Hi Vipul,
> >       >       >
> >       >       >       If you look at the QEMU logs, it says:
> >       >       >
> >       >       >       VNC server running on 127.0.0.1:5900
> >       >       >
> >       >       >       That is the VNC server you need to connect to. So
> in theory:
> >       >       >
> >       >       >         vncviewer 127.0.0.1:5900
> >       >       >
> >       >       >       should work correctly.
> >       >       >
> >       >       >
> >       >       >       If you have:
> >       >       >
> >       >       >         vfb =3D ["type=3Dvnc"]
> >       >       >
> >       >       >       in your xl config file and you have "fbdev" in
> your Linux guest, it
> >       >       >       should work.
> >       >       >
> >       >       >       If you connect to the VNC server but you get a
> black screen, it might be
> >       >       >       a guest configuration issue. I would try with a
> simpler guest, text only
> >       >       >       (no X11, no Wayland) and enable the fbdev console
> (fbcon). See
> >       >       >       Documentation/fb/fbcon.rst in Linux. You should b=
e
> able to see a
> >       >       >       graphical console over VNC.
> >       >       >
> >       >       >       If that works, then you know that the fbdev kerne=
l
> driver (xen-fbfront)
> >       >       >       works correctly.
> >       >       >
> >       >       >       If it doesn't work, the output of "xenstore-ls"
> would be interesting.
> >       >       >
> >       >       >       Cheers,
> >       >       >
> >       >       >       Stefano
> >       >       >
> >       >       >
> >       >       >       On Wed, 19 Oct 2022, Vipul Suneja wrote:
> >       >       >       > Hi Stefano,
> >       >       >       >
> >       >       >       > Thanks for the response!
> >       >       >       >
> >       >       >       > I am following the same link you shared from th=
e
> beginning. Tried the command "vncviewer localhost:0" in DOM0
> >       but
> >       >       same
> >       >       >       issue "Can't open
> >       >       >       > display", below are the logs:
> >       >       >       >
> >       >       >       > root@raspberrypi4-64:~# vncviewer localhost:0
> >       >       >       >
> >       >       >       > TigerVNC Viewer 64-bit v1.11.0
> >       >       >       > Built on: 2020-09-08 12:16
> >       >       >       > Copyright (C) 1999-2020 TigerVNC Team and many
> others (see README.rst)
> >       >       >       > See https://www.tigervnc.org for information on
> TigerVNC.
> >       >       >       > Can't open display:
> >       >       >       >
> >       >       >       > Below are the netstat logs, i couldn't see
> anything running at port 5900 or 5901:
> >       >       >       >
> >       >       >       > root@raspberrypi4-64:~# netstat -tuwx
> >       >       >       > Active Internet connections (w/o servers)
> >       >       >       > Proto Recv-Q Send-Q Local Address
> Foreign Address         State
> >       >       >       > tcp        0    164 192.168.1.39:ssh
> 192.168.1.38:37472      ESTABLISHED
> >       >       >       > Active UNIX domain sockets (w/o servers)
> >       >       >       > Proto RefCnt Flags       Type       State
>   I-Node Path
> >       >       >       > unix  8      [ ]         DGRAM      CONNECTED
>    10565 /dev/log
> >       >       >       > unix  3      [ ]         STREAM     CONNECTED
>    10891 /var/run/xenstored/socket
> >       >       >       > unix  3      [ ]         STREAM     CONNECTED
>    13791
> >       >       >       > unix  3      [ ]         STREAM     CONNECTED
>    10843 /var/run/xenstored/socket
> >       >       >       > unix  3      [ ]         STREAM     CONNECTED
>    10573 /var/run/xenstored/socket
> >       >       >       > unix  2      [ ]         DGRAM      CONNECTED
>    14510
> >       >       >       > unix  3      [ ]         STREAM     CONNECTED
>    13249
> >       >       >       > unix  2      [ ]         DGRAM      CONNECTED
>    13887
> >       >       >       > unix  2      [ ]         DGRAM      CONNECTED
>    10599
> >       >       >       > unix  3      [ ]         STREAM     CONNECTED
>    14005
> >       >       >       > unix  3      [ ]         STREAM     CONNECTED
>    13258
> >       >       >       > unix  3      [ ]         STREAM     CONNECTED
>    13248
> >       >       >       > unix  3      [ ]         STREAM     CONNECTED
>    14003
> >       >       >       > unix  3      [ ]         STREAM     CONNECTED
>    10572 /var/run/xenstored/socket
> >       >       >       > unix  3      [ ]         STREAM     CONNECTED
>    10786 /var/run/xenstored/socket
> >       >       >       > unix  3      [ ]         DGRAM      CONNECTED
>    13186
> >       >       >       > unix  3      [ ]         STREAM     CONNECTED
>    10864 /var/run/xenstored/socket
> >       >       >       > unix  3      [ ]         STREAM     CONNECTED
>    10812 /var/run/xenstored/socket
> >       >       >       > unix  2      [ ]         DGRAM      CONNECTED
>    14083
> >       >       >       > unix  3      [ ]         STREAM     CONNECTED
>    10813 /var/run/xenstored/socket
> >       >       >       > unix  3      [ ]         STREAM     CONNECTED
>    14068
> >       >       >       > unix  3      [ ]         STREAM     CONNECTED
>    13256
> >       >       >       > unix  3      [ ]         STREAM     CONNECTED
>    10571 /var/run/xenstored/socket
> >       >       >       > unix  3      [ ]         STREAM     CONNECTED
>    10842
> >       >       >       > unix  3      [ ]         STREAM     CONNECTED
>    13985
> >       >       >       > unix  3      [ ]         DGRAM      CONNECTED
>    13185
> >       >       >       > unix  2      [ ]         STREAM     CONNECTED
>    13884
> >       >       >       > unix  2      [ ]         DGRAM      CONNECTED
>    14528
> >       >       >       > unix  2      [ ]         DGRAM      CONNECTED
>    13785
> >       >       >       > unix  3      [ ]         STREAM     CONNECTED
>    14034
> >       >       >       >
> >       >       >       > Attaching xen log files of /var/log/xen.
> >       >       >       > I didn't get the role of QEMU here because as
> mentioned earlier, I am porting in raspberrypi 4B.
> >       >       >       >
> >       >       >       > Regards,
> >       >       >       > Vipul Kumar
> >       >       >       >
> >       >       >       > On Wed, Oct 19, 2022 at 12:43 AM Stefano
> Stabellini <sstabellini@kernel.org> wrote:
> >       >       >       >       It usually works the way it is described
> in the guide:
> >       >       >       >
> >       >       >       >
> >       >       >
> >       >
> >
> https://www.virtuatopia.com/index.php?title=3DConfiguring_a_VNC_based_Gra=
phical_Console_for_a_Xen_Paravirtualized_domainU_Guest
> >       >       >       >
> >       >       >       >       You don't need to install any VNC-related
> server software because it is
> >       >       >       >       already provided by Xen (to be precise it
> is provided by QEMU working
> >       >       >       >       together with Xen.)
> >       >       >       >
> >       >       >       >       You only need the vnc client in dom0 so
> that you can connect, but you
> >       >       >       >       could also run the vnc client outside fro=
m
> another host. So basically
> >       >       >       >       the following should work when executed i=
n
> Dom0 after creating DomU:
> >       >       >       >
> >       >       >       >         vncviewer localhost:0
> >       >       >       >
> >       >       >       >       Can you attach the Xen and QEMU logs
> (/var/log/xen/*)? And also use
> >       >       >       >       netstat -taunp to check if there is
> anything running at port 5900 or
> >       >       >       >       5901?
> >       >       >       >
> >       >       >       >       Cheers,
> >       >       >       >
> >       >       >       >       Stefano
> >       >       >       >
> >       >       >       >
> >       >       >       >       On Tue, 18 Oct 2022, Vipul Suneja wrote:
> >       >       >       >       > Hi Stefano,
> >       >       >       >       >
> >       >       >       >       > Thanks for the response!
> >       >       >       >       >
> >       >       >       >       > I could install tigerVNC, x11vnc &
> libvncserver in Dom0 xen-image-minimal but only manage to install
> >       >       >       libvncserver(couldn't
> >       >       >       >       install tigervnc
> >       >       >       >       > & x11vnc because of x11
> >       >       >       >       > support missing, it's wayland) in DOMU
> custom graphical image. I tried running vncviewer with IP
> >       address &
> >       >       port
> >       >       >       in dom0 to
> >       >       >       >       access the domu
> >       >       >       >       > graphical image display as per below
> commands.
> >       >       >       >       >
> >       >       >       >       >  vncviewer 192.168.1.42:5901
> >       >       >       >       >
> >       >       >       >       >  But it showing can't open display,
> below are the logs:
> >       >       >       >       >
> >       >       >       >       > root@raspberrypi4-64:~/guest1#
> vncviewer 192.168.1.42:5901
> >       >       >       >       >
> >       >       >       >       > TigerVNC Viewer 64-bit v1.11.0
> >       >       >       >       > Built on: 2020-09-08 12:16
> >       >       >       >       > Copyright (C) 1999-2020 TigerVNC Team
> and many others (see README.rst)
> >       >       >       >       > See https://www.tigervnc.org for
> information on TigerVNC.
> >       >       >       >       > Can't open display:
> >       >       >       >       > root@raspberrypi4-64:~/guest1#
> >       >       >       >       >
> >       >       >       >       > I am not exactly sure what the issue is
> but I thought only libvncserver in DOMU could work to get
> >       access but
> >       >       it
> >       >       >       did not
> >       >       >       >       work.
> >       >       >       >       > If TigerVNC is the issue here then is
> there any other VNC source which could be installed for both
> >       x11 &
> >       >       >       wayland supported
> >       >       >       >       images?
> >       >       >       >       >
> >       >       >       >       > Regards,
> >       >       >       >       > Vipul Kumar
> >       >       >       >       >
> >       >       >       >       > On Tue, Oct 18, 2022 at 2:40 AM Stefano
> Stabellini <sstabellini@kernel.org> wrote:
> >       >       >       >       >       VNC is typically easier to setup,
> because SDL needs extra libraries at
> >       >       >       >       >       build time and runtime. If QEMU i=
s
> built without SDL support it won't
> >       >       >       >       >       start when you ask for SDL.
> >       >       >       >       >
> >       >       >       >       >       VNC should work with both x11 and
> wayland in your domU. It doesn't work
> >       >       >       >       >       at the x11 level, it exposes a
> special fbdev device in your domU that
> >       >       >       >       >       should work with:
> >       >       >       >       >       - a graphical console in Linux do=
mU
> >       >       >       >       >       - x11
> >       >       >       >       >       - wayland (but I haven't tested
> this so I am not 100% sure about it)
> >       >       >       >       >
> >       >       >       >       >       When you say "it doesn't work",
> what do you mean? Do you get a black
> >       >       >       >       >       window?
> >       >       >       >       >
> >       >       >       >       >       You need CONFIG_XEN_FBDEV_FRONTEN=
D
> in Linux domU
> >       >       >       >       >
>  (drivers/video/fbdev/xen-fbfront.c). I would try to get a graphical text
> >       >       >       >       >       console up and running in your
> domU before attempting x11/wayland.
> >       >       >       >       >
> >       >       >       >       >       Cheers,
> >       >       >       >       >
> >       >       >       >       >       Stefano
> >       >       >       >       >
> >       >       >       >       >       On Mon, 17 Oct 2022, Vipul Suneja
> wrote:
> >       >       >       >       >       > Hi,
> >       >       >       >       >       > Thanks!
> >       >       >       >       >       >
> >       >       >       >       >       > I have ported xen minimal image
> as DOM0 & custom wayland GUI based image as DOMU in raspberry
> >       pi4B. I
> >       >       >       am trying to
> >       >       >       >       make GUI
> >       >       >       >       >       display up
> >       >       >       >       >       > for guest machine. I tried
> using sdl, included below line in guest.conf file
> >       >       >       >       >       > vfb=3D [ 'sdl=3D1' ]
> >       >       >       >       >       >
> >       >       >       >       >       > But it is throwing below error:
> >       >       >       >       >       >
> >       >       >       >       >       > root@raspberrypi4-64:~/guest1#
> xl create -c guest1.cfg
> >       >       >       >       >       > Parsing config from guest1.cfg
> >       >       >       >       >       > libxl: error:
> libxl_qmp.c:1400:qmp_ev_fd_callback: Domain 3:error on QMP socket:
> Connection
> >       reset by
> >       >       >       peer
> >       >       >       >       >       > libxl: error:
> libxl_qmp.c:1439:qmp_ev_fd_callback: Domain 3:Error happened with the QMP
> >       connection to
> >       >       >       QEMU
> >       >       >       >       >       > libxl: error:
> libxl_dm.c:3351:device_model_postconfig_done: Domain 3:Post DM startup
> configs
> >       failed,
> >       >       >       rc=3D-26
> >       >       >       >       >       > libxl: error:
> libxl_create.c:1867:domcreate_devmodel_started: Domain 3:device model did
> not
> >       start:
> >       >       -26
> >       >       >       >       >       > libxl: error:
> libxl_aoutils.c:646:libxl__kill_xs_path: Device Model already exited
> >       >       >       >       >       > libxl: error:
> libxl_domain.c:1183:libxl__destroy_domid: Domain 3:Non-existant domain
> >       >       >       >       >       > libxl: error:
> libxl_domain.c:1137:domain_destroy_callback: Domain 3:Unable to destroy
> guest
> >       >       >       >       >       > libxl: error:
> libxl_domain.c:1064:domain_destroy_cb: Domain 3:Destruction of domain fai=
led
> >       >       >       >       >       >
> >       >       >       >       >       > Another way is VNC, i could
> install tigervnc in DOM0 but same i couldn't in guest machine
> >       because it
> >       >       >       doesn't support
> >       >       >       >       >       x11(supports wayland
> >       >       >       >       >       > only). I am completely blocked
> here, Need your support to enable the display up.
> >       >       >       >       >       > Any alternative of VNC which
> could work in both x11 & wayland supported images?
> >       >       >       >       >       >
> >       >       >       >       >       > Any input on VNC, SDL or any
> other way to proceed on this? Looking forward to hearing from
> >       you.
> >       >       >       >       >       >
> >       >       >       >       >       > Regards,
> >       >       >       >       >       > Vipul Kumar
> >       >       >       >       >
> >       >       >       >       >
> >       >       >       >       >
> >       >       >       >
> >       >       >       >
> >       >       >       >
> >       >       >
> >       >       >
> >       >       >
> >       >
> >       >
> >       >
> >
> >
> >

--0000000000009896a005ef7cbba0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+SGkgU3RlZmFubyw8YnI+PGJyPlRoYW5rcyE8YnI+PGJyPkkgaGF2ZSBp
bmNsdWRlZCBwcmludGsgZGVidWcgbG9ncyBpbiB0aGUgeGVuLWZiZnJvbnQuYyBzb3VyY2UgZmls
ZS4gV2hpbGUgY3Jvc3MgY29tcGlsaW5nIHRvIGdlbmVyYXRlIC5rbyB3aXRoICZxdW90O3hlbi1n
dWVzdC1pbWFnZS1taW5pbWFsJnF1b3Q7IHRvb2xjaGFpbiBpdCYjMzk7cyB0aHJvd2luZyBhIG1v
ZHBvc3Q8YnI+bm90IGZvdW5kIGVycm9yLiBJIGNvdWxkIHNlZSB0aGUgbW9kcG9zdC5jIHNvdXJj
ZSBmaWxlIGJ1dCB0aGUgZmluYWwgc2NyaXB0IGlzIG1pc3NpbmcuIEFueSBpbnB1dCBvbiB0aGlz
LCBCZWxvdyBhcmUgdGhlIGxvZ3M6PGJyPjxicj48Yj5hZ2xAYWdsLU9wdGlQbGV4LTcwMTA6fi9B
dXRvbW90aXZlL0FEQVNfSW5mb3RhaW5tZW50L3Byb2plY3QvQXBwbGljYXRpb24vWGVuL0ZyYW1l
YnVmZmVyJCBtYWtlPGJyPm1ha2UgQVJDSD1hcm02NCAtSS9vcHQvcG9reS80LjAuNS9zeXNyb290
cy9jb3J0ZXhhNzItcG9reS1saW51eC91c3IvaW5jbHVkZS9hc20gLUMgL29wdC9wb2t5LzQuMC41
L3N5c3Jvb3RzL2NvcnRleGE3Mi1wb2t5LWxpbnV4L2xpYi9tb2R1bGVzLzUuMTUuNzIteW9jdG8t
c3RhbmRhcmQvYnVpbGQgTT0vaG9tZS9hZ2wvQXV0b21vdGl2ZS9BREFTX0luZm90YWlubWVudC9w
cm9qZWN0L0FwcGxpY2F0aW9uL1hlbi9GcmFtZWJ1ZmZlciBtb2R1bGVzPGJyPm1ha2VbMV06IEVu
dGVyaW5nIGRpcmVjdG9yeSAmIzM5Oy9vcHQvcG9reS80LjAuNS9zeXNyb290cy9jb3J0ZXhhNzIt
cG9reS1saW51eC9saWIvbW9kdWxlcy81LjE1LjcyLXlvY3RvLXN0YW5kYXJkL2J1aWxkJiMzOTs8
YnI+YXJjaC9hcm02NC9NYWtlZmlsZTozNjogRGV0ZWN0ZWQgYXNzZW1ibGVyIHdpdGggYnJva2Vu
IC5pbnN0OyBkaXNhc3NlbWJseSB3aWxsIGJlIHVucmVsaWFibGU8YnI+d2FybmluZzogdGhlIGNv
bXBpbGVyIGRpZmZlcnMgZnJvbSB0aGUgb25lIHVzZWQgdG8gYnVpbGQgdGhlIGtlcm5lbDxicj7C
oCBUaGUga2VybmVsIHdhcyBidWlsdCBieTogZ2NjIChVYnVudHUgOS40LjAtMXVidW50dTF+MjAu
MDQuMSkgOS40LjA8YnI+wqAgWW91IGFyZSB1c2luZzogwqAgwqAgwqAgwqAgwqAgYWFyY2g2NC1w
b2t5LWxpbnV4LWdjYyAoR0NDKSAxMS4zLjA8YnI+wqAgQ0MgW01dIMKgL2hvbWUvYWdsL0F1dG9t
b3RpdmUvQURBU19JbmZvdGFpbm1lbnQvcHJvamVjdC9BcHBsaWNhdGlvbi9YZW4vRnJhbWVidWZm
ZXIveGVuLWZiZnJvbnQubzxicj7CoCBNT0RQT1NUIC9ob21lL2FnbC9BdXRvbW90aXZlL0FEQVNf
SW5mb3RhaW5tZW50L3Byb2plY3QvQXBwbGljYXRpb24vWGVuL0ZyYW1lYnVmZmVyL01vZHVsZS5z
eW12ZXJzPGJyPi9iaW4vc2g6IDE6IHNjcmlwdHMvbW9kL21vZHBvc3Q6IG5vdCBmb3VuZDxicj5t
YWtlWzJdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUubW9kcG9zdDoxMzM6IC9ob21lL2FnbC9BdXRv
bW90aXZlL0FEQVNfSW5mb3RhaW5tZW50L3Byb2plY3QvQXBwbGljYXRpb24vWGVuL0ZyYW1lYnVm
ZmVyL01vZHVsZS5zeW12ZXJzXSBFcnJvciAxMjc8YnI+bWFrZVsxXTogKioqIFtNYWtlZmlsZTox
ODEzOiBtb2R1bGVzXSBFcnJvciAyPGJyPm1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5ICYjMzk7
L29wdC9wb2t5LzQuMC41L3N5c3Jvb3RzL2NvcnRleGE3Mi1wb2t5LWxpbnV4L2xpYi9tb2R1bGVz
LzUuMTUuNzIteW9jdG8tc3RhbmRhcmQvYnVpbGQmIzM5Ozxicj5tYWtlOiAqKiogW01ha2VmaWxl
OjU6IGFsbF0gRXJyb3IgMjxicj5hZ2xAYWdsLU9wdGlQbGV4LTcwMTA6fi9BdXRvbW90aXZlL0FE
QVNfSW5mb3RhaW5tZW50L3Byb2plY3QvQXBwbGljYXRpb24vWGVuL0ZyYW1lYnVmZmVyJCBscyAt
bDxicj50b3RhbCAzMjQ8YnI+LXJ3eHJ3eHJ3eCAxIGFnbCBhZ2wgwqAgwqAzNTkgRGVjIDEwIDIy
OjQxIE1ha2VmaWxlPGJyPi1ydy1ydy1yLS0gMSBhZ2wgYWdsIMKgIMKgIDkwIERlYyAxMCAyMjo0
OSBtb2R1bGVzLm9yZGVyPGJyPi1ydy1yLS1yLS0gMSBhZ2wgYWdsIMKgMTgzMzEgRGVjIMKgMSAy
MDozMiB4ZW4tZmJmcm9udC5jPGJyPi1ydy1ydy1yLS0gMSBhZ2wgYWdsIMKgIMKgIDkwIERlYyAx
MCAyMjo0OSB4ZW4tZmJmcm9udC5tb2Q8YnI+LXJ3LXJ3LXItLSAxIGFnbCBhZ2wgMjk3ODMyIERl
YyAxMCAyMjo0OSB4ZW4tZmJmcm9udC5vPGJyPmFnbEBhZ2wtT3B0aVBsZXgtNzAxMDp+L0F1dG9t
b3RpdmUvQURBU19JbmZvdGFpbm1lbnQvcHJvamVjdC9BcHBsaWNhdGlvbi9YZW4vRnJhbWVidWZm
ZXIkIGZpbGUgeGVuLWZiZnJvbnQubzxicj54ZW4tZmJmcm9udC5vOiBFTEYgNjQtYml0IExTQiBy
ZWxvY2F0YWJsZSwgQVJNIGFhcmNoNjQsIHZlcnNpb24gMSAoU1lTViksIHdpdGggZGVidWdfaW5m
bywgbm90IHN0cmlwcGVkPGJyPmFnbEBhZ2wtT3B0aVBsZXgtNzAxMDp+L0F1dG9tb3RpdmUvQURB
U19JbmZvdGFpbm1lbnQvcHJvamVjdC9BcHBsaWNhdGlvbi9YZW4vRnJhbWVidWZmZXIkPC9iPjxi
cj48YnI+SSBoYXZlIGNvbm5lY3RlZCBhIEhETUkgYmFzZWQgMTk4MHgxMDI0IHJlc29sdXRpb24g
ZGlzcGxheSBzY3JlZW4gdG8gcmFzcGJlcnJ5cGk0IGZvciB0ZXN0aW5nIHB1cnBvc2VzLiBJIGhv
cGUgY29ubmVjdGluZyB0aGlzIGRpc3BsYXkgdG8gcnBpNCBzaG91bGQgYmUgb2suPGJyPjxicj5J
cyB0aGVyZSBhbnkgb3RoZXIgd2F5IHdlIGNhbiBjb25uZWN0IGFsc28gZm9yIGRldGFpbGVkIGRp
c2N1c3Npb24gb24gdGhlIGRpc3BsYXkgYnJpbmd1cCBpc3N1ZT8gVGhpcyB3aWxsIHJlYWxseSBo
ZWxwIHRvIHJlc29sdmUgdGhpcyBpc3N1ZS48YnI+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFua3Mg
JmFtcDsgUmVnYXJkcyw8L2Rpdj48ZGl2PlZpcHVsIEt1bWFyPC9kaXY+PC9kaXY+PGJyPjxkaXYg
Y2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24g
RnJpLCBEZWMgMiwgMjAyMiBhdCAxOjAyIEFNIFN0ZWZhbm8gU3RhYmVsbGluaSAmbHQ7PGEgaHJl
Zj0ibWFpbHRvOnNzdGFiZWxsaW5pQGtlcm5lbC5vcmciPnNzdGFiZWxsaW5pQGtlcm5lbC5vcmc8
L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBz
dHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2Io
MjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPk9uIFRodSwgMSBEZWMgMjAyMiwgVmlwdWwg
U3VuZWphIHdyb3RlOjxicj4NCiZndDsgSGkgU3RlZmFubyw8YnI+DQomZ3Q7IFRoYW5rcyE8YnI+
DQomZ3Q7IDxicj4NCiZndDsgSSBhbSBleHBsb3JpbmcgYm90aCBvcHRpb25zIGhlcmUsIG1vZGlm
aWNhdGlvbiBvZiBmcmFtZWJ1ZmZlciBzb3VyY2UgZmlsZSAmYW1wOyBzZXR0aW5nIHVwIHgxMXZu
YyBzZXJ2ZXIgaW4gZ3Vlc3QuPGJyPg0KJmd0OyBPdGhlciB0aGFuIHRoZXNlIEkgd291bGQgbGlr
ZSB0byBzaGFyZSBhIGZldyBmaW5kaW5ncyB3aXRoIHlvdS48YnI+DQomZ3Q7IDxicj4NCiZndDsg
MS4gSWYgaSBrZWVwICZxdW90O0NPTkZJR19YRU5fRkJERVZfRlJPTlRFTkQ9eSZxdW90OyB0aGVu
IHhlbi1mYmZyb250LmtvIGlzIG5vdCBnZW5lcmF0aW5nIGJ1dCBpZiBpIGtlZXAgJnF1b3Q7Q09O
RklHX1hFTl9GQkRFVl9GUk9OVEVORD1tJnF1b3Q7PGJyPg0KJmd0OyB0aGVuIGNvdWxkIHNlZSB4
ZW4tZmJmcm9udC5rbyAmYW1wOyBpdHMgbG9hZGluZyBhbHNvLiBTYW1lIHRoaW5ncyB3aXRoIG90
aGVyIGZyb250ZW5kL2JhY2tlbmQgZHJpdmVycyBhbHNvLiBEbyB3ZSBuZWVkIHRvIGNvbmZpZ3Vy
ZcKgdGhlc2U8YnI+DQomZ3Q7IGRyaXZlcnMgYXMgYSBtb2R1bGUobSkgb25seT88YnI+DQo8YnI+
DQp4ZW4tZmJmcm9udCBzaG91bGQgd29yayBib3RoIGFzIGEgbW9kdWxlICh4ZW4tZmJmcm9udC5r
bykgb3IgYnVpbHQtaW48YnI+DQooQ09ORklHX1hFTl9GQkRFVl9GUk9OVEVORD15KS48YnI+DQo8
YnI+DQo8YnI+DQo8YnI+DQomZ3Q7IDIuIEkgY291bGQgc2VlIHhlbnN0b3JlZCBzZXJ2aWNlIGlz
IHJ1bm5pbmcgZm9yIHRoZSBob3N0IGJ1dCBpdCYjMzk7cyBhbHdheXMgZmFpbGluZyBmb3IgdGhl
IGd1ZXN0wqBtYWNoaW5lLiBJIGNvdWxkIHNlZSBpdCBpbiBib290dXAgbG9ncyAmYW1wOyB2aWE8
YnI+DQomZ3Q7IHN5c3RlbWN0bCBzdGF0dXMgYWxzby48YnI+DQo8YnI+DQpUaGF0IGlzIG5vcm1h
bC4geGVuc3RvcmVkIGlzIG9ubHkgbWVhbnQgdG8gYmUgcnVuIGluIERvbTAsIG5vdCBpbiB0aGU8
YnI+DQpkb21Vcy4gSWYgeW91IHVzZSB0aGUgc2FtZSByb290ZnMgZm9yIERvbTAgYW5kIERvbVUg
dGhlbiB4ZW5zdG9yZWQgd2lsbDxicj4NCmZhaWwgc3RhcnRpbmcgaW4gdGhlIERvbVUgKGJ1dCBz
aG91bGQgc3VjY2VlZCBpbiBEb20wKSwgd2hpY2ggaXMgd2hhdCB3ZTxicj4NCndhbnQuPGJyPg0K
PGJyPg0KSWYgeW91IHJ1biAmcXVvdDt4ZW5zdG9yZS1scyZxdW90OyBpbiBEb20wLCB5b3UmIzM5
O2xsIHNlZSBhIGJ1bmNoIG9mIGVudHJpZXMsPGJyPg0KaW5jbHVkaW5nIHNvbWUgb2YgdGhlbSBy
ZWxhdGVkIHRvICZxdW90O3ZmYiZxdW90OyB3aGljaCBpcyB0aGUgdmlydHVhbCBmcmFtZWJ1ZmZl
cjxicj4NCnByb3RvY29sLiBZb3Ugc2hvdWxkIGFsc28gc2VlIGFuIGVudHJ5IGNhbGxlZCAmcXVv
dDtzdGF0ZSZxdW90OyBzZXQgdG8gJnF1b3Q7NCZxdW90OyB3aGljaDxicj4NCm1lYW5zICZxdW90
O2Nvbm5lY3RlZCZxdW90Oy4gc3RhdGUgPSA0IGlzIHVzdWFsbHkgd2hlbiBldmVyeXRoaW5nIHdv
cmtzLiBOb3JtYWxseTxicj4NCndoZW4gdGhpbmdzIGRvbiYjMzk7dCB3b3JrIHN0YXRlICE9IDQu
PGJyPg0KPGJyPg0KPGJyPg0KPGJyPg0KJmd0OyBCZWxvdyBhcmUgdGhlIGxvZ3M6PGJyPg0KJmd0
OyBbIMKgT0sgwqBdIFJlYWNoZWQgdGFyZ2V0IEJhc2ljIFN5c3RlbS48YnI+DQomZ3Q7IFsgwqBP
SyDCoF0gU3RhcnRlZCBLZXJuZWwgTG9nZ2luZyBTZXJ2aWNlLjxicj4NCiZndDsgWyDCoE9LIMKg
XSBTdGFydGVkIFN5c3RlbSBMb2dnaW5nIFNlcnZpY2UuPGJyPg0KJmd0OyDCoCDCoCDCoCDCoCDC
oFN0YXJ0aW5nIEQtQnVzIFN5c3RlbSBNZXNzYWdlIEJ1cy4uLjxicj4NCiZndDsgwqAgwqAgwqAg
wqAgwqBTdGFydGluZyBVc2VyIExvZ2luIE1hbmFnZW1lbnQuLi48YnI+DQomZ3Q7IMKgIMKgIMKg
IMKgIMKgU3RhcnRpbmcgUGVybWl0IFVzZXIgU2Vzc2lvbnMuLi48YnI+DQomZ3Q7IMKgIMKgIMKg
IMKgIMKgU3RhcnRpbmcgVGhlIFhlbiB4ZW5zdG9yZS4uLjxicj4NCiZndDsgwqAgwqAgwqAgwqAg
wqBTdGFydGluZyBPcGVuU1NIIEtleSBHZW5lcmF0aW9uLi4uPGJyPg0KJmd0OyBbRkFJTEVEXSBG
YWlsZWQgdG8gc3RhcnQgVGhlIFhlbiB4ZW5zdG9yZS48YnI+DQomZ3Q7IFNlZSAmIzM5O3N5c3Rl
bWN0bCBzdGF0dXMgeGVuc3RvcmVkLnNlcnZpY2UmIzM5OyBmb3IgZGV0YWlscy48YnI+DQomZ3Q7
IFtERVBFTkRdIERlcGVuZGVuY3kgZmFpbGVkIGZvciBxZW11IGZvciB4ZW4gZG9tMCBkaXNrIGJh
Y2tlbmQuPGJyPg0KJmd0OyBbREVQRU5EXSBEZXBlbmRlbmN5IGZhaWxlZCBmb3IgWGVuZOKApnAg
Z3Vlc3RzIG9uIGJvb3QgYW5kIHNodXRkb3duLjxicj4NCiZndDsgW0RFUEVORF0gRGVwZW5kZW5j
eSBmYWlsZWQgZm9yIHhlbi3igKZkZXMsIEpTT04gY29uZmlndXJhdGlvbiBzdHViKS48YnI+DQom
Z3Q7IFtERVBFTkRdIERlcGVuZGVuY3kgZmFpbGVkIGZvciBYZW5j4oCmZ3Vlc3QgY29uc29sZXMg
YW5kIGh5cGVydmlzb3IuPGJyPg0KJmd0OyBbIMKgT0sgwqBdIEZpbmlzaGVkIFBlcm1pdCBVc2Vy
IFNlc3Npb25zLjxicj4NCiZndDsgWyDCoE9LIMKgXSBTdGFydGVkIEdldHR5IG9uIHR0eTEuPGJy
Pg0KJmd0OyBbIMKgT0sgwqBdIFN0YXJ0ZWQgU2VyaWFsIEdldHR5IG9uIGh2YzAuPGJyPg0KJmd0
OyBbIMKgT0sgwqBdIFN0YXJ0ZWQgU2VyaWFsIEdldHR5IG9uIHR0eVMwLjxicj4NCiZndDsgWyDC
oE9LIMKgXSBSZWFjaGVkIHRhcmdldCBMb2dpbiBQcm9tcHRzLjxicj4NCiZndDsgwqAgwqAgwqAg
wqAgwqBTdGFydGluZyBYZW4td2F0Y2hkb2cgLSBydW4geGVuIHdhdGNoZG9nIGRhZW1vbi4uLjxi
cj4NCiZndDsgWyDCoE9LIMKgXSBTdGFydGVkIEQtQnVzIFN5c3RlbSBNZXNzYWdlIEJ1cy48YnI+
DQomZ3Q7IFsgwqBPSyDCoF0gU3RhcnRlZCBYZW4td2F0Y2hkb2cgLSBydW4geGVuIHdhdGNoZG9n
IGRhZW1vbi48YnI+DQomZ3Q7IFsgwqBPSyDCoF0gRmluaXNoZWQgT3BlblNTSCBLZXkgR2VuZXJh
dGlvbi48YnI+DQomZ3Q7IFsgwqBPSyDCoF0gU3RhcnRlZCBVc2VyIExvZ2luIE1hbmFnZW1lbnQu
PGJyPg0KJmd0OyBbIMKgT0sgwqBdIFJlYWNoZWQgdGFyZ2V0IE11bHRpLVVzZXIgU3lzdGVtLjxi
cj4NCiZndDsgwqAgwqAgwqAgwqAgwqBTdGFydGluZyBSZWNvcmQgUnVubGV2ZWwgQ2hhbmdlIGlu
IFVUTVAuLi48YnI+DQomZ3Q7IFsgwqBPSyDCoF0gRmluaXNoZWQgUmVjb3JkIFJ1bmxldmVsIENo
YW5nZSBpbiBVVE1QLjxicj4NCiZndDsgZmJjb246IFRha2luZyBvdmVyIGNvbnNvbGU8YnI+DQom
Z3Q7IDxicj4NCiZndDsgUG9reSAoWW9jdG8gUHJvamVjdCBSZWZlcmVuY2UgRGlzdHJvKSA0LjAu
NCByYXNwYmVycnlwaTQtNjQgaHZjMDxicj4NCiZndDsgPGJyPg0KJmd0OyByYXNwYmVycnlwaTQt
NjQgbG9naW46IHJvb3Q8YnI+DQomZ3Q7IHJvb3RAcmFzcGJlcnJ5cGk0LTY0On4jPGJyPg0KJmd0
OyByb290QHJhc3BiZXJyeXBpNC02NDp+Izxicj4NCiZndDsgcm9vdEByYXNwYmVycnlwaTQtNjQ6
fiMgc3lzdGVtY3RsIHN0YXR1cyB4ZW5zdG9yZWQuc2VydmljZTxicj4NCiZndDsgeCB4ZW5zdG9y
ZWQuc2VydmljZSAtIFRoZSBYZW4geGVuc3RvcmU8YnI+DQomZ3Q7IMKgIMKgIMKgTG9hZGVkOiBs
b2FkZWQgKC9saWIvc3lzdGVtZC9zeXN0ZW0veGVuc3RvcmVkLnNlcnZpY2U7IGVuYWJsZWQ7IHZl
bmRvciBwcmVzZXQ6IGVuYWJsZWQpPGJyPg0KJmd0OyDCoCDCoCDCoEFjdGl2ZTogZmFpbGVkIChS
ZXN1bHQ6IGV4aXQtY29kZSkgc2luY2UgVGh1IDIwMjItMTItMDEgMDY6MTI6MDUgVVRDOyAyNnMg
YWdvPGJyPg0KJmd0OyDCoCDCoCBQcm9jZXNzOiAxOTUgRXhlY1N0YXJ0UHJlPS9iaW4vZ3JlcCAt
cSBjb250cm9sX2QgL3Byb2MveGVuL2NhcGFiaWxpdGllcyAoY29kZT1leGl0ZWQsIHN0YXR1cz0x
L0ZBSUxVUkUpPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IERlYyAwMSAwNjoxMjowNCByYXNwYmVycnlw
aTQtNjQgc3lzdGVtZFsxXTogU3RhcnRpbmcgVGhlIFhlbiB4ZW5zdG9yZS4uLjxicj4NCiZndDsg
RGVjIDAxIDA2OjEyOjA1IHJhc3BiZXJyeXBpNC02NCBzeXN0ZW1kWzFdOiB4ZW5zdG9yZWQuc2Vy
dmljZTogQ29udHJvbCBwcm8uLi5VUkU8YnI+DQomZ3Q7IERlYyAwMSAwNjoxMjowNSByYXNwYmVy
cnlwaTQtNjQgc3lzdGVtZFsxXTogeGVuc3RvcmVkLnNlcnZpY2U6IEZhaWxlZCB3aXRoLi4uZSYj
Mzk7Ljxicj4NCiZndDsgRGVjIDAxIDA2OjEyOjA1IHJhc3BiZXJyeXBpNC02NCBzeXN0ZW1kWzFd
OiBGYWlsZWQgdG8gc3RhcnQgVGhlIFhlbiB4ZW5zdG9yZS48YnI+DQomZ3Q7IEhpbnQ6IFNvbWUg
bGluZXMgd2VyZSBlbGxpcHNpemVkLCB1c2UgLWwgdG8gc2hvdyBpbiBmdWxsLjxicj4NCiZndDsg
cm9vdEByYXNwYmVycnlwaTQtNjQ6fiPCoDxicj4NCiZndDsgPGJyPg0KJmd0OyBBbnkgaW5wdXQg
b24gdGhlc2U/PGJyPg0KJmd0OyA8YnI+DQomZ3Q7IFRoYW5rcyAmYW1wOyBSZWdhcmRzLDxicj4N
CiZndDsgVmlwdWwgS3VtYXI8YnI+DQomZ3Q7IDxicj4NCiZndDsgT24gV2VkLCBOb3YgMjMsIDIw
MjIgYXQgNTo0MSBBTSBTdGVmYW5vIFN0YWJlbGxpbmkgJmx0OzxhIGhyZWY9Im1haWx0bzpzc3Rh
YmVsbGluaUBrZXJuZWwub3JnIiB0YXJnZXQ9Il9ibGFuayI+c3N0YWJlbGxpbmlAa2VybmVsLm9y
ZzwvYT4mZ3Q7IHdyb3RlOjxicj4NCiZndDvCoCDCoCDCoCDCoEhpIFZpcHVsLDxicj4NCiZndDsg
PGJyPg0KJmd0O8KgIMKgIMKgIMKgSSBjYW5ub3Qgc3BvdCBhbnkgaXNzdWUgaW4gdGhlIGNvbmZp
Z3VyYXRpb24sIGluIHBhcnRpY3VhbCB5b3UgaGF2ZTo8YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDC
oCDCoCDCoENPTkZJR19YRU5fRkJERVZfRlJPTlRFTkQ9eTxicj4NCiZndDsgPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgd2hpY2ggaXMgd2hhdCB5b3UgbmVlZC48YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDC
oCDCoCDCoFRoZSBvbmx5IHRoaW5nIEkgY2FuIHN1Z2dlc3QgaXMgdG8gYWRkIHByaW50a3MgdG8g
dGhlIExpbnV4IGZyb250ZW5kPGJyPg0KJmd0O8KgIMKgIMKgIMKgZHJpdmVyICh0aGUgb25lIHJ1
bm5pbmcgaW4gdGhlIGRvbVUpIHdoaWNoIGlzPGJyPg0KJmd0O8KgIMKgIMKgIMKgZHJpdmVycy92
aWRlby9mYmRldi94ZW4tZmJmcm9udC5jIGFuZCBwcmludGZzIHRvIHRoZSBRRU1VIGJhY2tlbmQ8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAocnVubmluZyBpbiBEb20wKSB3aGljaCBpcyBody9kaXNwbGF5
L3hlbmZiLmMgdG8gZmlndXJlIG91dCB3aGF0IGlzPGJyPg0KJmd0O8KgIMKgIMKgIMKgZ29pbmcg
b24uPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoCDCoEFsdGVybmF0aXZl
bHksIHlvdSBjYW4gc2V0dXAgUFYgbmV0d29yayB3aXRoIHRoZSBkb21VLCBzdWNoIGFzOjxicj4N
CiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgIMKgwqAgdmlmPVsmIzM5OyYjMzk7XTxicj4NCiZndDsg
PGJyPg0KJmd0O8KgIMKgIMKgIMKgYW5kIHRoZW4gcnVuIHgxMSBhbmQgYSB4MTF2bmMgc2VydmVy
IGluIHlvdXIgZG9tVS4gWW91IHNob3VsZCBiZSBhYmxlIHRvPGJyPg0KJmd0O8KgIMKgIMKgIMKg
Y29ubmVjdCB0byBpdCB1c2luZyB2bmN2aWV3ZXIgYXQgdGhlIG5ldHdvcmsgSVAgb2YgeW91ciBk
b21VLjxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgIMKgQmFzaWNhbGx5IHlvdSBhcmUgc2tp
cHBpbmcgdGhlIHByb2JsZW0gYmVjYXVzZSBpbnN0ZWFkIG9mIHVzaW5nIHRoZSBQVjxicj4NCiZn
dDvCoCDCoCDCoCDCoGZyYW1lYnVmZmVyIHByb3RvY29sLCB5b3UganVzdCB1c2UgVk5DIG92ZXIg
dGhlIG5ldHdvcmsgd2l0aCB0aGUgZG9tVS48YnI+DQomZ3Q7IDxicj4NCiZndDsgPGJyPg0KJmd0
O8KgIMKgIMKgIMKgQ2hlZXJzLDxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgIMKgU3RlZmFu
bzxicj4NCiZndDsgPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqAgwqBPbiBUdWUsIDIyIE5v
diAyMDIyLCBWaXB1bCBTdW5lamEgd3JvdGU6PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyBIaSBT
dGVmYW5vLDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgVGhhbmtzIGZvciB0aGXCoHN1cHBvcnQh
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgTG9va3Mg
bGlrZSBJIGhhdmUgdHJpZWQgYWxsIHRoZSBjb21iaW5hdGlvbnPCoCZhbXA7IHBvc3NpYmxlIHdh
eXMgdG8gZ2V0IGRpc3BsYXkgdXAgYnV0IGZhaWxlZC4gSXMgdGhlcmUgYW55IGRvY3VtZW50IG9y
IHBkZiBmb3I8YnI+DQomZ3Q7wqAgwqAgwqAgwqBwb3J0aW5nIHhlbiBvbjxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDsgcmFzcGJlcnJ5cGk0Ljxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgSSBjb3Vs
ZCBmaW5kIGxvdCYjMzk7cyBvZiBsaW5rcyB0ZWxsaW5nIHRoZSBzYW1lIGJ1dCBjb3VsZG4mIzM5
O3Qgc2VlIGFueSBvZmZpY2lhbCB1c2VyIGd1aWRlIG9yIGRvY3VtZW50IGZyb20gdGhlIHhlbiBj
b21tdW5pdHkgb248YnI+DQomZ3Q7wqAgwqAgwqAgwqB0aGUgc2FtZS4gSWY8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IHRoZXJlIGlzIHNvbWV0aGluZyB0byByZWZlcsKgPGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0OyB0byBwbGVhc2Ugc2hhcmUgd2l0aCBtZS48YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IEkgYW0gYXR0YWNoaW5nIHRoZSBrZXJuZWwgY29uZmlndXJhdGlvbiBmaWxlIGFsc28sIGp1
c3QgdGFrZSBhIGxvb2sgaWYgaSBoYXZlIG1pc3NlZCBhbnl0aGluZy48YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IEFueSBvdGhlciBzdWdnZXN0aW9ucyBvciBpbnB1dCBmcm9tIHlvdXIgZW5kIGNv
dWxkIGJlIHJlYWxseSBoZWxwZnVsPzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IFJlZ2FyZHMsPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyBWaXB1bCBL
dW1hcjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IE9u
IEZyaSwgTm92IDExLCAyMDIyIGF0IDY6NDAgQU0gU3RlZmFubyBTdGFiZWxsaW5pICZsdDs8YSBo
cmVmPSJtYWlsdG86c3N0YWJlbGxpbmlAa2VybmVsLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc8L2E+Jmd0OyB3cm90ZTo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqBIaSBWaXB1bCw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5LiBGcm9tIHRo
ZSBlYXJsaWVyIGxvZ3MgdGhhdCB5b3Ugc2VudCwgaXQgbG9va3M8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqBsaWtlIGV2ZXJ5dGhpbmcgc2hvdWxkIGJlIHdvcmtpbmcgY29ycmVj
dGx5LiBTcGVjaWZpY2FsbHk6PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoMKgwqAgwqAgdmZiID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgwqDCoCDCoCDCoDEgPSAmcXVvdDsmcXVvdDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqDCoMKgIMKgIMKgIDAgPSAmcXVvdDsmcXVv
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqDCoMKgIMKgIMKgIMKgZnJvbnRl
bmQgPSAmcXVvdDsvbG9jYWwvZG9tYWluLzEvZGV2aWNlL3ZmYi8wJnF1b3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgwqDCoCDCoCDCoCDCoGZyb250ZW5kLWlkID0gJnF1b3Q7
MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoMKgwqAgwqAgwqAgwqBv
bmxpbmUgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
wqDCoCDCoCDCoCDCoHN0YXRlID0gJnF1b3Q7NCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoMKgwqAgwqAgwqAgwqB2bmMgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgwqDCoCDCoCDCoCDCoHZuY2xpc3RlbiA9ICZxdW90OzEy
Ny4wLjAuMSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoMKgwqAgwqAg
wqAgwqB2bmNkaXNwbGF5ID0gJnF1b3Q7MCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoMKgwqAgwqAgwqAgwqB2bmN1bnVzZWQgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgwqDCoCDCoCDCoCDCoHNkbCA9ICZxdW90OzAmcXVv
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqDCoMKgIMKgIMKgIMKgb3Blbmds
ID0gJnF1b3Q7MCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoMKgwqAg
wqAgwqAgwqBmZWF0dXJlLXJlc2l6ZSA9ICZxdW90OzEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqDCoMKgIMKgIMKgIMKgaG90cGx1Zy1zdGF0dXMgPSAmcXVvdDtjb25u
ZWN0ZWQmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqDCoMKgIMKgIMKg
IMKgcmVxdWVzdC11cGRhdGUgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoHN0YXRlICZxdW90OzQmcXVvdDsg
bWVhbnMgJnF1b3Q7Y29ubmVjdGVkJnF1b3Q7LiBTbyBJIHdvdWxkIGV4cGVjdCB0aGF0IHlvdSBz
aG91bGQgYmUgYWJsZTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoHRvIGNvbm5l
Y3QgdG8gdGhlIHZuYyBzZXJ2ZXIgdXNpbmcgdm5jdmlld2VyLiBZb3UgbWlnaHQgbm90IHNlZSBh
bnl0aGluZzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoChibGFjayBzY3JlZW4p
IGJ1dCB5b3Ugc2hvdWxkIGRlZmluaXRlbHkgYmUgYWJsZSB0byBjb25uZWN0Ljxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBJIHdvdWxk
biYjMzk7dCB0cnkgdG8gbGF1bmNoIHgxMSBpbiB0aGUgZ3Vlc3QganVzdCB5ZXQuIGZiY29uIGlu
IExpbnV4IGlzPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgZW5vdWdoIHRvIHJl
bmRlciBzb21ldGhpbmcgb24gdGhlIHNjcmVlbi4gWW91IHNob3VsZCBiZSBhYmxlIHRvIHNlZSB0
aGU8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBMaW51eCB0ZXh0LWJhc2VkIGNv
bnNvbGUgcmVuZGVyZWQgZ3JhcGhpY2FsbHksIGNvbm5lY3RpbmcgdG8gaXQgdmlhIHZuYy48YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
U29ycnkgZm9yIHRoZSBiYXNpYyBxdWVzdGlvbiwgYnV0IGhhdmUgeW91IHRyaWVkIGFsbCB0aGUg
Zm9sbG93aW5nPzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqB2bmN2aWV3ZXIgPGEgaHJlZj0iaHR0cDovLzEyNy4wLjAuMTowIiByZWw9
Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj4xMjcuMC4wLjE6MDwvYT48YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqB2bmN2aWV3ZXIgPGEgaHJlZj0iaHR0cDovLzEyNy4wLjAu
MToxIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj4xMjcuMC4wLjE6MTwvYT48YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqB2bmN2aWV3ZXIgPGEgaHJlZj0iaHR0cDov
LzEyNy4wLjAuMToyIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj4xMjcuMC4wLjE6
MjwvYT48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqB2bmN2aWV3ZXIgPGEgaHJl
Zj0iaHR0cDovLzEyNy4wLjAuMTo1OTAwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij4xMjcuMC4wLjE6NTkwMDwvYT48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqB2
bmN2aWV3ZXIgPGEgaHJlZj0iaHR0cDovLzEyNy4wLjAuMTo1OTAxIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj4xMjcuMC4wLjE6NTkwMTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqB2bmN2aWV3ZXIgPGEgaHJlZj0iaHR0cDovLzEyNy4wLjAuMTo1OTAyIiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj4xMjcuMC4wLjE6NTkwMjwvYT48YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgR2l2
ZW4gdGhhdCBmcm9tIHRoZSB4ZW5zdG9yZS1scyBsb2dzIGV2ZXJ5dGhpbmcgc2VlbXMgdG8gd29y
ayBjb3JyZWN0bHk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBJIGFtIG5vdCBz
dXJlIHdoYXQgZWxzZSB0byBzdWdnZXN0LiBZb3UgbWlnaHQgaGF2ZSB0byBhZGQgcHJpbnRmIHRv
IFFFTVU8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqB1aS92bmMuYyBhbmQgaHcv
ZGlzcGxheS94ZW5mYi5jIHRvIHNlZSB3aGF0IGlzIGdvaW5nIHdyb25nLjxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBDaGVlcnMsPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oFN0ZWZhbm88YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoE9uIE1vbiwgNyBOb3YgMjAyMiwg
VmlwdWwgU3VuZWphIHdyb3RlOjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDsgSGkgU3RlZmFubyw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFRo
YW5rcyE8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBBbnkgaW5wdXQgZnVydGhlciBvbiAmcXVvdDt4
ZW5zdG9yZS1scyZxdW90OyBsb2dzPzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEkgYW0gdHJ5aW5n
IHRvIHJ1biB0aGUgeDB2bmNzZXJ2ZXIgJmFtcDsgeDExdm5jIHNlcnZlciBtYW51YWxseSBvbiBn
dWVzdCBtYWNoaW5lKHhlbl9ndWVzdF9pbWFnZV9taW5pbWFsKSBpbWFnZSBidXQgaXQmIzM5O3M8
YnI+DQomZ3Q7wqAgwqAgwqAgwqBmYWlsaW5nPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgd2l0aCB0aGUgYmVsb3c8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IGVycm9yLjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHJvb3RAcmFzcGJlcnJ5cGk0LTY0Oi91
c3IvYmluIyB4MHZuY3NlcnZlcjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDsgeDB2bmNzZXJ2ZXI6IHVuYWJsZSB0byBvcGVuIGRpc3BsYXkgJnF1b3Q7JnF1b3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyByb290QHJhc3BiZXJyeXBpNC02NDov
dXNyL2JpbiM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHJvb3RAcmFz
cGJlcnJ5cGk0LTY0Oi91c3IvYmluIyB4MTF2bmM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDsgI0BAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBA
QEBAQEBAQEAjPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDsgI0AgwqAqKiDCoFdBUk5JTkcgwqAqKiDCoFdBUk5JTkcgwqAqKiDCoFdBUk5J
TkcgwqAqKiDCoFdBUk5JTkcgwqAqKiDCoCBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDsgI0AgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQCM8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgIMKgIMKgIMKgWU9VIEFSRSBSVU5O
SU5HIFgxMVZOQyBXSVRIT1VUIEEgUEFTU1dPUkQhISDCoCDCoCDCoCDCoEAjPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgI0AgwqBUaGlz
IG1lYW5zIGFueW9uZSB3aXRoIG5ldHdvcmsgYWNjZXNzIHRvIHRoaXMgY29tcHV0ZXIgwqAgQCM8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgbWF5IGJlIGFibGUg
dG8gdmlldyBhbmQgY29udHJvbCB5b3VyIGRlc2t0b3AuIMKgIMKgIMKgIMKgIMKgIMKgQCM8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIEAjPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAj
QCAmZ3Q7Jmd0OyZndDsgSWYgeW91IGRpZCBub3QgbWVhbiB0byBkbyB0aGlzIFByZXNzIENUUkwt
QyBub3chISAmbHQ7Jmx0OyZsdDsgQCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7ICNAIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIEAjPGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAjQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBA
QEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIEAjPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDCoFlvdSBjYW4gY3JlYXRlIGFu
IHgxMXZuYyBwYXNzd29yZCBmaWxlIGJ5IHJ1bm5pbmc6IMKgIMKgIMKgIEAjPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgI0AgwqAgwqAg
wqAgeDExdm5jIC1zdG9yZXBhc3N3ZCBwYXNzd29yZCAvcGF0aC90by9wYXNzZmlsZSDCoCDCoCDC
oEAjPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDCoG9yIMKgIHgx
MXZuYyAtc3RvcmVwYXNzd2QgL3BhdGgvdG8vcGFzc2ZpbGUgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
QCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgb3IgwqAgeDEx
dm5jIC1zdG9yZXBhc3N3ZCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgI0AgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7ICNAIMKgKHRoZSBsYXN0IG9uZSB3aWxsIHVzZSB+Ly52bmMvcGFzc3dkKSDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEAjPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0OyAjQCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAIzxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgI0AgwqBhbmQgdGhlbiBzdGFydGluZyB4
MTF2bmMgdmlhOiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEAjPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsg
I0AgwqAgwqAgwqB4MTF2bmMgLXJmYmF1dGggL3BhdGgvdG8vcGFzc2ZpbGUgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDsgI0AgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQCM8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgYW4gZXhpc3Rpbmcgfi8udm5jL3Bhc3N3ZCBmaWxl
IGZyb20gYW5vdGhlciBWTkMgwqAgwqAgwqAgwqAgwqBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDsgI0AgwqBhcHBsaWNhdGlvbiB3aWxsIHdvcmsgZmluZSB0b28uIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQCM8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIEAj
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDCoFlvdSBjYW4gYWxz
byB1c2UgdGhlIC1wYXNzd2RmaWxlIG9yIC1wYXNzd2Qgb3B0aW9ucy4gwqAgwqAgQCM8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgKG5vdGUgLXBhc3N3ZCBpcyB1
bnNhZmUgaWYgbG9jYWwgdXNlcnMgYXJlIG5vdCB0cnVzdGVkKSDCoEAjPGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgI0AgwqBNYWtlIHN1
cmUgYW55IC1yZmJhdXRoIGFuZCAtcGFzc3dkZmlsZSBwYXNzd29yZCBmaWxlcyDCoCDCoEAjPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDCoGNhbm5vdCBiZSByZWFk
IGJ5IHVudHJ1c3RlZCB1c2Vycy4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQCM8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIEAjPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
OyAjQCDCoFVzZSB4MTF2bmMgLXVzZXB3IHRvIGF1dG9tYXRpY2FsbHkgdXNlIHlvdXIgwqAgwqAg
wqAgwqAgwqAgwqAgwqBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsg
I0AgwqB+Ly52bmMvcGFzc3dkIG9yIH4vLnZuYy9wYXNzd2RmaWxlIHBhc3N3b3JkIGZpbGVzLiDC
oCDCoCDCoCBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgI0AgwqAo
YW5kIHByb21wdCB5b3UgdG8gY3JlYXRlIH4vLnZuYy9wYXNzd2QgaWYgbmVpdGhlciDCoCDCoCDC
oCBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgI0AgwqBmaWxlIGV4
aXN0cy4pIMKgVW5kZXIgLXVzZXB3LCB4MTF2bmMgd2lsbCBleGl0IGlmIGl0IMKgIMKgIMKgQCM8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgY2Fubm90IGZpbmQg
YSBwYXNzd29yZCB0byB1c2UuIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IEAjPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgI0AgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQCM8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgRXZlbiB3aXRoIGEgcGFzc3dvcmQsIHRoZSBz
dWJzZXF1ZW50IFZOQyB0cmFmZmljIGlzIMKgIMKgIMKgQCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgc2VudCBpbiB0aGUgY2xlYXIuwqAgQ29uc2lkZXIgdHVu
bmVsbGluZyB2aWEgc3NoKDEpOiDCoCDCoCDCoEAjPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0OyAjQCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAIzxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgI0AgwqAgwqA8YSBocmVmPSJodHRwOi8v
d3d3LmthcmxydW5nZS5jb20veDExdm5jLyN0dW5uZWxsaW5nIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5odHRwOi8vd3d3LmthcmxydW5nZS5jb20veDExdm5jLyN0dW5uZWxsaW5n
PC9hPiDCoCDCoCDCoCDCoCDCoCDCoEAjPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0OyAjQCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAIzxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgI0AgwqBPciB1c2luZyB0aGUgeDExdm5jIFNTTCBv
cHRpb25zOiAtc3NsIGFuZCAtc3R1bm5lbCDCoCDCoCDCoCBAIzxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDsgI0AgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQCM8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgUGxlYXNlIFJlYWQg
dGhlIGRvY3VtZW50YXRpb24gZm9yIG1vcmUgaW5mbyBhYm91dCDCoCDCoCDCoCDCoEAjPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDCoHBhc3N3b3Jkcywgc2VjdXJp
dHksIGFuZCBlbmNyeXB0aW9uLiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAIzxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgI0AgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgQCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNA
IMKgIMKgPGEgaHJlZj0iaHR0cDovL3d3dy5rYXJscnVuZ2UuY29tL3gxMXZuYy9mYXEuaHRtbCNm
YXEtcGFzc3dkIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vd3d3Lmth
cmxydW5nZS5jb20veDExdm5jL2ZhcS5odG1sI2ZhcS1wYXNzd2Q8L2E+IMKgIMKgQCM8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIEAjPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDC
oFRvIGRpc2FibGUgdGhpcyB3YXJuaW5nIHVzZSB0aGUgLW5vcHcgb3B0aW9uLCBvciBwdXQgwqAg
wqAgQCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgJiMzOTtu
b3B3JiMzOTsgb24gYSBsaW5lIGluIHlvdXIgfi8ueDExdm5jcmMgZmlsZS4gwqAgwqAgwqAgwqAg
wqAgwqAgwqAgQCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIEAjPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0OyAjQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBA
QEBAQEBAQEBAQEBAQEBAQEBAQCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgMDkvMDMv
MjAxOCAxMjo1ODo0MSB4MTF2bmMgdmVyc2lvbjogMC45LjE2IGxhc3Rtb2Q6IDIwMTktMDEtMDUg
wqBwaWQ6IDQyNDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgMDkvMDMv
MjAxOCAxMjo1ODo0MSBYT3BlbkRpc3BsYXkoJnF1b3Q7JnF1b3Q7KSBmYWlsZWQuPGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAwOS8wMy8yMDE4IDEyOjU4OjQxIFRyeWlu
ZyBhZ2FpbiB3aXRoIFhBVVRITE9DQUxIT1NUTkFNRT1sb2NhbGhvc3QgLi4uPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAwOS8wMy8yMDE4IDEyOjU4OjQxPGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAwOS8wMy8yMDE4IDEyOjU4OjQxICoqKiBY
T3BlbkRpc3BsYXkgZmFpbGVkLiBObyAtZGlzcGxheSBvciBESVNQTEFZLjxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgMDkvMDMvMjAxOCAxMjo1ODo0MSAqKiogVHJ5aW5n
ICZxdW90OzowJnF1b3Q7IGluIDQgc2Vjb25kcy7CoCBQcmVzcyBDdHJsLUMgdG8gYWJvcnQuPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAwOS8wMy8yMDE4IDEyOjU4OjQx
ICoqKiAxIDIgMyA0PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAwOS8w
My8yMDE4IDEyOjU4OjQ1IFhPcGVuRGlzcGxheSgmcXVvdDs6MCZxdW90OykgZmFpbGVkLjxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgMDkvMDMvMjAxOCAxMjo1ODo0NSBU
cnlpbmcgYWdhaW4gd2l0aCBYQVVUSExPQ0FMSE9TVE5BTUU9bG9jYWxob3N0IC4uLjxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgMDkvMDMvMjAxOCAxMjo1ODo0NSBYT3Bl
bkRpc3BsYXkoJnF1b3Q7OjAmcXVvdDspIGZhaWxlZC48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IDA5LzAzLzIwMTggMTI6NTg6NDUgVHJ5aW5nIGFnYWluIHdpdGggdW5z
ZXQgWEFVVEhMT0NBTEhPU1ROQU1FIC4uLjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDsgMDkvMDMvMjAxOCAxMjo1ODo0NTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IDA5LzAz
LzIwMTggMTI6NTg6NDUgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAwOS8wMy8yMDE4IDEyOjU4OjQ1
ICoqKiBYT3BlbkRpc3BsYXkgZmFpbGVkICg6MCk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAqKiog
eDExdm5jIHdhcyB1bmFibGUgdG8gb3BlbiB0aGUgWCBESVNQTEFZOiAmcXVvdDs6MCZxdW90Oywg
aXQgY2Fubm90IGNvbnRpbnVlLjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDsgKioqIFRoZXJlIG1heSBiZSAmcXVvdDtYbGliOiZxdW90OyBlcnJvciBtZXNzYWdlcyBhYm92
ZSB3aXRoIGRldGFpbHMgYWJvdXQgdGhlIGZhaWx1cmUuPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsg
U29tZSB0aXBzIGFuZCBndWlkZWxpbmVzOjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICoqIEFuIFgg
c2VydmVyICh0aGUgb25lIHlvdSB3aXNoIHRvIHZpZXcpIG11c3QgYmUgcnVubmluZyBiZWZvcmUg
eDExdm5jIGlzPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoHN0
YXJ0ZWQ6IHgxMXZuYyBkb2VzIG5vdCBzdGFydCB0aGUgWCBzZXJ2ZXIuIMKgKGhvd2V2ZXIsIHNl
ZSB0aGUgLWNyZWF0ZTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAg
wqBvcHRpb24gaWYgdGhhdCBpcyB3aGF0IHlvdSByZWFsbHkgd2FudCkuPGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDsgKiogWW91IG11c3QgdXNlIC1kaXNwbGF5ICZsdDtkaXNwJmd0OywgLU9SLSBzZXQg
YW5kIGV4cG9ydCB5b3VyICRESVNQTEFZPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0OyDCoCDCoGVudmlyb25tZW50IHZhcmlhYmxlIHRvIHJlZmVyIHRvIHRoZSBkaXNwbGF5
IG9mIHRoZSBkZXNpcmVkIFggc2VydmVyLjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDsgwqAtIFVzdWFsbHkgdGhlIGRpc3BsYXkgaXMgc2ltcGx5ICZxdW90OzowJnF1b3Q7
IChpbiBmYWN0IHgxMXZuYyB1c2VzIHRoaXMgaWYgeW91IGZvcmdldDxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqB0byBzcGVjaWZ5IGl0KSwgYnV0IGluIHNvbWUg
bXVsdGktdXNlciBzaXR1YXRpb25zIGl0IGNvdWxkIGJlICZxdW90OzoxJnF1b3Q7LCAmcXVvdDs6
MiZxdW90Oyw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgb3Ig
ZXZlbiAmcXVvdDs6MTM3JnF1b3Q7LsKgIEFzayB5b3VyIGFkbWluaXN0cmF0b3Igb3IgYSBndXJ1
IGlmIHlvdSBhcmUgaGF2aW5nPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
OyDCoCDCoGRpZmZpY3VsdHkgZGV0ZXJtaW5pbmcgd2hhdCB5b3VyIFggRElTUExBWSBpcy48YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0OyAqKiBOZXh0LCB5b3UgbmVlZCB0byBoYXZlIHN1ZmZpY2llbnQg
cGVybWlzc2lvbnMgKFhhdXRob3JpdHkpPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0OyDCoCDCoHRvIGNvbm5lY3QgdG8gdGhlIFggRElTUExBWS4gwqAgSGVyZSBhcmUgc29t
ZSBUaXBzOjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgLSBPZnRlbiwgeW91IGp1c3QgbmVlZCB0
byBydW4geDExdm5jIGFzIHRoZSB1c2VyIGxvZ2dlZCBpbnRvIHRoZSBYIHNlc3Npb24uPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoFNvIG1ha2Ugc3VyZSB0byBi
ZSB0aGF0IHVzZXIgd2hlbiB5b3UgdHlwZSB4MTF2bmMuPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0OyDCoC0gQmVpbmcgcm9vdCBpcyB1c3VhbGx5IG5vdCBlbm91Z2ggYmVj
YXVzZSB0aGUgaW5jb3JyZWN0IE1JVC1NQUdJQy1DT09LSUU8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgZmlsZSBtYXkgYmUgYWNjZXNzZWQuwqAgVGhlIGNvb2tp
ZSBmaWxlIGNvbnRhaW5zIHRoZSBzZWNyZXQga2V5IHRoYXQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgYWxsb3dzIHgxMXZuYyB0byBjb25uZWN0IHRvIHRoZSBk
ZXNpcmVkIFggRElTUExBWS48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IMKgLSBZb3UgY2FuIGV4cGxpY2l0bHkgaW5kaWNhdGUgd2hpY2ggTUlULU1BR0lDLUNPT0tJRSBm
aWxlIHNob3VsZCBiZSB1c2VkPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
OyDCoCDCoGJ5IHRoZSAtYXV0aCBvcHRpb24sIGUuZy46PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoHgxMXZuYyAtYXV0aCAvaG9tZS9zb21ldXNlci8u
WGF1dGhvcml0eSAtZGlzcGxheSA6MDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgwqAgwqAgwqAgwqB4MTF2bmMgLWF1dGggL3RtcC8uZ2Rtem5kVmxSIC1kaXNwbGF5IDow
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoHlvdSBtdXN0IGhh
dmUgcmVhZCBwZXJtaXNzaW9uIGZvciB0aGUgYXV0aCBmaWxlLjxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqBTZWUgYWxzbyAmIzM5Oy1hdXRoIGd1ZXNzJiMzOTsg
YW5kICYjMzk7LWZpbmRhdXRoJiMzOTsgZGlzY3Vzc2VkIGJlbG93Ljxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7ICoqIElmIE5PIE9ORSBpcyBsb2dnZWQgaW50byBhbiBYIHNlc3Npb24geWV0LCBidXQg
dGhlcmUgaXMgYSBncmVldGVyIGxvZ2luPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0OyDCoCDCoHByb2dyYW0gbGlrZSAmcXVvdDtnZG0mcXVvdDssICZxdW90O2tkbSZxdW90
OywgJnF1b3Q7eGRtJnF1b3Q7LCBvciAmcXVvdDtkdGxvZ2luJnF1b3Q7IHJ1bm5pbmcsIHlvdSB3
aWxsIG5lZWQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgdG8g
ZmluZCBhbmQgdXNlIHRoZSByYXcgZGlzcGxheSBtYW5hZ2VyIE1JVC1NQUdJQy1DT09LSUUgZmls
ZS48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgU29tZSBleGFt
cGxlcyBmb3IgdmFyaW91cyBkaXNwbGF5IG1hbmFnZXJzOjxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IMKgIMKgIMKgZ2RtOiDCoCDCoCAtYXV0aCAvdmFyL2dkbS86MC5YYXV0aDxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLWF1dGggL3Zh
ci9saWIvZ2RtLzowLlhhdXRoPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
OyDCoCDCoCDCoGtkbTogwqAgwqAgLWF1dGggL3Zhci9saWIva2RtL0E6MC1jcldrNzI8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgIMKgIMKgIMKgIC1h
dXRoIC92YXIvcnVuL3hhdXRoL0E6MC1jcldrNzI8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IMKgIMKgIMKgeGRtOiDCoCDCoCAtYXV0aCAvdmFyL2xpYi94ZG0vYXV0aGRp
ci9hdXRoZmlsZXMvQTowLVhRdmFKazxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgwqAgwqAgwqBkdGxvZ2luOiAtYXV0aCAvdmFyL2R0L0E6MC1VZ2FhWGE8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0OyDCoCDCoFNvbWV0aW1lcyB0aGUgY29tbWFuZCAmcXVvdDtwcyB3d3d3YXV4
IHwgZ3JlcCBhdXRoJnF1b3Q7IGNhbiByZXZlYWwgdGhlIGZpbGUgbG9jYXRpb24uPGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgwqAgwqBTdGFydGluZyB3aXRoIHgxMXZuYyAwLjkuOSB5b3UgY2FuIGhh
dmUgaXQgdHJ5IHRvIGd1ZXNzIGJ5IHVzaW5nOjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKg
IMKgIMKgIMKgIMKgIMKgIC1hdXRoIGd1ZXNzPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAo
c2VlIGFsc28gdGhlIHgxMXZuYyAtZmluZGF1dGggb3B0aW9uLik8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0OyDCoCDCoE9ubHkgcm9vdCB3aWxsIGhhdmUgcmVhZCBwZXJtaXNzaW9uIGZvciB0aGUgZmls
ZSwgYW5kIHNvIHgxMXZuYyBtdXN0IGJlIHJ1bjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDsgwqAgwqBhcyByb290IChvciBjb3B5IGl0KS7CoCBUaGUgcmFuZG9tIGNoYXJh
Y3RlcnMgaW4gdGhlIGZpbGVuYW1lcyB3aWxsIG9mIGNvdXJzZTxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqBjaGFuZ2UgYW5kIHRoZSBkaXJlY3RvcnkgdGhlIGNv
b2tpZSBmaWxlIHJlc2lkZXMgaW4gaXMgc3lzdGVtIGRlcGVuZGVudC48YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0OyBTZWUgYWxzbzogPGEgaHJlZj0iaHR0cDovL3d3dy5rYXJscnVuZ2UuY29tL3gxMXZu
Yy9mYXEuaHRtbCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL3d3dy5r
YXJscnVuZ2UuY29tL3gxMXZuYy9mYXEuaHRtbDwvYT48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBS
ZWdhcmRzLDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgVmlwdWwgS3Vt
YXI8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBPbiBUaHUsIE5vdiAzLCAyMDIyIGF0IDEwOjI3IFBN
IFZpcHVsIFN1bmVqYSAmbHQ7PGEgaHJlZj0ibWFpbHRvOnZzdW5lamE2M0BnbWFpbC5jb20iIHRh
cmdldD0iX2JsYW5rIj52c3VuZWphNjNAZ21haWwuY29tPC9hPiZndDsgd3JvdGU6PGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgSGkgU3RlZmFubyw8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFRoYW5rcyE8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0OyBJIHVzZWQgeGVuLWd1ZXN0LWltYWdlLW1pbmltYWwoc2ltcGxlIGNvbnNvbGUg
YmFzZWQgaW1hZ2UpIGFzIGEgZ3Vlc3Qgd2l0aCBmYmNvbiAmYW1wOyBmYmRldiBlbmFibGVkIGlu
IGtlcm5lbDxicj4NCiZndDvCoCDCoCDCoCDCoGNvbmZpZ3VyYXRpb25zIGJ1dDxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoHN0aWxsPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0OyB0aGUgc2FtZSBlcnJvciBjYW4mIzM5O3Qgb3BlbiB0aGUgZGlzcGxheS48
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGJlbG93IGFyZSB0aGUgb3V0
Y29tZSBvZiAmcXVvdDt4ZW5zdG9yZS1scyZxdW90Ozo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBy
b290QHJhc3BiZXJyeXBpNC02NDp+L2d1ZXN0MSMgeGVuc3RvcmUtbHM8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHRvb2wgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgeGVuc3RvcmVkID0gJnF1b3Q7JnF1b3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBsb2NhbCA9ICZxdW90OyZxdW90
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqBkb21haW4gPSAmcXVv
dDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIDAgPSAm
cXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKg
Y29udHJvbCA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgwqAgwqAgZmVhdHVyZS1wb3dlcm9mZiA9ICZxdW90OzEmcXVvdDs8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIGZlYXR1cmUtcmVib290ID0gJnF1b3Q7
MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqBkb21p
ZCA9ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IMKgIMKgbmFtZSA9ICZxdW90O0RvbWFpbi0wJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0OyDCoCDCoGRldmljZS1tb2RlbCA9ICZxdW90OyZxdW90Ozxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgMCA9ICZxdW90OyZxdW90Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBiYWNrZW5kcyA9
ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAg
wqAgwqAgY29uc29sZSA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDsgwqAgwqAgwqAgdmtiZCA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgdmZiID0gJnF1b3Q7JnF1b3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCBxbmljID0gJnF1b3Q7
JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoHN0
YXRlID0gJnF1b3Q7cnVubmluZyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDsgwqAgwqAgMSA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgwqAgwqAgwqBiYWNrZW5kcyA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgY29uc29sZSA9ICZxdW90OyZx
dW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgdmti
ZCA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsg
wqAgwqAgwqAgdmZiID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0OyDCoCDCoCDCoCBxbmljID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoHN0YXRlID0gJnF1b3Q7cnVubmluZyZxdW90
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqBiYWNrZW5kID0g
JnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDC
oCB2YmQgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IMKgIMKgIMKgMSA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDsgwqAgwqAgwqAgNTE3MTIgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgZnJvbnRlbmQgPSAmcXVvdDsvbG9j
YWwvZG9tYWluLzEvZGV2aWNlL3ZiZC81MTcxMiZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBwYXJhbXMgPSAmcXVvdDsvaG9tZS9yb290L2d1
ZXN0Mi94ZW4tZ3Vlc3QtaW1hZ2UtbWluaW1hbC1yYXNwYmVycnlwaTQtNjQuZXh0MyZxdW90Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBzY3JpcHQg
PSAmcXVvdDsvZXRjL3hlbi9zY3JpcHRzL2Jsb2NrJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoGZyb250ZW5kLWlkID0gJnF1b3Q7MSZxdW90
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBvbmxp
bmUgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
OyDCoCDCoCDCoCDCoHJlbW92YWJsZSA9ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgYm9vdGFibGUgPSAmcXVvdDsxJnF1b3Q7
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoHN0YXRl
ID0gJnF1b3Q7NCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsg
wqAgwqAgwqAgwqBkZXYgPSAmcXVvdDt4dmRhJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoHR5cGUgPSAmcXVvdDtwaHkmcXVvdDs8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgbW9kZSA9ICZxdW90
O3cmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKg
IMKgZGV2aWNlLXR5cGUgPSAmcXVvdDtkaXNrJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoGRpc2NhcmQtZW5hYmxlID0gJnF1b3Q7MSZxdW90
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBmZWF0
dXJlLW1heC1pbmRpcmVjdC1zZWdtZW50cyA9ICZxdW90OzI1NiZxdW90Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBtdWx0aS1xdWV1ZS1tYXgtcXVl
dWVzID0gJnF1b3Q7NCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDsgwqAgwqAgwqAgwqBtYXgtcmluZy1wYWdlLW9yZGVyID0gJnF1b3Q7NCZxdW90Ozxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBub2RlID0gJnF1b3Q7
L2Rldi9sb29wMCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsg
wqAgwqAgwqAgwqBwaHlzaWNhbC1kZXZpY2UgPSAmcXVvdDs3OjAmcXVvdDs8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgcGh5c2ljYWwtZGV2aWNlLXBh
dGggPSAmcXVvdDsvZGV2L2xvb3AwJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0OyDCoCDCoCDCoCDCoGhvdHBsdWctc3RhdHVzID0gJnF1b3Q7Y29ubmVjdGVkJnF1
b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoGZl
YXR1cmUtZmx1c2gtY2FjaGUgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoGRpc2NhcmQtZ3JhbnVsYXJpdHkgPSAmcXVvdDs0
MDk2JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDC
oCDCoGRpc2NhcmQtYWxpZ25tZW50ID0gJnF1b3Q7MCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBkaXNjYXJkLXNlY3VyZSA9ICZxdW90OzAm
cXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKg
ZmVhdHVyZS1kaXNjYXJkID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBmZWF0dXJlLWJhcnJpZXIgPSAmcXVvdDsxJnF1b3Q7
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoGZlYXR1
cmUtcGVyc2lzdGVudCA9ICZxdW90OzEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgc2VjdG9ycyA9ICZxdW90OzE3OTQwNDgmcXVvdDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgaW5mbyA9ICZx
dW90OzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKg
IMKgIMKgc2VjdG9yLXNpemUgPSAmcXVvdDs1MTImcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgcGh5c2ljYWwtc2VjdG9yLXNpemUgPSAmcXVv
dDs1MTImcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKg
IHZmYiA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDsgwqAgwqAgwqAxID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0OyDCoCDCoCDCoCAwID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoGZyb250ZW5kID0gJnF1b3Q7L2xvY2FsL2Rv
bWFpbi8xL2RldmljZS92ZmIvMCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDsgwqAgwqAgwqAgwqBmcm9udGVuZC1pZCA9ICZxdW90OzEmcXVvdDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgb25saW5lID0gJnF1b3Q7
MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAg
wqBzdGF0ZSA9ICZxdW90OzQmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IMKgIMKgIMKgIMKgdm5jID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqB2bmNsaXN0ZW4gPSAmcXVvdDsxMjcuMC4w
LjEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKg
IMKgdm5jZGlzcGxheSA9ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgdm5jdW51c2VkID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBzZGwgPSAmcXVvdDsw
JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDC
oG9wZW5nbCA9ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IMKgIMKgIMKgIMKgZmVhdHVyZS1yZXNpemUgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoGhvdHBsdWctc3RhdHVz
ID0gJnF1b3Q7Y29ubmVjdGVkJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0OyDCoCDCoCDCoCDCoHJlcXVlc3QtdXBkYXRlID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgdmtiZCA9ICZxdW90OyZxdW90
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAxID0gJnF1
b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDC
oCAwID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
OyDCoCDCoCDCoCDCoGZyb250ZW5kID0gJnF1b3Q7L2xvY2FsL2RvbWFpbi8xL2RldmljZS92a2Jk
LzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKg
IMKgZnJvbnRlbmQtaWQgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoG9ubGluZSA9ICZxdW90OzEmcXVvdDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgc3RhdGUgPSAmcXVvdDs0
JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDC
oGZlYXR1cmUtYWJzLXBvaW50ZXIgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoGZlYXR1cmUtcmF3LXBvaW50ZXIgPSAmcXVv
dDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDC
oCDCoGhvdHBsdWctc3RhdHVzID0gJnF1b3Q7Y29ubmVjdGVkJnF1b3Q7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCBjb25zb2xlID0gJnF1b3Q7JnF1b3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoDEgPSAmcXVvdDsm
cXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIDAg
PSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKg
IMKgIMKgIMKgZnJvbnRlbmQgPSAmcXVvdDsvbG9jYWwvZG9tYWluLzEvY29uc29sZSZxdW90Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBmcm9udGVu
ZC1pZCA9ICZxdW90OzEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IMKgIMKgIMKgIMKgb25saW5lID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBzdGF0ZSA9ICZxdW90OzEmcXVvdDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgcHJvdG9jb2wg
PSAmcXVvdDt2dDEwMCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDsgwqAgwqAgdmlmID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0OyDCoCDCoCDCoDEgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIDAgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgZnJvbnRlbmQgPSAmcXVvdDsv
bG9jYWwvZG9tYWluLzEvZGV2aWNlL3ZpZi8wJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoGZyb250ZW5kLWlkID0gJnF1b3Q7MSZxdW90Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBvbmxpbmUg
PSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDC
oCDCoCDCoCDCoHN0YXRlID0gJnF1b3Q7NCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBzY3JpcHQgPSAmcXVvdDsvZXRjL3hlbi9zY3JpcHRz
L3ZpZi1icmlkZ2UmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IMKgIMKgIMKgIMKgbWFjID0gJnF1b3Q7ZTQ6NWY6MDE6Y2Q6N2I6ZGQmcXVvdDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgYnJpZGdlID0gJnF1b3Q7
eGVuYnIwJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDC
oCDCoCDCoGhhbmRsZSA9ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgdHlwZSA9ICZxdW90O3ZpZiZxdW90Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBob3RwbHVnLXN0YXR1cyA9
ICZxdW90O2Nvbm5lY3RlZCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgwqAgwqAgwqAgwqBmZWF0dXJlLXNnID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBmZWF0dXJlLWdzby10Y3B2NCA9
ICZxdW90OzEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKg
IMKgIMKgIMKgZmVhdHVyZS1nc28tdGNwdjYgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoGZlYXR1cmUtaXB2Ni1jc3VtLW9m
ZmxvYWQgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0OyDCoCDCoCDCoCDCoGZlYXR1cmUtcngtY29weSA9ICZxdW90OzEmcXVvdDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgZmVhdHVyZS14ZHAtaGVh
ZHJvb20gPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0OyDCoCDCoCDCoCDCoGZlYXR1cmUtcngtZmxpcCA9ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgZmVhdHVyZS1tdWx0aWNh
c3QtY29udHJvbCA9ICZxdW90OzEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IMKgIMKgIMKgIMKgZmVhdHVyZS1keW5hbWljLW11bHRpY2FzdC1jb250cm9sID0g
JnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAg
wqAgwqAgwqBmZWF0dXJlLXNwbGl0LWV2ZW50LWNoYW5uZWxzID0gJnF1b3Q7MSZxdW90Ozxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBtdWx0aS1xdWV1
ZS1tYXgtcXVldWVzID0gJnF1b3Q7NCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDsgwqAgwqAgwqAgwqBmZWF0dXJlLWN0cmwtcmluZyA9ICZxdW90OzEmcXVvdDs8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIDEgPSAmcXVvdDsmcXVv
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgdm0gPSAmcXVv
dDsvdm0vZDgxZWM1YTktNWJmOS00ZjJiLTg5ZTgtMGY2MGQ2ZGE5NDhmJnF1b3Q7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoG5hbWUgPSAmcXVvdDtndWVzdDIm
cXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgY3B1ID0g
JnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDC
oCAwID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
OyDCoCDCoCDCoGF2YWlsYWJpbGl0eSA9ICZxdW90O29ubGluZSZxdW90Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgMSA9ICZxdW90OyZxdW90Ozxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBhdmFpbGFiaWxpdHkgPSAm
cXVvdDtvbmxpbmUmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IMKgIMKgbWVtb3J5ID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0OyDCoCDCoCBzdGF0aWMtbWF4ID0gJnF1b3Q7MjA5NzE1MiZxdW90Ozxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgdGFyZ2V0ID0gJnF1b3Q7MjA5
NzE1MiZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAg
dmlkZW9yYW0gPSAmcXVvdDswJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0OyDCoCDCoGRldmljZSA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgc3VzcGVuZCA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBldmVudC1jaGFubmVsID0gJnF1
b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCB2
YmQgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IMKgIMKgIMKgNTE3MTIgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIGJhY2tlbmQgPSAmcXVvdDsvbG9jYWwvZG9tYWluLzAvYmFj
a2VuZC92YmQvMS81MTcxMiZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgwqAgwqAgwqAgYmFja2VuZC1pZCA9ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIHN0YXRlID0gJnF1b3Q7NCZxdW90Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgdmlydHVhbC1k
ZXZpY2UgPSAmcXVvdDs1MTcxMiZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDsgwqAgwqAgwqAgZGV2aWNlLXR5cGUgPSAmcXVvdDtkaXNrJnF1b3Q7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCBtdWx0aS1xdWV1ZS1udW0t
cXVldWVzID0gJnF1b3Q7MiZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgwqAgwqAgwqAgcXVldWUtMCA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqByaW5nLXJlZiA9ICZxdW90OzgmcXVvdDs8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgZXZlbnQt
Y2hhbm5lbCA9ICZxdW90OzQmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IMKgIMKgIMKgIHF1ZXVlLTEgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgcmluZy1yZWYgPSAmcXVvdDs5JnF1b3Q7
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoGV2ZW50
LWNoYW5uZWwgPSAmcXVvdDs1JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0OyDCoCDCoCDCoCBwcm90b2NvbCA9ICZxdW90O2FybS1hYmkmcXVvdDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIGZlYXR1cmUtcGVyc2lzdGVu
dCA9ICZxdW90OzEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IMKgIMKgIHZmYiA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDsgwqAgwqAgwqAwID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCBiYWNrZW5kID0gJnF1b3Q7L2xvY2FsL2RvbWFpbi8w
L2JhY2tlbmQvdmZiLzEvMCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgwqAgwqAgwqAgYmFja2VuZC1pZCA9ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIHN0YXRlID0gJnF1b3Q7NCZxdW90Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgcGFnZS1yZWYg
PSAmcXVvdDsyNzUwMjImcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IMKgIMKgIMKgIGV2ZW50LWNoYW5uZWwgPSAmcXVvdDszJnF1b3Q7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCBwcm90b2NvbCA9ICZxdW90O2FybS1h
YmkmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKg
IGZlYXR1cmUtdXBkYXRlID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgwqAgwqAgdmtiZCA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAwID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCBiYWNrZW5kID0gJnF1b3Q7
L2xvY2FsL2RvbWFpbi8wL2JhY2tlbmQvdmtiZC8xLzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIGJhY2tlbmQtaWQgPSAmcXVvdDswJnF1b3Q7
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCBzdGF0ZSA9
ICZxdW90OzQmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKg
IMKgIMKgIHJlcXVlc3QtYWJzLXBvaW50ZXIgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCBwYWdlLXJlZiA9ICZxdW90OzI3NTMy
MiZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAg
cGFnZS1ncmVmID0gJnF1b3Q7MTI4NCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDsgwqAgwqAgwqAgZXZlbnQtY2hhbm5lbCA9ICZxdW90OzEwJnF1b3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCB2aWYgPSAmcXVvdDsmcXVv
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgMCA9ICZx
dW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAg
wqAgYmFja2VuZCA9ICZxdW90Oy9sb2NhbC9kb21haW4vMC9iYWNrZW5kL3ZpZi8xLzAmcXVvdDs8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIGJhY2tlbmQt
aWQgPSAmcXVvdDswJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
OyDCoCDCoCDCoCBzdGF0ZSA9ICZxdW90OzQmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIGhhbmRsZSA9ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIG1hYyA9ICZxdW90O2U0OjVm
OjAxOmNkOjdiOmRkJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
OyDCoCDCoCDCoCBtdHUgPSAmcXVvdDsxNTAwJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCB4ZHAtaGVhZHJvb20gPSAmcXVvdDswJnF1b3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCBtdWx0aS1xdWV1
ZS1udW0tcXVldWVzID0gJnF1b3Q7MiZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDsgwqAgwqAgwqAgcXVldWUtMCA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqB0eC1yaW5nLXJlZiA9ICZxdW90
OzEyODAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKg
IMKgIMKgcngtcmluZy1yZWYgPSAmcXVvdDsxMjgxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoGV2ZW50LWNoYW5uZWwtdHggPSAmcXVvdDs2
JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDC
oGV2ZW50LWNoYW5uZWwtcnggPSAmcXVvdDs3JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCBxdWV1ZS0xID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoHR4LXJpbmctcmVmID0g
JnF1b3Q7MTI4MiZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsg
wqAgwqAgwqAgwqByeC1yaW5nLXJlZiA9ICZxdW90OzEyODMmcXVvdDs8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgZXZlbnQtY2hhbm5lbC10eCA9ICZx
dW90OzgmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKg
IMKgIMKgZXZlbnQtY2hhbm5lbC1yeCA9ICZxdW90OzkmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIHJlcXVlc3QtcngtY29weSA9ICZxdW90OzEm
cXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIGZl
YXR1cmUtcngtbm90aWZ5ID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgZmVhdHVyZS1zZyA9ICZxdW90OzEmcXVvdDs8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIGZlYXR1cmUtZ3NvLXRj
cHY0ID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDsgwqAgwqAgwqAgZmVhdHVyZS1nc28tdGNwdjYgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCBmZWF0dXJlLWlwdjYtY3N1bS1v
ZmZsb2FkID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgwqAgwqBjb250cm9sID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCBzaHV0ZG93biA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgZmVhdHVyZS1wb3dlcm9mZiA9ICZx
dW90OzEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKg
IGZlYXR1cmUtcmVib290ID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgwqAgwqAgZmVhdHVyZS1zdXNwZW5kID0gJnF1b3Q7JnF1b3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCBzeXNycSA9ICZxdW90OyZx
dW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgcGxhdGZv
cm0tZmVhdHVyZS1tdWx0aXByb2Nlc3Nvci1zdXNwZW5kID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgcGxhdGZvcm0tZmVhdHVyZS14
c19yZXNldF93YXRjaGVzID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgwqAgwqBkYXRhID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoGRyaXZlcnMgPSAmcXVvdDsmcXVvdDs8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgZmVhdHVyZSA9ICZxdW90OyZx
dW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqBhdHRyID0g
JnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDC
oGVycm9yID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0OyDCoCDCoGRvbWlkID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgwqAgwqBzdG9yZSA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgcG9ydCA9ICZxdW90OzEmcXVvdDs8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIHJpbmctcmVmID0gJnF1b3Q7
MjMzNDczJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDC
oGNvbnNvbGUgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IMKgIMKgIGJhY2tlbmQgPSAmcXVvdDsvbG9jYWwvZG9tYWluLzAvYmFja2VuZC9jb25z
b2xlLzEvMCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAg
wqAgYmFja2VuZC1pZCA9ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IMKgIMKgIGxpbWl0ID0gJnF1b3Q7MTA0ODU3NiZxdW90Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgdHlwZSA9ICZxdW90O3hlbmNvbnNv
bGVkJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCBv
dXRwdXQgPSAmcXVvdDtwdHkmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IMKgIMKgIHR0eSA9ICZxdW90Oy9kZXYvcHRzLzEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIHBvcnQgPSAmcXVvdDsyJnF1b3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCByaW5nLXJlZiA9ICZxdW90
OzIzMzQ3MiZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAg
wqAgdm5jLWxpc3RlbiA9ICZxdW90OzEyNy4wLjAuMSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgdm5jLXBvcnQgPSAmcXVvdDs1OTAwJnF1b3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoGltYWdlID0gJnF1b3Q7
JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCBkZXZp
Y2UtbW9kZWwtcGlkID0gJnF1b3Q7Nzg4JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0OyB2bSA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgwqBkODFlYzVhOS01YmY5LTRmMmItODllOC0wZjYwZDZkYTk0OGYgPSAm
cXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIG5h
bWUgPSAmcXVvdDtndWVzdDImcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IMKgIHV1aWQgPSAmcXVvdDtkODFlYzVhOS01YmY5LTRmMmItODllOC0wZjYwZDZkYTk0
OGYmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIHN0YXJ0
X3RpbWUgPSAmcXVvdDsxNTIwNjAwMjc0LjI3JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0OyBsaWJ4bCA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDsgwqAxID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCBkZXZpY2UgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgdmJkID0gJnF1b3Q7JnF1b3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCA1MTcxMiA9ICZxdW90
OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBm
cm9udGVuZCA9ICZxdW90Oy9sb2NhbC9kb21haW4vMS9kZXZpY2UvdmJkLzUxNzEyJnF1b3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoGJhY2tlbmQgPSAm
cXVvdDsvbG9jYWwvZG9tYWluLzAvYmFja2VuZC92YmQvMS81MTcxMiZxdW90Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBwYXJhbXMgPSAmcXVvdDsvaG9t
ZS9yb290L2d1ZXN0Mi94ZW4tZ3Vlc3QtaW1hZ2UtbWluaW1hbC1yYXNwYmVycnlwaTQtNjQuZXh0
MyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBz
Y3JpcHQgPSAmcXVvdDsvZXRjL3hlbi9zY3JpcHRzL2Jsb2NrJnF1b3Q7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoGZyb250ZW5kLWlkID0gJnF1b3Q7MSZx
dW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBvbmxp
bmUgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
OyDCoCDCoCDCoHJlbW92YWJsZSA9ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgYm9vdGFibGUgPSAmcXVvdDsxJnF1b3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoHN0YXRlID0gJnF1b3Q7
MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBk
ZXYgPSAmcXVvdDt4dmRhJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0OyDCoCDCoCDCoHR5cGUgPSAmcXVvdDtwaHkmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgbW9kZSA9ICZxdW90O3cmcXVvdDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgZGV2aWNlLXR5cGUgPSAmcXVv
dDtkaXNrJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDC
oCDCoGRpc2NhcmQtZW5hYmxlID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDsgwqAgwqB2ZmIgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIDAgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgZnJvbnRlbmQgPSAmcXVvdDsv
bG9jYWwvZG9tYWluLzEvZGV2aWNlL3ZmYi8wJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoGJhY2tlbmQgPSAmcXVvdDsvbG9jYWwvZG9tYWluLzAv
YmFja2VuZC92ZmIvMS8wJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0OyDCoCDCoCDCoGZyb250ZW5kLWlkID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBvbmxpbmUgPSAmcXVvdDsxJnF1b3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoHN0YXRlID0gJnF1
b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAg
wqB2bmMgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0OyDCoCDCoCDCoHZuY2xpc3RlbiA9ICZxdW90OzEyNy4wLjAuMSZxdW90Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqB2bmNkaXNwbGF5ID0gJnF1b3Q7
MCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqB2
bmN1bnVzZWQgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0OyDCoCDCoCDCoHNkbCA9ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgb3BlbmdsID0gJnF1b3Q7MCZxdW90Ozxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqB2a2JkID0gJnF1b3Q7JnF1b3Q7
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCAwID0gJnF1b3Q7
JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoGZy
b250ZW5kID0gJnF1b3Q7L2xvY2FsL2RvbWFpbi8xL2RldmljZS92a2JkLzAmcXVvdDs8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgYmFja2VuZCA9ICZxdW90
Oy9sb2NhbC9kb21haW4vMC9iYWNrZW5kL3ZrYmQvMS8wJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoGZyb250ZW5kLWlkID0gJnF1b3Q7MSZxdW90
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBvbmxpbmUg
PSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDC
oCDCoCDCoHN0YXRlID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDsgwqAgwqBjb25zb2xlID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCAwID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoGZyb250ZW5kID0gJnF1b3Q7L2xv
Y2FsL2RvbWFpbi8xL2NvbnNvbGUmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IMKgIMKgIMKgYmFja2VuZCA9ICZxdW90Oy9sb2NhbC9kb21haW4vMC9iYWNrZW5k
L2NvbnNvbGUvMS8wJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
OyDCoCDCoCDCoGZyb250ZW5kLWlkID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBvbmxpbmUgPSAmcXVvdDsxJnF1b3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoHN0YXRlID0gJnF1b3Q7
MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBw
cm90b2NvbCA9ICZxdW90O3Z0MTAwJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0OyDCoCDCoHZpZiA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgMCA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBmcm9udGVuZCA9ICZxdW90Oy9sb2NhbC9k
b21haW4vMS9kZXZpY2UvdmlmLzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IMKgIMKgIMKgYmFja2VuZCA9ICZxdW90Oy9sb2NhbC9kb21haW4vMC9iYWNrZW5k
L3ZpZi8xLzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKg
IMKgIMKgZnJvbnRlbmQtaWQgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoG9ubGluZSA9ICZxdW90OzEmcXVvdDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgc3RhdGUgPSAmcXVvdDsxJnF1
b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoHNjcmlw
dCA9ICZxdW90Oy9ldGMveGVuL3NjcmlwdHMvdmlmLWJyaWRnZSZxdW90Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBtYWMgPSAmcXVvdDtlNDo1ZjowMTpj
ZDo3YjpkZCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAg
wqAgwqBicmlkZ2UgPSAmcXVvdDt4ZW5icjAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgaGFuZGxlID0gJnF1b3Q7MCZxdW90Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqB0eXBlID0gJnF1b3Q7dmlmJnF1
b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoGhvdHBs
dWctc3RhdHVzID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0OyDCoCB0eXBlID0gJnF1b3Q7cHZoJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0OyDCoCBkbS12ZXJzaW9uID0gJnF1b3Q7cWVtdV94ZW4mcXVvdDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHJvb3RAcmFzcGJlcnJ5cGk0LTY0
On4vZ3Vlc3QxIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEFueSBpbnB1dCBhcyBwZXIgYWJvdmU/
IExvb2tpbmcgZm9yd2FyZCB0byBoZWFyaW5nIGZyb20geW91Ljxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IFJlZ2FyZHMsPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBWaXB1
bCBLdW1hcjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IE9uIFdlZCwgT2N0IDI2LCAyMDIyIGF0IDU6
MjEgQU0gU3RlZmFubyBTdGFiZWxsaW5pICZsdDs8YSBocmVmPSJtYWlsdG86c3N0YWJlbGxpbmlA
a2VybmVsLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnNzdGFiZWxsaW5pQGtlcm5lbC5vcmc8L2E+Jmd0
OyB3cm90ZTo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqBIaSBWaXB1bCw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgSWYgeW91IGxvb2sg
YXQgdGhlIFFFTVUgbG9ncywgaXQgc2F5czo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgVk5DIHNlcnZlciBydW5uaW5nIG9uIDxhIGhyZWY9Imh0dHA6Ly8xMjcuMC4wLjE6NTkwMCIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+MTI3LjAuMC4xOjU5MDA8L2E+PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoFRoYXQgaXMgdGhlIFZOQyBzZXJ2ZXIgeW91IG5l
ZWQgdG8gY29ubmVjdCB0by4gU28gaW4gdGhlb3J5Ojxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqDCoCB2bmN2aWV3ZXIgPGEgaHJlZj0iaHR0cDovLzEyNy4wLjAuMTo1OTAwIiByZWw9
Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj4xMjcuMC4wLjE6NTkwMDwvYT48YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgc2hvdWxkIHdvcmsgY29ycmVjdGx5Ljxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgSWYgeW91IGhhdmU6PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoMKgIHZm
YiA9IFsmcXVvdDt0eXBlPXZuYyZxdW90O108YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgaW4geW91ciB4bCBjb25maWcgZmlsZSBhbmQgeW91IGhhdmUgJnF1b3Q7ZmJkZXYmcXVvdDsg
aW4geW91ciBMaW51eCBndWVzdCwgaXQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqBzaG91bGQgd29yay48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgSWYgeW91IGNvbm5lY3QgdG8gdGhlIFZOQyBzZXJ2ZXIgYnV0IHlvdSBnZXQgYSBibGFj
ayBzY3JlZW4sIGl0IG1pZ2h0IGJlPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgYSBndWVzdCBjb25maWd1cmF0aW9uIGlzc3VlLiBJIHdvdWxkIHRyeSB3
aXRoIGEgc2ltcGxlciBndWVzdCwgdGV4dCBvbmx5PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgKG5vIFgxMSwgbm8gV2F5bGFuZCkgYW5kIGVuYWJsZSB0
aGUgZmJkZXYgY29uc29sZSAoZmJjb24pLiBTZWU8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBEb2N1bWVudGF0aW9uL2ZiL2ZiY29uLnJzdCBpbiBMaW51
eC4gWW91IHNob3VsZCBiZSBhYmxlIHRvIHNlZSBhPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgZ3JhcGhpY2FsIGNvbnNvbGUgb3ZlciBWTkMuPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoElmIHRoYXQgd29ya3MsIHRoZW4geW91IGtub3cg
dGhhdCB0aGUgZmJkZXYga2VybmVsIGRyaXZlciAoeGVuLWZiZnJvbnQpPGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgd29ya3MgY29ycmVjdGx5Ljxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBJZiBpdCBkb2VzbiYjMzk7dCB3b3JrLCB0aGUg
b3V0cHV0IG9mICZxdW90O3hlbnN0b3JlLWxzJnF1b3Q7IHdvdWxkIGJlIGludGVyZXN0aW5nLjxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBDaGVlcnMsPGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoFN0ZWZhbm88YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoE9uIFdlZCwgMTkgT2N0IDIw
MjIsIFZpcHVsIFN1bmVqYSB3cm90ZTo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEhpIFN0ZWZhbm8sPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgVGhhbmtzIGZvciB0aGUgcmVzcG9uc2UhPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgSSBhbSBm
b2xsb3dpbmcgdGhlIHNhbWUgbGluayB5b3Ugc2hhcmVkIGZyb20gdGhlIGJlZ2lubmluZy4gVHJp
ZWQgdGhlIGNvbW1hbmQgJnF1b3Q7dm5jdmlld2VyIGxvY2FsaG9zdDowJnF1b3Q7IGluIERPTTA8
YnI+DQomZ3Q7wqAgwqAgwqAgwqBidXQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqBzYW1lPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
aXNzdWUgJnF1b3Q7Q2FuJiMzOTt0IG9wZW48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGRpc3BsYXkmcXVvdDssIGJlbG93IGFyZSB0aGUgbG9n
czo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBy
b290QHJhc3BiZXJyeXBpNC02NDp+IyB2bmN2aWV3ZXIgbG9jYWxob3N0OjA8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBUaWdlclZOQyBWaWV3ZXIg
NjQtYml0IHYxLjExLjA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IEJ1aWx0IG9uOiAyMDIwLTA5LTA4IDEyOjE2PGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBDb3B5cmlnaHQgKEMpIDE5OTkt
MjAyMCBUaWdlclZOQyBUZWFtIGFuZCBtYW55IG90aGVycyAoc2VlIFJFQURNRS5yc3QpPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBTZWUgPGEg
aHJlZj0iaHR0cHM6Ly93d3cudGlnZXJ2bmMub3JnIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0i
X2JsYW5rIj5odHRwczovL3d3dy50aWdlcnZuYy5vcmc8L2E+IGZvciBpbmZvcm1hdGlvbiBvbiBU
aWdlclZOQy48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IENhbiYjMzk7dCBvcGVuIGRpc3BsYXk6PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgQmVsb3cgYXJlIHRoZSBuZXRzdGF0IGxvZ3MsIGkg
Y291bGRuJiMzOTt0IHNlZSBhbnl0aGluZyBydW5uaW5nIGF0IHBvcnQgNTkwMCBvciA1OTAxOjxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHJvb3RA
cmFzcGJlcnJ5cGk0LTY0On4jIG5ldHN0YXQgLXR1d3g8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEFjdGl2ZSBJbnRlcm5ldCBjb25uZWN0aW9u
cyAody9vIHNlcnZlcnMpPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0OyBQcm90byBSZWN2LVEgU2VuZC1RIExvY2FsIEFkZHJlc3MgwqAgwqAgwqAg
wqAgwqAgRm9yZWlnbiBBZGRyZXNzIMKgIMKgIMKgIMKgIFN0YXRlIMKgIMKgIMKgPGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyB0Y3AgwqAgwqAg
wqAgwqAwIMKgIMKgMTY0IDE5Mi4xNjguMS4zOTpzc2ggwqAgwqAgwqAgwqA8YSBocmVmPSJodHRw
Oi8vMTkyLjE2OC4xLjM4OjM3NDcyIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj4x
OTIuMTY4LjEuMzg6Mzc0NzI8L2E+IMKgIMKgIMKgRVNUQUJMSVNIRUQ8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEFjdGl2ZSBVTklYIGRvbWFp
biBzb2NrZXRzICh3L28gc2VydmVycyk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFByb3RvIFJlZkNudCBGbGFncyDCoCDCoCDCoCBUeXBlIMKg
IMKgIMKgIFN0YXRlIMKgIMKgIMKgIMKgIEktTm9kZSBQYXRoPGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyB1bml4IMKgOCDCoCDCoCDCoFsgXSDC
oCDCoCDCoCDCoCBER1JBTSDCoCDCoCDCoENPTk5FQ1RFRCDCoCDCoCDCoDEwNTY1IC9kZXYvbG9n
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyB1
bml4IMKgMyDCoCDCoCDCoFsgXSDCoCDCoCDCoCDCoCBTVFJFQU0gwqAgwqAgQ09OTkVDVEVEIMKg
IMKgIMKgMTA4OTEgL3Zhci9ydW4veGVuc3RvcmVkL3NvY2tldDxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgdW5peCDCoDMgwqAgwqAgwqBbIF0g
wqAgwqAgwqAgwqAgU1RSRUFNIMKgIMKgIENPTk5FQ1RFRCDCoCDCoCDCoDEzNzkxPGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyB1bml4IMKgMyDC
oCDCoCDCoFsgXSDCoCDCoCDCoCDCoCBTVFJFQU0gwqAgwqAgQ09OTkVDVEVEIMKgIMKgIMKgMTA4
NDMgL3Zhci9ydW4veGVuc3RvcmVkL3NvY2tldDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgdW5peCDCoDMgwqAgwqAgwqBbIF0gwqAgwqAgwqAg
wqAgU1RSRUFNIMKgIMKgIENPTk5FQ1RFRCDCoCDCoCDCoDEwNTczIC92YXIvcnVuL3hlbnN0b3Jl
ZC9zb2NrZXQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IHVuaXggwqAyIMKgIMKgIMKgWyBdIMKgIMKgIMKgIMKgIERHUkFNIMKgIMKgIMKgQ09O
TkVDVEVEIMKgIMKgIMKgMTQ1MTA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IHVuaXggwqAzIMKgIMKgIMKgWyBdIMKgIMKgIMKgIMKgIFNUUkVB
TSDCoCDCoCBDT05ORUNURUQgwqAgwqAgwqAxMzI0OTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgdW5peCDCoDIgwqAgwqAgwqBbIF0gwqAgwqAg
wqAgwqAgREdSQU0gwqAgwqAgwqBDT05ORUNURUQgwqAgwqAgwqAxMzg4Nzxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgdW5peCDCoDIgwqAgwqAg
wqBbIF0gwqAgwqAgwqAgwqAgREdSQU0gwqAgwqAgwqBDT05ORUNURUQgwqAgwqAgwqAxMDU5OTxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgdW5p
eCDCoDMgwqAgwqAgwqBbIF0gwqAgwqAgwqAgwqAgU1RSRUFNIMKgIMKgIENPTk5FQ1RFRCDCoCDC
oCDCoDE0MDA1PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0OyB1bml4IMKgMyDCoCDCoCDCoFsgXSDCoCDCoCDCoCDCoCBTVFJFQU0gwqAgwqAgQ09O
TkVDVEVEIMKgIMKgIMKgMTMyNTg8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IHVuaXggwqAzIMKgIMKgIMKgWyBdIMKgIMKgIMKgIMKgIFNUUkVB
TSDCoCDCoCBDT05ORUNURUQgwqAgwqAgwqAxMzI0ODxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgdW5peCDCoDMgwqAgwqAgwqBbIF0gwqAgwqAg
wqAgwqAgU1RSRUFNIMKgIMKgIENPTk5FQ1RFRCDCoCDCoCDCoDE0MDAzPGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyB1bml4IMKgMyDCoCDCoCDC
oFsgXSDCoCDCoCDCoCDCoCBTVFJFQU0gwqAgwqAgQ09OTkVDVEVEIMKgIMKgIMKgMTA1NzIgL3Zh
ci9ydW4veGVuc3RvcmVkL3NvY2tldDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDsgdW5peCDCoDMgwqAgwqAgwqBbIF0gwqAgwqAgwqAgwqAgU1RS
RUFNIMKgIMKgIENPTk5FQ1RFRCDCoCDCoCDCoDEwNzg2IC92YXIvcnVuL3hlbnN0b3JlZC9zb2Nr
ZXQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IHVuaXggwqAzIMKgIMKgIMKgWyBdIMKgIMKgIMKgIMKgIERHUkFNIMKgIMKgIMKgQ09OTkVDVEVE
IMKgIMKgIMKgMTMxODY8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IHVuaXggwqAzIMKgIMKgIMKgWyBdIMKgIMKgIMKgIMKgIFNUUkVBTSDCoCDC
oCBDT05ORUNURUQgwqAgwqAgwqAxMDg2NCAvdmFyL3J1bi94ZW5zdG9yZWQvc29ja2V0PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyB1bml4IMKg
MyDCoCDCoCDCoFsgXSDCoCDCoCDCoCDCoCBTVFJFQU0gwqAgwqAgQ09OTkVDVEVEIMKgIMKgIMKg
MTA4MTIgL3Zhci9ydW4veGVuc3RvcmVkL3NvY2tldDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgdW5peCDCoDIgwqAgwqAgwqBbIF0gwqAgwqAg
wqAgwqAgREdSQU0gwqAgwqAgwqBDT05ORUNURUQgwqAgwqAgwqAxNDA4Mzxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgdW5peCDCoDMgwqAgwqAg
wqBbIF0gwqAgwqAgwqAgwqAgU1RSRUFNIMKgIMKgIENPTk5FQ1RFRCDCoCDCoCDCoDEwODEzIC92
YXIvcnVuL3hlbnN0b3JlZC9zb2NrZXQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHVuaXggwqAzIMKgIMKgIMKgWyBdIMKgIMKgIMKgIMKgIFNU
UkVBTSDCoCDCoCBDT05ORUNURUQgwqAgwqAgwqAxNDA2ODxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgdW5peCDCoDMgwqAgwqAgwqBbIF0gwqAg
wqAgwqAgwqAgU1RSRUFNIMKgIMKgIENPTk5FQ1RFRCDCoCDCoCDCoDEzMjU2PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyB1bml4IMKgMyDCoCDC
oCDCoFsgXSDCoCDCoCDCoCDCoCBTVFJFQU0gwqAgwqAgQ09OTkVDVEVEIMKgIMKgIMKgMTA1NzEg
L3Zhci9ydW4veGVuc3RvcmVkL3NvY2tldDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgdW5peCDCoDMgwqAgwqAgwqBbIF0gwqAgwqAgwqAgwqAg
U1RSRUFNIMKgIMKgIENPTk5FQ1RFRCDCoCDCoCDCoDEwODQyPGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyB1bml4IMKgMyDCoCDCoCDCoFsgXSDC
oCDCoCDCoCDCoCBTVFJFQU0gwqAgwqAgQ09OTkVDVEVEIMKgIMKgIMKgMTM5ODU8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHVuaXggwqAzIMKg
IMKgIMKgWyBdIMKgIMKgIMKgIMKgIERHUkFNIMKgIMKgIMKgQ09OTkVDVEVEIMKgIMKgIMKgMTMx
ODU8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IHVuaXggwqAyIMKgIMKgIMKgWyBdIMKgIMKgIMKgIMKgIFNUUkVBTSDCoCDCoCBDT05ORUNURUQg
wqAgwqAgwqAxMzg4NDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDsgdW5peCDCoDIgwqAgwqAgwqBbIF0gwqAgwqAgwqAgwqAgREdSQU0gwqAgwqAg
wqBDT05ORUNURUQgwqAgwqAgwqAxNDUyODxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgdW5peCDCoDIgwqAgwqAgwqBbIF0gwqAgwqAgwqAgwqAg
REdSQU0gwqAgwqAgwqBDT05ORUNURUQgwqAgwqAgwqAxMzc4NTxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgdW5peCDCoDMgwqAgwqAgwqBbIF0g
wqAgwqAgwqAgwqAgU1RSRUFNIMKgIMKgIENPTk5FQ1RFRCDCoCDCoCDCoDE0MDM0PGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgQXR0YWNoaW5nIHhl
biBsb2cgZmlsZXMgb2YgL3Zhci9sb2cveGVuLjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgSSBkaWRuJiMzOTt0IGdldCB0aGUgcm9sZSBvZiBR
RU1VIGhlcmUgYmVjYXVzZSBhcyBtZW50aW9uZWQgZWFybGllciwgSSBhbSBwb3J0aW5nIGluIHJh
c3BiZXJyeXBpIDRCLjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IFJlZ2FyZHMsPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0OyBWaXB1bCBLdW1hcjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IE9uIFdlZCwgT2N0IDE5LCAyMDIyIGF0IDEyOjQzIEFN
IFN0ZWZhbm8gU3RhYmVsbGluaSAmbHQ7PGEgaHJlZj0ibWFpbHRvOnNzdGFiZWxsaW5pQGtlcm5l
bC5vcmciIHRhcmdldD0iX2JsYW5rIj5zc3RhYmVsbGluaUBrZXJuZWwub3JnPC9hPiZndDsgd3Jv
dGU6PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgSXQgdXN1YWxseSB3b3JrcyB0aGUgd2F5IGl0IGlzIGRlc2NyaWJlZCBpbiB0
aGUgZ3VpZGU6PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDC
oMKgwqDCoDxhIGhyZWY9Imh0dHBzOi8vd3d3LnZpcnR1YXRvcGlhLmNvbS9pbmRleC5waHA/dGl0
bGU9Q29uZmlndXJpbmdfYV9WTkNfYmFzZWRfR3JhcGhpY2FsX0NvbnNvbGVfZm9yX2FfWGVuX1Bh
cmF2aXJ0dWFsaXplZF9kb21haW5VX0d1ZXN0IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj5odHRwczovL3d3dy52aXJ0dWF0b3BpYS5jb20vaW5kZXgucGhwP3RpdGxlPUNvbmZpZ3Vy
aW5nX2FfVk5DX2Jhc2VkX0dyYXBoaWNhbF9Db25zb2xlX2Zvcl9hX1hlbl9QYXJhdmlydHVhbGl6
ZWRfZG9tYWluVV9HdWVzdDwvYT48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgWW91IGRvbiYjMzk7dCBuZWVkIHRvIGluc3RhbGwg
YW55IFZOQy1yZWxhdGVkIHNlcnZlciBzb2Z0d2FyZSBiZWNhdXNlIGl0IGlzPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgYWxy
ZWFkeSBwcm92aWRlZCBieSBYZW4gKHRvIGJlIHByZWNpc2UgaXQgaXMgcHJvdmlkZWQgYnkgUUVN
VSB3b3JraW5nPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgdG9nZXRoZXIgd2l0aCBYZW4uKTxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBZb3Ugb25seSBuZWVk
IHRoZSB2bmMgY2xpZW50IGluIGRvbTAgc28gdGhhdCB5b3UgY2FuIGNvbm5lY3QsIGJ1dCB5b3U8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqBjb3VsZCBhbHNvIHJ1biB0aGUgdm5jIGNsaWVudCBvdXRzaWRlIGZyb20gYW5vdGhl
ciBob3N0LiBTbyBiYXNpY2FsbHk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqB0aGUgZm9sbG93aW5nIHNob3VsZCB3b3JrIHdo
ZW4gZXhlY3V0ZWQgaW4gRG9tMCBhZnRlciBjcmVhdGluZyBEb21VOjxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqDCoCB2bmN2aWV3
ZXIgbG9jYWxob3N0OjA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgQ2FuIHlvdSBhdHRhY2ggdGhlIFhlbiBhbmQgUUVNVSBsb2dz
ICgvdmFyL2xvZy94ZW4vKik/IEFuZCBhbHNvIHVzZTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoG5ldHN0YXQgLXRhdW5wIHRv
IGNoZWNrIGlmIHRoZXJlIGlzIGFueXRoaW5nIHJ1bm5pbmcgYXQgcG9ydCA1OTAwIG9yPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgNTkwMT88YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgQ2hlZXJzLDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBTdGVmYW5vPGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBPbiBUdWUsIDE4IE9jdCAy
MDIyLCBWaXB1bCBTdW5lamEgd3JvdGU6PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBIaSBTdGVmYW5vLDxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IFRoYW5rcyBmb3IgdGhlIHJlc3BvbnNlITxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IEkgY291bGQgaW5zdGFsbCB0aWdlclZOQywgeDExdm5jICZhbXA7IGxpYnZu
Y3NlcnZlciBpbiBEb20wIHhlbi1pbWFnZS1taW5pbWFsIGJ1dCBvbmx5IG1hbmFnZSB0byBpbnN0
YWxsPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgbGli
dm5jc2VydmVyKGNvdWxkbiYjMzk7dDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoGluc3RhbGwgdGlnZXJ2bmM8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7ICZhbXA7IHgxMXZuYyBiZWNhdXNlIG9mIHgxMTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgc3VwcG9ydCBtaXNz
aW5nLCBpdCYjMzk7cyB3YXlsYW5kKSBpbiBET01VIGN1c3RvbSBncmFwaGljYWwgaW1hZ2UuIEkg
dHJpZWQgcnVubmluZyB2bmN2aWV3ZXIgd2l0aCBJUDxicj4NCiZndDvCoCDCoCDCoCDCoGFkZHJl
c3MgJmFtcDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBwb3J0PGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgaW4gZG9tMCB0bzxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoGFjY2VzcyB0aGUgZG9tdTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgZ3JhcGhpY2FsIGltYWdlIGRpc3BsYXkg
YXMgcGVyIGJlbG93IGNvbW1hbmRzLjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqA8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgdm5j
dmlld2VyIDxhIGhyZWY9Imh0dHA6Ly8xOTIuMTY4LjEuNDI6NTkwMSIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+MTkyLjE2OC4xLjQyOjU5MDE8L2E+PGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoDxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDsgwqBCdXQgaXQgc2hvd2luZyBjYW4mIzM5O3Qgb3BlbiBkaXNwbGF5LCBiZWxv
dyBhcmUgdGhlIGxvZ3M6PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgcm9vdEByYXNwYmVy
cnlwaTQtNjQ6fi9ndWVzdDEjIHZuY3ZpZXdlciA8YSBocmVmPSJodHRwOi8vMTkyLjE2OC4xLjQy
OjU5MDEiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPjE5Mi4xNjguMS40Mjo1OTAx
PC9hPjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFRpZ2VyVk5DIFZpZXdlciA2NC1iaXQgdjEu
MTEuMDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDsgQnVpbHQgb246IDIwMjAtMDktMDggMTI6MTY8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IENvcHlyaWdodCAoQykgMTk5OS0yMDIwIFRpZ2VyVk5DIFRlYW0gYW5kIG1hbnkgb3RoZXJzIChz
ZWUgUkVBRE1FLnJzdCk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFNlZSA8YSBocmVmPSJodHRwczovL3d3dy50aWdl
cnZuYy5vcmciIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vd3d3LnRp
Z2Vydm5jLm9yZzwvYT4gZm9yIGluZm9ybWF0aW9uIG9uIFRpZ2VyVk5DLjxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsg
Q2FuJiMzOTt0IG9wZW4gZGlzcGxheTo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHJvb3RAcmFzcGJlcnJ5cGk0LTY0
On4vZ3Vlc3QxIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEkgYW0gbm90IGV4YWN0bHnCoHN1
cmUgd2hhdCB0aGUgaXNzdWUgaXMgYnV0IEkgdGhvdWdodCBvbmx5IGxpYnZuY3NlcnZlciBpbiBE
T01VIGNvdWxkIHdvcmsgdG8gZ2V0PGJyPg0KJmd0O8KgIMKgIMKgIMKgYWNjZXNzIGJ1dDxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoGl0PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgZGlkIG5vdDxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoHdvcmsuwqA8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IElmIFRpZ2VyVk5DIGlzIHRoZSBpc3N1ZSBoZXJlIHRoZW4gaXMgdGhlcmUgYW55IG90
aGVyIFZOQyBzb3VyY2Ugd2hpY2ggY291bGQgYmUgaW5zdGFsbGVkIGZvciBib3RoPGJyPg0KJmd0
O8KgIMKgIMKgIMKgeDExICZhbXA7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgd2F5bGFuZCBzdXBwb3J0ZWQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBpbWFnZXM/PGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDsgUmVnYXJkcyw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFZpcHVsIEt1bWFyPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDsgT24gVHVlLCBPY3QgMTgsIDIwMjIgYXQgMjo0MCBBTSBTdGVm
YW5vIFN0YWJlbGxpbmkgJmx0OzxhIGhyZWY9Im1haWx0bzpzc3RhYmVsbGluaUBrZXJuZWwub3Jn
IiB0YXJnZXQ9Il9ibGFuayI+c3N0YWJlbGxpbmlAa2VybmVsLm9yZzwvYT4mZ3Q7IHdyb3RlOjxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoFZOQyBpcyB0eXBpY2FsbHkgZWFzaWVyIHRvIHNldHVwLCBi
ZWNhdXNlIFNETCBuZWVkcyBleHRyYSBsaWJyYXJpZXMgYXQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqBidWlsZCB0aW1lIGFuZCBydW50aW1lLiBJZiBRRU1VIGlzIGJ1aWx0IHdpdGhvdXQgU0RMIHN1
cHBvcnQgaXQgd29uJiMzOTt0PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgc3RhcnQgd2hlbiB5b3Ug
YXNrIGZvciBTREwuPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoFZOQyBzaG91
bGQgd29yayB3aXRoIGJvdGggeDExIGFuZCB3YXlsYW5kIGluIHlvdXIgZG9tVS4gSXQgZG9lc24m
IzM5O3Qgd29yazxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoGF0IHRoZSB4MTEgbGV2ZWwsIGl0IGV4
cG9zZXMgYSBzcGVjaWFsIGZiZGV2IGRldmljZSBpbiB5b3VyIGRvbVUgdGhhdDxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoHNob3VsZCB3b3JrIHdpdGg6PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgLSBh
IGdyYXBoaWNhbCBjb25zb2xlIGluIExpbnV4IGRvbVU8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAt
IHgxMTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoC0gd2F5bGFuZCAoYnV0IEkgaGF2ZW4mIzM5O3Qg
dGVzdGVkIHRoaXMgc28gSSBhbSBub3QgMTAwJSBzdXJlIGFib3V0IGl0KTxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBXaGVuIHlvdSBzYXkgJnF1b3Q7aXQgZG9lc24mIzM5O3Qg
d29yayZxdW90Oywgd2hhdCBkbyB5b3UgbWVhbj8gRG8geW91IGdldCBhIGJsYWNrPGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgd2luZG93Pzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqBZb3UgbmVlZCBDT05GSUdfWEVOX0ZCREVWX0ZST05URU5EIGluIExpbnV4IGRvbVU8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAoZHJpdmVycy92aWRlby9mYmRldi94ZW4tZmJmcm9udC5jKS4gSSB3
b3VsZCB0cnkgdG8gZ2V0IGEgZ3JhcGhpY2FsIHRleHQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBj
b25zb2xlIHVwIGFuZCBydW5uaW5nIGluIHlvdXIgZG9tVSBiZWZvcmUgYXR0ZW1wdGluZyB4MTEv
d2F5bGFuZC48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgQ2hlZXJzLDxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBTdGVmYW5vPGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoE9uIE1vbiwgMTcgT2N0IDIwMjIsIFZpcHVsIFN1bmVqYSB3cm90
ZTo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEhpLDxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgVGhhbmtzITxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IEkgaGF2ZSBwb3J0ZWQgeGVuIG1pbmltYWwgaW1hZ2UgYXMgRE9NMCAmYW1w
OyBjdXN0b20gd2F5bGFuZCBHVUkgYmFzZWQgaW1hZ2UgYXMgRE9NVSBpbiByYXNwYmVycnk8YnI+
DQomZ3Q7wqAgwqAgwqAgwqBwaTRCLiBJPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgYW0gdHJ5aW5nIHRvPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgbWFrZSBHVUk8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqBkaXNwbGF5IHVwPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBmb3LC
oGd1ZXN0IG1hY2hpbmUuIEkgdHJpZWQgdXNpbmfCoHNkbCwgaW5jbHVkZWQgYmVsb3cgbGluZSBp
biBndWVzdC5jb25mIGZpbGU8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHZmYj0gWyAmIzM5
O3NkbD0xJiMzOTsgXTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IEJ1dCBpdCBpcyB0aHJvd2luZyBiZWxvdyBlcnJvcjo8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyByb290QHJhc3BiZXJy
eXBpNC02NDp+L2d1ZXN0MSMgeGwgY3JlYXRlIC1jIGd1ZXN0MS5jZmc8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IFBhcnNpbmcgY29uZmlnIGZyb20gZ3Vlc3QxLmNmZzxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgbGlieGw6IGVycm9yOiBsaWJ4bF9xbXAuYzoxNDAwOnFtcF9ldl9mZF9j
YWxsYmFjazogRG9tYWluIDM6ZXJyb3Igb24gUU1QIHNvY2tldDogQ29ubmVjdGlvbjxicj4NCiZn
dDvCoCDCoCDCoCDCoHJlc2V0IGJ5PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgcGVlcjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgbGlieGw6IGVy
cm9yOiBsaWJ4bF9xbXAuYzoxNDM5OnFtcF9ldl9mZF9jYWxsYmFjazogRG9tYWluIDM6RXJyb3Ig
aGFwcGVuZWQgd2l0aCB0aGUgUU1QPGJyPg0KJmd0O8KgIMKgIMKgIMKgY29ubmVjdGlvbiB0bzxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoFFFTVU8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGxpYnhsOiBlcnJvcjogbGlieGxfZG0uYzozMzUxOmRl
dmljZV9tb2RlbF9wb3N0Y29uZmlnX2RvbmU6IERvbWFpbiAzOlBvc3QgRE0gc3RhcnR1cCBjb25m
aWdzPGJyPg0KJmd0O8KgIMKgIMKgIMKgZmFpbGVkLDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoHJjPS0yNjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDsgbGlieGw6IGVycm9yOiBsaWJ4bF9jcmVhdGUuYzoxODY3OmRvbWNyZWF0ZV9kZXZtb2RlbF9z
dGFydGVkOiBEb21haW4gMzpkZXZpY2UgbW9kZWwgZGlkIG5vdDxicj4NCiZndDvCoCDCoCDCoCDC
oHN0YXJ0Ojxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoC0yNjxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDsgbGlieGw6IGVycm9yOiBsaWJ4bF9hb3V0aWxzLmM6NjQ2OmxpYnhs
X19raWxsX3hzX3BhdGg6IERldmljZSBNb2RlbCBhbHJlYWR5IGV4aXRlZDxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgbGlieGw6IGVycm9yOiBsaWJ4bF9kb21haW4uYzoxMTgzOmxpYnhsX19k
ZXN0cm95X2RvbWlkOiBEb21haW4gMzpOb24tZXhpc3RhbnQgZG9tYWluPGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0OyBsaWJ4bDogZXJyb3I6IGxpYnhsX2RvbWFpbi5jOjExMzc6ZG9tYWluX2Rl
c3Ryb3lfY2FsbGJhY2s6IERvbWFpbiAzOlVuYWJsZSB0byBkZXN0cm95IGd1ZXN0PGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0OyBsaWJ4bDogZXJyb3I6IGxpYnhsX2RvbWFpbi5jOjEwNjQ6ZG9t
YWluX2Rlc3Ryb3lfY2I6IERvbWFpbiAzOkRlc3RydWN0aW9uIG9mIGRvbWFpbiBmYWlsZWQ8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBBbm90
aGVyIHdheSBpcyBWTkMsIGkgY291bGQgaW5zdGFsbCB0aWdlcnZuYyBpbiBET00wIGJ1dCBzYW1l
IGkgY291bGRuJiMzOTt0IGluIGd1ZXN0IG1hY2hpbmU8YnI+DQomZ3Q7wqAgwqAgwqAgwqBiZWNh
dXNlIGl0PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
ZG9lc24mIzM5O3Qgc3VwcG9ydDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoHgxMShzdXBwb3J0cyB3
YXlsYW5kPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBvbmx5KS4gSSBhbSBjb21wbGV0ZWx5
IGJsb2NrZWQgaGVyZSwgTmVlZCB5b3VyIHN1cHBvcnQgdG8gZW5hYmxlIHRoZSBkaXNwbGF5IHVw
Ljxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgQW55IGFsdGVybmF0aXZlIG9mIFZOQyB3aGlj
aCBjb3VsZCB3b3JrIGluIGJvdGggeDExICZhbXA7IHdheWxhbmQgc3VwcG9ydGVkIGltYWdlcz88
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBB
bnkgaW5wdXQgb24gVk5DLCBTREwgb3IgYW55IG90aGVyIHdheSB0byBwcm9jZWVkIG9uIHRoaXM/
IExvb2tpbmcgZm9yd2FyZCB0byBoZWFyaW5nIGZyb208YnI+DQomZ3Q7wqAgwqAgwqAgwqB5b3Uu
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsg
UmVnYXJkcyw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFZpcHVsIEt1bWFyPGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0
OyA8YnI+DQomZ3Q7IDxicj4NCiZndDsgPC9ibG9ja3F1b3RlPjwvZGl2Pg0K
--0000000000009896a005ef7cbba0--

