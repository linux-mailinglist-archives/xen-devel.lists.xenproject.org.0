Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7171EE8E6
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 18:53:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgt7M-00065k-Bg; Thu, 04 Jun 2020 16:53:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m3HA=7R=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jgt7L-00065f-Dj
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 16:53:23 +0000
X-Inumbo-ID: e68bb918-a683-11ea-8993-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e68bb918-a683-11ea-8993-bc764e2007e4;
 Thu, 04 Jun 2020 16:53:23 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1F70B20738;
 Thu,  4 Jun 2020 16:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591289602;
 bh=tTXrQF+jYnTBgxstYZvDBZo9b/K5xAO5D8pKbn9pQJ4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=qNur6mP9jZ8+lL+lkGJPy9naOxXwVADfri3ZZ/4BC2lF16sAnPTQ38qeu+oHfKNOV
 4g+nKA0LCPcYYKOikp8EkaJpXmatx6+A4JoXd1msKANJc3Xho8ZmcXpEhLulAopGeQ
 lkLxpAXBmI8gACDGIRZk0jVmGUprfkle8UyxiP/M=
Date: Thu, 4 Jun 2020 09:53:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/rpi4: implement watchdog-based reset
In-Reply-To: <eed1064a-da3b-7c7c-7a1a-2e339db089cf@xen.org>
Message-ID: <alpine.DEB.2.21.2006040946250.6774@sstabellini-ThinkPad-T480s>
References: <20200603223156.12767-1-sstabellini@kernel.org>
 <3b3fa1cd-e50a-66f7-f5ac-eebc6f1d0953@xen.org>
 <24026a53-044b-843c-e548-22bb8325e5a7@arm.com>
 <alpine.DEB.2.21.2006040916370.6774@sstabellini-ThinkPad-T480s>
 <eed1064a-da3b-7c7c-7a1a-2e339db089cf@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1078383510-1591289602=:6774"
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
Cc: cminyard@mvista.com, Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>, roman@zededa.com,
 tamas@tklengyel.com, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1078383510-1591289602=:6774
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 4 Jun 2020, Julien Grall wrote:
> Hi,
> 
> On 04/06/2020 17:24, Stefano Stabellini wrote:
> > On Thu, 4 Jun 2020, André Przywara wrote:
> > > On 04/06/2020 09:48, Julien Grall wrote:
> > > 
> > > Hi,
> > > 
> > > > On 03/06/2020 23:31, Stefano Stabellini wrote:
> > > > > Touching the watchdog is required to be able to reboot the board.
> > > > 
> > > > In general the preferred method is PSCI. Does it mean RPI 4 doesn't
> > > > support PSCI at all?
> > > 
> > > There is mainline Trusted Firmware (TF-A) support for the RPi4 for a few
> > > months now, which includes proper PSCI support (both for SMP bringup and
> > > system reset/shutdown). At least that should work, if not, it's a bug.
> > > An EDK-2 build for RPi4 bundles TF-A automatically, but you can use TF-A
> > > without it, with or without U-Boot: It works as a drop-in replacement
> > > for armstub.bin. Instruction for building it (one line!) are here:
> > > https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/tree/docs/plat/rpi4.rst
> > > 
> > > > > 
> > > > > The implementation is based on
> > > > > drivers/watchdog/bcm2835_wdt.c:__bcm2835_restart in Linux.
> > > > 
> > > > Can you give the baseline? This would allow us to track an issue and
> > > > port them.
> > > 
> > > Given the above I don't think it's a good idea to add extra platform
> > > specific code to Xen.
> > 
> > The RPi4, at least the one I have, doesn't come with any TF, and it
> > doesn't come with PSCI in device tree. As a user, I would rather have
> > this patch (even downstream) than having to introduce TF in my build and
> > deployment just to be able to reboot.
> 
> So what are you using for the firmware? Do you boot Xen directly?

The raspberry pi comes with its own firmware/bootloader. It is possible
to boot Linux from it directly, that's how it comes configured by
default.

For Xen, I am booting uboot from the RPi bootloader first, mostly
because uboot is very convenient and adds tftp support which I use to
load Xen and Linux. (I think it would be possible to boot Xen directly
from the RPi firmware/bootloader but it would probably require some work
to get dom0 to load too.)
--8323329-1078383510-1591289602=:6774--

