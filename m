Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5D5347A95
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 15:23:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101027.192874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP4PO-00025h-Ei; Wed, 24 Mar 2021 14:22:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101027.192874; Wed, 24 Mar 2021 14:22:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP4PO-00025M-BW; Wed, 24 Mar 2021 14:22:54 +0000
Received: by outflank-mailman (input) for mailman id 101027;
 Wed, 24 Mar 2021 14:22:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ehbw=IW=intel.com=andriy.shevchenko@srs-us1.protection.inumbo.net>)
 id 1lP4PM-00025H-Qh
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 14:22:52 +0000
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id daeefe23-cc93-45d5-bf85-cdef9f8b79e8;
 Wed, 24 Mar 2021 14:22:50 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 07:22:49 -0700
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 07:22:47 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1lP4PE-00FiD8-Q7; Wed, 24 Mar 2021 16:22:44 +0200
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
X-Inumbo-ID: daeefe23-cc93-45d5-bf85-cdef9f8b79e8
IronPort-SDR: MTK+kCSekNPsmTluonGr3LavgbNq9QVbr2UwXn9vEQ04vV8C4gYrimlGjp8pz0VNtM1uwQI+BH
 GPb0q2r8eXgw==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="190129693"
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; 
   d="scan'208";a="190129693"
IronPort-SDR: VwrKILIj/QZQwCX9DSJSCDYw53ud/1y/6178HuzK5RgnLGH3tp2RGzmj30o19mEzRgutOVgMQp
 I1vu/hV9te2A==
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; 
   d="scan'208";a="391317293"
Date: Wed, 24 Mar 2021 16:22:44 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH RESEND] intel/pinctrl: check capability offset is between
 MMIO region
Message-ID: <YFtLNLTrR9wTO41W@smile.fi.intel.com>
References: <20210324123118.58865-1-roger.pau@citrix.com>
 <YFs3XwOBRGAFyASY@smile.fi.intel.com>
 <YFtEw7qHQKE/4p8t@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YFtEw7qHQKE/4p8t@Air-de-Roger>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Mar 24, 2021 at 02:55:15PM +0100, Roger Pau Monné wrote:
> On Wed, Mar 24, 2021 at 02:58:07PM +0200, Andy Shevchenko wrote:
> > On Wed, Mar 24, 2021 at 01:31:18PM +0100, Roger Pau Monne wrote:

...

> What could be done is check whether reading REVID returns ~0 and exit
> at that point, if ~0 will never be a valid value returned by that
> register. I think that should be a separate patch however.

Sounds good to me.

> > Moreover, it seems you are bailing out and basically denying driver to load.
> > This does look that capability is simply the first register that blows the setup.
> > I think you have to fix something into Xen to avoid loading these drivers or
> > check with something like pci_device_is_present() approach.
> 
> Is there a backing PCI device BAR for those MMIO regions that the
> pinctrl driver is trying to access? AFAICT those regions are only
> reported in the ACPI DSDT table on the _CRS method of the object (at
> least on my system).

Unfortunately it does not expose PCI configuration space.

> Doing something like pci_device_is_present would require a register
> that we know will never return ~0 unless the device is not present. As
> said above, maybe we could use REVID to that end?

Yes, that's good, see above.

WRT capabilities, if we crash we will see the report immediately on the
hardware which has such an issue. (It's quite unlikely we will ever have one,
that's why I consider it's not critical)

-- 
With Best Regards,
Andy Shevchenko



