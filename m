Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E94956186D9
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 19:02:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436982.691268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqeXH-0005ob-9l; Thu, 03 Nov 2022 18:01:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436982.691268; Thu, 03 Nov 2022 18:01:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqeXH-0005le-6b; Thu, 03 Nov 2022 18:01:51 +0000
Received: by outflank-mailman (input) for mailman id 436982;
 Thu, 03 Nov 2022 18:01:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QhFu=3D=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1oqeXE-0005lY-UC
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 18:01:49 +0000
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9344c94e-5ba1-11ed-8fd0-01056ac49cbb;
 Thu, 03 Nov 2022 19:01:45 +0100 (CET)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2022 11:01:43 -0700
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP; 03 Nov 2022 11:01:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1oqeWy-006xtO-3D; Thu, 03 Nov 2022 20:01:33 +0200
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
X-Inumbo-ID: 9344c94e-5ba1-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667498505; x=1699034505;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yb2Mq3fbpPtLAnjCVdV2BEIMFU/XQ1cYRIu5k0HafqM=;
  b=QawNy6MCX1+5ktWAplobfXkYqgAkMLc9J1Ts6EjU3++8Dj486ixCVwJf
   7yBcGzXWd0exg+s579XGAxjcfcycD4UwUMFs/ACPTVbnxN7EFP56BCG14
   m8WLn0HPenmWa/SPu9VPnuzQuCZ+nG6qo3aW9jDXx/xMYl/kpZE9uYOKK
   sFN81QNyO+FEN3cGfhddm2Yk9zGW47ktq5CG8sAbz8Gxn7HEFgkQwBkuW
   mLwZgVc8GWHBkvPSD1q679ncO1PpI8LEhEU0y3qGmSsPAi1ZHnQo9cgNg
   sP5o+i3orj4U98Yg4AH+yTNTYS+ZcTX2fHT2GLoEliZ9wZYrL/wBVX798
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="396065308"
X-IronPort-AV: E=Sophos;i="5.96,134,1665471600"; 
   d="scan'208";a="396065308"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="740290898"
X-IronPort-AV: E=Sophos;i="5.96,134,1665471600"; 
   d="scan'208";a="740290898"
Date: Thu, 3 Nov 2022 20:01:32 +0200
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
Message-ID: <Y2QB/BxfKCjckaaU@smile.fi.intel.com>
References: <20221103164644.70554-1-andriy.shevchenko@linux.intel.com>
 <20221103164644.70554-5-andriy.shevchenko@linux.intel.com>
 <Y2P0XCNJvTVuziO7@owl.dominikbrodowski.net>
 <Y2P2ja26ikNecTsv@smile.fi.intel.com>
 <Y2P5mRt//Pp6XTLT@owl.dominikbrodowski.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2P5mRt//Pp6XTLT@owl.dominikbrodowski.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 03, 2022 at 06:25:45PM +0100, Dominik Brodowski wrote:
> Am Thu, Nov 03, 2022 at 07:12:45PM +0200 schrieb Andy Shevchenko:
> > On Thu, Nov 03, 2022 at 06:03:24PM +0100, Dominik Brodowski wrote:

...

> > Considering this is done, can you issue your conditional tag so I will
> > incorporate it in v3?
> 
> Certainly, feel free to add
> 
> 	Acked-by: Dominik Brodowski <linux@dominikbrodowski.net>

Thank you for the review!

-- 
With Best Regards,
Andy Shevchenko



