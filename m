Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 171E746B4E5
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 08:57:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240673.417342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muVLP-0007gb-ER; Tue, 07 Dec 2021 07:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240673.417342; Tue, 07 Dec 2021 07:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muVLP-0007dD-Ah; Tue, 07 Dec 2021 07:56:59 +0000
Received: by outflank-mailman (input) for mailman id 240673;
 Tue, 07 Dec 2021 07:56:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3MF5=QY=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1muVDO-0005oY-62
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 07:48:42 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 189eafe4-5732-11ec-a5e1-b9374ead2679;
 Tue, 07 Dec 2021 08:48:41 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D954AB80E8B;
 Tue,  7 Dec 2021 07:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33958C341C1;
 Tue,  7 Dec 2021 07:48:39 +0000 (UTC)
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
X-Inumbo-ID: 189eafe4-5732-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1638863319;
	bh=WhRceJhmzxjby5fPejJ6zCulOVcJWw8H5bLGS/3QcH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SWIJfmNGJimxpVxVrmep8jDL+8fq/9M8tTEfUWTU7yrf8FEhCukCMCNYwcchrGZil
	 KTC2GFjwOHm5Vp8ki83GFWK0/anM//KXBF0T7w4Aubbsae5n/x81pWpLxBWXyc+O0d
	 AKTd3slwt1mIBdgwhnTy90iEA7VRwneYulUqX2fg=
Date: Tue, 7 Dec 2021 08:48:37 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Marc Zygnier <maz@kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
	linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
	Juergen Gross <jgross@suse.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Paul Mackerras <paulus@samba.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linuxppc-dev@lists.ozlabs.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>,
	sparclinux@vger.kernel.org, x86@kernel.org,
	xen-devel@lists.xenproject.org, ath11k@lists.infradead.org,
	Wei Liu <wei.liu@kernel.org>, linux-hyperv@vger.kernel.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [patch V2 23/23] PCI/MSI: Move descriptor counting on allocation
 fail to the legacy code
Message-ID: <Ya8R1eosQhOZbj1q@kroah.com>
References: <20211206210147.872865823@linutronix.de>
 <20211206210225.101336873@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206210225.101336873@linutronix.de>

On Mon, Dec 06, 2021 at 11:28:00PM +0100, Thomas Gleixner wrote:
> The irqdomain code already returns the information. Move the loop to the
> legacy code.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>



