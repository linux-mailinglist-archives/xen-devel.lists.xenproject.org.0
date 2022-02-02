Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7894A6E43
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 10:57:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263963.456867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFCOW-0001NW-Tq; Wed, 02 Feb 2022 09:57:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263963.456867; Wed, 02 Feb 2022 09:57:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFCOW-0001KD-PE; Wed, 02 Feb 2022 09:57:44 +0000
Received: by outflank-mailman (input) for mailman id 263963;
 Wed, 02 Feb 2022 09:57:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nFCOV-0001K3-4o
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 09:57:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nFCOS-0006iv-Ax; Wed, 02 Feb 2022 09:57:40 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225] helo=[192.168.2.82])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nFCOS-0000qO-54; Wed, 02 Feb 2022 09:57:40 +0000
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
	bh=Oey0PCOI8QHWUaQwcTboAGM4woj2EYAoAcKXQ1jtsRI=; b=Lk9tRbPVurL5jW6bwgvSvn94Oe
	NTZn3zNSFzaSyWU972+y9L0HgiPSfQgRzZZYZTI+A9SNdD2LPhZZyixEAVG1bo63RD/TJd7bR0aze
	QAjo6dWvk6103BoCcmT+cgDrKwuJe/6BiQ0mcOoeARavB6weQB003wexsUoG2948EPDs=;
Message-ID: <64474de4-d9c2-ef16-e0d1-b59d5967ee20@xen.org>
Date: Wed, 2 Feb 2022 09:57:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v3] xen/pci: detect when BARs are not suitably positioned
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220201124551.2392-1-roger.pau@citrix.com>
 <59685ca1-0587-a975-bf5b-56058b650c3a@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <59685ca1-0587-a975-bf5b-56058b650c3a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/02/2022 09:42, Jan Beulich wrote:
> On 01.02.2022 13:45, Roger Pau Monne wrote:
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -783,6 +783,23 @@ bool is_iomem_page(mfn_t mfn)
>>       return (page_get_owner(page) == dom_io);
>>   }
>>   
>> +bool is_memory_hole(unsigned long start, unsigned long end)
>> +{
>> +    unsigned int i;
>> +
>> +    for ( i = 0; i < e820.nr_map; i++ )
>> +    {
>> +        const struct e820entry *entry = &e820.map[i];
>> +
>> +        /* Do not allow overlaps with any memory range. */
>> +        if ( start < PFN_DOWN(entry->addr + entry->size) &&
>> +             PFN_DOWN(entry->addr) <= end )
>> +            return false;
>> +    }
>> +
>> +    return true;
>> +}
> 
> Doesn't the left side of the && need to use PFN_UP()?
> 
> I also think it would help if a brief comment ahead of the
> function said that the range is inclusive. Otherwise the use
> of < and >= gives the impression of something being wrong.
> Then again it may be better to switch to <= anyway, as I
> think you want to avoid possible zero-size regions (at which
> point subtracting 1 for using <= is going to be valid).
> 
> Finally I wonder whether the function parameters wouldn't
> better be named e.g. spfn and epfn, but maybe their units can
> be inferred from their types being unsigned long (which,
> however, would build on the assumption that we use appropriate
> types everywhere).

I think this a case where mfn_t would be useful to use.

> 
>> --- a/xen/include/xen/mm.h
>> +++ b/xen/include/xen/mm.h
>> @@ -554,6 +554,8 @@ int __must_check steal_page(struct domain *d, struct page_info *page,
>>   int page_is_ram_type(unsigned long mfn, unsigned long mem_type);
>>   /* Returns the page type(s). */
>>   unsigned int page_get_ram_type(mfn_t mfn);
>> +/* Check if a range falls into a hole in the memory map. */
>> +bool is_memory_hole(paddr_t start, uint64_t size);
> 
> While resolving to the same type, these now also want to be
> "unsigned long".
> 
> Jan
> 

Cheers,

-- 
Julien Grall

