Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFBD3DEE46
	for <lists+xen-devel@lfdr.de>; Tue,  3 Aug 2021 14:54:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163445.299400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAtvf-00068C-QZ; Tue, 03 Aug 2021 12:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163445.299400; Tue, 03 Aug 2021 12:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAtvf-00065i-Mo; Tue, 03 Aug 2021 12:53:55 +0000
Received: by outflank-mailman (input) for mailman id 163445;
 Tue, 03 Aug 2021 12:53:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mAtve-00065c-Pd
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 12:53:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mAtvQ-0003gq-16; Tue, 03 Aug 2021 12:53:40 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mAtvP-0005NU-Qo; Tue, 03 Aug 2021 12:53:39 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=IukBCGANAyBAGIPpDsfF0Ts2CkVqcdArZriCa62zS/A=; b=YbGSfKFB7+pcMac/BmAE3fJXwP
	n+SaJxFog0QBA7bNlAdKocxgpRxMxz2w5AaDIQ+AEGejZbp3c174aL82ZRV+nbLIwrZ7aqkV0yogM
	nKlMKvjiy0Z8diyLrdXMP/4SfgUNf2elfTAq0Mh+JdWha3sV6R1Vi32e5SNmwNm/05fQ=;
Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1627489110-25633-1-git-send-email-olekstysh@gmail.com>
 <80fafc01-f063-d6e5-1c08-7ad64550310c@citrix.com>
 <e8db3021-78a5-e040-a70b-62ca5b500149@xen.org>
 <4de5ed21-379e-b618-44c8-924d88b1a519@citrix.com>
 <bbc7f597-5249-20a0-cac9-13f594268299@xen.org>
 <5176e91c-1971-9004-af65-7a4aefc7eb78@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f9072102-f408-dade-0b66-09c2e0ee91c1@xen.org>
Date: Tue, 3 Aug 2021 13:53:35 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <5176e91c-1971-9004-af65-7a4aefc7eb78@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Jan,

On 03/08/2021 13:49, Jan Beulich wrote:
> On 28.07.2021 21:53, Julien Grall wrote:
>> On 28/07/2021 20:00, Andrew Cooper wrote:
>>> On 28/07/2021 18:27, Julien Grall wrote:
>>>> On 28/07/2021 18:19, Andrew Cooper wrote:
>>>>> On 28/07/2021 17:18, Oleksandr Tyshchenko wrote:
>>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>>
>>>>>> Add XENMEM_get_unallocated_space hypercall which purpose is to
>>>>>> query hypervisor to find regions of guest physical address space
>>>>>> which are unused and can be used to create grant/foreign mappings
>>>>>> instead of wasting real pages from the domain memory for
>>>>>> establishing these mappings. The problem with the current Linux
>>>>>> on Xen on Arm behaviour is if we want to map some guest memory
>>>>>> regions in advance or to perform cache mappings in the backend
>>>>>> we might run out of memory in the host (see XSA-300).
>>>>>> This of course, depends on the both host and guest memory sizes.
>>>>>>
>>>>>> The "unallocated space" can't be figured out precisely by
>>>>>> the domain on Arm without hypervisor involvement:
>>>>>> - not all device I/O regions are known by the time domain starts
>>>>>>      creating grant/foreign mappings
>>>>>> - the Dom0 is not aware of memory regions used for the identity
>>>>>>      mappings needed for the PV drivers to work
>>>>>> In both cases we might end up re-using these regions by
>>>>>> a mistake. So, the hypervisor which maintains the P2M for the domain
>>>>>> is in the best position to provide "unallocated space".
>>>>>
>>>>> I'm afraid this does not improve the situation.
>>>>>
>>>>> If a guest follows the advice from XENMEM_get_unallocated_space, and
>>>>> subsequently a new IO or identity region appears, everything will
>>>>> explode, because the "safe area" wasn't actually safe.
>>>>>
>>>>> The safe range *must* be chosen by the toolstack, because nothing else
>>>>> can do it safely or correctly.
>>>>
>>>> The problem is how do you size it? In particular, a backend may map
>>>> multiple time the same page (for instance if the page is granted twice).
>>>
>>> The number of mapped grants is limited by the size of the maptrack table
>>> in Xen, which is a toolstack input to the domaincreate hypercall.
>>> Therefore, the amount of space required is known and bounded.
>>>
>>> There are a handful of other frames required in the current ABI (shared
>>> info, vcpu info, etc).
>>>
>>> The areas where things do become fuzzy is things like foreign mappings,
>>> acquire_resource, etc for the control domain, which are effectively
>>> unbounded from the domain's point of view.
>>>
>>> For those, its entirely fine to say "here 128G of safe mapping space" or
>>> so.  Even the quantity of mapping dom0 can make is limited by the shadow
>>> memory pool and the number of pagetables Xen is willing to expend on the
>>> second stage translation tables.
>>
>> FWIW, on Arm, we don't have shadow memory pool.
> 
> Where do you take 2nd level page table memory from then?

 From xenheap directly. And yes, I know this may lead to other issues. 
But that's a known missing features that so far no-one tackled.

Cheers,

-- 
Julien Grall

