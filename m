Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4204F1E7FEE
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 16:15:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jefn2-0006CQ-NN; Fri, 29 May 2020 14:15:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mKAR=7L=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jefn1-0006CL-0J
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 14:15:15 +0000
X-Inumbo-ID: d0894152-a1b6-11ea-8993-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0894152-a1b6-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 14:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6cmyS76XBiQACTTTkkE0sQn9UUH3eieO0x/9/g6de3Q=; b=XcWzge/trjJcoZZgemfsTiHPYO
 4qtKhKGGKc63wLjkf65WiAr2cVOsrA7T5jSX5VTga4P4gv4NIr5UOl4PwnwwodR6O3pVzPurqTWPz
 sbBrFRZ0rjqBiX0TT3ZhaitLZgxMn20O4mSYK4aBE9XRP8rH1TFQ+ttHKhE7LZ1p1IL4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jefmw-0006OT-5m; Fri, 29 May 2020 14:15:10 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jefmv-0002X8-UP; Fri, 29 May 2020 14:15:10 +0000
Subject: Re: [RFC PATCH 1/1] xen: Use a global mapping for runstate
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <cover.1590675919.git.bertrand.marquis@arm.com>
 <03e7cd740922bfbaa479f22d81d9de06f718a305.1590675919.git.bertrand.marquis@arm.com>
 <e63a83a1-7d71-9cc5-517a-275e17880e2b@xen.org>
 <3B88C76B-6972-4A66-AFDC-0B5C27FBA740@arm.com>
 <07a1008d-1acb-aab6-ab10-176e7856a296@xen.org>
 <1CEE9707-3201-4218-ACF0-7829181A769C@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <38115dda-f6dc-c35d-fbaa-3735456d226f@xen.org>
Date: Fri, 29 May 2020 15:15:06 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <1CEE9707-3201-4218-ACF0-7829181A769C@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "paul@xen.org" <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Xia, Hongyan" <hongyxia@amazon.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 29/05/2020 15:02, Bertrand Marquis wrote:
> 
> 
>> On 29 May 2020, at 10:43, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Bertrand,
>>
>> On 29/05/2020 09:13, Bertrand Marquis wrote:
>>> Hi Julien,
>>>> On 28 May 2020, at 19:54, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> Hi Bertrand,
>>>>
>>>> Thank you for the patch.
>>>>
>>>> On 28/05/2020 16:25, Bertrand Marquis wrote:
>>>>> At the moment on Arm, a Linux guest running with KTPI enabled will
>>>>> cause the following error when a context switch happens in user mode:
>>>>> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0cd0
>>>>> This patch is modifying runstate handling to map the area given by the
>>>>> guest inside Xen during the hypercall.
>>>>> This is removing the guest virtual to physical conversion during context
>>>>> switches which removes the bug
>>>>
>>>> It would be good to spell out that a virtual address is not stable. So relying on it is wrong.
>>>>
>>>>> and improve performance by preventing to
>>>>> walk page tables during context switches.
>>>>
>>>> With Secret free hypervisor in mind, I would like to suggest to map/unmap the runstate during context switch.
>>>>
>>>> The cost should be minimal when there is a direct map (i.e on Arm64 and x86) and still provide better performance on Arm32.
>>> Even with a minimal cost this is still adding some non real-time behaviour to the context switch.
>>
>> Just to be clear, by minimal I meant the mapping part is just a virt_to_mfn() call and the unmapping is a NOP.
>>
>> IHMO, if virt_to_mfn() ends up to add non-RT behavior then you have much bigger problem than just this call.
>>
>>> But definitely from the security point of view as we have to map a page from the guest, we could have accessible in Xen some data that should not be there.
>>> There is a trade here where:
>>> - xen can protect by map/unmapping
>>> - a guest which wants to secure his data should either not use it or make sure there is nothing else in the page
>>
>> Both are valid and depends on your setup. One may want to protect all the existing guests, so modifying a guest may not be a solution.
> 
> The fact to map/unmap is increasing the protection but not removing the problem completely.

I would be curious to understand why the problem is not completely removed.

 From my perspective, this covers the case where Xen could leak the 
information of one domain to another domain. When there is no direct 
mapping, temporary mappings via domain_map_page() will be either 
per-pCPU (or per-vCPU). So the content should never be (easily) 
accessible by another running domain while it is mapped.

If the guest is concerned about exposing the data to Xen, then it is a 
completely different issue and should be taken care by the guest iself.

Cheers,

-- 
Julien Grall

