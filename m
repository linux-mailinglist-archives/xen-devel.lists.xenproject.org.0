Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3203E1F77
	for <lists+xen-devel@lfdr.de>; Fri,  6 Aug 2021 01:43:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164603.300906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBn0a-000268-SE; Thu, 05 Aug 2021 23:42:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164603.300906; Thu, 05 Aug 2021 23:42:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBn0a-00023m-P6; Thu, 05 Aug 2021 23:42:40 +0000
Received: by outflank-mailman (input) for mailman id 164603;
 Thu, 05 Aug 2021 23:42:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BoKr=M4=kernel.org=helgaas@srs-us1.protection.inumbo.net>)
 id 1mBn0Y-00023g-JY
 for xen-devel@lists.xenproject.org; Thu, 05 Aug 2021 23:42:38 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cfab36c5-f646-11eb-9c8f-12813bfff9fa;
 Thu, 05 Aug 2021 23:42:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C4D0E610CD;
 Thu,  5 Aug 2021 23:42:35 +0000 (UTC)
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
X-Inumbo-ID: cfab36c5-f646-11eb-9c8f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628206956;
	bh=Z/61WgkabawKvCqT33aQpch4UJfYpbpJ/lpjJTDKmJE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=KuDKmWy8QxzyN9WG7Q1pVzQ6S5j62PkYn7/jQtSiQ405ZyO5HsJaxlGQ4ptwW9KWQ
	 8JzTD06NkExqlaqFClHSIgp3ZV4HCT08Q0ZvAqUHpT3JHz2y5xKJeL0G0pylHGRvn6
	 U5xMy5iYmp2VcbacJIAcWlgxiuyj7K4SXjueq2YyorPxHzpAkvrgrNXJfYWPF6dNbg
	 +rqlXTqZ1NVd0xWfnIPttHUHPunKRAjCa2hTqiMX3yjjCM3obbaCQHJI0obD1yIuBB
	 sBxx4HfHs+13rY1cXK0ifZwIzG7diuJ8rdtPvOtsYTWDljySsOW/3p75koSGgoeKnq
	 J3gIMCJ0Jo3qg==
Date: Thu, 5 Aug 2021 18:42:34 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
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
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Wojciech Ziemba <wojciech.ziemba@intel.com>,
	Alexander Duyck <alexanderduyck@fb.com>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-crypto@vger.kernel.org, qat-linux@intel.com,
	MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org, oss-drivers@corigine.com,
	xen-devel@lists.xenproject.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 0/6] PCI: Drop duplicated tracking of a pci_dev's
 bound driver
Message-ID: <20210805234234.GA1797883@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210803100150.1543597-1-u.kleine-koenig@pengutronix.de>

On Tue, Aug 03, 2021 at 12:01:44PM +0200, Uwe Kleine-K�nig wrote:
> Hello,
> 
> changes since v1 (https://lore.kernel.org/linux-pci/20210729203740.1377045-1-u.kleine-koenig@pengutronix.de):
> 
> - New patch to simplify drivers/pci/xen-pcifront.c, spotted and
>   suggested by Boris Ostrovsky
> - Fix a possible NULL pointer dereference I introduced in xen-pcifront.c
> - A few whitespace improvements
> - Add a commit log to patch #6 (formerly #5)
> 
> I also expanded the audience for patches #4 and #6 to allow affected
> people to actually see the changes to their drivers.
> 
> Interdiff can be found below.
> 
> The idea is still the same: After a few cleanups (#1 - #3) a new macro
> is introduced abstracting access to struct pci_dev->driver. All users
> are then converted to use this and in the last patch the macro is
> changed to make use of struct pci_dev::dev->driver to get rid of the
> duplicated tracking.

I love the idea of this series!

I looked at all the bus_type.probe() methods, it looks like pci_dev is
not the only offender here.  At least the following also have a driver
pointer in the device struct:

  parisc_device.driver
  acpi_device.driver
  dio_dev.driver
  hid_device.driver
  pci_dev.driver
  pnp_dev.driver
  rio_dev.driver
  zorro_dev.driver

Do you plan to do the same for all of them, or is there some reason
why they need the pointer and PCI doesn't?

In almost all cases, other buses define a "to_<bus>_driver()"
interface.  In fact, PCI already has a to_pci_driver().

This series adds pci_driver_of_dev(), which basically just means we
can do this:

  pdrv = pci_driver_of_dev(pdev);

instead of this:

  pdrv = to_pci_driver(pdev->dev.driver);

I don't see any other "<bus>_driver_of_dev()" interfaces, so I assume
other buses just live with the latter style?  I'd rather not be
different and have two ways to get the "struct pci_driver *" unless
there's a good reason.

Looking through the places that care about pci_dev.driver (the ones
updated by patch 5/6), many of them are ... a little dubious to begin
with.  A few need the "struct pci_error_handlers *err_handler"
pointer, so that's probably legitimate.  But many just need a name,
and should probably be using dev_driver_string() instead.

Bjorn

