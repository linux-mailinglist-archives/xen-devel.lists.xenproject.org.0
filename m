Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D7BA0C5B1
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 00:30:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870858.1281922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXTsD-0005Qf-MD; Mon, 13 Jan 2025 23:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870858.1281922; Mon, 13 Jan 2025 23:29:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXTsD-0005OU-Je; Mon, 13 Jan 2025 23:29:33 +0000
Received: by outflank-mailman (input) for mailman id 870858;
 Mon, 13 Jan 2025 23:29:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=09kq=UF=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1tXTsC-0005OO-DN
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2025 23:29:32 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c12fd26-d206-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 00:29:30 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 33E04A40169;
 Mon, 13 Jan 2025 23:27:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4AB5C4CEE2;
 Mon, 13 Jan 2025 23:29:27 +0000 (UTC)
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
X-Inumbo-ID: 3c12fd26-d206-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736810968;
	bh=AYgvKjxUUMQocZwtApGtSj7HO+lGgOyrLK+q7G5z7Fs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Y1KfpmFD1JgQ52ESL70pewXErRFdGFRomAb+pZFVELWj2LfL9Msq/2+bDJM/YLNFZ
	 BU62SVewks/Oi1WbmzmMHGXpsiCJK08ishrNbJeBiWJeGV+GhTtWdVWCtkB95SwKau
	 qtamJHT0B79ISmPKJSSi/kTgTNcB9bnqX2ojMa9xAuT+31s0Z/41VJ9BZq4G3CU1tb
	 hsGeIbhrK3YJJpo9SjhvzJ7EmlcnbLVRwLhVxVEy/sTdBD8PuoDYaxKIUjH7YCQHtc
	 8/51xEwNPZgI8cXIA5l6dHTNShxGCjYtuH2tnDo8nlQJUxq54kdFbEzz0CyZ4GHSz9
	 1J8ZNfHF02kqQ==
Date: Mon, 13 Jan 2025 17:29:26 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH 1/3] xen/pci: do not register devices outside of PCI
 segment scope
Message-ID: <20250113232926.GA442589@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z4TokbA1s3OyNdjt@macbook.local>

On Mon, Jan 13, 2025 at 11:18:57AM +0100, Roger Pau Monné wrote:
> On Fri, Jan 10, 2025 at 04:21:29PM -0600, Bjorn Helgaas wrote:
> > On Fri, Jan 10, 2025 at 03:01:48PM +0100, Roger Pau Monne wrote:
> > > The PCI segment value is limited to 16 bits, however there are buses like VMD
> > > that fake being part of the PCI topology by adding segment with a number
> > > outside the scope of the PCI firmware specification range (>= 0x10000). The
> > > MCFG ACPI Table "PCI Segment Group Number" field is defined as having a 16 bit
> > > width.
> > >
> > > Attempting to register or manage those devices with Xen would result in errors
> > > at best, or overlaps with existing devices living on the truncated equivalent
> > > segment values.
> > 
> > The ACPI _SEG method (ACPI r6.5, sec 6.5.6) and the corresponding
> > value in the MCFG table (PCI Firmware r3.3, sec 4.1.2) are clearly
> > 16-bit values.
> > 
> > But otherwise, the segment value is pretty much an arbitrary software
> > value, and the kernel works fine with the larger domain values from
> > vmd_find_free_domain(), so this isn't quite enough to explain what the
> > issue with Xen is.
> > 
> > Does Xen truncate the domain to 16 bits or use it to look up something
> > in ACPI?
> 
> In the interface between Xen and Linux the segment field is 16 bit
> width, so with the current interface is not possible to reference
> devices that are past the 0xffff segment.

I think this specific reason (and maybe even struct
physdev_pci_device_add) would be more useful than the ACPI _SEG and
MCFG things, which are not as directly connected here.

Bjorn

