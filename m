Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEA86C7B1D
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 10:21:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514241.796312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfdbp-0008PP-G0; Fri, 24 Mar 2023 09:21:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514241.796312; Fri, 24 Mar 2023 09:21:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfdbp-0008MQ-Cq; Fri, 24 Mar 2023 09:21:17 +0000
Received: by outflank-mailman (input) for mailman id 514241;
 Fri, 24 Mar 2023 09:21:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cJFJ=7Q=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1pfdbn-0008Kv-Qo
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 09:21:15 +0000
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37044cba-ca25-11ed-b464-930f4c7d94ae;
 Fri, 24 Mar 2023 10:21:12 +0100 (CET)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 02:21:09 -0700
Received: from smile.fi.intel.com ([10.237.72.54])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Mar 2023 02:20:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pfdbS-007qWb-1l; Fri, 24 Mar 2023 11:20:54 +0200
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
X-Inumbo-ID: 37044cba-ca25-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679649672; x=1711185672;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Zv6p5PxBUIwRGR/FQTKCtRGfcJDPVTzeoNo7mhbkHhY=;
  b=kkS1m9xKVU2GnODj1/9mLnyNnexAw3CaqebsescHGUZuE5cWt/136+L9
   jXG2lTOaIpuEJUzsFUqXr90uI8pR/c0PPXK1H9l+5h5dNBzi1LgYgST9h
   +XYMYLBHkqIhZLKaOxdzgmz/Y8uCd1DOWoT2I7SvlncTK/iRZV33wEOaP
   Oaj1Sxma9eVc4/JK1MK40f8PBN/5CgaWnv0Om6ijkiCURSOnOY1H5lt3h
   yhbdqGD/uvaiLiCa5kzrI6souWLueOiH2PsAM/YmwxTLaemXjo5SMAq+3
   7hPLWV7hohsZroJpO/ylDkxt9cDqtKE8ncqgSdIJ65zvYqt5Whnzlppbe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="320129729"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; 
   d="scan'208";a="320129729"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="771814725"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; 
   d="scan'208";a="771814725"
Date: Fri, 24 Mar 2023 11:20:54 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
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
Subject: Re: [PATCH v7 6/6] PCI: Make use of pci_resource_n()
Message-ID: <ZB1rdkOgwwSC2Pxf@smile.fi.intel.com>
References: <20230323173610.60442-1-andriy.shevchenko@linux.intel.com>
 <20230323173610.60442-7-andriy.shevchenko@linux.intel.com>
 <1722e75c-bc06-4a34-5e12-fa3622ed86a3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1722e75c-bc06-4a34-5e12-fa3622ed86a3@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Mar 24, 2023 at 10:08:39AM +0100, Philippe Mathieu-Daudé wrote:
> On 23/3/23 18:36, Andy Shevchenko wrote:
> > Replace open-coded implementations of pci_resource_n() in pci.h.

...

> >   #define pci_resource_n(dev, bar)	(&(dev)->resource[(bar)])
> > -#define pci_resource_start(dev, bar)	((dev)->resource[(bar)].start)
> > -#define pci_resource_end(dev, bar)	((dev)->resource[(bar)].end)
> > -#define pci_resource_flags(dev, bar)	((dev)->resource[(bar)].flags)
> > -#define pci_resource_len(dev,bar) \
> > -	((pci_resource_end((dev), (bar)) == 0) ? 0 :	\
> > -							\
> > -	 (pci_resource_end((dev), (bar)) -		\
> > -	  pci_resource_start((dev), (bar)) + 1))
> > +#define pci_resource_start(dev, bar)	(pci_resource_n(dev, bar)->start)
> > +#define pci_resource_end(dev, bar)	(pci_resource_n(dev, bar)->end)
> > +#define pci_resource_flags(dev, bar)	(pci_resource_n(dev, bar)->flags)
> > +#define pci_resource_len(dev,bar)					\
> > +	(pci_resource_end((dev), (bar)) ? 				\
> > +	 resource_size(pci_resource_n((dev), (bar))) : 0)
> 
> Seems (to me) more logical to have this patch as "PCI: Introduce
> pci_resource_n()" ordered before your patch #2 "PCI: Introduce
> pci_dev_for_each_resource()".

Either way works for me. Bjorn, what do you like?

> Here as #6 or as #2:
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thank you!

-- 
With Best Regards,
Andy Shevchenko



