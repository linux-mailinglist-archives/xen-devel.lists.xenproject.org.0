Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF864C6630
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 10:55:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280278.478160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOckJ-0008Si-Ko; Mon, 28 Feb 2022 09:55:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280278.478160; Mon, 28 Feb 2022 09:55:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOckJ-0008PF-HE; Mon, 28 Feb 2022 09:55:11 +0000
Received: by outflank-mailman (input) for mailman id 280278;
 Mon, 28 Feb 2022 09:55:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nOckH-0008P9-Tl
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 09:55:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOckC-00022b-8N; Mon, 28 Feb 2022 09:55:04 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOckC-0003Bs-0G; Mon, 28 Feb 2022 09:55:04 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=pvokMa2ciW4n5JHoqWln4eK7lybZsRW703YLyb2rvDE=; b=LfqXqUGOmq9mSjed6ZDKohQThW
	NDcxrPvpdWKXpRzwPsQAcHjDKgHr+fsp3C8+9bVvAkzzMpp+LXRRJ0Tg7MdRv7VodolIxyZ8rIul/
	eHfTgTW5yOsEZdjdbYI1V8ISQ1qdGEU5U65nAB5CAFzTf62QPJ3xjiGSmS+QvFsOoJDQ=;
Message-ID: <ecb68523-1881-214a-b1e4-b239fed6ddce@xen.org>
Date: Mon, 28 Feb 2022 09:55:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Hongyan Xia <hongyxia@amazon.com>,
 Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-15-julien@xen.org>
 <fea3b34c-d605-be27-f75e-722b39cc48e3@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 14/19] xen/arm: add Persistent Map (PMAP)
 infrastructure
In-Reply-To: <fea3b34c-d605-be27-f75e-722b39cc48e3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 22/02/2022 15:22, Jan Beulich wrote:
> On 21.02.2022 11:22, Julien Grall wrote:
>> --- a/xen/common/Makefile
>> +++ b/xen/common/Makefile
>> @@ -28,6 +28,7 @@ obj-y += multicall.o
>>   obj-y += notifier.o
>>   obj-y += page_alloc.o
>>   obj-$(CONFIG_HAS_PDX) += pdx.o
>> +obj-bin-$(CONFIG_HAS_PMAP) += pmap.init.o
>>   obj-$(CONFIG_PERF_COUNTERS) += perfc.o
>>   obj-y += preempt.o
>>   obj-y += random.o
> 
> Nit: Please move the insertion one line further down.

Doh. I have moved the insertion.

> 
>> --- /dev/null
>> +++ b/xen/common/pmap.c
>> @@ -0,0 +1,79 @@
>> +#include <xen/bitops.h>
>> +#include <xen/init.h>
>> +#include <xen/pmap.h>
>> +
>> +#include <asm/pmap.h>
>> +#include <asm/fixmap.h>
>> +
>> +/*
>> + * Simple mapping infrastructure to map / unmap pages in fixed map.
>> + * This is used to set up the page table for mapcache, which is used
>> + * by map domain page infrastructure.
> 
> Is this comment stale from its original x86 purpose?
Yes. I should reword to:

"This is used to set the page table before the map domain page 
infrastructure is initialized".

> 
>> + * This structure is not protected by any locks, so it must not be used after
>> + * smp bring-up.
>> + */
>> +
>> +/* Bitmap to track which slot is used */
>> +static unsigned long __initdata inuse;
> 
> I guess this wants to use DECLARE_BITMAP(), for ...
> 
>> +void *__init pmap_map(mfn_t mfn)
>> +{
>> +    unsigned long flags;
>> +    unsigned int idx;
>> +    unsigned int slot;
>> +
>> +    BUILD_BUG_ON(sizeof(inuse) * BITS_PER_BYTE < NUM_FIX_PMAP);
>> +
>> +    ASSERT(system_state < SYS_STATE_smp_boot);
>> +
>> +    local_irq_save(flags);
>> +
>> +    idx = find_first_zero_bit(&inuse, NUM_FIX_PMAP);
> 
> ... this to be correct irrespective of how large NUM_FIX_PMAP is?
> I think that's preferable over the BUILD_BUG_ON().

I agree. I will have a look to use DECLARE_BITMAP().

> 
>> +    if ( idx == NUM_FIX_PMAP )
>> +        panic("Out of PMAP slots\n");
>> +
>> +    __set_bit(idx, &inuse);
>> +
>> +    slot = idx + FIXMAP_PMAP_BEGIN;
>> +    ASSERT(slot >= FIXMAP_PMAP_BEGIN && slot <= FIXMAP_PMAP_END);
>> +
>> +    /*
>> +     * We cannot use set_fixmap() here. We use PMAP when there is no direct map,
>> +     * so map_pages_to_xen() called by set_fixmap() needs to map pages on
>> +     * demand, which then calls pmap() again, resulting in a loop. Modify the
>> +     * PTEs directly instead. The same is true for pmap_unmap().
>> +     */
>> +    arch_pmap_map(slot, mfn);
> 
> I'm less certain here, but like above I'm under the impression
> that this comment may no longer be accurate.

This comment is still accurate for Arm. I also expect it to be accurate 
for all architectures because set_fixmap() is likely going to be 
implemented with generic PT helpers.

So I think it makes sense to keep it in common code. This explains why 
we are calling arch_pmap_map() rather than set_fixmap() directly.

> 
>> +    local_irq_restore(flags);
> 
> What is this IRQ save/restore intended to protect against, when
> use of this function is limited to pre-SMP boot anyway?

Hmmm... This patch has been through various revision before me. I went 
through the archives and couldn't tell why local_irq_restore() was added.

Looking at the code, none of the Xen page-table helpers expect to be 
called from interrupt context. So I am thinking to replace with an 
ASSERT/BUG_ON !in_irq().

Cheers,

-- 
Julien Grall

