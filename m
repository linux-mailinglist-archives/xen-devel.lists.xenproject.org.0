Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A572D6C6AF9
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 15:30:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513917.795673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfLxb-0001cq-JM; Thu, 23 Mar 2023 14:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513917.795673; Thu, 23 Mar 2023 14:30:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfLxb-0001ad-GA; Thu, 23 Mar 2023 14:30:35 +0000
Received: by outflank-mailman (input) for mailman id 513917;
 Thu, 23 Mar 2023 14:30:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JuTy=7P=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1pfLxa-0001I6-1J
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 14:30:34 +0000
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3eb215dc-c987-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 15:30:24 +0100 (CET)
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 07:30:16 -0700
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga007.fm.intel.com with ESMTP; 23 Mar 2023 07:30:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pfLx3-007XTh-2N; Thu, 23 Mar 2023 16:30:01 +0200
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
X-Inumbo-ID: 3eb215dc-c987-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679581829; x=1711117829;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yycxH1AeGogQsiHx6KGAN/nQ6jWFX888/jtMkSYZfjo=;
  b=aBlffK7+gwyTBYiUWdtcY4ugy+rIuiP52gN1Kif/EnUXjoOnG/K4KAR/
   cjuNDhEdcI4cUjs9rq2+Og10tK42lkhv1i0QFdOL4kdZniEqhfs7raCez
   0OgmvOvg3ZHzAkBAbieXKefcc/MECL3F2hNi3VrgUk/byDXSDkh01AYYI
   sXxO7YZ/UI2oGwNk1XNA68QWliQXRP3S8J9tbzi3dVZqNzOZauxgbeeb/
   sdgHM0g6EbrSKIo+9vZSKljJHVmm0rAT2wJLDBWMqFJr94x08XEXEjgPV
   DelHIp1hdQdkHE4jtXhKFkKaMwTSCM6mqzQRy6LF/bB1Vcfm4GCaP/ypM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="367241188"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="367241188"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="684752720"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="684752720"
Date: Thu, 23 Mar 2023 16:30:01 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Juergen Gross <jgross@suse.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-pci@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Anatolij Gustschin <agust@denx.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH v6 1/4] PCI: Introduce pci_dev_for_each_resource()
Message-ID: <ZBxiaflGTeK8Jlgx@smile.fi.intel.com>
References: <20230320131633.61680-2-andriy.shevchenko@linux.intel.com>
 <20230322192804.GA2485349@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322192804.GA2485349@bhelgaas>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Mar 22, 2023 at 02:28:04PM -0500, Bjorn Helgaas wrote:
> On Mon, Mar 20, 2023 at 03:16:30PM +0200, Andy Shevchenko wrote:

...

> > +	pci_dev_for_each_resource_p(dev, r) {
> >  		/* zap the 2nd function of the winbond chip */
> > -		if (dev->resource[i].flags & IORESOURCE_IO
> > -		    && dev->bus->number == 0 && dev->devfn == 0x81)
> > -			dev->resource[i].flags &= ~IORESOURCE_IO;
> > -		if (dev->resource[i].start == 0 && dev->resource[i].end) {
> > -			dev->resource[i].flags = 0;
> > -			dev->resource[i].end = 0;
> > +		if (dev->bus->number == 0 && dev->devfn == 0x81 &&
> > +		    r->flags & IORESOURCE_IO)
> 
> This is a nice literal conversion, but it's kind of lame to test
> bus->number and devfn *inside* the loop here, since they can't change
> inside the loop.

Hmm... why are you asking me, even if I may agree on that? It's
in the original code and out of scope of this series.

> > +			r->flags &= ~IORESOURCE_IO;
> > +		if (r->start == 0 && r->end) {
> > +			r->flags = 0;
> > +			r->end = 0;
> >  		}
> >  	}

...

> >  #define pci_resource_len(dev,bar) \
> >  	((pci_resource_end((dev), (bar)) == 0) ? 0 :	\
> >  							\
> > -	 (pci_resource_end((dev), (bar)) -		\
> > -	  pci_resource_start((dev), (bar)) + 1))
> > +	 resource_size(pci_resource_n((dev), (bar))))
> 
> I like this change, but it's unrelated to pci_dev_for_each_resource()
> and unmentioned in the commit log.

And as you rightfully noticed this either. I can split it to a separate one.

...

> > +#define __pci_dev_for_each_resource(dev, res, __i, vartype)		\
> > +	for (vartype __i = 0;						\
> > +	     res = pci_resource_n(dev, __i), __i < PCI_NUM_RESOURCES;	\
> > +	     __i++)
> > +
> > +#define pci_dev_for_each_resource(dev, res, i)				\
> > +       __pci_dev_for_each_resource(dev, res, i, )
> > +
> > +#define pci_dev_for_each_resource_p(dev, res)				\
> > +	__pci_dev_for_each_resource(dev, res, __i, unsigned int)
> 
> This series converts many cases to drop the iterator variable ("i"),
> which is fantastic.
> 
> Several of the remaining places need the iterator variable only to
> call pci_claim_resource(), which could be converted to take a "struct
> resource *" directly without much trouble.
> 
> We don't have to do that pci_claim_resource() conversion now,

Exactly, it's definitely should be separate change.

> but
> since we're converging on the "(dev, res)" style, I think we should
> reverse the names so we have something like:
> 
>   pci_dev_for_each_resource(dev, res)
>   pci_dev_for_each_resource_idx(dev, res, i)

Wouldn't it be more churn, including pci_bus_for_each_resource() correction?

...

> Not sure __pci_dev_for_each_resource() is worthwhile since it only
> avoids repeating that single "for" statement, and passing in "vartype"
> (sometimes empty to implicitly avoid the declaration) is a little
> complicated to read.  I think it'd be easier to read like this:

No objections here.

>   #define pci_dev_for_each_resource(dev, res)                      \
>     for (unsigned int __i = 0;                                     \
>          res = pci_resource_n(dev, __i), __i < PCI_NUM_RESOURCES;  \
>          __i++)
> 
>   #define pci_dev_for_each_resource_idx(dev, res, idx)             \
>     for (idx = 0;                                                  \
>          res = pci_resource_n(dev, idx), idx < PCI_NUM_RESOURCES;  \
>          idx++)

-- 
With Best Regards,
Andy Shevchenko



