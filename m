Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A8627EC46
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 17:21:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811.2743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNduc-0007p9-Mq; Wed, 30 Sep 2020 15:20:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811.2743; Wed, 30 Sep 2020 15:20:58 +0000
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
	id 1kNduc-0007oj-J2; Wed, 30 Sep 2020 15:20:58 +0000
Received: by outflank-mailman (input) for mailman id 811;
 Wed, 30 Sep 2020 15:20:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Fdc=DH=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kNdua-0007oZ-Ad
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 15:20:56 +0000
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ad242d1-e8f7-4e59-8e25-318d78e44249;
 Wed, 30 Sep 2020 15:20:54 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=4Fdc=DH=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
	id 1kNdua-0007oZ-Ad
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 15:20:56 +0000
X-Inumbo-ID: 9ad242d1-e8f7-4e59-8e25-318d78e44249
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9ad242d1-e8f7-4e59-8e25-318d78e44249;
	Wed, 30 Sep 2020 15:20:54 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1601479252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8oFwCHrN/W6WTNQvqTZiyA5hlMY4vck+KbQYcROkbgY=;
	b=tYCl/2l9R4E995Qh3NpKoAyGCVWL3mDAoINqMv/wNuGX6S4HLY1wMVi/opGNyehAjnBuMJ
	J/mFnxqGJi9y1lrDtU8LnMFno2uyNWDnp52TihMLBsugausO/YZBw9cbDzave2vbIBXeT8
	c9XBrJIFqei726uvASaVWHUY0kaV6FfyTCQHpLR8sEmrbwtoP4kxIIsZD7IACBeeRFwZRn
	7ON7hpLw5Uvl1DVWD6PmixAFdMiv1ob39g6MMUQOdgyjsZ5EuJng24RutTqLc8w0qmwBjO
	sK7GXvZRJiyMy6q4MjQkl7MaHjpAFd5Jhp3xPljWJGbGpYvLtX3WFJdeM0y38A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1601479252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8oFwCHrN/W6WTNQvqTZiyA5hlMY4vck+KbQYcROkbgY=;
	b=rv9d/q3MBb3+XU/aNA8ggIe1jaJhGhyVmeVzqZNtV+VXBu3CX7H3vdb/c69eCm+ZLdQNzU
	yUPJ6t5/jmsl7jBg==
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Dey\, Megha" <megha.dey@intel.com>, LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org, linux-hyperv@vger.kernel.org, Haiyang
 Zhang <haiyangz@microsoft.com>, Jon Derrick <jonathan.derrick@intel.com>, Lu
 Baolu <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>, "K. Y.
 Srinivasan" <kys@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>, Steve Wahl <steve.wahl@hpe.com>, Dimitri Sivanich <sivanich@hpe.com>, Russ
 Anderson <rja@hpe.com>, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>, xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Marc Zyngier <maz@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Dave
 Jiang <dave.jiang@intel.com>, Alex Williamson <alex.williamson@redhat.com>, Jacob Pan <jacob.jun.pan@intel.com>, Baolu Lu <baolu.lu@intel.com>, Kevin
 Tian <kevin.tian@intel.com>, Dan Williams <dan.j.williams@intel.com>, ravi.v.shankar@intel.com
Subject: Re: [patch V2 00/46] x86, PCI, XEN, genirq ...: Prepare for device MSI
In-Reply-To: <20200930114301.GD816047@nvidia.com>
References: <20200826111628.794979401@linutronix.de> <10b5d933-f104-7699-341a-0afb16640d54@intel.com> <87v9fvix5f.fsf@nanos.tec.linutronix.de> <20200930114301.GD816047@nvidia.com>
Date: Wed, 30 Sep 2020 17:20:52 +0200
Message-ID: <87k0wbi94b.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Sep 30 2020 at 08:43, Jason Gunthorpe wrote:
> On Wed, Sep 30, 2020 at 08:41:48AM +0200, Thomas Gleixner wrote:
>> On Tue, Sep 29 2020 at 16:03, Megha Dey wrote:
>> > On 8/26/2020 4:16 AM, Thomas Gleixner wrote:
>> >> #9	is obviously just for the folks interested in IMS
>> >>
>> >
>> > I see that the tip tree (as of 9/29) has most of these patches but 
>> > notice that the DEV_MSI related patches
>> >
>> > haven't made it. I have tested the tip tree(x86/irq branch) with your
>> > DEV_MSI infra patches and our IMS patches with the IDXD driver and was
>> 
>> Your IMS patches? Why do you need something special again?
>> 
>> > wondering if we should push out those patches as part of our patchset?
>> 
>> As I don't have any hardware to test that, I was waiting for you and
>> Jason to confirm that this actually works for the two different IMS
>> implementations.
>
> How urgently do you need this? The code looked good from what I
> understood. It will be a while before we have all the parts to send an
> actual patch though.

I personally do not need it at all :) Megha might have different
thoughts... 

> We might be able to put together a mockup just to prove it

If that makes Megha's stuff going that would of course be appreciated,
but we can defer the IMS_QUEUE part for later. It's orthogonal to the
IMS_ARRAY stuff.

Thanks,

        tglx

