Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 159D96C6BF2
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 16:11:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513940.795720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfMab-0000uN-J3; Thu, 23 Mar 2023 15:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513940.795720; Thu, 23 Mar 2023 15:10:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfMab-0000ru-Fr; Thu, 23 Mar 2023 15:10:53 +0000
Received: by outflank-mailman (input) for mailman id 513940;
 Thu, 23 Mar 2023 15:10:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JuTy=7P=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1pfMaZ-0000rV-KJ
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 15:10:52 +0000
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e37e0eb7-c98c-11ed-85db-49a42c6b2330;
 Thu, 23 Mar 2023 16:10:49 +0100 (CET)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 08:09:02 -0700
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP; 23 Mar 2023 08:08:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pfMYZ-007YBs-1j; Thu, 23 Mar 2023 17:08:47 +0200
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
X-Inumbo-ID: e37e0eb7-c98c-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679584249; x=1711120249;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pTI3sfGhxuNt+eJ92X/zV2v4CxfKcZ1sf1RhNp36ij0=;
  b=RMo/4HUqB8BgdlqabO9/Iy32ztEUrI3LEakPvnl+avuKVEiOS1fyLgT4
   zO+zRC9keHfN6H8LqyLqxCLg9cc82PMJaMf6EZOQuSo49gebWF2vK0jW5
   us5eRm+wRqDJFmFJZl2unFR63DKx6uyE1lmnQaG6Bvz6UpwyPnzjsJWdv
   XQ9LGLhc4tXHERtyNJmuNDkqamAUCe/4RL/iIRfTgyC2mJXnFB+qzLa5F
   fejLT1oyp3OWVLl5SapLOJmnzTBS9OaBk19A9mfQF3xjSJmpgGIuer+yt
   DSGtFNs7cM99PpAnH2FCeflKroCeKu1mJPke1U0jBlAPLbDObEwKNUj+N
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="404419879"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="404419879"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="793046100"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="793046100"
Date: Thu, 23 Mar 2023 17:08:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
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
Subject: Re: [PATCH v6 1/4] PCI: Introduce pci_dev_for_each_resource()
Message-ID: <ZBxrfy83MRjnReAs@smile.fi.intel.com>
References: <ZBxiaflGTeK8Jlgx@smile.fi.intel.com>
 <20230323150238.GA2550157@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323150238.GA2550157@bhelgaas>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Mar 23, 2023 at 10:02:38AM -0500, Bjorn Helgaas wrote:
> On Thu, Mar 23, 2023 at 04:30:01PM +0200, Andy Shevchenko wrote:

...

> I poked around looking for similar patterns elsewhere with:
> 
>   git grep "#define.*for_each_.*_p("
>   git grep "#define.*for_each_.*_idx("
> 
> I didn't find any other "_p" iterators and just a few "_idx" ones, so
> my hope is to follow what little precedent there is, as well as
> converge on the basic "*_for_each_resource()" iterators and remove the
> "_idx()" versions over time by doing things like the
> pci_claim_resource() change.

The p is heavily used in the byte order conversion helpers.

> What do you think?  If it seems like excessive churn, we can do it
> as-is and still try to reduce the use of the index variable over time.

I think _p has a precedent as well. But I can think about it a bit, maybe
we can come up with something smarter.

-- 
With Best Regards,
Andy Shevchenko



