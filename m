Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAB071EEE1
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 18:27:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542666.846788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4l7v-0007mj-5E; Thu, 01 Jun 2023 16:26:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542666.846788; Thu, 01 Jun 2023 16:26:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4l7v-0007l0-21; Thu, 01 Jun 2023 16:26:15 +0000
Received: by outflank-mailman (input) for mailman id 542666;
 Thu, 01 Jun 2023 16:26:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vl6P=BV=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1q4l7t-0007ku-Ae
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 16:26:13 +0000
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffb6f3e3-0098-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 18:26:03 +0200 (CEST)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 09:26:00 -0700
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga001.jf.intel.com with ESMTP; 01 Jun 2023 09:25:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1q4l7S-000SYH-2G; Thu, 01 Jun 2023 19:25:46 +0300
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
X-Inumbo-ID: ffb6f3e3-0098-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685636764; x=1717172764;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q1NNNfNs1qkINp4+7F0o+S22gLPh78FVwhQOR7EmNDk=;
  b=A650K9DDlM7WKsXZBUfBswm99ZyRhlvbRXT3+irw74KBNDtJWSEUHG4W
   OE7gWS6+F1yJ6nge2hhrT3+Cr5zOEW36gr6vPKaNa1sxhLaAoNWyVt+0M
   8rz+72PUT/+uX6UZGvlI8sO3ZCNFKbsckV81Nd87ZMil1fenkiMlDRXHd
   nto/1LJ2mE/QnazX9t0ZHLQub3zNZt8hcwbwJe0Sq1tjn4t0NyOesAnqL
   G4Qg9Q+wZLejsyQxnBQHHN/i0fWTMuSeH40gtqdRniBKqs/8FOviZNiQ5
   zJcioT6nN2n1tiDhxPrTa8Ec48Ukn/jwEstGeDLQCEFJ/KUiYtExuvEPq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="353103087"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="353103087"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="740424758"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="740424758"
Date: Thu, 1 Jun 2023 19:25:46 +0300
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
Message-ID: <ZHjGik12vSFgi1eO@smile.fi.intel.com>
References: <ZF6YIezraETr9iNM@bhelgaas>
 <ZHZpcli2UmdzHgme@bhelgaas>
 <CAOiHx==5YWhDiZP2PyHZiJrmtqRzvqCqoSO59RwuYuR85BezBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOiHx==5YWhDiZP2PyHZiJrmtqRzvqCqoSO59RwuYuR85BezBg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 31, 2023 at 08:48:35PM +0200, Jonas Gorski wrote:
> On Tue, 30 May 2023 at 23:34, Bjorn Helgaas <helgaas@kernel.org> wrote:
> > On Fri, May 12, 2023 at 02:48:51PM -0500, Bjorn Helgaas wrote:
> > > On Fri, May 12, 2023 at 01:56:29PM +0300, Andy Shevchenko wrote:
> > > > On Tue, May 09, 2023 at 01:21:22PM -0500, Bjorn Helgaas wrote:
> > > > > On Tue, Apr 04, 2023 at 11:11:01AM -0500, Bjorn Helgaas wrote:
> > > > > > On Thu, Mar 30, 2023 at 07:24:27PM +0300, Andy Shevchenko wrote:
> > > > > > > Provide two new helper macros to iterate over PCI device resources and
> > > > > > > convert users.
> > > > >
> > > > > > Applied 2-7 to pci/resource for v6.4, thanks, I really like this!
> > > > >
> > > > > This is 09cc90063240 ("PCI: Introduce pci_dev_for_each_resource()")
> > > > > upstream now.
> > > > >
> > > > > Coverity complains about each use,
> > > >
> > > > It needs more clarification here. Use of reduced variant of the
> > > > macro or all of them? If the former one, then I can speculate that
> > > > Coverity (famous for false positives) simply doesn't understand `for
> > > > (type var; var ...)` code.
> > >
> > > True, Coverity finds false positives.  It flagged every use in
> > > drivers/pci and drivers/pnp.  It didn't mention the arch/alpha, arm,
> > > mips, powerpc, sh, or sparc uses, but I think it just didn't look at
> > > those.
> > >
> > > It flagged both:
> > >
> > >   pbus_size_io    pci_dev_for_each_resource(dev, r)
> > >   pbus_size_mem   pci_dev_for_each_resource(dev, r, i)
> > >
> > > Here's a spreadsheet with a few more details (unfortunately I don't
> > > know how to make it dump the actual line numbers or analysis like I
> > > pasted below, so "pci_dev_for_each_resource" doesn't appear).  These
> > > are mostly in the "Drivers-PCI" component.
> > >
> > > https://docs.google.com/spreadsheets/d/1ohOJwxqXXoDUA0gwopgk-z-6ArLvhN7AZn4mIlDkHhQ/edit?usp=sharing
> > >
> > > These particular reports are in the "High Impact Outstanding" tab.
> >
> > Where are we at?  Are we going to ignore this because some Coverity
> > reports are false positives?
> 
> Looking at the code I understand where coverity is coming from:
> 
> #define __pci_dev_for_each_res0(dev, res, ...)                         \
>        for (unsigned int __b = 0;                                      \
>             res = pci_resource_n(dev, __b), __b < PCI_NUM_RESOURCES;   \
>             __b++)
> 
>  res will be assigned before __b is checked for being less than
> PCI_NUM_RESOURCES, making it point to behind the array at the end of
> the last loop iteration.

Which is fine and you stumbled over the same mistake I made, that's why the
documentation has been added to describe why the heck this macro is written
the way it's written.

Coverity sucks.

> Rewriting the test expression as
> 
> __b < PCI_NUM_RESOURCES && (res = pci_resource_n(dev, __b));
> 
> should avoid the (coverity) warning by making use of lazy evaluation.

Obviously NAK.

> It probably makes the code slightly less performant as res will now be
> checked for being not NULL (which will always be true), but I doubt it
> will be significant (or in any hot paths).

-- 
With Best Regards,
Andy Shevchenko



