Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B157019B7BE
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 23:38:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJl1U-00088S-O5; Wed, 01 Apr 2020 21:35:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wqBo=5R=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jJl1S-00088M-Ly
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 21:35:42 +0000
X-Inumbo-ID: bc221be1-7460-11ea-bb45-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bc221be1-7460-11ea-bb45-12813bfff9fa;
 Wed, 01 Apr 2020 21:35:41 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AE9E820719;
 Wed,  1 Apr 2020 21:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585776940;
 bh=/1T9CY/MEYJpPQwxf69piZx3h6sJ32ZqgDWhAvtuWD8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=o1V9b2PAirGmIYsv38SQtpe4hpdNT3m8KgD6B9e3wl6ScZHttD2hor5B6OX0M8Fai
 asslDQy5e21+WlgCUD/CMIhqGlfyvYy4fOw0Ix4DKVrZhNOEU38Qe77iC/Zto+Nw98
 FoYes3/1jdHUhpD+Rpd3vNe5vAqjZIO4A9OZ1g4g=
Date: Wed, 1 Apr 2020 14:35:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Andrei Cherechesu <andrei.cherechesu@nxp.com>
Subject: Re: [Xen-devel] Having a DOM-U guest with 1:1 mapping in the second
 stage MMU.
In-Reply-To: <VI1PR04MB50569D4357FD006DF6359F50F9C90@VI1PR04MB5056.eurprd04.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.2004011401200.10657@sstabellini-ThinkPad-T480s>
References: <VI1PR04MB50569D4357FD006DF6359F50F9C90@VI1PR04MB5056.eurprd04.prod.outlook.com>
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
> > I cannot see any issues with the driver. Can you paste the device tree as dom0
> > sees it? You can access it from /proc/device-tree (you can convert it to dts
> > with dtc -I fs -O dts). And also the host device tree?
> > 
> > We should see something like the following (this example is taken from a Xilinx
> > ZynqMP):
> > 
> > 1) host device tree
> > 
> >         serial@ff000000 {
> >                 u-boot,dm-pre-reloc;
> >                 compatible = "cdns,uart-r1p12", "xlnx,xuartps";
> >                 status = "okay";
> >                 interrupt-parent = <0x4>;
> >                 interrupts = <0x0 0x15 0x4>;
> >                 reg = <0x0 0xff000000 0x0 0x1000>;
> >                 clock-names = "uart_clk", "pclk";
> >                 power-domains = <0x26 0x21>;
> >                 clocks = <0x3 0x38 0x3 0x1f>;
> >                 pinctrl-names = "default";
> >                 pinctrl-0 = <0x37>;
> >                 cts-override;
> >                 device_type = "serial";
> >                 port-number = <0x0>;
> >         };
> > 
> > 
> > 2) dom0 device tree
> > 
> >     The node is missing
> > 
> > 
> > The key is that dom0 should not see the UART node in device tree at all.
> > 
> > If Dom0 is seeing the node, then it is a problem with Xen that somehow is not
> > hiding it (see "Skip nodes used by Xen" under
> > xen/arch/arm/domain_build.c:handle_node)
> > 
> > If Dom0 is *not* seeing the node, that what is the underlying device tree node
> > that the dom0 driver is using to bring up /dev/ttyLF0?
> > 
> 
> I looked under /proc/device-tree and Dom0 actually sees the node corresponding
> to the serial device. That means Xen is not hiding it. 
> 
> I've pasted the host device tree at [0] and the Dom0 device tree at [1]
> [0] https://pastebin.com/ir7VkfES
> [1] https://pastebin.com/UqRDycHF
> 
> So this is the device in the host device tree:
> 
>     uart0:serial@401C8000 {
>         compatible = "fsl,s32-linflexuart";
>         reg = <0x0 0x401C8000 0x0 0x3000>;
>         interrupts = <0 82 1>;
>         clocks = <&clks S32GEN1_CLK_LIN_BAUD>,
>                 <&clks S32GEN1_CLK_LIN>;
>         clock-names = "lin", "ipg";
>         dmas = <&edma0 0 4>,
>                 <&edma0 0 3>;
>         dma-names = "rx", "tx";
>     };
> 
> 
> And this is the device in the Dom0 device tree:
> 
>     serial@401C8000 {
>         clock-names = "lin\0ipg";
>         interrupts = <0x00 0x52 0x01>;
>         clocks = <0x04 0x2a 0x04 0x2b>;
>         dma-names = "rx\0tx";
>         compatible = "fsl,s32-linflexuart";
>         reg = <0x00 0x401c8000 0x00 0x3000>;
>         dmas = <0x0e 0x00 0x04 0x0e 0x00 0x03>;
>     };

All right, now we know what the problem is :-)

If you are unsure, I would enable CONFIG_DEVICE_TREE_DEBUG and/or add a
printk or two to figure out why Xen is not filtering out the node:


diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 4307087536..fa6a108de8 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1486,6 +1486,7 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
     /* Skip nodes used by Xen */
     if ( dt_device_used_by(node) == DOMID_XEN )
     {
+        printk("DEBUG skipping %s\n",path);
         dt_dprintk("  Skip it (used by Xen)\n");
         return 0;
     }

You might also want to add a printk just before the call to
dt_device_set_used_by(dev, DOMID_XEN) in your uart driver.



> From this story I figured out something else: that I was not passing to Xen's
> bootargs "console=dtuart dtuart=serial0". Maybe that's why Xen is not hiding
> the node from Dom0 (serial0 is an alias to uart0).

Yes, it is worth double-checking that Xen is using the right driver for
the right device and the right device tree node description. Print in
your driver not only that is getting called but also that is getting
called for the right device node.

But console=dtuart dtuart=serial0 seems correct with your device tree.


> So I went on and I added that to bootargs. And now my Xen boot stops here
> (DEBUG print on):
> ...
> ...
> (XEN) fixed up name for siul2_reg@0x4401170C -> siul2_reg
> (XEN) fixed up name for siul2_reg@0x4401174C -> siul2_reg
> (XEN) fixed up name for usbmisc@44064200 -> usbmisc
> (XEN) fixed up name for usb@44064000 -> usb
> (XEN) fixed up name for memory_DDR0@80000000 -> memory_DDR0
> (XEN) fixed up name for memory_DDR1@c0000000 -> memory_DDR1
> (XEN) fixed up name for memory_DDR2@880000000 -> memory_DDR2
> (XEN)  <- unflatten_device_tree()
> (XEN) adding DT alias:can0: stem=can id=0 node=/flexcan@401B4000
> (XEN) adding DT alias:can1: stem=can id=1 node=/flexcan@401BE000
> (XEN) adding DT alias:can2: stem=can id=2 node=/flexcan@402A8000
> (XEN) adding DT alias:can3: stem=can id=3 node=/flexcan@402B2000
> (XEN) adding DT alias:serial0: stem=serial id=0 node=/serial@401C8000
> (XEN) adding DT alias:serial1: stem=serial id=1 node=/serial@401CC000
> (XEN) adding DT alias:serial2: stem=serial id=2 node=/serial@402BC000
> (XEN) Platform: Generic System
> (XEN) Looking for dtuart at "serial0", options ""
> (XEN) DT: ** translation for device /serial@401C8000 **
> (XEN) DT: bus is default (na=2, ns=2) on /
> (XEN) DT: translating address:<3> 00000000<3> 401c8000<3>
> (XEN) DT: reached root node
> (XEN) dt_device_get_raw_irq: dev=/serial@401C8000, index=0
> (XEN)  intspec=0 intlen=3
> (XEN)  intsize=3 intlen=3
> (XEN) dt_irq_map_raw: par=/interrupt-controller@50800000,intspec=[0x00000000 0x00000052...],ointsize=3
> (XEN) dt_irq_map_raw: ipar=/interrupt-controller@50800000, size=3
> (XEN)  -> addrsize=2
> (XEN)  -> got it??? 
> 
> I started debugging and I found out that it hangs in:
> console_init_preirq() -> __putstr(xen_banner()) -> sercon_puts() -> serial_puts() -> __serial_putc(),
> where it spins at line 178:         
>         /* Synchronous finite-capacity transmitter. */
>         while ( !(n = port->driver->tx_ready(port)) )
>             cpu_relax();
>  
> Which is a bit strange, considering that my serial device is asynchronous,
> I think it should not get there. But it gets on that "else" branch because
> port->txbuf is actually NULL at line 120 when it performs the check, and
> it does not enter the branch for asynchronous transmitters.
 
What Xen base version are you using? It is not line 178 on master.

I would look a bit more closely into that driver. For instance, one
question I would ask myself is why is tx_ready not returning 1?
Something is probably not quite right in the initialization of that
driver.

