Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AF5479732
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 23:31:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248935.429367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myLjz-0001KT-Iw; Fri, 17 Dec 2021 22:30:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248935.429367; Fri, 17 Dec 2021 22:30:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myLjz-0001Hk-FG; Fri, 17 Dec 2021 22:30:15 +0000
Received: by outflank-mailman (input) for mailman id 248935;
 Fri, 17 Dec 2021 22:30:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5AUT=RC=kernel.org=nathan@srs-se1.protection.inumbo.net>)
 id 1myLjx-0001He-Jz
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 22:30:13 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5a2354a-5f88-11ec-85d3-df6b77346a89;
 Fri, 17 Dec 2021 23:30:11 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AEC59B82B21;
 Fri, 17 Dec 2021 22:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E46BC36AE2;
 Fri, 17 Dec 2021 22:30:03 +0000 (UTC)
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
X-Inumbo-ID: e5a2354a-5f88-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639780209;
	bh=8wwtNzd+gqMtJWZe56YrMEoqcAh58nCen38oaJYWaO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iEDPDsKO98XO/jvJbm+yFgRmQxDl4CmwNCCZ9O7HpbCSEXJA25pw5YHPwb3s5TQNN
	 i9BY1ubFlnf5uG9DhdB1upZgn3wBZ2U7zEKoZbzzSqONfP1iWr0lR/mc6vKNukUu4Y
	 v3rmzZ7PuTCgGnrM38gn5DW9gYtmVN5J+BeNUM4EZYyS4A+dHs/rlpxPuADA19S0dn
	 neVNoMO0dY5ql14VUQ62/P1PHlq3AtDvEc5p5JSO8vS0wwfJA0S0NhJ71hctL2lZr6
	 u+JH0mJiYdoKOw4PkNyE8E1OMgv4ObOm4BwqrAiECJ8clDjSowxx7LeV6ApqW7P8A6
	 w01dCRvRkkngQ==
Date: Fri, 17 Dec 2021 15:30:00 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Marc Zygnier <maz@kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
	linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	Arnd Bergmann <arnd@arndb.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>,
	Stuart Yoder <stuyoder@gmail.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	dmaengine@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Sinan Kaya <okaya@kernel.org>
Subject: Re: [patch V3 28/35] PCI/MSI: Simplify pci_irq_get_affinity()
Message-ID: <Yb0PaCyo/6z3XOlf@archlinux-ax161>
References: <20211210221642.869015045@linutronix.de>
 <20211210221814.900929381@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211210221814.900929381@linutronix.de>

Hi Thomas,

On Fri, Dec 10, 2021 at 11:19:26PM +0100, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> Replace open coded MSI descriptor chasing and use the proper accessor
> functions instead.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Apologies if this has already been reported somewhere else or already
fixed, I did a search of all of lore and did not see anything similar to
it and I did not see any new commits in -tip around this.

I just bisected a boot failure on my AMD test desktop to this patch as
commit f48235900182 ("PCI/MSI: Simplify pci_irq_get_affinity()") in
-next. It looks like there is a problem with the NVMe drive after this
change according to the logs. Given that the hard drive is not getting
mounted for journald to write logs to, I am not really sure how to get
them from the machine so I have at least taken a picture of what I see
on my screen; open to ideas on that front!

https://github.com/nathanchance/bug-files/blob/0d25d78b5bc1d5e9c15192b3bc80676364de8287/f48235900182/crash.jpg

Please let me know what information I can provide to make debugging this
easier and I am more than happy to apply and test patches as needed.

Cheers,
Nathan

