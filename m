Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E66CE700F74
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 21:50:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533888.830882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxYl8-0003GC-02; Fri, 12 May 2023 19:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533888.830882; Fri, 12 May 2023 19:48:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxYl7-0003E1-Sd; Fri, 12 May 2023 19:48:57 +0000
Received: by outflank-mailman (input) for mailman id 533888;
 Fri, 12 May 2023 19:48:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t8+i=BB=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1pxYl6-0003Dv-9O
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 19:48:56 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05a12523-f0fe-11ed-8611-37d641c3527e;
 Fri, 12 May 2023 21:48:53 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DFCC365849;
 Fri, 12 May 2023 19:48:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04CD3C433D2;
 Fri, 12 May 2023 19:48:51 +0000 (UTC)
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
X-Inumbo-ID: 05a12523-f0fe-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683920931;
	bh=UJAu/sEPUEjYwNghUWoNUhNjtFQtSfleebB2APfRPuI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=izATGEJPbIV3K4bCaiKo7Hs1883mTtDq56tAMqR9b8VXex2H1Ta5qXbJ34DUMlipI
	 hkP36Hf18gfQ/c5WhLTbqHxqmGDxT8c6GZsTNVnFEdOQaZaJ/oYwHmrit1EAw1x+1Y
	 2z22L2JvUWHTpA485tRqm3EMRgDgtReOCU64LBI1xffqjx2Y+7vetzAwosC65+lInq
	 x9YdWwtXI3O85iO05qxJMbcPnrLIE+gUjS7LacDVi8KOmMYZ7RSibPwc0Q194zjna+
	 tNHv7vuMAsogyAVpsXpRcwcmIepl/BM1Pky4mWnjJL9I8gbCdKyEWdBqbLqeB9zbcY
	 repkA1Uz/worA==
Date: Fri, 12 May 2023 14:48:49 -0500
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
Message-ID: <ZF6YIezraETr9iNM@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZF4bXaz2r75dlA5g@smile.fi.intel.com>

On Fri, May 12, 2023 at 01:56:29PM +0300, Andy Shevchenko wrote:
> On Tue, May 09, 2023 at 01:21:22PM -0500, Bjorn Helgaas wrote:
> > On Tue, Apr 04, 2023 at 11:11:01AM -0500, Bjorn Helgaas wrote:
> > > On Thu, Mar 30, 2023 at 07:24:27PM +0300, Andy Shevchenko wrote:
> > > > Provide two new helper macros to iterate over PCI device resources and
> > > > convert users.
> > 
> > > Applied 2-7 to pci/resource for v6.4, thanks, I really like this!
> > 
> > This is 09cc90063240 ("PCI: Introduce pci_dev_for_each_resource()")
> > upstream now.
> > 
> > Coverity complains about each use,
> 
> It needs more clarification here. Use of reduced variant of the
> macro or all of them? If the former one, then I can speculate that
> Coverity (famous for false positives) simply doesn't understand `for
> (type var; var ...)` code.

True, Coverity finds false positives.  It flagged every use in
drivers/pci and drivers/pnp.  It didn't mention the arch/alpha, arm,
mips, powerpc, sh, or sparc uses, but I think it just didn't look at
those.

It flagged both:

  pbus_size_io    pci_dev_for_each_resource(dev, r)
  pbus_size_mem   pci_dev_for_each_resource(dev, r, i)

Here's a spreadsheet with a few more details (unfortunately I don't
know how to make it dump the actual line numbers or analysis like I
pasted below, so "pci_dev_for_each_resource" doesn't appear).  These
are mostly in the "Drivers-PCI" component.

https://docs.google.com/spreadsheets/d/1ohOJwxqXXoDUA0gwopgk-z-6ArLvhN7AZn4mIlDkHhQ/edit?usp=sharing

These particular reports are in the "High Impact Outstanding" tab.

> >	sample below from
> > drivers/pci/vgaarb.c.  I didn't investigate at all, so it might be a
> > false positive; just FYI.
> > 
> > 	  1. Condition screen_info.capabilities & (2U /* 1 << 1 */), taking true branch.
> >   556        if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
> >   557                base |= (u64)screen_info.ext_lfb_base << 32;
> >   558
> >   559        limit = base + size;
> >   560
> >   561        /* Does firmware framebuffer belong to us? */
> > 	  2. Condition __b < PCI_NUM_RESOURCES, taking true branch.
> > 	  3. Condition (r = &pdev->resource[__b]) , (__b < PCI_NUM_RESOURCES), taking true branch.
> > 	  6. Condition __b < PCI_NUM_RESOURCES, taking true branch.
> > 	  7. cond_at_most: Checking __b < PCI_NUM_RESOURCES implies that __b may be up to 16 on the true branch.
> > 	  8. Condition (r = &pdev->resource[__b]) , (__b < PCI_NUM_RESOURCES), taking true branch.
> > 	  11. incr: Incrementing __b. The value of __b may now be up to 17.
> > 	  12. alias: Assigning: r = &pdev->resource[__b]. r may now point to as high as element 17 of pdev->resource (which consists of 17 64-byte elements).
> > 	  13. Condition __b < PCI_NUM_RESOURCES, taking true branch.
> > 	  14. Condition (r = &pdev->resource[__b]) , (__b < PCI_NUM_RESOURCES), taking true branch.
> >   562        pci_dev_for_each_resource(pdev, r) {
> > 	  4. Condition resource_type(r) != 512, taking true branch.
> > 	  9. Condition resource_type(r) != 512, taking true branch.
> > 
> >   CID 1529911 (#1 of 1): Out-of-bounds read (OVERRUN)
> >   15. overrun-local: Overrunning array of 1088 bytes at byte offset 1088 by dereferencing pointer r. [show details]
> >   563                if (resource_type(r) != IORESOURCE_MEM)
> > 	  5. Continuing loop.
> > 	  10. Continuing loop.
> >   564                        continue;
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

