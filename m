Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDAC4A6E77
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 11:14:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264019.456958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFCdf-0006g1-3Y; Wed, 02 Feb 2022 10:13:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264019.456958; Wed, 02 Feb 2022 10:13:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFCde-0006eB-Ve; Wed, 02 Feb 2022 10:13:22 +0000
Received: by outflank-mailman (input) for mailman id 264019;
 Wed, 02 Feb 2022 10:13:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nFCdd-0006e5-Nr
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 10:13:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nFCdb-000781-9A; Wed, 02 Feb 2022 10:13:19 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[192.168.2.82])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nFCdb-0002FG-2g; Wed, 02 Feb 2022 10:13:19 +0000
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
	bh=cshVmSzzWOb2/21edFaniUMC9KZ8CQPR9wf0pIRG724=; b=aLIdqjw+tWNYMQt2BLzsMItnZW
	fngloMDgQ/Ym7LW/o59o4Ee/tibRTxM5/7wqtCTgCOvDLF0Cfh4nwT1bup0p9KWCAdO+f8LbLW4sP
	kWTaXV51ylAjT1OAC/uB2x6lcyb1nY9h1E+eEzUmrB5p+mUYbC6icV58wDYofeprAbwc=;
Message-ID: <dbee8f31-d520-b60c-2773-876239e1f9c1@xen.org>
Date: Wed, 2 Feb 2022 10:13:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v3] xen/pci: detect when BARs are not suitably positioned
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>
References: <20220201124551.2392-1-roger.pau@citrix.com>
 <59685ca1-0587-a975-bf5b-56058b650c3a@suse.com>
 <64474de4-d9c2-ef16-e0d1-b59d5967ee20@xen.org>
 <1252be7b-2b32-db39-7c90-c56d96b5a17c@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1252be7b-2b32-db39-7c90-c56d96b5a17c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 02/02/2022 10:05, Jan Beulich wrote:
> On 02.02.2022 10:57, Julien Grall wrote:
>> On 02/02/2022 09:42, Jan Beulich wrote:
>>> On 01.02.2022 13:45, Roger Pau Monne wrote:
>>>> --- a/xen/arch/x86/mm.c
>>>> +++ b/xen/arch/x86/mm.c
>>>> @@ -783,6 +783,23 @@ bool is_iomem_page(mfn_t mfn)
>>>>        return (page_get_owner(page) == dom_io);
>>>>    }
>>>>    
>>>> +bool is_memory_hole(unsigned long start, unsigned long end)
>>>> +{
>>>> +    unsigned int i;
>>>> +
>>>> +    for ( i = 0; i < e820.nr_map; i++ )
>>>> +    {
>>>> +        const struct e820entry *entry = &e820.map[i];
>>>> +
>>>> +        /* Do not allow overlaps with any memory range. */
>>>> +        if ( start < PFN_DOWN(entry->addr + entry->size) &&
>>>> +             PFN_DOWN(entry->addr) <= end )
>>>> +            return false;
>>>> +    }
>>>> +
>>>> +    return true;
>>>> +}
>>>
>>> Doesn't the left side of the && need to use PFN_UP()?
>>>
>>> I also think it would help if a brief comment ahead of the
>>> function said that the range is inclusive. Otherwise the use
>>> of < and >= gives the impression of something being wrong.
>>> Then again it may be better to switch to <= anyway, as I
>>> think you want to avoid possible zero-size regions (at which
>>> point subtracting 1 for using <= is going to be valid).
>>>
>>> Finally I wonder whether the function parameters wouldn't
>>> better be named e.g. spfn and epfn, but maybe their units can
>>> be inferred from their types being unsigned long (which,
>>> however, would build on the assumption that we use appropriate
>>> types everywhere).
>>
>> I think this a case where mfn_t would be useful to use.
> 
> Actually I did consider to suggest it when asking to convert
> to frame numbers, and specifically didn't because its use will
> clutter the code here quite a bit. Which isn't to mean I'd
> object if the adjustment was made ...
I thought about code cluterring, but there are two use
of the variables. So it would not look too bad.

But I care more about the external interface to be typesafe. So an 
alternative would be:

unsigned long smfn_ = mfn_x();
unsigned long emfn_ = mfn_x();

Cheers,

-- 
Julien Grall

