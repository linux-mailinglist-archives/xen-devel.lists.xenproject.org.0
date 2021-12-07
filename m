Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 693AC46C542
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 21:57:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241833.418369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muhWd-0006l4-Tx; Tue, 07 Dec 2021 20:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241833.418369; Tue, 07 Dec 2021 20:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muhWd-0006jC-Q3; Tue, 07 Dec 2021 20:57:23 +0000
Received: by outflank-mailman (input) for mailman id 241833;
 Tue, 07 Dec 2021 20:57:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/XZh=QY=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1muhWc-0005FD-UW
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 20:57:22 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45fe27ef-57a0-11ec-9d12-4777fae47e2b;
 Tue, 07 Dec 2021 21:57:22 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0B7F8B81E94;
 Tue,  7 Dec 2021 20:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C95C341C8;
 Tue,  7 Dec 2021 20:57:21 +0000 (UTC)
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
X-Inumbo-ID: 45fe27ef-57a0-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638910641;
	bh=p4nzpRhPjzZYY/2joI+5ST1wSIqa+dnFOH02Wt6TY90=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=TBxT84AbL5Gep1COvq7TErtiHgXwTDw0MqC9DWEsU3bt1FgCmBhl92LueC5uhijkJ
	 /AD3uh3vlBBztJBVIuEXGD39HkvRqAw2mmADUNrbGv8igflwAI51FTrrlhOCh7CDjA
	 JipWm7z8+pwAofUYL8YQ4KeHO2uQrmr42qs33txntiRVsX4QM5pQiASWsxcQeT9JnJ
	 Q7nKN6B9u2c3unSau2PIUrC+WNRDmQr0NBXm2YWSOwlW431/1LNllTpk2xQvdwBDWx
	 jRXpt3dwtRz/SnDxd9nv1DqQPFXA2DpbOUl8hDquMhSry+d0h0MDbGrJJ0q+aeDGbe
	 C0zQ+0ViJLMag==
Date: Tue, 7 Dec 2021 14:57:20 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Marc Zygnier <maz@kernel.org>,
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	sparclinux@vger.kernel.org, x86@kernel.org,
	xen-devel@lists.xenproject.org, ath11k@lists.infradead.org,
	Wei Liu <wei.liu@kernel.org>, linux-hyperv@vger.kernel.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [patch V2 14/23] PCI/MSI: Make msix_update_entries() smarter
Message-ID: <20211207205720.GA76876@bhelgaas>
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

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/msi.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --- a/drivers/pci/msi.c
> +++ b/drivers/pci/msi.c
> @@ -642,8 +642,8 @@ static void msix_update_entries(struct p
>  {
>  	struct msi_desc *entry;
>  
> -	for_each_pci_msi_entry(entry, dev) {
> -		if (entries) {
> +	if (entries) {
> +		for_each_pci_msi_entry(entry, dev) {
>  			entries->vector = entry->irq;
>  			entries++;
>  		}
> 

