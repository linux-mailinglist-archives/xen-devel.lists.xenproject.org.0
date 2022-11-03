Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D33256185F5
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 18:13:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436961.691225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqdmJ-0004TI-Na; Thu, 03 Nov 2022 17:13:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436961.691225; Thu, 03 Nov 2022 17:13:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqdmJ-0004QD-Kk; Thu, 03 Nov 2022 17:13:19 +0000
Received: by outflank-mailman (input) for mailman id 436961;
 Thu, 03 Nov 2022 17:13:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QhFu=3D=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1oqdmH-0004Q7-Sh
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 17:13:18 +0000
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c824da70-5b9a-11ed-8fd0-01056ac49cbb;
 Thu, 03 Nov 2022 18:13:08 +0100 (CET)
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2022 10:12:56 -0700
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga008.jf.intel.com with ESMTP; 03 Nov 2022 10:12:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1oqdlm-006wiw-0o; Thu, 03 Nov 2022 19:12:46 +0200
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
X-Inumbo-ID: c824da70-5b9a-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667495594; x=1699031594;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7YpyRAArYVbF9WNy66xCFId6MSUjEg0Z+IBgztnk6pE=;
  b=jq5nzAvpIgGZZdrtliRRJKRfoZhhV/TY4FJPDv+HyTrfZbZCb4ZatUBd
   dn61FPyRCOAEuJ+OALQ/SOlP5PVk3/pJPzfIWkQuGNFFpS62yb+UMkGSY
   8O34bJ/dCYQvnqs1lKsrQqSrys3v2/Cc9lDRVNtgYuHZoeZekwbTIwv/c
   lbNlhQmTzXavpF3NKefF4XkilpCW4A5nUFxt+29DQqIBdGTbRzbZwkOyj
   C/YTVq1/WfXTrOOWFbqc7JT00OEtHuiZsma4NXavAghA/jl/SRRYV2uzG
   nrAQCQMekuQ0zER6a43+iHChxhdLPmaCnWVAYaSH5HZ5pdzsdjuzUfBCL
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="308462883"
X-IronPort-AV: E=Sophos;i="5.96,134,1665471600"; 
   d="scan'208";a="308462883"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="666046647"
X-IronPort-AV: E=Sophos;i="5.96,134,1665471600"; 
   d="scan'208";a="666046647"
Date: Thu, 3 Nov 2022 19:12:45 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
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
Message-ID: <Y2P2ja26ikNecTsv@smile.fi.intel.com>
References: <20221103164644.70554-1-andriy.shevchenko@linux.intel.com>
 <20221103164644.70554-5-andriy.shevchenko@linux.intel.com>
 <Y2P0XCNJvTVuziO7@owl.dominikbrodowski.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2P0XCNJvTVuziO7@owl.dominikbrodowski.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 03, 2022 at 06:03:24PM +0100, Dominik Brodowski wrote:
> Am Thu, Nov 03, 2022 at 06:46:44PM +0200 schrieb Andy Shevchenko:

...

> > -
> > -	for (i = 0; i < PCI_BRIDGE_RESOURCE_NUM; i++) {
> > -		res = s->cb_dev->bus->resource[i];
> > -#else
> > -	pci_bus_for_each_resource(s->cb_dev->bus, res, i) {
> >  #endif
> > +
> > +	pci_bus_for_each_resource_p(s->cb_dev->bus, res) {
> >  		if (!res)
> >  			continue;
> 
> Doesn't this remove the proper iterator for X86? Even if that is the right
> thing to do, it needs an explict explanation.

I dunno what was in 2010, but reading code now I have found no differences in
the logic on how resources are being iterated in these two pieces of code.

But fine, I will add a line to a commit message about this change.

Considering this is done, can you issue your conditional tag so I will
incorporate it in v3?

-- 
With Best Regards,
Andy Shevchenko



