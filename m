Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BC86D6884
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 18:11:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518040.804182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjjFZ-00086t-Gq; Tue, 04 Apr 2023 16:11:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518040.804182; Tue, 04 Apr 2023 16:11:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjjFZ-000843-EC; Tue, 04 Apr 2023 16:11:13 +0000
Received: by outflank-mailman (input) for mailman id 518040;
 Tue, 04 Apr 2023 16:11:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=efKo=73=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1pjjFX-00083x-Qs
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 16:11:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d2813f0-d303-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 18:11:06 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A8F646366F;
 Tue,  4 Apr 2023 16:11:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C854CC433D2;
 Tue,  4 Apr 2023 16:11:02 +0000 (UTC)
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
X-Inumbo-ID: 4d2813f0-d303-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680624663;
	bh=eKiqHkoBVo1AQRx10HafTawauui+/7aWix/7MTRPGrA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=nkcQpc5NRHDKcALdEO/kD1vJ7JRnALrRH75LPh2TDOMavdcMgvCuVznC7x8x+ecKt
	 1/q7prAN9eClvaAU3c0+dUWFvcRO66V04KGg+gYkb+YrMhjTw0ASpXENR+YKBHmeia
	 3Q5pvbnqrK/uCSEeFKclNxI3vwOX0dUud1/pCQiZ36qwD28S6odWh3QMAvbBbgMd/s
	 C/Qhj0iZpFO3X/jYT9y3J5qKvtPSjj/GrdFNEZo1J9pLwcjwlot2Tv6qfpoajNxUA+
	 o+rmP5HeMIpXk0J+ytkWwcX3yLOfhBvsgasfRd7/C7/NUehmnMEdxtOqmb8yLnHceu
	 ZoK1FHXZYisVQ==
Date: Tue, 4 Apr 2023 11:11:01 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Juergen Gross <jgross@suse.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-pci@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Anatolij Gustschin <agust@denx.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH v8 0/7] Add pci_dev_for_each_resource() helper and update
 users
Message-ID: <20230404161101.GA3554747@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330162434.35055-1-andriy.shevchenko@linux.intel.com>

On Thu, Mar 30, 2023 at 07:24:27PM +0300, Andy Shevchenko wrote:
> Provide two new helper macros to iterate over PCI device resources and
> convert users.
> 
> Looking at it, refactor existing pci_bus_for_each_resource() and convert
> users accordingly.
> 
> Note, the amount of lines grew due to the documentation update.
> 
> Changelog v8:
> - fixed issue with pci_bus_for_each_resource() macro (LKP)
> - due to above added a new patch to document how it works
> - moved the last patch to be #2 (Philippe)
> - added tags (Philippe)
> 
> Changelog v7:
> - made both macros to share same name (Bjorn)

I didn't actually request the same name for both; I would have had no
idea how to even do that :)

v6 had:

  pci_dev_for_each_resource_p(dev, res)
  pci_dev_for_each_resource(dev, res, i)

and I suggested:

  pci_dev_for_each_resource(dev, res)
  pci_dev_for_each_resource_idx(dev, res, i)

because that pattern is used elsewhere.  But you figured out how to do
it, and having one name is even better, so thanks for that extra work!

> - split out the pci_resource_n() conversion (Bjorn)
> 
> Changelog v6:
> - dropped unused variable in PPC code (LKP)
> 
> Changelog v5:
> - renamed loop variable to minimize the clash (Keith)
> - addressed smatch warning (Dan)
> - addressed 0-day bot findings (LKP)
> 
> Changelog v4:
> - rebased on top of v6.3-rc1
> - added tag (Krzysztof)
> 
> Changelog v3:
> - rebased on top of v2 by Mika, see above
> - added tag to pcmcia patch (Dominik)
> 
> Changelog v2:
> - refactor to have two macros
> - refactor existing pci_bus_for_each_resource() in the same way and
>   convert users
> 
> Andy Shevchenko (6):
>   kernel.h: Split out COUNT_ARGS() and CONCATENATE()
>   PCI: Introduce pci_resource_n()
>   PCI: Document pci_bus_for_each_resource() to avoid confusion
>   PCI: Allow pci_bus_for_each_resource() to take less arguments
>   EISA: Convert to use less arguments in pci_bus_for_each_resource()
>   pcmcia: Convert to use less arguments in pci_bus_for_each_resource()
> 
> Mika Westerberg (1):
>   PCI: Introduce pci_dev_for_each_resource()
> 
>  .clang-format                             |  1 +
>  arch/alpha/kernel/pci.c                   |  5 +-
>  arch/arm/kernel/bios32.c                  | 16 +++--
>  arch/arm/mach-dove/pcie.c                 | 10 ++--
>  arch/arm/mach-mv78xx0/pcie.c              | 10 ++--
>  arch/arm/mach-orion5x/pci.c               | 10 ++--
>  arch/mips/pci/ops-bcm63xx.c               |  8 +--
>  arch/mips/pci/pci-legacy.c                |  3 +-
>  arch/powerpc/kernel/pci-common.c          | 21 +++----
>  arch/powerpc/platforms/4xx/pci.c          |  8 +--
>  arch/powerpc/platforms/52xx/mpc52xx_pci.c |  5 +-
>  arch/powerpc/platforms/pseries/pci.c      | 16 ++---
>  arch/sh/drivers/pci/pcie-sh7786.c         | 10 ++--
>  arch/sparc/kernel/leon_pci.c              |  5 +-
>  arch/sparc/kernel/pci.c                   | 10 ++--
>  arch/sparc/kernel/pcic.c                  |  5 +-
>  drivers/eisa/pci_eisa.c                   |  4 +-
>  drivers/pci/bus.c                         |  7 +--
>  drivers/pci/hotplug/shpchp_sysfs.c        |  8 +--
>  drivers/pci/pci.c                         |  3 +-
>  drivers/pci/probe.c                       |  2 +-
>  drivers/pci/remove.c                      |  5 +-
>  drivers/pci/setup-bus.c                   | 37 +++++-------
>  drivers/pci/setup-res.c                   |  4 +-
>  drivers/pci/vgaarb.c                      | 17 ++----
>  drivers/pci/xen-pcifront.c                |  4 +-
>  drivers/pcmcia/rsrc_nonstatic.c           |  9 +--
>  drivers/pcmcia/yenta_socket.c             |  3 +-
>  drivers/pnp/quirks.c                      | 29 ++++-----
>  include/linux/args.h                      | 13 ++++
>  include/linux/kernel.h                    |  8 +--
>  include/linux/pci.h                       | 72 +++++++++++++++++++----
>  32 files changed, 190 insertions(+), 178 deletions(-)
>  create mode 100644 include/linux/args.h

Applied 2-7 to pci/resource for v6.4, thanks, I really like this!

I omitted

  [1/7] kernel.h: Split out COUNT_ARGS() and CONCATENATE()"

only because it's not essential to this series and has only a trivial
one-line impact on include/linux/pci.h.

Bjorn

