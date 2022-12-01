Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0EB63F652
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 18:42:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451098.708706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0nZs-0003h9-Dn; Thu, 01 Dec 2022 17:42:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451098.708706; Thu, 01 Dec 2022 17:42:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0nZs-0003fN-Ap; Thu, 01 Dec 2022 17:42:28 +0000
Received: by outflank-mailman (input) for mailman id 451098;
 Thu, 01 Dec 2022 17:42:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v6DZ=37=gmail.com=vsuneja63@srs-se1.protection.inumbo.net>)
 id 1p0nZq-0003fH-Ab
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 17:42:26 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 826b8b5b-719f-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 18:42:22 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id e27so5891463ejc.12
 for <xen-devel@lists.xenproject.org>; Thu, 01 Dec 2022 09:42:22 -0800 (PST)
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
X-Inumbo-ID: 826b8b5b-719f-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iWsoV7QWvvXLhPBI2gCCG0Rn+WPm4MwZk07+1qlxsEw=;
        b=Q3u9eV3VyPnjtpV/2ZDAarD2OSrpkwLpozhSmrIv0nkpqn2XlzfYpfep69IwV+Swh4
         BMjI+EcI9ocDPMelDiytYFMIJ6WyTtMMCtW5UJKMda1sJUxB8CnYXUjds0lNLsSiu8V2
         vx+D+lnfEDxjZydthE5tzr7769gRnwUQyhmlXI7SV0MCQG9DKKb/Fs9uBOD7BcbsxhTC
         Hn/GqdfkBM1Dh306zti3cDJZjT6eZd77rgZKoT+BC5CALeiqVHttBzeoxSnhMVKadfgu
         dHeXdkcNyWl2K4HdoMYvmDmLsZlwFSzGtTHI06vbhs8DcHxcu606uGCQpgM9awLEI117
         BAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iWsoV7QWvvXLhPBI2gCCG0Rn+WPm4MwZk07+1qlxsEw=;
        b=h4TI7hkN8Nz04eT0aWQ7Y27Y/I/B/CVMkc+Xltes706WfAZEui/d2CpgI3D4SFhYsI
         MEiY4KvuQDP3o4offZ48Haf7NUasKCbOXZpqrAIdzkqP6cSDsPLFR7C0ku/GV+GnkK34
         0XvC6GPvuc+szT4ygnD6IwkA6pt+sjfPWfLkPhR8IRvlYCDNpkW4PrviZW6HhAM+9/f7
         BsGQ1P6/cNGt8c8iSZ99RHdklEtl+OYP0s+fR/T3OH3b7K3zc+TADWz+JHSUU9IOtZFT
         Zzti4QZbfQQPjdyZSlgmIuxcWKMWb23bbGIOvfpGgntr+BsUO0esaICGshgDD+3Qs4oy
         /cIQ==
X-Gm-Message-State: ANoB5plf6ocR2AjQCy6QBZkeiXc3Y62vDOpqHFrgXDWwbGOjgEsn1JdG
	77y9jzNm2OVhgHv30mrdveORrPPcSJN6Wel9rREbDU82f+FwyQ==
X-Google-Smtp-Source: AA0mqf5HvyZz3PVkZUgzSaJnoIb/6ttpD59OYPi4Nv++cCrslL+1g4RZ61G/NxTRG2x+4+LygKSm0xThPlnw8UGE/UE=
X-Received: by 2002:a17:906:80c2:b0:7c0:7db7:e1af with SMTP id
 a2-20020a17090680c200b007c07db7e1afmr14780664ejx.596.1669916541133; Thu, 01
 Dec 2022 09:42:21 -0800 (PST)
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
 <CALAP8f8zGfNA_CZU4UQXy7-rPT6dqih9XpzuKM3vvkoBvy6usg@mail.gmail.com> <alpine.DEB.2.22.394.2211221605470.1049131@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2211221605470.1049131@ubuntu-linux-20-04-desktop>
From: Vipul Suneja <vsuneja63@gmail.com>
Date: Thu, 1 Dec 2022 23:12:03 +0530
Message-ID: <CALAP8f_QiHN4dP3z+LQgKdGeo8-=9DMyk0W7+x6P2eHvnOD_wQ@mail.gmail.com>
Subject: Re: Porting Xen in raspberry pi4B
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, oleksandr_andrushchenko@epam.com, 
	oleksandr_tyshchenko@epam.com, jgross@suse.com, boris.ostrovsky@oracle.com, 
	Bertrand.Marquis@arm.com
Content-Type: multipart/alternative; boundary="0000000000003d2c8b05eec7bea0"

--0000000000003d2c8b05eec7bea0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefano,

Thanks!

I am exploring both options here, modification of framebuffer source file &
setting up x11vnc server in guest.
Other than these I would like to share a few findings with you.

1. If i keep "CONFIG_XEN_FBDEV_FRONTEND=3Dy" then xen-fbfront.ko is not
generating but if i keep "CONFIG_XEN_FBDEV_FRONTEND=3Dm"
then could see xen-fbfront.ko & its loading also. Same things with other
frontend/backend drivers also. Do we need to configure these drivers as a
module(m) only?

2. I could see xenstored service is running for the host but it's always
failing for the guest machine. I could see it in bootup logs & via
systemctl status also.
Below are the logs:













































*[  OK  ] Reached target Basic System.[  OK  ] Started Kernel Logging
Service.[  OK  ] Started System Logging Service.         Starting D-Bus
System Message Bus...         Starting User Login Management...
 Starting Permit User Sessions...         Starting The Xen xenstore...
   Starting OpenSSH Key Generation...[FAILED] Failed to start The Xen
xenstore.See 'systemctl status xenstored.service' for details.[DEPEND]
Dependency failed for qemu for xen dom0 disk backend.[DEPEND] Dependency
failed for Xend=E2=80=A6p guests on boot and shutdown.[DEPEND] Dependency f=
ailed
for xen-=E2=80=A6des, JSON configuration stub).[DEPEND] Dependency failed f=
or
Xenc=E2=80=A6guest consoles and hypervisor.[  OK  ] Finished Permit User Se=
ssions.[
 OK  ] Started Getty on tty1.[  OK  ] Started Serial Getty on hvc0.[  OK  ]
Started Serial Getty on ttyS0.[  OK  ] Reached target Login Prompts.
 Starting Xen-watchdog - run xen watchdog daemon...[  OK  ] Started D-Bus
System Message Bus.[  OK  ] Started Xen-watchdog - run xen watchdog
daemon.[  OK  ] Finished OpenSSH Key Generation.[  OK  ] Started User Login
Management.[  OK  ] Reached target Multi-User System.         Starting
Record Runlevel Change in UTMP...[  OK  ] Finished Record Runlevel Change
in UTMP.fbcon: Taking over consolePoky (Yocto Project Reference Distro)
4.0.4 raspberrypi4-64 hvc0raspberrypi4-64 login:
rootroot@raspberrypi4-64:~#root@raspberrypi4-64:~#root@raspberrypi4-64:~#
systemctl status xenstored.servicex xenstored.service - The Xen xenstore
 Loaded: loaded (/lib/systemd/system/xenstored.service; enabled; vendor
preset: enabled)     Active: failed (Result: exit-code) since Thu
2022-12-01 06:12:05 UTC; 26s ago    Process: 195 ExecStartPre=3D/bin/grep -=
q
control_d /proc/xen/capabilities (code=3Dexited, status=3D1/FAILURE)Dec 01
06:12:04 raspberrypi4-64 systemd[1]: Starting The Xen xenstore...Dec 01
06:12:05 raspberrypi4-64 systemd[1]: xenstored.service: Control
pro...UREDec 01 06:12:05 raspberrypi4-64 systemd[1]: xenstored.service:
Failed with...e'.Dec 01 06:12:05 raspberrypi4-64 systemd[1]: Failed to
start The Xen xenstore.Hint: Some lines were ellipsized, use -l to show in
full.*
*root@raspberrypi4-64:~# *

Any input on these?

Thanks & Regards,
Vipul Kumar

On Wed, Nov 23, 2022 at 5:41 AM Stefano Stabellini <sstabellini@kernel.org>
wrote:

> Hi Vipul,
>
> I cannot spot any issue in the configuration, in particual you have:
>
> CONFIG_XEN_FBDEV_FRONTEND=3Dy
>
> which is what you need.
>
> The only thing I can suggest is to add printks to the Linux frontend
> driver (the one running in the domU) which is
> drivers/video/fbdev/xen-fbfront.c and printfs to the QEMU backend
> (running in Dom0) which is hw/display/xenfb.c to figure out what is
> going on.
>
>
> Alternatively, you can setup PV network with the domU, such as:
>
>   vif=3D['']
>
> and then run x11 and a x11vnc server in your domU. You should be able to
> connect to it using vncviewer at the network IP of your domU.
>
> Basically you are skipping the problem because instead of using the PV
> framebuffer protocol, you just use VNC over the network with the domU.
>
>
> Cheers,
>
> Stefano
>
>
> On Tue, 22 Nov 2022, Vipul Suneja wrote:
> > Hi Stefano,
> > Thanks for the support!
> >
> > Looks like I have tried all the combinations & possible ways to get
> display up but failed. Is there any document or pdf for porting xen on
> > raspberrypi4.
> > I could find lot's of links telling the same but couldn't see any
> official user guide or document from the xen community on the same. If
> > there is something to refer
> > to please share with me.
> > I am attaching the kernel configuration file also, just take a look if =
i
> have missed anything.
> > Any other suggestions or input from your end could be really helpful?
> >
> > Regards,
> > Vipul Kumar
> >
> > On Fri, Nov 11, 2022 at 6:40 AM Stefano Stabellini <
> sstabellini@kernel.org> wrote:
> >       Hi Vipul,
> >
> >       Sorry for the late reply. From the earlier logs that you sent, it
> looks
> >       like everything should be working correctly. Specifically:
> >
> >            vfb =3D ""
> >             1 =3D ""
> >              0 =3D ""
> >               frontend =3D "/local/domain/1/device/vfb/0"
> >               frontend-id =3D "1"
> >               online =3D "1"
> >               state =3D "4"
> >               vnc =3D "1"
> >               vnclisten =3D "127.0.0.1"
> >               vncdisplay =3D "0"
> >               vncunused =3D "1"
> >               sdl =3D "0"
> >               opengl =3D "0"
> >               feature-resize =3D "1"
> >               hotplug-status =3D "connected"
> >               request-update =3D "1"
> >
> >       state "4" means "connected". So I would expect that you should be
> able
> >       to connect to the vnc server using vncviewer. You might not see
> anything
> >       (black screen) but you should definitely be able to connect.
> >
> >       I wouldn't try to launch x11 in the guest just yet. fbcon in Linu=
x
> is
> >       enough to render something on the screen. You should be able to
> see the
> >       Linux text-based console rendered graphically, connecting to it
> via vnc.
> >
> >       Sorry for the basic question, but have you tried all the followin=
g?
> >
> >       vncviewer 127.0.0.1:0
> >       vncviewer 127.0.0.1:1
> >       vncviewer 127.0.0.1:2
> >       vncviewer 127.0.0.1:5900
> >       vncviewer 127.0.0.1:5901
> >       vncviewer 127.0.0.1:5902
> >
> >       Given that from the xenstore-ls logs everything seems to work
> correctly
> >       I am not sure what else to suggest. You might have to add printf
> to QEMU
> >       ui/vnc.c and hw/display/xenfb.c to see what is going wrong.
> >
> >       Cheers,
> >
> >       Stefano
> >
> >
> >       On Mon, 7 Nov 2022, Vipul Suneja wrote:
> >       > Hi Stefano,
> >       > Thanks!
> >       >
> >       > Any input further on "xenstore-ls" logs?
> >       >
> >       > I am trying to run the x0vncserver & x11vnc server manually on
> guest machine(xen_guest_image_minimal) image but it's failing
> >       with the below
> >       > error.
> >       >
> >       > root@raspberrypi4-64:/usr/bin# x0vncserver
> >       > x0vncserver: unable to open display ""
> >       > root@raspberrypi4-64:/usr/bin#
> >       > root@raspberrypi4-64:/usr/bin# x11vnc
> >       > ###############################################################
> >       > #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
> >       > #@                                                           @#
> >       > #@  **  WARNING  **  WARNING  **  WARNING  **  WARNING  **   @#
> >       > #@                                                           @#
> >       > #@        YOU ARE RUNNING X11VNC WITHOUT A PASSWORD!!        @#
> >       > #@                                                           @#
> >       > #@  This means anyone with network access to this computer   @#
> >       > #@  may be able to view and control your desktop.            @#
> >       > #@                                                           @#
> >       > #@ >>> If you did not mean to do this Press CTRL-C now!! <<< @#
> >       > #@                                                           @#
> >       > #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
> >       > #@                                                           @#
> >       > #@  You can create an x11vnc password file by running:       @#
> >       > #@                                                           @#
> >       > #@       x11vnc -storepasswd password /path/to/passfile      @#
> >       > #@  or   x11vnc -storepasswd /path/to/passfile               @#
> >       > #@  or   x11vnc -storepasswd                                 @#
> >       > #@                                                           @#
> >       > #@  (the last one will use ~/.vnc/passwd)                    @#
> >       > #@                                                           @#
> >       > #@  and then starting x11vnc via:                            @#
> >       > #@                                                           @#
> >       > #@      x11vnc -rfbauth /path/to/passfile                    @#
> >       > #@                                                           @#
> >       > #@  an existing ~/.vnc/passwd file from another VNC          @#
> >       > #@  application will work fine too.                          @#
> >       > #@                                                           @#
> >       > #@  You can also use the -passwdfile or -passwd options.     @#
> >       > #@  (note -passwd is unsafe if local users are not trusted)  @#
> >       > #@                                                           @#
> >       > #@  Make sure any -rfbauth and -passwdfile password files    @#
> >       > #@  cannot be read by untrusted users.                       @#
> >       > #@                                                           @#
> >       > #@  Use x11vnc -usepw to automatically use your              @#
> >       > #@  ~/.vnc/passwd or ~/.vnc/passwdfile password files.       @#
> >       > #@  (and prompt you to create ~/.vnc/passwd if neither       @#
> >       > #@  file exists.)  Under -usepw, x11vnc will exit if it      @#
> >       > #@  cannot find a password to use.                           @#
> >       > #@                                                           @#
> >       > #@                                                           @#
> >       > #@  Even with a password, the subsequent VNC traffic is      @#
> >       > #@  sent in the clear.  Consider tunnelling via ssh(1):      @#
> >       > #@                                                           @#
> >       > #@    http://www.karlrunge.com/x11vnc/#tunnelling            @#
> >       > #@                                                           @#
> >       > #@  Or using the x11vnc SSL options: -ssl and -stunnel       @#
> >       > #@                                                           @#
> >       > #@  Please Read the documentation for more info about        @#
> >       > #@  passwords, security, and encryption.                     @#
> >       > #@                                                           @#
> >       > #@    http://www.karlrunge.com/x11vnc/faq.html#faq-passwd    @#
> >       > #@                                                           @#
> >       > #@  To disable this warning use the -nopw option, or put     @#
> >       > #@  'nopw' on a line in your ~/.x11vncrc file.               @#
> >       > #@                                                           @#
> >       > #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
> >       > ###############################################################
> >       > 09/03/2018 12:58:41 x11vnc version: 0.9.16 lastmod: 2019-01-05
>  pid: 424
> >       > 09/03/2018 12:58:41 XOpenDisplay("") failed.
> >       > 09/03/2018 12:58:41 Trying again with
> XAUTHLOCALHOSTNAME=3Dlocalhost ...
> >       > 09/03/2018 12:58:41
> >       > 09/03/2018 12:58:41 *** XOpenDisplay failed. No -display or
> DISPLAY.
> >       > 09/03/2018 12:58:41 *** Trying ":0" in 4 seconds.  Press Ctrl-C
> to abort.
> >       > 09/03/2018 12:58:41 *** 1 2 3 4
> >       > 09/03/2018 12:58:45 XOpenDisplay(":0") failed.
> >       > 09/03/2018 12:58:45 Trying again with
> XAUTHLOCALHOSTNAME=3Dlocalhost ...
> >       > 09/03/2018 12:58:45 XOpenDisplay(":0") failed.
> >       > 09/03/2018 12:58:45 Trying again with unset XAUTHLOCALHOSTNAME
> ...
> >       > 09/03/2018 12:58:45
> >       >
> >       > 09/03/2018 12:58:45 ***************************************
> >       > 09/03/2018 12:58:45 *** XOpenDisplay failed (:0)
> >       >
> >       > *** x11vnc was unable to open the X DISPLAY: ":0", it cannot
> continue.
> >       > *** There may be "Xlib:" error messages above with details abou=
t
> the failure.
> >       >
> >       > Some tips and guidelines:
> >       >
> >       > ** An X server (the one you wish to view) must be running befor=
e
> x11vnc is
> >       >    started: x11vnc does not start the X server.  (however, see
> the -create
> >       >    option if that is what you really want).
> >       >
> >       > ** You must use -display <disp>, -OR- set and export your
> $DISPLAY
> >       >    environment variable to refer to the display of the desired =
X
> server.
> >       >  - Usually the display is simply ":0" (in fact x11vnc uses this
> if you forget
> >       >    to specify it), but in some multi-user situations it could b=
e
> ":1", ":2",
> >       >    or even ":137".  Ask your administrator or a guru if you are
> having
> >       >    difficulty determining what your X DISPLAY is.
> >       >
> >       > ** Next, you need to have sufficient permissions (Xauthority)
> >       >    to connect to the X DISPLAY.   Here are some Tips:
> >       >
> >       >  - Often, you just need to run x11vnc as the user logged into
> the X session.
> >       >    So make sure to be that user when you type x11vnc.
> >       >  - Being root is usually not enough because the incorrect
> MIT-MAGIC-COOKIE
> >       >    file may be accessed.  The cookie file contains the secret
> key that
> >       >    allows x11vnc to connect to the desired X DISPLAY.
> >       >  - You can explicitly indicate which MIT-MAGIC-COOKIE file
> should be used
> >       >    by the -auth option, e.g.:
> >       >        x11vnc -auth /home/someuser/.Xauthority -display :0
> >       >        x11vnc -auth /tmp/.gdmzndVlR -display :0
> >       >    you must have read permission for the auth file.
> >       >    See also '-auth guess' and '-findauth' discussed below.
> >       >
> >       > ** If NO ONE is logged into an X session yet, but there is a
> greeter login
> >       >    program like "gdm", "kdm", "xdm", or "dtlogin" running, you
> will need
> >       >    to find and use the raw display manager MIT-MAGIC-COOKIE fil=
e.
> >       >    Some examples for various display managers:
> >       >
> >       >      gdm:     -auth /var/gdm/:0.Xauth
> >       >               -auth /var/lib/gdm/:0.Xauth
> >       >      kdm:     -auth /var/lib/kdm/A:0-crWk72
> >       >               -auth /var/run/xauth/A:0-crWk72
> >       >      xdm:     -auth /var/lib/xdm/authdir/authfiles/A:0-XQvaJk
> >       >      dtlogin: -auth /var/dt/A:0-UgaaXa
> >       >
> >       >    Sometimes the command "ps wwwwaux | grep auth" can reveal th=
e
> file location.
> >       >
> >       >    Starting with x11vnc 0.9.9 you can have it try to guess by
> using:
> >       >
> >       >               -auth guess
> >       >
> >       >    (see also the x11vnc -findauth option.)
> >       >
> >       >    Only root will have read permission for the file, and so
> x11vnc must be run
> >       >    as root (or copy it).  The random characters in the filename=
s
> will of course
> >       >    change and the directory the cookie file resides in is syste=
m
> dependent.
> >       >
> >       > See also: http://www.karlrunge.com/x11vnc/faq.html
> >       >
> >       > Regards,
> >       > Vipul Kumar
> >       >
> >       > On Thu, Nov 3, 2022 at 10:27 PM Vipul Suneja <
> vsuneja63@gmail.com> wrote:
> >       >       Hi Stefano,
> >       > Thanks!
> >       >
> >       > I used xen-guest-image-minimal(simple console based image) as a
> guest with fbcon & fbdev enabled in kernel configurations but
> >       still
> >       > the same error can't open the display.
> >       > below are the outcome of "xenstore-ls":
> >       >
> >       > root@raspberrypi4-64:~/guest1# xenstore-ls
> >       > tool =3D ""
> >       >  xenstored =3D ""
> >       > local =3D ""
> >       >  domain =3D ""
> >       >   0 =3D ""
> >       >    control =3D ""
> >       >     feature-poweroff =3D "1"
> >       >     feature-reboot =3D "1"
> >       >    domid =3D "0"
> >       >    name =3D "Domain-0"
> >       >    device-model =3D ""
> >       >     0 =3D ""
> >       >      backends =3D ""
> >       >       console =3D ""
> >       >       vkbd =3D ""
> >       >       vfb =3D ""
> >       >       qnic =3D ""
> >       >      state =3D "running"
> >       >     1 =3D ""
> >       >      backends =3D ""
> >       >       console =3D ""
> >       >       vkbd =3D ""
> >       >       vfb =3D ""
> >       >       qnic =3D ""
> >       >      state =3D "running"
> >       >    backend =3D ""
> >       >     vbd =3D ""
> >       >      1 =3D ""
> >       >       51712 =3D ""
> >       >        frontend =3D "/local/domain/1/device/vbd/51712"
> >       >        params =3D
> "/home/root/guest2/xen-guest-image-minimal-raspberrypi4-64.ext3"
> >       >        script =3D "/etc/xen/scripts/block"
> >       >        frontend-id =3D "1"
> >       >        online =3D "1"
> >       >        removable =3D "0"
> >       >        bootable =3D "1"
> >       >        state =3D "4"
> >       >        dev =3D "xvda"
> >       >        type =3D "phy"
> >       >        mode =3D "w"
> >       >        device-type =3D "disk"
> >       >        discard-enable =3D "1"
> >       >        feature-max-indirect-segments =3D "256"
> >       >        multi-queue-max-queues =3D "4"
> >       >        max-ring-page-order =3D "4"
> >       >        node =3D "/dev/loop0"
> >       >        physical-device =3D "7:0"
> >       >        physical-device-path =3D "/dev/loop0"
> >       >        hotplug-status =3D "connected"
> >       >        feature-flush-cache =3D "1"
> >       >        discard-granularity =3D "4096"
> >       >        discard-alignment =3D "0"
> >       >        discard-secure =3D "0"
> >       >        feature-discard =3D "1"
> >       >        feature-barrier =3D "1"
> >       >        feature-persistent =3D "1"
> >       >        sectors =3D "1794048"
> >       >        info =3D "0"
> >       >        sector-size =3D "512"
> >       >        physical-sector-size =3D "512"
> >       >     vfb =3D ""
> >       >      1 =3D ""
> >       >       0 =3D ""
> >       >        frontend =3D "/local/domain/1/device/vfb/0"
> >       >        frontend-id =3D "1"
> >       >        online =3D "1"
> >       >        state =3D "4"
> >       >        vnc =3D "1"
> >       >        vnclisten =3D "127.0.0.1"
> >       >        vncdisplay =3D "0"
> >       >        vncunused =3D "1"
> >       >        sdl =3D "0"
> >       >        opengl =3D "0"
> >       >        feature-resize =3D "1"
> >       >        hotplug-status =3D "connected"
> >       >        request-update =3D "1"
> >       >     vkbd =3D ""
> >       >      1 =3D ""
> >       >       0 =3D ""
> >       >        frontend =3D "/local/domain/1/device/vkbd/0"
> >       >        frontend-id =3D "1"
> >       >        online =3D "1"
> >       >        state =3D "4"
> >       >        feature-abs-pointer =3D "1"
> >       >        feature-raw-pointer =3D "1"
> >       >        hotplug-status =3D "connected"
> >       >     console =3D ""
> >       >      1 =3D ""
> >       >       0 =3D ""
> >       >        frontend =3D "/local/domain/1/console"
> >       >        frontend-id =3D "1"
> >       >        online =3D "1"
> >       >        state =3D "1"
> >       >        protocol =3D "vt100"
> >       >     vif =3D ""
> >       >      1 =3D ""
> >       >       0 =3D ""
> >       >        frontend =3D "/local/domain/1/device/vif/0"
> >       >        frontend-id =3D "1"
> >       >        online =3D "1"
> >       >        state =3D "4"
> >       >        script =3D "/etc/xen/scripts/vif-bridge"
> >       >        mac =3D "e4:5f:01:cd:7b:dd"
> >       >        bridge =3D "xenbr0"
> >       >        handle =3D "0"
> >       >        type =3D "vif"
> >       >        hotplug-status =3D "connected"
> >       >        feature-sg =3D "1"
> >       >        feature-gso-tcpv4 =3D "1"
> >       >        feature-gso-tcpv6 =3D "1"
> >       >        feature-ipv6-csum-offload =3D "1"
> >       >        feature-rx-copy =3D "1"
> >       >        feature-xdp-headroom =3D "1"
> >       >        feature-rx-flip =3D "0"
> >       >        feature-multicast-control =3D "1"
> >       >        feature-dynamic-multicast-control =3D "1"
> >       >        feature-split-event-channels =3D "1"
> >       >        multi-queue-max-queues =3D "4"
> >       >        feature-ctrl-ring =3D "1"
> >       >   1 =3D ""
> >       >    vm =3D "/vm/d81ec5a9-5bf9-4f2b-89e8-0f60d6da948f"
> >       >    name =3D "guest2"
> >       >    cpu =3D ""
> >       >     0 =3D ""
> >       >      availability =3D "online"
> >       >     1 =3D ""
> >       >      availability =3D "online"
> >       >    memory =3D ""
> >       >     static-max =3D "2097152"
> >       >     target =3D "2097152"
> >       >     videoram =3D "0"
> >       >    device =3D ""
> >       >     suspend =3D ""
> >       >      event-channel =3D ""
> >       >     vbd =3D ""
> >       >      51712 =3D ""
> >       >       backend =3D "/local/domain/0/backend/vbd/1/51712"
> >       >       backend-id =3D "0"
> >       >       state =3D "4"
> >       >       virtual-device =3D "51712"
> >       >       device-type =3D "disk"
> >       >       multi-queue-num-queues =3D "2"
> >       >       queue-0 =3D ""
> >       >        ring-ref =3D "8"
> >       >        event-channel =3D "4"
> >       >       queue-1 =3D ""
> >       >        ring-ref =3D "9"
> >       >        event-channel =3D "5"
> >       >       protocol =3D "arm-abi"
> >       >       feature-persistent =3D "1"
> >       >     vfb =3D ""
> >       >      0 =3D ""
> >       >       backend =3D "/local/domain/0/backend/vfb/1/0"
> >       >       backend-id =3D "0"
> >       >       state =3D "4"
> >       >       page-ref =3D "275022"
> >       >       event-channel =3D "3"
> >       >       protocol =3D "arm-abi"
> >       >       feature-update =3D "1"
> >       >     vkbd =3D ""
> >       >      0 =3D ""
> >       >       backend =3D "/local/domain/0/backend/vkbd/1/0"
> >       >       backend-id =3D "0"
> >       >       state =3D "4"
> >       >       request-abs-pointer =3D "1"
> >       >       page-ref =3D "275322"
> >       >       page-gref =3D "1284"
> >       >       event-channel =3D "10"
> >       >     vif =3D ""
> >       >      0 =3D ""
> >       >       backend =3D "/local/domain/0/backend/vif/1/0"
> >       >       backend-id =3D "0"
> >       >       state =3D "4"
> >       >       handle =3D "0"
> >       >       mac =3D "e4:5f:01:cd:7b:dd"
> >       >       mtu =3D "1500"
> >       >       xdp-headroom =3D "0"
> >       >       multi-queue-num-queues =3D "2"
> >       >       queue-0 =3D ""
> >       >        tx-ring-ref =3D "1280"
> >       >        rx-ring-ref =3D "1281"
> >       >        event-channel-tx =3D "6"
> >       >        event-channel-rx =3D "7"
> >       >       queue-1 =3D ""
> >       >        tx-ring-ref =3D "1282"
> >       >        rx-ring-ref =3D "1283"
> >       >        event-channel-tx =3D "8"
> >       >        event-channel-rx =3D "9"
> >       >       request-rx-copy =3D "1"
> >       >       feature-rx-notify =3D "1"
> >       >       feature-sg =3D "1"
> >       >       feature-gso-tcpv4 =3D "1"
> >       >       feature-gso-tcpv6 =3D "1"
> >       >       feature-ipv6-csum-offload =3D "1"
> >       >    control =3D ""
> >       >     shutdown =3D ""
> >       >     feature-poweroff =3D "1"
> >       >     feature-reboot =3D "1"
> >       >     feature-suspend =3D ""
> >       >     sysrq =3D ""
> >       >     platform-feature-multiprocessor-suspend =3D "1"
> >       >     platform-feature-xs_reset_watches =3D "1"
> >       >    data =3D ""
> >       >    drivers =3D ""
> >       >    feature =3D ""
> >       >    attr =3D ""
> >       >    error =3D ""
> >       >    domid =3D "1"
> >       >    store =3D ""
> >       >     port =3D "1"
> >       >     ring-ref =3D "233473"
> >       >    console =3D ""
> >       >     backend =3D "/local/domain/0/backend/console/1/0"
> >       >     backend-id =3D "0"
> >       >     limit =3D "1048576"
> >       >     type =3D "xenconsoled"
> >       >     output =3D "pty"
> >       >     tty =3D "/dev/pts/1"
> >       >     port =3D "2"
> >       >     ring-ref =3D "233472"
> >       >     vnc-listen =3D "127.0.0.1"
> >       >     vnc-port =3D "5900"
> >       >    image =3D ""
> >       >     device-model-pid =3D "788"
> >       > vm =3D ""
> >       >  d81ec5a9-5bf9-4f2b-89e8-0f60d6da948f =3D ""
> >       >   name =3D "guest2"
> >       >   uuid =3D "d81ec5a9-5bf9-4f2b-89e8-0f60d6da948f"
> >       >   start_time =3D "1520600274.27"
> >       > libxl =3D ""
> >       >  1 =3D ""
> >       >   device =3D ""
> >       >    vbd =3D ""
> >       >     51712 =3D ""
> >       >      frontend =3D "/local/domain/1/device/vbd/51712"
> >       >      backend =3D "/local/domain/0/backend/vbd/1/51712"
> >       >      params =3D
> "/home/root/guest2/xen-guest-image-minimal-raspberrypi4-64.ext3"
> >       >      script =3D "/etc/xen/scripts/block"
> >       >      frontend-id =3D "1"
> >       >      online =3D "1"
> >       >      removable =3D "0"
> >       >      bootable =3D "1"
> >       >      state =3D "1"
> >       >      dev =3D "xvda"
> >       >      type =3D "phy"
> >       >      mode =3D "w"
> >       >      device-type =3D "disk"
> >       >      discard-enable =3D "1"
> >       >    vfb =3D ""
> >       >     0 =3D ""
> >       >      frontend =3D "/local/domain/1/device/vfb/0"
> >       >      backend =3D "/local/domain/0/backend/vfb/1/0"
> >       >      frontend-id =3D "1"
> >       >      online =3D "1"
> >       >      state =3D "1"
> >       >      vnc =3D "1"
> >       >      vnclisten =3D "127.0.0.1"
> >       >      vncdisplay =3D "0"
> >       >      vncunused =3D "1"
> >       >      sdl =3D "0"
> >       >      opengl =3D "0"
> >       >    vkbd =3D ""
> >       >     0 =3D ""
> >       >      frontend =3D "/local/domain/1/device/vkbd/0"
> >       >      backend =3D "/local/domain/0/backend/vkbd/1/0"
> >       >      frontend-id =3D "1"
> >       >      online =3D "1"
> >       >      state =3D "1"
> >       >    console =3D ""
> >       >     0 =3D ""
> >       >      frontend =3D "/local/domain/1/console"
> >       >      backend =3D "/local/domain/0/backend/console/1/0"
> >       >      frontend-id =3D "1"
> >       >      online =3D "1"
> >       >      state =3D "1"
> >       >      protocol =3D "vt100"
> >       >    vif =3D ""
> >       >     0 =3D ""
> >       >      frontend =3D "/local/domain/1/device/vif/0"
> >       >      backend =3D "/local/domain/0/backend/vif/1/0"
> >       >      frontend-id =3D "1"
> >       >      online =3D "1"
> >       >      state =3D "1"
> >       >      script =3D "/etc/xen/scripts/vif-bridge"
> >       >      mac =3D "e4:5f:01:cd:7b:dd"
> >       >      bridge =3D "xenbr0"
> >       >      handle =3D "0"
> >       >      type =3D "vif"
> >       >      hotplug-status =3D ""
> >       >   type =3D "pvh"
> >       >   dm-version =3D "qemu_xen"
> >       > root@raspberrypi4-64:~/guest1#
> >       >
> >       > Any input as per above? Looking forward to hearing from you.
> >       >
> >       > Regards,
> >       > Vipul Kumar
> >       >
> >       > On Wed, Oct 26, 2022 at 5:21 AM Stefano Stabellini <
> sstabellini@kernel.org> wrote:
> >       >       Hi Vipul,
> >       >
> >       >       If you look at the QEMU logs, it says:
> >       >
> >       >       VNC server running on 127.0.0.1:5900
> >       >
> >       >       That is the VNC server you need to connect to. So in
> theory:
> >       >
> >       >         vncviewer 127.0.0.1:5900
> >       >
> >       >       should work correctly.
> >       >
> >       >
> >       >       If you have:
> >       >
> >       >         vfb =3D ["type=3Dvnc"]
> >       >
> >       >       in your xl config file and you have "fbdev" in your Linux
> guest, it
> >       >       should work.
> >       >
> >       >       If you connect to the VNC server but you get a black
> screen, it might be
> >       >       a guest configuration issue. I would try with a simpler
> guest, text only
> >       >       (no X11, no Wayland) and enable the fbdev console (fbcon)=
.
> See
> >       >       Documentation/fb/fbcon.rst in Linux. You should be able t=
o
> see a
> >       >       graphical console over VNC.
> >       >
> >       >       If that works, then you know that the fbdev kernel driver
> (xen-fbfront)
> >       >       works correctly.
> >       >
> >       >       If it doesn't work, the output of "xenstore-ls" would be
> interesting.
> >       >
> >       >       Cheers,
> >       >
> >       >       Stefano
> >       >
> >       >
> >       >       On Wed, 19 Oct 2022, Vipul Suneja wrote:
> >       >       > Hi Stefano,
> >       >       >
> >       >       > Thanks for the response!
> >       >       >
> >       >       > I am following the same link you shared from the
> beginning. Tried the command "vncviewer localhost:0" in DOM0 but
> >       same
> >       >       issue "Can't open
> >       >       > display", below are the logs:
> >       >       >
> >       >       > root@raspberrypi4-64:~# vncviewer localhost:0
> >       >       >
> >       >       > TigerVNC Viewer 64-bit v1.11.0
> >       >       > Built on: 2020-09-08 12:16
> >       >       > Copyright (C) 1999-2020 TigerVNC Team and many others
> (see README.rst)
> >       >       > See https://www.tigervnc.org for information on
> TigerVNC.
> >       >       > Can't open display:
> >       >       >
> >       >       > Below are the netstat logs, i couldn't see anything
> running at port 5900 or 5901:
> >       >       >
> >       >       > root@raspberrypi4-64:~# netstat -tuwx
> >       >       > Active Internet connections (w/o servers)
> >       >       > Proto Recv-Q Send-Q Local Address           Foreign
> Address         State
> >       >       > tcp        0    164 192.168.1.39:ssh
> 192.168.1.38:37472      ESTABLISHED
> >       >       > Active UNIX domain sockets (w/o servers)
> >       >       > Proto RefCnt Flags       Type       State         I-Nod=
e
> Path
> >       >       > unix  8      [ ]         DGRAM      CONNECTED      1056=
5
> /dev/log
> >       >       > unix  3      [ ]         STREAM     CONNECTED      1089=
1
> /var/run/xenstored/socket
> >       >       > unix  3      [ ]         STREAM     CONNECTED      1379=
1
> >       >       > unix  3      [ ]         STREAM     CONNECTED      1084=
3
> /var/run/xenstored/socket
> >       >       > unix  3      [ ]         STREAM     CONNECTED      1057=
3
> /var/run/xenstored/socket
> >       >       > unix  2      [ ]         DGRAM      CONNECTED      1451=
0
> >       >       > unix  3      [ ]         STREAM     CONNECTED      1324=
9
> >       >       > unix  2      [ ]         DGRAM      CONNECTED      1388=
7
> >       >       > unix  2      [ ]         DGRAM      CONNECTED      1059=
9
> >       >       > unix  3      [ ]         STREAM     CONNECTED      1400=
5
> >       >       > unix  3      [ ]         STREAM     CONNECTED      1325=
8
> >       >       > unix  3      [ ]         STREAM     CONNECTED      1324=
8
> >       >       > unix  3      [ ]         STREAM     CONNECTED      1400=
3
> >       >       > unix  3      [ ]         STREAM     CONNECTED      1057=
2
> /var/run/xenstored/socket
> >       >       > unix  3      [ ]         STREAM     CONNECTED      1078=
6
> /var/run/xenstored/socket
> >       >       > unix  3      [ ]         DGRAM      CONNECTED      1318=
6
> >       >       > unix  3      [ ]         STREAM     CONNECTED      1086=
4
> /var/run/xenstored/socket
> >       >       > unix  3      [ ]         STREAM     CONNECTED      1081=
2
> /var/run/xenstored/socket
> >       >       > unix  2      [ ]         DGRAM      CONNECTED      1408=
3
> >       >       > unix  3      [ ]         STREAM     CONNECTED      1081=
3
> /var/run/xenstored/socket
> >       >       > unix  3      [ ]         STREAM     CONNECTED      1406=
8
> >       >       > unix  3      [ ]         STREAM     CONNECTED      1325=
6
> >       >       > unix  3      [ ]         STREAM     CONNECTED      1057=
1
> /var/run/xenstored/socket
> >       >       > unix  3      [ ]         STREAM     CONNECTED      1084=
2
> >       >       > unix  3      [ ]         STREAM     CONNECTED      1398=
5
> >       >       > unix  3      [ ]         DGRAM      CONNECTED      1318=
5
> >       >       > unix  2      [ ]         STREAM     CONNECTED      1388=
4
> >       >       > unix  2      [ ]         DGRAM      CONNECTED      1452=
8
> >       >       > unix  2      [ ]         DGRAM      CONNECTED      1378=
5
> >       >       > unix  3      [ ]         STREAM     CONNECTED      1403=
4
> >       >       >
> >       >       > Attaching xen log files of /var/log/xen.
> >       >       > I didn't get the role of QEMU here because as mentioned
> earlier, I am porting in raspberrypi 4B.
> >       >       >
> >       >       > Regards,
> >       >       > Vipul Kumar
> >       >       >
> >       >       > On Wed, Oct 19, 2022 at 12:43 AM Stefano Stabellini <
> sstabellini@kernel.org> wrote:
> >       >       >       It usually works the way it is described in the
> guide:
> >       >       >
> >       >       >
> >       >
> >
> https://www.virtuatopia.com/index.php?title=3DConfiguring_a_VNC_based_Gra=
phical_Console_for_a_Xen_Paravirtualized_domainU_Guest
> >       >       >
> >       >       >       You don't need to install any VNC-related server
> software because it is
> >       >       >       already provided by Xen (to be precise it is
> provided by QEMU working
> >       >       >       together with Xen.)
> >       >       >
> >       >       >       You only need the vnc client in dom0 so that you
> can connect, but you
> >       >       >       could also run the vnc client outside from anothe=
r
> host. So basically
> >       >       >       the following should work when executed in Dom0
> after creating DomU:
> >       >       >
> >       >       >         vncviewer localhost:0
> >       >       >
> >       >       >       Can you attach the Xen and QEMU logs
> (/var/log/xen/*)? And also use
> >       >       >       netstat -taunp to check if there is anything
> running at port 5900 or
> >       >       >       5901?
> >       >       >
> >       >       >       Cheers,
> >       >       >
> >       >       >       Stefano
> >       >       >
> >       >       >
> >       >       >       On Tue, 18 Oct 2022, Vipul Suneja wrote:
> >       >       >       > Hi Stefano,
> >       >       >       >
> >       >       >       > Thanks for the response!
> >       >       >       >
> >       >       >       > I could install tigerVNC, x11vnc & libvncserver
> in Dom0 xen-image-minimal but only manage to install
> >       >       libvncserver(couldn't
> >       >       >       install tigervnc
> >       >       >       > & x11vnc because of x11
> >       >       >       > support missing, it's wayland) in DOMU custom
> graphical image. I tried running vncviewer with IP address &
> >       port
> >       >       in dom0 to
> >       >       >       access the domu
> >       >       >       > graphical image display as per below commands.
> >       >       >       >
> >       >       >       >  vncviewer 192.168.1.42:5901
> >       >       >       >
> >       >       >       >  But it showing can't open display, below are
> the logs:
> >       >       >       >
> >       >       >       > root@raspberrypi4-64:~/guest1# vncviewer
> 192.168.1.42:5901
> >       >       >       >
> >       >       >       > TigerVNC Viewer 64-bit v1.11.0
> >       >       >       > Built on: 2020-09-08 12:16
> >       >       >       > Copyright (C) 1999-2020 TigerVNC Team and many
> others (see README.rst)
> >       >       >       > See https://www.tigervnc.org for information on
> TigerVNC.
> >       >       >       > Can't open display:
> >       >       >       > root@raspberrypi4-64:~/guest1#
> >       >       >       >
> >       >       >       > I am not exactly sure what the issue is but I
> thought only libvncserver in DOMU could work to get access but
> >       it
> >       >       did not
> >       >       >       work.
> >       >       >       > If TigerVNC is the issue here then is there any
> other VNC source which could be installed for both x11 &
> >       >       wayland supported
> >       >       >       images?
> >       >       >       >
> >       >       >       > Regards,
> >       >       >       > Vipul Kumar
> >       >       >       >
> >       >       >       > On Tue, Oct 18, 2022 at 2:40 AM Stefano
> Stabellini <sstabellini@kernel.org> wrote:
> >       >       >       >       VNC is typically easier to setup, because
> SDL needs extra libraries at
> >       >       >       >       build time and runtime. If QEMU is built
> without SDL support it won't
> >       >       >       >       start when you ask for SDL.
> >       >       >       >
> >       >       >       >       VNC should work with both x11 and wayland
> in your domU. It doesn't work
> >       >       >       >       at the x11 level, it exposes a special
> fbdev device in your domU that
> >       >       >       >       should work with:
> >       >       >       >       - a graphical console in Linux domU
> >       >       >       >       - x11
> >       >       >       >       - wayland (but I haven't tested this so I
> am not 100% sure about it)
> >       >       >       >
> >       >       >       >       When you say "it doesn't work", what do
> you mean? Do you get a black
> >       >       >       >       window?
> >       >       >       >
> >       >       >       >       You need CONFIG_XEN_FBDEV_FRONTEND in
> Linux domU
> >       >       >       >       (drivers/video/fbdev/xen-fbfront.c). I
> would try to get a graphical text
> >       >       >       >       console up and running in your domU befor=
e
> attempting x11/wayland.
> >       >       >       >
> >       >       >       >       Cheers,
> >       >       >       >
> >       >       >       >       Stefano
> >       >       >       >
> >       >       >       >       On Mon, 17 Oct 2022, Vipul Suneja wrote:
> >       >       >       >       > Hi,
> >       >       >       >       > Thanks!
> >       >       >       >       >
> >       >       >       >       > I have ported xen minimal image as DOM0
> & custom wayland GUI based image as DOMU in raspberry pi4B. I
> >       >       am trying to
> >       >       >       make GUI
> >       >       >       >       display up
> >       >       >       >       > for guest machine. I tried using sdl,
> included below line in guest.conf file
> >       >       >       >       > vfb=3D [ 'sdl=3D1' ]
> >       >       >       >       >
> >       >       >       >       > But it is throwing below error:
> >       >       >       >       >
> >       >       >       >       > root@raspberrypi4-64:~/guest1# xl
> create -c guest1.cfg
> >       >       >       >       > Parsing config from guest1.cfg
> >       >       >       >       > libxl: error:
> libxl_qmp.c:1400:qmp_ev_fd_callback: Domain 3:error on QMP socket:
> Connection reset by
> >       >       peer
> >       >       >       >       > libxl: error:
> libxl_qmp.c:1439:qmp_ev_fd_callback: Domain 3:Error happened with the QMP
> connection to
> >       >       QEMU
> >       >       >       >       > libxl: error:
> libxl_dm.c:3351:device_model_postconfig_done: Domain 3:Post DM startup
> configs failed,
> >       >       rc=3D-26
> >       >       >       >       > libxl: error:
> libxl_create.c:1867:domcreate_devmodel_started: Domain 3:device model did
> not start:
> >       -26
> >       >       >       >       > libxl: error:
> libxl_aoutils.c:646:libxl__kill_xs_path: Device Model already exited
> >       >       >       >       > libxl: error:
> libxl_domain.c:1183:libxl__destroy_domid: Domain 3:Non-existant domain
> >       >       >       >       > libxl: error:
> libxl_domain.c:1137:domain_destroy_callback: Domain 3:Unable to destroy
> guest
> >       >       >       >       > libxl: error:
> libxl_domain.c:1064:domain_destroy_cb: Domain 3:Destruction of domain fai=
led
> >       >       >       >       >
> >       >       >       >       > Another way is VNC, i could install
> tigervnc in DOM0 but same i couldn't in guest machine because it
> >       >       doesn't support
> >       >       >       >       x11(supports wayland
> >       >       >       >       > only). I am completely blocked here,
> Need your support to enable the display up.
> >       >       >       >       > Any alternative of VNC which could work
> in both x11 & wayland supported images?
> >       >       >       >       >
> >       >       >       >       > Any input on VNC, SDL or any other way
> to proceed on this? Looking forward to hearing from you.
> >       >       >       >       >
> >       >       >       >       > Regards,
> >       >       >       >       > Vipul Kumar
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

--0000000000003d2c8b05eec7bea0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+SGkgU3RlZmFubyw8ZGl2Pjxicj48L2Rpdj48ZGl2PlRoYW5rcyE8L2Rp
dj48ZGl2Pjxicj48L2Rpdj48ZGl2PkkgYW0gZXhwbG9yaW5nIGJvdGggb3B0aW9ucyBoZXJlLCBt
b2RpZmljYXRpb24gb2YgZnJhbWVidWZmZXIgc291cmNlIGZpbGUgJmFtcDsgc2V0dGluZyB1cCB4
MTF2bmMgc2VydmVyIGluIGd1ZXN0LjwvZGl2PjxkaXY+T3RoZXIgdGhhbiB0aGVzZSBJIHdvdWxk
IGxpa2UgdG8gc2hhcmUgYSBmZXcgZmluZGluZ3Mgd2l0aCB5b3UuPC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdj4xLiBJZiBpIGtlZXAgJnF1b3Q7Q09ORklHX1hFTl9GQkRFVl9GUk9OVEVORD15JnF1
b3Q7IHRoZW4geGVuLWZiZnJvbnQua28gaXMgbm90IGdlbmVyYXRpbmcgYnV0IGlmIGkga2VlcCAm
cXVvdDtDT05GSUdfWEVOX0ZCREVWX0ZST05URU5EPW0mcXVvdDs8L2Rpdj48ZGl2PnRoZW4gY291
bGQgc2VlIHhlbi1mYmZyb250LmtvICZhbXA7IGl0cyBsb2FkaW5nIGFsc28uIFNhbWUgdGhpbmdz
IHdpdGggb3RoZXIgZnJvbnRlbmQvYmFja2VuZCBkcml2ZXJzIGFsc28uIERvIHdlIG5lZWQgdG8g
Y29uZmlndXJlwqB0aGVzZSBkcml2ZXJzIGFzIGEgbW9kdWxlKG0pIG9ubHk/PC9kaXY+PGRpdj48
YnI+PC9kaXY+PGRpdj4yLiBJIGNvdWxkIHNlZSB4ZW5zdG9yZWQgc2VydmljZSBpcyBydW5uaW5n
IGZvciB0aGUgaG9zdCBidXQgaXQmIzM5O3MgYWx3YXlzIGZhaWxpbmcgZm9yIHRoZSBndWVzdMKg
bWFjaGluZS4gSSBjb3VsZCBzZWUgaXQgaW4gYm9vdHVwIGxvZ3MgJmFtcDsgdmlhIHN5c3RlbWN0
bCBzdGF0dXMgYWxzby48L2Rpdj48ZGl2PkJlbG93IGFyZSB0aGUgbG9nczo8L2Rpdj48Yj5bIMKg
T0sgwqBdIFJlYWNoZWQgdGFyZ2V0IEJhc2ljIFN5c3RlbS48YnI+WyDCoE9LIMKgXSBTdGFydGVk
IEtlcm5lbCBMb2dnaW5nIFNlcnZpY2UuPGJyPlsgwqBPSyDCoF0gU3RhcnRlZCBTeXN0ZW0gTG9n
Z2luZyBTZXJ2aWNlLjxicj7CoCDCoCDCoCDCoCDCoFN0YXJ0aW5nIEQtQnVzIFN5c3RlbSBNZXNz
YWdlIEJ1cy4uLjxicj7CoCDCoCDCoCDCoCDCoFN0YXJ0aW5nIFVzZXIgTG9naW4gTWFuYWdlbWVu
dC4uLjxicj7CoCDCoCDCoCDCoCDCoFN0YXJ0aW5nIFBlcm1pdCBVc2VyIFNlc3Npb25zLi4uPGJy
PsKgIMKgIMKgIMKgIMKgU3RhcnRpbmcgVGhlIFhlbiB4ZW5zdG9yZS4uLjxicj7CoCDCoCDCoCDC
oCDCoFN0YXJ0aW5nIE9wZW5TU0ggS2V5IEdlbmVyYXRpb24uLi48YnI+W0ZBSUxFRF0gRmFpbGVk
IHRvIHN0YXJ0IFRoZSBYZW4geGVuc3RvcmUuPGJyPlNlZSAmIzM5O3N5c3RlbWN0bCBzdGF0dXMg
eGVuc3RvcmVkLnNlcnZpY2UmIzM5OyBmb3IgZGV0YWlscy48YnI+W0RFUEVORF0gRGVwZW5kZW5j
eSBmYWlsZWQgZm9yIHFlbXUgZm9yIHhlbiBkb20wIGRpc2sgYmFja2VuZC48YnI+W0RFUEVORF0g
RGVwZW5kZW5jeSBmYWlsZWQgZm9yIFhlbmTigKZwIGd1ZXN0cyBvbiBib290IGFuZCBzaHV0ZG93
bi48YnI+W0RFUEVORF0gRGVwZW5kZW5jeSBmYWlsZWQgZm9yIHhlbi3igKZkZXMsIEpTT04gY29u
ZmlndXJhdGlvbiBzdHViKS48YnI+W0RFUEVORF0gRGVwZW5kZW5jeSBmYWlsZWQgZm9yIFhlbmPi
gKZndWVzdCBjb25zb2xlcyBhbmQgaHlwZXJ2aXNvci48YnI+WyDCoE9LIMKgXSBGaW5pc2hlZCBQ
ZXJtaXQgVXNlciBTZXNzaW9ucy48YnI+WyDCoE9LIMKgXSBTdGFydGVkIEdldHR5IG9uIHR0eTEu
PGJyPlsgwqBPSyDCoF0gU3RhcnRlZCBTZXJpYWwgR2V0dHkgb24gaHZjMC48YnI+WyDCoE9LIMKg
XSBTdGFydGVkIFNlcmlhbCBHZXR0eSBvbiB0dHlTMC48YnI+WyDCoE9LIMKgXSBSZWFjaGVkIHRh
cmdldCBMb2dpbiBQcm9tcHRzLjxicj7CoCDCoCDCoCDCoCDCoFN0YXJ0aW5nIFhlbi13YXRjaGRv
ZyAtIHJ1biB4ZW4gd2F0Y2hkb2cgZGFlbW9uLi4uPGJyPlsgwqBPSyDCoF0gU3RhcnRlZCBELUJ1
cyBTeXN0ZW0gTWVzc2FnZSBCdXMuPGJyPlsgwqBPSyDCoF0gU3RhcnRlZCBYZW4td2F0Y2hkb2cg
LSBydW4geGVuIHdhdGNoZG9nIGRhZW1vbi48YnI+WyDCoE9LIMKgXSBGaW5pc2hlZCBPcGVuU1NI
IEtleSBHZW5lcmF0aW9uLjxicj5bIMKgT0sgwqBdIFN0YXJ0ZWQgVXNlciBMb2dpbiBNYW5hZ2Vt
ZW50Ljxicj5bIMKgT0sgwqBdIFJlYWNoZWQgdGFyZ2V0IE11bHRpLVVzZXIgU3lzdGVtLjxicj7C
oCDCoCDCoCDCoCDCoFN0YXJ0aW5nIFJlY29yZCBSdW5sZXZlbCBDaGFuZ2UgaW4gVVRNUC4uLjxi
cj5bIMKgT0sgwqBdIEZpbmlzaGVkIFJlY29yZCBSdW5sZXZlbCBDaGFuZ2UgaW4gVVRNUC48YnI+
ZmJjb246IFRha2luZyBvdmVyIGNvbnNvbGU8YnI+PGJyPlBva3kgKFlvY3RvIFByb2plY3QgUmVm
ZXJlbmNlIERpc3RybykgNC4wLjQgcmFzcGJlcnJ5cGk0LTY0IGh2YzA8YnI+PGJyPnJhc3BiZXJy
eXBpNC02NCBsb2dpbjogcm9vdDxicj5yb290QHJhc3BiZXJyeXBpNC02NDp+Izxicj5yb290QHJh
c3BiZXJyeXBpNC02NDp+Izxicj5yb290QHJhc3BiZXJyeXBpNC02NDp+IyBzeXN0ZW1jdGwgc3Rh
dHVzIHhlbnN0b3JlZC5zZXJ2aWNlPGJyPnggeGVuc3RvcmVkLnNlcnZpY2UgLSBUaGUgWGVuIHhl
bnN0b3JlPGJyPsKgIMKgIMKgTG9hZGVkOiBsb2FkZWQgKC9saWIvc3lzdGVtZC9zeXN0ZW0veGVu
c3RvcmVkLnNlcnZpY2U7IGVuYWJsZWQ7IHZlbmRvciBwcmVzZXQ6IGVuYWJsZWQpPGJyPsKgIMKg
IMKgQWN0aXZlOiBmYWlsZWQgKFJlc3VsdDogZXhpdC1jb2RlKSBzaW5jZSBUaHUgMjAyMi0xMi0w
MSAwNjoxMjowNSBVVEM7IDI2cyBhZ288YnI+wqAgwqAgUHJvY2VzczogMTk1IEV4ZWNTdGFydFBy
ZT0vYmluL2dyZXAgLXEgY29udHJvbF9kIC9wcm9jL3hlbi9jYXBhYmlsaXRpZXMgKGNvZGU9ZXhp
dGVkLCBzdGF0dXM9MS9GQUlMVVJFKTxicj48YnI+RGVjIDAxIDA2OjEyOjA0IHJhc3BiZXJyeXBp
NC02NCBzeXN0ZW1kWzFdOiBTdGFydGluZyBUaGUgWGVuIHhlbnN0b3JlLi4uPGJyPkRlYyAwMSAw
NjoxMjowNSByYXNwYmVycnlwaTQtNjQgc3lzdGVtZFsxXTogeGVuc3RvcmVkLnNlcnZpY2U6IENv
bnRyb2wgcHJvLi4uVVJFPGJyPkRlYyAwMSAwNjoxMjowNSByYXNwYmVycnlwaTQtNjQgc3lzdGVt
ZFsxXTogeGVuc3RvcmVkLnNlcnZpY2U6IEZhaWxlZCB3aXRoLi4uZSYjMzk7Ljxicj5EZWMgMDEg
MDY6MTI6MDUgcmFzcGJlcnJ5cGk0LTY0IHN5c3RlbWRbMV06IEZhaWxlZCB0byBzdGFydCBUaGUg
WGVuIHhlbnN0b3JlLjxicj5IaW50OiBTb21lIGxpbmVzIHdlcmUgZWxsaXBzaXplZCwgdXNlIC1s
IHRvIHNob3cgaW4gZnVsbC48YnI+PC9iPjxkaXY+PGI+cm9vdEByYXNwYmVycnlwaTQtNjQ6fiPC
oDwvYj48L2Rpdj48ZGl2PjxiPjxicj48L2I+PC9kaXY+PGRpdj5BbnkgaW5wdXQgb24gdGhlc2U/
PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFua3MgJmFtcDsgUmVnYXJkcyw8L2Rpdj48ZGl2
PlZpcHVsIEt1bWFyPC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2
IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gV2VkLCBOb3YgMjMsIDIwMjIgYXQgNTo0
MSBBTSBTdGVmYW5vIFN0YWJlbGxpbmkgJmx0OzxhIGhyZWY9Im1haWx0bzpzc3RhYmVsbGluaUBr
ZXJuZWwub3JnIj5zc3RhYmVsbGluaUBrZXJuZWwub3JnPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2
PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBw
eCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxl
ZnQ6MWV4Ij5IaSBWaXB1bCw8YnI+DQo8YnI+DQpJIGNhbm5vdCBzcG90IGFueSBpc3N1ZSBpbiB0
aGUgY29uZmlndXJhdGlvbiwgaW4gcGFydGljdWFsIHlvdSBoYXZlOjxicj4NCjxicj4NCkNPTkZJ
R19YRU5fRkJERVZfRlJPTlRFTkQ9eTxicj4NCjxicj4NCndoaWNoIGlzIHdoYXQgeW91IG5lZWQu
PGJyPg0KPGJyPg0KVGhlIG9ubHkgdGhpbmcgSSBjYW4gc3VnZ2VzdCBpcyB0byBhZGQgcHJpbnRr
cyB0byB0aGUgTGludXggZnJvbnRlbmQ8YnI+DQpkcml2ZXIgKHRoZSBvbmUgcnVubmluZyBpbiB0
aGUgZG9tVSkgd2hpY2ggaXM8YnI+DQpkcml2ZXJzL3ZpZGVvL2ZiZGV2L3hlbi1mYmZyb250LmMg
YW5kIHByaW50ZnMgdG8gdGhlIFFFTVUgYmFja2VuZDxicj4NCihydW5uaW5nIGluIERvbTApIHdo
aWNoIGlzIGh3L2Rpc3BsYXkveGVuZmIuYyB0byBmaWd1cmUgb3V0IHdoYXQgaXM8YnI+DQpnb2lu
ZyBvbi48YnI+DQo8YnI+DQo8YnI+DQpBbHRlcm5hdGl2ZWx5LCB5b3UgY2FuIHNldHVwIFBWIG5l
dHdvcmsgd2l0aCB0aGUgZG9tVSwgc3VjaCBhczo8YnI+DQo8YnI+DQrCoCB2aWY9WyYjMzk7JiMz
OTtdPGJyPg0KPGJyPg0KYW5kIHRoZW4gcnVuIHgxMSBhbmQgYSB4MTF2bmMgc2VydmVyIGluIHlv
dXIgZG9tVS4gWW91IHNob3VsZCBiZSBhYmxlIHRvPGJyPg0KY29ubmVjdCB0byBpdCB1c2luZyB2
bmN2aWV3ZXIgYXQgdGhlIG5ldHdvcmsgSVAgb2YgeW91ciBkb21VLjxicj4NCjxicj4NCkJhc2lj
YWxseSB5b3UgYXJlIHNraXBwaW5nIHRoZSBwcm9ibGVtIGJlY2F1c2UgaW5zdGVhZCBvZiB1c2lu
ZyB0aGUgUFY8YnI+DQpmcmFtZWJ1ZmZlciBwcm90b2NvbCwgeW91IGp1c3QgdXNlIFZOQyBvdmVy
IHRoZSBuZXR3b3JrIHdpdGggdGhlIGRvbVUuPGJyPg0KPGJyPg0KPGJyPg0KQ2hlZXJzLDxicj4N
Cjxicj4NClN0ZWZhbm88YnI+DQo8YnI+DQo8YnI+DQpPbiBUdWUsIDIyIE5vdiAyMDIyLCBWaXB1
bCBTdW5lamEgd3JvdGU6PGJyPg0KJmd0OyBIaSBTdGVmYW5vLDxicj4NCiZndDsgVGhhbmtzIGZv
ciB0aGXCoHN1cHBvcnQhPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IExvb2tzIGxpa2UgSSBoYXZlIHRy
aWVkIGFsbCB0aGUgY29tYmluYXRpb25zwqAmYW1wOyBwb3NzaWJsZSB3YXlzIHRvIGdldCBkaXNw
bGF5IHVwIGJ1dCBmYWlsZWQuIElzIHRoZXJlIGFueSBkb2N1bWVudCBvciBwZGYgZm9yIHBvcnRp
bmcgeGVuIG9uPGJyPg0KJmd0OyByYXNwYmVycnlwaTQuPGJyPg0KJmd0OyBJIGNvdWxkIGZpbmQg
bG90JiMzOTtzIG9mIGxpbmtzIHRlbGxpbmcgdGhlIHNhbWUgYnV0IGNvdWxkbiYjMzk7dCBzZWUg
YW55IG9mZmljaWFsIHVzZXIgZ3VpZGUgb3IgZG9jdW1lbnQgZnJvbSB0aGUgeGVuIGNvbW11bml0
eSBvbiB0aGUgc2FtZS4gSWY8YnI+DQomZ3Q7IHRoZXJlIGlzIHNvbWV0aGluZyB0byByZWZlcsKg
PGJyPg0KJmd0OyB0byBwbGVhc2Ugc2hhcmUgd2l0aCBtZS48YnI+DQomZ3Q7IEkgYW0gYXR0YWNo
aW5nIHRoZSBrZXJuZWwgY29uZmlndXJhdGlvbiBmaWxlIGFsc28sIGp1c3QgdGFrZSBhIGxvb2sg
aWYgaSBoYXZlIG1pc3NlZCBhbnl0aGluZy48YnI+DQomZ3Q7IEFueSBvdGhlciBzdWdnZXN0aW9u
cyBvciBpbnB1dCBmcm9tIHlvdXIgZW5kIGNvdWxkIGJlIHJlYWxseSBoZWxwZnVsPzxicj4NCiZn
dDsgPGJyPg0KJmd0OyBSZWdhcmRzLDxicj4NCiZndDsgVmlwdWwgS3VtYXI8YnI+DQomZ3Q7IDxi
cj4NCiZndDsgT24gRnJpLCBOb3YgMTEsIDIwMjIgYXQgNjo0MCBBTSBTdGVmYW5vIFN0YWJlbGxp
bmkgJmx0OzxhIGhyZWY9Im1haWx0bzpzc3RhYmVsbGluaUBrZXJuZWwub3JnIiB0YXJnZXQ9Il9i
bGFuayI+c3N0YWJlbGxpbmlAa2VybmVsLm9yZzwvYT4mZ3Q7IHdyb3RlOjxicj4NCiZndDvCoCDC
oCDCoCDCoEhpIFZpcHVsLDxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgIMKgU29ycnkgZm9y
IHRoZSBsYXRlIHJlcGx5LiBGcm9tIHRoZSBlYXJsaWVyIGxvZ3MgdGhhdCB5b3Ugc2VudCwgaXQg
bG9va3M8YnI+DQomZ3Q7wqAgwqAgwqAgwqBsaWtlIGV2ZXJ5dGhpbmcgc2hvdWxkIGJlIHdvcmtp
bmcgY29ycmVjdGx5LiBTcGVjaWZpY2FsbHk6PGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqAg
wqDCoMKgIMKgIHZmYiA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoMKgwqAgwqAg
wqAxID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgwqDCoCDCoCDCoCAwID0gJnF1
b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgwqDCoCDCoCDCoCDCoGZyb250ZW5kID0gJnF1
b3Q7L2xvY2FsL2RvbWFpbi8xL2RldmljZS92ZmIvMCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDC
oMKgwqAgwqAgwqAgwqBmcm9udGVuZC1pZCA9ICZxdW90OzEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAg
wqAgwqDCoMKgIMKgIMKgIMKgb25saW5lID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDC
oCDCoMKgwqAgwqAgwqAgwqBzdGF0ZSA9ICZxdW90OzQmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqDCoMKgIMKgIMKgIMKgdm5jID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoMKg
wqAgwqAgwqAgwqB2bmNsaXN0ZW4gPSAmcXVvdDsxMjcuMC4wLjEmcXVvdDs8YnI+DQomZ3Q7wqAg
wqAgwqAgwqDCoMKgIMKgIMKgIMKgdm5jZGlzcGxheSA9ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqDCoMKgIMKgIMKgIMKgdm5jdW51c2VkID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZn
dDvCoCDCoCDCoCDCoMKgwqAgwqAgwqAgwqBzZGwgPSAmcXVvdDswJnF1b3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgwqDCoCDCoCDCoCDCoG9wZW5nbCA9ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7wqAg
wqAgwqAgwqDCoMKgIMKgIMKgIMKgZmVhdHVyZS1yZXNpemUgPSAmcXVvdDsxJnF1b3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgwqDCoCDCoCDCoCDCoGhvdHBsdWctc3RhdHVzID0gJnF1b3Q7Y29ubmVj
dGVkJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgwqDCoCDCoCDCoCDCoHJlcXVlc3QtdXBkYXRl
ID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgIMKgc3RhdGUgJnF1
b3Q7NCZxdW90OyBtZWFucyAmcXVvdDtjb25uZWN0ZWQmcXVvdDsuIFNvIEkgd291bGQgZXhwZWN0
IHRoYXQgeW91IHNob3VsZCBiZSBhYmxlPGJyPg0KJmd0O8KgIMKgIMKgIMKgdG8gY29ubmVjdCB0
byB0aGUgdm5jIHNlcnZlciB1c2luZyB2bmN2aWV3ZXIuIFlvdSBtaWdodCBub3Qgc2VlIGFueXRo
aW5nPGJyPg0KJmd0O8KgIMKgIMKgIMKgKGJsYWNrIHNjcmVlbikgYnV0IHlvdSBzaG91bGQgZGVm
aW5pdGVseSBiZSBhYmxlIHRvIGNvbm5lY3QuPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqAg
wqBJIHdvdWxkbiYjMzk7dCB0cnkgdG8gbGF1bmNoIHgxMSBpbiB0aGUgZ3Vlc3QganVzdCB5ZXQu
IGZiY29uIGluIExpbnV4IGlzPGJyPg0KJmd0O8KgIMKgIMKgIMKgZW5vdWdoIHRvIHJlbmRlciBz
b21ldGhpbmcgb24gdGhlIHNjcmVlbi4gWW91IHNob3VsZCBiZSBhYmxlIHRvIHNlZSB0aGU8YnI+
DQomZ3Q7wqAgwqAgwqAgwqBMaW51eCB0ZXh0LWJhc2VkIGNvbnNvbGUgcmVuZGVyZWQgZ3JhcGhp
Y2FsbHksIGNvbm5lY3RpbmcgdG8gaXQgdmlhIHZuYy48YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDC
oCDCoCDCoFNvcnJ5IGZvciB0aGUgYmFzaWMgcXVlc3Rpb24sIGJ1dCBoYXZlIHlvdSB0cmllZCBh
bGwgdGhlIGZvbGxvd2luZz88YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoCDCoHZuY3ZpZXdl
ciA8YSBocmVmPSJodHRwOi8vMTI3LjAuMC4xOjAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJf
YmxhbmsiPjEyNy4wLjAuMTowPC9hPjxicj4NCiZndDvCoCDCoCDCoCDCoHZuY3ZpZXdlciA8YSBo
cmVmPSJodHRwOi8vMTI3LjAuMC4xOjEiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsi
PjEyNy4wLjAuMToxPC9hPjxicj4NCiZndDvCoCDCoCDCoCDCoHZuY3ZpZXdlciA8YSBocmVmPSJo
dHRwOi8vMTI3LjAuMC4xOjIiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPjEyNy4w
LjAuMToyPC9hPjxicj4NCiZndDvCoCDCoCDCoCDCoHZuY3ZpZXdlciA8YSBocmVmPSJodHRwOi8v
MTI3LjAuMC4xOjU5MDAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPjEyNy4wLjAu
MTo1OTAwPC9hPjxicj4NCiZndDvCoCDCoCDCoCDCoHZuY3ZpZXdlciA8YSBocmVmPSJodHRwOi8v
MTI3LjAuMC4xOjU5MDEiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPjEyNy4wLjAu
MTo1OTAxPC9hPjxicj4NCiZndDvCoCDCoCDCoCDCoHZuY3ZpZXdlciA8YSBocmVmPSJodHRwOi8v
MTI3LjAuMC4xOjU5MDIiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPjEyNy4wLjAu
MTo1OTAyPC9hPjxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgIMKgR2l2ZW4gdGhhdCBmcm9t
IHRoZSB4ZW5zdG9yZS1scyBsb2dzIGV2ZXJ5dGhpbmcgc2VlbXMgdG8gd29yayBjb3JyZWN0bHk8
YnI+DQomZ3Q7wqAgwqAgwqAgwqBJIGFtIG5vdCBzdXJlIHdoYXQgZWxzZSB0byBzdWdnZXN0LiBZ
b3UgbWlnaHQgaGF2ZSB0byBhZGQgcHJpbnRmIHRvIFFFTVU8YnI+DQomZ3Q7wqAgwqAgwqAgwqB1
aS92bmMuYyBhbmQgaHcvZGlzcGxheS94ZW5mYi5jIHRvIHNlZSB3aGF0IGlzIGdvaW5nIHdyb25n
Ljxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgIMKgQ2hlZXJzLDxicj4NCiZndDsgPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgU3RlZmFubzxicj4NCiZndDsgPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAg
wqAgwqAgwqBPbiBNb24sIDcgTm92IDIwMjIsIFZpcHVsIFN1bmVqYSB3cm90ZTo8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IEhpIFN0ZWZhbm8sPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyBUaGFu
a3MhPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgQW55
IGlucHV0IGZ1cnRoZXIgb24gJnF1b3Q7eGVuc3RvcmUtbHMmcXVvdDsgbG9ncz88YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyBJIGFtIHRyeWluZyB0byBy
dW4gdGhlIHgwdm5jc2VydmVyICZhbXA7IHgxMXZuYyBzZXJ2ZXIgbWFudWFsbHkgb24gZ3Vlc3Qg
bWFjaGluZSh4ZW5fZ3Vlc3RfaW1hZ2VfbWluaW1hbCkgaW1hZ2UgYnV0IGl0JiMzOTtzIGZhaWxp
bmc8YnI+DQomZ3Q7wqAgwqAgwqAgwqB3aXRoIHRoZSBiZWxvdzxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDsgZXJyb3IuPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDsgcm9vdEByYXNwYmVycnlwaTQtNjQ6L3Vzci9iaW4jIHgwdm5jc2VydmVyPGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0OyB4MHZuY3NlcnZlcjogdW5hYmxlIHRvIG9wZW4gZGlzcGxheSAmcXVv
dDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHJvb3RAcmFzcGJlcnJ5cGk0LTY0Oi91
c3IvYmluIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgcm9vdEByYXNwYmVycnlwaTQtNjQ6L3Vz
ci9iaW4jIHgxMXZuYzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0OyAjQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBA
QEBAQEBAQEBAQEBAQEBAQEBAQCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIEAjPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDCoCoq
IMKgV0FSTklORyDCoCoqIMKgV0FSTklORyDCoCoqIMKgV0FSTklORyDCoCoqIMKgV0FSTklORyDC
oCoqIMKgIEAjPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgI0AgwqAgwqAgwqAgwqBZT1Ug
QVJFIFJVTk5JTkcgWDExVk5DIFdJVEhPVVQgQSBQQVNTV09SRCEhIMKgIMKgIMKgIMKgQCM8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIEAj
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDCoFRoaXMgbWVhbnMgYW55b25lIHdpdGggbmV0
d29yayBhY2Nlc3MgdG8gdGhpcyBjb21wdXRlciDCoCBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDsgI0AgwqBtYXkgYmUgYWJsZSB0byB2aWV3IGFuZCBjb250cm9sIHlvdXIgZGVza3RvcC4gwqAg
wqAgwqAgwqAgwqAgwqBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgI0AgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgQCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAICZndDsmZ3Q7
Jmd0OyBJZiB5b3UgZGlkIG5vdCBtZWFuIHRvIGRvIHRoaXMgUHJlc3MgQ1RSTC1DIG5vdyEhICZs
dDsmbHQ7Jmx0OyBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgI0AgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgQCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAQEBAQEBAQEBAQEBA
QEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAIzxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDsgI0AgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQCM8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgWW91IGNhbiBjcmVhdGUgYW4geDExdm5jIHBhc3N3
b3JkIGZpbGUgYnkgcnVubmluZzogwqAgwqAgwqAgQCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
ICNAIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIEAjPGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0OyAjQCDCoCDCoCDCoCB4MTF2bmMgLXN0b3JlcGFzc3dkIHBhc3N3b3JkIC9wYXRoL3RvL3Bh
c3NmaWxlIMKgIMKgIMKgQCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgb3IgwqAgeDEx
dm5jIC1zdG9yZXBhc3N3ZCAvcGF0aC90by9wYXNzZmlsZSDCoCDCoCDCoCDCoCDCoCDCoCDCoCBA
Izxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgI0AgwqBvciDCoCB4MTF2bmMgLXN0b3JlcGFzc3dk
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIEAjPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAIzxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDsgI0AgwqAodGhlIGxhc3Qgb25lIHdpbGwgdXNlIH4vLnZu
Yy9wYXNzd2QpIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQCM8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7ICNAIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIEAjPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0OyAjQCDCoGFuZCB0aGVuIHN0YXJ0aW5nIHgxMXZuYyB2aWE6IMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7ICNAIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIEAjPGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0OyAjQCDCoCDCoCDCoHgxMXZuYyAtcmZiYXV0aCAvcGF0aC90by9wYXNzZmlsZSDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEAjPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsg
I0AgwqBhbiBleGlzdGluZyB+Ly52bmMvcGFzc3dkIGZpbGUgZnJvbSBhbm90aGVyIFZOQyDCoCDC
oCDCoCDCoCDCoEAjPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDCoGFwcGxpY2F0aW9uIHdp
bGwgd29yayBmaW5lIHRvby4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBA
Izxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgI0AgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgQCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgWW91IGNhbiBhbHNvIHVzZSB0aGUg
LXBhc3N3ZGZpbGUgb3IgLXBhc3N3ZCBvcHRpb25zLiDCoCDCoCBAIzxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDsgI0AgwqAobm90ZSAtcGFzc3dkIGlzIHVuc2FmZSBpZiBsb2NhbCB1c2VycyBhcmUg
bm90IHRydXN0ZWQpIMKgQCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIEAjPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDCoE1ha2Ug
c3VyZSBhbnkgLXJmYmF1dGggYW5kIC1wYXNzd2RmaWxlIHBhc3N3b3JkIGZpbGVzIMKgIMKgQCM8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgY2Fubm90IGJlIHJlYWQgYnkgdW50cnVzdGVk
IHVzZXJzLiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAIzxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDsgI0AgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQCM8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgVXNlIHgxMXZuYyAtdXNlcHcgdG8gYXV0b21hdGljYWxseSB1
c2UgeW91ciDCoCDCoCDCoCDCoCDCoCDCoCDCoEAjPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyAj
QCDCoH4vLnZuYy9wYXNzd2Qgb3Igfi8udm5jL3Bhc3N3ZGZpbGUgcGFzc3dvcmQgZmlsZXMuIMKg
IMKgIMKgIEAjPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDCoChhbmQgcHJvbXB0IHlvdSB0
byBjcmVhdGUgfi8udm5jL3Bhc3N3ZCBpZiBuZWl0aGVyIMKgIMKgIMKgIEAjPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0OyAjQCDCoGZpbGUgZXhpc3RzLikgwqBVbmRlciAtdXNlcHcsIHgxMXZuYyB3
aWxsIGV4aXQgaWYgaXQgwqAgwqAgwqBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgI0AgwqBj
YW5ub3QgZmluZCBhIHBhc3N3b3JkIHRvIHVzZS4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgQCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIEAjPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgI0AgwqBFdmVu
IHdpdGggYSBwYXNzd29yZCwgdGhlIHN1YnNlcXVlbnQgVk5DIHRyYWZmaWMgaXMgwqAgwqAgwqBA
Izxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgI0AgwqBzZW50IGluIHRoZSBjbGVhci7CoCBDb25z
aWRlciB0dW5uZWxsaW5nIHZpYSBzc2goMSk6IMKgIMKgIMKgQCM8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7ICNAIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIEAjPGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0OyAjQCDCoCDCoDxhIGhyZWY9Imh0dHA6Ly93d3cua2FybHJ1bmdlLmNvbS94MTF2
bmMvI3R1bm5lbGxpbmciIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly93
d3cua2FybHJ1bmdlLmNvbS94MTF2bmMvI3R1bm5lbGxpbmc8L2E+IMKgIMKgIMKgIMKgIMKgIMKg
QCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIEAjPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDCoE9yIHVzaW5nIHRoZSB4MTF2bmMg
U1NMIG9wdGlvbnM6IC1zc2wgYW5kIC1zdHVubmVsIMKgIMKgIMKgIEAjPGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0OyAjQCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAIzxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDsgI0AgwqBQbGVhc2UgUmVhZCB0aGUgZG9jdW1lbnRhdGlvbiBmb3IgbW9y
ZSBpbmZvIGFib3V0IMKgIMKgIMKgIMKgQCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKg
cGFzc3dvcmRzLCBzZWN1cml0eSwgYW5kIGVuY3J5cHRpb24uIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIEAjPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgI0AgwqAgwqA8YSBocmVm
PSJodHRwOi8vd3d3LmthcmxydW5nZS5jb20veDExdm5jL2ZhcS5odG1sI2ZhcS1wYXNzd2QiIHJl
bD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly93d3cua2FybHJ1bmdlLmNvbS94
MTF2bmMvZmFxLmh0bWwjZmFxLXBhc3N3ZDwvYT4gwqAgwqBAIzxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDsgI0AgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQCM8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7ICNAIMKgVG8gZGlzYWJsZSB0aGlzIHdhcm5pbmcgdXNlIHRoZSAtbm9wdyBvcHRp
b24sIG9yIHB1dCDCoCDCoCBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgI0AgwqAmIzM5O25v
cHcmIzM5OyBvbiBhIGxpbmUgaW4geW91ciB+Ly54MTF2bmNyYyBmaWxlLiDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgI0AgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgQCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAQEBAQEBAQEBAQEBAQEBA
QEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAIzxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDsgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyAwOS8wMy8yMDE4
IDEyOjU4OjQxIHgxMXZuYyB2ZXJzaW9uOiAwLjkuMTYgbGFzdG1vZDogMjAxOS0wMS0wNSDCoHBp
ZDogNDI0PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyAwOS8wMy8yMDE4IDEyOjU4OjQxIFhPcGVu
RGlzcGxheSgmcXVvdDsmcXVvdDspIGZhaWxlZC48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IDA5
LzAzLzIwMTggMTI6NTg6NDEgVHJ5aW5nIGFnYWluIHdpdGggWEFVVEhMT0NBTEhPU1ROQU1FPWxv
Y2FsaG9zdCAuLi48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IDA5LzAzLzIwMTggMTI6NTg6NDE8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IDA5LzAzLzIwMTggMTI6NTg6NDEgKioqIFhPcGVuRGlz
cGxheSBmYWlsZWQuIE5vIC1kaXNwbGF5IG9yIERJU1BMQVkuPGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0OyAwOS8wMy8yMDE4IDEyOjU4OjQxICoqKiBUcnlpbmcgJnF1b3Q7OjAmcXVvdDsgaW4gNCBz
ZWNvbmRzLsKgIFByZXNzIEN0cmwtQyB0byBhYm9ydC48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IDA5LzAzLzIwMTggMTI6NTg6NDEgKioqIDEgMiAzIDQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IDA5LzAzLzIwMTggMTI6NTg6NDUgWE9wZW5EaXNwbGF5KCZxdW90OzowJnF1b3Q7KSBmYWlsZWQu
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyAwOS8wMy8yMDE4IDEyOjU4OjQ1IFRyeWluZyBhZ2Fp
biB3aXRoIFhBVVRITE9DQUxIT1NUTkFNRT1sb2NhbGhvc3QgLi4uPGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0OyAwOS8wMy8yMDE4IDEyOjU4OjQ1IFhPcGVuRGlzcGxheSgmcXVvdDs6MCZxdW90Oykg
ZmFpbGVkLjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgMDkvMDMvMjAxOCAxMjo1ODo0NSBUcnlp
bmcgYWdhaW4gd2l0aCB1bnNldCBYQVVUSExPQ0FMSE9TVE5BTUUgLi4uPGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0OyAwOS8wMy8yMDE4IDEyOjU4OjQ1PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDsgMDkvMDMvMjAxOCAxMjo1ODo0NSAqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKio8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IDA5LzAz
LzIwMTggMTI6NTg6NDUgKioqIFhPcGVuRGlzcGxheSBmYWlsZWQgKDowKTxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICoqKiB4MTF2bmMgd2FzIHVuYWJs
ZSB0byBvcGVuIHRoZSBYIERJU1BMQVk6ICZxdW90OzowJnF1b3Q7LCBpdCBjYW5ub3QgY29udGlu
dWUuPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyAqKiogVGhlcmUgbWF5IGJlICZxdW90O1hsaWI6
JnF1b3Q7IGVycm9yIG1lc3NhZ2VzIGFib3ZlIHdpdGggZGV0YWlscyBhYm91dCB0aGUgZmFpbHVy
ZS48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyBTb21l
IHRpcHMgYW5kIGd1aWRlbGluZXM6PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDsgKiogQW4gWCBzZXJ2ZXIgKHRoZSBvbmUgeW91IHdpc2ggdG8gdmlldykg
bXVzdCBiZSBydW5uaW5nIGJlZm9yZSB4MTF2bmMgaXM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IMKgIMKgc3RhcnRlZDogeDExdm5jIGRvZXMgbm90IHN0YXJ0IHRoZSBYIHNlcnZlci4gwqAoaG93
ZXZlciwgc2VlIHRoZSAtY3JlYXRlPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoG9wdGlv
biBpZiB0aGF0IGlzIHdoYXQgeW91IHJlYWxseSB3YW50KS48YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyAqKiBZb3UgbXVzdCB1c2UgLWRpc3BsYXkgJmx0
O2Rpc3AmZ3Q7LCAtT1ItIHNldCBhbmQgZXhwb3J0IHlvdXIgJERJU1BMQVk8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IMKgIMKgZW52aXJvbm1lbnQgdmFyaWFibGUgdG8gcmVmZXIgdG8gdGhlIGRp
c3BsYXkgb2YgdGhlIGRlc2lyZWQgWCBzZXJ2ZXIuPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDC
oC0gVXN1YWxseSB0aGUgZGlzcGxheSBpcyBzaW1wbHkgJnF1b3Q7OjAmcXVvdDsgKGluIGZhY3Qg
eDExdm5jIHVzZXMgdGhpcyBpZiB5b3UgZm9yZ2V0PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDC
oCDCoHRvIHNwZWNpZnkgaXQpLCBidXQgaW4gc29tZSBtdWx0aS11c2VyIHNpdHVhdGlvbnMgaXQg
Y291bGQgYmUgJnF1b3Q7OjEmcXVvdDssICZxdW90OzoyJnF1b3Q7LDxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDsgwqAgwqBvciBldmVuICZxdW90OzoxMzcmcXVvdDsuwqAgQXNrIHlvdXIgYWRtaW5p
c3RyYXRvciBvciBhIGd1cnUgaWYgeW91IGFyZSBoYXZpbmc8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IMKgIMKgZGlmZmljdWx0eSBkZXRlcm1pbmluZyB3aGF0IHlvdXIgWCBESVNQTEFZIGlzLjxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICoqIE5leHQs
IHlvdSBuZWVkIHRvIGhhdmUgc3VmZmljaWVudCBwZXJtaXNzaW9ucyAoWGF1dGhvcml0eSk8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgdG8gY29ubmVjdCB0byB0aGUgWCBESVNQTEFZLiDC
oCBIZXJlIGFyZSBzb21lIFRpcHM6PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDsgwqAtIE9mdGVuLCB5b3UganVzdCBuZWVkIHRvIHJ1biB4MTF2bmMgYXMg
dGhlIHVzZXIgbG9nZ2VkIGludG8gdGhlIFggc2Vzc2lvbi48YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IMKgIMKgU28gbWFrZSBzdXJlIHRvIGJlIHRoYXQgdXNlciB3aGVuIHlvdSB0eXBlIHgxMXZu
Yy48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgLSBCZWluZyByb290IGlzIHVzdWFsbHkgbm90
IGVub3VnaCBiZWNhdXNlIHRoZSBpbmNvcnJlY3QgTUlULU1BR0lDLUNPT0tJRTxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDsgwqAgwqBmaWxlIG1heSBiZSBhY2Nlc3NlZC7CoCBUaGUgY29va2llIGZp
bGUgY29udGFpbnMgdGhlIHNlY3JldCBrZXkgdGhhdDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsg
wqAgwqBhbGxvd3MgeDExdm5jIHRvIGNvbm5lY3QgdG8gdGhlIGRlc2lyZWQgWCBESVNQTEFZLjxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAtIFlvdSBjYW4gZXhwbGljaXRseSBpbmRpY2F0ZSB3
aGljaCBNSVQtTUFHSUMtQ09PS0lFIGZpbGUgc2hvdWxkIGJlIHVzZWQ8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IMKgIMKgYnkgdGhlIC1hdXRoIG9wdGlvbiwgZS5nLjo8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IMKgIMKgIMKgIMKgeDExdm5jIC1hdXRoIC9ob21lL3NvbWV1c2VyLy5YYXV0aG9y
aXR5IC1kaXNwbGF5IDowPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoHgxMXZu
YyAtYXV0aCAvdG1wLy5nZG16bmRWbFIgLWRpc3BsYXkgOjA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IMKgIMKgeW91IG11c3QgaGF2ZSByZWFkIHBlcm1pc3Npb24gZm9yIHRoZSBhdXRoIGZpbGUu
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoFNlZSBhbHNvICYjMzk7LWF1dGggZ3Vlc3Mm
IzM5OyBhbmQgJiMzOTstZmluZGF1dGgmIzM5OyBkaXNjdXNzZWQgYmVsb3cuPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgKiogSWYgTk8gT05FIGlzIGxv
Z2dlZCBpbnRvIGFuIFggc2Vzc2lvbiB5ZXQsIGJ1dCB0aGVyZSBpcyBhIGdyZWV0ZXIgbG9naW48
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgcHJvZ3JhbSBsaWtlICZxdW90O2dkbSZxdW90
OywgJnF1b3Q7a2RtJnF1b3Q7LCAmcXVvdDt4ZG0mcXVvdDssIG9yICZxdW90O2R0bG9naW4mcXVv
dDsgcnVubmluZywgeW91IHdpbGwgbmVlZDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqB0
byBmaW5kIGFuZCB1c2UgdGhlIHJhdyBkaXNwbGF5IG1hbmFnZXIgTUlULU1BR0lDLUNPT0tJRSBm
aWxlLjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqBTb21lIGV4YW1wbGVzIGZvciB2YXJp
b3VzIGRpc3BsYXkgbWFuYWdlcnM6PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDsgwqAgwqAgwqBnZG06IMKgIMKgIC1hdXRoIC92YXIvZ2RtLzowLlhhdXRo
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoCDCoCDCoCDCoCAtYXV0aCAvdmFy
L2xpYi9nZG0vOjAuWGF1dGg8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKga2RtOiDC
oCDCoCAtYXV0aCAvdmFyL2xpYi9rZG0vQTowLWNyV2s3Mjxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLWF1dGggL3Zhci9ydW4veGF1dGgvQTowLWNyV2s3Mjxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqB4ZG06IMKgIMKgIC1hdXRoIC92YXIvbGli
L3hkbS9hdXRoZGlyL2F1dGhmaWxlcy9BOjAtWFF2YUprPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
OyDCoCDCoCDCoGR0bG9naW46IC1hdXRoIC92YXIvZHQvQTowLVVnYWFYYTxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgU29tZXRpbWVzIHRoZSBj
b21tYW5kICZxdW90O3BzIHd3d3dhdXggfCBncmVwIGF1dGgmcXVvdDsgY2FuIHJldmVhbCB0aGUg
ZmlsZSBsb2NhdGlvbi48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0OyDCoCDCoFN0YXJ0aW5nIHdpdGggeDExdm5jIDAuOS45IHlvdSBjYW4gaGF2ZSBpdCB0
cnkgdG8gZ3Vlc3MgYnkgdXNpbmc6PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLWF1dGggZ3Vlc3M8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoChzZWUgYWxzbyB0
aGUgeDExdm5jIC1maW5kYXV0aCBvcHRpb24uKTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgT25seSByb290IHdpbGwgaGF2ZSByZWFkIHBlcm1p
c3Npb24gZm9yIHRoZSBmaWxlLCBhbmQgc28geDExdm5jIG11c3QgYmUgcnVuPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0OyDCoCDCoGFzIHJvb3QgKG9yIGNvcHkgaXQpLsKgIFRoZSByYW5kb20gY2hh
cmFjdGVycyBpbiB0aGUgZmlsZW5hbWVzIHdpbGwgb2YgY291cnNlPGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0OyDCoCDCoGNoYW5nZSBhbmQgdGhlIGRpcmVjdG9yeSB0aGUgY29va2llIGZpbGUgcmVz
aWRlcyBpbiBpcyBzeXN0ZW0gZGVwZW5kZW50Ljxicj4NCiZndDvCoCDCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFNlZSBhbHNvOiA8YSBocmVmPSJodHRwOi8vd3d3Lmthcmxy
dW5nZS5jb20veDExdm5jL2ZhcS5odG1sIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5odHRwOi8vd3d3LmthcmxydW5nZS5jb20veDExdm5jL2ZhcS5odG1sPC9hPjxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFJlZ2FyZHMsPGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0OyBWaXB1bCBLdW1hcjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IE9uIFRodSwgTm92IDMsIDIwMjIgYXQgMTA6MjcgUE0gVmlw
dWwgU3VuZWphICZsdDs8YSBocmVmPSJtYWlsdG86dnN1bmVqYTYzQGdtYWlsLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPnZzdW5lamE2M0BnbWFpbC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBIaSBTdGVmYW5vLDxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDsgVGhhbmtzITxicj4NCiZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IEkgdXNlZCB4ZW4tZ3Vlc3QtaW1hZ2UtbWluaW1hbChzaW1wbGUgY29uc29sZSBiYXNlZCBp
bWFnZSkgYXMgYSBndWVzdCB3aXRoIGZiY29uICZhbXA7IGZiZGV2IGVuYWJsZWQgaW4ga2VybmVs
IGNvbmZpZ3VyYXRpb25zIGJ1dDxicj4NCiZndDvCoCDCoCDCoCDCoHN0aWxsPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0OyB0aGUgc2FtZSBlcnJvciBjYW4mIzM5O3Qgb3BlbiB0aGUgZGlzcGxheS48
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGJlbG93IGFyZSB0aGUgb3V0Y29tZSBvZiAmcXVvdDt4
ZW5zdG9yZS1scyZxdW90Ozo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0OyByb290QHJhc3BiZXJyeXBpNC02NDp+L2d1ZXN0MSMgeGVuc3RvcmUtbHM8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHRvb2wgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IMKgeGVuc3RvcmVkID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0OyBsb2NhbCA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqBkb21h
aW4gPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIDAgPSAmcXVvdDsm
cXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgY29udHJvbCA9ICZxdW90OyZxdW90
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgZmVhdHVyZS1wb3dlcm9mZiA9ICZxdW90
OzEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIGZlYXR1cmUtcmVib290ID0g
JnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqBkb21pZCA9ICZxdW90
OzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgbmFtZSA9ICZxdW90O0RvbWFp
bi0wJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoGRldmljZS1tb2RlbCA9ICZx
dW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgMCA9ICZxdW90OyZxdW90
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBiYWNrZW5kcyA9ICZxdW90OyZxdW90
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgY29uc29sZSA9ICZxdW90OyZxdW90
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgdmtiZCA9ICZxdW90OyZxdW90Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgdmZiID0gJnF1b3Q7JnF1b3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCBxbmljID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoHN0YXRlID0gJnF1b3Q7cnVubmluZyZxdW90Ozxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgMSA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDsgwqAgwqAgwqBiYWNrZW5kcyA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDsgwqAgwqAgwqAgY29uc29sZSA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDsgwqAgwqAgwqAgdmtiZCA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDsgwqAgwqAgwqAgdmZiID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0OyDCoCDCoCDCoCBxbmljID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
OyDCoCDCoCDCoHN0YXRlID0gJnF1b3Q7cnVubmluZyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDsgwqAgwqBiYWNrZW5kID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
OyDCoCDCoCB2YmQgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKg
IMKgMSA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgNTE3
MTIgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgZnJv
bnRlbmQgPSAmcXVvdDsvbG9jYWwvZG9tYWluLzEvZGV2aWNlL3ZiZC81MTcxMiZxdW90Ozxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBwYXJhbXMgPSAmcXVvdDsvaG9tZS9yb290
L2d1ZXN0Mi94ZW4tZ3Vlc3QtaW1hZ2UtbWluaW1hbC1yYXNwYmVycnlwaTQtNjQuZXh0MyZxdW90
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBzY3JpcHQgPSAmcXVvdDsvZXRj
L3hlbi9zY3JpcHRzL2Jsb2NrJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDC
oCDCoGZyb250ZW5kLWlkID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsg
wqAgwqAgwqAgwqBvbmxpbmUgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
OyDCoCDCoCDCoCDCoHJlbW92YWJsZSA9ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IMKgIMKgIMKgIMKgYm9vdGFibGUgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0OyDCoCDCoCDCoCDCoHN0YXRlID0gJnF1b3Q7NCZxdW90Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDsgwqAgwqAgwqAgwqBkZXYgPSAmcXVvdDt4dmRhJnF1b3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoHR5cGUgPSAmcXVvdDtwaHkmcXVvdDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgbW9kZSA9ICZxdW90O3cmcXVvdDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgZGV2aWNlLXR5cGUgPSAmcXVvdDtkaXNrJnF1b3Q7
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoGRpc2NhcmQtZW5hYmxlID0gJnF1
b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBmZWF0dXJlLW1h
eC1pbmRpcmVjdC1zZWdtZW50cyA9ICZxdW90OzI1NiZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDsgwqAgwqAgwqAgwqBtdWx0aS1xdWV1ZS1tYXgtcXVldWVzID0gJnF1b3Q7NCZxdW90Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBtYXgtcmluZy1wYWdlLW9yZGVyID0g
JnF1b3Q7NCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBub2RlID0g
JnF1b3Q7L2Rldi9sb29wMCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAg
wqBwaHlzaWNhbC1kZXZpY2UgPSAmcXVvdDs3OjAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IMKgIMKgIMKgIMKgcGh5c2ljYWwtZGV2aWNlLXBhdGggPSAmcXVvdDsvZGV2L2xvb3AwJnF1
b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoGhvdHBsdWctc3RhdHVzID0g
JnF1b3Q7Y29ubmVjdGVkJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDC
oGZlYXR1cmUtZmx1c2gtY2FjaGUgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0OyDCoCDCoCDCoCDCoGRpc2NhcmQtZ3JhbnVsYXJpdHkgPSAmcXVvdDs0MDk2JnF1b3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoGRpc2NhcmQtYWxpZ25tZW50ID0gJnF1
b3Q7MCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBkaXNjYXJkLXNl
Y3VyZSA9ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKg
ZmVhdHVyZS1kaXNjYXJkID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsg
wqAgwqAgwqAgwqBmZWF0dXJlLWJhcnJpZXIgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0OyDCoCDCoCDCoCDCoGZlYXR1cmUtcGVyc2lzdGVudCA9ICZxdW90OzEmcXVvdDs8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgc2VjdG9ycyA9ICZxdW90OzE3OTQw
NDgmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgaW5mbyA9ICZxdW90
OzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgc2VjdG9yLXNpemUg
PSAmcXVvdDs1MTImcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgcGh5
c2ljYWwtc2VjdG9yLXNpemUgPSAmcXVvdDs1MTImcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IMKgIMKgIHZmYiA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAg
wqAgwqAxID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCAw
ID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoGZyb250
ZW5kID0gJnF1b3Q7L2xvY2FsL2RvbWFpbi8xL2RldmljZS92ZmIvMCZxdW90Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBmcm9udGVuZC1pZCA9ICZxdW90OzEmcXVvdDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgb25saW5lID0gJnF1b3Q7MSZxdW90Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBzdGF0ZSA9ICZxdW90OzQmcXVvdDs8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgdm5jID0gJnF1b3Q7MSZxdW90Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqB2bmNsaXN0ZW4gPSAmcXVvdDsxMjcu
MC4wLjEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgdm5jZGlzcGxh
eSA9ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgdm5j
dW51c2VkID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAg
wqBzZGwgPSAmcXVvdDswJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDC
oG9wZW5nbCA9ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKg
IMKgZmVhdHVyZS1yZXNpemUgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
OyDCoCDCoCDCoCDCoGhvdHBsdWctc3RhdHVzID0gJnF1b3Q7Y29ubmVjdGVkJnF1b3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoHJlcXVlc3QtdXBkYXRlID0gJnF1b3Q7MSZx
dW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgdmtiZCA9ICZxdW90OyZxdW90Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAxID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCAwID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0OyDCoCDCoCDCoCDCoGZyb250ZW5kID0gJnF1b3Q7L2xvY2FsL2RvbWFpbi8xL2Rl
dmljZS92a2JkLzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgZnJv
bnRlbmQtaWQgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDC
oCDCoG9ubGluZSA9ICZxdW90OzEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKg
IMKgIMKgc3RhdGUgPSAmcXVvdDs0JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDC
oCDCoCDCoGZlYXR1cmUtYWJzLXBvaW50ZXIgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0OyDCoCDCoCDCoCDCoGZlYXR1cmUtcmF3LXBvaW50ZXIgPSAmcXVvdDsxJnF1b3Q7
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoGhvdHBsdWctc3RhdHVzID0gJnF1
b3Q7Y29ubmVjdGVkJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCBjb25zb2xl
ID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoDEgPSAmcXVv
dDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIDAgPSAmcXVvdDsmcXVv
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgZnJvbnRlbmQgPSAmcXVvdDsv
bG9jYWwvZG9tYWluLzEvY29uc29sZSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAg
wqAgwqAgwqBmcm9udGVuZC1pZCA9ICZxdW90OzEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IMKgIMKgIMKgIMKgb25saW5lID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDsgwqAgwqAgwqAgwqBzdGF0ZSA9ICZxdW90OzEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IMKgIMKgIMKgIMKgcHJvdG9jb2wgPSAmcXVvdDt2dDEwMCZxdW90Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDsgwqAgwqAgdmlmID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0OyDCoCDCoCDCoDEgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IMKgIMKgIMKgIDAgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKg
IMKgIMKgZnJvbnRlbmQgPSAmcXVvdDsvbG9jYWwvZG9tYWluLzEvZGV2aWNlL3ZpZi8wJnF1b3Q7
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoGZyb250ZW5kLWlkID0gJnF1b3Q7
MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBvbmxpbmUgPSAmcXVv
dDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoHN0YXRlID0gJnF1
b3Q7NCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBzY3JpcHQgPSAm
cXVvdDsvZXRjL3hlbi9zY3JpcHRzL3ZpZi1icmlkZ2UmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IMKgIMKgIMKgIMKgbWFjID0gJnF1b3Q7ZTQ6NWY6MDE6Y2Q6N2I6ZGQmcXVvdDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgYnJpZGdlID0gJnF1b3Q7eGVuYnIwJnF1
b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoGhhbmRsZSA9ICZxdW90OzAm
cXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgdHlwZSA9ICZxdW90O3Zp
ZiZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBob3RwbHVnLXN0YXR1
cyA9ICZxdW90O2Nvbm5lY3RlZCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAg
wqAgwqBmZWF0dXJlLXNnID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsg
wqAgwqAgwqAgwqBmZWF0dXJlLWdzby10Y3B2NCA9ICZxdW90OzEmcXVvdDs8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgZmVhdHVyZS1nc28tdGNwdjYgPSAmcXVvdDsxJnF1b3Q7
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoGZlYXR1cmUtaXB2Ni1jc3VtLW9m
ZmxvYWQgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDC
oGZlYXR1cmUtcngtY29weSA9ICZxdW90OzEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IMKgIMKgIMKgIMKgZmVhdHVyZS14ZHAtaGVhZHJvb20gPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoGZlYXR1cmUtcngtZmxpcCA9ICZxdW90OzAmcXVv
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgZmVhdHVyZS1tdWx0aWNhc3Qt
Y29udHJvbCA9ICZxdW90OzEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKg
IMKgZmVhdHVyZS1keW5hbWljLW11bHRpY2FzdC1jb250cm9sID0gJnF1b3Q7MSZxdW90Ozxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBmZWF0dXJlLXNwbGl0LWV2ZW50LWNoYW5u
ZWxzID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBt
dWx0aS1xdWV1ZS1tYXgtcXVldWVzID0gJnF1b3Q7NCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDsgwqAgwqAgwqAgwqBmZWF0dXJlLWN0cmwtcmluZyA9ICZxdW90OzEmcXVvdDs8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIDEgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IMKgIMKgdm0gPSAmcXVvdDsvdm0vZDgxZWM1YTktNWJmOS00ZjJiLTg5ZTgtMGY2MGQ2
ZGE5NDhmJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoG5hbWUgPSAmcXVvdDtn
dWVzdDImcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgY3B1ID0gJnF1b3Q7JnF1
b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCAwID0gJnF1b3Q7JnF1b3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoGF2YWlsYWJpbGl0eSA9ICZxdW90O29ubGluZSZx
dW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgMSA9ICZxdW90OyZxdW90Ozxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBhdmFpbGFiaWxpdHkgPSAmcXVvdDtvbmxpbmUm
cXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgbWVtb3J5ID0gJnF1b3Q7JnF1b3Q7
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCBzdGF0aWMtbWF4ID0gJnF1b3Q7MjA5NzE1
MiZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgdGFyZ2V0ID0gJnF1b3Q7MjA5
NzE1MiZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgdmlkZW9yYW0gPSAmcXVv
dDswJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoGRldmljZSA9ICZxdW90OyZx
dW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgc3VzcGVuZCA9ICZxdW90OyZxdW90
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBldmVudC1jaGFubmVsID0gJnF1b3Q7
JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCB2YmQgPSAmcXVvdDsmcXVvdDs8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgNTE3MTIgPSAmcXVvdDsmcXVvdDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIGJhY2tlbmQgPSAmcXVvdDsvbG9jYWwvZG9t
YWluLzAvYmFja2VuZC92YmQvMS81MTcxMiZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsg
wqAgwqAgwqAgYmFja2VuZC1pZCA9ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IMKgIMKgIMKgIHN0YXRlID0gJnF1b3Q7NCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDsgwqAgwqAgwqAgdmlydHVhbC1kZXZpY2UgPSAmcXVvdDs1MTcxMiZxdW90Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgZGV2aWNlLXR5cGUgPSAmcXVvdDtkaXNrJnF1b3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCBtdWx0aS1xdWV1ZS1udW0tcXVldWVzID0g
JnF1b3Q7MiZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgcXVldWUtMCA9
ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqByaW5nLXJl
ZiA9ICZxdW90OzgmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgZXZl
bnQtY2hhbm5lbCA9ICZxdW90OzQmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKg
IMKgIHF1ZXVlLTEgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKg
IMKgIMKgcmluZy1yZWYgPSAmcXVvdDs5JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDC
oCDCoCDCoCDCoGV2ZW50LWNoYW5uZWwgPSAmcXVvdDs1JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0OyDCoCDCoCDCoCBwcm90b2NvbCA9ICZxdW90O2FybS1hYmkmcXVvdDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIGZlYXR1cmUtcGVyc2lzdGVudCA9ICZxdW90OzEmcXVv
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIHZmYiA9ICZxdW90OyZxdW90Ozxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAwID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0OyDCoCDCoCDCoCBiYWNrZW5kID0gJnF1b3Q7L2xvY2FsL2RvbWFpbi8wL2Jh
Y2tlbmQvdmZiLzEvMCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgYmFj
a2VuZC1pZCA9ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKg
IHN0YXRlID0gJnF1b3Q7NCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAg
cGFnZS1yZWYgPSAmcXVvdDsyNzUwMjImcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKg
IMKgIMKgIGV2ZW50LWNoYW5uZWwgPSAmcXVvdDszJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0OyDCoCDCoCDCoCBwcm90b2NvbCA9ICZxdW90O2FybS1hYmkmcXVvdDs8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIGZlYXR1cmUtdXBkYXRlID0gJnF1b3Q7MSZxdW90Ozxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgdmtiZCA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDsgwqAgwqAgwqAwID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0OyDCoCDCoCDCoCBiYWNrZW5kID0gJnF1b3Q7L2xvY2FsL2RvbWFpbi8wL2JhY2tlbmQv
dmtiZC8xLzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIGJhY2tlbmQt
aWQgPSAmcXVvdDswJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCBzdGF0
ZSA9ICZxdW90OzQmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIHJlcXVl
c3QtYWJzLXBvaW50ZXIgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDC
oCDCoCDCoCBwYWdlLXJlZiA9ICZxdW90OzI3NTMyMiZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDsgwqAgwqAgwqAgcGFnZS1ncmVmID0gJnF1b3Q7MTI4NCZxdW90Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDsgwqAgwqAgwqAgZXZlbnQtY2hhbm5lbCA9ICZxdW90OzEwJnF1b3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCB2aWYgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IMKgIMKgIMKgMCA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDsgwqAgwqAgwqAgYmFja2VuZCA9ICZxdW90Oy9sb2NhbC9kb21haW4vMC9iYWNrZW5kL3Zp
Zi8xLzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIGJhY2tlbmQtaWQg
PSAmcXVvdDswJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCBzdGF0ZSA9
ICZxdW90OzQmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIGhhbmRsZSA9
ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIG1hYyA9ICZx
dW90O2U0OjVmOjAxOmNkOjdiOmRkJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDC
oCDCoCBtdHUgPSAmcXVvdDsxNTAwJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDC
oCDCoCB4ZHAtaGVhZHJvb20gPSAmcXVvdDswJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
OyDCoCDCoCDCoCBtdWx0aS1xdWV1ZS1udW0tcXVldWVzID0gJnF1b3Q7MiZxdW90Ozxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgcXVldWUtMCA9ICZxdW90OyZxdW90Ozxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqB0eC1yaW5nLXJlZiA9ICZxdW90OzEyODAmcXVv
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgcngtcmluZy1yZWYgPSAmcXVv
dDsxMjgxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoGV2ZW50LWNo
YW5uZWwtdHggPSAmcXVvdDs2JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDC
oCDCoGV2ZW50LWNoYW5uZWwtcnggPSAmcXVvdDs3JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0OyDCoCDCoCDCoCBxdWV1ZS0xID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0OyDCoCDCoCDCoCDCoHR4LXJpbmctcmVmID0gJnF1b3Q7MTI4MiZxdW90Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqByeC1yaW5nLXJlZiA9ICZxdW90OzEyODMmcXVvdDs8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgZXZlbnQtY2hhbm5lbC10eCA9ICZx
dW90OzgmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgZXZlbnQtY2hh
bm5lbC1yeCA9ICZxdW90OzkmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKg
IHJlcXVlc3QtcngtY29weSA9ICZxdW90OzEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IMKgIMKgIMKgIGZlYXR1cmUtcngtbm90aWZ5ID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDsgwqAgwqAgwqAgZmVhdHVyZS1zZyA9ICZxdW90OzEmcXVvdDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIGZlYXR1cmUtZ3NvLXRjcHY0ID0gJnF1b3Q7MSZxdW90
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgZmVhdHVyZS1nc28tdGNwdjYgPSAm
cXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCBmZWF0dXJlLWlw
djYtY3N1bS1vZmZsb2FkID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsg
wqAgwqBjb250cm9sID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDC
oCBzaHV0ZG93biA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAg
ZmVhdHVyZS1wb3dlcm9mZiA9ICZxdW90OzEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IMKgIMKgIGZlYXR1cmUtcmVib290ID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDsgwqAgwqAgZmVhdHVyZS1zdXNwZW5kID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0OyDCoCDCoCBzeXNycSA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDsgwqAgwqAgcGxhdGZvcm0tZmVhdHVyZS1tdWx0aXByb2Nlc3Nvci1zdXNwZW5kID0gJnF1
b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgcGxhdGZvcm0tZmVhdHVy
ZS14c19yZXNldF93YXRjaGVzID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDsgwqAgwqBkYXRhID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDC
oGRyaXZlcnMgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgZmVh
dHVyZSA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqBhdHRyID0g
JnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoGVycm9yID0gJnF1b3Q7
JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoGRvbWlkID0gJnF1b3Q7MSZxdW90
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqBzdG9yZSA9ICZxdW90OyZxdW90Ozxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgcG9ydCA9ICZxdW90OzEmcXVvdDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIHJpbmctcmVmID0gJnF1b3Q7MjMzNDczJnF1b3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoGNvbnNvbGUgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIGJhY2tlbmQgPSAmcXVvdDsvbG9jYWwvZG9tYWluLzAvYmFj
a2VuZC9jb25zb2xlLzEvMCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgYmFj
a2VuZC1pZCA9ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIGxp
bWl0ID0gJnF1b3Q7MTA0ODU3NiZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAg
dHlwZSA9ICZxdW90O3hlbmNvbnNvbGVkJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDC
oCDCoCBvdXRwdXQgPSAmcXVvdDtwdHkmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKg
IMKgIHR0eSA9ICZxdW90Oy9kZXYvcHRzLzEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IMKgIMKgIHBvcnQgPSAmcXVvdDsyJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDC
oCByaW5nLXJlZiA9ICZxdW90OzIzMzQ3MiZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsg
wqAgwqAgdm5jLWxpc3RlbiA9ICZxdW90OzEyNy4wLjAuMSZxdW90Ozxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDsgwqAgwqAgdm5jLXBvcnQgPSAmcXVvdDs1OTAwJnF1b3Q7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0OyDCoCDCoGltYWdlID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0OyDCoCDCoCBkZXZpY2UtbW9kZWwtcGlkID0gJnF1b3Q7Nzg4JnF1b3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0OyB2bSA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsg
wqBkODFlYzVhOS01YmY5LTRmMmItODllOC0wZjYwZDZkYTk0OGYgPSAmcXVvdDsmcXVvdDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIG5hbWUgPSAmcXVvdDtndWVzdDImcXVvdDs8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIHV1aWQgPSAmcXVvdDtkODFlYzVhOS01YmY5LTRmMmItODll
OC0wZjYwZDZkYTk0OGYmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIHN0YXJ0X3Rp
bWUgPSAmcXVvdDsxNTIwNjAwMjc0LjI3JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyBs
aWJ4bCA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAxID0gJnF1b3Q7
JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCBkZXZpY2UgPSAmcXVvdDsmcXVvdDs8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgdmJkID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCA1MTcxMiA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDsgwqAgwqAgwqBmcm9udGVuZCA9ICZxdW90Oy9sb2NhbC9kb21haW4vMS9kZXZp
Y2UvdmJkLzUxNzEyJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoGJhY2tl
bmQgPSAmcXVvdDsvbG9jYWwvZG9tYWluLzAvYmFja2VuZC92YmQvMS81MTcxMiZxdW90Ozxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBwYXJhbXMgPSAmcXVvdDsvaG9tZS9yb290L2d1
ZXN0Mi94ZW4tZ3Vlc3QtaW1hZ2UtbWluaW1hbC1yYXNwYmVycnlwaTQtNjQuZXh0MyZxdW90Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBzY3JpcHQgPSAmcXVvdDsvZXRjL3hlbi9z
Y3JpcHRzL2Jsb2NrJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoGZyb250
ZW5kLWlkID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBv
bmxpbmUgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoHJl
bW92YWJsZSA9ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKg
Ym9vdGFibGUgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDC
oHN0YXRlID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBk
ZXYgPSAmcXVvdDt4dmRhJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoHR5
cGUgPSAmcXVvdDtwaHkmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgbW9k
ZSA9ICZxdW90O3cmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgZGV2aWNl
LXR5cGUgPSAmcXVvdDtkaXNrJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDC
oGRpc2NhcmQtZW5hYmxlID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsg
wqAgwqB2ZmIgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIDAg
PSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgZnJvbnRlbmQg
PSAmcXVvdDsvbG9jYWwvZG9tYWluLzEvZGV2aWNlL3ZmYi8wJnF1b3Q7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0OyDCoCDCoCDCoGJhY2tlbmQgPSAmcXVvdDsvbG9jYWwvZG9tYWluLzAvYmFja2Vu
ZC92ZmIvMS8wJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoGZyb250ZW5k
LWlkID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBvbmxp
bmUgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoHN0YXRl
ID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqB2bmMgPSAm
cXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoHZuY2xpc3RlbiA9
ICZxdW90OzEyNy4wLjAuMSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqB2
bmNkaXNwbGF5ID0gJnF1b3Q7MCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAg
wqB2bmN1bnVzZWQgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDC
oCDCoHNkbCA9ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKg
b3BlbmdsID0gJnF1b3Q7MCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqB2a2Jk
ID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCAwID0gJnF1b3Q7
JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoGZyb250ZW5kID0gJnF1b3Q7
L2xvY2FsL2RvbWFpbi8xL2RldmljZS92a2JkLzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IMKgIMKgIMKgYmFja2VuZCA9ICZxdW90Oy9sb2NhbC9kb21haW4vMC9iYWNrZW5kL3ZrYmQv
MS8wJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoGZyb250ZW5kLWlkID0g
JnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBvbmxpbmUgPSAm
cXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoHN0YXRlID0gJnF1
b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqBjb25zb2xlID0gJnF1b3Q7
JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCAwID0gJnF1b3Q7JnF1b3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoGZyb250ZW5kID0gJnF1b3Q7L2xvY2FsL2Rv
bWFpbi8xL2NvbnNvbGUmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgYmFj
a2VuZCA9ICZxdW90Oy9sb2NhbC9kb21haW4vMC9iYWNrZW5kL2NvbnNvbGUvMS8wJnF1b3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoGZyb250ZW5kLWlkID0gJnF1b3Q7MSZxdW90
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBvbmxpbmUgPSAmcXVvdDsxJnF1b3Q7
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoHN0YXRlID0gJnF1b3Q7MSZxdW90Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBwcm90b2NvbCA9ICZxdW90O3Z0MTAwJnF1
b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoHZpZiA9ICZxdW90OyZxdW90Ozxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgMCA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDsgwqAgwqAgwqBmcm9udGVuZCA9ICZxdW90Oy9sb2NhbC9kb21haW4vMS9kZXZp
Y2UvdmlmLzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgYmFja2VuZCA9
ICZxdW90Oy9sb2NhbC9kb21haW4vMC9iYWNrZW5kL3ZpZi8xLzAmcXVvdDs8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IMKgIMKgIMKgZnJvbnRlbmQtaWQgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoG9ubGluZSA9ICZxdW90OzEmcXVvdDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgc3RhdGUgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0OyDCoCDCoCDCoHNjcmlwdCA9ICZxdW90Oy9ldGMveGVuL3NjcmlwdHMvdmlm
LWJyaWRnZSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBtYWMgPSAmcXVv
dDtlNDo1ZjowMTpjZDo3YjpkZCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAg
wqBicmlkZ2UgPSAmcXVvdDt4ZW5icjAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKg
IMKgIMKgaGFuZGxlID0gJnF1b3Q7MCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgwqAg
wqAgwqB0eXBlID0gJnF1b3Q7dmlmJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDC
oCDCoGhvdHBsdWctc3RhdHVzID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
OyDCoCB0eXBlID0gJnF1b3Q7cHZoJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCBk
bS12ZXJzaW9uID0gJnF1b3Q7cWVtdV94ZW4mcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IHJvb3RAcmFzcGJlcnJ5cGk0LTY0On4vZ3Vlc3QxIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEFueSBpbnB1dCBhcyBwZXIgYWJvdmU/IExvb2tpbmcg
Zm9yd2FyZCB0byBoZWFyaW5nIGZyb20geW91Ljxicj4NCiZndDvCoCDCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFJlZ2FyZHMsPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyBW
aXB1bCBLdW1hcjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IE9uIFdlZCwgT2N0IDI2LCAyMDIyIGF0IDU6MjEgQU0gU3RlZmFubyBTdGFiZWxsaW5pICZs
dDs8YSBocmVmPSJtYWlsdG86c3N0YWJlbGxpbmlAa2VybmVsLm9yZyIgdGFyZ2V0PSJfYmxhbmsi
PnNzdGFiZWxsaW5pQGtlcm5lbC5vcmc8L2E+Jmd0OyB3cm90ZTo8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqBIaSBWaXB1bCw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgSWYgeW91IGxvb2sgYXQgdGhlIFFFTVUgbG9n
cywgaXQgc2F5czo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgVk5DIHNlcnZlciBydW5uaW5nIG9uIDxhIGhyZWY9Imh0dHA6Ly8xMjcu
MC4wLjE6NTkwMCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+MTI3LjAuMC4xOjU5
MDA8L2E+PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoFRoYXQgaXMgdGhlIFZOQyBzZXJ2ZXIgeW91IG5lZWQgdG8gY29ubmVjdCB0by4g
U28gaW4gdGhlb3J5Ojxicj4NCiZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqDCoCB2bmN2aWV3ZXIgPGEgaHJlZj0iaHR0cDovLzEyNy4wLjAuMTo1
OTAwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj4xMjcuMC4wLjE6NTkwMDwvYT48
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgc2hvdWxkIHdvcmsgY29ycmVjdGx5Ljxicj4NCiZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgSWYg
eW91IGhhdmU6PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoMKgIHZmYiA9IFsmcXVvdDt0eXBlPXZuYyZxdW90O108YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgaW4geW91ciB4
bCBjb25maWcgZmlsZSBhbmQgeW91IGhhdmUgJnF1b3Q7ZmJkZXYmcXVvdDsgaW4geW91ciBMaW51
eCBndWVzdCwgaXQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBzaG91bGQgd29y
ay48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgSWYgeW91IGNvbm5lY3QgdG8gdGhlIFZOQyBzZXJ2ZXIgYnV0IHlvdSBnZXQgYSBibGFj
ayBzY3JlZW4sIGl0IG1pZ2h0IGJlPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
YSBndWVzdCBjb25maWd1cmF0aW9uIGlzc3VlLiBJIHdvdWxkIHRyeSB3aXRoIGEgc2ltcGxlciBn
dWVzdCwgdGV4dCBvbmx5PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgKG5vIFgx
MSwgbm8gV2F5bGFuZCkgYW5kIGVuYWJsZSB0aGUgZmJkZXYgY29uc29sZSAoZmJjb24pLiBTZWU8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBEb2N1bWVudGF0aW9uL2ZiL2ZiY29u
LnJzdCBpbiBMaW51eC4gWW91IHNob3VsZCBiZSBhYmxlIHRvIHNlZSBhPGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgZ3JhcGhpY2FsIGNvbnNvbGUgb3ZlciBWTkMuPGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoElmIHRo
YXQgd29ya3MsIHRoZW4geW91IGtub3cgdGhhdCB0aGUgZmJkZXYga2VybmVsIGRyaXZlciAoeGVu
LWZiZnJvbnQpPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgd29ya3MgY29ycmVj
dGx5Ljxicj4NCiZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqBJZiBpdCBkb2VzbiYjMzk7dCB3b3JrLCB0aGUgb3V0cHV0IG9mICZxdW90O3hlbnN0
b3JlLWxzJnF1b3Q7IHdvdWxkIGJlIGludGVyZXN0aW5nLjxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBDaGVlcnMsPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoFN0ZWZhbm88
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoE9uIFdlZCwgMTkgT2N0IDIwMjIsIFZpcHVsIFN1
bmVqYSB3cm90ZTo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEhpIFN0
ZWZhbm8sPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgVGhhbmtzIGZvciB0aGUgcmVzcG9uc2UhPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDsgSSBhbSBmb2xsb3dpbmcgdGhlIHNhbWUgbGluayB5b3Ugc2hh
cmVkIGZyb20gdGhlIGJlZ2lubmluZy4gVHJpZWQgdGhlIGNvbW1hbmQgJnF1b3Q7dm5jdmlld2Vy
IGxvY2FsaG9zdDowJnF1b3Q7IGluIERPTTAgYnV0PGJyPg0KJmd0O8KgIMKgIMKgIMKgc2FtZTxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoGlzc3VlICZxdW90O0NhbiYjMzk7dCBv
cGVuPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBkaXNwbGF5JnF1b3Q7
LCBiZWxvdyBhcmUgdGhlIGxvZ3M6PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgcm9vdEByYXNwYmVy
cnlwaTQtNjQ6fiMgdm5jdmlld2VyIGxvY2FsaG9zdDowPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsg
VGlnZXJWTkMgVmlld2VyIDY0LWJpdCB2MS4xMS4wPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0OyBCdWlsdCBvbjogMjAyMC0wOS0wOCAxMjoxNjxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgQ29weXJpZ2h0IChDKSAxOTk5LTIwMjAgVGlnZXJWTkMg
VGVhbSBhbmQgbWFueSBvdGhlcnMgKHNlZSBSRUFETUUucnN0KTxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDsgU2VlIDxhIGhyZWY9Imh0dHBzOi8vd3d3LnRpZ2Vydm5jLm9y
ZyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly93d3cudGlnZXJ2bmMu
b3JnPC9hPiBmb3IgaW5mb3JtYXRpb24gb24gVGlnZXJWTkMuPGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0OyBDYW4mIzM5O3Qgb3BlbiBkaXNwbGF5Ojxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IEJlbG93IGFyZSB0aGUgbmV0c3RhdCBsb2dzLCBpIGNvdWxkbiYjMzk7dCBzZWUg
YW55dGhpbmcgcnVubmluZyBhdCBwb3J0IDU5MDAgb3IgNTkwMTo8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0OyByb290QHJhc3BiZXJyeXBpNC02NDp+IyBuZXRzdGF0IC10dXd4PGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBBY3RpdmUgSW50ZXJuZXQgY29ubmVjdGlvbnMgKHcv
byBzZXJ2ZXJzKTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgUHJvdG8g
UmVjdi1RIFNlbmQtUSBMb2NhbCBBZGRyZXNzIMKgIMKgIMKgIMKgIMKgIEZvcmVpZ24gQWRkcmVz
cyDCoCDCoCDCoCDCoCBTdGF0ZSDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDsgdGNwIMKgIMKgIMKgIMKgMCDCoCDCoDE2NCAxOTIuMTY4LjEuMzk6c3NoIMKg
IMKgIMKgIMKgPGEgaHJlZj0iaHR0cDovLzE5Mi4xNjguMS4zODozNzQ3MiIgcmVsPSJub3JlZmVy
cmVyIiB0YXJnZXQ9Il9ibGFuayI+MTkyLjE2OC4xLjM4OjM3NDcyPC9hPiDCoCDCoCDCoEVTVEFC
TElTSEVEPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBBY3RpdmUgVU5J
WCBkb21haW4gc29ja2V0cyAody9vIHNlcnZlcnMpPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0OyBQcm90byBSZWZDbnQgRmxhZ3MgwqAgwqAgwqAgVHlwZSDCoCDCoCDCoCBT
dGF0ZSDCoCDCoCDCoCDCoCBJLU5vZGUgUGF0aDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDsgdW5peCDCoDggwqAgwqAgwqBbIF0gwqAgwqAgwqAgwqAgREdSQU0gwqAgwqAg
wqBDT05ORUNURUQgwqAgwqAgwqAxMDU2NSAvZGV2L2xvZzxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDsgdW5peCDCoDMgwqAgwqAgwqBbIF0gwqAgwqAgwqAgwqAgU1RSRUFN
IMKgIMKgIENPTk5FQ1RFRCDCoCDCoCDCoDEwODkxIC92YXIvcnVuL3hlbnN0b3JlZC9zb2NrZXQ8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHVuaXggwqAzIMKgIMKgIMKg
WyBdIMKgIMKgIMKgIMKgIFNUUkVBTSDCoCDCoCBDT05ORUNURUQgwqAgwqAgwqAxMzc5MTxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgdW5peCDCoDMgwqAgwqAgwqBbIF0g
wqAgwqAgwqAgwqAgU1RSRUFNIMKgIMKgIENPTk5FQ1RFRCDCoCDCoCDCoDEwODQzIC92YXIvcnVu
L3hlbnN0b3JlZC9zb2NrZXQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IHVuaXggwqAzIMKgIMKgIMKgWyBdIMKgIMKgIMKgIMKgIFNUUkVBTSDCoCDCoCBDT05ORUNURUQg
wqAgwqAgwqAxMDU3MyAvdmFyL3J1bi94ZW5zdG9yZWQvc29ja2V0PGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0OyB1bml4IMKgMiDCoCDCoCDCoFsgXSDCoCDCoCDCoCDCoCBE
R1JBTSDCoCDCoCDCoENPTk5FQ1RFRCDCoCDCoCDCoDE0NTEwPGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0OyB1bml4IMKgMyDCoCDCoCDCoFsgXSDCoCDCoCDCoCDCoCBTVFJF
QU0gwqAgwqAgQ09OTkVDVEVEIMKgIMKgIMKgMTMyNDk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IHVuaXggwqAyIMKgIMKgIMKgWyBdIMKgIMKgIMKgIMKgIERHUkFNIMKg
IMKgIMKgQ09OTkVDVEVEIMKgIMKgIMKgMTM4ODc8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IHVuaXggwqAyIMKgIMKgIMKgWyBdIMKgIMKgIMKgIMKgIERHUkFNIMKgIMKg
IMKgQ09OTkVDVEVEIMKgIMKgIMKgMTA1OTk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IHVuaXggwqAzIMKgIMKgIMKgWyBdIMKgIMKgIMKgIMKgIFNUUkVBTSDCoCDCoCBD
T05ORUNURUQgwqAgwqAgwqAxNDAwNTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgdW5peCDCoDMgwqAgwqAgwqBbIF0gwqAgwqAgwqAgwqAgU1RSRUFNIMKgIMKgIENPTk5F
Q1RFRCDCoCDCoCDCoDEzMjU4PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
OyB1bml4IMKgMyDCoCDCoCDCoFsgXSDCoCDCoCDCoCDCoCBTVFJFQU0gwqAgwqAgQ09OTkVDVEVE
IMKgIMKgIMKgMTMyNDg8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHVu
aXggwqAzIMKgIMKgIMKgWyBdIMKgIMKgIMKgIMKgIFNUUkVBTSDCoCDCoCBDT05ORUNURUQgwqAg
wqAgwqAxNDAwMzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgdW5peCDC
oDMgwqAgwqAgwqBbIF0gwqAgwqAgwqAgwqAgU1RSRUFNIMKgIMKgIENPTk5FQ1RFRCDCoCDCoCDC
oDEwNTcyIC92YXIvcnVuL3hlbnN0b3JlZC9zb2NrZXQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IHVuaXggwqAzIMKgIMKgIMKgWyBdIMKgIMKgIMKgIMKgIFNUUkVBTSDC
oCDCoCBDT05ORUNURUQgwqAgwqAgwqAxMDc4NiAvdmFyL3J1bi94ZW5zdG9yZWQvc29ja2V0PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyB1bml4IMKgMyDCoCDCoCDCoFsg
XSDCoCDCoCDCoCDCoCBER1JBTSDCoCDCoCDCoENPTk5FQ1RFRCDCoCDCoCDCoDEzMTg2PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyB1bml4IMKgMyDCoCDCoCDCoFsgXSDC
oCDCoCDCoCDCoCBTVFJFQU0gwqAgwqAgQ09OTkVDVEVEIMKgIMKgIMKgMTA4NjQgL3Zhci9ydW4v
eGVuc3RvcmVkL3NvY2tldDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsg
dW5peCDCoDMgwqAgwqAgwqBbIF0gwqAgwqAgwqAgwqAgU1RSRUFNIMKgIMKgIENPTk5FQ1RFRCDC
oCDCoCDCoDEwODEyIC92YXIvcnVuL3hlbnN0b3JlZC9zb2NrZXQ8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHVuaXggwqAyIMKgIMKgIMKgWyBdIMKgIMKgIMKgIMKgIERH
UkFNIMKgIMKgIMKgQ09OTkVDVEVEIMKgIMKgIMKgMTQwODM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IHVuaXggwqAzIMKgIMKgIMKgWyBdIMKgIMKgIMKgIMKgIFNUUkVB
TSDCoCDCoCBDT05ORUNURUQgwqAgwqAgwqAxMDgxMyAvdmFyL3J1bi94ZW5zdG9yZWQvc29ja2V0
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyB1bml4IMKgMyDCoCDCoCDC
oFsgXSDCoCDCoCDCoCDCoCBTVFJFQU0gwqAgwqAgQ09OTkVDVEVEIMKgIMKgIMKgMTQwNjg8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHVuaXggwqAzIMKgIMKgIMKgWyBd
IMKgIMKgIMKgIMKgIFNUUkVBTSDCoCDCoCBDT05ORUNURUQgwqAgwqAgwqAxMzI1Njxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgdW5peCDCoDMgwqAgwqAgwqBbIF0gwqAg
wqAgwqAgwqAgU1RSRUFNIMKgIMKgIENPTk5FQ1RFRCDCoCDCoCDCoDEwNTcxIC92YXIvcnVuL3hl
bnN0b3JlZC9zb2NrZXQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHVu
aXggwqAzIMKgIMKgIMKgWyBdIMKgIMKgIMKgIMKgIFNUUkVBTSDCoCDCoCBDT05ORUNURUQgwqAg
wqAgwqAxMDg0Mjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgdW5peCDC
oDMgwqAgwqAgwqBbIF0gwqAgwqAgwqAgwqAgU1RSRUFNIMKgIMKgIENPTk5FQ1RFRCDCoCDCoCDC
oDEzOTg1PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyB1bml4IMKgMyDC
oCDCoCDCoFsgXSDCoCDCoCDCoCDCoCBER1JBTSDCoCDCoCDCoENPTk5FQ1RFRCDCoCDCoCDCoDEz
MTg1PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyB1bml4IMKgMiDCoCDC
oCDCoFsgXSDCoCDCoCDCoCDCoCBTVFJFQU0gwqAgwqAgQ09OTkVDVEVEIMKgIMKgIMKgMTM4ODQ8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHVuaXggwqAyIMKgIMKgIMKg
WyBdIMKgIMKgIMKgIMKgIERHUkFNIMKgIMKgIMKgQ09OTkVDVEVEIMKgIMKgIMKgMTQ1Mjg8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHVuaXggwqAyIMKgIMKgIMKgWyBd
IMKgIMKgIMKgIMKgIERHUkFNIMKgIMKgIMKgQ09OTkVDVEVEIMKgIMKgIMKgMTM3ODU8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHVuaXggwqAzIMKgIMKgIMKgWyBdIMKg
IMKgIMKgIMKgIFNUUkVBTSDCoCDCoCBDT05ORUNURUQgwqAgwqAgwqAxNDAzNDxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IEF0dGFjaGluZyB4ZW4gbG9nIGZpbGVzIG9mIC92YXIvbG9nL3hlbi48YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEkgZGlkbiYjMzk7dCBnZXQgdGhl
IHJvbGUgb2YgUUVNVSBoZXJlIGJlY2F1c2UgYXMgbWVudGlvbmVkIGVhcmxpZXIsIEkgYW0gcG9y
dGluZyBpbiByYXNwYmVycnlwaSA0Qi48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBSZWdhcmRzLDxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgVmlwdWwgS3VtYXI8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0OyBPbiBXZWQsIE9jdCAxOSwgMjAyMiBhdCAxMjo0MyBBTSBTdGVmYW5v
IFN0YWJlbGxpbmkgJmx0OzxhIGhyZWY9Im1haWx0bzpzc3RhYmVsbGluaUBrZXJuZWwub3JnIiB0
YXJnZXQ9Il9ibGFuayI+c3N0YWJlbGxpbmlAa2VybmVsLm9yZzwvYT4mZ3Q7IHdyb3RlOjxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoEl0IHVzdWFsbHkg
d29ya3MgdGhlIHdheSBpdCBpcyBkZXNjcmliZWQgaW4gdGhlIGd1aWRlOjxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqA8YnI+DQom
Z3Q7wqAgwqAgwqAgwqDCoMKgPGEgaHJlZj0iaHR0cHM6Ly93d3cudmlydHVhdG9waWEuY29tL2lu
ZGV4LnBocD90aXRsZT1Db25maWd1cmluZ19hX1ZOQ19iYXNlZF9HcmFwaGljYWxfQ29uc29sZV9m
b3JfYV9YZW5fUGFyYXZpcnR1YWxpemVkX2RvbWFpblVfR3Vlc3QiIHJlbD0ibm9yZWZlcnJlciIg
dGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vd3d3LnZpcnR1YXRvcGlhLmNvbS9pbmRleC5waHA/dGl0
bGU9Q29uZmlndXJpbmdfYV9WTkNfYmFzZWRfR3JhcGhpY2FsX0NvbnNvbGVfZm9yX2FfWGVuX1Bh
cmF2aXJ0dWFsaXplZF9kb21haW5VX0d1ZXN0PC9hPjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqBZb3UgZG9uJiMzOTt0IG5lZWQgdG8gaW5zdGFsbCBhbnkgVk5DLXJlbGF0ZWQgc2Vy
dmVyIHNvZnR3YXJlIGJlY2F1c2UgaXQgaXM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqBhbHJlYWR5IHByb3ZpZGVkIGJ5IFhlbiAodG8gYmUgcHJlY2lz
ZSBpdCBpcyBwcm92aWRlZCBieSBRRU1VIHdvcmtpbmc8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqB0b2dldGhlciB3aXRoIFhlbi4pPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoFlvdSBvbmx5IG5lZWQgdGhlIHZuYyBjbGllbnQgaW4gZG9t
MCBzbyB0aGF0IHlvdSBjYW4gY29ubmVjdCwgYnV0IHlvdTxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoGNvdWxkIGFsc28gcnVuIHRoZSB2bmMgY2xpZW50
IG91dHNpZGUgZnJvbSBhbm90aGVyIGhvc3QuIFNvIGJhc2ljYWxseTxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoHRoZSBmb2xsb3dpbmcgc2hvdWxkIHdv
cmsgd2hlbiBleGVjdXRlZCBpbiBEb20wIGFmdGVyIGNyZWF0aW5nIERvbVU6PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoMKgIHZuY3ZpZXdlciBsb2NhbGhvc3Q6MDxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBDYW4geW91IGF0dGFjaCB0aGUgWGVuIGFuZCBRRU1VIGxv
Z3MgKC92YXIvbG9nL3hlbi8qKT8gQW5kIGFsc28gdXNlPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgbmV0c3RhdCAtdGF1bnAgdG8gY2hlY2sgaWYgdGhl
cmUgaXMgYW55dGhpbmcgcnVubmluZyBhdCBwb3J0IDU5MDAgb3I8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqA1OTAxPzxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqBDaGVlcnMsPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoFN0
ZWZhbm88YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoE9uIFR1ZSwgMTggT2N0IDIwMjIsIFZpcHVsIFN1bmVqYSB3
cm90ZTo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IEhpIFN0ZWZhbm8sPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDsgVGhhbmtzIGZvciB0aGUgcmVzcG9uc2UhPGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgSSBjb3VsZCBpbnN0YWxsIHRpZ2VyVk5D
LCB4MTF2bmMgJmFtcDsgbGlidm5jc2VydmVyIGluIERvbTAgeGVuLWltYWdlLW1pbmltYWwgYnV0
IG9ubHkgbWFuYWdlIHRvIGluc3RhbGw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqBsaWJ2bmNzZXJ2ZXIoY291bGRuJiMzOTt0PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgaW5zdGFsbCB0aWdlcnZuYzxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgJmFtcDsgeDExdm5jIGJlY2F1c2Ug
b2YgeDExPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0OyBzdXBwb3J0IG1pc3NpbmcsIGl0JiMzOTtzIHdheWxhbmQpIGluIERPTVUgY3VzdG9tIGdy
YXBoaWNhbCBpbWFnZS4gSSB0cmllZCBydW5uaW5nIHZuY3ZpZXdlciB3aXRoIElQIGFkZHJlc3Mg
JmFtcDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqBwb3J0PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgaW4gZG9tMCB0bzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoGFjY2VzcyB0aGUgZG9tdTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgZ3JhcGhpY2FsIGltYWdlIGRpc3BsYXkgYXMgcGVy
IGJlbG93IGNvbW1hbmRzLjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IMKgdm5jdmlld2VyIDxhIGhyZWY9Imh0dHA6Ly8xOTIuMTY4LjEuNDI6
NTkwMSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+MTkyLjE2OC4xLjQyOjU5MDE8
L2E+PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
OyDCoDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDsgwqBCdXQgaXQgc2hvd2luZyBjYW4mIzM5O3Qgb3BlbiBkaXNwbGF5LCBiZWxvdyBhcmUgdGhl
IGxvZ3M6PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0OyDCoDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgcm9vdEByYXNwYmVycnlwaTQtNjQ6fi9ndWVzdDEjIHZuY3ZpZXdlciA8YSBocmVmPSJo
dHRwOi8vMTkyLjE2OC4xLjQyOjU5MDEiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsi
PjE5Mi4xNjguMS40Mjo1OTAxPC9hPjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IFRpZ2VyVk5DIFZpZXdlciA2NC1iaXQgdjEuMTEuMDxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgQnVpbHQgb246
IDIwMjAtMDktMDggMTI6MTY8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IENvcHlyaWdodCAoQykgMTk5OS0yMDIwIFRpZ2VyVk5DIFRlYW0gYW5k
IG1hbnkgb3RoZXJzIChzZWUgUkVBRE1FLnJzdCk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFNlZSA8YSBocmVmPSJodHRwczovL3d3dy50aWdl
cnZuYy5vcmciIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vd3d3LnRp
Z2Vydm5jLm9yZzwvYT4gZm9yIGluZm9ybWF0aW9uIG9uIFRpZ2VyVk5DLjxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgQ2FuJiMzOTt0IG9wZW4g
ZGlzcGxheTo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IHJvb3RAcmFzcGJlcnJ5cGk0LTY0On4vZ3Vlc3QxIzxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEkgYW0gbm90IGV4YWN0bHnCoHN1cmUg
d2hhdCB0aGUgaXNzdWUgaXMgYnV0IEkgdGhvdWdodCBvbmx5IGxpYnZuY3NlcnZlciBpbiBET01V
IGNvdWxkIHdvcmsgdG8gZ2V0IGFjY2VzcyBidXQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqBpdDxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoGRpZCBub3Q8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqB3b3JrLsKgPGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBJZiBUaWdlclZOQyBpcyB0aGUg
aXNzdWUgaGVyZSB0aGVuIGlzIHRoZXJlIGFueSBvdGhlciBWTkMgc291cmNlIHdoaWNoIGNvdWxk
IGJlIGluc3RhbGxlZCBmb3IgYm90aCB4MTEgJmFtcDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqB3YXlsYW5kIHN1cHBvcnRlZDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoGltYWdlcz88YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBSZWdhcmRzLDxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgVmlwdWwgS3VtYXI8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBPbiBUdWUsIE9jdCAxOCwg
MjAyMiBhdCAyOjQwIEFNIFN0ZWZhbm8gU3RhYmVsbGluaSAmbHQ7PGEgaHJlZj0ibWFpbHRvOnNz
dGFiZWxsaW5pQGtlcm5lbC5vcmciIHRhcmdldD0iX2JsYW5rIj5zc3RhYmVsbGluaUBrZXJuZWwu
b3JnPC9hPiZndDsgd3JvdGU6PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgVk5DIGlzIHR5cGljYWxseSBlYXNpZXIgdG8gc2V0
dXAsIGJlY2F1c2UgU0RMIG5lZWRzIGV4dHJhIGxpYnJhcmllcyBhdDxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoGJ1aWxkIHRp
bWUgYW5kIHJ1bnRpbWUuIElmIFFFTVUgaXMgYnVpbHQgd2l0aG91dCBTREwgc3VwcG9ydCBpdCB3
b24mIzM5O3Q8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqBzdGFydCB3aGVuIHlvdSBhc2sgZm9yIFNETC48YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgVk5DIHNo
b3VsZCB3b3JrIHdpdGggYm90aCB4MTEgYW5kIHdheWxhbmQgaW4geW91ciBkb21VLiBJdCBkb2Vz
biYjMzk7dCB3b3JrPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgYXQgdGhlIHgxMSBsZXZlbCwgaXQgZXhwb3NlcyBhIHNwZWNp
YWwgZmJkZXYgZGV2aWNlIGluIHlvdXIgZG9tVSB0aGF0PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgc2hvdWxkIHdvcmsgd2l0
aDo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAtIGEgZ3JhcGhpY2FsIGNvbnNvbGUgaW4gTGludXggZG9tVTxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoC0g
eDExPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgLSB3YXlsYW5kIChidXQgSSBoYXZlbiYjMzk7dCB0ZXN0ZWQgdGhpcyBzbyBJ
IGFtIG5vdCAxMDAlIHN1cmUgYWJvdXQgaXQpPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoFdoZW4geW91IHNheSAmcXVvdDtpdCBk
b2VzbiYjMzk7dCB3b3JrJnF1b3Q7LCB3aGF0IGRvIHlvdSBtZWFuPyBEbyB5b3UgZ2V0IGEgYmxh
Y2s8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqB3aW5kb3c/PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoFlvdSBuZWVkIENPTkZJR19YRU5fRkJERVZfRlJPTlRF
TkQgaW4gTGludXggZG9tVTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoChkcml2ZXJzL3ZpZGVvL2ZiZGV2L3hlbi1mYmZyb250
LmMpLiBJIHdvdWxkIHRyeSB0byBnZXQgYSBncmFwaGljYWwgdGV4dDxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoGNvbnNvbGUg
dXAgYW5kIHJ1bm5pbmcgaW4geW91ciBkb21VIGJlZm9yZSBhdHRlbXB0aW5nIHgxMS93YXlsYW5k
Ljxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqBDaGVlcnMsPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoFN0ZWZhbm88YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgT24gTW9uLCAxNyBPY3QgMjAyMiwg
VmlwdWwgU3VuZWphIHdyb3RlOjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgSGksPGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBUaGFua3Mh
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgSSBoYXZlIHBvcnRlZCB4ZW4gbWluaW1hbCBpbWFn
ZSBhcyBET00wICZhbXA7IGN1c3RvbSB3YXlsYW5kIEdVSSBiYXNlZCBpbWFnZSBhcyBET01VIGlu
IHJhc3BiZXJyeSBwaTRCLiBJPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgYW0g
dHJ5aW5nIHRvPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgbWFrZSBHVUk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqBkaXNwbGF5IHVwPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBmb3LCoGd1ZXN0IG1h
Y2hpbmUuIEkgdHJpZWQgdXNpbmfCoHNkbCwgaW5jbHVkZWQgYmVsb3cgbGluZSBpbiBndWVzdC5j
b25mIGZpbGU8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHZmYj0gWyAmIzM5O3NkbD0xJiMzOTsgXTxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IEJ1dCBpdCBpcyB0aHJvd2luZyBiZWxvdyBlcnJvcjo8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0OyByb290QHJhc3BiZXJyeXBpNC02NDp+L2d1ZXN0MSMgeGwgY3JlYXRl
IC1jIGd1ZXN0MS5jZmc8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFBhcnNpbmcgY29uZmlnIGZyb20gZ3Vlc3QxLmNm
Zzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgbGlieGw6IGVycm9yOiBsaWJ4bF9xbXAuYzoxNDAwOnFtcF9ldl9mZF9j
YWxsYmFjazogRG9tYWluIDM6ZXJyb3Igb24gUU1QIHNvY2tldDogQ29ubmVjdGlvbiByZXNldCBi
eTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoHBlZXI8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGxp
YnhsOiBlcnJvcjogbGlieGxfcW1wLmM6MTQzOTpxbXBfZXZfZmRfY2FsbGJhY2s6IERvbWFpbiAz
OkVycm9yIGhhcHBlbmVkIHdpdGggdGhlIFFNUCBjb25uZWN0aW9uIHRvPGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgUUVNVTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgbGlieGw6IGVycm9yOiBsaWJ4
bF9kbS5jOjMzNTE6ZGV2aWNlX21vZGVsX3Bvc3Rjb25maWdfZG9uZTogRG9tYWluIDM6UG9zdCBE
TSBzdGFydHVwIGNvbmZpZ3MgZmFpbGVkLDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoHJjPS0yNjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgbGlieGw6IGVycm9yOiBsaWJ4bF9jcmVhdGUuYzoxODY3
OmRvbWNyZWF0ZV9kZXZtb2RlbF9zdGFydGVkOiBEb21haW4gMzpkZXZpY2UgbW9kZWwgZGlkIG5v
dCBzdGFydDo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAtMjY8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGxpYnhsOiBlcnJv
cjogbGlieGxfYW91dGlscy5jOjY0NjpsaWJ4bF9fa2lsbF94c19wYXRoOiBEZXZpY2UgTW9kZWwg
YWxyZWFkeSBleGl0ZWQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGxpYnhsOiBlcnJvcjogbGlieGxfZG9tYWluLmM6
MTE4MzpsaWJ4bF9fZGVzdHJveV9kb21pZDogRG9tYWluIDM6Tm9uLWV4aXN0YW50IGRvbWFpbjxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDsgbGlieGw6IGVycm9yOiBsaWJ4bF9kb21haW4uYzoxMTM3OmRvbWFpbl9kZXN0
cm95X2NhbGxiYWNrOiBEb21haW4gMzpVbmFibGUgdG8gZGVzdHJveSBndWVzdDxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDsgbGlieGw6IGVycm9yOiBsaWJ4bF9kb21haW4uYzoxMDY0OmRvbWFpbl9kZXN0cm95X2NiOiBE
b21haW4gMzpEZXN0cnVjdGlvbiBvZiBkb21haW4gZmFpbGVkPGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgQW5vdGhlciB3YXkgaXMgVk5DLCBpIGNvdWxkIGluc3RhbGwgdGlnZXJ2bmMgaW4gRE9N
MCBidXQgc2FtZSBpIGNvdWxkbiYjMzk7dCBpbiBndWVzdCBtYWNoaW5lIGJlY2F1c2UgaXQ8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBkb2VzbiYjMzk7dCBzdXBwb3J0PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgeDExKHN1cHBvcnRzIHdheWxhbmQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IG9ubHkpLiBJIGFtIGNvbXBsZXRl
bHkgYmxvY2tlZCBoZXJlLCBOZWVkIHlvdXIgc3VwcG9ydCB0byBlbmFibGUgdGhlIGRpc3BsYXkg
dXAuPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0OyBBbnkgYWx0ZXJuYXRpdmUgb2YgVk5DIHdoaWNoIGNvdWxkIHdvcmsg
aW4gYm90aCB4MTEgJmFtcDsgd2F5bGFuZCBzdXBwb3J0ZWQgaW1hZ2VzPzxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IEFueSBpbnB1dCBvbiBWTkMsIFNETCBvciBhbnkgb3RoZXIgd2F5IHRvIHBy
b2NlZWQgb24gdGhpcz8gTG9va2luZyBmb3J3YXJkIHRvIGhlYXJpbmcgZnJvbSB5b3UuPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDsgUmVnYXJkcyw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFZpcHVsIEt1bWFyPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0OyA8YnI+DQomZ3Q7IDxicj4NCiZndDsgPC9ibG9ja3F1
b3RlPjwvZGl2Pg0K
--0000000000003d2c8b05eec7bea0--

