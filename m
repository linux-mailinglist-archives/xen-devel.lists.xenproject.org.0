Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B053022F921
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 21:34:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k08so-0003MD-2X; Mon, 27 Jul 2020 19:33:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfpx=BG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k08sn-0003M8-7Z
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 19:33:57 +0000
X-Inumbo-ID: 1bb7905f-d040-11ea-8aee-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1bb7905f-d040-11ea-8aee-bc764e2007e4;
 Mon, 27 Jul 2020 19:33:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 138D7AD43;
 Mon, 27 Jul 2020 19:34:06 +0000 (UTC)
Subject: Re: [PATCH v7 09/15] efi: use new page table APIs in copy_mapping
To: Hongyan Xia <hx242@xen.org>
References: <cover.1590750232.git.hongyxia@amazon.com>
 <0259b645c81ecc3879240e30760b0e7641a2b602.1590750232.git.hongyxia@amazon.com>
 <bfe28c9c-af4e-96c2-9e6c-354a5bf626d8@suse.com>
 <0c421dee1729295eb8504ee81abbc8e57f220b12.camel@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <176a8e78-9924-e5af-df2a-1e2eaae681c5@suse.com>
Date: Mon, 27 Jul 2020 21:33:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0c421dee1729295eb8504ee81abbc8e57f220b12.camel@xen.org>
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
Cc: xen-devel@lists.xenproject.org, julien@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.07.2020 14:45, Hongyan Xia wrote:
> On Tue, 2020-07-14 at 14:42 +0200, Jan Beulich wrote:
>> On 29.05.2020 13:11, Hongyan Xia wrote:
>>> @@ -1442,29 +1443,42 @@ static __init void copy_mapping(unsigned
>>> long mfn, unsigned long end,
>>>                                                    unsigned long
>>> emfn))
>>>   {
>>>       unsigned long next;
>>> +    l3_pgentry_t *l3src = NULL, *l3dst = NULL;
>>>   
>>>       for ( ; mfn < end; mfn = next )
>>>       {
>>>           l4_pgentry_t l4e = efi_l4_pgtable[l4_table_offset(mfn <<
>>> PAGE_SHIFT)];
>>> -        l3_pgentry_t *l3src, *l3dst;
>>>           unsigned long va = (unsigned long)mfn_to_virt(mfn);
>>>   
>>> +        if ( !((mfn << PAGE_SHIFT) & ((1UL << L4_PAGETABLE_SHIFT)
>>> - 1)) )
>>
>> To be in line with ...
>>
>>> +        {
>>> +            UNMAP_DOMAIN_PAGE(l3src);
>>> +            UNMAP_DOMAIN_PAGE(l3dst);
>>> +        }
>>>           next = mfn + (1UL << (L3_PAGETABLE_SHIFT - PAGE_SHIFT));
>>
>> ... this, please avoid the left shift of mfn in the if(). Judgingfrom
> 
> What do you mean by "in line" here? It does not look to me that "next
> =" can be easily squashed into the if() condition.

I'm not thinking about squashing anything into an if(). I've talked
about avoiding the left shift of mfn, as this last quoted line does
(by instead subtracting PAGE_SHIFT from the left-shift count.

Jan

Jan

