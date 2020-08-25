Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1312250FDB
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 05:15:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAPQF-0005cf-1d; Tue, 25 Aug 2020 03:14:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vZfe=CD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kAPQD-0005ca-MB
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 03:14:53 +0000
X-Inumbo-ID: db23e234-b44d-45ee-a92e-1ed4b76c5007
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id db23e234-b44d-45ee-a92e-1ed4b76c5007;
 Tue, 25 Aug 2020 03:14:52 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B8A3320665;
 Tue, 25 Aug 2020 03:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598325292;
 bh=0vBp4c2WCXewnJlYhmqaaydlgXEBhN1A41m2kE+d0XQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=EUkadBuMdiBwu1dz1ds6F6QzXtjrTj6t7lDxaWeqGPvR0BdRtu9sU8+NrxRR+yvud
 pZILkM0dFn8km8iE5abwtEktJ6rbGjXEGbWCOC6+x/Mk210YDzIsJ4gHGhcWS6t/9X
 D9sn/F6Jl40Hw3n/43BqaxHMYzNhw5CnDcFCAgAM=
Date: Mon, 24 Aug 2020 20:14:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Thomas Gleixner <tglx@linutronix.de>
cc: =?UTF-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>, 
 Sergei Temerkhanov <s.temerkhanov@gmail.com>, 
 xen-devel@lists.xenproject.org, sstabellini@kernel.org
Subject: Re: [PATCH 0/2] Xen: Use a dedicated pointer for IRQ data
In-Reply-To: <871rjzsqyy.fsf@nanos.tec.linutronix.de>
Message-ID: <alpine.DEB.2.21.2008241959510.24407@sstabellini-ThinkPad-T480s>
References: <CAMmSBy9-cJuxC0jLPh6O-UCraThzg2wvNO29ZvxrBmVkatt_sg@mail.gmail.com>
 <20200821071547.18894-1-s.temerkhanov@gmail.com>
 <ccc1883f-876f-c1ea-bd68-b3c8ab267a8f@suse.com>
 <CAPEA6dYXaw=ZYv1jJqK=8twVpKXQ8bG0erABKC6HiQh-DcZ-DQ@mail.gmail.com>
 <b2917f59-d101-659d-1704-8d2a294bb2a1@suse.com>
 <871rjzsqyy.fsf@nanos.tec.linutronix.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-2135963732-1598324518=:24407"
Content-ID: <alpine.DEB.2.21.2008242002560.24407@sstabellini-ThinkPad-T480s>
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

--8323329-2135963732-1598324518=:24407
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2008242002561.24407@sstabellini-ThinkPad-T480s>

On Fri, 21 Aug 2020, Thomas Gleixner wrote:
> On Fri, Aug 21 2020 at 14:17, Jürgen Groß wrote:
> > On 21.08.20 13:19, Sergei Temerkhanov wrote:
> >>> Did you see any specific problem where handler_data is written by
> >> another component?
> >> 
> >> I've posted this series in the thread
> >> https://lists.xenproject.org/archives/html/xen-devel/2020-08/msg00957.html
> >> where the problem is caused exactly by that behavior
> >> 
> >>> In case this is a real problem I don't think your approach will be accepted
> >> Any comments/suggestions are welcome
> >
> > Not sure if the IRQ maintainers agree with me, but I would add
> > a set_handler_data and get_handler_data function pointer to
> > struct irq_chip. If those are set I'd call them for writing/reading
> > handler_data instead doing it directly. Xen could then specify those
> > and add a field to its own handler data struct for storing the data
> > of the driver coming later.
> >
> > Xen would need another accessor function for its own primary data,
> > of course.
> >
> > Adding the IRQ maintainer as he might have an opinion here. :-)
> 
> Without seeing the patches, and no I'm not going to grab them from a web
> archive, I'd say they are wrong :)
> 
> Fiddling in irqchip is wrong to begin with.
> 
> int irq_set_handler_data(unsigned int irq, void *data);
> static inline void *irq_get_handler_data(unsigned int irq)
> static inline void *irq_data_get_irq_handler_data(struct irq_data *d)
> 
> are accessors to handler_data. Am I missing something?

Hi Thomas,

I think Juergen's suggestion was to use function pointers as accessors.


The underlying problem is that both Xen and GPIO want to use
handler_data.

Xen comes first and uses handler_data to handle Xen events
(drivers/xen/events/events_base.c:xen_irq_init).

Then, the GPIO driver probe function
(drivers/pinctrl/intel/pinctrl-baytrail.c:byt_gpio_probe) calls
gpiochip_set_chained_irqchip, which eventually calls
irq_set_chained_handler_and_data, overwriting handler_data without
checks.


Juergen's suggestion is to replace irq_set_handler_data and
irq_get_handler_data with function pointers.

Xen could install its own irq_set_handler_data and irq_get_handler_data
functions. The Xen implementation would take care of saving other
handler_data pointers on request: when the GPIO driver calls
irq_set_chained_handler_and_data it would end up calling the Xen
implementation of the set_handler_data function that would store the
GPIO pointer in a Xen struct somewhere.
--8323329-2135963732-1598324518=:24407--

