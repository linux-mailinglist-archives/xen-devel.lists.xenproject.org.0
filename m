Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D632482B2
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 12:14:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7ycv-00045z-At; Tue, 18 Aug 2020 10:13:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ffgU=B4=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k7ycu-00045q-DM
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 10:13:56 +0000
X-Inumbo-ID: 9ed926a7-f731-4a90-951a-06b24bbb496b
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ed926a7-f731-4a90-951a-06b24bbb496b;
 Tue, 18 Aug 2020 10:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=u8PuyfT3uUb0vqwtvLyAhKRPcN5QZF1AfHi7Z/baUj4=; b=S8XXh/1w82eRKiCGMvzy7xYsO5
 cy7HinQFuBARpWA7wNC73VqBguH+z58F8XCGfKNRNjYJcg4c8CSp6HbdVQlPINW8A52IL5st86WvG
 AQ/R79lmz/kpRZgTbbLojrlt+5PyUBcw6uHHRVkjfe5BDXIpmcbyRj6Pe4Wm+1/x3zOs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k7ycq-0000hL-Ml; Tue, 18 Aug 2020 10:13:52 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k7ycq-0002na-BZ; Tue, 18 Aug 2020 10:13:52 +0000
Subject: Re: [PATCH v8 03/15] x86/mm: rewrite virt_to_xen_l*e
To: Jan Beulich <jbeulich@suse.com>, Hongyan Xia <hx242@xen.org>
Cc: xen-devel@lists.xenproject.org, jgrall@amazon.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1595857947.git.hongyxia@amazon.com>
 <e7963f6d8cab8e4d5d4249b12a8175405d888bba.1595857947.git.hongyxia@amazon.com>
 <41d9d8d4-d5cb-8350-c118-c9e1fe73b6d0@suse.com>
 <a4f02c292a369cfd771790b1d164f139fec6bead.camel@xen.org>
 <f25e278f-2d63-d806-4650-983df490556f@xen.org>
 <d75fd45c-3f66-63c9-90c7-90dc10fc5763@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8bb9eb92-ede4-0fa4-d21f-c7976fe70acf@xen.org>
Date: Tue, 18 Aug 2020 11:13:48 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <d75fd45c-3f66-63c9-90c7-90dc10fc5763@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 18/08/2020 09:49, Jan Beulich wrote:
> On 13.08.2020 19:22, Julien Grall wrote:
>> Hi,
>>
>> On 13/08/2020 17:08, Hongyan Xia wrote:
>>> On Fri, 2020-08-07 at 16:05 +0200, Jan Beulich wrote:
>>>> On 27.07.2020 16:21, Hongyan Xia wrote:
>>>>> From: Wei Liu <wei.liu2@citrix.com>
>>>>>
>>>>> Rewrite those functions to use the new APIs. Modify its callers to
>>>>> unmap
>>>>> the pointer returned. Since alloc_xen_pagetable_new() is almost
>>>>> never
>>>>> useful unless accompanied by page clearing and a mapping, introduce
>>>>> a
>>>>> helper alloc_map_clear_xen_pt() for this sequence.
>>>>>
>>>>> Note that the change of virt_to_xen_l1e() also requires
>>>>> vmap_to_mfn() to
>>>>> unmap the page, which requires domain_page.h header in vmap.
>>>>>
>>>>> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
>>>>> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
>>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>>>
>>>>> ---
>>>>> Changed in v8:
>>>>> - s/virtual address/linear address/.
>>>>> - BUG_ON() on NULL return in vmap_to_mfn().
>>>>
>>>> The justification for this should be recorded in the description. In
>>>
>>> Will do.
>>>
>>>> reply to v7 I did even suggest how to easily address the issue you
>>>> did notice with large pages, as well as alternative behavior for
>>>> vmap_to_mfn().
>>>
>>> One thing about adding SMALL_PAGES is that vmap is common code and I am
>>> not sure if the Arm side is happy with it.
>>
>> At the moment, Arm is only using small mapping but I plan to change that soon because we have regions that can be fairly big.
>>
>> Regardless that, the issue with vmap_to_mfn() is rather x86 specific. So I don't particularly like the idea to expose such trick in common code.
>>
>> Even on x86, I think this is not the right approach. Such band-aid will impact the performance as, assuming superpages are used, it will take longer to map and add pressure on the TLBs.
>>
>> I am aware that superpages will be useful for LiveUpdate, but is there any use cases in upstream?
> 
> Superpage use by vmalloc() is purely occasional: You'd have to vmalloc()
> 2Mb or more _and_ the page-wise allocation ought to return 512
> consecutive pages in the right order. Getting 512 consecutive pages is
> possible in practice, but with the page allocator allocating top-down it
> is very unlikely for them to be returned in increasing-sorted order.
So your assumption here is vmap_to_mfn() can only be called on 
vmalloc-ed() area. While this may be the case in Xen today, the name 
clearly suggest it can be called on all vmap-ed region.

> 
>> If not, could we just use the BUG_ON() and implement correctly vmap_to_mfn() in a follow-up?
> 
> My main concern with the BUG_ON() is that it detects a problem long after
> it was introduced (when the mapping was established). I'd rather see a
> BUG_ON() added there if use of MAP_SMALL_PAGES is deemed unsuitable.

 From what you wrote, I would agree that vmalloc() is unlikely going to 
use superpages. But this is not going to solve the underlying problem 
with the rest of the vmap area.

So are you suggesting to use MAP_SMALL_PAGES for *all* the vmap()?

Cheers,

-- 
Julien Grall

