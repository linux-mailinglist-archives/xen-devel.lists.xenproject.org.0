Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ADC6D942A
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 12:32:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518811.805701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkMtz-00014I-8u; Thu, 06 Apr 2023 10:31:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518811.805701; Thu, 06 Apr 2023 10:31:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkMtz-00011Q-5Y; Thu, 06 Apr 2023 10:31:35 +0000
Received: by outflank-mailman (input) for mailman id 518811;
 Thu, 06 Apr 2023 10:31:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dy8+=75=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1pkMtv-00011K-KL
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 10:31:33 +0000
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2eca9e7b-d466-11ed-b464-930f4c7d94ae;
 Thu, 06 Apr 2023 12:31:28 +0200 (CEST)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 03:31:23 -0700
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga001.jf.intel.com with ESMTP; 06 Apr 2023 03:31:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pkMtX-00DJOA-0t; Thu, 06 Apr 2023 13:31:07 +0300
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
X-Inumbo-ID: 2eca9e7b-d466-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680777088; x=1712313088;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3ceVcmjc6Ptm9PzaLBlyJdk3QXqcq40nfjFwb4WczVs=;
  b=XPv9RYSEoAesxqju4O68ghh3S3S58xwk8Zh0KHafHRFDrQ4S799NN2fa
   tXTdOrzvey0chQpNAXBZLNCHGUWTq9Dl7jJCEwZGpLbZMoXy/HFGBmSKS
   MdYca52S3+0UwEO2TXkCCicsyTk6APuUt6WtcC8/yK3P7Gn/8h47KtYTl
   PBrB3CQJWvxzf7ECP6K9OhkH+7FQgOYQJmkW4h9MgBKuqDLzNpJZdxivx
   zRnCS8Vg4svbmVD/irflttaBnDAKw/HlKL+es58oDscqy933hnlWeTT79
   H3DcaV4M5SRhJpGY+qJRwp1/Bu2g3MIofRI+NFkt2ZWPwNxnbRsfTGxk0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="341435044"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="341435044"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="719666156"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="719666156"
Date: Thu, 6 Apr 2023 13:31:07 +0300
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
Message-ID: <ZC6fa1vJGOOI7t8a@smile.fi.intel.com>
References: <ZC0xK4YJrKga7akk@smile.fi.intel.com>
 <20230405201832.GA3638070@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405201832.GA3638070@bhelgaas>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 05, 2023 at 03:18:32PM -0500, Bjorn Helgaas wrote:
> On Wed, Apr 05, 2023 at 11:28:27AM +0300, Andy Shevchenko wrote:
> > On Tue, Apr 04, 2023 at 11:11:01AM -0500, Bjorn Helgaas wrote:
> > > On Thu, Mar 30, 2023 at 07:24:27PM +0300, Andy Shevchenko wrote:

...

> > > I omitted
> > > 
> > >   [1/7] kernel.h: Split out COUNT_ARGS() and CONCATENATE()"
> > > 
> > > only because it's not essential to this series and has only a trivial
> > > one-line impact on include/linux/pci.h.
> > 
> > I'm not sure I understood what exactly "essentiality" means to you, but
> > I included that because it makes the split which can be used later by
> > others and not including kernel.h in the header is the objective I want
> > to achieve. Without this patch the achievement is going to be deferred.
> > Yet, this, as you have noticed, allows to compile and use the macros in
> > the rest of the patches.
> 
> I haven't followed the kernel.h splitting, and I try to avoid
> incidental changes outside of the files I maintain, so I just wanted
> to keep this series purely PCI and avoid any possible objections to a
> new include file or discussion about how it should be done.

Okay, fair enough :-) Thank you for elaboration, I will send the new version of
patch 7 separately.

-- 
With Best Regards,
Andy Shevchenko



