Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7491A0FFA
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 17:14:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLpw3-0004n2-2e; Tue, 07 Apr 2020 15:14:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=71dA=5X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jLpw1-0004mx-MW
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 15:14:41 +0000
X-Inumbo-ID: 80bd6268-78e2-11ea-80ea-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 80bd6268-78e2-11ea-80ea-12813bfff9fa;
 Tue, 07 Apr 2020 15:14:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 54013AC77;
 Tue,  7 Apr 2020 15:14:39 +0000 (UTC)
Subject: Re: [PATCH 3/5] x86_64/mm: map and unmap page tables in
 share_hotadd_m2p_table
To: Hongyan Xia <hx242@xen.org>
References: <cover.1584955616.git.hongyxia@amazon.com>
 <2fa83ef5818805c179757caac99ccf7ab4f7ba3a.1584955616.git.hongyxia@amazon.com>
 <f1537005-cac8-cd74-e19c-043219ccab56@suse.com>
 <7a5e9095c1c927819d248d5227d2511676781855.camel@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0d0fb4e9-c27e-a8b2-8fc7-602bc535b655@suse.com>
Date: Tue, 7 Apr 2020 17:14:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <7a5e9095c1c927819d248d5227d2511676781855.camel@xen.org>
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.04.2020 17:11, Hongyan Xia wrote:
> On Wed, 2020-04-01 at 14:29 +0200, Jan Beulich wrote:
>> On 23.03.2020 10:41, Hongyan Xia wrote:
>>> --- a/xen/include/asm-x86/page.h
>>> +++ b/xen/include/asm-x86/page.h
>>> @@ -196,6 +196,24 @@ static inline l4_pgentry_t
>>> l4e_from_paddr(paddr_t pa, unsigned int flags)
>>>  #define map_l2t_from_l3e(x)        (l2_pgentry_t
>>> *)map_domain_page(l3e_get_mfn(x))
>>>  #define map_l3t_from_l4e(x)        (l3_pgentry_t
>>> *)map_domain_page(l4e_get_mfn(x))
>>>  
>>> +#define l1e_from_l2e(l2e, off) ({                   \
>>> +        l1_pgentry_t *l1t = map_l1t_from_l2e(l2e);  \
>>> +        l1_pgentry_t l1e = l1t[off];                \
>>> +        UNMAP_DOMAIN_PAGE(l1t);                     \
>>> +        l1e; })
>>> +
>>> +#define l2e_from_l3e(l3e, off) ({                   \
>>> +        l2_pgentry_t *l2t = map_l2t_from_l3e(l3e);  \
>>> +        l2_pgentry_t l2e = l2t[off];                \
>>> +        UNMAP_DOMAIN_PAGE(l2t);                     \
>>> +        l2e; })
>>> +
>>> +#define l3e_from_l4e(l4e, off) ({                   \
>>> +        l3_pgentry_t *l3t = map_l3t_from_l4e(l4e);  \
>>> +        l3_pgentry_t l3e = l3t[off];                \
>>> +        UNMAP_DOMAIN_PAGE(l3t);                     \
>>> +        l3e; })
>>
>> There's a reason these are macros rather than inline functions,
>> I assume? (This reason would be nice to be stated in the
>> description.)
> 
> Actually no specific reasons, just to keep them as macros to be
> consistent with other helpers above. Fairly trivial to convert them
> into inline functions if this is desired.

Where possible this would be the preferred route for new helpers.

>> I don't see why you use UNMAP_DOMAIN_PAGE() rather than
>> unmap_domain_page() here - the variables in question go out of
>> scope right afterwards, so the storing of NULL into them is
>> pointless (and very likely to be eliminated by the compiler
>> anyway).
> 
> My intention is to just avoid using the lower case one altogether, so
> that one day when we need to expand any function or macros we do not
> need to look back at the code and worry about whether any lower case
> ones need to be converted to upper case (sometimes for large functions
> this may not be trivial), and the compiler can deal with the extra
> nullification anyway.

I don't agree with this goal; perhaps others on Cc have an opinion?

Jan

