Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0960736D505
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 11:50:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119155.225538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbgq7-0003km-PH; Wed, 28 Apr 2021 09:50:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119155.225538; Wed, 28 Apr 2021 09:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbgq7-0003kM-MF; Wed, 28 Apr 2021 09:50:39 +0000
Received: by outflank-mailman (input) for mailman id 119155;
 Wed, 28 Apr 2021 09:50:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aavt=JZ=arm.com=steven.price@srs-us1.protection.inumbo.net>)
 id 1lbgq5-0003kE-Li
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 09:50:37 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id d8d00590-54e5-48c2-a2d0-7628a001574b;
 Wed, 28 Apr 2021 09:50:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC27EED1;
 Wed, 28 Apr 2021 02:50:35 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 47C643F70D;
 Wed, 28 Apr 2021 02:50:29 -0700 (PDT)
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
X-Inumbo-ID: d8d00590-54e5-48c2-a2d0-7628a001574b
Subject: Re: [PATCH v5 05/16] swiotlb: Add restricted DMA pool initialization
To: Claire Chang <tientzu@chromium.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, benh@kernel.crashing.org,
 paulus@samba.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 sstabellini@kernel.org, Robin Murphy <robin.murphy@arm.com>,
 grant.likely@arm.com, xypron.glpk@gmx.de, Thierry Reding
 <treding@nvidia.com>, mingo@kernel.org, bauerman@linux.ibm.com,
 peterz@infradead.org, Greg KH <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 heikki.krogerus@linux.intel.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, Dan Williams
 <dan.j.williams@intel.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-devicetree <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 xen-devel@lists.xenproject.org, Nicolas Boichat <drinkcat@chromium.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, Tomasz Figa <tfiga@chromium.org>,
 bskeggs@redhat.com, Bjorn Helgaas <bhelgaas@google.com>,
 chris@chris-wilson.co.uk, Daniel Vetter <daniel@ffwll.ch>, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, Jianxiong Gao <jxgao@google.com>,
 joonas.lahtinen@linux.intel.com, linux-pci@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
 nouveau@lists.freedesktop.org, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com
References: <20210422081508.3942748-1-tientzu@chromium.org>
 <20210422081508.3942748-6-tientzu@chromium.org>
 <c9abca62-328d-d0d6-a8a6-a67475171f92@arm.com>
 <CALiNf2_tffc65PhLxCr3-+gmVYKGO2HjYiJVkBNa5U5HYdi9pg@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <64137d13-cfa2-5f72-94c1-19b367489c78@arm.com>
Date: Wed, 28 Apr 2021 10:50:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CALiNf2_tffc65PhLxCr3-+gmVYKGO2HjYiJVkBNa5U5HYdi9pg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 26/04/2021 17:37, Claire Chang wrote:
> On Fri, Apr 23, 2021 at 7:34 PM Steven Price <steven.price@arm.com> wrote:
[...]
>>
>> But even then if it's not and we have the situation where debugfs==NULL
>> then the debugfs_create_dir() here will cause a subsequent attempt in
>> swiotlb_create_debugfs() to fail (directory already exists) leading to
>> mem->debugfs being assigned an error value. I suspect the creation of
>> the debugfs directory needs to be separated from io_tlb_default_mem
>> being set.
> 
> debugfs creation should move into the if (!mem) {...} above to avoid
> duplication.
> I think having a separated struct dentry pointer for the default
> debugfs should be enough?
> 
> if (!debugfs)
>      debugfs = debugfs_create_dir("swiotlb", NULL);
> swiotlb_create_debugfs(mem, rmem->name, debugfs);

Yes that looks like a good solution to me. Although I'd name the 
variable something a bit more descriptive than just "debugfs" e.g. 
"debugfs_dir" or "debugfs_root".

Thanks,

Steve

