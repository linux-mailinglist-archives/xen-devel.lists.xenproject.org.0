Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1879E27E169
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 08:42:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.438.1341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNVoH-0000uz-Ce; Wed, 30 Sep 2020 06:41:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 438.1341; Wed, 30 Sep 2020 06:41:53 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNVoH-0000uS-8o; Wed, 30 Sep 2020 06:41:53 +0000
Received: by outflank-mailman (input) for mailman id 438;
 Wed, 30 Sep 2020 06:41:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Fdc=DH=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kNVoG-0000uG-5m
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 06:41:52 +0000
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 522e56c9-6fab-4686-b358-57f661a43523;
 Wed, 30 Sep 2020 06:41:50 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=4Fdc=DH=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
	id 1kNVoG-0000uG-5m
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 06:41:52 +0000
X-Inumbo-ID: 522e56c9-6fab-4686-b358-57f661a43523
Received: from galois.linutronix.de (unknown [193.142.43.55])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 522e56c9-6fab-4686-b358-57f661a43523;
	Wed, 30 Sep 2020 06:41:50 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1601448108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EJKrDPg1zMcLHTJ9psmGJPskafubkx5uuA4rv00RWvE=;
	b=3b6vWZ3FYwgK0uGd/jHNKkzf932WR9YVcHqnMSL9hHtR4FHsBZC07JwnVnqMJT9Jed2laM
	sOmj+DtePTxNt1wmjH5DZ6o2s5opDsc8D9ifXyqbFVzXOdAfouLp4tTZLVGyMM1xzNgVNF
	SiFdV8l6tmYAgTktBPpm/Iadr8yO4O7oHnUbbnOIztDfkFXFDnrym1ArBAMUmD2E46aShM
	CD+CVsD5I4NZ1O1jmOVTRGe6+5R2FDp5MP/BP/FjqJPOUfRmKvz3lfIp+HuQ1y5Tb6Yo6V
	QtpSVxjdk4qgFUFhEUdh5DLZfdeQVjrBT9YrrBtUq7PiKVvMzZoW945MxWorVA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1601448108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EJKrDPg1zMcLHTJ9psmGJPskafubkx5uuA4rv00RWvE=;
	b=4oScqGVN58GGowfuDE4TlRtr/G0yJIGU+gi/diGlZDZu0wervLchyWESUEEFxWNHdARjHI
	QIrbJgszY1bnCuAA==
To: "Dey\, Megha" <megha.dey@intel.com>, LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, linux-hyperv@vger.kernel.org, Haiyang
 Zhang <haiyangz@microsoft.com>, Jon Derrick <jonathan.derrick@intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>, "K. Y.
 Srinivasan" <kys@microsoft.com>, Stephen Hemminger
 <sthemmin@microsoft.com>, Steve Wahl <steve.wahl@hpe.com>, Dimitri
 Sivanich <sivanich@hpe.com>, Russ Anderson <rja@hpe.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Lorenzo
 Pieralisi <lorenzo.pieralisi@arm.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, xen-devel@lists.xenproject.org, Juergen Gross
 <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Marc Zyngier <maz@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Jason Gunthorpe <jgg@mellanox.com>, Dave Jiang
 <dave.jiang@intel.com>, Alex Williamson <alex.williamson@redhat.com>,
 Jacob Pan <jacob.jun.pan@intel.com>, Baolu Lu <baolu.lu@intel.com>, Kevin
 Tian <kevin.tian@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 dave.jiang@intel.com, ravi.v.shankar@intel.com
Subject: Re: [patch V2 00/46] x86, PCI, XEN, genirq ...: Prepare for device MSI
In-Reply-To: <10b5d933-f104-7699-341a-0afb16640d54@intel.com>
References: <20200826111628.794979401@linutronix.de> <10b5d933-f104-7699-341a-0afb16640d54@intel.com>
Date: Wed, 30 Sep 2020 08:41:48 +0200
Message-ID: <87v9fvix5f.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Sep 29 2020 at 16:03, Megha Dey wrote:
> On 8/26/2020 4:16 AM, Thomas Gleixner wrote:
>> #9	is obviously just for the folks interested in IMS
>>
>
> I see that the tip tree (as of 9/29) has most of these patches but 
> notice that the DEV_MSI related patches
>
> haven't made it. I have tested the tip tree(x86/irq branch) with your
> DEV_MSI infra patches and our IMS patches with the IDXD driver and was

Your IMS patches? Why do you need something special again?

> wondering if we should push out those patches as part of our patchset?

As I don't have any hardware to test that, I was waiting for you and
Jason to confirm that this actually works for the two different IMS
implementations.

Thanks,

        tglx

