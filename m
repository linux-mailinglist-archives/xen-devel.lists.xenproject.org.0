Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B391A9304
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 08:15:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jObJ6-0003Dt-Fm; Wed, 15 Apr 2020 06:13:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoJL=57=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jObJ4-0003Do-Hw
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 06:13:54 +0000
X-Inumbo-ID: 46fcf879-7ee0-11ea-8a06-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 46fcf879-7ee0-11ea-8a06-12813bfff9fa;
 Wed, 15 Apr 2020 06:13:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 60361AC6D;
 Wed, 15 Apr 2020 06:13:50 +0000 (UTC)
Subject: Re: [PATCH v2 1/5] x86/shim: map and unmap page tables in
 replace_va_mapping
To: Hongyan Xia <hx242@xen.org>
References: <cover.1586352238.git.hongyxia@amazon.com>
 <7638095024ec3379a8d9ddadfe47e36da168e4dd.1586352238.git.hongyxia@amazon.com>
 <ddbad9f5-307e-7b1d-0cc7-cd7ed684f680@suse.com>
 <aacb942aa6febd13211ca799a6456adf510cee89.camel@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <28057880-89fa-0567-0fff-3ee7d8ba0550@suse.com>
Date: Wed, 15 Apr 2020 08:13:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <aacb942aa6febd13211ca799a6456adf510cee89.camel@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.04.2020 18:53, Hongyan Xia wrote:
> On Thu, 2020-04-09 at 11:42 +0200, Jan Beulich wrote:
>> On 08.04.2020 15:36, Hongyan Xia wrote:
>>> --- a/xen/arch/x86/pv/shim.c
>>> +++ b/xen/arch/x86/pv/shim.c
>>> @@ -168,16 +168,17 @@ const struct platform_bad_page *__init
>>> pv_shim_reserved_pages(unsigned int *size
>>>  static void __init replace_va_mapping(struct domain *d,
>>> l4_pgentry_t *l4start,
>>>                                        unsigned long va, mfn_t mfn)
>>>  {
>>> -    l4_pgentry_t *pl4e = l4start + l4_table_offset(va);
>>> -    l3_pgentry_t *pl3e = l4e_to_l3e(*pl4e) + l3_table_offset(va);
>>> -    l2_pgentry_t *pl2e = l3e_to_l2e(*pl3e) + l2_table_offset(va);
>>> -    l1_pgentry_t *pl1e = l2e_to_l1e(*pl2e) + l1_table_offset(va);
>>> +    l4_pgentry_t l4e = l4start[l4_table_offset(va)];
>>> +    l3_pgentry_t l3e = l3e_from_l4e(l4e, l3_table_offset(va));
>>> +    l2_pgentry_t l2e = l2e_from_l3e(l3e, l2_table_offset(va));
>>> +    l1_pgentry_t *pl1e = map_l1t_from_l2e(l2e) +
>>> l1_table_offset(va);
>>>      struct page_info *page = mfn_to_page(l1e_get_mfn(*pl1e));
>>>  
>>>      put_page_and_type(page);
>>>  
>>>      *pl1e = l1e_from_mfn(mfn, (!is_pv_32bit_domain(d) ? L1_PROT
>>>                                                        :
>>> COMPAT_L1_PROT));
>>> +    UNMAP_DOMAIN_PAGE(pl1e);
>>>  }
>>
>> As said before, here and below I think it should be
>> unmap_domain_page().
>>
>>> --- a/xen/include/asm-x86/page.h
>>> +++ b/xen/include/asm-x86/page.h
>>> @@ -196,6 +196,19 @@ static inline l4_pgentry_t
>>> l4e_from_paddr(paddr_t pa, unsigned int flags)
>>>  #define map_l2t_from_l3e(x)        (l2_pgentry_t
>>> *)map_domain_page(l3e_get_mfn(x))
>>>  #define map_l3t_from_l4e(x)        (l3_pgentry_t
>>> *)map_domain_page(l4e_get_mfn(x))
>>>  
>>> +/* Unlike lYe_to_lXe(), lXe_from_lYe() do not rely on the direct
>>> map. */
>>> +#define l2e_from_l3e(l3e, offset) ({                        \
>>> +        const l2_pgentry_t *l2t = map_l2t_from_l3e(l3e);    \
>>> +        l2_pgentry_t l2e = l2t[offset];                     \
>>> +        UNMAP_DOMAIN_PAGE(l2t);                             \
>>> +        l2e; })
>>> +
>>> +#define l3e_from_l4e(l4e, offset) ({                        \
>>> +        const l3_pgentry_t *l3t = map_l3t_from_l4e(l4e);    \
>>> +        l3_pgentry_t l3e = l3t[offset];                     \
>>> +        UNMAP_DOMAIN_PAGE(l3t);                             \
>>> +        l3e; })
>>
>> I think l1e_from_l2e() should be introduced at the same time, even
>> if for now it's unused. I also think, like we do elsewhere, that
>> macro-local variables would better have _ suffixes, to avoid
>> possible variable aliasing issues.
> 
> Shall I address the comments and send a new rev now, or is this small
> series still being reviewed?

I didn't get to look at patches 2 thru 5 yet, if this (partly)
answers the question.

Jan

