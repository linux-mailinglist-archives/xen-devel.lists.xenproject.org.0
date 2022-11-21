Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DB5632C55
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 19:51:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446848.702664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxBrV-0004cB-6U; Mon, 21 Nov 2022 18:49:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446848.702664; Mon, 21 Nov 2022 18:49:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxBrV-0004Yj-22; Mon, 21 Nov 2022 18:49:45 +0000
Received: by outflank-mailman (input) for mailman id 446848;
 Mon, 21 Nov 2022 18:49:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l6Bi=3V=gmail.com=vsuneja63@srs-se1.protection.inumbo.net>)
 id 1oxBrR-0004Yc-Sn
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 18:49:42 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f233566-69cd-11ed-8fd2-01056ac49cbb;
 Mon, 21 Nov 2022 19:49:37 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id ud5so30640328ejc.4
 for <xen-devel@lists.xenproject.org>; Mon, 21 Nov 2022 10:49:37 -0800 (PST)
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
X-Inumbo-ID: 3f233566-69cd-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ke3DBYdzwNX9X3SC3XaBS7LOcZvE1sBnQryOqOw3NRU=;
        b=qZfLQ862GvcHha+Szhmo/kMAF+M3lLLfjIQYKHZ/FAtwb+AhC8hIyb0JsBWH6PSaIC
         4eBPGI6FGa/H2tH5Jq/dAZM5akEtK919XbWWcVq8FQKg/56D1btqGt9P3hAC0Bb9vIUk
         gzR9wRvGhjCfz/ZWZ75Hd2O6dOFU1fPVyiH5E7il2y8fy1zrSjAXb/daB6npXyQuF78b
         /Ga4JV+0azCO8VOZ7Ducu+oxIrndpUj4U3OlpNFofnc9zcDj7dGX4UIn6B30jx4EHbH0
         du61dUhbuSiwrvvQluE9mtH7VvJVdM63jjqs1CqF0czqUgsSO/NlWu8i8SD+Eny1rFl1
         IxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ke3DBYdzwNX9X3SC3XaBS7LOcZvE1sBnQryOqOw3NRU=;
        b=TKmqC5ld+5GagW0aybhNFEX8GLGKbuKqdeuU5vtqrRdUDdjydiTVRaDG+w6dlo36RB
         h+jwe9AQz4MEVv8M2zV6EK5QIMUYvlr91ymPYn8YoO285LyHWOJKTHW6JVAPchbR9T9D
         Nq+UXDxeC1rXtsZ1l0gNJ1wjI0InuoGUjhBAzxpEvUGmGmbFin5w/VqNrwtti9in9fMz
         fecYwzqXqQADx6QCaORQrVNKgyqH8vY+nsE4XwzhQxhsQ6eE9pD9WWp/oFzfgGB+kSuj
         rplRG8Cd4eC5cHH0HOaotGL6Ejf2GSuOKZz0Fhgd3tWRJiYLWXWCYXUBBd0Izwj+XzIH
         5xqA==
X-Gm-Message-State: ANoB5pluz3Um4hQ4q397OeMrUWqD3+I6pBHfo4TYJLvxeeA/qcHqsSU0
	//4vI+t01dCNVrRaaVXYdYFBf67HirWhexVnWZ63mZpTEZ0=
X-Google-Smtp-Source: AA0mqf6vimyNhAqWEBJZLSyR/Mx6BDOSJTbVBQPUHMZyBoTR93JPFuKXT5U80ZQLhQ2Ccj6sCQJExvKPaUFsBjxOTMQ=
X-Received: by 2002:a17:907:3907:b0:7ae:37a8:9b5c with SMTP id
 so7-20020a170907390700b007ae37a89b5cmr1482502ejc.241.1669056576054; Mon, 21
 Nov 2022 10:49:36 -0800 (PST)
MIME-Version: 1.0
References: <CALAP8f--jyG=ufJ9WGtL6qoeGdsykjNK85G3q50SzJm5+wOzhQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2210171400570.2351079@ubuntu-linux-20-04-desktop>
 <CALAP8f81ojfVD9n5EMtD7DxY-8uomgENVEQH9Afz7Hk9rfaAsw@mail.gmail.com>
 <alpine.DEB.2.22.394.2210181213370.4587@ubuntu-linux-20-04-desktop>
 <CALAP8f9Zgue6WfAk2uRGkg=1Up2Z+eQWqvQ1_Z2=r66Z5fvKoA@mail.gmail.com>
 <alpine.DEB.2.22.394.2210251641540.1397955@ubuntu-linux-20-04-desktop>
 <CALAP8f8Z8A2u8h56EJWOCN7nJFDvyEvM-Q85XMnUP6Y6mZDg3w@mail.gmail.com>
 <CALAP8f_n2okQ-Ss_kGACAq3BVYXS_D2P_8AyhOzUxqgWpz9f4g@mail.gmail.com> <alpine.DEB.2.22.394.2211101702250.50442@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2211101702250.50442@ubuntu-linux-20-04-desktop>
From: Vipul Suneja <vsuneja63@gmail.com>
Date: Tue, 22 Nov 2022 00:19:19 +0530
Message-ID: <CALAP8f8zGfNA_CZU4UQXy7-rPT6dqih9XpzuKM3vvkoBvy6usg@mail.gmail.com>
Subject: Re: Porting Xen in raspberry pi4B
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, oleksandr_andrushchenko@epam.com, 
	oleksandr_tyshchenko@epam.com, jgross@suse.com, boris.ostrovsky@oracle.com, 
	Bertrand.Marquis@arm.com
Content-Type: multipart/mixed; boundary="00000000000054191f05edff84e8"

--00000000000054191f05edff84e8
Content-Type: multipart/alternative; boundary="00000000000054191d05edff84e6"

--00000000000054191d05edff84e6
Content-Type: text/plain; charset="UTF-8"

Hi Stefano,

Thanks for the support!

Looks like I have tried all the combinations & possible ways to get display
up but failed. Is there any document or pdf for porting xen on raspberrypi4.
I could find lot's of links telling the same but couldn't see any official
user guide or document from the xen community on the same. If there is
something to refer
to please share with me.
I am attaching the kernel configuration file also, just take a look if i
have missed anything.
Any other suggestions or input from your end could be really helpful?

Regards,
Vipul Kumar

On Fri, Nov 11, 2022 at 6:40 AM Stefano Stabellini <sstabellini@kernel.org>
wrote:

> Hi Vipul,
>
> Sorry for the late reply. From the earlier logs that you sent, it looks
> like everything should be working correctly. Specifically:
>
>      vfb = ""
>       1 = ""
>        0 = ""
>         frontend = "/local/domain/1/device/vfb/0"
>         frontend-id = "1"
>         online = "1"
>         state = "4"
>         vnc = "1"
>         vnclisten = "127.0.0.1"
>         vncdisplay = "0"
>         vncunused = "1"
>         sdl = "0"
>         opengl = "0"
>         feature-resize = "1"
>         hotplug-status = "connected"
>         request-update = "1"
>
> state "4" means "connected". So I would expect that you should be able
> to connect to the vnc server using vncviewer. You might not see anything
> (black screen) but you should definitely be able to connect.
>
> I wouldn't try to launch x11 in the guest just yet. fbcon in Linux is
> enough to render something on the screen. You should be able to see the
> Linux text-based console rendered graphically, connecting to it via vnc.
>
> Sorry for the basic question, but have you tried all the following?
>
> vncviewer 127.0.0.1:0
> vncviewer 127.0.0.1:1
> vncviewer 127.0.0.1:2
> vncviewer 127.0.0.1:5900
> vncviewer 127.0.0.1:5901
> vncviewer 127.0.0.1:5902
>
> Given that from the xenstore-ls logs everything seems to work correctly
> I am not sure what else to suggest. You might have to add printf to QEMU
> ui/vnc.c and hw/display/xenfb.c to see what is going wrong.
>
> Cheers,
>
> Stefano
>
>
> On Mon, 7 Nov 2022, Vipul Suneja wrote:
> > Hi Stefano,
> > Thanks!
> >
> > Any input further on "xenstore-ls" logs?
> >
> > I am trying to run the x0vncserver & x11vnc server manually on guest
> machine(xen_guest_image_minimal) image but it's failing with the below
> > error.
> >
> > root@raspberrypi4-64:/usr/bin# x0vncserver
> > x0vncserver: unable to open display ""
> > root@raspberrypi4-64:/usr/bin#
> > root@raspberrypi4-64:/usr/bin# x11vnc
> > ###############################################################
> > #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
> > #@                                                           @#
> > #@  **  WARNING  **  WARNING  **  WARNING  **  WARNING  **   @#
> > #@                                                           @#
> > #@        YOU ARE RUNNING X11VNC WITHOUT A PASSWORD!!        @#
> > #@                                                           @#
> > #@  This means anyone with network access to this computer   @#
> > #@  may be able to view and control your desktop.            @#
> > #@                                                           @#
> > #@ >>> If you did not mean to do this Press CTRL-C now!! <<< @#
> > #@                                                           @#
> > #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
> > #@                                                           @#
> > #@  You can create an x11vnc password file by running:       @#
> > #@                                                           @#
> > #@       x11vnc -storepasswd password /path/to/passfile      @#
> > #@  or   x11vnc -storepasswd /path/to/passfile               @#
> > #@  or   x11vnc -storepasswd                                 @#
> > #@                                                           @#
> > #@  (the last one will use ~/.vnc/passwd)                    @#
> > #@                                                           @#
> > #@  and then starting x11vnc via:                            @#
> > #@                                                           @#
> > #@      x11vnc -rfbauth /path/to/passfile                    @#
> > #@                                                           @#
> > #@  an existing ~/.vnc/passwd file from another VNC          @#
> > #@  application will work fine too.                          @#
> > #@                                                           @#
> > #@  You can also use the -passwdfile or -passwd options.     @#
> > #@  (note -passwd is unsafe if local users are not trusted)  @#
> > #@                                                           @#
> > #@  Make sure any -rfbauth and -passwdfile password files    @#
> > #@  cannot be read by untrusted users.                       @#
> > #@                                                           @#
> > #@  Use x11vnc -usepw to automatically use your              @#
> > #@  ~/.vnc/passwd or ~/.vnc/passwdfile password files.       @#
> > #@  (and prompt you to create ~/.vnc/passwd if neither       @#
> > #@  file exists.)  Under -usepw, x11vnc will exit if it      @#
> > #@  cannot find a password to use.                           @#
> > #@                                                           @#
> > #@                                                           @#
> > #@  Even with a password, the subsequent VNC traffic is      @#
> > #@  sent in the clear.  Consider tunnelling via ssh(1):      @#
> > #@                                                           @#
> > #@    http://www.karlrunge.com/x11vnc/#tunnelling            @#
> > #@                                                           @#
> > #@  Or using the x11vnc SSL options: -ssl and -stunnel       @#
> > #@                                                           @#
> > #@  Please Read the documentation for more info about        @#
> > #@  passwords, security, and encryption.                     @#
> > #@                                                           @#
> > #@    http://www.karlrunge.com/x11vnc/faq.html#faq-passwd    @#
> > #@                                                           @#
> > #@  To disable this warning use the -nopw option, or put     @#
> > #@  'nopw' on a line in your ~/.x11vncrc file.               @#
> > #@                                                           @#
> > #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
> > ###############################################################
> > 09/03/2018 12:58:41 x11vnc version: 0.9.16 lastmod: 2019-01-05  pid: 424
> > 09/03/2018 12:58:41 XOpenDisplay("") failed.
> > 09/03/2018 12:58:41 Trying again with XAUTHLOCALHOSTNAME=localhost ...
> > 09/03/2018 12:58:41
> > 09/03/2018 12:58:41 *** XOpenDisplay failed. No -display or DISPLAY.
> > 09/03/2018 12:58:41 *** Trying ":0" in 4 seconds.  Press Ctrl-C to abort.
> > 09/03/2018 12:58:41 *** 1 2 3 4
> > 09/03/2018 12:58:45 XOpenDisplay(":0") failed.
> > 09/03/2018 12:58:45 Trying again with XAUTHLOCALHOSTNAME=localhost ...
> > 09/03/2018 12:58:45 XOpenDisplay(":0") failed.
> > 09/03/2018 12:58:45 Trying again with unset XAUTHLOCALHOSTNAME ...
> > 09/03/2018 12:58:45
> >
> > 09/03/2018 12:58:45 ***************************************
> > 09/03/2018 12:58:45 *** XOpenDisplay failed (:0)
> >
> > *** x11vnc was unable to open the X DISPLAY: ":0", it cannot continue.
> > *** There may be "Xlib:" error messages above with details about the
> failure.
> >
> > Some tips and guidelines:
> >
> > ** An X server (the one you wish to view) must be running before x11vnc
> is
> >    started: x11vnc does not start the X server.  (however, see the
> -create
> >    option if that is what you really want).
> >
> > ** You must use -display <disp>, -OR- set and export your $DISPLAY
> >    environment variable to refer to the display of the desired X server.
> >  - Usually the display is simply ":0" (in fact x11vnc uses this if you
> forget
> >    to specify it), but in some multi-user situations it could be ":1",
> ":2",
> >    or even ":137".  Ask your administrator or a guru if you are having
> >    difficulty determining what your X DISPLAY is.
> >
> > ** Next, you need to have sufficient permissions (Xauthority)
> >    to connect to the X DISPLAY.   Here are some Tips:
> >
> >  - Often, you just need to run x11vnc as the user logged into the X
> session.
> >    So make sure to be that user when you type x11vnc.
> >  - Being root is usually not enough because the incorrect
> MIT-MAGIC-COOKIE
> >    file may be accessed.  The cookie file contains the secret key that
> >    allows x11vnc to connect to the desired X DISPLAY.
> >  - You can explicitly indicate which MIT-MAGIC-COOKIE file should be used
> >    by the -auth option, e.g.:
> >        x11vnc -auth /home/someuser/.Xauthority -display :0
> >        x11vnc -auth /tmp/.gdmzndVlR -display :0
> >    you must have read permission for the auth file.
> >    See also '-auth guess' and '-findauth' discussed below.
> >
> > ** If NO ONE is logged into an X session yet, but there is a greeter
> login
> >    program like "gdm", "kdm", "xdm", or "dtlogin" running, you will need
> >    to find and use the raw display manager MIT-MAGIC-COOKIE file.
> >    Some examples for various display managers:
> >
> >      gdm:     -auth /var/gdm/:0.Xauth
> >               -auth /var/lib/gdm/:0.Xauth
> >      kdm:     -auth /var/lib/kdm/A:0-crWk72
> >               -auth /var/run/xauth/A:0-crWk72
> >      xdm:     -auth /var/lib/xdm/authdir/authfiles/A:0-XQvaJk
> >      dtlogin: -auth /var/dt/A:0-UgaaXa
> >
> >    Sometimes the command "ps wwwwaux | grep auth" can reveal the file
> location.
> >
> >    Starting with x11vnc 0.9.9 you can have it try to guess by using:
> >
> >               -auth guess
> >
> >    (see also the x11vnc -findauth option.)
> >
> >    Only root will have read permission for the file, and so x11vnc must
> be run
> >    as root (or copy it).  The random characters in the filenames will of
> course
> >    change and the directory the cookie file resides in is system
> dependent.
> >
> > See also: http://www.karlrunge.com/x11vnc/faq.html
> >
> > Regards,
> > Vipul Kumar
> >
> > On Thu, Nov 3, 2022 at 10:27 PM Vipul Suneja <vsuneja63@gmail.com>
> wrote:
> >       Hi Stefano,
> > Thanks!
> >
> > I used xen-guest-image-minimal(simple console based image) as a guest
> with fbcon & fbdev enabled in kernel configurations but still
> > the same error can't open the display.
> > below are the outcome of "xenstore-ls":
> >
> > root@raspberrypi4-64:~/guest1# xenstore-ls
> > tool = ""
> >  xenstored = ""
> > local = ""
> >  domain = ""
> >   0 = ""
> >    control = ""
> >     feature-poweroff = "1"
> >     feature-reboot = "1"
> >    domid = "0"
> >    name = "Domain-0"
> >    device-model = ""
> >     0 = ""
> >      backends = ""
> >       console = ""
> >       vkbd = ""
> >       vfb = ""
> >       qnic = ""
> >      state = "running"
> >     1 = ""
> >      backends = ""
> >       console = ""
> >       vkbd = ""
> >       vfb = ""
> >       qnic = ""
> >      state = "running"
> >    backend = ""
> >     vbd = ""
> >      1 = ""
> >       51712 = ""
> >        frontend = "/local/domain/1/device/vbd/51712"
> >        params =
> "/home/root/guest2/xen-guest-image-minimal-raspberrypi4-64.ext3"
> >        script = "/etc/xen/scripts/block"
> >        frontend-id = "1"
> >        online = "1"
> >        removable = "0"
> >        bootable = "1"
> >        state = "4"
> >        dev = "xvda"
> >        type = "phy"
> >        mode = "w"
> >        device-type = "disk"
> >        discard-enable = "1"
> >        feature-max-indirect-segments = "256"
> >        multi-queue-max-queues = "4"
> >        max-ring-page-order = "4"
> >        node = "/dev/loop0"
> >        physical-device = "7:0"
> >        physical-device-path = "/dev/loop0"
> >        hotplug-status = "connected"
> >        feature-flush-cache = "1"
> >        discard-granularity = "4096"
> >        discard-alignment = "0"
> >        discard-secure = "0"
> >        feature-discard = "1"
> >        feature-barrier = "1"
> >        feature-persistent = "1"
> >        sectors = "1794048"
> >        info = "0"
> >        sector-size = "512"
> >        physical-sector-size = "512"
> >     vfb = ""
> >      1 = ""
> >       0 = ""
> >        frontend = "/local/domain/1/device/vfb/0"
> >        frontend-id = "1"
> >        online = "1"
> >        state = "4"
> >        vnc = "1"
> >        vnclisten = "127.0.0.1"
> >        vncdisplay = "0"
> >        vncunused = "1"
> >        sdl = "0"
> >        opengl = "0"
> >        feature-resize = "1"
> >        hotplug-status = "connected"
> >        request-update = "1"
> >     vkbd = ""
> >      1 = ""
> >       0 = ""
> >        frontend = "/local/domain/1/device/vkbd/0"
> >        frontend-id = "1"
> >        online = "1"
> >        state = "4"
> >        feature-abs-pointer = "1"
> >        feature-raw-pointer = "1"
> >        hotplug-status = "connected"
> >     console = ""
> >      1 = ""
> >       0 = ""
> >        frontend = "/local/domain/1/console"
> >        frontend-id = "1"
> >        online = "1"
> >        state = "1"
> >        protocol = "vt100"
> >     vif = ""
> >      1 = ""
> >       0 = ""
> >        frontend = "/local/domain/1/device/vif/0"
> >        frontend-id = "1"
> >        online = "1"
> >        state = "4"
> >        script = "/etc/xen/scripts/vif-bridge"
> >        mac = "e4:5f:01:cd:7b:dd"
> >        bridge = "xenbr0"
> >        handle = "0"
> >        type = "vif"
> >        hotplug-status = "connected"
> >        feature-sg = "1"
> >        feature-gso-tcpv4 = "1"
> >        feature-gso-tcpv6 = "1"
> >        feature-ipv6-csum-offload = "1"
> >        feature-rx-copy = "1"
> >        feature-xdp-headroom = "1"
> >        feature-rx-flip = "0"
> >        feature-multicast-control = "1"
> >        feature-dynamic-multicast-control = "1"
> >        feature-split-event-channels = "1"
> >        multi-queue-max-queues = "4"
> >        feature-ctrl-ring = "1"
> >   1 = ""
> >    vm = "/vm/d81ec5a9-5bf9-4f2b-89e8-0f60d6da948f"
> >    name = "guest2"
> >    cpu = ""
> >     0 = ""
> >      availability = "online"
> >     1 = ""
> >      availability = "online"
> >    memory = ""
> >     static-max = "2097152"
> >     target = "2097152"
> >     videoram = "0"
> >    device = ""
> >     suspend = ""
> >      event-channel = ""
> >     vbd = ""
> >      51712 = ""
> >       backend = "/local/domain/0/backend/vbd/1/51712"
> >       backend-id = "0"
> >       state = "4"
> >       virtual-device = "51712"
> >       device-type = "disk"
> >       multi-queue-num-queues = "2"
> >       queue-0 = ""
> >        ring-ref = "8"
> >        event-channel = "4"
> >       queue-1 = ""
> >        ring-ref = "9"
> >        event-channel = "5"
> >       protocol = "arm-abi"
> >       feature-persistent = "1"
> >     vfb = ""
> >      0 = ""
> >       backend = "/local/domain/0/backend/vfb/1/0"
> >       backend-id = "0"
> >       state = "4"
> >       page-ref = "275022"
> >       event-channel = "3"
> >       protocol = "arm-abi"
> >       feature-update = "1"
> >     vkbd = ""
> >      0 = ""
> >       backend = "/local/domain/0/backend/vkbd/1/0"
> >       backend-id = "0"
> >       state = "4"
> >       request-abs-pointer = "1"
> >       page-ref = "275322"
> >       page-gref = "1284"
> >       event-channel = "10"
> >     vif = ""
> >      0 = ""
> >       backend = "/local/domain/0/backend/vif/1/0"
> >       backend-id = "0"
> >       state = "4"
> >       handle = "0"
> >       mac = "e4:5f:01:cd:7b:dd"
> >       mtu = "1500"
> >       xdp-headroom = "0"
> >       multi-queue-num-queues = "2"
> >       queue-0 = ""
> >        tx-ring-ref = "1280"
> >        rx-ring-ref = "1281"
> >        event-channel-tx = "6"
> >        event-channel-rx = "7"
> >       queue-1 = ""
> >        tx-ring-ref = "1282"
> >        rx-ring-ref = "1283"
> >        event-channel-tx = "8"
> >        event-channel-rx = "9"
> >       request-rx-copy = "1"
> >       feature-rx-notify = "1"
> >       feature-sg = "1"
> >       feature-gso-tcpv4 = "1"
> >       feature-gso-tcpv6 = "1"
> >       feature-ipv6-csum-offload = "1"
> >    control = ""
> >     shutdown = ""
> >     feature-poweroff = "1"
> >     feature-reboot = "1"
> >     feature-suspend = ""
> >     sysrq = ""
> >     platform-feature-multiprocessor-suspend = "1"
> >     platform-feature-xs_reset_watches = "1"
> >    data = ""
> >    drivers = ""
> >    feature = ""
> >    attr = ""
> >    error = ""
> >    domid = "1"
> >    store = ""
> >     port = "1"
> >     ring-ref = "233473"
> >    console = ""
> >     backend = "/local/domain/0/backend/console/1/0"
> >     backend-id = "0"
> >     limit = "1048576"
> >     type = "xenconsoled"
> >     output = "pty"
> >     tty = "/dev/pts/1"
> >     port = "2"
> >     ring-ref = "233472"
> >     vnc-listen = "127.0.0.1"
> >     vnc-port = "5900"
> >    image = ""
> >     device-model-pid = "788"
> > vm = ""
> >  d81ec5a9-5bf9-4f2b-89e8-0f60d6da948f = ""
> >   name = "guest2"
> >   uuid = "d81ec5a9-5bf9-4f2b-89e8-0f60d6da948f"
> >   start_time = "1520600274.27"
> > libxl = ""
> >  1 = ""
> >   device = ""
> >    vbd = ""
> >     51712 = ""
> >      frontend = "/local/domain/1/device/vbd/51712"
> >      backend = "/local/domain/0/backend/vbd/1/51712"
> >      params =
> "/home/root/guest2/xen-guest-image-minimal-raspberrypi4-64.ext3"
> >      script = "/etc/xen/scripts/block"
> >      frontend-id = "1"
> >      online = "1"
> >      removable = "0"
> >      bootable = "1"
> >      state = "1"
> >      dev = "xvda"
> >      type = "phy"
> >      mode = "w"
> >      device-type = "disk"
> >      discard-enable = "1"
> >    vfb = ""
> >     0 = ""
> >      frontend = "/local/domain/1/device/vfb/0"
> >      backend = "/local/domain/0/backend/vfb/1/0"
> >      frontend-id = "1"
> >      online = "1"
> >      state = "1"
> >      vnc = "1"
> >      vnclisten = "127.0.0.1"
> >      vncdisplay = "0"
> >      vncunused = "1"
> >      sdl = "0"
> >      opengl = "0"
> >    vkbd = ""
> >     0 = ""
> >      frontend = "/local/domain/1/device/vkbd/0"
> >      backend = "/local/domain/0/backend/vkbd/1/0"
> >      frontend-id = "1"
> >      online = "1"
> >      state = "1"
> >    console = ""
> >     0 = ""
> >      frontend = "/local/domain/1/console"
> >      backend = "/local/domain/0/backend/console/1/0"
> >      frontend-id = "1"
> >      online = "1"
> >      state = "1"
> >      protocol = "vt100"
> >    vif = ""
> >     0 = ""
> >      frontend = "/local/domain/1/device/vif/0"
> >      backend = "/local/domain/0/backend/vif/1/0"
> >      frontend-id = "1"
> >      online = "1"
> >      state = "1"
> >      script = "/etc/xen/scripts/vif-bridge"
> >      mac = "e4:5f:01:cd:7b:dd"
> >      bridge = "xenbr0"
> >      handle = "0"
> >      type = "vif"
> >      hotplug-status = ""
> >   type = "pvh"
> >   dm-version = "qemu_xen"
> > root@raspberrypi4-64:~/guest1#
> >
> > Any input as per above? Looking forward to hearing from you.
> >
> > Regards,
> > Vipul Kumar
> >
> > On Wed, Oct 26, 2022 at 5:21 AM Stefano Stabellini <
> sstabellini@kernel.org> wrote:
> >       Hi Vipul,
> >
> >       If you look at the QEMU logs, it says:
> >
> >       VNC server running on 127.0.0.1:5900
> >
> >       That is the VNC server you need to connect to. So in theory:
> >
> >         vncviewer 127.0.0.1:5900
> >
> >       should work correctly.
> >
> >
> >       If you have:
> >
> >         vfb = ["type=vnc"]
> >
> >       in your xl config file and you have "fbdev" in your Linux guest, it
> >       should work.
> >
> >       If you connect to the VNC server but you get a black screen, it
> might be
> >       a guest configuration issue. I would try with a simpler guest,
> text only
> >       (no X11, no Wayland) and enable the fbdev console (fbcon). See
> >       Documentation/fb/fbcon.rst in Linux. You should be able to see a
> >       graphical console over VNC.
> >
> >       If that works, then you know that the fbdev kernel driver
> (xen-fbfront)
> >       works correctly.
> >
> >       If it doesn't work, the output of "xenstore-ls" would be
> interesting.
> >
> >       Cheers,
> >
> >       Stefano
> >
> >
> >       On Wed, 19 Oct 2022, Vipul Suneja wrote:
> >       > Hi Stefano,
> >       >
> >       > Thanks for the response!
> >       >
> >       > I am following the same link you shared from the beginning.
> Tried the command "vncviewer localhost:0" in DOM0 but same
> >       issue "Can't open
> >       > display", below are the logs:
> >       >
> >       > root@raspberrypi4-64:~# vncviewer localhost:0
> >       >
> >       > TigerVNC Viewer 64-bit v1.11.0
> >       > Built on: 2020-09-08 12:16
> >       > Copyright (C) 1999-2020 TigerVNC Team and many others (see
> README.rst)
> >       > See https://www.tigervnc.org for information on TigerVNC.
> >       > Can't open display:
> >       >
> >       > Below are the netstat logs, i couldn't see anything running at
> port 5900 or 5901:
> >       >
> >       > root@raspberrypi4-64:~# netstat -tuwx
> >       > Active Internet connections (w/o servers)
> >       > Proto Recv-Q Send-Q Local Address           Foreign Address
>     State
> >       > tcp        0    164 192.168.1.39:ssh        192.168.1.38:37472
>      ESTABLISHED
> >       > Active UNIX domain sockets (w/o servers)
> >       > Proto RefCnt Flags       Type       State         I-Node Path
> >       > unix  8      [ ]         DGRAM      CONNECTED      10565 /dev/log
> >       > unix  3      [ ]         STREAM     CONNECTED      10891
> /var/run/xenstored/socket
> >       > unix  3      [ ]         STREAM     CONNECTED      13791
> >       > unix  3      [ ]         STREAM     CONNECTED      10843
> /var/run/xenstored/socket
> >       > unix  3      [ ]         STREAM     CONNECTED      10573
> /var/run/xenstored/socket
> >       > unix  2      [ ]         DGRAM      CONNECTED      14510
> >       > unix  3      [ ]         STREAM     CONNECTED      13249
> >       > unix  2      [ ]         DGRAM      CONNECTED      13887
> >       > unix  2      [ ]         DGRAM      CONNECTED      10599
> >       > unix  3      [ ]         STREAM     CONNECTED      14005
> >       > unix  3      [ ]         STREAM     CONNECTED      13258
> >       > unix  3      [ ]         STREAM     CONNECTED      13248
> >       > unix  3      [ ]         STREAM     CONNECTED      14003
> >       > unix  3      [ ]         STREAM     CONNECTED      10572
> /var/run/xenstored/socket
> >       > unix  3      [ ]         STREAM     CONNECTED      10786
> /var/run/xenstored/socket
> >       > unix  3      [ ]         DGRAM      CONNECTED      13186
> >       > unix  3      [ ]         STREAM     CONNECTED      10864
> /var/run/xenstored/socket
> >       > unix  3      [ ]         STREAM     CONNECTED      10812
> /var/run/xenstored/socket
> >       > unix  2      [ ]         DGRAM      CONNECTED      14083
> >       > unix  3      [ ]         STREAM     CONNECTED      10813
> /var/run/xenstored/socket
> >       > unix  3      [ ]         STREAM     CONNECTED      14068
> >       > unix  3      [ ]         STREAM     CONNECTED      13256
> >       > unix  3      [ ]         STREAM     CONNECTED      10571
> /var/run/xenstored/socket
> >       > unix  3      [ ]         STREAM     CONNECTED      10842
> >       > unix  3      [ ]         STREAM     CONNECTED      13985
> >       > unix  3      [ ]         DGRAM      CONNECTED      13185
> >       > unix  2      [ ]         STREAM     CONNECTED      13884
> >       > unix  2      [ ]         DGRAM      CONNECTED      14528
> >       > unix  2      [ ]         DGRAM      CONNECTED      13785
> >       > unix  3      [ ]         STREAM     CONNECTED      14034
> >       >
> >       > Attaching xen log files of /var/log/xen.
> >       > I didn't get the role of QEMU here because as mentioned earlier,
> I am porting in raspberrypi 4B.
> >       >
> >       > Regards,
> >       > Vipul Kumar
> >       >
> >       > On Wed, Oct 19, 2022 at 12:43 AM Stefano Stabellini <
> sstabellini@kernel.org> wrote:
> >       >       It usually works the way it is described in the guide:
> >       >
> >       >
> >
> https://www.virtuatopia.com/index.php?title=Configuring_a_VNC_based_Graphical_Console_for_a_Xen_Paravirtualized_domainU_Guest
> >       >
> >       >       You don't need to install any VNC-related server software
> because it is
> >       >       already provided by Xen (to be precise it is provided by
> QEMU working
> >       >       together with Xen.)
> >       >
> >       >       You only need the vnc client in dom0 so that you can
> connect, but you
> >       >       could also run the vnc client outside from another host.
> So basically
> >       >       the following should work when executed in Dom0 after
> creating DomU:
> >       >
> >       >         vncviewer localhost:0
> >       >
> >       >       Can you attach the Xen and QEMU logs (/var/log/xen/*)? And
> also use
> >       >       netstat -taunp to check if there is anything running at
> port 5900 or
> >       >       5901?
> >       >
> >       >       Cheers,
> >       >
> >       >       Stefano
> >       >
> >       >
> >       >       On Tue, 18 Oct 2022, Vipul Suneja wrote:
> >       >       > Hi Stefano,
> >       >       >
> >       >       > Thanks for the response!
> >       >       >
> >       >       > I could install tigerVNC, x11vnc & libvncserver in Dom0
> xen-image-minimal but only manage to install
> >       libvncserver(couldn't
> >       >       install tigervnc
> >       >       > & x11vnc because of x11
> >       >       > support missing, it's wayland) in DOMU custom graphical
> image. I tried running vncviewer with IP address & port
> >       in dom0 to
> >       >       access the domu
> >       >       > graphical image display as per below commands.
> >       >       >
> >       >       >  vncviewer 192.168.1.42:5901
> >       >       >
> >       >       >  But it showing can't open display, below are the logs:
> >       >       >
> >       >       > root@raspberrypi4-64:~/guest1# vncviewer
> 192.168.1.42:5901
> >       >       >
> >       >       > TigerVNC Viewer 64-bit v1.11.0
> >       >       > Built on: 2020-09-08 12:16
> >       >       > Copyright (C) 1999-2020 TigerVNC Team and many others
> (see README.rst)
> >       >       > See https://www.tigervnc.org for information on
> TigerVNC.
> >       >       > Can't open display:
> >       >       > root@raspberrypi4-64:~/guest1#
> >       >       >
> >       >       > I am not exactly sure what the issue is but I thought
> only libvncserver in DOMU could work to get access but it
> >       did not
> >       >       work.
> >       >       > If TigerVNC is the issue here then is there any other
> VNC source which could be installed for both x11 &
> >       wayland supported
> >       >       images?
> >       >       >
> >       >       > Regards,
> >       >       > Vipul Kumar
> >       >       >
> >       >       > On Tue, Oct 18, 2022 at 2:40 AM Stefano Stabellini <
> sstabellini@kernel.org> wrote:
> >       >       >       VNC is typically easier to setup, because SDL
> needs extra libraries at
> >       >       >       build time and runtime. If QEMU is built without
> SDL support it won't
> >       >       >       start when you ask for SDL.
> >       >       >
> >       >       >       VNC should work with both x11 and wayland in your
> domU. It doesn't work
> >       >       >       at the x11 level, it exposes a special fbdev
> device in your domU that
> >       >       >       should work with:
> >       >       >       - a graphical console in Linux domU
> >       >       >       - x11
> >       >       >       - wayland (but I haven't tested this so I am not
> 100% sure about it)
> >       >       >
> >       >       >       When you say "it doesn't work", what do you mean?
> Do you get a black
> >       >       >       window?
> >       >       >
> >       >       >       You need CONFIG_XEN_FBDEV_FRONTEND in Linux domU
> >       >       >       (drivers/video/fbdev/xen-fbfront.c). I would try
> to get a graphical text
> >       >       >       console up and running in your domU before
> attempting x11/wayland.
> >       >       >
> >       >       >       Cheers,
> >       >       >
> >       >       >       Stefano
> >       >       >
> >       >       >       On Mon, 17 Oct 2022, Vipul Suneja wrote:
> >       >       >       > Hi,
> >       >       >       > Thanks!
> >       >       >       >
> >       >       >       > I have ported xen minimal image as DOM0 & custom
> wayland GUI based image as DOMU in raspberry pi4B. I
> >       am trying to
> >       >       make GUI
> >       >       >       display up
> >       >       >       > for guest machine. I tried using sdl, included
> below line in guest.conf file
> >       >       >       > vfb= [ 'sdl=1' ]
> >       >       >       >
> >       >       >       > But it is throwing below error:
> >       >       >       >
> >       >       >       > root@raspberrypi4-64:~/guest1# xl create -c
> guest1.cfg
> >       >       >       > Parsing config from guest1.cfg
> >       >       >       > libxl: error:
> libxl_qmp.c:1400:qmp_ev_fd_callback: Domain 3:error on QMP socket:
> Connection reset by
> >       peer
> >       >       >       > libxl: error:
> libxl_qmp.c:1439:qmp_ev_fd_callback: Domain 3:Error happened with the QMP
> connection to
> >       QEMU
> >       >       >       > libxl: error:
> libxl_dm.c:3351:device_model_postconfig_done: Domain 3:Post DM startup
> configs failed,
> >       rc=-26
> >       >       >       > libxl: error:
> libxl_create.c:1867:domcreate_devmodel_started: Domain 3:device model did
> not start: -26
> >       >       >       > libxl: error:
> libxl_aoutils.c:646:libxl__kill_xs_path: Device Model already exited
> >       >       >       > libxl: error:
> libxl_domain.c:1183:libxl__destroy_domid: Domain 3:Non-existant domain
> >       >       >       > libxl: error:
> libxl_domain.c:1137:domain_destroy_callback: Domain 3:Unable to destroy
> guest
> >       >       >       > libxl: error:
> libxl_domain.c:1064:domain_destroy_cb: Domain 3:Destruction of domain failed
> >       >       >       >
> >       >       >       > Another way is VNC, i could install tigervnc in
> DOM0 but same i couldn't in guest machine because it
> >       doesn't support
> >       >       >       x11(supports wayland
> >       >       >       > only). I am completely blocked here, Need your
> support to enable the display up.
> >       >       >       > Any alternative of VNC which could work in both
> x11 & wayland supported images?
> >       >       >       >
> >       >       >       > Any input on VNC, SDL or any other way to
> proceed on this? Looking forward to hearing from you.
> >       >       >       >
> >       >       >       > Regards,
> >       >       >       > Vipul Kumar
> >       >       >
> >       >       >
> >       >       >
> >       >
> >       >
> >       >
> >
> >
> >

--00000000000054191d05edff84e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Stefano,<div><br></div><div>Thanks for the=C2=A0support=
!</div><div><br></div><div>Looks like I have tried all the combinations=C2=
=A0&amp; possible ways to get display up but failed. Is there any document =
or pdf for porting xen on raspberrypi4.</div><div>I could find lot&#39;s of=
 links telling the same but couldn&#39;t see any official user guide or doc=
ument from the xen community on the same. If there is something to refer=C2=
=A0</div><div>to please share with me.</div><div>I am attaching the kernel =
configuration file also, just take a look if i have missed anything.</div><=
div>Any other suggestions or input from your end could be really helpful?</=
div><div><br></div><div>Regards,</div><div>Vipul Kumar</div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 11,=
 2022 at 6:40 AM Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kerne=
l.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Hi Vipul,<br>
<br>
Sorry for the late reply. From the earlier logs that you sent, it looks<br>
like everything should be working correctly. Specifically:<br>
<br>
=C2=A0=C2=A0 =C2=A0 vfb =3D &quot;&quot;<br>
=C2=A0=C2=A0 =C2=A0 =C2=A01 =3D &quot;&quot;<br>
=C2=A0=C2=A0 =C2=A0 =C2=A0 0 =3D &quot;&quot;<br>
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0frontend =3D &quot;/local/domain/1/device/=
vfb/0&quot;<br>
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0frontend-id =3D &quot;1&quot;<br>
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0online =3D &quot;1&quot;<br>
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0state =3D &quot;4&quot;<br>
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0vnc =3D &quot;1&quot;<br>
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0vnclisten =3D &quot;127.0.0.1&quot;<br>
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0vncdisplay =3D &quot;0&quot;<br>
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0vncunused =3D &quot;1&quot;<br>
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0sdl =3D &quot;0&quot;<br>
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0opengl =3D &quot;0&quot;<br>
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0feature-resize =3D &quot;1&quot;<br>
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0hotplug-status =3D &quot;connected&quot;<b=
r>
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0request-update =3D &quot;1&quot;<br>
<br>
state &quot;4&quot; means &quot;connected&quot;. So I would expect that you=
 should be able<br>
to connect to the vnc server using vncviewer. You might not see anything<br=
>
(black screen) but you should definitely be able to connect.<br>
<br>
I wouldn&#39;t try to launch x11 in the guest just yet. fbcon in Linux is<b=
r>
enough to render something on the screen. You should be able to see the<br>
Linux text-based console rendered graphically, connecting to it via vnc.<br=
>
<br>
Sorry for the basic question, but have you tried all the following?<br>
<br>
vncviewer <a href=3D"http://127.0.0.1:0" rel=3D"noreferrer" target=3D"_blan=
k">127.0.0.1:0</a><br>
vncviewer <a href=3D"http://127.0.0.1:1" rel=3D"noreferrer" target=3D"_blan=
k">127.0.0.1:1</a><br>
vncviewer <a href=3D"http://127.0.0.1:2" rel=3D"noreferrer" target=3D"_blan=
k">127.0.0.1:2</a><br>
vncviewer <a href=3D"http://127.0.0.1:5900" rel=3D"noreferrer" target=3D"_b=
lank">127.0.0.1:5900</a><br>
vncviewer <a href=3D"http://127.0.0.1:5901" rel=3D"noreferrer" target=3D"_b=
lank">127.0.0.1:5901</a><br>
vncviewer <a href=3D"http://127.0.0.1:5902" rel=3D"noreferrer" target=3D"_b=
lank">127.0.0.1:5902</a><br>
<br>
Given that from the xenstore-ls logs everything seems to work correctly<br>
I am not sure what else to suggest. You might have to add printf to QEMU<br=
>
ui/vnc.c and hw/display/xenfb.c to see what is going wrong.<br>
<br>
Cheers,<br>
<br>
Stefano<br>
<br>
<br>
On Mon, 7 Nov 2022, Vipul Suneja wrote:<br>
&gt; Hi Stefano,<br>
&gt; Thanks!<br>
&gt; <br>
&gt; Any input further on &quot;xenstore-ls&quot; logs?<br>
&gt; <br>
&gt; I am trying to run the x0vncserver &amp; x11vnc server manually on gue=
st machine(xen_guest_image_minimal) image but it&#39;s failing with the bel=
ow<br>
&gt; error.<br>
&gt; <br>
&gt; root@raspberrypi4-64:/usr/bin# x0vncserver<br>
&gt; x0vncserver: unable to open display &quot;&quot;<br>
&gt; root@raspberrypi4-64:/usr/bin#<br>
&gt; root@raspberrypi4-64:/usr/bin# x11vnc<br>
&gt; ###############################################################<br>
&gt; #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#<br>
&gt; #@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>
&gt; #@ =C2=A0** =C2=A0WARNING =C2=A0** =C2=A0WARNING =C2=A0** =C2=A0WARNIN=
G =C2=A0** =C2=A0WARNING =C2=A0** =C2=A0 @#<br>
&gt; #@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>
&gt; #@ =C2=A0 =C2=A0 =C2=A0 =C2=A0YOU ARE RUNNING X11VNC WITHOUT A PASSWOR=
D!! =C2=A0 =C2=A0 =C2=A0 =C2=A0@#<br>
&gt; #@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>
&gt; #@ =C2=A0This means anyone with network access to this computer =C2=A0=
 @#<br>
&gt; #@ =C2=A0may be able to view and control your desktop. =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0@#<br>
&gt; #@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>
&gt; #@ &gt;&gt;&gt; If you did not mean to do this Press CTRL-C now!! &lt;=
&lt;&lt; @#<br>
&gt; #@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>
&gt; #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#<br>
&gt; #@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>
&gt; #@ =C2=A0You can create an x11vnc password file by running: =C2=A0 =C2=
=A0 =C2=A0 @#<br>
&gt; #@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>
&gt; #@ =C2=A0 =C2=A0 =C2=A0 x11vnc -storepasswd password /path/to/passfile=
 =C2=A0 =C2=A0 =C2=A0@#<br>
&gt; #@ =C2=A0or =C2=A0 x11vnc -storepasswd /path/to/passfile =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>
&gt; #@ =C2=A0or =C2=A0 x11vnc -storepasswd =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 @#<br>
&gt; #@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>
&gt; #@ =C2=A0(the last one will use ~/.vnc/passwd) =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@#<br>
&gt; #@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>
&gt; #@ =C2=A0and then starting x11vnc via: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@#<br>
&gt; #@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>
&gt; #@ =C2=A0 =C2=A0 =C2=A0x11vnc -rfbauth /path/to/passfile =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@#<br>
&gt; #@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>
&gt; #@ =C2=A0an existing ~/.vnc/passwd file from another VNC =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0@#<br>
&gt; #@ =C2=A0application will work fine too. =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@#<br>
&gt; #@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>
&gt; #@ =C2=A0You can also use the -passwdfile or -passwd options. =C2=A0 =
=C2=A0 @#<br>
&gt; #@ =C2=A0(note -passwd is unsafe if local users are not trusted) =C2=
=A0@#<br>
&gt; #@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>
&gt; #@ =C2=A0Make sure any -rfbauth and -passwdfile password files =C2=A0 =
=C2=A0@#<br>
&gt; #@ =C2=A0cannot be read by untrusted users. =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>
&gt; #@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>
&gt; #@ =C2=A0Use x11vnc -usepw to automatically use your =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@#<br>
&gt; #@ =C2=A0~/.vnc/passwd or ~/.vnc/passwdfile password files. =C2=A0 =C2=
=A0 =C2=A0 @#<br>
&gt; #@ =C2=A0(and prompt you to create ~/.vnc/passwd if neither =C2=A0 =C2=
=A0 =C2=A0 @#<br>
&gt; #@ =C2=A0file exists.) =C2=A0Under -usepw, x11vnc will exit if it =C2=
=A0 =C2=A0 =C2=A0@#<br>
&gt; #@ =C2=A0cannot find a password to use. =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>
&gt; #@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>
&gt; #@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>
&gt; #@ =C2=A0Even with a password, the subsequent VNC traffic is =C2=A0 =
=C2=A0 =C2=A0@#<br>
&gt; #@ =C2=A0sent in the clear.=C2=A0 Consider tunnelling via ssh(1): =C2=
=A0 =C2=A0 =C2=A0@#<br>
&gt; #@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>
&gt; #@ =C2=A0 =C2=A0<a href=3D"http://www.karlrunge.com/x11vnc/#tunnelling=
" rel=3D"noreferrer" target=3D"_blank">http://www.karlrunge.com/x11vnc/#tun=
nelling</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@#<br>
&gt; #@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>
&gt; #@ =C2=A0Or using the x11vnc SSL options: -ssl and -stunnel =C2=A0 =C2=
=A0 =C2=A0 @#<br>
&gt; #@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>
&gt; #@ =C2=A0Please Read the documentation for more info about =C2=A0 =C2=
=A0 =C2=A0 =C2=A0@#<br>
&gt; #@ =C2=A0passwords, security, and encryption. =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>
&gt; #@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>
&gt; #@ =C2=A0 =C2=A0<a href=3D"http://www.karlrunge.com/x11vnc/faq.html#fa=
q-passwd" rel=3D"noreferrer" target=3D"_blank">http://www.karlrunge.com/x11=
vnc/faq.html#faq-passwd</a> =C2=A0 =C2=A0@#<br>
&gt; #@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>
&gt; #@ =C2=A0To disable this warning use the -nopw option, or put =C2=A0 =
=C2=A0 @#<br>
&gt; #@ =C2=A0&#39;nopw&#39; on a line in your ~/.x11vncrc file. =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>
&gt; #@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>
&gt; #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#<br>
&gt; ###############################################################<br>
&gt; 09/03/2018 12:58:41 x11vnc version: 0.9.16 lastmod: 2019-01-05 =C2=A0p=
id: 424<br>
&gt; 09/03/2018 12:58:41 XOpenDisplay(&quot;&quot;) failed.<br>
&gt; 09/03/2018 12:58:41 Trying again with XAUTHLOCALHOSTNAME=3Dlocalhost .=
..<br>
&gt; 09/03/2018 12:58:41<br>
&gt; 09/03/2018 12:58:41 *** XOpenDisplay failed. No -display or DISPLAY.<b=
r>
&gt; 09/03/2018 12:58:41 *** Trying &quot;:0&quot; in 4 seconds.=C2=A0 Pres=
s Ctrl-C to abort.<br>
&gt; 09/03/2018 12:58:41 *** 1 2 3 4<br>
&gt; 09/03/2018 12:58:45 XOpenDisplay(&quot;:0&quot;) failed.<br>
&gt; 09/03/2018 12:58:45 Trying again with XAUTHLOCALHOSTNAME=3Dlocalhost .=
..<br>
&gt; 09/03/2018 12:58:45 XOpenDisplay(&quot;:0&quot;) failed.<br>
&gt; 09/03/2018 12:58:45 Trying again with unset XAUTHLOCALHOSTNAME ...<br>
&gt; 09/03/2018 12:58:45<br>
&gt; <br>
&gt; 09/03/2018 12:58:45 ***************************************<br>
&gt; 09/03/2018 12:58:45 *** XOpenDisplay failed (:0)<br>
&gt; <br>
&gt; *** x11vnc was unable to open the X DISPLAY: &quot;:0&quot;, it cannot=
 continue.<br>
&gt; *** There may be &quot;Xlib:&quot; error messages above with details a=
bout the failure.<br>
&gt; <br>
&gt; Some tips and guidelines:<br>
&gt; <br>
&gt; ** An X server (the one you wish to view) must be running before x11vn=
c is<br>
&gt; =C2=A0 =C2=A0started: x11vnc does not start the X server. =C2=A0(howev=
er, see the -create<br>
&gt; =C2=A0 =C2=A0option if that is what you really want).<br>
&gt; <br>
&gt; ** You must use -display &lt;disp&gt;, -OR- set and export your $DISPL=
AY<br>
&gt; =C2=A0 =C2=A0environment variable to refer to the display of the desir=
ed X server.<br>
&gt; =C2=A0- Usually the display is simply &quot;:0&quot; (in fact x11vnc u=
ses this if you forget<br>
&gt; =C2=A0 =C2=A0to specify it), but in some multi-user situations it coul=
d be &quot;:1&quot;, &quot;:2&quot;,<br>
&gt; =C2=A0 =C2=A0or even &quot;:137&quot;.=C2=A0 Ask your administrator or=
 a guru if you are having<br>
&gt; =C2=A0 =C2=A0difficulty determining what your X DISPLAY is.<br>
&gt; <br>
&gt; ** Next, you need to have sufficient permissions (Xauthority)<br>
&gt; =C2=A0 =C2=A0to connect to the X DISPLAY. =C2=A0 Here are some Tips:<b=
r>
&gt; <br>
&gt; =C2=A0- Often, you just need to run x11vnc as the user logged into the=
 X session.<br>
&gt; =C2=A0 =C2=A0So make sure to be that user when you type x11vnc.<br>
&gt; =C2=A0- Being root is usually not enough because the incorrect MIT-MAG=
IC-COOKIE<br>
&gt; =C2=A0 =C2=A0file may be accessed.=C2=A0 The cookie file contains the =
secret key that<br>
&gt; =C2=A0 =C2=A0allows x11vnc to connect to the desired X DISPLAY.<br>
&gt; =C2=A0- You can explicitly indicate which MIT-MAGIC-COOKIE file should=
 be used<br>
&gt; =C2=A0 =C2=A0by the -auth option, e.g.:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0x11vnc -auth /home/someuser/.Xauthority -di=
splay :0<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0x11vnc -auth /tmp/.gdmzndVlR -display :0<br=
>
&gt; =C2=A0 =C2=A0you must have read permission for the auth file.<br>
&gt; =C2=A0 =C2=A0See also &#39;-auth guess&#39; and &#39;-findauth&#39; di=
scussed below.<br>
&gt; <br>
&gt; ** If NO ONE is logged into an X session yet, but there is a greeter l=
ogin<br>
&gt; =C2=A0 =C2=A0program like &quot;gdm&quot;, &quot;kdm&quot;, &quot;xdm&=
quot;, or &quot;dtlogin&quot; running, you will need<br>
&gt; =C2=A0 =C2=A0to find and use the raw display manager MIT-MAGIC-COOKIE =
file.<br>
&gt; =C2=A0 =C2=A0Some examples for various display managers:<br>
&gt; <br>
&gt; =C2=A0 =C2=A0 =C2=A0gdm: =C2=A0 =C2=A0 -auth /var/gdm/:0.Xauth<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -auth /var/lib/gdm/:0=
.Xauth<br>
&gt; =C2=A0 =C2=A0 =C2=A0kdm: =C2=A0 =C2=A0 -auth /var/lib/kdm/A:0-crWk72<b=
r>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -auth /var/run/xauth/=
A:0-crWk72<br>
&gt; =C2=A0 =C2=A0 =C2=A0xdm: =C2=A0 =C2=A0 -auth /var/lib/xdm/authdir/auth=
files/A:0-XQvaJk<br>
&gt; =C2=A0 =C2=A0 =C2=A0dtlogin: -auth /var/dt/A:0-UgaaXa<br>
&gt; <br>
&gt; =C2=A0 =C2=A0Sometimes the command &quot;ps wwwwaux | grep auth&quot; =
can reveal the file location.<br>
&gt; <br>
&gt; =C2=A0 =C2=A0Starting with x11vnc 0.9.9 you can have it try to guess b=
y using:<br>
&gt; <br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -auth guess<br>
&gt; <br>
&gt; =C2=A0 =C2=A0(see also the x11vnc -findauth option.)<br>
&gt; <br>
&gt; =C2=A0 =C2=A0Only root will have read permission for the file, and so =
x11vnc must be run<br>
&gt; =C2=A0 =C2=A0as root (or copy it).=C2=A0 The random characters in the =
filenames will of course<br>
&gt; =C2=A0 =C2=A0change and the directory the cookie file resides in is sy=
stem dependent.<br>
&gt; <br>
&gt; See also: <a href=3D"http://www.karlrunge.com/x11vnc/faq.html" rel=3D"=
noreferrer" target=3D"_blank">http://www.karlrunge.com/x11vnc/faq.html</a><=
br>
&gt; <br>
&gt; Regards,<br>
&gt; Vipul Kumar<br>
&gt; <br>
&gt; On Thu, Nov 3, 2022 at 10:27 PM Vipul Suneja &lt;<a href=3D"mailto:vsu=
neja63@gmail.com" target=3D"_blank">vsuneja63@gmail.com</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Hi Stefano,<br>
&gt; Thanks!<br>
&gt; <br>
&gt; I used xen-guest-image-minimal(simple console based image) as a guest =
with fbcon &amp; fbdev enabled in kernel configurations but still<br>
&gt; the same error can&#39;t open the display.<br>
&gt; below are the outcome of &quot;xenstore-ls&quot;:<br>
&gt; <br>
&gt; root@raspberrypi4-64:~/guest1# xenstore-ls<br>
&gt; tool =3D &quot;&quot;<br>
&gt; =C2=A0xenstored =3D &quot;&quot;<br>
&gt; local =3D &quot;&quot;<br>
&gt; =C2=A0domain =3D &quot;&quot;<br>
&gt; =C2=A0 0 =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0control =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 feature-poweroff =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 feature-reboot =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0domid =3D &quot;0&quot;<br>
&gt; =C2=A0 =C2=A0name =3D &quot;Domain-0&quot;<br>
&gt; =C2=A0 =C2=A0device-model =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 0 =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0backends =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 console =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 vkbd =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 vfb =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 qnic =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0state =3D &quot;running&quot;<br>
&gt; =C2=A0 =C2=A0 1 =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0backends =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 console =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 vkbd =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 vfb =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 qnic =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0state =3D &quot;running&quot;<br>
&gt; =C2=A0 =C2=A0backend =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 vbd =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A01 =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 51712 =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0frontend =3D &quot;/local/domain/1/device/v=
bd/51712&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0params =3D &quot;/home/root/guest2/xen-gues=
t-image-minimal-raspberrypi4-64.ext3&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0script =3D &quot;/etc/xen/scripts/block&quo=
t;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0frontend-id =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0online =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0removable =3D &quot;0&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0bootable =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0state =3D &quot;4&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0dev =3D &quot;xvda&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0type =3D &quot;phy&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0mode =3D &quot;w&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0device-type =3D &quot;disk&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0discard-enable =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0feature-max-indirect-segments =3D &quot;256=
&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0multi-queue-max-queues =3D &quot;4&quot;<br=
>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0max-ring-page-order =3D &quot;4&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0node =3D &quot;/dev/loop0&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0physical-device =3D &quot;7:0&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0physical-device-path =3D &quot;/dev/loop0&q=
uot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0hotplug-status =3D &quot;connected&quot;<br=
>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0feature-flush-cache =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0discard-granularity =3D &quot;4096&quot;<br=
>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0discard-alignment =3D &quot;0&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0discard-secure =3D &quot;0&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0feature-discard =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0feature-barrier =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0feature-persistent =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0sectors =3D &quot;1794048&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0info =3D &quot;0&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0sector-size =3D &quot;512&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0physical-sector-size =3D &quot;512&quot;<br=
>
&gt; =C2=A0 =C2=A0 vfb =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A01 =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 0 =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0frontend =3D &quot;/local/domain/1/device/v=
fb/0&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0frontend-id =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0online =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0state =3D &quot;4&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0vnc =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0vnclisten =3D &quot;127.0.0.1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0vncdisplay =3D &quot;0&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0vncunused =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0sdl =3D &quot;0&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0opengl =3D &quot;0&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0feature-resize =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0hotplug-status =3D &quot;connected&quot;<br=
>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0request-update =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 vkbd =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A01 =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 0 =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0frontend =3D &quot;/local/domain/1/device/v=
kbd/0&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0frontend-id =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0online =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0state =3D &quot;4&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0feature-abs-pointer =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0feature-raw-pointer =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0hotplug-status =3D &quot;connected&quot;<br=
>
&gt; =C2=A0 =C2=A0 console =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A01 =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 0 =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0frontend =3D &quot;/local/domain/1/console&=
quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0frontend-id =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0online =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0state =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0protocol =3D &quot;vt100&quot;<br>
&gt; =C2=A0 =C2=A0 vif =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A01 =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 0 =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0frontend =3D &quot;/local/domain/1/device/v=
if/0&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0frontend-id =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0online =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0state =3D &quot;4&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0script =3D &quot;/etc/xen/scripts/vif-bridg=
e&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0mac =3D &quot;e4:5f:01:cd:7b:dd&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0bridge =3D &quot;xenbr0&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0handle =3D &quot;0&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0type =3D &quot;vif&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0hotplug-status =3D &quot;connected&quot;<br=
>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0feature-sg =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0feature-gso-tcpv4 =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0feature-gso-tcpv6 =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0feature-ipv6-csum-offload =3D &quot;1&quot;=
<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0feature-rx-copy =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0feature-xdp-headroom =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0feature-rx-flip =3D &quot;0&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0feature-multicast-control =3D &quot;1&quot;=
<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0feature-dynamic-multicast-control =3D &quot=
;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0feature-split-event-channels =3D &quot;1&qu=
ot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0multi-queue-max-queues =3D &quot;4&quot;<br=
>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0feature-ctrl-ring =3D &quot;1&quot;<br>
&gt; =C2=A0 1 =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0vm =3D &quot;/vm/d81ec5a9-5bf9-4f2b-89e8-0f60d6da948f&quo=
t;<br>
&gt; =C2=A0 =C2=A0name =3D &quot;guest2&quot;<br>
&gt; =C2=A0 =C2=A0cpu =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 0 =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0availability =3D &quot;online&quot;<br>
&gt; =C2=A0 =C2=A0 1 =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0availability =3D &quot;online&quot;<br>
&gt; =C2=A0 =C2=A0memory =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 static-max =3D &quot;2097152&quot;<br>
&gt; =C2=A0 =C2=A0 target =3D &quot;2097152&quot;<br>
&gt; =C2=A0 =C2=A0 videoram =3D &quot;0&quot;<br>
&gt; =C2=A0 =C2=A0device =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 suspend =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0event-channel =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 vbd =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A051712 =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 backend =3D &quot;/local/domain/0/backend/vbd/1/5=
1712&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 backend-id =3D &quot;0&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 state =3D &quot;4&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 virtual-device =3D &quot;51712&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 device-type =3D &quot;disk&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 multi-queue-num-queues =3D &quot;2&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 queue-0 =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0ring-ref =3D &quot;8&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0event-channel =3D &quot;4&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 queue-1 =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0ring-ref =3D &quot;9&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0event-channel =3D &quot;5&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 protocol =3D &quot;arm-abi&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 feature-persistent =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 vfb =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A00 =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 backend =3D &quot;/local/domain/0/backend/vfb/1/0=
&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 backend-id =3D &quot;0&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 state =3D &quot;4&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 page-ref =3D &quot;275022&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 event-channel =3D &quot;3&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 protocol =3D &quot;arm-abi&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 feature-update =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 vkbd =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A00 =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 backend =3D &quot;/local/domain/0/backend/vkbd/1/=
0&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 backend-id =3D &quot;0&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 state =3D &quot;4&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 request-abs-pointer =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 page-ref =3D &quot;275322&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 page-gref =3D &quot;1284&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 event-channel =3D &quot;10&quot;<br>
&gt; =C2=A0 =C2=A0 vif =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A00 =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 backend =3D &quot;/local/domain/0/backend/vif/1/0=
&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 backend-id =3D &quot;0&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 state =3D &quot;4&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 handle =3D &quot;0&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 mac =3D &quot;e4:5f:01:cd:7b:dd&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 mtu =3D &quot;1500&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 xdp-headroom =3D &quot;0&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 multi-queue-num-queues =3D &quot;2&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 queue-0 =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0tx-ring-ref =3D &quot;1280&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0rx-ring-ref =3D &quot;1281&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0event-channel-tx =3D &quot;6&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0event-channel-rx =3D &quot;7&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 queue-1 =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0tx-ring-ref =3D &quot;1282&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0rx-ring-ref =3D &quot;1283&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0event-channel-tx =3D &quot;8&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0event-channel-rx =3D &quot;9&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 request-rx-copy =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 feature-rx-notify =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 feature-sg =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 feature-gso-tcpv4 =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 feature-gso-tcpv6 =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 feature-ipv6-csum-offload =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0control =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 shutdown =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 feature-poweroff =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 feature-reboot =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 feature-suspend =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 sysrq =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 platform-feature-multiprocessor-suspend =3D &quot;1&quot=
;<br>
&gt; =C2=A0 =C2=A0 platform-feature-xs_reset_watches =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0data =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0drivers =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0feature =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0attr =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0error =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0domid =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0store =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 port =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 ring-ref =3D &quot;233473&quot;<br>
&gt; =C2=A0 =C2=A0console =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 backend =3D &quot;/local/domain/0/backend/console/1/0&qu=
ot;<br>
&gt; =C2=A0 =C2=A0 backend-id =3D &quot;0&quot;<br>
&gt; =C2=A0 =C2=A0 limit =3D &quot;1048576&quot;<br>
&gt; =C2=A0 =C2=A0 type =3D &quot;xenconsoled&quot;<br>
&gt; =C2=A0 =C2=A0 output =3D &quot;pty&quot;<br>
&gt; =C2=A0 =C2=A0 tty =3D &quot;/dev/pts/1&quot;<br>
&gt; =C2=A0 =C2=A0 port =3D &quot;2&quot;<br>
&gt; =C2=A0 =C2=A0 ring-ref =3D &quot;233472&quot;<br>
&gt; =C2=A0 =C2=A0 vnc-listen =3D &quot;127.0.0.1&quot;<br>
&gt; =C2=A0 =C2=A0 vnc-port =3D &quot;5900&quot;<br>
&gt; =C2=A0 =C2=A0image =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 device-model-pid =3D &quot;788&quot;<br>
&gt; vm =3D &quot;&quot;<br>
&gt; =C2=A0d81ec5a9-5bf9-4f2b-89e8-0f60d6da948f =3D &quot;&quot;<br>
&gt; =C2=A0 name =3D &quot;guest2&quot;<br>
&gt; =C2=A0 uuid =3D &quot;d81ec5a9-5bf9-4f2b-89e8-0f60d6da948f&quot;<br>
&gt; =C2=A0 start_time =3D &quot;1520600274.27&quot;<br>
&gt; libxl =3D &quot;&quot;<br>
&gt; =C2=A01 =3D &quot;&quot;<br>
&gt; =C2=A0 device =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0vbd =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 51712 =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0frontend =3D &quot;/local/domain/1/device/vbd/5171=
2&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0backend =3D &quot;/local/domain/0/backend/vbd/1/51=
712&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0params =3D &quot;/home/root/guest2/xen-guest-image=
-minimal-raspberrypi4-64.ext3&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0script =3D &quot;/etc/xen/scripts/block&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0frontend-id =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0online =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0removable =3D &quot;0&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0bootable =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0state =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0dev =3D &quot;xvda&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0type =3D &quot;phy&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0mode =3D &quot;w&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0device-type =3D &quot;disk&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0discard-enable =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0vfb =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 0 =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0frontend =3D &quot;/local/domain/1/device/vfb/0&qu=
ot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0backend =3D &quot;/local/domain/0/backend/vfb/1/0&=
quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0frontend-id =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0online =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0state =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0vnc =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0vnclisten =3D &quot;127.0.0.1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0vncdisplay =3D &quot;0&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0vncunused =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0sdl =3D &quot;0&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0opengl =3D &quot;0&quot;<br>
&gt; =C2=A0 =C2=A0vkbd =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 0 =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0frontend =3D &quot;/local/domain/1/device/vkbd/0&q=
uot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0backend =3D &quot;/local/domain/0/backend/vkbd/1/0=
&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0frontend-id =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0online =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0state =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0console =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 0 =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0frontend =3D &quot;/local/domain/1/console&quot;<b=
r>
&gt; =C2=A0 =C2=A0 =C2=A0backend =3D &quot;/local/domain/0/backend/console/=
1/0&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0frontend-id =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0online =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0state =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0protocol =3D &quot;vt100&quot;<br>
&gt; =C2=A0 =C2=A0vif =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 0 =3D &quot;&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0frontend =3D &quot;/local/domain/1/device/vif/0&qu=
ot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0backend =3D &quot;/local/domain/0/backend/vif/1/0&=
quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0frontend-id =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0online =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0state =3D &quot;1&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0script =3D &quot;/etc/xen/scripts/vif-bridge&quot;=
<br>
&gt; =C2=A0 =C2=A0 =C2=A0mac =3D &quot;e4:5f:01:cd:7b:dd&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0bridge =3D &quot;xenbr0&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0handle =3D &quot;0&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0type =3D &quot;vif&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0hotplug-status =3D &quot;&quot;<br>
&gt; =C2=A0 type =3D &quot;pvh&quot;<br>
&gt; =C2=A0 dm-version =3D &quot;qemu_xen&quot;<br>
&gt; root@raspberrypi4-64:~/guest1#<br>
&gt; <br>
&gt; Any input as per above? Looking forward to hearing from you.<br>
&gt; <br>
&gt; Regards,<br>
&gt; Vipul Kumar<br>
&gt; <br>
&gt; On Wed, Oct 26, 2022 at 5:21 AM Stefano Stabellini &lt;<a href=3D"mail=
to:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;=
 wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Hi Vipul,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0If you look at the QEMU logs, it says:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VNC server running on <a href=3D"http://127.=
0.0.1:5900" rel=3D"noreferrer" target=3D"_blank">127.0.0.1:5900</a><br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0That is the VNC server you need to connect t=
o. So in theory:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 vncviewer <a href=3D"http://127.0.0.1=
:5900" rel=3D"noreferrer" target=3D"_blank">127.0.0.1:5900</a><br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0should work correctly.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0If you have:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 vfb =3D [&quot;type=3Dvnc&quot;]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0in your xl config file and you have &quot;fb=
dev&quot; in your Linux guest, it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0should work.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0If you connect to the VNC server but you get=
 a black screen, it might be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0a guest configuration issue. I would try wit=
h a simpler guest, text only<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(no X11, no Wayland) and enable the fbdev co=
nsole (fbcon). See<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Documentation/fb/fbcon.rst in Linux. You sho=
uld be able to see a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0graphical console over VNC.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0If that works, then you know that the fbdev =
kernel driver (xen-fbfront)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0works correctly.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0If it doesn&#39;t work, the output of &quot;=
xenstore-ls&quot; would be interesting.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Cheers,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Stefano<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On Wed, 19 Oct 2022, Vipul Suneja wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hi Stefano,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Thanks for the response!<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I am following the same link you shared=
 from the beginning. Tried the command &quot;vncviewer localhost:0&quot; in=
 DOM0 but same<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0issue &quot;Can&#39;t open<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; display&quot;, below are the logs:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; root@raspberrypi4-64:~# vncviewer local=
host:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; TigerVNC Viewer 64-bit v1.11.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Built on: 2020-09-08 12:16<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Copyright (C) 1999-2020 TigerVNC Team a=
nd many others (see README.rst)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; See <a href=3D"https://www.tigervnc.org=
" rel=3D"noreferrer" target=3D"_blank">https://www.tigervnc.org</a> for inf=
ormation on TigerVNC.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Can&#39;t open display:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Below are the netstat logs, i couldn&#3=
9;t see anything running at port 5900 or 5901:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; root@raspberrypi4-64:~# netstat -tuwx<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Active Internet connections (w/o server=
s)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Proto Recv-Q Send-Q Local Address =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Foreign Address =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 State =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; tcp =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0=
 =C2=A0164 192.168.1.39:ssh =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://19=
2.168.1.38:37472" rel=3D"noreferrer" target=3D"_blank">192.168.1.38:37472</=
a> =C2=A0 =C2=A0 =C2=A0ESTABLISHED<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Active UNIX domain sockets (w/o servers=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Proto RefCnt Flags =C2=A0 =C2=A0 =C2=A0=
 Type =C2=A0 =C2=A0 =C2=A0 State =C2=A0 =C2=A0 =C2=A0 =C2=A0 I-Node Path<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; unix =C2=A08 =C2=A0 =C2=A0 =C2=A0[ ] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DGRAM =C2=A0 =C2=A0 =C2=A0CONNECTED =C2=A0 =C2=
=A0 =C2=A010565 /dev/log<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =
=C2=A010891 /var/run/xenstored/socket<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =
=C2=A013791<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =
=C2=A010843 /var/run/xenstored/socket<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =
=C2=A010573 /var/run/xenstored/socket<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; unix =C2=A02 =C2=A0 =C2=A0 =C2=A0[ ] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DGRAM =C2=A0 =C2=A0 =C2=A0CONNECTED =C2=A0 =C2=
=A0 =C2=A014510<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =
=C2=A013249<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; unix =C2=A02 =C2=A0 =C2=A0 =C2=A0[ ] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DGRAM =C2=A0 =C2=A0 =C2=A0CONNECTED =C2=A0 =C2=
=A0 =C2=A013887<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; unix =C2=A02 =C2=A0 =C2=A0 =C2=A0[ ] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DGRAM =C2=A0 =C2=A0 =C2=A0CONNECTED =C2=A0 =C2=
=A0 =C2=A010599<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =
=C2=A014005<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =
=C2=A013258<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =
=C2=A013248<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =
=C2=A014003<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =
=C2=A010572 /var/run/xenstored/socket<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =
=C2=A010786 /var/run/xenstored/socket<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DGRAM =C2=A0 =C2=A0 =C2=A0CONNECTED =C2=A0 =C2=
=A0 =C2=A013186<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =
=C2=A010864 /var/run/xenstored/socket<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =
=C2=A010812 /var/run/xenstored/socket<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; unix =C2=A02 =C2=A0 =C2=A0 =C2=A0[ ] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DGRAM =C2=A0 =C2=A0 =C2=A0CONNECTED =C2=A0 =C2=
=A0 =C2=A014083<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =
=C2=A010813 /var/run/xenstored/socket<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =
=C2=A014068<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =
=C2=A013256<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =
=C2=A010571 /var/run/xenstored/socket<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =
=C2=A010842<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =
=C2=A013985<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DGRAM =C2=A0 =C2=A0 =C2=A0CONNECTED =C2=A0 =C2=
=A0 =C2=A013185<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; unix =C2=A02 =C2=A0 =C2=A0 =C2=A0[ ] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =
=C2=A013884<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; unix =C2=A02 =C2=A0 =C2=A0 =C2=A0[ ] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DGRAM =C2=A0 =C2=A0 =C2=A0CONNECTED =C2=A0 =C2=
=A0 =C2=A014528<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; unix =C2=A02 =C2=A0 =C2=A0 =C2=A0[ ] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DGRAM =C2=A0 =C2=A0 =C2=A0CONNECTED =C2=A0 =C2=
=A0 =C2=A013785<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 STREAM =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =
=C2=A014034<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Attaching xen log files of /var/log/xen=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I didn&#39;t get the role of QEMU here =
because as mentioned earlier, I am porting in raspberrypi 4B.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Vipul Kumar<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; On Wed, Oct 19, 2022 at 12:43 AM Stefan=
o Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank=
">sstabellini@kernel.org</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0It usually wo=
rks the way it is described in the guide:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0<a href=3D"https://www.virtuatopia.com=
/index.php?title=3DConfiguring_a_VNC_based_Graphical_Console_for_a_Xen_Para=
virtualized_domainU_Guest" rel=3D"noreferrer" target=3D"_blank">https://www=
.virtuatopia.com/index.php?title=3DConfiguring_a_VNC_based_Graphical_Consol=
e_for_a_Xen_Paravirtualized_domainU_Guest</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0You don&#39;t=
 need to install any VNC-related server software because it is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0already provi=
ded by Xen (to be precise it is provided by QEMU working<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0together with=
 Xen.)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0You only need=
 the vnc client in dom0 so that you can connect, but you<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0could also ru=
n the vnc client outside from another host. So basically<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0the following=
 should work when executed in Dom0 after creating DomU:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 vncvie=
wer localhost:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Can you attac=
h the Xen and QEMU logs (/var/log/xen/*)? And also use<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0netstat -taun=
p to check if there is anything running at port 5900 or<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A05901?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Cheers,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Stefano<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On Tue, 18 Oc=
t 2022, Vipul Suneja wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hi Stefa=
no,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Thanks f=
or the response!<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I could =
install tigerVNC, x11vnc &amp; libvncserver in Dom0 xen-image-minimal but o=
nly manage to install<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0libvncserver(couldn&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install tiger=
vnc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &amp; x1=
1vnc because of x11<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; support =
missing, it&#39;s wayland) in DOMU custom graphical image. I tried running =
vncviewer with IP address &amp; port<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0in dom0 to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0access the do=
mu<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; graphica=
l image display as per below commands.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0vn=
cviewer <a href=3D"http://192.168.1.42:5901" rel=3D"noreferrer" target=3D"_=
blank">192.168.1.42:5901</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0Bu=
t it showing can&#39;t open display, below are the logs:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; root@ras=
pberrypi4-64:~/guest1# vncviewer <a href=3D"http://192.168.1.42:5901" rel=
=3D"noreferrer" target=3D"_blank">192.168.1.42:5901</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; TigerVNC=
 Viewer 64-bit v1.11.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Built on=
: 2020-09-08 12:16<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Copyrigh=
t (C) 1999-2020 TigerVNC Team and many others (see README.rst)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; See <a h=
ref=3D"https://www.tigervnc.org" rel=3D"noreferrer" target=3D"_blank">https=
://www.tigervnc.org</a> for information on TigerVNC.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Can&#39;=
t open display:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; root@ras=
pberrypi4-64:~/guest1#<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I am not=
 exactly=C2=A0sure what the issue is but I thought only libvncserver in DOM=
U could work to get access but it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0did not<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0work.=C2=A0<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; If Tiger=
VNC is the issue here then is there any other VNC source which could be ins=
talled for both x11 &amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0wayland supported<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0images?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Regards,=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Vipul Ku=
mar<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; On Tue, =
Oct 18, 2022 at 2:40 AM Stefano Stabellini &lt;<a href=3D"mailto:sstabellin=
i@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0VNC is typically easier to setup, because SDL needs ext=
ra libraries at<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0build time and runtime. If QEMU is built without SDL su=
pport it won&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0start when you ask for SDL.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0VNC should work with both x11 and wayland in your domU.=
 It doesn&#39;t work<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0at the x11 level, it exposes a special fbdev device in =
your domU that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0should work with:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0- a graphical console in Linux domU<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0- x11<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0- wayland (but I haven&#39;t tested this so I am not 10=
0% sure about it)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0When you say &quot;it doesn&#39;t work&quot;, what do y=
ou mean? Do you get a black<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0window?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0You need CONFIG_XEN_FBDEV_FRONTEND in Linux domU<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0(drivers/video/fbdev/xen-fbfront.c). I would try to get=
 a graphical text<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0console up and running in your domU before attempting x=
11/wayland.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0Cheers,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0Stefano<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0On Mon, 17 Oct 2022, Vipul Suneja wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; Hi,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; Thanks!<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; I have ported xen minimal image as DOM0 &amp; cust=
om wayland GUI based image as DOMU in raspberry pi4B. I<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0am trying to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0make GUI<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0display up<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; for=C2=A0guest machine. I tried using=C2=A0sdl, in=
cluded below line in guest.conf file<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; vfb=3D [ &#39;sdl=3D1&#39; ]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; But it is throwing below error:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; root@raspberrypi4-64:~/guest1# xl create -c guest1=
.cfg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; Parsing config from guest1.cfg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; libxl: error: libxl_qmp.c:1400:qmp_ev_fd_callback:=
 Domain 3:error on QMP socket: Connection reset by<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0peer<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; libxl: error: libxl_qmp.c:1439:qmp_ev_fd_callback:=
 Domain 3:Error happened with the QMP connection to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QEMU<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; libxl: error: libxl_dm.c:3351:device_model_postcon=
fig_done: Domain 3:Post DM startup configs failed,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rc=3D-26<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; libxl: error: libxl_create.c:1867:domcreate_devmod=
el_started: Domain 3:device model did not start: -26<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; libxl: error: libxl_aoutils.c:646:libxl__kill_xs_p=
ath: Device Model already exited<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; libxl: error: libxl_domain.c:1183:libxl__destroy_d=
omid: Domain 3:Non-existant domain<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; libxl: error: libxl_domain.c:1137:domain_destroy_c=
allback: Domain 3:Unable to destroy guest<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; libxl: error: libxl_domain.c:1064:domain_destroy_c=
b: Domain 3:Destruction of domain failed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; Another way is VNC, i could install tigervnc in DO=
M0 but same i couldn&#39;t in guest machine because it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0doesn&#39;t support<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0x11(supports wayland<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; only). I am completely blocked here, Need your sup=
port to enable the display up.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; Any alternative of VNC which could work in both x1=
1 &amp; wayland supported images?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; Any input on VNC, SDL or any other way to proceed =
on this? Looking forward to hearing from you.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; Vipul Kumar<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
&gt; <br>
&gt; </blockquote></div>

--00000000000054191d05edff84e6--
--00000000000054191f05edff84e8
Content-Type: application/octet-stream; name=config
Content-Disposition: attachment; filename=config
Content-Transfer-Encoding: base64
Content-ID: <f_lar54cp20>
X-Attachment-Id: f_lar54cp20

IwojIEF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIGZpbGU7IERPIE5PVCBFRElULgojIExpbnV4L2Fy
bTY0IDUuMTUuNjggS2VybmVsIENvbmZpZ3VyYXRpb24KIwpDT05GSUdfQ0NfVkVSU0lPTl9URVhU
PSJhYXJjaDY0LXBva3ktbGludXgtZ2NjIChHQ0MpIDExLjMuMCIKQ09ORklHX0NDX0lTX0dDQz15
CkNPTkZJR19HQ0NfVkVSU0lPTj0xMTAzMDAKQ09ORklHX0NMQU5HX1ZFUlNJT049MApDT05GSUdf
QVNfSVNfR05VPXkKQ09ORklHX0FTX1ZFUlNJT049MjAyNDQ1MDgKQ09ORklHX0xEX0lTX0JGRD15
CkNPTkZJR19MRF9WRVJTSU9OPTIwMjQ0NTA4CkNPTkZJR19MTERfVkVSU0lPTj0wCkNPTkZJR19D
Q19DQU5fTElOSz15CkNPTkZJR19DQ19DQU5fTElOS19TVEFUSUM9eQpDT05GSUdfQ0NfSEFTX0FT
TV9HT1RPPXkKQ09ORklHX0NDX0hBU19BU01fR09UT19PVVRQVVQ9eQpDT05GSUdfQ0NfSEFTX0FT
TV9HT1RPX1RJRURfT1VUUFVUPXkKQ09ORklHX0NDX0hBU19BU01fSU5MSU5FPXkKQ09ORklHX0ND
X0hBU19OT19QUk9GSUxFX0ZOX0FUVFI9eQpDT05GSUdfSVJRX1dPUks9eQpDT05GSUdfQlVJTERU
SU1FX1RBQkxFX1NPUlQ9eQpDT05GSUdfVEhSRUFEX0lORk9fSU5fVEFTSz15CgojCiMgR2VuZXJh
bCBzZXR1cAojCkNPTkZJR19JTklUX0VOVl9BUkdfTElNSVQ9MzIKIyBDT05GSUdfQ09NUElMRV9U
RVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfV0VSUk9SIGlzIG5vdCBzZXQKQ09ORklHX0xPQ0FMVkVS
U0lPTj0iLXlvY3RvLXN0YW5kYXJkIgojIENPTkZJR19MT0NBTFZFUlNJT05fQVVUTyBpcyBub3Qg
c2V0CkNPTkZJR19CVUlMRF9TQUxUPSIiCkNPTkZJR19ERUZBVUxUX0lOSVQ9IiIKQ09ORklHX0RF
RkFVTFRfSE9TVE5BTUU9Iihub25lKSIKQ09ORklHX1NXQVA9eQpDT05GSUdfU1lTVklQQz15CkNP
TkZJR19TWVNWSVBDX1NZU0NUTD15CkNPTkZJR19QT1NJWF9NUVVFVUU9eQpDT05GSUdfUE9TSVhf
TVFVRVVFX1NZU0NUTD15CiMgQ09ORklHX1dBVENIX1FVRVVFIGlzIG5vdCBzZXQKQ09ORklHX0NS
T1NTX01FTU9SWV9BVFRBQ0g9eQojIENPTkZJR19VU0VMSUIgaXMgbm90IHNldAojIENPTkZJR19B
VURJVCBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0FSQ0hfQVVESVRTWVNDQUxMPXkKCiMKIyBJUlEg
c3Vic3lzdGVtCiMKQ09ORklHX0dFTkVSSUNfSVJRX1BST0JFPXkKQ09ORklHX0dFTkVSSUNfSVJR
X1NIT1c9eQpDT05GSUdfR0VORVJJQ19JUlFfU0hPV19MRVZFTD15CkNPTkZJR19HRU5FUklDX0lS
UV9FRkZFQ1RJVkVfQUZGX01BU0s9eQpDT05GSUdfR0VORVJJQ19JUlFfTUlHUkFUSU9OPXkKQ09O
RklHX0hBUkRJUlFTX1NXX1JFU0VORD15CkNPTkZJR19HRU5FUklDX0lSUV9DSElQPXkKQ09ORklH
X0lSUV9ET01BSU49eQpDT05GSUdfSVJRX1NJTT15CkNPTkZJR19JUlFfRE9NQUlOX0hJRVJBUkNI
WT15CkNPTkZJR19HRU5FUklDX0lSUV9JUEk9eQpDT05GSUdfR0VORVJJQ19NU0lfSVJRPXkKQ09O
RklHX0dFTkVSSUNfTVNJX0lSUV9ET01BSU49eQpDT05GSUdfSVJRX01TSV9JT01NVT15CkNPTkZJ
R19IQU5ETEVfRE9NQUlOX0lSUT15CkNPTkZJR19JUlFfRk9SQ0VEX1RIUkVBRElORz15CkNPTkZJ
R19TUEFSU0VfSVJRPXkKIyBDT05GSUdfR0VORVJJQ19JUlFfREVCVUdGUyBpcyBub3Qgc2V0CiMg
ZW5kIG9mIElSUSBzdWJzeXN0ZW0KCkNPTkZJR19HRU5FUklDX1RJTUVfVlNZU0NBTEw9eQpDT05G
SUdfR0VORVJJQ19DTE9DS0VWRU5UUz15CkNPTkZJR19BUkNIX0hBU19USUNLX0JST0FEQ0FTVD15
CkNPTkZJR19HRU5FUklDX0NMT0NLRVZFTlRTX0JST0FEQ0FTVD15CgojCiMgVGltZXJzIHN1YnN5
c3RlbQojCkNPTkZJR19USUNLX09ORVNIT1Q9eQpDT05GSUdfSFpfUEVSSU9ESUM9eQojIENPTkZJ
R19OT19IWl9JRExFIGlzIG5vdCBzZXQKIyBDT05GSUdfTk9fSFpfRlVMTCBpcyBub3Qgc2V0CiMg
Q09ORklHX05PX0haIGlzIG5vdCBzZXQKQ09ORklHX0hJR0hfUkVTX1RJTUVSUz15CiMgZW5kIG9m
IFRpbWVycyBzdWJzeXN0ZW0KCkNPTkZJR19CUEY9eQpDT05GSUdfSEFWRV9FQlBGX0pJVD15CkNP
TkZJR19BUkNIX1dBTlRfREVGQVVMVF9CUEZfSklUPXkKCiMKIyBCUEYgc3Vic3lzdGVtCiMKQ09O
RklHX0JQRl9TWVNDQUxMPXkKQ09ORklHX0JQRl9KSVQ9eQojIENPTkZJR19CUEZfSklUX0FMV0FZ
U19PTiBpcyBub3Qgc2V0CkNPTkZJR19CUEZfSklUX0RFRkFVTFRfT049eQpDT05GSUdfQlBGX1VO
UFJJVl9ERUZBVUxUX09GRj15CiMgQ09ORklHX0JQRl9QUkVMT0FEIGlzIG5vdCBzZXQKIyBDT05G
SUdfQlBGX0xTTSBpcyBub3Qgc2V0CiMgZW5kIG9mIEJQRiBzdWJzeXN0ZW0KCiMgQ09ORklHX1BS
RUVNUFRfTk9ORSBpcyBub3Qgc2V0CiMgQ09ORklHX1BSRUVNUFRfVk9MVU5UQVJZIGlzIG5vdCBz
ZXQKQ09ORklHX1BSRUVNUFQ9eQpDT05GSUdfUFJFRU1QVF9DT1VOVD15CkNPTkZJR19QUkVFTVBU
SU9OPXkKCiMKIyBDUFUvVGFzayB0aW1lIGFuZCBzdGF0cyBhY2NvdW50aW5nCiMKQ09ORklHX1RJ
Q0tfQ1BVX0FDQ09VTlRJTkc9eQojIENPTkZJR19WSVJUX0NQVV9BQ0NPVU5USU5HX0dFTiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0lSUV9USU1FX0FDQ09VTlRJTkcgaXMgbm90IHNldApDT05GSUdfSEFW
RV9TQ0hFRF9BVkdfSVJRPXkKQ09ORklHX0JTRF9QUk9DRVNTX0FDQ1Q9eQpDT05GSUdfQlNEX1BS
T0NFU1NfQUNDVF9WMz15CiMgQ09ORklHX1RBU0tTVEFUUyBpcyBub3Qgc2V0CiMgQ09ORklHX1BT
SSBpcyBub3Qgc2V0CiMgZW5kIG9mIENQVS9UYXNrIHRpbWUgYW5kIHN0YXRzIGFjY291bnRpbmcK
CkNPTkZJR19DUFVfSVNPTEFUSU9OPXkKCiMKIyBSQ1UgU3Vic3lzdGVtCiMKQ09ORklHX1RSRUVf
UkNVPXkKQ09ORklHX1BSRUVNUFRfUkNVPXkKIyBDT05GSUdfUkNVX0VYUEVSVCBpcyBub3Qgc2V0
CkNPTkZJR19TUkNVPXkKQ09ORklHX1RSRUVfU1JDVT15CkNPTkZJR19UQVNLU19SQ1VfR0VORVJJ
Qz15CkNPTkZJR19UQVNLU19SQ1U9eQpDT05GSUdfVEFTS1NfUlVERV9SQ1U9eQpDT05GSUdfVEFT
S1NfVFJBQ0VfUkNVPXkKQ09ORklHX1JDVV9TVEFMTF9DT01NT049eQpDT05GSUdfUkNVX05FRURf
U0VHQ0JMSVNUPXkKIyBlbmQgb2YgUkNVIFN1YnN5c3RlbQoKQ09ORklHX0lLQ09ORklHPXkKQ09O
RklHX0lLQ09ORklHX1BST0M9eQojIENPTkZJR19JS0hFQURFUlMgaXMgbm90IHNldApDT05GSUdf
TE9HX0JVRl9TSElGVD0xNwpDT05GSUdfTE9HX0NQVV9NQVhfQlVGX1NISUZUPTEyCkNPTkZJR19Q
UklOVEtfU0FGRV9MT0dfQlVGX1NISUZUPTEzCiMgQ09ORklHX1BSSU5US19JTkRFWCBpcyBub3Qg
c2V0CkNPTkZJR19HRU5FUklDX1NDSEVEX0NMT0NLPXkKCiMKIyBTY2hlZHVsZXIgZmVhdHVyZXMK
IwojIENPTkZJR19VQ0xBTVBfVEFTSyBpcyBub3Qgc2V0CiMgZW5kIG9mIFNjaGVkdWxlciBmZWF0
dXJlcwoKQ09ORklHX0FSQ0hfU1VQUE9SVFNfTlVNQV9CQUxBTkNJTkc9eQpDT05GSUdfQ0NfSEFT
X0lOVDEyOD15CkNPTkZJR19BUkNIX1NVUFBPUlRTX0lOVDEyOD15CkNPTkZJR19DR1JPVVBTPXkK
Q09ORklHX1BBR0VfQ09VTlRFUj15CkNPTkZJR19NRU1DRz15CkNPTkZJR19NRU1DR19TV0FQPXkK
Q09ORklHX01FTUNHX0tNRU09eQpDT05GSUdfQkxLX0NHUk9VUD15CkNPTkZJR19DR1JPVVBfV1JJ
VEVCQUNLPXkKQ09ORklHX0NHUk9VUF9TQ0hFRD15CkNPTkZJR19GQUlSX0dST1VQX1NDSEVEPXkK
IyBDT05GSUdfQ0ZTX0JBTkRXSURUSCBpcyBub3Qgc2V0CiMgQ09ORklHX1JUX0dST1VQX1NDSEVE
IGlzIG5vdCBzZXQKQ09ORklHX0NHUk9VUF9QSURTPXkKIyBDT05GSUdfQ0dST1VQX1JETUEgaXMg
bm90IHNldApDT05GSUdfQ0dST1VQX0ZSRUVaRVI9eQpDT05GSUdfQ1BVU0VUUz15CkNPTkZJR19Q
Uk9DX1BJRF9DUFVTRVQ9eQpDT05GSUdfQ0dST1VQX0RFVklDRT15CkNPTkZJR19DR1JPVVBfQ1BV
QUNDVD15CkNPTkZJR19DR1JPVVBfUEVSRj15CkNPTkZJR19DR1JPVVBfQlBGPXkKIyBDT05GSUdf
Q0dST1VQX01JU0MgaXMgbm90IHNldApDT05GSUdfQ0dST1VQX0RFQlVHPXkKQ09ORklHX1NPQ0tf
Q0dST1VQX0RBVEE9eQpDT05GSUdfTkFNRVNQQUNFUz15CkNPTkZJR19VVFNfTlM9eQpDT05GSUdf
VElNRV9OUz15CkNPTkZJR19JUENfTlM9eQpDT05GSUdfVVNFUl9OUz15CkNPTkZJR19QSURfTlM9
eQpDT05GSUdfTkVUX05TPXkKIyBDT05GSUdfQ0hFQ0tQT0lOVF9SRVNUT1JFIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0NIRURfQVVUT0dST1VQIGlzIG5vdCBzZXQKIyBDT05GSUdfU1lTRlNfREVQUkVD
QVRFRCBpcyBub3Qgc2V0CkNPTkZJR19SRUxBWT15CkNPTkZJR19CTEtfREVWX0lOSVRSRD15CkNP
TkZJR19JTklUUkFNRlNfU09VUkNFPSIiCkNPTkZJR19SRF9HWklQPXkKQ09ORklHX1JEX0JaSVAy
PXkKQ09ORklHX1JEX0xaTUE9eQpDT05GSUdfUkRfWFo9eQpDT05GSUdfUkRfTFpPPXkKQ09ORklH
X1JEX0xaND15CkNPTkZJR19SRF9aU1REPXkKIyBDT05GSUdfQk9PVF9DT05GSUcgaXMgbm90IHNl
dApDT05GSUdfQ0NfT1BUSU1JWkVfRk9SX1BFUkZPUk1BTkNFPXkKIyBDT05GSUdfQ0NfT1BUSU1J
WkVfRk9SX1NJWkUgaXMgbm90IHNldApDT05GSUdfTERfT1JQSEFOX1dBUk49eQpDT05GSUdfU1lT
Q1RMPXkKQ09ORklHX0hBVkVfVUlEMTY9eQpDT05GSUdfU1lTQ1RMX0VYQ0VQVElPTl9UUkFDRT15
CkNPTkZJR19FWFBFUlQ9eQpDT05GSUdfVUlEMTY9eQpDT05GSUdfTVVMVElVU0VSPXkKIyBDT05G
SUdfU0dFVE1BU0tfU1lTQ0FMTCBpcyBub3Qgc2V0CkNPTkZJR19TWVNGU19TWVNDQUxMPXkKQ09O
RklHX0ZIQU5ETEU9eQpDT05GSUdfUE9TSVhfVElNRVJTPXkKQ09ORklHX1BSSU5USz15CkNPTkZJ
R19CVUc9eQpDT05GSUdfRUxGX0NPUkU9eQpDT05GSUdfQkFTRV9GVUxMPXkKQ09ORklHX0ZVVEVY
PXkKQ09ORklHX0ZVVEVYX1BJPXkKQ09ORklHX0hBVkVfRlVURVhfQ01QWENIRz15CkNPTkZJR19F
UE9MTD15CkNPTkZJR19TSUdOQUxGRD15CkNPTkZJR19USU1FUkZEPXkKQ09ORklHX0VWRU5URkQ9
eQpDT05GSUdfU0hNRU09eQpDT05GSUdfQUlPPXkKQ09ORklHX0lPX1VSSU5HPXkKQ09ORklHX0FE
VklTRV9TWVNDQUxMUz15CkNPTkZJR19NRU1CQVJSSUVSPXkKQ09ORklHX0tBTExTWU1TPXkKQ09O
RklHX0tBTExTWU1TX0FMTD15CkNPTkZJR19LQUxMU1lNU19CQVNFX1JFTEFUSVZFPXkKIyBDT05G
SUdfVVNFUkZBVUxURkQgaXMgbm90IHNldApDT05GSUdfQVJDSF9IQVNfTUVNQkFSUklFUl9TWU5D
X0NPUkU9eQpDT05GSUdfS0NNUD15CkNPTkZJR19SU0VRPXkKIyBDT05GSUdfREVCVUdfUlNFUSBp
cyBub3Qgc2V0CiMgQ09ORklHX0VNQkVEREVEIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfUEVSRl9F
VkVOVFM9eQojIENPTkZJR19QQzEwNCBpcyBub3Qgc2V0CgojCiMgS2VybmVsIFBlcmZvcm1hbmNl
IEV2ZW50cyBBbmQgQ291bnRlcnMKIwpDT05GSUdfUEVSRl9FVkVOVFM9eQojIENPTkZJR19ERUJV
R19QRVJGX1VTRV9WTUFMTE9DIGlzIG5vdCBzZXQKIyBlbmQgb2YgS2VybmVsIFBlcmZvcm1hbmNl
IEV2ZW50cyBBbmQgQ291bnRlcnMKCkNPTkZJR19WTV9FVkVOVF9DT1VOVEVSUz15CkNPTkZJR19T
TFVCX0RFQlVHPXkKQ09ORklHX0NPTVBBVF9CUks9eQojIENPTkZJR19TTEFCIGlzIG5vdCBzZXQK
Q09ORklHX1NMVUI9eQojIENPTkZJR19TTE9CIGlzIG5vdCBzZXQKQ09ORklHX1NMQUJfTUVSR0Vf
REVGQVVMVD15CiMgQ09ORklHX1NMQUJfRlJFRUxJU1RfUkFORE9NIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0xBQl9GUkVFTElTVF9IQVJERU5FRCBpcyBub3Qgc2V0CiMgQ09ORklHX1NIVUZGTEVfUEFH
RV9BTExPQ0FUT1IgaXMgbm90IHNldApDT05GSUdfU0xVQl9DUFVfUEFSVElBTD15CkNPTkZJR19T
WVNURU1fREFUQV9WRVJJRklDQVRJT049eQpDT05GSUdfUFJPRklMSU5HPXkKQ09ORklHX1RSQUNF
UE9JTlRTPXkKIyBlbmQgb2YgR2VuZXJhbCBzZXR1cAoKQ09ORklHX0FSTTY0PXkKQ09ORklHXzY0
QklUPXkKQ09ORklHX01NVT15CkNPTkZJR19BUk02NF9QQUdFX1NISUZUPTEyCkNPTkZJR19BUk02
NF9DT05UX1BURV9TSElGVD00CkNPTkZJR19BUk02NF9DT05UX1BNRF9TSElGVD00CkNPTkZJR19B
UkNIX01NQVBfUk5EX0JJVFNfTUlOPTE4CkNPTkZJR19BUkNIX01NQVBfUk5EX0JJVFNfTUFYPTI0
CkNPTkZJR19BUkNIX01NQVBfUk5EX0NPTVBBVF9CSVRTX01JTj0xMQpDT05GSUdfQVJDSF9NTUFQ
X1JORF9DT01QQVRfQklUU19NQVg9MTYKQ09ORklHX1NUQUNLVFJBQ0VfU1VQUE9SVD15CkNPTkZJ
R19JTExFR0FMX1BPSU5URVJfVkFMVUU9MHhkZWFkMDAwMDAwMDAwMDAwCkNPTkZJR19MT0NLREVQ
X1NVUFBPUlQ9eQpDT05GSUdfR0VORVJJQ19CVUc9eQpDT05GSUdfR0VORVJJQ19CVUdfUkVMQVRJ
VkVfUE9JTlRFUlM9eQpDT05GSUdfR0VORVJJQ19IV0VJR0hUPXkKQ09ORklHX0dFTkVSSUNfQ1NV
TT15CkNPTkZJR19HRU5FUklDX0NBTElCUkFURV9ERUxBWT15CkNPTkZJR19BUkNIX01IUF9NRU1N
QVBfT05fTUVNT1JZX0VOQUJMRT15CkNPTkZJR19TTVA9eQpDT05GSUdfS0VSTkVMX01PREVfTkVP
Tj15CkNPTkZJR19GSVhfRUFSTFlDT05fTUVNPXkKQ09ORklHX1BHVEFCTEVfTEVWRUxTPTMKQ09O
RklHX0FSQ0hfU1VQUE9SVFNfVVBST0JFUz15CkNPTkZJR19BUkNIX1BST0NfS0NPUkVfVEVYVD15
CgojCiMgUGxhdGZvcm0gc2VsZWN0aW9uCiMKIyBDT05GSUdfQVJDSF9BQ1RJT05TIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQVJDSF9TVU5YSSBpcyBub3Qgc2V0CiMgQ09ORklHX0FSQ0hfQUxQSU5FIGlz
IG5vdCBzZXQKIyBDT05GSUdfQVJDSF9BUFBMRSBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX0JDTTI4
MzU9eQojIENPTkZJR19BUkNIX0JDTTQ5MDggaXMgbm90IHNldAojIENPTkZJR19BUkNIX0JDTV9J
UFJPQyBpcyBub3Qgc2V0CiMgQ09ORklHX0FSQ0hfQkVSTElOIGlzIG5vdCBzZXQKIyBDT05GSUdf
QVJDSF9CSVRNQUlOIGlzIG5vdCBzZXQKIyBDT05GSUdfQVJDSF9CUkNNU1RCIGlzIG5vdCBzZXQK
IyBDT05GSUdfQVJDSF9FWFlOT1MgaXMgbm90IHNldAojIENPTkZJR19BUkNIX1NQQVJYNSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0FSQ0hfSzMgaXMgbm90IHNldAojIENPTkZJR19BUkNIX0xBWUVSU0NB
UEUgaXMgbm90IHNldAojIENPTkZJR19BUkNIX0xHMUsgaXMgbm90IHNldAojIENPTkZJR19BUkNI
X0hJU0kgaXMgbm90IHNldAojIENPTkZJR19BUkNIX0tFRU1CQVkgaXMgbm90IHNldAojIENPTkZJ
R19BUkNIX01FRElBVEVLIGlzIG5vdCBzZXQKIyBDT05GSUdfQVJDSF9NRVNPTiBpcyBub3Qgc2V0
CiMgQ09ORklHX0FSQ0hfTVZFQlUgaXMgbm90IHNldAojIENPTkZJR19BUkNIX01YQyBpcyBub3Qg
c2V0CiMgQ09ORklHX0FSQ0hfUUNPTSBpcyBub3Qgc2V0CiMgQ09ORklHX0FSQ0hfUkVBTFRFSyBp
cyBub3Qgc2V0CiMgQ09ORklHX0FSQ0hfUkVORVNBUyBpcyBub3Qgc2V0CiMgQ09ORklHX0FSQ0hf
Uk9DS0NISVAgaXMgbm90IHNldAojIENPTkZJR19BUkNIX1MzMiBpcyBub3Qgc2V0CiMgQ09ORklH
X0FSQ0hfU0VBVFRMRSBpcyBub3Qgc2V0CiMgQ09ORklHX0FSQ0hfSU5URUxfU09DRlBHQSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0FSQ0hfU1lOUVVBQ0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfQVJDSF9U
RUdSQSBpcyBub3Qgc2V0CiMgQ09ORklHX0FSQ0hfU1BSRCBpcyBub3Qgc2V0CiMgQ09ORklHX0FS
Q0hfVEhVTkRFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0FSQ0hfVEhVTkRFUjIgaXMgbm90IHNldAoj
IENPTkZJR19BUkNIX1VOSVBISUVSIGlzIG5vdCBzZXQKIyBDT05GSUdfQVJDSF9WRVhQUkVTUyBp
cyBub3Qgc2V0CiMgQ09ORklHX0FSQ0hfVklTQ09OVEkgaXMgbm90IHNldAojIENPTkZJR19BUkNI
X1hHRU5FIGlzIG5vdCBzZXQKIyBDT05GSUdfQVJDSF9aWU5RTVAgaXMgbm90IHNldAojIGVuZCBv
ZiBQbGF0Zm9ybSBzZWxlY3Rpb24KCiMKIyBLZXJuZWwgRmVhdHVyZXMKIwoKIwojIEFSTSBlcnJh
dGEgd29ya2Fyb3VuZHMgdmlhIHRoZSBhbHRlcm5hdGl2ZXMgZnJhbWV3b3JrCiMKQ09ORklHX0FS
TTY0X1dPUktBUk9VTkRfQ0xFQU5fQ0FDSEU9eQpDT05GSUdfQVJNNjRfRVJSQVRVTV84MjYzMTk9
eQpDT05GSUdfQVJNNjRfRVJSQVRVTV84MjczMTk9eQpDT05GSUdfQVJNNjRfRVJSQVRVTV84MjQw
Njk9eQpDT05GSUdfQVJNNjRfRVJSQVRVTV84MTk0NzI9eQpDT05GSUdfQVJNNjRfRVJSQVRVTV84
MzIwNzU9eQpDT05GSUdfQVJNNjRfRVJSQVRVTV84NDU3MTk9eQpDT05GSUdfQVJNNjRfRVJSQVRV
TV84NDM0MTk9eQpDT05GSUdfQVJNNjRfTERfSEFTX0ZJWF9FUlJBVFVNXzg0MzQxOT15CkNPTkZJ
R19BUk02NF9FUlJBVFVNXzEwMjQ3MTg9eQpDT05GSUdfQVJNNjRfRVJSQVRVTV8xNDE4MDQwPXkK
Q09ORklHX0FSTTY0X1dPUktBUk9VTkRfU1BFQ1VMQVRJVkVfQVQ9eQpDT05GSUdfQVJNNjRfRVJS
QVRVTV8xMTY1NTIyPXkKQ09ORklHX0FSTTY0X0VSUkFUVU1fMTMxOTM2Nz15CkNPTkZJR19BUk02
NF9FUlJBVFVNXzE1MzA5MjM9eQpDT05GSUdfQVJNNjRfV09SS0FST1VORF9SRVBFQVRfVExCST15
CkNPTkZJR19BUk02NF9FUlJBVFVNXzEyODY4MDc9eQpDT05GSUdfQVJNNjRfRVJSQVRVTV8xNDYz
MjI1PXkKQ09ORklHX0FSTTY0X0VSUkFUVU1fMTU0MjQxOT15CkNPTkZJR19BUk02NF9FUlJBVFVN
XzE1MDg0MTI9eQpDT05GSUdfQVJNNjRfRVJSQVRVTV8yNDQxMDA5PXkKQ09ORklHX0FSTTY0X0VS
UkFUVU1fMjQ1NzE2OD15CkNPTkZJR19DQVZJVU1fRVJSQVRVTV8yMjM3NT15CkNPTkZJR19DQVZJ
VU1fRVJSQVRVTV8yMzE1ND15CkNPTkZJR19DQVZJVU1fRVJSQVRVTV8yNzQ1Nj15CkNPTkZJR19D
QVZJVU1fRVJSQVRVTV8zMDExNT15CkNPTkZJR19DQVZJVU1fVFgyX0VSUkFUVU1fMjE5PXkKQ09O
RklHX0ZVSklUU1VfRVJSQVRVTV8wMTAwMDE9eQpDT05GSUdfSElTSUxJQ09OX0VSUkFUVU1fMTYx
NjAwODAyPXkKQ09ORklHX1FDT01fRkFMS09SX0VSUkFUVU1fMTAwMz15CkNPTkZJR19RQ09NX0ZB
TEtPUl9FUlJBVFVNXzEwMDk9eQpDT05GSUdfUUNPTV9RREYyNDAwX0VSUkFUVU1fMDA2NT15CkNP
TkZJR19RQ09NX0ZBTEtPUl9FUlJBVFVNX0UxMDQxPXkKQ09ORklHX05WSURJQV9DQVJNRUxfQ05Q
X0VSUkFUVU09eQpDT05GSUdfU09DSU9ORVhUX1NZTlFVQUNFUl9QUkVJVFM9eQojIGVuZCBvZiBB
Uk0gZXJyYXRhIHdvcmthcm91bmRzIHZpYSB0aGUgYWx0ZXJuYXRpdmVzIGZyYW1ld29yawoKQ09O
RklHX0FSTTY0XzRLX1BBR0VTPXkKIyBDT05GSUdfQVJNNjRfMTZLX1BBR0VTIGlzIG5vdCBzZXQK
IyBDT05GSUdfQVJNNjRfNjRLX1BBR0VTIGlzIG5vdCBzZXQKQ09ORklHX0FSTTY0X1ZBX0JJVFNf
Mzk9eQojIENPTkZJR19BUk02NF9WQV9CSVRTXzQ4IGlzIG5vdCBzZXQKQ09ORklHX0FSTTY0X1ZB
X0JJVFM9MzkKQ09ORklHX0FSTTY0X1BBX0JJVFNfNDg9eQpDT05GSUdfQVJNNjRfUEFfQklUUz00
OAojIENPTkZJR19DUFVfQklHX0VORElBTiBpcyBub3Qgc2V0CkNPTkZJR19DUFVfTElUVExFX0VO
RElBTj15CiMgQ09ORklHX1NDSEVEX01DIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NIRURfU01UIGlz
IG5vdCBzZXQKQ09ORklHX05SX0NQVVM9NApDT05GSUdfSE9UUExVR19DUFU9eQojIENPTkZJR19O
VU1BIGlzIG5vdCBzZXQKIyBDT05GSUdfSFpfMTAwIGlzIG5vdCBzZXQKQ09ORklHX0haXzI1MD15
CiMgQ09ORklHX0haXzMwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0haXzEwMDAgaXMgbm90IHNldApD
T05GSUdfSFo9MjUwCkNPTkZJR19TQ0hFRF9IUlRJQ0s9eQpDT05GSUdfQVJDSF9TUEFSU0VNRU1f
RU5BQkxFPXkKQ09ORklHX0hXX1BFUkZfRVZFTlRTPXkKQ09ORklHX1BBUkFWSVJUPXkKQ09ORklH
X1BBUkFWSVJUX1RJTUVfQUNDT1VOVElORz15CiMgQ09ORklHX0tFWEVDIGlzIG5vdCBzZXQKIyBD
T05GSUdfS0VYRUNfRklMRSBpcyBub3Qgc2V0CiMgQ09ORklHX0NSQVNIX0RVTVAgaXMgbm90IHNl
dApDT05GSUdfWEVOX0RPTTA9eQpDT05GSUdfWEVOPXkKQ09ORklHX0ZPUkNFX01BWF9aT05FT1JE
RVI9MTEKQ09ORklHX1VOTUFQX0tFUk5FTF9BVF9FTDA9eQpDT05GSUdfTUlUSUdBVEVfU1BFQ1RS
RV9CUkFOQ0hfSElTVE9SWT15CkNPTkZJR19ST0RBVEFfRlVMTF9ERUZBVUxUX0VOQUJMRUQ9eQoj
IENPTkZJR19BUk02NF9TV19UVEJSMF9QQU4gaXMgbm90IHNldApDT05GSUdfQVJNNjRfVEFHR0VE
X0FERFJfQUJJPXkKQ09ORklHX0NPTVBBVD15CkNPTkZJR19LVVNFUl9IRUxQRVJTPXkKIyBDT05G
SUdfQVJNVjhfREVQUkVDQVRFRCBpcyBub3Qgc2V0CgojCiMgQVJNdjguMSBhcmNoaXRlY3R1cmFs
IGZlYXR1cmVzCiMKQ09ORklHX0FSTTY0X0hXX0FGREJNPXkKQ09ORklHX0FSTTY0X1BBTj15CkNP
TkZJR19BU19IQVNfTERBUFI9eQpDT05GSUdfQVNfSEFTX0xTRV9BVE9NSUNTPXkKIyBlbmQgb2Yg
QVJNdjguMSBhcmNoaXRlY3R1cmFsIGZlYXR1cmVzCgojCiMgQVJNdjguMiBhcmNoaXRlY3R1cmFs
IGZlYXR1cmVzCiMKIyBDT05GSUdfQVJNNjRfUE1FTSBpcyBub3Qgc2V0CkNPTkZJR19BUk02NF9S
QVNfRVhUTj15CkNPTkZJR19BUk02NF9DTlA9eQojIGVuZCBvZiBBUk12OC4yIGFyY2hpdGVjdHVy
YWwgZmVhdHVyZXMKCiMKIyBBUk12OC4zIGFyY2hpdGVjdHVyYWwgZmVhdHVyZXMKIwpDT05GSUdf
QVJNNjRfUFRSX0FVVEg9eQpDT05GSUdfQVJNNjRfUFRSX0FVVEhfS0VSTkVMPXkKQ09ORklHX0ND
X0hBU19CUkFOQ0hfUFJPVF9QQUNfUkVUPXkKQ09ORklHX0NDX0hBU19TSUdOX1JFVFVSTl9BRERS
RVNTPXkKQ09ORklHX0FTX0hBU19QQUM9eQpDT05GSUdfQVNfSEFTX0NGSV9ORUdBVEVfUkFfU1RB
VEU9eQojIGVuZCBvZiBBUk12OC4zIGFyY2hpdGVjdHVyYWwgZmVhdHVyZXMKCiMKIyBBUk12OC40
IGFyY2hpdGVjdHVyYWwgZmVhdHVyZXMKIwpDT05GSUdfQVJNNjRfQU1VX0VYVE49eQpDT05GSUdf
QVNfSEFTX0FSTVY4XzQ9eQpDT05GSUdfQVJNNjRfVExCX1JBTkdFPXkKIyBlbmQgb2YgQVJNdjgu
NCBhcmNoaXRlY3R1cmFsIGZlYXR1cmVzCgojCiMgQVJNdjguNSBhcmNoaXRlY3R1cmFsIGZlYXR1
cmVzCiMKQ09ORklHX0FTX0hBU19BUk1WOF81PXkKQ09ORklHX0FSTTY0X0JUST15CkNPTkZJR19D
Q19IQVNfQlJBTkNIX1BST1RfUEFDX1JFVF9CVEk9eQpDT05GSUdfQVJNNjRfRTBQRD15CkNPTkZJ
R19BUkNIX1JBTkRPTT15CkNPTkZJR19BUk02NF9BU19IQVNfTVRFPXkKQ09ORklHX0FSTTY0X01U
RT15CiMgZW5kIG9mIEFSTXY4LjUgYXJjaGl0ZWN0dXJhbCBmZWF0dXJlcwoKIwojIEFSTXY4Ljcg
YXJjaGl0ZWN0dXJhbCBmZWF0dXJlcwojCkNPTkZJR19BUk02NF9FUEFOPXkKIyBlbmQgb2YgQVJN
djguNyBhcmNoaXRlY3R1cmFsIGZlYXR1cmVzCgpDT05GSUdfQVJNNjRfU1ZFPXkKQ09ORklHX0FS
TTY0X01PRFVMRV9QTFRTPXkKIyBDT05GSUdfQVJNNjRfUFNFVURPX05NSSBpcyBub3Qgc2V0CkNP
TkZJR19SRUxPQ0FUQUJMRT15CiMgQ09ORklHX1JBTkRPTUlaRV9CQVNFIGlzIG5vdCBzZXQKQ09O
RklHX0NDX0hBVkVfU1RBQ0tQUk9URUNUT1JfU1lTUkVHPXkKQ09ORklHX1NUQUNLUFJPVEVDVE9S
X1BFUl9UQVNLPXkKIyBlbmQgb2YgS2VybmVsIEZlYXR1cmVzCgojCiMgQm9vdCBvcHRpb25zCiMK
Q09ORklHX0NNRExJTkU9IiIKQ09ORklHX0VGSV9TVFVCPXkKQ09ORklHX0VGST15CkNPTkZJR19E
TUk9eQojIGVuZCBvZiBCb290IG9wdGlvbnMKCkNPTkZJR19TWVNWSVBDX0NPTVBBVD15CgojCiMg
UG93ZXIgbWFuYWdlbWVudCBvcHRpb25zCiMKQ09ORklHX1NVU1BFTkQ9eQpDT05GSUdfU1VTUEVO
RF9GUkVFWkVSPXkKIyBDT05GSUdfU1VTUEVORF9TS0lQX1NZTkMgaXMgbm90IHNldAojIENPTkZJ
R19ISUJFUk5BVElPTiBpcyBub3Qgc2V0CkNPTkZJR19QTV9TTEVFUD15CkNPTkZJR19QTV9TTEVF
UF9TTVA9eQojIENPTkZJR19QTV9BVVRPU0xFRVAgaXMgbm90IHNldAojIENPTkZJR19QTV9XQUtF
TE9DS1MgaXMgbm90IHNldApDT05GSUdfUE09eQojIENPTkZJR19QTV9ERUJVRyBpcyBub3Qgc2V0
CkNPTkZJR19QTV9DTEs9eQpDT05GSUdfUE1fR0VORVJJQ19ET01BSU5TPXkKIyBDT05GSUdfV1Ff
UE9XRVJfRUZGSUNJRU5UX0RFRkFVTFQgaXMgbm90IHNldApDT05GSUdfUE1fR0VORVJJQ19ET01B
SU5TX1NMRUVQPXkKQ09ORklHX1BNX0dFTkVSSUNfRE9NQUlOU19PRj15CkNPTkZJR19DUFVfUE09
eQojIENPTkZJR19FTkVSR1lfTU9ERUwgaXMgbm90IHNldApDT05GSUdfQVJDSF9ISUJFUk5BVElP
Tl9QT1NTSUJMRT15CkNPTkZJR19BUkNIX1NVU1BFTkRfUE9TU0lCTEU9eQojIGVuZCBvZiBQb3dl
ciBtYW5hZ2VtZW50IG9wdGlvbnMKCiMKIyBDUFUgUG93ZXIgTWFuYWdlbWVudAojCgojCiMgQ1BV
IElkbGUKIwpDT05GSUdfQ1BVX0lETEU9eQpDT05GSUdfQ1BVX0lETEVfTVVMVElQTEVfRFJJVkVS
Uz15CkNPTkZJR19DUFVfSURMRV9HT1ZfTEFEREVSPXkKQ09ORklHX0NQVV9JRExFX0dPVl9NRU5V
PXkKIyBDT05GSUdfQ1BVX0lETEVfR09WX1RFTyBpcyBub3Qgc2V0CkNPTkZJR19EVF9JRExFX1NU
QVRFUz15CgojCiMgQVJNIENQVSBJZGxlIERyaXZlcnMKIwpDT05GSUdfQVJNX0NQVUlETEU9eQoj
IENPTkZJR19BUk1fUFNDSV9DUFVJRExFIGlzIG5vdCBzZXQKIyBlbmQgb2YgQVJNIENQVSBJZGxl
IERyaXZlcnMKIyBlbmQgb2YgQ1BVIElkbGUKCiMKIyBDUFUgRnJlcXVlbmN5IHNjYWxpbmcKIwpD
T05GSUdfQ1BVX0ZSRVE9eQpDT05GSUdfQ1BVX0ZSRVFfR09WX0FUVFJfU0VUPXkKQ09ORklHX0NQ
VV9GUkVRX0dPVl9DT01NT049eQpDT05GSUdfQ1BVX0ZSRVFfU1RBVD15CiMgQ09ORklHX0NQVV9G
UkVRX0RFRkFVTFRfR09WX1BFUkZPUk1BTkNFIGlzIG5vdCBzZXQKQ09ORklHX0NQVV9GUkVRX0RF
RkFVTFRfR09WX1BPV0VSU0FWRT15CiMgQ09ORklHX0NQVV9GUkVRX0RFRkFVTFRfR09WX1VTRVJT
UEFDRSBpcyBub3Qgc2V0CiMgQ09ORklHX0NQVV9GUkVRX0RFRkFVTFRfR09WX09OREVNQU5EIGlz
IG5vdCBzZXQKIyBDT05GSUdfQ1BVX0ZSRVFfREVGQVVMVF9HT1ZfQ09OU0VSVkFUSVZFIGlzIG5v
dCBzZXQKIyBDT05GSUdfQ1BVX0ZSRVFfREVGQVVMVF9HT1ZfU0NIRURVVElMIGlzIG5vdCBzZXQK
Q09ORklHX0NQVV9GUkVRX0dPVl9QRVJGT1JNQU5DRT15CkNPTkZJR19DUFVfRlJFUV9HT1ZfUE9X
RVJTQVZFPXkKQ09ORklHX0NQVV9GUkVRX0dPVl9VU0VSU1BBQ0U9eQpDT05GSUdfQ1BVX0ZSRVFf
R09WX09OREVNQU5EPXkKQ09ORklHX0NQVV9GUkVRX0dPVl9DT05TRVJWQVRJVkU9eQpDT05GSUdf
Q1BVX0ZSRVFfR09WX1NDSEVEVVRJTD15CgojCiMgQ1BVIGZyZXF1ZW5jeSBzY2FsaW5nIGRyaXZl
cnMKIwpDT05GSUdfQ1BVRlJFUV9EVD15CkNPTkZJR19DUFVGUkVRX0RUX1BMQVRERVY9eQpDT05G
SUdfQVJNX1JBU1BCRVJSWVBJX0NQVUZSRVE9eQojIGVuZCBvZiBDUFUgRnJlcXVlbmN5IHNjYWxp
bmcKIyBlbmQgb2YgQ1BVIFBvd2VyIE1hbmFnZW1lbnQKCkNPTkZJR19BUkNIX1NVUFBPUlRTX0FD
UEk9eQojIENPTkZJR19BQ1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfVklSVFVBTElaQVRJT04gaXMg
bm90IHNldAojIENPTkZJR19BUk02NF9DUllQVE8gaXMgbm90IHNldAoKIwojIEdlbmVyYWwgYXJj
aGl0ZWN0dXJlLWRlcGVuZGVudCBvcHRpb25zCiMKQ09ORklHX0NSQVNIX0NPUkU9eQpDT05GSUdf
S1BST0JFUz15CiMgQ09ORklHX0pVTVBfTEFCRUwgaXMgbm90IHNldApDT05GSUdfVVBST0JFUz15
CkNPTkZJR19IQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTPXkKQ09ORklHX0tSRVRQUk9C
RVM9eQpDT05GSUdfSEFWRV9LUFJPQkVTPXkKQ09ORklHX0hBVkVfS1JFVFBST0JFUz15CkNPTkZJ
R19IQVZFX0ZVTkNUSU9OX0VSUk9SX0lOSkVDVElPTj15CkNPTkZJR19IQVZFX05NST15CkNPTkZJ
R19UUkFDRV9JUlFGTEFHU19TVVBQT1JUPXkKQ09ORklHX1RSQUNFX0lSUUZMQUdTX05NSV9TVVBQ
T1JUPXkKQ09ORklHX0hBVkVfQVJDSF9UUkFDRUhPT0s9eQpDT05GSUdfSEFWRV9ETUFfQ09OVElH
VU9VUz15CkNPTkZJR19HRU5FUklDX1NNUF9JRExFX1RIUkVBRD15CkNPTkZJR19HRU5FUklDX0lE
TEVfUE9MTF9TRVRVUD15CkNPTkZJR19BUkNIX0hBU19GT1JUSUZZX1NPVVJDRT15CkNPTkZJR19B
UkNIX0hBU19LRUVQSU5JVFJEPXkKQ09ORklHX0FSQ0hfSEFTX1NFVF9NRU1PUlk9eQpDT05GSUdf
QVJDSF9IQVNfU0VUX0RJUkVDVF9NQVA9eQpDT05GSUdfSEFWRV9BUkNIX1RIUkVBRF9TVFJVQ1Rf
V0hJVEVMSVNUPXkKQ09ORklHX0FSQ0hfV0FOVFNfTk9fSU5TVFI9eQpDT05GSUdfSEFWRV9BU01f
TU9EVkVSU0lPTlM9eQpDT05GSUdfSEFWRV9SRUdTX0FORF9TVEFDS19BQ0NFU1NfQVBJPXkKQ09O
RklHX0hBVkVfUlNFUT15CkNPTkZJR19IQVZFX0ZVTkNUSU9OX0FSR19BQ0NFU1NfQVBJPXkKQ09O
RklHX0hBVkVfSFdfQlJFQUtQT0lOVD15CkNPTkZJR19IQVZFX1BFUkZfUkVHUz15CkNPTkZJR19I
QVZFX1BFUkZfVVNFUl9TVEFDS19EVU1QPXkKQ09ORklHX0hBVkVfQVJDSF9KVU1QX0xBQkVMPXkK
Q09ORklHX0hBVkVfQVJDSF9KVU1QX0xBQkVMX1JFTEFUSVZFPXkKQ09ORklHX01NVV9HQVRIRVJf
VEFCTEVfRlJFRT15CkNPTkZJR19NTVVfR0FUSEVSX1JDVV9UQUJMRV9GUkVFPXkKQ09ORklHX0FS
Q0hfSEFWRV9OTUlfU0FGRV9DTVBYQ0hHPXkKQ09ORklHX0hBVkVfQUxJR05FRF9TVFJVQ1RfUEFH
RT15CkNPTkZJR19IQVZFX0NNUFhDSEdfTE9DQUw9eQpDT05GSUdfSEFWRV9DTVBYQ0hHX0RPVUJM
RT15CkNPTkZJR19BUkNIX1dBTlRfQ09NUEFUX0lQQ19QQVJTRV9WRVJTSU9OPXkKQ09ORklHX0hB
VkVfQVJDSF9TRUNDT01QPXkKQ09ORklHX0hBVkVfQVJDSF9TRUNDT01QX0ZJTFRFUj15CkNPTkZJ
R19TRUNDT01QPXkKQ09ORklHX1NFQ0NPTVBfRklMVEVSPXkKIyBDT05GSUdfU0VDQ09NUF9DQUNI
RV9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0FSQ0hfU1RBQ0tMRUFLPXkKQ09ORklHX0hB
VkVfU1RBQ0tQUk9URUNUT1I9eQpDT05GSUdfU1RBQ0tQUk9URUNUT1I9eQpDT05GSUdfU1RBQ0tQ
Uk9URUNUT1JfU1RST05HPXkKQ09ORklHX0FSQ0hfU1VQUE9SVFNfTFRPX0NMQU5HPXkKQ09ORklH
X0FSQ0hfU1VQUE9SVFNfTFRPX0NMQU5HX1RISU49eQpDT05GSUdfTFRPX05PTkU9eQpDT05GSUdf
QVJDSF9TVVBQT1JUU19DRklfQ0xBTkc9eQpDT05GSUdfSEFWRV9DT05URVhUX1RSQUNLSU5HPXkK
Q09ORklHX0hBVkVfVklSVF9DUFVfQUNDT1VOVElOR19HRU49eQpDT05GSUdfSEFWRV9JUlFfVElN
RV9BQ0NPVU5USU5HPXkKQ09ORklHX0hBVkVfTU9WRV9QVUQ9eQpDT05GSUdfSEFWRV9NT1ZFX1BN
RD15CkNPTkZJR19IQVZFX0FSQ0hfVFJBTlNQQVJFTlRfSFVHRVBBR0U9eQpDT05GSUdfSEFWRV9B
UkNIX0hVR0VfVk1BUD15CkNPTkZJR19BUkNIX1dBTlRfSFVHRV9QTURfU0hBUkU9eQpDT05GSUdf
SEFWRV9NT0RfQVJDSF9TUEVDSUZJQz15CkNPTkZJR19NT0RVTEVTX1VTRV9FTEZfUkVMQT15CkNP
TkZJR19BUkNIX0hBU19FTEZfUkFORE9NSVpFPXkKQ09ORklHX0hBVkVfQVJDSF9NTUFQX1JORF9C
SVRTPXkKQ09ORklHX0FSQ0hfTU1BUF9STkRfQklUUz0xOApDT05GSUdfSEFWRV9BUkNIX01NQVBf
Uk5EX0NPTVBBVF9CSVRTPXkKQ09ORklHX0FSQ0hfTU1BUF9STkRfQ09NUEFUX0JJVFM9MTEKQ09O
RklHX0FSQ0hfV0FOVF9ERUZBVUxUX1RPUERPV05fTU1BUF9MQVlPVVQ9eQpDT05GSUdfQ0xPTkVf
QkFDS1dBUkRTPXkKQ09ORklHX09MRF9TSUdTVVNQRU5EMz15CkNPTkZJR19DT01QQVRfT0xEX1NJ
R0FDVElPTj15CkNPTkZJR19DT01QQVRfMzJCSVRfVElNRT15CkNPTkZJR19IQVZFX0FSQ0hfVk1B
UF9TVEFDSz15CkNPTkZJR19WTUFQX1NUQUNLPXkKQ09ORklHX0hBVkVfQVJDSF9SQU5ET01JWkVf
S1NUQUNLX09GRlNFVD15CiMgQ09ORklHX1JBTkRPTUlaRV9LU1RBQ0tfT0ZGU0VUX0RFRkFVTFQg
aXMgbm90IHNldApDT05GSUdfQVJDSF9IQVNfU1RSSUNUX0tFUk5FTF9SV1g9eQpDT05GSUdfU1RS
SUNUX0tFUk5FTF9SV1g9eQpDT05GSUdfQVJDSF9IQVNfU1RSSUNUX01PRFVMRV9SV1g9eQpDT05G
SUdfU1RSSUNUX01PRFVMRV9SV1g9eQpDT05GSUdfSEFWRV9BUkNIX0NPTVBJTEVSX0g9eQpDT05G
SUdfSEFWRV9BUkNIX1BSRUwzMl9SRUxPQ0FUSU9OUz15CkNPTkZJR19BUkNIX1VTRV9NRU1SRU1B
UF9QUk9UPXkKIyBDT05GSUdfTE9DS19FVkVOVF9DT1VOVFMgaXMgbm90IHNldApDT05GSUdfQVJD
SF9IQVNfUkVMUj15CkNPTkZJR19BUkNIX1dBTlRfTERfT1JQSEFOX1dBUk49eQpDT05GSUdfQVJD
SF9TVVBQT1JUU19ERUJVR19QQUdFQUxMT0M9eQoKIwojIEdDT1YtYmFzZWQga2VybmVsIHByb2Zp
bGluZwojCiMgQ09ORklHX0dDT1ZfS0VSTkVMIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfSEFTX0dD
T1ZfUFJPRklMRV9BTEw9eQojIGVuZCBvZiBHQ09WLWJhc2VkIGtlcm5lbCBwcm9maWxpbmcKCkNP
TkZJR19IQVZFX0dDQ19QTFVHSU5TPXkKQ09ORklHX0dDQ19QTFVHSU5TPXkKIyBDT05GSUdfR0ND
X1BMVUdJTl9DWUNfQ09NUExFWElUWSBpcyBub3Qgc2V0CiMgQ09ORklHX0dDQ19QTFVHSU5fTEFU
RU5UX0VOVFJPUFkgaXMgbm90IHNldAojIENPTkZJR19HQ0NfUExVR0lOX1JBTkRTVFJVQ1QgaXMg
bm90IHNldAojIGVuZCBvZiBHZW5lcmFsIGFyY2hpdGVjdHVyZS1kZXBlbmRlbnQgb3B0aW9ucwoK
Q09ORklHX1JUX01VVEVYRVM9eQpDT05GSUdfQkFTRV9TTUFMTD0wCkNPTkZJR19NT0RVTEVTPXkK
IyBDT05GSUdfTU9EVUxFX0ZPUkNFX0xPQUQgaXMgbm90IHNldApDT05GSUdfTU9EVUxFX1VOTE9B
RD15CiMgQ09ORklHX01PRFVMRV9GT1JDRV9VTkxPQUQgaXMgbm90IHNldAojIENPTkZJR19NT0RW
RVJTSU9OUyBpcyBub3Qgc2V0CiMgQ09ORklHX01PRFVMRV9TUkNWRVJTSU9OX0FMTCBpcyBub3Qg
c2V0CiMgQ09ORklHX01PRFVMRV9TSUcgaXMgbm90IHNldApDT05GSUdfTU9EVUxFX0NPTVBSRVNT
X05PTkU9eQojIENPTkZJR19NT0RVTEVfQ09NUFJFU1NfR1pJUCBpcyBub3Qgc2V0CiMgQ09ORklH
X01PRFVMRV9DT01QUkVTU19YWiBpcyBub3Qgc2V0CiMgQ09ORklHX01PRFVMRV9DT01QUkVTU19a
U1REIGlzIG5vdCBzZXQKIyBDT05GSUdfTU9EVUxFX0FMTE9XX01JU1NJTkdfTkFNRVNQQUNFX0lN
UE9SVFMgaXMgbm90IHNldApDT05GSUdfTU9EUFJPQkVfUEFUSD0iL3NiaW4vbW9kcHJvYmUiCiMg
Q09ORklHX1RSSU1fVU5VU0VEX0tTWU1TIGlzIG5vdCBzZXQKQ09ORklHX01PRFVMRVNfVFJFRV9M
T09LVVA9eQpDT05GSUdfQkxPQ0s9eQpDT05GSUdfQkxLX0RFVl9CU0dfQ09NTU9OPXkKIyBDT05G
SUdfQkxLX0RFVl9CU0dMSUIgaXMgbm90IHNldAojIENPTkZJR19CTEtfREVWX0lOVEVHUklUWSBp
cyBub3Qgc2V0CiMgQ09ORklHX0JMS19ERVZfWk9ORUQgaXMgbm90IHNldAojIENPTkZJR19CTEtf
REVWX1RIUk9UVExJTkcgaXMgbm90IHNldAojIENPTkZJR19CTEtfV0JUIGlzIG5vdCBzZXQKIyBD
T05GSUdfQkxLX0NHUk9VUF9JT0xBVEVOQ1kgaXMgbm90IHNldAojIENPTkZJR19CTEtfQ0dST1VQ
X0lPQ09TVCBpcyBub3Qgc2V0CiMgQ09ORklHX0JMS19DR1JPVVBfSU9QUklPIGlzIG5vdCBzZXQK
Q09ORklHX0JMS19ERUJVR19GUz15CiMgQ09ORklHX0JMS19TRURfT1BBTCBpcyBub3Qgc2V0CiMg
Q09ORklHX0JMS19JTkxJTkVfRU5DUllQVElPTiBpcyBub3Qgc2V0CgojCiMgUGFydGl0aW9uIFR5
cGVzCiMKIyBDT05GSUdfUEFSVElUSU9OX0FEVkFOQ0VEIGlzIG5vdCBzZXQKQ09ORklHX01TRE9T
X1BBUlRJVElPTj15CkNPTkZJR19FRklfUEFSVElUSU9OPXkKIyBlbmQgb2YgUGFydGl0aW9uIFR5
cGVzCgpDT05GSUdfQkxPQ0tfQ09NUEFUPXkKQ09ORklHX0JMS19NUV9QQ0k9eQpDT05GSUdfQkxL
X01RX1ZJUlRJTz15CkNPTkZJR19CTEtfUE09eQpDT05GSUdfQkxPQ0tfSE9MREVSX0RFUFJFQ0FU
RUQ9eQoKIwojIElPIFNjaGVkdWxlcnMKIwpDT05GSUdfTVFfSU9TQ0hFRF9ERUFETElORT15CkNP
TkZJR19NUV9JT1NDSEVEX0tZQkVSPXkKIyBDT05GSUdfSU9TQ0hFRF9CRlEgaXMgbm90IHNldAoj
IGVuZCBvZiBJTyBTY2hlZHVsZXJzCgpDT05GSUdfQVNOMT15CkNPTkZJR19VTklOTElORV9TUElO
X1VOTE9DSz15CkNPTkZJR19BUkNIX1NVUFBPUlRTX0FUT01JQ19STVc9eQpDT05GSUdfTVVURVhf
U1BJTl9PTl9PV05FUj15CkNPTkZJR19SV1NFTV9TUElOX09OX09XTkVSPXkKQ09ORklHX0xPQ0tf
U1BJTl9PTl9PV05FUj15CkNPTkZJR19BUkNIX1VTRV9RVUVVRURfU1BJTkxPQ0tTPXkKQ09ORklH
X1FVRVVFRF9TUElOTE9DS1M9eQpDT05GSUdfQVJDSF9VU0VfUVVFVUVEX1JXTE9DS1M9eQpDT05G
SUdfUVVFVUVEX1JXTE9DS1M9eQpDT05GSUdfQVJDSF9IQVNfTk9OX09WRVJMQVBQSU5HX0FERFJF
U1NfU1BBQ0U9eQpDT05GSUdfQVJDSF9IQVNfU1lTQ0FMTF9XUkFQUEVSPXkKQ09ORklHX0ZSRUVa
RVI9eQoKIwojIEV4ZWN1dGFibGUgZmlsZSBmb3JtYXRzCiMKQ09ORklHX0JJTkZNVF9FTEY9eQpD
T05GSUdfQ09NUEFUX0JJTkZNVF9FTEY9eQpDT05GSUdfQVJDSF9CSU5GTVRfRUxGX1NUQVRFPXkK
Q09ORklHX0FSQ0hfSEFWRV9FTEZfUFJPVD15CkNPTkZJR19BUkNIX1VTRV9HTlVfUFJPUEVSVFk9
eQpDT05GSUdfRUxGQ09SRT15CkNPTkZJR19DT1JFX0RVTVBfREVGQVVMVF9FTEZfSEVBREVSUz15
CkNPTkZJR19CSU5GTVRfU0NSSVBUPXkKQ09ORklHX0JJTkZNVF9NSVNDPW0KQ09ORklHX0NPUkVE
VU1QPXkKIyBlbmQgb2YgRXhlY3V0YWJsZSBmaWxlIGZvcm1hdHMKCiMKIyBNZW1vcnkgTWFuYWdl
bWVudCBvcHRpb25zCiMKQ09ORklHX1NQQVJTRU1FTT15CkNPTkZJR19TUEFSU0VNRU1fRVhUUkVN
RT15CkNPTkZJR19TUEFSU0VNRU1fVk1FTU1BUF9FTkFCTEU9eQpDT05GSUdfU1BBUlNFTUVNX1ZN
RU1NQVA9eQpDT05GSUdfSEFWRV9GQVNUX0dVUD15CkNPTkZJR19BUkNIX0tFRVBfTUVNQkxPQ0s9
eQpDT05GSUdfTUVNT1JZX0lTT0xBVElPTj15CkNPTkZJR19BUkNIX0VOQUJMRV9NRU1PUllfSE9U
UExVRz15CiMgQ09ORklHX01FTU9SWV9IT1RQTFVHIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfRU5B
QkxFX01FTU9SWV9IT1RSRU1PVkU9eQpDT05GSUdfU1BMSVRfUFRMT0NLX0NQVVM9NApDT05GSUdf
QVJDSF9FTkFCTEVfU1BMSVRfUE1EX1BUTE9DSz15CkNPTkZJR19DT01QQUNUSU9OPXkKIyBDT05G
SUdfUEFHRV9SRVBPUlRJTkcgaXMgbm90IHNldApDT05GSUdfTUlHUkFUSU9OPXkKQ09ORklHX0NP
TlRJR19BTExPQz15CkNPTkZJR19QSFlTX0FERFJfVF82NEJJVD15CkNPTkZJR19NTVVfTk9USUZJ
RVI9eQojIENPTkZJR19LU00gaXMgbm90IHNldApDT05GSUdfREVGQVVMVF9NTUFQX01JTl9BRERS
PTQwOTYKQ09ORklHX0FSQ0hfU1VQUE9SVFNfTUVNT1JZX0ZBSUxVUkU9eQojIENPTkZJR19NRU1P
UllfRkFJTFVSRSBpcyBub3Qgc2V0CiMgQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFIGlzIG5v
dCBzZXQKIyBDT05GSUdfQ0xFQU5DQUNIRSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZST05UU1dBUCBp
cyBub3Qgc2V0CkNPTkZJR19DTUE9eQojIENPTkZJR19DTUFfREVCVUcgaXMgbm90IHNldAojIENP
TkZJR19DTUFfREVCVUdGUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NNQV9TWVNGUyBpcyBub3Qgc2V0
CkNPTkZJR19DTUFfQVJFQVM9NwojIENPTkZJR19aUE9PTCBpcyBub3Qgc2V0CiMgQ09ORklHX1pT
TUFMTE9DIGlzIG5vdCBzZXQKQ09ORklHX0dFTkVSSUNfRUFSTFlfSU9SRU1BUD15CiMgQ09ORklH
X0RFRkVSUkVEX1NUUlVDVF9QQUdFX0lOSVQgaXMgbm90IHNldAojIENPTkZJR19JRExFX1BBR0Vf
VFJBQ0tJTkcgaXMgbm90IHNldApDT05GSUdfQVJDSF9IQVNfQ0FDSEVfTElORV9TSVpFPXkKQ09O
RklHX0FSQ0hfSEFTX1BURV9ERVZNQVA9eQpDT05GSUdfQVJDSF9IQVNfWk9ORV9ETUFfU0VUPXkK
Q09ORklHX1pPTkVfRE1BPXkKQ09ORklHX1pPTkVfRE1BMzI9eQpDT05GSUdfQVJDSF9VU0VTX0hJ
R0hfVk1BX0ZMQUdTPXkKIyBDT05GSUdfUEVSQ1BVX1NUQVRTIGlzIG5vdCBzZXQKIyBDT05GSUdf
R1VQX1RFU1QgaXMgbm90IHNldApDT05GSUdfQVJDSF9IQVNfUFRFX1NQRUNJQUw9eQpDT05GSUdf
U0VDUkVUTUVNPXkKCiMKIyBEYXRhIEFjY2VzcyBNb25pdG9yaW5nCiMKIyBDT05GSUdfREFNT04g
aXMgbm90IHNldAojIGVuZCBvZiBEYXRhIEFjY2VzcyBNb25pdG9yaW5nCiMgZW5kIG9mIE1lbW9y
eSBNYW5hZ2VtZW50IG9wdGlvbnMKCkNPTkZJR19ORVQ9eQpDT05GSUdfQ09NUEFUX05FVExJTktf
TUVTU0FHRVM9eQpDT05GSUdfTkVUX0lOR1JFU1M9eQpDT05GSUdfTkVUX0VHUkVTUz15CkNPTkZJ
R19TS0JfRVhURU5TSU9OUz15CgojCiMgTmV0d29ya2luZyBvcHRpb25zCiMKQ09ORklHX1BBQ0tF
VD15CiMgQ09ORklHX1BBQ0tFVF9ESUFHIGlzIG5vdCBzZXQKQ09ORklHX1VOSVg9eQpDT05GSUdf
VU5JWF9TQ009eQpDT05GSUdfQUZfVU5JWF9PT0I9eQojIENPTkZJR19VTklYX0RJQUcgaXMgbm90
IHNldAojIENPTkZJR19UTFMgaXMgbm90IHNldApDT05GSUdfWEZSTT15CkNPTkZJR19YRlJNX0FM
R089eQpDT05GSUdfWEZSTV9VU0VSPW0KIyBDT05GSUdfWEZSTV9JTlRFUkZBQ0UgaXMgbm90IHNl
dApDT05GSUdfWEZSTV9TVUJfUE9MSUNZPXkKQ09ORklHX1hGUk1fTUlHUkFURT15CiMgQ09ORklH
X1hGUk1fU1RBVElTVElDUyBpcyBub3Qgc2V0CkNPTkZJR19YRlJNX0FIPXkKQ09ORklHX1hGUk1f
RVNQPXkKQ09ORklHX1hGUk1fSVBDT01QPW0KQ09ORklHX05FVF9LRVk9bQpDT05GSUdfTkVUX0tF
WV9NSUdSQVRFPXkKIyBDT05GSUdfWERQX1NPQ0tFVFMgaXMgbm90IHNldApDT05GSUdfSU5FVD15
CkNPTkZJR19JUF9NVUxUSUNBU1Q9eQpDT05GSUdfSVBfQURWQU5DRURfUk9VVEVSPXkKIyBDT05G
SUdfSVBfRklCX1RSSUVfU1RBVFMgaXMgbm90IHNldApDT05GSUdfSVBfTVVMVElQTEVfVEFCTEVT
PXkKQ09ORklHX0lQX1JPVVRFX01VTFRJUEFUSD15CkNPTkZJR19JUF9ST1VURV9WRVJCT1NFPXkK
Q09ORklHX0lQX1JPVVRFX0NMQVNTSUQ9eQpDT05GSUdfSVBfUE5QPXkKQ09ORklHX0lQX1BOUF9E
SENQPXkKQ09ORklHX0lQX1BOUF9CT09UUD15CkNPTkZJR19JUF9QTlBfUkFSUD15CkNPTkZJR19O
RVRfSVBJUD1tCkNPTkZJR19ORVRfSVBHUkVfREVNVVg9bQpDT05GSUdfTkVUX0lQX1RVTk5FTD15
CkNPTkZJR19ORVRfSVBHUkU9bQpDT05GSUdfTkVUX0lQR1JFX0JST0FEQ0FTVD15CkNPTkZJR19J
UF9NUk9VVEVfQ09NTU9OPXkKQ09ORklHX0lQX01ST1VURT15CiMgQ09ORklHX0lQX01ST1VURV9N
VUxUSVBMRV9UQUJMRVMgaXMgbm90IHNldApDT05GSUdfSVBfUElNU01fVjE9eQpDT05GSUdfSVBf
UElNU01fVjI9eQpDT05GSUdfU1lOX0NPT0tJRVM9eQojIENPTkZJR19ORVRfSVBWVEkgaXMgbm90
IHNldApDT05GSUdfTkVUX1VEUF9UVU5ORUw9bQojIENPTkZJR19ORVRfRk9VIGlzIG5vdCBzZXQK
IyBDT05GSUdfTkVUX0ZPVV9JUF9UVU5ORUxTIGlzIG5vdCBzZXQKQ09ORklHX0lORVRfQUg9bQpD
T05GSUdfSU5FVF9FU1A9bQojIENPTkZJR19JTkVUX0VTUF9PRkZMT0FEIGlzIG5vdCBzZXQKIyBD
T05GSUdfSU5FVF9FU1BJTlRDUCBpcyBub3Qgc2V0CkNPTkZJR19JTkVUX0lQQ09NUD1tCkNPTkZJ
R19JTkVUX1hGUk1fVFVOTkVMPW0KQ09ORklHX0lORVRfVFVOTkVMPXkKQ09ORklHX0lORVRfRElB
Rz15CkNPTkZJR19JTkVUX1RDUF9ESUFHPXkKIyBDT05GSUdfSU5FVF9VRFBfRElBRyBpcyBub3Qg
c2V0CiMgQ09ORklHX0lORVRfUkFXX0RJQUcgaXMgbm90IHNldAojIENPTkZJR19JTkVUX0RJQUdf
REVTVFJPWSBpcyBub3Qgc2V0CiMgQ09ORklHX1RDUF9DT05HX0FEVkFOQ0VEIGlzIG5vdCBzZXQK
Q09ORklHX1RDUF9DT05HX0NVQklDPXkKQ09ORklHX0RFRkFVTFRfVENQX0NPTkc9ImN1YmljIgoj
IENPTkZJR19UQ1BfTUQ1U0lHIGlzIG5vdCBzZXQKQ09ORklHX0lQVjY9eQpDT05GSUdfSVBWNl9S
T1VURVJfUFJFRj15CiMgQ09ORklHX0lQVjZfUk9VVEVfSU5GTyBpcyBub3Qgc2V0CiMgQ09ORklH
X0lQVjZfT1BUSU1JU1RJQ19EQUQgaXMgbm90IHNldApDT05GSUdfSU5FVDZfQUg9eQpDT05GSUdf
SU5FVDZfRVNQPXkKIyBDT05GSUdfSU5FVDZfRVNQX09GRkxPQUQgaXMgbm90IHNldAojIENPTkZJ
R19JTkVUNl9FU1BJTlRDUCBpcyBub3Qgc2V0CkNPTkZJR19JTkVUNl9JUENPTVA9bQojIENPTkZJ
R19JUFY2X01JUDYgaXMgbm90IHNldAojIENPTkZJR19JUFY2X0lMQSBpcyBub3Qgc2V0CkNPTkZJ
R19JTkVUNl9YRlJNX1RVTk5FTD1tCkNPTkZJR19JTkVUNl9UVU5ORUw9bQojIENPTkZJR19JUFY2
X1ZUSSBpcyBub3Qgc2V0CkNPTkZJR19JUFY2X1NJVD15CiMgQ09ORklHX0lQVjZfU0lUXzZSRCBp
cyBub3Qgc2V0CkNPTkZJR19JUFY2X05ESVNDX05PREVUWVBFPXkKQ09ORklHX0lQVjZfVFVOTkVM
PW0KIyBDT05GSUdfSVBWNl9HUkUgaXMgbm90IHNldAojIENPTkZJR19JUFY2X01VTFRJUExFX1RB
QkxFUyBpcyBub3Qgc2V0CiMgQ09ORklHX0lQVjZfTVJPVVRFIGlzIG5vdCBzZXQKIyBDT05GSUdf
SVBWNl9TRUc2X0xXVFVOTkVMIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBWNl9TRUc2X0hNQUMgaXMg
bm90IHNldAojIENPTkZJR19JUFY2X1JQTF9MV1RVTk5FTCBpcyBub3Qgc2V0CiMgQ09ORklHX0lQ
VjZfSU9BTTZfTFdUVU5ORUwgaXMgbm90IHNldAojIENPTkZJR19ORVRMQUJFTCBpcyBub3Qgc2V0
CiMgQ09ORklHX01QVENQIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUV09SS19TRUNNQVJLIGlzIG5v
dCBzZXQKQ09ORklHX05FVF9QVFBfQ0xBU1NJRlk9eQojIENPTkZJR19ORVRXT1JLX1BIWV9USU1F
U1RBTVBJTkcgaXMgbm90IHNldApDT05GSUdfTkVURklMVEVSPXkKQ09ORklHX05FVEZJTFRFUl9B
RFZBTkNFRD15CkNPTkZJR19CUklER0VfTkVURklMVEVSPXkKCiMKIyBDb3JlIE5ldGZpbHRlciBD
b25maWd1cmF0aW9uCiMKQ09ORklHX05FVEZJTFRFUl9JTkdSRVNTPXkKQ09ORklHX05FVEZJTFRF
Ul9ORVRMSU5LPW0KQ09ORklHX05FVEZJTFRFUl9GQU1JTFlfQlJJREdFPXkKQ09ORklHX05FVEZJ
TFRFUl9GQU1JTFlfQVJQPXkKIyBDT05GSUdfTkVURklMVEVSX05FVExJTktfQUNDVCBpcyBub3Qg
c2V0CkNPTkZJR19ORVRGSUxURVJfTkVUTElOS19RVUVVRT1tCkNPTkZJR19ORVRGSUxURVJfTkVU
TElOS19MT0c9bQojIENPTkZJR19ORVRGSUxURVJfTkVUTElOS19PU0YgaXMgbm90IHNldApDT05G
SUdfTkZfQ09OTlRSQUNLPW0KQ09ORklHX05GX0xPR19TWVNMT0c9bQpDT05GSUdfTkVURklMVEVS
X0NPTk5DT1VOVD1tCkNPTkZJR19ORl9DT05OVFJBQ0tfTUFSSz15CiMgQ09ORklHX05GX0NPTk5U
UkFDS19aT05FUyBpcyBub3Qgc2V0CiMgQ09ORklHX05GX0NPTk5UUkFDS19QUk9DRlMgaXMgbm90
IHNldAojIENPTkZJR19ORl9DT05OVFJBQ0tfRVZFTlRTIGlzIG5vdCBzZXQKIyBDT05GSUdfTkZf
Q09OTlRSQUNLX1RJTUVPVVQgaXMgbm90IHNldAojIENPTkZJR19ORl9DT05OVFJBQ0tfVElNRVNU
QU1QIGlzIG5vdCBzZXQKIyBDT05GSUdfTkZfQ09OTlRSQUNLX0xBQkVMUyBpcyBub3Qgc2V0CkNP
TkZJR19ORl9DVF9QUk9UT19EQ0NQPXkKQ09ORklHX05GX0NUX1BST1RPX0dSRT15CkNPTkZJR19O
Rl9DVF9QUk9UT19TQ1RQPXkKQ09ORklHX05GX0NUX1BST1RPX1VEUExJVEU9eQpDT05GSUdfTkZf
Q09OTlRSQUNLX0FNQU5EQT1tCkNPTkZJR19ORl9DT05OVFJBQ0tfRlRQPW0KQ09ORklHX05GX0NP
Tk5UUkFDS19IMzIzPW0KQ09ORklHX05GX0NPTk5UUkFDS19JUkM9bQpDT05GSUdfTkZfQ09OTlRS
QUNLX0JST0FEQ0FTVD1tCkNPTkZJR19ORl9DT05OVFJBQ0tfTkVUQklPU19OUz1tCiMgQ09ORklH
X05GX0NPTk5UUkFDS19TTk1QIGlzIG5vdCBzZXQKQ09ORklHX05GX0NPTk5UUkFDS19QUFRQPW0K
Q09ORklHX05GX0NPTk5UUkFDS19TQU5FPW0KQ09ORklHX05GX0NPTk5UUkFDS19TSVA9bQpDT05G
SUdfTkZfQ09OTlRSQUNLX1RGVFA9bQpDT05GSUdfTkZfQ1RfTkVUTElOSz1tCiMgQ09ORklHX05F
VEZJTFRFUl9ORVRMSU5LX0dMVUVfQ1QgaXMgbm90IHNldApDT05GSUdfTkZfTkFUPW0KQ09ORklH
X05GX05BVF9BTUFOREE9bQpDT05GSUdfTkZfTkFUX0ZUUD1tCkNPTkZJR19ORl9OQVRfSVJDPW0K
Q09ORklHX05GX05BVF9TSVA9bQpDT05GSUdfTkZfTkFUX1RGVFA9bQpDT05GSUdfTkZfTkFUX1JF
RElSRUNUPXkKQ09ORklHX05GX05BVF9NQVNRVUVSQURFPXkKQ09ORklHX05FVEZJTFRFUl9TWU5Q
Uk9YWT1tCiMgQ09ORklHX05GX1RBQkxFUyBpcyBub3Qgc2V0CkNPTkZJR19ORVRGSUxURVJfWFRB
QkxFUz1tCkNPTkZJR19ORVRGSUxURVJfWFRBQkxFU19DT01QQVQ9eQoKIwojIFh0YWJsZXMgY29t
YmluZWQgbW9kdWxlcwojCkNPTkZJR19ORVRGSUxURVJfWFRfTUFSSz1tCkNPTkZJR19ORVRGSUxU
RVJfWFRfQ09OTk1BUks9bQoKIwojIFh0YWJsZXMgdGFyZ2V0cwojCiMgQ09ORklHX05FVEZJTFRF
Ul9YVF9UQVJHRVRfQ0hFQ0tTVU0gaXMgbm90IHNldApDT05GSUdfTkVURklMVEVSX1hUX1RBUkdF
VF9DTEFTU0lGWT1tCkNPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VUX0NPTk5NQVJLPW0KQ09ORklH
X05FVEZJTFRFUl9YVF9UQVJHRVRfQ1Q9bQpDT05GSUdfTkVURklMVEVSX1hUX1RBUkdFVF9EU0NQ
PW0KQ09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRfSEw9bQojIENPTkZJR19ORVRGSUxURVJfWFRf
VEFSR0VUX0hNQVJLIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVURklMVEVSX1hUX1RBUkdFVF9JRExF
VElNRVIgaXMgbm90IHNldApDT05GSUdfTkVURklMVEVSX1hUX1RBUkdFVF9MT0c9bQpDT05GSUdf
TkVURklMVEVSX1hUX1RBUkdFVF9NQVJLPW0KQ09ORklHX05FVEZJTFRFUl9YVF9OQVQ9bQpDT05G
SUdfTkVURklMVEVSX1hUX1RBUkdFVF9ORVRNQVA9bQpDT05GSUdfTkVURklMVEVSX1hUX1RBUkdF
VF9ORkxPRz1tCkNPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VUX05GUVVFVUU9bQpDT05GSUdfTkVU
RklMVEVSX1hUX1RBUkdFVF9OT1RSQUNLPW0KIyBDT05GSUdfTkVURklMVEVSX1hUX1RBUkdFVF9S
QVRFRVNUIGlzIG5vdCBzZXQKQ09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRfUkVESVJFQ1Q9bQpD
T05GSUdfTkVURklMVEVSX1hUX1RBUkdFVF9NQVNRVUVSQURFPW0KIyBDT05GSUdfTkVURklMVEVS
X1hUX1RBUkdFVF9URUUgaXMgbm90IHNldAojIENPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VUX1RQ
Uk9YWSBpcyBub3Qgc2V0CkNPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VUX1RSQUNFPW0KQ09ORklH
X05FVEZJTFRFUl9YVF9UQVJHRVRfVENQTVNTPW0KIyBDT05GSUdfTkVURklMVEVSX1hUX1RBUkdF
VF9UQ1BPUFRTVFJJUCBpcyBub3Qgc2V0CgojCiMgWHRhYmxlcyBtYXRjaGVzCiMKIyBDT05GSUdf
TkVURklMVEVSX1hUX01BVENIX0FERFJUWVBFIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVURklMVEVS
X1hUX01BVENIX0JQRiBpcyBub3Qgc2V0CiMgQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9DR1JP
VVAgaXMgbm90IHNldAojIENPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfQ0xVU1RFUiBpcyBub3Qg
c2V0CkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfQ09NTUVOVD1tCkNPTkZJR19ORVRGSUxURVJf
WFRfTUFUQ0hfQ09OTkJZVEVTPW0KIyBDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0NPTk5MQUJF
TCBpcyBub3Qgc2V0CkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfQ09OTkxJTUlUPW0KQ09ORklH
X05FVEZJTFRFUl9YVF9NQVRDSF9DT05OTUFSSz1tCkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hf
Q09OTlRSQUNLPW0KIyBDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0NQVSBpcyBub3Qgc2V0CkNP
TkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfRENDUD1tCiMgQ09ORklHX05FVEZJTFRFUl9YVF9NQVRD
SF9ERVZHUk9VUCBpcyBub3Qgc2V0CkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfRFNDUD1tCkNP
TkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfRUNOPW0KQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9F
U1A9bQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0hBU0hMSU1JVD1tCkNPTkZJR19ORVRGSUxU
RVJfWFRfTUFUQ0hfSEVMUEVSPW0KQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9ITD1tCiMgQ09O
RklHX05FVEZJTFRFUl9YVF9NQVRDSF9JUENPTVAgaXMgbm90IHNldAojIENPTkZJR19ORVRGSUxU
RVJfWFRfTUFUQ0hfSVBSQU5HRSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVEZJTFRFUl9YVF9NQVRD
SF9MMlRQIGlzIG5vdCBzZXQKQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9MRU5HVEg9bQpDT05G
SUdfTkVURklMVEVSX1hUX01BVENIX0xJTUlUPW0KQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9N
QUM9bQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX01BUks9bQpDT05GSUdfTkVURklMVEVSX1hU
X01BVENIX01VTFRJUE9SVD1tCiMgQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9ORkFDQ1QgaXMg
bm90IHNldAojIENPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfT1NGIGlzIG5vdCBzZXQKIyBDT05G
SUdfTkVURklMVEVSX1hUX01BVENIX09XTkVSIGlzIG5vdCBzZXQKQ09ORklHX05FVEZJTFRFUl9Y
VF9NQVRDSF9QT0xJQ1k9bQojIENPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfUEhZU0RFViBpcyBu
b3Qgc2V0CkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfUEtUVFlQRT1tCkNPTkZJR19ORVRGSUxU
RVJfWFRfTUFUQ0hfUVVPVEE9bQojIENPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfUkFURUVTVCBp
cyBub3Qgc2V0CkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfUkVBTE09bQojIENPTkZJR19ORVRG
SUxURVJfWFRfTUFUQ0hfUkVDRU5UIGlzIG5vdCBzZXQKQ09ORklHX05FVEZJTFRFUl9YVF9NQVRD
SF9TQ1RQPW0KIyBDT05GSUdfTkVURklMVEVSX1hUX01BVENIX1NPQ0tFVCBpcyBub3Qgc2V0CkNP
TkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfU1RBVEU9bQpDT05GSUdfTkVURklMVEVSX1hUX01BVENI
X1NUQVRJU1RJQz1tCkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfU1RSSU5HPW0KQ09ORklHX05F
VEZJTFRFUl9YVF9NQVRDSF9UQ1BNU1M9bQojIENPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfVElN
RSBpcyBub3Qgc2V0CkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfVTMyPW0KIyBlbmQgb2YgQ29y
ZSBOZXRmaWx0ZXIgQ29uZmlndXJhdGlvbgoKIyBDT05GSUdfSVBfU0VUIGlzIG5vdCBzZXQKIyBD
T05GSUdfSVBfVlMgaXMgbm90IHNldAoKIwojIElQOiBOZXRmaWx0ZXIgQ29uZmlndXJhdGlvbgoj
CkNPTkZJR19ORl9ERUZSQUdfSVBWND1tCiMgQ09ORklHX05GX1NPQ0tFVF9JUFY0IGlzIG5vdCBz
ZXQKIyBDT05GSUdfTkZfVFBST1hZX0lQVjQgaXMgbm90IHNldAojIENPTkZJR19ORl9EVVBfSVBW
NCBpcyBub3Qgc2V0CiMgQ09ORklHX05GX0xPR19BUlAgaXMgbm90IHNldAojIENPTkZJR19ORl9M
T0dfSVBWNCBpcyBub3Qgc2V0CkNPTkZJR19ORl9SRUpFQ1RfSVBWND1tCkNPTkZJR19ORl9OQVRf
UFBUUD1tCkNPTkZJR19ORl9OQVRfSDMyMz1tCkNPTkZJR19JUF9ORl9JUFRBQkxFUz1tCkNPTkZJ
R19JUF9ORl9NQVRDSF9BSD1tCkNPTkZJR19JUF9ORl9NQVRDSF9FQ049bQpDT05GSUdfSVBfTkZf
TUFUQ0hfUlBGSUxURVI9bQpDT05GSUdfSVBfTkZfTUFUQ0hfVFRMPW0KQ09ORklHX0lQX05GX0ZJ
TFRFUj1tCkNPTkZJR19JUF9ORl9UQVJHRVRfUkVKRUNUPW0KQ09ORklHX0lQX05GX1RBUkdFVF9T
WU5QUk9YWT1tCkNPTkZJR19JUF9ORl9OQVQ9bQpDT05GSUdfSVBfTkZfVEFSR0VUX01BU1FVRVJB
REU9bQpDT05GSUdfSVBfTkZfVEFSR0VUX05FVE1BUD1tCkNPTkZJR19JUF9ORl9UQVJHRVRfUkVE
SVJFQ1Q9bQpDT05GSUdfSVBfTkZfTUFOR0xFPW0KQ09ORklHX0lQX05GX1RBUkdFVF9DTFVTVEVS
SVA9bQpDT05GSUdfSVBfTkZfVEFSR0VUX0VDTj1tCkNPTkZJR19JUF9ORl9UQVJHRVRfVFRMPW0K
Q09ORklHX0lQX05GX1JBVz1tCkNPTkZJR19JUF9ORl9TRUNVUklUWT1tCkNPTkZJR19JUF9ORl9B
UlBUQUJMRVM9bQpDT05GSUdfSVBfTkZfQVJQRklMVEVSPW0KQ09ORklHX0lQX05GX0FSUF9NQU5H
TEU9bQojIGVuZCBvZiBJUDogTmV0ZmlsdGVyIENvbmZpZ3VyYXRpb24KCiMKIyBJUHY2OiBOZXRm
aWx0ZXIgQ29uZmlndXJhdGlvbgojCiMgQ09ORklHX05GX1NPQ0tFVF9JUFY2IGlzIG5vdCBzZXQK
IyBDT05GSUdfTkZfVFBST1hZX0lQVjYgaXMgbm90IHNldAojIENPTkZJR19ORl9EVVBfSVBWNiBp
cyBub3Qgc2V0CiMgQ09ORklHX05GX1JFSkVDVF9JUFY2IGlzIG5vdCBzZXQKQ09ORklHX05GX0xP
R19JUFY2PW0KQ09ORklHX0lQNl9ORl9JUFRBQkxFUz1tCiMgQ09ORklHX0lQNl9ORl9NQVRDSF9B
SCBpcyBub3Qgc2V0CkNPTkZJR19JUDZfTkZfTUFUQ0hfRVVJNjQ9bQpDT05GSUdfSVA2X05GX01B
VENIX0ZSQUc9bQpDT05GSUdfSVA2X05GX01BVENIX09QVFM9bQpDT05GSUdfSVA2X05GX01BVENI
X0hMPW0KQ09ORklHX0lQNl9ORl9NQVRDSF9JUFY2SEVBREVSPW0KIyBDT05GSUdfSVA2X05GX01B
VENIX01IIGlzIG5vdCBzZXQKIyBDT05GSUdfSVA2X05GX01BVENIX1JQRklMVEVSIGlzIG5vdCBz
ZXQKQ09ORklHX0lQNl9ORl9NQVRDSF9SVD1tCiMgQ09ORklHX0lQNl9ORl9NQVRDSF9TUkggaXMg
bm90IHNldAojIENPTkZJR19JUDZfTkZfVEFSR0VUX0hMIGlzIG5vdCBzZXQKQ09ORklHX0lQNl9O
Rl9GSUxURVI9bQojIENPTkZJR19JUDZfTkZfVEFSR0VUX1JFSkVDVCBpcyBub3Qgc2V0CiMgQ09O
RklHX0lQNl9ORl9UQVJHRVRfU1lOUFJPWFkgaXMgbm90IHNldApDT05GSUdfSVA2X05GX01BTkdM
RT1tCkNPTkZJR19JUDZfTkZfUkFXPW0KIyBDT05GSUdfSVA2X05GX1NFQ1VSSVRZIGlzIG5vdCBz
ZXQKQ09ORklHX0lQNl9ORl9OQVQ9bQojIENPTkZJR19JUDZfTkZfVEFSR0VUX01BU1FVRVJBREUg
aXMgbm90IHNldAojIENPTkZJR19JUDZfTkZfVEFSR0VUX05QVCBpcyBub3Qgc2V0CiMgZW5kIG9m
IElQdjY6IE5ldGZpbHRlciBDb25maWd1cmF0aW9uCgpDT05GSUdfTkZfREVGUkFHX0lQVjY9bQoj
IENPTkZJR19ORl9DT05OVFJBQ0tfQlJJREdFIGlzIG5vdCBzZXQKQ09ORklHX0JSSURHRV9ORl9F
QlRBQkxFUz1tCkNPTkZJR19CUklER0VfRUJUX0JST1VURT1tCkNPTkZJR19CUklER0VfRUJUX1Rf
RklMVEVSPW0KQ09ORklHX0JSSURHRV9FQlRfVF9OQVQ9bQpDT05GSUdfQlJJREdFX0VCVF84MDJf
Mz1tCkNPTkZJR19CUklER0VfRUJUX0FNT05HPW0KQ09ORklHX0JSSURHRV9FQlRfQVJQPW0KQ09O
RklHX0JSSURHRV9FQlRfSVA9bQpDT05GSUdfQlJJREdFX0VCVF9JUDY9bQpDT05GSUdfQlJJREdF
X0VCVF9MSU1JVD1tCkNPTkZJR19CUklER0VfRUJUX01BUks9bQpDT05GSUdfQlJJREdFX0VCVF9Q
S1RUWVBFPW0KQ09ORklHX0JSSURHRV9FQlRfU1RQPW0KQ09ORklHX0JSSURHRV9FQlRfVkxBTj1t
CkNPTkZJR19CUklER0VfRUJUX0FSUFJFUExZPW0KQ09ORklHX0JSSURHRV9FQlRfRE5BVD1tCkNP
TkZJR19CUklER0VfRUJUX01BUktfVD1tCkNPTkZJR19CUklER0VfRUJUX1JFRElSRUNUPW0KQ09O
RklHX0JSSURHRV9FQlRfU05BVD1tCkNPTkZJR19CUklER0VfRUJUX0xPRz1tCkNPTkZJR19CUklE
R0VfRUJUX05GTE9HPW0KIyBDT05GSUdfQlBGSUxURVIgaXMgbm90IHNldApDT05GSUdfSVBfU0NU
UD1tCiMgQ09ORklHX1NDVFBfREJHX09CSkNOVCBpcyBub3Qgc2V0CkNPTkZJR19TQ1RQX0RFRkFV
TFRfQ09PS0lFX0hNQUNfTUQ1PXkKIyBDT05GSUdfU0NUUF9ERUZBVUxUX0NPT0tJRV9ITUFDX1NI
QTEgaXMgbm90IHNldAojIENPTkZJR19TQ1RQX0RFRkFVTFRfQ09PS0lFX0hNQUNfTk9ORSBpcyBu
b3Qgc2V0CkNPTkZJR19TQ1RQX0NPT0tJRV9ITUFDX01ENT15CiMgQ09ORklHX1NDVFBfQ09PS0lF
X0hNQUNfU0hBMSBpcyBub3Qgc2V0CkNPTkZJR19JTkVUX1NDVFBfRElBRz1tCiMgQ09ORklHX1JE
UyBpcyBub3Qgc2V0CkNPTkZJR19USVBDPW0KQ09ORklHX1RJUENfTUVESUFfVURQPXkKQ09ORklH
X1RJUENfQ1JZUFRPPXkKQ09ORklHX1RJUENfRElBRz1tCiMgQ09ORklHX0FUTSBpcyBub3Qgc2V0
CiMgQ09ORklHX0wyVFAgaXMgbm90IHNldApDT05GSUdfU1RQPXkKQ09ORklHX0JSSURHRT15CkNP
TkZJR19CUklER0VfSUdNUF9TTk9PUElORz15CiMgQ09ORklHX0JSSURHRV9WTEFOX0ZJTFRFUklO
RyBpcyBub3Qgc2V0CiMgQ09ORklHX0JSSURHRV9NUlAgaXMgbm90IHNldAojIENPTkZJR19CUklE
R0VfQ0ZNIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0RTQSBpcyBub3Qgc2V0CkNPTkZJR19WTEFO
XzgwMjFRPW0KIyBDT05GSUdfVkxBTl84MDIxUV9HVlJQIGlzIG5vdCBzZXQKIyBDT05GSUdfVkxB
Tl84MDIxUV9NVlJQIGlzIG5vdCBzZXQKIyBDT05GSUdfREVDTkVUIGlzIG5vdCBzZXQKQ09ORklH
X0xMQz15CiMgQ09ORklHX0xMQzIgaXMgbm90IHNldAojIENPTkZJR19BVEFMSyBpcyBub3Qgc2V0
CiMgQ09ORklHX1gyNSBpcyBub3Qgc2V0CiMgQ09ORklHX0xBUEIgaXMgbm90IHNldAojIENPTkZJ
R19QSE9ORVQgaXMgbm90IHNldApDT05GSUdfNkxPV1BBTj1tCiMgQ09ORklHXzZMT1dQQU5fREVC
VUdGUyBpcyBub3Qgc2V0CkNPTkZJR182TE9XUEFOX05IQz1tCkNPTkZJR182TE9XUEFOX05IQ19E
RVNUPW0KQ09ORklHXzZMT1dQQU5fTkhDX0ZSQUdNRU5UPW0KQ09ORklHXzZMT1dQQU5fTkhDX0hP
UD1tCkNPTkZJR182TE9XUEFOX05IQ19JUFY2PW0KQ09ORklHXzZMT1dQQU5fTkhDX01PQklMSVRZ
PW0KQ09ORklHXzZMT1dQQU5fTkhDX1JPVVRJTkc9bQpDT05GSUdfNkxPV1BBTl9OSENfVURQPW0K
IyBDT05GSUdfNkxPV1BBTl9HSENfRVhUX0hEUl9IT1AgaXMgbm90IHNldAojIENPTkZJR182TE9X
UEFOX0dIQ19VRFAgaXMgbm90IHNldAojIENPTkZJR182TE9XUEFOX0dIQ19JQ01QVjYgaXMgbm90
IHNldAojIENPTkZJR182TE9XUEFOX0dIQ19FWFRfSERSX0RFU1QgaXMgbm90IHNldAojIENPTkZJ
R182TE9XUEFOX0dIQ19FWFRfSERSX0ZSQUcgaXMgbm90IHNldAojIENPTkZJR182TE9XUEFOX0dI
Q19FWFRfSERSX1JPVVRFIGlzIG5vdCBzZXQKIyBDT05GSUdfSUVFRTgwMjE1NCBpcyBub3Qgc2V0
CkNPTkZJR19ORVRfU0NIRUQ9eQoKIwojIFF1ZXVlaW5nL1NjaGVkdWxpbmcKIwpDT05GSUdfTkVU
X1NDSF9DQlE9bQpDT05GSUdfTkVUX1NDSF9IVEI9bQpDT05GSUdfTkVUX1NDSF9IRlNDPW0KQ09O
RklHX05FVF9TQ0hfUFJJTz1tCiMgQ09ORklHX05FVF9TQ0hfTVVMVElRIGlzIG5vdCBzZXQKQ09O
RklHX05FVF9TQ0hfUkVEPW0KIyBDT05GSUdfTkVUX1NDSF9TRkIgaXMgbm90IHNldApDT05GSUdf
TkVUX1NDSF9TRlE9bQpDT05GSUdfTkVUX1NDSF9URVFMPW0KQ09ORklHX05FVF9TQ0hfVEJGPW0K
IyBDT05GSUdfTkVUX1NDSF9DQlMgaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX0VURiBpcyBu
b3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfVEFQUklPIGlzIG5vdCBzZXQKQ09ORklHX05FVF9TQ0hf
R1JFRD1tCkNPTkZJR19ORVRfU0NIX0RTTUFSSz1tCkNPTkZJR19ORVRfU0NIX05FVEVNPW0KIyBD
T05GSUdfTkVUX1NDSF9EUlIgaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX01RUFJJTyBpcyBu
b3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfU0tCUFJJTyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9T
Q0hfQ0hPS0UgaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX1FGUSBpcyBub3Qgc2V0CkNPTkZJ
R19ORVRfU0NIX0NPREVMPW0KQ09ORklHX05FVF9TQ0hfRlFfQ09ERUw9bQojIENPTkZJR19ORVRf
U0NIX0NBS0UgaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX0ZRIGlzIG5vdCBzZXQKIyBDT05G
SUdfTkVUX1NDSF9ISEYgaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX1BJRSBpcyBub3Qgc2V0
CkNPTkZJR19ORVRfU0NIX0lOR1JFU1M9bQojIENPTkZJR19ORVRfU0NIX1BMVUcgaXMgbm90IHNl
dAojIENPTkZJR19ORVRfU0NIX0VUUyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfREVGQVVM
VCBpcyBub3Qgc2V0CgojCiMgQ2xhc3NpZmljYXRpb24KIwpDT05GSUdfTkVUX0NMUz15CkNPTkZJ
R19ORVRfQ0xTX0JBU0lDPXkKIyBDT05GSUdfTkVUX0NMU19UQ0lOREVYIGlzIG5vdCBzZXQKIyBD
T05GSUdfTkVUX0NMU19ST1VURTQgaXMgbm90IHNldAojIENPTkZJR19ORVRfQ0xTX0ZXIGlzIG5v
dCBzZXQKQ09ORklHX05FVF9DTFNfVTMyPXkKIyBDT05GSUdfQ0xTX1UzMl9QRVJGIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQ0xTX1UzMl9NQVJLIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0NMU19SU1ZQ
IGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0NMU19SU1ZQNiBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VF9DTFNfRkxPVyBpcyBub3Qgc2V0CkNPTkZJR19ORVRfQ0xTX0NHUk9VUD15CiMgQ09ORklHX05F
VF9DTFNfQlBGIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0NMU19GTE9XRVIgaXMgbm90IHNldAoj
IENPTkZJR19ORVRfQ0xTX01BVENIQUxMIGlzIG5vdCBzZXQKQ09ORklHX05FVF9FTUFUQ0g9eQpD
T05GSUdfTkVUX0VNQVRDSF9TVEFDSz0zMgojIENPTkZJR19ORVRfRU1BVENIX0NNUCBpcyBub3Qg
c2V0CiMgQ09ORklHX05FVF9FTUFUQ0hfTkJZVEUgaXMgbm90IHNldAojIENPTkZJR19ORVRfRU1B
VENIX1UzMiBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9FTUFUQ0hfTUVUQSBpcyBub3Qgc2V0CiMg
Q09ORklHX05FVF9FTUFUQ0hfVEVYVCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9FTUFUQ0hfQ0FO
SUQgaXMgbm90IHNldAojIENPTkZJR19ORVRfRU1BVENIX0lQVCBpcyBub3Qgc2V0CkNPTkZJR19O
RVRfQ0xTX0FDVD15CiMgQ09ORklHX05FVF9BQ1RfUE9MSUNFIGlzIG5vdCBzZXQKIyBDT05GSUdf
TkVUX0FDVF9HQUNUIGlzIG5vdCBzZXQKQ09ORklHX05FVF9BQ1RfTUlSUkVEPW0KIyBDT05GSUdf
TkVUX0FDVF9TQU1QTEUgaXMgbm90IHNldAojIENPTkZJR19ORVRfQUNUX0lQVCBpcyBub3Qgc2V0
CiMgQ09ORklHX05FVF9BQ1RfTkFUIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0FDVF9QRURJVCBp
cyBub3Qgc2V0CiMgQ09ORklHX05FVF9BQ1RfU0lNUCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfQUNU
X1NLQkVESVQ9bQojIENPTkZJR19ORVRfQUNUX0NTVU0gaXMgbm90IHNldAojIENPTkZJR19ORVRf
QUNUX01QTFMgaXMgbm90IHNldAojIENPTkZJR19ORVRfQUNUX1ZMQU4gaXMgbm90IHNldAojIENP
TkZJR19ORVRfQUNUX0JQRiBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9BQ1RfQ09OTk1BUksgaXMg
bm90IHNldAojIENPTkZJR19ORVRfQUNUX0NUSU5GTyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9B
Q1RfU0tCTU9EIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0FDVF9JRkUgaXMgbm90IHNldAojIENP
TkZJR19ORVRfQUNUX1RVTk5FTF9LRVkgaXMgbm90IHNldAojIENPTkZJR19ORVRfQUNUX0dBVEUg
aXMgbm90IHNldAojIENPTkZJR19ORVRfVENfU0tCX0VYVCBpcyBub3Qgc2V0CkNPTkZJR19ORVRf
U0NIX0ZJRk89eQojIENPTkZJR19EQ0IgaXMgbm90IHNldApDT05GSUdfRE5TX1JFU09MVkVSPXkK
IyBDT05GSUdfQkFUTUFOX0FEViBpcyBub3Qgc2V0CiMgQ09ORklHX09QRU5WU1dJVENIIGlzIG5v
dCBzZXQKIyBDT05GSUdfVlNPQ0tFVFMgaXMgbm90IHNldAojIENPTkZJR19ORVRMSU5LX0RJQUcg
aXMgbm90IHNldAojIENPTkZJR19NUExTIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX05TSCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0hTUiBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TV0lUQ0hERVYgaXMg
bm90IHNldAojIENPTkZJR19ORVRfTDNfTUFTVEVSX0RFViBpcyBub3Qgc2V0CiMgQ09ORklHX1FS
VFIgaXMgbm90IHNldAojIENPTkZJR19ORVRfTkNTSSBpcyBub3Qgc2V0CkNPTkZJR19QQ1BVX0RF
Vl9SRUZDTlQ9eQpDT05GSUdfUlBTPXkKQ09ORklHX1JGU19BQ0NFTD15CkNPTkZJR19TT0NLX1JY
X1FVRVVFX01BUFBJTkc9eQpDT05GSUdfWFBTPXkKQ09ORklHX0NHUk9VUF9ORVRfUFJJTz15CkNP
TkZJR19DR1JPVVBfTkVUX0NMQVNTSUQ9eQpDT05GSUdfTkVUX1JYX0JVU1lfUE9MTD15CkNPTkZJ
R19CUUw9eQojIENPTkZJR19CUEZfU1RSRUFNX1BBUlNFUiBpcyBub3Qgc2V0CkNPTkZJR19ORVRf
RkxPV19MSU1JVD15CgojCiMgTmV0d29yayB0ZXN0aW5nCiMKQ09ORklHX05FVF9QS1RHRU49bQoj
IENPTkZJR19ORVRfRFJPUF9NT05JVE9SIGlzIG5vdCBzZXQKIyBlbmQgb2YgTmV0d29yayB0ZXN0
aW5nCiMgZW5kIG9mIE5ldHdvcmtpbmcgb3B0aW9ucwoKIyBDT05GSUdfSEFNUkFESU8gaXMgbm90
IHNldApDT05GSUdfQ0FOPW0KQ09ORklHX0NBTl9SQVc9bQpDT05GSUdfQ0FOX0JDTT1tCkNPTkZJ
R19DQU5fR1c9bQpDT05GSUdfQ0FOX0oxOTM5PW0KIyBDT05GSUdfQ0FOX0lTT1RQIGlzIG5vdCBz
ZXQKCiMKIyBDQU4gRGV2aWNlIERyaXZlcnMKIwojIENPTkZJR19DQU5fVkNBTiBpcyBub3Qgc2V0
CiMgQ09ORklHX0NBTl9WWENBTiBpcyBub3Qgc2V0CiMgQ09ORklHX0NBTl9TTENBTiBpcyBub3Qg
c2V0CkNPTkZJR19DQU5fREVWPW0KQ09ORklHX0NBTl9DQUxDX0JJVFRJTUlORz15CiMgQ09ORklH
X0NBTl9GTEVYQ0FOIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0FOX0dSQ0FOIGlzIG5vdCBzZXQKIyBD
T05GSUdfQ0FOX0tWQVNFUl9QQ0lFRkQgaXMgbm90IHNldAojIENPTkZJR19DQU5fWElMSU5YQ0FO
IGlzIG5vdCBzZXQKIyBDT05GSUdfQ0FOX0NfQ0FOIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0FOX0ND
NzcwIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0FOX0lGSV9DQU5GRCBpcyBub3Qgc2V0CiMgQ09ORklH
X0NBTl9NX0NBTiBpcyBub3Qgc2V0CiMgQ09ORklHX0NBTl9QRUFLX1BDSUVGRCBpcyBub3Qgc2V0
CiMgQ09ORklHX0NBTl9TSkExMDAwIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0FOX1NPRlRJTkcgaXMg
bm90IHNldAoKIwojIENBTiBTUEkgaW50ZXJmYWNlcwojCiMgQ09ORklHX0NBTl9ISTMxMVggaXMg
bm90IHNldAojIENPTkZJR19DQU5fTUNQMjUxWCBpcyBub3Qgc2V0CiMgQ09ORklHX0NBTl9NQ1Ay
NTFYRkQgaXMgbm90IHNldAojIGVuZCBvZiBDQU4gU1BJIGludGVyZmFjZXMKCiMKIyBDQU4gVVNC
IGludGVyZmFjZXMKIwojIENPTkZJR19DQU5fOERFVl9VU0IgaXMgbm90IHNldAojIENPTkZJR19D
QU5fRU1TX1VTQiBpcyBub3Qgc2V0CiMgQ09ORklHX0NBTl9FU0RfVVNCMiBpcyBub3Qgc2V0CiMg
Q09ORklHX0NBTl9FVEFTX0VTNThYIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0FOX0dTX1VTQiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NBTl9LVkFTRVJfVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0FOX01D
QkFfVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0FOX1BFQUtfVVNCIGlzIG5vdCBzZXQKIyBDT05G
SUdfQ0FOX1VDQU4gaXMgbm90IHNldAojIGVuZCBvZiBDQU4gVVNCIGludGVyZmFjZXMKCiMgQ09O
RklHX0NBTl9ERUJVR19ERVZJQ0VTIGlzIG5vdCBzZXQKIyBlbmQgb2YgQ0FOIERldmljZSBEcml2
ZXJzCgpDT05GSUdfQlQ9eQpDT05GSUdfQlRfQlJFRFI9eQpDT05GSUdfQlRfUkZDT01NPW0KQ09O
RklHX0JUX1JGQ09NTV9UVFk9eQpDT05GSUdfQlRfQk5FUD1tCkNPTkZJR19CVF9CTkVQX01DX0ZJ
TFRFUj15CkNPTkZJR19CVF9CTkVQX1BST1RPX0ZJTFRFUj15CkNPTkZJR19CVF9DTVRQPW0KQ09O
RklHX0JUX0hJRFA9bQojIENPTkZJR19CVF9IUyBpcyBub3Qgc2V0CkNPTkZJR19CVF9MRT15CkNP
TkZJR19CVF82TE9XUEFOPW0KIyBDT05GSUdfQlRfTEVEUyBpcyBub3Qgc2V0CiMgQ09ORklHX0JU
X01TRlRFWFQgaXMgbm90IHNldAojIENPTkZJR19CVF9BT1NQRVhUIGlzIG5vdCBzZXQKQ09ORklH
X0JUX0RFQlVHRlM9eQojIENPTkZJR19CVF9TRUxGVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX0JU
X0ZFQVRVUkVfREVCVUcgaXMgbm90IHNldAoKIwojIEJsdWV0b290aCBkZXZpY2UgZHJpdmVycwoj
CkNPTkZJR19CVF9JTlRFTD1tCkNPTkZJR19CVF9CQ009bQpDT05GSUdfQlRfUlRMPW0KQ09ORklH
X0JUX0hDSUJUVVNCPW0KIyBDT05GSUdfQlRfSENJQlRVU0JfQVVUT1NVU1BFTkQgaXMgbm90IHNl
dApDT05GSUdfQlRfSENJQlRVU0JfQkNNPXkKIyBDT05GSUdfQlRfSENJQlRVU0JfTVRLIGlzIG5v
dCBzZXQKQ09ORklHX0JUX0hDSUJUVVNCX1JUTD15CiMgQ09ORklHX0JUX0hDSUJUU0RJTyBpcyBu
b3Qgc2V0CkNPTkZJR19CVF9IQ0lVQVJUPW0KQ09ORklHX0JUX0hDSVVBUlRfU0VSREVWPXkKQ09O
RklHX0JUX0hDSVVBUlRfSDQ9eQojIENPTkZJR19CVF9IQ0lVQVJUX05PS0lBIGlzIG5vdCBzZXQK
IyBDT05GSUdfQlRfSENJVUFSVF9CQ1NQIGlzIG5vdCBzZXQKIyBDT05GSUdfQlRfSENJVUFSVF9B
VEgzSyBpcyBub3Qgc2V0CiMgQ09ORklHX0JUX0hDSVVBUlRfTEwgaXMgbm90IHNldApDT05GSUdf
QlRfSENJVUFSVF8zV0lSRT15CiMgQ09ORklHX0JUX0hDSVVBUlRfSU5URUwgaXMgbm90IHNldApD
T05GSUdfQlRfSENJVUFSVF9CQ009eQojIENPTkZJR19CVF9IQ0lVQVJUX1JUTCBpcyBub3Qgc2V0
CiMgQ09ORklHX0JUX0hDSVVBUlRfUUNBIGlzIG5vdCBzZXQKIyBDT05GSUdfQlRfSENJVUFSVF9B
RzZYWCBpcyBub3Qgc2V0CiMgQ09ORklHX0JUX0hDSVVBUlRfTVJWTCBpcyBub3Qgc2V0CkNPTkZJ
R19CVF9IQ0lCQ00yMDNYPW0KQ09ORklHX0JUX0hDSUJQQTEwWD1tCkNPTkZJR19CVF9IQ0lCRlVT
Qj1tCkNPTkZJR19CVF9IQ0lWSENJPW0KIyBDT05GSUdfQlRfTVJWTCBpcyBub3Qgc2V0CiMgQ09O
RklHX0JUX0FUSDNLIGlzIG5vdCBzZXQKIyBDT05GSUdfQlRfTVRLU0RJTyBpcyBub3Qgc2V0CiMg
Q09ORklHX0JUX01US1VBUlQgaXMgbm90IHNldAojIENPTkZJR19CVF9WSVJUSU8gaXMgbm90IHNl
dAojIGVuZCBvZiBCbHVldG9vdGggZGV2aWNlIGRyaXZlcnMKCiMgQ09ORklHX0FGX1JYUlBDIGlz
IG5vdCBzZXQKIyBDT05GSUdfQUZfS0NNIGlzIG5vdCBzZXQKIyBDT05GSUdfTUNUUCBpcyBub3Qg
c2V0CkNPTkZJR19GSUJfUlVMRVM9eQpDT05GSUdfV0lSRUxFU1M9eQpDT05GSUdfV0lSRUxFU1Nf
RVhUPXkKQ09ORklHX1dFWFRfQ09SRT15CkNPTkZJR19XRVhUX1BST0M9eQpDT05GSUdfV0VYVF9T
UFk9eQpDT05GSUdfV0VYVF9QUklWPXkKQ09ORklHX0NGRzgwMjExPW0KIyBDT05GSUdfTkw4MDIx
MV9URVNUTU9ERSBpcyBub3Qgc2V0CiMgQ09ORklHX0NGRzgwMjExX0RFVkVMT1BFUl9XQVJOSU5H
UyBpcyBub3Qgc2V0CiMgQ09ORklHX0NGRzgwMjExX0NFUlRJRklDQVRJT05fT05VUyBpcyBub3Qg
c2V0CkNPTkZJR19DRkc4MDIxMV9SRVFVSVJFX1NJR05FRF9SRUdEQj15CkNPTkZJR19DRkc4MDIx
MV9VU0VfS0VSTkVMX1JFR0RCX0tFWVM9eQpDT05GSUdfQ0ZHODAyMTFfREVGQVVMVF9QUz15CiMg
Q09ORklHX0NGRzgwMjExX0RFQlVHRlMgaXMgbm90IHNldApDT05GSUdfQ0ZHODAyMTFfQ1JEQV9T
VVBQT1JUPXkKQ09ORklHX0NGRzgwMjExX1dFWFQ9eQpDT05GSUdfTElCODAyMTE9eQpDT05GSUdf
TElCODAyMTFfQ1JZUFRfV0VQPXkKQ09ORklHX0xJQjgwMjExX0NSWVBUX0NDTVA9eQpDT05GSUdf
TElCODAyMTFfQ1JZUFRfVEtJUD15CiMgQ09ORklHX0xJQjgwMjExX0RFQlVHIGlzIG5vdCBzZXQK
Q09ORklHX01BQzgwMjExPW0KQ09ORklHX01BQzgwMjExX0hBU19SQz15CkNPTkZJR19NQUM4MDIx
MV9SQ19NSU5TVFJFTD15CkNPTkZJR19NQUM4MDIxMV9SQ19ERUZBVUxUX01JTlNUUkVMPXkKQ09O
RklHX01BQzgwMjExX1JDX0RFRkFVTFQ9Im1pbnN0cmVsX2h0IgojIENPTkZJR19NQUM4MDIxMV9N
RVNIIGlzIG5vdCBzZXQKIyBDT05GSUdfTUFDODAyMTFfTEVEUyBpcyBub3Qgc2V0CiMgQ09ORklH
X01BQzgwMjExX0RFQlVHRlMgaXMgbm90IHNldAojIENPTkZJR19NQUM4MDIxMV9NRVNTQUdFX1RS
QUNJTkcgaXMgbm90IHNldAojIENPTkZJR19NQUM4MDIxMV9ERUJVR19NRU5VIGlzIG5vdCBzZXQK
Q09ORklHX01BQzgwMjExX1NUQV9IQVNIX01BWF9TSVpFPTAKQ09ORklHX1JGS0lMTD15CiMgQ09O
RklHX1JGS0lMTF9JTlBVVCBpcyBub3Qgc2V0CiMgQ09ORklHX1JGS0lMTF9HUElPIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTkVUXzlQIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0FJRiBpcyBub3Qgc2V0CiMg
Q09ORklHX0NFUEhfTElCIGlzIG5vdCBzZXQKIyBDT05GSUdfTkZDIGlzIG5vdCBzZXQKIyBDT05G
SUdfUFNBTVBMRSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9JRkUgaXMgbm90IHNldAojIENPTkZJ
R19MV1RVTk5FTCBpcyBub3Qgc2V0CkNPTkZJR19EU1RfQ0FDSEU9eQpDT05GSUdfR1JPX0NFTExT
PXkKQ09ORklHX05FVF9TRUxGVEVTVFM9eQpDT05GSUdfTkVUX1NPQ0tfTVNHPXkKQ09ORklHX1BB
R0VfUE9PTD15CiMgQ09ORklHX0ZBSUxPVkVSIGlzIG5vdCBzZXQKQ09ORklHX0VUSFRPT0xfTkVU
TElOSz15CgojCiMgRGV2aWNlIERyaXZlcnMKIwpDT05GSUdfQVJNX0FNQkE9eQpDT05GSUdfSEFW
RV9QQ0k9eQpDT05GSUdfUENJPXkKQ09ORklHX1BDSV9ET01BSU5TPXkKQ09ORklHX1BDSV9ET01B
SU5TX0dFTkVSSUM9eQpDT05GSUdfUENJX1NZU0NBTEw9eQojIENPTkZJR19QQ0lFUE9SVEJVUyBp
cyBub3Qgc2V0CkNPTkZJR19QQ0lFQVNQTT15CkNPTkZJR19QQ0lFQVNQTV9ERUZBVUxUPXkKIyBD
T05GSUdfUENJRUFTUE1fUE9XRVJTQVZFIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJRUFTUE1fUE9X
RVJfU1VQRVJTQVZFIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJRUFTUE1fUEVSRk9STUFOQ0UgaXMg
bm90IHNldAojIENPTkZJR19QQ0lFX1BUTSBpcyBub3Qgc2V0CkNPTkZJR19QQ0lfTVNJPXkKQ09O
RklHX1BDSV9NU0lfSVJRX0RPTUFJTj15CkNPTkZJR19QQ0lfUVVJUktTPXkKIyBDT05GSUdfUENJ
X0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJX1NUVUIgaXMgbm90IHNldApDT05GSUdfUENJ
X0VDQU09eQojIENPTkZJR19QQ0lfSU9WIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJX1BSSSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1BDSV9QQVNJRCBpcyBub3Qgc2V0CkNPTkZJR19QQ0lfTEFCRUw9eQoj
IENPTkZJR19QQ0lFX0JVU19UVU5FX09GRiBpcyBub3Qgc2V0CkNPTkZJR19QQ0lFX0JVU19ERUZB
VUxUPXkKIyBDT05GSUdfUENJRV9CVVNfU0FGRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSUVfQlVT
X1BFUkZPUk1BTkNFIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJRV9CVVNfUEVFUjJQRUVSIGlzIG5v
dCBzZXQKIyBDT05GSUdfSE9UUExVR19QQ0kgaXMgbm90IHNldAoKIwojIFBDSSBjb250cm9sbGVy
IGRyaXZlcnMKIwojIENPTkZJR19QQ0lfRlRQQ0kxMDAgaXMgbm90IHNldApDT05GSUdfUENJX0hP
U1RfQ09NTU9OPXkKQ09ORklHX1BDSV9IT1NUX0dFTkVSSUM9eQojIENPTkZJR19QQ0lFX1hJTElO
WCBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSV9YR0VORSBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSUVf
QUxURVJBIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJX0hPU1RfVEhVTkRFUl9QRU0gaXMgbm90IHNl
dAojIENPTkZJR19QQ0lfSE9TVF9USFVOREVSX0VDQU0gaXMgbm90IHNldApDT05GSUdfUENJRV9C
UkNNU1RCPXkKIyBDT05GSUdfUENJRV9NSUNST0NISVBfSE9TVCBpcyBub3Qgc2V0CgojCiMgRGVz
aWduV2FyZSBQQ0kgQ29yZSBTdXBwb3J0CiMKIyBDT05GSUdfUENJRV9EV19QTEFUX0hPU1QgaXMg
bm90IHNldAojIENPTkZJR19QQ0lfSElTSSBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSUVfS0lSSU4g
aXMgbm90IHNldAojIENPTkZJR19QQ0lfTUVTT04gaXMgbm90IHNldAojIENPTkZJR19QQ0lFX0FM
IGlzIG5vdCBzZXQKIyBlbmQgb2YgRGVzaWduV2FyZSBQQ0kgQ29yZSBTdXBwb3J0CgojCiMgTW9i
aXZlaWwgUENJZSBDb3JlIFN1cHBvcnQKIwojIGVuZCBvZiBNb2JpdmVpbCBQQ0llIENvcmUgU3Vw
cG9ydAoKIwojIENhZGVuY2UgUENJZSBjb250cm9sbGVycyBzdXBwb3J0CiMKIyBDT05GSUdfUENJ
RV9DQURFTkNFX1BMQVRfSE9TVCBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSV9KNzIxRV9IT1NUIGlz
IG5vdCBzZXQKIyBlbmQgb2YgQ2FkZW5jZSBQQ0llIGNvbnRyb2xsZXJzIHN1cHBvcnQKIyBlbmQg
b2YgUENJIGNvbnRyb2xsZXIgZHJpdmVycwoKIwojIFBDSSBFbmRwb2ludAojCiMgQ09ORklHX1BD
SV9FTkRQT0lOVCBpcyBub3Qgc2V0CiMgZW5kIG9mIFBDSSBFbmRwb2ludAoKIwojIFBDSSBzd2l0
Y2ggY29udHJvbGxlciBkcml2ZXJzCiMKIyBDT05GSUdfUENJX1NXX1NXSVRDSFRFQyBpcyBub3Qg
c2V0CiMgZW5kIG9mIFBDSSBzd2l0Y2ggY29udHJvbGxlciBkcml2ZXJzCgojIENPTkZJR19DWExf
QlVTIGlzIG5vdCBzZXQKIyBDT05GSUdfUENDQVJEIGlzIG5vdCBzZXQKIyBDT05GSUdfUkFQSURJ
TyBpcyBub3Qgc2V0CgojCiMgR2VuZXJpYyBEcml2ZXIgT3B0aW9ucwojCiMgQ09ORklHX1VFVkVO
VF9IRUxQRVIgaXMgbm90IHNldApDT05GSUdfREVWVE1QRlM9eQpDT05GSUdfREVWVE1QRlNfTU9V
TlQ9eQpDT05GSUdfU1RBTkRBTE9ORT15CkNPTkZJR19QUkVWRU5UX0ZJUk1XQVJFX0JVSUxEPXkK
CiMKIyBGaXJtd2FyZSBsb2FkZXIKIwpDT05GSUdfRldfTE9BREVSPXkKQ09ORklHX0VYVFJBX0ZJ
Uk1XQVJFPSIiCiMgQ09ORklHX0ZXX0xPQURFUl9VU0VSX0hFTFBFUiBpcyBub3Qgc2V0CiMgQ09O
RklHX0ZXX0xPQURFUl9DT01QUkVTUyBpcyBub3Qgc2V0CkNPTkZJR19GV19DQUNIRT15CiMgZW5k
IG9mIEZpcm13YXJlIGxvYWRlcgoKQ09ORklHX1dBTlRfREVWX0NPUkVEVU1QPXkKQ09ORklHX0FM
TE9XX0RFVl9DT1JFRFVNUD15CkNPTkZJR19ERVZfQ09SRURVTVA9eQojIENPTkZJR19ERUJVR19E
UklWRVIgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19ERVZSRVMgaXMgbm90IHNldAojIENPTkZJ
R19ERUJVR19URVNUX0RSSVZFUl9SRU1PVkUgaXMgbm90IHNldAojIENPTkZJR19URVNUX0FTWU5D
X0RSSVZFUl9QUk9CRSBpcyBub3Qgc2V0CkNPTkZJR19TWVNfSFlQRVJWSVNPUj15CkNPTkZJR19H
RU5FUklDX0NQVV9BVVRPUFJPQkU9eQpDT05GSUdfR0VORVJJQ19DUFVfVlVMTkVSQUJJTElUSUVT
PXkKQ09ORklHX1NPQ19CVVM9eQpDT05GSUdfUkVHTUFQPXkKQ09ORklHX1JFR01BUF9JMkM9eQpD
T05GSUdfUkVHTUFQX1NQST1tCkNPTkZJR19SRUdNQVBfTU1JTz15CkNPTkZJR19SRUdNQVBfSVJR
PXkKQ09ORklHX0RNQV9TSEFSRURfQlVGRkVSPXkKIyBDT05GSUdfRE1BX0ZFTkNFX1RSQUNFIGlz
IG5vdCBzZXQKQ09ORklHX0dFTkVSSUNfQVJDSF9UT1BPTE9HWT15CiMgZW5kIG9mIEdlbmVyaWMg
RHJpdmVyIE9wdGlvbnMKCiMKIyBCdXMgZGV2aWNlcwojCiMgQ09ORklHX0JSQ01TVEJfR0lTQl9B
UkIgaXMgbm90IHNldAojIENPTkZJR19NT1hURVQgaXMgbm90IHNldAojIENPTkZJR19WRVhQUkVT
U19DT05GSUcgaXMgbm90IHNldAojIENPTkZJR19NSElfQlVTIGlzIG5vdCBzZXQKIyBlbmQgb2Yg
QnVzIGRldmljZXMKCiMgQ09ORklHX0NPTk5FQ1RPUiBpcyBub3Qgc2V0CgojCiMgRmlybXdhcmUg
RHJpdmVycwojCgojCiMgQVJNIFN5c3RlbSBDb250cm9sIGFuZCBNYW5hZ2VtZW50IEludGVyZmFj
ZSBQcm90b2NvbAojCiMgQ09ORklHX0FSTV9TQ01JX1BST1RPQ09MIGlzIG5vdCBzZXQKIyBlbmQg
b2YgQVJNIFN5c3RlbSBDb250cm9sIGFuZCBNYW5hZ2VtZW50IEludGVyZmFjZSBQcm90b2NvbAoK
IyBDT05GSUdfQVJNX1NDUElfUFJPVE9DT0wgaXMgbm90IHNldAojIENPTkZJR19GSVJNV0FSRV9N
RU1NQVAgaXMgbm90IHNldApDT05GSUdfRE1JSUQ9eQojIENPTkZJR19ETUlfU1lTRlMgaXMgbm90
IHNldApDT05GSUdfUkFTUEJFUlJZUElfRklSTVdBUkU9eQojIENPTkZJR19GV19DRkdfU1lTRlMg
aXMgbm90IHNldApDT05GSUdfU1lTRkI9eQojIENPTkZJR19TWVNGQl9TSU1QTEVGQiBpcyBub3Qg
c2V0CiMgQ09ORklHX0FSTV9GRkFfVFJBTlNQT1JUIGlzIG5vdCBzZXQKIyBDT05GSUdfR09PR0xF
X0ZJUk1XQVJFIGlzIG5vdCBzZXQKCiMKIyBFRkkgKEV4dGVuc2libGUgRmlybXdhcmUgSW50ZXJm
YWNlKSBTdXBwb3J0CiMKQ09ORklHX0VGSV9FU1JUPXkKQ09ORklHX0VGSV9QQVJBTVNfRlJPTV9G
RFQ9eQpDT05GSUdfRUZJX1JVTlRJTUVfV1JBUFBFUlM9eQpDT05GSUdfRUZJX0dFTkVSSUNfU1RV
Qj15CkNPTkZJR19FRklfQVJNU1RVQl9EVEJfTE9BREVSPXkKIyBDT05GSUdfRUZJX0dFTkVSSUNf
U1RVQl9JTklUUkRfQ01ETElORV9MT0FERVIgaXMgbm90IHNldAojIENPTkZJR19FRklfQk9PVExP
QURFUl9DT05UUk9MIGlzIG5vdCBzZXQKIyBDT05GSUdfRUZJX0NBUFNVTEVfTE9BREVSIGlzIG5v
dCBzZXQKIyBDT05GSUdfRUZJX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19SRVNFVF9BVFRBQ0tf
TUlUSUdBVElPTiBpcyBub3Qgc2V0CiMgQ09ORklHX0VGSV9ESVNBQkxFX1BDSV9ETUEgaXMgbm90
IHNldAojIGVuZCBvZiBFRkkgKEV4dGVuc2libGUgRmlybXdhcmUgSW50ZXJmYWNlKSBTdXBwb3J0
CgpDT05GSUdfRUZJX0VBUkxZQ09OPXkKQ09ORklHX0FSTV9QU0NJX0ZXPXkKIyBDT05GSUdfQVJN
X1BTQ0lfQ0hFQ0tFUiBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0FSTV9TTUNDQz15CkNPTkZJR19I
QVZFX0FSTV9TTUNDQ19ESVNDT1ZFUlk9eQpDT05GSUdfQVJNX1NNQ0NDX1NPQ19JRD15CgojCiMg
VGVncmEgZmlybXdhcmUgZHJpdmVyCiMKIyBlbmQgb2YgVGVncmEgZmlybXdhcmUgZHJpdmVyCiMg
ZW5kIG9mIEZpcm13YXJlIERyaXZlcnMKCiMgQ09ORklHX0dOU1MgaXMgbm90IHNldApDT05GSUdf
TVREPXkKIyBDT05GSUdfTVREX1RFU1RTIGlzIG5vdCBzZXQKCiMKIyBQYXJ0aXRpb24gcGFyc2Vy
cwojCiMgQ09ORklHX01URF9BUjdfUEFSVFMgaXMgbm90IHNldAojIENPTkZJR19NVERfQ01ETElO
RV9QQVJUUyBpcyBub3Qgc2V0CkNPTkZJR19NVERfT0ZfUEFSVFM9eQojIENPTkZJR19NVERfQUZT
X1BBUlRTIGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX1JFREJPT1RfUEFSVFMgaXMgbm90IHNldAoj
IGVuZCBvZiBQYXJ0aXRpb24gcGFyc2VycwoKIwojIFVzZXIgTW9kdWxlcyBBbmQgVHJhbnNsYXRp
b24gTGF5ZXJzCiMKQ09ORklHX01URF9CTEtERVZTPW0KQ09ORklHX01URF9CTE9DSz1tCiMgQ09O
RklHX01URF9CTE9DS19STyBpcyBub3Qgc2V0CgojCiMgTm90ZSB0aGF0IGluIHNvbWUgY2FzZXMg
VUJJIGJsb2NrIGlzIHByZWZlcnJlZC4gU2VlIE1URF9VQklfQkxPQ0suCiMKIyBDT05GSUdfRlRM
IGlzIG5vdCBzZXQKIyBDT05GSUdfTkZUTCBpcyBub3Qgc2V0CiMgQ09ORklHX0lORlRMIGlzIG5v
dCBzZXQKIyBDT05GSUdfUkZEX0ZUTCBpcyBub3Qgc2V0CiMgQ09ORklHX1NTRkRDIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU01fRlRMIGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX09PUFMgaXMgbm90IHNl
dAojIENPTkZJR19NVERfU1dBUCBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9QQVJUSVRJT05FRF9N
QVNURVIgaXMgbm90IHNldAoKIwojIFJBTS9ST00vRmxhc2ggY2hpcCBkcml2ZXJzCiMKIyBDT05G
SUdfTVREX0NGSSBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9KRURFQ1BST0JFIGlzIG5vdCBzZXQK
Q09ORklHX01URF9NQVBfQkFOS19XSURUSF8xPXkKQ09ORklHX01URF9NQVBfQkFOS19XSURUSF8y
PXkKQ09ORklHX01URF9NQVBfQkFOS19XSURUSF80PXkKQ09ORklHX01URF9DRklfSTE9eQpDT05G
SUdfTVREX0NGSV9JMj15CiMgQ09ORklHX01URF9SQU0gaXMgbm90IHNldAojIENPTkZJR19NVERf
Uk9NIGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX0FCU0VOVCBpcyBub3Qgc2V0CiMgZW5kIG9mIFJB
TS9ST00vRmxhc2ggY2hpcCBkcml2ZXJzCgojCiMgTWFwcGluZyBkcml2ZXJzIGZvciBjaGlwIGFj
Y2VzcwojCiMgQ09ORklHX01URF9DT01QTEVYX01BUFBJTkdTIGlzIG5vdCBzZXQKIyBDT05GSUdf
TVREX0lOVEVMX1ZSX05PUiBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9QTEFUUkFNIGlzIG5vdCBz
ZXQKIyBlbmQgb2YgTWFwcGluZyBkcml2ZXJzIGZvciBjaGlwIGFjY2VzcwoKIwojIFNlbGYtY29u
dGFpbmVkIE1URCBkZXZpY2UgZHJpdmVycwojCiMgQ09ORklHX01URF9QTUM1NTEgaXMgbm90IHNl
dAojIENPTkZJR19NVERfREFUQUZMQVNIIGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX01DSFAyM0sy
NTYgaXMgbm90IHNldAojIENPTkZJR19NVERfTUNIUDQ4TDY0MCBpcyBub3Qgc2V0CiMgQ09ORklH
X01URF9TU1QyNUwgaXMgbm90IHNldAojIENPTkZJR19NVERfU0xSQU0gaXMgbm90IHNldAojIENP
TkZJR19NVERfUEhSQU0gaXMgbm90IHNldAojIENPTkZJR19NVERfTVREUkFNIGlzIG5vdCBzZXQK
IyBDT05GSUdfTVREX0JMT0NLMk1URCBpcyBub3Qgc2V0CgojCiMgRGlzay1Pbi1DaGlwIERldmlj
ZSBEcml2ZXJzCiMKIyBDT05GSUdfTVREX0RPQ0czIGlzIG5vdCBzZXQKIyBlbmQgb2YgU2VsZi1j
b250YWluZWQgTVREIGRldmljZSBkcml2ZXJzCgojCiMgTkFORAojCiMgQ09ORklHX01URF9PTkVO
QU5EIGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX1JBV19OQU5EIGlzIG5vdCBzZXQKIyBDT05GSUdf
TVREX1NQSV9OQU5EIGlzIG5vdCBzZXQKCiMKIyBFQ0MgZW5naW5lIHN1cHBvcnQKIwojIENPTkZJ
R19NVERfTkFORF9FQ0NfU1dfSEFNTUlORyBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9OQU5EX0VD
Q19TV19CQ0ggaXMgbm90IHNldAojIGVuZCBvZiBFQ0MgZW5naW5lIHN1cHBvcnQKIyBlbmQgb2Yg
TkFORAoKIwojIExQRERSICYgTFBERFIyIFBDTSBtZW1vcnkgZHJpdmVycwojCiMgQ09ORklHX01U
RF9MUEREUiBpcyBub3Qgc2V0CiMgZW5kIG9mIExQRERSICYgTFBERFIyIFBDTSBtZW1vcnkgZHJp
dmVycwoKIyBDT05GSUdfTVREX1NQSV9OT1IgaXMgbm90IHNldAojIENPTkZJR19NVERfVUJJIGlz
IG5vdCBzZXQKIyBDT05GSUdfTVREX0hZUEVSQlVTIGlzIG5vdCBzZXQKQ09ORklHX0RUQz15CkNP
TkZJR19PRj15CiMgQ09ORklHX09GX1VOSVRURVNUIGlzIG5vdCBzZXQKQ09ORklHX09GX0ZMQVRU
UkVFPXkKQ09ORklHX09GX0VBUkxZX0ZMQVRUUkVFPXkKQ09ORklHX09GX0tPQko9eQpDT05GSUdf
T0ZfRFlOQU1JQz15CkNPTkZJR19PRl9BRERSRVNTPXkKQ09ORklHX09GX0lSUT15CkNPTkZJR19P
Rl9SRVNFUlZFRF9NRU09eQpDT05GSUdfT0ZfUkVTT0xWRT15CkNPTkZJR19PRl9PVkVSTEFZPXkK
IyBDT05GSUdfT0ZfQ09ORklHRlMgaXMgbm90IHNldAojIENPTkZJR19QQVJQT1JUIGlzIG5vdCBz
ZXQKQ09ORklHX0JMS19ERVY9eQojIENPTkZJR19CTEtfREVWX05VTExfQkxLIGlzIG5vdCBzZXQK
IyBDT05GSUdfQkxLX0RFVl9QQ0lFU1NEX01USVAzMlhYIGlzIG5vdCBzZXQKQ09ORklHX0JMS19E
RVZfTE9PUD15CkNPTkZJR19CTEtfREVWX0xPT1BfTUlOX0NPVU5UPTgKQ09ORklHX0JMS19ERVZf
Q1JZUFRPTE9PUD1tCiMgQ09ORklHX0JMS19ERVZfRFJCRCBpcyBub3Qgc2V0CkNPTkZJR19CTEtf
REVWX05CRD1tCiMgQ09ORklHX0JMS19ERVZfU1g4IGlzIG5vdCBzZXQKQ09ORklHX0JMS19ERVZf
UkFNPXkKQ09ORklHX0JMS19ERVZfUkFNX0NPVU5UPTE2CkNPTkZJR19CTEtfREVWX1JBTV9TSVpF
PTQwOTYKIyBDT05GSUdfQ0RST01fUEtUQ0RWRCBpcyBub3Qgc2V0CiMgQ09ORklHX0FUQV9PVkVS
X0VUSCBpcyBub3Qgc2V0CkNPTkZJR19YRU5fQkxLREVWX0ZST05URU5EPXkKQ09ORklHX1hFTl9C
TEtERVZfQkFDS0VORD1tCiMgQ09ORklHX1ZJUlRJT19CTEsgaXMgbm90IHNldAojIENPTkZJR19C
TEtfREVWX1JCRCBpcyBub3Qgc2V0CiMgQ09ORklHX0JMS19ERVZfUlNYWCBpcyBub3Qgc2V0Cgoj
CiMgTlZNRSBTdXBwb3J0CiMKQ09ORklHX05WTUVfQ09SRT15CkNPTkZJR19CTEtfREVWX05WTUU9
eQojIENPTkZJR19OVk1FX01VTFRJUEFUSCBpcyBub3Qgc2V0CiMgQ09ORklHX05WTUVfRkMgaXMg
bm90IHNldAojIENPTkZJR19OVk1FX1RDUCBpcyBub3Qgc2V0CiMgQ09ORklHX05WTUVfVEFSR0VU
IGlzIG5vdCBzZXQKIyBlbmQgb2YgTlZNRSBTdXBwb3J0CgojCiMgTWlzYyBkZXZpY2VzCiMKIyBD
T05GSUdfQUQ1MjVYX0RQT1QgaXMgbm90IHNldAojIENPTkZJR19EVU1NWV9JUlEgaXMgbm90IHNl
dAojIENPTkZJR19QSEFOVE9NIGlzIG5vdCBzZXQKIyBDT05GSUdfVElGTV9DT1JFIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSUNTOTMyUzQwMSBpcyBub3Qgc2V0CiMgQ09ORklHX0VOQ0xPU1VSRV9TRVJW
SUNFUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hQX0lMTyBpcyBub3Qgc2V0CiMgQ09ORklHX0FQRFM5
ODAyQUxTIGlzIG5vdCBzZXQKIyBDT05GSUdfSVNMMjkwMDMgaXMgbm90IHNldAojIENPTkZJR19J
U0wyOTAyMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVFNMMjU1MCBpcyBub3Qgc2V0CiMg
Q09ORklHX1NFTlNPUlNfQkgxNzcwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BUERTOTkw
WCBpcyBub3Qgc2V0CiMgQ09ORklHX0hNQzYzNTIgaXMgbm90IHNldAojIENPTkZJR19EUzE2ODIg
aXMgbm90IHNldAojIENPTkZJR19MQVRUSUNFX0VDUDNfQ09ORklHIGlzIG5vdCBzZXQKIyBDT05G
SUdfU1JBTSBpcyBub3Qgc2V0CiMgQ09ORklHX0RXX1hEQVRBX1BDSUUgaXMgbm90IHNldAojIENP
TkZJR19QQ0lfRU5EUE9JTlRfVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1hJTElOWF9TREZFQyBp
cyBub3Qgc2V0CiMgQ09ORklHX0hJU0lfSElLRVlfVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdfQzJQ
T1JUIGlzIG5vdCBzZXQKCiMKIyBFRVBST00gc3VwcG9ydAojCkNPTkZJR19FRVBST01fQVQyND1t
CiMgQ09ORklHX0VFUFJPTV9BVDI1IGlzIG5vdCBzZXQKIyBDT05GSUdfRUVQUk9NX0xFR0FDWSBp
cyBub3Qgc2V0CiMgQ09ORklHX0VFUFJPTV9NQVg2ODc1IGlzIG5vdCBzZXQKIyBDT05GSUdfRUVQ
Uk9NXzkzQ1g2IGlzIG5vdCBzZXQKIyBDT05GSUdfRUVQUk9NXzkzWFg0NiBpcyBub3Qgc2V0CiMg
Q09ORklHX0VFUFJPTV9JRFRfODlIUEVTWCBpcyBub3Qgc2V0CiMgQ09ORklHX0VFUFJPTV9FRTEw
MDQgaXMgbm90IHNldAojIGVuZCBvZiBFRVBST00gc3VwcG9ydAoKIyBDT05GSUdfQ0I3MTBfQ09S
RSBpcyBub3Qgc2V0CgojCiMgVGV4YXMgSW5zdHJ1bWVudHMgc2hhcmVkIHRyYW5zcG9ydCBsaW5l
IGRpc2NpcGxpbmUKIwojIENPTkZJR19USV9TVCBpcyBub3Qgc2V0CiMgZW5kIG9mIFRleGFzIElu
c3RydW1lbnRzIHNoYXJlZCB0cmFuc3BvcnQgbGluZSBkaXNjaXBsaW5lCgojIENPTkZJR19TRU5T
T1JTX0xJUzNfU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MSVMzX0kyQyBpcyBub3Qg
c2V0CiMgQ09ORklHX0FMVEVSQV9TVEFQTCBpcyBub3Qgc2V0CiMgQ09ORklHX0dFTldRRSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0VDSE8gaXMgbm90IHNldAojIENPTkZJR19CQ01fVksgaXMgbm90IHNl
dAojIENPTkZJR19NSVNDX0FMQ09SX1BDSSBpcyBub3Qgc2V0CiMgQ09ORklHX01JU0NfUlRTWF9Q
Q0kgaXMgbm90IHNldAojIENPTkZJR19NSVNDX1JUU1hfVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdf
SEFCQU5BX0FJIGlzIG5vdCBzZXQKIyBDT05GSUdfVUFDQ0UgaXMgbm90IHNldAojIENPTkZJR19Q
VlBBTklDIGlzIG5vdCBzZXQKIyBlbmQgb2YgTWlzYyBkZXZpY2VzCgojCiMgU0NTSSBkZXZpY2Ug
c3VwcG9ydAojCkNPTkZJR19TQ1NJX01PRD15CiMgQ09ORklHX1JBSURfQVRUUlMgaXMgbm90IHNl
dApDT05GSUdfU0NTSV9DT01NT049eQpDT05GSUdfU0NTST15CkNPTkZJR19TQ1NJX0RNQT15CkNP
TkZJR19TQ1NJX1BST0NfRlM9eQoKIwojIFNDU0kgc3VwcG9ydCB0eXBlIChkaXNrLCB0YXBlLCBD
RC1ST00pCiMKQ09ORklHX0JMS19ERVZfU0Q9eQojIENPTkZJR19DSFJfREVWX1NUIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQkxLX0RFVl9TUiBpcyBub3Qgc2V0CiMgQ09ORklHX0NIUl9ERVZfU0cgaXMg
bm90IHNldApDT05GSUdfQkxLX0RFVl9CU0c9eQojIENPTkZJR19DSFJfREVWX1NDSCBpcyBub3Qg
c2V0CiMgQ09ORklHX1NDU0lfQ09OU1RBTlRTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9MT0dH
SU5HIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9TQ0FOX0FTWU5DIGlzIG5vdCBzZXQKCiMKIyBT
Q1NJIFRyYW5zcG9ydHMKIwojIENPTkZJR19TQ1NJX1NQSV9BVFRSUyBpcyBub3Qgc2V0CiMgQ09O
RklHX1NDU0lfRkNfQVRUUlMgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0lTQ1NJX0FUVFJTIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0NTSV9TQVNfQVRUUlMgaXMgbm90IHNldAojIENPTkZJR19TQ1NJ
X1NBU19MSUJTQVMgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX1NSUF9BVFRSUyBpcyBub3Qgc2V0
CiMgZW5kIG9mIFNDU0kgVHJhbnNwb3J0cwoKQ09ORklHX1NDU0lfTE9XTEVWRUw9eQojIENPTkZJ
R19JU0NTSV9UQ1AgaXMgbm90IHNldAojIENPTkZJR19JU0NTSV9CT09UX1NZU0ZTIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0NTSV9DWEdCM19JU0NTSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfQ1hH
QjRfSVNDU0kgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0JOWDJfSVNDU0kgaXMgbm90IHNldAoj
IENPTkZJR19CRTJJU0NTSSBpcyBub3Qgc2V0CiMgQ09ORklHX0JMS19ERVZfM1dfWFhYWF9SQUlE
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9IUFNBIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV8z
V185WFhYIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV8zV19TQVMgaXMgbm90IHNldAojIENPTkZJ
R19TQ1NJX0FDQVJEIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9BQUNSQUlEIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0NTSV9BSUM3WFhYIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9BSUM3OVhYIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0NTSV9BSUM5NFhYIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9I
SVNJX1NBUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfTVZTQVMgaXMgbm90IHNldAojIENPTkZJ
R19TQ1NJX01WVU1JIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9BRFZBTlNZUyBpcyBub3Qgc2V0
CiMgQ09ORklHX1NDU0lfQVJDTVNSIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9FU0FTMlIgaXMg
bm90IHNldAojIENPTkZJR19NRUdBUkFJRF9ORVdHRU4gaXMgbm90IHNldAojIENPTkZJR19NRUdB
UkFJRF9MRUdBQ1kgaXMgbm90IHNldAojIENPTkZJR19NRUdBUkFJRF9TQVMgaXMgbm90IHNldAoj
IENPTkZJR19TQ1NJX01QVDNTQVMgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX01QVDJTQVMgaXMg
bm90IHNldAojIENPTkZJR19TQ1NJX01QSTNNUiBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfU01B
UlRQUUkgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX1VGU0hDRCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NDU0lfSFBUSU9QIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9NWVJCIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0NTSV9NWVJTIGlzIG5vdCBzZXQKQ09ORklHX1hFTl9TQ1NJX0ZST05URU5EPXkKIyBD
T05GSUdfU0NTSV9TTklDIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9ETVgzMTkxRCBpcyBub3Qg
c2V0CiMgQ09ORklHX1NDU0lfRkRPTUFJTl9QQ0kgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0lQ
UyBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfSU5JVElPIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NT
SV9JTklBMTAwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9TVEVYIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0NTSV9TWU01M0M4WFhfMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfSVBSIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0NTSV9RTE9HSUNfMTI4MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfUUxB
X0lTQ1NJIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9EQzM5NXggaXMgbm90IHNldAojIENPTkZJ
R19TQ1NJX0FNNTNDOTc0IGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9XRDcxOVggaXMgbm90IHNl
dApDT05GSUdfU0NTSV9ERUJVRz1tCiMgQ09ORklHX1NDU0lfUE1DUkFJRCBpcyBub3Qgc2V0CiMg
Q09ORklHX1NDU0lfUE04MDAxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9WSVJUSU8gaXMgbm90
IHNldAojIENPTkZJR19TQ1NJX0RIIGlzIG5vdCBzZXQKIyBlbmQgb2YgU0NTSSBkZXZpY2Ugc3Vw
cG9ydAoKQ09ORklHX0hBVkVfUEFUQV9QTEFURk9STT15CkNPTkZJR19BVEE9bQpDT05GSUdfU0FU
QV9IT1NUPXkKQ09ORklHX0FUQV9WRVJCT1NFX0VSUk9SPXkKQ09ORklHX0FUQV9GT1JDRT15CkNP
TkZJR19TQVRBX1BNUD15CgojCiMgQ29udHJvbGxlcnMgd2l0aCBub24tU0ZGIG5hdGl2ZSBpbnRl
cmZhY2UKIwpDT05GSUdfU0FUQV9BSENJPW0KQ09ORklHX1NBVEFfTU9CSUxFX0xQTV9QT0xJQ1k9
MAojIENPTkZJR19TQVRBX0FIQ0lfUExBVEZPUk0gaXMgbm90IHNldAojIENPTkZJR19BSENJX0NF
VkEgaXMgbm90IHNldAojIENPTkZJR19BSENJX1FPUklRIGlzIG5vdCBzZXQKIyBDT05GSUdfU0FU
QV9JTklDMTYyWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NBVEFfQUNBUkRfQUhDSSBpcyBub3Qgc2V0
CiMgQ09ORklHX1NBVEFfU0lMMjQgaXMgbm90IHNldApDT05GSUdfQVRBX1NGRj15CgojCiMgU0ZG
IGNvbnRyb2xsZXJzIHdpdGggY3VzdG9tIERNQSBpbnRlcmZhY2UKIwojIENPTkZJR19QRENfQURN
QSBpcyBub3Qgc2V0CiMgQ09ORklHX1NBVEFfUVNUT1IgaXMgbm90IHNldAojIENPTkZJR19TQVRB
X1NYNCBpcyBub3Qgc2V0CkNPTkZJR19BVEFfQk1ETUE9eQoKIwojIFNBVEEgU0ZGIGNvbnRyb2xs
ZXJzIHdpdGggQk1ETUEKIwojIENPTkZJR19BVEFfUElJWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NB
VEFfRFdDIGlzIG5vdCBzZXQKQ09ORklHX1NBVEFfTVY9bQojIENPTkZJR19TQVRBX05WIGlzIG5v
dCBzZXQKIyBDT05GSUdfU0FUQV9QUk9NSVNFIGlzIG5vdCBzZXQKIyBDT05GSUdfU0FUQV9TSUwg
aXMgbm90IHNldAojIENPTkZJR19TQVRBX1NJUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NBVEFfU1ZX
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0FUQV9VTEkgaXMgbm90IHNldAojIENPTkZJR19TQVRBX1ZJ
QSBpcyBub3Qgc2V0CiMgQ09ORklHX1NBVEFfVklURVNTRSBpcyBub3Qgc2V0CgojCiMgUEFUQSBT
RkYgY29udHJvbGxlcnMgd2l0aCBCTURNQQojCiMgQ09ORklHX1BBVEFfQUxJIGlzIG5vdCBzZXQK
IyBDT05GSUdfUEFUQV9BTUQgaXMgbm90IHNldAojIENPTkZJR19QQVRBX0FSVE9QIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUEFUQV9BVElJWFAgaXMgbm90IHNldAojIENPTkZJR19QQVRBX0FUUDg2N1gg
aXMgbm90IHNldAojIENPTkZJR19QQVRBX0NNRDY0WCBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFf
Q1lQUkVTUyBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfRUZBUiBpcyBub3Qgc2V0CiMgQ09ORklH
X1BBVEFfSFBUMzY2IGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9IUFQzN1ggaXMgbm90IHNldAoj
IENPTkZJR19QQVRBX0hQVDNYMk4gaXMgbm90IHNldAojIENPTkZJR19QQVRBX0hQVDNYMyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1BBVEFfSVQ4MjEzIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9JVDgy
MVggaXMgbm90IHNldAojIENPTkZJR19QQVRBX0pNSUNST04gaXMgbm90IHNldAojIENPTkZJR19Q
QVRBX01BUlZFTEwgaXMgbm90IHNldAojIENPTkZJR19QQVRBX05FVENFTEwgaXMgbm90IHNldAoj
IENPTkZJR19QQVRBX05JTkpBMzIgaXMgbm90IHNldAojIENPTkZJR19QQVRBX05TODc0MTUgaXMg
bm90IHNldAojIENPTkZJR19QQVRBX09MRFBJSVggaXMgbm90IHNldAojIENPTkZJR19QQVRBX09Q
VElETUEgaXMgbm90IHNldAojIENPTkZJR19QQVRBX1BEQzIwMjdYIGlzIG5vdCBzZXQKIyBDT05G
SUdfUEFUQV9QRENfT0xEIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9SQURJU1lTIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUEFUQV9SREMgaXMgbm90IHNldAojIENPTkZJR19QQVRBX1NDSCBpcyBub3Qg
c2V0CiMgQ09ORklHX1BBVEFfU0VSVkVSV09SS1MgaXMgbm90IHNldAojIENPTkZJR19QQVRBX1NJ
TDY4MCBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfU0lTIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFU
QV9UT1NISUJBIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9UUklGTEVYIGlzIG5vdCBzZXQKIyBD
T05GSUdfUEFUQV9WSUEgaXMgbm90IHNldAojIENPTkZJR19QQVRBX1dJTkJPTkQgaXMgbm90IHNl
dAoKIwojIFBJTy1vbmx5IFNGRiBjb250cm9sbGVycwojCiMgQ09ORklHX1BBVEFfQ01ENjQwX1BD
SSBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfTVBJSVggaXMgbm90IHNldAojIENPTkZJR19QQVRB
X05TODc0MTAgaXMgbm90IHNldAojIENPTkZJR19QQVRBX09QVEkgaXMgbm90IHNldAojIENPTkZJ
R19QQVRBX1BMQVRGT1JNIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9SWjEwMDAgaXMgbm90IHNl
dAoKIwojIEdlbmVyaWMgZmFsbGJhY2sgLyBsZWdhY3kgZHJpdmVycwojCiMgQ09ORklHX0FUQV9H
RU5FUklDIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9MRUdBQ1kgaXMgbm90IHNldApDT05GSUdf
TUQ9eQpDT05GSUdfQkxLX0RFVl9NRD15CkNPTkZJR19NRF9BVVRPREVURUNUPXkKQ09ORklHX01E
X0xJTkVBUj15CkNPTkZJR19NRF9SQUlEMD15CkNPTkZJR19NRF9SQUlEMT15CkNPTkZJR19NRF9S
QUlEMTA9eQpDT05GSUdfTURfUkFJRDQ1Nj15CkNPTkZJR19NRF9NVUxUSVBBVEg9eQpDT05GSUdf
TURfRkFVTFRZPXkKIyBDT05GSUdfQkNBQ0hFIGlzIG5vdCBzZXQKQ09ORklHX0JMS19ERVZfRE1f
QlVJTFRJTj15CkNPTkZJR19CTEtfREVWX0RNPXkKIyBDT05GSUdfRE1fREVCVUcgaXMgbm90IHNl
dApDT05GSUdfRE1fQlVGSU89eQojIENPTkZJR19ETV9ERUJVR19CTE9DS19NQU5BR0VSX0xPQ0tJ
TkcgaXMgbm90IHNldAojIENPTkZJR19ETV9VTlNUUklQRUQgaXMgbm90IHNldApDT05GSUdfRE1f
Q1JZUFQ9eQpDT05GSUdfRE1fU05BUFNIT1Q9eQojIENPTkZJR19ETV9USElOX1BST1ZJU0lPTklO
RyBpcyBub3Qgc2V0CiMgQ09ORklHX0RNX0NBQ0hFIGlzIG5vdCBzZXQKIyBDT05GSUdfRE1fV1JJ
VEVDQUNIRSBpcyBub3Qgc2V0CiMgQ09ORklHX0RNX0VCUyBpcyBub3Qgc2V0CiMgQ09ORklHX0RN
X0VSQSBpcyBub3Qgc2V0CiMgQ09ORklHX0RNX0NMT05FIGlzIG5vdCBzZXQKQ09ORklHX0RNX01J
UlJPUj15CiMgQ09ORklHX0RNX0xPR19VU0VSU1BBQ0UgaXMgbm90IHNldAojIENPTkZJR19ETV9S
QUlEIGlzIG5vdCBzZXQKQ09ORklHX0RNX1pFUk89eQojIENPTkZJR19ETV9NVUxUSVBBVEggaXMg
bm90IHNldAojIENPTkZJR19ETV9ERUxBWSBpcyBub3Qgc2V0CiMgQ09ORklHX0RNX0RVU1QgaXMg
bm90IHNldAojIENPTkZJR19ETV9JTklUIGlzIG5vdCBzZXQKIyBDT05GSUdfRE1fVUVWRU5UIGlz
IG5vdCBzZXQKIyBDT05GSUdfRE1fRkxBS0VZIGlzIG5vdCBzZXQKIyBDT05GSUdfRE1fVkVSSVRZ
IGlzIG5vdCBzZXQKIyBDT05GSUdfRE1fU1dJVENIIGlzIG5vdCBzZXQKIyBDT05GSUdfRE1fTE9H
X1dSSVRFUyBpcyBub3Qgc2V0CiMgQ09ORklHX0RNX0lOVEVHUklUWSBpcyBub3Qgc2V0CiMgQ09O
RklHX1RBUkdFVF9DT1JFIGlzIG5vdCBzZXQKIyBDT05GSUdfRlVTSU9OIGlzIG5vdCBzZXQKCiMK
IyBJRUVFIDEzOTQgKEZpcmVXaXJlKSBzdXBwb3J0CiMKIyBDT05GSUdfRklSRVdJUkUgaXMgbm90
IHNldAojIENPTkZJR19GSVJFV0lSRV9OT1NZIGlzIG5vdCBzZXQKIyBlbmQgb2YgSUVFRSAxMzk0
IChGaXJlV2lyZSkgc3VwcG9ydAoKQ09ORklHX05FVERFVklDRVM9eQpDT05GSUdfTUlJPXkKQ09O
RklHX05FVF9DT1JFPXkKQ09ORklHX0JPTkRJTkc9bQpDT05GSUdfRFVNTVk9bQojIENPTkZJR19X
SVJFR1VBUkQgaXMgbm90IHNldAojIENPTkZJR19FUVVBTElaRVIgaXMgbm90IHNldAojIENPTkZJ
R19ORVRfRkMgaXMgbm90IHNldAojIENPTkZJR19JRkIgaXMgbm90IHNldAojIENPTkZJR19ORVRf
VEVBTSBpcyBub3Qgc2V0CiMgQ09ORklHX01BQ1ZMQU4gaXMgbm90IHNldAojIENPTkZJR19JUFZM
QU4gaXMgbm90IHNldAojIENPTkZJR19WWExBTiBpcyBub3Qgc2V0CiMgQ09ORklHX0dFTkVWRSBp
cyBub3Qgc2V0CiMgQ09ORklHX0JBUkVVRFAgaXMgbm90IHNldAojIENPTkZJR19HVFAgaXMgbm90
IHNldAojIENPTkZJR19NQUNTRUMgaXMgbm90IHNldApDT05GSUdfTkVUQ09OU09MRT15CkNPTkZJ
R19ORVRQT0xMPXkKQ09ORklHX05FVF9QT0xMX0NPTlRST0xMRVI9eQpDT05GSUdfVFVOPW0KIyBD
T05GSUdfVFVOX1ZORVRfQ1JPU1NfTEUgaXMgbm90IHNldApDT05GSUdfVkVUSD15CiMgQ09ORklH
X1ZJUlRJT19ORVQgaXMgbm90IHNldApDT05GSUdfTkxNT049eQojIENPTkZJR19BUkNORVQgaXMg
bm90IHNldApDT05GSUdfRVRIRVJORVQ9eQpDT05GSUdfTkVUX1ZFTkRPUl8zQ09NPXkKIyBDT05G
SUdfVk9SVEVYIGlzIG5vdCBzZXQKIyBDT05GSUdfVFlQSE9PTiBpcyBub3Qgc2V0CkNPTkZJR19O
RVRfVkVORE9SX0FEQVBURUM9eQojIENPTkZJR19BREFQVEVDX1NUQVJGSVJFIGlzIG5vdCBzZXQK
Q09ORklHX05FVF9WRU5ET1JfQUdFUkU9eQojIENPTkZJR19FVDEzMVggaXMgbm90IHNldApDT05G
SUdfTkVUX1ZFTkRPUl9BTEFDUklURUNIPXkKIyBDT05GSUdfU0xJQ09TUyBpcyBub3Qgc2V0CkNP
TkZJR19ORVRfVkVORE9SX0FMVEVPTj15CiMgQ09ORklHX0FDRU5JQyBpcyBub3Qgc2V0CiMgQ09O
RklHX0FMVEVSQV9UU0UgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9BTUFaT049eQojIENP
TkZJR19FTkFfRVRIRVJORVQgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9BTUQ9eQojIENP
TkZJR19BTUQ4MTExX0VUSCBpcyBub3Qgc2V0CiMgQ09ORklHX1BDTkVUMzIgaXMgbm90IHNldAoj
IENPTkZJR19BTURfWEdCRSBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0FRVUFOVElBPXkK
IyBDT05GSUdfQVFUSU9OIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfQVJDPXkKQ09ORklH
X05FVF9WRU5ET1JfQVRIRVJPUz15CiMgQ09ORklHX0FUTDIgaXMgbm90IHNldAojIENPTkZJR19B
VEwxIGlzIG5vdCBzZXQKIyBDT05GSUdfQVRMMUUgaXMgbm90IHNldAojIENPTkZJR19BVEwxQyBp
cyBub3Qgc2V0CiMgQ09ORklHX0FMWCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0JST0FE
Q09NPXkKIyBDT05GSUdfQjQ0IGlzIG5vdCBzZXQKQ09ORklHX0JDTUdFTkVUPXkKIyBDT05GSUdf
Qk5YMiBpcyBub3Qgc2V0CiMgQ09ORklHX0NOSUMgaXMgbm90IHNldAojIENPTkZJR19USUdPTjMg
aXMgbm90IHNldAojIENPTkZJR19CTlgyWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NZU1RFTVBPUlQg
aXMgbm90IHNldAojIENPTkZJR19CTlhUIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfQ0FE
RU5DRT15CiMgQ09ORklHX01BQ0IgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9DQVZJVU09
eQojIENPTkZJR19USFVOREVSX05JQ19QRiBpcyBub3Qgc2V0CiMgQ09ORklHX1RIVU5ERVJfTklD
X1ZGIGlzIG5vdCBzZXQKIyBDT05GSUdfVEhVTkRFUl9OSUNfQkdYIGlzIG5vdCBzZXQKIyBDT05G
SUdfVEhVTkRFUl9OSUNfUkdYIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0FWSVVNX1BUUCBpcyBub3Qg
c2V0CiMgQ09ORklHX0xJUVVJRElPIGlzIG5vdCBzZXQKIyBDT05GSUdfTElRVUlESU9fVkYgaXMg
bm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9DSEVMU0lPPXkKIyBDT05GSUdfQ0hFTFNJT19UMSBp
cyBub3Qgc2V0CiMgQ09ORklHX0NIRUxTSU9fVDMgaXMgbm90IHNldAojIENPTkZJR19DSEVMU0lP
X1Q0IGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hFTFNJT19UNFZGIGlzIG5vdCBzZXQKQ09ORklHX05F
VF9WRU5ET1JfQ0lTQ089eQojIENPTkZJR19FTklDIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5E
T1JfQ09SVElOQT15CiMgQ09ORklHX0dFTUlOSV9FVEhFUk5FVCBpcyBub3Qgc2V0CiMgQ09ORklH
X0RORVQgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9ERUM9eQojIENPTkZJR19ORVRfVFVM
SVAgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9ETElOSz15CiMgQ09ORklHX0RMMksgaXMg
bm90IHNldAojIENPTkZJR19TVU5EQU5DRSBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0VN
VUxFWD15CiMgQ09ORklHX0JFMk5FVCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0VaQ0hJ
UD15CiMgQ09ORklHX0VaQ0hJUF9OUFNfTUFOQUdFTUVOVF9FTkVUIGlzIG5vdCBzZXQKQ09ORklH
X05FVF9WRU5ET1JfR09PR0xFPXkKIyBDT05GSUdfR1ZFIGlzIG5vdCBzZXQKQ09ORklHX05FVF9W
RU5ET1JfSElTSUxJQ09OPXkKIyBDT05GSUdfSElYNUhEMl9HTUFDIGlzIG5vdCBzZXQKIyBDT05G
SUdfSElTSV9GRU1BQyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJUDA0X0VUSCBpcyBub3Qgc2V0CiMg
Q09ORklHX0hOU19EU0FGIGlzIG5vdCBzZXQKIyBDT05GSUdfSE5TX0VORVQgaXMgbm90IHNldAoj
IENPTkZJR19ITlMzIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfSFVBV0VJPXkKIyBDT05G
SUdfSElOSUMgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9JODI1WFg9eQpDT05GSUdfTkVU
X1ZFTkRPUl9JTlRFTD15CiMgQ09ORklHX0UxMDAgaXMgbm90IHNldAojIENPTkZJR19FMTAwMCBp
cyBub3Qgc2V0CiMgQ09ORklHX0UxMDAwRSBpcyBub3Qgc2V0CiMgQ09ORklHX0lHQiBpcyBub3Qg
c2V0CiMgQ09ORklHX0lHQlZGIGlzIG5vdCBzZXQKIyBDT05GSUdfSVhHQiBpcyBub3Qgc2V0CiMg
Q09ORklHX0lYR0JFIGlzIG5vdCBzZXQKIyBDT05GSUdfSVhHQkVWRiBpcyBub3Qgc2V0CiMgQ09O
RklHX0k0MEUgaXMgbm90IHNldAojIENPTkZJR19JNDBFVkYgaXMgbm90IHNldAojIENPTkZJR19J
Q0UgaXMgbm90IHNldAojIENPTkZJR19GTTEwSyBpcyBub3Qgc2V0CiMgQ09ORklHX0lHQyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0pNRSBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0xJVEVYPXkK
IyBDT05GSUdfTElURVhfTElURUVUSCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX01BUlZF
TEw9eQojIENPTkZJR19NVk1ESU8gaXMgbm90IHNldAojIENPTkZJR19TS0dFIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0tZMiBpcyBub3Qgc2V0CiMgQ09ORklHX09DVEVPTlRYMl9BRiBpcyBub3Qgc2V0
CiMgQ09ORklHX09DVEVPTlRYMl9QRiBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX01FTExB
Tk9YPXkKIyBDT05GSUdfTUxYNF9FTiBpcyBub3Qgc2V0CiMgQ09ORklHX01MWDVfQ09SRSBpcyBu
b3Qgc2V0CiMgQ09ORklHX01MWFNXX0NPUkUgaXMgbm90IHNldAojIENPTkZJR19NTFhGVyBpcyBu
b3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX01JQ1JFTD15CiMgQ09ORklHX0tTODg0MiBpcyBub3Qg
c2V0CiMgQ09ORklHX0tTODg1MSBpcyBub3Qgc2V0CiMgQ09ORklHX0tTODg1MV9NTEwgaXMgbm90
IHNldAojIENPTkZJR19LU1o4ODRYX1BDSSBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX01J
Q1JPQ0hJUD15CiMgQ09ORklHX0VOQzI4SjYwIGlzIG5vdCBzZXQKIyBDT05GSUdfRU5DWDI0SjYw
MCBpcyBub3Qgc2V0CiMgQ09ORklHX0xBTjc0M1ggaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRP
Ul9NSUNST1NFTUk9eQpDT05GSUdfTkVUX1ZFTkRPUl9NSUNST1NPRlQ9eQpDT05GSUdfTkVUX1ZF
TkRPUl9NWVJJPXkKIyBDT05GSUdfTVlSSTEwR0UgaXMgbm90IHNldAojIENPTkZJR19GRUFMTlgg
aXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9OST15CiMgQ09ORklHX05JX1hHRV9NQU5BR0VN
RU5UX0VORVQgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9OQVRTRU1JPXkKIyBDT05GSUdf
TkFUU0VNSSBpcyBub3Qgc2V0CiMgQ09ORklHX05TODM4MjAgaXMgbm90IHNldApDT05GSUdfTkVU
X1ZFTkRPUl9ORVRFUklPTj15CiMgQ09ORklHX1MySU8gaXMgbm90IHNldAojIENPTkZJR19WWEdF
IGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfTkVUUk9OT01FPXkKIyBDT05GSUdfTkZQIGlz
IG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfODM5MD15CiMgQ09ORklHX05FMktfUENJIGlzIG5v
dCBzZXQKQ09ORklHX05FVF9WRU5ET1JfTlZJRElBPXkKIyBDT05GSUdfRk9SQ0VERVRIIGlzIG5v
dCBzZXQKQ09ORklHX05FVF9WRU5ET1JfT0tJPXkKIyBDT05GSUdfRVRIT0MgaXMgbm90IHNldApD
T05GSUdfTkVUX1ZFTkRPUl9QQUNLRVRfRU5HSU5FUz15CiMgQ09ORklHX0hBTUFDSEkgaXMgbm90
IHNldAojIENPTkZJR19ZRUxMT1dGSU4gaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9QRU5T
QU5ETz15CiMgQ09ORklHX0lPTklDIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfUUxPR0lD
PXkKIyBDT05GSUdfUUxBM1hYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1FMQ05JQyBpcyBub3Qgc2V0
CkNPTkZJR19ORVRYRU5fTklDPXkKIyBDT05GSUdfUUVEIGlzIG5vdCBzZXQKQ09ORklHX05FVF9W
RU5ET1JfQlJPQ0FERT15CiMgQ09ORklHX0JOQSBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9S
X1FVQUxDT01NPXkKQ09ORklHX1FDQTcwMDA9bQojIENPTkZJR19RQ0E3MDAwX1NQSSBpcyBub3Qg
c2V0CkNPTkZJR19RQ0E3MDAwX1VBUlQ9bQojIENPTkZJR19RQ09NX0VNQUMgaXMgbm90IHNldAoj
IENPTkZJR19STU5FVCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX1JEQz15CiMgQ09ORklH
X1I2MDQwIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfUkVBTFRFSz15CiMgQ09ORklHXzgx
MzlDUCBpcyBub3Qgc2V0CiMgQ09ORklHXzgxMzlUT08gaXMgbm90IHNldAojIENPTkZJR19SODE2
OSBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX1JFTkVTQVM9eQpDT05GSUdfTkVUX1ZFTkRP
Ul9ST0NLRVI9eQpDT05GSUdfTkVUX1ZFTkRPUl9TQU1TVU5HPXkKIyBDT05GSUdfU1hHQkVfRVRI
IGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfU0VFUT15CkNPTkZJR19ORVRfVkVORE9SX1NJ
TEFOPXkKIyBDT05GSUdfU0M5MjAzMSBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX1NJUz15
CiMgQ09ORklHX1NJUzkwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NJUzE5MCBpcyBub3Qgc2V0CkNP
TkZJR19ORVRfVkVORE9SX1NPTEFSRkxBUkU9eQojIENPTkZJR19TRkMgaXMgbm90IHNldAojIENP
TkZJR19TRkNfRkFMQ09OIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfU01TQz15CiMgQ09O
RklHX1NNQzkxWCBpcyBub3Qgc2V0CiMgQ09ORklHX0VQSUMxMDAgaXMgbm90IHNldAojIENPTkZJ
R19TTVNDOTExWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NNU0M5NDIwIGlzIG5vdCBzZXQKQ09ORklH
X05FVF9WRU5ET1JfU09DSU9ORVhUPXkKQ09ORklHX05FVF9WRU5ET1JfU1RNSUNSTz15CiMgQ09O
RklHX1NUTU1BQ19FVEggaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9TVU49eQojIENPTkZJ
R19IQVBQWU1FQUwgaXMgbm90IHNldAojIENPTkZJR19TVU5HRU0gaXMgbm90IHNldAojIENPTkZJ
R19DQVNTSU5JIGlzIG5vdCBzZXQKIyBDT05GSUdfTklVIGlzIG5vdCBzZXQKQ09ORklHX05FVF9W
RU5ET1JfU1lOT1BTWVM9eQojIENPTkZJR19EV0NfWExHTUFDIGlzIG5vdCBzZXQKQ09ORklHX05F
VF9WRU5ET1JfVEVIVVRJPXkKIyBDT05GSUdfVEVIVVRJIGlzIG5vdCBzZXQKQ09ORklHX05FVF9W
RU5ET1JfVEk9eQojIENPTkZJR19USV9DUFNXX1BIWV9TRUwgaXMgbm90IHNldAojIENPTkZJR19U
TEFOIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfVklBPXkKIyBDT05GSUdfVklBX1JISU5F
IGlzIG5vdCBzZXQKIyBDT05GSUdfVklBX1ZFTE9DSVRZIGlzIG5vdCBzZXQKQ09ORklHX05FVF9W
RU5ET1JfV0laTkVUPXkKIyBDT05GSUdfV0laTkVUX1c1MTAwIGlzIG5vdCBzZXQKIyBDT05GSUdf
V0laTkVUX1c1MzAwIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfWElMSU5YPXkKIyBDT05G
SUdfWElMSU5YX0VNQUNMSVRFIGlzIG5vdCBzZXQKIyBDT05GSUdfWElMSU5YX0FYSV9FTUFDIGlz
IG5vdCBzZXQKIyBDT05GSUdfWElMSU5YX0xMX1RFTUFDIGlzIG5vdCBzZXQKIyBDT05GSUdfRkRE
SSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJUFBJIGlzIG5vdCBzZXQKQ09ORklHX1BIWUxJQj15CkNP
TkZJR19TV1BIWT15CkNPTkZJR19GSVhFRF9QSFk9eQoKIwojIE1JSSBQSFkgZGV2aWNlIGRyaXZl
cnMKIwojIENPTkZJR19BTURfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfQURJTl9QSFkgaXMgbm90
IHNldAojIENPTkZJR19BUVVBTlRJQV9QSFkgaXMgbm90IHNldApDT05GSUdfQVg4ODc5NkJfUEhZ
PXkKQ09ORklHX0JST0FEQ09NX1BIWT15CiMgQ09ORklHX0JDTTU0MTQwX1BIWSBpcyBub3Qgc2V0
CkNPTkZJR19CQ003WFhYX1BIWT15CiMgQ09ORklHX0JDTTg0ODgxX1BIWSBpcyBub3Qgc2V0CiMg
Q09ORklHX0JDTTg3WFhfUEhZIGlzIG5vdCBzZXQKQ09ORklHX0JDTV9ORVRfUEhZTElCPXkKIyBD
T05GSUdfQ0lDQURBX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX0NPUlRJTkFfUEhZIGlzIG5vdCBz
ZXQKIyBDT05GSUdfREFWSUNPTV9QSFkgaXMgbm90IHNldAojIENPTkZJR19JQ1BMVVNfUEhZIGlz
IG5vdCBzZXQKIyBDT05GSUdfTFhUX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX0lOVEVMX1hXQVlf
UEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfTFNJX0VUMTAxMUNfUEhZIGlzIG5vdCBzZXQKIyBDT05G
SUdfTUFSVkVMTF9QSFkgaXMgbm90IHNldAojIENPTkZJR19NQVJWRUxMXzEwR19QSFkgaXMgbm90
IHNldAojIENPTkZJR19NQVJWRUxMXzg4WDIyMjJfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfTUFY
TElORUFSX0dQSFkgaXMgbm90IHNldAojIENPTkZJR19NRURJQVRFS19HRV9QSFkgaXMgbm90IHNl
dApDT05GSUdfTUlDUkVMX1BIWT15CkNPTkZJR19NSUNST0NISVBfUEhZPXkKIyBDT05GSUdfTUlD
Uk9DSElQX1QxX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX01JQ1JPU0VNSV9QSFkgaXMgbm90IHNl
dAojIENPTkZJR19NT1RPUkNPTU1fUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfTkFUSU9OQUxfUEhZ
IGlzIG5vdCBzZXQKIyBDT05GSUdfTlhQX0M0NV9USkExMVhYX1BIWSBpcyBub3Qgc2V0CiMgQ09O
RklHX05YUF9USkExMVhYX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX0FUODAzWF9QSFkgaXMgbm90
IHNldAojIENPTkZJR19RU0VNSV9QSFkgaXMgbm90IHNldAojIENPTkZJR19SRUFMVEVLX1BIWSBp
cyBub3Qgc2V0CiMgQ09ORklHX1JFTkVTQVNfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfUk9DS0NI
SVBfUEhZIGlzIG5vdCBzZXQKQ09ORklHX1NNU0NfUEhZPXkKIyBDT05GSUdfU1RFMTBYUCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1RFUkFORVRJQ1NfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfRFA4Mzgy
Ml9QSFkgaXMgbm90IHNldAojIENPTkZJR19EUDgzVEM4MTFfUEhZIGlzIG5vdCBzZXQKIyBDT05G
SUdfRFA4Mzg0OF9QSFkgaXMgbm90IHNldAojIENPTkZJR19EUDgzODY3X1BIWSBpcyBub3Qgc2V0
CiMgQ09ORklHX0RQODM4NjlfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfVklURVNTRV9QSFkgaXMg
bm90IHNldAojIENPTkZJR19YSUxJTlhfR01JSTJSR01JSSBpcyBub3Qgc2V0CiMgQ09ORklHX01J
Q1JFTF9LUzg5OTVNQSBpcyBub3Qgc2V0CkNPTkZJR19NRElPX0RFVklDRT15CkNPTkZJR19NRElP
X0JVUz15CkNPTkZJR19GV05PREVfTURJTz15CkNPTkZJR19PRl9NRElPPXkKQ09ORklHX01ESU9f
REVWUkVTPXkKIyBDT05GSUdfTURJT19CSVRCQU5HIGlzIG5vdCBzZXQKQ09ORklHX01ESU9fQkNN
X1VOSU1BQz15CiMgQ09ORklHX01ESU9fSElTSV9GRU1BQyBpcyBub3Qgc2V0CiMgQ09ORklHX01E
SU9fTVZVU0IgaXMgbm90IHNldAojIENPTkZJR19NRElPX01TQ0NfTUlJTSBpcyBub3Qgc2V0CiMg
Q09ORklHX01ESU9fT0NURU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfTURJT19JUFE0MDE5IGlzIG5v
dCBzZXQKIyBDT05GSUdfTURJT19JUFE4MDY0IGlzIG5vdCBzZXQKIyBDT05GSUdfTURJT19USFVO
REVSIGlzIG5vdCBzZXQKCiMKIyBNRElPIE11bHRpcGxleGVycwojCiMgQ09ORklHX01ESU9fQlVT
X01VWF9HUElPIGlzIG5vdCBzZXQKIyBDT05GSUdfTURJT19CVVNfTVVYX01VTFRJUExFWEVSIGlz
IG5vdCBzZXQKIyBDT05GSUdfTURJT19CVVNfTVVYX01NSU9SRUcgaXMgbm90IHNldAoKIwojIFBD
UyBkZXZpY2UgZHJpdmVycwojCiMgQ09ORklHX1BDU19YUENTIGlzIG5vdCBzZXQKIyBlbmQgb2Yg
UENTIGRldmljZSBkcml2ZXJzCgpDT05GSUdfUFBQPW0KQ09ORklHX1BQUF9CU0RDT01QPW0KQ09O
RklHX1BQUF9ERUZMQVRFPW0KQ09ORklHX1BQUF9GSUxURVI9eQojIENPTkZJR19QUFBfTVBQRSBp
cyBub3Qgc2V0CkNPTkZJR19QUFBfTVVMVElMSU5LPXkKQ09ORklHX1BQUE9FPW0KIyBDT05GSUdf
UFBUUCBpcyBub3Qgc2V0CkNPTkZJR19QUFBfQVNZTkM9bQpDT05GSUdfUFBQX1NZTkNfVFRZPW0K
Q09ORklHX1NMSVA9bQpDT05GSUdfU0xIQz1tCkNPTkZJR19TTElQX0NPTVBSRVNTRUQ9eQpDT05G
SUdfU0xJUF9TTUFSVD15CkNPTkZJR19TTElQX01PREVfU0xJUDY9eQpDT05GSUdfVVNCX05FVF9E
UklWRVJTPXkKIyBDT05GSUdfVVNCX0NBVEMgaXMgbm90IHNldAojIENPTkZJR19VU0JfS0FXRVRI
IGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1BFR0FTVVMgaXMgbm90IHNldAojIENPTkZJR19VU0Jf
UlRMODE1MCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9SVEw4MTUyIGlzIG5vdCBzZXQKQ09ORklH
X1VTQl9MQU43OFhYPXkKQ09ORklHX1VTQl9VU0JORVQ9eQpDT05GSUdfVVNCX05FVF9BWDg4MTdY
PXkKQ09ORklHX1VTQl9ORVRfQVg4ODE3OV8xNzhBPXkKQ09ORklHX1VTQl9ORVRfQ0RDRVRIRVI9
eQojIENPTkZJR19VU0JfTkVUX0NEQ19FRU0gaXMgbm90IHNldApDT05GSUdfVVNCX05FVF9DRENf
TkNNPXkKIyBDT05GSUdfVVNCX05FVF9IVUFXRUlfQ0RDX05DTSBpcyBub3Qgc2V0CiMgQ09ORklH
X1VTQl9ORVRfQ0RDX01CSU0gaXMgbm90IHNldAojIENPTkZJR19VU0JfTkVUX0RNOTYwMSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1VTQl9ORVRfU1I5NzAwIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX05F
VF9TUjk4MDAgaXMgbm90IHNldAojIENPTkZJR19VU0JfTkVUX1NNU0M3NVhYIGlzIG5vdCBzZXQK
Q09ORklHX1VTQl9ORVRfU01TQzk1WFg9eQojIENPTkZJR19VU0JfTkVUX0dMNjIwQSBpcyBub3Qg
c2V0CkNPTkZJR19VU0JfTkVUX05FVDEwODA9eQojIENPTkZJR19VU0JfTkVUX1BMVVNCIGlzIG5v
dCBzZXQKIyBDT05GSUdfVVNCX05FVF9NQ1M3ODMwIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX05F
VF9STkRJU19IT1NUIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9ORVRfQ0RDX1NVQlNFVF9FTkFCTEU9
eQpDT05GSUdfVVNCX05FVF9DRENfU1VCU0VUPXkKQ09ORklHX1VTQl9BTElfTTU2MzI9eQpDT05G
SUdfVVNCX0FOMjcyMD15CkNPTkZJR19VU0JfQkVMS0lOPXkKQ09ORklHX1VTQl9BUk1MSU5VWD15
CkNPTkZJR19VU0JfRVBTT04yODg4PXkKQ09ORklHX1VTQl9LQzIxOTA9eQpDT05GSUdfVVNCX05F
VF9aQVVSVVM9eQojIENPTkZJR19VU0JfTkVUX0NYODIzMTBfRVRIIGlzIG5vdCBzZXQKIyBDT05G
SUdfVVNCX05FVF9LQUxNSUEgaXMgbm90IHNldAojIENPTkZJR19VU0JfTkVUX1FNSV9XV0FOIGlz
IG5vdCBzZXQKIyBDT05GSUdfVVNCX0hTTyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9ORVRfSU5U
NTFYMSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9JUEhFVEggaXMgbm90IHNldAojIENPTkZJR19V
U0JfU0lFUlJBX05FVCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9WTDYwMCBpcyBub3Qgc2V0CiMg
Q09ORklHX1VTQl9ORVRfQ0g5MjAwIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9ORVRfQVFDMTExPXkK
Q09ORklHX1VTQl9SVEw4MTUzX0VDTT15CkNPTkZJR19XTEFOPXkKQ09ORklHX1dMQU5fVkVORE9S
X0FETVRFSz15CiMgQ09ORklHX0FETTgyMTEgaXMgbm90IHNldApDT05GSUdfV0xBTl9WRU5ET1Jf
QVRIPXkKIyBDT05GSUdfQVRIX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfQVRINUsgaXMgbm90
IHNldAojIENPTkZJR19BVEg1S19QQ0kgaXMgbm90IHNldAojIENPTkZJR19BVEg5SyBpcyBub3Qg
c2V0CiMgQ09ORklHX0FUSDlLX0hUQyBpcyBub3Qgc2V0CiMgQ09ORklHX0NBUkw5MTcwIGlzIG5v
dCBzZXQKIyBDT05GSUdfQVRINktMIGlzIG5vdCBzZXQKIyBDT05GSUdfQVI1NTIzIGlzIG5vdCBz
ZXQKIyBDT05GSUdfV0lMNjIxMCBpcyBub3Qgc2V0CiMgQ09ORklHX0FUSDEwSyBpcyBub3Qgc2V0
CiMgQ09ORklHX1dDTjM2WFggaXMgbm90IHNldAojIENPTkZJR19BVEgxMUsgaXMgbm90IHNldApD
T05GSUdfV0xBTl9WRU5ET1JfQVRNRUw9eQojIENPTkZJR19BVE1FTCBpcyBub3Qgc2V0CiMgQ09O
RklHX0FUNzZDNTBYX1VTQiBpcyBub3Qgc2V0CkNPTkZJR19XTEFOX1ZFTkRPUl9CUk9BRENPTT15
CkNPTkZJR19CNDM9bQpDT05GSUdfQjQzX0JDTUE9eQpDT05GSUdfQjQzX1NTQj15CkNPTkZJR19C
NDNfQlVTRVNfQkNNQV9BTkRfU1NCPXkKIyBDT05GSUdfQjQzX0JVU0VTX0JDTUEgaXMgbm90IHNl
dAojIENPTkZJR19CNDNfQlVTRVNfU1NCIGlzIG5vdCBzZXQKQ09ORklHX0I0M19QQ0lfQVVUT1NF
TEVDVD15CkNPTkZJR19CNDNfUENJQ09SRV9BVVRPU0VMRUNUPXkKIyBDT05GSUdfQjQzX1NESU8g
aXMgbm90IHNldApDT05GSUdfQjQzX0JDTUFfUElPPXkKQ09ORklHX0I0M19QSU89eQpDT05GSUdf
QjQzX1BIWV9HPXkKQ09ORklHX0I0M19QSFlfTj15CkNPTkZJR19CNDNfUEhZX0xQPXkKQ09ORklH
X0I0M19QSFlfSFQ9eQpDT05GSUdfQjQzX0hXUk5HPXkKIyBDT05GSUdfQjQzX0RFQlVHIGlzIG5v
dCBzZXQKQ09ORklHX0I0M0xFR0FDWT1tCkNPTkZJR19CNDNMRUdBQ1lfUENJX0FVVE9TRUxFQ1Q9
eQpDT05GSUdfQjQzTEVHQUNZX1BDSUNPUkVfQVVUT1NFTEVDVD15CkNPTkZJR19CNDNMRUdBQ1lf
SFdSTkc9eQpDT05GSUdfQjQzTEVHQUNZX0RFQlVHPXkKQ09ORklHX0I0M0xFR0FDWV9ETUE9eQpD
T05GSUdfQjQzTEVHQUNZX1BJTz15CkNPTkZJR19CNDNMRUdBQ1lfRE1BX0FORF9QSU9fTU9ERT15
CiMgQ09ORklHX0I0M0xFR0FDWV9ETUFfTU9ERSBpcyBub3Qgc2V0CiMgQ09ORklHX0I0M0xFR0FD
WV9QSU9fTU9ERSBpcyBub3Qgc2V0CkNPTkZJR19CUkNNVVRJTD1tCiMgQ09ORklHX0JSQ01TTUFD
IGlzIG5vdCBzZXQKQ09ORklHX0JSQ01GTUFDPW0KQ09ORklHX0JSQ01GTUFDX1BST1RPX0JDREM9
eQpDT05GSUdfQlJDTUZNQUNfU0RJTz15CkNPTkZJR19CUkNNRk1BQ19VU0I9eQojIENPTkZJR19C
UkNNRk1BQ19QQ0lFIGlzIG5vdCBzZXQKIyBDT05GSUdfQlJDTV9UUkFDSU5HIGlzIG5vdCBzZXQK
IyBDT05GSUdfQlJDTURCRyBpcyBub3Qgc2V0CkNPTkZJR19XTEFOX1ZFTkRPUl9DSVNDTz15CkNP
TkZJR19XTEFOX1ZFTkRPUl9JTlRFTD15CiMgQ09ORklHX0lQVzIxMDAgaXMgbm90IHNldAojIENP
TkZJR19JUFcyMjAwIGlzIG5vdCBzZXQKIyBDT05GSUdfSVdMNDk2NSBpcyBub3Qgc2V0CiMgQ09O
RklHX0lXTDM5NDUgaXMgbm90IHNldAojIENPTkZJR19JV0xXSUZJIGlzIG5vdCBzZXQKQ09ORklH
X1dMQU5fVkVORE9SX0lOVEVSU0lMPXkKQ09ORklHX0hPU1RBUD15CiMgQ09ORklHX0hPU1RBUF9G
SVJNV0FSRSBpcyBub3Qgc2V0CiMgQ09ORklHX0hPU1RBUF9QTFggaXMgbm90IHNldAojIENPTkZJ
R19IT1NUQVBfUENJIGlzIG5vdCBzZXQKIyBDT05GSUdfSEVSTUVTIGlzIG5vdCBzZXQKIyBDT05G
SUdfUDU0X0NPTU1PTiBpcyBub3Qgc2V0CkNPTkZJR19XTEFOX1ZFTkRPUl9NQVJWRUxMPXkKIyBD
T05GSUdfTElCRVJUQVMgaXMgbm90IHNldAojIENPTkZJR19MSUJFUlRBU19USElORklSTSBpcyBu
b3Qgc2V0CkNPTkZJR19NV0lGSUVYPW0KQ09ORklHX01XSUZJRVhfU0RJTz1tCiMgQ09ORklHX01X
SUZJRVhfUENJRSBpcyBub3Qgc2V0CiMgQ09ORklHX01XSUZJRVhfVVNCIGlzIG5vdCBzZXQKIyBD
T05GSUdfTVdMOEsgaXMgbm90IHNldApDT05GSUdfV0xBTl9WRU5ET1JfTUVESUFURUs9eQojIENP
TkZJR19NVDc2MDFVIGlzIG5vdCBzZXQKIyBDT05GSUdfTVQ3NngwVSBpcyBub3Qgc2V0CiMgQ09O
RklHX01UNzZ4MEUgaXMgbm90IHNldAojIENPTkZJR19NVDc2eDJFIGlzIG5vdCBzZXQKIyBDT05G
SUdfTVQ3NngyVSBpcyBub3Qgc2V0CiMgQ09ORklHX01UNzYwM0UgaXMgbm90IHNldAojIENPTkZJ
R19NVDc2MTVFIGlzIG5vdCBzZXQKIyBDT05GSUdfTVQ3NjYzVSBpcyBub3Qgc2V0CiMgQ09ORklH
X01UNzY2M1MgaXMgbm90IHNldAojIENPTkZJR19NVDc5MTVFIGlzIG5vdCBzZXQKIyBDT05GSUdf
TVQ3OTIxRSBpcyBub3Qgc2V0CkNPTkZJR19XTEFOX1ZFTkRPUl9NSUNST0NISVA9eQojIENPTkZJ
R19XSUxDMTAwMF9TRElPIGlzIG5vdCBzZXQKIyBDT05GSUdfV0lMQzEwMDBfU1BJIGlzIG5vdCBz
ZXQKQ09ORklHX1dMQU5fVkVORE9SX1JBTElOSz15CkNPTkZJR19SVDJYMDA9bQojIENPTkZJR19S
VDI0MDBQQ0kgaXMgbm90IHNldAojIENPTkZJR19SVDI1MDBQQ0kgaXMgbm90IHNldAojIENPTkZJ
R19SVDYxUENJIGlzIG5vdCBzZXQKIyBDT05GSUdfUlQyODAwUENJIGlzIG5vdCBzZXQKIyBDT05G
SUdfUlQyNTAwVVNCIGlzIG5vdCBzZXQKQ09ORklHX1JUNzNVU0I9bQojIENPTkZJR19SVDI4MDBV
U0IgaXMgbm90IHNldApDT05GSUdfUlQyWDAwX0xJQl9VU0I9bQpDT05GSUdfUlQyWDAwX0xJQj1t
CkNPTkZJR19SVDJYMDBfTElCX0ZJUk1XQVJFPXkKQ09ORklHX1JUMlgwMF9MSUJfQ1JZUFRPPXkK
Q09ORklHX1JUMlgwMF9MSUJfTEVEUz15CiMgQ09ORklHX1JUMlgwMF9ERUJVRyBpcyBub3Qgc2V0
CkNPTkZJR19XTEFOX1ZFTkRPUl9SRUFMVEVLPXkKIyBDT05GSUdfUlRMODE4MCBpcyBub3Qgc2V0
CiMgQ09ORklHX1JUTDgxODcgaXMgbm90IHNldApDT05GSUdfUlRMX0NBUkRTPW0KIyBDT05GSUdf
UlRMODE5MkNFIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRMODE5MlNFIGlzIG5vdCBzZXQKIyBDT05G
SUdfUlRMODE5MkRFIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRMODcyM0FFIGlzIG5vdCBzZXQKIyBD
T05GSUdfUlRMODcyM0JFIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRMODE4OEVFIGlzIG5vdCBzZXQK
IyBDT05GSUdfUlRMODE5MkVFIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRMODgyMUFFIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUlRMODE5MkNVIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRMOFhYWFUgaXMgbm90
IHNldAojIENPTkZJR19SVFc4OCBpcyBub3Qgc2V0CkNPTkZJR19XTEFOX1ZFTkRPUl9SU0k9eQoj
IENPTkZJR19SU0lfOTFYIGlzIG5vdCBzZXQKQ09ORklHX1dMQU5fVkVORE9SX1NUPXkKIyBDT05G
SUdfQ1cxMjAwIGlzIG5vdCBzZXQKQ09ORklHX1dMQU5fVkVORE9SX1RJPXkKIyBDT05GSUdfV0wx
MjUxIGlzIG5vdCBzZXQKIyBDT05GSUdfV0wxMlhYIGlzIG5vdCBzZXQKIyBDT05GSUdfV0wxOFhY
IGlzIG5vdCBzZXQKIyBDT05GSUdfV0xDT1JFIGlzIG5vdCBzZXQKQ09ORklHX1dMQU5fVkVORE9S
X1pZREFTPXkKIyBDT05GSUdfVVNCX1pEMTIwMSBpcyBub3Qgc2V0CiMgQ09ORklHX1pEMTIxMVJX
IGlzIG5vdCBzZXQKQ09ORklHX1dMQU5fVkVORE9SX1FVQU5URU5OQT15CiMgQ09ORklHX1FUTkZN
QUNfUENJRSBpcyBub3Qgc2V0CiMgQ09ORklHX01BQzgwMjExX0hXU0lNIGlzIG5vdCBzZXQKIyBD
T05GSUdfVVNCX05FVF9STkRJU19XTEFOIGlzIG5vdCBzZXQKIyBDT05GSUdfVklSVF9XSUZJIGlz
IG5vdCBzZXQKIyBDT05GSUdfV0FOIGlzIG5vdCBzZXQKCiMKIyBXaXJlbGVzcyBXQU4KIwojIENP
TkZJR19XV0FOIGlzIG5vdCBzZXQKIyBlbmQgb2YgV2lyZWxlc3MgV0FOCgpDT05GSUdfWEVOX05F
VERFVl9GUk9OVEVORD15CkNPTkZJR19YRU5fTkVUREVWX0JBQ0tFTkQ9bQojIENPTkZJR19WTVhO
RVQzIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUREVWU0lNIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVU
X0ZBSUxPVkVSIGlzIG5vdCBzZXQKQ09ORklHX0lTRE49eQpDT05GSUdfSVNETl9DQVBJPXkKQ09O
RklHX0NBUElfVFJBQ0U9eQpDT05GSUdfSVNETl9DQVBJX01JRERMRVdBUkU9eQojIENPTkZJR19N
SVNETiBpcyBub3Qgc2V0CgojCiMgSW5wdXQgZGV2aWNlIHN1cHBvcnQKIwpDT05GSUdfSU5QVVQ9
eQpDT05GSUdfSU5QVVRfTEVEUz15CkNPTkZJR19JTlBVVF9GRl9NRU1MRVNTPW0KIyBDT05GSUdf
SU5QVVRfU1BBUlNFS01BUCBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX01BVFJJWEtNQVAgaXMg
bm90IHNldAoKIwojIFVzZXJsYW5kIGludGVyZmFjZXMKIwojIENPTkZJR19JTlBVVF9NT1VTRURF
ViBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX0pPWURFViBpcyBub3Qgc2V0CkNPTkZJR19JTlBV
VF9FVkRFVj15CiMgQ09ORklHX0lOUFVUX0VWQlVHIGlzIG5vdCBzZXQKCiMKIyBJbnB1dCBEZXZp
Y2UgRHJpdmVycwojCkNPTkZJR19JTlBVVF9LRVlCT0FSRD15CiMgQ09ORklHX0tFWUJPQVJEX0FE
QyBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX0FEUDU1ODggaXMgbm90IHNldAojIENPTkZJ
R19LRVlCT0FSRF9BRFA1NTg5IGlzIG5vdCBzZXQKQ09ORklHX0tFWUJPQVJEX0FUS0JEPXkKIyBD
T05GSUdfS0VZQk9BUkRfUVQxMDUwIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfUVQxMDcw
IGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfUVQyMTYwIGlzIG5vdCBzZXQKIyBDT05GSUdf
S0VZQk9BUkRfRExJTktfRElSNjg1IGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfTEtLQkQg
aXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9HUElPIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZ
Qk9BUkRfR1BJT19QT0xMRUQgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9UQ0E2NDE2IGlz
IG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfVENBODQxOCBpcyBub3Qgc2V0CiMgQ09ORklHX0tF
WUJPQVJEX01BVFJJWCBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX0xNODMyMyBpcyBub3Qg
c2V0CiMgQ09ORklHX0tFWUJPQVJEX0xNODMzMyBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJE
X01BWDczNTkgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9NQ1MgaXMgbm90IHNldAojIENP
TkZJR19LRVlCT0FSRF9NUFIxMjEgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9ORVdUT04g
aXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9PUEVOQ09SRVMgaXMgbm90IHNldAojIENPTkZJ
R19LRVlCT0FSRF9TQU1TVU5HIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfU1RPV0FXQVkg
aXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9TVU5LQkQgaXMgbm90IHNldAojIENPTkZJR19L
RVlCT0FSRF9TVE1QRSBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX09NQVA0IGlzIG5vdCBz
ZXQKIyBDT05GSUdfS0VZQk9BUkRfVE0yX1RPVUNIS0VZIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZ
Qk9BUkRfWFRLQkQgaXMgbm90IHNldApDT05GSUdfS0VZQk9BUkRfQ0FQMTFYWD1tCiMgQ09ORklH
X0tFWUJPQVJEX0JDTSBpcyBub3Qgc2V0CkNPTkZJR19JTlBVVF9NT1VTRT15CkNPTkZJR19NT1VT
RV9QUzI9eQpDT05GSUdfTU9VU0VfUFMyX0FMUFM9eQpDT05GSUdfTU9VU0VfUFMyX0JZRD15CkNP
TkZJR19NT1VTRV9QUzJfTE9HSVBTMlBQPXkKQ09ORklHX01PVVNFX1BTMl9TWU5BUFRJQ1M9eQpD
T05GSUdfTU9VU0VfUFMyX1NZTkFQVElDU19TTUJVUz15CkNPTkZJR19NT1VTRV9QUzJfQ1lQUkVT
Uz15CkNPTkZJR19NT1VTRV9QUzJfVFJBQ0tQT0lOVD15CiMgQ09ORklHX01PVVNFX1BTMl9FTEFO
VEVDSCBpcyBub3Qgc2V0CiMgQ09ORklHX01PVVNFX1BTMl9TRU5URUxJQyBpcyBub3Qgc2V0CiMg
Q09ORklHX01PVVNFX1BTMl9UT1VDSEtJVCBpcyBub3Qgc2V0CkNPTkZJR19NT1VTRV9QUzJfRk9D
QUxURUNIPXkKQ09ORklHX01PVVNFX1BTMl9TTUJVUz15CiMgQ09ORklHX01PVVNFX1NFUklBTCBp
cyBub3Qgc2V0CiMgQ09ORklHX01PVVNFX0FQUExFVE9VQ0ggaXMgbm90IHNldAojIENPTkZJR19N
T1VTRV9CQ001OTc0IGlzIG5vdCBzZXQKIyBDT05GSUdfTU9VU0VfQ1lBUEEgaXMgbm90IHNldAoj
IENPTkZJR19NT1VTRV9FTEFOX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX01PVVNFX1ZTWFhYQUEg
aXMgbm90IHNldAojIENPTkZJR19NT1VTRV9HUElPIGlzIG5vdCBzZXQKIyBDT05GSUdfTU9VU0Vf
U1lOQVBUSUNTX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX01PVVNFX1NZTkFQVElDU19VU0IgaXMg
bm90IHNldAojIENPTkZJR19JTlBVVF9KT1lTVElDSyBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVU
X1RBQkxFVCBpcyBub3Qgc2V0CkNPTkZJR19JTlBVVF9UT1VDSFNDUkVFTj15CiMgQ09ORklHX1RP
VUNIU0NSRUVOX0FEUzc4NDYgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9BRDc4Nzcg
aXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9BRDc4NzkgaXMgbm90IHNldAojIENPTkZJ
R19UT1VDSFNDUkVFTl9BREMgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9BUjEwMjFf
STJDIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fQVRNRUxfTVhUIGlzIG5vdCBzZXQK
IyBDT05GSUdfVE9VQ0hTQ1JFRU5fQVVPX1BJWENJUiBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNI
U0NSRUVOX0JVMjEwMTMgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9CVTIxMDI5IGlz
IG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fQ0hJUE9ORV9JQ044MzE4IGlzIG5vdCBzZXQK
IyBDT05GSUdfVE9VQ0hTQ1JFRU5fQ1k4Q1RNQTE0MCBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNI
U0NSRUVOX0NZOENUTUcxMTAgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9DWVRUU1Bf
Q09SRSBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0NZVFRTUDRfQ09SRSBpcyBub3Qg
c2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0RZTkFQUk8gaXMgbm90IHNldAojIENPTkZJR19UT1VD
SFNDUkVFTl9IQU1QU0hJUkUgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9FRVRJIGlz
IG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fRUdBTEFYIGlzIG5vdCBzZXQKIyBDT05GSUdf
VE9VQ0hTQ1JFRU5fRUdBTEFYX1NFUklBTCBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVO
X0VYQzMwMDAgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9GVUpJVFNVIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fR09PRElYIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hT
Q1JFRU5fSElERUVQIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fSFlDT05fSFk0NlhY
IGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fSUxJMjEwWCBpcyBub3Qgc2V0CiMgQ09O
RklHX1RPVUNIU0NSRUVOX0lMSVRFSyBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1M2
U1k3NjEgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9HVU5aRSBpcyBub3Qgc2V0CiMg
Q09ORklHX1RPVUNIU0NSRUVOX0VLVEYyMTI3IGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JF
RU5fRUxBTiBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0VMTyBpcyBub3Qgc2V0CiMg
Q09ORklHX1RPVUNIU0NSRUVOX1dBQ09NX1c4MDAxIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hT
Q1JFRU5fV0FDT01fSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fTUFYMTE4MDEg
aXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9NQ1M1MDAwIGlzIG5vdCBzZXQKIyBDT05G
SUdfVE9VQ0hTQ1JFRU5fTU1TMTE0IGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fTUVM
RkFTX01JUDQgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9NU0cyNjM4IGlzIG5vdCBz
ZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fTVRPVUNIIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hT
Q1JFRU5fSU1YNlVMX1RTQyBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0lORVhJTyBp
cyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX01LNzEyIGlzIG5vdCBzZXQKIyBDT05GSUdf
VE9VQ0hTQ1JFRU5fUEVOTU9VTlQgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9FRFRf
RlQ1WDA2IGlzIG5vdCBzZXQKQ09ORklHX1RPVUNIU0NSRUVOX1JBU1BCRVJSWVBJX0ZXPW0KIyBD
T05GSUdfVE9VQ0hTQ1JFRU5fVE9VQ0hSSUdIVCBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NS
RUVOX1RPVUNIV0lOIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fUElYQ0lSIGlzIG5v
dCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fV0RUODdYWF9JMkMgaXMgbm90IHNldAojIENPTkZJ
R19UT1VDSFNDUkVFTl9VU0JfQ09NUE9TSVRFIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JF
RU5fVE9VQ0hJVDIxMyBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1RTQ19TRVJJTyBp
cyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1RTQzIwMDQgaXMgbm90IHNldAojIENPTkZJ
R19UT1VDSFNDUkVFTl9UU0MyMDA1IGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fVFND
MjAwNyBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1JNX1RTIGlzIG5vdCBzZXQKIyBD
T05GSUdfVE9VQ0hTQ1JFRU5fU0lMRUFEIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5f
U0lTX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1NUMTIzMiBpcyBub3Qgc2V0
CiMgQ09ORklHX1RPVUNIU0NSRUVOX1NUTUZUUyBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NS
RUVOX1NUTVBFIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fU1VSNDAgaXMgbm90IHNl
dAojIENPTkZJR19UT1VDSFNDUkVFTl9TVVJGQUNFM19TUEkgaXMgbm90IHNldAojIENPTkZJR19U
T1VDSFNDUkVFTl9TWDg2NTQgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9UUFM2NTA3
WCBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1pFVDYyMjMgaXMgbm90IHNldAojIENP
TkZJR19UT1VDSFNDUkVFTl9aRk9SQ0UgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9S
T0hNX0JVMjEwMjMgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9JUVM1WFggaXMgbm90
IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9aSU5JVElYIGlzIG5vdCBzZXQKQ09ORklHX0lOUFVU
X01JU0M9eQojIENPTkZJR19JTlBVVF9BRDcxNFggaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9B
UklaT05BX0hBUFRJQ1MgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9BVE1FTF9DQVBUT1VDSCBp
cyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX0JNQTE1MCBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVU
X0UzWDBfQlVUVE9OIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfTU1BODQ1MCBpcyBub3Qgc2V0
CiMgQ09ORklHX0lOUFVUX0dQSU9fQkVFUEVSIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfR1BJ
T19ERUNPREVSIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfR1BJT19WSUJSQSBpcyBub3Qgc2V0
CiMgQ09ORklHX0lOUFVUX0FUSV9SRU1PVEUyIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfS0VZ
U1BBTl9SRU1PVEUgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9LWFRKOSBpcyBub3Qgc2V0CiMg
Q09ORklHX0lOUFVUX1BPV0VSTUFURSBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX1lFQUxJTksg
aXMgbm90IHNldAojIENPTkZJR19JTlBVVF9DTTEwOSBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVU
X1JFR1VMQVRPUl9IQVBUSUMgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9VSU5QVVQgaXMgbm90
IHNldAojIENPTkZJR19JTlBVVF9QQ0Y4NTc0IGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfUFdN
X0JFRVBFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX1BXTV9WSUJSQSBpcyBub3Qgc2V0CiMg
Q09ORklHX0lOUFVUX0dQSU9fUk9UQVJZX0VOQ09ERVIgaXMgbm90IHNldAojIENPTkZJR19JTlBV
VF9EQTcyODBfSEFQVElDUyBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX0FEWEwzNFggaXMgbm90
IHNldAojIENPTkZJR19JTlBVVF9JTVNfUENVIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfSVFT
MjY5QSBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX0lRUzYyNkEgaXMgbm90IHNldAojIENPTkZJ
R19JTlBVVF9DTUEzMDAwIGlzIG5vdCBzZXQKQ09ORklHX0lOUFVUX1hFTl9LQkRERVZfRlJPTlRF
TkQ9eQojIENPTkZJR19JTlBVVF9EUlYyNjBYX0hBUFRJQ1MgaXMgbm90IHNldAojIENPTkZJR19J
TlBVVF9EUlYyNjY1X0hBUFRJQ1MgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9EUlYyNjY3X0hB
UFRJQ1MgaXMgbm90IHNldAojIENPTkZJR19STUk0X0NPUkUgaXMgbm90IHNldAoKIwojIEhhcmR3
YXJlIEkvTyBwb3J0cwojCkNPTkZJR19TRVJJTz15CkNPTkZJR19TRVJJT19TRVJQT1JUPXkKIyBD
T05GSUdfU0VSSU9fQU1CQUtNSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklPX1BDSVBTMiBpcyBu
b3Qgc2V0CkNPTkZJR19TRVJJT19MSUJQUzI9eQojIENPTkZJR19TRVJJT19SQVcgaXMgbm90IHNl
dAojIENPTkZJR19TRVJJT19BTFRFUkFfUFMyIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSU9fUFMy
TVVMVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklPX0FSQ19QUzIgaXMgbm90IHNldAojIENPTkZJ
R19TRVJJT19BUEJQUzIgaXMgbm90IHNldAojIENPTkZJR19TRVJJT19HUElPX1BTMiBpcyBub3Qg
c2V0CiMgQ09ORklHX1VTRVJJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0dBTUVQT1JUIGlzIG5vdCBz
ZXQKIyBlbmQgb2YgSGFyZHdhcmUgSS9PIHBvcnRzCiMgZW5kIG9mIElucHV0IGRldmljZSBzdXBw
b3J0CgojCiMgQ2hhcmFjdGVyIGRldmljZXMKIwpDT05GSUdfVFRZPXkKQ09ORklHX1ZUPXkKQ09O
RklHX0NPTlNPTEVfVFJBTlNMQVRJT05TPXkKQ09ORklHX1ZUX0NPTlNPTEU9eQpDT05GSUdfVlRf
Q09OU09MRV9TTEVFUD15CkNPTkZJR19IV19DT05TT0xFPXkKQ09ORklHX1ZUX0hXX0NPTlNPTEVf
QklORElORz15CkNPTkZJR19VTklYOThfUFRZUz15CiMgQ09ORklHX0xFR0FDWV9QVFlTIGlzIG5v
dCBzZXQKQ09ORklHX0xESVNDX0FVVE9MT0FEPXkKCiMKIyBTZXJpYWwgZHJpdmVycwojCkNPTkZJ
R19TRVJJQUxfRUFSTFlDT049eQpDT05GSUdfU0VSSUFMXzgyNTA9eQpDT05GSUdfU0VSSUFMXzgy
NTBfREVQUkVDQVRFRF9PUFRJT05TPXkKQ09ORklHX1NFUklBTF84MjUwXzE2NTUwQV9WQVJJQU5U
Uz15CiMgQ09ORklHX1NFUklBTF84MjUwX0ZJTlRFSyBpcyBub3Qgc2V0CkNPTkZJR19TRVJJQUxf
ODI1MF9DT05TT0xFPXkKQ09ORklHX1NFUklBTF84MjUwX0RNQT15CkNPTkZJR19TRVJJQUxfODI1
MF9QQ0k9eQpDT05GSUdfU0VSSUFMXzgyNTBfRVhBUj15CkNPTkZJR19TRVJJQUxfODI1MF9OUl9V
QVJUUz0xCkNPTkZJR19TRVJJQUxfODI1MF9SVU5USU1FX1VBUlRTPTEKQ09ORklHX1NFUklBTF84
MjUwX0VYVEVOREVEPXkKIyBDT05GSUdfU0VSSUFMXzgyNTBfTUFOWV9QT1JUUyBpcyBub3Qgc2V0
CiMgQ09ORklHX1NFUklBTF84MjUwX0FTUEVFRF9WVUFSVCBpcyBub3Qgc2V0CkNPTkZJR19TRVJJ
QUxfODI1MF9TSEFSRV9JUlE9eQojIENPTkZJR19TRVJJQUxfODI1MF9ERVRFQ1RfSVJRIGlzIG5v
dCBzZXQKIyBDT05GSUdfU0VSSUFMXzgyNTBfUlNBIGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF84
MjUwX0JDTTI4MzVBVVg9eQpDT05GSUdfU0VSSUFMXzgyNTBfRlNMPXkKIyBDT05GSUdfU0VSSUFM
XzgyNTBfRFcgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfODI1MF9SVDI4OFggaXMgbm90IHNl
dApDT05GSUdfU0VSSUFMX09GX1BMQVRGT1JNPXkKCiMKIyBOb24tODI1MCBzZXJpYWwgcG9ydCBz
dXBwb3J0CiMKIyBDT05GSUdfU0VSSUFMX0FNQkFfUEwwMTAgaXMgbm90IHNldApDT05GSUdfU0VS
SUFMX0FNQkFfUEwwMTE9eQpDT05GSUdfU0VSSUFMX0FNQkFfUEwwMTFfQ09OU09MRT15CiMgQ09O
RklHX1NFUklBTF9FQVJMWUNPTl9BUk1fU0VNSUhPU1QgaXMgbm90IHNldAojIENPTkZJR19TRVJJ
QUxfS0dEQl9OTUkgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfTUFYMzEwMCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NFUklBTF9NQVgzMTBYIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX1VBUlRM
SVRFIGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF9DT1JFPXkKQ09ORklHX1NFUklBTF9DT1JFX0NP
TlNPTEU9eQpDT05GSUdfQ09OU09MRV9QT0xMPXkKIyBDT05GSUdfU0VSSUFMX0pTTSBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFUklBTF9TSUZJVkUgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfU0ND
TlhQIGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF9TQzE2SVM3WFhfQ09SRT1tCkNPTkZJR19TRVJJ
QUxfU0MxNklTN1hYPW0KQ09ORklHX1NFUklBTF9TQzE2SVM3WFhfSTJDPXkKQ09ORklHX1NFUklB
TF9TQzE2SVM3WFhfU1BJPXkKIyBDT05GSUdfU0VSSUFMX0JDTTYzWFggaXMgbm90IHNldAojIENP
TkZJR19TRVJJQUxfQUxURVJBX0pUQUdVQVJUIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX0FM
VEVSQV9VQVJUIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX1hJTElOWF9QU19VQVJUIGlzIG5v
dCBzZXQKIyBDT05GSUdfU0VSSUFMX0FSQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9SUDIg
aXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfRlNMX0xQVUFSVCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFUklBTF9GU0xfTElORkxFWFVBUlQgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfQ09ORVhB
TlRfRElHSUNPTE9SIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX1NQUkQgaXMgbm90IHNldAoj
IGVuZCBvZiBTZXJpYWwgZHJpdmVycwoKQ09ORklHX1NFUklBTF9NQ1RSTF9HUElPPXkKIyBDT05G
SUdfU0VSSUFMX05PTlNUQU5EQVJEIGlzIG5vdCBzZXQKIyBDT05GSUdfTl9HU00gaXMgbm90IHNl
dAojIENPTkZJR19OT1pPTUkgaXMgbm90IHNldAojIENPTkZJR19OVUxMX1RUWSBpcyBub3Qgc2V0
CkNPTkZJR19IVkNfRFJJVkVSPXkKQ09ORklHX0hWQ19JUlE9eQpDT05GSUdfSFZDX1hFTj15CkNP
TkZJR19IVkNfWEVOX0ZST05URU5EPXkKIyBDT05GSUdfSFZDX0RDQyBpcyBub3Qgc2V0CkNPTkZJ
R19TRVJJQUxfREVWX0JVUz15CkNPTkZJR19TRVJJQUxfREVWX0NUUkxfVFRZUE9SVD15CiMgQ09O
RklHX1RUWV9QUklOVEsgaXMgbm90IHNldAojIENPTkZJR19WSVJUSU9fQ09OU09MRSBpcyBub3Qg
c2V0CiMgQ09ORklHX0lQTUlfSEFORExFUiBpcyBub3Qgc2V0CkNPTkZJR19IV19SQU5ET009eQoj
IENPTkZJR19IV19SQU5ET01fVElNRVJJT01FTSBpcyBub3Qgc2V0CiMgQ09ORklHX0hXX1JBTkRP
TV9CQTQzMSBpcyBub3Qgc2V0CkNPTkZJR19IV19SQU5ET01fQkNNMjgzNT15CkNPTkZJR19IV19S
QU5ET01fSVBST0NfUk5HMjAwPXkKIyBDT05GSUdfSFdfUkFORE9NX1ZJUlRJTyBpcyBub3Qgc2V0
CiMgQ09ORklHX0hXX1JBTkRPTV9DQ1RSTkcgaXMgbm90IHNldAojIENPTkZJR19IV19SQU5ET01f
WElQSEVSQSBpcyBub3Qgc2V0CkNPTkZJR19IV19SQU5ET01fQVJNX1NNQ0NDX1RSTkc9eQojIENP
TkZJR19BUFBMSUNPTSBpcyBub3Qgc2V0CkNPTkZJR19ERVZNRU09eQpDT05GSUdfREVWUE9SVD15
CiMgQ09ORklHX1RDR19UUE0gaXMgbm90IHNldAojIENPTkZJR19YSUxMWUJVUyBpcyBub3Qgc2V0
CiMgQ09ORklHX1hJTExZVVNCIGlzIG5vdCBzZXQKQ09ORklHX1JBTkRPTV9UUlVTVF9DUFU9eQpD
T05GSUdfUkFORE9NX1RSVVNUX0JPT1RMT0FERVI9eQojIGVuZCBvZiBDaGFyYWN0ZXIgZGV2aWNl
cwoKIwojIEkyQyBzdXBwb3J0CiMKQ09ORklHX0kyQz15CkNPTkZJR19JMkNfQk9BUkRJTkZPPXkK
Q09ORklHX0kyQ19DT01QQVQ9eQpDT05GSUdfSTJDX0NIQVJERVY9bQpDT05GSUdfSTJDX01VWD15
CgojCiMgTXVsdGlwbGV4ZXIgSTJDIENoaXAgc3VwcG9ydAojCiMgQ09ORklHX0kyQ19BUkJfR1BJ
T19DSEFMTEVOR0UgaXMgbm90IHNldAojIENPTkZJR19JMkNfTVVYX0dQSU8gaXMgbm90IHNldAoj
IENPTkZJR19JMkNfTVVYX0dQTVVYIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX01VWF9MVEM0MzA2
IGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX01VWF9QQ0E5NTQxIGlzIG5vdCBzZXQKIyBDT05GSUdf
STJDX01VWF9QQ0E5NTR4IGlzIG5vdCBzZXQKQ09ORklHX0kyQ19NVVhfUElOQ1RSTD1tCiMgQ09O
RklHX0kyQ19NVVhfUkVHIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0RFTVVYX1BJTkNUUkwgaXMg
bm90IHNldAojIENPTkZJR19JMkNfTVVYX01MWENQTEQgaXMgbm90IHNldAojIGVuZCBvZiBNdWx0
aXBsZXhlciBJMkMgQ2hpcCBzdXBwb3J0CgpDT05GSUdfSTJDX0hFTFBFUl9BVVRPPXkKQ09ORklH
X0kyQ19BTEdPQklUPXkKCiMKIyBJMkMgSGFyZHdhcmUgQnVzIHN1cHBvcnQKIwoKIwojIFBDIFNN
QnVzIGhvc3QgY29udHJvbGxlciBkcml2ZXJzCiMKIyBDT05GSUdfSTJDX0FMSTE1MzUgaXMgbm90
IHNldAojIENPTkZJR19JMkNfQUxJMTU2MyBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19BTEkxNVgz
IGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0FNRDc1NiBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19B
TUQ4MTExIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0k4MDEgaXMgbm90IHNldAojIENPTkZJR19J
MkNfSVNDSCBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19QSUlYNCBpcyBub3Qgc2V0CiMgQ09ORklH
X0kyQ19ORk9SQ0UyIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX05WSURJQV9HUFUgaXMgbm90IHNl
dAojIENPTkZJR19JMkNfU0lTNTU5NSBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19TSVM2MzAgaXMg
bm90IHNldAojIENPTkZJR19JMkNfU0lTOTZYIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1ZJQSBp
cyBub3Qgc2V0CiMgQ09ORklHX0kyQ19WSUFQUk8gaXMgbm90IHNldAoKIwojIEkyQyBzeXN0ZW0g
YnVzIGRyaXZlcnMgKG1vc3RseSBlbWJlZGRlZCAvIHN5c3RlbS1vbi1jaGlwKQojCkNPTkZJR19J
MkNfQkNNMjgzNT1tCkNPTkZJR19JMkNfQlJDTVNUQj15CiMgQ09ORklHX0kyQ19DQURFTkNFIGlz
IG5vdCBzZXQKIyBDT05GSUdfSTJDX0NCVVNfR1BJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19E
RVNJR05XQVJFX1BMQVRGT1JNIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0RFU0lHTldBUkVfUENJ
IGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0VNRVYyIGlzIG5vdCBzZXQKQ09ORklHX0kyQ19HUElP
PW0KIyBDT05GSUdfSTJDX0dQSU9fRkFVTFRfSU5KRUNUT1IgaXMgbm90IHNldAojIENPTkZJR19J
MkNfTk9NQURJSyBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19PQ09SRVMgaXMgbm90IHNldAojIENP
TkZJR19JMkNfUENBX1BMQVRGT1JNIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1JLM1ggaXMgbm90
IHNldAojIENPTkZJR19JMkNfU0lNVEVDIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1RIVU5ERVJY
IGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1hJTElOWCBpcyBub3Qgc2V0CgojCiMgRXh0ZXJuYWwg
STJDL1NNQnVzIGFkYXB0ZXIgZHJpdmVycwojCiMgQ09ORklHX0kyQ19ESU9MQU5fVTJDIGlzIG5v
dCBzZXQKIyBDT05GSUdfSTJDX0NQMjYxNSBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19ST0JPVEZV
WlpfT1NJRiBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19UQU9TX0VWTSBpcyBub3Qgc2V0CiMgQ09O
RklHX0kyQ19USU5ZX1VTQiBpcyBub3Qgc2V0CgojCiMgT3RoZXIgSTJDL1NNQnVzIGJ1cyBkcml2
ZXJzCiMKIyBDT05GSUdfSTJDX1ZJUlRJTyBpcyBub3Qgc2V0CiMgZW5kIG9mIEkyQyBIYXJkd2Fy
ZSBCdXMgc3VwcG9ydAoKIyBDT05GSUdfSTJDX1NUVUIgaXMgbm90IHNldAojIENPTkZJR19JMkNf
U0xBVkUgaXMgbm90IHNldAojIENPTkZJR19JMkNfREVCVUdfQ09SRSBpcyBub3Qgc2V0CiMgQ09O
RklHX0kyQ19ERUJVR19BTEdPIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0RFQlVHX0JVUyBpcyBu
b3Qgc2V0CiMgZW5kIG9mIEkyQyBzdXBwb3J0CgojIENPTkZJR19JM0MgaXMgbm90IHNldApDT05G
SUdfU1BJPXkKIyBDT05GSUdfU1BJX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX1NQSV9NQVNURVI9
eQojIENPTkZJR19TUElfTUVNIGlzIG5vdCBzZXQKCiMKIyBTUEkgTWFzdGVyIENvbnRyb2xsZXIg
RHJpdmVycwojCiMgQ09ORklHX1NQSV9BTFRFUkEgaXMgbm90IHNldAojIENPTkZJR19TUElfQVhJ
X1NQSV9FTkdJTkUgaXMgbm90IHNldApDT05GSUdfU1BJX0JDTTI4MzU9bQpDT05GSUdfU1BJX0JD
TTI4MzVBVVg9bQojIENPTkZJR19TUElfQklUQkFORyBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9D
QURFTkNFIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX0NBREVOQ0VfUVVBRFNQSSBpcyBub3Qgc2V0
CiMgQ09ORklHX1NQSV9ERVNJR05XQVJFIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX05YUF9GTEVY
U1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX0dQSU8gaXMgbm90IHNldAojIENPTkZJR19TUElf
RlNMX1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9PQ19USU5ZIGlzIG5vdCBzZXQKIyBDT05G
SUdfU1BJX1BMMDIyIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX1BYQTJYWCBpcyBub3Qgc2V0CiMg
Q09ORklHX1NQSV9ST0NLQ0hJUCBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9TQzE4SVM2MDIgaXMg
bm90IHNldAojIENPTkZJR19TUElfU0lGSVZFIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX01YSUMg
aXMgbm90IHNldAojIENPTkZJR19TUElfVEhVTkRFUlggaXMgbm90IHNldAojIENPTkZJR19TUElf
WENPTU0gaXMgbm90IHNldAojIENPTkZJR19TUElfWElMSU5YIGlzIG5vdCBzZXQKIyBDT05GSUdf
U1BJX1pZTlFNUF9HUVNQSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9BTUQgaXMgbm90IHNldAoK
IwojIFNQSSBNdWx0aXBsZXhlciBzdXBwb3J0CiMKIyBDT05GSUdfU1BJX01VWCBpcyBub3Qgc2V0
CgojCiMgU1BJIFByb3RvY29sIE1hc3RlcnMKIwpDT05GSUdfU1BJX1NQSURFVj15CiMgQ09ORklH
X1NQSV9MT09QQkFDS19URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX1RMRTYyWDAgaXMgbm90
IHNldAojIENPTkZJR19TUElfU0xBVkUgaXMgbm90IHNldApDT05GSUdfU1BJX0RZTkFNSUM9eQoj
IENPTkZJR19TUE1JIGlzIG5vdCBzZXQKIyBDT05GSUdfSFNJIGlzIG5vdCBzZXQKQ09ORklHX1BQ
Uz15CiMgQ09ORklHX1BQU19ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX05UUF9QUFMgaXMgbm90
IHNldAoKIwojIFBQUyBjbGllbnRzIHN1cHBvcnQKIwojIENPTkZJR19QUFNfQ0xJRU5UX0tUSU1F
UiBpcyBub3Qgc2V0CiMgQ09ORklHX1BQU19DTElFTlRfTERJU0MgaXMgbm90IHNldAojIENPTkZJ
R19QUFNfQ0xJRU5UX0dQSU8gaXMgbm90IHNldAoKIwojIFBQUyBnZW5lcmF0b3JzIHN1cHBvcnQK
IwoKIwojIFBUUCBjbG9jayBzdXBwb3J0CiMKQ09ORklHX1BUUF8xNTg4X0NMT0NLPXkKQ09ORklH
X1BUUF8xNTg4X0NMT0NLX09QVElPTkFMPXkKCiMKIyBFbmFibGUgUEhZTElCIGFuZCBORVRXT1JL
X1BIWV9USU1FU1RBTVBJTkcgdG8gc2VlIHRoZSBhZGRpdGlvbmFsIGNsb2Nrcy4KIwpDT05GSUdf
UFRQXzE1ODhfQ0xPQ0tfS1ZNPXkKIyBDT05GSUdfUFRQXzE1ODhfQ0xPQ0tfSURUODJQMzMgaXMg
bm90IHNldAojIENPTkZJR19QVFBfMTU4OF9DTE9DS19JRFRDTSBpcyBub3Qgc2V0CiMgQ09ORklH
X1BUUF8xNTg4X0NMT0NLX09DUCBpcyBub3Qgc2V0CiMgZW5kIG9mIFBUUCBjbG9jayBzdXBwb3J0
CgpDT05GSUdfUElOQ1RSTD15CkNPTkZJR19QSU5NVVg9eQpDT05GSUdfUElOQ09ORj15CkNPTkZJ
R19HRU5FUklDX1BJTkNPTkY9eQojIENPTkZJR19ERUJVR19QSU5DVFJMIGlzIG5vdCBzZXQKIyBD
T05GSUdfUElOQ1RSTF9NQ1AyM1MwOCBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfU0lOR0xF
IGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9TWDE1MFggaXMgbm90IHNldAojIENPTkZJR19Q
SU5DVFJMX1NUTUZYIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9PQ0VMT1QgaXMgbm90IHNl
dAojIENPTkZJR19QSU5DVFJMX01JQ1JPQ0hJUF9TR1BJTyBpcyBub3Qgc2V0CkNPTkZJR19QSU5D
VFJMX0JDTTI4MzU9eQoKIwojIFJlbmVzYXMgcGluY3RybCBkcml2ZXJzCiMKIyBlbmQgb2YgUmVu
ZXNhcyBwaW5jdHJsIGRyaXZlcnMKCkNPTkZJR19HUElPTElCPXkKQ09ORklHX0dQSU9MSUJfRkFT
VFBBVEhfTElNSVQ9NTEyCkNPTkZJR19PRl9HUElPPXkKQ09ORklHX0dQSU9MSUJfSVJRQ0hJUD15
CiMgQ09ORklHX0RFQlVHX0dQSU8gaXMgbm90IHNldAojIENPTkZJR19HUElPX1NZU0ZTIGlzIG5v
dCBzZXQKQ09ORklHX0dQSU9fQ0RFVj15CkNPTkZJR19HUElPX0NERVZfVjE9eQoKIwojIE1lbW9y
eSBtYXBwZWQgR1BJTyBkcml2ZXJzCiMKIyBDT05GSUdfR1BJT183NFhYX01NSU8gaXMgbm90IHNl
dAojIENPTkZJR19HUElPX0FMVEVSQSBpcyBub3Qgc2V0CkNPTkZJR19HUElPX1JBU1BCRVJSWVBJ
X0VYUD15CiMgQ09ORklHX0dQSU9fQ0FERU5DRSBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fRFdB
UEIgaXMgbm90IHNldAojIENPTkZJR19HUElPX0VYQVIgaXMgbm90IHNldAojIENPTkZJR19HUElP
X0ZUR1BJTzAxMCBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fR0VORVJJQ19QTEFURk9STSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0dQSU9fR1JHUElPIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19ITFdE
IGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19MT0dJQ1ZDIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJ
T19NQjg2UzdYIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19QTDA2MSBpcyBub3Qgc2V0CiMgQ09O
RklHX0dQSU9fU0FNQTVEMl9QSU9CVSBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fU0lGSVZFIGlz
IG5vdCBzZXQKIyBDT05GSUdfR1BJT19TWVNDT04gaXMgbm90IHNldAojIENPTkZJR19HUElPX1hH
RU5FIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19YSUxJTlggaXMgbm90IHNldAojIENPTkZJR19H
UElPX0FNRF9GQ0ggaXMgbm90IHNldAojIGVuZCBvZiBNZW1vcnkgbWFwcGVkIEdQSU8gZHJpdmVy
cwoKIwojIEkyQyBHUElPIGV4cGFuZGVycwojCiMgQ09ORklHX0dQSU9fQURQNTU4OCBpcyBub3Qg
c2V0CiMgQ09ORklHX0dQSU9fQUROUCBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fR1dfUExEIGlz
IG5vdCBzZXQKIyBDT05GSUdfR1BJT19NQVg3MzAwIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19N
QVg3MzJYIGlzIG5vdCBzZXQKQ09ORklHX0dQSU9fUENBOTUzWD15CkNPTkZJR19HUElPX1BDQTk1
M1hfSVJRPXkKIyBDT05GSUdfR1BJT19QQ0E5NTcwIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19Q
Q0Y4NTdYIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19UUElDMjgxMCBpcyBub3Qgc2V0CiMgZW5k
IG9mIEkyQyBHUElPIGV4cGFuZGVycwoKIwojIE1GRCBHUElPIGV4cGFuZGVycwojCkNPTkZJR19H
UElPX0FSSVpPTkE9bQpDT05GSUdfR1BJT19TVE1QRT15CiMgZW5kIG9mIE1GRCBHUElPIGV4cGFu
ZGVycwoKIwojIFBDSSBHUElPIGV4cGFuZGVycwojCiMgQ09ORklHX0dQSU9fQlQ4WFggaXMgbm90
IHNldAojIENPTkZJR19HUElPX1BDSV9JRElPXzE2IGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19Q
Q0lFX0lESU9fMjQgaXMgbm90IHNldAojIENPTkZJR19HUElPX1JEQzMyMVggaXMgbm90IHNldAoj
IGVuZCBvZiBQQ0kgR1BJTyBleHBhbmRlcnMKCiMKIyBTUEkgR1BJTyBleHBhbmRlcnMKIwojIENP
TkZJR19HUElPXzc0WDE2NCBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fTUFYMzE5MVggaXMgbm90
IHNldAojIENPTkZJR19HUElPX01BWDczMDEgaXMgbm90IHNldAojIENPTkZJR19HUElPX01DMzM4
ODAgaXMgbm90IHNldAojIENPTkZJR19HUElPX1BJU09TUiBpcyBub3Qgc2V0CiMgQ09ORklHX0dQ
SU9fWFJBMTQwMyBpcyBub3Qgc2V0CiMgZW5kIG9mIFNQSSBHUElPIGV4cGFuZGVycwoKIwojIFVT
QiBHUElPIGV4cGFuZGVycwojCiMgZW5kIG9mIFVTQiBHUElPIGV4cGFuZGVycwoKIwojIFZpcnR1
YWwgR1BJTyBkcml2ZXJzCiMKIyBDT05GSUdfR1BJT19BR0dSRUdBVE9SIGlzIG5vdCBzZXQKQ09O
RklHX0dQSU9fTU9DS1VQPW0KIyBDT05GSUdfR1BJT19WSVJUSU8gaXMgbm90IHNldAojIGVuZCBv
ZiBWaXJ0dWFsIEdQSU8gZHJpdmVycwoKIyBDT05GSUdfVzEgaXMgbm90IHNldApDT05GSUdfUE9X
RVJfUkVTRVQ9eQojIENPTkZJR19QT1dFUl9SRVNFVF9CUkNNU1RCIGlzIG5vdCBzZXQKIyBDT05G
SUdfUE9XRVJfUkVTRVRfR1BJTyBpcyBub3Qgc2V0CiMgQ09ORklHX1BPV0VSX1JFU0VUX0dQSU9f
UkVTVEFSVCBpcyBub3Qgc2V0CiMgQ09ORklHX1BPV0VSX1JFU0VUX0xUQzI5NTIgaXMgbm90IHNl
dAojIENPTkZJR19QT1dFUl9SRVNFVF9SRUdVTEFUT1IgaXMgbm90IHNldAojIENPTkZJR19QT1dF
Ul9SRVNFVF9SRVNUQVJUIGlzIG5vdCBzZXQKIyBDT05GSUdfUE9XRVJfUkVTRVRfWEdFTkUgaXMg
bm90IHNldAojIENPTkZJR19QT1dFUl9SRVNFVF9TWVNDT04gaXMgbm90IHNldAojIENPTkZJR19Q
T1dFUl9SRVNFVF9TWVNDT05fUE9XRVJPRkYgaXMgbm90IHNldAojIENPTkZJR19TWVNDT05fUkVC
T09UX01PREUgaXMgbm90IHNldAojIENPTkZJR19OVk1FTV9SRUJPT1RfTU9ERSBpcyBub3Qgc2V0
CkNPTkZJR19QT1dFUl9TVVBQTFk9eQojIENPTkZJR19QT1dFUl9TVVBQTFlfREVCVUcgaXMgbm90
IHNldAojIENPTkZJR19QREFfUE9XRVIgaXMgbm90IHNldAojIENPTkZJR19HRU5FUklDX0FEQ19C
QVRURVJZIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9QT1dFUiBpcyBub3Qgc2V0CiMgQ09ORklH
X0NIQVJHRVJfQURQNTA2MSBpcyBub3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfQ1cyMDE1IGlzIG5v
dCBzZXQKIyBDT05GSUdfQkFUVEVSWV9EUzI3ODAgaXMgbm90IHNldAojIENPTkZJR19CQVRURVJZ
X0RTMjc4MSBpcyBub3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfRFMyNzgyIGlzIG5vdCBzZXQKIyBD
T05GSUdfQkFUVEVSWV9TQlMgaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX1NCUyBpcyBub3Qg
c2V0CiMgQ09ORklHX01BTkFHRVJfU0JTIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFUVEVSWV9CUTI3
WFhYIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFUVEVSWV9NQVgxNzA0MCBpcyBub3Qgc2V0CiMgQ09O
RklHX0JBVFRFUllfTUFYMTcwNDIgaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX01BWDg5MDMg
aXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX0xQODcyNyBpcyBub3Qgc2V0CiMgQ09ORklHX0NI
QVJHRVJfR1BJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfTUFOQUdFUiBpcyBub3Qgc2V0
CiMgQ09ORklHX0NIQVJHRVJfTFQzNjUxIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hBUkdFUl9MVEM0
MTYyTCBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfREVURUNUT1JfTUFYMTQ2NTYgaXMgbm90
IHNldAojIENPTkZJR19DSEFSR0VSX0JRMjQxNVggaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VS
X0JRMjQyNTcgaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX0JRMjQ3MzUgaXMgbm90IHNldAoj
IENPTkZJR19DSEFSR0VSX0JRMjUxNVggaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX0JRMjU4
OTAgaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX0JRMjU5ODAgaXMgbm90IHNldAojIENPTkZJ
R19DSEFSR0VSX0JRMjU2WFggaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX1NNQjM0NyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfR0FVR0VfTFRDMjk0MSBpcyBub3Qgc2V0CiMgQ09ORklH
X0JBVFRFUllfR09MREZJU0ggaXMgbm90IHNldAojIENPTkZJR19CQVRURVJZX1JUNTAzMyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfUlQ5NDU1IGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hBUkdF
Ul9VQ1MxMDAyIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hBUkdFUl9CRDk5OTU0IGlzIG5vdCBzZXQK
Q09ORklHX0hXTU9OPW0KIyBDT05GSUdfSFdNT05fREVCVUdfQ0hJUCBpcyBub3Qgc2V0CgojCiMg
TmF0aXZlIGRyaXZlcnMKIwojIENPTkZJR19TRU5TT1JTX0FENzMxNCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFTlNPUlNfQUQ3NDE0IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BRDc0MTggaXMg
bm90IHNldAojIENPTkZJR19TRU5TT1JTX0FETTEwMjEgaXMgbm90IHNldAojIENPTkZJR19TRU5T
T1JTX0FETTEwMjUgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FETTEwMjYgaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX0FETTEwMjkgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FE
TTEwMzEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FETTExNzcgaXMgbm90IHNldAojIENP
TkZJR19TRU5TT1JTX0FETTkyNDAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FEVDczMTAg
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FEVDc0MTAgaXMgbm90IHNldAojIENPTkZJR19T
RU5TT1JTX0FEVDc0MTEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FEVDc0NjIgaXMgbm90
IHNldAojIENPTkZJR19TRU5TT1JTX0FEVDc0NzAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JT
X0FEVDc0NzUgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FIVDEwIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19BUVVBQ09NUFVURVJfRDVORVhUIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VO
U09SU19BUzM3MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQVNDNzYyMSBpcyBub3Qgc2V0
CiMgQ09ORklHX1NFTlNPUlNfQVhJX0ZBTl9DT05UUk9MIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VO
U09SU19BU1BFRUQgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FUWFAxIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0VOU09SU19DT1JTQUlSX0NQUk8gaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JT
X0NPUlNBSVJfUFNVIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19EUklWRVRFTVAgaXMgbm90
IHNldAojIENPTkZJR19TRU5TT1JTX0RTNjIwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19E
UzE2MjEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0k1S19BTUIgaXMgbm90IHNldAojIENP
TkZJR19TRU5TT1JTX0Y3MTgwNUYgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0Y3MTg4MkZH
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19GNzUzNzVTIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0VOU09SU19GVFNURVVUQVRFUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfR0w1MThTTSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfR0w1MjBTTSBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
TlNPUlNfRzc2MEEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0c3NjIgaXMgbm90IHNldAoj
IENPTkZJR19TRU5TT1JTX0dQSU9fRkFOIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19ISUg2
MTMwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19JSU9fSFdNT04gaXMgbm90IHNldAojIENP
TkZJR19TRU5TT1JTX0lUODcgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0pDNDIgaXMgbm90
IHNldAojIENPTkZJR19TRU5TT1JTX1BPV1IxMjIwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09S
U19MSU5FQUdFIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MVEMyOTQ1IGlzIG5vdCBzZXQK
IyBDT05GSUdfU0VOU09SU19MVEMyOTQ3X0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNf
TFRDMjk0N19TUEkgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xUQzI5OTAgaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX0xUQzI5OTIgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xU
QzQxNTEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xUQzQyMTUgaXMgbm90IHNldAojIENP
TkZJR19TRU5TT1JTX0xUQzQyMjIgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xUQzQyNDUg
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xUQzQyNjAgaXMgbm90IHNldAojIENPTkZJR19T
RU5TT1JTX0xUQzQyNjEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX01BWDExMTEgaXMgbm90
IHNldAojIENPTkZJR19TRU5TT1JTX01BWDEyNyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNf
TUFYMTYwNjUgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX01BWDE2MTkgaXMgbm90IHNldAoj
IENPTkZJR19TRU5TT1JTX01BWDE2NjggaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX01BWDE5
NyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTUFYMzE3MjIgaXMgbm90IHNldAojIENPTkZJ
R19TRU5TT1JTX01BWDMxNzMwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19NQVg2NjIxIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19NQVg2NjM5IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VO
U09SU19NQVg2NjQyIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19NQVg2NjUwIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VOU09SU19NQVg2Njk3IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19N
QVgzMTc5MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTUNQMzAyMSBpcyBub3Qgc2V0CiMg
Q09ORklHX1NFTlNPUlNfVEM2NTQgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1RQUzIzODYx
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19NUjc1MjAzIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0VOU09SU19BRENYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTE02MyBpcyBub3Qgc2V0
CiMgQ09ORklHX1NFTlNPUlNfTE03MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTE03MyBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTE03NSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNP
UlNfTE03NyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTE03OCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFTlNPUlNfTE04MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTE04MyBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFTlNPUlNfTE04NSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTE04
NyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTE05MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
TlNPUlNfTE05MiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTE05MyBpcyBub3Qgc2V0CiMg
Q09ORklHX1NFTlNPUlNfTE05NTIzNCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTE05NTI0
MSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTE05NTI0NSBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFTlNPUlNfUEM4NzM2MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfUEM4NzQyNyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTlRDX1RIRVJNSVNUT1IgaXMgbm90IHNldAojIENPTkZJ
R19TRU5TT1JTX05DVDY2ODMgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX05DVDY3NzUgaXMg
bm90IHNldAojIENPTkZJR19TRU5TT1JTX05DVDc4MDIgaXMgbm90IHNldAojIENPTkZJR19TRU5T
T1JTX05DVDc5MDQgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX05QQ003WFggaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX05aWFRfS1JBS0VOMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNP
UlNfT0NDX1A4X0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfUENGODU5MSBpcyBub3Qg
c2V0CiMgQ09ORklHX1BNQlVTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19QV01fRkFOIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19SQVNQQkVSUllQSV9IV01PTiBpcyBub3Qgc2V0CiMg
Q09ORklHX1NFTlNPUlNfU0JUU0kgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1NCUk1JIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19TSFQxNSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNP
UlNfU0hUMjEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1NIVDN4IGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19TSFQ0eCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfU0hUQzEgaXMg
bm90IHNldAojIENPTkZJR19TRU5TT1JTX1NJUzU1OTUgaXMgbm90IHNldAojIENPTkZJR19TRU5T
T1JTX0RNRTE3MzcgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0VNQzE0MDMgaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX0VNQzIxMDMgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0VN
QzZXMjAxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19TTVNDNDdNMSBpcyBub3Qgc2V0CiMg
Q09ORklHX1NFTlNPUlNfU01TQzQ3TTE5MiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfU01T
QzQ3QjM5NyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfU0NINTYyNyBpcyBub3Qgc2V0CiMg
Q09ORklHX1NFTlNPUlNfU0NINTYzNiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfU1RUUzc1
MSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfU01NNjY1IGlzIG5vdCBzZXQKIyBDT05GSUdf
U0VOU09SU19BREMxMjhEODE4IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BRFM3ODI4IGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BRFM3ODcxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VO
U09SU19BTUM2ODIxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19JTkEyMDkgaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX0lOQTJYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfSU5B
MzIyMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVEM3NCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFTlNPUlNfVEhNQzUwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19UTVAxMDIgaXMgbm90
IHNldAojIENPTkZJR19TRU5TT1JTX1RNUDEwMyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNf
VE1QMTA4IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19UTVA0MDEgaXMgbm90IHNldAojIENP
TkZJR19TRU5TT1JTX1RNUDQyMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVE1QNTEzIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19WSUE2ODZBIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VO
U09SU19WVDEyMTEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1ZUODIzMSBpcyBub3Qgc2V0
CiMgQ09ORklHX1NFTlNPUlNfVzgzNzczRyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVzgz
NzgxRCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVzgzNzkxRCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFTlNPUlNfVzgzNzkyRCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVzgzNzkzIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19XODM3OTUgaXMgbm90IHNldAojIENPTkZJR19TRU5T
T1JTX1c4M0w3ODVUUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVzgzTDc4Nk5HIGlzIG5v
dCBzZXQKIyBDT05GSUdfU0VOU09SU19XODM2MjdIRiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNP
UlNfVzgzNjI3RUhGIGlzIG5vdCBzZXQKQ09ORklHX1RIRVJNQUw9eQojIENPTkZJR19USEVSTUFM
X05FVExJTksgaXMgbm90IHNldAojIENPTkZJR19USEVSTUFMX1NUQVRJU1RJQ1MgaXMgbm90IHNl
dApDT05GSUdfVEhFUk1BTF9FTUVSR0VOQ1lfUE9XRVJPRkZfREVMQVlfTVM9MApDT05GSUdfVEhF
Uk1BTF9PRj15CiMgQ09ORklHX1RIRVJNQUxfV1JJVEFCTEVfVFJJUFMgaXMgbm90IHNldApDT05G
SUdfVEhFUk1BTF9ERUZBVUxUX0dPVl9TVEVQX1dJU0U9eQojIENPTkZJR19USEVSTUFMX0RFRkFV
TFRfR09WX0ZBSVJfU0hBUkUgaXMgbm90IHNldAojIENPTkZJR19USEVSTUFMX0RFRkFVTFRfR09W
X1VTRVJfU1BBQ0UgaXMgbm90IHNldAojIENPTkZJR19USEVSTUFMX0dPVl9GQUlSX1NIQVJFIGlz
IG5vdCBzZXQKQ09ORklHX1RIRVJNQUxfR09WX1NURVBfV0lTRT15CiMgQ09ORklHX1RIRVJNQUxf
R09WX0JBTkdfQkFORyBpcyBub3Qgc2V0CiMgQ09ORklHX1RIRVJNQUxfR09WX1VTRVJfU1BBQ0Ug
aXMgbm90IHNldAojIENPTkZJR19DUFVfVEhFUk1BTCBpcyBub3Qgc2V0CiMgQ09ORklHX1RIRVJN
QUxfRU1VTEFUSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfVEhFUk1BTF9NTUlPIGlzIG5vdCBzZXQK
CiMKIyBCcm9hZGNvbSB0aGVybWFsIGRyaXZlcnMKIwpDT05GSUdfQkNNMjcxMV9USEVSTUFMPXkK
Q09ORklHX0JDTTI4MzVfVEhFUk1BTD15CiMgZW5kIG9mIEJyb2FkY29tIHRoZXJtYWwgZHJpdmVy
cwoKIyBDT05GSUdfR0VORVJJQ19BRENfVEhFUk1BTCBpcyBub3Qgc2V0CkNPTkZJR19XQVRDSERP
Rz15CkNPTkZJR19XQVRDSERPR19DT1JFPXkKIyBDT05GSUdfV0FUQ0hET0dfTk9XQVlPVVQgaXMg
bm90IHNldApDT05GSUdfV0FUQ0hET0dfSEFORExFX0JPT1RfRU5BQkxFRD15CkNPTkZJR19XQVRD
SERPR19PUEVOX1RJTUVPVVQ9MAojIENPTkZJR19XQVRDSERPR19TWVNGUyBpcyBub3Qgc2V0CiMg
Q09ORklHX1dBVENIRE9HX0hSVElNRVJfUFJFVElNRU9VVCBpcyBub3Qgc2V0CgojCiMgV2F0Y2hk
b2cgUHJldGltZW91dCBHb3Zlcm5vcnMKIwojIENPTkZJR19XQVRDSERPR19QUkVUSU1FT1VUX0dP
ViBpcyBub3Qgc2V0CgojCiMgV2F0Y2hkb2cgRGV2aWNlIERyaXZlcnMKIwpDT05GSUdfU09GVF9X
QVRDSERPRz1tCiMgQ09ORklHX0dQSU9fV0FUQ0hET0cgaXMgbm90IHNldAojIENPTkZJR19YSUxJ
TlhfV0FUQ0hET0cgaXMgbm90IHNldAojIENPTkZJR19aSUlSQVZFX1dBVENIRE9HIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQVJNX1NQODA1X1dBVENIRE9HIGlzIG5vdCBzZXQKIyBDT05GSUdfQVJNX1NC
U0FfV0FUQ0hET0cgaXMgbm90IHNldAojIENPTkZJR19DQURFTkNFX1dBVENIRE9HIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRFdfV0FUQ0hET0cgaXMgbm90IHNldAojIENPTkZJR19NQVg2M1hYX1dBVENI
RE9HIGlzIG5vdCBzZXQKIyBDT05GSUdfQVJNX1NNQ19XQVRDSERPRyBpcyBub3Qgc2V0CiMgQ09O
RklHX0FMSU03MTAxX1dEVCBpcyBub3Qgc2V0CiMgQ09ORklHX0k2MzAwRVNCX1dEVCBpcyBub3Qg
c2V0CkNPTkZJR19CQ00yODM1X1dEVD15CiMgQ09ORklHX01FTl9BMjFfV0RUIGlzIG5vdCBzZXQK
Q09ORklHX1hFTl9XRFQ9bQoKIwojIFBDSS1iYXNlZCBXYXRjaGRvZyBDYXJkcwojCiMgQ09ORklH
X1BDSVBDV0FUQ0hET0cgaXMgbm90IHNldAojIENPTkZJR19XRFRQQ0kgaXMgbm90IHNldAoKIwoj
IFVTQi1iYXNlZCBXYXRjaGRvZyBDYXJkcwojCiMgQ09ORklHX1VTQlBDV0FUQ0hET0cgaXMgbm90
IHNldApDT05GSUdfU1NCX1BPU1NJQkxFPXkKQ09ORklHX1NTQj1tCkNPTkZJR19TU0JfU1BST009
eQpDT05GSUdfU1NCX0JMT0NLSU89eQpDT05GSUdfU1NCX1BDSUhPU1RfUE9TU0lCTEU9eQpDT05G
SUdfU1NCX1BDSUhPU1Q9eQpDT05GSUdfU1NCX0I0M19QQ0lfQlJJREdFPXkKQ09ORklHX1NTQl9T
RElPSE9TVF9QT1NTSUJMRT15CiMgQ09ORklHX1NTQl9TRElPSE9TVCBpcyBub3Qgc2V0CkNPTkZJ
R19TU0JfRFJJVkVSX1BDSUNPUkVfUE9TU0lCTEU9eQpDT05GSUdfU1NCX0RSSVZFUl9QQ0lDT1JF
PXkKIyBDT05GSUdfU1NCX0RSSVZFUl9HUElPIGlzIG5vdCBzZXQKQ09ORklHX0JDTUFfUE9TU0lC
TEU9eQpDT05GSUdfQkNNQT1tCkNPTkZJR19CQ01BX0JMT0NLSU89eQpDT05GSUdfQkNNQV9IT1NU
X1BDSV9QT1NTSUJMRT15CkNPTkZJR19CQ01BX0hPU1RfUENJPXkKIyBDT05GSUdfQkNNQV9IT1NU
X1NPQyBpcyBub3Qgc2V0CkNPTkZJR19CQ01BX0RSSVZFUl9QQ0k9eQojIENPTkZJR19CQ01BX0RS
SVZFUl9HTUFDX0NNTiBpcyBub3Qgc2V0CiMgQ09ORklHX0JDTUFfRFJJVkVSX0dQSU8gaXMgbm90
IHNldAojIENPTkZJR19CQ01BX0RFQlVHIGlzIG5vdCBzZXQKCiMKIyBNdWx0aWZ1bmN0aW9uIGRl
dmljZSBkcml2ZXJzCiMKQ09ORklHX01GRF9DT1JFPXkKIyBDT05GSUdfTUZEX0FDVDg5NDVBIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUZEX0FTMzcxMSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9BUzM3
MjIgaXMgbm90IHNldAojIENPTkZJR19QTUlDX0FEUDU1MjAgaXMgbm90IHNldAojIENPTkZJR19N
RkRfQUFUMjg3MF9DT1JFIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0FUTUVMX0ZMRVhDT00gaXMg
bm90IHNldAojIENPTkZJR19NRkRfQVRNRUxfSExDREMgaXMgbm90IHNldAojIENPTkZJR19NRkRf
QkNNNTkwWFggaXMgbm90IHNldAojIENPTkZJR19NRkRfQkQ5NTcxTVdWIGlzIG5vdCBzZXQKIyBD
T05GSUdfTUZEX0FYUDIwWF9JMkMgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFERVJBIGlzIG5v
dCBzZXQKIyBDT05GSUdfUE1JQ19EQTkwM1ggaXMgbm90IHNldAojIENPTkZJR19NRkRfREE5MDUy
X1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9EQTkwNTJfSTJDIGlzIG5vdCBzZXQKIyBDT05G
SUdfTUZEX0RBOTA1NSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9EQTkwNjIgaXMgbm90IHNldAoj
IENPTkZJR19NRkRfREE5MDYzIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0RBOTE1MCBpcyBub3Qg
c2V0CiMgQ09ORklHX01GRF9ETE4yIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0dBVEVXT1JLU19H
U0MgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUMxM1hYWF9TUEkgaXMgbm90IHNldAojIENPTkZJ
R19NRkRfTUMxM1hYWF9JMkMgaXMgbm90IHNldAojIENPTkZJR19NRkRfTVAyNjI5IGlzIG5vdCBz
ZXQKIyBDT05GSUdfTUZEX0hJNjQyMV9QTUlDIGlzIG5vdCBzZXQKIyBDT05GSUdfSFRDX1BBU0lD
MyBpcyBub3Qgc2V0CiMgQ09ORklHX0hUQ19JMkNQTEQgaXMgbm90IHNldAojIENPTkZJR19MUENf
SUNIIGlzIG5vdCBzZXQKIyBDT05GSUdfTFBDX1NDSCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9J
TlRFTF9QTVQgaXMgbm90IHNldAojIENPTkZJR19NRkRfSVFTNjJYIGlzIG5vdCBzZXQKIyBDT05G
SUdfTUZEX0pBTlpfQ01PRElPIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0tFTVBMRCBpcyBub3Qg
c2V0CiMgQ09ORklHX01GRF84OFBNODAwIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEXzg4UE04MDUg
aXMgbm90IHNldAojIENPTkZJR19NRkRfODhQTTg2MFggaXMgbm90IHNldAojIENPTkZJR19NRkRf
TUFYMTQ1NzcgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFYNzc2MjAgaXMgbm90IHNldAojIENP
TkZJR19NRkRfTUFYNzc2NTAgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFYNzc2ODYgaXMgbm90
IHNldAojIENPTkZJR19NRkRfTUFYNzc2OTMgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFYNzc4
NDMgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFYODkwNyBpcyBub3Qgc2V0CiMgQ09ORklHX01G
RF9NQVg4OTI1IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX01BWDg5OTcgaXMgbm90IHNldAojIENP
TkZJR19NRkRfTUFYODk5OCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9NVDYzNjAgaXMgbm90IHNl
dAojIENPTkZJR19NRkRfTVQ2Mzk3IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX01FTkYyMUJNQyBp
cyBub3Qgc2V0CiMgQ09ORklHX0VaWF9QQ0FQIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0NQQ0FQ
IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1ZJUEVSQk9BUkQgaXMgbm90IHNldAojIENPTkZJR19N
RkRfTlRYRUMgaXMgbm90IHNldAojIENPTkZJR19NRkRfUkVUVSBpcyBub3Qgc2V0CiMgQ09ORklH
X01GRF9QQ0Y1MDYzMyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9SREMzMjFYIGlzIG5vdCBzZXQK
IyBDT05GSUdfTUZEX1JUNDgzMSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9SVDUwMzMgaXMgbm90
IHNldAojIENPTkZJR19NRkRfUkM1VDU4MyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9SSzgwOCBp
cyBub3Qgc2V0CiMgQ09ORklHX01GRF9STjVUNjE4IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1NF
Q19DT1JFIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1NJNDc2WF9DT1JFIGlzIG5vdCBzZXQKIyBD
T05GSUdfTUZEX1NNNTAxIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1NLWTgxNDUyIGlzIG5vdCBz
ZXQKQ09ORklHX01GRF9TVE1QRT15CgojCiMgU1RNaWNyb2VsZWN0cm9uaWNzIFNUTVBFIEludGVy
ZmFjZSBEcml2ZXJzCiMKQ09ORklHX1NUTVBFX0kyQz15CiMgQ09ORklHX1NUTVBFX1NQSSBpcyBu
b3Qgc2V0CiMgZW5kIG9mIFNUTWljcm9lbGVjdHJvbmljcyBTVE1QRSBJbnRlcmZhY2UgRHJpdmVy
cwoKQ09ORklHX01GRF9TWVNDT049eQojIENPTkZJR19NRkRfVElfQU0zMzVYX1RTQ0FEQyBpcyBu
b3Qgc2V0CiMgQ09ORklHX01GRF9MUDM5NDMgaXMgbm90IHNldAojIENPTkZJR19NRkRfTFA4Nzg4
IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RJX0xNVSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9Q
QUxNQVMgaXMgbm90IHNldAojIENPTkZJR19UUFM2MTA1WCBpcyBub3Qgc2V0CiMgQ09ORklHX1RQ
UzY1MDEwIGlzIG5vdCBzZXQKIyBDT05GSUdfVFBTNjUwN1ggaXMgbm90IHNldAojIENPTkZJR19N
RkRfVFBTNjUwODYgaXMgbm90IHNldAojIENPTkZJR19NRkRfVFBTNjUwOTAgaXMgbm90IHNldAoj
IENPTkZJR19NRkRfVFBTNjUyMTcgaXMgbm90IHNldAojIENPTkZJR19NRkRfVElfTFA4NzNYIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUZEX1RJX0xQODc1NjUgaXMgbm90IHNldAojIENPTkZJR19NRkRf
VFBTNjUyMTggaXMgbm90IHNldAojIENPTkZJR19NRkRfVFBTNjU4NlggaXMgbm90IHNldAojIENP
TkZJR19NRkRfVFBTNjU5MTAgaXMgbm90IHNldAojIENPTkZJR19NRkRfVFBTNjU5MTJfSTJDIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUZEX1RQUzY1OTEyX1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX01G
RF9UUFM4MDAzMSBpcyBub3Qgc2V0CiMgQ09ORklHX1RXTDQwMzBfQ09SRSBpcyBub3Qgc2V0CiMg
Q09ORklHX1RXTDYwNDBfQ09SRSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9XTDEyNzNfQ09SRSBp
cyBub3Qgc2V0CiMgQ09ORklHX01GRF9MTTM1MzMgaXMgbm90IHNldAojIENPTkZJR19NRkRfVEMz
NTg5WCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9UUU1YODYgaXMgbm90IHNldAojIENPTkZJR19N
RkRfVlg4NTUgaXMgbm90IHNldAojIENPTkZJR19NRkRfTE9DSE5BR0FSIGlzIG5vdCBzZXQKQ09O
RklHX01GRF9BUklaT05BPW0KQ09ORklHX01GRF9BUklaT05BX0kyQz1tCiMgQ09ORklHX01GRF9B
UklaT05BX1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9DUzQ3TDI0IGlzIG5vdCBzZXQKQ09O
RklHX01GRF9XTTUxMDI9eQojIENPTkZJR19NRkRfV001MTEwIGlzIG5vdCBzZXQKIyBDT05GSUdf
TUZEX1dNODk5NyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9XTTg5OTggaXMgbm90IHNldAojIENP
TkZJR19NRkRfV004NDAwIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1dNODMxWF9JMkMgaXMgbm90
IHNldAojIENPTkZJR19NRkRfV004MzFYX1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9XTTgz
NTBfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1dNODk5NCBpcyBub3Qgc2V0CiMgQ09ORklH
X01GRF9ST0hNX0JENzE4WFggaXMgbm90IHNldAojIENPTkZJR19NRkRfUk9ITV9CRDcwNTI4IGlz
IG5vdCBzZXQKIyBDT05GSUdfTUZEX1JPSE1fQkQ3MTgyOCBpcyBub3Qgc2V0CiMgQ09ORklHX01G
RF9ST0hNX0JEOTU3WE1VRiBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9TVFBNSUMxIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTUZEX1NUTUZYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0FUQzI2MFhfSTJD
IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1FDT01fUE04MDA4IGlzIG5vdCBzZXQKIyBDT05GSUdf
UkFWRV9TUF9DT1JFIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0lOVEVMX00xMF9CTUMgaXMgbm90
IHNldAojIENPTkZJR19NRkRfUlNNVV9JMkMgaXMgbm90IHNldAojIENPTkZJR19NRkRfUlNNVV9T
UEkgaXMgbm90IHNldAojIGVuZCBvZiBNdWx0aWZ1bmN0aW9uIGRldmljZSBkcml2ZXJzCgpDT05G
SUdfUkVHVUxBVE9SPXkKIyBDT05GSUdfUkVHVUxBVE9SX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklH
X1JFR1VMQVRPUl9GSVhFRF9WT0xUQUdFPXkKIyBDT05GSUdfUkVHVUxBVE9SX1ZJUlRVQUxfQ09O
U1VNRVIgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfVVNFUlNQQUNFX0NPTlNVTUVSIGlz
IG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SXzg4UEc4NlggaXMgbm90IHNldAojIENPTkZJR19S
RUdVTEFUT1JfQUNUODg2NSBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9BRDUzOTggaXMg
bm90IHNldApDT05GSUdfUkVHVUxBVE9SX0FSSVpPTkFfTERPMT1tCkNPTkZJR19SRUdVTEFUT1Jf
QVJJWk9OQV9NSUNTVVBQPW0KIyBDT05GSUdfUkVHVUxBVE9SX0RBOTEyMSBpcyBub3Qgc2V0CiMg
Q09ORklHX1JFR1VMQVRPUl9EQTkyMTAgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfREE5
MjExIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX0ZBTjUzNTU1IGlzIG5vdCBzZXQKIyBD
T05GSUdfUkVHVUxBVE9SX0ZBTjUzODgwIGlzIG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9HUElP
PXkKIyBDT05GSUdfUkVHVUxBVE9SX0lTTDkzMDUgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFU
T1JfSVNMNjI3MUEgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfTFAzOTcxIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUkVHVUxBVE9SX0xQMzk3MiBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRP
Ul9MUDg3MlggaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfTFA4NzU1IGlzIG5vdCBzZXQK
IyBDT05GSUdfUkVHVUxBVE9SX0xUQzM1ODkgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1Jf
TFRDMzY3NiBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9NQVgxNTg2IGlzIG5vdCBzZXQK
IyBDT05GSUdfUkVHVUxBVE9SX01BWDg2NDkgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1Jf
TUFYODY2MCBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9NQVg4ODkzIGlzIG5vdCBzZXQK
IyBDT05GSUdfUkVHVUxBVE9SX01BWDg5NTIgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1Jf
TUFYODk3MyBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9NQVg3NzgyNiBpcyBub3Qgc2V0
CiMgQ09ORklHX1JFR1VMQVRPUl9NQ1AxNjUwMiBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRP
Ul9NUDU0MTYgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfTVA4ODU5IGlzIG5vdCBzZXQK
IyBDT05GSUdfUkVHVUxBVE9SX01QODg2WCBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9N
UFE3OTIwIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX01UNjMxMSBpcyBub3Qgc2V0CiMg
Q09ORklHX1JFR1VMQVRPUl9QQ0E5NDUwIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX1BG
OFgwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9QRlVaRTEwMCBpcyBub3Qgc2V0CiMg
Q09ORklHX1JFR1VMQVRPUl9QVjg4MDYwIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX1BW
ODgwODAgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfUFY4ODA5MCBpcyBub3Qgc2V0CiMg
Q09ORklHX1JFR1VMQVRPUl9QV00gaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfUkFTUEJF
UlJZUElfVE9VQ0hTQ1JFRU5fQVRUSU5ZIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX1JU
NDgwMSBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9SVDYxNjAgaXMgbm90IHNldAojIENP
TkZJR19SRUdVTEFUT1JfUlQ2MjQ1IGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX1JUUTIx
MzQgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfUlRNVjIwIGlzIG5vdCBzZXQKIyBDT05G
SUdfUkVHVUxBVE9SX1JUUTY3NTIgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfU0xHNTEw
MDAgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfU1k4MTA2QSBpcyBub3Qgc2V0CiMgQ09O
RklHX1JFR1VMQVRPUl9TWTg4MjRYIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX1NZODgy
N04gaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfVFBTNTE2MzIgaXMgbm90IHNldAojIENP
TkZJR19SRUdVTEFUT1JfVFBTNjIzNjAgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfVFBT
NjUwMjMgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfVFBTNjUwN1ggaXMgbm90IHNldAoj
IENPTkZJR19SRUdVTEFUT1JfVFBTNjUxMzIgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1Jf
VFBTNjUyNFggaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfVkNUUkwgaXMgbm90IHNldApD
T05GSUdfUkNfQ09SRT15CkNPTkZJR19SQ19NQVA9eQojIENPTkZJR19MSVJDIGlzIG5vdCBzZXQK
IyBDT05GSUdfUkNfREVDT0RFUlMgaXMgbm90IHNldApDT05GSUdfUkNfREVWSUNFUz15CiMgQ09O
RklHX1JDX0FUSV9SRU1PVEUgaXMgbm90IHNldAojIENPTkZJR19JUl9ISVg1SEQyIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSVJfSU1PTiBpcyBub3Qgc2V0CiMgQ09ORklHX0lSX0lNT05fUkFXIGlzIG5v
dCBzZXQKIyBDT05GSUdfSVJfTUNFVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdfSVJfUkVEUkFUMyBp
cyBub3Qgc2V0CiMgQ09ORklHX0lSX1NUUkVBTVpBUCBpcyBub3Qgc2V0CiMgQ09ORklHX0lSX0lH
T1JQTFVHVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdfSVJfSUdVQU5BIGlzIG5vdCBzZXQKIyBDT05G
SUdfSVJfVFRVU0JJUiBpcyBub3Qgc2V0CiMgQ09ORklHX1JDX0xPT1BCQUNLIGlzIG5vdCBzZXQK
IyBDT05GSUdfSVJfR1BJT19DSVIgaXMgbm90IHNldAojIENPTkZJR19JUl9TRVJJQUwgaXMgbm90
IHNldAojIENPTkZJR19JUl9TSVIgaXMgbm90IHNldAojIENPTkZJR19SQ19YQk9YX0RWRCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0lSX1RPWSBpcyBub3Qgc2V0CkNPTkZJR19DRUNfQ09SRT1tCkNPTkZJ
R19NRURJQV9DRUNfUkM9eQpDT05GSUdfTUVESUFfQ0VDX1NVUFBPUlQ9eQojIENPTkZJR19DRUNf
Q0g3MzIyIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0VDX0dQSU8gaXMgbm90IHNldAojIENPTkZJR19V
U0JfUFVMU0U4X0NFQyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9SQUlOU0hBRE9XX0NFQyBpcyBu
b3Qgc2V0CkNPTkZJR19NRURJQV9TVVBQT1JUPW0KIyBDT05GSUdfTUVESUFfU1VQUE9SVF9GSUxU
RVIgaXMgbm90IHNldAojIENPTkZJR19NRURJQV9TVUJEUlZfQVVUT1NFTEVDVCBpcyBub3Qgc2V0
CgojCiMgTWVkaWEgZGV2aWNlIHR5cGVzCiMKQ09ORklHX01FRElBX0NBTUVSQV9TVVBQT1JUPXkK
Q09ORklHX01FRElBX0FOQUxPR19UVl9TVVBQT1JUPXkKQ09ORklHX01FRElBX0RJR0lUQUxfVFZf
U1VQUE9SVD15CkNPTkZJR19NRURJQV9SQURJT19TVVBQT1JUPXkKQ09ORklHX01FRElBX1NEUl9T
VVBQT1JUPXkKQ09ORklHX01FRElBX1BMQVRGT1JNX1NVUFBPUlQ9eQpDT05GSUdfTUVESUFfVEVT
VF9TVVBQT1JUPXkKIyBlbmQgb2YgTWVkaWEgZGV2aWNlIHR5cGVzCgojCiMgTWVkaWEgY29yZSBz
dXBwb3J0CiMKQ09ORklHX1ZJREVPX0RFVj1tCkNPTkZJR19NRURJQV9DT05UUk9MTEVSPXkKQ09O
RklHX0RWQl9DT1JFPW0KIyBlbmQgb2YgTWVkaWEgY29yZSBzdXBwb3J0CgojCiMgVmlkZW80TGlu
dXggb3B0aW9ucwojCkNPTkZJR19WSURFT19WNEwyPW0KQ09ORklHX1ZJREVPX1Y0TDJfSTJDPXkK
IyBDT05GSUdfVklERU9fVjRMMl9TVUJERVZfQVBJIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9f
QURWX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fRklYRURfTUlOT1JfUkFOR0VTIGlz
IG5vdCBzZXQKQ09ORklHX1ZJREVPX1RVTkVSPW0KIyBlbmQgb2YgVmlkZW80TGludXggb3B0aW9u
cwoKIwojIE1lZGlhIGNvbnRyb2xsZXIgb3B0aW9ucwojCiMgQ09ORklHX01FRElBX0NPTlRST0xM
RVJfRFZCIGlzIG5vdCBzZXQKIyBlbmQgb2YgTWVkaWEgY29udHJvbGxlciBvcHRpb25zCgojCiMg
RGlnaXRhbCBUViBvcHRpb25zCiMKIyBDT05GSUdfRFZCX01NQVAgaXMgbm90IHNldApDT05GSUdf
RFZCX05FVD15CkNPTkZJR19EVkJfTUFYX0FEQVBURVJTPTE2CkNPTkZJR19EVkJfRFlOQU1JQ19N
SU5PUlM9eQojIENPTkZJR19EVkJfREVNVVhfU0VDVElPTl9MT1NTX0xPRyBpcyBub3Qgc2V0CiMg
Q09ORklHX0RWQl9VTEVfREVCVUcgaXMgbm90IHNldAojIGVuZCBvZiBEaWdpdGFsIFRWIG9wdGlv
bnMKCiMKIyBNZWRpYSBkcml2ZXJzCiMKQ09ORklHX01FRElBX1VTQl9TVVBQT1JUPXkKCiMKIyBX
ZWJjYW0gZGV2aWNlcwojCkNPTkZJR19VU0JfVklERU9fQ0xBU1M9bQpDT05GSUdfVVNCX1ZJREVP
X0NMQVNTX0lOUFVUX0VWREVWPXkKIyBDT05GSUdfVVNCX0dTUENBIGlzIG5vdCBzZXQKIyBDT05G
SUdfVVNCX1BXQyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0NQSUEyIGlzIG5vdCBzZXQKIyBD
T05GSUdfVVNCX1pSMzY0WFggaXMgbm90IHNldAojIENPTkZJR19VU0JfU1RLV0VCQ0FNIGlzIG5v
dCBzZXQKIyBDT05GSUdfVVNCX1MyMjU1IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fVVNCVFYg
aXMgbm90IHNldAoKIwojIEFuYWxvZyBUViBVU0IgZGV2aWNlcwojCiMgQ09ORklHX1ZJREVPX1BW
UlVTQjIgaXMgbm90IHNldAojIENPTkZJR19WSURFT19IRFBWUiBpcyBub3Qgc2V0CiMgQ09ORklH
X1ZJREVPX1NUSzExNjBfQ09NTU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fR083MDA3IGlz
IG5vdCBzZXQKCiMKIyBBbmFsb2cvZGlnaXRhbCBUViBVU0IgZGV2aWNlcwojCiMgQ09ORklHX1ZJ
REVPX0FVMDgyOCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0NYMjMxWFggaXMgbm90IHNldAoj
IENPTkZJR19WSURFT19UTTYwMDAgaXMgbm90IHNldAoKIwojIERpZ2l0YWwgVFYgVVNCIGRldmlj
ZXMKIwojIENPTkZJR19EVkJfVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdfRFZCX1VTQl9WMiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0RWQl9UVFVTQl9CVURHRVQgaXMgbm90IHNldAojIENPTkZJR19EVkJf
VFRVU0JfREVDIGlzIG5vdCBzZXQKIyBDT05GSUdfU01TX1VTQl9EUlYgaXMgbm90IHNldAojIENP
TkZJR19EVkJfQjJDMl9GTEVYQ09QX1VTQiBpcyBub3Qgc2V0CiMgQ09ORklHX0RWQl9BUzEwMiBp
cyBub3Qgc2V0CgojCiMgV2ViY2FtLCBUViAoYW5hbG9nL2RpZ2l0YWwpIFVTQiBkZXZpY2VzCiMK
Q09ORklHX1ZJREVPX0VNMjhYWD1tCkNPTkZJR19WSURFT19FTTI4WFhfVjRMMj1tCkNPTkZJR19W
SURFT19FTTI4WFhfQUxTQT1tCkNPTkZJR19WSURFT19FTTI4WFhfRFZCPW0KQ09ORklHX1ZJREVP
X0VNMjhYWF9SQz1tCgojCiMgU29mdHdhcmUgZGVmaW5lZCByYWRpbyBVU0IgZGV2aWNlcwojCiMg
Q09ORklHX1VTQl9BSVJTUFkgaXMgbm90IHNldAojIENPTkZJR19VU0JfSEFDS1JGIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVVNCX01TSTI1MDAgaXMgbm90IHNldAojIENPTkZJR19NRURJQV9QQ0lfU1VQ
UE9SVCBpcyBub3Qgc2V0CkNPTkZJR19SQURJT19BREFQVEVSUz15CiMgQ09ORklHX1JBRElPX1NJ
NDcwWCBpcyBub3Qgc2V0CiMgQ09ORklHX1JBRElPX1NJNDcxMyBpcyBub3Qgc2V0CiMgQ09ORklH
X1VTQl9NUjgwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9EU0JSIGlzIG5vdCBzZXQKIyBDT05G
SUdfUkFESU9fTUFYSVJBRElPIGlzIG5vdCBzZXQKIyBDT05GSUdfUkFESU9fU0hBUksgaXMgbm90
IHNldAojIENPTkZJR19SQURJT19TSEFSSzIgaXMgbm90IHNldAojIENPTkZJR19VU0JfS0VFTkUg
aXMgbm90IHNldAojIENPTkZJR19VU0JfUkFSRU1PTk8gaXMgbm90IHNldAojIENPTkZJR19VU0Jf
TUE5MDEgaXMgbm90IHNldAojIENPTkZJR19SQURJT19URUE1NzY0IGlzIG5vdCBzZXQKIyBDT05G
SUdfUkFESU9fU0FBNzcwNkggaXMgbm90IHNldAojIENPTkZJR19SQURJT19URUY2ODYyIGlzIG5v
dCBzZXQKIyBDT05GSUdfUkFESU9fV0wxMjczIGlzIG5vdCBzZXQKQ09ORklHX1ZJREVPX1RWRUVQ
Uk9NPW0KQ09ORklHX1ZJREVPQlVGMl9DT1JFPW0KQ09ORklHX1ZJREVPQlVGMl9WNEwyPW0KQ09O
RklHX1ZJREVPQlVGMl9NRU1PUFM9bQpDT05GSUdfVklERU9CVUYyX1ZNQUxMT0M9bQpDT05GSUdf
VjRMX1BMQVRGT1JNX0RSSVZFUlM9eQojIENPTkZJR19WSURFT19DQUZFX0NDSUMgaXMgbm90IHNl
dAojIENPTkZJR19WSURFT19DQURFTkNFIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fQVNQRUVE
IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fTVVYIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9f
WElMSU5YIGlzIG5vdCBzZXQKIyBDT05GSUdfVjRMX01FTTJNRU1fRFJJVkVSUyBpcyBub3Qgc2V0
CiMgQ09ORklHX0RWQl9QTEFURk9STV9EUklWRVJTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0RSX1BM
QVRGT1JNX0RSSVZFUlMgaXMgbm90IHNldAoKIwojIE1NQy9TRElPIERWQiBhZGFwdGVycwojCiMg
Q09ORklHX1NNU19TRElPX0RSViBpcyBub3Qgc2V0CiMgQ09ORklHX1Y0TF9URVNUX0RSSVZFUlMg
aXMgbm90IHNldAojIENPTkZJR19EVkJfVEVTVF9EUklWRVJTIGlzIG5vdCBzZXQKIyBlbmQgb2Yg
TWVkaWEgZHJpdmVycwoKIwojIE1lZGlhIGFuY2lsbGFyeSBkcml2ZXJzCiMKQ09ORklHX01FRElB
X0FUVEFDSD15CkNPTkZJR19WSURFT19JUl9JMkM9bQoKIwojIEF1ZGlvIGRlY29kZXJzLCBwcm9j
ZXNzb3JzIGFuZCBtaXhlcnMKIwojIENPTkZJR19WSURFT19UVkFVRElPIGlzIG5vdCBzZXQKIyBD
T05GSUdfVklERU9fVERBNzQzMiBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX1REQTk4NDAgaXMg
bm90IHNldAojIENPTkZJR19WSURFT19UREExOTk3WCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVP
X1RFQTY0MTVDIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fVEVBNjQyMCBpcyBub3Qgc2V0CiMg
Q09ORklHX1ZJREVPX01TUDM0MDAgaXMgbm90IHNldAojIENPTkZJR19WSURFT19DUzMzMDggaXMg
bm90IHNldAojIENPTkZJR19WSURFT19DUzUzNDUgaXMgbm90IHNldAojIENPTkZJR19WSURFT19D
UzUzTDMyQSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX1RMVjMyMEFJQzIzQiBpcyBub3Qgc2V0
CiMgQ09ORklHX1ZJREVPX1VEQTEzNDIgaXMgbm90IHNldAojIENPTkZJR19WSURFT19XTTg3NzUg
aXMgbm90IHNldAojIENPTkZJR19WSURFT19XTTg3MzkgaXMgbm90IHNldAojIENPTkZJR19WSURF
T19WUDI3U01QWCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX1NPTllfQlRGX01QWCBpcyBub3Qg
c2V0CiMgZW5kIG9mIEF1ZGlvIGRlY29kZXJzLCBwcm9jZXNzb3JzIGFuZCBtaXhlcnMKCiMKIyBS
RFMgZGVjb2RlcnMKIwojIENPTkZJR19WSURFT19TQUE2NTg4IGlzIG5vdCBzZXQKIyBlbmQgb2Yg
UkRTIGRlY29kZXJzCgojCiMgVmlkZW8gZGVjb2RlcnMKIwojIENPTkZJR19WSURFT19BRFY3MTgw
IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fQURWNzE4MyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJ
REVPX0FEVjc0OFggaXMgbm90IHNldAojIENPTkZJR19WSURFT19BRFY3NjA0IGlzIG5vdCBzZXQK
IyBDT05GSUdfVklERU9fQURWNzg0MiBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0JUODE5IGlz
IG5vdCBzZXQKIyBDT05GSUdfVklERU9fQlQ4NTYgaXMgbm90IHNldAojIENPTkZJR19WSURFT19C
VDg2NiBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0tTMDEyNyBpcyBub3Qgc2V0CiMgQ09ORklH
X1ZJREVPX01MODZWNzY2NyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX1NBQTcxMTAgaXMgbm90
IHNldAojIENPTkZJR19WSURFT19TQUE3MTFYIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fVEMz
NTg3NDMgaXMgbm90IHNldAojIENPTkZJR19WSURFT19UVlA1MTRYIGlzIG5vdCBzZXQKIyBDT05G
SUdfVklERU9fVFZQNTE1MCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX1RWUDcwMDIgaXMgbm90
IHNldAojIENPTkZJR19WSURFT19UVzI4MDQgaXMgbm90IHNldAojIENPTkZJR19WSURFT19UVzk5
MDMgaXMgbm90IHNldAojIENPTkZJR19WSURFT19UVzk5MDYgaXMgbm90IHNldAojIENPTkZJR19W
SURFT19UVzk5MTAgaXMgbm90IHNldAojIENPTkZJR19WSURFT19WUFgzMjIwIGlzIG5vdCBzZXQK
IyBDT05GSUdfVklERU9fTUFYOTI4NiBpcyBub3Qgc2V0CgojCiMgVmlkZW8gYW5kIGF1ZGlvIGRl
Y29kZXJzCiMKIyBDT05GSUdfVklERU9fU0FBNzE3WCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVP
X0NYMjU4NDAgaXMgbm90IHNldAojIGVuZCBvZiBWaWRlbyBkZWNvZGVycwoKIwojIFZpZGVvIGVu
Y29kZXJzCiMKIyBDT05GSUdfVklERU9fU0FBNzEyNyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVP
X1NBQTcxODUgaXMgbm90IHNldAojIENPTkZJR19WSURFT19BRFY3MTcwIGlzIG5vdCBzZXQKIyBD
T05GSUdfVklERU9fQURWNzE3NSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0FEVjczNDMgaXMg
bm90IHNldAojIENPTkZJR19WSURFT19BRFY3MzkzIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9f
QURWNzUxMSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0FEOTM4OUIgaXMgbm90IHNldAojIENP
TkZJR19WSURFT19BSzg4MVggaXMgbm90IHNldAojIENPTkZJR19WSURFT19USFM4MjAwIGlzIG5v
dCBzZXQKIyBlbmQgb2YgVmlkZW8gZW5jb2RlcnMKCiMKIyBWaWRlbyBpbXByb3ZlbWVudCBjaGlw
cwojCiMgQ09ORklHX1ZJREVPX1VQRDY0MDMxQSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX1VQ
RDY0MDgzIGlzIG5vdCBzZXQKIyBlbmQgb2YgVmlkZW8gaW1wcm92ZW1lbnQgY2hpcHMKCiMKIyBB
dWRpby9WaWRlbyBjb21wcmVzc2lvbiBjaGlwcwojCiMgQ09ORklHX1ZJREVPX1NBQTY3NTJIUyBp
cyBub3Qgc2V0CiMgZW5kIG9mIEF1ZGlvL1ZpZGVvIGNvbXByZXNzaW9uIGNoaXBzCgojCiMgU0RS
IHR1bmVyIGNoaXBzCiMKIyBDT05GSUdfU0RSX01BWDIxNzUgaXMgbm90IHNldAojIGVuZCBvZiBT
RFIgdHVuZXIgY2hpcHMKCiMKIyBNaXNjZWxsYW5lb3VzIGhlbHBlciBjaGlwcwojCiMgQ09ORklH
X1ZJREVPX1RIUzczMDMgaXMgbm90IHNldAojIENPTkZJR19WSURFT19NNTI3OTAgaXMgbm90IHNl
dAojIENPTkZJR19WSURFT19JMkMgaXMgbm90IHNldAojIENPTkZJR19WSURFT19TVF9NSVBJRDAy
IGlzIG5vdCBzZXQKIyBlbmQgb2YgTWlzY2VsbGFuZW91cyBoZWxwZXIgY2hpcHMKCiMKIyBDYW1l
cmEgc2Vuc29yIGRldmljZXMKIwojIENPTkZJR19WSURFT19ISTU1NiBpcyBub3Qgc2V0CiMgQ09O
RklHX1ZJREVPX0lNWDIxNCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0lNWDIxOSBpcyBub3Qg
c2V0CiMgQ09ORklHX1ZJREVPX0lNWDI1OCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0lNWDI3
NCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0lNWDI5MCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJ
REVPX0lNWDMxOSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0lNWDMzNCBpcyBub3Qgc2V0CiMg
Q09ORklHX1ZJREVPX0lNWDMzNSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0lNWDM1NSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1ZJREVPX0lNWDQxMiBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX09W
MDJBMTAgaXMgbm90IHNldAojIENPTkZJR19WSURFT19PVjI2NDAgaXMgbm90IHNldAojIENPTkZJ
R19WSURFT19PVjI2NTkgaXMgbm90IHNldAojIENPTkZJR19WSURFT19PVjI2ODAgaXMgbm90IHNl
dAojIENPTkZJR19WSURFT19PVjI2ODUgaXMgbm90IHNldAojIENPTkZJR19WSURFT19PVjU2NDAg
aXMgbm90IHNldAojIENPTkZJR19WSURFT19PVjU2NDUgaXMgbm90IHNldAojIENPTkZJR19WSURF
T19PVjU2NDcgaXMgbm90IHNldAojIENPTkZJR19WSURFT19PVjU2NDggaXMgbm90IHNldAojIENP
TkZJR19WSURFT19PVjY2NTAgaXMgbm90IHNldAojIENPTkZJR19WSURFT19PVjU2NzAgaXMgbm90
IHNldAojIENPTkZJR19WSURFT19PVjU2NzUgaXMgbm90IHNldAojIENPTkZJR19WSURFT19PVjU2
OTUgaXMgbm90IHNldAojIENPTkZJR19WSURFT19PVjcyNTEgaXMgbm90IHNldAojIENPTkZJR19W
SURFT19PVjc3MlggaXMgbm90IHNldAojIENPTkZJR19WSURFT19PVjc2NDAgaXMgbm90IHNldAoj
IENPTkZJR19WSURFT19PVjc2NzAgaXMgbm90IHNldAojIENPTkZJR19WSURFT19PVjc3NDAgaXMg
bm90IHNldAojIENPTkZJR19WSURFT19PVjg4NTYgaXMgbm90IHNldAojIENPTkZJR19WSURFT19P
Vjg4NjUgaXMgbm90IHNldAojIENPTkZJR19WSURFT19PVjkyODIgaXMgbm90IHNldAojIENPTkZJ
R19WSURFT19PVjk2NDAgaXMgbm90IHNldAojIENPTkZJR19WSURFT19PVjk2NTAgaXMgbm90IHNl
dAojIENPTkZJR19WSURFT19PVjEzODU4IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fVlM2NjI0
IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fTVQ5TTAwMSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJ
REVPX01UOU0wMzIgaXMgbm90IHNldAojIENPTkZJR19WSURFT19NVDlNMTExIGlzIG5vdCBzZXQK
IyBDT05GSUdfVklERU9fTVQ5UDAzMSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX01UOVQwMDEg
aXMgbm90IHNldAojIENPTkZJR19WSURFT19NVDlUMTEyIGlzIG5vdCBzZXQKIyBDT05GSUdfVklE
RU9fTVQ5VjAxMSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX01UOVYwMzIgaXMgbm90IHNldAoj
IENPTkZJR19WSURFT19NVDlWMTExIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fU1IwMzBQQzMw
IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fTk9PTjAxMFBDMzAgaXMgbm90IHNldAojIENPTkZJ
R19WSURFT19NNU1PTFMgaXMgbm90IHNldAojIENPTkZJR19WSURFT19SREFDTTIwIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVklERU9fUkRBQ00yMSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX1JKNTRO
MSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX1M1SzZBQSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJ
REVPX1M1SzZBMyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX1M1SzRFQ0dYIGlzIG5vdCBzZXQK
IyBDT05GSUdfVklERU9fUzVLNUJBRiBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0NDUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1ZJREVPX0VUOEVLOCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX1M1
QzczTTMgaXMgbm90IHNldAojIGVuZCBvZiBDYW1lcmEgc2Vuc29yIGRldmljZXMKCiMKIyBMZW5z
IGRyaXZlcnMKIwojIENPTkZJR19WSURFT19BRDU4MjAgaXMgbm90IHNldAojIENPTkZJR19WSURF
T19BSzczNzUgaXMgbm90IHNldAojIENPTkZJR19WSURFT19EVzk3MTQgaXMgbm90IHNldAojIENP
TkZJR19WSURFT19EVzk3NjggaXMgbm90IHNldAojIENPTkZJR19WSURFT19EVzk4MDdfVkNNIGlz
IG5vdCBzZXQKIyBlbmQgb2YgTGVucyBkcml2ZXJzCgojCiMgRmxhc2ggZGV2aWNlcwojCiMgQ09O
RklHX1ZJREVPX0FEUDE2NTMgaXMgbm90IHNldAojIENPTkZJR19WSURFT19MTTM1NjAgaXMgbm90
IHNldAojIENPTkZJR19WSURFT19MTTM2NDYgaXMgbm90IHNldAojIGVuZCBvZiBGbGFzaCBkZXZp
Y2VzCgojCiMgU1BJIGhlbHBlciBjaGlwcwojCiMgQ09ORklHX1ZJREVPX0dTMTY2MiBpcyBub3Qg
c2V0CiMgZW5kIG9mIFNQSSBoZWxwZXIgY2hpcHMKCiMKIyBNZWRpYSBTUEkgQWRhcHRlcnMKIwpD
T05GSUdfQ1hEMjg4MF9TUElfRFJWPW0KIyBlbmQgb2YgTWVkaWEgU1BJIEFkYXB0ZXJzCgpDT05G
SUdfTUVESUFfVFVORVI9bQoKIwojIEN1c3RvbWl6ZSBUViB0dW5lcnMKIwpDT05GSUdfTUVESUFf
VFVORVJfU0lNUExFPW0KQ09ORklHX01FRElBX1RVTkVSX1REQTE4MjUwPW0KQ09ORklHX01FRElB
X1RVTkVSX1REQTgyOTA9bQpDT05GSUdfTUVESUFfVFVORVJfVERBODI3WD1tCkNPTkZJR19NRURJ
QV9UVU5FUl9UREExODI3MT1tCkNPTkZJR19NRURJQV9UVU5FUl9UREE5ODg3PW0KQ09ORklHX01F
RElBX1RVTkVSX1RFQTU3NjE9bQpDT05GSUdfTUVESUFfVFVORVJfVEVBNTc2Nz1tCkNPTkZJR19N
RURJQV9UVU5FUl9NU0kwMDE9bQpDT05GSUdfTUVESUFfVFVORVJfTVQyMFhYPW0KQ09ORklHX01F
RElBX1RVTkVSX01UMjA2MD1tCkNPTkZJR19NRURJQV9UVU5FUl9NVDIwNjM9bQpDT05GSUdfTUVE
SUFfVFVORVJfTVQyMjY2PW0KQ09ORklHX01FRElBX1RVTkVSX01UMjEzMT1tCkNPTkZJR19NRURJ
QV9UVU5FUl9RVDEwMTA9bQpDT05GSUdfTUVESUFfVFVORVJfWEMyMDI4PW0KQ09ORklHX01FRElB
X1RVTkVSX1hDNTAwMD1tCkNPTkZJR19NRURJQV9UVU5FUl9YQzQwMDA9bQpDT05GSUdfTUVESUFf
VFVORVJfTVhMNTAwNVM9bQpDT05GSUdfTUVESUFfVFVORVJfTVhMNTAwN1Q9bQpDT05GSUdfTUVE
SUFfVFVORVJfTUM0NFM4MDM9bQpDT05GSUdfTUVESUFfVFVORVJfTUFYMjE2NT1tCkNPTkZJR19N
RURJQV9UVU5FUl9UREExODIxOD1tCkNPTkZJR19NRURJQV9UVU5FUl9GQzAwMTE9bQpDT05GSUdf
TUVESUFfVFVORVJfRkMwMDEyPW0KQ09ORklHX01FRElBX1RVTkVSX0ZDMDAxMz1tCkNPTkZJR19N
RURJQV9UVU5FUl9UREExODIxMj1tCkNPTkZJR19NRURJQV9UVU5FUl9FNDAwMD1tCkNPTkZJR19N
RURJQV9UVU5FUl9GQzI1ODA9bQpDT05GSUdfTUVESUFfVFVORVJfTTg4UlM2MDAwVD1tCkNPTkZJ
R19NRURJQV9UVU5FUl9UVUE5MDAxPW0KQ09ORklHX01FRElBX1RVTkVSX1NJMjE1Nz1tCkNPTkZJ
R19NRURJQV9UVU5FUl9JVDkxM1g9bQpDT05GSUdfTUVESUFfVFVORVJfUjgyMFQ9bQpDT05GSUdf
TUVESUFfVFVORVJfTVhMMzAxUkY9bQpDT05GSUdfTUVESUFfVFVORVJfUU0xRDFDMDA0Mj1tCkNP
TkZJR19NRURJQV9UVU5FUl9RTTFEMUIwMDA0PW0KIyBlbmQgb2YgQ3VzdG9taXplIFRWIHR1bmVy
cwoKIwojIEN1c3RvbWlzZSBEVkIgRnJvbnRlbmRzCiMKCiMKIyBNdWx0aXN0YW5kYXJkIChzYXRl
bGxpdGUpIGZyb250ZW5kcwojCkNPTkZJR19EVkJfU1RCMDg5OT1tCkNPTkZJR19EVkJfU1RCNjEw
MD1tCkNPTkZJR19EVkJfU1RWMDkweD1tCkNPTkZJR19EVkJfU1RWMDkxMD1tCkNPTkZJR19EVkJf
U1RWNjExMHg9bQpDT05GSUdfRFZCX1NUVjYxMTE9bQpDT05GSUdfRFZCX01YTDVYWD1tCkNPTkZJ
R19EVkJfTTg4RFMzMTAzPW0KCiMKIyBNdWx0aXN0YW5kYXJkIChjYWJsZSArIHRlcnJlc3RyaWFs
KSBmcm9udGVuZHMKIwpDT05GSUdfRFZCX0RSWEs9bQpDT05GSUdfRFZCX1REQTE4MjcxQzJERD1t
CkNPTkZJR19EVkJfU0kyMTY1PW0KQ09ORklHX0RWQl9NTjg4NDcyPW0KQ09ORklHX0RWQl9NTjg4
NDczPW0KCiMKIyBEVkItUyAoc2F0ZWxsaXRlKSBmcm9udGVuZHMKIwpDT05GSUdfRFZCX0NYMjQx
MTA9bQpDT05GSUdfRFZCX0NYMjQxMjM9bQpDT05GSUdfRFZCX01UMzEyPW0KQ09ORklHX0RWQl9a
TDEwMDM2PW0KQ09ORklHX0RWQl9aTDEwMDM5PW0KQ09ORklHX0RWQl9TNUgxNDIwPW0KQ09ORklH
X0RWQl9TVFYwMjg4PW0KQ09ORklHX0RWQl9TVEI2MDAwPW0KQ09ORklHX0RWQl9TVFYwMjk5PW0K
Q09ORklHX0RWQl9TVFY2MTEwPW0KQ09ORklHX0RWQl9TVFYwOTAwPW0KQ09ORklHX0RWQl9UREE4
MDgzPW0KQ09ORklHX0RWQl9UREExMDA4Nj1tCkNPTkZJR19EVkJfVERBODI2MT1tCkNPTkZJR19E
VkJfVkVTMVg5Mz1tCkNPTkZJR19EVkJfVFVORVJfSVREMTAwMD1tCkNPTkZJR19EVkJfVFVORVJf
Q1gyNDExMz1tCkNPTkZJR19EVkJfVERBODI2WD1tCkNPTkZJR19EVkJfVFVBNjEwMD1tCkNPTkZJ
R19EVkJfQ1gyNDExNj1tCkNPTkZJR19EVkJfQ1gyNDExNz1tCkNPTkZJR19EVkJfQ1gyNDEyMD1t
CkNPTkZJR19EVkJfU0kyMVhYPW0KQ09ORklHX0RWQl9UUzIwMjA9bQpDT05GSUdfRFZCX0RTMzAw
MD1tCkNPTkZJR19EVkJfTUI4NkExNj1tCkNPTkZJR19EVkJfVERBMTAwNzE9bQoKIwojIERWQi1U
ICh0ZXJyZXN0cmlhbCkgZnJvbnRlbmRzCiMKQ09ORklHX0RWQl9TUDg4N1g9bQpDT05GSUdfRFZC
X0NYMjI3MDA9bQpDT05GSUdfRFZCX0NYMjI3MDI9bQpDT05GSUdfRFZCX1M1SDE0MzI9bQpDT05G
SUdfRFZCX0RSWEQ9bQpDT05GSUdfRFZCX0w2NDc4MT1tCkNPTkZJR19EVkJfVERBMTAwNFg9bQpD
T05GSUdfRFZCX05YVDYwMDA9bQpDT05GSUdfRFZCX01UMzUyPW0KQ09ORklHX0RWQl9aTDEwMzUz
PW0KQ09ORklHX0RWQl9ESUIzMDAwTUI9bQpDT05GSUdfRFZCX0RJQjMwMDBNQz1tCkNPTkZJR19E
VkJfRElCNzAwME09bQpDT05GSUdfRFZCX0RJQjcwMDBQPW0KQ09ORklHX0RWQl9ESUI5MDAwPW0K
Q09ORklHX0RWQl9UREExMDA0OD1tCkNPTkZJR19EVkJfQUY5MDEzPW0KQ09ORklHX0RWQl9FQzEw
MD1tCkNPTkZJR19EVkJfU1RWMDM2Nz1tCkNPTkZJR19EVkJfQ1hEMjgyMFI9bQpDT05GSUdfRFZC
X0NYRDI4NDFFUj1tCkNPTkZJR19EVkJfUlRMMjgzMD1tCkNPTkZJR19EVkJfUlRMMjgzMj1tCkNP
TkZJR19EVkJfUlRMMjgzMl9TRFI9bQpDT05GSUdfRFZCX1NJMjE2OD1tCkNPTkZJR19EVkJfWkQx
MzAxX0RFTU9EPW0KQ09ORklHX0RWQl9DWEQyODgwPW0KCiMKIyBEVkItQyAoY2FibGUpIGZyb250
ZW5kcwojCkNPTkZJR19EVkJfVkVTMTgyMD1tCkNPTkZJR19EVkJfVERBMTAwMjE9bQpDT05GSUdf
RFZCX1REQTEwMDIzPW0KQ09ORklHX0RWQl9TVFYwMjk3PW0KCiMKIyBBVFNDIChOb3J0aCBBbWVy
aWNhbi9Lb3JlYW4gVGVycmVzdHJpYWwvQ2FibGUgRFRWKSBmcm9udGVuZHMKIwpDT05GSUdfRFZC
X05YVDIwMFg9bQpDT05GSUdfRFZCX09SNTEyMTE9bQpDT05GSUdfRFZCX09SNTExMzI9bQpDT05G
SUdfRFZCX0JDTTM1MTA9bQpDT05GSUdfRFZCX0xHRFQzMzBYPW0KQ09ORklHX0RWQl9MR0RUMzMw
NT1tCkNPTkZJR19EVkJfTEdEVDMzMDZBPW0KQ09ORklHX0RWQl9MRzIxNjA9bQpDT05GSUdfRFZC
X1M1SDE0MDk9bQpDT05GSUdfRFZCX0FVODUyMj1tCkNPTkZJR19EVkJfQVU4NTIyX0RUVj1tCkNP
TkZJR19EVkJfQVU4NTIyX1Y0TD1tCkNPTkZJR19EVkJfUzVIMTQxMT1tCkNPTkZJR19EVkJfTVhM
NjkyPW0KCiMKIyBJU0RCLVQgKHRlcnJlc3RyaWFsKSBmcm9udGVuZHMKIwpDT05GSUdfRFZCX1M5
MjE9bQpDT05GSUdfRFZCX0RJQjgwMDA9bQpDT05GSUdfRFZCX01CODZBMjBTPW0KCiMKIyBJU0RC
LVMgKHNhdGVsbGl0ZSkgJiBJU0RCLVQgKHRlcnJlc3RyaWFsKSBmcm9udGVuZHMKIwpDT05GSUdf
RFZCX1RDOTA1MjI9bQpDT05GSUdfRFZCX01OODg0NDNYPW0KCiMKIyBEaWdpdGFsIHRlcnJlc3Ry
aWFsIG9ubHkgdHVuZXJzL1BMTAojCkNPTkZJR19EVkJfUExMPW0KQ09ORklHX0RWQl9UVU5FUl9E
SUIwMDcwPW0KQ09ORklHX0RWQl9UVU5FUl9ESUIwMDkwPW0KCiMKIyBTRUMgY29udHJvbCBkZXZp
Y2VzIGZvciBEVkItUwojCkNPTkZJR19EVkJfRFJYMzlYWUo9bQpDT05GSUdfRFZCX0xOQkgyNT1t
CkNPTkZJR19EVkJfTE5CSDI5PW0KQ09ORklHX0RWQl9MTkJQMjE9bQpDT05GSUdfRFZCX0xOQlAy
Mj1tCkNPTkZJR19EVkJfSVNMNjQwNT1tCkNPTkZJR19EVkJfSVNMNjQyMT1tCkNPTkZJR19EVkJf
SVNMNjQyMz1tCkNPTkZJR19EVkJfQTgyOTM9bQpDT05GSUdfRFZCX0xHUzhHTDU9bQpDT05GSUdf
RFZCX0xHUzhHWFg9bQpDT05GSUdfRFZCX0FUQk04ODMwPW0KQ09ORklHX0RWQl9UREE2NjV4PW0K
Q09ORklHX0RWQl9JWDI1MDVWPW0KQ09ORklHX0RWQl9NODhSUzIwMDA9bQpDT05GSUdfRFZCX0FG
OTAzMz1tCkNPTkZJR19EVkJfSE9SVVMzQT1tCkNPTkZJR19EVkJfQVNDT1QyRT1tCkNPTkZJR19E
VkJfSEVMRU5FPW0KCiMKIyBDb21tb24gSW50ZXJmYWNlIChFTjUwMjIxKSBjb250cm9sbGVyIGRy
aXZlcnMKIwpDT05GSUdfRFZCX0NYRDIwOTk9bQpDT05GSUdfRFZCX1NQMj1tCiMgZW5kIG9mIEN1
c3RvbWlzZSBEVkIgRnJvbnRlbmRzCgojCiMgVG9vbHMgdG8gZGV2ZWxvcCBuZXcgZnJvbnRlbmRz
CiMKIyBDT05GSUdfRFZCX0RVTU1ZX0ZFIGlzIG5vdCBzZXQKIyBlbmQgb2YgTWVkaWEgYW5jaWxs
YXJ5IGRyaXZlcnMKCiMKIyBHcmFwaGljcyBzdXBwb3J0CiMKQ09ORklHX1ZHQV9BUkI9eQpDT05G
SUdfVkdBX0FSQl9NQVhfR1BVUz0xNgpDT05GSUdfRFJNPXkKQ09ORklHX0RSTV9NSVBJX0RTST15
CiMgQ09ORklHX0RSTV9EUF9BVVhfQ0hBUkRFViBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9ERUJV
R19NTSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9ERUJVR19TRUxGVEVTVCBpcyBub3Qgc2V0CkNP
TkZJR19EUk1fS01TX0hFTFBFUj15CiMgQ09ORklHX0RSTV9ERUJVR19EUF9NU1RfVE9QT0xPR1lf
UkVGUyBpcyBub3Qgc2V0CkNPTkZJR19EUk1fRkJERVZfRU1VTEFUSU9OPXkKQ09ORklHX0RSTV9G
QkRFVl9PVkVSQUxMT0M9MTAwCiMgQ09ORklHX0RSTV9GQkRFVl9MRUFLX1BIWVNfU01FTSBpcyBu
b3Qgc2V0CkNPTkZJR19EUk1fTE9BRF9FRElEX0ZJUk1XQVJFPXkKIyBDT05GSUdfRFJNX0RQX0NF
QyBpcyBub3Qgc2V0CkNPTkZJR19EUk1fR0VNX0NNQV9IRUxQRVI9eQpDT05GSUdfRFJNX0tNU19D
TUFfSEVMUEVSPXkKQ09ORklHX0RSTV9HRU1fU0hNRU1fSEVMUEVSPXkKCiMKIyBJMkMgZW5jb2Rl
ciBvciBoZWxwZXIgY2hpcHMKIwojIENPTkZJR19EUk1fSTJDX0NINzAwNiBpcyBub3Qgc2V0CiMg
Q09ORklHX0RSTV9JMkNfU0lMMTY0IGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0kyQ19OWFBfVERB
OTk4WCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9JMkNfTlhQX1REQTk5NTAgaXMgbm90IHNldAoj
IGVuZCBvZiBJMkMgZW5jb2RlciBvciBoZWxwZXIgY2hpcHMKCiMKIyBBUk0gZGV2aWNlcwojCiMg
Q09ORklHX0RSTV9IRExDRCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9NQUxJX0RJU1BMQVkgaXMg
bm90IHNldAojIENPTkZJR19EUk1fS09NRURBIGlzIG5vdCBzZXQKIyBlbmQgb2YgQVJNIGRldmlj
ZXMKCiMgQ09ORklHX0RSTV9SQURFT04gaXMgbm90IHNldAojIENPTkZJR19EUk1fQU1ER1BVIGlz
IG5vdCBzZXQKIyBDT05GSUdfRFJNX05PVVZFQVUgaXMgbm90IHNldAojIENPTkZJR19EUk1fVkdF
TSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9WS01TIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1ZN
V0dGWCBpcyBub3Qgc2V0CkNPTkZJR19EUk1fVURMPW0KIyBDT05GSUdfRFJNX0FTVCBpcyBub3Qg
c2V0CiMgQ09ORklHX0RSTV9NR0FHMjAwIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1JDQVJfRFdf
SERNSSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9SQ0FSX0xWRFMgaXMgbm90IHNldAojIENPTkZJ
R19EUk1fUVhMIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9WSVJUSU9fR1BVPXkKQ09ORklHX0RSTV9Q
QU5FTD15CgojCiMgRGlzcGxheSBQYW5lbHMKIwojIENPTkZJR19EUk1fUEFORUxfQUJUX1kwMzBY
WDA2N0EgaXMgbm90IHNldAojIENPTkZJR19EUk1fUEFORUxfQVJNX1ZFUlNBVElMRSBpcyBub3Qg
c2V0CiMgQ09ORklHX0RSTV9QQU5FTF9BU1VTX1owMFRfVE01UDVfTlQzNTU5NiBpcyBub3Qgc2V0
CiMgQ09ORklHX0RSTV9QQU5FTF9CT0VfSElNQVg4Mjc5RCBpcyBub3Qgc2V0CiMgQ09ORklHX0RS
TV9QQU5FTF9CT0VfVFYxMDFXVU1fTkw2IGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1BBTkVMX0RT
SV9DTSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9MVkRTIGlzIG5vdCBzZXQKIyBDT05G
SUdfRFJNX1BBTkVMX1NJTVBMRSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9FTElEQV9L
RDM1VDEzMyBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9GRUlYSU5fSzEwMV9JTTJCQTAy
IGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1BBTkVMX0ZFSVlBTkdfRlkwNzAyNERJMjZBMzBEIGlz
IG5vdCBzZXQKIyBDT05GSUdfRFJNX1BBTkVMX0lMSVRFS19JTDkzMjIgaXMgbm90IHNldAojIENP
TkZJR19EUk1fUEFORUxfSUxJVEVLX0lMSTkzNDEgaXMgbm90IHNldAojIENPTkZJR19EUk1fUEFO
RUxfSUxJVEVLX0lMSTk4ODFDIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1BBTkVMX0lOTk9MVVhf
RUowMzBOQSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9JTk5PTFVYX1AwNzlaQ0EgaXMg
bm90IHNldApDT05GSUdfRFJNX1BBTkVMX0pESV9MVDA3ME1FMDUwMDA9bQojIENPTkZJR19EUk1f
UEFORUxfS0hBREFTX1RTMDUwIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1BBTkVMX0tJTkdESVNQ
TEFZX0tEMDk3RDA0IGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1BBTkVMX0xFQURURUtfTFRLMDUw
SDMxNDZXIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1BBTkVMX0xFQURURUtfTFRLNTAwSEQxODI5
IGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1BBTkVMX1NBTVNVTkdfTEQ5MDQwIGlzIG5vdCBzZXQK
IyBDT05GSUdfRFJNX1BBTkVMX0xHX0xCMDM1UTAyIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1BB
TkVMX0xHX0xHNDU3MyBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9ORUNfTkw4MDQ4SEwx
MSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9OT1ZBVEVLX05UMzU1MTAgaXMgbm90IHNl
dAojIENPTkZJR19EUk1fUEFORUxfTk9WQVRFS19OVDM2NjcyQSBpcyBub3Qgc2V0CiMgQ09ORklH
X0RSTV9QQU5FTF9OT1ZBVEVLX05UMzkwMTYgaXMgbm90IHNldAojIENPTkZJR19EUk1fUEFORUxf
TUFOVElYX01MQUYwNTdXRTUxIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1BBTkVMX09MSU1FWF9M
Q0RfT0xJTlVYSU5PIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1BBTkVMX09SSVNFVEVDSF9PVE04
MDA5QSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9PU0RfT1NEMTAxVDI1ODdfNTNUUyBp
cyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9QQU5BU09OSUNfVlZYMTBGMDM0TjAwIGlzIG5v
dCBzZXQKIyBDT05GSUdfRFJNX1BBTkVMX1JBU1BCRVJSWVBJX1RPVUNIU0NSRUVOIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRFJNX1BBTkVMX1JBWURJVU1fUk02NzE5MSBpcyBub3Qgc2V0CiMgQ09ORklH
X0RSTV9QQU5FTF9SQVlESVVNX1JNNjgyMDAgaXMgbm90IHNldAojIENPTkZJR19EUk1fUEFORUxf
Uk9OQk9fUkIwNzBEMzAgaXMgbm90IHNldAojIENPTkZJR19EUk1fUEFORUxfU0FNU1VOR19BVE5B
MzNYQzIwIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1BBTkVMX1NBTVNVTkdfREI3NDMwIGlzIG5v
dCBzZXQKIyBDT05GSUdfRFJNX1BBTkVMX1NBTVNVTkdfUzZEMTZEMCBpcyBub3Qgc2V0CiMgQ09O
RklHX0RSTV9QQU5FTF9TQU1TVU5HX1M2RTNIQTIgaXMgbm90IHNldAojIENPTkZJR19EUk1fUEFO
RUxfU0FNU1VOR19TNkU2M0owWDAzIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1BBTkVMX1NBTVNV
TkdfUzZFNjNNMCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9TQU1TVU5HX1M2RTg4QTBf
QU1TNDUyRUYwMSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9TQU1TVU5HX1M2RThBQTAg
aXMgbm90IHNldAojIENPTkZJR19EUk1fUEFORUxfU0FNU1VOR19TT0ZFRjAwIGlzIG5vdCBzZXQK
IyBDT05GSUdfRFJNX1BBTkVMX1NFSUtPXzQzV1ZGMUcgaXMgbm90IHNldAojIENPTkZJR19EUk1f
UEFORUxfU0hBUlBfTFExMDFSMVNYMDEgaXMgbm90IHNldAojIENPTkZJR19EUk1fUEFORUxfU0hB
UlBfTFMwMzdWN0RXMDEgaXMgbm90IHNldAojIENPTkZJR19EUk1fUEFORUxfU0hBUlBfTFMwNDNU
MUxFMDEgaXMgbm90IHNldAojIENPTkZJR19EUk1fUEFORUxfU0lUUk9OSVhfU1Q3NzAxIGlzIG5v
dCBzZXQKIyBDT05GSUdfRFJNX1BBTkVMX1NJVFJPTklYX1NUNzcwMyBpcyBub3Qgc2V0CiMgQ09O
RklHX0RSTV9QQU5FTF9TSVRST05JWF9TVDc3ODlWIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1BB
TkVMX1NPTllfQUNYNDI0QUtQIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1BBTkVMX1NPTllfQUNY
NTY1QUtNIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1BBTkVMX1RET19UTDA3MFdTSDMwIGlzIG5v
dCBzZXQKIyBDT05GSUdfRFJNX1BBTkVMX1RQT19URDAyOFRURUMxIGlzIG5vdCBzZXQKIyBDT05G
SUdfRFJNX1BBTkVMX1RQT19URDA0M01URUExIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1BBTkVM
X1RQT19UUEcxMTAgaXMgbm90IHNldAojIENPTkZJR19EUk1fUEFORUxfVFJVTFlfTlQzNTU5N19X
UVhHQSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9WSVNJT05PWF9STTY5Mjk5IGlzIG5v
dCBzZXQKIyBDT05GSUdfRFJNX1BBTkVMX1dJREVDSElQU19XUzI0MDEgaXMgbm90IHNldAojIENP
TkZJR19EUk1fUEFORUxfWElOUEVOR19YUFAwNTVDMjcyIGlzIG5vdCBzZXQKIyBlbmQgb2YgRGlz
cGxheSBQYW5lbHMKCkNPTkZJR19EUk1fQlJJREdFPXkKQ09ORklHX0RSTV9QQU5FTF9CUklER0U9
eQoKIwojIERpc3BsYXkgSW50ZXJmYWNlIEJyaWRnZXMKIwojIENPTkZJR19EUk1fQ0ROU19EU0kg
aXMgbm90IHNldAojIENPTkZJR19EUk1fQ0hJUE9ORV9JQ042MjExIGlzIG5vdCBzZXQKIyBDT05G
SUdfRFJNX0NIUk9OVEVMX0NINzAzMyBpcyBub3Qgc2V0CkNPTkZJR19EUk1fRElTUExBWV9DT05O
RUNUT1I9bQojIENPTkZJR19EUk1fTE9OVElVTV9MVDg5MTJCIGlzIG5vdCBzZXQKIyBDT05GSUdf
RFJNX0xPTlRJVU1fTFQ5NjExIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0xPTlRJVU1fTFQ5NjEx
VVhDIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0lURV9JVDY2MTIxIGlzIG5vdCBzZXQKIyBDT05G
SUdfRFJNX0xWRFNfQ09ERUMgaXMgbm90IHNldAojIENPTkZJR19EUk1fTUVHQUNISVBTX1NURFBY
WFhYX0dFX0I4NTBWM19GVyBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9OV0xfTUlQSV9EU0kgaXMg
bm90IHNldAojIENPTkZJR19EUk1fTlhQX1BUTjM0NjAgaXMgbm90IHNldAojIENPTkZJR19EUk1f
UEFSQURFX1BTODYyMiBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQVJBREVfUFM4NjQwIGlzIG5v
dCBzZXQKIyBDT05GSUdfRFJNX1NJTF9TSUk4NjIwIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1NJ
STkwMlggaXMgbm90IHNldAojIENPTkZJR19EUk1fU0lJOTIzNCBpcyBub3Qgc2V0CkNPTkZJR19E
Uk1fU0lNUExFX0JSSURHRT1tCiMgQ09ORklHX0RSTV9USElORV9USEM2M0xWRDEwMjQgaXMgbm90
IHNldAojIENPTkZJR19EUk1fVE9TSElCQV9UQzM1ODc2MiBpcyBub3Qgc2V0CiMgQ09ORklHX0RS
TV9UT1NISUJBX1RDMzU4NzY0IGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1RPU0hJQkFfVEMzNTg3
NjcgaXMgbm90IHNldAojIENPTkZJR19EUk1fVE9TSElCQV9UQzM1ODc2OCBpcyBub3Qgc2V0CiMg
Q09ORklHX0RSTV9UT1NISUJBX1RDMzU4Nzc1IGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1RJX1RG
UDQxMCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9USV9TTjY1RFNJODMgaXMgbm90IHNldAojIENP
TkZJR19EUk1fVElfU042NURTSTg2IGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1RJX1RQRDEyUzAx
NSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9BTkFMT0dJWF9BTlg2MzQ1IGlzIG5vdCBzZXQKIyBD
T05GSUdfRFJNX0FOQUxPR0lYX0FOWDc4WFggaXMgbm90IHNldAojIENPTkZJR19EUk1fQU5BTE9H
SVhfQU5YNzYyNSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9JMkNfQURWNzUxMSBpcyBub3Qgc2V0
CiMgQ09ORklHX0RSTV9DRE5TX01IRFA4NTQ2IGlzIG5vdCBzZXQKIyBlbmQgb2YgRGlzcGxheSBJ
bnRlcmZhY2UgQnJpZGdlcwoKQ09ORklHX0RSTV9WQzQ9bQpDT05GSUdfRFJNX1ZDNF9IRE1JX0NF
Qz15CiMgQ09ORklHX0RSTV9FVE5BVklWIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0hJU0lfSElC
TUMgaXMgbm90IHNldAojIENPTkZJR19EUk1fSElTSV9LSVJJTiBpcyBub3Qgc2V0CiMgQ09ORklH
X0RSTV9NWFNGQiBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9BUkNQR1UgaXMgbm90IHNldAojIENP
TkZJR19EUk1fQk9DSFMgaXMgbm90IHNldAojIENPTkZJR19EUk1fQ0lSUlVTX1FFTVUgaXMgbm90
IHNldAojIENPTkZJR19EUk1fR00xMlUzMjAgaXMgbm90IHNldAojIENPTkZJR19EUk1fU0lNUExF
RFJNIGlzIG5vdCBzZXQKIyBDT05GSUdfVElOWURSTV9IWDgzNTdEIGlzIG5vdCBzZXQKIyBDT05G
SUdfVElOWURSTV9JTEk5MjI1IGlzIG5vdCBzZXQKIyBDT05GSUdfVElOWURSTV9JTEk5MzQxIGlz
IG5vdCBzZXQKIyBDT05GSUdfVElOWURSTV9JTEk5NDg2IGlzIG5vdCBzZXQKIyBDT05GSUdfVElO
WURSTV9NSTAyODNRVCBpcyBub3Qgc2V0CiMgQ09ORklHX1RJTllEUk1fUkVQQVBFUiBpcyBub3Qg
c2V0CiMgQ09ORklHX1RJTllEUk1fU1Q3NTg2IGlzIG5vdCBzZXQKIyBDT05GSUdfVElOWURSTV9T
VDc3MzVSIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1BMMTExIGlzIG5vdCBzZXQKQ09ORklHX0RS
TV9YRU49eQpDT05GSUdfRFJNX1hFTl9GUk9OVEVORD15CiMgQ09ORklHX0RSTV9MSU1BIGlzIG5v
dCBzZXQKIyBDT05GSUdfRFJNX1BBTkZST1NUIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1RJRFNT
IGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0dVRCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9MRUdB
Q1kgaXMgbm90IHNldApDT05GSUdfRFJNX1BBTkVMX09SSUVOVEFUSU9OX1FVSVJLUz15CgojCiMg
RnJhbWUgYnVmZmVyIERldmljZXMKIwpDT05GSUdfRkJfQ01ETElORT15CkNPTkZJR19GQl9OT1RJ
Rlk9eQpDT05GSUdfRkI9eQojIENPTkZJR19GSVJNV0FSRV9FRElEIGlzIG5vdCBzZXQKQ09ORklH
X0ZCX0NGQl9GSUxMUkVDVD15CkNPTkZJR19GQl9DRkJfQ09QWUFSRUE9eQpDT05GSUdfRkJfQ0ZC
X0lNQUdFQkxJVD15CkNPTkZJR19GQl9TWVNfRklMTFJFQ1Q9eQpDT05GSUdfRkJfU1lTX0NPUFlB
UkVBPXkKQ09ORklHX0ZCX1NZU19JTUFHRUJMSVQ9eQojIENPTkZJR19GQl9GT1JFSUdOX0VORElB
TiBpcyBub3Qgc2V0CkNPTkZJR19GQl9TWVNfRk9QUz15CkNPTkZJR19GQl9ERUZFUlJFRF9JTz15
CkNPTkZJR19GQl9CQUNLTElHSFQ9bQpDT05GSUdfRkJfTU9ERV9IRUxQRVJTPXkKIyBDT05GSUdf
RkJfVElMRUJMSVRUSU5HIGlzIG5vdCBzZXQKCiMKIyBGcmFtZSBidWZmZXIgaGFyZHdhcmUgZHJp
dmVycwojCiMgQ09ORklHX0ZCX0NJUlJVUyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1BNMiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0ZCX0FSTUNMQ0QgaXMgbm90IHNldAojIENPTkZJR19GQl9DWUJFUjIw
MDAgaXMgbm90IHNldAojIENPTkZJR19GQl9BU0lMSUFOVCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZC
X0lNU1RUIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfRUZJIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJf
T1BFTkNPUkVTIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfUzFEMTNYWFggaXMgbm90IHNldAojIENP
TkZJR19GQl9OVklESUEgaXMgbm90IHNldAojIENPTkZJR19GQl9SSVZBIGlzIG5vdCBzZXQKIyBD
T05GSUdfRkJfSTc0MCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX01BVFJPWCBpcyBub3Qgc2V0CiMg
Q09ORklHX0ZCX1JBREVPTiBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX0FUWTEyOCBpcyBub3Qgc2V0
CiMgQ09ORklHX0ZCX0FUWSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1MzIGlzIG5vdCBzZXQKIyBD
T05GSUdfRkJfU0FWQUdFIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfU0lTIGlzIG5vdCBzZXQKIyBD
T05GSUdfRkJfTkVPTUFHSUMgaXMgbm90IHNldAojIENPTkZJR19GQl9LWVJPIGlzIG5vdCBzZXQK
IyBDT05GSUdfRkJfM0RGWCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1ZPT0RPTzEgaXMgbm90IHNl
dAojIENPTkZJR19GQl9WVDg2MjMgaXMgbm90IHNldAojIENPTkZJR19GQl9UUklERU5UIGlzIG5v
dCBzZXQKIyBDT05GSUdfRkJfQVJLIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfUE0zIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRkJfQ0FSTUlORSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1NNU0NVRlggaXMg
bm90IHNldApDT05GSUdfRkJfVURMPW0KIyBDT05GSUdfRkJfSUJNX0dYVDQ1MDAgaXMgbm90IHNl
dAojIENPTkZJR19GQl9WSVJUVUFMIGlzIG5vdCBzZXQKQ09ORklHX1hFTl9GQkRFVl9GUk9OVEVO
RD15CiMgQ09ORklHX0ZCX01FVFJPTk9NRSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX01CODYyWFgg
aXMgbm90IHNldApDT05GSUdfRkJfU0lNUExFPXkKQ09ORklHX0ZCX1NTRDEzMDc9bQojIENPTkZJ
R19GQl9TTTcxMiBpcyBub3Qgc2V0CiMgZW5kIG9mIEZyYW1lIGJ1ZmZlciBEZXZpY2VzCgojCiMg
QmFja2xpZ2h0ICYgTENEIGRldmljZSBzdXBwb3J0CiMKIyBDT05GSUdfTENEX0NMQVNTX0RFVklD
RSBpcyBub3Qgc2V0CkNPTkZJR19CQUNLTElHSFRfQ0xBU1NfREVWSUNFPW0KIyBDT05GSUdfQkFD
S0xJR0hUX0tURDI1MyBpcyBub3Qgc2V0CiMgQ09ORklHX0JBQ0tMSUdIVF9QV00gaXMgbm90IHNl
dAojIENPTkZJR19CQUNLTElHSFRfUUNPTV9XTEVEIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJ
R0hUX0FEUDg4NjAgaXMgbm90IHNldAojIENPTkZJR19CQUNLTElHSFRfQURQODg3MCBpcyBub3Qg
c2V0CiMgQ09ORklHX0JBQ0tMSUdIVF9MTTM2MzBBIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJ
R0hUX0xNMzYzOSBpcyBub3Qgc2V0CiMgQ09ORklHX0JBQ0tMSUdIVF9MUDg1NVggaXMgbm90IHNl
dAojIENPTkZJR19CQUNLTElHSFRfR1BJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0JBQ0tMSUdIVF9M
VjUyMDdMUCBpcyBub3Qgc2V0CiMgQ09ORklHX0JBQ0tMSUdIVF9CRDYxMDcgaXMgbm90IHNldAoj
IENPTkZJR19CQUNLTElHSFRfQVJDWENOTiBpcyBub3Qgc2V0CiMgQ09ORklHX0JBQ0tMSUdIVF9M
RUQgaXMgbm90IHNldAojIGVuZCBvZiBCYWNrbGlnaHQgJiBMQ0QgZGV2aWNlIHN1cHBvcnQKCkNP
TkZJR19WSURFT01PREVfSEVMUEVSUz15CkNPTkZJR19IRE1JPXkKCiMKIyBDb25zb2xlIGRpc3Bs
YXkgZHJpdmVyIHN1cHBvcnQKIwpDT05GSUdfRFVNTVlfQ09OU09MRT15CkNPTkZJR19EVU1NWV9D
T05TT0xFX0NPTFVNTlM9ODAKQ09ORklHX0RVTU1ZX0NPTlNPTEVfUk9XUz0yNQpDT05GSUdfRlJB
TUVCVUZGRVJfQ09OU09MRT15CkNPTkZJR19GUkFNRUJVRkZFUl9DT05TT0xFX0xFR0FDWV9BQ0NF
TEVSQVRJT049eQpDT05GSUdfRlJBTUVCVUZGRVJfQ09OU09MRV9ERVRFQ1RfUFJJTUFSWT15CkNP
TkZJR19GUkFNRUJVRkZFUl9DT05TT0xFX1JPVEFUSU9OPXkKQ09ORklHX0ZSQU1FQlVGRkVSX0NP
TlNPTEVfREVGRVJSRURfVEFLRU9WRVI9eQojIGVuZCBvZiBDb25zb2xlIGRpc3BsYXkgZHJpdmVy
IHN1cHBvcnQKCiMgQ09ORklHX0xPR08gaXMgbm90IHNldAojIGVuZCBvZiBHcmFwaGljcyBzdXBw
b3J0CgpDT05GSUdfU09VTkQ9eQpDT05GSUdfU05EPW0KQ09ORklHX1NORF9USU1FUj1tCkNPTkZJ
R19TTkRfUENNPW0KQ09ORklHX1NORF9QQ01fRUxEPXkKQ09ORklHX1NORF9QQ01fSUVDOTU4PXkK
Q09ORklHX1NORF9ETUFFTkdJTkVfUENNPW0KQ09ORklHX1NORF9IV0RFUD1tCkNPTkZJR19TTkRf
U0VRX0RFVklDRT1tCkNPTkZJR19TTkRfUkFXTUlEST1tCkNPTkZJR19TTkRfSkFDSz15CkNPTkZJ
R19TTkRfSkFDS19JTlBVVF9ERVY9eQojIENPTkZJR19TTkRfT1NTRU1VTCBpcyBub3Qgc2V0CkNP
TkZJR19TTkRfUENNX1RJTUVSPXkKQ09ORklHX1NORF9IUlRJTUVSPW0KIyBDT05GSUdfU05EX0RZ
TkFNSUNfTUlOT1JTIGlzIG5vdCBzZXQKQ09ORklHX1NORF9TVVBQT1JUX09MRF9BUEk9eQpDT05G
SUdfU05EX1BST0NfRlM9eQpDT05GSUdfU05EX1ZFUkJPU0VfUFJPQ0ZTPXkKIyBDT05GSUdfU05E
X1ZFUkJPU0VfUFJJTlRLIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0RFQlVHIGlzIG5vdCBzZXQK
Q09ORklHX1NORF9WTUFTVEVSPXkKQ09ORklHX1NORF9TRVFVRU5DRVI9bQpDT05GSUdfU05EX1NF
UV9EVU1NWT1tCkNPTkZJR19TTkRfU0VRX0hSVElNRVJfREVGQVVMVD15CkNPTkZJR19TTkRfU0VR
X01JRElfRVZFTlQ9bQpDT05GSUdfU05EX1NFUV9NSURJPW0KQ09ORklHX1NORF9TRVFfVklSTUlE
ST1tCkNPTkZJR19TTkRfTVBVNDAxX1VBUlQ9bQpDT05GSUdfU05EX0RSSVZFUlM9eQpDT05GSUdf
U05EX0RVTU1ZPW0KQ09ORklHX1NORF9BTE9PUD1tCkNPTkZJR19TTkRfVklSTUlEST1tCkNPTkZJ
R19TTkRfTVRQQVY9bQojIENPTkZJR19TTkRfU0VSSUFMX1UxNjU1MCBpcyBub3Qgc2V0CkNPTkZJ
R19TTkRfTVBVNDAxPW0KQ09ORklHX1NORF9QQ0k9eQojIENPTkZJR19TTkRfQUQxODg5IGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX0FMUzMwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9BTEk1NDUx
IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0FUSUlYUCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9B
VElJWFBfTU9ERU0gaXMgbm90IHNldAojIENPTkZJR19TTkRfQVU4ODEwIGlzIG5vdCBzZXQKIyBD
T05GSUdfU05EX0FVODgyMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9BVTg4MzAgaXMgbm90IHNl
dAojIENPTkZJR19TTkRfQVcyIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0FaVDMzMjggaXMgbm90
IHNldAojIENPTkZJR19TTkRfQlQ4N1ggaXMgbm90IHNldAojIENPTkZJR19TTkRfQ0EwMTA2IGlz
IG5vdCBzZXQKIyBDT05GSUdfU05EX0NNSVBDSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9PWFlH
RU4gaXMgbm90IHNldAojIENPTkZJR19TTkRfQ1M0MjgxIGlzIG5vdCBzZXQKIyBDT05GSUdfU05E
X0NTNDZYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9DVFhGSSBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9EQVJMQTIwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0dJTkEyMCBpcyBub3Qgc2V0CiMg
Q09ORklHX1NORF9MQVlMQTIwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0RBUkxBMjQgaXMgbm90
IHNldAojIENPTkZJR19TTkRfR0lOQTI0IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0xBWUxBMjQg
aXMgbm90IHNldAojIENPTkZJR19TTkRfTU9OQSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9NSUEg
aXMgbm90IHNldAojIENPTkZJR19TTkRfRUNITzNHIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0lO
RElHTyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9JTkRJR09JTyBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9JTkRJR09ESiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9JTkRJR09JT1ggaXMgbm90IHNl
dAojIENPTkZJR19TTkRfSU5ESUdPREpYIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0VNVTEwSzEg
aXMgbm90IHNldAojIENPTkZJR19TTkRfRU1VMTBLMVggaXMgbm90IHNldAojIENPTkZJR19TTkRf
RU5TMTM3MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9FTlMxMzcxIGlzIG5vdCBzZXQKIyBDT05G
SUdfU05EX0VTMTkzOCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9FUzE5NjggaXMgbm90IHNldAoj
IENPTkZJR19TTkRfRk04MDEgaXMgbm90IHNldAojIENPTkZJR19TTkRfSERTUCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9IRFNQTSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9JQ0UxNzEyIGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX0lDRTE3MjQgaXMgbm90IHNldAojIENPTkZJR19TTkRfSU5URUw4
WDAgaXMgbm90IHNldAojIENPTkZJR19TTkRfSU5URUw4WDBNIGlzIG5vdCBzZXQKIyBDT05GSUdf
U05EX0tPUkcxMjEyIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0xPTEEgaXMgbm90IHNldAojIENP
TkZJR19TTkRfTFg2NDY0RVMgaXMgbm90IHNldAojIENPTkZJR19TTkRfTUFFU1RSTzMgaXMgbm90
IHNldAojIENPTkZJR19TTkRfTUlYQVJUIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX05NMjU2IGlz
IG5vdCBzZXQKIyBDT05GSUdfU05EX1BDWEhSIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1JJUFRJ
REUgaXMgbm90IHNldAojIENPTkZJR19TTkRfUk1FMzIgaXMgbm90IHNldAojIENPTkZJR19TTkRf
Uk1FOTYgaXMgbm90IHNldAojIENPTkZJR19TTkRfUk1FOTY1MiBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9TRTZYIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPTklDVklCRVMgaXMgbm90IHNldAoj
IENPTkZJR19TTkRfVFJJREVOVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9WSUE4MlhYIGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX1ZJQTgyWFhfTU9ERU0gaXMgbm90IHNldAojIENPTkZJR19TTkRf
VklSVFVPU08gaXMgbm90IHNldAojIENPTkZJR19TTkRfVlgyMjIgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfWU1GUENJIGlzIG5vdCBzZXQKCiMKIyBIRC1BdWRpbwojCiMgQ09ORklHX1NORF9IREFf
SU5URUwgaXMgbm90IHNldAojIGVuZCBvZiBIRC1BdWRpbwoKQ09ORklHX1NORF9IREFfUFJFQUxM
T0NfU0laRT02NApDT05GSUdfU05EX1NQST15CkNPTkZJR19TTkRfVVNCPXkKQ09ORklHX1NORF9V
U0JfQVVESU89bQpDT05GSUdfU05EX1VTQl9BVURJT19VU0VfTUVESUFfQ09OVFJPTExFUj15CkNP
TkZJR19TTkRfVVNCX1VBMTAxPW0KQ09ORklHX1NORF9VU0JfQ0FJQVE9bQpDT05GSUdfU05EX1VT
Ql9DQUlBUV9JTlBVVD15CkNPTkZJR19TTkRfVVNCXzZGSVJFPW0KIyBDT05GSUdfU05EX1VTQl9I
SUZBQ0UgaXMgbm90IHNldAojIENPTkZJR19TTkRfQkNEMjAwMCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9VU0JfUE9EIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1VTQl9QT0RIRCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9VU0JfVE9ORVBPUlQgaXMgbm90IHNldAojIENPTkZJR19TTkRfVVNCX1ZB
UklBWCBpcyBub3Qgc2V0CkNPTkZJR19TTkRfU09DPW0KQ09ORklHX1NORF9TT0NfR0VORVJJQ19E
TUFFTkdJTkVfUENNPXkKIyBDT05GSUdfU05EX1NPQ19BREkgaXMgbm90IHNldAojIENPTkZJR19T
TkRfU09DX0FNRF9BQ1AgaXMgbm90IHNldAojIENPTkZJR19TTkRfQVRNRUxfU09DIGlzIG5vdCBz
ZXQKQ09ORklHX1NORF9CQ00yODM1X1NPQ19JMlM9bQojIENPTkZJR19TTkRfQkNNNjNYWF9JMlNf
V0hJU1RMRVIgaXMgbm90IHNldAojIENPTkZJR19TTkRfREVTSUdOV0FSRV9JMlMgaXMgbm90IHNl
dAoKIwojIFNvQyBBdWRpbyBmb3IgRnJlZXNjYWxlIENQVXMKIwoKIwojIENvbW1vbiBTb0MgQXVk
aW8gb3B0aW9ucyBmb3IgRnJlZXNjYWxlIENQVXM6CiMKIyBDT05GSUdfU05EX1NPQ19GU0xfQVNS
QyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfRlNMX1NBSSBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9TT0NfRlNMX0FVRE1JWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfRlNMX1NTSSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfRlNMX1NQRElGIGlzIG5vdCBzZXQKIyBDT05GSUdf
U05EX1NPQ19GU0xfRVNBSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfRlNMX01JQ0ZJTCBp
cyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfRlNMX1hDVlIgaXMgbm90IHNldAojIENPTkZJR19T
TkRfU09DX0lNWF9BVURNVVggaXMgbm90IHNldAojIGVuZCBvZiBTb0MgQXVkaW8gZm9yIEZyZWVz
Y2FsZSBDUFVzCgojIENPTkZJR19TTkRfSTJTX0hJNjIxMF9JMlMgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfU09DX0lNRyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfTVRLX0JUQ1ZTRCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfU09GX1RPUExFVkVMIGlzIG5vdCBzZXQKCiMKIyBTVE1p
Y3JvZWxlY3Ryb25pY3MgU1RNMzIgU09DIGF1ZGlvIHN1cHBvcnQKIwojIGVuZCBvZiBTVE1pY3Jv
ZWxlY3Ryb25pY3MgU1RNMzIgU09DIGF1ZGlvIHN1cHBvcnQKCiMgQ09ORklHX1NORF9TT0NfWElM
SU5YX0kyUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfWElMSU5YX0FVRElPX0ZPUk1BVFRF
UiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfWElMSU5YX1NQRElGIGlzIG5vdCBzZXQKIyBD
T05GSUdfU05EX1NPQ19YVEZQR0FfSTJTIGlzIG5vdCBzZXQKQ09ORklHX1NORF9TT0NfSTJDX0FO
RF9TUEk9bQoKIwojIENPREVDIGRyaXZlcnMKIwojIENPTkZJR19TTkRfU09DX0FDOTdfQ09ERUMg
aXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0FEQVUxMzcyX0kyQyBpcyBub3Qgc2V0CiMgQ09O
RklHX1NORF9TT0NfQURBVTEzNzJfU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19BREFV
MTcwMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfQURBVTE3NjFfSTJDIGlzIG5vdCBzZXQK
IyBDT05GSUdfU05EX1NPQ19BREFVMTc2MV9TUEkgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09D
X0FEQVU3MDAyIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19BREFVNzExOF9IVyBpcyBub3Qg
c2V0CiMgQ09ORklHX1NORF9TT0NfQURBVTcxMThfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfU05E
X1NPQ19BSzQxMDQgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0FLNDExOCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9TT0NfQUs0NDU4IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19BSzQ1
NTQgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0FLNDYxMyBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9TT0NfQUs0NjQyIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19BSzUzODYgaXMgbm90
IHNldAojIENPTkZJR19TTkRfU09DX0FLNTU1OCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0Nf
QUxDNTYyMyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfQkQyODYyMyBpcyBub3Qgc2V0CiMg
Q09ORklHX1NORF9TT0NfQlRfU0NPIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19DUzM1TDMy
IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19DUzM1TDMzIGlzIG5vdCBzZXQKIyBDT05GSUdf
U05EX1NPQ19DUzM1TDM0IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19DUzM1TDM1IGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX1NPQ19DUzM1TDM2IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NP
Q19DUzQyTDQyIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19DUzQyTDUxX0kyQyBpcyBub3Qg
c2V0CiMgQ09ORklHX1NORF9TT0NfQ1M0Mkw1MiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0Nf
Q1M0Mkw1NiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfQ1M0Mkw3MyBpcyBub3Qgc2V0CiMg
Q09ORklHX1NORF9TT0NfQ1M0MjM0IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19DUzQyNjUg
aXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0NTNDI3MCBpcyBub3Qgc2V0CkNPTkZJR19TTkRf
U09DX0NTNDI3MT1tCkNPTkZJR19TTkRfU09DX0NTNDI3MV9JMkM9bQojIENPTkZJR19TTkRfU09D
X0NTNDI3MV9TUEkgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0NTNDJYWDhfSTJDIGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX1NPQ19DUzQzMTMwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NP
Q19DUzQzNDEgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0NTNDM0OSBpcyBub3Qgc2V0CiMg
Q09ORklHX1NORF9TT0NfQ1M1M0wzMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfQ1gyMDcy
WCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfREE3MjEzIGlzIG5vdCBzZXQKIyBDT05GSUdf
U05EX1NPQ19ETUlDIGlzIG5vdCBzZXQKQ09ORklHX1NORF9TT0NfSERNSV9DT0RFQz1tCiMgQ09O
RklHX1NORF9TT0NfRVM3MTM0IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19FUzcyNDEgaXMg
bm90IHNldAojIENPTkZJR19TTkRfU09DX0VTODMxNiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9T
T0NfRVM4MzI4X0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfRVM4MzI4X1NQSSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfR1RNNjAxIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NP
Q19JQ1M0MzQzMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfSU5OT19SSzMwMzYgaXMgbm90
IHNldAojIENPTkZJR19TTkRfU09DX01BWDk4MDg4IGlzIG5vdCBzZXQKQ09ORklHX1NORF9TT0Nf
TUFYOTgzNTdBPW0KIyBDT05GSUdfU05EX1NPQ19NQVg5ODUwNCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9TT0NfTUFYOTg2NyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfTUFYOTg5MjcgaXMg
bm90IHNldAojIENPTkZJR19TTkRfU09DX01BWDk4MzczX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9TT0NfTUFYOTgzOTAgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX01BWDk4NjAgaXMg
bm90IHNldAojIENPTkZJR19TTkRfU09DX01TTTg5MTZfV0NEX0RJR0lUQUwgaXMgbm90IHNldAoj
IENPTkZJR19TTkRfU09DX1BDTTE2ODEgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1BDTTE3
ODlfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19QQ00xNzlYX0kyQyBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9TT0NfUENNMTc5WF9TUEkgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09D
X1BDTTE4NlhfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19QQ00xODZYX1NQSSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfUENNMzA2MF9JMkMgaXMgbm90IHNldAojIENPTkZJR19T
TkRfU09DX1BDTTMwNjBfU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19QQ00zMTY4QV9J
MkMgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1BDTTMxNjhBX1NQSSBpcyBub3Qgc2V0CiMg
Q09ORklHX1NORF9TT0NfUENNNTEwMkEgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1BDTTUx
MnhfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19QQ001MTJ4X1NQSSBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9TT0NfUkszMzI4IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19SVDU2
MTYgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1JUNTYzMSBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9TT0NfUlQ1NjQwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19SVDU2NTkgaXMgbm90
IHNldAojIENPTkZJR19TTkRfU09DX1NHVEw1MDAwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NP
Q19TSU1QTEVfQU1QTElGSUVSIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19TSU1QTEVfTVVY
IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19TUERJRiBpcyBub3Qgc2V0CiMgQ09ORklHX1NO
RF9TT0NfU1NNMjMwNSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfU1NNMjUxOCBpcyBub3Qg
c2V0CiMgQ09ORklHX1NORF9TT0NfU1NNMjYwMl9TUEkgaXMgbm90IHNldAojIENPTkZJR19TTkRf
U09DX1NTTTI2MDJfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19TU000NTY3IGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX1NPQ19TVEEzMlggaXMgbm90IHNldAojIENPTkZJR19TTkRfU09D
X1NUQTM1MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfU1RJX1NBUyBpcyBub3Qgc2V0CiMg
Q09ORklHX1NORF9TT0NfVEFTMjU1MiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfVEFTMjU2
MiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfVEFTMjc2NCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9TT0NfVEFTMjc3MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfVEFTNTA4NiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfVEFTNTcxWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9T
T0NfVEFTNTcyMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfVEFTNjQyNCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9TT0NfVERBNzQxOSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfVEZB
OTg3OSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfVEZBOTg5WCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NORF9TT0NfVExWMzIwQUlDMjNfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19U
TFYzMjBBSUMyM19TUEkgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1RMVjMyMEFJQzMxWFgg
aXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1RMVjMyMEFJQzMyWDRfSTJDIGlzIG5vdCBzZXQK
IyBDT05GSUdfU05EX1NPQ19UTFYzMjBBSUMzMlg0X1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NO
RF9TT0NfVExWMzIwQUlDM1hfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19UTFYzMjBB
SUMzWF9TUEkgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1RMVjMyMEFEQ1gxNDAgaXMgbm90
IHNldAojIENPTkZJR19TTkRfU09DX1RTM0EyMjdFIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NP
Q19UU0NTNDJYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfVFNDUzQ1NCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9TT0NfVURBMTMzNCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfV004
NTEwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19XTTg1MjMgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfU09DX1dNODUyNCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfV004NTgwIGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX1NPQ19XTTg3MTEgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09D
X1dNODcyOCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfV004NzMxIGlzIG5vdCBzZXQKIyBD
T05GSUdfU05EX1NPQ19XTTg3MzcgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1dNODc0MSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfV004NzUwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05E
X1NPQ19XTTg3NTMgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1dNODc3MCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9TT0NfV004Nzc2IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19XTTg3
ODIgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1dNODgwNF9JMkMgaXMgbm90IHNldAojIENP
TkZJR19TTkRfU09DX1dNODgwNF9TUEkgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1dNODkw
MyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfV004OTA0IGlzIG5vdCBzZXQKQ09ORklHX1NO
RF9TT0NfV004OTYwPW0KIyBDT05GSUdfU05EX1NPQ19XTTg5NjIgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfU09DX1dNODk3NCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfV004OTc4IGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX1NPQ19XTTg5ODUgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09D
X1pMMzgwNjAgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX01BWDk3NTkgaXMgbm90IHNldAoj
IENPTkZJR19TTkRfU09DX01UNjM1MSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfTVQ2MzU4
IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19NVDY2NjAgaXMgbm90IHNldAojIENPTkZJR19T
TkRfU09DX05BVTgzMTUgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX05BVTg1NDAgaXMgbm90
IHNldAojIENPTkZJR19TTkRfU09DX05BVTg4MTAgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09D
X05BVTg4MjIgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX05BVTg4MjQgaXMgbm90IHNldAoj
IENPTkZJR19TTkRfU09DX1RQQTYxMzBBMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfTFBB
U1NfV1NBX01BQ1JPIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19MUEFTU19WQV9NQUNSTyBp
cyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfTFBBU1NfUlhfTUFDUk8gaXMgbm90IHNldAojIENP
TkZJR19TTkRfU09DX0xQQVNTX1RYX01BQ1JPIGlzIG5vdCBzZXQKIyBlbmQgb2YgQ09ERUMgZHJp
dmVycwoKIyBDT05GSUdfU05EX1NJTVBMRV9DQVJEIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0FV
RElPX0dSQVBIX0NBUkQgaXMgbm90IHNldApDT05GSUdfU05EX1hFTl9GUk9OVEVORD1tCkNPTkZJ
R19TTkRfVklSVElPPW0KCiMKIyBISUQgc3VwcG9ydAojCkNPTkZJR19ISUQ9eQojIENPTkZJR19I
SURfQkFUVEVSWV9TVFJFTkdUSCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRFJBVyBpcyBub3Qgc2V0
CiMgQ09ORklHX1VISUQgaXMgbm90IHNldApDT05GSUdfSElEX0dFTkVSSUM9eQoKIwojIFNwZWNp
YWwgSElEIGRyaXZlcnMKIwojIENPTkZJR19ISURfQTRURUNIIGlzIG5vdCBzZXQKIyBDT05GSUdf
SElEX0FDQ1VUT1VDSCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9BQ1JVWCBpcyBub3Qgc2V0CiMg
Q09ORklHX0hJRF9BUFBMRSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9BUFBMRUlSIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSElEX0FTVVMgaXMgbm90IHNldAojIENPTkZJR19ISURfQVVSRUFMIGlzIG5v
dCBzZXQKIyBDT05GSUdfSElEX0JFTEtJTiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9CRVRPUF9G
RiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9CSUdCRU5fRkYgaXMgbm90IHNldAojIENPTkZJR19I
SURfQ0hFUlJZIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0NISUNPTlkgaXMgbm90IHNldAojIENP
TkZJR19ISURfQ09SU0FJUiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9DT1VHQVIgaXMgbm90IHNl
dAojIENPTkZJR19ISURfTUFDQUxMWSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9QUk9ESUtFWVMg
aXMgbm90IHNldAojIENPTkZJR19ISURfQ01FRElBIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0NS
RUFUSVZFX1NCMDU0MCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9DWVBSRVNTIGlzIG5vdCBzZXQK
IyBDT05GSUdfSElEX0RSQUdPTlJJU0UgaXMgbm90IHNldAojIENPTkZJR19ISURfRU1TX0ZGIGlz
IG5vdCBzZXQKIyBDT05GSUdfSElEX0VMQU4gaXMgbm90IHNldAojIENPTkZJR19ISURfRUxFQ09N
IGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0VMTyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9FWktF
WSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9HRU1CSVJEIGlzIG5vdCBzZXQKIyBDT05GSUdfSElE
X0dGUk0gaXMgbm90IHNldAojIENPTkZJR19ISURfR0xPUklPVVMgaXMgbm90IHNldAojIENPTkZJ
R19ISURfSE9MVEVLIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1ZJVkFMREkgaXMgbm90IHNldAoj
IENPTkZJR19ISURfR1Q2ODNSIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0tFWVRPVUNIIGlzIG5v
dCBzZXQKIyBDT05GSUdfSElEX0tZRSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9VQ0xPR0lDIGlz
IG5vdCBzZXQKIyBDT05GSUdfSElEX1dBTFRPUCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9WSUVX
U09OSUMgaXMgbm90IHNldAojIENPTkZJR19ISURfR1lSQVRJT04gaXMgbm90IHNldAojIENPTkZJ
R19ISURfSUNBREUgaXMgbm90IHNldAojIENPTkZJR19ISURfSVRFIGlzIG5vdCBzZXQKIyBDT05G
SUdfSElEX0pBQlJBIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1RXSU5IQU4gaXMgbm90IHNldAoj
IENPTkZJR19ISURfS0VOU0lOR1RPTiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9MQ1BPV0VSIGlz
IG5vdCBzZXQKIyBDT05GSUdfSElEX0xFRCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9MRU5PVk8g
aXMgbm90IHNldApDT05GSUdfSElEX0xPR0lURUNIPW0KIyBDT05GSUdfSElEX0xPR0lURUNIX0hJ
RFBQIGlzIG5vdCBzZXQKQ09ORklHX0xPR0lURUNIX0ZGPXkKQ09ORklHX0xPR0lSVU1CTEVQQUQy
X0ZGPXkKQ09ORklHX0xPR0lHOTQwX0ZGPXkKQ09ORklHX0xPR0lXSEVFTFNfRkY9eQojIENPTkZJ
R19ISURfTUFHSUNNT1VTRSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9NQUxUUk9OIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSElEX01BWUZMQVNIIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1JFRFJBR09O
IGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX01JQ1JPU09GVCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJ
RF9NT05URVJFWSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9NVUxUSVRPVUNIIGlzIG5vdCBzZXQK
IyBDT05GSUdfSElEX05USSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9OVFJJRyBpcyBub3Qgc2V0
CiMgQ09ORklHX0hJRF9PUlRFSyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9QQU5USEVSTE9SRCBp
cyBub3Qgc2V0CiMgQ09ORklHX0hJRF9QRU5NT1VOVCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9Q
RVRBTFlOWCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9QSUNPTENEIGlzIG5vdCBzZXQKIyBDT05G
SUdfSElEX1BMQU5UUk9OSUNTIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1BMQVlTVEFUSU9OIGlz
IG5vdCBzZXQKIyBDT05GSUdfSElEX1BSSU1BWCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9SRVRS
T0RFIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1JPQ0NBVCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJ
RF9TQUlURUsgaXMgbm90IHNldAojIENPTkZJR19ISURfU0FNU1VORyBpcyBub3Qgc2V0CiMgQ09O
RklHX0hJRF9TRU1JVEVLIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1NPTlkgaXMgbm90IHNldAoj
IENPTkZJR19ISURfU1BFRURMSU5LIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1NURUFNIGlzIG5v
dCBzZXQKIyBDT05GSUdfSElEX1NURUVMU0VSSUVTIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1NV
TlBMVVMgaXMgbm90IHNldAojIENPTkZJR19ISURfUk1JIGlzIG5vdCBzZXQKIyBDT05GSUdfSElE
X0dSRUVOQVNJQSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9TTUFSVEpPWVBMVVMgaXMgbm90IHNl
dAojIENPTkZJR19ISURfVElWTyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9UT1BTRUVEIGlzIG5v
dCBzZXQKIyBDT05GSUdfSElEX1RISU5HTSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9USFJVU1RN
QVNURVIgaXMgbm90IHNldAojIENPTkZJR19ISURfVURSQVdfUFMzIGlzIG5vdCBzZXQKIyBDT05G
SUdfSElEX1UyRlpFUk8gaXMgbm90IHNldAojIENPTkZJR19ISURfV0FDT00gaXMgbm90IHNldAoj
IENPTkZJR19ISURfV0lJTU9URSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9YSU5NTyBpcyBub3Qg
c2V0CiMgQ09ORklHX0hJRF9aRVJPUExVUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9aWURBQ1JP
TiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9TRU5TT1JfSFVCIGlzIG5vdCBzZXQKIyBDT05GSUdf
SElEX0FMUFMgaXMgbm90IHNldAojIENPTkZJR19ISURfTUNQMjIyMSBpcyBub3Qgc2V0CiMgZW5k
IG9mIFNwZWNpYWwgSElEIGRyaXZlcnMKCiMKIyBVU0IgSElEIHN1cHBvcnQKIwpDT05GSUdfVVNC
X0hJRD15CiMgQ09ORklHX0hJRF9QSUQgaXMgbm90IHNldAojIENPTkZJR19VU0JfSElEREVWIGlz
IG5vdCBzZXQKIyBlbmQgb2YgVVNCIEhJRCBzdXBwb3J0CgojCiMgSTJDIEhJRCBzdXBwb3J0CiMK
IyBDT05GSUdfSTJDX0hJRF9PRiBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19ISURfT0ZfR09PRElY
IGlzIG5vdCBzZXQKIyBlbmQgb2YgSTJDIEhJRCBzdXBwb3J0CiMgZW5kIG9mIEhJRCBzdXBwb3J0
CgpDT05GSUdfVVNCX09IQ0lfTElUVExFX0VORElBTj15CkNPTkZJR19VU0JfU1VQUE9SVD15CkNP
TkZJR19VU0JfQ09NTU9OPXkKIyBDT05GSUdfVVNCX1VMUElfQlVTIGlzIG5vdCBzZXQKIyBDT05G
SUdfVVNCX0NPTk5fR1BJTyBpcyBub3Qgc2V0CkNPTkZJR19VU0JfQVJDSF9IQVNfSENEPXkKQ09O
RklHX1VTQj15CkNPTkZJR19VU0JfUENJPXkKIyBDT05GSUdfVVNCX0FOTk9VTkNFX05FV19ERVZJ
Q0VTIGlzIG5vdCBzZXQKCiMKIyBNaXNjZWxsYW5lb3VzIFVTQiBvcHRpb25zCiMKQ09ORklHX1VT
Ql9ERUZBVUxUX1BFUlNJU1Q9eQojIENPTkZJR19VU0JfRkVXX0lOSVRfUkVUUklFUyBpcyBub3Qg
c2V0CiMgQ09ORklHX1VTQl9EWU5BTUlDX01JTk9SUyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9P
VEcgaXMgbm90IHNldAojIENPTkZJR19VU0JfT1RHX1BST0RVQ1RMSVNUIGlzIG5vdCBzZXQKIyBD
T05GSUdfVVNCX09UR19ESVNBQkxFX0VYVEVSTkFMX0hVQiBpcyBub3Qgc2V0CkNPTkZJR19VU0Jf
QVVUT1NVU1BFTkRfREVMQVk9MgojIENPTkZJR19VU0JfTU9OIGlzIG5vdCBzZXQKCiMKIyBVU0Ig
SG9zdCBDb250cm9sbGVyIERyaXZlcnMKIwojIENPTkZJR19VU0JfQzY3WDAwX0hDRCBpcyBub3Qg
c2V0CkNPTkZJR19VU0JfWEhDSV9IQ0Q9eQojIENPTkZJR19VU0JfWEhDSV9EQkdDQVAgaXMgbm90
IHNldApDT05GSUdfVVNCX1hIQ0lfUENJPXkKIyBDT05GSUdfVVNCX1hIQ0lfUENJX1JFTkVTQVMg
aXMgbm90IHNldAojIENPTkZJR19VU0JfWEhDSV9QTEFURk9STSBpcyBub3Qgc2V0CiMgQ09ORklH
X1VTQl9FSENJX0hDRCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9PWFUyMTBIUF9IQ0QgaXMgbm90
IHNldAojIENPTkZJR19VU0JfSVNQMTE2WF9IQ0QgaXMgbm90IHNldAojIENPTkZJR19VU0JfRk9U
RzIxMF9IQ0QgaXMgbm90IHNldAojIENPTkZJR19VU0JfTUFYMzQyMV9IQ0QgaXMgbm90IHNldAoj
IENPTkZJR19VU0JfT0hDSV9IQ0QgaXMgbm90IHNldAojIENPTkZJR19VU0JfVUhDSV9IQ0QgaXMg
bm90IHNldAojIENPTkZJR19VU0JfU0w4MTFfSENEIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1I4
QTY2NTk3X0hDRCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9IQ0RfQkNNQSBpcyBub3Qgc2V0CiMg
Q09ORklHX1VTQl9IQ0RfU1NCIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0hDRF9URVNUX01PREUg
aXMgbm90IHNldAoKIwojIFVTQiBEZXZpY2UgQ2xhc3MgZHJpdmVycwojCiMgQ09ORklHX1VTQl9B
Q00gaXMgbm90IHNldAojIENPTkZJR19VU0JfUFJJTlRFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1VT
Ql9XRE0gaXMgbm90IHNldAojIENPTkZJR19VU0JfVE1DIGlzIG5vdCBzZXQKCiMKIyBOT1RFOiBV
U0JfU1RPUkFHRSBkZXBlbmRzIG9uIFNDU0kgYnV0IEJMS19ERVZfU0QgbWF5CiMKCiMKIyBhbHNv
IGJlIG5lZWRlZDsgc2VlIFVTQl9TVE9SQUdFIEhlbHAgZm9yIG1vcmUgaW5mbwojCkNPTkZJR19V
U0JfU1RPUkFHRT15CiMgQ09ORklHX1VTQl9TVE9SQUdFX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05G
SUdfVVNCX1NUT1JBR0VfUkVBTFRFSyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TVE9SQUdFX0RB
VEFGQUIgaXMgbm90IHNldAojIENPTkZJR19VU0JfU1RPUkFHRV9GUkVFQ09NIGlzIG5vdCBzZXQK
IyBDT05GSUdfVVNCX1NUT1JBR0VfSVNEMjAwIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NUT1JB
R0VfVVNCQVQgaXMgbm90IHNldAojIENPTkZJR19VU0JfU1RPUkFHRV9TRERSMDkgaXMgbm90IHNl
dAojIENPTkZJR19VU0JfU1RPUkFHRV9TRERSNTUgaXMgbm90IHNldAojIENPTkZJR19VU0JfU1RP
UkFHRV9KVU1QU0hPVCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TVE9SQUdFX0FMQVVEQSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1VTQl9TVE9SQUdFX09ORVRPVUNIIGlzIG5vdCBzZXQKIyBDT05GSUdf
VVNCX1NUT1JBR0VfS0FSTUEgaXMgbm90IHNldAojIENPTkZJR19VU0JfU1RPUkFHRV9DWVBSRVNT
X0FUQUNCIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NUT1JBR0VfRU5FX1VCNjI1MCBpcyBub3Qg
c2V0CiMgQ09ORklHX1VTQl9VQVMgaXMgbm90IHNldAoKIwojIFVTQiBJbWFnaW5nIGRldmljZXMK
IwojIENPTkZJR19VU0JfTURDODAwIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX01JQ1JPVEVLIGlz
IG5vdCBzZXQKIyBDT05GSUdfVVNCSVBfQ09SRSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9DRE5T
X1NVUFBPUlQgaXMgbm90IHNldAojIENPTkZJR19VU0JfTVVTQl9IRFJDIGlzIG5vdCBzZXQKIyBD
T05GSUdfVVNCX0RXQzMgaXMgbm90IHNldApDT05GSUdfVVNCX0RXQzI9eQpDT05GSUdfVVNCX0RX
QzJfSE9TVD15CgojCiMgR2FkZ2V0L0R1YWwtcm9sZSBtb2RlIHJlcXVpcmVzIFVTQiBHYWRnZXQg
c3VwcG9ydCB0byBiZSBlbmFibGVkCiMKIyBDT05GSUdfVVNCX0RXQzJfUENJIGlzIG5vdCBzZXQK
IyBDT05GSUdfVVNCX0RXQzJfREVCVUcgaXMgbm90IHNldAojIENPTkZJR19VU0JfRFdDMl9UUkFD
S19NSVNTRURfU09GUyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9JU1AxNzYwIGlzIG5vdCBzZXQK
CiMKIyBVU0IgcG9ydCBkcml2ZXJzCiMKIyBDT05GSUdfVVNCX1NFUklBTCBpcyBub3Qgc2V0Cgoj
CiMgVVNCIE1pc2NlbGxhbmVvdXMgZHJpdmVycwojCiMgQ09ORklHX1VTQl9FTUk2MiBpcyBub3Qg
c2V0CiMgQ09ORklHX1VTQl9FTUkyNiBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9BRFVUVVggaXMg
bm90IHNldAojIENPTkZJR19VU0JfU0VWU0VHIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0xFR09U
T1dFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9MQ0QgaXMgbm90IHNldAojIENPTkZJR19VU0Jf
Q1lQUkVTU19DWTdDNjMgaXMgbm90IHNldAojIENPTkZJR19VU0JfQ1lUSEVSTSBpcyBub3Qgc2V0
CiMgQ09ORklHX1VTQl9JRE1PVVNFIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0ZURElfRUxBTiBp
cyBub3Qgc2V0CiMgQ09ORklHX1VTQl9BUFBMRURJU1BMQVkgaXMgbm90IHNldAojIENPTkZJR19B
UFBMRV9NRklfRkFTVENIQVJHRSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9MRCBpcyBub3Qgc2V0
CiMgQ09ORklHX1VTQl9UUkFOQ0VWSUJSQVRPUiBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9JT1dB
UlJJT1IgaXMgbm90IHNldAojIENPTkZJR19VU0JfVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1VT
Ql9FSFNFVF9URVNUX0ZJWFRVUkUgaXMgbm90IHNldAojIENPTkZJR19VU0JfSVNJR0hURlcgaXMg
bm90IHNldAojIENPTkZJR19VU0JfWVVSRVggaXMgbm90IHNldAojIENPTkZJR19VU0JfRVpVU0Jf
RlgyIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0hVQl9VU0IyNTFYQiBpcyBub3Qgc2V0CiMgQ09O
RklHX1VTQl9IU0lDX1VTQjM1MDMgaXMgbm90IHNldAojIENPTkZJR19VU0JfSFNJQ19VU0I0NjA0
IGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0xJTktfTEFZRVJfVEVTVCBpcyBub3Qgc2V0CiMgQ09O
RklHX1VTQl9DSEFPU0tFWSBpcyBub3Qgc2V0CgojCiMgVVNCIFBoeXNpY2FsIExheWVyIGRyaXZl
cnMKIwojIENPTkZJR19OT1BfVVNCX1hDRUlWIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0dQSU9f
VkJVUyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9JU1AxMzAxIGlzIG5vdCBzZXQKIyBDT05GSUdf
VVNCX1VMUEkgaXMgbm90IHNldAojIGVuZCBvZiBVU0IgUGh5c2ljYWwgTGF5ZXIgZHJpdmVycwoK
IyBDT05GSUdfVVNCX0dBREdFVCBpcyBub3Qgc2V0CiMgQ09ORklHX1RZUEVDIGlzIG5vdCBzZXQK
Q09ORklHX1VTQl9ST0xFX1NXSVRDSD15CkNPTkZJR19NTUM9eQpDT05GSUdfUFdSU0VRX0VNTUM9
eQojIENPTkZJR19QV1JTRVFfU0Q4Nzg3IGlzIG5vdCBzZXQKQ09ORklHX1BXUlNFUV9TSU1QTEU9
eQpDT05GSUdfTU1DX0JMT0NLPXkKQ09ORklHX01NQ19CTE9DS19NSU5PUlM9MzIKIyBDT05GSUdf
U0RJT19VQVJUIGlzIG5vdCBzZXQKIyBDT05GSUdfTU1DX1RFU1QgaXMgbm90IHNldAoKIwojIE1N
Qy9TRC9TRElPIEhvc3QgQ29udHJvbGxlciBEcml2ZXJzCiMKIyBDT05GSUdfTU1DX0RFQlVHIGlz
IG5vdCBzZXQKIyBDT05GSUdfTU1DX0FSTU1NQ0kgaXMgbm90IHNldApDT05GSUdfTU1DX1NESENJ
PXkKQ09ORklHX01NQ19TREhDSV9JT19BQ0NFU1NPUlM9eQojIENPTkZJR19NTUNfU0RIQ0lfUENJ
IGlzIG5vdCBzZXQKQ09ORklHX01NQ19TREhDSV9QTFRGTT15CiMgQ09ORklHX01NQ19TREhDSV9P
Rl9BUkFTQU4gaXMgbm90IHNldAojIENPTkZJR19NTUNfU0RIQ0lfT0ZfQVNQRUVEIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTU1DX1NESENJX09GX0FUOTEgaXMgbm90IHNldAojIENPTkZJR19NTUNfU0RI
Q0lfT0ZfRFdDTVNIQyBpcyBub3Qgc2V0CiMgQ09ORklHX01NQ19TREhDSV9DQURFTkNFIGlzIG5v
dCBzZXQKIyBDT05GSUdfTU1DX1NESENJX0ZfU0RIMzAgaXMgbm90IHNldAojIENPTkZJR19NTUNf
U0RIQ0lfTUlMQkVBVVQgaXMgbm90IHNldApDT05GSUdfTU1DX1NESENJX0lQUk9DPXkKIyBDT05G
SUdfTU1DX1RJRk1fU0QgaXMgbm90IHNldApDT05GSUdfTU1DX1NQST1tCiMgQ09ORklHX01NQ19D
QjcxMCBpcyBub3Qgc2V0CiMgQ09ORklHX01NQ19WSUFfU0RNTUMgaXMgbm90IHNldAojIENPTkZJ
R19NTUNfRFcgaXMgbm90IHNldAojIENPTkZJR19NTUNfVlVCMzAwIGlzIG5vdCBzZXQKIyBDT05G
SUdfTU1DX1VTSEMgaXMgbm90IHNldAojIENPTkZJR19NTUNfVVNESEk2Uk9MMCBpcyBub3Qgc2V0
CiMgQ09ORklHX01NQ19DUUhDSSBpcyBub3Qgc2V0CiMgQ09ORklHX01NQ19IU1EgaXMgbm90IHNl
dAojIENPTkZJR19NTUNfVE9TSElCQV9QQ0kgaXMgbm90IHNldAojIENPTkZJR19NTUNfQkNNMjgz
NSBpcyBub3Qgc2V0CiMgQ09ORklHX01NQ19NVEsgaXMgbm90IHNldApDT05GSUdfTU1DX1NESENJ
X1hFTk9OPXkKIyBDT05GSUdfTU1DX1NESENJX09NQVAgaXMgbm90IHNldAojIENPTkZJR19NTUNf
U0RIQ0lfQU02NTQgaXMgbm90IHNldAojIENPTkZJR19NRU1TVElDSyBpcyBub3Qgc2V0CkNPTkZJ
R19ORVdfTEVEUz15CkNPTkZJR19MRURTX0NMQVNTPXkKIyBDT05GSUdfTEVEU19DTEFTU19GTEFT
SCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfQ0xBU1NfTVVMVElDT0xPUiBpcyBub3Qgc2V0CiMg
Q09ORklHX0xFRFNfQlJJR0hUTkVTU19IV19DSEFOR0VEIGlzIG5vdCBzZXQKCiMKIyBMRUQgZHJp
dmVycwojCiMgQ09ORklHX0xFRFNfQU4zMDI1OUEgaXMgbm90IHNldAojIENPTkZJR19MRURTX0FX
MjAxMyBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfQkNNNjMyOCBpcyBub3Qgc2V0CiMgQ09ORklH
X0xFRFNfQkNNNjM1OCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfQ1IwMDE0MTE0IGlzIG5vdCBz
ZXQKIyBDT05GSUdfTEVEU19FTDE1MjAzMDAwIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19MTTM1
MzAgaXMgbm90IHNldAojIENPTkZJR19MRURTX0xNMzUzMiBpcyBub3Qgc2V0CiMgQ09ORklHX0xF
RFNfTE0zNjQyIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19MTTM2OTJYIGlzIG5vdCBzZXQKIyBD
T05GSUdfTEVEU19QQ0E5NTMyIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19HUElPIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTEVEU19MUDM5NDQgaXMgbm90IHNldAojIENPTkZJR19MRURTX0xQMzk1MiBp
cyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfTFA1MFhYIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19M
UDU1WFhfQ09NTU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19MUDg4NjAgaXMgbm90IHNldAoj
IENPTkZJR19MRURTX1BDQTk1NVggaXMgbm90IHNldAojIENPTkZJR19MRURTX1BDQTk2M1ggaXMg
bm90IHNldAojIENPTkZJR19MRURTX0RBQzEyNFMwODUgaXMgbm90IHNldAojIENPTkZJR19MRURT
X1BXTSBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfUkVHVUxBVE9SIGlzIG5vdCBzZXQKIyBDT05G
SUdfTEVEU19CRDI4MDIgaXMgbm90IHNldAojIENPTkZJR19MRURTX0xUMzU5MyBpcyBub3Qgc2V0
CiMgQ09ORklHX0xFRFNfVENBNjUwNyBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfVExDNTkxWFgg
aXMgbm90IHNldAojIENPTkZJR19MRURTX0xNMzU1eCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNf
SVMzMUZMMzE5WCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfSVMzMUZMMzJYWCBpcyBub3Qgc2V0
CgojCiMgTEVEIGRyaXZlciBmb3IgYmxpbmsoMSkgVVNCIFJHQiBMRUQgaXMgdW5kZXIgU3BlY2lh
bCBISUQgZHJpdmVycyAoSElEX1RISU5HTSkKIwojIENPTkZJR19MRURTX0JMSU5LTSBpcyBub3Qg
c2V0CiMgQ09ORklHX0xFRFNfU1lTQ09OIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19NTFhSRUcg
aXMgbm90IHNldAojIENPTkZJR19MRURTX1VTRVIgaXMgbm90IHNldAojIENPTkZJR19MRURTX1NQ
SV9CWVRFIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19USV9MTVVfQ09NTU9OIGlzIG5vdCBzZXQK
CiMKIyBGbGFzaCBhbmQgVG9yY2ggTEVEIGRyaXZlcnMKIwoKIwojIExFRCBUcmlnZ2VycwojCiMg
Q09ORklHX0xFRFNfVFJJR0dFUlMgaXMgbm90IHNldAojIENPTkZJR19BQ0NFU1NJQklMSVRZIGlz
IG5vdCBzZXQKIyBDT05GSUdfSU5GSU5JQkFORCBpcyBub3Qgc2V0CkNPTkZJR19FREFDX1NVUFBP
UlQ9eQojIENPTkZJR19SVENfQ0xBU1MgaXMgbm90IHNldApDT05GSUdfRE1BREVWSUNFUz15CiMg
Q09ORklHX0RNQURFVklDRVNfREVCVUcgaXMgbm90IHNldAoKIwojIERNQSBEZXZpY2VzCiMKQ09O
RklHX0RNQV9FTkdJTkU9eQpDT05GSUdfRE1BX1ZJUlRVQUxfQ0hBTk5FTFM9eQpDT05GSUdfRE1B
X09GPXkKIyBDT05GSUdfQUxURVJBX01TR0RNQSBpcyBub3Qgc2V0CiMgQ09ORklHX0FNQkFfUEww
OFggaXMgbm90IHNldAojIENPTkZJR19CQ01fU0JBX1JBSUQgaXMgbm90IHNldApDT05GSUdfRE1B
X0JDTTI4MzU9eQojIENPTkZJR19EV19BWElfRE1BQyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZTTF9F
RE1BIGlzIG5vdCBzZXQKIyBDT05GSUdfRlNMX1FETUEgaXMgbm90IHNldAojIENPTkZJR19ISVNJ
X0RNQSBpcyBub3Qgc2V0CiMgQ09ORklHX0lOVEVMX0lETUE2NCBpcyBub3Qgc2V0CiMgQ09ORklH
X01WX1hPUl9WMiBpcyBub3Qgc2V0CiMgQ09ORklHX1BMMzMwX0RNQSBpcyBub3Qgc2V0CiMgQ09O
RklHX1BMWF9ETUEgaXMgbm90IHNldAojIENPTkZJR19YSUxJTlhfRE1BIGlzIG5vdCBzZXQKIyBD
T05GSUdfWElMSU5YX1pZTlFNUF9ETUEgaXMgbm90IHNldAojIENPTkZJR19YSUxJTlhfWllOUU1Q
X0RQRE1BIGlzIG5vdCBzZXQKIyBDT05GSUdfUUNPTV9ISURNQV9NR01UIGlzIG5vdCBzZXQKIyBD
T05GSUdfUUNPTV9ISURNQSBpcyBub3Qgc2V0CiMgQ09ORklHX0RXX0RNQUMgaXMgbm90IHNldAoj
IENPTkZJR19EV19ETUFDX1BDSSBpcyBub3Qgc2V0CiMgQ09ORklHX0RXX0VETUEgaXMgbm90IHNl
dAojIENPTkZJR19EV19FRE1BX1BDSUUgaXMgbm90IHNldAojIENPTkZJR19TRl9QRE1BIGlzIG5v
dCBzZXQKCiMKIyBETUEgQ2xpZW50cwojCiMgQ09ORklHX0FTWU5DX1RYX0RNQSBpcyBub3Qgc2V0
CiMgQ09ORklHX0RNQVRFU1QgaXMgbm90IHNldAoKIwojIERNQUJVRiBvcHRpb25zCiMKQ09ORklH
X1NZTkNfRklMRT15CiMgQ09ORklHX1NXX1NZTkMgaXMgbm90IHNldAojIENPTkZJR19VRE1BQlVG
IGlzIG5vdCBzZXQKIyBDT05GSUdfRE1BQlVGX01PVkVfTk9USUZZIGlzIG5vdCBzZXQKIyBDT05G
SUdfRE1BQlVGX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfRE1BQlVGX1NFTEZURVNUUyBpcyBu
b3Qgc2V0CkNPTkZJR19ETUFCVUZfSEVBUFM9eQojIENPTkZJR19ETUFCVUZfU1lTRlNfU1RBVFMg
aXMgbm90IHNldApDT05GSUdfRE1BQlVGX0hFQVBTX1NZU1RFTT15CkNPTkZJR19ETUFCVUZfSEVB
UFNfQ01BPXkKIyBlbmQgb2YgRE1BQlVGIG9wdGlvbnMKCiMgQ09ORklHX0FVWERJU1BMQVkgaXMg
bm90IHNldAojIENPTkZJR19VSU8gaXMgbm90IHNldAojIENPTkZJR19WRklPIGlzIG5vdCBzZXQK
Q09ORklHX1ZJUlRfRFJJVkVSUz15CkNPTkZJR19WSVJUSU89eQpDT05GSUdfVklSVElPX01FTlU9
eQojIENPTkZJR19WSVJUSU9fUENJIGlzIG5vdCBzZXQKIyBDT05GSUdfVklSVElPX0JBTExPT04g
aXMgbm90IHNldAojIENPTkZJR19WSVJUSU9fSU5QVVQgaXMgbm90IHNldAojIENPTkZJR19WSVJU
SU9fTU1JTyBpcyBub3Qgc2V0CkNPTkZJR19WSVJUSU9fRE1BX1NIQVJFRF9CVUZGRVI9eQojIENP
TkZJR19WRFBBIGlzIG5vdCBzZXQKQ09ORklHX1ZIT1NUX01FTlU9eQojIENPTkZJR19WSE9TVF9O
RVQgaXMgbm90IHNldAojIENPTkZJR19WSE9TVF9DUk9TU19FTkRJQU5fTEVHQUNZIGlzIG5vdCBz
ZXQKCiMKIyBNaWNyb3NvZnQgSHlwZXItViBndWVzdCBzdXBwb3J0CiMKIyBlbmQgb2YgTWljcm9z
b2Z0IEh5cGVyLVYgZ3Vlc3Qgc3VwcG9ydAoKIwojIFhlbiBkcml2ZXIgc3VwcG9ydAojCkNPTkZJ
R19YRU5fQkFMTE9PTj15CkNPTkZJR19YRU5fU0NSVUJfUEFHRVNfREVGQVVMVD15CkNPTkZJR19Y
RU5fREVWX0VWVENITj15CkNPTkZJR19YRU5fQkFDS0VORD15CkNPTkZJR19YRU5GUz15CkNPTkZJ
R19YRU5fQ09NUEFUX1hFTkZTPXkKQ09ORklHX1hFTl9TWVNfSFlQRVJWSVNPUj15CkNPTkZJR19Y
RU5fWEVOQlVTX0ZST05URU5EPXkKQ09ORklHX1hFTl9HTlRERVY9bQpDT05GSUdfWEVOX0dOVERF
Vl9ETUFCVUY9eQpDT05GSUdfWEVOX0dSQU5UX0RFVl9BTExPQz1tCkNPTkZJR19YRU5fR1JBTlRf
RE1BX0FMTE9DPXkKQ09ORklHX1NXSU9UTEJfWEVOPXkKQ09ORklHX1hFTl9QVkNBTExTX0ZST05U
RU5EPXkKQ09ORklHX1hFTl9QVkNBTExTX0JBQ0tFTkQ9eQpDT05GSUdfWEVOX1BSSVZDTUQ9eQpD
T05GSUdfWEVOX0VGST15CkNPTkZJR19YRU5fQVVUT19YTEFURT15CkNPTkZJR19YRU5fRlJPTlRf
UEdESVJfU0hCVUY9eQojIGVuZCBvZiBYZW4gZHJpdmVyIHN1cHBvcnQKCiMgQ09ORklHX0dSRVlC
VVMgaXMgbm90IHNldAojIENPTkZJR19DT01FREkgaXMgbm90IHNldApDT05GSUdfU1RBR0lORz15
CiMgQ09ORklHX1BSSVNNMl9VU0IgaXMgbm90IHNldAojIENPTkZJR19SVEw4MTkyVSBpcyBub3Qg
c2V0CiMgQ09ORklHX1JUTExJQiBpcyBub3Qgc2V0CiMgQ09ORklHX1JUTDg3MjNCUyBpcyBub3Qg
c2V0CiMgQ09ORklHX1I4NzEyVSBpcyBub3Qgc2V0CiMgQ09ORklHX1I4MTg4RVUgaXMgbm90IHNl
dAojIENPTkZJR19SVFM1MjA4IGlzIG5vdCBzZXQKIyBDT05GSUdfVlQ2NjU1IGlzIG5vdCBzZXQK
IyBDT05GSUdfVlQ2NjU2IGlzIG5vdCBzZXQKCiMKIyBJSU8gc3RhZ2luZyBkcml2ZXJzCiMKCiMK
IyBBY2NlbGVyb21ldGVycwojCiMgQ09ORklHX0FESVMxNjIwMyBpcyBub3Qgc2V0CiMgQ09ORklH
X0FESVMxNjI0MCBpcyBub3Qgc2V0CiMgZW5kIG9mIEFjY2VsZXJvbWV0ZXJzCgojCiMgQW5hbG9n
IHRvIGRpZ2l0YWwgY29udmVydGVycwojCiMgQ09ORklHX0FENzgxNiBpcyBub3Qgc2V0CiMgQ09O
RklHX0FENzI4MCBpcyBub3Qgc2V0CiMgZW5kIG9mIEFuYWxvZyB0byBkaWdpdGFsIGNvbnZlcnRl
cnMKCiMKIyBBbmFsb2cgZGlnaXRhbCBiaS1kaXJlY3Rpb24gY29udmVydGVycwojCiMgQ09ORklH
X0FEVDczMTYgaXMgbm90IHNldAojIGVuZCBvZiBBbmFsb2cgZGlnaXRhbCBiaS1kaXJlY3Rpb24g
Y29udmVydGVycwoKIwojIENhcGFjaXRhbmNlIHRvIGRpZ2l0YWwgY29udmVydGVycwojCiMgQ09O
RklHX0FENzc0NiBpcyBub3Qgc2V0CiMgZW5kIG9mIENhcGFjaXRhbmNlIHRvIGRpZ2l0YWwgY29u
dmVydGVycwoKIwojIERpcmVjdCBEaWdpdGFsIFN5bnRoZXNpcwojCiMgQ09ORklHX0FEOTgzMiBp
cyBub3Qgc2V0CiMgQ09ORklHX0FEOTgzNCBpcyBub3Qgc2V0CiMgZW5kIG9mIERpcmVjdCBEaWdp
dGFsIFN5bnRoZXNpcwoKIwojIE5ldHdvcmsgQW5hbHl6ZXIsIEltcGVkYW5jZSBDb252ZXJ0ZXJz
CiMKIyBDT05GSUdfQUQ1OTMzIGlzIG5vdCBzZXQKIyBlbmQgb2YgTmV0d29yayBBbmFseXplciwg
SW1wZWRhbmNlIENvbnZlcnRlcnMKCiMKIyBBY3RpdmUgZW5lcmd5IG1ldGVyaW5nIElDCiMKIyBD
T05GSUdfQURFNzg1NCBpcyBub3Qgc2V0CiMgZW5kIG9mIEFjdGl2ZSBlbmVyZ3kgbWV0ZXJpbmcg
SUMKCiMKIyBSZXNvbHZlciB0byBkaWdpdGFsIGNvbnZlcnRlcnMKIwojIENPTkZJR19BRDJTMTIx
MCBpcyBub3Qgc2V0CiMgZW5kIG9mIFJlc29sdmVyIHRvIGRpZ2l0YWwgY29udmVydGVycwojIGVu
ZCBvZiBJSU8gc3RhZ2luZyBkcml2ZXJzCgojIENPTkZJR19GQl9TTTc1MCBpcyBub3Qgc2V0CiMg
Q09ORklHX1NUQUdJTkdfTUVESUEgaXMgbm90IHNldAoKIwojIEFuZHJvaWQKIwojIGVuZCBvZiBB
bmRyb2lkCgojIENPTkZJR19TVEFHSU5HX0JPQVJEIGlzIG5vdCBzZXQKIyBDT05GSUdfTFRFX0dE
TTcyNFggaXMgbm90IHNldAojIENPTkZJR19HU19GUEdBQk9PVCBpcyBub3Qgc2V0CiMgQ09ORklH
X1VOSVNZU1NQQVIgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xLX1hMTlhfQ0xLV1pSRCBp
cyBub3Qgc2V0CiMgQ09ORklHX0ZCX1RGVCBpcyBub3Qgc2V0CiMgQ09ORklHX0tTNzAxMCBpcyBu
b3Qgc2V0CkNPTkZJR19CQ01fVklERU9DT1JFPXkKQ09ORklHX0JDTTI4MzVfVkNISVE9bQpDT05G
SUdfVkNISVFfQ0RFVj15CkNPTkZJR19TTkRfQkNNMjgzNT1tCkNPTkZJR19WSURFT19CQ00yODM1
PW0KQ09ORklHX0JDTTI4MzVfVkNISVFfTU1BTD1tCiMgQ09ORklHX1BJNDMzIGlzIG5vdCBzZXQK
IyBDT05GSUdfWElMX0FYSVNfRklGTyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZJRUxEQlVTX0RFViBp
cyBub3Qgc2V0CiMgQ09ORklHX1FMR0UgaXMgbm90IHNldAojIENPTkZJR19XRlggaXMgbm90IHNl
dAojIENPTkZJR19HT0xERklTSCBpcyBub3Qgc2V0CiMgQ09ORklHX0NIUk9NRV9QTEFURk9STVMg
aXMgbm90IHNldAojIENPTkZJR19NRUxMQU5PWF9QTEFURk9STSBpcyBub3Qgc2V0CkNPTkZJR19I
QVZFX0NMSz15CkNPTkZJR19IQVZFX0NMS19QUkVQQVJFPXkKQ09ORklHX0NPTU1PTl9DTEs9eQoK
IwojIENsb2NrIGRyaXZlciBmb3IgQVJNIFJlZmVyZW5jZSBkZXNpZ25zCiMKIyBDT05GSUdfSUNT
VCBpcyBub3Qgc2V0CiMgQ09ORklHX0NMS19TUDgxMCBpcyBub3Qgc2V0CiMgZW5kIG9mIENsb2Nr
IGRyaXZlciBmb3IgQVJNIFJlZmVyZW5jZSBkZXNpZ25zCgojIENPTkZJR19MTUswNDgzMiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfTUFYOTQ4NSBpcyBub3Qgc2V0CiMgQ09ORklHX0NP
TU1PTl9DTEtfU0k1MzQxIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19TSTUzNTEgaXMg
bm90IHNldAojIENPTkZJR19DT01NT05fQ0xLX1NJNTE0IGlzIG5vdCBzZXQKIyBDT05GSUdfQ09N
TU9OX0NMS19TSTU0NCBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfU0k1NzAgaXMgbm90
IHNldAojIENPTkZJR19DT01NT05fQ0xLX0NEQ0U3MDYgaXMgbm90IHNldAojIENPTkZJR19DT01N
T05fQ0xLX0NEQ0U5MjUgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xLX0NTMjAwMF9DUCBp
cyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfQVhJX0NMS0dFTiBpcyBub3Qgc2V0CiMgQ09O
RklHX0NPTU1PTl9DTEtfWEdFTkUgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xLX1BXTSBp
cyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfVkM1IGlzIG5vdCBzZXQKIyBDT05GSUdfQ09N
TU9OX0NMS19GSVhFRF9NTUlPIGlzIG5vdCBzZXQKQ09ORklHX0NMS19CQ00yNzExX0RWUD15CkNP
TkZJR19DTEtfQkNNMjgzNT15CkNPTkZJR19DTEtfUkFTUEJFUlJZUEk9eQojIENPTkZJR19YSUxJ
TlhfVkNVIGlzIG5vdCBzZXQKIyBDT05GSUdfSFdTUElOTE9DSyBpcyBub3Qgc2V0CgojCiMgQ2xv
Y2sgU291cmNlIGRyaXZlcnMKIwpDT05GSUdfVElNRVJfT0Y9eQpDT05GSUdfVElNRVJfUFJPQkU9
eQpDT05GSUdfQ0xLU1JDX01NSU89eQpDT05GSUdfQVJNX0FSQ0hfVElNRVI9eQpDT05GSUdfQVJN
X0FSQ0hfVElNRVJfRVZUU1RSRUFNPXkKQ09ORklHX0FSTV9BUkNIX1RJTUVSX09PTF9XT1JLQVJP
VU5EPXkKQ09ORklHX0ZTTF9FUlJBVFVNX0EwMDg1ODU9eQpDT05GSUdfSElTSUxJQ09OX0VSUkFU
VU1fMTYxMDEwMTAxPXkKQ09ORklHX0FSTTY0X0VSUkFUVU1fODU4OTIxPXkKQ09ORklHX0FSTV9U
SU1FUl9TUDgwND15CiMgQ09ORklHX01JQ1JPQ0hJUF9QSVQ2NEIgaXMgbm90IHNldAojIGVuZCBv
ZiBDbG9jayBTb3VyY2UgZHJpdmVycwoKQ09ORklHX01BSUxCT1g9eQojIENPTkZJR19BUk1fTUhV
IGlzIG5vdCBzZXQKIyBDT05GSUdfQVJNX01IVV9WMiBpcyBub3Qgc2V0CiMgQ09ORklHX1BMQVRG
T1JNX01IVSBpcyBub3Qgc2V0CiMgQ09ORklHX1BMMzIwX01CT1ggaXMgbm90IHNldAojIENPTkZJ
R19BTFRFUkFfTUJPWCBpcyBub3Qgc2V0CkNPTkZJR19CQ00yODM1X01CT1g9eQojIENPTkZJR19N
QUlMQk9YX1RFU1QgaXMgbm90IHNldApDT05GSUdfSU9NTVVfSU9WQT15CkNPTkZJR19JT01NVV9B
UEk9eQpDT05GSUdfSU9NTVVfU1VQUE9SVD15CgojCiMgR2VuZXJpYyBJT01NVSBQYWdldGFibGUg
U3VwcG9ydAojCiMgQ09ORklHX0lPTU1VX0lPX1BHVEFCTEVfTFBBRSBpcyBub3Qgc2V0CiMgQ09O
RklHX0lPTU1VX0lPX1BHVEFCTEVfQVJNVjdTIGlzIG5vdCBzZXQKIyBlbmQgb2YgR2VuZXJpYyBJ
T01NVSBQYWdldGFibGUgU3VwcG9ydAoKIyBDT05GSUdfSU9NTVVfREVCVUdGUyBpcyBub3Qgc2V0
CkNPTkZJR19JT01NVV9ERUZBVUxUX0RNQV9TVFJJQ1Q9eQojIENPTkZJR19JT01NVV9ERUZBVUxU
X0RNQV9MQVpZIGlzIG5vdCBzZXQKIyBDT05GSUdfSU9NTVVfREVGQVVMVF9QQVNTVEhST1VHSCBp
cyBub3Qgc2V0CkNPTkZJR19PRl9JT01NVT15CkNPTkZJR19JT01NVV9ETUE9eQojIENPTkZJR19B
Uk1fU01NVSBpcyBub3Qgc2V0CiMgQ09ORklHX0FSTV9TTU1VX1YzIGlzIG5vdCBzZXQKIyBDT05G
SUdfVklSVElPX0lPTU1VIGlzIG5vdCBzZXQKCiMKIyBSZW1vdGVwcm9jIGRyaXZlcnMKIwojIENP
TkZJR19SRU1PVEVQUk9DIGlzIG5vdCBzZXQKIyBlbmQgb2YgUmVtb3RlcHJvYyBkcml2ZXJzCgoj
CiMgUnBtc2cgZHJpdmVycwojCiMgQ09ORklHX1JQTVNHX1FDT01fR0xJTktfUlBNIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUlBNU0dfVklSVElPIGlzIG5vdCBzZXQKIyBlbmQgb2YgUnBtc2cgZHJpdmVy
cwoKIyBDT05GSUdfU09VTkRXSVJFIGlzIG5vdCBzZXQKCiMKIyBTT0MgKFN5c3RlbSBPbiBDaGlw
KSBzcGVjaWZpYyBEcml2ZXJzCiMKCiMKIyBBbWxvZ2ljIFNvQyBkcml2ZXJzCiMKIyBlbmQgb2Yg
QW1sb2dpYyBTb0MgZHJpdmVycwoKIwojIEJyb2FkY29tIFNvQyBkcml2ZXJzCiMKQ09ORklHX0JD
TTI4MzVfUE9XRVI9eQpDT05GSUdfUkFTUEJFUlJZUElfUE9XRVI9eQojIENPTkZJR19TT0NfQlJD
TVNUQiBpcyBub3Qgc2V0CiMgZW5kIG9mIEJyb2FkY29tIFNvQyBkcml2ZXJzCgojCiMgTlhQL0Zy
ZWVzY2FsZSBRb3JJUSBTb0MgZHJpdmVycwojCiMgQ09ORklHX1FVSUNDX0VOR0lORSBpcyBub3Qg
c2V0CiMgQ09ORklHX0ZTTF9SQ1BNIGlzIG5vdCBzZXQKIyBlbmQgb2YgTlhQL0ZyZWVzY2FsZSBR
b3JJUSBTb0MgZHJpdmVycwoKIwojIGkuTVggU29DIGRyaXZlcnMKIwojIGVuZCBvZiBpLk1YIFNv
QyBkcml2ZXJzCgojCiMgRW5hYmxlIExpdGVYIFNvQyBCdWlsZGVyIHNwZWNpZmljIGRyaXZlcnMK
IwojIENPTkZJR19MSVRFWF9TT0NfQ09OVFJPTExFUiBpcyBub3Qgc2V0CiMgZW5kIG9mIEVuYWJs
ZSBMaXRlWCBTb0MgQnVpbGRlciBzcGVjaWZpYyBkcml2ZXJzCgojCiMgUXVhbGNvbW0gU29DIGRy
aXZlcnMKIwojIGVuZCBvZiBRdWFsY29tbSBTb0MgZHJpdmVycwoKIyBDT05GSUdfU09DX1RJIGlz
IG5vdCBzZXQKCiMKIyBYaWxpbnggU29DIGRyaXZlcnMKIwojIGVuZCBvZiBYaWxpbnggU29DIGRy
aXZlcnMKIyBlbmQgb2YgU09DIChTeXN0ZW0gT24gQ2hpcCkgc3BlY2lmaWMgRHJpdmVycwoKIyBD
T05GSUdfUE1fREVWRlJFUSBpcyBub3Qgc2V0CiMgQ09ORklHX0VYVENPTiBpcyBub3Qgc2V0CiMg
Q09ORklHX01FTU9SWSBpcyBub3Qgc2V0CkNPTkZJR19JSU89bQpDT05GSUdfSUlPX0JVRkZFUj15
CiMgQ09ORklHX0lJT19CVUZGRVJfQ0IgaXMgbm90IHNldAojIENPTkZJR19JSU9fQlVGRkVSX0RN
QSBpcyBub3Qgc2V0CiMgQ09ORklHX0lJT19CVUZGRVJfRE1BRU5HSU5FIGlzIG5vdCBzZXQKIyBD
T05GSUdfSUlPX0JVRkZFUl9IV19DT05TVU1FUiBpcyBub3Qgc2V0CkNPTkZJR19JSU9fS0ZJRk9f
QlVGPW0KQ09ORklHX0lJT19UUklHR0VSRURfQlVGRkVSPW0KIyBDT05GSUdfSUlPX0NPTkZJR0ZT
IGlzIG5vdCBzZXQKQ09ORklHX0lJT19UUklHR0VSPXkKQ09ORklHX0lJT19DT05TVU1FUlNfUEVS
X1RSSUdHRVI9MgojIENPTkZJR19JSU9fU1dfREVWSUNFIGlzIG5vdCBzZXQKIyBDT05GSUdfSUlP
X1NXX1RSSUdHRVIgaXMgbm90IHNldAojIENPTkZJR19JSU9fVFJJR0dFUkVEX0VWRU5UIGlzIG5v
dCBzZXQKCiMKIyBBY2NlbGVyb21ldGVycwojCiMgQ09ORklHX0FESVMxNjIwMSBpcyBub3Qgc2V0
CiMgQ09ORklHX0FESVMxNjIwOSBpcyBub3Qgc2V0CiMgQ09ORklHX0FEWEwzNDVfSTJDIGlzIG5v
dCBzZXQKIyBDT05GSUdfQURYTDM0NV9TUEkgaXMgbm90IHNldAojIENPTkZJR19BRFhMMzcyX1NQ
SSBpcyBub3Qgc2V0CiMgQ09ORklHX0FEWEwzNzJfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfQk1B
MTgwIGlzIG5vdCBzZXQKIyBDT05GSUdfQk1BMjIwIGlzIG5vdCBzZXQKIyBDT05GSUdfQk1BNDAw
IGlzIG5vdCBzZXQKIyBDT05GSUdfQk1DMTUwX0FDQ0VMIGlzIG5vdCBzZXQKIyBDT05GSUdfQk1J
MDg4X0FDQ0VMIGlzIG5vdCBzZXQKIyBDT05GSUdfREEyODAgaXMgbm90IHNldAojIENPTkZJR19E
QTMxMSBpcyBub3Qgc2V0CiMgQ09ORklHX0RNQVJEMDYgaXMgbm90IHNldAojIENPTkZJR19ETUFS
RDA5IGlzIG5vdCBzZXQKIyBDT05GSUdfRE1BUkQxMCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZYTFM4
OTYyQUZfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfRlhMUzg5NjJBRl9TUEkgaXMgbm90IHNldAoj
IENPTkZJR19JSU9fU1RfQUNDRUxfM0FYSVMgaXMgbm90IHNldAojIENPTkZJR19LWFNEOSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0tYQ0pLMTAxMyBpcyBub3Qgc2V0CiMgQ09ORklHX01DMzIzMCBpcyBu
b3Qgc2V0CiMgQ09ORklHX01NQTc0NTVfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfTU1BNzQ1NV9T
UEkgaXMgbm90IHNldAojIENPTkZJR19NTUE3NjYwIGlzIG5vdCBzZXQKIyBDT05GSUdfTU1BODQ1
MiBpcyBub3Qgc2V0CiMgQ09ORklHX01NQTk1NTEgaXMgbm90IHNldAojIENPTkZJR19NTUE5NTUz
IGlzIG5vdCBzZXQKIyBDT05GSUdfTVhDNDAwNSBpcyBub3Qgc2V0CiMgQ09ORklHX01YQzYyNTUg
aXMgbm90IHNldAojIENPTkZJR19TQ0EzMDAwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NBMzMwMCBp
cyBub3Qgc2V0CiMgQ09ORklHX1NUSzgzMTIgaXMgbm90IHNldAojIENPTkZJR19TVEs4QkE1MCBp
cyBub3Qgc2V0CiMgZW5kIG9mIEFjY2VsZXJvbWV0ZXJzCgojCiMgQW5hbG9nIHRvIGRpZ2l0YWwg
Y29udmVydGVycwojCiMgQ09ORklHX0FENzA5MVI1IGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ3MTI0
IGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ3MTkyIGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ3MjY2IGlz
IG5vdCBzZXQKIyBDT05GSUdfQUQ3MjkxIGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ3MjkyIGlzIG5v
dCBzZXQKIyBDT05GSUdfQUQ3Mjk4IGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ3NDc2IGlzIG5vdCBz
ZXQKIyBDT05GSUdfQUQ3NjA2X0lGQUNFX1BBUkFMTEVMIGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ3
NjA2X0lGQUNFX1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX0FENzc2NiBpcyBub3Qgc2V0CiMgQ09O
RklHX0FENzc2OF8xIGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ3NzgwIGlzIG5vdCBzZXQKIyBDT05G
SUdfQUQ3NzkxIGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ3NzkzIGlzIG5vdCBzZXQKIyBDT05GSUdf
QUQ3ODg3IGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ3OTIzIGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ3
OTQ5IGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ3OTlYIGlzIG5vdCBzZXQKIyBDT05GSUdfQURJX0FY
SV9BREMgaXMgbm90IHNldAojIENPTkZJR19DQzEwMDAxX0FEQyBpcyBub3Qgc2V0CiMgQ09ORklH
X0VOVkVMT1BFX0RFVEVDVE9SIGlzIG5vdCBzZXQKIyBDT05GSUdfSEk4NDM1IGlzIG5vdCBzZXQK
IyBDT05GSUdfSFg3MTEgaXMgbm90IHNldAojIENPTkZJR19JTkEyWFhfQURDIGlzIG5vdCBzZXQK
IyBDT05GSUdfTFRDMjQ3MSBpcyBub3Qgc2V0CiMgQ09ORklHX0xUQzI0ODUgaXMgbm90IHNldAoj
IENPTkZJR19MVEMyNDk2IGlzIG5vdCBzZXQKIyBDT05GSUdfTFRDMjQ5NyBpcyBub3Qgc2V0CiMg
Q09ORklHX01BWDEwMjcgaXMgbm90IHNldAojIENPTkZJR19NQVgxMTEwMCBpcyBub3Qgc2V0CiMg
Q09ORklHX01BWDExMTggaXMgbm90IHNldAojIENPTkZJR19NQVgxMjQxIGlzIG5vdCBzZXQKIyBD
T05GSUdfTUFYMTM2MyBpcyBub3Qgc2V0CiMgQ09ORklHX01BWDk2MTEgaXMgbm90IHNldAojIENP
TkZJR19NQ1AzMjBYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUNQMzQyMiBpcyBub3Qgc2V0CiMgQ09O
RklHX01DUDM5MTEgaXMgbm90IHNldAojIENPTkZJR19OQVU3ODAyIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0RfQURDX01PRFVMQVRPUiBpcyBub3Qgc2V0CiMgQ09ORklHX1NUTVBFX0FEQyBpcyBub3Qg
c2V0CiMgQ09ORklHX1RJX0FEQzA4MUMgaXMgbm90IHNldAojIENPTkZJR19USV9BREMwODMyIGlz
IG5vdCBzZXQKIyBDT05GSUdfVElfQURDMDg0UzAyMSBpcyBub3Qgc2V0CiMgQ09ORklHX1RJX0FE
QzEyMTM4IGlzIG5vdCBzZXQKIyBDT05GSUdfVElfQURDMTA4UzEwMiBpcyBub3Qgc2V0CiMgQ09O
RklHX1RJX0FEQzEyOFMwNTIgaXMgbm90IHNldAojIENPTkZJR19USV9BREMxNjFTNjI2IGlzIG5v
dCBzZXQKIyBDT05GSUdfVElfQURTMTAxNSBpcyBub3Qgc2V0CiMgQ09ORklHX1RJX0FEUzc5NTAg
aXMgbm90IHNldAojIENPTkZJR19USV9BRFM4MzQ0IGlzIG5vdCBzZXQKIyBDT05GSUdfVElfQURT
ODY4OCBpcyBub3Qgc2V0CiMgQ09ORklHX1RJX0FEUzEyNFMwOCBpcyBub3Qgc2V0CiMgQ09ORklH
X1RJX0FEUzEzMUUwOCBpcyBub3Qgc2V0CiMgQ09ORklHX1RJX1RMQzQ1NDEgaXMgbm90IHNldAoj
IENPTkZJR19USV9UU0MyMDQ2IGlzIG5vdCBzZXQKIyBDT05GSUdfVkY2MTBfQURDIGlzIG5vdCBz
ZXQKIyBDT05GSUdfWElMSU5YX1hBREMgaXMgbm90IHNldAojIGVuZCBvZiBBbmFsb2cgdG8gZGln
aXRhbCBjb252ZXJ0ZXJzCgojCiMgQW5hbG9nIEZyb250IEVuZHMKIwojIENPTkZJR19JSU9fUkVT
Q0FMRSBpcyBub3Qgc2V0CiMgZW5kIG9mIEFuYWxvZyBGcm9udCBFbmRzCgojCiMgQW1wbGlmaWVy
cwojCiMgQ09ORklHX0FEODM2NiBpcyBub3Qgc2V0CiMgQ09ORklHX0hNQzQyNSBpcyBub3Qgc2V0
CiMgZW5kIG9mIEFtcGxpZmllcnMKCiMKIyBDYXBhY2l0YW5jZSB0byBkaWdpdGFsIGNvbnZlcnRl
cnMKIwojIENPTkZJR19BRDcxNTAgaXMgbm90IHNldAojIGVuZCBvZiBDYXBhY2l0YW5jZSB0byBk
aWdpdGFsIGNvbnZlcnRlcnMKCiMKIyBDaGVtaWNhbCBTZW5zb3JzCiMKIyBDT05GSUdfQVRMQVNf
UEhfU0VOU09SIGlzIG5vdCBzZXQKIyBDT05GSUdfQVRMQVNfRVpPX1NFTlNPUiBpcyBub3Qgc2V0
CiMgQ09ORklHX0JNRTY4MCBpcyBub3Qgc2V0CkNPTkZJR19DQ1M4MTE9bQojIENPTkZJR19JQVFD
T1JFIGlzIG5vdCBzZXQKIyBDT05GSUdfUE1TNzAwMyBpcyBub3Qgc2V0CiMgQ09ORklHX1NDRDMw
X0NPUkUgaXMgbm90IHNldApDT05GSUdfU0VOU0lSSU9OX1NHUDMwPW0KIyBDT05GSUdfU0VOU0lS
SU9OX1NHUDQwIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BTMzBfSTJDIGlzIG5vdCBzZXQKIyBDT05G
SUdfU1BTMzBfU0VSSUFMIGlzIG5vdCBzZXQKIyBDT05GSUdfVlo4OVggaXMgbm90IHNldAojIGVu
ZCBvZiBDaGVtaWNhbCBTZW5zb3JzCgojCiMgSGlkIFNlbnNvciBJSU8gQ29tbW9uCiMKIyBlbmQg
b2YgSGlkIFNlbnNvciBJSU8gQ29tbW9uCgojCiMgSUlPIFNDTUkgU2Vuc29ycwojCiMgZW5kIG9m
IElJTyBTQ01JIFNlbnNvcnMKCiMKIyBTU1AgU2Vuc29yIENvbW1vbgojCiMgQ09ORklHX0lJT19T
U1BfU0VOU09SSFVCIGlzIG5vdCBzZXQKIyBlbmQgb2YgU1NQIFNlbnNvciBDb21tb24KCiMKIyBE
aWdpdGFsIHRvIGFuYWxvZyBjb252ZXJ0ZXJzCiMKIyBDT05GSUdfQUQ1MDY0IGlzIG5vdCBzZXQK
IyBDT05GSUdfQUQ1MzYwIGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ1MzgwIGlzIG5vdCBzZXQKIyBD
T05GSUdfQUQ1NDIxIGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ1NDQ2IGlzIG5vdCBzZXQKIyBDT05G
SUdfQUQ1NDQ5IGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ1NTkyUiBpcyBub3Qgc2V0CiMgQ09ORklH
X0FENTU5M1IgaXMgbm90IHNldAojIENPTkZJR19BRDU1MDQgaXMgbm90IHNldAojIENPTkZJR19B
RDU2MjRSX1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX0FENTY4Nl9TUEkgaXMgbm90IHNldAojIENP
TkZJR19BRDU2OTZfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ1NzU1IGlzIG5vdCBzZXQKIyBD
T05GSUdfQUQ1NzU4IGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ1NzYxIGlzIG5vdCBzZXQKIyBDT05G
SUdfQUQ1NzY0IGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ1NzY2IGlzIG5vdCBzZXQKIyBDT05GSUdf
QUQ1NzcwUiBpcyBub3Qgc2V0CiMgQ09ORklHX0FENTc5MSBpcyBub3Qgc2V0CiMgQ09ORklHX0FE
NzMwMyBpcyBub3Qgc2V0CiMgQ09ORklHX0FEODgwMSBpcyBub3Qgc2V0CiMgQ09ORklHX0RQT1Rf
REFDIGlzIG5vdCBzZXQKIyBDT05GSUdfRFM0NDI0IGlzIG5vdCBzZXQKIyBDT05GSUdfTFRDMTY2
MCBpcyBub3Qgc2V0CiMgQ09ORklHX0xUQzI2MzIgaXMgbm90IHNldAojIENPTkZJR19NNjIzMzIg
aXMgbm90IHNldAojIENPTkZJR19NQVg1MTcgaXMgbm90IHNldAojIENPTkZJR19NQVg1ODIxIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUNQNDcyNSBpcyBub3Qgc2V0CiMgQ09ORklHX01DUDQ5MjIgaXMg
bm90IHNldAojIENPTkZJR19USV9EQUMwODJTMDg1IGlzIG5vdCBzZXQKIyBDT05GSUdfVElfREFD
NTU3MSBpcyBub3Qgc2V0CiMgQ09ORklHX1RJX0RBQzczMTEgaXMgbm90IHNldAojIENPTkZJR19U
SV9EQUM3NjEyIGlzIG5vdCBzZXQKIyBDT05GSUdfVkY2MTBfREFDIGlzIG5vdCBzZXQKIyBlbmQg
b2YgRGlnaXRhbCB0byBhbmFsb2cgY29udmVydGVycwoKIwojIElJTyBkdW1teSBkcml2ZXIKIwoj
IGVuZCBvZiBJSU8gZHVtbXkgZHJpdmVyCgojCiMgRnJlcXVlbmN5IFN5bnRoZXNpemVycyBERFMv
UExMCiMKCiMKIyBDbG9jayBHZW5lcmF0b3IvRGlzdHJpYnV0aW9uCiMKIyBDT05GSUdfQUQ5NTIz
IGlzIG5vdCBzZXQKIyBlbmQgb2YgQ2xvY2sgR2VuZXJhdG9yL0Rpc3RyaWJ1dGlvbgoKIwojIFBo
YXNlLUxvY2tlZCBMb29wIChQTEwpIGZyZXF1ZW5jeSBzeW50aGVzaXplcnMKIwojIENPTkZJR19B
REY0MzUwIGlzIG5vdCBzZXQKIyBDT05GSUdfQURGNDM3MSBpcyBub3Qgc2V0CiMgZW5kIG9mIFBo
YXNlLUxvY2tlZCBMb29wIChQTEwpIGZyZXF1ZW5jeSBzeW50aGVzaXplcnMKIyBlbmQgb2YgRnJl
cXVlbmN5IFN5bnRoZXNpemVycyBERFMvUExMCgojCiMgRGlnaXRhbCBneXJvc2NvcGUgc2Vuc29y
cwojCiMgQ09ORklHX0FESVMxNjA4MCBpcyBub3Qgc2V0CiMgQ09ORklHX0FESVMxNjEzMCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0FESVMxNjEzNiBpcyBub3Qgc2V0CiMgQ09ORklHX0FESVMxNjI2MCBp
cyBub3Qgc2V0CiMgQ09ORklHX0FEWFJTMjkwIGlzIG5vdCBzZXQKIyBDT05GSUdfQURYUlM0NTAg
aXMgbm90IHNldAojIENPTkZJR19CTUcxNjAgaXMgbm90IHNldAojIENPTkZJR19GWEFTMjEwMDJD
IGlzIG5vdCBzZXQKIyBDT05GSUdfTVBVMzA1MF9JMkMgaXMgbm90IHNldAojIENPTkZJR19JSU9f
U1RfR1lST18zQVhJUyBpcyBub3Qgc2V0CiMgQ09ORklHX0lURzMyMDAgaXMgbm90IHNldAojIGVu
ZCBvZiBEaWdpdGFsIGd5cm9zY29wZSBzZW5zb3JzCgojCiMgSGVhbHRoIFNlbnNvcnMKIwoKIwoj
IEhlYXJ0IFJhdGUgTW9uaXRvcnMKIwojIENPTkZJR19BRkU0NDAzIGlzIG5vdCBzZXQKIyBDT05G
SUdfQUZFNDQwNCBpcyBub3Qgc2V0CiMgQ09ORklHX01BWDMwMTAwIGlzIG5vdCBzZXQKIyBDT05G
SUdfTUFYMzAxMDIgaXMgbm90IHNldAojIGVuZCBvZiBIZWFydCBSYXRlIE1vbml0b3JzCiMgZW5k
IG9mIEhlYWx0aCBTZW5zb3JzCgojCiMgSHVtaWRpdHkgc2Vuc29ycwojCiMgQ09ORklHX0FNMjMx
NSBpcyBub3Qgc2V0CiMgQ09ORklHX0RIVDExIGlzIG5vdCBzZXQKIyBDT05GSUdfSERDMTAwWCBp
cyBub3Qgc2V0CiMgQ09ORklHX0hEQzIwMTAgaXMgbm90IHNldAojIENPTkZJR19IVFMyMjEgaXMg
bm90IHNldAojIENPTkZJR19IVFUyMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NJNzAwNSBpcyBub3Qg
c2V0CiMgQ09ORklHX1NJNzAyMCBpcyBub3Qgc2V0CiMgZW5kIG9mIEh1bWlkaXR5IHNlbnNvcnMK
CiMKIyBJbmVydGlhbCBtZWFzdXJlbWVudCB1bml0cwojCiMgQ09ORklHX0FESVMxNjQwMCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0FESVMxNjQ2MCBpcyBub3Qgc2V0CiMgQ09ORklHX0FESVMxNjQ3NSBp
cyBub3Qgc2V0CiMgQ09ORklHX0FESVMxNjQ4MCBpcyBub3Qgc2V0CiMgQ09ORklHX0JNSTE2MF9J
MkMgaXMgbm90IHNldAojIENPTkZJR19CTUkxNjBfU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfRlhP
Uzg3MDBfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfRlhPUzg3MDBfU1BJIGlzIG5vdCBzZXQKIyBD
T05GSUdfS01YNjEgaXMgbm90IHNldAojIENPTkZJR19JTlZfSUNNNDI2MDBfSTJDIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSU5WX0lDTTQyNjAwX1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX0lOVl9NUFU2
MDUwX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX0lOVl9NUFU2MDUwX1NQSSBpcyBub3Qgc2V0CiMg
Q09ORklHX0lJT19TVF9MU002RFNYIGlzIG5vdCBzZXQKIyBDT05GSUdfSUlPX1NUX0xTTTlEUzAg
aXMgbm90IHNldAojIGVuZCBvZiBJbmVydGlhbCBtZWFzdXJlbWVudCB1bml0cwoKIwojIExpZ2h0
IHNlbnNvcnMKIwojIENPTkZJR19BREpEX1MzMTEgaXMgbm90IHNldAojIENPTkZJR19BRFVYMTAy
MCBpcyBub3Qgc2V0CiMgQ09ORklHX0FMMzAxMCBpcyBub3Qgc2V0CiMgQ09ORklHX0FMMzMyMEEg
aXMgbm90IHNldAojIENPTkZJR19BUERTOTMwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0FQRFM5OTYw
IGlzIG5vdCBzZXQKIyBDT05GSUdfQVM3MzIxMSBpcyBub3Qgc2V0CkNPTkZJR19CSDE3NTA9bQoj
IENPTkZJR19CSDE3ODAgaXMgbm90IHNldAojIENPTkZJR19DTTMyMTgxIGlzIG5vdCBzZXQKIyBD
T05GSUdfQ00zMjMyIGlzIG5vdCBzZXQKIyBDT05GSUdfQ00zMzIzIGlzIG5vdCBzZXQKIyBDT05G
SUdfQ00zNjA1IGlzIG5vdCBzZXQKIyBDT05GSUdfQ00zNjY1MSBpcyBub3Qgc2V0CiMgQ09ORklH
X0dQMkFQMDAyIGlzIG5vdCBzZXQKIyBDT05GSUdfR1AyQVAwMjBBMDBGIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19JU0wyOTAxOCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfSVNMMjkw
MjggaXMgbm90IHNldAojIENPTkZJR19JU0wyOTEyNSBpcyBub3Qgc2V0CiMgQ09ORklHX0pTQTEy
MTIgaXMgbm90IHNldAojIENPTkZJR19SUFIwNTIxIGlzIG5vdCBzZXQKIyBDT05GSUdfTFRSNTAx
IGlzIG5vdCBzZXQKIyBDT05GSUdfTFYwMTA0Q1MgaXMgbm90IHNldAojIENPTkZJR19NQVg0NDAw
MCBpcyBub3Qgc2V0CiMgQ09ORklHX01BWDQ0MDA5IGlzIG5vdCBzZXQKIyBDT05GSUdfTk9BMTMw
NSBpcyBub3Qgc2V0CiMgQ09ORklHX09QVDMwMDEgaXMgbm90IHNldAojIENPTkZJR19QQTEyMjAz
MDAxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0kxMTMzIGlzIG5vdCBzZXQKIyBDT05GSUdfU0kxMTQ1
IGlzIG5vdCBzZXQKIyBDT05GSUdfU1RLMzMxMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NUX1VWSVMy
NSBpcyBub3Qgc2V0CiMgQ09ORklHX1RDUzM0MTQgaXMgbm90IHNldAojIENPTkZJR19UQ1MzNDcy
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19UU0wyNTYzIGlzIG5vdCBzZXQKIyBDT05GSUdf
VFNMMjU4MyBpcyBub3Qgc2V0CiMgQ09ORklHX1RTTDI1OTEgaXMgbm90IHNldAojIENPTkZJR19U
U0wyNzcyIGlzIG5vdCBzZXQKIyBDT05GSUdfVFNMNDUzMSBpcyBub3Qgc2V0CiMgQ09ORklHX1VT
NTE4MkQgaXMgbm90IHNldAojIENPTkZJR19WQ05MNDAwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZD
Tkw0MDM1IGlzIG5vdCBzZXQKIyBDT05GSUdfVkVNTDYwMzAgaXMgbm90IHNldAojIENPTkZJR19W
RU1MNjA3MCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZMNjE4MCBpcyBub3Qgc2V0CiMgQ09ORklHX1pP
UFQyMjAxIGlzIG5vdCBzZXQKIyBlbmQgb2YgTGlnaHQgc2Vuc29ycwoKIwojIE1hZ25ldG9tZXRl
ciBzZW5zb3JzCiMKIyBDT05GSUdfQUs4OTc0IGlzIG5vdCBzZXQKIyBDT05GSUdfQUs4OTc1IGlz
IG5vdCBzZXQKIyBDT05GSUdfQUswOTkxMSBpcyBub3Qgc2V0CiMgQ09ORklHX0JNQzE1MF9NQUdO
X0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX0JNQzE1MF9NQUdOX1NQSSBpcyBub3Qgc2V0CiMgQ09O
RklHX01BRzMxMTAgaXMgbm90IHNldAojIENPTkZJR19NTUMzNTI0MCBpcyBub3Qgc2V0CiMgQ09O
RklHX0lJT19TVF9NQUdOXzNBWElTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19ITUM1ODQz
X0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfSE1DNTg0M19TUEkgaXMgbm90IHNldAoj
IENPTkZJR19TRU5TT1JTX1JNMzEwMF9JMkMgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1JN
MzEwMF9TUEkgaXMgbm90IHNldAojIENPTkZJR19ZQU1BSEFfWUFTNTMwIGlzIG5vdCBzZXQKIyBl
bmQgb2YgTWFnbmV0b21ldGVyIHNlbnNvcnMKCiMKIyBNdWx0aXBsZXhlcnMKIwojIENPTkZJR19J
SU9fTVVYIGlzIG5vdCBzZXQKIyBlbmQgb2YgTXVsdGlwbGV4ZXJzCgojCiMgSW5jbGlub21ldGVy
IHNlbnNvcnMKIwojIGVuZCBvZiBJbmNsaW5vbWV0ZXIgc2Vuc29ycwoKIwojIFRyaWdnZXJzIC0g
c3RhbmRhbG9uZQojCiMgQ09ORklHX0lJT19JTlRFUlJVUFRfVFJJR0dFUiBpcyBub3Qgc2V0CiMg
Q09ORklHX0lJT19TWVNGU19UUklHR0VSIGlzIG5vdCBzZXQKIyBlbmQgb2YgVHJpZ2dlcnMgLSBz
dGFuZGFsb25lCgojCiMgTGluZWFyIGFuZCBhbmd1bGFyIHBvc2l0aW9uIHNlbnNvcnMKIwojIGVu
ZCBvZiBMaW5lYXIgYW5kIGFuZ3VsYXIgcG9zaXRpb24gc2Vuc29ycwoKIwojIERpZ2l0YWwgcG90
ZW50aW9tZXRlcnMKIwojIENPTkZJR19BRDUxMTAgaXMgbm90IHNldAojIENPTkZJR19BRDUyNzIg
aXMgbm90IHNldAojIENPTkZJR19EUzE4MDMgaXMgbm90IHNldAojIENPTkZJR19NQVg1NDMyIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUFYNTQ4MSBpcyBub3Qgc2V0CiMgQ09ORklHX01BWDU0ODcgaXMg
bm90IHNldAojIENPTkZJR19NQ1A0MDE4IGlzIG5vdCBzZXQKIyBDT05GSUdfTUNQNDEzMSBpcyBu
b3Qgc2V0CiMgQ09ORklHX01DUDQ1MzEgaXMgbm90IHNldAojIENPTkZJR19NQ1A0MTAxMCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1RQTDAxMDIgaXMgbm90IHNldAojIGVuZCBvZiBEaWdpdGFsIHBvdGVu
dGlvbWV0ZXJzCgojCiMgRGlnaXRhbCBwb3RlbnRpb3N0YXRzCiMKIyBDT05GSUdfTE1QOTEwMDAg
aXMgbm90IHNldAojIGVuZCBvZiBEaWdpdGFsIHBvdGVudGlvc3RhdHMKCiMKIyBQcmVzc3VyZSBz
ZW5zb3JzCiMKIyBDT05GSUdfQUJQMDYwTUcgaXMgbm90IHNldAojIENPTkZJR19CTVAyODAgaXMg
bm90IHNldAojIENPTkZJR19ETEhMNjBEIGlzIG5vdCBzZXQKIyBDT05GSUdfRFBTMzEwIGlzIG5v
dCBzZXQKIyBDT05GSUdfSFAwMyBpcyBub3Qgc2V0CiMgQ09ORklHX0lDUDEwMTAwIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTVBMMTE1X0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX01QTDExNV9TUEkgaXMg
bm90IHNldAojIENPTkZJR19NUEwzMTE1IGlzIG5vdCBzZXQKIyBDT05GSUdfTVM1NjExIGlzIG5v
dCBzZXQKIyBDT05GSUdfTVM1NjM3IGlzIG5vdCBzZXQKIyBDT05GSUdfSUlPX1NUX1BSRVNTIGlz
IG5vdCBzZXQKIyBDT05GSUdfVDU0MDMgaXMgbm90IHNldAojIENPTkZJR19IUDIwNkMgaXMgbm90
IHNldAojIENPTkZJR19aUEEyMzI2IGlzIG5vdCBzZXQKIyBlbmQgb2YgUHJlc3N1cmUgc2Vuc29y
cwoKIwojIExpZ2h0bmluZyBzZW5zb3JzCiMKIyBDT05GSUdfQVMzOTM1IGlzIG5vdCBzZXQKIyBl
bmQgb2YgTGlnaHRuaW5nIHNlbnNvcnMKCiMKIyBQcm94aW1pdHkgYW5kIGRpc3RhbmNlIHNlbnNv
cnMKIwojIENPTkZJR19JU0wyOTUwMSBpcyBub3Qgc2V0CiMgQ09ORklHX0xJREFSX0xJVEVfVjIg
aXMgbm90IHNldAojIENPTkZJR19NQjEyMzIgaXMgbm90IHNldAojIENPTkZJR19QSU5HIGlzIG5v
dCBzZXQKIyBDT05GSUdfUkZENzc0MDIgaXMgbm90IHNldAojIENPTkZJR19TUkYwNCBpcyBub3Qg
c2V0CiMgQ09ORklHX1NYOTMxMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NYOTUwMCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NSRjA4IGlzIG5vdCBzZXQKIyBDT05GSUdfVkNOTDMwMjAgaXMgbm90IHNldAoj
IENPTkZJR19WTDUzTDBYX0kyQyBpcyBub3Qgc2V0CiMgZW5kIG9mIFByb3hpbWl0eSBhbmQgZGlz
dGFuY2Ugc2Vuc29ycwoKIwojIFJlc29sdmVyIHRvIGRpZ2l0YWwgY29udmVydGVycwojCiMgQ09O
RklHX0FEMlM5MCBpcyBub3Qgc2V0CiMgQ09ORklHX0FEMlMxMjAwIGlzIG5vdCBzZXQKIyBlbmQg
b2YgUmVzb2x2ZXIgdG8gZGlnaXRhbCBjb252ZXJ0ZXJzCgojCiMgVGVtcGVyYXR1cmUgc2Vuc29y
cwojCiMgQ09ORklHX0xUQzI5ODMgaXMgbm90IHNldAojIENPTkZJR19NQVhJTV9USEVSTU9DT1VQ
TEUgaXMgbm90IHNldAojIENPTkZJR19NTFg5MDYxNCBpcyBub3Qgc2V0CiMgQ09ORklHX01MWDkw
NjMyIGlzIG5vdCBzZXQKIyBDT05GSUdfVE1QMDA2IGlzIG5vdCBzZXQKIyBDT05GSUdfVE1QMDA3
IGlzIG5vdCBzZXQKIyBDT05GSUdfVE1QMTE3IGlzIG5vdCBzZXQKIyBDT05GSUdfVFNZUzAxIGlz
IG5vdCBzZXQKIyBDT05GSUdfVFNZUzAyRCBpcyBub3Qgc2V0CiMgQ09ORklHX01BWDMxODU2IGlz
IG5vdCBzZXQKIyBlbmQgb2YgVGVtcGVyYXR1cmUgc2Vuc29ycwoKIyBDT05GSUdfTlRCIGlzIG5v
dCBzZXQKIyBDT05GSUdfVk1FX0JVUyBpcyBub3Qgc2V0CkNPTkZJR19QV009eQpDT05GSUdfUFdN
X1NZU0ZTPXkKIyBDT05GSUdfUFdNX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfUFdNX0FUTUVM
X1RDQiBpcyBub3Qgc2V0CkNPTkZJR19QV01fQkNNMjgzNT1tCiMgQ09ORklHX1BXTV9EV0MgaXMg
bm90IHNldAojIENPTkZJR19QV01fRlNMX0ZUTSBpcyBub3Qgc2V0CkNPTkZJR19QV01fUENBOTY4
NT1tCiMgQ09ORklHX1BXTV9SQVNQQkVSUllQSV9QT0UgaXMgbm90IHNldAojIENPTkZJR19QV01f
U1RNUEUgaXMgbm90IHNldAoKIwojIElSUSBjaGlwIHN1cHBvcnQKIwpDT05GSUdfSVJRQ0hJUD15
CkNPTkZJR19BUk1fR0lDPXkKQ09ORklHX0FSTV9HSUNfTUFYX05SPTEKQ09ORklHX0FSTV9HSUNf
VjJNPXkKQ09ORklHX0FSTV9HSUNfVjM9eQpDT05GSUdfQVJNX0dJQ19WM19JVFM9eQpDT05GSUdf
QVJNX0dJQ19WM19JVFNfUENJPXkKIyBDT05GSUdfQUxfRklDIGlzIG5vdCBzZXQKQ09ORklHX0JS
Q01TVEJfTDJfSVJRPXkKQ09ORklHX1BBUlRJVElPTl9QRVJDUFU9eQojIGVuZCBvZiBJUlEgY2hp
cCBzdXBwb3J0CgojIENPTkZJR19JUEFDS19CVVMgaXMgbm90IHNldApDT05GSUdfUkVTRVRfQ09O
VFJPTExFUj15CkNPTkZJR19SRVNFVF9SQVNQQkVSUllQST15CkNPTkZJR19SRVNFVF9TSU1QTEU9
eQojIENPTkZJR19SRVNFVF9USV9TWVNDT04gaXMgbm90IHNldAoKIwojIFBIWSBTdWJzeXN0ZW0K
IwpDT05GSUdfR0VORVJJQ19QSFk9eQojIENPTkZJR19QSFlfWEdFTkUgaXMgbm90IHNldAojIENP
TkZJR19QSFlfQ0FOX1RSQU5TQ0VJVkVSIGlzIG5vdCBzZXQKIyBDT05GSUdfQkNNX0tPTkFfVVNC
Ml9QSFkgaXMgbm90IHNldAojIENPTkZJR19QSFlfQ0FERU5DRV9UT1JSRU5UIGlzIG5vdCBzZXQK
IyBDT05GSUdfUEhZX0NBREVOQ0VfRFBIWSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9DQURFTkNF
X1NJRVJSQSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9DQURFTkNFX1NBTFZPIGlzIG5vdCBzZXQK
IyBDT05GSUdfUEhZX0ZTTF9JTVg4TVFfVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX01JWEVM
X01JUElfRFBIWSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9QWEFfMjhOTV9IU0lDIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUEhZX1BYQV8yOE5NX1VTQjIgaXMgbm90IHNldAojIENPTkZJR19QSFlfQ1BD
QVBfVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX01BUFBIT05FX01ETTY2MDAgaXMgbm90IHNl
dAojIENPTkZJR19QSFlfT0NFTE9UX1NFUkRFUyBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9TQU1T
VU5HX1VTQjIgaXMgbm90IHNldAojIGVuZCBvZiBQSFkgU3Vic3lzdGVtCgojIENPTkZJR19QT1dF
UkNBUCBpcyBub3Qgc2V0CiMgQ09ORklHX01DQiBpcyBub3Qgc2V0CgojCiMgUGVyZm9ybWFuY2Ug
bW9uaXRvciBzdXBwb3J0CiMKIyBDT05GSUdfQVJNX0NDSV9QTVUgaXMgbm90IHNldAojIENPTkZJ
R19BUk1fQ0NOIGlzIG5vdCBzZXQKIyBDT05GSUdfQVJNX0NNTiBpcyBub3Qgc2V0CkNPTkZJR19B
Uk1fUE1VPXkKIyBDT05GSUdfQVJNX0RTVV9QTVUgaXMgbm90IHNldAojIENPTkZJR19BUk1fU1BF
X1BNVSBpcyBub3Qgc2V0CiMgZW5kIG9mIFBlcmZvcm1hbmNlIG1vbml0b3Igc3VwcG9ydAoKIyBD
T05GSUdfUkFTIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCNCBpcyBub3Qgc2V0CgojCiMgQW5kcm9p
ZAojCiMgQ09ORklHX0FORFJPSUQgaXMgbm90IHNldAojIGVuZCBvZiBBbmRyb2lkCgojIENPTkZJ
R19MSUJOVkRJTU0gaXMgbm90IHNldAojIENPTkZJR19EQVggaXMgbm90IHNldApDT05GSUdfTlZN
RU09eQpDT05GSUdfTlZNRU1fU1lTRlM9eQpDT05GSUdfTlZNRU1fUk1FTT1tCgojCiMgSFcgdHJh
Y2luZyBzdXBwb3J0CiMKIyBDT05GSUdfU1RNIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5URUxfVEgg
aXMgbm90IHNldAojIGVuZCBvZiBIVyB0cmFjaW5nIHN1cHBvcnQKCiMgQ09ORklHX0ZQR0EgaXMg
bm90IHNldAojIENPTkZJR19GU0kgaXMgbm90IHNldAojIENPTkZJR19URUUgaXMgbm90IHNldApD
T05GSUdfUE1fT1BQPXkKIyBDT05GSUdfU0lPWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NMSU1CVVMg
aXMgbm90IHNldAojIENPTkZJR19JTlRFUkNPTk5FQ1QgaXMgbm90IHNldAojIENPTkZJR19DT1VO
VEVSIGlzIG5vdCBzZXQKIyBDT05GSUdfTU9TVCBpcyBub3Qgc2V0CiMgZW5kIG9mIERldmljZSBE
cml2ZXJzCgojCiMgRmlsZSBzeXN0ZW1zCiMKQ09ORklHX0RDQUNIRV9XT1JEX0FDQ0VTUz15CiMg
Q09ORklHX1ZBTElEQVRFX0ZTX1BBUlNFUiBpcyBub3Qgc2V0CkNPTkZJR19GU19JT01BUD15CiMg
Q09ORklHX0VYVDJfRlMgaXMgbm90IHNldAojIENPTkZJR19FWFQzX0ZTIGlzIG5vdCBzZXQKQ09O
RklHX0VYVDRfRlM9eQpDT05GSUdfRVhUNF9VU0VfRk9SX0VYVDI9eQpDT05GSUdfRVhUNF9GU19Q
T1NJWF9BQ0w9eQpDT05GSUdfRVhUNF9GU19TRUNVUklUWT15CiMgQ09ORklHX0VYVDRfREVCVUcg
aXMgbm90IHNldApDT05GSUdfSkJEMj15CiMgQ09ORklHX0pCRDJfREVCVUcgaXMgbm90IHNldApD
T05GSUdfRlNfTUJDQUNIRT15CiMgQ09ORklHX1JFSVNFUkZTX0ZTIGlzIG5vdCBzZXQKIyBDT05G
SUdfSkZTX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfWEZTX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdf
R0ZTMl9GUyBpcyBub3Qgc2V0CiMgQ09ORklHX09DRlMyX0ZTIGlzIG5vdCBzZXQKQ09ORklHX0JU
UkZTX0ZTPXkKQ09ORklHX0JUUkZTX0ZTX1BPU0lYX0FDTD15CiMgQ09ORklHX0JUUkZTX0ZTX0NI
RUNLX0lOVEVHUklUWSBpcyBub3Qgc2V0CiMgQ09ORklHX0JUUkZTX0ZTX1JVTl9TQU5JVFlfVEVT
VFMgaXMgbm90IHNldAojIENPTkZJR19CVFJGU19ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX0JU
UkZTX0FTU0VSVCBpcyBub3Qgc2V0CiMgQ09ORklHX0JUUkZTX0ZTX1JFRl9WRVJJRlkgaXMgbm90
IHNldAojIENPTkZJR19OSUxGUzJfRlMgaXMgbm90IHNldAojIENPTkZJR19GMkZTX0ZTIGlzIG5v
dCBzZXQKIyBDT05GSUdfRlNfREFYIGlzIG5vdCBzZXQKQ09ORklHX0ZTX1BPU0lYX0FDTD15CkNP
TkZJR19FWFBPUlRGUz15CiMgQ09ORklHX0VYUE9SVEZTX0JMT0NLX09QUyBpcyBub3Qgc2V0CkNP
TkZJR19GSUxFX0xPQ0tJTkc9eQpDT05GSUdfRlNfRU5DUllQVElPTj15CkNPTkZJR19GU19FTkNS
WVBUSU9OX0FMR1M9eQojIENPTkZJR19GU19WRVJJVFkgaXMgbm90IHNldApDT05GSUdfRlNOT1RJ
Rlk9eQpDT05GSUdfRE5PVElGWT15CkNPTkZJR19JTk9USUZZX1VTRVI9eQojIENPTkZJR19GQU5P
VElGWSBpcyBub3Qgc2V0CiMgQ09ORklHX1FVT1RBIGlzIG5vdCBzZXQKQ09ORklHX0FVVE9GUzRf
RlM9eQpDT05GSUdfQVVUT0ZTX0ZTPXkKQ09ORklHX0ZVU0VfRlM9bQpDT05GSUdfQ1VTRT1tCiMg
Q09ORklHX1ZJUlRJT19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX09WRVJMQVlfRlMgaXMgbm90IHNl
dAoKIwojIENhY2hlcwojCiMgQ09ORklHX0ZTQ0FDSEUgaXMgbm90IHNldAojIGVuZCBvZiBDYWNo
ZXMKCiMKIyBDRC1ST00vRFZEIEZpbGVzeXN0ZW1zCiMKIyBDT05GSUdfSVNPOTY2MF9GUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1VERl9GUyBpcyBub3Qgc2V0CiMgZW5kIG9mIENELVJPTS9EVkQgRmls
ZXN5c3RlbXMKCiMKIyBET1MvRkFUL0VYRkFUL05UIEZpbGVzeXN0ZW1zCiMKQ09ORklHX0ZBVF9G
Uz15CkNPTkZJR19NU0RPU19GUz15CkNPTkZJR19WRkFUX0ZTPXkKIyBDT05GSUdfVkZBVF9GU19O
T19EVUFMTkFNRVMgaXMgbm90IHNldApDT05GSUdfRkFUX0RFRkFVTFRfQ09ERVBBR0U9NDM3CkNP
TkZJR19GQVRfREVGQVVMVF9JT0NIQVJTRVQ9Imlzbzg4NTktMSIKIyBDT05GSUdfVkZBVF9OT19D
UkVBVEVfV0lUSF9MT05HTkFNRVMgaXMgbm90IHNldAojIENPTkZJR19GQVRfREVGQVVMVF9VVEY4
IGlzIG5vdCBzZXQKIyBDT05GSUdfRVhGQVRfRlMgaXMgbm90IHNldAojIENPTkZJR19OVEZTX0ZT
IGlzIG5vdCBzZXQKIyBDT05GSUdfTlRGUzNfRlMgaXMgbm90IHNldAojIGVuZCBvZiBET1MvRkFU
L0VYRkFUL05UIEZpbGVzeXN0ZW1zCgojCiMgUHNldWRvIGZpbGVzeXN0ZW1zCiMKQ09ORklHX1BS
T0NfRlM9eQpDT05GSUdfUFJPQ19LQ09SRT15CkNPTkZJR19QUk9DX1NZU0NUTD15CkNPTkZJR19Q
Uk9DX1BBR0VfTU9OSVRPUj15CiMgQ09ORklHX1BST0NfQ0hJTERSRU4gaXMgbm90IHNldApDT05G
SUdfS0VSTkZTPXkKQ09ORklHX1NZU0ZTPXkKQ09ORklHX1RNUEZTPXkKQ09ORklHX1RNUEZTX1BP
U0lYX0FDTD15CkNPTkZJR19UTVBGU19YQVRUUj15CiMgQ09ORklHX1RNUEZTX0lOT0RFNjQgaXMg
bm90IHNldApDT05GSUdfQVJDSF9TVVBQT1JUU19IVUdFVExCRlM9eQojIENPTkZJR19IVUdFVExC
RlMgaXMgbm90IHNldApDT05GSUdfTUVNRkRfQ1JFQVRFPXkKQ09ORklHX0FSQ0hfSEFTX0dJR0FO
VElDX1BBR0U9eQpDT05GSUdfQ09ORklHRlNfRlM9bQpDT05GSUdfRUZJVkFSX0ZTPW0KIyBlbmQg
b2YgUHNldWRvIGZpbGVzeXN0ZW1zCgpDT05GSUdfTUlTQ19GSUxFU1lTVEVNUz15CiMgQ09ORklH
X09SQU5HRUZTX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfQURGU19GUyBpcyBub3Qgc2V0CiMgQ09O
RklHX0FGRlNfRlMgaXMgbm90IHNldAojIENPTkZJR19FQ1JZUFRfRlMgaXMgbm90IHNldAojIENP
TkZJR19IRlNfRlMgaXMgbm90IHNldAojIENPTkZJR19IRlNQTFVTX0ZTIGlzIG5vdCBzZXQKIyBD
T05GSUdfQkVGU19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX0JGU19GUyBpcyBub3Qgc2V0CiMgQ09O
RklHX0VGU19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX1lBRkZTX0ZTIGlzIG5vdCBzZXQKIyBDT05G
SUdfSkZGUzJfRlMgaXMgbm90IHNldAojIENPTkZJR19DUkFNRlMgaXMgbm90IHNldAojIENPTkZJ
R19TUVVBU0hGUyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZYRlNfRlMgaXMgbm90IHNldAojIENPTkZJ
R19NSU5JWF9GUyBpcyBub3Qgc2V0CiMgQ09ORklHX09NRlNfRlMgaXMgbm90IHNldAojIENPTkZJ
R19IUEZTX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfUU5YNEZTX0ZTIGlzIG5vdCBzZXQKIyBDT05G
SUdfUU5YNkZTX0ZTIGlzIG5vdCBzZXQKQ09ORklHX1JPTUZTX0ZTPW0KQ09ORklHX1JPTUZTX0JB
Q0tFRF9CWV9CTE9DSz15CiMgQ09ORklHX1JPTUZTX0JBQ0tFRF9CWV9NVEQgaXMgbm90IHNldAoj
IENPTkZJR19ST01GU19CQUNLRURfQllfQk9USCBpcyBub3Qgc2V0CkNPTkZJR19ST01GU19PTl9C
TE9DSz15CiMgQ09ORklHX1BTVE9SRSBpcyBub3Qgc2V0CiMgQ09ORklHX1NZU1ZfRlMgaXMgbm90
IHNldAojIENPTkZJR19VRlNfRlMgaXMgbm90IHNldAojIENPTkZJR19FUk9GU19GUyBpcyBub3Qg
c2V0CiMgQ09ORklHX0FVRlNfRlMgaXMgbm90IHNldApDT05GSUdfTkVUV09SS19GSUxFU1lTVEVN
Uz15CkNPTkZJR19ORlNfRlM9eQpDT05GSUdfTkZTX1YyPXkKQ09ORklHX05GU19ERUZfRklMRV9J
T19TSVpFPTQwOTYKQ09ORklHX05GU19WMz15CiMgQ09ORklHX05GU19WM19BQ0wgaXMgbm90IHNl
dApDT05GSUdfTkZTX1Y0PXkKIyBDT05GSUdfTkZTX1NXQVAgaXMgbm90IHNldAojIENPTkZJR19O
RlNfVjRfMSBpcyBub3Qgc2V0CkNPTkZJR19ST09UX05GUz15CiMgQ09ORklHX05GU19VU0VfTEVH
QUNZX0ROUyBpcyBub3Qgc2V0CkNPTkZJR19ORlNfVVNFX0tFUk5FTF9ETlM9eQojIENPTkZJR19O
RlNfRElTQUJMRV9VRFBfU1VQUE9SVCBpcyBub3Qgc2V0CiMgQ09ORklHX05GU0QgaXMgbm90IHNl
dApDT05GSUdfR1JBQ0VfUEVSSU9EPXkKQ09ORklHX0xPQ0tEPXkKQ09ORklHX0xPQ0tEX1Y0PXkK
Q09ORklHX05GU19DT01NT049eQpDT05GSUdfU1VOUlBDPXkKQ09ORklHX1NVTlJQQ19HU1M9eQpD
T05GSUdfUlBDU0VDX0dTU19LUkI1PXkKIyBDT05GSUdfU1VOUlBDX0RJU0FCTEVfSU5TRUNVUkVf
RU5DVFlQRVMgaXMgbm90IHNldAojIENPTkZJR19TVU5SUENfREVCVUcgaXMgbm90IHNldAojIENP
TkZJR19DRVBIX0ZTIGlzIG5vdCBzZXQKQ09ORklHX0NJRlM9eQpDT05GSUdfQ0lGU19TVEFUUzI9
eQpDT05GSUdfQ0lGU19BTExPV19JTlNFQ1VSRV9MRUdBQ1k9eQojIENPTkZJR19DSUZTX1VQQ0FM
TCBpcyBub3Qgc2V0CkNPTkZJR19DSUZTX1hBVFRSPXkKQ09ORklHX0NJRlNfUE9TSVg9eQpDT05G
SUdfQ0lGU19ERUJVRz15CiMgQ09ORklHX0NJRlNfREVCVUcyIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q0lGU19ERUJVR19EVU1QX0tFWVMgaXMgbm90IHNldAojIENPTkZJR19DSUZTX0RGU19VUENBTEwg
aXMgbm90IHNldAojIENPTkZJR19DSUZTX1NXTl9VUENBTEwgaXMgbm90IHNldAojIENPTkZJR19D
SUZTX1JPT1QgaXMgbm90IHNldAojIENPTkZJR19TTUJfU0VSVkVSIGlzIG5vdCBzZXQKQ09ORklH
X1NNQkZTX0NPTU1PTj15CiMgQ09ORklHX0NPREFfRlMgaXMgbm90IHNldAojIENPTkZJR19BRlNf
RlMgaXMgbm90IHNldApDT05GSUdfTkxTPXkKQ09ORklHX05MU19ERUZBVUxUPSJpc284ODU5LTEi
CkNPTkZJR19OTFNfQ09ERVBBR0VfNDM3PXkKQ09ORklHX05MU19DT0RFUEFHRV83Mzc9bQpDT05G
SUdfTkxTX0NPREVQQUdFXzc3NT1tCkNPTkZJR19OTFNfQ09ERVBBR0VfODUwPW0KQ09ORklHX05M
U19DT0RFUEFHRV84NTI9bQpDT05GSUdfTkxTX0NPREVQQUdFXzg1NT1tCkNPTkZJR19OTFNfQ09E
RVBBR0VfODU3PW0KQ09ORklHX05MU19DT0RFUEFHRV84NjA9bQpDT05GSUdfTkxTX0NPREVQQUdF
Xzg2MT1tCkNPTkZJR19OTFNfQ09ERVBBR0VfODYyPW0KQ09ORklHX05MU19DT0RFUEFHRV84NjM9
bQpDT05GSUdfTkxTX0NPREVQQUdFXzg2ND1tCkNPTkZJR19OTFNfQ09ERVBBR0VfODY1PW0KQ09O
RklHX05MU19DT0RFUEFHRV84NjY9bQpDT05GSUdfTkxTX0NPREVQQUdFXzg2OT1tCkNPTkZJR19O
TFNfQ09ERVBBR0VfOTM2PW0KQ09ORklHX05MU19DT0RFUEFHRV85NTA9bQpDT05GSUdfTkxTX0NP
REVQQUdFXzkzMj1tCkNPTkZJR19OTFNfQ09ERVBBR0VfOTQ5PW0KQ09ORklHX05MU19DT0RFUEFH
RV84NzQ9bQpDT05GSUdfTkxTX0lTTzg4NTlfOD1tCkNPTkZJR19OTFNfQ09ERVBBR0VfMTI1MD1t
CkNPTkZJR19OTFNfQ09ERVBBR0VfMTI1MT1tCkNPTkZJR19OTFNfQVNDSUk9bQpDT05GSUdfTkxT
X0lTTzg4NTlfMT15CkNPTkZJR19OTFNfSVNPODg1OV8yPW0KQ09ORklHX05MU19JU084ODU5XzM9
bQpDT05GSUdfTkxTX0lTTzg4NTlfND1tCkNPTkZJR19OTFNfSVNPODg1OV81PW0KQ09ORklHX05M
U19JU084ODU5XzY9bQpDT05GSUdfTkxTX0lTTzg4NTlfNz1tCkNPTkZJR19OTFNfSVNPODg1OV85
PW0KQ09ORklHX05MU19JU084ODU5XzEzPW0KQ09ORklHX05MU19JU084ODU5XzE0PW0KQ09ORklH
X05MU19JU084ODU5XzE1PW0KQ09ORklHX05MU19LT0k4X1I9bQpDT05GSUdfTkxTX0tPSThfVT1t
CiMgQ09ORklHX05MU19NQUNfUk9NQU4gaXMgbm90IHNldAojIENPTkZJR19OTFNfTUFDX0NFTFRJ
QyBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19NQUNfQ0VOVEVVUk8gaXMgbm90IHNldAojIENPTkZJ
R19OTFNfTUFDX0NST0FUSUFOIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX01BQ19DWVJJTExJQyBp
cyBub3Qgc2V0CiMgQ09ORklHX05MU19NQUNfR0FFTElDIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxT
X01BQ19HUkVFSyBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19NQUNfSUNFTEFORCBpcyBub3Qgc2V0
CiMgQ09ORklHX05MU19NQUNfSU5VSVQgaXMgbm90IHNldAojIENPTkZJR19OTFNfTUFDX1JPTUFO
SUFOIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX01BQ19UVVJLSVNIIGlzIG5vdCBzZXQKQ09ORklH
X05MU19VVEY4PW0KIyBDT05GSUdfRExNIGlzIG5vdCBzZXQKIyBDT05GSUdfVU5JQ09ERSBpcyBu
b3Qgc2V0CkNPTkZJR19JT19XUT15CiMgZW5kIG9mIEZpbGUgc3lzdGVtcwoKIwojIFNlY3VyaXR5
IG9wdGlvbnMKIwpDT05GSUdfS0VZUz15CiMgQ09ORklHX0tFWVNfUkVRVUVTVF9DQUNIRSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1BFUlNJU1RFTlRfS0VZUklOR1MgaXMgbm90IHNldApDT05GSUdfRU5D
UllQVEVEX0tFWVM9eQojIENPTkZJR19LRVlfREhfT1BFUkFUSU9OUyBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFQ1VSSVRZX0RNRVNHX1JFU1RSSUNUIGlzIG5vdCBzZXQKQ09ORklHX1NFQ1VSSVRZPXkK
IyBDT05GSUdfU0VDVVJJVFlGUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFQ1VSSVRZX05FVFdPUksg
aXMgbm90IHNldApDT05GSUdfU0VDVVJJVFlfUEFUSD15CkNPTkZJR19IQVZFX0hBUkRFTkVEX1VT
RVJDT1BZX0FMTE9DQVRPUj15CiMgQ09ORklHX0hBUkRFTkVEX1VTRVJDT1BZIGlzIG5vdCBzZXQK
IyBDT05GSUdfRk9SVElGWV9TT1VSQ0UgaXMgbm90IHNldAojIENPTkZJR19TVEFUSUNfVVNFUk1P
REVIRUxQRVIgaXMgbm90IHNldAojIENPTkZJR19TRUNVUklUWV9TTUFDSyBpcyBub3Qgc2V0CiMg
Q09ORklHX1NFQ1VSSVRZX1RPTU9ZTyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFQ1VSSVRZX0FQUEFS
TU9SIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VDVVJJVFlfTE9BRFBJTiBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFQ1VSSVRZX1lBTUEgaXMgbm90IHNldAojIENPTkZJR19TRUNVUklUWV9TQUZFU0VUSUQg
aXMgbm90IHNldAojIENPTkZJR19TRUNVUklUWV9MT0NLRE9XTl9MU00gaXMgbm90IHNldApDT05G
SUdfU0VDVVJJVFlfTEFORExPQ0s9eQpDT05GSUdfSU5URUdSSVRZPXkKIyBDT05GSUdfSU5URUdS
SVRZX1NJR05BVFVSRSBpcyBub3Qgc2V0CiMgQ09ORklHX0lNQSBpcyBub3Qgc2V0CiMgQ09ORklH
X0lNQV9TRUNVUkVfQU5EX09SX1RSVVNURURfQk9PVCBpcyBub3Qgc2V0CiMgQ09ORklHX0VWTSBp
cyBub3Qgc2V0CkNPTkZJR19ERUZBVUxUX1NFQ1VSSVRZX0RBQz15CkNPTkZJR19MU009ImxhbmRs
b2NrLGxvY2tkb3duLHlhbWEsbG9hZHBpbixzYWZlc2V0aWQsaW50ZWdyaXR5LGJwZiIKCiMKIyBL
ZXJuZWwgaGFyZGVuaW5nIG9wdGlvbnMKIwoKIwojIE1lbW9yeSBpbml0aWFsaXphdGlvbgojCkNP
TkZJR19JTklUX1NUQUNLX05PTkU9eQojIENPTkZJR19HQ0NfUExVR0lOX1NUUlVDVExFQUtfVVNF
UiBpcyBub3Qgc2V0CiMgQ09ORklHX0dDQ19QTFVHSU5fU1RSVUNUTEVBS19CWVJFRiBpcyBub3Qg
c2V0CiMgQ09ORklHX0dDQ19QTFVHSU5fU1RSVUNUTEVBS19CWVJFRl9BTEwgaXMgbm90IHNldAoj
IENPTkZJR19HQ0NfUExVR0lOX1NUQUNLTEVBSyBpcyBub3Qgc2V0CiMgQ09ORklHX0lOSVRfT05f
QUxMT0NfREVGQVVMVF9PTiBpcyBub3Qgc2V0CiMgQ09ORklHX0lOSVRfT05fRlJFRV9ERUZBVUxU
X09OIGlzIG5vdCBzZXQKQ09ORklHX0NDX0hBU19aRVJPX0NBTExfVVNFRF9SRUdTPXkKIyBDT05G
SUdfWkVST19DQUxMX1VTRURfUkVHUyBpcyBub3Qgc2V0CiMgZW5kIG9mIE1lbW9yeSBpbml0aWFs
aXphdGlvbgojIGVuZCBvZiBLZXJuZWwgaGFyZGVuaW5nIG9wdGlvbnMKIyBlbmQgb2YgU2VjdXJp
dHkgb3B0aW9ucwoKQ09ORklHX1hPUl9CTE9DS1M9eQpDT05GSUdfQVNZTkNfQ09SRT15CkNPTkZJ
R19BU1lOQ19NRU1DUFk9eQpDT05GSUdfQVNZTkNfWE9SPXkKQ09ORklHX0FTWU5DX1BRPXkKQ09O
RklHX0FTWU5DX1JBSUQ2X1JFQ09WPXkKQ09ORklHX0NSWVBUTz15CgojCiMgQ3J5cHRvIGNvcmUg
b3IgaGVscGVyCiMKQ09ORklHX0NSWVBUT19BTEdBUEk9eQpDT05GSUdfQ1JZUFRPX0FMR0FQSTI9
eQpDT05GSUdfQ1JZUFRPX0FFQUQ9eQpDT05GSUdfQ1JZUFRPX0FFQUQyPXkKQ09ORklHX0NSWVBU
T19TS0NJUEhFUj15CkNPTkZJR19DUllQVE9fU0tDSVBIRVIyPXkKQ09ORklHX0NSWVBUT19IQVNI
PXkKQ09ORklHX0NSWVBUT19IQVNIMj15CkNPTkZJR19DUllQVE9fUk5HPXkKQ09ORklHX0NSWVBU
T19STkcyPXkKQ09ORklHX0NSWVBUT19STkdfREVGQVVMVD15CkNPTkZJR19DUllQVE9fQUtDSVBI
RVIyPXkKQ09ORklHX0NSWVBUT19BS0NJUEhFUj15CkNPTkZJR19DUllQVE9fS1BQMj15CkNPTkZJ
R19DUllQVE9fS1BQPXkKQ09ORklHX0NSWVBUT19BQ09NUDI9eQpDT05GSUdfQ1JZUFRPX01BTkFH
RVI9eQpDT05GSUdfQ1JZUFRPX01BTkFHRVIyPXkKIyBDT05GSUdfQ1JZUFRPX1VTRVIgaXMgbm90
IHNldApDT05GSUdfQ1JZUFRPX01BTkFHRVJfRElTQUJMRV9URVNUUz15CkNPTkZJR19DUllQVE9f
R0YxMjhNVUw9eQpDT05GSUdfQ1JZUFRPX05VTEw9eQpDT05GSUdfQ1JZUFRPX05VTEwyPXkKIyBD
T05GSUdfQ1JZUFRPX1BDUllQVCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19DUllQVEQgaXMg
bm90IHNldApDT05GSUdfQ1JZUFRPX0FVVEhFTkM9eQpDT05GSUdfQ1JZUFRPX1RFU1Q9bQoKIwoj
IFB1YmxpYy1rZXkgY3J5cHRvZ3JhcGh5CiMKQ09ORklHX0NSWVBUT19SU0E9eQojIENPTkZJR19D
UllQVE9fREggaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0VDQz15CkNPTkZJR19DUllQVE9fRUNE
SD15CiMgQ09ORklHX0NSWVBUT19FQ0RTQSBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19FQ1JE
U0EgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fU00yIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZ
UFRPX0NVUlZFMjU1MTkgaXMgbm90IHNldAoKIwojIEF1dGhlbnRpY2F0ZWQgRW5jcnlwdGlvbiB3
aXRoIEFzc29jaWF0ZWQgRGF0YQojCkNPTkZJR19DUllQVE9fQ0NNPXkKQ09ORklHX0NSWVBUT19H
Q009eQojIENPTkZJR19DUllQVE9fQ0hBQ0hBMjBQT0xZMTMwNSBpcyBub3Qgc2V0CiMgQ09ORklH
X0NSWVBUT19BRUdJUzEyOCBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fU0VRSVY9eQpDT05GSUdf
Q1JZUFRPX0VDSEFJTklWPXkKCiMKIyBCbG9jayBtb2RlcwojCkNPTkZJR19DUllQVE9fQ0JDPXkK
IyBDT05GSUdfQ1JZUFRPX0NGQiBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fQ1RSPXkKQ09ORklH
X0NSWVBUT19DVFM9eQpDT05GSUdfQ1JZUFRPX0VDQj15CiMgQ09ORklHX0NSWVBUT19MUlcgaXMg
bm90IHNldAojIENPTkZJR19DUllQVE9fT0ZCIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1BD
QkMgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX1hUUz15CiMgQ09ORklHX0NSWVBUT19LRVlXUkFQ
IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0FESUFOVFVNIGlzIG5vdCBzZXQKQ09ORklHX0NS
WVBUT19FU1NJVj15CgojCiMgSGFzaCBtb2RlcwojCkNPTkZJR19DUllQVE9fQ01BQz15CkNPTkZJ
R19DUllQVE9fSE1BQz15CkNPTkZJR19DUllQVE9fWENCQz1tCiMgQ09ORklHX0NSWVBUT19WTUFD
IGlzIG5vdCBzZXQKCiMKIyBEaWdlc3QKIwpDT05GSUdfQ1JZUFRPX0NSQzMyQz15CiMgQ09ORklH
X0NSWVBUT19DUkMzMiBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fWFhIQVNIPXkKQ09ORklHX0NS
WVBUT19CTEFLRTJCPXkKQ09ORklHX0NSWVBUT19DUkNUMTBESUY9bQpDT05GSUdfQ1JZUFRPX0dI
QVNIPXkKIyBDT05GSUdfQ1JZUFRPX1BPTFkxMzA1IGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19N
RDQ9eQpDT05GSUdfQ1JZUFRPX01ENT15CkNPTkZJR19DUllQVE9fTUlDSEFFTF9NSUM9eQojIENP
TkZJR19DUllQVE9fUk1EMTYwIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19TSEExPXkKQ09ORklH
X0NSWVBUT19TSEEyNTY9eQpDT05GSUdfQ1JZUFRPX1NIQTUxMj15CiMgQ09ORklHX0NSWVBUT19T
SEEzIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1NNMyBpcyBub3Qgc2V0CiMgQ09ORklHX0NS
WVBUT19TVFJFRUJPRyBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fV1A1MTI9bQoKIwojIENpcGhl
cnMKIwpDT05GSUdfQ1JZUFRPX0FFUz15CiMgQ09ORklHX0NSWVBUT19BRVNfVEkgaXMgbm90IHNl
dApDT05GSUdfQ1JZUFRPX0JMT1dGSVNIPW0KQ09ORklHX0NSWVBUT19CTE9XRklTSF9DT01NT049
bQpDT05GSUdfQ1JZUFRPX0NBTUVMTElBPW0KQ09ORklHX0NSWVBUT19DQVNUX0NPTU1PTj1tCkNP
TkZJR19DUllQVE9fQ0FTVDU9bQpDT05GSUdfQ1JZUFRPX0NBU1Q2PW0KQ09ORklHX0NSWVBUT19E
RVM9eQojIENPTkZJR19DUllQVE9fRkNSWVBUIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0NI
QUNIQTIwIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19TRVJQRU5UPW0KIyBDT05GSUdfQ1JZUFRP
X1NNNCBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fVFdPRklTSD1tCkNPTkZJR19DUllQVE9fVFdP
RklTSF9DT01NT049bQoKIwojIENvbXByZXNzaW9uCiMKQ09ORklHX0NSWVBUT19ERUZMQVRFPXkK
IyBDT05GSUdfQ1JZUFRPX0xaTyBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT184NDIgaXMgbm90
IHNldAojIENPTkZJR19DUllQVE9fTFo0IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0xaNEhD
IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1pTVEQgaXMgbm90IHNldAoKIwojIFJhbmRvbSBO
dW1iZXIgR2VuZXJhdGlvbgojCiMgQ09ORklHX0NSWVBUT19BTlNJX0NQUk5HIGlzIG5vdCBzZXQK
Q09ORklHX0NSWVBUT19EUkJHX01FTlU9eQpDT05GSUdfQ1JZUFRPX0RSQkdfSE1BQz15CiMgQ09O
RklHX0NSWVBUT19EUkJHX0hBU0ggaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fRFJCR19DVFIg
aXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0RSQkc9eQpDT05GSUdfQ1JZUFRPX0pJVFRFUkVOVFJP
UFk9eQpDT05GSUdfQ1JZUFRPX1VTRVJfQVBJPW0KQ09ORklHX0NSWVBUT19VU0VSX0FQSV9IQVNI
PW0KQ09ORklHX0NSWVBUT19VU0VSX0FQSV9TS0NJUEhFUj1tCkNPTkZJR19DUllQVE9fVVNFUl9B
UElfUk5HPW0KIyBDT05GSUdfQ1JZUFRPX1VTRVJfQVBJX1JOR19DQVZQIGlzIG5vdCBzZXQKQ09O
RklHX0NSWVBUT19VU0VSX0FQSV9BRUFEPW0KIyBDT05GSUdfQ1JZUFRPX1VTRVJfQVBJX0VOQUJM
RV9PQlNPTEVURSBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fSEFTSF9JTkZPPXkKQ09ORklHX0NS
WVBUT19IVz15CiMgQ09ORklHX0NSWVBUT19ERVZfQVRNRUxfRUNDIGlzIG5vdCBzZXQKIyBDT05G
SUdfQ1JZUFRPX0RFVl9BVE1FTF9TSEEyMDRBIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RF
Vl9DQ1AgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fREVWX05JVFJPWF9DTk41NVhYIGlzIG5v
dCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9DQVZJVU1fWklQIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q1JZUFRPX0RFVl9WSVJUSU8gaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fREVWX1NBRkVYQ0VM
IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9DQ1JFRSBpcyBub3Qgc2V0CiMgQ09ORklH
X0NSWVBUT19ERVZfSElTSV9TRUMgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fREVWX0FNTE9H
SUNfR1hMIGlzIG5vdCBzZXQKQ09ORklHX0FTWU1NRVRSSUNfS0VZX1RZUEU9eQpDT05GSUdfQVNZ
TU1FVFJJQ19QVUJMSUNfS0VZX1NVQlRZUEU9eQpDT05GSUdfWDUwOV9DRVJUSUZJQ0FURV9QQVJT
RVI9eQojIENPTkZJR19QS0NTOF9QUklWQVRFX0tFWV9QQVJTRVIgaXMgbm90IHNldApDT05GSUdf
UEtDUzdfTUVTU0FHRV9QQVJTRVI9eQojIENPTkZJR19QS0NTN19URVNUX0tFWSBpcyBub3Qgc2V0
CiMgQ09ORklHX1NJR05FRF9QRV9GSUxFX1ZFUklGSUNBVElPTiBpcyBub3Qgc2V0CgojCiMgQ2Vy
dGlmaWNhdGVzIGZvciBzaWduYXR1cmUgY2hlY2tpbmcKIwpDT05GSUdfU1lTVEVNX1RSVVNURURf
S0VZUklORz15CkNPTkZJR19TWVNURU1fVFJVU1RFRF9LRVlTPSIiCiMgQ09ORklHX1NZU1RFTV9F
WFRSQV9DRVJUSUZJQ0FURSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFQ09OREFSWV9UUlVTVEVEX0tF
WVJJTkcgaXMgbm90IHNldAojIENPTkZJR19TWVNURU1fQkxBQ0tMSVNUX0tFWVJJTkcgaXMgbm90
IHNldAojIGVuZCBvZiBDZXJ0aWZpY2F0ZXMgZm9yIHNpZ25hdHVyZSBjaGVja2luZwoKQ09ORklH
X0JJTkFSWV9QUklOVEY9eQoKIwojIExpYnJhcnkgcm91dGluZXMKIwpDT05GSUdfUkFJRDZfUFE9
eQpDT05GSUdfUkFJRDZfUFFfQkVOQ0hNQVJLPXkKQ09ORklHX0xJTkVBUl9SQU5HRVM9eQojIENP
TkZJR19QQUNLSU5HIGlzIG5vdCBzZXQKQ09ORklHX0JJVFJFVkVSU0U9eQpDT05GSUdfSEFWRV9B
UkNIX0JJVFJFVkVSU0U9eQpDT05GSUdfR0VORVJJQ19TVFJOQ1BZX0ZST01fVVNFUj15CkNPTkZJ
R19HRU5FUklDX1NUUk5MRU5fVVNFUj15CkNPTkZJR19HRU5FUklDX05FVF9VVElMUz15CkNPTkZJ
R19HRU5FUklDX0ZJTkRfRklSU1RfQklUPXkKQ09ORklHX0NPUkRJQz1tCiMgQ09ORklHX1BSSU1F
X05VTUJFUlMgaXMgbm90IHNldApDT05GSUdfUkFUSU9OQUw9eQpDT05GSUdfR0VORVJJQ19QQ0lf
SU9NQVA9eQpDT05GSUdfQVJDSF9VU0VfQ01QWENIR19MT0NLUkVGPXkKQ09ORklHX0FSQ0hfSEFT
X0ZBU1RfTVVMVElQTElFUj15CkNPTkZJR19BUkNIX1VTRV9TWU1fQU5OT1RBVElPTlM9eQojIENP
TkZJR19JTkRJUkVDVF9QSU8gaXMgbm90IHNldAoKIwojIENyeXB0byBsaWJyYXJ5IHJvdXRpbmVz
CiMKQ09ORklHX0NSWVBUT19MSUJfQUVTPXkKQ09ORklHX0NSWVBUT19MSUJfQVJDND15CkNPTkZJ
R19DUllQVE9fTElCX0JMQUtFMlNfR0VORVJJQz15CiMgQ09ORklHX0NSWVBUT19MSUJfQ0hBQ0hB
IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0xJQl9DVVJWRTI1NTE5IGlzIG5vdCBzZXQKQ09O
RklHX0NSWVBUT19MSUJfREVTPXkKQ09ORklHX0NSWVBUT19MSUJfUE9MWTEzMDVfUlNJWkU9OQoj
IENPTkZJR19DUllQVE9fTElCX1BPTFkxMzA1IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0xJ
Ql9DSEFDSEEyMFBPTFkxMzA1IGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19MSUJfU0hBMjU2PXkK
IyBlbmQgb2YgQ3J5cHRvIGxpYnJhcnkgcm91dGluZXMKCkNPTkZJR19MSUJfTUVNTkVRPXkKQ09O
RklHX0NSQ19DQ0lUVD1tCkNPTkZJR19DUkMxNj15CkNPTkZJR19DUkNfVDEwRElGPW0KQ09ORklH
X0NSQ19JVFVfVD15CkNPTkZJR19DUkMzMj15CiMgQ09ORklHX0NSQzMyX1NFTEZURVNUIGlzIG5v
dCBzZXQKQ09ORklHX0NSQzMyX1NMSUNFQlk4PXkKIyBDT05GSUdfQ1JDMzJfU0xJQ0VCWTQgaXMg
bm90IHNldAojIENPTkZJR19DUkMzMl9TQVJXQVRFIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JDMzJf
QklUIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JDNjQgaXMgbm90IHNldAojIENPTkZJR19DUkM0IGlz
IG5vdCBzZXQKQ09ORklHX0NSQzc9bQpDT05GSUdfTElCQ1JDMzJDPXkKQ09ORklHX0NSQzg9bQpD
T05GSUdfWFhIQVNIPXkKQ09ORklHX0FVRElUX0FSQ0hfQ09NUEFUX0dFTkVSSUM9eQojIENPTkZJ
R19SQU5ET00zMl9TRUxGVEVTVCBpcyBub3Qgc2V0CkNPTkZJR19aTElCX0lORkxBVEU9eQpDT05G
SUdfWkxJQl9ERUZMQVRFPXkKQ09ORklHX0xaT19DT01QUkVTUz15CkNPTkZJR19MWk9fREVDT01Q
UkVTUz15CkNPTkZJR19MWjRfREVDT01QUkVTUz15CkNPTkZJR19aU1REX0NPTVBSRVNTPXkKQ09O
RklHX1pTVERfREVDT01QUkVTUz15CkNPTkZJR19YWl9ERUM9eQpDT05GSUdfWFpfREVDX1g4Nj15
CkNPTkZJR19YWl9ERUNfUE9XRVJQQz15CkNPTkZJR19YWl9ERUNfSUE2ND15CkNPTkZJR19YWl9E
RUNfQVJNPXkKQ09ORklHX1haX0RFQ19BUk1USFVNQj15CkNPTkZJR19YWl9ERUNfU1BBUkM9eQpD
T05GSUdfWFpfREVDX0JDSj15CiMgQ09ORklHX1haX0RFQ19URVNUIGlzIG5vdCBzZXQKQ09ORklH
X0RFQ09NUFJFU1NfR1pJUD15CkNPTkZJR19ERUNPTVBSRVNTX0JaSVAyPXkKQ09ORklHX0RFQ09N
UFJFU1NfTFpNQT15CkNPTkZJR19ERUNPTVBSRVNTX1haPXkKQ09ORklHX0RFQ09NUFJFU1NfTFpP
PXkKQ09ORklHX0RFQ09NUFJFU1NfTFo0PXkKQ09ORklHX0RFQ09NUFJFU1NfWlNURD15CkNPTkZJ
R19HRU5FUklDX0FMTE9DQVRPUj15CkNPTkZJR19URVhUU0VBUkNIPXkKQ09ORklHX1RFWFRTRUFS
Q0hfS01QPW0KQ09ORklHX1RFWFRTRUFSQ0hfQk09bQpDT05GSUdfVEVYVFNFQVJDSF9GU009bQpD
T05GSUdfQlRSRUU9eQpDT05GSUdfSU5URVJWQUxfVFJFRT15CkNPTkZJR19BU1NPQ0lBVElWRV9B
UlJBWT15CkNPTkZJR19IQVNfSU9NRU09eQpDT05GSUdfSEFTX0lPUE9SVF9NQVA9eQpDT05GSUdf
SEFTX0RNQT15CkNPTkZJR19ETUFfT1BTPXkKQ09ORklHX05FRURfU0dfRE1BX0xFTkdUSD15CkNP
TkZJR19ORUVEX0RNQV9NQVBfU1RBVEU9eQpDT05GSUdfQVJDSF9ETUFfQUREUl9UXzY0QklUPXkK
Q09ORklHX0RNQV9ERUNMQVJFX0NPSEVSRU5UPXkKQ09ORklHX0FSQ0hfSEFTX1NFVFVQX0RNQV9P
UFM9eQpDT05GSUdfQVJDSF9IQVNfVEVBUkRPV05fRE1BX09QUz15CkNPTkZJR19BUkNIX0hBU19T
WU5DX0RNQV9GT1JfREVWSUNFPXkKQ09ORklHX0FSQ0hfSEFTX1NZTkNfRE1BX0ZPUl9DUFU9eQpD
T05GSUdfQVJDSF9IQVNfRE1BX1BSRVBfQ09IRVJFTlQ9eQpDT05GSUdfU1dJT1RMQj15CiMgQ09O
RklHX0RNQV9SRVNUUklDVEVEX1BPT0wgaXMgbm90IHNldApDT05GSUdfRE1BX05PTkNPSEVSRU5U
X01NQVA9eQpDT05GSUdfRE1BX0NPSEVSRU5UX1BPT0w9eQpDT05GSUdfRE1BX1JFTUFQPXkKQ09O
RklHX0RNQV9ESVJFQ1RfUkVNQVA9eQpDT05GSUdfRE1BX0NNQT15CiMgQ09ORklHX0RNQV9QRVJO
VU1BX0NNQSBpcyBub3Qgc2V0CgojCiMgRGVmYXVsdCBjb250aWd1b3VzIG1lbW9yeSBhcmVhIHNp
emU6CiMKQ09ORklHX0NNQV9TSVpFX01CWVRFUz0xNgpDT05GSUdfQ01BX1NJWkVfU0VMX01CWVRF
Uz15CiMgQ09ORklHX0NNQV9TSVpFX1NFTF9QRVJDRU5UQUdFIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q01BX1NJWkVfU0VMX01JTiBpcyBub3Qgc2V0CiMgQ09ORklHX0NNQV9TSVpFX1NFTF9NQVggaXMg
bm90IHNldApDT05GSUdfQ01BX0FMSUdOTUVOVD04CiMgQ09ORklHX0RNQV9BUElfREVCVUcgaXMg
bm90IHNldAojIENPTkZJR19ETUFfTUFQX0JFTkNITUFSSyBpcyBub3Qgc2V0CkNPTkZJR19TR0xf
QUxMT0M9eQpDT05GSUdfQ1BVX1JNQVA9eQpDT05GSUdfRFFMPXkKQ09ORklHX0dMT0I9eQojIENP
TkZJR19HTE9CX1NFTEZURVNUIGlzIG5vdCBzZXQKQ09ORklHX05MQVRUUj15CkNPTkZJR19DTFpf
VEFCPXkKIyBDT05GSUdfSVJRX1BPTEwgaXMgbm90IHNldApDT05GSUdfTVBJTElCPXkKQ09ORklH
X0RJTUxJQj15CkNPTkZJR19MSUJGRFQ9eQpDT05GSUdfT0lEX1JFR0lTVFJZPXkKQ09ORklHX1VD
UzJfU1RSSU5HPXkKQ09ORklHX0hBVkVfR0VORVJJQ19WRFNPPXkKQ09ORklHX0dFTkVSSUNfR0VU
VElNRU9GREFZPXkKQ09ORklHX0dFTkVSSUNfVkRTT19USU1FX05TPXkKQ09ORklHX0ZPTlRfU1VQ
UE9SVD15CiMgQ09ORklHX0ZPTlRTIGlzIG5vdCBzZXQKQ09ORklHX0ZPTlRfOHg4PXkKQ09ORklH
X0ZPTlRfOHgxNj15CkNPTkZJR19TR19QT09MPXkKQ09ORklHX0FSQ0hfU1RBQ0tXQUxLPXkKQ09O
RklHX1NCSVRNQVA9eQojIGVuZCBvZiBMaWJyYXJ5IHJvdXRpbmVzCgpDT05GSUdfR0VORVJJQ19M
SUJfREVWTUVNX0lTX0FMTE9XRUQ9eQoKIwojIEtlcm5lbCBoYWNraW5nCiMKCiMKIyBwcmludGsg
YW5kIGRtZXNnIG9wdGlvbnMKIwojIENPTkZJR19QUklOVEtfVElNRSBpcyBub3Qgc2V0CiMgQ09O
RklHX1BSSU5US19DQUxMRVIgaXMgbm90IHNldAojIENPTkZJR19TVEFDS1RSQUNFX0JVSUxEX0lE
IGlzIG5vdCBzZXQKQ09ORklHX0NPTlNPTEVfTE9HTEVWRUxfREVGQVVMVD03CkNPTkZJR19DT05T
T0xFX0xPR0xFVkVMX1FVSUVUPTQKQ09ORklHX01FU1NBR0VfTE9HTEVWRUxfREVGQVVMVD00CiMg
Q09ORklHX0JPT1RfUFJJTlRLX0RFTEFZIGlzIG5vdCBzZXQKIyBDT05GSUdfRFlOQU1JQ19ERUJV
RyBpcyBub3Qgc2V0CiMgQ09ORklHX0RZTkFNSUNfREVCVUdfQ09SRSBpcyBub3Qgc2V0CkNPTkZJ
R19TWU1CT0xJQ19FUlJOQU1FPXkKQ09ORklHX0RFQlVHX0JVR1ZFUkJPU0U9eQojIGVuZCBvZiBw
cmludGsgYW5kIGRtZXNnIG9wdGlvbnMKCiMKIyBDb21waWxlLXRpbWUgY2hlY2tzIGFuZCBjb21w
aWxlciBvcHRpb25zCiMKQ09ORklHX0RFQlVHX0lORk89eQojIENPTkZJR19ERUJVR19JTkZPX1JF
RFVDRUQgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19JTkZPX0NPTVBSRVNTRUQgaXMgbm90IHNl
dAojIENPTkZJR19ERUJVR19JTkZPX1NQTElUIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX0lORk9f
RFdBUkZfVE9PTENIQUlOX0RFRkFVTFQ9eQojIENPTkZJR19ERUJVR19JTkZPX0RXQVJGNCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0RFQlVHX0lORk9fRFdBUkY1IGlzIG5vdCBzZXQKIyBDT05GSUdfREVC
VUdfSU5GT19CVEYgaXMgbm90IHNldAojIENPTkZJR19HREJfU0NSSVBUUyBpcyBub3Qgc2V0CkNP
TkZJR19GUkFNRV9XQVJOPTIwNDgKIyBDT05GSUdfU1RSSVBfQVNNX1NZTVMgaXMgbm90IHNldAoj
IENPTkZJR19SRUFEQUJMRV9BU00gaXMgbm90IHNldAojIENPTkZJR19IRUFERVJTX0lOU1RBTEwg
aXMgbm90IHNldAojIENPTkZJR19ERUJVR19TRUNUSU9OX01JU01BVENIIGlzIG5vdCBzZXQKQ09O
RklHX1NFQ1RJT05fTUlTTUFUQ0hfV0FSTl9PTkxZPXkKIyBDT05GSUdfREVCVUdfRk9SQ0VfRlVO
Q1RJT05fQUxJR05fNjRCIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfV0FOVF9GUkFNRV9QT0lOVEVS
Uz15CkNPTkZJR19GUkFNRV9QT0lOVEVSPXkKIyBDT05GSUdfVk1MSU5VWF9NQVAgaXMgbm90IHNl
dAojIENPTkZJR19ERUJVR19GT1JDRV9XRUFLX1BFUl9DUFUgaXMgbm90IHNldAojIGVuZCBvZiBD
b21waWxlLXRpbWUgY2hlY2tzIGFuZCBjb21waWxlciBvcHRpb25zCgojCiMgR2VuZXJpYyBLZXJu
ZWwgRGVidWdnaW5nIEluc3RydW1lbnRzCiMKQ09ORklHX01BR0lDX1NZU1JRPXkKQ09ORklHX01B
R0lDX1NZU1JRX0RFRkFVTFRfRU5BQkxFPTB4MQpDT05GSUdfTUFHSUNfU1lTUlFfU0VSSUFMPXkK
Q09ORklHX01BR0lDX1NZU1JRX1NFUklBTF9TRVFVRU5DRT0iIgpDT05GSUdfREVCVUdfRlM9eQpD
T05GSUdfREVCVUdfRlNfQUxMT1dfQUxMPXkKIyBDT05GSUdfREVCVUdfRlNfRElTQUxMT1dfTU9V
TlQgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19GU19BTExPV19OT05FIGlzIG5vdCBzZXQKQ09O
RklHX0hBVkVfQVJDSF9LR0RCPXkKQ09ORklHX0tHREI9eQpDT05GSUdfS0dEQl9IT05PVVJfQkxP
Q0tMSVNUPXkKQ09ORklHX0tHREJfU0VSSUFMX0NPTlNPTEU9eQojIENPTkZJR19LR0RCX1RFU1RT
IGlzIG5vdCBzZXQKQ09ORklHX0tHREJfS0RCPXkKQ09ORklHX0tEQl9ERUZBVUxUX0VOQUJMRT0w
eDEKIyBDT05GSUdfS0RCX0tFWUJPQVJEIGlzIG5vdCBzZXQKQ09ORklHX0tEQl9DT05USU5VRV9D
QVRBU1RST1BISUM9MApDT05GSUdfQVJDSF9IQVNfVUJTQU5fU0FOSVRJWkVfQUxMPXkKIyBDT05G
SUdfVUJTQU4gaXMgbm90IHNldApDT05GSUdfSEFWRV9LQ1NBTl9DT01QSUxFUj15CiMgZW5kIG9m
IEdlbmVyaWMgS2VybmVsIERlYnVnZ2luZyBJbnN0cnVtZW50cwoKQ09ORklHX0RFQlVHX0tFUk5F
TD15CkNPTkZJR19ERUJVR19NSVNDPXkKCiMKIyBNZW1vcnkgRGVidWdnaW5nCiMKIyBDT05GSUdf
UEFHRV9FWFRFTlNJT04gaXMgbm90IHNldAojIENPTkZJR19ERUJVR19QQUdFQUxMT0MgaXMgbm90
IHNldAojIENPTkZJR19QQUdFX09XTkVSIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFHRV9QT0lTT05J
TkcgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19QQUdFX1JFRiBpcyBub3Qgc2V0CiMgQ09ORklH
X0RFQlVHX1JPREFUQV9URVNUIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfSEFTX0RFQlVHX1dYPXkK
IyBDT05GSUdfREVCVUdfV1ggaXMgbm90IHNldApDT05GSUdfR0VORVJJQ19QVERVTVA9eQojIENP
TkZJR19QVERVTVBfREVCVUdGUyBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX09CSkVDVFMgaXMg
bm90IHNldAojIENPTkZJR19TTFVCX0RFQlVHX09OIGlzIG5vdCBzZXQKIyBDT05GSUdfU0xVQl9T
VEFUUyBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0RFQlVHX0tNRU1MRUFLPXkKIyBDT05GSUdfREVC
VUdfS01FTUxFQUsgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19TVEFDS19VU0FHRSBpcyBub3Qg
c2V0CiMgQ09ORklHX1NDSEVEX1NUQUNLX0VORF9DSEVDSyBpcyBub3Qgc2V0CkNPTkZJR19BUkNI
X0hBU19ERUJVR19WTV9QR1RBQkxFPXkKIyBDT05GSUdfREVCVUdfVk0gaXMgbm90IHNldAojIENP
TkZJR19ERUJVR19WTV9QR1RBQkxFIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfSEFTX0RFQlVHX1ZJ
UlRVQUw9eQojIENPTkZJR19ERUJVR19WSVJUVUFMIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdf
TUVNT1JZX0lOSVQgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19QRVJfQ1BVX01BUFMgaXMgbm90
IHNldApDT05GSUdfSEFWRV9BUkNIX0tBU0FOPXkKQ09ORklHX0hBVkVfQVJDSF9LQVNBTl9TV19U
QUdTPXkKQ09ORklHX0hBVkVfQVJDSF9LQVNBTl9IV19UQUdTPXkKQ09ORklHX0hBVkVfQVJDSF9L
QVNBTl9WTUFMTE9DPXkKQ09ORklHX0NDX0hBU19LQVNBTl9HRU5FUklDPXkKQ09ORklHX0NDX0hB
U19LQVNBTl9TV19UQUdTPXkKQ09ORklHX0NDX0hBU19XT1JLSU5HX05PU0FOSVRJWkVfQUREUkVT
Uz15CiMgQ09ORklHX0tBU0FOIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfQVJDSF9LRkVOQ0U9eQpD
T05GSUdfS0ZFTkNFPXkKQ09ORklHX0tGRU5DRV9TQU1QTEVfSU5URVJWQUw9MTAwCkNPTkZJR19L
RkVOQ0VfTlVNX09CSkVDVFM9MjU1CkNPTkZJR19LRkVOQ0VfU1RSRVNTX1RFU1RfRkFVTFRTPTAK
IyBlbmQgb2YgTWVtb3J5IERlYnVnZ2luZwoKIyBDT05GSUdfREVCVUdfU0hJUlEgaXMgbm90IHNl
dAoKIwojIERlYnVnIE9vcHMsIExvY2t1cHMgYW5kIEhhbmdzCiMKIyBDT05GSUdfUEFOSUNfT05f
T09QUyBpcyBub3Qgc2V0CkNPTkZJR19QQU5JQ19PTl9PT1BTX1ZBTFVFPTAKQ09ORklHX1BBTklD
X1RJTUVPVVQ9MAojIENPTkZJR19TT0ZUTE9DS1VQX0RFVEVDVE9SIGlzIG5vdCBzZXQKIyBDT05G
SUdfREVURUNUX0hVTkdfVEFTSyBpcyBub3Qgc2V0CiMgQ09ORklHX1dRX1dBVENIRE9HIGlzIG5v
dCBzZXQKIyBDT05GSUdfVEVTVF9MT0NLVVAgaXMgbm90IHNldAojIGVuZCBvZiBEZWJ1ZyBPb3Bz
LCBMb2NrdXBzIGFuZCBIYW5ncwoKIwojIFNjaGVkdWxlciBEZWJ1Z2dpbmcKIwpDT05GSUdfU0NI
RURfREVCVUc9eQpDT05GSUdfU0NIRURfSU5GTz15CkNPTkZJR19TQ0hFRFNUQVRTPXkKIyBlbmQg
b2YgU2NoZWR1bGVyIERlYnVnZ2luZwoKIyBDT05GSUdfREVCVUdfVElNRUtFRVBJTkcgaXMgbm90
IHNldApDT05GSUdfREVCVUdfUFJFRU1QVD15CgojCiMgTG9jayBEZWJ1Z2dpbmcgKHNwaW5sb2Nr
cywgbXV0ZXhlcywgZXRjLi4uKQojCkNPTkZJR19MT0NLX0RFQlVHR0lOR19TVVBQT1JUPXkKIyBD
T05GSUdfUFJPVkVfTE9DS0lORyBpcyBub3Qgc2V0CiMgQ09ORklHX0xPQ0tfU1RBVCBpcyBub3Qg
c2V0CiMgQ09ORklHX0RFQlVHX1JUX01VVEVYRVMgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19T
UElOTE9DSyBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX01VVEVYRVMgaXMgbm90IHNldAojIENP
TkZJR19ERUJVR19XV19NVVRFWF9TTE9XUEFUSCBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX1JX
U0VNUyBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX0xPQ0tfQUxMT0MgaXMgbm90IHNldAojIENP
TkZJR19ERUJVR19BVE9NSUNfU0xFRVAgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19MT0NLSU5H
X0FQSV9TRUxGVEVTVFMgaXMgbm90IHNldAojIENPTkZJR19MT0NLX1RPUlRVUkVfVEVTVCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1dXX01VVEVYX1NFTEZURVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NG
X1RPUlRVUkVfVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX0NTRF9MT0NLX1dBSVRfREVCVUcgaXMg
bm90IHNldAojIGVuZCBvZiBMb2NrIERlYnVnZ2luZyAoc3BpbmxvY2tzLCBtdXRleGVzLCBldGMu
Li4pCgojIENPTkZJR19ERUJVR19JUlFGTEFHUyBpcyBub3Qgc2V0CkNPTkZJR19TVEFDS1RSQUNF
PXkKIyBDT05GSUdfV0FSTl9BTExfVU5TRUVERURfUkFORE9NIGlzIG5vdCBzZXQKIyBDT05GSUdf
REVCVUdfS09CSkVDVCBpcyBub3Qgc2V0CgojCiMgRGVidWcga2VybmVsIGRhdGEgc3RydWN0dXJl
cwojCiMgQ09ORklHX0RFQlVHX0xJU1QgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19QTElTVCBp
cyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX1NHIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfTk9U
SUZJRVJTIGlzIG5vdCBzZXQKIyBDT05GSUdfQlVHX09OX0RBVEFfQ09SUlVQVElPTiBpcyBub3Qg
c2V0CiMgZW5kIG9mIERlYnVnIGtlcm5lbCBkYXRhIHN0cnVjdHVyZXMKCiMgQ09ORklHX0RFQlVH
X0NSRURFTlRJQUxTIGlzIG5vdCBzZXQKCiMKIyBSQ1UgRGVidWdnaW5nCiMKIyBDT05GSUdfUkNV
X1NDQUxFX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19SQ1VfVE9SVFVSRV9URVNUIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUkNVX1JFRl9TQ0FMRV9URVNUIGlzIG5vdCBzZXQKQ09ORklHX1JDVV9DUFVf
U1RBTExfVElNRU9VVD0yMQpDT05GSUdfUkNVX1RSQUNFPXkKIyBDT05GSUdfUkNVX0VRU19ERUJV
RyBpcyBub3Qgc2V0CiMgZW5kIG9mIFJDVSBEZWJ1Z2dpbmcKCiMgQ09ORklHX0RFQlVHX1dRX0ZP
UkNFX1JSX0NQVSBpcyBub3Qgc2V0CiMgQ09ORklHX0NQVV9IT1RQTFVHX1NUQVRFX0NPTlRST0wg
aXMgbm90IHNldApDT05GSUdfTEFURU5DWVRPUD15CkNPTkZJR19OT1BfVFJBQ0VSPXkKQ09ORklH
X0hBVkVfRlVOQ1RJT05fVFJBQ0VSPXkKQ09ORklHX0hBVkVfRlVOQ1RJT05fR1JBUEhfVFJBQ0VS
PXkKQ09ORklHX0hBVkVfRFlOQU1JQ19GVFJBQ0U9eQpDT05GSUdfSEFWRV9EWU5BTUlDX0ZUUkFD
RV9XSVRIX1JFR1M9eQpDT05GSUdfSEFWRV9GVFJBQ0VfTUNPVU5UX1JFQ09SRD15CkNPTkZJR19I
QVZFX1NZU0NBTExfVFJBQ0VQT0lOVFM9eQpDT05GSUdfSEFWRV9DX1JFQ09SRE1DT1VOVD15CkNP
TkZJR19UUkFDRV9DTE9DSz15CkNPTkZJR19SSU5HX0JVRkZFUj15CkNPTkZJR19FVkVOVF9UUkFD
SU5HPXkKQ09ORklHX0NPTlRFWFRfU1dJVENIX1RSQUNFUj15CkNPTkZJR19UUkFDSU5HPXkKQ09O
RklHX0dFTkVSSUNfVFJBQ0VSPXkKQ09ORklHX1RSQUNJTkdfU1VQUE9SVD15CkNPTkZJR19GVFJB
Q0U9eQojIENPTkZJR19CT09UVElNRV9UUkFDSU5HIGlzIG5vdCBzZXQKQ09ORklHX0ZVTkNUSU9O
X1RSQUNFUj15CkNPTkZJR19GVU5DVElPTl9HUkFQSF9UUkFDRVI9eQpDT05GSUdfRFlOQU1JQ19G
VFJBQ0U9eQpDT05GSUdfRFlOQU1JQ19GVFJBQ0VfV0lUSF9SRUdTPXkKIyBDT05GSUdfRlVOQ1RJ
T05fUFJPRklMRVIgaXMgbm90IHNldAojIENPTkZJR19TVEFDS19UUkFDRVIgaXMgbm90IHNldAoj
IENPTkZJR19JUlFTT0ZGX1RSQUNFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1BSRUVNUFRfVFJBQ0VS
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0NIRURfVFJBQ0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfSFdM
QVRfVFJBQ0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfT1NOT0lTRV9UUkFDRVIgaXMgbm90IHNldAoj
IENPTkZJR19USU1FUkxBVF9UUkFDRVIgaXMgbm90IHNldApDT05GSUdfRlRSQUNFX1NZU0NBTExT
PXkKIyBDT05GSUdfVFJBQ0VSX1NOQVBTSE9UIGlzIG5vdCBzZXQKQ09ORklHX0JSQU5DSF9QUk9G
SUxFX05PTkU9eQojIENPTkZJR19QUk9GSUxFX0FOTk9UQVRFRF9CUkFOQ0hFUyBpcyBub3Qgc2V0
CiMgQ09ORklHX1BST0ZJTEVfQUxMX0JSQU5DSEVTIGlzIG5vdCBzZXQKQ09ORklHX0JMS19ERVZf
SU9fVFJBQ0U9eQpDT05GSUdfS1BST0JFX0VWRU5UUz15CiMgQ09ORklHX0tQUk9CRV9FVkVOVFNf
T05fTk9UUkFDRSBpcyBub3Qgc2V0CkNPTkZJR19VUFJPQkVfRVZFTlRTPXkKQ09ORklHX0JQRl9F
VkVOVFM9eQpDT05GSUdfRFlOQU1JQ19FVkVOVFM9eQpDT05GSUdfUFJPQkVfRVZFTlRTPXkKIyBD
T05GSUdfQlBGX0tQUk9CRV9PVkVSUklERSBpcyBub3Qgc2V0CkNPTkZJR19GVFJBQ0VfTUNPVU5U
X1JFQ09SRD15CkNPTkZJR19GVFJBQ0VfTUNPVU5UX1VTRV9QQVRDSEFCTEVfRlVOQ1RJT05fRU5U
Ulk9eQojIENPTkZJR19TWU5USF9FVkVOVFMgaXMgbm90IHNldAojIENPTkZJR19ISVNUX1RSSUdH
RVJTIGlzIG5vdCBzZXQKIyBDT05GSUdfVFJBQ0VfRVZFTlRfSU5KRUNUIGlzIG5vdCBzZXQKIyBD
T05GSUdfVFJBQ0VQT0lOVF9CRU5DSE1BUksgaXMgbm90IHNldAojIENPTkZJR19SSU5HX0JVRkZF
Ul9CRU5DSE1BUksgaXMgbm90IHNldAojIENPTkZJR19UUkFDRV9FVkFMX01BUF9GSUxFIGlzIG5v
dCBzZXQKIyBDT05GSUdfRlRSQUNFX1JFQ09SRF9SRUNVUlNJT04gaXMgbm90IHNldAojIENPTkZJ
R19GVFJBQ0VfU1RBUlRVUF9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfUklOR19CVUZGRVJfU1RB
UlRVUF9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfUklOR19CVUZGRVJfVkFMSURBVEVfVElNRV9E
RUxUQVMgaXMgbm90IHNldAojIENPTkZJR19QUkVFTVBUSVJRX0RFTEFZX1RFU1QgaXMgbm90IHNl
dAojIENPTkZJR19LUFJPQkVfRVZFTlRfR0VOX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19TQU1Q
TEVTIGlzIG5vdCBzZXQKQ09ORklHX1NUUklDVF9ERVZNRU09eQojIENPTkZJR19JT19TVFJJQ1Rf
REVWTUVNIGlzIG5vdCBzZXQKCiMKIyBhcm02NCBEZWJ1Z2dpbmcKIwojIENPTkZJR19QSURfSU5f
Q09OVEVYVElEUiBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX0VGSSBpcyBub3Qgc2V0CiMgQ09O
RklHX0FSTTY0X1JFTE9DX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19DT1JFU0lHSFQgaXMgbm90
IHNldAojIGVuZCBvZiBhcm02NCBEZWJ1Z2dpbmcKCiMKIyBLZXJuZWwgVGVzdGluZyBhbmQgQ292
ZXJhZ2UKIwojIENPTkZJR19LVU5JVCBpcyBub3Qgc2V0CiMgQ09ORklHX05PVElGSUVSX0VSUk9S
X0lOSkVDVElPTiBpcyBub3Qgc2V0CkNPTkZJR19GVU5DVElPTl9FUlJPUl9JTkpFQ1RJT049eQoj
IENPTkZJR19GQVVMVF9JTkpFQ1RJT04gaXMgbm90IHNldApDT05GSUdfQVJDSF9IQVNfS0NPVj15
CkNPTkZJR19DQ19IQVNfU0FOQ09WX1RSQUNFX1BDPXkKIyBDT05GSUdfS0NPViBpcyBub3Qgc2V0
CkNPTkZJR19SVU5USU1FX1RFU1RJTkdfTUVOVT15CiMgQ09ORklHX0xLRFRNIGlzIG5vdCBzZXQK
IyBDT05GSUdfVEVTVF9NSU5fSEVBUCBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfRElWNjQgaXMg
bm90IHNldAojIENPTkZJR19LUFJPQkVTX1NBTklUWV9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdf
QkFDS1RSQUNFX1NFTEZfVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1JCVFJFRV9URVNUIGlzIG5v
dCBzZXQKIyBDT05GSUdfUkVFRF9TT0xPTU9OX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19JTlRF
UlZBTF9UUkVFX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19QRVJDUFVfVEVTVCBpcyBub3Qgc2V0
CiMgQ09ORklHX0FUT01JQzY0X1NFTEZURVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfQVNZTkNfUkFJ
RDZfVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfSEVYRFVNUCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NUUklOR19TRUxGVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfU1RSSU5HX0hFTFBF
UlMgaXMgbm90IHNldAojIENPTkZJR19URVNUX1NUUlNDUFkgaXMgbm90IHNldAojIENPTkZJR19U
RVNUX0tTVFJUT1ggaXMgbm90IHNldAojIENPTkZJR19URVNUX1BSSU5URiBpcyBub3Qgc2V0CiMg
Q09ORklHX1RFU1RfU0NBTkYgaXMgbm90IHNldAojIENPTkZJR19URVNUX0JJVE1BUCBpcyBub3Qg
c2V0CiMgQ09ORklHX1RFU1RfVVVJRCBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfWEFSUkFZIGlz
IG5vdCBzZXQKIyBDT05GSUdfVEVTVF9PVkVSRkxPVyBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1Rf
UkhBU0hUQUJMRSBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfSEFTSCBpcyBub3Qgc2V0CiMgQ09O
RklHX1RFU1RfSURBIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9MS00gaXMgbm90IHNldAojIENP
TkZJR19URVNUX0JJVE9QUyBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfVk1BTExPQyBpcyBub3Qg
c2V0CiMgQ09ORklHX1RFU1RfVVNFUl9DT1BZIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9CUEYg
aXMgbm90IHNldAojIENPTkZJR19URVNUX0JMQUNLSE9MRV9ERVYgaXMgbm90IHNldAojIENPTkZJ
R19GSU5EX0JJVF9CRU5DSE1BUksgaXMgbm90IHNldAojIENPTkZJR19URVNUX0ZJUk1XQVJFIGlz
IG5vdCBzZXQKIyBDT05GSUdfVEVTVF9TWVNDVEwgaXMgbm90IHNldAojIENPTkZJR19URVNUX1VE
RUxBWSBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfU1RBVElDX0tFWVMgaXMgbm90IHNldAojIENP
TkZJR19URVNUX0tNT0QgaXMgbm90IHNldAojIENPTkZJR19URVNUX01FTUNBVF9QIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVEVTVF9TVEFDS0lOSVQgaXMgbm90IHNldAojIENPTkZJR19URVNUX01FTUlO
SVQgaXMgbm90IHNldAojIENPTkZJR19URVNUX0ZSRUVfUEFHRVMgaXMgbm90IHNldApDT05GSUdf
QVJDSF9VU0VfTUVNVEVTVD15CiMgQ09ORklHX01FTVRFU1QgaXMgbm90IHNldAojIGVuZCBvZiBL
ZXJuZWwgVGVzdGluZyBhbmQgQ292ZXJhZ2UKIyBlbmQgb2YgS2VybmVsIGhhY2tpbmcK
--00000000000054191f05edff84e8--

