Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7266618822
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 20:01:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437007.691324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqfSw-0000cY-KH; Thu, 03 Nov 2022 19:01:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437007.691324; Thu, 03 Nov 2022 19:01:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqfSw-0000aB-GZ; Thu, 03 Nov 2022 19:01:26 +0000
Received: by outflank-mailman (input) for mailman id 437007;
 Thu, 03 Nov 2022 19:01:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QhFu=3D=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1oqfSv-0000Ze-4H
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 19:01:25 +0000
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e682196f-5ba9-11ed-91b5-6bf2151ebd3b;
 Thu, 03 Nov 2022 20:01:21 +0100 (CET)
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2022 12:01:18 -0700
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga007.jf.intel.com with ESMTP; 03 Nov 2022 12:01:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1oqfSd-006zXu-1O; Thu, 03 Nov 2022 21:01:07 +0200
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
X-Inumbo-ID: e682196f-5ba9-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667502081; x=1699038081;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=sNkpjDaE4wFtOA2SWrBA99Yi2yLtSUQQFYkHqzgZpY0=;
  b=bjjERSibgTNUU85Hg7P6wSvUP770XMf72qD1UXaO+5D3TRBcX1RWt/ds
   UEoeNDbR6gIrc3dwng7ZjogkA9dtx2rD9FsSOn6qfcC4sqFOeW/uL+0JN
   epwlVg5QaoL/Ryi/rPUbkhLIx+FL+4v5HKhZj1aM1wYVwxLoqlbw6rvsa
   oPXvxe3M7mrGwL+zYN8MZxjY27Wuwt2vGYqHta/Dz4hQxzNpdFmmwauwZ
   l6gcKK/U6IxXstGnRSLmaAoviY6fMWIyGGOMQYqEtz795WTjalDMLLg5q
   RsQxF/J/OmqMMZjkcR2jpvRYfhom/VXZXJLYXsANd05L5ks0W+wHkf5eK
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="336475096"
X-IronPort-AV: E=Sophos;i="5.96,135,1665471600"; 
   d="scan'208";a="336475096"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="629452994"
X-IronPort-AV: E=Sophos;i="5.96,135,1665471600"; 
   d="scan'208";a="629452994"
Date: Thu, 3 Nov 2022 21:01:07 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
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
Message-ID: <Y2QP8yrZ7/9fpUQQ@smile.fi.intel.com>
References: <20221103164644.70554-1-andriy.shevchenko@linux.intel.com>
 <20221103164644.70554-5-andriy.shevchenko@linux.intel.com>
 <Y2P0XCNJvTVuziO7@owl.dominikbrodowski.net>
 <Y2P2ja26ikNecTsv@smile.fi.intel.com>
 <Y2QImB0OLakzz1+F@rocinante>
 <Y2QKjzL+nH6Zabg7@owl.dominikbrodowski.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y2QKjzL+nH6Zabg7@owl.dominikbrodowski.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 03, 2022 at 07:38:07PM +0100, Dominik Brodowski wrote:
> Am Fri, Nov 04, 2022 at 03:29:44AM +0900 schrieb Krzysztof Wilczyński:

...

> > That said, Dominik is the maintainer of PCMCIA driver, so his is the last
> > word, so to speak. :)
> > 
> > > Considering this is done, can you issue your conditional tag so I will
> > > incorporate it in v3?
> > 
> > No need, really.  Again, unless Dominik thinks otherwise.
> 
> Ah, thanks for the correction. Then v2 is perfectly fine.

I'm fine with either, thanks!

-- 
With Best Regards,
Andy Shevchenko



