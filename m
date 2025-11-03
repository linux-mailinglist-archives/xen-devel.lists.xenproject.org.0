Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56261C2C69E
	for <lists+xen-devel@lfdr.de>; Mon, 03 Nov 2025 15:30:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155374.1484869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFvZl-0004PM-HY; Mon, 03 Nov 2025 14:30:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155374.1484869; Mon, 03 Nov 2025 14:30:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFvZl-0004Mv-Ei; Mon, 03 Nov 2025 14:30:29 +0000
Received: by outflank-mailman (input) for mailman id 1155374;
 Mon, 03 Nov 2025 14:30:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vFvZj-0004Mp-Iq
 for xen-devel@lists.xenproject.org; Mon, 03 Nov 2025 14:30:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vFvZi-00Gre8-2Q;
 Mon, 03 Nov 2025 14:30:26 +0000
Received: from [2a02:8012:3a1:0:a8bf:4414:df65:fa8f]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vFvZi-008Wgs-1z;
 Mon, 03 Nov 2025 14:30:26 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=2xDEXqAfxYEZ3r2Oz31XyZoib6qwT5KJ34OC6A0UAsU=; b=WIdSbKgUeEr1HjFUcsEefKKyPN
	yVVEqXJvW+7Ime5U2RQbgLgko2ZIpmNNkhZ3caF/+FsQiORnDA441N08AXJyjCuizAcbUhfOq5FVC
	hrV/u+bzMMIh0cN1/QtC87e5tKY8UmtAXH6aPy0n9waoXH+xiQWicmAoM6hD6BYepotI=;
Message-ID: <0fd2b8e4-bdea-4d01-a2dd-8d2e4b37090d@xen.org>
Date: Mon, 3 Nov 2025 14:30:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Limitations for Running Xen on KVM Arm64
To: "haseeb.ashraf@siemens.com" <haseeb.ashraf@siemens.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "Driscoll, Dan" <dan.driscoll@siemens.com>,
 "Bachtel, Andrew" <andrew.bachtel@siemens.com>,
 "fahad.arslan@siemens.com" <fahad.arslan@siemens.com>,
 "noor.ahsan@siemens.com" <noor.ahsan@siemens.com>,
 "brian.sheppard@siemens.com" <brian.sheppard@siemens.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <KL1PR0601MB4588D25A95D680640A80F2CAE6FBA@KL1PR0601MB4588.apcprd06.prod.outlook.com>
 <KL1PR0601MB45885505ECBBE9262C2B25E0E6FBA@KL1PR0601MB4588.apcprd06.prod.outlook.com>
 <FC5C66FD-8554-4F46-8546-B27DE76C8EEF@unpredictable.fr>
 <2b00a98f-6fee-4341-92bd-25909ebb6e36@xen.org>
 <CA753BD2-31FA-480D-B32A-2125F0F4981D@unpredictable.fr>
 <fc181349-d743-4ef0-bcd2-01c04d2a463e@xen.org>
 <TYZPR06MB4580126B98C6A38AA710F597E6F8A@TYZPR06MB4580.apcprd06.prod.outlook.com>
 <01527182-ccef-43a5-be55-a5450eb7919f@xen.org>
 <KL1PR0601MB45883069D3725975B49761D0E6C7A@KL1PR0601MB4588.apcprd06.prod.outlook.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <KL1PR0601MB45883069D3725975B49761D0E6C7A@KL1PR0601MB4588.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/11/2025 13:09, haseeb.ashraf@siemens.com wrote:
> Hi,

Hi,
> 
>> To clarify, Xen is using the local TLB version. So it should be vmalls12e1.
> If I understood correctly, won't HCR_EL2.FB makes local TLB, a broadcast one?

HCR_EL2.FB only applies to EL1. So it depends who is setting it in the 
this situation. If it is Xen, then it would only apply to its VM. If it 
is KVM, then it would also apply to the nested Xen.

> Can you explain in what scenario exactly, can we use vmalle1?

We can use vmalle1 in Xen for the situation we discussed. I was only 
pointing out that the implementation in KVM seems suboptimal.

> 
>> Before going into batching, do you have any data showing how often XENMEM_remove_from_physmap is called in your setup? Similar, I would be interested to know the number of TLBs flush within one hypercalls and whether the regions unmapped were contiguous.
> The number of times XENMEM_remove_from_physmap is invoked depends upon the size of each binary. Each hypercall invokes TLB instruction once. If I use persistent rootfs, then this hypercall is invoked almost 7458 times (+8 approx) which is equal to sum of kernel and DTB image pages:
> domainbuilder: detail: xc_dom_alloc_segment:   kernel       : 0x40000000 -> 0x41d1f200  (pfn 0x40000 + 0x1d20 pages)
> domainbuilder: detail: xc_dom_alloc_segment:   devicetree   : 0x48000000 -> 0x4800188d  (pfn 0x48000 + 0x2 pages)
> 
> And if I use ramdisk image, then this hypercall is invoked almost 222815 times (+8 approx) which is equal to sum of kernel, ramdisk and DTB image 4k pages.
> domainbuilder: detail: xc_dom_alloc_segment:   kernel       : 0x40000000 -> 0x41d1f200  (pfn 0x40000 + 0x1d20 pages)
> domainbuilder: detail: xc_dom_alloc_segment:   module0      : 0x48000000 -> 0x7c93d000  (pfn 0x48000 + 0x3493d pages)
> domainbuilder: detail: xc_dom_alloc_segment:   devicetree   : 0x7c93d000 -> 0x7c93e8d9  (pfn 0x7c93d + 0x2 pages)
> 
> You can see the address ranges in above logs, the addresses seem contiguous in this address space and at best we can reduce the number of calls to 3, each at the end of every image when removed from physmap.

Thanks for the log. I haven't looked at the toolstack code. Does this 
mean only one ioctl call will be issue per blob will be used?

> 
>> we may still send a few TLBs because:
>> * We need to avoid long-running operations, so the hypercall may restart. So we will have to flush at mininum before every restart
>> * The current way we handle batching is we will process one item at the time. As this may free memory (either leaf or intermediate page-tables), we will need to flush the TLBs first to prevent the domain accessing the wrong memory. This could be solved by keeping track of the list of memory to free. But this is going to require some work and I am not entirely sure this is worth it at the moment.
> I think now you have the figure that 222815 TLBs are too much and a few TLBs would still be a lot better. TLBs less than 10 are not much noticeable.

I agree this is too much but this is going to require quite a bit of 
work (as I said we would need to keep track of pages to be freed before 
the TLB flush).

At least to me, it feels like switching to TLBI range (or a series os 
IPAS2E1IS) is an easier win. But if you feel like doing the larger 
rework, I would be happy to have a look to check whether it would be an 
acceptable change for upstream.

> 
>> We could use a series of TLBI IPAS2E1IS which I think is what TLBI range is meant to replace (so long the addresses are contiguous in the given space).
> Isn't IPAS2E1IS a range tlbi instruction? My understanding is that this instruction is available on processors with range TLBI support, I could be wrong. I saw its KVM emulation which does full invalidation if range TLBI is not supported (https://github.com/torvalds/linux/blob/master/arch/arm64/kvm/hyp/pgtable.c#L647).

IPAS2E1IS only allows you to invalidate one address at the time and is 
available on all processors. The R version is only available when the 
processor support TLBI range and allow you to invalidate multiple 
contiguous address.

Cheers,

-- 
Julien Grall


