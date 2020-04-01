Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FA719B76D
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 23:10:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJkaE-0005YX-Pc; Wed, 01 Apr 2020 21:07:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=46oD=5R=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jJkaC-0005Xn-PK
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 21:07:32 +0000
X-Inumbo-ID: cd5413d6-745c-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd5413d6-745c-11ea-b58d-bc764e2007e4;
 Wed, 01 Apr 2020 21:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K6yqWlm/Tg22DNpl5U8tUU3d6gdXz00zPjSVHwLc0kQ=; b=a0XXeOxqFBYXFW46ttfqGiu0pT
 /xx+4SK9Lmo+/zDX7G2Nz619pnTHGZbsB/o0MptubkK++2/kAzFO3w9mqB59TYT7Lzwn7sxK6/br+
 tXvOIMy+t1sAln/sEs9oKDkAyzcNYKmZTgaH6Vlnb4mckHjDVX2plwCobK3OcbQdh0cs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJkaB-0004LZ-KQ; Wed, 01 Apr 2020 21:07:31 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJkaB-0005B1-5R; Wed, 01 Apr 2020 21:07:31 +0000
Subject: Re: [Xen-devel] Having a DOM-U guest with 1:1 mapping in the second
 stage MMU.
To: Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <VI1PR04MB50569D4357FD006DF6359F50F9C90@VI1PR04MB5056.eurprd04.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <58232271-be0e-1fcf-85f3-1cc4eac93e6e@xen.org>
Date: Wed, 1 Apr 2020 22:07:29 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <VI1PR04MB50569D4357FD006DF6359F50F9C90@VI1PR04MB5056.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 01/04/2020 20:58, Andrei Cherechesu wrote:
>> I cannot see any issues with the driver. Can you paste the device tree as dom0
>> sees it? You can access it from /proc/device-tree (you can convert it to dts
>> with dtc -I fs -O dts). And also the host device tree?
>>
>> We should see something like the following (this example is taken from a Xilinx
>> ZynqMP):
>>
>> 1) host device tree
>>
>>          serial@ff000000 {
>>                  u-boot,dm-pre-reloc;
>>                  compatible = "cdns,uart-r1p12", "xlnx,xuartps";
>>                  status = "okay";
>>                  interrupt-parent = <0x4>;
>>                  interrupts = <0x0 0x15 0x4>;
>>                  reg = <0x0 0xff000000 0x0 0x1000>;
>>                  clock-names = "uart_clk", "pclk";
>>                  power-domains = <0x26 0x21>;
>>                  clocks = <0x3 0x38 0x3 0x1f>;
>>                  pinctrl-names = "default";
>>                  pinctrl-0 = <0x37>;
>>                  cts-override;
>>                  device_type = "serial";
>>                  port-number = <0x0>;
>>          };
>>
>>
>> 2) dom0 device tree
>>
>>      The node is missing
>>
>>
>> The key is that dom0 should not see the UART node in device tree at all.
>>
>> If Dom0 is seeing the node, then it is a problem with Xen that somehow is not
>> hiding it (see "Skip nodes used by Xen" under
>> xen/arch/arm/domain_build.c:handle_node)
>>
>> If Dom0 is *not* seeing the node, that what is the underlying device tree node
>> that the dom0 driver is using to bring up /dev/ttyLF0?
>>
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
>      uart0:serial@401C8000 {
>          compatible = "fsl,s32-linflexuart";
>          reg = <0x0 0x401C8000 0x0 0x3000>;
>          interrupts = <0 82 1>;
>          clocks = <&clks S32GEN1_CLK_LIN_BAUD>,
>                  <&clks S32GEN1_CLK_LIN>;
>          clock-names = "lin", "ipg";
>          dmas = <&edma0 0 4>,
>                  <&edma0 0 3>;
>          dma-names = "rx", "tx";
>      };
> 
> 
> And this is the device in the Dom0 device tree:
> 
>      serial@401C8000 {
>          clock-names = "lin\0ipg";
>          interrupts = <0x00 0x52 0x01>;
>          clocks = <0x04 0x2a 0x04 0x2b>;
>          dma-names = "rx\0tx";
>          compatible = "fsl,s32-linflexuart";
>          reg = <0x00 0x401c8000 0x00 0x3000>;
>          dmas = <0x0e 0x00 0x04 0x0e 0x00 0x03>;
>      };
> 
>  From this story I figured out something else: that I was not passing to Xen's
> bootargs "console=dtuart dtuart=serial0". Maybe that's why Xen is not hiding
> the node from Dom0 (serial0 is an alias to uart0).

Xen is not going to hide the UART from dom0 if it is not used by the 
console driver.

> 
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
> (XEN)  -> got it�
> 
> I started debugging and I found out that it hangs in:
> console_init_preirq() -> __putstr(xen_banner()) -> sercon_puts() -> serial_puts() -> __serial_putc(),
> where it spins at line 178:
>          /* Synchronous finite-capacity transmitter. */
>          while ( !(n = port->driver->tx_ready(port)) )
>              cpu_relax();
>   
> Which is a bit strange, considering that my serial device is asynchronous,
> I think it should not get there. But it gets on that "else" branch because
> port->txbuf is actually NULL at line 120 when it performs the check, and
> it does not enter the branch for asynchronous transmitters.

The console is initialized much before the interrupt subsystem is 
initialized. Therefore you need synchronous support for some part of the 
boot.

Also, looking at your driver, you don't seem to call 
serial_async_transmist() in console_init_postirq() (see ns16550.c) so I 
am not sure how asynchronous would work.

Cheers,

-- 
Julien Grall

