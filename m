Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFA223D9AA
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 13:09:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3dl6-0003Zi-1V; Thu, 06 Aug 2020 11:08:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dZxa=BQ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k3dl4-0003Zd-Eo
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 11:08:26 +0000
X-Inumbo-ID: 801f9e50-fc87-4094-a70f-c33bea81aa4d
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 801f9e50-fc87-4094-a70f-c33bea81aa4d;
 Thu, 06 Aug 2020 11:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RdG9A3SQ2LlYPQ4zlvqznH3SbKGcDOhgE31bU0J3MN8=; b=qOBrPPl9qh2QwAHG2Du+rwOTvf
 0svHiUJvE8W/o+LrRAqhjGLi0Kx2rsOfIPGYzha4o3jjTzRaejgSIFqXGOYwYOMJncO0iNoxaqzij
 V7KVaskdyB7Kw3b8VeNYf6qj04u8lvuH9Vv0geG7yaBFFDCXt1EjPJBD/GL38i99ODno=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k3dkt-0000JQ-8A; Thu, 06 Aug 2020 11:08:15 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k3dks-0001mV-QD; Thu, 06 Aug 2020 11:08:15 +0000
Subject: Re: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
To: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
 <11eaa2f0-84c7-5972-d14c-4cb02458e882@xen.org>
 <3ee50c66-8761-6c86-3fab-a4c23622d2b8@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e8b0cccf-76cd-1be8-be75-33ccd571195e@xen.org>
Date: Thu, 6 Aug 2020 12:08:12 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <3ee50c66-8761-6c86-3fab-a4c23622d2b8@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 05/08/2020 20:30, Oleksandr wrote:
> 
> On 05.08.20 17:12, Julien Grall wrote:
>> Hi,
> 
> Hi Julien
> 
> 
>>
>> On 03/08/2020 19:21, Oleksandr Tyshchenko wrote:
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> This patch makes possible to forward Guest MMIO accesses
>>> to a device emulator on Arm and enables that support for
>>> Arm64.
>>>
>>> Also update XSM code a bit to let DM op be used on Arm.
>>> New arch DM op will be introduced in the follow-up patch.
>>>
>>> Please note, at the moment build on Arm32 is broken
>>> (see cmpxchg usage in hvm_send_buffered_ioreq()) if someone
>>> wants to enable CONFIG_IOREQ_SERVER due to the lack of
>>> cmpxchg_64 support on Arm32.
>>>
>>> Please note, this is a split/cleanup of Julien's PoC:
>>> "Add support for Guest IO forwarding to a device emulator"
>>>
>>> Signed-off-by: Julien Grall <julien.grall@arm.com>
>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> ---
>>>   tools/libxc/xc_dom_arm.c        |  25 +++++++---
>>>   xen/arch/arm/Kconfig            |   1 +
>>>   xen/arch/arm/Makefile           |   2 +
>>>   xen/arch/arm/dm.c               |  34 +++++++++++++
>>>   xen/arch/arm/domain.c           |   9 ++++
>>>   xen/arch/arm/hvm.c              |  46 +++++++++++++++++-
>>>   xen/arch/arm/io.c               |  67 +++++++++++++++++++++++++-
>>>   xen/arch/arm/ioreq.c            |  86 
>>> +++++++++++++++++++++++++++++++++
>>>   xen/arch/arm/traps.c            |  17 +++++++
>>>   xen/common/memory.c             |   5 +-
>>>   xen/include/asm-arm/domain.h    |  80 +++++++++++++++++++++++++++++++
>>>   xen/include/asm-arm/hvm/ioreq.h | 103 
>>> ++++++++++++++++++++++++++++++++++++++++
>>>   xen/include/asm-arm/mmio.h      |   1 +
>>>   xen/include/asm-arm/p2m.h       |   7 +--
>>>   xen/include/xsm/dummy.h         |   4 +-
>>>   xen/include/xsm/xsm.h           |   6 +--
>>>   xen/xsm/dummy.c                 |   2 +-
>>>   xen/xsm/flask/hooks.c           |   5 +-
>>>   18 files changed, 476 insertions(+), 24 deletions(-)
>>>   create mode 100644 xen/arch/arm/dm.c
>>>   create mode 100644 xen/arch/arm/ioreq.c
>>>   create mode 100644 xen/include/asm-arm/hvm/ioreq.h
>>
>> It feels to me the patch is doing quite a few things that are 
>> indirectly related. Can this be split to make the review easier?
>>
>> I would like at least the following split from the series:
>>    - The tools changes
>>    - The P2M changes
>>    - The HVMOP plumbing (if we still require them)
> Sure, will split.
> However, I don't quite understand where we should leave HVMOP plumbing.

I think they will need to be droppped if we decide to use the acquire 
interface.

> If I understand correctly the suggestion was to switch to acquire 
> interface instead (which requires a Linux version to be v4.17 at least)?

This was the suggestion.

> I suspect, this is all about "xen/privcmd: add 
> IOCTL_PRIVCMD_MMAP_RESOURCE" support for Linux?

Correct.

>> What is this function supposed to do?
> Agree, sounds confusing a bit. I assume it is supposed to complete Guest 
> MMIO access after finishing emulation.
> 
> Shall I rename it to something appropriate (maybe by adding ioreq prefix)?

How about ioreq_handle_complete_mmio()?

>>> diff --git a/xen/common/memory.c b/xen/common/memory.c
>>> index 9283e5e..0000477 100644
>>> --- a/xen/common/memory.c
>>> +++ b/xen/common/memory.c
>>> @@ -8,6 +8,7 @@
>>>    */
>>>     #include <xen/domain_page.h>
>>> +#include <xen/hvm/ioreq.h>
>>>   #include <xen/types.h>
>>>   #include <xen/lib.h>
>>>   #include <xen/mm.h>
>>> @@ -30,10 +31,6 @@
>>>   #include <public/memory.h>
>>>   #include <xsm/xsm.h>
>>>   -#ifdef CONFIG_IOREQ_SERVER
>>> -#include <xen/hvm/ioreq.h>
>>> -#endif
>>> -
>>
>> Why do you remove something your just introduced?
> The reason I guarded that header is to make "xen/mm: Make x86's 
> XENMEM_resource_ioreq_server handling common" (previous) patch buildable 
> on Arm
> without arch IOREQ header added yet. I tried to make sure that the 
> result after each patch was buildable to retain bisectability.
> As current patch adds Arm IOREQ specific bits (including header), that 
> guard could be removed as not needed anymore.
I agree we want to have the build bisectable. However, I am still 
puzzled why it is necessary to remove the #ifdef and move it earlier in 
the list.

Do you mind to provide more details?

[...]

>>> +
>>> +bool handle_mmio(void);
>>> +
>>> +static inline bool handle_pio(uint16_t port, unsigned int size, int 
>>> dir)
>>> +{
>>> +    /* XXX */
>>
>> Can you expand this TODO? What do you expect to do?
> I didn't expect this to be called on Arm. Sorry, I am not sure l have an 
> idea how to handle this properly. I would keep it unimplemented until a 
> real reason.
> Will expand TODO.

Let see how the conversation on patch#1 goes about PIO vs MMIO.

>>
>>
>>> +    BUG();
>>> +    return true;
>>> +}
>>> +
>>> +static inline paddr_t hvm_mmio_first_byte(const ioreq_t *p)
>>> +{
>>> +    return p->addr;
>>> +}
>>
>> I understand that the x86 version is more complex as it check p->df. 
>> However, aside reducing the complexity, I am not sure why we would 
>> want to diverge it.
>>
>> After all, IOREQ is now meant to be a common feature.
> Well, no objections at all.
> Could you please clarify how could 'df' (Direction Flag?) be 
> handled/used on Arm?

On x86, this is used by 'rep' instruction to tell the direction to 
iterate (forward or backward).

On Arm, all the accesses to MMIO region will do a single memory access. 
So for now, we can safely always set to 0.

> I see that try_fwd_ioserv() always sets it 0. Or I 
> need to just reuse x86's helpers as is,
> which (together with count = df = 0) will result in what we actually 
> have here?
AFAIU, both count and df should be 0 on Arm.

>>
>>
>>> +
>>> +static inline int p2m_set_ioreq_server(struct domain *d,
>>> +                                       unsigned int flags,
>>> +                                       struct hvm_ioreq_server *s)
>>> +{
>>> +    return -EOPNOTSUPP;
>>> +}
>>
>> This should be defined in p2m.h. But I am not even sure what it is 
>> meant for. Can you expand it?
> 
> ok, will move.
> 
> 
> In this series I tried to make as much IOREQ code common as possible and 
> avoid complicating things, in order to achieve that a few stubs were 
> added here. Please note,
> that I also considered splitting into arch parts. But some functions 
> couldn't be split easily.
> This one is called from common hvm_destroy_ioreq_server() with flag 
> being 0 (which will result in unmapping ioreq server from p2m type on x86).
> I could add a comment describing why this stub is present here.

Sorry if I wasn't clear. I wasn't asking why the stub is there but what 
should be the expected implementation of the function.

In particular, you are returning -EOPNOTSUPP. The only reason you are 
getting away from trouble is because the caller doesn't check the return.

Would it make sense to have a stub arch_hvm_destroy_ioreq_server()?

> 
> 
>>
>>
>>> +
>>> +static inline void msix_write_completion(struct vcpu *v)
>>> +{
>>> +}
>>> +
>>> +static inline void handle_realmode_completion(void)
>>> +{
>>> +    ASSERT_UNREACHABLE();
>>> +}
>>
>> realmode is very x86 specific. So I don't think this function should 
>> be called from common code. It might be worth considering to split 
>> handle_hvm_io_completion() is 2 parts: common and arch specific.
> 
> I agree with you that realmode is x86 specific and looks not good in Arm 
> header. 
It is not a problem of looking good or not. Instead, it is about 
abstraction. A developper shouldn't need to understand all the other 
architectures we support in order to follow the common code.

> I was thinking how to split handle_hvm_io_completion() 
> gracefully but I failed find a good solution for that, so decided to add 
> two stubs (msix_write_completion and handle_realmode_completion) on Arm. 
> I could add a comment describing why they are here if appropriate. But 
> if you think they shouldn't be called from the common code in any way, I 
> will try to split it.

I am not entirely sure what msix_write_completion is meant to do on x86. 
Is it dealing with virtual MSIx? Maybe Jan, Roger or Paul could help?

Regarding handle_realmode_completion, I would add a new stub:

arch_ioreq_handle_io_completion() that is called from the default case 
of the switch.

On x86 it would be implemented as:

  switch (io_completion)
  {
     case HVMIO_realmode_completion:
       ...
     default:
       ASSERT_UNREACHABLE();
  }

On Arm, it would be implemented as:

   ASSERT_UNREACHABLE();

Cheers,

-- 
Julien Grall

