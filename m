Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8B6716FA2
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 23:24:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541493.844312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q46p8-0000c8-OD; Tue, 30 May 2023 21:24:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541493.844312; Tue, 30 May 2023 21:24:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q46p8-0000a4-LS; Tue, 30 May 2023 21:24:10 +0000
Received: by outflank-mailman (input) for mailman id 541493;
 Tue, 30 May 2023 21:24:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iU77=BT=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1q46p6-0000Zu-DF
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 21:24:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e2c599b-ff30-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 23:24:06 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B52D263375;
 Tue, 30 May 2023 21:24:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB01EC4339B;
 Tue, 30 May 2023 21:24:03 +0000 (UTC)
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
X-Inumbo-ID: 4e2c599b-ff30-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685481844;
	bh=nSQjRvB5sqKGMsdtyBRHXZYqX4emyOnsRXhxnpxj5CY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=TV1bjAHwa6NLdVZVD7DllGDZUObfyAObgZ8dpZarPA3MFb+4JwjHeGjrah/sKeuB6
	 Xq8Z6uhzHX0F3PKJSdkRh1pFxjO+XorK0VZvx6no556rDJNfISNz+wSJYYSdEmvn7Z
	 hUMZYEgCtddE7YUdKaua4hQLvfWtpf57g3PAd+6ZmWrfu2xY5A7mha+RytVeJ/84Sv
	 mxnDEJPKCDkp/bA6BADO+x5ZZtDdknfJeDc4bcwl2S3en2mWL+rmMtiDyQsmiX2t01
	 UKGSafGTnUjV0OrS31D6yutY2Y59cmVv6Xh9lXe15RO90svr9jvNnhSKkE8vII7TeO
	 VMw5j/h0xzgKQ==
Date: Tue, 30 May 2023 16:24:02 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	Andrew Lunn <andrew@lunn.ch>, sparclinux@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Gregory Clement <gregory.clement@bootlin.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Russell King <linux@armlinux.org.uk>, linux-acpi@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>, xen-devel@lists.xenproject.org,
	Matt Turner <mattst88@gmail.com>,
	Anatolij Gustschin <agust@denx.de>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Juergen Gross <jgross@suse.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>,
	linux-mips@vger.kernel.org,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	linux-alpha@vger.kernel.org,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCH v8 0/7] Add pci_dev_for_each_resource() helper and update
 users
Message-ID: <ZHZpcli2UmdzHgme@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZF6YIezraETr9iNM@bhelgaas>

On Fri, May 12, 2023 at 02:48:51PM -0500, Bjorn Helgaas wrote:
> On Fri, May 12, 2023 at 01:56:29PM +0300, Andy Shevchenko wrote:
> > On Tue, May 09, 2023 at 01:21:22PM -0500, Bjorn Helgaas wrote:
> > > On Tue, Apr 04, 2023 at 11:11:01AM -0500, Bjorn Helgaas wrote:
> > > > On Thu, Mar 30, 2023 at 07:24:27PM +0300, Andy Shevchenko wrote:
> > > > > Provide two new helper macros to iterate over PCI device resources and
> > > > > convert users.
> > > 
> > > > Applied 2-7 to pci/resource for v6.4, thanks, I really like this!
> > > 
> > > This is 09cc90063240 ("PCI: Introduce pci_dev_for_each_resource()")
> > > upstream now.
> > > 
> > > Coverity complains about each use,
> > 
> > It needs more clarification here. Use of reduced variant of the
> > macro or all of them? If the former one, then I can speculate that
> > Coverity (famous for false positives) simply doesn't understand `for
> > (type var; var ...)` code.
> 
> True, Coverity finds false positives.  It flagged every use in
> drivers/pci and drivers/pnp.  It didn't mention the arch/alpha, arm,
> mips, powerpc, sh, or sparc uses, but I think it just didn't look at
> those.
> 
> It flagged both:
> 
>   pbus_size_io    pci_dev_for_each_resource(dev, r)
>   pbus_size_mem   pci_dev_for_each_resource(dev, r, i)
> 
> Here's a spreadsheet with a few more details (unfortunately I don't
> know how to make it dump the actual line numbers or analysis like I
> pasted below, so "pci_dev_for_each_resource" doesn't appear).  These
> are mostly in the "Drivers-PCI" component.
> 
> https://docs.google.com/spreadsheets/d/1ohOJwxqXXoDUA0gwopgk-z-6ArLvhN7AZn4mIlDkHhQ/edit?usp=sharing
> 
> These particular reports are in the "High Impact Outstanding" tab.

Where are we at?  Are we going to ignore this because some Coverity
reports are false positives?

Bjorn

