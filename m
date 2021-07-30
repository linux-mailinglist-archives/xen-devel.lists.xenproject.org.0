Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 676C83DB2AA
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jul 2021 07:16:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162282.297666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9KrO-0001cT-Db; Fri, 30 Jul 2021 05:15:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162282.297666; Fri, 30 Jul 2021 05:15:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9KrO-0001Zr-AO; Fri, 30 Jul 2021 05:15:02 +0000
Received: by outflank-mailman (input) for mailman id 162282;
 Fri, 30 Jul 2021 05:15:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UcsG=MW=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1m9KrM-0001Zl-KW
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 05:15:00 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1528baf3-f0f5-11eb-9881-12813bfff9fa;
 Fri, 30 Jul 2021 05:14:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6AAA660F9B;
 Fri, 30 Jul 2021 05:14:57 +0000 (UTC)
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
X-Inumbo-ID: 1528baf3-f0f5-11eb-9881-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1627622098;
	bh=Rd0qV6oPrMRK9x5RQHEA0i4kdEU0U+RcVzNm4XOeux8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T6hObKQmOk4AFgIpQT4y2Zsi4Q75SgNjFNnS8pRLR4KFvnEyagvEfbTCdxstRLsYG
	 rjTcpLBlDG/oVJ8lnaqbcwXAZTVT9l8C6Cy6bhh3Fo+ilPrCNthbqlfZm24+7rNODV
	 PAMI7xMjSKfCoNPXlo3uccVRt1pE46rn5PvW/dE4=
Date: Fri, 30 Jul 2021 07:14:55 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>, kernel@pengutronix.de,
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
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Wojciech Ziemba <wojciech.ziemba@intel.com>,
	Alexander Duyck <alexanderduyck@fb.com>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-crypto@vger.kernel.org, qat-linux@intel.com,
	MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org, oss-drivers@corigine.com,
	xen-devel@lists.xenproject.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v1 0/5] PCI: Drop duplicated tracking of a pci_dev's
 bound driver
Message-ID: <YQOKz0l6aaU8PGLV@kroah.com>
References: <20210729203740.1377045-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210729203740.1377045-1-u.kleine-koenig@pengutronix.de>

On Thu, Jul 29, 2021 at 10:37:35PM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> struct pci_dev tracks the bound pci driver twice. This series is about
> removing this duplication.
> 
> The first two patches are just cleanups. The third patch introduces a
> wrapper that abstracts access to struct pci_dev->driver. In the next
> patch (hopefully) all users are converted to use the new wrapper and
> finally the fifth patch removes the duplication.
> 
> Note this series is only build tested (allmodconfig on several
> architectures).
> 
> I'm open to restructure this series if this simplifies things. E.g. the
> use of the new wrapper in drivers/pci could be squashed into the patch
> introducing the wrapper. Patch 4 could be split by maintainer tree or
> squashed into patch 3 completely.
> 
> Best regards
> Uwe
> 
> Uwe Kleine-König (5):
>   PCI: Simplify pci_device_remove()
>   PCI: Drop useless check from pci_device_probe()
>   PCI: Provide wrapper to access a pci_dev's bound driver
>   PCI: Adapt all code locations to not use struct pci_dev::driver
>     directly
>   PCI: Drop duplicated tracking of a pci_dev's bound driver

Other than my objection to patch 5/5 lack of changelog, looks sane to
me:

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

