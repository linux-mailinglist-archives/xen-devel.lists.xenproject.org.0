Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB9D46B445
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 08:45:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240577.417171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muV9v-00058N-Cm; Tue, 07 Dec 2021 07:45:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240577.417171; Tue, 07 Dec 2021 07:45:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muV9v-00056O-9I; Tue, 07 Dec 2021 07:45:07 +0000
Received: by outflank-mailman (input) for mailman id 240577;
 Tue, 07 Dec 2021 07:45:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3MF5=QY=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1muV9t-0004OI-QY
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 07:45:05 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96ed034d-5731-11ec-8a4d-196798b21f7b;
 Tue, 07 Dec 2021 08:45:05 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 2DAF9CE19DD;
 Tue,  7 Dec 2021 07:45:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A401C341C3;
 Tue,  7 Dec 2021 07:44:59 +0000 (UTC)
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
X-Inumbo-ID: 96ed034d-5731-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1638863100;
	bh=1r1X+ZHiffheVJg5Mf7nrvakcpVQqQbwTurW2S7fT/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l1/QgBFwqoXc2OAqrPg8mXMQvF5rv5z/fNqAHcshOCZgD5tN6DsYDVMKyMum5XpbR
	 tTUmjHxCYxJdHEeYzATtISF27T8l5whlPASeO5DQut4iaiHRSBKvqJ9dh18fp3h8CK
	 xuOWK2ssrIqlzWKMqvooAc5l1otA0m+pE8ZKIdZ4=
Date: Tue, 7 Dec 2021 08:44:57 +0100
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
Subject: Re: [patch V2 14/23] PCI/MSI: Make msix_update_entries() smarter
Message-ID: <Ya8Q+Q8OnrovJGET@kroah.com>
References: <20211206210147.872865823@linutronix.de>
 <20211206210224.600351129@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206210224.600351129@linutronix.de>

On Mon, Dec 06, 2021 at 11:27:46PM +0100, Thomas Gleixner wrote:
> No need to walk the descriptors and check for each one whether the entries
> pointer function argument is NULL. Do it once.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

