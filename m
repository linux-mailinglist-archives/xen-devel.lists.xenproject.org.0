Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9073A34927B
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 13:55:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101397.193918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPPVG-0006FC-8Q; Thu, 25 Mar 2021 12:54:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101397.193918; Thu, 25 Mar 2021 12:54:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPPVG-0006En-5K; Thu, 25 Mar 2021 12:54:22 +0000
Received: by outflank-mailman (input) for mailman id 101397;
 Thu, 25 Mar 2021 12:54:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cpwe=IX=linux.intel.com=andriy.shevchenko@srs-us1.protection.inumbo.net>)
 id 1lPPVE-0006Ei-Go
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 12:54:20 +0000
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c2f43d85-f7e7-4dbb-b10c-226d515bfa82;
 Thu, 25 Mar 2021 12:54:18 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 05:54:17 -0700
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 05:54:15 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1lPPV6-00G2tJ-5t; Thu, 25 Mar 2021 14:54:12 +0200
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
X-Inumbo-ID: c2f43d85-f7e7-4dbb-b10c-226d515bfa82
IronPort-SDR: F6xLx7ZqZpaAZks9DkKtLFReIOihLGBkmmOg25fNsKlltnlnczOHPIGVTL7POn+unSOElbpPgO
 qN8T76Sy0VlA==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="190344924"
X-IronPort-AV: E=Sophos;i="5.81,277,1610438400"; 
   d="scan'208";a="190344924"
IronPort-SDR: 0UZcZSDDN+4EZ6NdZE6wdeQVxlVSZPThBvSUsY1Z0jpTq41Ef7NW/naabCdg2U6qVoUzWm2rBJ
 jJr85sXM+nUA==
X-IronPort-AV: E=Sophos;i="5.81,277,1610438400"; 
   d="scan'208";a="375057264"
Date: Thu, 25 Mar 2021 14:54:12 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3] intel/pinctrl: check REVID register value for device
 presence
Message-ID: <YFyH9Fk5d+289/f/@smile.fi.intel.com>
References: <20210325090947.73729-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210325090947.73729-1-roger.pau@citrix.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Mar 25, 2021 at 10:09:47AM +0100, Roger Pau Monne wrote:
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

Applied for fixes, thanks!

> 91d898e51e60 ('pinctrl: intel: Convert capability list to features')
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v2:
>  - Return ENODEV.
>  - Adjust code comment.
> 
> Changes since v1:
>  - New in this version.
> ---
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Andy Shevchenko <andy@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> ---
>  drivers/pinctrl/intel/pinctrl-intel.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index 8085782cd8f9..9fc5bba514ea 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -1491,8 +1491,13 @@ static int intel_pinctrl_probe(struct platform_device *pdev,
>  		if (IS_ERR(regs))
>  			return PTR_ERR(regs);
>  
> -		/* Determine community features based on the revision */
> +		/*
> +		 * Determine community features based on the revision.
> +		 * A value of all ones means the device is not present.
> +		 */
>  		value = readl(regs + REVID);
> +		if (value == ~0u)
> +			return -ENODEV;
>  		if (((value & REVID_MASK) >> REVID_SHIFT) >= 0x94) {
>  			community->features |= PINCTRL_FEATURE_DEBOUNCE;
>  			community->features |= PINCTRL_FEATURE_1K_PD;
> -- 
> 2.30.1
> 

-- 
With Best Regards,
Andy Shevchenko



