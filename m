Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D51B2984A40
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 19:25:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803268.1213772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st9HZ-0005fI-KF; Tue, 24 Sep 2024 17:25:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803268.1213772; Tue, 24 Sep 2024 17:25:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st9HZ-0005cV-HH; Tue, 24 Sep 2024 17:25:01 +0000
Received: by outflank-mailman (input) for mailman id 803268;
 Tue, 24 Sep 2024 17:25:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1st9HY-0005cP-6I
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 17:25:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1st9HX-0005Ew-ND; Tue, 24 Sep 2024 17:24:59 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1st9HX-0008Qy-FF; Tue, 24 Sep 2024 17:24:59 +0000
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
	bh=5zDSarydXxeFQ3ngodONAAcl0ZfxHzxRZPAbajwIwGc=; b=aNwRJM3qDbztGrcR0AU7/JirkK
	sYRKAguJ1Z8JnxlU9AAx3sf45SH5/R30DhIWNCQWb88zXe0uVPjkEOglXI1gyy4vWE9KIfiYN8Pj9
	T1k452ivGq6/q0Rl3uwXeZVEZn5oCH2DFRGV12cdnHNJt3NZGXC6ezCj0TkTT3st+Tv8=;
Message-ID: <7b867cf0-9d4b-4067-ac56-a7d6b3d440f5@xen.org>
Date: Tue, 24 Sep 2024 18:24:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/6] xen/arm: Reserve resources for virtio-pci
Content-Language: en-GB
To: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
 dpsmith@apertussolutions.com
References: <20240924162359.1390487-1-edgar.iglesias@gmail.com>
 <20240924162359.1390487-3-edgar.iglesias@gmail.com>
 <465cb8b5-5f46-42ce-be8f-a38c1c23a805@xen.org> <ZvLyzZ8n-QgrYOCW@zapote>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ZvLyzZ8n-QgrYOCW@zapote>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Edgar,

On 24/09/2024 18:11, Edgar E. Iglesias wrote:
> On Tue, Sep 24, 2024 at 05:35:20PM +0100, Julien Grall wrote:
>> Hi Edgar,
>>
>> On 24/09/2024 17:23, Edgar E. Iglesias wrote:
>>> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>>>
>>> Reserve memory ranges and interrupt lines for an externally
>>> emulated PCI controller (e.g by QEMU) dedicated to hosting
>>> Virtio devices and potentially other emulated devices.
>>>
>>> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
>>> ---
>>>    xen/include/public/arch-arm.h | 17 +++++++++++++++++
>>>    1 file changed, 17 insertions(+)
>>>
>>> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
>>> index e19f0251a6..654b827715 100644
>>> --- a/xen/include/public/arch-arm.h
>>> +++ b/xen/include/public/arch-arm.h
>>> @@ -494,6 +494,20 @@ typedef uint64_t xen_callback_t;
>>>    #define GUEST_RAM1_BASE   xen_mk_ullong(0x0200000000) /* 952GB of RAM @ 8GB */
>>>    #define GUEST_RAM1_SIZE   xen_mk_ullong(0xee00000000)
>>> +/* Virtio PCI - Ordered by decreasing size to keep things aligned */
>>> +#define GUEST_VIRTIO_PCI_PREFETCH_MEM_TYPE  xen_mk_ullong(0x43000000)
>>> +#define GUEST_VIRTIO_PCI_PREFETCH_MEM_BASE  xen_mk_ullong(0x0f000000000)
>>> +#define GUEST_VIRTIO_PCI_PREFETCH_MEM_SIZE  xen_mk_ullong(0x100000000)
>>> +
>>> +#define GUEST_VIRTIO_PCI_ECAM_BASE      (GUEST_VIRTIO_PCI_PREFETCH_MEM_BASE + \
>>> +                                         GUEST_VIRTIO_PCI_PREFETCH_MEM_SIZE)
>>> +#define GUEST_VIRTIO_PCI_ECAM_SIZE      xen_mk_ullong(0x10000000)
>>> +
>>> +#define GUEST_VIRTIO_PCI_MEM_TYPE         xen_mk_ullong(0x02000000)
>>> +#define GUEST_VIRTIO_PCI_MEM_BASE         (GUEST_VIRTIO_PCI_ECAM_BASE + \
>>> +                                           GUEST_VIRTIO_PCI_ECAM_SIZE)
>>> +#define GUEST_VIRTIO_PCI_MEM_SIZE         xen_mk_ullong(0x00002000000)
>>
>> Why is this specific to virtio PCI? However, I am not entirely convinced we
>> should have a second PCI hostbridge exposed to the guest for a few reasons:
>>    1. This require to reserve yet another range in the address space (could
>> be solved with a more dynamic layout)
>>    2. From your instructions, the guest needs to explicitly do a PCI rescan.

Another big advantage I forgot to mention is disaggregation. In a world 
where the hostbridge is handled in Xen, you could have a PCI device 
emulated by dom0 while the other is emulated by a stub domain.

>>
>> So rather than having a second hostbridge, have you considered to extend the
>> existing hostbridge (implemented in Xen) to support a mix of physical PCI
>> device and virtual one?
>>
> 
> Thanks Julien,
> 
> It's briefly come up in a couple of discussions but I haven't looked
> carefully at it. It is a good idea and it's probably worth prototyping
> to see what the gaps are in hypercall interfaces, QEMU support etc.

I also vaguely recall to discuss it on xen-devel. But I couldn't find 
the discussion... :(.

I think all the hypercalls should be there but will require some 
plumbing in Xen on Arm. QEMU should be able to request Xen to forward 
configuration access for a given PCI device (see XEN_DMOP_IO_RANGE_PCI). 
They will then be forwarded to QEMU using IOREQ_TYPE_PCI_CONFIG.

We also have an hypercall to be able to inject interrupts from QEMU (see 
XEN_DMOP_set_irq_level).

Cheers,

-- 
Julien Grall


