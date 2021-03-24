Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C376934791E
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 13:58:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100996.192797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP35T-0001R0-Im; Wed, 24 Mar 2021 12:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100996.192797; Wed, 24 Mar 2021 12:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP35T-0001Qb-FX; Wed, 24 Mar 2021 12:58:15 +0000
Received: by outflank-mailman (input) for mailman id 100996;
 Wed, 24 Mar 2021 12:58:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ehbw=IW=intel.com=andriy.shevchenko@srs-us1.protection.inumbo.net>)
 id 1lP35R-0001QW-T9
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 12:58:13 +0000
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3a55f57-e73a-4ec3-9161-5a8ccdd78f7f;
 Wed, 24 Mar 2021 12:58:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 05:58:11 -0700
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 05:58:09 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1lP35L-00FgFX-56; Wed, 24 Mar 2021 14:58:07 +0200
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
X-Inumbo-ID: a3a55f57-e73a-4ec3-9161-5a8ccdd78f7f
IronPort-SDR: nj4UAACCIE/I9vKKjVAD0wYVHafyH3JJ/JdnOeYvfF97erLVRViYZNAMLGdxSi8N6LdiE4PEqz
 kZVWdIckQ1Qw==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="190111874"
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; 
   d="scan'208";a="190111874"
IronPort-SDR: PmJQBp3JonAqGpUiW1irNX+pcSR62Rcn/S2FPW030FJzXa/AdtmMqNrN1wdrIxFlGlMP8ZfieG
 Z6nhLd7LWhog==
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; 
   d="scan'208";a="442213365"
Date: Wed, 24 Mar 2021 14:58:07 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH RESEND] intel/pinctrl: check capability offset is between
 MMIO region
Message-ID: <YFs3XwOBRGAFyASY@smile.fi.intel.com>
References: <20210324123118.58865-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210324123118.58865-1-roger.pau@citrix.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Mar 24, 2021 at 01:31:18PM +0100, Roger Pau Monne wrote:
> When parsing the capability list make sure the offset is between the
> MMIO region mapped in 'regs', or else the kernel hits a page fault.
> 
> This fault has been seen when running as a Xen PVH dom0, which doesn't
> have the MMIO regions mapped into the domain physical memory map,
> despite having the device reported in the ACPI DSDT table. This
> results in reporting a capability offset of 0xffff (because the kernel
> is accessing unpopulated memory), and such offset is outside of the
> mapped region.
> 
> Adding the check is harmless, and prevents buggy or broken systems
> from crashing the kernel if the MMIO region is not properly reported.

Thanks for the report.

Looking into the code I would like rather see the explicit comparison to 0xffff
or ~0 against entire register b/c it's (one of) standard way of devices to tell
that something is not supported.

Moreover, it seems you are bailing out and basically denying driver to load.
This does look that capability is simply the first register that blows the setup.
I think you have to fix something into Xen to avoid loading these drivers or
check with something like pci_device_is_present() approach.

> Fixes: 91d898e51e60 ('pinctrl: intel: Convert capability list to features')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Andy Shevchenko <andy@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> ---
> Resend because I've missed adding the maintainers, sorry for the spam.

I have a script to make it easier: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh

-- 
With Best Regards,
Andy Shevchenko



