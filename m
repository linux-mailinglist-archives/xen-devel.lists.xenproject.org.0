Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 714FB62442A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 15:22:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441828.695899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot8QK-0001CI-Qf; Thu, 10 Nov 2022 14:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441828.695899; Thu, 10 Nov 2022 14:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot8QK-00019d-Mv; Thu, 10 Nov 2022 14:20:56 +0000
Received: by outflank-mailman (input) for mailman id 441828;
 Thu, 10 Nov 2022 14:20:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymhl=3K=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1ot8QI-00019W-Q3
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 14:20:55 +0000
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dea723cb-6102-11ed-91b5-6bf2151ebd3b;
 Thu, 10 Nov 2022 15:20:49 +0100 (CET)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 06:20:01 -0800
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP; 10 Nov 2022 06:19:58 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1ot8PM-00ABIs-2K; Thu, 10 Nov 2022 16:19:56 +0200
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
X-Inumbo-ID: dea723cb-6102-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668090050; x=1699626050;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=RHhT2VxJ8li5Rw6AgHiZP5xYVQLOtbkBiRZO9kF6oZU=;
  b=aGLZWzFrr/EU7PTOiyNcUO/ZRXuC+SI6CzOCtorKE4U5kFfcrTuzACfv
   IhecmHgmbsQ1TI7QzlcuR4VoMo+u6stmDF5lyId6nDfW201f4C3uwwvR5
   TF/b96Ebkvfgb14e7OdHJFlU5FTS1+0wYns/0mvVS8fEPGfG2no2rQ/DR
   vGgDTyYCn1SCg3eIBxptX47+GMM9SXWNVxvgPVLK7FTJWKFI6pXEM7TWq
   cTsLKc6S02pp2g1n/CuDFWA8pTdVIH4ZB8nLEPDH784idmbpbgEOHlxMC
   wyPNdPhnesCxPC15gkKBL89/4Nc7xkUj6z6HvlXZggKYnojTCOQWJnXeU
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="338074349"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; 
   d="scan'208";a="338074349"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="742868446"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; 
   d="scan'208";a="742868446"
Date: Thu, 10 Nov 2022 16:19:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org,
	"David E . Box" <david.e.box@linux.intel.com>,
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	David E Box <david.e.box@intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Juergen Gross <jgross@suse.com>,
	platform-driver-x86@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] platform/x86: don't unconditionally attach Intel PMC
 when virtualized
Message-ID: <Y20IjBPSXE+kqOZS@smile.fi.intel.com>
References: <20221110133335.78442-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221110133335.78442-1-roger.pau@citrix.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 10, 2022 at 02:33:35PM +0100, Roger Pau Monne wrote:
> The current logic in the Intel PMC driver will forcefully attach it
> when detecting any CPU on the intel_pmc_core_platform_ids array,
> even if the matching ACPI device is not present.
> 
> There's no checking in pmc_core_probe() to assert that the PMC device
> is present, and hence on virtualized environments the PMC device
> probes successfully, even if the underlying registers are not present.
> Previous to 21ae43570940 the driver would check for the presence of a
> specific PCI device, and that prevented the driver from attaching when
> running virtualized.
> 
> Fix by only forcefully attaching the PMC device when not running
> virtualized.  Note that virtualized platforms can still get the device
> to load if the appropriate ACPI device is present on the tables
> provided to the VM.
> 
> Make an exception for the Xen initial domain, which does have full
> hardware access, and hence can attach to the PMC if present.
> 
> Fixes: 21ae43570940 ('platform/x86: intel_pmc_core: Substitute PCI with CPUID enumeration')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Acked-by: David E. Box <david.e.box@linux.intel.com>

> Cc: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
> Cc: David E Box <david.e.box@intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Mark Gross <markgross@kernel.org>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: platform-driver-x86@vger.kernel.org
> Cc: xen-devel@lists.xenproject.org

You may use --cc to the sending tool, instead of polluting a commit message
with that. Moreover, the Cc list will be archived on lore.kernel.org anyway,
in case you really need it to be recorded.

...

> +	if (cpu_feature_enabled(X86_FEATURE_HYPERVISOR) &&
> +	    !xen_initial_domain())

One line? It's 81 character only and we have no strong 80 here, IIRC.

> +		return -ENODEV;

-- 
With Best Regards,
Andy Shevchenko



