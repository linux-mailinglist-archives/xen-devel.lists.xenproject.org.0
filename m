Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4356C550D
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 20:35:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513579.794785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf4FA-0000Br-QF; Wed, 22 Mar 2023 19:35:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513579.794785; Wed, 22 Mar 2023 19:35:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf4FA-00009f-NL; Wed, 22 Mar 2023 19:35:32 +0000
Received: by outflank-mailman (input) for mailman id 513579;
 Wed, 22 Mar 2023 19:35:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h6FB=7O=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1pf4FA-00009Z-1l
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 19:35:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b37c37b4-c8e8-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 20:35:29 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7326A62276;
 Wed, 22 Mar 2023 19:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98B3CC433D2;
 Wed, 22 Mar 2023 19:35:26 +0000 (UTC)
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
X-Inumbo-ID: b37c37b4-c8e8-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679513726;
	bh=FhntRrT8ocoSuGXxtLHKzHWzymmkrlLBWHmrPDDVUUo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=TZXj21NeIUkUZZar7VNMqh3dVSuN3o8smKLoGeKlxFM4u9gfOpaC3kuIEPrC8theJ
	 EjPJVc9oufTxzPD7G4Hc8hmuSNFg5ASYHNUqVWj4Pm/PAM0cm4Y0hL/TmGR1vF7cRJ
	 ghHYAN2nzfJSugY4ZFFucSttfz82MaXOPTFpw736rSuhY7yG3U/x5krQWe30aNyfH3
	 TpCuc9D3+sHvl4qsdpIcmDaIEydMxpzHx8G9wZuc/iInxcv8qZuNxXLKv+GJGD4EfH
	 DaiPCrrrg2VbKAwdhc5c78r9UJzE633kYTaRwA7Xko4oXiDWsAIH0RPGJpwYNqkaDa
	 lXTFXlUZ+LxhA==
Date: Wed, 22 Mar 2023 14:35:25 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
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
Subject: Re: [PATCH v6 2/4] PCI: Split pci_bus_for_each_resource_p() out of
 pci_bus_for_each_resource()
Message-ID: <20230322193525.GA2487882@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320131633.61680-3-andriy.shevchenko@linux.intel.com>

On Mon, Mar 20, 2023 at 03:16:31PM +0200, Andy Shevchenko wrote:
> ...

> -#define pci_bus_for_each_resource(bus, res, i)				\
> -	for (i = 0;							\
> -	    (res = pci_bus_resource_n(bus, i)) || i < PCI_BRIDGE_RESOURCE_NUM; \
> -	     i++)
> +#define __pci_bus_for_each_resource(bus, res, __i, vartype)			\
> +	for (vartype __i = 0;							\
> +	     res = pci_bus_resource_n(bus, __i), __i < PCI_BRIDGE_RESOURCE_NUM;	\
> +	     __i++)
> +
> +#define pci_bus_for_each_resource(bus, res, i)					\
> +	__pci_bus_for_each_resource(bus, res, i, )
> +
> +#define pci_bus_for_each_resource_p(bus, res)					\
> +	__pci_bus_for_each_resource(bus, res, __i, unsigned int)

I like these changes a lot, too!

Same comments about _p vs _idx and __pci_bus_for_each_resource(...,
vartype).

Also would prefer 80 char max instead of 81.

