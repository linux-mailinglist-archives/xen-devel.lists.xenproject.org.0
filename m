Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E3A2FD6E4
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 18:30:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71672.128537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2HJC-0004Ew-W0; Wed, 20 Jan 2021 17:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71672.128537; Wed, 20 Jan 2021 17:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2HJC-0004EW-SJ; Wed, 20 Jan 2021 17:30:18 +0000
Received: by outflank-mailman (input) for mailman id 71672;
 Wed, 20 Jan 2021 17:30:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WFGZ=GX=arm.com=robin.murphy@srs-us1.protection.inumbo.net>)
 id 1l2HJB-0004EP-Pu
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 17:30:17 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e860c445-7f9f-43cc-9f7f-8526ad3e0672;
 Wed, 20 Jan 2021 17:30:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CA6C31B;
 Wed, 20 Jan 2021 09:30:15 -0800 (PST)
Received: from [10.57.39.58] (unknown [10.57.39.58])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF5433F68F;
 Wed, 20 Jan 2021 09:30:08 -0800 (PST)
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
X-Inumbo-ID: e860c445-7f9f-43cc-9f7f-8526ad3e0672
Subject: Re: [RFC PATCH v3 5/6] dt-bindings: of: Add restricted DMA pool
To: Rob Herring <robh@kernel.org>, Claire Chang <tientzu@chromium.org>
Cc: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 joro@8bytes.org, will@kernel.org, frowand.list@gmail.com,
 konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org, hch@lst.de, m.szyprowski@samsung.com,
 grant.likely@arm.com, xypron.glpk@gmx.de, treding@nvidia.com,
 mingo@kernel.org, bauerman@linux.ibm.com, peterz@infradead.org,
 gregkh@linuxfoundation.org, saravanak@google.com,
 rafael.j.wysocki@intel.com, heikki.krogerus@linux.intel.com,
 andriy.shevchenko@linux.intel.com, rdunlap@infradead.org,
 dan.j.williams@intel.com, bgolaszewski@baylibre.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org, tfiga@chromium.org, drinkcat@chromium.org
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-6-tientzu@chromium.org>
 <20210120165348.GA220770@robh.at.kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <313f8052-a591-75de-c4c2-ee9ea8f02e7f@arm.com>
Date: Wed, 20 Jan 2021 17:30:07 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210120165348.GA220770@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2021-01-20 16:53, Rob Herring wrote:
> On Wed, Jan 06, 2021 at 11:41:23AM +0800, Claire Chang wrote:
>> Introduce the new compatible string, restricted-dma-pool, for restricted
>> DMA. One can specify the address and length of the restricted DMA memory
>> region by restricted-dma-pool in the device tree.
> 
> If this goes into DT, I think we should be able to use dma-ranges for
> this purpose instead. Normally, 'dma-ranges' is for physical bus
> restrictions, but there's no reason it can't be used for policy or to
> express restrictions the firmware has enabled.

There would still need to be some way to tell SWIOTLB to pick up the 
corresponding chunk of memory and to prevent the kernel from using it 
for anything else, though.

>> Signed-off-by: Claire Chang <tientzu@chromium.org>
>> ---
>>   .../reserved-memory/reserved-memory.txt       | 24 +++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>> index e8d3096d922c..44975e2a1fd2 100644
>> --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>> +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>> @@ -51,6 +51,20 @@ compatible (optional) - standard definition
>>             used as a shared pool of DMA buffers for a set of devices. It can
>>             be used by an operating system to instantiate the necessary pool
>>             management subsystem if necessary.
>> +        - restricted-dma-pool: This indicates a region of memory meant to be
>> +          used as a pool of restricted DMA buffers for a set of devices. The
>> +          memory region would be the only region accessible to those devices.
>> +          When using this, the no-map and reusable properties must not be set,
>> +          so the operating system can create a virtual mapping that will be used
>> +          for synchronization. The main purpose for restricted DMA is to
>> +          mitigate the lack of DMA access control on systems without an IOMMU,
>> +          which could result in the DMA accessing the system memory at
>> +          unexpected times and/or unexpected addresses, possibly leading to data
>> +          leakage or corruption. The feature on its own provides a basic level
>> +          of protection against the DMA overwriting buffer contents at
>> +          unexpected times. However, to protect against general data leakage and
>> +          system memory corruption, the system needs to provide way to restrict
>> +          the DMA to a predefined memory region.
>>           - vendor specific string in the form <vendor>,[<device>-]<usage>
>>   no-map (optional) - empty property
>>       - Indicates the operating system must not create a virtual mapping
>> @@ -120,6 +134,11 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
>>   			compatible = "acme,multimedia-memory";
>>   			reg = <0x77000000 0x4000000>;
>>   		};
>> +
>> +		restricted_dma_mem_reserved: restricted_dma_mem_reserved {
>> +			compatible = "restricted-dma-pool";
>> +			reg = <0x50000000 0x400000>;
>> +		};
>>   	};
>>   
>>   	/* ... */
>> @@ -138,4 +157,9 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
>>   		memory-region = <&multimedia_reserved>;
>>   		/* ... */
>>   	};
>> +
>> +	pcie_device: pcie_device@0,0 {
>> +		memory-region = <&restricted_dma_mem_reserved>;
> 
> PCI hosts often have inbound window configurations that limit the
> address range and translate PCI to bus addresses. Those windows happen
> to be configured by dma-ranges. In any case, wouldn't you want to put
> the configuration in the PCI host node? Is there a usecase of
> restricting one PCIe device and not another?

The general design seems to accommodate devices having their own pools 
such that they can't even snoop on each others' transient DMA data. If 
the interconnect had a way of wiring up, say, PCI RIDs to AMBA NSAIDs, 
then in principle you could certainly apply that to PCI endpoints too 
(presumably you'd also disallow them from peer-to-peer transactions at 
the PCI level too).

Robin.

