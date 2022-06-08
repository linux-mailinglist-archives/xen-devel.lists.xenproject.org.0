Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 288F4542C6C
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jun 2022 12:02:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343765.569266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nysVO-0005PZ-BX; Wed, 08 Jun 2022 10:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343765.569266; Wed, 08 Jun 2022 10:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nysVO-0005N5-8W; Wed, 08 Jun 2022 10:01:38 +0000
Received: by outflank-mailman (input) for mailman id 343765;
 Wed, 08 Jun 2022 10:01:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nysVN-0005Mw-Bb
 for xen-devel@lists.xenproject.org; Wed, 08 Jun 2022 10:01:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nysVM-00021A-9B; Wed, 08 Jun 2022 10:01:36 +0000
Received: from [54.239.6.189] (helo=[192.168.10.106])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nysVL-0000Gq-UZ; Wed, 08 Jun 2022 10:01:36 +0000
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
	bh=p0wvtAVS4QIIRYpjqkGJh7255/WfzqDwRwO7WO5ZFxs=; b=c2+wrRMO5B3JA1Xsy+2s7b/Zgy
	4Adgcr0AbtvTSifHOMbGO7kSaukSsuI4wXhGCidH6mjwBYpj14hJ3VuSl/8bbDLrxtoASspLIQ6Ma
	sIri0NdS5+BEhXUmOC64fBJzAzZMC2GXfl0ImIY82vTKRJ6eFRMSY4QFATc5ei34ZtAQ=;
Message-ID: <dec50384-5172-67b6-f4ac-a9c40d80a641@xen.org>
Date: Wed, 8 Jun 2022 11:01:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH 10/16] xen/arm: add Persistent Map (PMAP) infrastructure
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Hongyan Xia <hongyxia@amazon.com>,
 Julien Grall <jgrall@amazon.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220520120937.28925-1-julien@xen.org>
 <20220520120937.28925-11-julien@xen.org>
 <alpine.DEB.2.22.394.2206071806390.21215@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2206071806390.21215@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 08/06/2022 02:08, Stefano Stabellini wrote:
>> diff --git a/xen/arch/arm/include/asm/pmap.h b/xen/arch/arm/include/asm/pmap.h
>> new file mode 100644
>> index 000000000000..74398b4c4fe6
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/pmap.h
>> @@ -0,0 +1,32 @@
>> +#ifndef __ASM_PMAP_H__
>> +#define __ASM_PMAP_H__
>> +
>> +#include <xen/mm.h>
>> +
>> +#include <asm/fixmap.h>
>> +
>> +static inline void arch_pmap_map(unsigned int slot, mfn_t mfn)
>> +{
>> +    lpae_t *entry = &xen_fixmap[slot];
>> +    lpae_t pte;
>> +
>> +    ASSERT(!lpae_is_valid(*entry));
>> +
>> +    pte = mfn_to_xen_entry(mfn, PAGE_HYPERVISOR_RW);
>> +    pte.pt.table = 1;
>> +    write_pte(entry, pte);
> 
> Here we don't need a tlb flush because we never go from a valid mapping
> to another valid mapping.

A TLB flush would not be sufficient here. You would need to follow the 
break-before-make sequence in order to replace a valid mapping with 
another valid mapping.

> We also go through arch_pmap_unmap which
> clears the mapping and also flushes the tlb. Is that right?

The PMAP code is using a bitmap to know which entry is used. So when 
arch_pmap_map() is called, we also guarantees the entry will be invalid 
(hence the ASSERT(!lpae_is_valid()).

The bit in the bitmap will only be cleared by pmap_unmap() which will 
result to a TLB flush.

>> +}
>> +
>> +static inline void arch_pmap_unmap(unsigned int slot)
>> +{
>> +    lpae_t pte = {};
>> +
>> +    write_pte(&xen_fixmap[slot], pte);
>> +
>> +    flush_xen_tlb_range_va_local(FIXMAP_ADDR(slot), PAGE_SIZE);
>> +}
>> +
>> +void arch_pmap_map_slot(unsigned int slot, mfn_t mfn);
>> +void arch_pmap_clear_slot(void *ptr);
> 
> What are these two? They are not defined anywhere?

It is left-over. I will drop them.

Cheers,

-- 
Julien Grall

