Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D9764CFC8
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 19:55:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462564.720714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Wtv-00066A-WE; Wed, 14 Dec 2022 18:54:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462564.720714; Wed, 14 Dec 2022 18:54:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Wtv-00063B-SQ; Wed, 14 Dec 2022 18:54:43 +0000
Received: by outflank-mailman (input) for mailman id 462564;
 Wed, 14 Dec 2022 18:54:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ovgA=4M=gmail.com=vsuneja63@srs-se1.protection.inumbo.net>)
 id 1p5Wts-000635-St
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 18:54:41 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1245fa3-7be0-11ed-91b6-6bf2151ebd3b;
 Wed, 14 Dec 2022 19:54:36 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id b2so46782628eja.7
 for <xen-devel@lists.xenproject.org>; Wed, 14 Dec 2022 10:54:36 -0800 (PST)
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
X-Inumbo-ID: c1245fa3-7be0-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8PQy8IfZHDWZBSdUCOgh+KNqmH7KkIujGCosGAeTWUA=;
        b=TX7zsUNN1guwdbUCGF7LHccltLmloCEvYMl3T5zRuhHwibtMngXTZxf1SYTx1vZUE1
         hj8UL8GPupD8+2AKdeyC+NVCgZUkW2DNOhFVgdbFPCH5L2VDsInCZB5gI3X0VgGDmd09
         kvWGp0NfBsnA/OCUEV/UuhTFWuilsmAIjfzIe6aip9AFJPPCqR9duFBSggcZyDvWBWmM
         /PQjabDx4l6SxAoTsCeD80A8lekO/PgInL5KjVPok71JQ32RqXXr/HsMYN8o+pHnaFUy
         hQFt2p/OpPZ3IgK0YwLKXgIuFpUhg5s25dwLyQ1B7O5RXY2JMod1BUNC/0rwk/NyzQmr
         NZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8PQy8IfZHDWZBSdUCOgh+KNqmH7KkIujGCosGAeTWUA=;
        b=mI4RsWq3nHqhN8e5rceSb44y8UNtB1reqXz8n6ep9CPEXNadij5vmanVGQXuEkGPPm
         OkOMLVlQxI9QmBvE88Yit4IdHjjHxUacZ0xGZ3Wfvd5SigjdTE2GnfGgVfjMGGbwUXL+
         hSUfwUo78Nh/lLSa7RqjMN7hCIDYIGHXe/w1o385HQ4z2JS5psd+yF6VzsW+VVxYecs5
         Jg+bH7hLB0mX7KH1kFJfTAH/yl7p8oVbYEjOhvTsDq4MVqCLT+Mq11bKiHJpZb2Tmb7r
         CcLrV89XWiTV9xZbxwPTDTBdRmx485kjM/O3FMLM7rEbcSFZ+jHtxRGC0MtTW9YT2ftg
         YnZQ==
X-Gm-Message-State: ANoB5pk+AsY00GuOlDTIa+cgYLFxHFLabdhjoD7BSB8wlhgbxCPKIyfK
	wFkdVwcFL29ot6Jbgj8lHTqes6WHwEPN9malk0H9/JaFA+8ooA==
X-Google-Smtp-Source: AA0mqf6ftuToxgJQFV/uVZ7d+jIe94UIOkNpnYm62TbPOo/SHR+RHA1OI0xqJ/X6a41EoWB9nrxmkZOhdYqFAVwWrFk=
X-Received: by 2002:a17:906:6859:b0:7c1:ff6:615b with SMTP id
 a25-20020a170906685900b007c10ff6615bmr9101727ejs.118.1671044075371; Wed, 14
 Dec 2022 10:54:35 -0800 (PST)
MIME-Version: 1.0
References: <CALAP8f--jyG=ufJ9WGtL6qoeGdsykjNK85G3q50SzJm5+wOzhQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2210181213370.4587@ubuntu-linux-20-04-desktop>
 <CALAP8f9Zgue6WfAk2uRGkg=1Up2Z+eQWqvQ1_Z2=r66Z5fvKoA@mail.gmail.com>
 <alpine.DEB.2.22.394.2210251641540.1397955@ubuntu-linux-20-04-desktop>
 <CALAP8f8Z8A2u8h56EJWOCN7nJFDvyEvM-Q85XMnUP6Y6mZDg3w@mail.gmail.com>
 <CALAP8f_n2okQ-Ss_kGACAq3BVYXS_D2P_8AyhOzUxqgWpz9f4g@mail.gmail.com>
 <alpine.DEB.2.22.394.2211101702250.50442@ubuntu-linux-20-04-desktop>
 <CALAP8f8zGfNA_CZU4UQXy7-rPT6dqih9XpzuKM3vvkoBvy6usg@mail.gmail.com>
 <alpine.DEB.2.22.394.2211221605470.1049131@ubuntu-linux-20-04-desktop>
 <CALAP8f_QiHN4dP3z+LQgKdGeo8-=9DMyk0W7+x6P2eHvnOD_wQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2212011128430.4039@ubuntu-linux-20-04-desktop>
 <CALAP8f_b=0m0dqj9a50UYXYfw9X873i07sG9eyxFSqxF0yEneQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2212121406270.3075842@ubuntu-linux-20-04-desktop>
 <CALAP8f9JY23ZyDGnku4iWf5YCamSQKsZtdZj3MhX9TrF7wgEpw@mail.gmail.com> <alpine.DEB.2.22.394.2212131518180.315094@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2212131518180.315094@ubuntu-linux-20-04-desktop>
From: Vipul Suneja <vsuneja63@gmail.com>
Date: Thu, 15 Dec 2022 00:24:23 +0530
Message-ID: <CALAP8f-fka4jicvLhzS8NFyyqD_NnffMxrZmqpz-x9JnL7Oy7w@mail.gmail.com>
Subject: Re: Porting Xen in raspberry pi4B
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, oleksandr_andrushchenko@epam.com, 
	oleksandr_tyshchenko@epam.com, jgross@suse.com, boris.ostrovsky@oracle.com, 
	Bertrand.Marquis@arm.com
Content-Type: multipart/alternative; boundary="00000000000084411105efce444c"

--00000000000084411105efce444c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefano,

Thanks!

I could see QEMU 6.2.0 compiled & installed in the host image
xen-image-minimal. I could find xenfb.c source file also & modified the
same with debug logs.
I have set up a cross compile environment, did 'make clean' & 'make all' to
recompile but it's failing. In case i am doing wrong, Can you please assist
me
with the correct steps to compile qemu?
Below are the error logs:

agl@agl-OptiPlex-7010:~/Automotive/ADAS_Infotainment/Platform/Poky_Kirkston=
e/build/tmp/work/cortexa72-poky-linux/qemu/6.2.0-r0/build$
make all
[1/3864] Compiling C object libslirp.a.p/slirp_src_arp_table.c.o
[2/3864] Compiling C object
subprojects/libvhost-user/libvhost-user.a.p/libvhost-user.c.o
[3/3864] Linking static target subprojects/libvhost-user/libvhost-user.a
[4/3864] Compiling C object libslirp.a.p/slirp_src_vmstate.c.o
[5/3864] Compiling C object libslirp.a.p/slirp_src_dhcpv6.c.o
[6/3864] Compiling C object libslirp.a.p/slirp_src_dnssearch.c.o
[7/3864] Compiling C object libslirp.a.p/slirp_src_bootp.c.o
[8/3864] Compiling C object libslirp.a.p/slirp_src_cksum.c.o
[9/3864] Compiling C object libslirp.a.p/slirp_src_if.c.o
[10/3864] Compiling C object libslirp.a.p/slirp_src_ip6_icmp.c.o
[11/3864] Compiling C object libslirp.a.p/slirp_src_ip6_input.c.o
[12/3864] Compiling C object libslirp.a.p/slirp_src_ip6_output.c.o
[13/3864] Compiling C object libslirp.a.p/slirp_src_ip_icmp.c.o
[14/3864] Compiling C object libslirp.a.p/slirp_src_ip_input.c.o
[15/3864] Compiling C object libslirp.a.p/slirp_src_ip_output.c.o
[16/3864] Compiling C object libslirp.a.p/slirp_src_mbuf.c.o
[17/3864] Compiling C object libslirp.a.p/slirp_src_misc.c.o
[18/3864] Compiling C object libslirp.a.p/slirp_src_ncsi.c.o
[19/3864] Compiling C object libslirp.a.p/slirp_src_ndp_table.c.o
[20/3864] Compiling C object libslirp.a.p/slirp_src_sbuf.c.o
[21/3864] Compiling C object libslirp.a.p/slirp_src_slirp.c.o
[22/3864] Compiling C object libslirp.a.p/slirp_src_socket.c.o
[23/3864] Compiling C object libslirp.a.p/slirp_src_state.c.o
[24/3864] Compiling C object libslirp.a.p/slirp_src_stream.c.o
[25/3864] Compiling C object libslirp.a.p/slirp_src_tcp_input.c.o
[26/3864] Compiling C object libslirp.a.p/slirp_src_tcp_output.c.o
[27/3864] Compiling C object libslirp.a.p/slirp_src_tcp_subr.c.o
[28/3864] Compiling C object libslirp.a.p/slirp_src_tcp_timer.c.o
[29/3864] Compiling C object libslirp.a.p/slirp_src_tftp.c.o
[30/3864] Compiling C object libslirp.a.p/slirp_src_udp.c.o
[31/3864] Compiling C object libslirp.a.p/slirp_src_udp6.c.o
[32/3864] Compiling C object libslirp.a.p/slirp_src_util.c.o
[33/3864] Compiling C object libslirp.a.p/slirp_src_version.c.o
[34/3864] Linking static target libslirp.a
[35/3864] Generating qemu-version.h with a custom command (wrapped by meson
to capture output)
FAILED: qemu-version.h
/home/agl/Automotive/ADAS_Infotainment/Platform/Poky_Kirkstone/build/tmp/wo=
rk/cortexa72-poky-linux/qemu/6.2.0-r0/recipe-sysroot-native/usr/bin/meson
--internal exe --capture qemu-version.h --
/home/agl/Automotive/ADAS_Infotainment/Platform/Poky_Kirkstone/build/tmp/wo=
rk/cortexa72-poky-linux/qemu/6.2.0-r0/qemu-6.2.0/scripts/qemu-version.sh
/home/agl/Automotive/ADAS_Infotainment/Platform/Poky_Kirkstone/build/tmp/wo=
rk/cortexa72-poky-linux/qemu/6.2.0-r0/qemu-6.2.0
'' 6.2.0
/usr/bin/env: =E2=80=98nativepython3=E2=80=99: No such file or directory
ninja: build stopped: subcommand failed.
make: *** [Makefile:162: run-ninja] Error 1

Thanks & Regards,
Vipul Kumar

On Wed, Dec 14, 2022 at 4:55 AM Stefano Stabellini <sstabellini@kernel.org>
wrote:

> Hi Vipul,
>
> Good progress! The main function we should check is "xenfb_refresh" but
> from the logs it looks like it is called several times. Which means that
> everything seems to be working as expected on the Linux side.
>
> It is time to investigate the QEMU side:
> ./hw/display/xenfb.c:xenfb_handle_events
> ./hw/display/xenfb.c:xenfb_map_fb
>
> I wonder if the issue is internal to QEMU. You might want to use an
> older QEMU version to check if it works, maybe 6.0 or 5.0 or even 4.0.
> I also wonder if it is a problem between xenfb.c and the rest of QEMU. I
> would investigate how xenfb->pixels is rendered by the rest of QEMU.
> Specifically you might want to look at the call to
> qemu_create_displaysurface, qemu_create_displaysurface_from and
> dpy_gfx_replace_surface in xenfb_update.
>
> I hope this helps.
>
> Cheers,
>
> Stefano
>
>
> On Tue, 13 Dec 2022, Vipul Suneja wrote:
> > Hi Stefano,
> >
> > Thanks!
> >
> > I modified xen-fbfront.c source file, included printk debug logs & cros=
s
> compiled it. I included the printk debug log at the entry & exit
> > of all functions of xen-fbfront.c file.
> > Generated kernel module & loaded in guest machine at bootup. I could se=
e
> lots of logs coming up, and could see multiple functions being
> > invoked even if I have not used vncviewer in the host. Attaching the lo=
g
> file for reference. Any specific function or parameters that have
> > to be checked or any other suggestion as per logs?
> >
> > Thanks & Regards,
> > Vipul Kumar
> >
> > On Tue, Dec 13, 2022 at 3:44 AM Stefano Stabellini <
> sstabellini@kernel.org> wrote:
> >       Hi Vipul,
> >
> >       I am online on IRC OFTC #xendevel (https://www.oftc.net/, you
> need a
> >       registered nickname to join #xendevel).
> >
> >       For development and debugging I find that it is a lot easier to
> >       crosscompile the kernel "by hand", and do a monolithic build,
> rather
> >       than going through Yocto.
> >
> >       For instance the following builds for me:
> >
> >       cd linux.git
> >       export ARCH=3Darm64
> >       export CROSS_COMPILE=3D/path/to/cross-compiler
> >       make defconfig
> >       [add printks to drivers/video/fbdev/xen-fbfront.c]
> >       make -j8 Image.gz
> >
> >       And Image.gz boots on Xen as DomU kernel without issues.
> >
> >       Cheers,
> >
> >       Stefano
> >
> >       On Sat, 10 Dec 2022, Vipul Suneja wrote:
> >       > Hi Stefano,
> >       >
> >       > Thanks!
> >       >
> >       > I have included printk debug logs in the xen-fbfront.c source
> file. While cross compiling to generate .ko with
> >       "xen-guest-image-minimal"
> >       > toolchain it's throwing a modpost
> >       > not found error. I could see the modpost.c source file but the
> final script is missing. Any input on this, Below are the
> >       logs:
> >       >
> >       > agl@agl-OptiPlex-7010:~/Automotive/ADAS_Infotainment/project/Ap=
plication/Xen/Framebuffer$
> make
> >       > make ARCH=3Darm64
> -I/opt/poky/4.0.5/sysroots/cortexa72-poky-linux/usr/include/asm -C
> >       >
> /opt/poky/4.0.5/sysroots/cortexa72-poky-linux/lib/modules/5.15.72-yocto-s=
tandard/build
> >       >
> M=3D/home/agl/Automotive/ADAS_Infotainment/project/Application/Xen/Frameb=
uffer
> modules
> >       > make[1]: Entering directory
> '/opt/poky/4.0.5/sysroots/cortexa72-poky-linux/lib/modules/5.15.72-yocto-=
standard/build'
> >       > arch/arm64/Makefile:36: Detected assembler with broken .inst;
> disassembly will be unreliable
> >       > warning: the compiler differs from the one used to build the
> kernel
> >       >   The kernel was built by: gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1)
> 9.4.0
> >       >   You are using:           aarch64-poky-linux-gcc (GCC) 11.3.0
> >       >   CC [M]
>  /home/agl/Automotive/ADAS_Infotainment/project/Application/Xen/Framebuff=
er/xen-fbfront.o
> >       >   MODPOST
> /home/agl/Automotive/ADAS_Infotainment/project/Application/Xen/Framebuffe=
r/Module.symvers
> >       > /bin/sh: 1: scripts/mod/modpost: not found
> >       > make[2]: *** [scripts/Makefile.modpost:133:
> >
>  /home/agl/Automotive/ADAS_Infotainment/project/Application/Xen/Framebuff=
er/Module.symvers]
> >       > Error 127
> >       > make[1]: *** [Makefile:1813: modules] Error 2
> >       > make[1]: Leaving directory
> '/opt/poky/4.0.5/sysroots/cortexa72-poky-linux/lib/modules/5.15.72-yocto-=
standard/build'
> >       > make: *** [Makefile:5: all] Error 2
> >       > agl@agl-OptiPlex-7010:~/Automotive/ADAS_Infotainment/project/Ap=
plication/Xen/Framebuffer$
> ls -l
> >       > total 324
> >       > -rwxrwxrwx 1 agl agl    359 Dec 10 22:41 Makefile
> >       > -rw-rw-r-- 1 agl agl     90 Dec 10 22:49 modules.order
> >       > -rw-r--r-- 1 agl agl  18331 Dec  1 20:32 xen-fbfront.c
> >       > -rw-rw-r-- 1 agl agl     90 Dec 10 22:49 xen-fbfront.mod
> >       > -rw-rw-r-- 1 agl agl 297832 Dec 10 22:49 xen-fbfront.o
> >       > agl@agl-OptiPlex-7010:~/Automotive/ADAS_Infotainment/project/Ap=
plication/Xen/Framebuffer$
> file xen-fbfront.o
> >       > xen-fbfront.o: ELF 64-bit LSB relocatable, ARM aarch64, version
> 1 (SYSV), with debug_info, not stripped
> >       > agl@agl-OptiPlex-7010
> :~/Automotive/ADAS_Infotainment/project/Application/Xen/Framebuffer$
> >       >
> >       > I have connected a HDMI based 1980x1024 resolution display
> screen to raspberrypi4 for testing purposes. I hope connecting
> >       this display to
> >       > rpi4 should be ok.
> >       >
> >       > Is there any other way we can connect also for detailed
> discussion on the display bringup issue? This will really help to
> >       resolve this
> >       > issue.
> >       >
> >       > Thanks & Regards,
> >       > Vipul Kumar
> >       >
> >       > On Fri, Dec 2, 2022 at 1:02 AM Stefano Stabellini <
> sstabellini@kernel.org> wrote:
> >       >       On Thu, 1 Dec 2022, Vipul Suneja wrote:
> >       >       > Hi Stefano,
> >       >       > Thanks!
> >       >       >
> >       >       > I am exploring both options here, modification of
> framebuffer source file & setting up x11vnc server in guest.
> >       >       > Other than these I would like to share a few findings
> with you.
> >       >       >
> >       >       > 1. If i keep "CONFIG_XEN_FBDEV_FRONTEND=3Dy" then
> xen-fbfront.ko is not generating but if i keep
> >       "CONFIG_XEN_FBDEV_FRONTEND=3Dm"
> >       >       > then could see xen-fbfront.ko & its loading also. Same
> things with other frontend/backend drivers also. Do we need to
> >       >       configure these
> >       >       > drivers as a module(m) only?
> >       >
> >       >       xen-fbfront should work both as a module (xen-fbfront.ko)
> or built-in
> >       >       (CONFIG_XEN_FBDEV_FRONTEND=3Dy).
> >       >
> >       >
> >       >
> >       >       > 2. I could see xenstored service is running for the hos=
t
> but it's always failing for the guest machine. I could see
> >       it in
> >       >       bootup logs & via
> >       >       > systemctl status also.
> >       >
> >       >       That is normal. xenstored is only meant to be run in Dom0=
,
> not in the
> >       >       domUs. If you use the same rootfs for Dom0 and DomU then
> xenstored will
> >       >       fail starting in the DomU (but should succeed in Dom0),
> which is what we
> >       >       want.
> >       >
> >       >       If you run "xenstore-ls" in Dom0, you'll see a bunch of
> entries,
> >       >       including some of them related to "vfb" which is the
> virtual framebuffer
> >       >       protocol. You should also see an entry called "state" set
> to "4" which
> >       >       means "connected". state =3D 4 is usually when everything
> works. Normally
> >       >       when things don't work state !=3D 4.
> >       >
> >       >
> >       >
> >       >       > Below are the logs:
> >       >       > [  OK  ] Reached target Basic System.
> >       >       > [  OK  ] Started Kernel Logging Service.
> >       >       > [  OK  ] Started System Logging Service.
> >       >       >          Starting D-Bus System Message Bus...
> >       >       >          Starting User Login Management...
> >       >       >          Starting Permit User Sessions...
> >       >       >          Starting The Xen xenstore...
> >       >       >          Starting OpenSSH Key Generation...
> >       >       > [FAILED] Failed to start The Xen xenstore.
> >       >       > See 'systemctl status xenstored.service' for details.
> >       >       > [DEPEND] Dependency failed for qemu for xen dom0 disk
> backend.
> >       >       > [DEPEND] Dependency failed for Xend=E2=80=A6p guests on=
 boot and
> shutdown.
> >       >       > [DEPEND] Dependency failed for xen-=E2=80=A6des, JSON
> configuration stub).
> >       >       > [DEPEND] Dependency failed for Xenc=E2=80=A6guest conso=
les and
> hypervisor.
> >       >       > [  OK  ] Finished Permit User Sessions.
> >       >       > [  OK  ] Started Getty on tty1.
> >       >       > [  OK  ] Started Serial Getty on hvc0.
> >       >       > [  OK  ] Started Serial Getty on ttyS0.
> >       >       > [  OK  ] Reached target Login Prompts.
> >       >       >          Starting Xen-watchdog - run xen watchdog
> daemon...
> >       >       > [  OK  ] Started D-Bus System Message Bus.
> >       >       > [  OK  ] Started Xen-watchdog - run xen watchdog daemon=
.
> >       >       > [  OK  ] Finished OpenSSH Key Generation.
> >       >       > [  OK  ] Started User Login Management.
> >       >       > [  OK  ] Reached target Multi-User System.
> >       >       >          Starting Record Runlevel Change in UTMP...
> >       >       > [  OK  ] Finished Record Runlevel Change in UTMP.
> >       >       > fbcon: Taking over console
> >       >       >
> >       >       > Poky (Yocto Project Reference Distro) 4.0.4
> raspberrypi4-64 hvc0
> >       >       >
> >       >       > raspberrypi4-64 login: root
> >       >       > root@raspberrypi4-64:~#
> >       >       > root@raspberrypi4-64:~#
> >       >       > root@raspberrypi4-64:~# systemctl status
> xenstored.service
> >       >       > x xenstored.service - The Xen xenstore
> >       >       >      Loaded: loaded
> (/lib/systemd/system/xenstored.service; enabled; vendor preset: enabled)
> >       >       >      Active: failed (Result: exit-code) since Thu
> 2022-12-01 06:12:05 UTC; 26s ago
> >       >       >     Process: 195 ExecStartPre=3D/bin/grep -q control_d
> /proc/xen/capabilities (code=3Dexited, status=3D1/FAILURE)
> >       >       >
> >       >       > Dec 01 06:12:04 raspberrypi4-64 systemd[1]: Starting Th=
e
> Xen xenstore...
> >       >       > Dec 01 06:12:05 raspberrypi4-64 systemd[1]:
> xenstored.service: Control pro...URE
> >       >       > Dec 01 06:12:05 raspberrypi4-64 systemd[1]:
> xenstored.service: Failed with...e'.
> >       >       > Dec 01 06:12:05 raspberrypi4-64 systemd[1]: Failed to
> start The Xen xenstore.
> >       >       > Hint: Some lines were ellipsized, use -l to show in ful=
l.
> >       >       > root@raspberrypi4-64:~#
> >       >       >
> >       >       > Any input on these?
> >       >       >
> >       >       > Thanks & Regards,
> >       >       > Vipul Kumar
> >       >       >
> >       >       > On Wed, Nov 23, 2022 at 5:41 AM Stefano Stabellini <
> sstabellini@kernel.org> wrote:
> >       >       >       Hi Vipul,
> >       >       >
> >       >       >       I cannot spot any issue in the configuration, in
> particual you have:
> >       >       >
> >       >       >       CONFIG_XEN_FBDEV_FRONTEND=3Dy
> >       >       >
> >       >       >       which is what you need.
> >       >       >
> >       >       >       The only thing I can suggest is to add printks to
> the Linux frontend
> >       >       >       driver (the one running in the domU) which is
> >       >       >       drivers/video/fbdev/xen-fbfront.c and printfs to
> the QEMU backend
> >       >       >       (running in Dom0) which is hw/display/xenfb.c to
> figure out what is
> >       >       >       going on.
> >       >       >
> >       >       >
> >       >       >       Alternatively, you can setup PV network with the
> domU, such as:
> >       >       >
> >       >       >         vif=3D['']
> >       >       >
> >       >       >       and then run x11 and a x11vnc server in your domU=
.
> You should be able to
> >       >       >       connect to it using vncviewer at the network IP o=
f
> your domU.
> >       >       >
> >       >       >       Basically you are skipping the problem because
> instead of using the PV
> >       >       >       framebuffer protocol, you just use VNC over the
> network with the domU.
> >       >       >
> >       >       >
> >       >       >       Cheers,
> >       >       >
> >       >       >       Stefano
> >       >       >
> >       >       >
> >       >       >       On Tue, 22 Nov 2022, Vipul Suneja wrote:
> >       >       >       > Hi Stefano,
> >       >       >       > Thanks for the support!
> >       >       >       >
> >       >       >       > Looks like I have tried all the combinations &
> possible ways to get display up but failed. Is there any
> >       document or
> >       >       pdf for
> >       >       >       porting xen on
> >       >       >       > raspberrypi4.
> >       >       >       > I could find lot's of links telling the same bu=
t
> couldn't see any official user guide or document from the
> >       xen
> >       >       community on
> >       >       >       the same. If
> >       >       >       > there is something to refer
> >       >       >       > to please share with me.
> >       >       >       > I am attaching the kernel configuration file
> also, just take a look if i have missed anything.
> >       >       >       > Any other suggestions or input from your end
> could be really helpful?
> >       >       >       >
> >       >       >       > Regards,
> >       >       >       > Vipul Kumar
> >       >       >       >
> >       >       >       > On Fri, Nov 11, 2022 at 6:40 AM Stefano
> Stabellini <sstabellini@kernel.org> wrote:
> >       >       >       >       Hi Vipul,
> >       >       >       >
> >       >       >       >       Sorry for the late reply. From the earlie=
r
> logs that you sent, it looks
> >       >       >       >       like everything should be working
> correctly. Specifically:
> >       >       >       >
> >       >       >       >            vfb =3D ""
> >       >       >       >             1 =3D ""
> >       >       >       >              0 =3D ""
> >       >       >       >               frontend =3D
> "/local/domain/1/device/vfb/0"
> >       >       >       >               frontend-id =3D "1"
> >       >       >       >               online =3D "1"
> >       >       >       >               state =3D "4"
> >       >       >       >               vnc =3D "1"
> >       >       >       >               vnclisten =3D "127.0.0.1"
> >       >       >       >               vncdisplay =3D "0"
> >       >       >       >               vncunused =3D "1"
> >       >       >       >               sdl =3D "0"
> >       >       >       >               opengl =3D "0"
> >       >       >       >               feature-resize =3D "1"
> >       >       >       >               hotplug-status =3D "connected"
> >       >       >       >               request-update =3D "1"
> >       >       >       >
> >       >       >       >       state "4" means "connected". So I would
> expect that you should be able
> >       >       >       >       to connect to the vnc server using
> vncviewer. You might not see anything
> >       >       >       >       (black screen) but you should definitely
> be able to connect.
> >       >       >       >
> >       >       >       >       I wouldn't try to launch x11 in the guest
> just yet. fbcon in Linux is
> >       >       >       >       enough to render something on the screen.
> You should be able to see the
> >       >       >       >       Linux text-based console rendered
> graphically, connecting to it via vnc.
> >       >       >       >
> >       >       >       >       Sorry for the basic question, but have yo=
u
> tried all the following?
> >       >       >       >
> >       >       >       >       vncviewer 127.0.0.1:0
> >       >       >       >       vncviewer 127.0.0.1:1
> >       >       >       >       vncviewer 127.0.0.1:2
> >       >       >       >       vncviewer 127.0.0.1:5900
> >       >       >       >       vncviewer 127.0.0.1:5901
> >       >       >       >       vncviewer 127.0.0.1:5902
> >       >       >       >
> >       >       >       >       Given that from the xenstore-ls logs
> everything seems to work correctly
> >       >       >       >       I am not sure what else to suggest. You
> might have to add printf to QEMU
> >       >       >       >       ui/vnc.c and hw/display/xenfb.c to see
> what is going wrong.
> >       >       >       >
> >       >       >       >       Cheers,
> >       >       >       >
> >       >       >       >       Stefano
> >       >       >       >
> >       >       >       >
> >       >       >       >       On Mon, 7 Nov 2022, Vipul Suneja wrote:
> >       >       >       >       > Hi Stefano,
> >       >       >       >       > Thanks!
> >       >       >       >       >
> >       >       >       >       > Any input further on "xenstore-ls" logs=
?
> >       >       >       >       >
> >       >       >       >       > I am trying to run the x0vncserver &
> x11vnc server manually on guest machine(xen_guest_image_minimal)
> >       image
> >       >       but it's
> >       >       >       failing
> >       >       >       >       with the below
> >       >       >       >       > error.
> >       >       >       >       >
> >       >       >       >       > root@raspberrypi4-64:/usr/bin#
> x0vncserver
> >       >       >       >       > x0vncserver: unable to open display ""
> >       >       >       >       > root@raspberrypi4-64:/usr/bin#
> >       >       >       >       > root@raspberrypi4-64:/usr/bin# x11vnc
> >       >       >       >       >
> ###############################################################
> >       >       >       >       >
> #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
> >       >       >       >       > #@
>                     @#
> >       >       >       >       > #@  **  WARNING  **  WARNING  **
>  WARNING  **  WARNING  **   @#
> >       >       >       >       > #@
>                     @#
> >       >       >       >       > #@        YOU ARE RUNNING X11VNC WITHOU=
T
> A PASSWORD!!        @#
> >       >       >       >       > #@
>                     @#
> >       >       >       >       > #@  This means anyone with network
> access to this computer   @#
> >       >       >       >       > #@  may be able to view and control you=
r
> desktop.            @#
> >       >       >       >       > #@
>                     @#
> >       >       >       >       > #@ >>> If you did not mean to do this
> Press CTRL-C now!! <<< @#
> >       >       >       >       > #@
>                     @#
> >       >       >       >       >
> #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
> >       >       >       >       > #@
>                     @#
> >       >       >       >       > #@  You can create an x11vnc password
> file by running:       @#
> >       >       >       >       > #@
>                     @#
> >       >       >       >       > #@       x11vnc -storepasswd password
> /path/to/passfile      @#
> >       >       >       >       > #@  or   x11vnc -storepasswd
> /path/to/passfile               @#
> >       >       >       >       > #@  or   x11vnc -storepasswd
>                     @#
> >       >       >       >       > #@
>                     @#
> >       >       >       >       > #@  (the last one will use
> ~/.vnc/passwd)                    @#
> >       >       >       >       > #@
>                     @#
> >       >       >       >       > #@  and then starting x11vnc via:
>                      @#
> >       >       >       >       > #@
>                     @#
> >       >       >       >       > #@      x11vnc -rfbauth
> /path/to/passfile                    @#
> >       >       >       >       > #@
>                     @#
> >       >       >       >       > #@  an existing ~/.vnc/passwd file from
> another VNC          @#
> >       >       >       >       > #@  application will work fine too.
>                      @#
> >       >       >       >       > #@
>                     @#
> >       >       >       >       > #@  You can also use the -passwdfile or
> -passwd options.     @#
> >       >       >       >       > #@  (note -passwd is unsafe if local
> users are not trusted)  @#
> >       >       >       >       > #@
>                     @#
> >       >       >       >       > #@  Make sure any -rfbauth and
> -passwdfile password files    @#
> >       >       >       >       > #@  cannot be read by untrusted users.
>                     @#
> >       >       >       >       > #@
>                     @#
> >       >       >       >       > #@  Use x11vnc -usepw to automatically
> use your              @#
> >       >       >       >       > #@  ~/.vnc/passwd or ~/.vnc/passwdfile
> password files.       @#
> >       >       >       >       > #@  (and prompt you to create
> ~/.vnc/passwd if neither       @#
> >       >       >       >       > #@  file exists.)  Under -usepw, x11vnc
> will exit if it      @#
> >       >       >       >       > #@  cannot find a password to use.
>                     @#
> >       >       >       >       > #@
>                     @#
> >       >       >       >       > #@
>                     @#
> >       >       >       >       > #@  Even with a password, the subsequen=
t
> VNC traffic is      @#
> >       >       >       >       > #@  sent in the clear.  Consider
> tunnelling via ssh(1):      @#
> >       >       >       >       > #@
>                     @#
> >       >       >       >       > #@
> http://www.karlrunge.com/x11vnc/#tunnelling            @#
> >       >       >       >       > #@
>                     @#
> >       >       >       >       > #@  Or using the x11vnc SSL options:
> -ssl and -stunnel       @#
> >       >       >       >       > #@
>                     @#
> >       >       >       >       > #@  Please Read the documentation for
> more info about        @#
> >       >       >       >       > #@  passwords, security, and encryption=
.
>                     @#
> >       >       >       >       > #@
>                     @#
> >       >       >       >       > #@
> http://www.karlrunge.com/x11vnc/faq.html#faq-passwd    @#
> >       >       >       >       > #@
>                     @#
> >       >       >       >       > #@  To disable this warning use the
> -nopw option, or put     @#
> >       >       >       >       > #@  'nopw' on a line in your ~/.x11vncr=
c
> file.               @#
> >       >       >       >       > #@
>                     @#
> >       >       >       >       >
> #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
> >       >       >       >       >
> ###############################################################
> >       >       >       >       > 09/03/2018 12:58:41 x11vnc version:
> 0.9.16 lastmod: 2019-01-05  pid: 424
> >       >       >       >       > 09/03/2018 12:58:41 XOpenDisplay("")
> failed.
> >       >       >       >       > 09/03/2018 12:58:41 Trying again with
> XAUTHLOCALHOSTNAME=3Dlocalhost ...
> >       >       >       >       > 09/03/2018 12:58:41
> >       >       >       >       > 09/03/2018 12:58:41 *** XOpenDisplay
> failed. No -display or DISPLAY.
> >       >       >       >       > 09/03/2018 12:58:41 *** Trying ":0" in =
4
> seconds.  Press Ctrl-C to abort.
> >       >       >       >       > 09/03/2018 12:58:41 *** 1 2 3 4
> >       >       >       >       > 09/03/2018 12:58:45 XOpenDisplay(":0")
> failed.
> >       >       >       >       > 09/03/2018 12:58:45 Trying again with
> XAUTHLOCALHOSTNAME=3Dlocalhost ...
> >       >       >       >       > 09/03/2018 12:58:45 XOpenDisplay(":0")
> failed.
> >       >       >       >       > 09/03/2018 12:58:45 Trying again with
> unset XAUTHLOCALHOSTNAME ...
> >       >       >       >       > 09/03/2018 12:58:45
> >       >       >       >       >
> >       >       >       >       > 09/03/2018 12:58:45
> ***************************************
> >       >       >       >       > 09/03/2018 12:58:45 *** XOpenDisplay
> failed (:0)
> >       >       >       >       >
> >       >       >       >       > *** x11vnc was unable to open the X
> DISPLAY: ":0", it cannot continue.
> >       >       >       >       > *** There may be "Xlib:" error messages
> above with details about the failure.
> >       >       >       >       >
> >       >       >       >       > Some tips and guidelines:
> >       >       >       >       >
> >       >       >       >       > ** An X server (the one you wish to
> view) must be running before x11vnc is
> >       >       >       >       >    started: x11vnc does not start the X
> server.  (however, see the -create
> >       >       >       >       >    option if that is what you really
> want).
> >       >       >       >       >
> >       >       >       >       > ** You must use -display <disp>, -OR-
> set and export your $DISPLAY
> >       >       >       >       >    environment variable to refer to the
> display of the desired X server.
> >       >       >       >       >  - Usually the display is simply ":0"
> (in fact x11vnc uses this if you forget
> >       >       >       >       >    to specify it), but in some
> multi-user situations it could be ":1", ":2",
> >       >       >       >       >    or even ":137".  Ask your
> administrator or a guru if you are having
> >       >       >       >       >    difficulty determining what your X
> DISPLAY is.
> >       >       >       >       >
> >       >       >       >       > ** Next, you need to have sufficient
> permissions (Xauthority)
> >       >       >       >       >    to connect to the X DISPLAY.   Here
> are some Tips:
> >       >       >       >       >
> >       >       >       >       >  - Often, you just need to run x11vnc a=
s
> the user logged into the X session.
> >       >       >       >       >    So make sure to be that user when yo=
u
> type x11vnc.
> >       >       >       >       >  - Being root is usually not enough
> because the incorrect MIT-MAGIC-COOKIE
> >       >       >       >       >    file may be accessed.  The cookie
> file contains the secret key that
> >       >       >       >       >    allows x11vnc to connect to the
> desired X DISPLAY.
> >       >       >       >       >  - You can explicitly indicate which
> MIT-MAGIC-COOKIE file should be used
> >       >       >       >       >    by the -auth option, e.g.:
> >       >       >       >       >        x11vnc -auth
> /home/someuser/.Xauthority -display :0
> >       >       >       >       >        x11vnc -auth /tmp/.gdmzndVlR
> -display :0
> >       >       >       >       >    you must have read permission for th=
e
> auth file.
> >       >       >       >       >    See also '-auth guess' and
> '-findauth' discussed below.
> >       >       >       >       >
> >       >       >       >       > ** If NO ONE is logged into an X sessio=
n
> yet, but there is a greeter login
> >       >       >       >       >    program like "gdm", "kdm", "xdm", or
> "dtlogin" running, you will need
> >       >       >       >       >    to find and use the raw display
> manager MIT-MAGIC-COOKIE file.
> >       >       >       >       >    Some examples for various display
> managers:
> >       >       >       >       >
> >       >       >       >       >      gdm:     -auth /var/gdm/:0.Xauth
> >       >       >       >       >               -auth /var/lib/gdm/:0.Xau=
th
> >       >       >       >       >      kdm:     -auth
> /var/lib/kdm/A:0-crWk72
> >       >       >       >       >               -auth
> /var/run/xauth/A:0-crWk72
> >       >       >       >       >      xdm:     -auth
> /var/lib/xdm/authdir/authfiles/A:0-XQvaJk
> >       >       >       >       >      dtlogin: -auth /var/dt/A:0-UgaaXa
> >       >       >       >       >
> >       >       >       >       >    Sometimes the command "ps wwwwaux |
> grep auth" can reveal the file location.
> >       >       >       >       >
> >       >       >       >       >    Starting with x11vnc 0.9.9 you can
> have it try to guess by using:
> >       >       >       >       >
> >       >       >       >       >               -auth guess
> >       >       >       >       >
> >       >       >       >       >    (see also the x11vnc -findauth
> option.)
> >       >       >       >       >
> >       >       >       >       >    Only root will have read permission
> for the file, and so x11vnc must be run
> >       >       >       >       >    as root (or copy it).  The random
> characters in the filenames will of course
> >       >       >       >       >    change and the directory the cookie
> file resides in is system dependent.
> >       >       >       >       >
> >       >       >       >       > See also:
> http://www.karlrunge.com/x11vnc/faq.html
> >       >       >       >       >
> >       >       >       >       > Regards,
> >       >       >       >       > Vipul Kumar
> >       >       >       >       >
> >       >       >       >       > On Thu, Nov 3, 2022 at 10:27 PM Vipul
> Suneja <vsuneja63@gmail.com> wrote:
> >       >       >       >       >       Hi Stefano,
> >       >       >       >       > Thanks!
> >       >       >       >       >
> >       >       >       >       > I used xen-guest-image-minimal(simple
> console based image) as a guest with fbcon & fbdev enabled in
> >       kernel
> >       >       >       configurations but
> >       >       >       >       still
> >       >       >       >       > the same error can't open the display.
> >       >       >       >       > below are the outcome of "xenstore-ls":
> >       >       >       >       >
> >       >       >       >       > root@raspberrypi4-64:~/guest1#
> xenstore-ls
> >       >       >       >       > tool =3D ""
> >       >       >       >       >  xenstored =3D ""
> >       >       >       >       > local =3D ""
> >       >       >       >       >  domain =3D ""
> >       >       >       >       >   0 =3D ""
> >       >       >       >       >    control =3D ""
> >       >       >       >       >     feature-poweroff =3D "1"
> >       >       >       >       >     feature-reboot =3D "1"
> >       >       >       >       >    domid =3D "0"
> >       >       >       >       >    name =3D "Domain-0"
> >       >       >       >       >    device-model =3D ""
> >       >       >       >       >     0 =3D ""
> >       >       >       >       >      backends =3D ""
> >       >       >       >       >       console =3D ""
> >       >       >       >       >       vkbd =3D ""
> >       >       >       >       >       vfb =3D ""
> >       >       >       >       >       qnic =3D ""
> >       >       >       >       >      state =3D "running"
> >       >       >       >       >     1 =3D ""
> >       >       >       >       >      backends =3D ""
> >       >       >       >       >       console =3D ""
> >       >       >       >       >       vkbd =3D ""
> >       >       >       >       >       vfb =3D ""
> >       >       >       >       >       qnic =3D ""
> >       >       >       >       >      state =3D "running"
> >       >       >       >       >    backend =3D ""
> >       >       >       >       >     vbd =3D ""
> >       >       >       >       >      1 =3D ""
> >       >       >       >       >       51712 =3D ""
> >       >       >       >       >        frontend =3D
> "/local/domain/1/device/vbd/51712"
> >       >       >       >       >        params =3D
> "/home/root/guest2/xen-guest-image-minimal-raspberrypi4-64.ext3"
> >       >       >       >       >        script =3D "/etc/xen/scripts/blo=
ck"
> >       >       >       >       >        frontend-id =3D "1"
> >       >       >       >       >        online =3D "1"
> >       >       >       >       >        removable =3D "0"
> >       >       >       >       >        bootable =3D "1"
> >       >       >       >       >        state =3D "4"
> >       >       >       >       >        dev =3D "xvda"
> >       >       >       >       >        type =3D "phy"
> >       >       >       >       >        mode =3D "w"
> >       >       >       >       >        device-type =3D "disk"
> >       >       >       >       >        discard-enable =3D "1"
> >       >       >       >       >        feature-max-indirect-segments =
=3D
> "256"
> >       >       >       >       >        multi-queue-max-queues =3D "4"
> >       >       >       >       >        max-ring-page-order =3D "4"
> >       >       >       >       >        node =3D "/dev/loop0"
> >       >       >       >       >        physical-device =3D "7:0"
> >       >       >       >       >        physical-device-path =3D
> "/dev/loop0"
> >       >       >       >       >        hotplug-status =3D "connected"
> >       >       >       >       >        feature-flush-cache =3D "1"
> >       >       >       >       >        discard-granularity =3D "4096"
> >       >       >       >       >        discard-alignment =3D "0"
> >       >       >       >       >        discard-secure =3D "0"
> >       >       >       >       >        feature-discard =3D "1"
> >       >       >       >       >        feature-barrier =3D "1"
> >       >       >       >       >        feature-persistent =3D "1"
> >       >       >       >       >        sectors =3D "1794048"
> >       >       >       >       >        info =3D "0"
> >       >       >       >       >        sector-size =3D "512"
> >       >       >       >       >        physical-sector-size =3D "512"
> >       >       >       >       >     vfb =3D ""
> >       >       >       >       >      1 =3D ""
> >       >       >       >       >       0 =3D ""
> >       >       >       >       >        frontend =3D
> "/local/domain/1/device/vfb/0"
> >       >       >       >       >        frontend-id =3D "1"
> >       >       >       >       >        online =3D "1"
> >       >       >       >       >        state =3D "4"
> >       >       >       >       >        vnc =3D "1"
> >       >       >       >       >        vnclisten =3D "127.0.0.1"
> >       >       >       >       >        vncdisplay =3D "0"
> >       >       >       >       >        vncunused =3D "1"
> >       >       >       >       >        sdl =3D "0"
> >       >       >       >       >        opengl =3D "0"
> >       >       >       >       >        feature-resize =3D "1"
> >       >       >       >       >        hotplug-status =3D "connected"
> >       >       >       >       >        request-update =3D "1"
> >       >       >       >       >     vkbd =3D ""
> >       >       >       >       >      1 =3D ""
> >       >       >       >       >       0 =3D ""
> >       >       >       >       >        frontend =3D
> "/local/domain/1/device/vkbd/0"
> >       >       >       >       >        frontend-id =3D "1"
> >       >       >       >       >        online =3D "1"
> >       >       >       >       >        state =3D "4"
> >       >       >       >       >        feature-abs-pointer =3D "1"
> >       >       >       >       >        feature-raw-pointer =3D "1"
> >       >       >       >       >        hotplug-status =3D "connected"
> >       >       >       >       >     console =3D ""
> >       >       >       >       >      1 =3D ""
> >       >       >       >       >       0 =3D ""
> >       >       >       >       >        frontend =3D
> "/local/domain/1/console"
> >       >       >       >       >        frontend-id =3D "1"
> >       >       >       >       >        online =3D "1"
> >       >       >       >       >        state =3D "1"
> >       >       >       >       >        protocol =3D "vt100"
> >       >       >       >       >     vif =3D ""
> >       >       >       >       >      1 =3D ""
> >       >       >       >       >       0 =3D ""
> >       >       >       >       >        frontend =3D
> "/local/domain/1/device/vif/0"
> >       >       >       >       >        frontend-id =3D "1"
> >       >       >       >       >        online =3D "1"
> >       >       >       >       >        state =3D "4"
> >       >       >       >       >        script =3D
> "/etc/xen/scripts/vif-bridge"
> >       >       >       >       >        mac =3D "e4:5f:01:cd:7b:dd"
> >       >       >       >       >        bridge =3D "xenbr0"
> >       >       >       >       >        handle =3D "0"
> >       >       >       >       >        type =3D "vif"
> >       >       >       >       >        hotplug-status =3D "connected"
> >       >       >       >       >        feature-sg =3D "1"
> >       >       >       >       >        feature-gso-tcpv4 =3D "1"
> >       >       >       >       >        feature-gso-tcpv6 =3D "1"
> >       >       >       >       >        feature-ipv6-csum-offload =3D "1=
"
> >       >       >       >       >        feature-rx-copy =3D "1"
> >       >       >       >       >        feature-xdp-headroom =3D "1"
> >       >       >       >       >        feature-rx-flip =3D "0"
> >       >       >       >       >        feature-multicast-control =3D "1=
"
> >       >       >       >       >        feature-dynamic-multicast-contro=
l
> =3D "1"
> >       >       >       >       >        feature-split-event-channels =3D=
 "1"
> >       >       >       >       >        multi-queue-max-queues =3D "4"
> >       >       >       >       >        feature-ctrl-ring =3D "1"
> >       >       >       >       >   1 =3D ""
> >       >       >       >       >    vm =3D
> "/vm/d81ec5a9-5bf9-4f2b-89e8-0f60d6da948f"
> >       >       >       >       >    name =3D "guest2"
> >       >       >       >       >    cpu =3D ""
> >       >       >       >       >     0 =3D ""
> >       >       >       >       >      availability =3D "online"
> >       >       >       >       >     1 =3D ""
> >       >       >       >       >      availability =3D "online"
> >       >       >       >       >    memory =3D ""
> >       >       >       >       >     static-max =3D "2097152"
> >       >       >       >       >     target =3D "2097152"
> >       >       >       >       >     videoram =3D "0"
> >       >       >       >       >    device =3D ""
> >       >       >       >       >     suspend =3D ""
> >       >       >       >       >      event-channel =3D ""
> >       >       >       >       >     vbd =3D ""
> >       >       >       >       >      51712 =3D ""
> >       >       >       >       >       backend =3D
> "/local/domain/0/backend/vbd/1/51712"
> >       >       >       >       >       backend-id =3D "0"
> >       >       >       >       >       state =3D "4"
> >       >       >       >       >       virtual-device =3D "51712"
> >       >       >       >       >       device-type =3D "disk"
> >       >       >       >       >       multi-queue-num-queues =3D "2"
> >       >       >       >       >       queue-0 =3D ""
> >       >       >       >       >        ring-ref =3D "8"
> >       >       >       >       >        event-channel =3D "4"
> >       >       >       >       >       queue-1 =3D ""
> >       >       >       >       >        ring-ref =3D "9"
> >       >       >       >       >        event-channel =3D "5"
> >       >       >       >       >       protocol =3D "arm-abi"
> >       >       >       >       >       feature-persistent =3D "1"
> >       >       >       >       >     vfb =3D ""
> >       >       >       >       >      0 =3D ""
> >       >       >       >       >       backend =3D
> "/local/domain/0/backend/vfb/1/0"
> >       >       >       >       >       backend-id =3D "0"
> >       >       >       >       >       state =3D "4"
> >       >       >       >       >       page-ref =3D "275022"
> >       >       >       >       >       event-channel =3D "3"
> >       >       >       >       >       protocol =3D "arm-abi"
> >       >       >       >       >       feature-update =3D "1"
> >       >       >       >       >     vkbd =3D ""
> >       >       >       >       >      0 =3D ""
> >       >       >       >       >       backend =3D
> "/local/domain/0/backend/vkbd/1/0"
> >       >       >       >       >       backend-id =3D "0"
> >       >       >       >       >       state =3D "4"
> >       >       >       >       >       request-abs-pointer =3D "1"
> >       >       >       >       >       page-ref =3D "275322"
> >       >       >       >       >       page-gref =3D "1284"
> >       >       >       >       >       event-channel =3D "10"
> >       >       >       >       >     vif =3D ""
> >       >       >       >       >      0 =3D ""
> >       >       >       >       >       backend =3D
> "/local/domain/0/backend/vif/1/0"
> >       >       >       >       >       backend-id =3D "0"
> >       >       >       >       >       state =3D "4"
> >       >       >       >       >       handle =3D "0"
> >       >       >       >       >       mac =3D "e4:5f:01:cd:7b:dd"
> >       >       >       >       >       mtu =3D "1500"
> >       >       >       >       >       xdp-headroom =3D "0"
> >       >       >       >       >       multi-queue-num-queues =3D "2"
> >       >       >       >       >       queue-0 =3D ""
> >       >       >       >       >        tx-ring-ref =3D "1280"
> >       >       >       >       >        rx-ring-ref =3D "1281"
> >       >       >       >       >        event-channel-tx =3D "6"
> >       >       >       >       >        event-channel-rx =3D "7"
> >       >       >       >       >       queue-1 =3D ""
> >       >       >       >       >        tx-ring-ref =3D "1282"
> >       >       >       >       >        rx-ring-ref =3D "1283"
> >       >       >       >       >        event-channel-tx =3D "8"
> >       >       >       >       >        event-channel-rx =3D "9"
> >       >       >       >       >       request-rx-copy =3D "1"
> >       >       >       >       >       feature-rx-notify =3D "1"
> >       >       >       >       >       feature-sg =3D "1"
> >       >       >       >       >       feature-gso-tcpv4 =3D "1"
> >       >       >       >       >       feature-gso-tcpv6 =3D "1"
> >       >       >       >       >       feature-ipv6-csum-offload =3D "1"
> >       >       >       >       >    control =3D ""
> >       >       >       >       >     shutdown =3D ""
> >       >       >       >       >     feature-poweroff =3D "1"
> >       >       >       >       >     feature-reboot =3D "1"
> >       >       >       >       >     feature-suspend =3D ""
> >       >       >       >       >     sysrq =3D ""
> >       >       >       >       >
> platform-feature-multiprocessor-suspend =3D "1"
> >       >       >       >       >     platform-feature-xs_reset_watches =
=3D
> "1"
> >       >       >       >       >    data =3D ""
> >       >       >       >       >    drivers =3D ""
> >       >       >       >       >    feature =3D ""
> >       >       >       >       >    attr =3D ""
> >       >       >       >       >    error =3D ""
> >       >       >       >       >    domid =3D "1"
> >       >       >       >       >    store =3D ""
> >       >       >       >       >     port =3D "1"
> >       >       >       >       >     ring-ref =3D "233473"
> >       >       >       >       >    console =3D ""
> >       >       >       >       >     backend =3D
> "/local/domain/0/backend/console/1/0"
> >       >       >       >       >     backend-id =3D "0"
> >       >       >       >       >     limit =3D "1048576"
> >       >       >       >       >     type =3D "xenconsoled"
> >       >       >       >       >     output =3D "pty"
> >       >       >       >       >     tty =3D "/dev/pts/1"
> >       >       >       >       >     port =3D "2"
> >       >       >       >       >     ring-ref =3D "233472"
> >       >       >       >       >     vnc-listen =3D "127.0.0.1"
> >       >       >       >       >     vnc-port =3D "5900"
> >       >       >       >       >    image =3D ""
> >       >       >       >       >     device-model-pid =3D "788"
> >       >       >       >       > vm =3D ""
> >       >       >       >       >  d81ec5a9-5bf9-4f2b-89e8-0f60d6da948f =
=3D
> ""
> >       >       >       >       >   name =3D "guest2"
> >       >       >       >       >   uuid =3D
> "d81ec5a9-5bf9-4f2b-89e8-0f60d6da948f"
> >       >       >       >       >   start_time =3D "1520600274.27"
> >       >       >       >       > libxl =3D ""
> >       >       >       >       >  1 =3D ""
> >       >       >       >       >   device =3D ""
> >       >       >       >       >    vbd =3D ""
> >       >       >       >       >     51712 =3D ""
> >       >       >       >       >      frontend =3D
> "/local/domain/1/device/vbd/51712"
> >       >       >       >       >      backend =3D
> "/local/domain/0/backend/vbd/1/51712"
> >       >       >       >       >      params =3D
> "/home/root/guest2/xen-guest-image-minimal-raspberrypi4-64.ext3"
> >       >       >       >       >      script =3D "/etc/xen/scripts/block=
"
> >       >       >       >       >      frontend-id =3D "1"
> >       >       >       >       >      online =3D "1"
> >       >       >       >       >      removable =3D "0"
> >       >       >       >       >      bootable =3D "1"
> >       >       >       >       >      state =3D "1"
> >       >       >       >       >      dev =3D "xvda"
> >       >       >       >       >      type =3D "phy"
> >       >       >       >       >      mode =3D "w"
> >       >       >       >       >      device-type =3D "disk"
> >       >       >       >       >      discard-enable =3D "1"
> >       >       >       >       >    vfb =3D ""
> >       >       >       >       >     0 =3D ""
> >       >       >       >       >      frontend =3D
> "/local/domain/1/device/vfb/0"
> >       >       >       >       >      backend =3D
> "/local/domain/0/backend/vfb/1/0"
> >       >       >       >       >      frontend-id =3D "1"
> >       >       >       >       >      online =3D "1"
> >       >       >       >       >      state =3D "1"
> >       >       >       >       >      vnc =3D "1"
> >       >       >       >       >      vnclisten =3D "127.0.0.1"
> >       >       >       >       >      vncdisplay =3D "0"
> >       >       >       >       >      vncunused =3D "1"
> >       >       >       >       >      sdl =3D "0"
> >       >       >       >       >      opengl =3D "0"
> >       >       >       >       >    vkbd =3D ""
> >       >       >       >       >     0 =3D ""
> >       >       >       >       >      frontend =3D
> "/local/domain/1/device/vkbd/0"
> >       >       >       >       >      backend =3D
> "/local/domain/0/backend/vkbd/1/0"
> >       >       >       >       >      frontend-id =3D "1"
> >       >       >       >       >      online =3D "1"
> >       >       >       >       >      state =3D "1"
> >       >       >       >       >    console =3D ""
> >       >       >       >       >     0 =3D ""
> >       >       >       >       >      frontend =3D "/local/domain/1/cons=
ole"
> >       >       >       >       >      backend =3D
> "/local/domain/0/backend/console/1/0"
> >       >       >       >       >      frontend-id =3D "1"
> >       >       >       >       >      online =3D "1"
> >       >       >       >       >      state =3D "1"
> >       >       >       >       >      protocol =3D "vt100"
> >       >       >       >       >    vif =3D ""
> >       >       >       >       >     0 =3D ""
> >       >       >       >       >      frontend =3D
> "/local/domain/1/device/vif/0"
> >       >       >       >       >      backend =3D
> "/local/domain/0/backend/vif/1/0"
> >       >       >       >       >      frontend-id =3D "1"
> >       >       >       >       >      online =3D "1"
> >       >       >       >       >      state =3D "1"
> >       >       >       >       >      script =3D
> "/etc/xen/scripts/vif-bridge"
> >       >       >       >       >      mac =3D "e4:5f:01:cd:7b:dd"
> >       >       >       >       >      bridge =3D "xenbr0"
> >       >       >       >       >      handle =3D "0"
> >       >       >       >       >      type =3D "vif"
> >       >       >       >       >      hotplug-status =3D ""
> >       >       >       >       >   type =3D "pvh"
> >       >       >       >       >   dm-version =3D "qemu_xen"
> >       >       >       >       > root@raspberrypi4-64:~/guest1#
> >       >       >       >       >
> >       >       >       >       > Any input as per above? Looking forward
> to hearing from you.
> >       >       >       >       >
> >       >       >       >       > Regards,
> >       >       >       >       > Vipul Kumar
> >       >       >       >       >
> >       >       >       >       > On Wed, Oct 26, 2022 at 5:21 AM Stefano
> Stabellini <sstabellini@kernel.org> wrote:
> >       >       >       >       >       Hi Vipul,
> >       >       >       >       >
> >       >       >       >       >       If you look at the QEMU logs, it
> says:
> >       >       >       >       >
> >       >       >       >       >       VNC server running on
> 127.0.0.1:5900
> >       >       >       >       >
> >       >       >       >       >       That is the VNC server you need t=
o
> connect to. So in theory:
> >       >       >       >       >
> >       >       >       >       >         vncviewer 127.0.0.1:5900
> >       >       >       >       >
> >       >       >       >       >       should work correctly.
> >       >       >       >       >
> >       >       >       >       >
> >       >       >       >       >       If you have:
> >       >       >       >       >
> >       >       >       >       >         vfb =3D ["type=3Dvnc"]
> >       >       >       >       >
> >       >       >       >       >       in your xl config file and you
> have "fbdev" in your Linux guest, it
> >       >       >       >       >       should work.
> >       >       >       >       >
> >       >       >       >       >       If you connect to the VNC server
> but you get a black screen, it might be
> >       >       >       >       >       a guest configuration issue. I
> would try with a simpler guest, text only
> >       >       >       >       >       (no X11, no Wayland) and enable
> the fbdev console (fbcon). See
> >       >       >       >       >       Documentation/fb/fbcon.rst in
> Linux. You should be able to see a
> >       >       >       >       >       graphical console over VNC.
> >       >       >       >       >
> >       >       >       >       >       If that works, then you know that
> the fbdev kernel driver (xen-fbfront)
> >       >       >       >       >       works correctly.
> >       >       >       >       >
> >       >       >       >       >       If it doesn't work, the output of
> "xenstore-ls" would be interesting.
> >       >       >       >       >
> >       >       >       >       >       Cheers,
> >       >       >       >       >
> >       >       >       >       >       Stefano
> >       >       >       >       >
> >       >       >       >       >
> >       >       >       >       >       On Wed, 19 Oct 2022, Vipul Suneja
> wrote:
> >       >       >       >       >       > Hi Stefano,
> >       >       >       >       >       >
> >       >       >       >       >       > Thanks for the response!
> >       >       >       >       >       >
> >       >       >       >       >       > I am following the same link yo=
u
> shared from the beginning. Tried the command "vncviewer
> >       localhost:0"
> >       >       in DOM0
> >       >       >       but
> >       >       >       >       same
> >       >       >       >       >       issue "Can't open
> >       >       >       >       >       > display", below are the logs:
> >       >       >       >       >       >
> >       >       >       >       >       > root@raspberrypi4-64:~#
> vncviewer localhost:0
> >       >       >       >       >       >
> >       >       >       >       >       > TigerVNC Viewer 64-bit v1.11.0
> >       >       >       >       >       > Built on: 2020-09-08 12:16
> >       >       >       >       >       > Copyright (C) 1999-2020 TigerVN=
C
> Team and many others (see README.rst)
> >       >       >       >       >       > See https://www.tigervnc.org
> for information on TigerVNC.
> >       >       >       >       >       > Can't open display:
> >       >       >       >       >       >
> >       >       >       >       >       > Below are the netstat logs, i
> couldn't see anything running at port 5900 or 5901:
> >       >       >       >       >       >
> >       >       >       >       >       > root@raspberrypi4-64:~# netstat
> -tuwx
> >       >       >       >       >       > Active Internet connections (w/=
o
> servers)
> >       >       >       >       >       > Proto Recv-Q Send-Q Local
> Address           Foreign Address         State
> >       >       >       >       >       > tcp        0    164 192.168.1.3=
9:ssh
>        192.168.1.38:37472      ESTABLISHED
> >       >       >       >       >       > Active UNIX domain sockets (w/o
> servers)
> >       >       >       >       >       > Proto RefCnt Flags       Type
>     State         I-Node Path
> >       >       >       >       >       > unix  8      [ ]         DGRAM
>    CONNECTED      10565 /dev/log
> >       >       >       >       >       > unix  3      [ ]         STREAM
>     CONNECTED      10891 /var/run/xenstored/socket
> >       >       >       >       >       > unix  3      [ ]         STREAM
>     CONNECTED      13791
> >       >       >       >       >       > unix  3      [ ]         STREAM
>     CONNECTED      10843 /var/run/xenstored/socket
> >       >       >       >       >       > unix  3      [ ]         STREAM
>     CONNECTED      10573 /var/run/xenstored/socket
> >       >       >       >       >       > unix  2      [ ]         DGRAM
>    CONNECTED      14510
> >       >       >       >       >       > unix  3      [ ]         STREAM
>     CONNECTED      13249
> >       >       >       >       >       > unix  2      [ ]         DGRAM
>    CONNECTED      13887
> >       >       >       >       >       > unix  2      [ ]         DGRAM
>    CONNECTED      10599
> >       >       >       >       >       > unix  3      [ ]         STREAM
>     CONNECTED      14005
> >       >       >       >       >       > unix  3      [ ]         STREAM
>     CONNECTED      13258
> >       >       >       >       >       > unix  3      [ ]         STREAM
>     CONNECTED      13248
> >       >       >       >       >       > unix  3      [ ]         STREAM
>     CONNECTED      14003
> >       >       >       >       >       > unix  3      [ ]         STREAM
>     CONNECTED      10572 /var/run/xenstored/socket
> >       >       >       >       >       > unix  3      [ ]         STREAM
>     CONNECTED      10786 /var/run/xenstored/socket
> >       >       >       >       >       > unix  3      [ ]         DGRAM
>    CONNECTED      13186
> >       >       >       >       >       > unix  3      [ ]         STREAM
>     CONNECTED      10864 /var/run/xenstored/socket
> >       >       >       >       >       > unix  3      [ ]         STREAM
>     CONNECTED      10812 /var/run/xenstored/socket
> >       >       >       >       >       > unix  2      [ ]         DGRAM
>    CONNECTED      14083
> >       >       >       >       >       > unix  3      [ ]         STREAM
>     CONNECTED      10813 /var/run/xenstored/socket
> >       >       >       >       >       > unix  3      [ ]         STREAM
>     CONNECTED      14068
> >       >       >       >       >       > unix  3      [ ]         STREAM
>     CONNECTED      13256
> >       >       >       >       >       > unix  3      [ ]         STREAM
>     CONNECTED      10571 /var/run/xenstored/socket
> >       >       >       >       >       > unix  3      [ ]         STREAM
>     CONNECTED      10842
> >       >       >       >       >       > unix  3      [ ]         STREAM
>     CONNECTED      13985
> >       >       >       >       >       > unix  3      [ ]         DGRAM
>    CONNECTED      13185
> >       >       >       >       >       > unix  2      [ ]         STREAM
>     CONNECTED      13884
> >       >       >       >       >       > unix  2      [ ]         DGRAM
>    CONNECTED      14528
> >       >       >       >       >       > unix  2      [ ]         DGRAM
>    CONNECTED      13785
> >       >       >       >       >       > unix  3      [ ]         STREAM
>     CONNECTED      14034
> >       >       >       >       >       >
> >       >       >       >       >       > Attaching xen log files of
> /var/log/xen.
> >       >       >       >       >       > I didn't get the role of QEMU
> here because as mentioned earlier, I am porting in raspberrypi
> >       4B.
> >       >       >       >       >       >
> >       >       >       >       >       > Regards,
> >       >       >       >       >       > Vipul Kumar
> >       >       >       >       >       >
> >       >       >       >       >       > On Wed, Oct 19, 2022 at 12:43 A=
M
> Stefano Stabellini <sstabellini@kernel.org> wrote:
> >       >       >       >       >       >       It usually works the way
> it is described in the guide:
> >       >       >       >       >       >
> >       >       >       >       >       >
> >       >       >       >       >
> >       >       >       >
> >       >       >
> >       >
> >
> https://www.virtuatopia.com/index.php?title=3DConfiguring_a_VNC_based_Gra=
phical_Console_for_a_Xen_Paravirtualized_domainU_Guest
> >       >       >       >       >       >
> >       >       >       >       >       >       You don't need to install
> any VNC-related server software because it is
> >       >       >       >       >       >       already provided by Xen
> (to be precise it is provided by QEMU working
> >       >       >       >       >       >       together with Xen.)
> >       >       >       >       >       >
> >       >       >       >       >       >       You only need the vnc
> client in dom0 so that you can connect, but you
> >       >       >       >       >       >       could also run the vnc
> client outside from another host. So basically
> >       >       >       >       >       >       the following should work
> when executed in Dom0 after creating DomU:
> >       >       >       >       >       >
> >       >       >       >       >       >         vncviewer localhost:0
> >       >       >       >       >       >
> >       >       >       >       >       >       Can you attach the Xen an=
d
> QEMU logs (/var/log/xen/*)? And also use
> >       >       >       >       >       >       netstat -taunp to check i=
f
> there is anything running at port 5900 or
> >       >       >       >       >       >       5901?
> >       >       >       >       >       >
> >       >       >       >       >       >       Cheers,
> >       >       >       >       >       >
> >       >       >       >       >       >       Stefano
> >       >       >       >       >       >
> >       >       >       >       >       >
> >       >       >       >       >       >       On Tue, 18 Oct 2022, Vipu=
l
> Suneja wrote:
> >       >       >       >       >       >       > Hi Stefano,
> >       >       >       >       >       >       >
> >       >       >       >       >       >       > Thanks for the response=
!
> >       >       >       >       >       >       >
> >       >       >       >       >       >       > I could install
> tigerVNC, x11vnc & libvncserver in Dom0 xen-image-minimal but only
> >       manage to
> >       >       install
> >       >       >       >       >       libvncserver(couldn't
> >       >       >       >       >       >       install tigervnc
> >       >       >       >       >       >       > & x11vnc because of x11
> >       >       >       >       >       >       > support missing, it's
> wayland) in DOMU custom graphical image. I tried running
> >       vncviewer with
> >       >       IP
> >       >       >       address &
> >       >       >       >       port
> >       >       >       >       >       in dom0 to
> >       >       >       >       >       >       access the domu
> >       >       >       >       >       >       > graphical image display
> as per below commands.
> >       >       >       >       >       >       >
> >       >       >       >       >       >       >  vncviewer
> 192.168.1.42:5901
> >       >       >       >       >       >       >
> >       >       >       >       >       >       >  But it showing can't
> open display, below are the logs:
> >       >       >       >       >       >       >
> >       >       >       >       >       >       > root@raspberrypi4-64:~/=
guest1#
> vncviewer 192.168.1.42:5901
> >       >       >       >       >       >       >
> >       >       >       >       >       >       > TigerVNC Viewer 64-bit
> v1.11.0
> >       >       >       >       >       >       > Built on: 2020-09-08
> 12:16
> >       >       >       >       >       >       > Copyright (C) 1999-2020
> TigerVNC Team and many others (see README.rst)
> >       >       >       >       >       >       > See
> https://www.tigervnc.org for information on TigerVNC.
> >       >       >       >       >       >       > Can't open display:
> >       >       >       >       >       >       > root@raspberrypi4-64
> :~/guest1#
> >       >       >       >       >       >       >
> >       >       >       >       >       >       > I am not exactly sure
> what the issue is but I thought only libvncserver in DOMU could
> >       work to
> >       >       get
> >       >       >       access but
> >       >       >       >       it
> >       >       >       >       >       did not
> >       >       >       >       >       >       work.
> >       >       >       >       >       >       > If TigerVNC is the issu=
e
> here then is there any other VNC source which could be
> >       installed for
> >       >       both
> >       >       >       x11 &
> >       >       >       >       >       wayland supported
> >       >       >       >       >       >       images?
> >       >       >       >       >       >       >
> >       >       >       >       >       >       > Regards,
> >       >       >       >       >       >       > Vipul Kumar
> >       >       >       >       >       >       >
> >       >       >       >       >       >       > On Tue, Oct 18, 2022 at
> 2:40 AM Stefano Stabellini <sstabellini@kernel.org> wrote:
> >       >       >       >       >       >       >       VNC is typically
> easier to setup, because SDL needs extra libraries at
> >       >       >       >       >       >       >       build time and
> runtime. If QEMU is built without SDL support it won't
> >       >       >       >       >       >       >       start when you as=
k
> for SDL.
> >       >       >       >       >       >       >
> >       >       >       >       >       >       >       VNC should work
> with both x11 and wayland in your domU. It doesn't work
> >       >       >       >       >       >       >       at the x11 level,
> it exposes a special fbdev device in your domU that
> >       >       >       >       >       >       >       should work with:
> >       >       >       >       >       >       >       - a graphical
> console in Linux domU
> >       >       >       >       >       >       >       - x11
> >       >       >       >       >       >       >       - wayland (but I
> haven't tested this so I am not 100% sure about it)
> >       >       >       >       >       >       >
> >       >       >       >       >       >       >       When you say "it
> doesn't work", what do you mean? Do you get a black
> >       >       >       >       >       >       >       window?
> >       >       >       >       >       >       >
> >       >       >       >       >       >       >       You need
> CONFIG_XEN_FBDEV_FRONTEND in Linux domU
> >       >       >       >       >       >       >
>  (drivers/video/fbdev/xen-fbfront.c). I would try to get a graphical text
> >       >       >       >       >       >       >       console up and
> running in your domU before attempting x11/wayland.
> >       >       >       >       >       >       >
> >       >       >       >       >       >       >       Cheers,
> >       >       >       >       >       >       >
> >       >       >       >       >       >       >       Stefano
> >       >       >       >       >       >       >
> >       >       >       >       >       >       >       On Mon, 17 Oct
> 2022, Vipul Suneja wrote:
> >       >       >       >       >       >       >       > Hi,
> >       >       >       >       >       >       >       > Thanks!
> >       >       >       >       >       >       >       >
> >       >       >       >       >       >       >       > I have ported
> xen minimal image as DOM0 & custom wayland GUI based image as
> >       DOMU in
> >       >       raspberry
> >       >       >       pi4B. I
> >       >       >       >       >       am trying to
> >       >       >       >       >       >       make GUI
> >       >       >       >       >       >       >       display up
> >       >       >       >       >       >       >       > for guest
> machine. I tried using sdl, included below line in guest.conf file
> >       >       >       >       >       >       >       > vfb=3D [ 'sdl=
=3D1' ]
> >       >       >       >       >       >       >       >
> >       >       >       >       >       >       >       > But it is
> throwing below error:
> >       >       >       >       >       >       >       >
> >       >       >       >       >       >       >       >
> root@raspberrypi4-64:~/guest1# xl create -c guest1.cfg
> >       >       >       >       >       >       >       > Parsing config
> from guest1.cfg
> >       >       >       >       >       >       >       > libxl: error:
> libxl_qmp.c:1400:qmp_ev_fd_callback: Domain 3:error on QMP
> >       socket:
> >       >       Connection
> >       >       >       reset by
> >       >       >       >       >       peer
> >       >       >       >       >       >       >       > libxl: error:
> libxl_qmp.c:1439:qmp_ev_fd_callback: Domain 3:Error happened
> >       with the
> >       >       QMP
> >       >       >       connection to
> >       >       >       >       >       QEMU
> >       >       >       >       >       >       >       > libxl: error:
> libxl_dm.c:3351:device_model_postconfig_done: Domain 3:Post DM
> >       startup
> >       >       configs
> >       >       >       failed,
> >       >       >       >       >       rc=3D-26
> >       >       >       >       >       >       >       > libxl: error:
> libxl_create.c:1867:domcreate_devmodel_started: Domain 3:device
> >       model
> >       >       did not
> >       >       >       start:
> >       >       >       >       -26
> >       >       >       >       >       >       >       > libxl: error:
> libxl_aoutils.c:646:libxl__kill_xs_path: Device Model already
> >       exited
> >       >       >       >       >       >       >       > libxl: error:
> libxl_domain.c:1183:libxl__destroy_domid: Domain 3:Non-existant
> >       domain
> >       >       >       >       >       >       >       > libxl: error:
> libxl_domain.c:1137:domain_destroy_callback: Domain 3:Unable to
> >       destroy
> >       >       guest
> >       >       >       >       >       >       >       > libxl: error:
> libxl_domain.c:1064:domain_destroy_cb: Domain 3:Destruction of
> >       domain
> >       >       failed
> >       >       >       >       >       >       >       >
> >       >       >       >       >       >       >       > Another way is
> VNC, i could install tigervnc in DOM0 but same i couldn't in
> >       guest
> >       >       machine
> >       >       >       because it
> >       >       >       >       >       doesn't support
> >       >       >       >       >       >       >       x11(supports
> wayland
> >       >       >       >       >       >       >       > only). I am
> completely blocked here, Need your support to enable the display
> >       up.
> >       >       >       >       >       >       >       > Any alternative
> of VNC which could work in both x11 & wayland supported
> >       images?
> >       >       >       >       >       >       >       >
> >       >       >       >       >       >       >       > Any input on
> VNC, SDL or any other way to proceed on this? Looking forward to
> >       hearing
> >       >       from
> >       >       >       you.
> >       >       >       >       >       >       >       >
> >       >       >       >       >       >       >       > Regards,
> >       >       >       >       >       >       >       > Vipul Kumar
> >       >       >       >       >       >       >
> >       >       >       >       >       >       >
> >       >       >       >       >       >       >
> >       >       >       >       >       >
> >       >       >       >       >       >
> >       >       >       >       >       >
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

--00000000000084411105efce444c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+SGkgU3RlZmFubyw8YnI+PGJyPlRoYW5rcyE8YnI+PGJyPkkgY291bGQg
c2VlIFFFTVUgNi4yLjAgY29tcGlsZWQgJmFtcDsgaW5zdGFsbGVkIGluIHRoZSBob3N0IGltYWdl
IHhlbi1pbWFnZS1taW5pbWFsLiBJIGNvdWxkIGZpbmQgeGVuZmIuYyBzb3VyY2UgZmlsZSBhbHNv
ICZhbXA7IG1vZGlmaWVkIHRoZSBzYW1lIHdpdGggZGVidWcgbG9ncy48YnI+SSBoYXZlIHNldCB1
cCBhIGNyb3NzIGNvbXBpbGUgZW52aXJvbm1lbnQsIGRpZCAmIzM5O21ha2UgY2xlYW4mIzM5OyAm
YW1wOyAmIzM5O21ha2UgYWxsJiMzOTsgdG8gcmVjb21waWxlIGJ1dCBpdCYjMzk7cyBmYWlsaW5n
LiBJbiBjYXNlIGkgYW0gZG9pbmcgd3JvbmcsIENhbiB5b3UgcGxlYXNlIGFzc2lzdCBtZSA8YnI+
d2l0aCB0aGUgY29ycmVjdCBzdGVwcyB0byBjb21waWxlIHFlbXU/wqA8ZGl2PkJlbG93IGFyZSB0
aGUgZXJyb3IgbG9nczo8YnI+PGJyPmFnbEBhZ2wtT3B0aVBsZXgtNzAxMDp+L0F1dG9tb3RpdmUv
QURBU19JbmZvdGFpbm1lbnQvUGxhdGZvcm0vUG9reV9LaXJrc3RvbmUvYnVpbGQvdG1wL3dvcmsv
Y29ydGV4YTcyLXBva3ktbGludXgvcWVtdS82LjIuMC1yMC9idWlsZCQgbWFrZSBhbGw8YnI+WzEv
Mzg2NF0gQ29tcGlsaW5nIEMgb2JqZWN0IGxpYnNsaXJwLmEucC9zbGlycF9zcmNfYXJwX3RhYmxl
LmMubzxicj5bMi8zODY0XSBDb21waWxpbmcgQyBvYmplY3Qgc3VicHJvamVjdHMvbGlidmhvc3Qt
dXNlci9saWJ2aG9zdC11c2VyLmEucC9saWJ2aG9zdC11c2VyLmMubzxicj5bMy8zODY0XSBMaW5r
aW5nIHN0YXRpYyB0YXJnZXQgc3VicHJvamVjdHMvbGlidmhvc3QtdXNlci9saWJ2aG9zdC11c2Vy
LmE8YnI+WzQvMzg2NF0gQ29tcGlsaW5nIEMgb2JqZWN0IGxpYnNsaXJwLmEucC9zbGlycF9zcmNf
dm1zdGF0ZS5jLm88YnI+WzUvMzg2NF0gQ29tcGlsaW5nIEMgb2JqZWN0IGxpYnNsaXJwLmEucC9z
bGlycF9zcmNfZGhjcHY2LmMubzxicj5bNi8zODY0XSBDb21waWxpbmcgQyBvYmplY3QgbGlic2xp
cnAuYS5wL3NsaXJwX3NyY19kbnNzZWFyY2guYy5vPGJyPls3LzM4NjRdIENvbXBpbGluZyBDIG9i
amVjdCBsaWJzbGlycC5hLnAvc2xpcnBfc3JjX2Jvb3RwLmMubzxicj5bOC8zODY0XSBDb21waWxp
bmcgQyBvYmplY3QgbGlic2xpcnAuYS5wL3NsaXJwX3NyY19ja3N1bS5jLm88YnI+WzkvMzg2NF0g
Q29tcGlsaW5nIEMgb2JqZWN0IGxpYnNsaXJwLmEucC9zbGlycF9zcmNfaWYuYy5vPGJyPlsxMC8z
ODY0XSBDb21waWxpbmcgQyBvYmplY3QgbGlic2xpcnAuYS5wL3NsaXJwX3NyY19pcDZfaWNtcC5j
Lm88YnI+WzExLzM4NjRdIENvbXBpbGluZyBDIG9iamVjdCBsaWJzbGlycC5hLnAvc2xpcnBfc3Jj
X2lwNl9pbnB1dC5jLm88YnI+WzEyLzM4NjRdIENvbXBpbGluZyBDIG9iamVjdCBsaWJzbGlycC5h
LnAvc2xpcnBfc3JjX2lwNl9vdXRwdXQuYy5vPGJyPlsxMy8zODY0XSBDb21waWxpbmcgQyBvYmpl
Y3QgbGlic2xpcnAuYS5wL3NsaXJwX3NyY19pcF9pY21wLmMubzxicj5bMTQvMzg2NF0gQ29tcGls
aW5nIEMgb2JqZWN0IGxpYnNsaXJwLmEucC9zbGlycF9zcmNfaXBfaW5wdXQuYy5vPGJyPlsxNS8z
ODY0XSBDb21waWxpbmcgQyBvYmplY3QgbGlic2xpcnAuYS5wL3NsaXJwX3NyY19pcF9vdXRwdXQu
Yy5vPGJyPlsxNi8zODY0XSBDb21waWxpbmcgQyBvYmplY3QgbGlic2xpcnAuYS5wL3NsaXJwX3Ny
Y19tYnVmLmMubzxicj5bMTcvMzg2NF0gQ29tcGlsaW5nIEMgb2JqZWN0IGxpYnNsaXJwLmEucC9z
bGlycF9zcmNfbWlzYy5jLm88YnI+WzE4LzM4NjRdIENvbXBpbGluZyBDIG9iamVjdCBsaWJzbGly
cC5hLnAvc2xpcnBfc3JjX25jc2kuYy5vPGJyPlsxOS8zODY0XSBDb21waWxpbmcgQyBvYmplY3Qg
bGlic2xpcnAuYS5wL3NsaXJwX3NyY19uZHBfdGFibGUuYy5vPGJyPlsyMC8zODY0XSBDb21waWxp
bmcgQyBvYmplY3QgbGlic2xpcnAuYS5wL3NsaXJwX3NyY19zYnVmLmMubzxicj5bMjEvMzg2NF0g
Q29tcGlsaW5nIEMgb2JqZWN0IGxpYnNsaXJwLmEucC9zbGlycF9zcmNfc2xpcnAuYy5vPGJyPlsy
Mi8zODY0XSBDb21waWxpbmcgQyBvYmplY3QgbGlic2xpcnAuYS5wL3NsaXJwX3NyY19zb2NrZXQu
Yy5vPGJyPlsyMy8zODY0XSBDb21waWxpbmcgQyBvYmplY3QgbGlic2xpcnAuYS5wL3NsaXJwX3Ny
Y19zdGF0ZS5jLm88YnI+WzI0LzM4NjRdIENvbXBpbGluZyBDIG9iamVjdCBsaWJzbGlycC5hLnAv
c2xpcnBfc3JjX3N0cmVhbS5jLm88YnI+WzI1LzM4NjRdIENvbXBpbGluZyBDIG9iamVjdCBsaWJz
bGlycC5hLnAvc2xpcnBfc3JjX3RjcF9pbnB1dC5jLm88YnI+WzI2LzM4NjRdIENvbXBpbGluZyBD
IG9iamVjdCBsaWJzbGlycC5hLnAvc2xpcnBfc3JjX3RjcF9vdXRwdXQuYy5vPGJyPlsyNy8zODY0
XSBDb21waWxpbmcgQyBvYmplY3QgbGlic2xpcnAuYS5wL3NsaXJwX3NyY190Y3Bfc3Vici5jLm88
YnI+WzI4LzM4NjRdIENvbXBpbGluZyBDIG9iamVjdCBsaWJzbGlycC5hLnAvc2xpcnBfc3JjX3Rj
cF90aW1lci5jLm88YnI+WzI5LzM4NjRdIENvbXBpbGluZyBDIG9iamVjdCBsaWJzbGlycC5hLnAv
c2xpcnBfc3JjX3RmdHAuYy5vPGJyPlszMC8zODY0XSBDb21waWxpbmcgQyBvYmplY3QgbGlic2xp
cnAuYS5wL3NsaXJwX3NyY191ZHAuYy5vPGJyPlszMS8zODY0XSBDb21waWxpbmcgQyBvYmplY3Qg
bGlic2xpcnAuYS5wL3NsaXJwX3NyY191ZHA2LmMubzxicj5bMzIvMzg2NF0gQ29tcGlsaW5nIEMg
b2JqZWN0IGxpYnNsaXJwLmEucC9zbGlycF9zcmNfdXRpbC5jLm88YnI+WzMzLzM4NjRdIENvbXBp
bGluZyBDIG9iamVjdCBsaWJzbGlycC5hLnAvc2xpcnBfc3JjX3ZlcnNpb24uYy5vPGJyPlszNC8z
ODY0XSBMaW5raW5nIHN0YXRpYyB0YXJnZXQgbGlic2xpcnAuYTxicj5bMzUvMzg2NF0gR2VuZXJh
dGluZyBxZW11LXZlcnNpb24uaCB3aXRoIGEgY3VzdG9tIGNvbW1hbmQgKHdyYXBwZWQgYnkgbWVz
b24gdG8gY2FwdHVyZSBvdXRwdXQpPGJyPkZBSUxFRDogcWVtdS12ZXJzaW9uLmg8YnI+L2hvbWUv
YWdsL0F1dG9tb3RpdmUvQURBU19JbmZvdGFpbm1lbnQvUGxhdGZvcm0vUG9reV9LaXJrc3RvbmUv
YnVpbGQvdG1wL3dvcmsvY29ydGV4YTcyLXBva3ktbGludXgvcWVtdS82LjIuMC1yMC9yZWNpcGUt
c3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9tZXNvbiAtLWludGVybmFsIGV4ZSAtLWNhcHR1cmUgcWVt
dS12ZXJzaW9uLmggLS0gL2hvbWUvYWdsL0F1dG9tb3RpdmUvQURBU19JbmZvdGFpbm1lbnQvUGxh
dGZvcm0vUG9reV9LaXJrc3RvbmUvYnVpbGQvdG1wL3dvcmsvY29ydGV4YTcyLXBva3ktbGludXgv
cWVtdS82LjIuMC1yMC9xZW11LTYuMi4wL3NjcmlwdHMvcWVtdS12ZXJzaW9uLnNoIC9ob21lL2Fn
bC9BdXRvbW90aXZlL0FEQVNfSW5mb3RhaW5tZW50L1BsYXRmb3JtL1Bva3lfS2lya3N0b25lL2J1
aWxkL3RtcC93b3JrL2NvcnRleGE3Mi1wb2t5LWxpbnV4L3FlbXUvNi4yLjAtcjAvcWVtdS02LjIu
MCAmIzM5OyYjMzk7IDYuMi4wPGJyPi91c3IvYmluL2Vudjog4oCYbmF0aXZlcHl0aG9uM+KAmTog
Tm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeTxicj5uaW5qYTogYnVpbGQgc3RvcHBlZDogc3ViY29t
bWFuZCBmYWlsZWQuPGJyPm1ha2U6ICoqKiBbTWFrZWZpbGU6MTYyOiBydW4tbmluamFdIEVycm9y
IDE8YnI+PGJyPlRoYW5rcyAmYW1wOyBSZWdhcmRzLDxicj5WaXB1bCBLdW1hcjxicj48L2Rpdj48
L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJn
bWFpbF9hdHRyIj5PbiBXZWQsIERlYyAxNCwgMjAyMiBhdCA0OjU1IEFNIFN0ZWZhbm8gU3RhYmVs
bGluaSAmbHQ7PGEgaHJlZj0ibWFpbHRvOnNzdGFiZWxsaW5pQGtlcm5lbC5vcmciPnNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc8L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9
ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0
OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPkhpIFZpcHVsLDxi
cj4NCjxicj4NCkdvb2QgcHJvZ3Jlc3MhIFRoZSBtYWluIGZ1bmN0aW9uIHdlIHNob3VsZCBjaGVj
ayBpcyAmcXVvdDt4ZW5mYl9yZWZyZXNoJnF1b3Q7IGJ1dDxicj4NCmZyb20gdGhlIGxvZ3MgaXQg
bG9va3MgbGlrZSBpdCBpcyBjYWxsZWQgc2V2ZXJhbCB0aW1lcy4gV2hpY2ggbWVhbnMgdGhhdDxi
cj4NCmV2ZXJ5dGhpbmcgc2VlbXMgdG8gYmUgd29ya2luZyBhcyBleHBlY3RlZCBvbiB0aGUgTGlu
dXggc2lkZS48YnI+DQo8YnI+DQpJdCBpcyB0aW1lIHRvIGludmVzdGlnYXRlIHRoZSBRRU1VIHNp
ZGU6PGJyPg0KLi9ody9kaXNwbGF5L3hlbmZiLmM6eGVuZmJfaGFuZGxlX2V2ZW50czxicj4NCi4v
aHcvZGlzcGxheS94ZW5mYi5jOnhlbmZiX21hcF9mYjxicj4NCjxicj4NCkkgd29uZGVyIGlmIHRo
ZSBpc3N1ZSBpcyBpbnRlcm5hbCB0byBRRU1VLiBZb3UgbWlnaHQgd2FudCB0byB1c2UgYW48YnI+
DQpvbGRlciBRRU1VIHZlcnNpb24gdG8gY2hlY2sgaWYgaXQgd29ya3MsIG1heWJlIDYuMCBvciA1
LjAgb3IgZXZlbiA0LjAuPGJyPg0KSSBhbHNvIHdvbmRlciBpZiBpdCBpcyBhIHByb2JsZW0gYmV0
d2VlbiB4ZW5mYi5jIGFuZCB0aGUgcmVzdCBvZiBRRU1VLiBJPGJyPg0Kd291bGQgaW52ZXN0aWdh
dGUgaG93IHhlbmZiLSZndDtwaXhlbHMgaXMgcmVuZGVyZWQgYnkgdGhlIHJlc3Qgb2YgUUVNVS48
YnI+DQpTcGVjaWZpY2FsbHkgeW91IG1pZ2h0IHdhbnQgdG8gbG9vayBhdCB0aGUgY2FsbCB0bzxi
cj4NCnFlbXVfY3JlYXRlX2Rpc3BsYXlzdXJmYWNlLCBxZW11X2NyZWF0ZV9kaXNwbGF5c3VyZmFj
ZV9mcm9tIGFuZDxicj4NCmRweV9nZnhfcmVwbGFjZV9zdXJmYWNlIGluIHhlbmZiX3VwZGF0ZS48
YnI+DQo8YnI+DQpJIGhvcGUgdGhpcyBoZWxwcy48YnI+DQo8YnI+DQpDaGVlcnMsPGJyPg0KPGJy
Pg0KU3RlZmFubzxicj4NCjxicj4NCjxicj4NCk9uIFR1ZSwgMTMgRGVjIDIwMjIsIFZpcHVsIFN1
bmVqYSB3cm90ZTo8YnI+DQomZ3Q7IEhpIFN0ZWZhbm8sPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IFRo
YW5rcyE8YnI+DQomZ3Q7IDxicj4NCiZndDsgSSBtb2RpZmllZCB4ZW4tZmJmcm9udC5jIHNvdXJj
ZSBmaWxlLCBpbmNsdWRlZCBwcmludGsgZGVidWcgbG9ncyAmYW1wOyBjcm9zcyBjb21waWxlZCBp
dC4gSSBpbmNsdWRlZCB0aGUgcHJpbnRrIGRlYnVnIGxvZyBhdCB0aGUgZW50cnkgJmFtcDsgZXhp
dDxicj4NCiZndDsgb2YgYWxsIGZ1bmN0aW9ucyBvZiB4ZW4tZmJmcm9udC5jIGZpbGUuPGJyPg0K
Jmd0OyBHZW5lcmF0ZWQga2VybmVsIG1vZHVsZSAmYW1wOyBsb2FkZWQgaW4gZ3Vlc3QgbWFjaGlu
ZSBhdCBib290dXAuIEkgY291bGQgc2VlIGxvdHMgb2YgbG9ncyBjb21pbmcgdXAsIGFuZCBjb3Vs
ZCBzZWUgbXVsdGlwbGUgZnVuY3Rpb25zIGJlaW5nPGJyPg0KJmd0OyBpbnZva2VkIGV2ZW4gaWYg
SSBoYXZlwqBub3QgdXNlZMKgdm5jdmlld2VyIGluIHRoZSBob3N0LiBBdHRhY2hpbmcgdGhlIGxv
ZyBmaWxlIGZvciByZWZlcmVuY2UuIEFueSBzcGVjaWZpYyBmdW5jdGlvbiBvciBwYXJhbWV0ZXJz
IHRoYXQgaGF2ZTxicj4NCiZndDsgdG8gYmUgY2hlY2tlZCBvciBhbnkgb3RoZXIgc3VnZ2VzdGlv
biBhcyBwZXIgbG9ncz88YnI+DQomZ3Q7IDxicj4NCiZndDsgVGhhbmtzICZhbXA7IFJlZ2FyZHMs
PGJyPg0KJmd0OyBWaXB1bCBLdW1hcjxicj4NCiZndDsgPGJyPg0KJmd0OyBPbiBUdWUsIERlYyAx
MywgMjAyMiBhdCAzOjQ0IEFNIFN0ZWZhbm8gU3RhYmVsbGluaSAmbHQ7PGEgaHJlZj0ibWFpbHRv
OnNzdGFiZWxsaW5pQGtlcm5lbC5vcmciIHRhcmdldD0iX2JsYW5rIj5zc3RhYmVsbGluaUBrZXJu
ZWwub3JnPC9hPiZndDsgd3JvdGU6PGJyPg0KJmd0O8KgIMKgIMKgIMKgSGkgVmlwdWwsPGJyPg0K
Jmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqAgwqBJIGFtIG9ubGluZSBvbiBJUkMgT0ZUQyAjeGVuZGV2
ZWwgKDxhIGhyZWY9Imh0dHBzOi8vd3d3Lm9mdGMubmV0LyIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cHM6Ly93d3cub2Z0Yy5uZXQvPC9hPiwgeW91IG5lZWQgYTxicj4NCiZn
dDvCoCDCoCDCoCDCoHJlZ2lzdGVyZWQgbmlja25hbWUgdG8gam9pbiAjeGVuZGV2ZWwpLjxicj4N
CiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgIMKgRm9yIGRldmVsb3BtZW50IGFuZCBkZWJ1Z2dpbmcg
SSBmaW5kIHRoYXQgaXQgaXMgYSBsb3QgZWFzaWVyIHRvPGJyPg0KJmd0O8KgIMKgIMKgIMKgY3Jv
c3Njb21waWxlIHRoZSBrZXJuZWwgJnF1b3Q7YnkgaGFuZCZxdW90OywgYW5kIGRvIGEgbW9ub2xp
dGhpYyBidWlsZCwgcmF0aGVyPGJyPg0KJmd0O8KgIMKgIMKgIMKgdGhhbiBnb2luZyB0aHJvdWdo
IFlvY3RvLjxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgIMKgRm9yIGluc3RhbmNlIHRoZSBm
b2xsb3dpbmcgYnVpbGRzIGZvciBtZTo8YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoCDCoGNk
IGxpbnV4LmdpdDxicj4NCiZndDvCoCDCoCDCoCDCoGV4cG9ydCBBUkNIPWFybTY0PGJyPg0KJmd0
O8KgIMKgIMKgIMKgZXhwb3J0IENST1NTX0NPTVBJTEU9L3BhdGgvdG8vY3Jvc3MtY29tcGlsZXI8
YnI+DQomZ3Q7wqAgwqAgwqAgwqBtYWtlIGRlZmNvbmZpZzxicj4NCiZndDvCoCDCoCDCoCDCoFth
ZGQgcHJpbnRrcyB0byBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3hlbi1mYmZyb250LmNdPGJyPg0KJmd0
O8KgIMKgIMKgIMKgbWFrZSAtajggSW1hZ2UuZ3o8YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDC
oCDCoEFuZCBJbWFnZS5neiBib290cyBvbiBYZW4gYXMgRG9tVSBrZXJuZWwgd2l0aG91dCBpc3N1
ZXMuPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqAgwqBDaGVlcnMsPGJyPg0KJmd0OyA8YnI+
DQomZ3Q7wqAgwqAgwqAgwqBTdGVmYW5vPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqAgwqBP
biBTYXQsIDEwIERlYyAyMDIyLCBWaXB1bCBTdW5lamEgd3JvdGU6PGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0OyBIaSBTdGVmYW5vLDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IFRoYW5rcyE8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0OyBJIGhhdmUgaW5jbHVkZWQgcHJpbnRrIGRlYnVnIGxvZ3MgaW4gdGhlIHhl
bi1mYmZyb250LmMgc291cmNlIGZpbGUuIFdoaWxlIGNyb3NzIGNvbXBpbGluZyB0byBnZW5lcmF0
ZSAua28gd2l0aDxicj4NCiZndDvCoCDCoCDCoCDCoCZxdW90O3hlbi1ndWVzdC1pbWFnZS1taW5p
bWFsJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyB0b29sY2hhaW4gaXQmIzM5O3MgdGhy
b3dpbmcgYSBtb2Rwb3N0PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyBub3QgZm91bmQgZXJyb3Iu
IEkgY291bGQgc2VlIHRoZSBtb2Rwb3N0LmMgc291cmNlIGZpbGUgYnV0IHRoZSBmaW5hbCBzY3Jp
cHQgaXMgbWlzc2luZy4gQW55IGlucHV0IG9uIHRoaXMsIEJlbG93IGFyZSB0aGU8YnI+DQomZ3Q7
wqAgwqAgwqAgwqBsb2dzOjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IGFnbEBhZ2wtT3B0aVBsZXgtNzAxMDp+L0F1dG9tb3RpdmUvQURBU19JbmZvdGFp
bm1lbnQvcHJvamVjdC9BcHBsaWNhdGlvbi9YZW4vRnJhbWVidWZmZXIkIG1ha2U8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IG1ha2UgQVJDSD1hcm02NCAtSS9vcHQvcG9reS80LjAuNS9zeXNyb290
cy9jb3J0ZXhhNzItcG9reS1saW51eC91c3IvaW5jbHVkZS9hc20gLUM8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IC9vcHQvcG9reS80LjAuNS9zeXNyb290cy9jb3J0ZXhhNzItcG9reS1saW51eC9s
aWIvbW9kdWxlcy81LjE1LjcyLXlvY3RvLXN0YW5kYXJkL2J1aWxkPGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0OyBNPS9ob21lL2FnbC9BdXRvbW90aXZlL0FEQVNfSW5mb3RhaW5tZW50L3Byb2plY3Qv
QXBwbGljYXRpb24vWGVuL0ZyYW1lYnVmZmVyIG1vZHVsZXM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IG1ha2VbMV06IEVudGVyaW5nIGRpcmVjdG9yeSAmIzM5Oy9vcHQvcG9reS80LjAuNS9zeXNy
b290cy9jb3J0ZXhhNzItcG9reS1saW51eC9saWIvbW9kdWxlcy81LjE1LjcyLXlvY3RvLXN0YW5k
YXJkL2J1aWxkJiMzOTs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGFyY2gvYXJtNjQvTWFrZWZp
bGU6MzY6IERldGVjdGVkIGFzc2VtYmxlciB3aXRoIGJyb2tlbiAuaW5zdDsgZGlzYXNzZW1ibHkg
d2lsbCBiZSB1bnJlbGlhYmxlPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyB3YXJuaW5nOiB0aGUg
Y29tcGlsZXIgZGlmZmVycyBmcm9tIHRoZSBvbmUgdXNlZCB0byBidWlsZCB0aGUga2VybmVsPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCBUaGUga2VybmVsIHdhcyBidWlsdCBieTogZ2NjIChV
YnVudHUgOS40LjAtMXVidW50dTF+MjAuMDQuMSkgOS40LjA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IMKgIFlvdSBhcmUgdXNpbmc6IMKgIMKgIMKgIMKgIMKgIGFhcmNoNjQtcG9reS1saW51eC1n
Y2MgKEdDQykgMTEuMy4wPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCBDQyBbTV0gwqAvaG9t
ZS9hZ2wvQXV0b21vdGl2ZS9BREFTX0luZm90YWlubWVudC9wcm9qZWN0L0FwcGxpY2F0aW9uL1hl
bi9GcmFtZWJ1ZmZlci94ZW4tZmJmcm9udC5vPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCBN
T0RQT1NUIC9ob21lL2FnbC9BdXRvbW90aXZlL0FEQVNfSW5mb3RhaW5tZW50L3Byb2plY3QvQXBw
bGljYXRpb24vWGVuL0ZyYW1lYnVmZmVyL01vZHVsZS5zeW12ZXJzPGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0OyAvYmluL3NoOiAxOiBzY3JpcHRzL21vZC9tb2Rwb3N0OiBub3QgZm91bmQ8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IG1ha2VbMl06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5tb2Rwb3N0
OjEzMzo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAvaG9tZS9hZ2wvQXV0b21vdGl2ZS9BREFTX0luZm90
YWlubWVudC9wcm9qZWN0L0FwcGxpY2F0aW9uL1hlbi9GcmFtZWJ1ZmZlci9Nb2R1bGUuc3ltdmVy
c108YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEVycm9yIDEyNzxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDsgbWFrZVsxXTogKioqIFtNYWtlZmlsZToxODEzOiBtb2R1bGVzXSBFcnJvciAyPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0OyBtYWtlWzFdOiBMZWF2aW5nIGRpcmVjdG9yeSAmIzM5Oy9vcHQv
cG9reS80LjAuNS9zeXNyb290cy9jb3J0ZXhhNzItcG9reS1saW51eC9saWIvbW9kdWxlcy81LjE1
LjcyLXlvY3RvLXN0YW5kYXJkL2J1aWxkJiMzOTs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IG1h
a2U6ICoqKiBbTWFrZWZpbGU6NTogYWxsXSBFcnJvciAyPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
OyBhZ2xAYWdsLU9wdGlQbGV4LTcwMTA6fi9BdXRvbW90aXZlL0FEQVNfSW5mb3RhaW5tZW50L3By
b2plY3QvQXBwbGljYXRpb24vWGVuL0ZyYW1lYnVmZmVyJCBscyAtbDxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDsgdG90YWwgMzI0PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyAtcnd4cnd4cnd4IDEg
YWdsIGFnbCDCoCDCoDM1OSBEZWMgMTAgMjI6NDEgTWFrZWZpbGU8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IC1ydy1ydy1yLS0gMSBhZ2wgYWdsIMKgIMKgIDkwIERlYyAxMCAyMjo0OSBtb2R1bGVz
Lm9yZGVyPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyAtcnctci0tci0tIDEgYWdsIGFnbCDCoDE4
MzMxIERlYyDCoDEgMjA6MzIgeGVuLWZiZnJvbnQuYzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsg
LXJ3LXJ3LXItLSAxIGFnbCBhZ2wgwqAgwqAgOTAgRGVjIDEwIDIyOjQ5IHhlbi1mYmZyb250Lm1v
ZDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgLXJ3LXJ3LXItLSAxIGFnbCBhZ2wgMjk3ODMyIERl
YyAxMCAyMjo0OSB4ZW4tZmJmcm9udC5vPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyBhZ2xAYWds
LU9wdGlQbGV4LTcwMTA6fi9BdXRvbW90aXZlL0FEQVNfSW5mb3RhaW5tZW50L3Byb2plY3QvQXBw
bGljYXRpb24vWGVuL0ZyYW1lYnVmZmVyJCBmaWxlIHhlbi1mYmZyb250Lm88YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IHhlbi1mYmZyb250Lm86IEVMRiA2NC1iaXQgTFNCIHJlbG9jYXRhYmxlLCBB
Uk0gYWFyY2g2NCwgdmVyc2lvbiAxIChTWVNWKSwgd2l0aCBkZWJ1Z19pbmZvLCBub3Qgc3RyaXBw
ZWQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGFnbEBhZ2wtT3B0aVBsZXgtNzAxMDp+L0F1dG9t
b3RpdmUvQURBU19JbmZvdGFpbm1lbnQvcHJvamVjdC9BcHBsaWNhdGlvbi9YZW4vRnJhbWVidWZm
ZXIkPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgSSBo
YXZlIGNvbm5lY3RlZCBhIEhETUkgYmFzZWQgMTk4MHgxMDI0IHJlc29sdXRpb24gZGlzcGxheSBz
Y3JlZW4gdG8gcmFzcGJlcnJ5cGk0IGZvciB0ZXN0aW5nIHB1cnBvc2VzLiBJIGhvcGUgY29ubmVj
dGluZzxicj4NCiZndDvCoCDCoCDCoCDCoHRoaXMgZGlzcGxheSB0bzxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDsgcnBpNCBzaG91bGQgYmUgb2suPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDsgSXMgdGhlcmUgYW55IG90aGVyIHdheSB3ZSBjYW4gY29ubmVj
dCBhbHNvIGZvciBkZXRhaWxlZCBkaXNjdXNzaW9uIG9uIHRoZSBkaXNwbGF5IGJyaW5ndXAgaXNz
dWU/IFRoaXMgd2lsbCByZWFsbHkgaGVscCB0bzxicj4NCiZndDvCoCDCoCDCoCDCoHJlc29sdmUg
dGhpczxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgaXNzdWUuPGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgVGhhbmtzICZhbXA7IFJlZ2FyZHMsPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0OyBWaXB1bCBLdW1hcjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IE9uIEZyaSwgRGVjIDIsIDIwMjIgYXQgMTowMiBBTSBT
dGVmYW5vIFN0YWJlbGxpbmkgJmx0OzxhIGhyZWY9Im1haWx0bzpzc3RhYmVsbGluaUBrZXJuZWwu
b3JnIiB0YXJnZXQ9Il9ibGFuayI+c3N0YWJlbGxpbmlAa2VybmVsLm9yZzwvYT4mZ3Q7IHdyb3Rl
Ojxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoE9uIFRodSwgMSBEZWMgMjAyMiwg
VmlwdWwgU3VuZWphIHdyb3RlOjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDsgSGkgU3RlZmFubyw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFRo
YW5rcyE8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBJIGFtIGV4cGxvcmluZyBib3RoIG9wdGlvbnMg
aGVyZSwgbW9kaWZpY2F0aW9uIG9mIGZyYW1lYnVmZmVyIHNvdXJjZSBmaWxlICZhbXA7IHNldHRp
bmcgdXAgeDExdm5jIHNlcnZlciBpbiBndWVzdC48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IE90aGVyIHRoYW4gdGhlc2UgSSB3b3VsZCBsaWtlIHRvIHNoYXJlIGEgZmV3
IGZpbmRpbmdzIHdpdGggeW91Ljxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IDEuIElmIGkga2VlcCAm
cXVvdDtDT05GSUdfWEVOX0ZCREVWX0ZST05URU5EPXkmcXVvdDsgdGhlbiB4ZW4tZmJmcm9udC5r
byBpcyBub3QgZ2VuZXJhdGluZyBidXQgaWYgaSBrZWVwPGJyPg0KJmd0O8KgIMKgIMKgIMKgJnF1
b3Q7Q09ORklHX1hFTl9GQkRFVl9GUk9OVEVORD1tJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0OyB0aGVuIGNvdWxkIHNlZSB4ZW4tZmJmcm9udC5rbyAmYW1wOyBp
dHMgbG9hZGluZyBhbHNvLiBTYW1lIHRoaW5ncyB3aXRoIG90aGVyIGZyb250ZW5kL2JhY2tlbmQg
ZHJpdmVycyBhbHNvLiBEbyB3ZSBuZWVkIHRvPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgY29uZmlndXJlwqB0aGVzZTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgZHJpdmVycyBhcyBhIG1vZHVsZShtKSBvbmx5Pzxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqB4ZW4tZmJmcm9udCBzaG91bGQg
d29yayBib3RoIGFzIGEgbW9kdWxlICh4ZW4tZmJmcm9udC5rbykgb3IgYnVpbHQtaW48YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAoQ09ORklHX1hFTl9GQkRFVl9GUk9OVEVORD15
KS48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IDIuIEkgY291bGQgc2VlIHhlbnN0b3JlZCBzZXJ2aWNlIGlzIHJ1bm5pbmcgZm9yIHRoZSBo
b3N0IGJ1dCBpdCYjMzk7cyBhbHdheXMgZmFpbGluZyBmb3IgdGhlIGd1ZXN0wqBtYWNoaW5lLiBJ
IGNvdWxkIHNlZTxicj4NCiZndDvCoCDCoCDCoCDCoGl0IGluPGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgYm9vdHVwIGxvZ3MgJmFtcDsgdmlhPGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0OyBzeXN0ZW1jdGwgc3RhdHVzIGFsc28uPGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoFRoYXQgaXMgbm9y
bWFsLiB4ZW5zdG9yZWQgaXMgb25seSBtZWFudCB0byBiZSBydW4gaW4gRG9tMCwgbm90IGluIHRo
ZTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoGRvbVVzLiBJZiB5b3UgdXNlIHRo
ZSBzYW1lIHJvb3RmcyBmb3IgRG9tMCBhbmQgRG9tVSB0aGVuIHhlbnN0b3JlZCB3aWxsPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgZmFpbCBzdGFydGluZyBpbiB0aGUgRG9tVSAo
YnV0IHNob3VsZCBzdWNjZWVkIGluIERvbTApLCB3aGljaCBpcyB3aGF0IHdlPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgd2FudC48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgSWYgeW91IHJ1biAmcXVvdDt4ZW5zdG9y
ZS1scyZxdW90OyBpbiBEb20wLCB5b3UmIzM5O2xsIHNlZSBhIGJ1bmNoIG9mIGVudHJpZXMsPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgaW5jbHVkaW5nIHNvbWUgb2YgdGhlbSBy
ZWxhdGVkIHRvICZxdW90O3ZmYiZxdW90OyB3aGljaCBpcyB0aGUgdmlydHVhbCBmcmFtZWJ1ZmZl
cjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoHByb3RvY29sLiBZb3Ugc2hvdWxk
IGFsc28gc2VlIGFuIGVudHJ5IGNhbGxlZCAmcXVvdDtzdGF0ZSZxdW90OyBzZXQgdG8gJnF1b3Q7
NCZxdW90OyB3aGljaDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoG1lYW5zICZx
dW90O2Nvbm5lY3RlZCZxdW90Oy4gc3RhdGUgPSA0IGlzIHVzdWFsbHkgd2hlbiBldmVyeXRoaW5n
IHdvcmtzLiBOb3JtYWxseTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoHdoZW4g
dGhpbmdzIGRvbiYjMzk7dCB3b3JrIHN0YXRlICE9IDQuPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBCZWxvdyBhcmUgdGhlIGxvZ3M6PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBbIMKgT0sgwqBdIFJlYWNoZWQg
dGFyZ2V0IEJhc2ljIFN5c3RlbS48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IFsgwqBPSyDCoF0gU3RhcnRlZCBLZXJuZWwgTG9nZ2luZyBTZXJ2aWNlLjxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgWyDCoE9LIMKgXSBTdGFydGVkIFN5c3RlbSBM
b2dnaW5nIFNlcnZpY2UuPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDC
oCDCoCDCoCDCoCDCoFN0YXJ0aW5nIEQtQnVzIFN5c3RlbSBNZXNzYWdlIEJ1cy4uLjxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqAgwqBTdGFydGluZyBV
c2VyIExvZ2luIE1hbmFnZW1lbnQuLi48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IMKgIMKgIMKgIMKgIMKgU3RhcnRpbmcgUGVybWl0IFVzZXIgU2Vzc2lvbnMuLi48YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgIMKgU3RhcnRp
bmcgVGhlIFhlbiB4ZW5zdG9yZS4uLjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgwqAgwqAgwqAgwqAgwqBTdGFydGluZyBPcGVuU1NIIEtleSBHZW5lcmF0aW9uLi4uPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBbRkFJTEVEXSBGYWlsZWQgdG8g
c3RhcnQgVGhlIFhlbiB4ZW5zdG9yZS48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IFNlZSAmIzM5O3N5c3RlbWN0bCBzdGF0dXMgeGVuc3RvcmVkLnNlcnZpY2UmIzM5OyBm
b3IgZGV0YWlscy48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFtERVBF
TkRdIERlcGVuZGVuY3kgZmFpbGVkIGZvciBxZW11IGZvciB4ZW4gZG9tMCBkaXNrIGJhY2tlbmQu
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBbREVQRU5EXSBEZXBlbmRl
bmN5IGZhaWxlZCBmb3IgWGVuZOKApnAgZ3Vlc3RzIG9uIGJvb3QgYW5kIHNodXRkb3duLjxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgW0RFUEVORF0gRGVwZW5kZW5jeSBm
YWlsZWQgZm9yIHhlbi3igKZkZXMsIEpTT04gY29uZmlndXJhdGlvbiBzdHViKS48YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFtERVBFTkRdIERlcGVuZGVuY3kgZmFpbGVk
IGZvciBYZW5j4oCmZ3Vlc3QgY29uc29sZXMgYW5kIGh5cGVydmlzb3IuPGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBbIMKgT0sgwqBdIEZpbmlzaGVkIFBlcm1pdCBVc2Vy
IFNlc3Npb25zLjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgWyDCoE9L
IMKgXSBTdGFydGVkIEdldHR5IG9uIHR0eTEuPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0OyBbIMKgT0sgwqBdIFN0YXJ0ZWQgU2VyaWFsIEdldHR5IG9uIGh2YzAuPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBbIMKgT0sgwqBdIFN0YXJ0ZWQgU2Vy
aWFsIEdldHR5IG9uIHR0eVMwLjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDsgWyDCoE9LIMKgXSBSZWFjaGVkIHRhcmdldCBMb2dpbiBQcm9tcHRzLjxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqAgwqBTdGFydGluZyBYZW4td2F0
Y2hkb2cgLSBydW4geGVuIHdhdGNoZG9nIGRhZW1vbi4uLjxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDsgWyDCoE9LIMKgXSBTdGFydGVkIEQtQnVzIFN5c3RlbSBNZXNzYWdl
IEJ1cy48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFsgwqBPSyDCoF0g
U3RhcnRlZCBYZW4td2F0Y2hkb2cgLSBydW4geGVuIHdhdGNoZG9nIGRhZW1vbi48YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFsgwqBPSyDCoF0gRmluaXNoZWQgT3BlblNT
SCBLZXkgR2VuZXJhdGlvbi48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IFsgwqBPSyDCoF0gU3RhcnRlZCBVc2VyIExvZ2luIE1hbmFnZW1lbnQuPGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBbIMKgT0sgwqBdIFJlYWNoZWQgdGFyZ2V0IE11bHRp
LVVzZXIgU3lzdGVtLjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAg
wqAgwqAgwqAgwqBTdGFydGluZyBSZWNvcmQgUnVubGV2ZWwgQ2hhbmdlIGluIFVUTVAuLi48YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFsgwqBPSyDCoF0gRmluaXNoZWQg
UmVjb3JkIFJ1bmxldmVsIENoYW5nZSBpbiBVVE1QLjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgZmJjb246IFRha2luZyBvdmVyIGNvbnNvbGU8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0OyBQb2t5IChZb2N0byBQcm9qZWN0IFJlZmVyZW5jZSBEaXN0cm8pIDQuMC40IHJhc3Bi
ZXJyeXBpNC02NCBodmMwPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgcmFzcGJlcnJ5cGk0LTY0IGxv
Z2luOiByb290PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyByb290QHJh
c3BiZXJyeXBpNC02NDp+Izxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsg
cm9vdEByYXNwYmVycnlwaTQtNjQ6fiM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IHJvb3RAcmFzcGJlcnJ5cGk0LTY0On4jIHN5c3RlbWN0bCBzdGF0dXMgeGVuc3RvcmVk
LnNlcnZpY2U8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHggeGVuc3Rv
cmVkLnNlcnZpY2UgLSBUaGUgWGVuIHhlbnN0b3JlPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0OyDCoCDCoCDCoExvYWRlZDogbG9hZGVkICgvbGliL3N5c3RlbWQvc3lzdGVt
L3hlbnN0b3JlZC5zZXJ2aWNlOyBlbmFibGVkOyB2ZW5kb3IgcHJlc2V0OiBlbmFibGVkKTxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBBY3RpdmU6IGZhaWxl
ZCAoUmVzdWx0OiBleGl0LWNvZGUpIHNpbmNlIFRodSAyMDIyLTEyLTAxIDA2OjEyOjA1IFVUQzsg
MjZzIGFnbzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgUHJv
Y2VzczogMTk1IEV4ZWNTdGFydFByZT0vYmluL2dyZXAgLXEgY29udHJvbF9kIC9wcm9jL3hlbi9j
YXBhYmlsaXRpZXMgKGNvZGU9ZXhpdGVkLCBzdGF0dXM9MS9GQUlMVVJFKTxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IERlYyAwMSAwNjoxMjowNCByYXNwYmVycnlwaTQtNjQgc3lzdGVtZFsxXTogU3Rh
cnRpbmcgVGhlIFhlbiB4ZW5zdG9yZS4uLjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDsgRGVjIDAxIDA2OjEyOjA1IHJhc3BiZXJyeXBpNC02NCBzeXN0ZW1kWzFdOiB4ZW5z
dG9yZWQuc2VydmljZTogQ29udHJvbCBwcm8uLi5VUkU8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IERlYyAwMSAwNjoxMjowNSByYXNwYmVycnlwaTQtNjQgc3lzdGVtZFsx
XTogeGVuc3RvcmVkLnNlcnZpY2U6IEZhaWxlZCB3aXRoLi4uZSYjMzk7Ljxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgRGVjIDAxIDA2OjEyOjA1IHJhc3BiZXJyeXBpNC02
NCBzeXN0ZW1kWzFdOiBGYWlsZWQgdG8gc3RhcnQgVGhlIFhlbiB4ZW5zdG9yZS48YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEhpbnQ6IFNvbWUgbGluZXMgd2VyZSBlbGxp
cHNpemVkLCB1c2UgLWwgdG8gc2hvdyBpbiBmdWxsLjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgcm9vdEByYXNwYmVycnlwaTQtNjQ6fiPCoDxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IEFueSBpbnB1dCBvbiB0aGVzZT88YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBUaGFua3Mg
JmFtcDsgUmVnYXJkcyw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFZp
cHVsIEt1bWFyPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgT24gV2VkLCBOb3YgMjMsIDIwMjIgYXQg
NTo0MSBBTSBTdGVmYW5vIFN0YWJlbGxpbmkgJmx0OzxhIGhyZWY9Im1haWx0bzpzc3RhYmVsbGlu
aUBrZXJuZWwub3JnIiB0YXJnZXQ9Il9ibGFuayI+c3N0YWJlbGxpbmlAa2VybmVsLm9yZzwvYT4m
Z3Q7IHdyb3RlOjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoEhpIFZpcHVsLDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBJIGNhbm5vdCBz
cG90IGFueSBpc3N1ZSBpbiB0aGUgY29uZmlndXJhdGlvbiwgaW4gcGFydGljdWFsIHlvdSBoYXZl
Ojxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBDT05GSUdfWEVOX0ZCREVWX0ZST05U
RU5EPXk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgd2hpY2ggaXMgd2hhdCB5b3Ug
bmVlZC48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgVGhlIG9ubHkgdGhpbmcgSSBj
YW4gc3VnZ2VzdCBpcyB0byBhZGQgcHJpbnRrcyB0byB0aGUgTGludXggZnJvbnRlbmQ8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBkcml2ZXIgKHRoZSBv
bmUgcnVubmluZyBpbiB0aGUgZG9tVSkgd2hpY2ggaXM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3hlbi1mYmZyb250
LmMgYW5kIHByaW50ZnMgdG8gdGhlIFFFTVUgYmFja2VuZDxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoChydW5uaW5nIGluIERvbTApIHdoaWNoIGlzIGh3
L2Rpc3BsYXkveGVuZmIuYyB0byBmaWd1cmUgb3V0IHdoYXQgaXM8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBnb2luZyBvbi48YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oEFsdGVybmF0aXZlbHksIHlvdSBjYW4gc2V0dXAgUFYgbmV0d29yayB3aXRoIHRoZSBkb21VLCBz
dWNoIGFzOjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqDCoCB2aWY9WyYjMzk7JiMz
OTtdPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoGFuZCB0aGVuIHJ1biB4MTEgYW5k
IGEgeDExdm5jIHNlcnZlciBpbiB5b3VyIGRvbVUuIFlvdSBzaG91bGQgYmUgYWJsZSB0bzxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoGNvbm5lY3QgdG8g
aXQgdXNpbmcgdm5jdmlld2VyIGF0IHRoZSBuZXR3b3JrIElQIG9mIHlvdXIgZG9tVS48YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgQmFzaWNhbGx5IHlvdSBhcmUgc2tpcHBpbmcgdGhl
IHByb2JsZW0gYmVjYXVzZSBpbnN0ZWFkIG9mIHVzaW5nIHRoZSBQVjxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoGZyYW1lYnVmZmVyIHByb3RvY29sLCB5
b3UganVzdCB1c2UgVk5DIG92ZXIgdGhlIG5ldHdvcmsgd2l0aCB0aGUgZG9tVS48YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoENoZWVycyw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgU3RlZmFubzxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgT24gVHVlLCAyMiBOb3YgMjAyMiwgVmlwdWwgU3VuZWphIHdyb3RlOjxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgSGkg
U3RlZmFubyw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IFRoYW5rcyBmb3IgdGhlwqBzdXBwb3J0ITxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IExvb2tzIGxpa2UgSSBoYXZlIHRyaWVkIGFsbCB0
aGUgY29tYmluYXRpb25zwqAmYW1wOyBwb3NzaWJsZSB3YXlzIHRvIGdldCBkaXNwbGF5IHVwIGJ1
dCBmYWlsZWQuIElzIHRoZXJlIGFueTxicj4NCiZndDvCoCDCoCDCoCDCoGRvY3VtZW50IG9yPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgcGRmIGZvcjxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoHBvcnRpbmcgeGVuIG9uPGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyByYXNwYmVycnlw
aTQuPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
OyBJIGNvdWxkIGZpbmQgbG90JiMzOTtzIG9mIGxpbmtzIHRlbGxpbmcgdGhlIHNhbWUgYnV0IGNv
dWxkbiYjMzk7dCBzZWUgYW55IG9mZmljaWFsIHVzZXIgZ3VpZGUgb3IgZG9jdW1lbnQgZnJvbSB0
aGU8YnI+DQomZ3Q7wqAgwqAgwqAgwqB4ZW48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqBjb21tdW5pdHkgb248YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqB0aGUgc2FtZS4gSWY8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHRoZXJlIGlzIHNvbWV0aGluZyB0byByZWZlcsKgPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyB0byBwbGVh
c2Ugc2hhcmUgd2l0aCBtZS48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IEkgYW0gYXR0YWNoaW5nIHRoZSBrZXJuZWwgY29uZmlndXJhdGlvbiBm
aWxlIGFsc28sIGp1c3QgdGFrZSBhIGxvb2sgaWYgaSBoYXZlIG1pc3NlZCBhbnl0aGluZy48YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEFueSBv
dGhlciBzdWdnZXN0aW9ucyBvciBpbnB1dCBmcm9tIHlvdXIgZW5kIGNvdWxkIGJlIHJlYWxseSBo
ZWxwZnVsPzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IFJlZ2FyZHMsPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0OyBWaXB1bCBLdW1hcjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IE9uIEZyaSwgTm92IDExLCAyMDIyIGF0IDY6NDAgQU0gU3RlZmFu
byBTdGFiZWxsaW5pICZsdDs8YSBocmVmPSJtYWlsdG86c3N0YWJlbGxpbmlAa2VybmVsLm9yZyIg
dGFyZ2V0PSJfYmxhbmsiPnNzdGFiZWxsaW5pQGtlcm5lbC5vcmc8L2E+Jmd0OyB3cm90ZTo8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqBIaSBWaXB1bCw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5LiBGcm9tIHRoZSBl
YXJsaWVyIGxvZ3MgdGhhdCB5b3Ugc2VudCwgaXQgbG9va3M8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBsaWtlIGV2ZXJ5dGhp
bmcgc2hvdWxkIGJlIHdvcmtpbmcgY29ycmVjdGx5LiBTcGVjaWZpY2FsbHk6PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoMKgwqAg
wqAgdmZiID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgwqDCoCDCoCDCoDEgPSAmcXVvdDsmcXVvdDs8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqDCoMKgIMKgIMKgIDAgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqDCoMKgIMKgIMKgIMKg
ZnJvbnRlbmQgPSAmcXVvdDsvbG9jYWwvZG9tYWluLzEvZGV2aWNlL3ZmYi8wJnF1b3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgwqDCoCDCoCDCoCDCoGZyb250ZW5kLWlkID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoMKgwqAg
wqAgwqAgwqBvbmxpbmUgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgwqDCoCDCoCDCoCDCoHN0YXRl
ID0gJnF1b3Q7NCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoMKgwqAgwqAgwqAgwqB2bmMgPSAmcXVvdDsxJnF1b3Q7
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgwqDCoCDCoCDCoCDCoHZuY2xpc3RlbiA9ICZxdW90OzEyNy4wLjAuMSZxdW90Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoMKgwqAgwqAgwqAgwqB2bmNkaXNwbGF5ID0gJnF1b3Q7MCZxdW90Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoMKg
wqAgwqAgwqAgwqB2bmN1bnVzZWQgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgwqDCoCDCoCDCoCDC
oHNkbCA9ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqDCoMKgIMKgIMKgIMKgb3BlbmdsID0gJnF1b3Q7
MCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoMKgwqAgwqAgwqAgwqBmZWF0dXJlLXJlc2l6ZSA9ICZxdW90OzEmcXVv
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqDCoMKgIMKgIMKgIMKgaG90cGx1Zy1zdGF0dXMgPSAmcXVvdDtjb25uZWN0ZWQm
cXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqDCoMKgIMKgIMKgIMKgcmVxdWVzdC11cGRhdGUgPSAmcXVvdDsxJnF1b3Q7
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoHN0YXRlICZxdW90OzQmcXVvdDsgbWVhbnMgJnF1b3Q7Y29ubmVjdGVkJnF1b3Q7LiBT
byBJIHdvdWxkIGV4cGVjdCB0aGF0IHlvdSBzaG91bGQgYmUgYWJsZTxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoHRvIGNvbm5l
Y3QgdG8gdGhlIHZuYyBzZXJ2ZXIgdXNpbmcgdm5jdmlld2VyLiBZb3UgbWlnaHQgbm90IHNlZSBh
bnl0aGluZzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoChibGFjayBzY3JlZW4pIGJ1dCB5b3Ugc2hvdWxkIGRlZmluaXRlbHkg
YmUgYWJsZSB0byBjb25uZWN0Ljxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBJIHdvdWxkbiYjMzk7dCB0cnkgdG8gbGF1bmNoIHgx
MSBpbiB0aGUgZ3Vlc3QganVzdCB5ZXQuIGZiY29uIGluIExpbnV4IGlzPGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgZW5vdWdo
IHRvIHJlbmRlciBzb21ldGhpbmcgb24gdGhlIHNjcmVlbi4gWW91IHNob3VsZCBiZSBhYmxlIHRv
IHNlZSB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqBMaW51eCB0ZXh0LWJhc2VkIGNvbnNvbGUgcmVuZGVyZWQgZ3JhcGhp
Y2FsbHksIGNvbm5lY3RpbmcgdG8gaXQgdmlhIHZuYy48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgU29ycnkgZm9yIHRoZSBiYXNp
YyBxdWVzdGlvbiwgYnV0IGhhdmUgeW91IHRyaWVkIGFsbCB0aGUgZm9sbG93aW5nPzxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqB2
bmN2aWV3ZXIgPGEgaHJlZj0iaHR0cDovLzEyNy4wLjAuMTowIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj4xMjcuMC4wLjE6MDwvYT48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqB2bmN2aWV3ZXIgPGEgaHJlZj0i
aHR0cDovLzEyNy4wLjAuMToxIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj4xMjcu
MC4wLjE6MTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqB2bmN2aWV3ZXIgPGEgaHJlZj0iaHR0cDovLzEyNy4wLjAuMToy
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj4xMjcuMC4wLjE6MjwvYT48YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqB2bmN2aWV3ZXIgPGEgaHJlZj0iaHR0cDovLzEyNy4wLjAuMTo1OTAwIiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj4xMjcuMC4wLjE6NTkwMDwvYT48YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqB2bmN2aWV3ZXIg
PGEgaHJlZj0iaHR0cDovLzEyNy4wLjAuMTo1OTAxIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0i
X2JsYW5rIj4xMjcuMC4wLjE6NTkwMTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqB2bmN2aWV3ZXIgPGEgaHJlZj0iaHR0
cDovLzEyNy4wLjAuMTo1OTAyIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj4xMjcu
MC4wLjE6NTkwMjwvYT48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgR2l2ZW4gdGhhdCBmcm9tIHRoZSB4ZW5zdG9yZS1scyBsb2dz
IGV2ZXJ5dGhpbmcgc2VlbXMgdG8gd29yayBjb3JyZWN0bHk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBJIGFtIG5vdCBzdXJl
IHdoYXQgZWxzZSB0byBzdWdnZXN0LiBZb3UgbWlnaHQgaGF2ZSB0byBhZGQgcHJpbnRmIHRvIFFF
TVU8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqB1aS92bmMuYyBhbmQgaHcvZGlzcGxheS94ZW5mYi5jIHRvIHNlZSB3aGF0IGlz
IGdvaW5nIHdyb25nLjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqBDaGVlcnMsPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoFN0ZWZhbm88YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoE9uIE1vbiwgNyBO
b3YgMjAyMiwgVmlwdWwgU3VuZWphIHdyb3RlOjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgSGkgU3RlZmFubyw8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IFRoYW5rcyE8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBBbnkgaW5wdXQgZnVy
dGhlciBvbiAmcXVvdDt4ZW5zdG9yZS1scyZxdW90OyBsb2dzPzxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IEkgYW0gdHJ5aW5nIHRvIHJ1biB0aGUgeDB2bmNzZXJ2ZXIgJmFtcDsgeDExdm5jIHNl
cnZlciBtYW51YWxseSBvbiBndWVzdCBtYWNoaW5lKHhlbl9ndWVzdF9pbWFnZV9taW5pbWFsKTxi
cj4NCiZndDvCoCDCoCDCoCDCoGltYWdlPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgYnV0IGl0JiMzOTtzPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgZmFpbGluZzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoHdpdGggdGhlIGJlbG93PGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBlcnJv
ci48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyByb290QHJhc3BiZXJyeXBpNC02NDovdXNyL2Jp
biMgeDB2bmNzZXJ2ZXI8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHgwdm5jc2VydmVyOiB1bmFibGUgdG8gb3BlbiBk
aXNwbGF5ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgcm9vdEByYXNwYmVycnlwaTQtNjQ6L3Vz
ci9iaW4jPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0OyByb290QHJhc3BiZXJyeXBpNC02NDovdXNyL2JpbiMgeDExdm5j
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0OyAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAQEBAQEBAQEBAQEBAQEBAQEBAQEBA
QEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAIzxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgI0Ag
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgKiogwqBX
QVJOSU5HIMKgKiogwqBXQVJOSU5HIMKgKiogwqBXQVJOSU5HIMKgKiogwqBXQVJOSU5HIMKgKiog
wqAgQCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIEAjPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0OyAjQCDCoCDCoCDCoCDCoFlPVSBBUkUgUlVOTklORyBYMTFWTkMgV0lUSE9VVCBB
IFBBU1NXT1JEISEgwqAgwqAgwqAgwqBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgI0AgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgQCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgVGhpcyBtZWFucyBhbnlvbmUgd2l0
aCBuZXR3b3JrIGFjY2VzcyB0byB0aGlzIGNvbXB1dGVyIMKgIEAjPGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDC
oG1heSBiZSBhYmxlIHRvIHZpZXcgYW5kIGNvbnRyb2wgeW91ciBkZXNrdG9wLiDCoCDCoCDCoCDC
oCDCoCDCoEAjPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBA
Izxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgI0AgJmd0OyZndDsmZ3Q7IElmIHlvdSBkaWQgbm90IG1lYW4gdG8gZG8g
dGhpcyBQcmVzcyBDVFJMLUMgbm93ISEgJmx0OyZsdDsmbHQ7IEAjPGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgI0BAQEBAQEBAQEBA
QEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEAjPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0OyAjQCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAIzxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsg
I0AgwqBZb3UgY2FuIGNyZWF0ZSBhbiB4MTF2bmMgcGFzc3dvcmQgZmlsZSBieSBydW5uaW5nOiDC
oCDCoCDCoCBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgI0AgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
QCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgIMKgIMKgIHgxMXZuYyAtc3RvcmVwYXNzd2QgcGFzc3dvcmQg
L3BhdGgvdG8vcGFzc2ZpbGUgwqAgwqAgwqBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgI0AgwqBvciDCoCB4MTF2
bmMgLXN0b3JlcGFzc3dkIC9wYXRoL3RvL3Bhc3NmaWxlIMKgIMKgIMKgIMKgIMKgIMKgIMKgIEAj
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0OyAjQCDCoG9yIMKgIHgxMXZuYyAtc3RvcmVwYXNzd2QgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQCM8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIEAjPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDCoCh0aGUgbGFz
dCBvbmUgd2lsbCB1c2Ugfi8udm5jL3Bhc3N3ZCkgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDsgI0AgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQCM8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7ICNAIMKgYW5kIHRoZW4gc3RhcnRpbmcgeDExdm5jIHZpYTogwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgI0AgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgQCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgIMKgIMKgeDExdm5jIC1y
ZmJhdXRoIC9wYXRoL3RvL3Bhc3NmaWxlIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQCM8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7ICNAIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIEAjPGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0OyAjQCDCoGFuIGV4aXN0aW5nIH4vLnZuYy9wYXNzd2QgZmlsZSBmcm9tIGFub3RoZXIgVk5D
IMKgIMKgIMKgIMKgIMKgQCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgYXBwbGljYXRpb24gd2lsbCB3b3Jr
IGZpbmUgdG9vLiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEAjPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0OyAjQCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAIzxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsg
I0AgwqBZb3UgY2FuIGFsc28gdXNlIHRoZSAtcGFzc3dkZmlsZSBvciAtcGFzc3dkIG9wdGlvbnMu
IMKgIMKgIEAjPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDCoChub3RlIC1wYXNzd2QgaXMgdW5zYWZlIGlmIGxv
Y2FsIHVzZXJzIGFyZSBub3QgdHJ1c3RlZCkgwqBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgI0AgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgQCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgTWFrZSBzdXJlIGFueSAt
cmZiYXV0aCBhbmQgLXBhc3N3ZGZpbGUgcGFzc3dvcmQgZmlsZXMgwqAgwqBAIzxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDsgI0AgwqBjYW5ub3QgYmUgcmVhZCBieSB1bnRydXN0ZWQgdXNlcnMuIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIEAjPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgI0AgwqBVc2UgeDExdm5jIC11c2VwdyB0byBhdXRv
bWF0aWNhbGx5IHVzZSB5b3VyIMKgIMKgIMKgIMKgIMKgIMKgIMKgQCM8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNA
IMKgfi8udm5jL3Bhc3N3ZCBvciB+Ly52bmMvcGFzc3dkZmlsZSBwYXNzd29yZCBmaWxlcy4gwqAg
wqAgwqAgQCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgKGFuZCBwcm9tcHQgeW91IHRvIGNyZWF0ZSB+Ly52
bmMvcGFzc3dkIGlmIG5laXRoZXIgwqAgwqAgwqAgQCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgZmlsZSBl
eGlzdHMuKSDCoFVuZGVyIC11c2VwdywgeDExdm5jIHdpbGwgZXhpdCBpZiBpdCDCoCDCoCDCoEAj
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0OyAjQCDCoGNhbm5vdCBmaW5kIGEgcGFzc3dvcmQgdG8gdXNlLiDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgI0AgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIEAjPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDCoEV2ZW4gd2l0aCBhIHBhc3N3b3Jk
LCB0aGUgc3Vic2VxdWVudCBWTkMgdHJhZmZpYyBpcyDCoCDCoCDCoEAjPGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAj
QCDCoHNlbnQgaW4gdGhlIGNsZWFyLsKgIENvbnNpZGVyIHR1bm5lbGxpbmcgdmlhIHNzaCgxKTog
wqAgwqAgwqBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgI0AgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
QCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgIMKgPGEgaHJlZj0iaHR0cDovL3d3dy5rYXJscnVuZ2UuY29t
L3gxMXZuYy8jdHVubmVsbGluZyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0
cDovL3d3dy5rYXJscnVuZ2UuY29tL3gxMXZuYy8jdHVubmVsbGluZzwvYT4gwqAgwqAgwqAgwqAg
wqAgwqBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDsgI0AgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQCM8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7ICNAIMKgT3IgdXNpbmcgdGhlIHgxMXZuYyBTU0wgb3B0aW9uczogLXNzbCBh
bmQgLXN0dW5uZWwgwqAgwqAgwqAgQCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIEAjPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDCoFBsZWFzZSBSZWFkIHRoZSBkb2N1bWVu
dGF0aW9uIGZvciBtb3JlIGluZm8gYWJvdXQgwqAgwqAgwqAgwqBAIzxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgI0Ag
wqBwYXNzd29yZHMsIHNlY3VyaXR5LCBhbmQgZW5jcnlwdGlvbi4gwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgQCM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICNAIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIEAjPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDCoCDCoDxhIGhyZWY9Imh0dHA6Ly93d3cua2FybHJ1bmdl
LmNvbS94MTF2bmMvZmFxLmh0bWwjZmFxLXBhc3N3ZCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+aHR0cDovL3d3dy5rYXJscnVuZ2UuY29tL3gxMXZuYy9mYXEuaHRtbCNmYXEtcGFz
c3dkPC9hPiDCoCDCoEAjPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBAIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDsgI0AgwqBUbyBkaXNhYmxlIHRoaXMgd2FybmluZyB1c2UgdGhl
IC1ub3B3IG9wdGlvbiwgb3IgcHV0IMKgIMKgIEAjPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDCoCYjMzk7bm9w
dyYjMzk7IG9uIGEgbGluZSBpbiB5b3VyIH4vLngxMXZuY3JjIGZpbGUuIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIEAjPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAjQCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBA
Izxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgI0BAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBA
QEBAQEBAQEBAQEBAQEBAQEBAQEAjPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyM8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IDA5
LzAzLzIwMTggMTI6NTg6NDEgeDExdm5jIHZlcnNpb246IDAuOS4xNiBsYXN0bW9kOiAyMDE5LTAx
LTA1IMKgcGlkOiA0MjQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IDA5LzAzLzIwMTggMTI6NTg6NDEgWE9wZW5EaXNw
bGF5KCZxdW90OyZxdW90OykgZmFpbGVkLjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgMDkvMDMvMjAxOCAxMjo1ODo0
MSBUcnlpbmcgYWdhaW4gd2l0aCBYQVVUSExPQ0FMSE9TVE5BTUU9bG9jYWxob3N0IC4uLjxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDsgMDkvMDMvMjAxOCAxMjo1ODo0MTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgMDkvMDMvMjAxOCAxMjo1
ODo0MSAqKiogWE9wZW5EaXNwbGF5IGZhaWxlZC4gTm8gLWRpc3BsYXkgb3IgRElTUExBWS48YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IDA5LzAzLzIwMTggMTI6NTg6NDEgKioqIFRyeWluZyAmcXVvdDs6MCZxdW90OyBp
biA0IHNlY29uZHMuwqAgUHJlc3MgQ3RybC1DIHRvIGFib3J0Ljxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgMDkvMDMv
MjAxOCAxMjo1ODo0MSAqKiogMSAyIDMgNDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgMDkvMDMvMjAxOCAxMjo1ODo0
NSBYT3BlbkRpc3BsYXkoJnF1b3Q7OjAmcXVvdDspIGZhaWxlZC48YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IDA5LzAz
LzIwMTggMTI6NTg6NDUgVHJ5aW5nIGFnYWluIHdpdGggWEFVVEhMT0NBTEhPU1ROQU1FPWxvY2Fs
aG9zdCAuLi48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IDA5LzAzLzIwMTggMTI6NTg6NDUgWE9wZW5EaXNwbGF5KCZx
dW90OzowJnF1b3Q7KSBmYWlsZWQuPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAwOS8wMy8yMDE4IDEyOjU4OjQ1IFRy
eWluZyBhZ2FpbiB3aXRoIHVuc2V0IFhBVVRITE9DQUxIT1NUTkFNRSAuLi48YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IDA5LzAzLzIwMTggMTI6NTg6NDU8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAwOS8wMy8yMDE4
IDEyOjU4OjQ1ICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKjxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgMDkvMDMvMjAxOCAxMjo1ODo0NSAqKiogWE9wZW5EaXNwbGF5IGZhaWxlZCAoOjApPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgKioqIHgxMXZuYyB3YXMgdW5hYmxlIHRvIG9wZW4gdGhl
IFggRElTUExBWTogJnF1b3Q7OjAmcXVvdDssIGl0IGNhbm5vdCBjb250aW51ZS48YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7ICoqKiBUaGVyZSBtYXkgYmUgJnF1b3Q7WGxpYjomcXVvdDsgZXJyb3IgbWVzc2FnZXMgYWJv
dmUgd2l0aCBkZXRhaWxzIGFib3V0IHRoZSBmYWlsdXJlLjxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IFNvbWUgdGlwcyBhbmQgZ3VpZGVsaW5lczo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAq
KiBBbiBYIHNlcnZlciAodGhlIG9uZSB5b3Ugd2lzaCB0byB2aWV3KSBtdXN0IGJlIHJ1bm5pbmcg
YmVmb3JlIHgxMXZuYyBpczxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqBzdGFydGVkOiB4MTF2bmMgZG9lcyBu
b3Qgc3RhcnQgdGhlIFggc2VydmVyLiDCoChob3dldmVyLCBzZWUgdGhlIC1jcmVhdGU8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IMKgIMKgb3B0aW9uIGlmIHRoYXQgaXMgd2hhdCB5b3UgcmVhbGx5IHdhbnQpLjxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICoqIFlvdSBtdXN0IHVzZSAtZGlzcGxheSAmbHQ7ZGlzcCZn
dDssIC1PUi0gc2V0IGFuZCBleHBvcnQgeW91ciAkRElTUExBWTxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqBl
bnZpcm9ubWVudCB2YXJpYWJsZSB0byByZWZlciB0byB0aGUgZGlzcGxheSBvZiB0aGUgZGVzaXJl
ZCBYIHNlcnZlci48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgLSBVc3VhbGx5IHRoZSBkaXNwbGF5IGlzIHNpbXBs
eSAmcXVvdDs6MCZxdW90OyAoaW4gZmFjdCB4MTF2bmMgdXNlcyB0aGlzIGlmIHlvdSBmb3JnZXQ8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IMKgIMKgdG8gc3BlY2lmeSBpdCksIGJ1dCBpbiBzb21lIG11bHRpLXVzZXIg
c2l0dWF0aW9ucyBpdCBjb3VsZCBiZSAmcXVvdDs6MSZxdW90OywgJnF1b3Q7OjImcXVvdDssPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0OyDCoCDCoG9yIGV2ZW4gJnF1b3Q7OjEzNyZxdW90Oy7CoCBBc2sgeW91ciBhZG1p
bmlzdHJhdG9yIG9yIGEgZ3VydSBpZiB5b3UgYXJlIGhhdmluZzxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqBk
aWZmaWN1bHR5IGRldGVybWluaW5nIHdoYXQgeW91ciBYIERJU1BMQVkgaXMuPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgKiogTmV4dCwgeW91IG5lZWQgdG8gaGF2ZSBzdWZmaWNpZW50IHBlcm1p
c3Npb25zIChYYXV0aG9yaXR5KTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqB0byBjb25uZWN0IHRvIHRoZSBY
IERJU1BMQVkuIMKgIEhlcmUgYXJlIHNvbWUgVGlwczo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
OyDCoC0gT2Z0ZW4sIHlvdSBqdXN0IG5lZWQgdG8gcnVuIHgxMXZuYyBhcyB0aGUgdXNlciBsb2dn
ZWQgaW50byB0aGUgWCBzZXNzaW9uLjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqBTbyBtYWtlIHN1cmUgdG8g
YmUgdGhhdCB1c2VyIHdoZW4geW91IHR5cGUgeDExdm5jLjxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAtIEJlaW5n
IHJvb3QgaXMgdXN1YWxseSBub3QgZW5vdWdoIGJlY2F1c2UgdGhlIGluY29ycmVjdCBNSVQtTUFH
SUMtQ09PS0lFPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoGZpbGUgbWF5IGJlIGFjY2Vzc2VkLsKgIFRoZSBj
b29raWUgZmlsZSBjb250YWlucyB0aGUgc2VjcmV0IGtleSB0aGF0PGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDC
oGFsbG93cyB4MTF2bmMgdG8gY29ubmVjdCB0byB0aGUgZGVzaXJlZCBYIERJU1BMQVkuPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0OyDCoC0gWW91IGNhbiBleHBsaWNpdGx5IGluZGljYXRlIHdoaWNoIE1JVC1NQUdJQy1D
T09LSUUgZmlsZSBzaG91bGQgYmUgdXNlZDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqBieSB0aGUgLWF1dGgg
b3B0aW9uLCBlLmcuOjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqB4MTF2bmMgLWF1dGggL2hvbWUv
c29tZXVzZXIvLlhhdXRob3JpdHkgLWRpc3BsYXkgOjA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKg
eDExdm5jIC1hdXRoIC90bXAvLmdkbXpuZFZsUiAtZGlzcGxheSA6MDxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAg
wqB5b3UgbXVzdCBoYXZlIHJlYWQgcGVybWlzc2lvbiBmb3IgdGhlIGF1dGggZmlsZS48YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IMKgIMKgU2VlIGFsc28gJiMzOTstYXV0aCBndWVzcyYjMzk7IGFuZCAmIzM5Oy1maW5k
YXV0aCYjMzk7IGRpc2N1c3NlZCBiZWxvdy48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyAqKiBJ
ZiBOTyBPTkUgaXMgbG9nZ2VkIGludG8gYW4gWCBzZXNzaW9uIHlldCwgYnV0IHRoZXJlIGlzIGEg
Z3JlZXRlciBsb2dpbjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqBwcm9ncmFtIGxpa2UgJnF1b3Q7Z2RtJnF1
b3Q7LCAmcXVvdDtrZG0mcXVvdDssICZxdW90O3hkbSZxdW90Oywgb3IgJnF1b3Q7ZHRsb2dpbiZx
dW90OyBydW5uaW5nLCB5b3Ugd2lsbCBuZWVkPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoHRvIGZpbmQgYW5k
IHVzZSB0aGUgcmF3IGRpc3BsYXkgbWFuYWdlciBNSVQtTUFHSUMtQ09PS0lFIGZpbGUuPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0OyDCoCDCoFNvbWUgZXhhbXBsZXMgZm9yIHZhcmlvdXMgZGlzcGxheSBtYW5hZ2Vyczo8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoGdkbTogwqAgwqAgLWF1dGggL3Zhci9n
ZG0vOjAuWGF1dGg8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgIMKgIMKgIMKgIC1hdXRoIC92YXIv
bGliL2dkbS86MC5YYXV0aDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBrZG06IMKgIMKgIC1hdXRoIC92
YXIvbGliL2tkbS9BOjAtY3JXazcyPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoCDCoCDCoCDCoCAt
YXV0aCAvdmFyL3J1bi94YXV0aC9BOjAtY3JXazcyPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoHhkbTog
wqAgwqAgLWF1dGggL3Zhci9saWIveGRtL2F1dGhkaXIvYXV0aGZpbGVzL0E6MC1YUXZhSms8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IMKgIMKgIMKgZHRsb2dpbjogLWF1dGggL3Zhci9kdC9BOjAtVWdhYVhhPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqBTb21ldGltZXMgdGhlIGNvbW1hbmQgJnF1b3Q7cHMg
d3d3d2F1eCB8IGdyZXAgYXV0aCZxdW90OyBjYW4gcmV2ZWFsIHRoZSBmaWxlIGxvY2F0aW9uLjxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgU3RhcnRpbmcgd2l0aCB4MTF2bmMgMC45Ljkg
eW91IGNhbiBoYXZlIGl0IHRyeSB0byBndWVzcyBieSB1c2luZzo8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0OyDCoCDCoCDCoCDCoCDCoCDCoCDCoCAtYXV0aCBndWVzczxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IMKgIMKgKHNlZSBhbHNvIHRoZSB4MTF2bmMgLWZpbmRhdXRoIG9wdGlvbi4pPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqBPbmx5IHJvb3Qgd2lsbCBoYXZlIHJlYWQgcGVy
bWlzc2lvbiBmb3IgdGhlIGZpbGUsIGFuZCBzbyB4MTF2bmMgbXVzdCBiZSBydW48YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IMKgIMKgYXMgcm9vdCAob3IgY29weSBpdCkuwqAgVGhlIHJhbmRvbSBjaGFyYWN0ZXJzIGlu
IHRoZSBmaWxlbmFtZXMgd2lsbCBvZiBjb3Vyc2U8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgY2hhbmdlIGFu
ZCB0aGUgZGlyZWN0b3J5IHRoZSBjb29raWUgZmlsZSByZXNpZGVzIGluIGlzIHN5c3RlbSBkZXBl
bmRlbnQuPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgU2VlIGFsc286IDxhIGhyZWY9Imh0dHA6
Ly93d3cua2FybHJ1bmdlLmNvbS94MTF2bmMvZmFxLmh0bWwiIHJlbD0ibm9yZWZlcnJlciIgdGFy
Z2V0PSJfYmxhbmsiPmh0dHA6Ly93d3cua2FybHJ1bmdlLmNvbS94MTF2bmMvZmFxLmh0bWw8L2E+
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgUmVnYXJkcyw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFZpcHVsIEt1
bWFyPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgT24gVGh1LCBOb3YgMywgMjAyMiBhdCAxMDoy
NyBQTSBWaXB1bCBTdW5lamEgJmx0OzxhIGhyZWY9Im1haWx0bzp2c3VuZWphNjNAZ21haWwuY29t
IiB0YXJnZXQ9Il9ibGFuayI+dnN1bmVqYTYzQGdtYWlsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoEhpIFN0ZWZhbm8sPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBUaGFua3MhPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDsgSSB1c2VkIHhlbi1ndWVzdC1pbWFnZS1taW5pbWFsKHNpbXBs
ZSBjb25zb2xlIGJhc2VkIGltYWdlKSBhcyBhIGd1ZXN0IHdpdGggZmJjb24gJmFtcDsgZmJkZXYg
ZW5hYmxlZCBpbjxicj4NCiZndDvCoCDCoCDCoCDCoGtlcm5lbDxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoGNvbmZpZ3VyYXRpb25zIGJ1dDxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oHN0aWxsPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0OyB0aGUgc2FtZSBlcnJvciBjYW4mIzM5O3Qgb3BlbiB0aGUgZGlz
cGxheS48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IGJlbG93IGFyZSB0aGUgb3V0Y29tZSBvZiAmcXVvdDt4ZW5zdG9y
ZS1scyZxdW90Ozo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyByb290QHJhc3BiZXJyeXBpNC02
NDp+L2d1ZXN0MSMgeGVuc3RvcmUtbHM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHRvb2wgPSAmcXVvdDsmcXVvdDs8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IMKgeGVuc3RvcmVkID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBsb2Nh
bCA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqBkb21haW4gPSAmcXVvdDsmcXVvdDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IMKgIDAgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgY29udHJvbCA9
ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgZmVhdHVyZS1wb3dlcm9mZiA9ICZxdW90
OzEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIGZlYXR1cmUtcmVib290ID0gJnF1b3Q7MSZxdW90
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgwqAgwqBkb21pZCA9ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKg
IMKgbmFtZSA9ICZxdW90O0RvbWFpbi0wJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoGRldmljZS1t
b2RlbCA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgMCA9ICZxdW90OyZxdW90Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDsgwqAgwqAgwqBiYWNrZW5kcyA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsg
wqAgwqAgwqAgY29uc29sZSA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgdmti
ZCA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgdmZiID0gJnF1b3Q7JnF1b3Q7
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0OyDCoCDCoCDCoCBxbmljID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDC
oCDCoCDCoHN0YXRlID0gJnF1b3Q7cnVubmluZyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgMSA9
ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBiYWNrZW5kcyA9ICZxdW90OyZxdW90
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgY29uc29sZSA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDsgwqAgwqAgwqAgdmtiZCA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgdmZi
ID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCBxbmljID0gJnF1b3Q7JnF1b3Q7
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0OyDCoCDCoCDCoHN0YXRlID0gJnF1b3Q7cnVubmluZyZxdW90Ozxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgwqAgwqBiYWNrZW5kID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCB2YmQg
PSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgMSA9ICZxdW90OyZxdW90Ozxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDsgwqAgwqAgwqAgNTE3MTIgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKg
IMKgIMKgZnJvbnRlbmQgPSAmcXVvdDsvbG9jYWwvZG9tYWluLzEvZGV2aWNlL3ZiZC81MTcxMiZx
dW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBwYXJhbXMgPSAmcXVvdDsvaG9tZS9yb290L2d1
ZXN0Mi94ZW4tZ3Vlc3QtaW1hZ2UtbWluaW1hbC1yYXNwYmVycnlwaTQtNjQuZXh0MyZxdW90Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDsgwqAgwqAgwqAgwqBzY3JpcHQgPSAmcXVvdDsvZXRjL3hlbi9zY3JpcHRzL2Js
b2NrJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoGZyb250ZW5kLWlkID0gJnF1b3Q7MSZx
dW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBvbmxpbmUgPSAmcXVvdDsxJnF1b3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0OyDCoCDCoCDCoCDCoHJlbW92YWJsZSA9ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IMKgIMKgIMKgIMKgYm9vdGFibGUgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDC
oCDCoHN0YXRlID0gJnF1b3Q7NCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBkZXYgPSAm
cXVvdDt4dmRhJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoHR5cGUgPSAmcXVvdDtwaHkm
cXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgbW9kZSA9ICZxdW90O3cmcXVvdDs8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IMKgIMKgIMKgIMKgZGV2aWNlLXR5cGUgPSAmcXVvdDtkaXNrJnF1b3Q7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0OyDCoCDCoCDCoCDCoGRpc2NhcmQtZW5hYmxlID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDsgwqAgwqAgwqAgwqBmZWF0dXJlLW1heC1pbmRpcmVjdC1zZWdtZW50cyA9ICZxdW90OzI1NiZx
dW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBtdWx0aS1xdWV1ZS1tYXgtcXVldWVzID0gJnF1
b3Q7NCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBtYXgtcmluZy1wYWdlLW9yZGVyID0g
JnF1b3Q7NCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBub2RlID0gJnF1b3Q7L2Rldi9s
b29wMCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBwaHlzaWNhbC1kZXZpY2UgPSAmcXVv
dDs3OjAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgcGh5c2ljYWwtZGV2aWNlLXBhdGgg
PSAmcXVvdDsvZGV2L2xvb3AwJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoGhvdHBsdWct
c3RhdHVzID0gJnF1b3Q7Y29ubmVjdGVkJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoGZl
YXR1cmUtZmx1c2gtY2FjaGUgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDC
oGRpc2NhcmQtZ3JhbnVsYXJpdHkgPSAmcXVvdDs0MDk2JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDC
oCDCoCDCoGRpc2NhcmQtYWxpZ25tZW50ID0gJnF1b3Q7MCZxdW90Ozxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAg
wqAgwqAgwqBkaXNjYXJkLXNlY3VyZSA9ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKg
IMKgIMKgZmVhdHVyZS1kaXNjYXJkID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAg
wqAgwqBmZWF0dXJlLWJhcnJpZXIgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDC
oCDCoGZlYXR1cmUtcGVyc2lzdGVudCA9ICZxdW90OzEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKg
IMKgIMKgc2VjdG9ycyA9ICZxdW90OzE3OTQwNDgmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKg
IMKgaW5mbyA9ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgc2VjdG9yLXNp
emUgPSAmcXVvdDs1MTImcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgcGh5c2ljYWwtc2Vj
dG9yLXNpemUgPSAmcXVvdDs1MTImcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIHZmYiA9ICZxdW90
OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAxID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
OyDCoCDCoCDCoCAwID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoGZyb250
ZW5kID0gJnF1b3Q7L2xvY2FsL2RvbWFpbi8xL2RldmljZS92ZmIvMCZxdW90Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDsgwqAgwqAgwqAgwqBmcm9udGVuZC1pZCA9ICZxdW90OzEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKg
IMKgIMKgIMKgb25saW5lID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBz
dGF0ZSA9ICZxdW90OzQmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgdm5jID0gJnF1b3Q7
MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqB2bmNsaXN0ZW4gPSAmcXVvdDsxMjcuMC4w
LjEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgdm5jZGlzcGxheSA9ICZxdW90OzAmcXVv
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgdm5jdW51c2VkID0gJnF1b3Q7MSZxdW90Ozxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDsgwqAgwqAgwqAgwqBzZGwgPSAmcXVvdDswJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDC
oCDCoCDCoG9wZW5nbCA9ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgZmVh
dHVyZS1yZXNpemUgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoGhvdHBs
dWctc3RhdHVzID0gJnF1b3Q7Y29ubmVjdGVkJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDC
oHJlcXVlc3QtdXBkYXRlID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgdmtiZCA9
ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAxID0gJnF1b3Q7JnF1b3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0OyDCoCDCoCDCoCAwID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDC
oGZyb250ZW5kID0gJnF1b3Q7L2xvY2FsL2RvbWFpbi8xL2RldmljZS92a2JkLzAmcXVvdDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IMKgIMKgIMKgIMKgZnJvbnRlbmQtaWQgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0OyDCoCDCoCDCoCDCoG9ubGluZSA9ICZxdW90OzEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKg
IMKgIMKgc3RhdGUgPSAmcXVvdDs0JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoGZlYXR1
cmUtYWJzLXBvaW50ZXIgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoGZl
YXR1cmUtcmF3LXBvaW50ZXIgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDC
oGhvdHBsdWctc3RhdHVzID0gJnF1b3Q7Y29ubmVjdGVkJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDC
oCBjb25zb2xlID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoDEgPSAmcXVvdDsm
cXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIDAgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IMKgIMKgIMKgIMKgZnJvbnRlbmQgPSAmcXVvdDsvbG9jYWwvZG9tYWluLzEvY29uc29sZSZxdW90
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBmcm9udGVuZC1pZCA9ICZxdW90OzEmcXVvdDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IMKgIMKgIMKgIMKgb25saW5lID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsg
wqAgwqAgwqAgwqBzdGF0ZSA9ICZxdW90OzEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKg
cHJvdG9jb2wgPSAmcXVvdDt2dDEwMCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgdmlmID0gJnF1
b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoDEgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IMKgIMKgIMKgIDAgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgZnJv
bnRlbmQgPSAmcXVvdDsvbG9jYWwvZG9tYWluLzEvZGV2aWNlL3ZpZi8wJnF1b3Q7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0OyDCoCDCoCDCoCDCoGZyb250ZW5kLWlkID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsg
wqAgwqAgwqAgwqBvbmxpbmUgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDC
oHN0YXRlID0gJnF1b3Q7NCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBzY3JpcHQgPSAm
cXVvdDsvZXRjL3hlbi9zY3JpcHRzL3ZpZi1icmlkZ2UmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKg
IMKgIMKgbWFjID0gJnF1b3Q7ZTQ6NWY6MDE6Y2Q6N2I6ZGQmcXVvdDs8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKg
IMKgIMKgIMKgYnJpZGdlID0gJnF1b3Q7eGVuYnIwJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDC
oCDCoGhhbmRsZSA9ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgdHlwZSA9
ICZxdW90O3ZpZiZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBob3RwbHVnLXN0YXR1cyA9
ICZxdW90O2Nvbm5lY3RlZCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBmZWF0dXJlLXNn
ID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBmZWF0dXJlLWdzby10Y3B2
NCA9ICZxdW90OzEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgZmVhdHVyZS1nc28tdGNw
djYgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoGZlYXR1cmUtaXB2Ni1j
c3VtLW9mZmxvYWQgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoGZlYXR1
cmUtcngtY29weSA9ICZxdW90OzEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgZmVhdHVy
ZS14ZHAtaGVhZHJvb20gPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoGZl
YXR1cmUtcngtZmxpcCA9ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgZmVh
dHVyZS1tdWx0aWNhc3QtY29udHJvbCA9ICZxdW90OzEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKg
IMKgIMKgZmVhdHVyZS1keW5hbWljLW11bHRpY2FzdC1jb250cm9sID0gJnF1b3Q7MSZxdW90Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDsgwqAgwqAgwqAgwqBmZWF0dXJlLXNwbGl0LWV2ZW50LWNoYW5uZWxzID0gJnF1
b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBtdWx0aS1xdWV1ZS1tYXgtcXVldWVz
ID0gJnF1b3Q7NCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqBmZWF0dXJlLWN0cmwtcmlu
ZyA9ICZxdW90OzEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIDEgPSAmcXVvdDsmcXVvdDs8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IMKgIMKgdm0gPSAmcXVvdDsvdm0vZDgxZWM1YTktNWJmOS00ZjJiLTg5ZTgtMGY2MGQ2
ZGE5NDhmJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoG5hbWUgPSAmcXVvdDtndWVzdDImcXVvdDs8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IMKgIMKgY3B1ID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCAw
ID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoGF2YWlsYWJpbGl0eSA9ICZxdW90
O29ubGluZSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgMSA9ICZxdW90OyZxdW90Ozxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgwqAgwqAgwqBhdmFpbGFiaWxpdHkgPSAmcXVvdDtvbmxpbmUmcXVvdDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IMKgIMKgbWVtb3J5ID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCBzdGF0aWMt
bWF4ID0gJnF1b3Q7MjA5NzE1MiZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgdGFyZ2V0ID0gJnF1
b3Q7MjA5NzE1MiZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgdmlkZW9yYW0gPSAmcXVvdDswJnF1
b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0OyDCoCDCoGRldmljZSA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsg
wqAgwqAgc3VzcGVuZCA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBldmVudC1j
aGFubmVsID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCB2YmQgPSAmcXVvdDsmcXVv
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgNTE3MTIgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IMKgIMKgIMKgIGJhY2tlbmQgPSAmcXVvdDsvbG9jYWwvZG9tYWluLzAvYmFja2VuZC92YmQvMS81
MTcxMiZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgYmFja2VuZC1pZCA9ICZxdW90OzAmcXVv
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIHN0YXRlID0gJnF1b3Q7NCZxdW90Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDsgwqAgwqAgwqAgdmlydHVhbC1kZXZpY2UgPSAmcXVvdDs1MTcxMiZxdW90Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDsgwqAgwqAgwqAgZGV2aWNlLXR5cGUgPSAmcXVvdDtkaXNrJnF1b3Q7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDC
oCDCoCDCoCBtdWx0aS1xdWV1ZS1udW0tcXVldWVzID0gJnF1b3Q7MiZxdW90Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDsgwqAgwqAgwqAgcXVldWUtMCA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAg
wqByaW5nLXJlZiA9ICZxdW90OzgmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgZXZlbnQt
Y2hhbm5lbCA9ICZxdW90OzQmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIHF1ZXVlLTEgPSAm
cXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgcmluZy1yZWYgPSAmcXVvdDs5JnF1
b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoGV2ZW50LWNoYW5uZWwgPSAmcXVvdDs1JnF1b3Q7
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0OyDCoCDCoCDCoCBwcm90b2NvbCA9ICZxdW90O2FybS1hYmkmcXVvdDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IMKgIMKgIMKgIGZlYXR1cmUtcGVyc2lzdGVudCA9ICZxdW90OzEmcXVvdDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IMKgIMKgIHZmYiA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAw
ID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCBiYWNrZW5kID0gJnF1b3Q7L2xv
Y2FsL2RvbWFpbi8wL2JhY2tlbmQvdmZiLzEvMCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAg
YmFja2VuZC1pZCA9ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIHN0YXRlID0g
JnF1b3Q7NCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgcGFnZS1yZWYgPSAmcXVvdDsyNzUw
MjImcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIGV2ZW50LWNoYW5uZWwgPSAmcXVvdDszJnF1
b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCBwcm90b2NvbCA9ICZxdW90O2FybS1hYmkmcXVvdDs8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIGZlYXR1cmUtdXBkYXRlID0gJnF1b3Q7MSZxdW90Ozxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDsgwqAgwqAgdmtiZCA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAw
ID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCBiYWNrZW5kID0gJnF1b3Q7L2xv
Y2FsL2RvbWFpbi8wL2JhY2tlbmQvdmtiZC8xLzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKg
IGJhY2tlbmQtaWQgPSAmcXVvdDswJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCBzdGF0ZSA9
ICZxdW90OzQmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIHJlcXVlc3QtYWJzLXBvaW50ZXIg
PSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCBwYWdlLXJlZiA9ICZxdW90OzI3
NTMyMiZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgcGFnZS1ncmVmID0gJnF1b3Q7MTI4NCZx
dW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgZXZlbnQtY2hhbm5lbCA9ICZxdW90OzEwJnF1b3Q7
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0OyDCoCDCoCB2aWYgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKg
IMKgMCA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgYmFja2VuZCA9ICZxdW90
Oy9sb2NhbC9kb21haW4vMC9iYWNrZW5kL3ZpZi8xLzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKg
IMKgIGJhY2tlbmQtaWQgPSAmcXVvdDswJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCBzdGF0
ZSA9ICZxdW90OzQmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIGhhbmRsZSA9ICZxdW90OzAm
cXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIG1hYyA9ICZxdW90O2U0OjVmOjAxOmNkOjdiOmRk
JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCBtdHUgPSAmcXVvdDsxNTAwJnF1b3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0OyDCoCDCoCDCoCB4ZHAtaGVhZHJvb20gPSAmcXVvdDswJnF1b3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
OyDCoCDCoCDCoCBtdWx0aS1xdWV1ZS1udW0tcXVldWVzID0gJnF1b3Q7MiZxdW90Ozxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgwqAgwqAgwqAgcXVldWUtMCA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAg
wqAgwqB0eC1yaW5nLXJlZiA9ICZxdW90OzEyODAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKg
IMKgcngtcmluZy1yZWYgPSAmcXVvdDsxMjgxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDC
oGV2ZW50LWNoYW5uZWwtdHggPSAmcXVvdDs2JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDC
oGV2ZW50LWNoYW5uZWwtcnggPSAmcXVvdDs3JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCBx
dWV1ZS0xID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoHR4LXJpbmctcmVm
ID0gJnF1b3Q7MTI4MiZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqByeC1yaW5nLXJlZiA9
ICZxdW90OzEyODMmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgZXZlbnQtY2hhbm5lbC10
eCA9ICZxdW90OzgmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgZXZlbnQtY2hhbm5lbC1y
eCA9ICZxdW90OzkmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIHJlcXVlc3QtcngtY29weSA9
ICZxdW90OzEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIGZlYXR1cmUtcngtbm90aWZ5ID0g
JnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgZmVhdHVyZS1zZyA9ICZxdW90OzEm
cXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIGZlYXR1cmUtZ3NvLXRjcHY0ID0gJnF1b3Q7MSZx
dW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgZmVhdHVyZS1nc28tdGNwdjYgPSAmcXVvdDsxJnF1
b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCBmZWF0dXJlLWlwdjYtY3N1bS1vZmZsb2FkID0gJnF1
b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqBjb250cm9sID0gJnF1b3Q7JnF1b3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0OyDCoCDCoCBzaHV0ZG93biA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAg
ZmVhdHVyZS1wb3dlcm9mZiA9ICZxdW90OzEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIGZlYXR1
cmUtcmVib290ID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgZmVhdHVyZS1zdXNw
ZW5kID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCBzeXNycSA9ICZxdW90OyZxdW90
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgwqAgwqAgcGxhdGZvcm0tZmVhdHVyZS1tdWx0aXByb2Nlc3Nvci1zdXNw
ZW5kID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgcGxhdGZvcm0tZmVhdHVyZS14
c19yZXNldF93YXRjaGVzID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqBkYXRhID0g
JnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoGRyaXZlcnMgPSAmcXVvdDsmcXVvdDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IMKgIMKgZmVhdHVyZSA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqBh
dHRyID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoGVycm9yID0gJnF1b3Q7JnF1b3Q7
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0OyDCoCDCoGRvbWlkID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAg
wqBzdG9yZSA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgcG9ydCA9ICZxdW90OzEm
cXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIHJpbmctcmVmID0gJnF1b3Q7MjMzNDczJnF1b3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0OyDCoCDCoGNvbnNvbGUgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKg
IGJhY2tlbmQgPSAmcXVvdDsvbG9jYWwvZG9tYWluLzAvYmFja2VuZC9jb25zb2xlLzEvMCZxdW90
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgwqAgwqAgYmFja2VuZC1pZCA9ICZxdW90OzAmcXVvdDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IMKgIMKgIGxpbWl0ID0gJnF1b3Q7MTA0ODU3NiZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAg
dHlwZSA9ICZxdW90O3hlbmNvbnNvbGVkJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCBvdXRwdXQg
PSAmcXVvdDtwdHkmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIHR0eSA9ICZxdW90Oy9kZXYvcHRz
LzEmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIHBvcnQgPSAmcXVvdDsyJnF1b3Q7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0OyDCoCDCoCByaW5nLXJlZiA9ICZxdW90OzIzMzQ3MiZxdW90Ozxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAg
wqAgdm5jLWxpc3RlbiA9ICZxdW90OzEyNy4wLjAuMSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAg
dm5jLXBvcnQgPSAmcXVvdDs1OTAwJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoGltYWdlID0gJnF1
b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCBkZXZpY2UtbW9kZWwtcGlkID0gJnF1b3Q7Nzg4
JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0OyB2bSA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqBkODFl
YzVhOS01YmY5LTRmMmItODllOC0wZjYwZDZkYTk0OGYgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IMKgIG5hbWUgPSAmcXVvdDtndWVzdDImcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIHV1aWQgPSAm
cXVvdDtkODFlYzVhOS01YmY5LTRmMmItODllOC0wZjYwZDZkYTk0OGYmcXVvdDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IMKgIHN0YXJ0X3RpbWUgPSAmcXVvdDsxNTIwNjAwMjc0LjI3JnF1b3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
OyBsaWJ4bCA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAxID0gJnF1b3Q7JnF1b3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0OyDCoCBkZXZpY2UgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgdmJk
ID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCA1MTcxMiA9ICZxdW90OyZxdW90Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDsgwqAgwqAgwqBmcm9udGVuZCA9ICZxdW90Oy9sb2NhbC9kb21haW4vMS9kZXZp
Y2UvdmJkLzUxNzEyJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoGJhY2tlbmQgPSAmcXVvdDsv
bG9jYWwvZG9tYWluLzAvYmFja2VuZC92YmQvMS81MTcxMiZxdW90Ozxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAg
wqAgwqBwYXJhbXMgPSAmcXVvdDsvaG9tZS9yb290L2d1ZXN0Mi94ZW4tZ3Vlc3QtaW1hZ2UtbWlu
aW1hbC1yYXNwYmVycnlwaTQtNjQuZXh0MyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBzY3Jp
cHQgPSAmcXVvdDsvZXRjL3hlbi9zY3JpcHRzL2Jsb2NrJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDC
oCDCoGZyb250ZW5kLWlkID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBvbmxp
bmUgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoHJlbW92YWJsZSA9ICZxdW90
OzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgYm9vdGFibGUgPSAmcXVvdDsxJnF1b3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0OyDCoCDCoCDCoHN0YXRlID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAg
wqAgwqBkZXYgPSAmcXVvdDt4dmRhJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoHR5cGUgPSAm
cXVvdDtwaHkmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgbW9kZSA9ICZxdW90O3cmcXVvdDs8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IMKgIMKgIMKgZGV2aWNlLXR5cGUgPSAmcXVvdDtkaXNrJnF1b3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0OyDCoCDCoCDCoGRpc2NhcmQtZW5hYmxlID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDsgwqAgwqB2ZmIgPSAmcXVvdDsmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIDAgPSAmcXVvdDsm
cXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgZnJvbnRlbmQgPSAmcXVvdDsvbG9jYWwvZG9tYWlu
LzEvZGV2aWNlL3ZmYi8wJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoGJhY2tlbmQgPSAmcXVv
dDsvbG9jYWwvZG9tYWluLzAvYmFja2VuZC92ZmIvMS8wJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDC
oCDCoGZyb250ZW5kLWlkID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBvbmxp
bmUgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoHN0YXRlID0gJnF1b3Q7MSZx
dW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqB2bmMgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
OyDCoCDCoCDCoHZuY2xpc3RlbiA9ICZxdW90OzEyNy4wLjAuMSZxdW90Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsg
wqAgwqAgwqB2bmNkaXNwbGF5ID0gJnF1b3Q7MCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqB2
bmN1bnVzZWQgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoHNkbCA9ICZxdW90
OzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgb3BlbmdsID0gJnF1b3Q7MCZxdW90Ozxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDsgwqAgwqB2a2JkID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCAwID0g
JnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoGZyb250ZW5kID0gJnF1b3Q7L2xvY2Fs
L2RvbWFpbi8xL2RldmljZS92a2JkLzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgYmFja2Vu
ZCA9ICZxdW90Oy9sb2NhbC9kb21haW4vMC9iYWNrZW5kL3ZrYmQvMS8wJnF1b3Q7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0OyDCoCDCoCDCoGZyb250ZW5kLWlkID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAg
wqAgwqBvbmxpbmUgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoHN0YXRlID0g
JnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqBjb25zb2xlID0gJnF1b3Q7JnF1b3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0OyDCoCDCoCAwID0gJnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoGZy
b250ZW5kID0gJnF1b3Q7L2xvY2FsL2RvbWFpbi8xL2NvbnNvbGUmcXVvdDs8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IMKgIMKgIMKgYmFja2VuZCA9ICZxdW90Oy9sb2NhbC9kb21haW4vMC9iYWNrZW5kL2NvbnNvbGUv
MS8wJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoGZyb250ZW5kLWlkID0gJnF1b3Q7MSZxdW90
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgwqAgwqAgwqBvbmxpbmUgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
OyDCoCDCoCDCoHN0YXRlID0gJnF1b3Q7MSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqBwcm90
b2NvbCA9ICZxdW90O3Z0MTAwJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoHZpZiA9ICZxdW90OyZx
dW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgMCA9ICZxdW90OyZxdW90Ozxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAg
wqAgwqBmcm9udGVuZCA9ICZxdW90Oy9sb2NhbC9kb21haW4vMS9kZXZpY2UvdmlmLzAmcXVvdDs8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IMKgIMKgIMKgYmFja2VuZCA9ICZxdW90Oy9sb2NhbC9kb21haW4vMC9iYWNr
ZW5kL3ZpZi8xLzAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgZnJvbnRlbmQtaWQgPSAmcXVv
dDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoG9ubGluZSA9ICZxdW90OzEmcXVvdDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IMKgIMKgIMKgc3RhdGUgPSAmcXVvdDsxJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDC
oCDCoHNjcmlwdCA9ICZxdW90Oy9ldGMveGVuL3NjcmlwdHMvdmlmLWJyaWRnZSZxdW90Ozxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDsgwqAgwqAgwqBtYWMgPSAmcXVvdDtlNDo1ZjowMTpjZDo3YjpkZCZxdW90Ozxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDsgwqAgwqAgwqBicmlkZ2UgPSAmcXVvdDt4ZW5icjAmcXVvdDs8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IMKgIMKgIMKgaGFuZGxlID0gJnF1b3Q7MCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqB0eXBl
ID0gJnF1b3Q7dmlmJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoGhvdHBsdWctc3RhdHVzID0g
JnF1b3Q7JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoCB0eXBlID0gJnF1b3Q7cHZoJnF1b3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0OyDCoCBkbS12ZXJzaW9uID0gJnF1b3Q7cWVtdV94ZW4mcXVvdDs8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IHJvb3RAcmFzcGJlcnJ5cGk0LTY0On4vZ3Vlc3QxIzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IEFueSBpbnB1dCBhcyBwZXIgYWJvdmU/IExvb2tpbmcgZm9yd2FyZCB0byBoZWFyaW5nIGZyb20g
eW91Ljxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFJlZ2FyZHMsPGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBWaXB1
bCBLdW1hcjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IE9uIFdlZCwgT2N0IDI2LCAyMDIyIGF0
IDU6MjEgQU0gU3RlZmFubyBTdGFiZWxsaW5pICZsdDs8YSBocmVmPSJtYWlsdG86c3N0YWJlbGxp
bmlAa2VybmVsLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnNzdGFiZWxsaW5pQGtlcm5lbC5vcmc8L2E+
Jmd0OyB3cm90ZTo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBIaSBWaXB1bCw8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgSWYgeW91IGxvb2sgYXQgdGhlIFFFTVUgbG9ncywgaXQg
c2F5czo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgVk5DIHNlcnZlciBydW5u
aW5nIG9uIDxhIGhyZWY9Imh0dHA6Ly8xMjcuMC4wLjE6NTkwMCIgcmVsPSJub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+MTI3LjAuMC4xOjU5MDA8L2E+PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoFRoYXQgaXMgdGhlIFZOQyBzZXJ2ZXIgeW91IG5lZWQgdG8gY29ubmVjdCB0
by4gU28gaW4gdGhlb3J5Ojxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqDCoCB2
bmN2aWV3ZXIgPGEgaHJlZj0iaHR0cDovLzEyNy4wLjAuMTo1OTAwIiByZWw9Im5vcmVmZXJyZXIi
IHRhcmdldD0iX2JsYW5rIj4xMjcuMC4wLjE6NTkwMDwvYT48YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgc2hvdWxkIHdvcmsgY29ycmVjdGx5Ljxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgSWYgeW91IGhhdmU6PGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoMKgIHZmYiA9IFsmcXVvdDt0eXBlPXZuYyZxdW90O108YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgaW4geW91ciB4bCBjb25maWcgZmlsZSBh
bmQgeW91IGhhdmUgJnF1b3Q7ZmJkZXYmcXVvdDsgaW4geW91ciBMaW51eCBndWVzdCwgaXQ8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqBzaG91bGQgd29yay48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgSWYgeW91IGNvbm5lY3QgdG8gdGhlIFZOQyBzZXJ2ZXIgYnV0IHlvdSBnZXQg
YSBibGFjayBzY3JlZW4sIGl0IG1pZ2h0IGJlPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgYSBndWVz
dCBjb25maWd1cmF0aW9uIGlzc3VlLiBJIHdvdWxkIHRyeSB3aXRoIGEgc2ltcGxlciBndWVzdCwg
dGV4dCBvbmx5PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgKG5vIFgxMSwgbm8gV2F5bGFuZCkgYW5k
IGVuYWJsZSB0aGUgZmJkZXYgY29uc29sZSAoZmJjb24pLiBTZWU8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqBEb2N1bWVudGF0aW9uL2ZiL2ZiY29uLnJzdCBpbiBMaW51eC4gWW91IHNob3VsZCBiZSBh
YmxlIHRvIHNlZSBhPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgZ3JhcGhpY2FsIGNvbnNvbGUgb3Zl
ciBWTkMuPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoElmIHRoYXQgd29ya3Ms
IHRoZW4geW91IGtub3cgdGhhdCB0aGUgZmJkZXYga2VybmVsIGRyaXZlciAoeGVuLWZiZnJvbnQp
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgd29ya3MgY29ycmVjdGx5Ljxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqBJZiBpdCBkb2VzbiYjMzk7dCB3b3JrLCB0aGUgb3V0cHV0IG9m
ICZxdW90O3hlbnN0b3JlLWxzJnF1b3Q7IHdvdWxkIGJlIGludGVyZXN0aW5nLjxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBDaGVlcnMsPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoFN0ZWZhbm88YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoE9uIFdlZCwgMTkgT2N0IDIwMjIsIFZpcHVsIFN1bmVqYSB3cm90ZTo8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEhpIFN0ZWZhbm8sPGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgVGhhbmtzIGZvciB0aGUgcmVzcG9u
c2UhPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDsgSSBhbSBmb2xsb3dpbmcgdGhlIHNhbWUgbGluayB5b3Ugc2hhcmVkIGZyb20gdGhlIGJlZ2lu
bmluZy4gVHJpZWQgdGhlIGNvbW1hbmQgJnF1b3Q7dm5jdmlld2VyPGJyPg0KJmd0O8KgIMKgIMKg
IMKgbG9jYWxob3N0OjAmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBp
biBET00wPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
YnV0PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgc2FtZTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoGlzc3VlICZxdW90O0NhbiYj
Mzk7dCBvcGVuPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBkaXNwbGF5JnF1b3Q7LCBiZWxv
dyBhcmUgdGhlIGxvZ3M6PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgcm9vdEByYXNwYmVycnlwaTQtNjQ6fiMgdm5jdmlld2VyIGxvY2FsaG9z
dDowPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDsgVGlnZXJWTkMgVmlld2VyIDY0LWJpdCB2MS4xMS4wPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0OyBCdWlsdCBvbjogMjAyMC0wOS0wOCAxMjoxNjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDsgQ29weXJpZ2h0IChDKSAxOTk5LTIwMjAgVGlnZXJWTkMgVGVhbSBhbmQgbWFueSBvdGhlcnMg
KHNlZSBSRUFETUUucnN0KTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgU2VlIDxhIGhyZWY9
Imh0dHBzOi8vd3d3LnRpZ2Vydm5jLm9yZyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+aHR0cHM6Ly93d3cudGlnZXJ2bmMub3JnPC9hPiBmb3IgaW5mb3JtYXRpb24gb24gVGlnZXJW
TkMuPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBDYW4mIzM5O3Qgb3BlbiBkaXNwbGF5Ojxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEJl
bG93IGFyZSB0aGUgbmV0c3RhdCBsb2dzLCBpIGNvdWxkbiYjMzk7dCBzZWUgYW55dGhpbmcgcnVu
bmluZyBhdCBwb3J0IDU5MDAgb3IgNTkwMTo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyByb290QHJhc3BiZXJyeXBpNC02NDp+IyBuZXRzdGF0
IC10dXd4PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBBY3RpdmUgSW50ZXJuZXQgY29ubmVj
dGlvbnMgKHcvbyBzZXJ2ZXJzKTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgUHJvdG8gUmVj
di1RIFNlbmQtUSBMb2NhbCBBZGRyZXNzIMKgIMKgIMKgIMKgIMKgIEZvcmVpZ24gQWRkcmVzcyDC
oCDCoCDCoCDCoCBTdGF0ZSDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgdGNw
IMKgIMKgIMKgIMKgMCDCoCDCoDE2NCAxOTIuMTY4LjEuMzk6c3NoIMKgIMKgIMKgIMKgPGEgaHJl
Zj0iaHR0cDovLzE5Mi4xNjguMS4zODozNzQ3MiIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9i
bGFuayI+MTkyLjE2OC4xLjM4OjM3NDcyPC9hPiDCoCDCoCDCoEVTVEFCTElTSEVEPGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0OyBBY3RpdmUgVU5JWCBkb21haW4gc29ja2V0cyAody9vIHNlcnZl
cnMpPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBQcm90byBSZWZDbnQgRmxhZ3MgwqAgwqAg
wqAgVHlwZSDCoCDCoCDCoCBTdGF0ZSDCoCDCoCDCoCDCoCBJLU5vZGUgUGF0aDxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDsgdW5peCDCoDggwqAgwqAgwqBbIF0gwqAgwqAgwqAgwqAgREdSQU0g
wqAgwqAgwqBDT05ORUNURUQgwqAgwqAgwqAxMDU2NSAvZGV2L2xvZzxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDsgdW5peCDCoDMgwqAgwqAgwqBbIF0gwqAgwqAgwqAgwqAgU1RSRUFNIMKgIMKg
IENPTk5FQ1RFRCDCoCDCoCDCoDEwODkxIC92YXIvcnVuL3hlbnN0b3JlZC9zb2NrZXQ8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHVuaXggwqAzIMKgIMKgIMKgWyBdIMKgIMKgIMKgIMKgIFNU
UkVBTSDCoCDCoCBDT05ORUNURUQgwqAgwqAgwqAxMzc5MTxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgdW5peCDCoDMgwqAgwqAgwqBbIF0gwqAgwqAgwqAgwqAgU1RSRUFNIMKgIMKgIENPTk5F
Q1RFRCDCoCDCoCDCoDEwODQzIC92YXIvcnVuL3hlbnN0b3JlZC9zb2NrZXQ8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IHVuaXggwqAzIMKgIMKgIMKgWyBdIMKgIMKgIMKgIMKgIFNUUkVBTSDC
oCDCoCBDT05ORUNURUQgwqAgwqAgwqAxMDU3MyAvdmFyL3J1bi94ZW5zdG9yZWQvc29ja2V0PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyB1bml4IMKgMiDCoCDCoCDCoFsgXSDCoCDCoCDCoCDC
oCBER1JBTSDCoCDCoCDCoENPTk5FQ1RFRCDCoCDCoCDCoDE0NTEwPGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0OyB1bml4IMKgMyDCoCDCoCDCoFsgXSDCoCDCoCDCoCDCoCBTVFJFQU0gwqAgwqAg
Q09OTkVDVEVEIMKgIMKgIMKgMTMyNDk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHVuaXgg
wqAyIMKgIMKgIMKgWyBdIMKgIMKgIMKgIMKgIERHUkFNIMKgIMKgIMKgQ09OTkVDVEVEIMKgIMKg
IMKgMTM4ODc8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHVuaXggwqAyIMKgIMKgIMKgWyBd
IMKgIMKgIMKgIMKgIERHUkFNIMKgIMKgIMKgQ09OTkVDVEVEIMKgIMKgIMKgMTA1OTk8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHVuaXggwqAzIMKgIMKgIMKgWyBdIMKgIMKgIMKgIMKgIFNU
UkVBTSDCoCDCoCBDT05ORUNURUQgwqAgwqAgwqAxNDAwNTxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgdW5peCDCoDMgwqAgwqAgwqBbIF0gwqAgwqAgwqAgwqAgU1RSRUFNIMKgIMKgIENPTk5F
Q1RFRCDCoCDCoCDCoDEzMjU4PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyB1bml4IMKgMyDC
oCDCoCDCoFsgXSDCoCDCoCDCoCDCoCBTVFJFQU0gwqAgwqAgQ09OTkVDVEVEIMKgIMKgIMKgMTMy
NDg8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHVuaXggwqAzIMKgIMKgIMKgWyBdIMKgIMKg
IMKgIMKgIFNUUkVBTSDCoCDCoCBDT05ORUNURUQgwqAgwqAgwqAxNDAwMzxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDsgdW5peCDCoDMgwqAgwqAgwqBbIF0gwqAgwqAgwqAgwqAgU1RSRUFNIMKg
IMKgIENPTk5FQ1RFRCDCoCDCoCDCoDEwNTcyIC92YXIvcnVuL3hlbnN0b3JlZC9zb2NrZXQ8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHVuaXggwqAzIMKgIMKgIMKgWyBdIMKgIMKgIMKgIMKg
IFNUUkVBTSDCoCDCoCBDT05ORUNURUQgwqAgwqAgwqAxMDc4NiAvdmFyL3J1bi94ZW5zdG9yZWQv
c29ja2V0PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyB1bml4IMKgMyDCoCDCoCDCoFsgXSDC
oCDCoCDCoCDCoCBER1JBTSDCoCDCoCDCoENPTk5FQ1RFRCDCoCDCoCDCoDEzMTg2PGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0OyB1bml4IMKgMyDCoCDCoCDCoFsgXSDCoCDCoCDCoCDCoCBTVFJF
QU0gwqAgwqAgQ09OTkVDVEVEIMKgIMKgIMKgMTA4NjQgL3Zhci9ydW4veGVuc3RvcmVkL3NvY2tl
dDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgdW5peCDCoDMgwqAgwqAgwqBbIF0gwqAgwqAg
wqAgwqAgU1RSRUFNIMKgIMKgIENPTk5FQ1RFRCDCoCDCoCDCoDEwODEyIC92YXIvcnVuL3hlbnN0
b3JlZC9zb2NrZXQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHVuaXggwqAyIMKgIMKgIMKg
WyBdIMKgIMKgIMKgIMKgIERHUkFNIMKgIMKgIMKgQ09OTkVDVEVEIMKgIMKgIMKgMTQwODM8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHVuaXggwqAzIMKgIMKgIMKgWyBdIMKgIMKgIMKgIMKg
IFNUUkVBTSDCoCDCoCBDT05ORUNURUQgwqAgwqAgwqAxMDgxMyAvdmFyL3J1bi94ZW5zdG9yZWQv
c29ja2V0PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyB1bml4IMKgMyDCoCDCoCDCoFsgXSDC
oCDCoCDCoCDCoCBTVFJFQU0gwqAgwqAgQ09OTkVDVEVEIMKgIMKgIMKgMTQwNjg8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IHVuaXggwqAzIMKgIMKgIMKgWyBdIMKgIMKgIMKgIMKgIFNUUkVB
TSDCoCDCoCBDT05ORUNURUQgwqAgwqAgwqAxMzI1Njxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDsgdW5peCDCoDMgwqAgwqAgwqBbIF0gwqAgwqAgwqAgwqAgU1RSRUFNIMKgIMKgIENPTk5FQ1RF
RCDCoCDCoCDCoDEwNTcxIC92YXIvcnVuL3hlbnN0b3JlZC9zb2NrZXQ8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IHVuaXggwqAzIMKgIMKgIMKgWyBdIMKgIMKgIMKgIMKgIFNUUkVBTSDCoCDC
oCBDT05ORUNURUQgwqAgwqAgwqAxMDg0Mjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgdW5p
eCDCoDMgwqAgwqAgwqBbIF0gwqAgwqAgwqAgwqAgU1RSRUFNIMKgIMKgIENPTk5FQ1RFRCDCoCDC
oCDCoDEzOTg1PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyB1bml4IMKgMyDCoCDCoCDCoFsg
XSDCoCDCoCDCoCDCoCBER1JBTSDCoCDCoCDCoENPTk5FQ1RFRCDCoCDCoCDCoDEzMTg1PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0OyB1bml4IMKgMiDCoCDCoCDCoFsgXSDCoCDCoCDCoCDCoCBT
VFJFQU0gwqAgwqAgQ09OTkVDVEVEIMKgIMKgIMKgMTM4ODQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IHVuaXggwqAyIMKgIMKgIMKgWyBdIMKgIMKgIMKgIMKgIERHUkFNIMKgIMKgIMKgQ09O
TkVDVEVEIMKgIMKgIMKgMTQ1Mjg8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHVuaXggwqAy
IMKgIMKgIMKgWyBdIMKgIMKgIMKgIMKgIERHUkFNIMKgIMKgIMKgQ09OTkVDVEVEIMKgIMKgIMKg
MTM3ODU8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHVuaXggwqAzIMKgIMKgIMKgWyBdIMKg
IMKgIMKgIMKgIFNUUkVBTSDCoCDCoCBDT05ORUNURUQgwqAgwqAgwqAxNDAzNDxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEF0dGFjaGluZyB4
ZW4gbG9nIGZpbGVzIG9mIC92YXIvbG9nL3hlbi48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
IEkgZGlkbiYjMzk7dCBnZXQgdGhlIHJvbGUgb2YgUUVNVSBoZXJlIGJlY2F1c2UgYXMgbWVudGlv
bmVkIGVhcmxpZXIsIEkgYW0gcG9ydGluZyBpbiByYXNwYmVycnlwaTxicj4NCiZndDvCoCDCoCDC
oCDCoDRCLjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7IFJlZ2FyZHMsPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBWaXB1bCBLdW1hcjxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IE9u
IFdlZCwgT2N0IDE5LCAyMDIyIGF0IDEyOjQzIEFNIFN0ZWZhbm8gU3RhYmVsbGluaSAmbHQ7PGEg
aHJlZj0ibWFpbHRvOnNzdGFiZWxsaW5pQGtlcm5lbC5vcmciIHRhcmdldD0iX2JsYW5rIj5zc3Rh
YmVsbGluaUBrZXJuZWwub3JnPC9hPiZndDsgd3JvdGU6PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgSXQgdXN1YWxseSB3b3JrcyB0aGUgd2F5IGl0IGlzIGRlc2NyaWJlZCBp
biB0aGUgZ3VpZGU6PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoDxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoMKgwqDCoMKgwqA8YSBocmVmPSJodHRw
czovL3d3dy52aXJ0dWF0b3BpYS5jb20vaW5kZXgucGhwP3RpdGxlPUNvbmZpZ3VyaW5nX2FfVk5D
X2Jhc2VkX0dyYXBoaWNhbF9Db25zb2xlX2Zvcl9hX1hlbl9QYXJhdmlydHVhbGl6ZWRfZG9tYWlu
VV9HdWVzdCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly93d3cudmly
dHVhdG9waWEuY29tL2luZGV4LnBocD90aXRsZT1Db25maWd1cmluZ19hX1ZOQ19iYXNlZF9HcmFw
aGljYWxfQ29uc29sZV9mb3JfYV9YZW5fUGFyYXZpcnR1YWxpemVkX2RvbWFpblVfR3Vlc3Q8L2E+
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoFlvdSBkb24mIzM5O3QgbmVlZCB0byBpbnN0YWxsIGFueSBWTkMtcmVsYXRlZCBz
ZXJ2ZXIgc29mdHdhcmUgYmVjYXVzZSBpdCBpczxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoGFscmVhZHkgcHJvdmlkZWQgYnkgWGVuICh0byBiZSBwcmVjaXNlIGl0IGlzIHBy
b3ZpZGVkIGJ5IFFFTVUgd29ya2luZzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoHRvZ2V0aGVyIHdpdGggWGVuLik8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgWW91IG9ubHkgbmVlZCB0aGUgdm5jIGNs
aWVudCBpbiBkb20wIHNvIHRoYXQgeW91IGNhbiBjb25uZWN0LCBidXQgeW91PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgY291bGQgYWxzbyBydW4gdGhlIHZuYyBjbGllbnQg
b3V0c2lkZSBmcm9tIGFub3RoZXIgaG9zdC4gU28gYmFzaWNhbGx5PGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgdGhlIGZvbGxvd2luZyBzaG91bGQgd29yayB3aGVuIGV4ZWN1
dGVkIGluIERvbTAgYWZ0ZXIgY3JlYXRpbmcgRG9tVTo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgwqAgdm5jdmlld2VyIGxv
Y2FsaG9zdDowPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoENhbiB5b3UgYXR0YWNoIHRoZSBYZW4gYW5kIFFFTVUgbG9ncyAo
L3Zhci9sb2cveGVuLyopPyBBbmQgYWxzbyB1c2U8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqBuZXRzdGF0IC10YXVucCB0byBjaGVjayBpZiB0aGVyZSBpcyBhbnl0aGluZyBy
dW5uaW5nIGF0IHBvcnQgNTkwMCBvcjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoDU5MDE/PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoENoZWVycyw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgU3RlZmFubzxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgT24gVHVlLCAxOCBPY3QgMjAyMiwgVmlwdWwgU3VuZWph
IHdyb3RlOjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgSGkgU3Rl
ZmFubyw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBUaGFua3MgZm9yIHRoZSByZXNwb25z
ZSE8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBJIGNvdWxkIGluc3RhbGwgdGlnZXJWTkMs
IHgxMXZuYyAmYW1wOyBsaWJ2bmNzZXJ2ZXIgaW4gRG9tMCB4ZW4taW1hZ2UtbWluaW1hbCBidXQg
b25seTxicj4NCiZndDvCoCDCoCDCoCDCoG1hbmFnZSB0bzxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoGluc3RhbGw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBsaWJ2bmNzZXJ2ZXIo
Y291bGRuJiMzOTt0PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgaW5zdGFs
bCB0aWdlcnZuYzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgJmFt
cDsgeDExdm5jIGJlY2F1c2Ugb2YgeDExPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0OyBzdXBwb3J0IG1pc3NpbmcsIGl0JiMzOTtzIHdheWxhbmQpIGluIERPTVUgY3Vz
dG9tIGdyYXBoaWNhbCBpbWFnZS4gSSB0cmllZCBydW5uaW5nPGJyPg0KJmd0O8KgIMKgIMKgIMKg
dm5jdmlld2VyIHdpdGg8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBJUDxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoGFkZHJlc3MgJmFt
cDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqBwb3J0PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgaW4gZG9tMCB0bzxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoGFjY2VzcyB0aGUgZG9tdTxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgZ3JhcGhpY2FsIGltYWdlIGRpc3BsYXkg
YXMgcGVyIGJlbG93IGNvbW1hbmRzLjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDsgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IMKg
dm5jdmlld2VyIDxhIGhyZWY9Imh0dHA6Ly8xOTIuMTY4LjEuNDI6NTkwMSIgcmVsPSJub3JlZmVy
cmVyIiB0YXJnZXQ9Il9ibGFuayI+MTkyLjE2OC4xLjQyOjU5MDE8L2E+PGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyDCoDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDsgwqBCdXQgaXQgc2hvd2luZyBjYW4mIzM5O3Qgb3BlbiBkaXNwbGF5
LCBiZWxvdyBhcmUgdGhlIGxvZ3M6PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0OyDCoDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgcm9v
dEByYXNwYmVycnlwaTQtNjQ6fi9ndWVzdDEjIHZuY3ZpZXdlciA8YSBocmVmPSJodHRwOi8vMTky
LjE2OC4xLjQyOjU5MDEiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPjE5Mi4xNjgu
MS40Mjo1OTAxPC9hPjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFRpZ2VyVk5DIFZpZXdl
ciA2NC1iaXQgdjEuMTEuMDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDsgQnVpbHQgb246IDIwMjAtMDktMDggMTI6MTY8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IENvcHlyaWdodCAoQykgMTk5OS0yMDIwIFRpZ2VyVk5DIFRlYW0gYW5k
IG1hbnkgb3RoZXJzIChzZWUgUkVBRE1FLnJzdCk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IFNlZSA8YSBocmVmPSJodHRwczovL3d3dy50aWdlcnZuYy5vcmciIHJl
bD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vd3d3LnRpZ2Vydm5jLm9yZzwv
YT4gZm9yIGluZm9ybWF0aW9uIG9uIFRpZ2VyVk5DLjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDsgQ2FuJiMzOTt0IG9wZW4gZGlzcGxheTo8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHJvb3RAcmFzcGJlcnJ5cGk0LTY0On4vZ3Vlc3Qx
Izxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEkgYW0gbm90IGV4YWN0bHnCoHN1cmUgd2hh
dCB0aGUgaXNzdWUgaXMgYnV0IEkgdGhvdWdodCBvbmx5IGxpYnZuY3NlcnZlciBpbiBET01VIGNv
dWxkPGJyPg0KJmd0O8KgIMKgIMKgIMKgd29yayB0bzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoGdldDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoGFjY2VzcyBidXQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBpdDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoGRpZCBu
b3Q8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqB3b3JrLsKgPGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBJZiBUaWdlclZOQyBpcyB0aGUgaXNz
dWUgaGVyZSB0aGVuIGlzIHRoZXJlIGFueSBvdGhlciBWTkMgc291cmNlIHdoaWNoIGNvdWxkIGJl
PGJyPg0KJmd0O8KgIMKgIMKgIMKgaW5zdGFsbGVkIGZvcjxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoGJvdGg8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqB4MTEgJmFtcDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqB3YXlsYW5kIHN1cHBv
cnRlZDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoGltYWdlcz88YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBSZWdhcmRzLDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDsgVmlwdWwgS3VtYXI8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
OyBPbiBUdWUsIE9jdCAxOCwgMjAyMiBhdCAyOjQwIEFNIFN0ZWZhbm8gU3RhYmVsbGluaSAmbHQ7
PGEgaHJlZj0ibWFpbHRvOnNzdGFiZWxsaW5pQGtlcm5lbC5vcmciIHRhcmdldD0iX2JsYW5rIj5z
c3RhYmVsbGluaUBrZXJuZWwub3JnPC9hPiZndDsgd3JvdGU6PGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgVk5DIGlzIHR5cGljYWxseSBlYXNpZXIg
dG8gc2V0dXAsIGJlY2F1c2UgU0RMIG5lZWRzIGV4dHJhIGxpYnJhcmllcyBhdDxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoGJ1aWxkIHRpbWUgYW5k
IHJ1bnRpbWUuIElmIFFFTVUgaXMgYnVpbHQgd2l0aG91dCBTREwgc3VwcG9ydCBpdCB3b24mIzM5
O3Q8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBz
dGFydCB3aGVuIHlvdSBhc2sgZm9yIFNETC48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgVk5DIHNob3VsZCB3b3JrIHdpdGggYm90aCB4MTEgYW5kIHdheWxhbmQgaW4geW91
ciBkb21VLiBJdCBkb2VzbiYjMzk7dCB3b3JrPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgYXQgdGhlIHgxMSBsZXZlbCwgaXQgZXhwb3NlcyBhIHNw
ZWNpYWwgZmJkZXYgZGV2aWNlIGluIHlvdXIgZG9tVSB0aGF0PGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgc2hvdWxkIHdvcmsgd2l0aDo8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAtIGEgZ3JhcGhp
Y2FsIGNvbnNvbGUgaW4gTGludXggZG9tVTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoC0geDExPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgLSB3YXlsYW5kIChidXQgSSBoYXZlbiYjMzk7dCB0ZXN0
ZWQgdGhpcyBzbyBJIGFtIG5vdCAxMDAlIHN1cmUgYWJvdXQgaXQpPGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoFdoZW4geW91IHNheSAmcXVvdDtpdCBkb2VzbiYjMzk7dCB3
b3JrJnF1b3Q7LCB3aGF0IGRvIHlvdSBtZWFuPyBEbyB5b3UgZ2V0IGEgYmxhY2s8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqB3aW5kb3c/PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoFlvdSBuZWVkIENPTkZJR19YRU5fRkJE
RVZfRlJPTlRFTkQgaW4gTGludXggZG9tVTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoChkcml2ZXJzL3ZpZGVvL2ZiZGV2L3hlbi1mYmZyb250LmMp
LiBJIHdvdWxkIHRyeSB0byBnZXQgYSBncmFwaGljYWwgdGV4dDxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoGNvbnNvbGUgdXAgYW5kIHJ1bm5pbmcg
aW4geW91ciBkb21VIGJlZm9yZSBhdHRlbXB0aW5nIHgxMS93YXlsYW5kLjxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBDaGVlcnMsPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoFN0ZWZhbm88YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgT24gTW9uLCAxNyBPY3QgMjAyMiwgVmlwdWwgU3VuZWphIHdyb3RlOjxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgSGksPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBUaGFu
a3MhPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDsgSSBoYXZlIHBvcnRlZCB4ZW4gbWluaW1hbCBpbWFnZSBhcyBET00wICZhbXA7IGN1c3Rv
bSB3YXlsYW5kIEdVSSBiYXNlZCBpbWFnZSBhczxicj4NCiZndDvCoCDCoCDCoCDCoERPTVUgaW48
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqByYXNwYmVycnk8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBwaTRCLiBJPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgYW0gdHJ5aW5nIHRvPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgbWFrZSBHVUk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqBkaXNwbGF5IHVwPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBmb3LCoGd1ZXN0IG1hY2hpbmUuIEkgdHJpZWQgdXNpbmfC
oHNkbCwgaW5jbHVkZWQgYmVsb3cgbGluZSBpbiBndWVzdC5jb25mIGZpbGU8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHZmYj0gWyAmIzM5
O3NkbD0xJiMzOTsgXTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IEJ1dCBpdCBpcyB0aHJvd2luZyBiZWxvdyBlcnJvcjo8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyByb290QHJh
c3BiZXJyeXBpNC02NDp+L2d1ZXN0MSMgeGwgY3JlYXRlIC1jIGd1ZXN0MS5jZmc8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFBhcnNpbmcg
Y29uZmlnIGZyb20gZ3Vlc3QxLmNmZzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDsgbGlieGw6IGVycm9yOiBsaWJ4bF9xbXAuYzoxNDAwOnFt
cF9ldl9mZF9jYWxsYmFjazogRG9tYWluIDM6ZXJyb3Igb24gUU1QPGJyPg0KJmd0O8KgIMKgIMKg
IMKgc29ja2V0Ojxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoENvbm5lY3Rpb248
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqByZXNldCBi
eTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoHBlZXI8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGxpYnhsOiBlcnJvcjogbGlieGxfcW1wLmM6
MTQzOTpxbXBfZXZfZmRfY2FsbGJhY2s6IERvbWFpbiAzOkVycm9yIGhhcHBlbmVkPGJyPg0KJmd0
O8KgIMKgIMKgIMKgd2l0aCB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBR
TVA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBjb25u
ZWN0aW9uIHRvPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgUUVNVTxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgbGlieGw6IGVycm9yOiBsaWJ4
bF9kbS5jOjMzNTE6ZGV2aWNlX21vZGVsX3Bvc3Rjb25maWdfZG9uZTogRG9tYWluIDM6UG9zdCBE
TTxicj4NCiZndDvCoCDCoCDCoCDCoHN0YXJ0dXA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqBjb25maWdzPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgZmFpbGVkLDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoHJjPS0yNjxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgbGlieGw6IGVy
cm9yOiBsaWJ4bF9jcmVhdGUuYzoxODY3OmRvbWNyZWF0ZV9kZXZtb2RlbF9zdGFydGVkOiBEb21h
aW4gMzpkZXZpY2U8YnI+DQomZ3Q7wqAgwqAgwqAgwqBtb2RlbDxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoGRpZCBub3Q8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqBzdGFydDo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAtMjY8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGxpYnhsOiBlcnJvcjogbGlieGxf
YW91dGlscy5jOjY0NjpsaWJ4bF9fa2lsbF94c19wYXRoOiBEZXZpY2UgTW9kZWwgYWxyZWFkeTxi
cj4NCiZndDvCoCDCoCDCoCDCoGV4aXRlZDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgbGlieGw6IGVycm9yOiBsaWJ4bF9kb21haW4uYzox
MTgzOmxpYnhsX19kZXN0cm95X2RvbWlkOiBEb21haW4gMzpOb24tZXhpc3RhbnQ8YnI+DQomZ3Q7
wqAgwqAgwqAgwqBkb21haW48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IGxpYnhsOiBlcnJvcjogbGlieGxfZG9tYWluLmM6MTEzNzpkb21h
aW5fZGVzdHJveV9jYWxsYmFjazogRG9tYWluIDM6VW5hYmxlIHRvPGJyPg0KJmd0O8KgIMKgIMKg
IMKgZGVzdHJveTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoGd1ZXN0PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBsaWJ4
bDogZXJyb3I6IGxpYnhsX2RvbWFpbi5jOjEwNjQ6ZG9tYWluX2Rlc3Ryb3lfY2I6IERvbWFpbiAz
OkRlc3RydWN0aW9uIG9mPGJyPg0KJmd0O8KgIMKgIMKgIMKgZG9tYWluPGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgZmFpbGVkPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgQW5vdGhlciB3YXkgaXMgVk5DLCBpIGNvdWxk
IGluc3RhbGwgdGlnZXJ2bmMgaW4gRE9NMCBidXQgc2FtZSBpIGNvdWxkbiYjMzk7dCBpbjxicj4N
CiZndDvCoCDCoCDCoCDCoGd1ZXN0PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
bWFjaGluZTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oGJlY2F1c2UgaXQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBkb2VzbiYjMzk7dCBzdXBwb3J0PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgeDExKHN1
cHBvcnRzIHdheWxhbmQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IG9ubHkpLiBJIGFtIGNvbXBsZXRlbHkgYmxvY2tlZCBoZXJlLCBOZWVk
IHlvdXIgc3VwcG9ydCB0byBlbmFibGUgdGhlIGRpc3BsYXk8YnI+DQomZ3Q7wqAgwqAgwqAgwqB1
cC48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IEFueSBhbHRlcm5hdGl2ZSBvZiBWTkMgd2hpY2ggY291bGQgd29yayBpbiBib3RoIHgxMSAm
YW1wOyB3YXlsYW5kIHN1cHBvcnRlZDxicj4NCiZndDvCoCDCoCDCoCDCoGltYWdlcz88YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBBbnkg
aW5wdXQgb24gVk5DLCBTREwgb3IgYW55IG90aGVyIHdheSB0byBwcm9jZWVkIG9uIHRoaXM/IExv
b2tpbmcgZm9yd2FyZCB0bzxicj4NCiZndDvCoCDCoCDCoCDCoGhlYXJpbmc8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBmcm9tPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgeW91Ljxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFJlZ2FyZHMsPGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBWaXB1bCBLdW1hcjxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDsgPGJyPg0KJmd0OyA8
YnI+DQomZ3Q7IDwvYmxvY2txdW90ZT48L2Rpdj4NCg==
--00000000000084411105efce444c--

