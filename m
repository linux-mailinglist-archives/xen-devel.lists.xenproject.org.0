Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B223B2DF5
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 13:35:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146742.270164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwNcm-0005xn-NK; Thu, 24 Jun 2021 11:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146742.270164; Thu, 24 Jun 2021 11:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwNcm-0005vS-Jc; Thu, 24 Jun 2021 11:34:24 +0000
Received: by outflank-mailman (input) for mailman id 146742;
 Thu, 24 Jun 2021 11:34:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NXgG=LS=arm.com=robin.murphy@srs-us1.protection.inumbo.net>)
 id 1lwNcl-0005vG-95
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 11:34:23 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 6f134f9b-6ab7-43b4-8317-f75c6b175682;
 Thu, 24 Jun 2021 11:34:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 847F01063;
 Thu, 24 Jun 2021 04:34:21 -0700 (PDT)
Received: from [10.57.9.136] (unknown [10.57.9.136])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 361C23F718;
 Thu, 24 Jun 2021 04:34:14 -0700 (PDT)
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
X-Inumbo-ID: 6f134f9b-6ab7-43b4-8317-f75c6b175682
Subject: Re: [PATCH v14 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
To: Will Deacon <will@kernel.org>
Cc: Claire Chang <tientzu@chromium.org>, Christoph Hellwig <hch@lst.de>,
 Qian Cai <quic_qiancai@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Marek Szyprowski <m.szyprowski@samsung.com>,
 heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, benh@kernel.crashing.org,
 joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 mingo@kernel.org, Jianxiong Gao <jxgao@google.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, airlied@linux.ie,
 maarten.lankhorst@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 jani.nikula@linux.intel.com, Nicolas Boichat <drinkcat@chromium.org>,
 rodrigo.vivi@intel.com, Bjorn Helgaas <bhelgaas@google.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, bauerman@linux.ibm.com
References: <20210619034043.199220-1-tientzu@chromium.org>
 <20210619034043.199220-7-tientzu@chromium.org>
 <76c3343d-72e5-9df3-8924-5474ee698ef4@quicinc.com>
 <20210623183736.GA472@willie-the-truck>
 <19d4c7a2-744d-21e0-289c-a576e1f0e6f3@quicinc.com>
 <20210624054315.GA25381@lst.de>
 <CALiNf288ZLMhY3E8E3N+z9rkwi1viWNLm1wwMEwT4rNwh3FfwQ@mail.gmail.com>
 <364e6715-eafd-fc4a-e0af-ce2a042756b4@arm.com>
 <20210624111855.GA1382@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <452155d2-c98e-23f6-86d6-3a2ff2e74783@arm.com>
Date: Thu, 24 Jun 2021 12:34:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210624111855.GA1382@willie-the-truck>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2021-06-24 12:18, Will Deacon wrote:
> On Thu, Jun 24, 2021 at 12:14:39PM +0100, Robin Murphy wrote:
>> On 2021-06-24 07:05, Claire Chang wrote:
>>> On Thu, Jun 24, 2021 at 1:43 PM Christoph Hellwig <hch@lst.de> wrote:
>>>>
>>>> On Wed, Jun 23, 2021 at 02:44:34PM -0400, Qian Cai wrote:
>>>>> is_swiotlb_force_bounce at /usr/src/linux-next/./include/linux/swiotlb.h:119
>>>>>
>>>>> is_swiotlb_force_bounce() was the new function introduced in this patch here.
>>>>>
>>>>> +static inline bool is_swiotlb_force_bounce(struct device *dev)
>>>>> +{
>>>>> +     return dev->dma_io_tlb_mem->force_bounce;
>>>>> +}
>>>>
>>>> To me the crash looks like dev->dma_io_tlb_mem is NULL.  Can you
>>>> turn this into :
>>>>
>>>>           return dev->dma_io_tlb_mem && dev->dma_io_tlb_mem->force_bounce;
>>>>
>>>> for a quick debug check?
>>>
>>> I just realized that dma_io_tlb_mem might be NULL like Christoph
>>> pointed out since swiotlb might not get initialized.
>>> However,  `Unable to handle kernel paging request at virtual address
>>> dfff80000000000e` looks more like the address is garbage rather than
>>> NULL?
>>> I wonder if that's because dev->dma_io_tlb_mem is not assigned
>>> properly (which means device_initialize is not called?).
>>
>> What also looks odd is that the base "address" 0xdfff800000000000 is held in
>> a couple of registers, but the offset 0xe looks too small to match up to any
>> relevant structure member in that dereference chain :/
> 
> FWIW, I've managed to trigger a NULL dereference locally when swiotlb hasn't
> been initialised but we dereference 'dev->dma_io_tlb_mem', so I think
> Christoph's suggestion is needed regardless.

Ack to that - for SWIOTLB_NO_FORCE, io_tlb_default_mem will remain NULL. 
The massive jump in KernelCI baseline failures as of yesterday looks 
like every arm64 machine with less than 4GB of RAM blowing up...

Robin.

> But I agree that it won't help
> with the issue reported by Qian Cai.
> 
> Qian Cai: please can you share your .config and your command line?
> 
> Thanks,
> 
> Will
> 

