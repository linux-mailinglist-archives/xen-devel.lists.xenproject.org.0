Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1226D09EC
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 17:40:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516777.801439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phuN2-0002wx-NO; Thu, 30 Mar 2023 15:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516777.801439; Thu, 30 Mar 2023 15:39:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phuN2-0002uW-Ii; Thu, 30 Mar 2023 15:39:24 +0000
Received: by outflank-mailman (input) for mailman id 516777;
 Thu, 30 Mar 2023 15:39:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y3PO=7W=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1phuN0-0002uQ-IU
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 15:39:23 +0000
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07f508a6-cf11-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 17:39:19 +0200 (CEST)
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:39:08 -0700
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga007.jf.intel.com with ESMTP; 30 Mar 2023 08:38:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1phuMV-00AURJ-0P; Thu, 30 Mar 2023 18:38:51 +0300
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
X-Inumbo-ID: 07f508a6-cf11-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680190759; x=1711726759;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2y+Qd+RESrzEa/F9wmN52tzUziPss+ZxjSltCa9P/hk=;
  b=QOZnq8W0129ms7qKB838XPHVOJByEr/BgKNYodsmpr+DY7Rn8Vu7EHPj
   Rfxv1V7VdSJP8d/uJ24jqYXi76ey8yTRhwiPAj5qXImAZi3NuDe3CrQgd
   8AfwJHbgBwCwGnHR2veA4AHbuLsNQiNjL5XALdGfLRSFvcIK19w+Wi/er
   pTpuhdFgJKn8Veff0ue8ZQdr2e3AZIj7R7ZcG5R5AhDzIG8NOnLKfRNP6
   Xn6lvl9cnvxCH7E8CaxczTn8pm3gml3huIhs809Rmnqys+E9P52Yi/QjM
   9MkFEv/wNbfrsEphgHTqyO3VxDh+zimLsu/dpWCO2AMW7ztXCZkIopSM1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="368984338"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="368984338"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="678241953"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="678241953"
Date: Thu, 30 Mar 2023 18:38:50 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	linux-pci@vger.kernel.org,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
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
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-acpi@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
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
Subject: Re: [PATCH v7 3/6] PCI: Allow pci_bus_for_each_resource() to take
 less arguments
Message-ID: <ZCWtCpQBAM7oR6ra@smile.fi.intel.com>
References: <20230323173610.60442-4-andriy.shevchenko@linux.intel.com>
 <202303302009.55848372-oliver.sang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202303302009.55848372-oliver.sang@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Mar 30, 2023 at 09:24:21PM +0800, kernel test robot wrote:
> 
> Greeting,
> 
> FYI, we noticed various errors such like
>     "i40e: probe of 0000:3d:00.0 failed with error -12"
> due to commit (built with gcc-11):
> 
> commit: d23d5938fd7ced817d6aa1ff86cd671ebbaebfc2 ("[PATCH v7 3/6] PCI: Allow pci_bus_for_each_resource() to take less arguments")
> url: https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/kernel-h-Split-out-COUNT_ARGS-and-CONCATENATE/20230324-013857
> base: https://git.kernel.org/cgit/linux/kernel/git/pci/pci.git next
> patch link: https://lore.kernel.org/all/20230323173610.60442-4-andriy.shevchenko@linux.intel.com/
> patch subject: [PATCH v7 3/6] PCI: Allow pci_bus_for_each_resource() to take less arguments
> 
> in testcase: boot
> 
> on test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz (Cascade Lake) with 512G memory
> 
> caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
> 
> 
> If you fix the issue, kindly add following tag
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Link: https://lore.kernel.org/oe-lkp/202303302009.55848372-oliver.sang@intel.com

Thanks, that is useful test!

-- 
With Best Regards,
Andy Shevchenko



