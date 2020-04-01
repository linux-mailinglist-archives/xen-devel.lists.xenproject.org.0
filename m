Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A42B219B078
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 18:28:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJgBq-0007Ql-3p; Wed, 01 Apr 2020 16:26:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wqBo=5R=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jJgBo-0007Qg-MS
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 16:26:04 +0000
X-Inumbo-ID: 7b54ad88-7435-11ea-9e09-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b54ad88-7435-11ea-9e09-bc764e2007e4;
 Wed, 01 Apr 2020 16:26:04 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7E90320857;
 Wed,  1 Apr 2020 16:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585758363;
 bh=jTuiabkMUB+BryK/itTwJrMK6Z5wf/hT7kVol1hb7gw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=clZEB+sFmPJbcVd5DPsM5tzHFuCkkiJq2kSievgHRDS9v2vx4XYth3dS9jXS8zjka
 Z9fdjOTh9bp6dTgYeX8/LABtEHzt/Qos/57FhiCF//yv8UWctT3twLIqJD/Tw/+N5a
 5i7JwQEl/+QGByqcleONvwFqwirqWt6oeYuszXmo=
Date: Wed, 1 Apr 2020 09:26:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Andrei Cherechesu <andrei.cherechesu@nxp.com>
Subject: Re: [Xen-devel] Having a DOM-U guest with 1:1 mapping in the second
 stage MMU.
In-Reply-To: <VI1PR04MB505609C8A448B9FF84EDD667F9C90@VI1PR04MB5056.eurprd04.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.2004010916070.10657@sstabellini-ThinkPad-T480s>
References: <VI1PR04MB505609C8A448B9FF84EDD667F9C90@VI1PR04MB5056.eurprd04.prod.outlook.com>
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

On Wed, 1 Apr 2020, Andrei Cherechesu wrote:
> Hi,
> 
> And thanks for your help.
> 
> > Great to hear!
> > 
> > 
> > > However, I am encountering another problem now: in Dom0 and in 
> > > dom0less-booted DomUs, I cannot use /dev/hvc0.
> > 
> > For dom0less-booted DomUs it is normal because they don't get a PV console,
> > they get an emulated PL011 UART instead.  Make sure to have a "vpl011" tag in
> > device tree to enable it (ImageBuilder generates it by default.) The device
> > name is usually ttyAMA0.
> 
> Ok, understood. I had my vpl011 tag in the dom0less DomUs nodes in the DT,
> so that's not the problem. I am able to see DomUs boot prompt when booting
> dom0less. The problem is after DomU boots, that I am not able to switch to
> its console from Dom0, in order to be able to log in.

It looks like the UART driver in Xen is not working properly; it doesn't
seem to be a dom0less issue.


> > > Even though I'm specifying "console=hvc0" in dom0-bootargs, when dom0 
> > > finishes booting, it looks like I cannot use the getty spawned on /dev/hvc0.
> > >
> > > This is the end of the boot log:
> > > [    2.947845] random: rngd: uninitialized urandom read (4 bytes read)
> > > [    2.958415] random: rngd: uninitialized urandom read (4 bytes read)
> > > [    2.965452] random: rngd: uninitialized urandom read (2500 bytes read)
> > > .
> > > [    2.972410] random: crng init done
> > > Starting OpenBSD Secure Shell server: sshd done.
> > > Starting /usr/sbin/xenstored...
> > > Setting domain 0 name, domid and JSON config...
> > > Done setting up Dom0
> > > Starting xenconsoled...
> > > Starting QEMU as disk backend for dom0 Starting domain watchdog 
> > > daemon: xenwatchdogd startup
> > >
> > > [done]
> > >
> > > Auto Linux BSP 1.0 s32g274aevb /dev/hvc0
> > >
> > > s32g274aevb login:
> > > Auto Linux BSP 1.0 s32g274aevb /dev/ttyLF0
> > >
> > > s32g274aevb login:
> > >
> > > ----- END -----
> > >
> > > It seems that the getty spawned on /dev/ttyLF0 overwrites the one 
> > > spawned on /dev/hvc0. Which I do not understand, since Dom0 should not 
> > > have access (?) directly to ttyLF0 (the serial console device on our 
> > > boards). If I remove the line which spawns the getty on ttyLF0 from 
> > > /etc/inittab, the system hangs when waiting for the username, and it does not let me type in any characters. For the record, hvc0 is added to /etc/securetty.
> > >
> > > In a system where I boot DomU via xl from Dom0, I can switch to its 
> > > console with xl console, and hvc0 works there.
> > >
> > > The problem that comes with this is that I can not use the CTRL-AAA 
> > > command to switch between Dom0 console and DomU console in a dom0less 
> > > case, and I cannot therefore test that the passthrough works. But at least Dom0 does not have an entry for it under /dev, anymore, and DomU boot prompt tells that the driver has been registered.
> > 
> > It looks like there is some kind of interference between the dom0 ttyLF0 driver and the Xen serial driver.
> > 
> > Is your Xen UART driver marking the device as "used by Xen"? See for instance the pl011 driver, at the end of
> > xen/drivers/char/pl011.c:pl011_dt_uart_init:
> > 
> >     dt_device_set_used_by(dev, DOMID_XEN);
> > 
> > Devices that are marked as "used by Xen" are not exposed to dom0, so you shouldn't see the ttyLF0 device come up in Linux at all.
> 
> I've checked my Xen UART Driver and that call is there. So ttyLF0 should be
> marked for Xen to use.
> 
> I don't have any ideas why this happens.
> 
> I've attached the driver [0], if you want to take a look.
> 
> [0] https://pastebin.com/PuXi50H0

I cannot see any issues with the driver. Can you paste the device tree
as dom0 sees it? You can access it from /proc/device-tree (you can
convert it to dts with dtc -I fs -O dts). And also the host device tree?

We should see something like the following (this example is taken from a
Xilinx ZynqMP):

1) host device tree

	serial@ff000000 {
		u-boot,dm-pre-reloc;
		compatible = "cdns,uart-r1p12", "xlnx,xuartps";
		status = "okay";
		interrupt-parent = <0x4>;
		interrupts = <0x0 0x15 0x4>;
		reg = <0x0 0xff000000 0x0 0x1000>;
		clock-names = "uart_clk", "pclk";
		power-domains = <0x26 0x21>;
		clocks = <0x3 0x38 0x3 0x1f>;
		pinctrl-names = "default";
		pinctrl-0 = <0x37>;
		cts-override;
		device_type = "serial";
		port-number = <0x0>;
	};


2) dom0 device tree

    The node is missing
     

The key is that dom0 should not see the UART node in device tree at all.

If Dom0 is seeing the node, then it is a problem with Xen that somehow
is not hiding it (see "Skip nodes used by Xen" under
xen/arch/arm/domain_build.c:handle_node)

If Dom0 is *not* seeing the node, that what is the underlying device
tree node that the dom0 driver is using to bring up /dev/ttyLF0?

