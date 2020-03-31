Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D32199F51
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 21:42:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJMjf-0000zr-Pd; Tue, 31 Mar 2020 19:39:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PYO0=5Q=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jJMje-0000zm-Ur
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 19:39:42 +0000
X-Inumbo-ID: 5dd8c6a8-7387-11ea-83d8-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5dd8c6a8-7387-11ea-83d8-bc764e2007e4;
 Tue, 31 Mar 2020 19:39:42 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 606B52072E;
 Tue, 31 Mar 2020 19:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585683581;
 bh=pizASiTP6MSLJ23sWH4pMy18KpIrE85iX5ew+bH6SkI=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=KtKV56USRXFvwo0WxqHg8oFnEMgROCi3FnNBZl6TLpVcAOmOac1HUsXz7YkRMnXe0
 o4aglHmwi/R6SFSQWby0hzD/r54UhR+f4ndY3vUcovxtxK27QIUP46/azyNv1YIemA
 Js1zP6U33hiB9EKag/s/Ui1Qz9FfOz+eU5Q+6IFE=
Date: Tue, 31 Mar 2020 12:39:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Andrei Cherechesu <andrei.cherechesu@nxp.com>
Subject: RE: [EXT] Re: [Xen-devel] Having a DOM-U guest with 1:1 mapping in
 the second stage MMU.
In-Reply-To: <VI1PR04MB5056CE76F727C8B53F2E296EF9C80@VI1PR04MB5056.eurprd04.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.2003311149360.4572@sstabellini-ThinkPad-T480s>
References: <VI1PR04MB5807A9BC95A9D956D052DB7DF91A0@VI1PR04MB5807.eurprd04.prod.outlook.com>
 <alpine.DEB.2.21.2002131327360.1018@sstabellini-ThinkPad-T480s>
 <VI1PR04MB5056CE76F727C8B53F2E296EF9C80@VI1PR04MB5056.eurprd04.prod.outlook.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 31 Mar 2020, Andrei Cherechesu wrote:
> > On Thu, 13 Feb 2020, Andrei Cherechesu wrote:
> > >  I used the Xen from Stefano's tree and made the updates to the partial 
> > > dtb that he specified.
> > >
> > > > This is mostly likely because Linux is trying to access a region 
> > > > that is not mapped in stage-2. You can rebuild Xen with debug 
> > > > enabled and you should see a message "traps.c:..." telling the exact 
> > > > physical address accessed.
> > > >
> > > > In general I would recommend to build Xen with debug enabled during development as the hypervisor will give you more information of what's going on.
> > > >
> > > > Cheers,
> > > >
> > > > --
> > > > Julien Grall
> > >
> > > I enabled debug config and gave it another try. But I'm still getting 
> > > the same unhandled fault error, that seems to match what Julien 
> > > described above.
> > >
> > > It is indeed a stage-2 abort caused by the guest.
> > >
> > > I attached the DomU1 crash log at [0].
> > >
> > > [0] 
> > >
> > >
> > > How should I proceed in this case?
> >
> > Looking at the logs, you can see:
> >
> > (XEN) traps.c:1973:d1v0 HSR=0x939f0046 pc=0xffffff80083ac864 gva=0xffffff800800d048 gpa=0x000000402f0048
> >
> > So the guest was accessing address 0x402f0048, however, the MMIO address range of the device that you are remapping is 0x4002f000-0x40030000.
> >
> > I spotted the mistake now: looking at the partial DTB again, the address of the device is:
> >
> >   reg = <0x0 0x402f0000 0x1000>;
> >
> > but the address that you are remapping is:
> >
> >   xen,reg = <0x0 0x4002f000 0x1000 0x0 0x4002f000>;
> >
> > They are not the same! :-)
> 
> Thanks, Stefano!
> 
> I changed the partial DTB and it did not crash anymore.

Great to hear!


> However, I am encountering another problem now: in Dom0 and in dom0less-booted DomUs,
> I cannot use /dev/hvc0.

For dom0less-booted DomUs it is normal because they don't get a PV
console, they get an emulated PL011 UART instead.  Make sure to have a
"vpl011" tag in device tree to enable it (ImageBuilder generates it by
default.) The device name is usually ttyAMA0.


> Even though I'm specifying "console=hvc0" in dom0-bootargs, when dom0 finishes booting,
> it looks like I cannot use the getty spawned on /dev/hvc0.
> 
> This is the end of the boot log:
> [    2.947845] random: rngd: uninitialized urandom read (4 bytes read)
> [    2.958415] random: rngd: uninitialized urandom read (4 bytes read)
> [    2.965452] random: rngd: uninitialized urandom read (2500 bytes read)
> .
> [    2.972410] random: crng init done
> Starting OpenBSD Secure Shell server: sshd
> done.
> Starting /usr/sbin/xenstored...
> Setting domain 0 name, domid and JSON config...
> Done setting up Dom0
> Starting xenconsoled...
> Starting QEMU as disk backend for dom0
> Starting domain watchdog daemon: xenwatchdogd startup
> 
> [done]
> 
> Auto Linux BSP 1.0 s32g274aevb /dev/hvc0
> 
> s32g274aevb login: 
> Auto Linux BSP 1.0 s32g274aevb /dev/ttyLF0
> 
> s32g274aevb login:
> 
> ----- END -----
> 
> It seems that the getty spawned on /dev/ttyLF0 overwrites the one spawned on /dev/hvc0. Which
> I do not understand, since Dom0 should not have access (?) directly to ttyLF0 (the serial console device
> on our boards). If I remove the line which spawns the getty on ttyLF0 from /etc/inittab, the system hangs
> when waiting for the username, and it does not let me type in any characters. For the record, hvc0 is 
> added to /etc/securetty.
> 
> In a system where I boot DomU via xl from Dom0, I can switch to its console with xl console, and hvc0
> works there.
> 
> The problem that comes with this is that I can not use the CTRL-AAA command to switch between Dom0 console
> and DomU console in a dom0less case, and I cannot therefore test that the passthrough works. But at least Dom0
> does not have an entry for it under /dev, anymore, and DomU boot prompt tells that the driver has been registered.

It looks like there is some kind of interference between the dom0 ttyLF0
driver and the Xen serial driver.

Is your Xen UART driver marking the device as "used by Xen"? See for
instance the pl011 driver, at the end of
xen/drivers/char/pl011.c:pl011_dt_uart_init:

    dt_device_set_used_by(dev, DOMID_XEN);

Devices that are marked as "used by Xen" are not exposed to dom0, so you
shouldn't see the ttyLF0 device come up in Linux at all.

