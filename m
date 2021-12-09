Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A82A446F586
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 22:02:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243379.421010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvQYL-0002ob-Oz; Thu, 09 Dec 2021 21:02:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243379.421010; Thu, 09 Dec 2021 21:02:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvQYL-0002mo-M6; Thu, 09 Dec 2021 21:02:09 +0000
Received: by outflank-mailman (input) for mailman id 243379;
 Thu, 09 Dec 2021 21:02:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PaQb=Q2=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mvQYK-0002mi-33
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 21:02:08 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 442726d5-5933-11ec-a831-37629979565c;
 Thu, 09 Dec 2021 22:02:06 +0100 (CET)
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
X-Inumbo-ID: 442726d5-5933-11ec-a831-37629979565c
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1639083725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xxqdvbsXfW9ZTgMmCuXp8YRHSWgAbwtAttb91gr8JjI=;
	b=DOc6YJ2ZnBO/S4LCXZXRmaCbKg4mw4ULShgz8TQVMTQrtnAO2Xt2ML2QqNoyx+YxXUsHJN
	M9Uc19toNCVSDrL0eBe6B+2C6HaFEOtjxR4Vo4wDMaGkR/fPp4Wnk8pCtSmMV+G3zim+uJ
	dTY6cTrRvZdPCszRejdDVRTgiEJq+lNz109fnZuFt1e703qlfscJY8ERwknVxLcHHHkz7A
	wxSoldZRl7kvhteRoNYLnpDjrMlrysFM5RCRJ+id9dYpo1pfWpwST9eeIao0MKlvGxa//1
	fq90+ELl15EUbs0r5Np+mZtUBnTVF1oCbSyBny5RQeJBwFKovf/OUugsxVxS8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1639083725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xxqdvbsXfW9ZTgMmCuXp8YRHSWgAbwtAttb91gr8JjI=;
	b=7h0lucwwwhZa1hvXVoxI9ymbY55FLNkqkYChkOSRhqiPlIIQ18VrnDa7PbaNLMd6ZwoxZ+
	K+aavqocs9ZCuaAA==
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
In-Reply-To: <87k0gdzmu6.ffs@tglx>
References: <20211206210307.625116253@linutronix.de>
 <20211206210438.688216619@linutronix.de>
 <20211208155816.GZ6385@nvidia.com> <87k0gdzmu6.ffs@tglx>
Date: Thu, 09 Dec 2021 22:02:04 +0100
Message-ID: <875yrxze43.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Dec 09 2021 at 18:53, Thomas Gleixner wrote:
> On Wed, Dec 08 2021 at 11:58, Jason Gunthorpe wrote:
>> On Mon, Dec 06, 2021 at 11:39:26PM +0100, Thomas Gleixner wrote:
>>> Store the properties which are interesting for various places so the MSI
>>> descriptor fiddling can be removed.
>>> 
>>> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>>> ---
>>> V2: Use the setter function
>>> ---
>>>  drivers/pci/msi/msi.c |    8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>
>> I took more time to look at this, to summarize my remarks on the other
>> patches
>>
>> I think we don't need properties. The info in the msi_desc can come
>> from the pci_dev which we have easy access to. This seems overall
>> clearer
>
> I fixed that now.

So much for the theory. dev->msi[x]_enabled are set after everything is
set up. Some of the places are part of the setup...

/me goes back to stare

