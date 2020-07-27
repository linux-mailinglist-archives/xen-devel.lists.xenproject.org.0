Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4A722F917
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 21:32:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k08qG-0003D1-FZ; Mon, 27 Jul 2020 19:31:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfpx=BG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k08qF-0003Cw-PV
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 19:31:19 +0000
X-Inumbo-ID: be5ddd8c-d03f-11ea-a7ef-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be5ddd8c-d03f-11ea-a7ef-12813bfff9fa;
 Mon, 27 Jul 2020 19:31:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 71EEEB17A;
 Mon, 27 Jul 2020 19:31:28 +0000 (UTC)
Subject: Re: [PATCH v7 03/15] x86/mm: rewrite virt_to_xen_l*e
To: Hongyan Xia <hx242@xen.org>
References: <cover.1590750232.git.hongyxia@amazon.com>
 <fd5d98198d9539b232a570a83e7a24be2407e739.1590750232.git.hongyxia@amazon.com>
 <826d5a28-c391-dd30-d588-6f730b454c18@suse.com>
 <bbd18a2f7d86d451f529292c627616044955a84c.camel@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4827e2f5-eac4-fc9b-b206-e6443213652c@suse.com>
Date: Mon, 27 Jul 2020 21:31:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bbd18a2f7d86d451f529292c627616044955a84c.camel@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.07.2020 11:09, Hongyan Xia wrote:
> On Tue, 2020-07-14 at 12:47 +0200, Jan Beulich wrote:
>> On 29.05.2020 13:11, Hongyan Xia wrote:
>>> --- a/xen/include/asm-x86/page.h
>>> +++ b/xen/include/asm-x86/page.h
>>> @@ -291,7 +291,13 @@ void copy_page_sse2(void *, const void *);
>>>   #define pfn_to_paddr(pfn)   __pfn_to_paddr(pfn)
>>>   #define paddr_to_pfn(pa)    __paddr_to_pfn(pa)
>>>   #define paddr_to_pdx(pa)    pfn_to_pdx(paddr_to_pfn(pa))
>>> -#define
>>> vmap_to_mfn(va)     _mfn(l1e_get_pfn(*virt_to_xen_l1e((unsigned
>>> long)(va))))
>>> +
>>> +#define vmap_to_mfn(va)
>>> ({                                                  \
>>> +        const l1_pgentry_t *pl1e_ = virt_to_xen_l1e((unsigned
>>> long)(va));   \
>>> +        mfn_t mfn_ =
>>> l1e_get_mfn(*pl1e_);                                   \
>>> +        unmap_domain_page(pl1e_);
>>>            \
>>> +        mfn_; })
>>
>> Just like is already the case in domain_page_map_to_mfn() I think
>> you want to add "BUG_ON(!pl1e)" here to limit the impact of any
>> problem to DoS (rather than a possible privilege escalation).
>>
>> Or actually, considering the only case where virt_to_xen_l1e()
>> would return NULL, returning INVALID_MFN here would likely be
>> even more robust. There looks to be just a single caller, which
>> would need adjusting to cope with an error coming back. In fact -
>> it already ASSERT()s, despite NULL right now never coming back
>> from vmap_to_page(). I think the loop there would better be
>>
>>      for ( i = 0; i < pages; i++ )
>>      {
>>          struct page_info *page = vmap_to_page(va + i * PAGE_SIZE);
>>
>>          if ( page )
>>              page_list_add(page, &pg_list);
>>          else
>>              printk_once(...);
>>      }
>>
>> Thoughts?
> 
> To be honest, I think the current implementation of vmap_to_mfn() is
> just incorrect. There is simply no guarantee that a vmap is mapped with
> small pages, so IMO we just cannot do virt_to_xen_x1e() here. The
> correct way is to have a generic page table walking function which
> walks from the base and can stop at any level, and properly return code
> to indicate level or any error.
> 
> I am inclined to BUG_ON() here, and upstream a proper fix later to
> vmap_to_mfn() as an individual patch.

Well, yes, in principle large pages can result from e.g. vmalloc()ing
a large enough area. However, rather than thinking of a generic
walking function as a solution, how about the simple one for the
immediate needs: Add MAP_SMALL_PAGES?

Also, as a general remark: When you disagree with review feedback, I
think it would be quite reasonable to wait with sending the next
version until the disagreement gets resolved, unless this is taking
unduly long delays.

Jan

