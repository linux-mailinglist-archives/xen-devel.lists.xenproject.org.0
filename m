Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B3046B49E
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 08:52:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240629.417281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muVGv-0003py-MF; Tue, 07 Dec 2021 07:52:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240629.417281; Tue, 07 Dec 2021 07:52:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muVGv-0003o4-HT; Tue, 07 Dec 2021 07:52:21 +0000
Received: by outflank-mailman (input) for mailman id 240629;
 Tue, 07 Dec 2021 07:52:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3MF5=QY=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1muVGu-0003mG-Dy
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 07:52:20 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a47d1bc-5732-11ec-a5e1-b9374ead2679;
 Tue, 07 Dec 2021 08:52:19 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C4F0EB816D8;
 Tue,  7 Dec 2021 07:52:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 780C2C341C3;
 Tue,  7 Dec 2021 07:52:16 +0000 (UTC)
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
X-Inumbo-ID: 9a47d1bc-5732-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1638863537;
	bh=YYyYDqi7BKUMM2VLzZGPdlwcQYloLbHu+PMAAmx4vhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lrf2b5VSroC8kPE/EiMROJoVWuZNxt44LjP49Y2om8BhI+BBXM8o24IwyEFOVAbJ9
	 6DDZrdJtryDpOkn0TScv95xjBYKuAaQom3T6s67hk1FezNRypOhHKdh/ZpWaMaCohx
	 8uO6pfgsd8KtuoUxhX/hHicEdoYvaTBX5V3Rkp40=
Date: Tue, 7 Dec 2021 08:52:14 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Marc Zygnier <maz@kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
	linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
	xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
	Will Deacon <will@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	iommu@lists.linux-foundation.org, dmaengine@vger.kernel.org,
	Stuart Yoder <stuyoder@gmail.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Robin Murphy <robin.murphy@arm.com>, Sinan Kaya <okaya@kernel.org>
Subject: Re: [patch V2 23/36] powerpc/cell/axon_msi: Use MSI device properties
Message-ID: <Ya8SrlbeCdsN7ujX@kroah.com>
References: <20211206210307.625116253@linutronix.de>
 <20211206210438.913603962@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206210438.913603962@linutronix.de>

On Mon, Dec 06, 2021 at 11:39:33PM +0100, Thomas Gleixner wrote:
> instead of fiddling with MSI descriptors.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


