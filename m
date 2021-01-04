Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C61C22E9AEE
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 17:22:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61347.107867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwSbs-0003Vx-0p; Mon, 04 Jan 2021 16:21:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61347.107867; Mon, 04 Jan 2021 16:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwSbr-0003VY-Tk; Mon, 04 Jan 2021 16:21:31 +0000
Received: by outflank-mailman (input) for mailman id 61347;
 Mon, 04 Jan 2021 16:21:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwSbq-0003VT-3a
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 16:21:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 90bd5d64-86c3-4731-856b-da9c55d80db1;
 Mon, 04 Jan 2021 16:21:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3E12DACAF;
 Mon,  4 Jan 2021 16:21:28 +0000 (UTC)
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
X-Inumbo-ID: 90bd5d64-86c3-4731-856b-da9c55d80db1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609777288; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p1pLx0U4Z0Bz0f2F1Y97H5KDUZFJoN8PxhDiyAZyrn0=;
	b=fgrXSonannw7ArpWlkPkRBnQrx8DS4m+uCOZs8o7hNL+urqYvCRyywJeRnD0dq1G76q299
	HrfgeaJIUfOVWNjuMP676Dq94Me5kZMDO0HGxvJzSj5JY9ClJu8lhWzTF+qU5FIE4D8zpp
	R9r3urc0ctOlSxDqbRUTI/aJDf8RCHg=
Subject: Re: [PATCH] x86/vm_event: transfer nested p2m base info
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20210103184117.57692-1-tamas@tklengyel.com>
 <6a1d7087-5ae2-6a70-bee5-fdf521310d3d@citrix.com>
 <CABfawhmBM7nFCVm_61xJ9u5VpKaeGKoBm2i56NiqMMMoG2bVmQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <43da1c6d-3c33-59dc-a235-383192c8062b@suse.com>
Date: Mon, 4 Jan 2021 17:21:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CABfawhmBM7nFCVm_61xJ9u5VpKaeGKoBm2i56NiqMMMoG2bVmQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04.01.2021 14:28, Tamas K Lengyel wrote:
> On Mon, Jan 4, 2021 at 6:57 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> On 03/01/2021 18:41, Tamas K Lengyel wrote:
>>> Required to introspect events originating from nested VMs.
>>>
>>> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
>>> ---
>>>  xen/arch/x86/hvm/monitor.c    | 32 ++++++++++++++++++++++++++++++--
>>>  xen/include/public/vm_event.h |  7 ++++++-
>>>  2 files changed, 36 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
>>> index e4a09964a0..eb4afe81b3 100644
>>> --- a/xen/arch/x86/hvm/monitor.c
>>> +++ b/xen/arch/x86/hvm/monitor.c
>>> @@ -26,6 +26,7 @@
>>>  #include <xen/mem_access.h>
>>>  #include <xen/monitor.h>
>>>  #include <asm/hvm/monitor.h>
>>> +#include <asm/hvm/nestedhvm.h>
>>>  #include <asm/altp2m.h>
>>>  #include <asm/monitor.h>
>>>  #include <asm/p2m.h>
>>> @@ -33,6 +34,15 @@
>>>  #include <asm/vm_event.h>
>>>  #include <public/vm_event.h>
>>>
>>> +static inline void set_npt_base(struct vcpu *curr, vm_event_request_t *req)
>>
>> No need for inline here.  Can fix on commit.
>>
>>> diff --git a/xen/include/public/vm_event.h b/xen/include/public/vm_event.h
>>> index fdd3ad8a30..8415bc7618 100644
>>> --- a/xen/include/public/vm_event.h
>>> +++ b/xen/include/public/vm_event.h
>>> @@ -208,6 +212,7 @@ struct vm_event_regs_x86 {
>>>      uint64_t msr_star;
>>>      uint64_t msr_lstar;
>>>      uint64_t gdtr_base;
>>> +    uint64_t npt_base;
>>
>> This needs enough description to actually use it correctly.
>>
>> /* Guest physical address.  On Intel hardware, this is the EPT_POINTER
>> field from the L1 hypervisors VMCS, including all architecturally
>> defined metadata. */
>>
>> Except, its not.  nvmx_vcpu_eptp_base() masks out the lower metadata, so
>> the walk length is missing, and the introspection agent can't
>> distinguish between 4 and 5 level EPT.  Same on the AMD side (except it
>> could be any paging mode, including 2 and 3 level).
> 
> AMD is AFAIK not supported for vm_events. Also, only 4L EPT is
> available at this time, so that information is irrelevant anyway.

I suppose we should try to avoid having to change the interface
again to allow going from "implied 4-level" to "4- or 5-level",
so I'm with Andrew that this information wants providing even if
there's going to be only a single value at this time (but you
wouldn't store a literal number anyway, but instead use the walk
length associated with the base, so no change to the producer of
the code would be needed once 5-level walks become an option).

Jan

