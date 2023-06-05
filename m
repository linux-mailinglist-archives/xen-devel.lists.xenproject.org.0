Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A81D3722844
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 16:08:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543733.848949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6AsJ-0000rJ-4w; Mon, 05 Jun 2023 14:07:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543733.848949; Mon, 05 Jun 2023 14:07:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6AsJ-0000od-0p; Mon, 05 Jun 2023 14:07:59 +0000
Received: by outflank-mailman (input) for mailman id 543733;
 Mon, 05 Jun 2023 14:07:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bDA2=BZ=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1q6AsH-0000oX-Ux
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 14:07:58 +0000
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c14ed8c-03aa-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 16:07:53 +0200 (CEST)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 07:04:20 -0700
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga005.jf.intel.com with ESMTP; 05 Jun 2023 07:04:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1q6AoX-001O9h-1D; Mon, 05 Jun 2023 17:04:05 +0300
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
X-Inumbo-ID: 5c14ed8c-03aa-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685974074; x=1717510074;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zjA9XYetqLmj2er7YOpXmYqZcR8z8Fh+g5Flt9xdytk=;
  b=V1qpbe5GCXcEd+WXHjE2Ec4+yeFaghq8tJf9dtaC3jkyU3cCzaltWhl/
   0yBrMSrDL6PrLWPfMkwu8ZQIJlzqliPZE5xKanBO+8dzTb8l7sM4c4FdX
   2P1sbRmKVO54MnkxedJW4W/mSeBPHkKvg3RSv1pCF+reZqNb8BhkjOvMT
   FOsFncTrSHbTEmQrs79O7ZFmG4OMncKlgBIRFpp3CrFSOC6wEYtYSlDYP
   nwG871Y1qA7zQorEVJvOE7xdEhFlaKqY0DXjK/GInYwtgPxHoNjZDFw0V
   s2CHloMK1bWA8cvcvXBOh/F0Wb4hg46X5NHVJRNj0VQlnmDjZPhpB77Gv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="335993907"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="335993907"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="882915325"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="882915325"
Date: Mon, 5 Jun 2023 17:04:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Jonas Gorski <jonas.gorski@gmail.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
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
Message-ID: <ZH3rVcSr+m8DHmo9@smile.fi.intel.com>
References: <CAOiHx==5YWhDiZP2PyHZiJrmtqRzvqCqoSO59RwuYuR85BezBg@mail.gmail.com>
 <ZHe8dKb3f392MfBO@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHe8dKb3f392MfBO@bhelgaas>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 31, 2023 at 04:30:28PM -0500, Bjorn Helgaas wrote:
> On Wed, May 31, 2023 at 08:48:35PM +0200, Jonas Gorski wrote:

...

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
> > 
> > Rewriting the test expression as
> > 
> > __b < PCI_NUM_RESOURCES && (res = pci_resource_n(dev, __b));
> > 
> > should avoid the (coverity) warning by making use of lazy evaluation.
> > 
> > It probably makes the code slightly less performant as res will now be
> > checked for being not NULL (which will always be true), but I doubt it
> > will be significant (or in any hot paths).
> 
> Thanks a lot for looking into this!  I think you're right, and I think
> the rewritten expression is more logical as well.  Do you want to post
> a patch for it?

Gimme some time, I was on a long leave and now it's a pile to handle.

-- 
With Best Regards,
Andy Shevchenko



