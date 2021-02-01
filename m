Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0AD30A067
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 03:55:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79509.144733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6PMt-0006nt-02; Mon, 01 Feb 2021 02:55:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79509.144733; Mon, 01 Feb 2021 02:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6PMs-0006nU-ST; Mon, 01 Feb 2021 02:55:10 +0000
Received: by outflank-mailman (input) for mailman id 79509;
 Mon, 01 Feb 2021 02:55:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WfTc=HD=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1l6PMr-0006nP-Iy
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 02:55:09 +0000
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2bd5e5e2-f531-4791-8828-19d01f288b27;
 Mon, 01 Feb 2021 02:55:08 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id q7so14927027wre.13
 for <xen-devel@lists.xenproject.org>; Sun, 31 Jan 2021 18:55:08 -0800 (PST)
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
X-Inumbo-ID: 2bd5e5e2-f531-4791-8828-19d01f288b27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S6GWgEoFzvJMBPUCO9dayzaEi9/BbIzTat0tN/bGrKs=;
        b=sRJvyYI4bb9Sl526k+8KnO6OMJEu6pj8FPEFuuY6uluW4rCIShcWRWrwC11n2uWA7i
         3a/jTn16hV8kOJUnVWycCkFEUkBs4ADnzURzD8E45eWfU792/ktK6ikH5R5Oe3MxEHuX
         xEsRe9f+K+ZvVF+pPcbWs+hJdTEsOr9L4PcH97rcZK97dXs+HcMyb7gkxarKwKAo5BCf
         /8adr/xOx0UHu4W78DqoOVCJjJZ0jup88sdzD31Dk0XlVpkATejgb/gwbcqnpKQk32Zi
         hPX+5f3PKX5rBdWYQMmnQpMhjqxBiQ1Ze+ueEuP5QJEwHNb7iFWu6fNWKOYXx70sco+M
         vNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S6GWgEoFzvJMBPUCO9dayzaEi9/BbIzTat0tN/bGrKs=;
        b=Spo35lVmUL4m4V8ueOMai2UECnhi3vRoT/6lgXDPLFTYoNlZd6IthiYRZfgKmhEasI
         pGoLQ+eM7Uh2tfY3i7uj2UTOC9gfl23HJlA4UrkXKW+zcECxIjq97Lkuump/z72x08t5
         daUE0ocAw4J4E7okRuk0/VjpbG5prVT6vBqzQ3j95lU6XwFwhT56W9uHKqRhKpSWJmx0
         jnjTfSr1lGkOcWAAcBBekX5HqGvyOavgVCS4XuZdcNmSOhS0AZe+J/ed6KRSHYOnJhit
         aLoY1V5lL5JUz65GEc4a227nXJpwnRjRnCaEN6/Je9TBhjQvfn5eqsuyydGLJ8fNi/Hy
         A79w==
X-Gm-Message-State: AOAM5331LDcvj8GqnQRn8ZvThtHb69Qkpd3fpYUlO6tLy3X1tsRwY/39
	X8YaJUAF8JrKj6dxTkofSxjKIb5YNoRnHeXAMo4=
X-Google-Smtp-Source: ABdhPJxOJqy+snbCd2pzMFm4jUslYDsOefwlkKyhmvJrrEG5uLTRfkdIyPyMaR9FQxiwlBrlFJPWDLmwSWtUFssmo1A=
X-Received: by 2002:a05:6000:1547:: with SMTP id 7mr15896036wry.301.1612148107571;
 Sun, 31 Jan 2021 18:55:07 -0800 (PST)
MIME-Version: 1.0
References: <CABfawhnvgFLU=VmaqmKyf8DNeVcXoXTD2=XpiwnL0OikC1_z4w@mail.gmail.com>
 <YBc+Iaf1CCgXO0Aj@mattapan.m5p.com> <CABfawhncPyDKy_G2Lz7MaEb_ZoPadHef7S7KAj-fbCbQq6YNGA@mail.gmail.com>
 <YBdgf4KKcDn0SCOw@mattapan.m5p.com> <CABfawhmrWX6tO-bESuF5oGec5cLbkHdyjdCGsfwX5AVrwQBsKA@mail.gmail.com>
In-Reply-To: <CABfawhmrWX6tO-bESuF5oGec5cLbkHdyjdCGsfwX5AVrwQBsKA@mail.gmail.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Sun, 31 Jan 2021 21:54:31 -0500
Message-ID: <CABfawhn4YTot8FeZg7zJV0Hc7=kHM0-yiBM7vwo4eqLcKvXnzg@mail.gmail.com>
Subject: Re: Xen 4.14.1 on RPI4: device tree generation failed
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 31, 2021 at 9:43 PM Tamas K Lengyel
<tamas.k.lengyel@gmail.com> wrote:
>
> On Sun, Jan 31, 2021 at 8:59 PM Elliott Mitchell <ehem+xen@m5p.com> wrote:
> >
> > On Sun, Jan 31, 2021 at 06:50:36PM -0500, Tamas K Lengyel wrote:
> > > On Sun, Jan 31, 2021 at 6:33 PM Elliott Mitchell <ehem+undef@m5p.com> wrote:
> > > >
> > > > On Sun, Jan 31, 2021 at 02:06:17PM -0500, Tamas K Lengyel wrote:
> > > > > (XEN) Unable to retrieve address 0 for /scb/pcie@7d500000/pci@1,0/usb@1,0
> > > > > (XEN) Device tree generation failed (-22).
> > > >
> > > > > Does anyone have an idea what might be going wrong here? I tried
> > > > > building the dtb without using the dtb overlay but it didn't seem to
> > > > > do anything.
> > > >
> > > > If you go to line 1412 of the file xen/arch/arm/domain_build.c and
> > > > replace the "return res;" with "continue;" that will bypass the issue.
> > > > The 3 people I'm copying on this message though may wish to ask questions
> > > > about the state of your build tree.
> > >
> > > I'll try that but it's a pretty hacky work-around ;)
> >
> > Actually no, it simply causes Xen to ignore these entries.  The patch
> > I've got ready to submit to this list also adjusts the error message to
> > avoid misinterpretation, but does pretty well exactly this.
> >
> > My only concern is whether it should ignore the entries only for Domain 0
> > or should always ignore them.
> >
> >
> > > > Presently the rpixen script is grabbing the RPF's 4.19 branch, dates
> > > > point to that last being touched last year.  Their tree is at
> > > > cc39f1c9f82f6fe5a437836811d906c709e0661c.
> > >
> > > I've moved the Linux branch up to 5.10 because there had been a fair
> > > amount of work that went into fixing Xen on RPI4, which got merged
> > > into 5.9 and I would like to be able to build upstream everything
> > > without the custom patches coming with the rpixen script repo.
> >
> > Please keep track of where your kernel source is checked out at since
> > there was a desire to figure out what was going on with the device-trees.
> >
> >
> > Including "console=hvc0 console=AMA0 console=ttyS0 console=tty0" in the
> > kernel command-line should ensure you get output from the kernel if it
> > manages to start (yes, Linux does support having multiple consoles at the
> > same time).
>
> No output from dom0 received even with the added console options
> (+earlyprintk=xen). The kernel build was from rpi-5.10.y
> c9226080e513181ffb3909a905e9c23b8a6e8f62. I'll check if it still boots
> with 4.19 next.

The dtb overlay is giving me the following error with both 4.19 and 5.10:

arch/arm64/boot/dts/overlays/pi4-64-xen.dtbo: Warning (pci_bridge):
/fragment@1/__overlay__: node name is not "pci" or "pcie"
arch/arm64/boot/dts/overlays/pi4-64-xen.dtbo: Warning (pci_bridge):
/fragment@1/__overlay__: missing ranges for PCI bridge (or not a
bridge)
arch/arm64/boot/dts/overlays/pi4-64-xen.dtbo: Warning (pci_bridge):
/fragment@1/__overlay__: incorrect #address-cells for PCI bridge
arch/arm64/boot/dts/overlays/pi4-64-xen.dtbo: Warning (pci_bridge):
/fragment@1/__overlay__: incorrect #size-cells for PCI bridge
arch/arm64/boot/dts/overlays/pi4-64-xen.dtbo: Warning
(pci_device_bus_num): Failed prerequisite 'pci_bridge'

The overlays are defined in
https://github.com/dornerworks/xen-rpi4-builder/blob/master/patches/linux/0001-Add-Xen-overlay-for-the-Pi-4.patch
as:

+/dts-v1/;
+/plugin/;
+
+/ {
+ compatible = "brcm,bcm2711";
+
+ fragment@0 {
+ target-path = "/chosen";
+ __overlay__ {
+ #address-cells = <0x1>;
+ #size-cells = <0x1>;
+ xen,xen-bootargs = "console=dtuart dtuart=/soc/serial@7e215040
sync_console dom0_mem=512M dom0_mem=512M bootscrub=0";
+
+ dom0 {
+ compatible = "xen,linux-zimage", "xen,multiboot-module";
+ reg = <0x00400000 0x01000000>;
+ };
+ };
+ };
+
+ fragment@1 {
+ target-path = "/scb/pcie@7d500000";
+ __overlay__ {
+ device_type = "pci";
+ };
+ };
+};
+// Xen configuration for Pi 4

Don't really know what those warnings mean or how to fix them but
perhaps they are relevant to why Xen also complains?

Tamas

