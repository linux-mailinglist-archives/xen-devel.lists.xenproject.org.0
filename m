Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BAF1EE8C7
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 18:46:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgt0W-0004zg-0U; Thu, 04 Jun 2020 16:46:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m3HA=7R=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jgt0U-0004yw-Ax
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 16:46:18 +0000
X-Inumbo-ID: e91bdb28-a682-11ea-8993-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e91bdb28-a682-11ea-8993-bc764e2007e4;
 Thu, 04 Jun 2020 16:46:17 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DE86C2072E;
 Thu,  4 Jun 2020 16:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591289177;
 bh=NELNoHY3KOTWSTuVEaCyPLnvtKoBrCrIckPS0kLq3qY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=FU9WWIpTZ0GOwcaVPjAEKey+JLvS2U2Ja2PujVG55s60/QLtvKmOlujrnfjLKHSj2
 7AHItklziaoTvlt1FTFoJAfhF6vglsFgIAlMrTqhQaEyGg9jMpuHWZxDWkR5Lu45m9
 OPx9hFZFeR2ooxo9wfyPF7oC2igMNOabxyPRnxhg=
Date: Thu, 4 Jun 2020 09:46:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
Subject: Re: [PATCH] xen/rpi4: implement watchdog-based reset
In-Reply-To: <fb58e72b-2731-9d1b-5fb1-1fc14e3ef31f@arm.com>
Message-ID: <alpine.DEB.2.21.2006040940140.6774@sstabellini-ThinkPad-T480s>
References: <20200603223156.12767-1-sstabellini@kernel.org>
 <3b3fa1cd-e50a-66f7-f5ac-eebc6f1d0953@xen.org>
 <24026a53-044b-843c-e548-22bb8325e5a7@arm.com>
 <alpine.DEB.2.21.2006040916370.6774@sstabellini-ThinkPad-T480s>
 <fb58e72b-2731-9d1b-5fb1-1fc14e3ef31f@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-237091267-1591288954=:6774"
Content-ID: <alpine.DEB.2.21.2006040942570.6774@sstabellini-ThinkPad-T480s>
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
 Julien Grall <julien@xen.org>, roman@zededa.com, tamas@tklengyel.com,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-237091267-1591288954=:6774
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2006040942571.6774@sstabellini-ThinkPad-T480s>

On Thu, 4 Jun 2020, André Przywara wrote:
> On 04/06/2020 17:24, Stefano Stabellini wrote:
> > On Thu, 4 Jun 2020, André Przywara wrote:
> >> On 04/06/2020 09:48, Julien Grall wrote:
> >>
> >> Hi,
> >>
> >>> On 03/06/2020 23:31, Stefano Stabellini wrote:
> >>>> Touching the watchdog is required to be able to reboot the board.
> >>>
> >>> In general the preferred method is PSCI. Does it mean RPI 4 doesn't
> >>> support PSCI at all?
> >>
> >> There is mainline Trusted Firmware (TF-A) support for the RPi4 for a few
> >> months now, which includes proper PSCI support (both for SMP bringup and
> >> system reset/shutdown). At least that should work, if not, it's a bug.
> >> An EDK-2 build for RPi4 bundles TF-A automatically, but you can use TF-A
> >> without it, with or without U-Boot: It works as a drop-in replacement
> >> for armstub.bin. Instruction for building it (one line!) are here:
> >> https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/tree/docs/plat/rpi4.rst
> >>
> >>>>
> >>>> The implementation is based on
> >>>> drivers/watchdog/bcm2835_wdt.c:__bcm2835_restart in Linux.
> >>>
> >>> Can you give the baseline? This would allow us to track an issue and
> >>> port them.
> >>
> >> Given the above I don't think it's a good idea to add extra platform
> >> specific code to Xen.
> > 
> > The RPi4, at least the one I have, doesn't come with any TF, and it
> 
> My RPi4 didn't come with anything, actually ;-) It's just a matter of
> what you put in the uSD card slot.
> 
> > doesn't come with PSCI in device tree.
> 
> TF-A patches the PSCI nodes in:
> https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/commit/plat/rpi/rpi4?id=f67fa69cb6937a7fc559bbec4a7acce5edefa888
> 
> > As a user, I would rather have
> > this patch (even downstream) than having to introduce TF in my build and
> > deployment just to be able to reboot.
> 
> I get your point, but would rather put more pressure on people using
> TF-A. After all you run without CPU hotplug, A72 errata workarounds and
> without Spectre/Meltdown fixes. What was the IP address of your board
> again? ;-)

Please send a pull request to remove __bcm2835_restart from the Linux
kernel, once it is removed from there I'd be happy to take it away from
Xen too ;-)

I know I am being cheeky but we have enough battles to fight and enough
problems with Xen -- I don't think we should use the hypervisor as a
leverage to get people to use or upgrade TF. We just need to get good
functionalities to our users with the less amount of friction possible.

Everything you mentioned are good reason to use TF, and this patch does
not take anything away from it. My suggestion would be to work with
raspberrypi.org to have TF installed by default by the Raspberry Pi
Imager.
--8323329-237091267-1591288954=:6774--

