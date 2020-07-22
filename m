Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB9F229740
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 13:18:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyCke-0007d8-WC; Wed, 22 Jul 2020 11:17:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u0rb=BB=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jyCkc-0007d3-TF
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 11:17:30 +0000
X-Inumbo-ID: ee805b84-cc0c-11ea-8631-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee805b84-cc0c-11ea-8631-bc764e2007e4;
 Wed, 22 Jul 2020 11:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OolPR9fxPy209fVnQYEahm8Kor0kPOiihLICyEuQJeQ=; b=fOF1mCZ10HvrVMbkQu/9B/r3RZ
 i91y2VX5I8Idrv1fRhVVsWjlICgLjLVsrO+hanvSnE9nDFRtRL6ySRp7Wp65a+srQjMxcIrLJyVbX
 Kwrkd9n6GPOB3SoVLZCrLeghwjZH7Lh1+cxbxtXahqdHkjjdxFStbmhHyOO1tOUBRE3s=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jyCka-0004ij-T9; Wed, 22 Jul 2020 11:17:28 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jyCka-0000BF-Kr; Wed, 22 Jul 2020 11:17:28 +0000
Subject: Re: Virtio in Xen on Arm (based on IOREQ concept)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <CAPD2p-nthLq5NaU32u8pVaa-ub=a9-LOPenupntTYdS-cu31jQ@mail.gmail.com>
 <20200717150039.GV7191@Air-de-Roger>
 <8f4e0c0d-b3d4-9dd3-ce20-639539321968@gmail.com>
 <3dcab37d-0d60-f1cc-1d59-b5497f0fa95f@xen.org>
 <b6cf0931-c31e-b03b-3995-688536de391a@gmail.com>
 <05acce61-5b29-76f7-5664-3438361caf82@xen.org>
 <20200722082115.GR7191@Air-de-Roger>
 <f3c54a7e-4352-7591-73c2-14215bd3ad34@xen.org>
 <20200722111012.GX7191@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <d28f7cff-53dc-6a63-c681-16bd90b50436@xen.org>
Date: Wed, 22 Jul 2020 12:17:26 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722111012.GX7191@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Oleksandr <olekstysh@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Artem Mygaiev <joculator@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 22/07/2020 12:10, Roger Pau Monné wrote:
> On Wed, Jul 22, 2020 at 11:47:18AM +0100, Julien Grall wrote:
>>>
>>> You can still use the map-on-fault behaviour as above, but I would
>>> recommend that you try to limit the number of hypercalls issued.
>>> Having to issue a single hypercall for each page fault it's going to
>>> be slow, so I would instead use mmap batch to map the hole range in
>>> unpopulated physical memory and then the OS fault handler just needs to
>>> fill the page tables with the corresponding address.
>> IIUC your proposal, you are assuming that you will have enough free space in
>> the physical address space to map the foreign mapping.
>>
>> However that amount of free space is not unlimited and may be quite small
>> (see above). It would be fairly easy to exhaust it given that a userspace
>> application can map many times the same guest physical address.
>>
>> So I still think we need to be able to allow Linux to swap a foreign page
>> with another page.
> 
> Right, but you will have to be careful to make sure physical addresses
> are not swapped while being used for IO with devices, as in that case
> you won't get a recoverable fault. This is safe now because physical
> mappings created by privcmd are never swapped out, but if you go the
> route you propose you will have to figure a way to correctly populate
> physical ranges used for IO with devices, even when the CPU hasn't
> accessed them.
> 
> Relying solely on CPU page faults to populate them will not be enough,
> as the CPU won't necessarily access all the pages that would be send
> to devices for IO.

The problem you described here doesn't seem to be specific to foreign 
mapping. So I would really be surprised if Linux doesn't already have 
generic mechanism to deal with this.

Hence why I suggested before to deal with foreign mapping the same way 
as Linux would do with user memory.

Cheers,

-- 
Julien Grall

