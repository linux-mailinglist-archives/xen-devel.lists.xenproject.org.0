Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F7625228F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 23:13:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAgEb-0006x5-Tn; Tue, 25 Aug 2020 21:12:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ixcz=CD=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kAgEa-0006x0-3H
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 21:12:00 +0000
X-Inumbo-ID: e374f322-20d2-4fc5-8e4b-00926264a1d5
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e374f322-20d2-4fc5-8e4b-00926264a1d5;
 Tue, 25 Aug 2020 21:11:58 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598389916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1frHZHutANeGhNvELKAlZV7ZBIw0Dqsl4tEEvrOnRU4=;
 b=rQQMWS26Jt5LaZuxdrMUZgNfuNew2mCXTFepS37C35I6xAhJ3rEo9Nx2wJCVYo9FS/Pgcj
 zMK/jubxjmgOMukHjD1+whg0AyErL8YAwjSJxzS+B1PMq4RdTvHJO6lnQ8zCroL34GT5hw
 5/rfeY4s2ADMm35tAfb/mXN9dBB+PDzSGhJTbYCAYlaBzlpg8xMguI6MXbjreLqFtXNCau
 bsIWnmpXS6t/YonQ/7LmA5QV8SpSh4TrFs2TkYIhUy6U4rcc0A8vIF1QUkDGf2mbfLYdBM
 gsUXIxYqmPwtfL3S4OeTd+L815+ua7i1Gq/tsUgXEKLDUxlqgI3fswjFMqzoNQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598389916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1frHZHutANeGhNvELKAlZV7ZBIw0Dqsl4tEEvrOnRU4=;
 b=hWC9wT9/QuU4/otH2U3KHZ3pSL+StkJoqjJVoH3bzCOAJhuscP4cb126Q52YIHKMSI5RAk
 NlcAG4imPXq613BA==
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
 linux-pci@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, linux-hyperv@vger.kernel.org, Haiyang
 Zhang <haiyangz@microsoft.com>, Jon Derrick <jonathan.derrick@intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>, "K. Y.
 Srinivasan" <kys@microsoft.com>, Stephen Hemminger
 <sthemmin@microsoft.com>, Steve Wahl <steve.wahl@hpe.com>, Dimitri
 Sivanich <sivanich@hpe.com>, Russ Anderson <rja@hpe.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Marc Zyngier <maz@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Megha Dey <megha.dey@intel.com>, Jason Gunthorpe
 <jgg@mellanox.com>, Dave Jiang <dave.jiang@intel.com>, Alex Williamson
 <alex.williamson@redhat.com>, Jacob Pan <jacob.jun.pan@intel.com>, Baolu
 Lu <baolu.lu@intel.com>, Kevin Tian <kevin.tian@intel.com>, Dan Williams
 <dan.j.williams@intel.com>
Subject: Re: [patch RFC 13/38] PCI: MSI: Rework pci_msi_domain_calc_hwirq()
In-Reply-To: <20200825200329.GA1923406@bjorn-Precision-5520>
References: <20200825200329.GA1923406@bjorn-Precision-5520>
Date: Tue, 25 Aug 2020 23:11:56 +0200
Message-ID: <87d03exwf7.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Aug 25 2020 at 15:03, Bjorn Helgaas wrote:
> On Fri, Aug 21, 2020 at 02:24:37AM +0200, Thomas Gleixner wrote:
>> Retrieve the PCI device from the msi descriptor instead of doing so at the
>> call sites.
>
> I'd like it *better* with "PCI/MSI: " in the subject (to match history

Duh, yes.

> and other patches in this series) and "MSI" here in the commit log,
> but nice cleanup and:
>> --- a/arch/x86/kernel/apic/msi.c
>> +++ b/arch/x86/kernel/apic/msi.c
>> @@ -232,7 +232,7 @@ EXPORT_SYMBOL_GPL(pci_msi_prepare);
>>  
>>  void pci_msi_set_desc(msi_alloc_info_t *arg, struct msi_desc *desc)
>>  {
>> -	arg->msi_hwirq = pci_msi_domain_calc_hwirq(arg->msi_dev, desc);
>> +	arg->msi_hwirq = pci_msi_domain_calc_hwirq(desc);
>
> I guess it's safe to assume that "arg->msi_dev ==
> msi_desc_to_pci_dev(desc)"?  I didn't try to verify that.

It is.

>> +irq_hw_number_t pci_msi_domain_calc_hwirq(struct msi_desc *desc)
>>  {
>> +	struct pci_dev *pdev = msi_desc_to_pci_dev(desc);
>
> If you named this "struct pci_dev *dev" (not "pdev"), the diff would
> be a little smaller and it would match other usage in the file.

Ok. I'm always happy to see pdev because that doesn't make me wonder
which type of dev it is :) But, yeah lets keep it consistent.

Thanks,

        tglx

