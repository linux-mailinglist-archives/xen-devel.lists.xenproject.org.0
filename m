Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EB66B9EDD
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 19:44:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509790.786263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc9cg-00059S-9C; Tue, 14 Mar 2023 18:43:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509790.786263; Tue, 14 Mar 2023 18:43:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc9cg-00056d-5r; Tue, 14 Mar 2023 18:43:46 +0000
Received: by outflank-mailman (input) for mailman id 509790;
 Tue, 14 Mar 2023 18:43:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oTSp=7G=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1pc9ce-00056V-8z
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 18:43:44 +0000
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2391d4b1-c298-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 19:43:42 +0100 (CET)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 11:43:39 -0700
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga004.jf.intel.com with ESMTP; 14 Mar 2023 11:43:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pc9cO-003NLi-0Q; Tue, 14 Mar 2023 20:43:28 +0200
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
X-Inumbo-ID: 2391d4b1-c298-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678819422; x=1710355422;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HcDoA6lnkNndAAvLyrmktLzn4ToTWYKaGtwl/HFFUFk=;
  b=Q2SM+PncGWYFJsJbm4vISbUrRV85QIpSIy4A0sRsGzUZGLXxWY+g9onv
   +Xh0IxCgqqgS4OgGiiynt5lFyxrC/6uy7YvKUXj3DvrMUlCZ6eJ/RFwJx
   Iyeic7/p8QSE+BudxA3u/TQn3oG3egdgCg3siLGPUNknRpgR9hnh+M+4A
   wnCqORaQld/eclXVEnjAZ1IEqOBzDYOQQmF/mdqsQOWnqCkZfYucvTGmj
   PzDQNwFM0LFOdrYlJxwuzxeEY/TwaPws+HoVhdYwzKKJ97d8/G22zfrel
   bh2Dyj5CoF3qBErTqBpHh1bcTVlxNYYAA5MGX8Jwg8Wc+3jBtFCkFmBSk
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="365185422"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="365185422"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="802973476"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="802973476"
Date: Tue, 14 Mar 2023 20:43:27 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
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
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v4 1/4] PCI: Introduce pci_dev_for_each_resource()
Message-ID: <ZBDAT4MJO+fBy61n@smile.fi.intel.com>
References: <20230310171416.23356-2-andriy.shevchenko@linux.intel.com>
 <d057ac5c-5947-41e1-abc7-9428fbd2fbe2@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d057ac5c-5947-41e1-abc7-9428fbd2fbe2@kili.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Mar 11, 2023 at 04:54:32PM +0300, Dan Carpenter wrote:

> 059b4a086017fb Mika Westerberg 2023-03-10  246  			unsigned long type = resource_type(r);
> 999ed65ad12e37 Rene Herman     2008-07-25  247  
> 059b4a086017fb Mika Westerberg 2023-03-10 @248  			if (type != IORESOURCE_IO || type != IORESOURCE_MEM ||
>                                                                                                   ^^
> This || needs to be &&.  This loop will always hit the continue path
> without doing anything.
> 
> 059b4a086017fb Mika Westerberg 2023-03-10  249  			    resource_size(r) == 0)
> 0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  250  				continue;

Thanks, I'll fix in v5.

-- 
With Best Regards,
Andy Shevchenko



