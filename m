Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 006E66D76E1
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 10:29:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518313.804711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjyVd-0005Ds-S0; Wed, 05 Apr 2023 08:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518313.804711; Wed, 05 Apr 2023 08:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjyVd-0005CC-OC; Wed, 05 Apr 2023 08:28:49 +0000
Received: by outflank-mailman (input) for mailman id 518313;
 Wed, 05 Apr 2023 08:28:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=//T7=74=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1pjyVb-0005C2-KY
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 08:28:48 +0000
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfb21dff-d38b-11ed-85db-49a42c6b2330;
 Wed, 05 Apr 2023 10:28:44 +0200 (CEST)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 01:28:41 -0700
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga008.fm.intel.com with ESMTP; 05 Apr 2023 01:28:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pjyVH-00CkZe-2G; Wed, 05 Apr 2023 11:28:27 +0300
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
X-Inumbo-ID: dfb21dff-d38b-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680683324; x=1712219324;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wrn29fWEWUh9DQE7oDLC0JoUgdEFYGWX1tgF9OvmiyE=;
  b=Pl3Z1zw4nobkhQz6coU1698+mcSuAFdqkrLJcvMRStDyV1mrbcjwDE8F
   PtI+Nr5V++PRN7Is3hyfrpbvYKboIPPJNPpcB7iO5RCzWlvRqz4x1Y5Ia
   kZBvxgBRGR9HO2jb/dn6zicDAel5/RWqo+U/4MjyKf0UGqUsQg/ZhLdr7
   ogcaezPy6S9+SkEyTeTJ7/vQ7CmR4nX5NmnTFGiTM6kU78BtiHYRziK8F
   4k+G1+WhqqdkcgAIbvmOsYCq/RGietDTHH4jFtbVZV1DKb7VMuneJpTeJ
   K9LgrCDJe4BZpj3GjLi/qJyQOE7ZDE3Cv1tGnP2xyf/AYCzfTD+3FYIuh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="344113398"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="344113398"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="751192534"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="751192534"
Date: Wed, 5 Apr 2023 11:28:27 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
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
Subject: Re: [PATCH v8 0/7] Add pci_dev_for_each_resource() helper and update
 users
Message-ID: <ZC0xK4YJrKga7akk@smile.fi.intel.com>
References: <20230330162434.35055-1-andriy.shevchenko@linux.intel.com>
 <20230404161101.GA3554747@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404161101.GA3554747@bhelgaas>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 04, 2023 at 11:11:01AM -0500, Bjorn Helgaas wrote:
> On Thu, Mar 30, 2023 at 07:24:27PM +0300, Andy Shevchenko wrote:
> > Provide two new helper macros to iterate over PCI device resources and
> > convert users.
> > 
> > Looking at it, refactor existing pci_bus_for_each_resource() and convert
> > users accordingly.
> > 
> > Note, the amount of lines grew due to the documentation update.
> > 
> > Changelog v8:
> > - fixed issue with pci_bus_for_each_resource() macro (LKP)
> > - due to above added a new patch to document how it works
> > - moved the last patch to be #2 (Philippe)
> > - added tags (Philippe)
> > 
> > Changelog v7:
> > - made both macros to share same name (Bjorn)
> 
> I didn't actually request the same name for both; I would have had no
> idea how to even do that :)
> 
> v6 had:
> 
>   pci_dev_for_each_resource_p(dev, res)
>   pci_dev_for_each_resource(dev, res, i)
> 
> and I suggested:
> 
>   pci_dev_for_each_resource(dev, res)
>   pci_dev_for_each_resource_idx(dev, res, i)
> 
> because that pattern is used elsewhere.

Ah, sorry I misinterpreted your suggestion (I thought that at the end of
the day you wanted the macro to be less intrusive, so we change less code,
that's why I interpreted it the way described in the Changelog).

> But you figured out how to do
> it, and having one name is even better, so thanks for that extra work!

You are welcome!

> > - split out the pci_resource_n() conversion (Bjorn)
> > 
> > Changelog v6:
> > - dropped unused variable in PPC code (LKP)
> > 
> > Changelog v5:
> > - renamed loop variable to minimize the clash (Keith)
> > - addressed smatch warning (Dan)
> > - addressed 0-day bot findings (LKP)
> > 
> > Changelog v4:
> > - rebased on top of v6.3-rc1
> > - added tag (Krzysztof)
> > 
> > Changelog v3:
> > - rebased on top of v2 by Mika, see above
> > - added tag to pcmcia patch (Dominik)
> > 
> > Changelog v2:
> > - refactor to have two macros
> > - refactor existing pci_bus_for_each_resource() in the same way and
> >   convert users
> > 
> > Andy Shevchenko (6):
> >   kernel.h: Split out COUNT_ARGS() and CONCATENATE()
> >   PCI: Introduce pci_resource_n()
> >   PCI: Document pci_bus_for_each_resource() to avoid confusion
> >   PCI: Allow pci_bus_for_each_resource() to take less arguments
> >   EISA: Convert to use less arguments in pci_bus_for_each_resource()
> >   pcmcia: Convert to use less arguments in pci_bus_for_each_resource()

...

> Applied 2-7 to pci/resource for v6.4, thanks, I really like this!

Btw, can you actually drop patch 7, please?
After I have updated the documentation I have realised that why the first
chunk is invalid. It needs mode careful check and rework.

> I omitted
> 
>   [1/7] kernel.h: Split out COUNT_ARGS() and CONCATENATE()"
> 
> only because it's not essential to this series and has only a trivial
> one-line impact on include/linux/pci.h.

I'm not sure I understood what exactly "essentiality" means to you, but
I included that because it makes the split which can be used later by
others and not including kernel.h in the header is the objective I want
to achieve. Without this patch the achievement is going to be deferred.
Yet, this, as you have noticed, allows to compile and use the macros in
the rest of the patches.

P.S. Thank you for the review and application of the rest!

-- 
With Best Regards,
Andy Shevchenko



