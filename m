Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D572480E9
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 10:49:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7xIo-0002vC-Am; Tue, 18 Aug 2020 08:49:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RgDL=B4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k7xIm-0002v7-Jd
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 08:49:04 +0000
X-Inumbo-ID: 7fc2517f-d216-43d4-b918-5c784d2e0b18
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7fc2517f-d216-43d4-b918-5c784d2e0b18;
 Tue, 18 Aug 2020 08:49:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 174DFABF4;
 Tue, 18 Aug 2020 08:49:28 +0000 (UTC)
Subject: Re: [PATCH v8 03/15] x86/mm: rewrite virt_to_xen_l*e
To: Julien Grall <julien@xen.org>, Hongyan Xia <hx242@xen.org>
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d75fd45c-3f66-63c9-90c7-90dc10fc5763@suse.com>
Date: Tue, 18 Aug 2020 10:49:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <f25e278f-2d63-d806-4650-983df490556f@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

On 13.08.2020 19:22, Julien Grall wrote:
> Hi,
> 
> On 13/08/2020 17:08, Hongyan Xia wrote:
>> On Fri, 2020-08-07 at 16:05 +0200, Jan Beulich wrote:
>>> On 27.07.2020 16:21, Hongyan Xia wrote:
>>>> From: Wei Liu <wei.liu2@citrix.com>
>>>>
>>>> Rewrite those functions to use the new APIs. Modify its callers to
>>>> unmap
>>>> the pointer returned. Since alloc_xen_pagetable_new() is almost
>>>> never
>>>> useful unless accompanied by page clearing and a mapping, introduce
>>>> a
>>>> helper alloc_map_clear_xen_pt() for this sequence.
>>>>
>>>> Note that the change of virt_to_xen_l1e() also requires
>>>> vmap_to_mfn() to
>>>> unmap the page, which requires domain_page.h header in vmap.
>>>>
>>>> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
>>>> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> ---
>>>> Changed in v8:
>>>> - s/virtual address/linear address/.
>>>> - BUG_ON() on NULL return in vmap_to_mfn().
>>>
>>> The justification for this should be recorded in the description. In
>>
>> Will do.
>>
>>> reply to v7 I did even suggest how to easily address the issue you
>>> did notice with large pages, as well as alternative behavior for
>>> vmap_to_mfn().
>>
>> One thing about adding SMALL_PAGES is that vmap is common code and I am
>> not sure if the Arm side is happy with it.
> 
> At the moment, Arm is only using small mapping but I plan to change that soon because we have regions that can be fairly big.
> 
> Regardless that, the issue with vmap_to_mfn() is rather x86 specific. So I don't particularly like the idea to expose such trick in common code.
> 
> Even on x86, I think this is not the right approach. Such band-aid will impact the performance as, assuming superpages are used, it will take longer to map and add pressure on the TLBs.
> 
> I am aware that superpages will be useful for LiveUpdate, but is there any use cases in upstream?

Superpage use by vmalloc() is purely occasional: You'd have to vmalloc()
2Mb or more _and_ the page-wise allocation ought to return 512
consecutive pages in the right order. Getting 512 consecutive pages is
possible in practice, but with the page allocator allocating top-down it
is very unlikely for them to be returned in increasing-sorted order.

> If not, could we just use the BUG_ON() and implement correctly vmap_to_mfn() in a follow-up?

My main concern with the BUG_ON() is that it detects a problem long after
it was introduced (when the mapping was established). I'd rather see a
BUG_ON() added there if use of MAP_SMALL_PAGES is deemed unsuitable.

Jan

