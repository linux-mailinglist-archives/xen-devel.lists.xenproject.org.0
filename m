Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB407472052
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 06:15:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245796.424050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwdfe-0004qN-2F; Mon, 13 Dec 2021 05:14:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245796.424050; Mon, 13 Dec 2021 05:14:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwdfd-0004np-VS; Mon, 13 Dec 2021 05:14:41 +0000
Received: by outflank-mailman (input) for mailman id 245796;
 Mon, 13 Dec 2021 05:14:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6tW/=Q6=kernel.org=vkoul@srs-se1.protection.inumbo.net>)
 id 1mwdfc-0004nj-Hh
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 05:14:40 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f57d3bb-5bd3-11ec-a74f-db008197e53d;
 Mon, 13 Dec 2021 06:14:37 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 3B0C9CE0DAF;
 Mon, 13 Dec 2021 05:14:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85F64C00446;
 Mon, 13 Dec 2021 05:14:28 +0000 (UTC)
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
X-Inumbo-ID: 8f57d3bb-5bd3-11ec-a74f-db008197e53d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639372469;
	bh=m+MbzkCsPCJNXsBFySexaUdkbI+fIAKWZPiq+A6GBck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pcDQjwCHOz6BSONU5joUW6e60Mu1jAbxQzts0EfFaFm5JmSfwPYHyrXe+as4aLjeM
	 eFJH1OLum6J0MwbxxotL5Ynx/Wl9FSzFLuVcZ/MiaFGyolmZeXYP0aRrzCZjW5ZdJq
	 Yt5fu6OtnruTRf7YSvoSO+XnwngnSyHnpkVidlaQ4C6iMZ9tlspBmToBaYm7+u5kTp
	 56ZJujbc1BVH7oROt6l/x3asZi1J9mKWjGd5xEZzFFEQ0GglJh+ze5/cFl0ltz5OnT
	 HkJi0GnpAKgWw3QDQFyUKxAUiibgYJ1iBPJwPobSVKG5xk0d9X3x2zWgArHsKu4K1+
	 TCjLAS6Yk203w==
Date: Mon, 13 Dec 2021 10:44:25 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Marc Zygnier <maz@kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
	linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Sinan Kaya <okaya@kernel.org>
Subject: Re: [patch V3 29/35] dmaengine: mv_xor_v2: Get rid of msi_desc abuse
Message-ID: <YbbWsUO6o5ccU5ai@matsya>
References: <20211210221642.869015045@linutronix.de>
 <20211210221814.970099984@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211210221814.970099984@linutronix.de>

On 10-12-21, 23:19, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> Storing a pointer to the MSI descriptor just to keep track of the Linux
> interrupt number is daft. Use msi_get_virq() instead.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

