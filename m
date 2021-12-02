Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77326466153
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 11:16:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236446.410155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msj8u-0005pG-0x; Thu, 02 Dec 2021 10:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236446.410155; Thu, 02 Dec 2021 10:16:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msj8t-0005nA-SA; Thu, 02 Dec 2021 10:16:43 +0000
Received: by outflank-mailman (input) for mailman id 236446;
 Thu, 02 Dec 2021 10:16:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JeoH=QT=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1msj8s-0005n4-Jq
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 10:16:42 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1146955-5358-11ec-b1df-f38ee3fbfdf7;
 Thu, 02 Dec 2021 11:16:41 +0100 (CET)
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
X-Inumbo-ID: f1146955-5358-11ec-b1df-f38ee3fbfdf7
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638440199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RdevRfhjsHKeeCHTf9pHmrkF5+sLZu5HIYbbAd1ahA0=;
	b=CE0G0O5lmKxqkZC6BvlCruxb6hHn9pwsgNHT2CVOhNKska1IejpMxdl7YLMkS31AeiiP2P
	Te9ThMTsDiSJz3lfhgB3+yOnRaqm2z1iFM+gbLYtCcS1ULM58LD9cUw9r6HX8Qjm5+9u94
	/8Ea+50Mo6rWAgRVbrXNFAQMru8nmGk67ms7jqMhvLa0ssFSWJ+r3Xvq8/6l9WRP1oq/q1
	qmYyulR+iammXO7J2ukF1k3h6EC7jAr7afu4r5wKpliQqck8ti7wNpLdlgRJ9pIeewPxs7
	rS+AMHbbyQ2DgPwLknFCXgKQioSjvlDzvffI7rlb9lJkofsI5uUAJPbBQcFyRw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638440199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RdevRfhjsHKeeCHTf9pHmrkF5+sLZu5HIYbbAd1ahA0=;
	b=2v0AYZhnbZ5OYxQiErXDK00fVJE5282NMNIpfLbx7OIHuFdbV0rSBUfPA1Gl76ETV2FIh1
	z+CYQVKoJ7EfZiDQ==
To: "Dey, Megha" <megha.dey@intel.com>, LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Marc Zygnier <maz@kernel.org>, Alex
 Williamson <alex.williamson@redhat.com>, Kevin Tian
 <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>, Ashok Raj
 <ashok.raj@intel.com>, Michael Ellerman <mpe@ellerman.id.au>, Andrew
 Cooper <amc96@cam.ac.uk>, Juergen Gross <jgross@suse.com>,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [patch 09/10] PCI/MSI: Provide pci_msix_expand_vectors[_at]()
In-Reply-To: <7ad200fa-dda3-4932-cd23-ad6e79288ea4@intel.com>
References: <20211126233124.618283684@linutronix.de>
 <20211127000919.004572849@linutronix.de>
 <7ad200fa-dda3-4932-cd23-ad6e79288ea4@intel.com>
Date: Thu, 02 Dec 2021 11:16:39 +0100
Message-ID: <871r2v71mg.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

Megha,

On Wed, Dec 01 2021 at 17:08, Megha Dey wrote:
> On 11/26/2021 5:25 PM, Thomas Gleixner wrote:
>>   /**
>> + * pci_msix_expand_vectors_at - Expand MSI-X interrupts for a device
>> + *
>> + * @dev:	PCI device to operate on
>> + * @at:		Allocate at MSI-X index. If @at == PCI_MSI_EXPAND_AUTO
>> + *		the function expands automatically after the last
> Not sure why some of these changes related to PCI_MSIX_EXPAND_AUTO and 
> num_descs did not make it to the 'msi' branch.
> Is this intentional?

Yes, because I'm not happy about that magic.

>
> For instance, say:
> 1. Driver requests for 5 vectors:
> pci_enable_msix_range(dev, NULL, 5, 5)
> =>num_descs = 5

Driver should not use with pci_enable_msix_range() in the first
place. But yes, it got 5 vectors now.

> 2. Driver frees vectors at index 1,2:
> range = {1, 2, 2};
> pci_msi_teardown_msi_irqs(dev, range)

That function is not accessible by drivers for a reason.

> =>num_descs = 3; Current active vectors are at index: 0, 3, 4

> 3. Driver requests for 3 more vectors using the new API:
> pci_msix_expand_vectors(dev, 3)
> =>range.first = 3 => It will try to allocate index 3-5, but we already 
> have 3,4 active?
> Ideally, we would want index 1,2 and 5 to be allocated for this request 
> right?
>
> Could you please let me know what I am missing?

You're missing the real world use case. The above is fiction.

If a driver would release 1 and 2 then it should explicitely reallocate
1 and 2 and not let the core decide to magically allocate something.

If the driver wants three more after freeing 1, 2 then the core could
just allocate 5, 6, 7, and would still fulfil the callers request to
allocate three more, right?

And even if it just allocates one, then the caller still has to know the
index upfront. Why? Because it needs to know it in order to get the
Linux interrupt number via pci_irq_vector().

> Correspondingly, pci_free_msix_irq_vector(pdev, irq) frees all the 
> allocated resources associated with MSI-X interrupt with Linux IRQ 
> number 'irq'.
> I had issues when trying to dynamically allocate more than 1 interrupt 
> because I didn't have a clean way to communicate to the driver what 
> indexes were assigned in the current allocation.

If the driver is able to free a particular vector then it should exactly
know what it it doing and which index it is freeing. If it needs that
particular vector again, then it knows the index, right?

Let's look how MSI-X works in reality:

Each vector is associated to a particular function in the device. How
that association works is device dependent.

Some devices have hardwired associations, some allow the driver to
program the association in the device configuration and there is also a
combination of both.

So if the driver would free the vector for a particular functionality,
or not allocate it in the first place, then it exactly knows what it
freed and what it needs to allocate when it needs that functionality
(again).

What you are trying to create is a solution in search of a problem. You
cannot declare via a random allocation API how devices work. You neither
can fix the VFIO issue in a sensible way.

VFIO starts with vector #0 allocated. The guest then unmasks vector #50.

With your magic interface VFIO has to allocate 49 vectors and then free
48 of them again or just keep 48 around for nothing which defeats the
purpose of on demand allocation completely.

Thanks,

        tglx






