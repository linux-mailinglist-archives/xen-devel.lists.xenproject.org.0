Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2DB2F4161
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 02:53:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66249.117586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzVLV-0001rN-GI; Wed, 13 Jan 2021 01:53:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66249.117586; Wed, 13 Jan 2021 01:53:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzVLV-0001r1-C5; Wed, 13 Jan 2021 01:53:13 +0000
Received: by outflank-mailman (input) for mailman id 66249;
 Wed, 13 Jan 2021 01:53:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UYp6=GQ=arm.com=robin.murphy@srs-us1.protection.inumbo.net>)
 id 1kzVLT-0001qu-WC
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 01:53:12 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 45aa1378-41b9-43ee-bfbd-ae8083c3234e;
 Wed, 13 Jan 2021 01:53:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E760101E;
 Tue, 12 Jan 2021 17:53:09 -0800 (PST)
Received: from [10.57.56.43] (unknown [10.57.56.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A2E913F719;
 Tue, 12 Jan 2021 17:53:03 -0800 (PST)
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
X-Inumbo-ID: 45aa1378-41b9-43ee-bfbd-ae8083c3234e
Subject: Re: [RFC PATCH v3 2/6] swiotlb: Add restricted DMA pool
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Claire Chang <tientzu@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, joro@8bytes.org, will@kernel.org,
 Frank Rowand <frowand.list@gmail.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, sstabellini@kernel.org, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, grant.likely@arm.com,
 xypron.glpk@gmx.de, Thierry Reding <treding@nvidia.com>, mingo@kernel.org,
 bauerman@linux.ibm.com, peterz@infradead.org,
 Greg KH <gregkh@linuxfoundation.org>, Saravana Kannan
 <saravanak@google.com>, rafael.j.wysocki@intel.com,
 heikki.krogerus@linux.intel.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, rdunlap@infradead.org,
 dan.j.williams@intel.com, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-devicetree <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org, Tomasz Figa <tfiga@chromium.org>,
 Nicolas Boichat <drinkcat@chromium.org>
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-3-tientzu@chromium.org>
 <20210106185241.GA109735@localhost.localdomain>
 <CALiNf2-HDf6tFcvVgCttr-ta=88ZMH=OvB5XoryTPc6MNvwV+Q@mail.gmail.com>
 <20210107175740.GA16519@char.us.oracle.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <41b466d0-0271-2d84-0623-4c877fcffe32@arm.com>
Date: Wed, 13 Jan 2021 01:53:02 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210107175740.GA16519@char.us.oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2021-01-07 17:57, Konrad Rzeszutek Wilk wrote:
> On Fri, Jan 08, 2021 at 01:39:18AM +0800, Claire Chang wrote:
>> Hi Greg and Konrad,
>>
>> This change is intended to be non-arch specific. Any arch that lacks DMA access
>> control and has devices not behind an IOMMU can make use of it. Could you share
>> why you think this should be arch specific?
> 
> The idea behind non-arch specific code is it to be generic. The devicetree
> is specific to PowerPC, Sparc, and ARM, and not to x86 - hence it should
> be in arch specific code.

Sorry, but that's an absurd argument. By the same token you'd equally 
have to claim that bits of, say, the Broadcom WiFi driver (not to 
mention dozens of others) should be split out into arch code, since not 
all platforms use the devicetree parts, nor the ACPI parts, nor the PCI 
parts...

There is nothing architecture-specific about using devicetree as a 
system description - AFAIK there *are* a handful of x86 platforms that 
use it, besides even more architectures than you've listed above. It has 
long been the policy that devicetree-related code for a particular 
subsystem should just live within that subsystem. Sometimes if there's 
enough of it it gets collected together into its own file - e.g. 
drivers/pci/of.c - otherwise it tends to just get #ifdef'ed - e.g. 
of_spi_parse_dt(), or the other DMA reserved-memory consumers that 
already exist as Florian points out.

Besides, there are far more platforms that enable CONFIG_OF than enable 
CONFIG_SWIOTLB, so by that metric the whole of the SWIOTLB code itself 
is even less "generic" than any DT parsing :P

Robin.

