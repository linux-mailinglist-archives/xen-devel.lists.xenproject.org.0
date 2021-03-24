Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CF1347E67
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 18:01:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101126.193196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP6sq-0003qo-RL; Wed, 24 Mar 2021 17:01:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101126.193196; Wed, 24 Mar 2021 17:01:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP6sq-0003qS-OC; Wed, 24 Mar 2021 17:01:28 +0000
Received: by outflank-mailman (input) for mailman id 101126;
 Wed, 24 Mar 2021 17:01:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4VN/=IW=linux.intel.com=andriy.shevchenko@srs-us1.protection.inumbo.net>)
 id 1lP6sp-0003qN-AL
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 17:01:27 +0000
Received: from mga07.intel.com (unknown [134.134.136.100])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e150299-78f0-4e67-9cc8-4fc86a8b106a;
 Wed, 24 Mar 2021 17:01:25 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 10:01:23 -0700
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 10:01:21 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1lP6sg-00FkPI-Q7; Wed, 24 Mar 2021 19:01:18 +0200
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
X-Inumbo-ID: 3e150299-78f0-4e67-9cc8-4fc86a8b106a
IronPort-SDR: Oqvc8fhRgYZUdULYs2l02oN6aa6f9Q4yV3/sTgCy3TfEcTkN8uCWcSxAdK/82gFErvro2dldGO
 ZEVrj9oGXKAA==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="254740612"
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; 
   d="scan'208";a="254740612"
IronPort-SDR: XQJvaVJDJLanABcFoLCrP6nuFfR3RkzdfB4eAQ2LOIAMNxO8Su8pduY5YDmdjv1hRKJXndE44j
 dJugPKiNHHjA==
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; 
   d="scan'208";a="442320806"
Date: Wed, 24 Mar 2021 19:01:18 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Andy Shevchenko <andy@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/2] intel/pinctrl: check REVID register value for
 device presence
Message-ID: <YFtwXj1Q+PRO0asv@smile.fi.intel.com>
References: <20210324154312.61878-1-roger.pau@citrix.com>
 <20210324154312.61878-2-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210324154312.61878-2-roger.pau@citrix.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Mar 24, 2021 at 04:43:11PM +0100, Roger Pau Monne wrote:

Thanks for a fix! My comments below.

> Use the value read from the REVID register in order to check for the
> presence of the device. A read of all ones is treated as if the device
> is not present, and hence probing is ended.
> 
> This fixes an issue when running as a Xen PVH dom0, where the ACPI
> DSDT table is provided unmodified to dom0 and hence contains the
> pinctrl devices, but the MMIO region(s) containing the device
> registers might not be mapped in the guest physical memory map if such
> region(s) are not exposed on a PCI device BAR or marked as reserved in
> the host memory map.

Any particular point that we can use in the Fixes tag?

...

> Suggested-by: Andy Shevchenko <andy@kernel.org>

Hmm... was it that address I have used? In any case I think my @linux.intel.com
is better.

...

>  		/* Determine community features based on the revision */
>  		value = readl(regs + REVID);
> +		if (value == ~0u)
> +			return -ENODATA;

I think -ENODEV is more appropriate here.
Also comment above should be adjusted to explain this check.

-- 
With Best Regards,
Andy Shevchenko



