Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF6A48A9FA
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 09:57:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255642.438113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Cxz-00076N-0A; Tue, 11 Jan 2022 08:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255642.438113; Tue, 11 Jan 2022 08:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Cxy-00073D-Sy; Tue, 11 Jan 2022 08:57:18 +0000
Received: by outflank-mailman (input) for mailman id 255642;
 Tue, 11 Jan 2022 08:57:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0MQM=R3=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1n7Cxx-000737-TE
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 08:57:18 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 785fbb1b-72bc-11ec-81c1-a30af7de8005;
 Tue, 11 Jan 2022 09:57:15 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 0D8D4CE0B9A;
 Tue, 11 Jan 2022 08:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01CF8C36AE9;
 Tue, 11 Jan 2022 08:57:10 +0000 (UTC)
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
X-Inumbo-ID: 785fbb1b-72bc-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1641891431;
	bh=NdxodxWZzbwf/ggHaYd5sNJGA5eNob24Z1IUAg07QCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iqf1MXWMDx5bH13jjIOAjklovdMj8eHdh2yjJ9sI6CIPbsTZ1HDFHYiOxxhGg4lFf
	 r/YSSUY+h33izj2tH2lWc2MpP6jlI4gx2RkJiwtH7SCOwjWlBExjRtQAwJS6lU+cEK
	 orMkCoJgFyb0Iu6/5Lyj5ncCu7ThKgpUGn6nfkWc=
Date: Tue, 11 Jan 2022 09:57:08 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Marc Zygnier <maz@kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
	linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
	xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Logan Gunthorpe <logang@deltatee.com>, Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
	linux-ntb@googlegroups.com
Subject: Re: [patch] genirq/msi: Populate sysfs entry only once
Message-ID: <Yd1GZMvstSNTc80B@kroah.com>
References: <20211206210600.123171746@linutronix.de>
 <20211206210749.224917330@linutronix.de>
 <87leznqx2a.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87leznqx2a.ffs@tglx>

On Mon, Jan 10, 2022 at 07:12:45PM +0100, Thomas Gleixner wrote:
> The MSI entries for multi-MSI are populated en bloc for the MSI descriptor,
> but the current code invokes the population inside the per interrupt loop
> which triggers a warning in the sysfs code and causes the interrupt
> allocation to fail.
> 
> Move it outside of the loop so it works correctly for single and multi-MSI.
> 
> Fixes: bf5e758f02fc ("genirq/msi: Simplify sysfs handling")
> Reported-by: Borislav Petkov <bp@alien8.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  kernel/irq/msi.c |   11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

