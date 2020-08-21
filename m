Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C6C24C997
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 03:39:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8w1I-0006kq-Q4; Fri, 21 Aug 2020 01:39:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0g3v=B7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k8w1H-0006ki-HW
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 01:39:03 +0000
X-Inumbo-ID: ddc6133a-1561-4772-a440-6532342b9d31
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ddc6133a-1561-4772-a440-6532342b9d31;
 Fri, 21 Aug 2020 01:39:02 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 03FF92075E;
 Fri, 21 Aug 2020 01:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597973942;
 bh=I0+iqwmXz5st+fplCzQpAejA2Wr4HUXMe+fQl8MoSxc=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=S+yiPB2mSYeDSYV2tVcQ9VBwUGnUa5tz5XRboZ8rusm+/ti3W4JLQZtE0By0qzlM9
 4HgMIGlskp7zsrWEBvW+4VcQl7jJtzezDEKf+j7/7UTZv1omtAZyuMtDydTq0+1UTX
 okDrUkF9T3jpW/QPqsNFUvr2g+n5yi4fv0V1kUF8=
Date: Thu, 20 Aug 2020 18:39:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Roman Shaposhnik <roman@zededa.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, 
 Jan Beulich <jbeulich@suse.com>, sstabellini@kernel.org
Subject: Re: Xen 4.14.0 is busted on Dell 300x IoT Gateways
In-Reply-To: <CAMmSBy9-cJuxC0jLPh6O-UCraThzg2wvNO29ZvxrBmVkatt_sg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2008201823050.6005@sstabellini-ThinkPad-T480s>
References: <CAMmSBy9-cJuxC0jLPh6O-UCraThzg2wvNO29ZvxrBmVkatt_sg@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1654727271-1597973251=:6005"
Content-ID: <alpine.DEB.2.21.2008201827350.6005@sstabellini-ThinkPad-T480s>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1654727271-1597973251=:6005
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2008201827351.6005@sstabellini-ThinkPad-T480s>

On Tue, 18 Aug 2020, Roman Shaposhnik wrote:
> Hi!
> first things first -- booting on those devices have always
> required efi=no-rs -- but it seems that Xen 4.14 is now 
> busted at a more fundamental level. I'm attaching two
> boot sequences (one with kernel 4.19.5 and one with 5.4.51)
> in the hopes that this may provide some clues right away.
> 
> Any help would be greatly appreciated!
> 
> Oh, and finally it appears that this is NOT a regression from
> Xen 4.13 -- it fails the same way. I haven't tried Xen's earlier
> than that.

FYI Roman and I tracked down the issue and it is due to the gpio
controller driver (drivers/pinctrl/intel/pinctrl-baytrail.c) overwriting
the interrupt handler data used by Xen to store the irq_data structure.

I have a very small tentative workaround, see below. It allows the
kernel to boot successfully as dom0 and gpio writes work. I am still
thinking on how to fix the issue properly in an upstreamable way, but I
wanted to send this out to the list right away in case somebody else is
stuck on this problem.


diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index f38d596efa05..acd28a9e6a8a 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1604,8 +1604,8 @@ static struct irq_chip byt_irqchip = {
 static void byt_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct irq_data *data = irq_desc_get_irq_data(desc);
-	struct byt_gpio *vg = gpiochip_get_data(
-				irq_desc_get_handler_data(desc));
+	struct gpio_chip *gc = irq_desc_get_chip_data(desc);
+	struct byt_gpio *vg = (struct byt_gpio *)gc;
 	struct irq_chip *chip = irq_data_get_irq_chip(data);
 	u32 base, pin;
 	void __iomem *reg;
diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index a2b3d9de999c..b9551fb41ed1 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -1003,7 +1003,8 @@ irq_set_chained_handler_and_data(unsigned int irq, irq_flow_handler_t handle,
 	if (!desc)
 		return;
 
-	desc->irq_common_data.handler_data = data;
+	if (!desc->irq_common_data.handler_data)
+		desc->irq_common_data.handler_data = data;
 	__irq_do_set_handler(desc, handle, 1, NULL);
 
 	irq_put_desc_busunlock(desc, flags);
--8323329-1654727271-1597973251=:6005--

