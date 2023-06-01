Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CEF71EEED
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 18:28:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542671.846797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4l9R-0008Ot-J7; Thu, 01 Jun 2023 16:27:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542671.846797; Thu, 01 Jun 2023 16:27:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4l9R-0008Ll-GO; Thu, 01 Jun 2023 16:27:49 +0000
Received: by outflank-mailman (input) for mailman id 542671;
 Thu, 01 Jun 2023 16:27:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vl6P=BV=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1q4l9Q-0008Lf-Or
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 16:27:48 +0000
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cfaf302-0099-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 18:27:47 +0200 (CEST)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 09:27:44 -0700
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga003.jf.intel.com with ESMTP; 01 Jun 2023 09:27:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1q4l98-000SZF-0S; Thu, 01 Jun 2023 19:27:30 +0300
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
X-Inumbo-ID: 3cfaf302-0099-11ee-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685636867; x=1717172867;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Re3XUbJYE5wz7BKtwG+m2aCGFJz7ak2dDNPkBnP/kmg=;
  b=Vhg9aNMirc2ghSlR9tRGN/UnIGqJYm0CjLxYuRR+OMiS4t98RAqgbdA7
   zV+SagJcNjP3867v7FzUgVl6GEfpI8IrLBN4NPoEvZjeOMTPpEOGubz3H
   CmSeJ7vcTmEhtnwf33taHDLEaiffOtUkzoZbT7tegeABRf6vJxUeNM29k
   DcPl6cFchEj8VdgbzkPTA6wsM2bgX49aVUxTA+mh3gJul4RiN7wNQF3GH
   fbM3HlTTv7G5jp5yEDp547VkiAmgtyqN2J6heUdO7WAbj5dbVloVTdiZD
   cGDX3Pgpv5OZIQayTtdMrf2z9U9G6cf133b/Wpr3XHK4TpJoepWGd2jEj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="345169928"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="345169928"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="657859553"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="657859553"
Date: Thu, 1 Jun 2023 19:27:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	Andrew Lunn <andrew@lunn.ch>, sparclinux@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Gregory Clement <gregory.clement@bootlin.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Russell King <linux@armlinux.org.uk>, linux-acpi@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>, xen-devel@lists.xenproject.org,
	Matt Turner <mattst88@gmail.com>,
	Anatolij Gustschin <agust@denx.de>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Juergen Gross <jgross@suse.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>,
	linux-mips@vger.kernel.org,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	linux-alpha@vger.kernel.org,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCH v8 0/7] Add pci_dev_for_each_resource() helper and update
 users
Message-ID: <ZHjG8cBIdZsjhDOe@smile.fi.intel.com>
References: <ZF6YIezraETr9iNM@bhelgaas>
 <ZHZpcli2UmdzHgme@bhelgaas>
 <CAOiHx==5YWhDiZP2PyHZiJrmtqRzvqCqoSO59RwuYuR85BezBg@mail.gmail.com>
 <ZHjGik12vSFgi1eO@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHjGik12vSFgi1eO@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jun 01, 2023 at 07:25:46PM +0300, Andy Shevchenko wrote:
> On Wed, May 31, 2023 at 08:48:35PM +0200, Jonas Gorski wrote:
> > On Tue, 30 May 2023 at 23:34, Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > On Fri, May 12, 2023 at 02:48:51PM -0500, Bjorn Helgaas wrote:

...

> > > Where are we at?  Are we going to ignore this because some Coverity
> > > reports are false positives?
> > 
> > Looking at the code I understand where coverity is coming from:
> > 
> > #define __pci_dev_for_each_res0(dev, res, ...)                         \
> >        for (unsigned int __b = 0;                                      \
> >             res = pci_resource_n(dev, __b), __b < PCI_NUM_RESOURCES;   \
> >             __b++)
> > 
> >  res will be assigned before __b is checked for being less than
> > PCI_NUM_RESOURCES, making it point to behind the array at the end of
> > the last loop iteration.
> 
> Which is fine and you stumbled over the same mistake I made, that's why the
> documentation has been added to describe why the heck this macro is written
> the way it's written.
> 
> Coverity sucks.
> 
> > Rewriting the test expression as
> > 
> > __b < PCI_NUM_RESOURCES && (res = pci_resource_n(dev, __b));
> > 
> > should avoid the (coverity) warning by making use of lazy evaluation.
> 
> Obviously NAK.
> 
> > It probably makes the code slightly less performant as res will now be
> > checked for being not NULL (which will always be true), but I doubt it
> > will be significant (or in any hot paths).

Oh my god, I mistakenly read this as bus macro, sorry for my rant,
it's simply wrong.

-- 
With Best Regards,
Andy Shevchenko



