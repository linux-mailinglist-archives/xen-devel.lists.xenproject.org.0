Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2E3670BFF
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 23:46:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479925.744038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHuiB-0008Kn-3n; Tue, 17 Jan 2023 22:45:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479925.744038; Tue, 17 Jan 2023 22:45:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHuiB-0008J2-19; Tue, 17 Jan 2023 22:45:47 +0000
Received: by outflank-mailman (input) for mailman id 479925;
 Tue, 17 Jan 2023 22:45:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pHui9-0008It-Mo
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 22:45:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHui9-0005kD-0h; Tue, 17 Jan 2023 22:45:45 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHui8-0001lP-Ne; Tue, 17 Jan 2023 22:45:44 +0000
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
	bh=3NWZAyDIovJyMx74/VBGc2qVIk/lkIqeHL7mPsetEoU=; b=s0XlxGqoeDUoN2JEKRZuYmkoDF
	sSkH0eVrYoFjTTbK87rY9c1J5hO1BUI+E3bil+r7nHu0bMdL+WiC+ghXY79OqHEhZYk2EBqGt+a01
	HJI/d3EbN20sz1CpItQQ8yuWppZvX/kXPU2HspFsgaL7zQgTE4YGlD6nFlGWmWdRmbnI=;
Message-ID: <e59e2c5f-a0cc-ff2e-15ba-268fc132e5d4@xen.org>
Date: Tue, 17 Jan 2023 22:45:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH RFC 07/10] domain: map/unmap GADDR based shared guest
 areas
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
 <5a571fd9-b0c2-216e-a444-102397a22ca0@suse.com>
 <f1229a27-f92c-a0dc-928e-1d78b928fdd0@xen.org>
 <bd6befdf-65eb-6937-fb85-449a5fa16794@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <bd6befdf-65eb-6937-fb85-449a5fa16794@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 17/01/2023 22:20, Andrew Cooper wrote:
> On 24/11/2022 9:29 pm, Julien Grall wrote:
>> Hi Jan,
>>
>> I am still digesting this series and replying with some initial comments.
>>
>> On 19/10/2022 09:43, Jan Beulich wrote:
>>> The registration by virtual/linear address has downsides: At least on
>>> x86 the access is expensive for HVM/PVH domains. Furthermore for 64-bit
>>> PV domains the areas are inaccessible (and hence cannot be updated by
>>> Xen) when in guest-user mode.
>>>
>>> In preparation of the introduction of new vCPU operations allowing to
>>> register the respective areas (one of the two is x86-specific) by
>>> guest-physical address, flesh out the map/unmap functions.
>>>
>>> Noteworthy differences from map_vcpu_info():
>>> - areas can be registered more than once (and de-registered),
>>> - remote vCPU-s are paused rather than checked for being down (which in
>>>     principle can change right after the check),
>>> - the domain lock is taken for a much smaller region.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> RFC: By using global domain page mappings the demand on the underlying
>>>        VA range may increase significantly. I did consider to use per-
>>>        domain mappings instead, but they exist for x86 only. Of course we
>>>        could have arch_{,un}map_guest_area() aliasing global domain page
>>>        mapping functions on Arm and using per-domain mappings on x86. Yet
>>>        then again map_vcpu_info() doesn't do so either (albeit that's
>>>        likely to be converted subsequently to use map_vcpu_area()
>>> anyway).
>>>
>>> RFC: In map_guest_area() I'm not checking the P2M type, instead - just
>>>        like map_vcpu_info() - solely relying on the type ref acquisition.
>>>        Checking for p2m_ram_rw alone would be wrong, as at least
>>>        p2m_ram_logdirty ought to also be okay to use here (and in similar
>>>        cases, e.g. in Argo's find_ring_mfn()). p2m_is_pageable() could be
>>>        used here (like altp2m_vcpu_enable_ve() does) as well as in
>>>        map_vcpu_info(), yet then again the P2M type is stale by the time
>>>        it is being looked at anyway without the P2M lock held.
>>>
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -1563,7 +1563,82 @@ int map_guest_area(struct vcpu *v, paddr
>>>                       struct guest_area *area,
>>>                       void (*populate)(void *dst, struct vcpu *v))
>>>    {
>>> -    return -EOPNOTSUPP;
>>> +    struct domain *currd = v->domain;
>>> +    void *map = NULL;
>>> +    struct page_info *pg = NULL;
>>> +    int rc = 0;
>>> +
>>> +    if ( gaddr )
>>
>> 0 is technically a valid (guest) physical address on Arm.
> 
> It is on x86 too, but that's not why 0 is generally considered an
> invalid address.
> 
> See the multitude of XSAs, and near-XSAs which have been caused by bad
> logic in Xen caused by trying to make a variable held in struct
> vcpu/domain have a default value other than 0.
> 
> It's not impossible to write such code safely, and in this case I expect
> it can be done by the NULLness (or not) of the mapping pointer, rather
> than by stashing the gaddr, but history has proved repeatedly that this
> is a very fertile source of security bugs.

I understand the security concern. However... you are now imposing some 
constraint in the guest OS which may be more difficult to address.

Furthermore, we are trying to make a sane ABI. It doesn't look sane to 
me to expose our currently shortcomings to the guest OS. The more that 
if we decide it to relax in the future, then it would not help an OS 
because they will need to support older Xen...

Cheers,

-- 
Julien Grall

