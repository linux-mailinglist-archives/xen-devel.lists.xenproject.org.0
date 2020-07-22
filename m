Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C84229B60
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 17:29:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyGgF-00055Y-1w; Wed, 22 Jul 2020 15:29:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bhkO=BB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jyGgE-00055T-DJ
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 15:29:14 +0000
X-Inumbo-ID: 18996172-cc30-11ea-8679-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18996172-cc30-11ea-8679-bc764e2007e4;
 Wed, 22 Jul 2020 15:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595431753;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=fUXTGdT3jYCDdHtQHnKQ7lAjSUZB0Kbp4aNUH2MgNvg=;
 b=cXDT29ZH1j6nlZNmGVoCQhHk1akbbkMaIlQTzoLHOpsCUaP9FRLbL8uC
 jljXtJ0jEac2Qp7Rz9q6/Oo33iZr4f2fWzTr+48vJeRSklK68UoF6VahX
 Dk2Pi2Rz7hln1LzT4ePAkCmx7stVV3xV8Nmkrh+68MBkH0ye+Sn7eenzu k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: tj7FnE76nwyjkNHNvDGhg9FUx3ZCH2j3UR70ozDh3ERe4jA0AqkXMyukwhajfoCLbkjFth+pvO
 zx7o8At4ERfr7cCHnAf/cwq+DqcsaGOYNyZ4F1bmw9Y735xyHXqMhctPqvAc6HohAl+AQCMfLT
 llNpcf9Ahi4emw8NQydokfB4fxDyDIeG16yeh6ICgGWZn2kDNfxpNJTGsEAykaPOxgssvxv7k5
 Jn0hswRa4lxkP1JdEacbpqETi6N3j3+7pt+lu4ES98Xwme9pAdWLJYrcu3ARpIo8WMv/5PGRp6
 kC0=
X-SBRS: 2.7
X-MesageID: 23150283
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,383,1589256000"; d="scan'208";a="23150283"
Date: Wed, 22 Jul 2020 17:29:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [osstest PATCH] dom0pvh: assign 1GB of memory to PVH dom0
Message-ID: <20200722152906.GZ7191@Air-de-Roger>
References: <20200722150416.36426-1-roger.pau@citrix.com>
 <24344.22297.957336.615021@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24344.22297.957336.615021@mariner.uk.xensource.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 22, 2020 at 04:11:21PM +0100, Ian Jackson wrote:
> Roger Pau Monne writes ("[osstest PATCH] dom0pvh: assign 1GB of memory to PVH dom0"):
> > Current tests use 512MB of memory for dom0, but that's too low for a
> > PVH dom0 on some hosts and will cause errors because memory is
> > ballooned out in order to obtain physical memory ranges to map foreign
> > pages.
> > 
> > Using ballooned out pages for foreign mappings also doesn't seem to
> > work properly with the current Linux kernel version, so increase the
> > memory assigned to dom0 to 1GB for PVH dom0 tests. We should see about
> > reverting this when using ballooned pages is fixed.
> > 
> > The runvar diff is:
> > 
> > +test-amd64-amd64-dom0pvh-xl-amd   dom0_mem 1024
> > +test-amd64-amd64-dom0pvh-xl-intel dom0_mem 1024
> > 
> > I've done a repro of the failed test on elbling0 with dom0_mem set to
> > 1GB and it seems to prevent the issue, the flight is 152111.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
> 
> And queued.

Thanks! Forgot to add that I've checked x86 hosts and they all have at
least 8GB of RAM, so using 1GB for dom0 should be fine, as I don't
think osstest runs guests close to 7GB of RAM.

Roger.

