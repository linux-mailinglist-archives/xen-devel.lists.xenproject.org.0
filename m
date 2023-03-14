Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DF56B9EC8
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 19:41:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509788.786253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc9ZX-0004Zw-S1; Tue, 14 Mar 2023 18:40:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509788.786253; Tue, 14 Mar 2023 18:40:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc9ZX-0004Xj-Ni; Tue, 14 Mar 2023 18:40:31 +0000
Received: by outflank-mailman (input) for mailman id 509788;
 Tue, 14 Mar 2023 18:40:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oTSp=7G=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1pc9ZV-0004XK-DA
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 18:40:29 +0000
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad8767f8-c297-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 19:40:25 +0100 (CET)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 11:40:13 -0700
Received: from smile.fi.intel.com ([10.237.72.54])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Mar 2023 11:40:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pc9Yy-003NFt-2t; Tue, 14 Mar 2023 20:39:56 +0200
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
X-Inumbo-ID: ad8767f8-c297-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678819225; x=1710355225;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cCLbIes7UXT3DAC9eDK/G+6dQMpfpn9vtj5PUMV+0Io=;
  b=MlSrDSNx7q4lw+TXH76QNTftTtLOmycR1E2tsTCYWTDxzneRvkDchxmD
   RvEeVJGjUlAV43y8JXF0cZy8byg+H7o7A4W1btcpPaysUz/8i10Layjpd
   Id6cmtGENw/SOKq5UgWeQjbBQddQZQhwzu5isGxjGrGE0Sjg+ag6Sh+Mc
   WMR6vrud8coYf2oG3cvzWVdBaZYnLMkZoKy+7J68md209LTTke2bNQUTy
   gF3zL5BgU8fOhvpgtexbQ2Vdmu0gLhAskuRl++Y7iTy5nJUSfscdA6/sc
   X+5/8gVrJxZqM0Ap07gvO0DHzgIwoyTR07FfEhCwDfJZMEU6NvH5mbrVx
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="365184270"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="365184270"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="768214212"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="768214212"
Date: Tue, 14 Mar 2023 20:39:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Keith Busch <kbusch@kernel.org>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Bjorn Helgaas <helgaas@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
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
Subject: Re: [PATCH v4 1/4] PCI: Introduce pci_dev_for_each_resource()
Message-ID: <ZBC/fL+KS7RiZClB@smile.fi.intel.com>
References: <20230310171416.23356-1-andriy.shevchenko@linux.intel.com>
 <20230310171416.23356-2-andriy.shevchenko@linux.intel.com>
 <ZAusCnLSXeEcpQs+@kbusch-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAusCnLSXeEcpQs+@kbusch-mbp.dhcp.thefacebook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Mar 10, 2023 at 03:15:38PM -0700, Keith Busch wrote:
> On Fri, Mar 10, 2023 at 07:14:13PM +0200, Andy Shevchenko wrote:

...

> > +#define pci_dev_for_each_resource_p(dev, res)				\
> > +	__pci_dev_for_each_resource(dev, res, i, unsigned int)
> 
> It looks dangerous to have a macro declare a variable when starting a new
> scope. How do you know the name 'i' won't clash with something defined above?

I'll rename. Thank you.

-- 
With Best Regards,
Andy Shevchenko



