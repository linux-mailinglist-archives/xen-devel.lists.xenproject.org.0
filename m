Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3263B6B5415
	for <lists+xen-devel@lfdr.de>; Fri, 10 Mar 2023 23:16:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508615.783448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pal1g-00060P-SV; Fri, 10 Mar 2023 22:15:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508615.783448; Fri, 10 Mar 2023 22:15:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pal1g-0005yS-Pu; Fri, 10 Mar 2023 22:15:48 +0000
Received: by outflank-mailman (input) for mailman id 508615;
 Fri, 10 Mar 2023 22:15:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hZM8=7C=kernel.org=kbusch@srs-se1.protection.inumbo.net>)
 id 1pal1e-0005yM-VB
 for xen-devel@lists.xenproject.org; Fri, 10 Mar 2023 22:15:46 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a9bce6a-bf91-11ed-87f5-c1b5be75604c;
 Fri, 10 Mar 2023 23:15:45 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BDC6BB82428;
 Fri, 10 Mar 2023 22:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 749CFC433EF;
 Fri, 10 Mar 2023 22:15:40 +0000 (UTC)
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
X-Inumbo-ID: 1a9bce6a-bf91-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678486543;
	bh=DBl3XYhVnPnvHREV6khsX0zced8HUvT1CffAKeLd3Ro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OfS4jME/FTj7znUmYf295mHvCJSGHW15meDAWvWzrPF00ribhkkR54Qzq1xN8JWLo
	 4ifTzybHNa9ZODC6VxC42vmMGTVR8rpuWOM6tKK420xu8RHuuxnRruXC7YKzvCsgbR
	 u/3W/J52kt+Sw35gEY+GHE+yc90z2JKYQ8ziYt9KjcC+XD8bNVo3dAsYq1L9Dq9Z0P
	 F78mqifIRtEWY9l2xPq1eww1JPlj0DytsnzKq9XlcZ3XWB4shMaJ1Gp356DNbpjhAm
	 fT6kd6cAHwWNZ9v/mPpirze0bthx/rOXMwvra8reVtn+1Ve3YO1CPCN4cOH1gbnOxg
	 +A+CV4nR0FY6w==
Date: Fri, 10 Mar 2023 15:15:38 -0700
From: Keith Busch <kbusch@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Bjorn Helgaas <helgaas@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
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
Subject: Re: [PATCH v4 1/4] PCI: Introduce pci_dev_for_each_resource()
Message-ID: <ZAusCnLSXeEcpQs+@kbusch-mbp.dhcp.thefacebook.com>
References: <20230310171416.23356-1-andriy.shevchenko@linux.intel.com>
 <20230310171416.23356-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310171416.23356-2-andriy.shevchenko@linux.intel.com>

On Fri, Mar 10, 2023 at 07:14:13PM +0200, Andy Shevchenko wrote:
> +#define __pci_dev_for_each_resource(dev, res, __i, vartype)		\
> +	for (vartype __i = 0;						\
> +		res = &(dev)->resource[__i], __i < PCI_NUM_RESOURCES;	\
> +		__i++)

...

> +#define pci_dev_for_each_resource_p(dev, res)				\
> +	__pci_dev_for_each_resource(dev, res, i, unsigned int)

It looks dangerous to have a macro declare a variable when starting a new
scope. How do you know the name 'i' won't clash with something defined above?

