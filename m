Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4C146B464
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 08:47:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240596.417215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muVBx-0007q4-KP; Tue, 07 Dec 2021 07:47:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240596.417215; Tue, 07 Dec 2021 07:47:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muVBx-0007mt-Gv; Tue, 07 Dec 2021 07:47:13 +0000
Received: by outflank-mailman (input) for mailman id 240596;
 Tue, 07 Dec 2021 07:47:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3MF5=QY=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1muVAE-00031l-LW
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 07:45:26 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a300ee6b-5731-11ec-a5e1-b9374ead2679;
 Tue, 07 Dec 2021 08:45:25 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 5F5CFCE19FC;
 Tue,  7 Dec 2021 07:45:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE83C341C1;
 Tue,  7 Dec 2021 07:45:21 +0000 (UTC)
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
X-Inumbo-ID: a300ee6b-5731-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1638863121;
	bh=x8rfoXc6M9OTPg850eW6BmKW89RExZgEThtugpTz+6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d+jxkiN+f3Ne67zNIOcujASWUugViQ8TCbEK7hiYq+U3n+Fahxn1L0f30VN8pbizc
	 hZNBuPiZATbQ+AOim8phsr2YKIPQl8JKLp/83pYydRrndRT/TnSSzHpxTclp34m7lF
	 oxqIgoW6u6pwrjoz/ow2obv1+OJVMNbiDW5DGKmY=
Date: Tue, 7 Dec 2021 08:45:19 +0100
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
Subject: Re: [patch V2 16/23] PCI/MSI: Split out CONFIG_PCI_MSI independent
 part
Message-ID: <Ya8RD/4MMG8LLzDR@kroah.com>
References: <20211206210147.872865823@linutronix.de>
 <20211206210224.710137730@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206210224.710137730@linutronix.de>

On Mon, Dec 06, 2021 at 11:27:49PM +0100, Thomas Gleixner wrote:
> These functions are required even when CONFIG_PCI_MSI is not set. Move them
> to their own file.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>


Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>



