Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 261E246F28A
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 18:54:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243230.420683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvNbz-0006l2-39; Thu, 09 Dec 2021 17:53:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243230.420683; Thu, 09 Dec 2021 17:53:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvNby-0006jA-VF; Thu, 09 Dec 2021 17:53:42 +0000
Received: by outflank-mailman (input) for mailman id 243230;
 Thu, 09 Dec 2021 17:53:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PaQb=Q2=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mvNby-0006j4-2O
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 17:53:42 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0d685c7-5918-11ec-9d12-4777fae47e2b;
 Thu, 09 Dec 2021 18:53:40 +0100 (CET)
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
X-Inumbo-ID: f0d685c7-5918-11ec-9d12-4777fae47e2b
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1639072418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f/BG5QfqwWEb1VV/DgxhiFZ4nhZE79+Y1nkN0PAhNpQ=;
	b=kjE+xJbt1HY/8HBJlMzR3KY5f257GXq6wQiCb4ielSBtggUniQ1I3lNNdnraOwg0GEpMfu
	syIRikUXoAagvFD10A7VC8fdLi5KNDe8FVpgjdz238ahh5ThXTk0ftjn4sLjev21WbVmwN
	UdtH1rl6SMpGB3hFuvBYPFDDfZmvU6R1CRdrxcp40TncFcDN6uf+hzRVH9isczKiB43Nqg
	eOi5ptsv0tQWvH/JkuarfQxl1jTA329ul6SL57nsoRBvTSUj8ex83rJhKPX7X7TnTrq8uZ
	kYfRHVatnPWdhfVHrcCL0ZVnQkiJkHbcO3adPxb/1ct6S7VsxFetMxXinWNn4g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1639072418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f/BG5QfqwWEb1VV/DgxhiFZ4nhZE79+Y1nkN0PAhNpQ=;
	b=W9fJDkfc99g7IIQhAnrz13+8F5imCs058D17+luFpISF83qVBUish7Usu7wFw9FwF+6ZoR
	uTKOefgne5k+wzAQ==
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>, Alex Williamson
 <alex.williamson@redhat.com>, Kevin Tian <kevin.tian@intel.com>, Megha Dey
 <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Will Deacon <will@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, iommu@lists.linux-foundation.org,
 dmaengine@vger.kernel.org, Stuart Yoder <stuyoder@gmail.com>, Laurentiu
 Tudor <laurentiu.tudor@nxp.com>, Nishanth Menon <nm@ti.com>, Tero Kristo
 <kristo@kernel.org>, linux-arm-kernel@lists.infradead.org, Vinod Koul
 <vkoul@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Robin Murphy
 <robin.murphy@arm.com>, Sinan Kaya <okaya@kernel.org>
Subject: Re: [patch V2 19/36] PCI/MSI: Store properties in device::msi::data
In-Reply-To: <20211208155816.GZ6385@nvidia.com>
References: <20211206210307.625116253@linutronix.de>
 <20211206210438.688216619@linutronix.de>
 <20211208155816.GZ6385@nvidia.com>
Date: Thu, 09 Dec 2021 18:53:37 +0100
Message-ID: <87k0gdzmu6.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Dec 08 2021 at 11:58, Jason Gunthorpe wrote:
> On Mon, Dec 06, 2021 at 11:39:26PM +0100, Thomas Gleixner wrote:
>> Store the properties which are interesting for various places so the MSI
>> descriptor fiddling can be removed.
>> 
>> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>> ---
>> V2: Use the setter function
>> ---
>>  drivers/pci/msi/msi.c |    8 ++++++++
>>  1 file changed, 8 insertions(+)
>
> I took more time to look at this, to summarize my remarks on the other
> patches
>
> I think we don't need properties. The info in the msi_desc can come
> from the pci_dev which we have easy access to. This seems overall
> clearer

I fixed that now.

> The notable one is the sysfs, but that is probably better handled by
> storing a
>
>   const char *sysfs_label
>
> in the dev->msi and emitting that instead of computing it.

I just compute is for now via is_pci_dev() and
to_pci_dev()->msi_enabled.

We are still debating to remove the whole thing completely.

Thanks,

        tglx

