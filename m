Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB767EF774
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 19:25:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635349.991223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r43WA-0003yI-H3; Fri, 17 Nov 2023 18:24:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635349.991223; Fri, 17 Nov 2023 18:24:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r43WA-0003uz-E2; Fri, 17 Nov 2023 18:24:38 +0000
Received: by outflank-mailman (input) for mailman id 635349;
 Fri, 17 Nov 2023 18:24:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r43W9-0003ur-0q
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 18:24:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r43W8-00063G-Is; Fri, 17 Nov 2023 18:24:36 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.17.66]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r43W8-0001Wf-CO; Fri, 17 Nov 2023 18:24:36 +0000
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
	bh=ItFAbYz68LqIotY379B9VsIxxIiSzDvZxosbm44fRrc=; b=hD/3sWV8x6aGstT5MB2pBxnuNa
	2TTHrsTyMQTOdshQBuM4Dv8mTbWQV15dUtdfe3WYMBdMy5sp6wc+VUyChIOrvPGkai9yWNeL1tP5B
	n6ltwiDA4HBeej+OBtPEEd1yh8TDq/2zgucbAmLD4AAmhJerSnsGjNYi8bsOoDW8eOPg=;
Message-ID: <cd2146a5-bbb6-4c49-bca8-c340b4acaf36@xen.org>
Date: Fri, 17 Nov 2023 18:24:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/6] xen/public: arch-arm: reserve resources for
 virtio-pci
Content-Language: en-GB
To: Sergiy Kibrik <sergiy_kibrik@epam.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231115112611.3865905-1-Sergiy_Kibrik@epam.com>
 <20231115112611.3865905-3-Sergiy_Kibrik@epam.com>
 <f4523916-f8aa-4f3c-a148-2fc73b0c5fa4@xen.org>
 <a5ce647b-f372-41ee-b1d2-b6ff16c3d1a0@epam.com>
 <9e0760f2-6ffd-4010-aabf-ff4f643f288c@xen.org>
 <98e05fb7-ea8b-48a4-b860-01d2a081e897@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <98e05fb7-ea8b-48a4-b860-01d2a081e897@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Sergiy,

On 17/11/2023 13:19, Sergiy Kibrik wrote:
>>>>> + */
>>>>> +#define GUEST_VIRTIO_PCI_ECAM_BASE          xen_mk_ullong(0x33000000)
>>>>> +#define GUEST_VIRTIO_PCI_TOTAL_ECAM_SIZE    xen_mk_ullong(0x01000000)
>>>>> +#define GUEST_VIRTIO_PCI_HOST_ECAM_SIZE     xen_mk_ullong(0x00200000)
>>>>> +
>>>>> +/* 64 MB is reserved for virtio-pci memory */
>>>>> +#define GUEST_VIRTIO_PCI_ADDR_TYPE_MEM    xen_mk_ullong(0x02000000)
>>>>> +#define GUEST_VIRTIO_PCI_MEM_ADDR         xen_mk_ullong(0x34000000)
>>>>> +#define GUEST_VIRTIO_PCI_MEM_SIZE         xen_mk_ullong(0x04000000)
>>>>> +
>>>>>    /*
>>>>>     * 16MB == 4096 pages reserved for guest to use as a region to 
>>>>> map its
>>>>>     * grant table in.
>>>>> @@ -476,6 +489,11 @@ typedef uint64_t xen_callback_t;
>>>>>    #define GUEST_MAGIC_BASE  xen_mk_ullong(0x39000000)
>>>>>    #define GUEST_MAGIC_SIZE  xen_mk_ullong(0x01000000)
>>>>> +/* 64 MB is reserved for virtio-pci Prefetch memory */
>>>>
>>>> This doesn't seem a lot depending on your use case. Can you details how
>>>> you can up with "64 MB"?
>>>
>>> the same calculation as it was done configuration space. It was observed
>>> that only 16K is used per virtio-pci device (maybe it can be bigger for
>>> usual PCI device, I don't know). Please look at the example of DomU log
>>> below (to strings that contain "*BAR 4: assigned*"):
>>
>> What about virtio-gpu? I would expect a bit more memory is necessary 
>> for that use case.
>>
>> Any case, what I am looking for is for some explanation in the commit 
>> message of the limits. I don't particularly care about the exact limit 
>> because this is not part of a stable ABI.
> 
> sure, I'll put a bit more explanation in both comment and commit 
> message. Should I post updated patch series, with updated resources and 
> without patch #5, or shall we wait for some more comments here?

I would wait for comments before posting in particular if you haven't 
yet received any comment on the tools side.

Cheers,

-- 
Julien Grall

