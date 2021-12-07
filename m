Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED3F46B43A
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 08:44:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240562.417149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muV97-0003uw-OJ; Tue, 07 Dec 2021 07:44:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240562.417149; Tue, 07 Dec 2021 07:44:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muV97-0003s1-K7; Tue, 07 Dec 2021 07:44:17 +0000
Received: by outflank-mailman (input) for mailman id 240562;
 Tue, 07 Dec 2021 07:44:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3MF5=QY=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1muV96-00031l-6n
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 07:44:16 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 784b3ebe-5731-11ec-a5e1-b9374ead2679;
 Tue, 07 Dec 2021 08:44:14 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id EC409CE19ED;
 Tue,  7 Dec 2021 07:44:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62DD6C341C1;
 Tue,  7 Dec 2021 07:44:07 +0000 (UTC)
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
X-Inumbo-ID: 784b3ebe-5731-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1638863047;
	bh=Yz0WH2dr1QgSK49CFe7iFQ+XeVnQkWXGdacZietp0hE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ubBF0Z2AfejKCYJIZteJrserEv0J9NT01LNRNKJ/KrLN5gKu3YqoZRB1nmERkKkDS
	 kJLnHlpBhYYtt+efX5t4G162exIvYkUrzrZgqARbx50OcrLfiwASrgs5YBjwZXr4hL
	 Jhs1l7eEN7akG3UcGvqXKzHIDcpxgb/0gFN5lhYI=
Date: Tue, 7 Dec 2021 08:44:05 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Marc Zygnier <maz@kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
	linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
	Juergen Gross <jgross@suse.com>, Kalle Valo <kvalo@codeaurora.org>,
	sparclinux@vger.kernel.org, x86@kernel.org,
	xen-devel@lists.xenproject.org, ath11k@lists.infradead.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Paul Mackerras <paulus@samba.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linuxppc-dev@lists.ozlabs.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
	linux-hyperv@vger.kernel.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [patch V2 10/23] genirq/msi, treewide: Use a named struct for
 PCI/MSI attributes
Message-ID: <Ya8QxSUKbVEHHSGh@kroah.com>
References: <20211206210147.872865823@linutronix.de>
 <20211206210224.374863119@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206210224.374863119@linutronix.de>

On Mon, Dec 06, 2021 at 11:27:39PM +0100, Thomas Gleixner wrote:
> The unnamed struct sucks and is in the way of further cleanups. Stick the
> PCI related MSI data into a real data structure and cleanup all users.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Acked-by: Kalle Valo <kvalo@codeaurora.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: sparclinux@vger.kernel.org
> Cc: x86@kernel.org
> Cc: xen-devel@lists.xenproject.org
> Cc: ath11k@lists.infradead.org

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

