Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 805A561F09B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 11:28:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439234.693256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orzLh-0004uP-LZ; Mon, 07 Nov 2022 10:27:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439234.693256; Mon, 07 Nov 2022 10:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orzLh-0004rv-HW; Mon, 07 Nov 2022 10:27:25 +0000
Received: by outflank-mailman (input) for mailman id 439234;
 Mon, 07 Nov 2022 10:27:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UELb=3H=gmail.com=vsuneja63@srs-se1.protection.inumbo.net>)
 id 1orzLe-0004rZ-Sw
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 10:27:23 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2290443-5e86-11ed-8fd1-01056ac49cbb;
 Mon, 07 Nov 2022 11:27:19 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id k2so28816959ejr.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Nov 2022 02:27:19 -0800 (PST)
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
X-Inumbo-ID: c2290443-5e86-11ed-8fd1-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bAddvVPDdRyLZnrfKB95HbgXsc3hKMehb9lipqYbdss=;
        b=bRRJIIcox7PI4Ipb5+zAk7fcHHWWeeBlvaGVhrmQVjJRxmgVm28+NZaiZm91QYkWI0
         jzwbSae334AQg1jN08Psok0y9pGS2yu/nchtpocbL0vIlWjAkvA2fDQjv8itpNbNXE+o
         V2C7PpLNyRvRq9Z3GRf520bM0bFtSfp3QssPwEBBN8xdUMxWwTiPGdd8CF+BGUCH9/Xo
         5W2YNCdWRzzipbqNoR/jP7YaAtokW+GcGbZ7aSHAIXYxDP4pehyc+MlG1JhX0xJpnMgk
         uvUqzc63/xybpQCiJJEcBi5z65yDZasiLVsMUT0HqoBeZl6aY4+T1vYm06SDPzQwSeol
         La0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bAddvVPDdRyLZnrfKB95HbgXsc3hKMehb9lipqYbdss=;
        b=f8M1Ojj5kw78BlddP1JPBKH9/5MQnhOsimVIO2UAW9K9/HuJdooJxWu2y13fZE4RC1
         tUWFqnQ1cqI+y5pDKkQRy6AgxjDKZno52GOnlISJecWERjJDGxO2U6MACF5tDcmILnbf
         wBJGn/MaSyorYxzEx+A4n2VX3JRm6jW/TzGDvRFQYNQIgUA/t17Eue6y5GdU3b9pN4tP
         cs2at3uu3jkvSbTHKAAq81v8WiOyPLDj74d4OililC/9jbSjYliLyzqEDAzyyrUW8HOO
         5U0QPzlativyj0o/YZHyx5kuKpP/BfY9rjfppvfKeCGhr3zaQQ3nhZtWAYxseEPAMjn/
         T16g==
X-Gm-Message-State: ACrzQf0tl3eOyX5m5ejyhdUU6wHq/8XsG1zAHTCnfQd63fbcJGOgFoYS
	v8/5tAtCzC0BMsAG/tqU3oboOVMcrGAsSla+HaY=
X-Google-Smtp-Source: AMsMyM7TLdwzwVQZogsnlbDlmfKdNK40Xbop+8BRpQ18DE93fXo59L+/QakucNeHtC7p7XpyfJtlTYuvb5mcFrn3Jl8=
X-Received: by 2002:a17:907:3e01:b0:730:a690:a211 with SMTP id
 hp1-20020a1709073e0100b00730a690a211mr47031040ejc.596.1667816838718; Mon, 07
 Nov 2022 02:27:18 -0800 (PST)
MIME-Version: 1.0
References: <CALAP8f--jyG=ufJ9WGtL6qoeGdsykjNK85G3q50SzJm5+wOzhQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2210171400570.2351079@ubuntu-linux-20-04-desktop>
 <CALAP8f81ojfVD9n5EMtD7DxY-8uomgENVEQH9Afz7Hk9rfaAsw@mail.gmail.com>
 <alpine.DEB.2.22.394.2210181213370.4587@ubuntu-linux-20-04-desktop>
 <CALAP8f9Zgue6WfAk2uRGkg=1Up2Z+eQWqvQ1_Z2=r66Z5fvKoA@mail.gmail.com>
 <alpine.DEB.2.22.394.2210251641540.1397955@ubuntu-linux-20-04-desktop> <CALAP8f8Z8A2u8h56EJWOCN7nJFDvyEvM-Q85XMnUP6Y6mZDg3w@mail.gmail.com>
In-Reply-To: <CALAP8f8Z8A2u8h56EJWOCN7nJFDvyEvM-Q85XMnUP6Y6mZDg3w@mail.gmail.com>
From: Vipul Suneja <vsuneja63@gmail.com>
Date: Mon, 7 Nov 2022 15:57:04 +0530
Message-ID: <CALAP8f_n2okQ-Ss_kGACAq3BVYXS_D2P_8AyhOzUxqgWpz9f4g@mail.gmail.com>
Subject: Re: Porting Xen in raspberry pi4B
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, oleksandr_andrushchenko@epam.com, 
	oleksandr_tyshchenko@epam.com, jgross@suse.com, boris.ostrovsky@oracle.com, 
	Bertrand.Marquis@arm.com
Content-Type: multipart/alternative; boundary="00000000000038e94005ecdede34"

--00000000000038e94005ecdede34
Content-Type: text/plain; charset="UTF-8"

Hi Stefano,

Thanks!

Any input further on "xenstore-ls" logs?

I am trying to run the x0vncserver & x11vnc server manually on guest
machine(xen_guest_image_minimal) image but it's failing with the below
error.







































































































































*root@raspberrypi4-64:/usr/bin# x0vncserverx0vncserver: unable to open
display ""root@raspberrypi4-64:/usr/bin# root@raspberrypi4-64:/usr/bin#
x11vnc################################################################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@##@
                                                          @##@  **  WARNING
 **  WARNING  **  WARNING  **  WARNING  **   @##@
                                @##@        YOU ARE RUNNING X11VNC WITHOUT
A PASSWORD!!        @##@
        @##@  This means anyone with network access to this computer   @##@
 may be able to view and control your desktop.            @##@
                                              @##@ >>> If you did not mean
to do this Press CTRL-C now!! <<< @##@

@##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@##@
                                                  @##@  You can create an
x11vnc password file by running:       @##@
                          @##@       x11vnc -storepasswd password
/path/to/passfile      @##@  or   x11vnc -storepasswd /path/to/passfile
          @##@  or   x11vnc -storepasswd
@##@                                                           @##@  (the
last one will use ~/.vnc/passwd)                    @##@
                                        @##@  and then starting x11vnc via:
                           @##@
              @##@      x11vnc -rfbauth /path/to/passfile
 @##@                                                           @##@  an
existing ~/.vnc/passwd file from another VNC          @##@  application
will work fine too.                          @##@
                                @##@  You can also use the -passwdfile or
-passwd options.     @##@  (note -passwd is unsafe if local users are not
trusted)  @##@
@##@  Make sure any -rfbauth and -passwdfile password files    @##@  cannot
be read by untrusted users.                       @##@
                                      @##@  Use x11vnc -usepw to
automatically use your              @##@  ~/.vnc/passwd or
~/.vnc/passwdfile password files.       @##@  (and prompt you to create
~/.vnc/passwd if neither       @##@  file exists.)  Under -usepw, x11vnc
will exit if it      @##@  cannot find a password to use.
        @##@                                                           @##@
                                                          @##@  Even with a
password, the subsequent VNC traffic is      @##@  sent in the clear.
Consider tunnelling via ssh(1):      @##@
                        @##@    http://www.karlrunge.com/x11vnc/#tunnelling
<http://www.karlrunge.com/x11vnc/#tunnelling>            @##@
                                            @##@  Or using the x11vnc SSL
options: -ssl and -stunnel       @##@
                    @##@  Please Read the documentation for more info about
       @##@  passwords, security, and encryption.                     @##@
                                                          @##@
 http://www.karlrunge.com/x11vnc/faq.html#faq-passwd
<http://www.karlrunge.com/x11vnc/faq.html#faq-passwd>    @##@
                                            @##@  To disable this warning
use the -nopw option, or put     @##@  'nopw' on a line in your ~/.x11vncrc
file.               @##@

@##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@################################################################09/03/2018
12:58:41 x11vnc version: 0.9.16 lastmod: 2019-01-05  pid: 42409/03/2018
12:58:41 XOpenDisplay("") failed.09/03/2018 12:58:41 Trying again with
XAUTHLOCALHOSTNAME=localhost ...09/03/2018 12:58:41 09/03/2018 12:58:41 ***
XOpenDisplay failed. No -display or DISPLAY.09/03/2018 12:58:41 *** Trying
":0" in 4 seconds.  Press Ctrl-C to abort.09/03/2018 12:58:41 *** 1 2 3 4
09/03/2018 12:58:45 XOpenDisplay(":0") failed.09/03/2018 12:58:45 Trying
again with XAUTHLOCALHOSTNAME=localhost ...09/03/2018 12:58:45
XOpenDisplay(":0") failed.09/03/2018 12:58:45 Trying again with unset
XAUTHLOCALHOSTNAME ...09/03/2018 12:58:45 09/03/2018 12:58:45
***************************************09/03/2018 12:58:45 *** XOpenDisplay
failed (:0)*** x11vnc was unable to open the X DISPLAY: ":0", it cannot
continue.*** There may be "Xlib:" error messages above with details about
the failure.Some tips and guidelines:** An X server (the one you wish to
view) must be running before x11vnc is   started: x11vnc does not start the
X server.  (however, see the -create   option if that is what you really
want).** You must use -display <disp>, -OR- set and export your $DISPLAY
 environment variable to refer to the display of the desired X server. -
Usually the display is simply ":0" (in fact x11vnc uses this if you forget
 to specify it), but in some multi-user situations it could be ":1", ":2",
 or even ":137".  Ask your administrator or a guru if you are having
 difficulty determining what your X DISPLAY is.** Next, you need to have
sufficient permissions (Xauthority)    to connect to the X DISPLAY.   Here
are some Tips: - Often, you just need to run x11vnc as the user logged into
the X session.   So make sure to be that user when you type x11vnc. - Being
root is usually not enough because the incorrect MIT-MAGIC-COOKIE   file
may be accessed.  The cookie file contains the secret key that   allows
x11vnc to connect to the desired X DISPLAY. - You can explicitly indicate
which MIT-MAGIC-COOKIE file should be used   by the -auth option, e.g.:
   x11vnc -auth /home/someuser/.Xauthority -display :0       x11vnc -auth
/tmp/.gdmzndVlR -display :0   you must have read permission for the auth
file.   See also '-auth guess' and '-findauth' discussed below.** If NO ONE
is logged into an X session yet, but there is a greeter login   program
like "gdm", "kdm", "xdm", or "dtlogin" running, you will need   to find and
use the raw display manager MIT-MAGIC-COOKIE file.   Some examples for
various display managers:     gdm:     -auth /var/gdm/:0.Xauth
-auth /var/lib/gdm/:0.Xauth     kdm:     -auth /var/lib/kdm/A:0-crWk72
        -auth /var/run/xauth/A:0-crWk72     xdm:     -auth
/var/lib/xdm/authdir/authfiles/A:0-XQvaJk     dtlogin: -auth
/var/dt/A:0-UgaaXa   Sometimes the command "ps wwwwaux | grep auth" can
reveal the file location.   Starting with x11vnc 0.9.9 you can have it try
to guess by using:              -auth guess   (see also the x11vnc
-findauth option.)   Only root will have read permission for the file, and
so x11vnc must be run   as root (or copy it).  The random characters in the
filenames will of course   change and the directory the cookie file resides
in is system dependent.See also: http://www.karlrunge.com/x11vnc/faq.html
<http://www.karlrunge.com/x11vnc/faq.html>*

Regards,
Vipul Kumar

On Thu, Nov 3, 2022 at 10:27 PM Vipul Suneja <vsuneja63@gmail.com> wrote:

> Hi Stefano,
>
> Thanks!
>
> I used xen-guest-image-minimal(simple console based image) as a guest with
> fbcon & fbdev enabled in kernel configurations but still the same error
> can't open the display.
> below are the outcome of "xenstore-ls":
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
>
>
>
>
>
>
>
> *root@raspberrypi4-64:~/guest1# xenstore-lstool = "" xenstored = ""local =
> "" domain = ""  0 = ""   control = ""    feature-poweroff = "1"
> feature-reboot = "1"   domid = "0"   name = "Domain-0"   device-model = ""
>   0 = ""     backends = ""      console = ""      vkbd = ""      vfb = ""
>     qnic = ""     state = "running"    1 = ""     backends = ""
> console = ""      vkbd = ""      vfb = ""      qnic = ""     state =
> "running"   backend = ""    vbd = ""     1 = ""      51712 = ""
>  frontend = "/local/domain/1/device/vbd/51712"       params =
> "/home/root/guest2/xen-guest-image-minimal-raspberrypi4-64.ext3"
>  script = "/etc/xen/scripts/block"       frontend-id = "1"       online =
> "1"       removable = "0"       bootable = "1"       state = "4"       dev
> = "xvda"       type = "phy"       mode = "w"       device-type = "disk"
>    discard-enable = "1"       feature-max-indirect-segments = "256"
>  multi-queue-max-queues = "4"       max-ring-page-order = "4"       node =
> "/dev/loop0"       physical-device = "7:0"       physical-device-path =
> "/dev/loop0"       hotplug-status = "connected"       feature-flush-cache =
> "1"       discard-granularity = "4096"       discard-alignment = "0"
>  discard-secure = "0"       feature-discard = "1"       feature-barrier =
> "1"       feature-persistent = "1"       sectors = "1794048"       info =
> "0"       sector-size = "512"       physical-sector-size = "512"    vfb =
> ""     1 = ""      0 = ""       frontend = "/local/domain/1/device/vfb/0"
>      frontend-id = "1"       online = "1"       state = "4"       vnc =
> "1"       vnclisten = "127.0.0.1"       vncdisplay = "0"       vncunused =
> "1"       sdl = "0"       opengl = "0"       feature-resize = "1"
>  hotplug-status = "connected"       request-update = "1"    vkbd = ""     1
> = ""      0 = ""       frontend = "/local/domain/1/device/vkbd/0"
>  frontend-id = "1"       online = "1"       state = "4"
>  feature-abs-pointer = "1"       feature-raw-pointer = "1"
>  hotplug-status = "connected"    console = ""     1 = ""      0 = ""
>  frontend = "/local/domain/1/console"       frontend-id = "1"       online
> = "1"       state = "1"       protocol = "vt100"    vif = ""     1 = ""
>   0 = ""       frontend = "/local/domain/1/device/vif/0"       frontend-id
> = "1"       online = "1"       state = "4"       script =
> "/etc/xen/scripts/vif-bridge"       mac = "e4:5f:01:cd:7b:dd"       bridge
> = "xenbr0"       handle = "0"       type = "vif"       hotplug-status =
> "connected"       feature-sg = "1"       feature-gso-tcpv4 = "1"
>  feature-gso-tcpv6 = "1"       feature-ipv6-csum-offload = "1"
>  feature-rx-copy = "1"       feature-xdp-headroom = "1"
>  feature-rx-flip = "0"       feature-multicast-control = "1"
>  feature-dynamic-multicast-control = "1"       feature-split-event-channels
> = "1"       multi-queue-max-queues = "4"       feature-ctrl-ring = "1"  1 =
> ""   vm = "/vm/d81ec5a9-5bf9-4f2b-89e8-0f60d6da948f"   name = "guest2"
>  cpu = ""    0 = ""     availability = "online"    1 = ""     availability
> = "online"   memory = ""    static-max = "2097152"    target = "2097152"
> videoram = "0"   device = ""    suspend = ""     event-channel = ""    vbd
> = ""     51712 = ""      backend = "/local/domain/0/backend/vbd/1/51712"
>   backend-id = "0"      state = "4"      virtual-device = "51712"
> device-type = "disk"      multi-queue-num-queues = "2"      queue-0 = ""
>    ring-ref = "8"       event-channel = "4"      queue-1 = ""
>  ring-ref = "9"       event-channel = "5"      protocol = "arm-abi"
> feature-persistent = "1"    vfb = ""     0 = ""      backend =
> "/local/domain/0/backend/vfb/1/0"      backend-id = "0"      state = "4"
>   page-ref = "275022"      event-channel = "3"      protocol = "arm-abi"
>   feature-update = "1"    vkbd = ""     0 = ""      backend =
> "/local/domain/0/backend/vkbd/1/0"      backend-id = "0"      state = "4"
>     request-abs-pointer = "1"      page-ref = "275322"      page-gref =
> "1284"      event-channel = "10"    vif = ""     0 = ""      backend =
> "/local/domain/0/backend/vif/1/0"      backend-id = "0"      state = "4"
>   handle = "0"      mac = "e4:5f:01:cd:7b:dd"      mtu = "1500"
> xdp-headroom = "0"      multi-queue-num-queues = "2"      queue-0 = ""
>  tx-ring-ref = "1280"       rx-ring-ref = "1281"       event-channel-tx =
> "6"       event-channel-rx = "7"      queue-1 = ""       tx-ring-ref =
> "1282"       rx-ring-ref = "1283"       event-channel-tx = "8"
>  event-channel-rx = "9"      request-rx-copy = "1"      feature-rx-notify =
> "1"      feature-sg = "1"      feature-gso-tcpv4 = "1"
> feature-gso-tcpv6 = "1"      feature-ipv6-csum-offload = "1"   control =
> ""    shutdown = ""    feature-poweroff = "1"    feature-reboot = "1"
> feature-suspend = ""    sysrq = ""
> platform-feature-multiprocessor-suspend = "1"
> platform-feature-xs_reset_watches = "1"   data = ""   drivers = ""
>  feature = ""   attr = ""   error = ""   domid = "1"   store = ""    port =
> "1"    ring-ref = "233473"   console = ""    backend =
> "/local/domain/0/backend/console/1/0"    backend-id = "0"    limit =
> "1048576"    type = "xenconsoled"    output = "pty"    tty = "/dev/pts/1"
>   port = "2"    ring-ref = "233472"    vnc-listen = "127.0.0.1"    vnc-port
> = "5900"   image = ""    device-model-pid = "788"vm =
> "" d81ec5a9-5bf9-4f2b-89e8-0f60d6da948f = ""  name = "guest2"  uuid =
> "d81ec5a9-5bf9-4f2b-89e8-0f60d6da948f"  start_time = "1520600274.27"libxl =
> "" 1 = ""  device = ""   vbd = ""    51712 = ""     frontend =
> "/local/domain/1/device/vbd/51712"     backend =
> "/local/domain/0/backend/vbd/1/51712"     params =
> "/home/root/guest2/xen-guest-image-minimal-raspberrypi4-64.ext3"     script
> = "/etc/xen/scripts/block"     frontend-id = "1"     online = "1"
>  removable = "0"     bootable = "1"     state = "1"     dev = "xvda"
>  type = "phy"     mode = "w"     device-type = "disk"     discard-enable =
> "1"   vfb = ""    0 = ""     frontend = "/local/domain/1/device/vfb/0"
>  backend = "/local/domain/0/backend/vfb/1/0"     frontend-id = "1"
>  online = "1"     state = "1"     vnc = "1"     vnclisten = "127.0.0.1"
>  vncdisplay = "0"     vncunused = "1"     sdl = "0"     opengl = "0"   vkbd
> = ""    0 = ""     frontend = "/local/domain/1/device/vkbd/0"     backend =
> "/local/domain/0/backend/vkbd/1/0"     frontend-id = "1"     online = "1"
>    state = "1"   console = ""    0 = ""     frontend =
> "/local/domain/1/console"     backend =
> "/local/domain/0/backend/console/1/0"     frontend-id = "1"     online =
> "1"     state = "1"     protocol = "vt100"   vif = ""    0 = ""
>  frontend = "/local/domain/1/device/vif/0"     backend =
> "/local/domain/0/backend/vif/1/0"     frontend-id = "1"     online = "1"
>  state = "1"     script = "/etc/xen/scripts/vif-bridge"     mac =
> "e4:5f:01:cd:7b:dd"     bridge = "xenbr0"     handle = "0"     type =
> "vif"     hotplug-status = ""  type = "pvh"  dm-version =
> "qemu_xen"root@raspberrypi4-64:~/guest1#*
>
> Any input as per above? Looking forward to hearing from you.
>
> Regards,
> Vipul Kumar
>
> On Wed, Oct 26, 2022 at 5:21 AM Stefano Stabellini <sstabellini@kernel.org>
> wrote:
>
>> Hi Vipul,
>>
>> If you look at the QEMU logs, it says:
>>
>> VNC server running on 127.0.0.1:5900
>>
>> That is the VNC server you need to connect to. So in theory:
>>
>>   vncviewer 127.0.0.1:5900
>>
>> should work correctly.
>>
>>
>> If you have:
>>
>>   vfb = ["type=vnc"]
>>
>> in your xl config file and you have "fbdev" in your Linux guest, it
>> should work.
>>
>> If you connect to the VNC server but you get a black screen, it might be
>> a guest configuration issue. I would try with a simpler guest, text only
>> (no X11, no Wayland) and enable the fbdev console (fbcon). See
>> Documentation/fb/fbcon.rst in Linux. You should be able to see a
>> graphical console over VNC.
>>
>> If that works, then you know that the fbdev kernel driver (xen-fbfront)
>> works correctly.
>>
>> If it doesn't work, the output of "xenstore-ls" would be interesting.
>>
>> Cheers,
>>
>> Stefano
>>
>>
>> On Wed, 19 Oct 2022, Vipul Suneja wrote:
>> > Hi Stefano,
>> >
>> > Thanks for the response!
>> >
>> > I am following the same link you shared from the beginning. Tried the
>> command "vncviewer localhost:0" in DOM0 but same issue "Can't open
>> > display", below are the logs:
>> >
>> > root@raspberrypi4-64:~# vncviewer localhost:0
>> >
>> > TigerVNC Viewer 64-bit v1.11.0
>> > Built on: 2020-09-08 12:16
>> > Copyright (C) 1999-2020 TigerVNC Team and many others (see README.rst)
>> > See https://www.tigervnc.org for information on TigerVNC.
>> > Can't open display:
>> >
>> > Below are the netstat logs, i couldn't see anything running at port
>> 5900 or 5901:
>> >
>> > root@raspberrypi4-64:~# netstat -tuwx
>> > Active Internet connections (w/o servers)
>> > Proto Recv-Q Send-Q Local Address           Foreign Address
>> State
>> > tcp        0    164 192.168.1.39:ssh        192.168.1.38:37472
>>  ESTABLISHED
>> > Active UNIX domain sockets (w/o servers)
>> > Proto RefCnt Flags       Type       State         I-Node Path
>> > unix  8      [ ]         DGRAM      CONNECTED      10565 /dev/log
>> > unix  3      [ ]         STREAM     CONNECTED      10891
>> /var/run/xenstored/socket
>> > unix  3      [ ]         STREAM     CONNECTED      13791
>> > unix  3      [ ]         STREAM     CONNECTED      10843
>> /var/run/xenstored/socket
>> > unix  3      [ ]         STREAM     CONNECTED      10573
>> /var/run/xenstored/socket
>> > unix  2      [ ]         DGRAM      CONNECTED      14510
>> > unix  3      [ ]         STREAM     CONNECTED      13249
>> > unix  2      [ ]         DGRAM      CONNECTED      13887
>> > unix  2      [ ]         DGRAM      CONNECTED      10599
>> > unix  3      [ ]         STREAM     CONNECTED      14005
>> > unix  3      [ ]         STREAM     CONNECTED      13258
>> > unix  3      [ ]         STREAM     CONNECTED      13248
>> > unix  3      [ ]         STREAM     CONNECTED      14003
>> > unix  3      [ ]         STREAM     CONNECTED      10572
>> /var/run/xenstored/socket
>> > unix  3      [ ]         STREAM     CONNECTED      10786
>> /var/run/xenstored/socket
>> > unix  3      [ ]         DGRAM      CONNECTED      13186
>> > unix  3      [ ]         STREAM     CONNECTED      10864
>> /var/run/xenstored/socket
>> > unix  3      [ ]         STREAM     CONNECTED      10812
>> /var/run/xenstored/socket
>> > unix  2      [ ]         DGRAM      CONNECTED      14083
>> > unix  3      [ ]         STREAM     CONNECTED      10813
>> /var/run/xenstored/socket
>> > unix  3      [ ]         STREAM     CONNECTED      14068
>> > unix  3      [ ]         STREAM     CONNECTED      13256
>> > unix  3      [ ]         STREAM     CONNECTED      10571
>> /var/run/xenstored/socket
>> > unix  3      [ ]         STREAM     CONNECTED      10842
>> > unix  3      [ ]         STREAM     CONNECTED      13985
>> > unix  3      [ ]         DGRAM      CONNECTED      13185
>> > unix  2      [ ]         STREAM     CONNECTED      13884
>> > unix  2      [ ]         DGRAM      CONNECTED      14528
>> > unix  2      [ ]         DGRAM      CONNECTED      13785
>> > unix  3      [ ]         STREAM     CONNECTED      14034
>> >
>> > Attaching xen log files of /var/log/xen.
>> > I didn't get the role of QEMU here because as mentioned earlier, I am
>> porting in raspberrypi 4B.
>> >
>> > Regards,
>> > Vipul Kumar
>> >
>> > On Wed, Oct 19, 2022 at 12:43 AM Stefano Stabellini <
>> sstabellini@kernel.org> wrote:
>> >       It usually works the way it is described in the guide:
>> >
>> >
>> https://www.virtuatopia.com/index.php?title=Configuring_a_VNC_based_Graphical_Console_for_a_Xen_Paravirtualized_domainU_Guest
>> >
>> >       You don't need to install any VNC-related server software because
>> it is
>> >       already provided by Xen (to be precise it is provided by QEMU
>> working
>> >       together with Xen.)
>> >
>> >       You only need the vnc client in dom0 so that you can connect, but
>> you
>> >       could also run the vnc client outside from another host. So
>> basically
>> >       the following should work when executed in Dom0 after creating
>> DomU:
>> >
>> >         vncviewer localhost:0
>> >
>> >       Can you attach the Xen and QEMU logs (/var/log/xen/*)? And also
>> use
>> >       netstat -taunp to check if there is anything running at port 5900
>> or
>> >       5901?
>> >
>> >       Cheers,
>> >
>> >       Stefano
>> >
>> >
>> >       On Tue, 18 Oct 2022, Vipul Suneja wrote:
>> >       > Hi Stefano,
>> >       >
>> >       > Thanks for the response!
>> >       >
>> >       > I could install tigerVNC, x11vnc & libvncserver in Dom0
>> xen-image-minimal but only manage to install libvncserver(couldn't
>> >       install tigervnc
>> >       > & x11vnc because of x11
>> >       > support missing, it's wayland) in DOMU custom graphical image.
>> I tried running vncviewer with IP address & port in dom0 to
>> >       access the domu
>> >       > graphical image display as per below commands.
>> >       >
>> >       >  vncviewer 192.168.1.42:5901
>> >       >
>> >       >  But it showing can't open display, below are the logs:
>> >       >
>> >       > root@raspberrypi4-64:~/guest1# vncviewer 192.168.1.42:5901
>> >       >
>> >       > TigerVNC Viewer 64-bit v1.11.0
>> >       > Built on: 2020-09-08 12:16
>> >       > Copyright (C) 1999-2020 TigerVNC Team and many others (see
>> README.rst)
>> >       > See https://www.tigervnc.org for information on TigerVNC.
>> >       > Can't open display:
>> >       > root@raspberrypi4-64:~/guest1#
>> >       >
>> >       > I am not exactly sure what the issue is but I thought only
>> libvncserver in DOMU could work to get access but it did not
>> >       work.
>> >       > If TigerVNC is the issue here then is there any other VNC
>> source which could be installed for both x11 & wayland supported
>> >       images?
>> >       >
>> >       > Regards,
>> >       > Vipul Kumar
>> >       >
>> >       > On Tue, Oct 18, 2022 at 2:40 AM Stefano Stabellini <
>> sstabellini@kernel.org> wrote:
>> >       >       VNC is typically easier to setup, because SDL needs extra
>> libraries at
>> >       >       build time and runtime. If QEMU is built without SDL
>> support it won't
>> >       >       start when you ask for SDL.
>> >       >
>> >       >       VNC should work with both x11 and wayland in your domU.
>> It doesn't work
>> >       >       at the x11 level, it exposes a special fbdev device in
>> your domU that
>> >       >       should work with:
>> >       >       - a graphical console in Linux domU
>> >       >       - x11
>> >       >       - wayland (but I haven't tested this so I am not 100%
>> sure about it)
>> >       >
>> >       >       When you say "it doesn't work", what do you mean? Do you
>> get a black
>> >       >       window?
>> >       >
>> >       >       You need CONFIG_XEN_FBDEV_FRONTEND in Linux domU
>> >       >       (drivers/video/fbdev/xen-fbfront.c). I would try to get a
>> graphical text
>> >       >       console up and running in your domU before attempting
>> x11/wayland.
>> >       >
>> >       >       Cheers,
>> >       >
>> >       >       Stefano
>> >       >
>> >       >       On Mon, 17 Oct 2022, Vipul Suneja wrote:
>> >       >       > Hi,
>> >       >       > Thanks!
>> >       >       >
>> >       >       > I have ported xen minimal image as DOM0 & custom
>> wayland GUI based image as DOMU in raspberry pi4B. I am trying to
>> >       make GUI
>> >       >       display up
>> >       >       > for guest machine. I tried using sdl, included below
>> line in guest.conf file
>> >       >       > vfb= [ 'sdl=1' ]
>> >       >       >
>> >       >       > But it is throwing below error:
>> >       >       >
>> >       >       > root@raspberrypi4-64:~/guest1# xl create -c guest1.cfg
>> >       >       > Parsing config from guest1.cfg
>> >       >       > libxl: error: libxl_qmp.c:1400:qmp_ev_fd_callback:
>> Domain 3:error on QMP socket: Connection reset by peer
>> >       >       > libxl: error: libxl_qmp.c:1439:qmp_ev_fd_callback:
>> Domain 3:Error happened with the QMP connection to QEMU
>> >       >       > libxl: error:
>> libxl_dm.c:3351:device_model_postconfig_done: Domain 3:Post DM startup
>> configs failed, rc=-26
>> >       >       > libxl: error:
>> libxl_create.c:1867:domcreate_devmodel_started: Domain 3:device model did
>> not start: -26
>> >       >       > libxl: error: libxl_aoutils.c:646:libxl__kill_xs_path:
>> Device Model already exited
>> >       >       > libxl: error: libxl_domain.c:1183:libxl__destroy_domid:
>> Domain 3:Non-existant domain
>> >       >       > libxl: error:
>> libxl_domain.c:1137:domain_destroy_callback: Domain 3:Unable to destroy
>> guest
>> >       >       > libxl: error: libxl_domain.c:1064:domain_destroy_cb:
>> Domain 3:Destruction of domain failed
>> >       >       >
>> >       >       > Another way is VNC, i could install tigervnc in DOM0
>> but same i couldn't in guest machine because it doesn't support
>> >       >       x11(supports wayland
>> >       >       > only). I am completely blocked here, Need your support
>> to enable the display up.
>> >       >       > Any alternative of VNC which could work in both x11 &
>> wayland supported images?
>> >       >       >
>> >       >       > Any input on VNC, SDL or any other way to proceed on
>> this? Looking forward to hearing from you.
>> >       >       >
>> >       >       > Regards,
>> >       >       > Vipul Kumar
>> >       >
>> >       >
>> >       >
>> >
>> >
>> >
>
>

--00000000000038e94005ecdede34
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Stefano,<div><br></div><div>Thanks!</div><div><br></div=
><div>Any input further on &quot;xenstore-ls&quot; logs?</div><div><br></di=
v><div>I am trying to run the x0vncserver &amp; x11vnc server manually on g=
uest machine(xen_guest_image_minimal) image but it&#39;s failing with the b=
elow error.</div><div><br></div><div><b>root@raspberrypi4-64:/usr/bin# x0vn=
cserver<br>x0vncserver: unable to open display &quot;&quot;<br>root@raspber=
rypi4-64:/usr/bin# <br>root@raspberrypi4-64:/usr/bin# x11vnc<br>###########=
####################################################<br>#@@@@@@@@@@@@@@@@@@=
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#<br>#@ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>#@ =C2=A0** =C2=A0WARNING =C2=A0** =
=C2=A0WARNING =C2=A0** =C2=A0WARNING =C2=A0** =C2=A0WARNING =C2=A0** =C2=A0=
 @#<br>#@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>#@=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0YOU ARE RUNNING X11VNC WITHOUT A PASSWORD!! =C2=
=A0 =C2=A0 =C2=A0 =C2=A0@#<br>#@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 @#<br>#@ =C2=A0This means anyone with network access to this =
computer =C2=A0 @#<br>#@ =C2=A0may be able to view and control your desktop=
. =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@#<br>#@ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>#@ &gt;&gt;&gt; If you did not mea=
n to do this Press CTRL-C now!! &lt;&lt;&lt; @#<br>#@ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@=
@@@@@@@@@@@@@@@@@@@@@@@@@@@@#<br>#@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 @#<br>#@ =C2=A0You can create an x11vnc password file by =
running: =C2=A0 =C2=A0 =C2=A0 @#<br>#@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 @#<br>#@ =C2=A0 =C2=A0 =C2=A0 x11vnc -storepasswd pass=
word /path/to/passfile =C2=A0 =C2=A0 =C2=A0@#<br>#@ =C2=A0or =C2=A0 x11vnc =
-storepasswd /path/to/passfile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 @#<br>#@ =C2=A0or =C2=A0 x11vnc -storepasswd =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 @#<br>#@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 @#<br>#@ =C2=A0(the last one will use ~/.vnc/passwd) =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@#<br>#@ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>#@ =C2=A0and then start=
ing x11vnc via: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@#<br>#@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>#@ =C2=A0 =C2=A0 =C2=A0x11vnc -rfbauth /p=
ath/to/passfile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0@#<br>#@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @=
#<br>#@ =C2=A0an existing ~/.vnc/passwd file from another VNC =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0@#<br>#@ =C2=A0application will work fine too. =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0@#<br>#@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @=
#<br>#@ =C2=A0You can also use the -passwdfile or -passwd options. =C2=A0 =
=C2=A0 @#<br>#@ =C2=A0(note -passwd is unsafe if local users are not truste=
d) =C2=A0@#<br>#@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @=
#<br>#@ =C2=A0Make sure any -rfbauth and -passwdfile password files =C2=A0 =
=C2=A0@#<br>#@ =C2=A0cannot be read by untrusted users. =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>#@ =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>#@ =C2=A0Use x11vnc =
-usepw to automatically use your =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0@#<br>#@ =C2=A0~/.vnc/passwd or ~/.vnc/passwdfile password files. =C2=
=A0 =C2=A0 =C2=A0 @#<br>#@ =C2=A0(and prompt you to create ~/.vnc/passwd if=
 neither =C2=A0 =C2=A0 =C2=A0 @#<br>#@ =C2=A0file exists.) =C2=A0Under -use=
pw, x11vnc will exit if it =C2=A0 =C2=A0 =C2=A0@#<br>#@ =C2=A0cannot find a=
 password to use. =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>#@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>#@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 @#<br>#@ =C2=A0Even with a password, the subsequent VNC traff=
ic is =C2=A0 =C2=A0 =C2=A0@#<br>#@ =C2=A0sent in the clear.=C2=A0 Consider =
tunnelling via ssh(1): =C2=A0 =C2=A0 =C2=A0@#<br>#@ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>#@ =C2=A0 =C2=A0<a href=3D"http://=
www.karlrunge.com/x11vnc/#tunnelling">http://www.karlrunge.com/x11vnc/#tunn=
elling</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@#<br>#@ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>#@ =C2=A0Or using the x11vn=
c SSL options: -ssl and -stunnel =C2=A0 =C2=A0 =C2=A0 @#<br>#@ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>#@ =C2=A0Please Read th=
e documentation for more info about =C2=A0 =C2=A0 =C2=A0 =C2=A0@#<br>#@ =C2=
=A0passwords, security, and encryption. =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>#@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>#@ =C2=A0 =C2=A0<a href=3D"http://www.karlru=
nge.com/x11vnc/faq.html#faq-passwd">http://www.karlrunge.com/x11vnc/faq.htm=
l#faq-passwd</a> =C2=A0 =C2=A0@#<br>#@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 @#<br>#@ =C2=A0To disable this warning use the -nopw o=
ption, or put =C2=A0 =C2=A0 @#<br>#@ =C2=A0&#39;nopw&#39; on a line in your=
 ~/.x11vncrc file. =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>#=
@ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @#<br>#@@@@@@@@@@@@=
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#<br>#####################=
##########################################<br>09/03/2018 12:58:41 x11vnc ve=
rsion: 0.9.16 lastmod: 2019-01-05 =C2=A0pid: 424<br>09/03/2018 12:58:41 XOp=
enDisplay(&quot;&quot;) failed.<br>09/03/2018 12:58:41 Trying again with XA=
UTHLOCALHOSTNAME=3Dlocalhost ...<br>09/03/2018 12:58:41 <br>09/03/2018 12:5=
8:41 *** XOpenDisplay failed. No -display or DISPLAY.<br>09/03/2018 12:58:4=
1 *** Trying &quot;:0&quot; in 4 seconds.=C2=A0 Press Ctrl-C to abort.<br>0=
9/03/2018 12:58:41 *** 1 2 3 4 <br>09/03/2018 12:58:45 XOpenDisplay(&quot;:=
0&quot;) failed.<br>09/03/2018 12:58:45 Trying again with XAUTHLOCALHOSTNAM=
E=3Dlocalhost ...<br>09/03/2018 12:58:45 XOpenDisplay(&quot;:0&quot;) faile=
d.<br>09/03/2018 12:58:45 Trying again with unset XAUTHLOCALHOSTNAME ...<br=
>09/03/2018 12:58:45 <br><br>09/03/2018 12:58:45 **************************=
*************<br>09/03/2018 12:58:45 *** XOpenDisplay failed (:0)<br><br>**=
* x11vnc was unable to open the X DISPLAY: &quot;:0&quot;, it cannot contin=
ue.<br>*** There may be &quot;Xlib:&quot; error messages above with details=
 about the failure.<br><br>Some tips and guidelines:<br><br>** An X server =
(the one you wish to view) must be running before x11vnc is<br>=C2=A0 =C2=
=A0started: x11vnc does not start the X server. =C2=A0(however, see the -cr=
eate<br>=C2=A0 =C2=A0option if that is what you really want).<br><br>** You=
 must use -display &lt;disp&gt;, -OR- set and export your $DISPLAY<br>=C2=
=A0 =C2=A0environment variable to refer to the display of the desired X ser=
ver.<br>=C2=A0- Usually the display is simply &quot;:0&quot; (in fact x11vn=
c uses this if you forget<br>=C2=A0 =C2=A0to specify it), but in some multi=
-user situations it could be &quot;:1&quot;, &quot;:2&quot;,<br>=C2=A0 =C2=
=A0or even &quot;:137&quot;.=C2=A0 Ask your administrator or a guru if you =
are having<br>=C2=A0 =C2=A0difficulty determining what your X DISPLAY is.<b=
r><br>** Next, you need to have sufficient permissions (Xauthority) <br>=C2=
=A0 =C2=A0to connect to the X DISPLAY. =C2=A0 Here are some Tips:<br><br>=
=C2=A0- Often, you just need to run x11vnc as the user logged into the X se=
ssion.<br>=C2=A0 =C2=A0So make sure to be that user when you type x11vnc.<b=
r>=C2=A0- Being root is usually not enough because the incorrect MIT-MAGIC-=
COOKIE<br>=C2=A0 =C2=A0file may be accessed.=C2=A0 The cookie file contains=
 the secret key that<br>=C2=A0 =C2=A0allows x11vnc to connect to the desire=
d X DISPLAY.<br>=C2=A0- You can explicitly indicate which MIT-MAGIC-COOKIE =
file should be used<br>=C2=A0 =C2=A0by the -auth option, e.g.:<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0x11vnc -auth /home/someuser/.Xauthority -display :0<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0x11vnc -auth /tmp/.gdmzndVlR -display :0<br>=C2=
=A0 =C2=A0you must have read permission for the auth file.<br>=C2=A0 =C2=A0=
See also &#39;-auth guess&#39; and &#39;-findauth&#39; discussed below.<br>=
<br>** If NO ONE is logged into an X session yet, but there is a greeter lo=
gin<br>=C2=A0 =C2=A0program like &quot;gdm&quot;, &quot;kdm&quot;, &quot;xd=
m&quot;, or &quot;dtlogin&quot; running, you will need<br>=C2=A0 =C2=A0to f=
ind and use the raw display manager MIT-MAGIC-COOKIE file.<br>=C2=A0 =C2=A0=
Some examples for various display managers:<br><br>=C2=A0 =C2=A0 =C2=A0gdm:=
 =C2=A0 =C2=A0 -auth /var/gdm/:0.Xauth<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 -auth /var/lib/gdm/:0.Xauth<br>=C2=A0 =C2=A0 =C2=A0kdm: =
=C2=A0 =C2=A0 -auth /var/lib/kdm/A:0-crWk72<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 -auth /var/run/xauth/A:0-crWk72<br>=C2=A0 =C2=A0 =C2=
=A0xdm: =C2=A0 =C2=A0 -auth /var/lib/xdm/authdir/authfiles/A:0-XQvaJk<br>=
=C2=A0 =C2=A0 =C2=A0dtlogin: -auth /var/dt/A:0-UgaaXa<br><br>=C2=A0 =C2=A0S=
ometimes the command &quot;ps wwwwaux | grep auth&quot; can reveal the file=
 location.<br><br>=C2=A0 =C2=A0Starting with x11vnc 0.9.9 you can have it t=
ry to guess by using:<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -auth guess<br><br>=C2=A0 =C2=A0(see also the x11vnc -findauth option.)=
<br><br>=C2=A0 =C2=A0Only root will have read permission for the file, and =
so x11vnc must be run<br>=C2=A0 =C2=A0as root (or copy it).=C2=A0 The rando=
m characters in the filenames will of course<br>=C2=A0 =C2=A0change and the=
 directory the cookie file resides in is system dependent.<br><br>See also:=
 <a href=3D"http://www.karlrunge.com/x11vnc/faq.html">http://www.karlrunge.=
com/x11vnc/faq.html</a></b><br></div><div><br></div><div>Regards,</div><div=
>Vipul Kumar</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Thu, Nov 3, 2022 at 10:27 PM Vipul Suneja &lt;<a href=
=3D"mailto:vsuneja63@gmail.com">vsuneja63@gmail.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi Stef=
ano,<div><br></div><div>Thanks!</div><div><br></div><div>I used xen-guest-i=
mage-minimal(simple console based image) as a guest with fbcon &amp; fbdev =
enabled in kernel configurations but still the same error can&#39;t open th=
e display.</div><div>below are the outcome of &quot;xenstore-ls&quot;:</div=
><div><br></div><div><b>root@raspberrypi4-64:~/guest1# xenstore-ls<br>tool =
=3D &quot;&quot;<br>=C2=A0xenstored =3D &quot;&quot;<br>local =3D &quot;&qu=
ot;<br>=C2=A0domain =3D &quot;&quot;<br>=C2=A0 0 =3D &quot;&quot;<br>=C2=A0=
 =C2=A0control =3D &quot;&quot;<br>=C2=A0 =C2=A0 feature-poweroff =3D &quot=
;1&quot;<br>=C2=A0 =C2=A0 feature-reboot =3D &quot;1&quot;<br>=C2=A0 =C2=A0=
domid =3D &quot;0&quot;<br>=C2=A0 =C2=A0name =3D &quot;Domain-0&quot;<br>=
=C2=A0 =C2=A0device-model =3D &quot;&quot;<br>=C2=A0 =C2=A0 0 =3D &quot;&qu=
ot;<br>=C2=A0 =C2=A0 =C2=A0backends =3D &quot;&quot;<br>=C2=A0 =C2=A0 =C2=
=A0 console =3D &quot;&quot;<br>=C2=A0 =C2=A0 =C2=A0 vkbd =3D &quot;&quot;<=
br>=C2=A0 =C2=A0 =C2=A0 vfb =3D &quot;&quot;<br>=C2=A0 =C2=A0 =C2=A0 qnic =
=3D &quot;&quot;<br>=C2=A0 =C2=A0 =C2=A0state =3D &quot;running&quot;<br>=
=C2=A0 =C2=A0 1 =3D &quot;&quot;<br>=C2=A0 =C2=A0 =C2=A0backends =3D &quot;=
&quot;<br>=C2=A0 =C2=A0 =C2=A0 console =3D &quot;&quot;<br>=C2=A0 =C2=A0 =
=C2=A0 vkbd =3D &quot;&quot;<br>=C2=A0 =C2=A0 =C2=A0 vfb =3D &quot;&quot;<b=
r>=C2=A0 =C2=A0 =C2=A0 qnic =3D &quot;&quot;<br>=C2=A0 =C2=A0 =C2=A0state =
=3D &quot;running&quot;<br>=C2=A0 =C2=A0backend =3D &quot;&quot;<br>=C2=A0 =
=C2=A0 vbd =3D &quot;&quot;<br>=C2=A0 =C2=A0 =C2=A01 =3D &quot;&quot;<br>=
=C2=A0 =C2=A0 =C2=A0 51712 =3D &quot;&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0f=
rontend =3D &quot;/local/domain/1/device/vbd/51712&quot;<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0params =3D &quot;/home/root/guest2/xen-guest-image-minimal-ras=
pberrypi4-64.ext3&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0script =3D &quot;/etc=
/xen/scripts/block&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0frontend-id =3D &quo=
t;1&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0online =3D &quot;1&quot;<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0removable =3D &quot;0&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0bootable =3D &quot;1&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0state =3D &quot=
;4&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0dev =3D &quot;xvda&quot;<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0type =3D &quot;phy&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
mode =3D &quot;w&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0device-type =3D &quot;=
disk&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0discard-enable =3D &quot;1&quot;<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0feature-max-indirect-segments =3D &quot;256&qu=
ot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0multi-queue-max-queues =3D &quot;4&quot;<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0max-ring-page-order =3D &quot;4&quot;<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0node =3D &quot;/dev/loop0&quot;<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0physical-device =3D &quot;7:0&quot;<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0physical-device-path =3D &quot;/dev/loop0&quot;<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0hotplug-status =3D &quot;connected&quot;<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0feature-flush-cache =3D &quot;1&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0d=
iscard-granularity =3D &quot;4096&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0disca=
rd-alignment =3D &quot;0&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0discard-secure=
 =3D &quot;0&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0feature-discard =3D &quot;=
1&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0feature-barrier =3D &quot;1&quot;<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0feature-persistent =3D &quot;1&quot;<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0sectors =3D &quot;1794048&quot;<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0info =3D &quot;0&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0sector-size =3D=
 &quot;512&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0physical-sector-size =3D &qu=
ot;512&quot;<br>=C2=A0 =C2=A0 vfb =3D &quot;&quot;<br>=C2=A0 =C2=A0 =C2=A01=
 =3D &quot;&quot;<br>=C2=A0 =C2=A0 =C2=A0 0 =3D &quot;&quot;<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0frontend =3D &quot;/local/domain/1/device/vfb/0&quot;<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0frontend-id =3D &quot;1&quot;<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0online =3D &quot;1&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0state =
=3D &quot;4&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0vnc =3D &quot;1&quot;<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0vnclisten =3D &quot;127.0.0.1&quot;<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0vncdisplay =3D &quot;0&quot;<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0vncunused =3D &quot;1&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0sdl =3D &qu=
ot;0&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0opengl =3D &quot;0&quot;<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0feature-resize =3D &quot;1&quot;<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0hotplug-status =3D &quot;connected&quot;<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0request-update =3D &quot;1&quot;<br>=C2=A0 =C2=A0 vkbd =3D &quot;&quo=
t;<br>=C2=A0 =C2=A0 =C2=A01 =3D &quot;&quot;<br>=C2=A0 =C2=A0 =C2=A0 0 =3D =
&quot;&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0frontend =3D &quot;/local/domain=
/1/device/vkbd/0&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0frontend-id =3D &quot;=
1&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0online =3D &quot;1&quot;<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0state =3D &quot;4&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0f=
eature-abs-pointer =3D &quot;1&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0feature-=
raw-pointer =3D &quot;1&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0hotplug-status =
=3D &quot;connected&quot;<br>=C2=A0 =C2=A0 console =3D &quot;&quot;<br>=C2=
=A0 =C2=A0 =C2=A01 =3D &quot;&quot;<br>=C2=A0 =C2=A0 =C2=A0 0 =3D &quot;&qu=
ot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0frontend =3D &quot;/local/domain/1/consol=
e&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0frontend-id =3D &quot;1&quot;<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0online =3D &quot;1&quot;<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0state =3D &quot;1&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0protocol =3D &q=
uot;vt100&quot;<br>=C2=A0 =C2=A0 vif =3D &quot;&quot;<br>=C2=A0 =C2=A0 =C2=
=A01 =3D &quot;&quot;<br>=C2=A0 =C2=A0 =C2=A0 0 =3D &quot;&quot;<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0frontend =3D &quot;/local/domain/1/device/vif/0&quot;<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0frontend-id =3D &quot;1&quot;<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0online =3D &quot;1&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0state =
=3D &quot;4&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0script =3D &quot;/etc/xen/s=
cripts/vif-bridge&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0mac =3D &quot;e4:5f:0=
1:cd:7b:dd&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0bridge =3D &quot;xenbr0&quot=
;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0handle =3D &quot;0&quot;<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0type =3D &quot;vif&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0hotplug=
-status =3D &quot;connected&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0feature-sg =
=3D &quot;1&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0feature-gso-tcpv4 =3D &quot=
;1&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0feature-gso-tcpv6 =3D &quot;1&quot;<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0feature-ipv6-csum-offload =3D &quot;1&quot;<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0feature-rx-copy =3D &quot;1&quot;<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0feature-xdp-headroom =3D &quot;1&quot;<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0feature-rx-flip =3D &quot;0&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0feature-multicast-control =3D &quot;1&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0feature-dynamic-multicast-control =3D &quot;1&quot;<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0feature-split-event-channels =3D &quot;1&quot;<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0multi-queue-max-queues =3D &quot;4&quot;<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0feature-ctrl-ring =3D &quot;1&quot;<br>=C2=A0 1 =3D &quot;&quot;<=
br>=C2=A0 =C2=A0vm =3D &quot;/vm/d81ec5a9-5bf9-4f2b-89e8-0f60d6da948f&quot;=
<br>=C2=A0 =C2=A0name =3D &quot;guest2&quot;<br>=C2=A0 =C2=A0cpu =3D &quot;=
&quot;<br>=C2=A0 =C2=A0 0 =3D &quot;&quot;<br>=C2=A0 =C2=A0 =C2=A0availabil=
ity =3D &quot;online&quot;<br>=C2=A0 =C2=A0 1 =3D &quot;&quot;<br>=C2=A0 =
=C2=A0 =C2=A0availability =3D &quot;online&quot;<br>=C2=A0 =C2=A0memory =3D=
 &quot;&quot;<br>=C2=A0 =C2=A0 static-max =3D &quot;2097152&quot;<br>=C2=A0=
 =C2=A0 target =3D &quot;2097152&quot;<br>=C2=A0 =C2=A0 videoram =3D &quot;=
0&quot;<br>=C2=A0 =C2=A0device =3D &quot;&quot;<br>=C2=A0 =C2=A0 suspend =
=3D &quot;&quot;<br>=C2=A0 =C2=A0 =C2=A0event-channel =3D &quot;&quot;<br>=
=C2=A0 =C2=A0 vbd =3D &quot;&quot;<br>=C2=A0 =C2=A0 =C2=A051712 =3D &quot;&=
quot;<br>=C2=A0 =C2=A0 =C2=A0 backend =3D &quot;/local/domain/0/backend/vbd=
/1/51712&quot;<br>=C2=A0 =C2=A0 =C2=A0 backend-id =3D &quot;0&quot;<br>=C2=
=A0 =C2=A0 =C2=A0 state =3D &quot;4&quot;<br>=C2=A0 =C2=A0 =C2=A0 virtual-d=
evice =3D &quot;51712&quot;<br>=C2=A0 =C2=A0 =C2=A0 device-type =3D &quot;d=
isk&quot;<br>=C2=A0 =C2=A0 =C2=A0 multi-queue-num-queues =3D &quot;2&quot;<=
br>=C2=A0 =C2=A0 =C2=A0 queue-0 =3D &quot;&quot;<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0ring-ref =3D &quot;8&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0event-channe=
l =3D &quot;4&quot;<br>=C2=A0 =C2=A0 =C2=A0 queue-1 =3D &quot;&quot;<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0ring-ref =3D &quot;9&quot;<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0event-channel =3D &quot;5&quot;<br>=C2=A0 =C2=A0 =C2=A0 protocol =3D =
&quot;arm-abi&quot;<br>=C2=A0 =C2=A0 =C2=A0 feature-persistent =3D &quot;1&=
quot;<br>=C2=A0 =C2=A0 vfb =3D &quot;&quot;<br>=C2=A0 =C2=A0 =C2=A00 =3D &q=
uot;&quot;<br>=C2=A0 =C2=A0 =C2=A0 backend =3D &quot;/local/domain/0/backen=
d/vfb/1/0&quot;<br>=C2=A0 =C2=A0 =C2=A0 backend-id =3D &quot;0&quot;<br>=C2=
=A0 =C2=A0 =C2=A0 state =3D &quot;4&quot;<br>=C2=A0 =C2=A0 =C2=A0 page-ref =
=3D &quot;275022&quot;<br>=C2=A0 =C2=A0 =C2=A0 event-channel =3D &quot;3&qu=
ot;<br>=C2=A0 =C2=A0 =C2=A0 protocol =3D &quot;arm-abi&quot;<br>=C2=A0 =C2=
=A0 =C2=A0 feature-update =3D &quot;1&quot;<br>=C2=A0 =C2=A0 vkbd =3D &quot=
;&quot;<br>=C2=A0 =C2=A0 =C2=A00 =3D &quot;&quot;<br>=C2=A0 =C2=A0 =C2=A0 b=
ackend =3D &quot;/local/domain/0/backend/vkbd/1/0&quot;<br>=C2=A0 =C2=A0 =
=C2=A0 backend-id =3D &quot;0&quot;<br>=C2=A0 =C2=A0 =C2=A0 state =3D &quot=
;4&quot;<br>=C2=A0 =C2=A0 =C2=A0 request-abs-pointer =3D &quot;1&quot;<br>=
=C2=A0 =C2=A0 =C2=A0 page-ref =3D &quot;275322&quot;<br>=C2=A0 =C2=A0 =C2=
=A0 page-gref =3D &quot;1284&quot;<br>=C2=A0 =C2=A0 =C2=A0 event-channel =
=3D &quot;10&quot;<br>=C2=A0 =C2=A0 vif =3D &quot;&quot;<br>=C2=A0 =C2=A0 =
=C2=A00 =3D &quot;&quot;<br>=C2=A0 =C2=A0 =C2=A0 backend =3D &quot;/local/d=
omain/0/backend/vif/1/0&quot;<br>=C2=A0 =C2=A0 =C2=A0 backend-id =3D &quot;=
0&quot;<br>=C2=A0 =C2=A0 =C2=A0 state =3D &quot;4&quot;<br>=C2=A0 =C2=A0 =
=C2=A0 handle =3D &quot;0&quot;<br>=C2=A0 =C2=A0 =C2=A0 mac =3D &quot;e4:5f=
:01:cd:7b:dd&quot;<br>=C2=A0 =C2=A0 =C2=A0 mtu =3D &quot;1500&quot;<br>=C2=
=A0 =C2=A0 =C2=A0 xdp-headroom =3D &quot;0&quot;<br>=C2=A0 =C2=A0 =C2=A0 mu=
lti-queue-num-queues =3D &quot;2&quot;<br>=C2=A0 =C2=A0 =C2=A0 queue-0 =3D =
&quot;&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0tx-ring-ref =3D &quot;1280&quot;=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0rx-ring-ref =3D &quot;1281&quot;<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0event-channel-tx =3D &quot;6&quot;<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0event-channel-rx =3D &quot;7&quot;<br>=C2=A0 =C2=A0 =C2=A0 queue-=
1 =3D &quot;&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0tx-ring-ref =3D &quot;1282=
&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0rx-ring-ref =3D &quot;1283&quot;<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0event-channel-tx =3D &quot;8&quot;<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0event-channel-rx =3D &quot;9&quot;<br>=C2=A0 =C2=A0 =C2=A0=
 request-rx-copy =3D &quot;1&quot;<br>=C2=A0 =C2=A0 =C2=A0 feature-rx-notif=
y =3D &quot;1&quot;<br>=C2=A0 =C2=A0 =C2=A0 feature-sg =3D &quot;1&quot;<br=
>=C2=A0 =C2=A0 =C2=A0 feature-gso-tcpv4 =3D &quot;1&quot;<br>=C2=A0 =C2=A0 =
=C2=A0 feature-gso-tcpv6 =3D &quot;1&quot;<br>=C2=A0 =C2=A0 =C2=A0 feature-=
ipv6-csum-offload =3D &quot;1&quot;<br>=C2=A0 =C2=A0control =3D &quot;&quot=
;<br>=C2=A0 =C2=A0 shutdown =3D &quot;&quot;<br>=C2=A0 =C2=A0 feature-power=
off =3D &quot;1&quot;<br>=C2=A0 =C2=A0 feature-reboot =3D &quot;1&quot;<br>=
=C2=A0 =C2=A0 feature-suspend =3D &quot;&quot;<br>=C2=A0 =C2=A0 sysrq =3D &=
quot;&quot;<br>=C2=A0 =C2=A0 platform-feature-multiprocessor-suspend =3D &q=
uot;1&quot;<br>=C2=A0 =C2=A0 platform-feature-xs_reset_watches =3D &quot;1&=
quot;<br>=C2=A0 =C2=A0data =3D &quot;&quot;<br>=C2=A0 =C2=A0drivers =3D &qu=
ot;&quot;<br>=C2=A0 =C2=A0feature =3D &quot;&quot;<br>=C2=A0 =C2=A0attr =3D=
 &quot;&quot;<br>=C2=A0 =C2=A0error =3D &quot;&quot;<br>=C2=A0 =C2=A0domid =
=3D &quot;1&quot;<br>=C2=A0 =C2=A0store =3D &quot;&quot;<br>=C2=A0 =C2=A0 p=
ort =3D &quot;1&quot;<br>=C2=A0 =C2=A0 ring-ref =3D &quot;233473&quot;<br>=
=C2=A0 =C2=A0console =3D &quot;&quot;<br>=C2=A0 =C2=A0 backend =3D &quot;/l=
ocal/domain/0/backend/console/1/0&quot;<br>=C2=A0 =C2=A0 backend-id =3D &qu=
ot;0&quot;<br>=C2=A0 =C2=A0 limit =3D &quot;1048576&quot;<br>=C2=A0 =C2=A0 =
type =3D &quot;xenconsoled&quot;<br>=C2=A0 =C2=A0 output =3D &quot;pty&quot=
;<br>=C2=A0 =C2=A0 tty =3D &quot;/dev/pts/1&quot;<br>=C2=A0 =C2=A0 port =3D=
 &quot;2&quot;<br>=C2=A0 =C2=A0 ring-ref =3D &quot;233472&quot;<br>=C2=A0 =
=C2=A0 vnc-listen =3D &quot;127.0.0.1&quot;<br>=C2=A0 =C2=A0 vnc-port =3D &=
quot;5900&quot;<br>=C2=A0 =C2=A0image =3D &quot;&quot;<br>=C2=A0 =C2=A0 dev=
ice-model-pid =3D &quot;788&quot;<br>vm =3D &quot;&quot;<br>=C2=A0d81ec5a9-=
5bf9-4f2b-89e8-0f60d6da948f =3D &quot;&quot;<br>=C2=A0 name =3D &quot;guest=
2&quot;<br>=C2=A0 uuid =3D &quot;d81ec5a9-5bf9-4f2b-89e8-0f60d6da948f&quot;=
<br>=C2=A0 start_time =3D &quot;1520600274.27&quot;<br>libxl =3D &quot;&quo=
t;<br>=C2=A01 =3D &quot;&quot;<br>=C2=A0 device =3D &quot;&quot;<br>=C2=A0 =
=C2=A0vbd =3D &quot;&quot;<br>=C2=A0 =C2=A0 51712 =3D &quot;&quot;<br>=C2=
=A0 =C2=A0 =C2=A0frontend =3D &quot;/local/domain/1/device/vbd/51712&quot;<=
br>=C2=A0 =C2=A0 =C2=A0backend =3D &quot;/local/domain/0/backend/vbd/1/5171=
2&quot;<br>=C2=A0 =C2=A0 =C2=A0params =3D &quot;/home/root/guest2/xen-guest=
-image-minimal-raspberrypi4-64.ext3&quot;<br>=C2=A0 =C2=A0 =C2=A0script =3D=
 &quot;/etc/xen/scripts/block&quot;<br>=C2=A0 =C2=A0 =C2=A0frontend-id =3D =
&quot;1&quot;<br>=C2=A0 =C2=A0 =C2=A0online =3D &quot;1&quot;<br>=C2=A0 =C2=
=A0 =C2=A0removable =3D &quot;0&quot;<br>=C2=A0 =C2=A0 =C2=A0bootable =3D &=
quot;1&quot;<br>=C2=A0 =C2=A0 =C2=A0state =3D &quot;1&quot;<br>=C2=A0 =C2=
=A0 =C2=A0dev =3D &quot;xvda&quot;<br>=C2=A0 =C2=A0 =C2=A0type =3D &quot;ph=
y&quot;<br>=C2=A0 =C2=A0 =C2=A0mode =3D &quot;w&quot;<br>=C2=A0 =C2=A0 =C2=
=A0device-type =3D &quot;disk&quot;<br>=C2=A0 =C2=A0 =C2=A0discard-enable =
=3D &quot;1&quot;<br>=C2=A0 =C2=A0vfb =3D &quot;&quot;<br>=C2=A0 =C2=A0 0 =
=3D &quot;&quot;<br>=C2=A0 =C2=A0 =C2=A0frontend =3D &quot;/local/domain/1/=
device/vfb/0&quot;<br>=C2=A0 =C2=A0 =C2=A0backend =3D &quot;/local/domain/0=
/backend/vfb/1/0&quot;<br>=C2=A0 =C2=A0 =C2=A0frontend-id =3D &quot;1&quot;=
<br>=C2=A0 =C2=A0 =C2=A0online =3D &quot;1&quot;<br>=C2=A0 =C2=A0 =C2=A0sta=
te =3D &quot;1&quot;<br>=C2=A0 =C2=A0 =C2=A0vnc =3D &quot;1&quot;<br>=C2=A0=
 =C2=A0 =C2=A0vnclisten =3D &quot;127.0.0.1&quot;<br>=C2=A0 =C2=A0 =C2=A0vn=
cdisplay =3D &quot;0&quot;<br>=C2=A0 =C2=A0 =C2=A0vncunused =3D &quot;1&quo=
t;<br>=C2=A0 =C2=A0 =C2=A0sdl =3D &quot;0&quot;<br>=C2=A0 =C2=A0 =C2=A0open=
gl =3D &quot;0&quot;<br>=C2=A0 =C2=A0vkbd =3D &quot;&quot;<br>=C2=A0 =C2=A0=
 0 =3D &quot;&quot;<br>=C2=A0 =C2=A0 =C2=A0frontend =3D &quot;/local/domain=
/1/device/vkbd/0&quot;<br>=C2=A0 =C2=A0 =C2=A0backend =3D &quot;/local/doma=
in/0/backend/vkbd/1/0&quot;<br>=C2=A0 =C2=A0 =C2=A0frontend-id =3D &quot;1&=
quot;<br>=C2=A0 =C2=A0 =C2=A0online =3D &quot;1&quot;<br>=C2=A0 =C2=A0 =C2=
=A0state =3D &quot;1&quot;<br>=C2=A0 =C2=A0console =3D &quot;&quot;<br>=C2=
=A0 =C2=A0 0 =3D &quot;&quot;<br>=C2=A0 =C2=A0 =C2=A0frontend =3D &quot;/lo=
cal/domain/1/console&quot;<br>=C2=A0 =C2=A0 =C2=A0backend =3D &quot;/local/=
domain/0/backend/console/1/0&quot;<br>=C2=A0 =C2=A0 =C2=A0frontend-id =3D &=
quot;1&quot;<br>=C2=A0 =C2=A0 =C2=A0online =3D &quot;1&quot;<br>=C2=A0 =C2=
=A0 =C2=A0state =3D &quot;1&quot;<br>=C2=A0 =C2=A0 =C2=A0protocol =3D &quot=
;vt100&quot;<br>=C2=A0 =C2=A0vif =3D &quot;&quot;<br>=C2=A0 =C2=A0 0 =3D &q=
uot;&quot;<br>=C2=A0 =C2=A0 =C2=A0frontend =3D &quot;/local/domain/1/device=
/vif/0&quot;<br>=C2=A0 =C2=A0 =C2=A0backend =3D &quot;/local/domain/0/backe=
nd/vif/1/0&quot;<br>=C2=A0 =C2=A0 =C2=A0frontend-id =3D &quot;1&quot;<br>=
=C2=A0 =C2=A0 =C2=A0online =3D &quot;1&quot;<br>=C2=A0 =C2=A0 =C2=A0state =
=3D &quot;1&quot;<br>=C2=A0 =C2=A0 =C2=A0script =3D &quot;/etc/xen/scripts/=
vif-bridge&quot;<br>=C2=A0 =C2=A0 =C2=A0mac =3D &quot;e4:5f:01:cd:7b:dd&quo=
t;<br>=C2=A0 =C2=A0 =C2=A0bridge =3D &quot;xenbr0&quot;<br>=C2=A0 =C2=A0 =
=C2=A0handle =3D &quot;0&quot;<br>=C2=A0 =C2=A0 =C2=A0type =3D &quot;vif&qu=
ot;<br>=C2=A0 =C2=A0 =C2=A0hotplug-status =3D &quot;&quot;<br>=C2=A0 type =
=3D &quot;pvh&quot;<br>=C2=A0 dm-version =3D &quot;qemu_xen&quot;<br>root@r=
aspberrypi4-64:~/guest1#</b><br></div><div><br></div><div>Any input as per =
above? Looking forward to hearing from you.</div><div><br></div><div>Regard=
s,</div><div>Vipul Kumar</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Oct 26, 2022 at 5:21 AM Stefano Stabe=
llini &lt;<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstab=
ellini@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Hi Vipul,<br>
<br>
If you look at the QEMU logs, it says:<br>
<br>
VNC server running on <a href=3D"http://127.0.0.1:5900" rel=3D"noreferrer" =
target=3D"_blank">127.0.0.1:5900</a><br>
<br>
That is the VNC server you need to connect to. So in theory:<br>
<br>
=C2=A0 vncviewer <a href=3D"http://127.0.0.1:5900" rel=3D"noreferrer" targe=
t=3D"_blank">127.0.0.1:5900</a><br>
<br>
should work correctly.<br>
<br>
<br>
If you have:<br>
<br>
=C2=A0 vfb =3D [&quot;type=3Dvnc&quot;]<br>
<br>
in your xl config file and you have &quot;fbdev&quot; in your Linux guest, =
it<br>
should work.<br>
<br>
If you connect to the VNC server but you get a black screen, it might be<br=
>
a guest configuration issue. I would try with a simpler guest, text only<br=
>
(no X11, no Wayland) and enable the fbdev console (fbcon). See<br>
Documentation/fb/fbcon.rst in Linux. You should be able to see a<br>
graphical console over VNC.<br>
<br>
If that works, then you know that the fbdev kernel driver (xen-fbfront)<br>
works correctly.<br>
<br>
If it doesn&#39;t work, the output of &quot;xenstore-ls&quot; would be inte=
resting.<br>
<br>
Cheers,<br>
<br>
Stefano<br>
<br>
<br>
On Wed, 19 Oct 2022, Vipul Suneja wrote:<br>
&gt; Hi Stefano,<br>
&gt; <br>
&gt; Thanks for the response!<br>
&gt; <br>
&gt; I am following the same link you shared from the beginning. Tried the =
command &quot;vncviewer localhost:0&quot; in DOM0 but same issue &quot;Can&=
#39;t open<br>
&gt; display&quot;, below are the logs:<br>
&gt; <br>
&gt; root@raspberrypi4-64:~# vncviewer localhost:0<br>
&gt; <br>
&gt; TigerVNC Viewer 64-bit v1.11.0<br>
&gt; Built on: 2020-09-08 12:16<br>
&gt; Copyright (C) 1999-2020 TigerVNC Team and many others (see README.rst)=
<br>
&gt; See <a href=3D"https://www.tigervnc.org" rel=3D"noreferrer" target=3D"=
_blank">https://www.tigervnc.org</a> for information on TigerVNC.<br>
&gt; Can&#39;t open display:<br>
&gt; <br>
&gt; Below are the netstat logs, i couldn&#39;t see anything running at por=
t 5900 or 5901:<br>
&gt; <br>
&gt; root@raspberrypi4-64:~# netstat -tuwx<br>
&gt; Active Internet connections (w/o servers)<br>
&gt; Proto Recv-Q Send-Q Local Address =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 F=
oreign Address =C2=A0 =C2=A0 =C2=A0 =C2=A0 State =C2=A0 =C2=A0 =C2=A0<br>
&gt; tcp =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0164 192.168.1.39:ssh =C2=
=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://192.168.1.38:37472" rel=3D"norefe=
rrer" target=3D"_blank">192.168.1.38:37472</a> =C2=A0 =C2=A0 =C2=A0ESTABLIS=
HED<br>
&gt; Active UNIX domain sockets (w/o servers)<br>
&gt; Proto RefCnt Flags =C2=A0 =C2=A0 =C2=A0 Type =C2=A0 =C2=A0 =C2=A0 Stat=
e =C2=A0 =C2=A0 =C2=A0 =C2=A0 I-Node Path<br>
&gt; unix =C2=A08 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 DGRAM=
 =C2=A0 =C2=A0 =C2=A0CONNECTED =C2=A0 =C2=A0 =C2=A010565 /dev/log<br>
&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREA=
M =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A010891 /var/run/xenstored/sock=
et<br>
&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREA=
M =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A013791<br>
&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREA=
M =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A010843 /var/run/xenstored/sock=
et<br>
&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREA=
M =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A010573 /var/run/xenstored/sock=
et<br>
&gt; unix =C2=A02 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 DGRAM=
 =C2=A0 =C2=A0 =C2=A0CONNECTED =C2=A0 =C2=A0 =C2=A014510<br>
&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREA=
M =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A013249<br>
&gt; unix =C2=A02 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 DGRAM=
 =C2=A0 =C2=A0 =C2=A0CONNECTED =C2=A0 =C2=A0 =C2=A013887<br>
&gt; unix =C2=A02 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 DGRAM=
 =C2=A0 =C2=A0 =C2=A0CONNECTED =C2=A0 =C2=A0 =C2=A010599<br>
&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREA=
M =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A014005<br>
&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREA=
M =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A013258<br>
&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREA=
M =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A013248<br>
&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREA=
M =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A014003<br>
&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREA=
M =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A010572 /var/run/xenstored/sock=
et<br>
&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREA=
M =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A010786 /var/run/xenstored/sock=
et<br>
&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 DGRAM=
 =C2=A0 =C2=A0 =C2=A0CONNECTED =C2=A0 =C2=A0 =C2=A013186<br>
&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREA=
M =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A010864 /var/run/xenstored/sock=
et<br>
&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREA=
M =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A010812 /var/run/xenstored/sock=
et<br>
&gt; unix =C2=A02 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 DGRAM=
 =C2=A0 =C2=A0 =C2=A0CONNECTED =C2=A0 =C2=A0 =C2=A014083<br>
&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREA=
M =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A010813 /var/run/xenstored/sock=
et<br>
&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREA=
M =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A014068<br>
&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREA=
M =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A013256<br>
&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREA=
M =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A010571 /var/run/xenstored/sock=
et<br>
&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREA=
M =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A010842<br>
&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREA=
M =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A013985<br>
&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 DGRAM=
 =C2=A0 =C2=A0 =C2=A0CONNECTED =C2=A0 =C2=A0 =C2=A013185<br>
&gt; unix =C2=A02 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREA=
M =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A013884<br>
&gt; unix =C2=A02 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 DGRAM=
 =C2=A0 =C2=A0 =C2=A0CONNECTED =C2=A0 =C2=A0 =C2=A014528<br>
&gt; unix =C2=A02 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 DGRAM=
 =C2=A0 =C2=A0 =C2=A0CONNECTED =C2=A0 =C2=A0 =C2=A013785<br>
&gt; unix =C2=A03 =C2=A0 =C2=A0 =C2=A0[ ] =C2=A0 =C2=A0 =C2=A0 =C2=A0 STREA=
M =C2=A0 =C2=A0 CONNECTED =C2=A0 =C2=A0 =C2=A014034<br>
&gt; <br>
&gt; Attaching xen log files of /var/log/xen.<br>
&gt; I didn&#39;t get the role of QEMU here because as mentioned earlier, I=
 am porting in raspberrypi 4B.<br>
&gt; <br>
&gt; Regards,<br>
&gt; Vipul Kumar<br>
&gt; <br>
&gt; On Wed, Oct 19, 2022 at 12:43 AM Stefano Stabellini &lt;<a href=3D"mai=
lto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt=
; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0It usually works the way it is described in =
the guide:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://www.virtuatopia.com/index=
.php?title=3DConfiguring_a_VNC_based_Graphical_Console_for_a_Xen_Paravirtua=
lized_domainU_Guest" rel=3D"noreferrer" target=3D"_blank">https://www.virtu=
atopia.com/index.php?title=3DConfiguring_a_VNC_based_Graphical_Console_for_=
a_Xen_Paravirtualized_domainU_Guest</a><br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0You don&#39;t need to install any VNC-relate=
d server software because it is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0already provided by Xen (to be precise it is=
 provided by QEMU working<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0together with Xen.)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0You only need the vnc client in dom0 so that=
 you can connect, but you<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0could also run the vnc client outside from a=
nother host. So basically<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0the following should work when executed in D=
om0 after creating DomU:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 vncviewer localhost:0<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Can you attach the Xen and QEMU logs (/var/l=
og/xen/*)? And also use<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0netstat -taunp to check if there is anything=
 running at port 5900 or<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A05901?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Cheers,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Stefano<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On Tue, 18 Oct 2022, Vipul Suneja wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hi Stefano,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Thanks for the response!<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I could install tigerVNC, x11vnc &amp; =
libvncserver in Dom0 xen-image-minimal but only manage to install libvncser=
ver(couldn&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install tigervnc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &amp; x11vnc because of x11<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; support missing, it&#39;s wayland) in D=
OMU custom graphical image. I tried running vncviewer with IP address &amp;=
 port in dom0 to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0access the domu<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; graphical image display as per below co=
mmands.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0vncviewer <a href=3D"http://192.1=
68.1.42:5901" rel=3D"noreferrer" target=3D"_blank">192.168.1.42:5901</a><br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0But it showing can&#39;t open dis=
play, below are the logs:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; root@raspberrypi4-64:~/guest1# vncviewe=
r <a href=3D"http://192.168.1.42:5901" rel=3D"noreferrer" target=3D"_blank"=
>192.168.1.42:5901</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; TigerVNC Viewer 64-bit v1.11.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Built on: 2020-09-08 12:16<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Copyright (C) 1999-2020 TigerVNC Team a=
nd many others (see README.rst)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; See <a href=3D"https://www.tigervnc.org=
" rel=3D"noreferrer" target=3D"_blank">https://www.tigervnc.org</a> for inf=
ormation on TigerVNC.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Can&#39;t open display:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; root@raspberrypi4-64:~/guest1#<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I am not exactly=C2=A0sure what the iss=
ue is but I thought only libvncserver in DOMU could work to get access but =
it did not<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0work.=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; If TigerVNC is the issue here then is t=
here any other VNC source which could be installed for both x11 &amp; wayla=
nd supported<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0images?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Vipul Kumar<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; On Tue, Oct 18, 2022 at 2:40 AM Stefano=
 Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank"=
>sstabellini@kernel.org</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VNC is typica=
lly easier to setup, because SDL needs extra libraries at<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0build time an=
d runtime. If QEMU is built without SDL support it won&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0start when yo=
u ask for SDL.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VNC should wo=
rk with both x11 and wayland in your domU. It doesn&#39;t work<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0at the x11 le=
vel, it exposes a special fbdev device in your domU that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0should work w=
ith:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- a graphical=
 console in Linux domU<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- x11<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- wayland (bu=
t I haven&#39;t tested this so I am not 100% sure about it)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0When you say =
&quot;it doesn&#39;t work&quot;, what do you mean? Do you get a black<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0window?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0You need CONF=
IG_XEN_FBDEV_FRONTEND in Linux domU<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(drivers/vide=
o/fbdev/xen-fbfront.c). I would try to get a graphical text<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0console up an=
d running in your domU before attempting x11/wayland.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Cheers,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Stefano<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On Mon, 17 Oc=
t 2022, Vipul Suneja wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hi,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Thanks!<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I have p=
orted xen minimal image as DOM0 &amp; custom wayland GUI based image as DOM=
U in raspberry pi4B. I am trying to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0make GUI<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0display up<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; for=C2=
=A0guest machine. I tried using=C2=A0sdl, included below line in guest.conf=
 file<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; vfb=3D [=
 &#39;sdl=3D1&#39; ]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; But it i=
s throwing below error:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; root@ras=
pberrypi4-64:~/guest1# xl create -c guest1.cfg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Parsing =
config from guest1.cfg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; libxl: e=
rror: libxl_qmp.c:1400:qmp_ev_fd_callback: Domain 3:error on QMP socket: Co=
nnection reset by peer<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; libxl: e=
rror: libxl_qmp.c:1439:qmp_ev_fd_callback: Domain 3:Error happened with the=
 QMP connection to QEMU<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; libxl: e=
rror: libxl_dm.c:3351:device_model_postconfig_done: Domain 3:Post DM startu=
p configs failed, rc=3D-26<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; libxl: e=
rror: libxl_create.c:1867:domcreate_devmodel_started: Domain 3:device model=
 did not start: -26<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; libxl: e=
rror: libxl_aoutils.c:646:libxl__kill_xs_path: Device Model already exited<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; libxl: e=
rror: libxl_domain.c:1183:libxl__destroy_domid: Domain 3:Non-existant domai=
n<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; libxl: e=
rror: libxl_domain.c:1137:domain_destroy_callback: Domain 3:Unable to destr=
oy guest<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; libxl: e=
rror: libxl_domain.c:1064:domain_destroy_cb: Domain 3:Destruction of domain=
 failed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Another =
way is VNC, i could install tigervnc in DOM0 but same i couldn&#39;t in gue=
st machine because it doesn&#39;t support<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0x11(supports =
wayland<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; only). I=
 am completely blocked here, Need your support to enable the display up.<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Any alte=
rnative of VNC which could work in both x11 &amp; wayland supported images?=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Any inpu=
t on VNC, SDL or any other way to proceed on this? Looking forward to heari=
ng from you.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Regards,=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Vipul Ku=
mar<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
&gt; <br>
&gt; </blockquote></div>
</blockquote></div>

--00000000000038e94005ecdede34--

