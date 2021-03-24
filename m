Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E6C347E70
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 18:02:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101129.193209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP6u4-0003xK-8K; Wed, 24 Mar 2021 17:02:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101129.193209; Wed, 24 Mar 2021 17:02:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP6u4-0003wv-4K; Wed, 24 Mar 2021 17:02:44 +0000
Received: by outflank-mailman (input) for mailman id 101129;
 Wed, 24 Mar 2021 17:02:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ehbw=IW=intel.com=andriy.shevchenko@srs-us1.protection.inumbo.net>)
 id 1lP6u2-0003wq-0T
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 17:02:42 +0000
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c99ac4a5-1887-4f0e-84c8-ea83b25122e9;
 Wed, 24 Mar 2021 17:02:39 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 10:02:32 -0700
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 10:02:30 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1lP6tn-00FkQL-KI; Wed, 24 Mar 2021 19:02:27 +0200
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
X-Inumbo-ID: c99ac4a5-1887-4f0e-84c8-ea83b25122e9
IronPort-SDR: PdsMzB4mzZncKeUjL/hyT203UC1JlvtCuiPaZdgfMP//zhWY6bESmiZ2WWBWgI0Sxmm9QGxUi0
 HooHjqKM+vrg==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="190842121"
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; 
   d="scan'208";a="190842121"
IronPort-SDR: rJzS+iHtOGfIZpvOLfsXL6NzmraXGkrb1W962iko8Ym8KaXs9zZRzUjBo7mY3wfQULMhr9JHAe
 OPIWchmumWTg==
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; 
   d="scan'208";a="525308568"
Date: Wed, 24 Mar 2021 19:02:27 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 2/2] intel/pinctrl: check capability offset is between
 MMIO region
Message-ID: <YFtwo4+4Rnmbnyid@smile.fi.intel.com>
References: <20210324154312.61878-1-roger.pau@citrix.com>
 <20210324154312.61878-3-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210324154312.61878-3-roger.pau@citrix.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Mar 24, 2021 at 04:43:12PM +0100, Roger Pau Monne wrote:
> When parsing the capability list make sure the offset is between the
> MMIO region mapped in 'regs', or else the kernel hits a page fault.
> 
> Adding the check is harmless, and prevents buggy or broken systems
> from crashing the kernel if the capability linked list is somehow
> broken.

I don't think we need a dead code in the kernel. If you have a hardware to show
this issue, I eagerly want to know this!

-- 
With Best Regards,
Andy Shevchenko



