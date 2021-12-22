Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE0B47CF89
	for <lists+xen-devel@lfdr.de>; Wed, 22 Dec 2021 10:49:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250714.431781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzyFI-00076L-GT; Wed, 22 Dec 2021 09:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250714.431781; Wed, 22 Dec 2021 09:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzyFI-00073t-Cw; Wed, 22 Dec 2021 09:49:16 +0000
Received: by outflank-mailman (input) for mailman id 250714;
 Wed, 22 Dec 2021 09:49:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mzyFH-00073m-3z
 for xen-devel@lists.xenproject.org; Wed, 22 Dec 2021 09:49:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mzyFA-0000tP-QW; Wed, 22 Dec 2021 09:49:08 +0000
Received: from [54.239.6.186] (helo=[192.168.17.226])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mzyFA-0001Ye-Hw; Wed, 22 Dec 2021 09:49:08 +0000
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
	bh=dECnLebPo+b75urTmQ4wHCiwGrd1R7+aYWKSWKKCxDU=; b=Q+4HMrRzNCbPW4qpEmTgusg5WA
	wmP1ZiiTkx+1EmlWT00TsZcfOq3+yGBPxyVI3E78FKRcFSEfo7C40joiGcpoYbESYN/qAH1XnOrt4
	7XDj580T0bKGp0iylVxPVLkcy14MB43EibUnzEUk4d4se6lmtg8U4DUt2m3q+ZuIywQU=;
Message-ID: <fbe522a6-297f-4e5e-5081-f7e7e277155b@xen.org>
Date: Wed, 22 Dec 2021 10:49:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH V4] xen/gnttab: Store frame GFN in struct page_info on Arm
To: Oleksandr <olekstysh@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <1638563610-4419-1-git-send-email-olekstysh@gmail.com>
 <ebfaf88c-38a8-638c-298e-a92e5827baf1@suse.com>
 <6f4813ce-5d23-2192-fabc-e933241cf30e@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6f4813ce-5d23-2192-fabc-e933241cf30e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oleksandr,

On 14/12/2021 17:26, Oleksandr wrote:
>>> @@ -1487,7 +1489,23 @@ int xenmem_add_to_physmap_one(
>>>       }
>>>       /* Map at new location. */
>>> -    rc = guest_physmap_add_entry(d, gfn, mfn, 0, t);
>>> +    if ( !p2m_is_ram(t) || !is_xen_heap_mfn(mfn) )
>>> +        rc = guest_physmap_add_entry(d, gfn, mfn, 0, t);
>>> +    else
>>> +    {
>>> +        struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>> +
>>> +        p2m_write_lock(p2m);
>>> +        if ( gfn_eq(page_get_xenheap_gfn(mfn_to_page(mfn)), 
>>> INVALID_GFN) )
>>> +        {
>>> +            rc = p2m_set_entry(p2m, gfn, 1, mfn, t, 
>>> p2m->default_access);
>>> +            if ( !rc )
>>> +                page_set_xenheap_gfn(mfn_to_page(mfn), gfn);
>>> +        }
>>> +        else
>>> +            rc = -EBUSY;
>> May I suggest to avoid failing here when 
>> page_get_xenheap_gfn(mfn_to_page(mfn))
>> matches the passed in GFN?
> 
> 
> Good question...
> There was an explicit request to fail here if page_get_xenheap_gfn() 
> returns a valid GFN.
>  From the other side, if old GFN matches new GFN we do not remove the 
> mapping in gnttab_set_frame_gfn(),
> so probably we could avoid failing here in that particular case. 
> @Julien, what do you think?

I will answer by a question :). Can this situation happen in normal 
circumstances (e.g. there is no concurrent call)?

The recent XSAs in the grant table code made me more cautious and I 
would prefer if we fail more often than risking potentially introducing 
yet another security issue. It is easy to relax afterwards if there are 
legitimate use cases.

Cheers,

-- 
Julien Grall

