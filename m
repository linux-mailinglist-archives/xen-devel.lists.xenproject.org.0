Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F2F618819
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 20:00:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437003.691314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqfRd-0008Hj-9l; Thu, 03 Nov 2022 19:00:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437003.691314; Thu, 03 Nov 2022 19:00:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqfRd-0008Cc-5c; Thu, 03 Nov 2022 19:00:05 +0000
Received: by outflank-mailman (input) for mailman id 437003;
 Thu, 03 Nov 2022 19:00:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QhFu=3D=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1oqfRb-0007xe-Tk
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 19:00:04 +0000
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b55626e1-5ba9-11ed-8fd0-01056ac49cbb;
 Thu, 03 Nov 2022 19:59:59 +0100 (CET)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2022 11:59:44 -0700
Received: from smile.fi.intel.com ([10.237.72.54])
 by FMSMGA003.fm.intel.com with ESMTP; 03 Nov 2022 11:59:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1oqfR8-006zVP-0o; Thu, 03 Nov 2022 20:59:34 +0200
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: b55626e1-5ba9-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667502000; x=1699038000;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=iDzJkwIYDgDj9s9QyYyQqMun6Fj8NrFnD6UKX0fcnAs=;
  b=XKlkx+pizdP9SQ+CvvSk+q2afZp1itWZMQrLPLAU/PLsgtFCoPBcPN0G
   DfFjQ3Qtqdvp4W0Zt7OauTxV5UOB9mIM06Ltk+6Aw2yStyVPaL5hdLjoz
   FOdJztpUPPd4cXPVn/MNkTeZpfcGTkmAn+gywxjqgxgq1ORnC1uafvPfB
   2i6dN6HP1bgBFi6OwLIhxwHDZ+yTqYHaGKwhClLbnUMDiTlQ0rnM/rM3i
   3yj056TooV6TrV+P2DxqeOKBEjnD92Z12DX+7ShWZDhGfUozUZOSK5IZT
   p59C0eHJq7EcP+4+nfCG5m/byRU6Ozh14ymbNJSjMn/LwzGnPmYnoysGL
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="307395131"
X-IronPort-AV: E=Sophos;i="5.96,135,1665471600"; 
   d="scan'208";a="307395131"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="724055696"
X-IronPort-AV: E=Sophos;i="5.96,135,1665471600"; 
   d="scan'208";a="724055696"
Date: Thu, 3 Nov 2022 20:59:33 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc: Dominik Brodowski <linux@dominikbrodowski.net>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <helgaas@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org, linux-pci@vger.kernel.org,
	xen-devel@lists.xenproject.org, Miguel Ojeda <ojeda@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH v2 4/4] pcmcia: Convert to use
 pci_bus_for_each_resource_p()
Message-ID: <Y2QPlZ0mhLvKw7X5@smile.fi.intel.com>
References: <20221103164644.70554-1-andriy.shevchenko@linux.intel.com>
 <20221103164644.70554-5-andriy.shevchenko@linux.intel.com>
 <Y2P0XCNJvTVuziO7@owl.dominikbrodowski.net>
 <Y2P2ja26ikNecTsv@smile.fi.intel.com>
 <Y2QImB0OLakzz1+F@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y2QImB0OLakzz1+F@rocinante>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 04, 2022 at 03:29:44AM +0900, Krzysztof Wilczyński wrote:

> > > > -
> > > > -	for (i = 0; i < PCI_BRIDGE_RESOURCE_NUM; i++) {
> > > > -		res = s->cb_dev->bus->resource[i];
> > > > -#else
> > > > -	pci_bus_for_each_resource(s->cb_dev->bus, res, i) {
> > > >  #endif
> > > > +
> > > > +	pci_bus_for_each_resource_p(s->cb_dev->bus, res) {
> > > >  		if (!res)
> > > >  			continue;
> > > 
> > > Doesn't this remove the proper iterator for X86? Even if that is the right
> > > thing to do, it needs an explict explanation.
> > 
> > I dunno what was in 2010, but reading code now I have found no differences in
> > the logic on how resources are being iterated in these two pieces of code.
> 
> This code is over a decade old (13 years old to be precise) and there was
> something odd between Bjorn's and Jesse's patches, as per:
> 
>   89a74ecccd1f ("PCI: add pci_bus_for_each_resource(), remove direct bus->resource[] refs")
>   cf26e8dc4194 ("pcmcia: do not autoadd root PCI bus resources")

Yeah, thanks for pointing out to the other patch from the same 2010 year.
It seems the code was completely identical that time, now it uses more
sophisticated way of getting bus resources, but it's kept the same for
the resources under PCI_BRIDGE_RESOURCE_NUM threshold.

> > But fine, I will add a line to a commit message about this change.
> 
> I wouldn't, personally.  The change you are proposing is self-explanatory
> and somewhat in-line with what is there already - unless I am also reading
> the current implementation wrong.

But it wouldn't be harmful either.

> That said, Dominik is the maintainer of PCMCIA driver, so his is the last
> word, so to speak. :)
> 
> > Considering this is done, can you issue your conditional tag so I will
> > incorporate it in v3?
> 
> No need, really.  Again, unless Dominik thinks otherwise.

I think that what is wanted to have to get his tag.

Thanks for review, both of you, guys!

-- 
With Best Regards,
Andy Shevchenko



