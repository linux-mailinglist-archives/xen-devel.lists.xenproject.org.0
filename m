Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF7A624B35
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 21:08:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442171.696217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otDps-0005rQ-8R; Thu, 10 Nov 2022 20:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442171.696217; Thu, 10 Nov 2022 20:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otDps-0005pR-5Z; Thu, 10 Nov 2022 20:07:40 +0000
Received: by outflank-mailman (input) for mailman id 442171;
 Thu, 10 Nov 2022 20:07:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymhl=3K=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1otDpq-0005pL-Ma
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 20:07:39 +0000
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fd389a5-6133-11ed-91b5-6bf2151ebd3b;
 Thu, 10 Nov 2022 21:07:35 +0100 (CET)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 12:07:31 -0800
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga004.fm.intel.com with ESMTP; 10 Nov 2022 12:07:29 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1otDpe-00AK6n-37; Thu, 10 Nov 2022 22:07:26 +0200
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
X-Inumbo-ID: 4fd389a5-6133-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668110855; x=1699646855;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=XMCPCA1iwhiwEmRKQ5eEAZ8oTjY1Alafexj9ZcyNpxo=;
  b=WT3+yKNwDFa5cxd4OUN4h1/A6eG6FkSd1DJ3ZjV4vO3qCcze3ShMiVzp
   QSwQt5uXR0j0UUnrrPtU/W4KmfdQokjyp5mpaQroQmn7hwYR+XwMvfsBf
   Pm2kF0+0JZkhuHPn/07GU0UCYcVGPsbRVrBGf5U0RDnMAtN9b0EkBlKWp
   iJZuIJ1ivWPA368AWektrRV1xHqLedjP/GlUd70kXVQmKnMOVUdDdYpdK
   wHS3EG3ZaQcj1Xe6+h6eSInSgs5aY9v/LLuoQnGlOdJu/rwGpNRXfIsxl
   pQGY8oQz3JLJRnRi9d4mkk0un8HodM01A50KZB+d31Mk1TSz1C0n61RlO
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="294784446"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; 
   d="scan'208";a="294784446"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="706285378"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; 
   d="scan'208";a="706285378"
Date: Thu, 10 Nov 2022 22:07:26 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	jgross@suse.com, "David E . Box" <david.e.box@linux.intel.com>,
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	David E Box <david.e.box@intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3] platform/x86: don't unconditionally attach Intel PMC
 when virtualized
Message-ID: <Y21Z/r0btEPl8rtF@smile.fi.intel.com>
References: <20221110163145.80374-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221110163145.80374-1-roger.pau@citrix.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 10, 2022 at 05:31:44PM +0100, Roger Pau Monne wrote:
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

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Fixes: 21ae43570940 ('platform/x86: intel_pmc_core: Substitute PCI with CPUID enumeration')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Acked-by: David E. Box <david.e.box@linux.intel.com>
> ---
> Changes since v2:
>  - Don't split condition line.
> 
> Changes since v1:
>  - Use cpu_feature_enabled() instead of boot_cpu_has().
> ---
>  drivers/platform/x86/intel/pmc/pltdrv.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/pmc/pltdrv.c b/drivers/platform/x86/intel/pmc/pltdrv.c
> index 15ca8afdd973..ddfba38c2104 100644
> --- a/drivers/platform/x86/intel/pmc/pltdrv.c
> +++ b/drivers/platform/x86/intel/pmc/pltdrv.c
> @@ -18,6 +18,8 @@
>  #include <asm/cpu_device_id.h>
>  #include <asm/intel-family.h>
>  
> +#include <xen/xen.h>
> +
>  static void intel_pmc_core_release(struct device *dev)
>  {
>  	kfree(dev);
> @@ -53,6 +55,13 @@ static int __init pmc_core_platform_init(void)
>  	if (acpi_dev_present("INT33A1", NULL, -1))
>  		return -ENODEV;
>  
> +	/*
> +	 * Skip forcefully attaching the device for VMs. Make an exception for
> +	 * Xen dom0, which does have full hardware access.
> +	 */
> +	if (cpu_feature_enabled(X86_FEATURE_HYPERVISOR) && !xen_initial_domain())
> +		return -ENODEV;
> +
>  	if (!x86_match_cpu(intel_pmc_core_platform_ids))
>  		return -ENODEV;
>  
> -- 
> 2.37.3
> 

-- 
With Best Regards,
Andy Shevchenko



