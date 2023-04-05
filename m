Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E38556D87E8
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 22:12:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518621.805366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk9U1-0000Nn-1h; Wed, 05 Apr 2023 20:11:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518621.805366; Wed, 05 Apr 2023 20:11:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk9U0-0000Lh-VE; Wed, 05 Apr 2023 20:11:52 +0000
Received: by outflank-mailman (input) for mailman id 518621;
 Wed, 05 Apr 2023 20:11:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S8B2=74=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1pk9U0-0000Lb-9B
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 20:11:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19985bcf-d3ee-11ed-85db-49a42c6b2330;
 Wed, 05 Apr 2023 22:11:51 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9660962810;
 Wed,  5 Apr 2023 20:11:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADAFAC433EF;
 Wed,  5 Apr 2023 20:11:48 +0000 (UTC)
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
X-Inumbo-ID: 19985bcf-d3ee-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680725509;
	bh=RtwX6KJxYQmKc5eE6Ge2DG54ynisAFNybPH8hjW2Myw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=dHKfeTPAenu64KkcwFR/WKz+RNZhtj4dMwwpBM3wvHCNU/ZTyHF9/pkW9hknVc0cZ
	 w7fp/t1tuFEZE/K5DTqgSzyGrz1qcWh7zusMfq4giOpy8g4OyLvojp9PCs9I6WB4rK
	 clFPb/fo8eu8ihkbsVTM4o62kBSyBDbIXU0jPgtBXm9exOFcJgVYeiMbQUYkfN6EK9
	 XV0ezMaCDooYBPeJf/A5iyTsnCn5G67bVixFgikYhvxBzUA3VpHE5+iVnBVoFC2sqe
	 xqiRjZGTB6oUN9IMzacEfdZ6ZznSh88QQVnCkDLmIu9+eOrCekx5YQQmw2U3RHRDgl
	 zr5da0P/R5hug==
Date: Wed, 5 Apr 2023 15:11:47 -0500
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
	Andrew Lunn <andrew@lunn.ch>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Nicholas Piggin <npiggin@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Rich Felker <dalias@libc.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Miguel Ojeda <ojeda@kernel.org>, Matt Turner <mattst88@gmail.com>,
	Anatolij Gustschin <agust@denx.de>,
	"David S. Miller" <davem@davemloft.net>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH v8 5/7] PCI: Allow pci_bus_for_each_resource() to take
 less arguments
Message-ID: <20230405201147.GA3637852@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZC1glzw4F9F8zCK+@smile.fi.intel.com>

On Wed, Apr 05, 2023 at 02:50:47PM +0300, Andy Shevchenko wrote:
> On Thu, Mar 30, 2023 at 07:24:32PM +0300, Andy Shevchenko wrote:
> > Refactor pci_bus_for_each_resource() in the same way as it's done in
> > pci_dev_for_each_resource() case. This will allow to hide iterator
> > inside the loop, where it's not used otherwise.
> > 
> > No functional changes intended.
> 
> Bjorn, this has wrong author in your tree:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=resource&id=46dbad19a59e0dd8f1e7065e5281345797fbb365

I botched it, sorry, should be fixed now.

Bjorn

