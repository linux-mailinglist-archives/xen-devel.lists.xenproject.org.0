Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B0446B46F
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 08:47:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240611.417237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muVCW-0000n6-82; Tue, 07 Dec 2021 07:47:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240611.417237; Tue, 07 Dec 2021 07:47:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muVCW-0000k9-3Y; Tue, 07 Dec 2021 07:47:48 +0000
Received: by outflank-mailman (input) for mailman id 240611;
 Tue, 07 Dec 2021 07:47:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3MF5=QY=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1muVCV-0006RR-Ey
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 07:47:47 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f65b593c-5731-11ec-8a4d-196798b21f7b;
 Tue, 07 Dec 2021 08:47:45 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 69B4DCE1A03;
 Tue,  7 Dec 2021 07:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB93BC341C1;
 Tue,  7 Dec 2021 07:47:40 +0000 (UTC)
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
X-Inumbo-ID: f65b593c-5731-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1638863261;
	bh=GJEc5bHESZynwTkpKatK/sv+Oau05bPz5qOKd1zBMSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FLhJjK7rO92G8d3WWjG7tWRQ+BW+rOaBX5Ee1Gl0gD+5ddO+i5XQqu+JCB+cbG68P
	 X06bBa7EJYZKAsQL6qvCO228/ql4ENSodj1f7Q2N+ZvtKwZka/F+1QUWjQmaE+zFif
	 LbTeWJgFzo/EHaecJ068/cqfOkongNyBJMpNwFYI=
Date: Tue, 7 Dec 2021 08:47:39 +0100
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
Subject: Re: [patch V2 21/23] PCI/MSI: Make pci_msi_domain_check_cap() static
Message-ID: <Ya8Rm/cmS4054OvP@kroah.com>
References: <20211206210147.872865823@linutronix.de>
 <20211206210224.980989243@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206210224.980989243@linutronix.de>

On Mon, Dec 06, 2021 at 11:27:57PM +0100, Thomas Gleixner wrote:
> No users outside of that file.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


