Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA321EE3CC
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 13:59:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgoWh-0000GR-M4; Thu, 04 Jun 2020 11:59:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cgp2=7R=mvista.com=cminyard@srs-us1.protection.inumbo.net>)
 id 1jgoWg-0000GE-0x
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 11:59:14 +0000
X-Inumbo-ID: ccdd0e1e-a65a-11ea-9947-bc764e2007e4
Received: from mail-oi1-x243.google.com (unknown [2607:f8b0:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ccdd0e1e-a65a-11ea-9947-bc764e2007e4;
 Thu, 04 Jun 2020 11:59:10 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id j189so4799463oih.10
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2020 04:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MP+MSIIv1u5nMjP12qFOOqmxhDupPPSuAsiS0Q7kPh8=;
 b=KPoKu+QjsSf/3CVTmbiW61qyvxa7L+kfeCuQwJ7CXjFHy6Jrb8LGGHLeqYrfju3vBG
 L76jKx9fpWPIj8bZnoWTlmwf6zKlo+I8hOYjD+KpPevMKiwD3lTqoTpJE/QGiHqvEQSv
 Lc27GYfLqWo3oqXL7fFIB5xn8NQVBddMcyDJ5/57eltI7wFCk2FJcf88HsGxeQjc97PK
 9kCN0T2nwIIzSeVvhfHskZ1REDJ/mYOSE0qJNHDjRWIWyyDxxcW1r0dMTW4jy98qkx5T
 Ss+BIHPRFQSH38zquhl2xOWJe/zj9S0zw+sCw/ptRGBBAvGV+WmAZwqnTP0lmIc+YmPI
 6jSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=MP+MSIIv1u5nMjP12qFOOqmxhDupPPSuAsiS0Q7kPh8=;
 b=sl6RFw29NsZe67XLHtHdrMRYfMjdBDao0pWbE8g84FTCkMAeic1AeRaEU0desGvht1
 3aSj/SBLark+kKZK7ioq+n3wO0/PB6wJzKJc9jk0tE/Qgy3j29RPm7JTk8FmRJwHrxoK
 9lXv+LtBfWtGNsy5P7AVBMicM0Po6o7H9aFwKN4gIeTNXP/5/ugMwnshyyqOethYXmQ3
 DyZgSqT+nl7kprdopl0+/Vq9wqvmE7RQtuTXC42OaO3Uy/fRbRFTeYXF/rJ8IVTxTM1Q
 Jea5aN2OJejVEKdz4cM3f9jPaUsboUTdAaPjuWoqmmthbqy9f/XfLUNrXHzBREGKE2Pw
 tFVg==
X-Gm-Message-State: AOAM5301jAPkKnF64C1/lZ0gHNidLDq+6u4yF7v7VEZfJOWksturN5vv
 K5wX6kxtK1iSDYdBsxG46mK9eEj0IEo=
X-Google-Smtp-Source: ABdhPJz69RfwEVipNTi6DzGS/HAU+oavhlaLxYHsKLyUUrMcde30wMQgCwHOLB4sDkS4PgZ/lk+1OQ==
X-Received: by 2002:aca:d583:: with SMTP id m125mr2821909oig.138.1591271949814; 
 Thu, 04 Jun 2020 04:59:09 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:9d35:f7bd:647:6545])
 by smtp.gmail.com with ESMTPSA id j2sm1059292otk.61.2020.06.04.04.59.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 04 Jun 2020 04:59:09 -0700 (PDT)
Date: Thu, 4 Jun 2020 06:59:07 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/rpi4: implement watchdog-based reset
Message-ID: <20200604115907.GD2903@minyard.net>
References: <20200603223156.12767-1-sstabellini@kernel.org>
 <20200604001552.GC2903@minyard.net>
 <50ad4bca-5eb8-8db0-0aae-dc7febfdb56a@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50ad4bca-5eb8-8db0-0aae-dc7febfdb56a@xen.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: cminyard@mvista.com
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 tamas@tklengyel.com, roman@zededa.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jun 04, 2020 at 09:15:33AM +0100, Julien Grall wrote:
> Hi,
> 
> On 04/06/2020 01:15, Corey Minyard wrote:
> > On Wed, Jun 03, 2020 at 03:31:56PM -0700, Stefano Stabellini wrote:
> > > Touching the watchdog is required to be able to reboot the board.
> > > 
> > > The implementation is based on
> > > drivers/watchdog/bcm2835_wdt.c:__bcm2835_restart in Linux.
> > 
> > Ah, I was looking at this just today, as it had been annoying me
> > greatly.  This works for me, so:
> > 
> > Tested-by: Corey Minyard <cminyard@mvista.com>
> > 
> > However, I was wondering if it might be better to handle this by failing
> > the operation in xen and passing it back to dom0 to do.  On the Pi you
> > send a firmware message to reboot, and that seems like too much to do in
> > Xen, but it would seem possible to send this back to dom0.
> I don't think this is possible in the current setup. Xen will usually
> restart the platform if Dom0 requested a clean reboot or crashed. So the
> domain wouldn't be in state to service such call.

Ok, I hadn't looked at Xen yet, I didn't know how much shutdown of dom0
happens on a reset.

> 
> > Just a
> > thought, as it might be a more general fix for other devices in the same
> > situation.
> 
> What are the devices you have in mind?

Nothing in particular, but other systems might have the same issue.  I
guess you have ACPI implemented on x86 already.  It just seemed that
Linux already has to be able to do this, and passing the buck back there
might be a more general solution.

Thanks,

-corey

> 
> Cheers,
> 
> -- 
> Julien Grall

