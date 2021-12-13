Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8867C472050
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 06:15:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245800.424073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwdgA-0005lg-La; Mon, 13 Dec 2021 05:15:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245800.424073; Mon, 13 Dec 2021 05:15:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwdgA-0005jT-HY; Mon, 13 Dec 2021 05:15:14 +0000
Received: by outflank-mailman (input) for mailman id 245800;
 Mon, 13 Dec 2021 05:15:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6tW/=Q6=kernel.org=vkoul@srs-se1.protection.inumbo.net>)
 id 1mwdg9-0005g1-6P
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 05:15:13 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a512f669-5bd3-11ec-bf02-3911bdbc85ab;
 Mon, 13 Dec 2021 06:15:11 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 86CBCB80B71;
 Mon, 13 Dec 2021 05:15:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74EBFC341C5;
 Mon, 13 Dec 2021 05:15:08 +0000 (UTC)
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
X-Inumbo-ID: a512f669-5bd3-11ec-bf02-3911bdbc85ab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639372509;
	bh=twArdFoN7hptxwDxuCRLPZ8D1bdEpmpF3bPhs8kTAGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l5Fm5uAniw55hjSdbzftitrFAWWz32Vx3VgWE+btKlO63m2/tFA3/bv1QYeZIG+LW
	 vUJdax7Yw6F/Ajk03jA6N9MxJNQFQPNdccFHfKQ4s7/7I4jY8J0ztiEoz3lwDMSrMj
	 Au+niCjhEXCCZiWnPCwZ+FSb9gwqJGQ9s4QAZQG78Tdq3X5hjrvbvRvVE9t2b/uMjy
	 2j0lKrOYwiYfKHJYq9myUv2AWh/KF9zOY6r3L9C4J/YMy2cBf6e8SdfVI0w4eYZVFM
	 ZP39KPOOIDsA+jVKZbJqEWZD1EDrG6T2dKX4uRjCOz2n42IAMyNd4ZGry200oP740A
	 5/0yla012xpJQ==
Date: Mon, 13 Dec 2021 10:45:05 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Marc Zygnier <maz@kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
	linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	dmaengine@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	xen-devel@lists.xenproject.org, Arnd Bergmann <arnd@arndb.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>,
	Stuart Yoder <stuyoder@gmail.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	iommu@lists.linux-foundation.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Sinan Kaya <okaya@kernel.org>
Subject: Re: [patch V3 34/35] soc: ti: ti_sci_inta_msi: Get rid of
 ti_sci_inta_msi_get_virq()
Message-ID: <YbbW2Ui22OeohXKE@matsya>
References: <20211210221642.869015045@linutronix.de>
 <20211210221815.269468319@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211210221815.269468319@linutronix.de>

On 10-12-21, 23:19, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> Just use the core function msi_get_virq().

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

