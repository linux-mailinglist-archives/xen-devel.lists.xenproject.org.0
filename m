Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E183DF083
	for <lists+xen-devel@lfdr.de>; Tue,  3 Aug 2021 16:39:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163550.299579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAvZr-0006IQ-CC; Tue, 03 Aug 2021 14:39:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163550.299579; Tue, 03 Aug 2021 14:39:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAvZr-0006Fm-8H; Tue, 03 Aug 2021 14:39:31 +0000
Received: by outflank-mailman (input) for mailman id 163550;
 Tue, 03 Aug 2021 14:39:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A+UO=M2=intel.com=andriy.shevchenko@srs-us1.protection.inumbo.net>)
 id 1mAvZp-0006FI-Nr
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 14:39:29 +0000
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87827722-3ed8-4ede-9289-2f34ae253f87;
 Tue, 03 Aug 2021 14:39:23 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 07:39:23 -0700
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 07:39:07 -0700
Received: from andy by smile with local (Exim 4.94.2)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1mAvZJ-004lU3-S4; Tue, 03 Aug 2021 17:38:57 +0300
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
X-Inumbo-ID: 87827722-3ed8-4ede-9289-2f34ae253f87
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="213739129"
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; 
   d="scan'208";a="213739129"
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; 
   d="scan'208";a="419683121"
Date: Tue, 3 Aug 2021 17:38:57 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>, kernel@pengutronix.de,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-pci@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Russell Currey <ruscur@russell.cc>,
	Oliver O'Halloran <oohall@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Sathya Prakash <sathya.prakash@broadcom.com>,
	Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
	Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
	Frederic Barrat <fbarrat@linux.ibm.com>,
	Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
	Yisen Zhuang <yisen.zhuang@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Vadym Kochan <vkochan@marvell.com>,
	Taras Chornyi <tchornyi@marvell.com>, Jiri Pirko <jiri@nvidia.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Simon Horman <simon.horman@corigine.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michael Buesch <m@bues.ch>, Mathias Nyman <mathias.nyman@intel.com>,
	Fiona Trahe <fiona.trahe@intel.com>,
	Wojciech Ziemba <wojciech.ziemba@intel.com>,
	Alexander Duyck <alexanderduyck@fb.com>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-crypto@vger.kernel.org, qat-linux@intel.com,
	MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org, oss-drivers@corigine.com,
	xen-devel@lists.xenproject.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 5/6] PCI: Adapt all code locations to not use struct
 pci_dev::driver directly
Message-ID: <YQlVAcOGDrDO8500@smile.fi.intel.com>
References: <20210803100150.1543597-1-u.kleine-koenig@pengutronix.de>
 <20210803100150.1543597-6-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210803100150.1543597-6-u.kleine-koenig@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Aug 03, 2021 at 12:01:49PM +0200, Uwe Kleine-König wrote:
> This prepares removing the driver member of struct pci_dev which holds the
> same information than struct pci_dev::dev->driver.

...

> +	struct pci_driver *pdrv;

Missed blank line here and everywhere else. I don't remember if it's a
checkpatch who complains on this.

> +	return (pdev && (pdrv = pci_driver_of_dev(pdev))) ? pdrv->name : "<null>";

-- 
With Best Regards,
Andy Shevchenko



