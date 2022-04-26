Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A7E50F468
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 10:34:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313520.531078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njGdg-0007Gt-7S; Tue, 26 Apr 2022 08:33:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313520.531078; Tue, 26 Apr 2022 08:33:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njGdg-0007Dq-4L; Tue, 26 Apr 2022 08:33:40 +0000
Received: by outflank-mailman (input) for mailman id 313520;
 Tue, 26 Apr 2022 08:33:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1njGdf-0007Dk-Fm
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 08:33:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njGda-00088S-Li; Tue, 26 Apr 2022 08:33:34 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.15.135]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njGda-00025K-FA; Tue, 26 Apr 2022 08:33:34 +0000
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
	bh=h4YX8rqQzCmA8T91YPdPLIYmjjKLa55vnhuZa5+Iirg=; b=cfFaZv3CcrxfCT0ZTQqGLjUV9j
	Q/orSv6HDRRSF+lFkS3HqZn8H43tfQ2lfzSrhDyGvx7qsfzR1oFuGeZDz2l9SNl94TeTjx8kEoehP
	OLVV8AGHHK3pF6xmF08UKQK0H6VOIoESg8yk6ANIc3a9ApBl2EYX+/atsoq2xX4LcDHk=;
Message-ID: <bce39358-9739-c39d-c97f-6bae216da89b@xen.org>
Date: Tue, 26 Apr 2022 09:33:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH v4 1/2] x86/mem_sharing: make fork_reset more configurable
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
References: <bc13e07cdb651afc2c8a97dde1be9c2158160307.1649857162.git.tamas.lengyel@intel.com>
 <YmasHAT0YkeJVMbv@Air-de-Roger>
 <CABfawhn=6KVVPZD6AVRH2=NJFd5ZwtPpxDn__LdEFJQx6bhCXA@mail.gmail.com>
 <Ymeqg+UmOl2mN5Dz@Air-de-Roger>
From: Julien Grall <julien@xen.org>
In-Reply-To: <Ymeqg+UmOl2mN5Dz@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 26/04/2022 09:17, Roger Pau Monné wrote:
> On Mon, Apr 25, 2022 at 11:24:37AM -0400, Tamas K Lengyel wrote:
>> On Mon, Apr 25, 2022 at 10:12 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
>>>> diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
>>>> index 84cf52636b..d26a6699fc 100644
>>>> --- a/xen/common/vm_event.c
>>>> +++ b/xen/common/vm_event.c
>>>> @@ -28,6 +28,11 @@
>>>>   #include <asm/p2m.h>
>>>>   #include <asm/monitor.h>
>>>>   #include <asm/vm_event.h>
>>>> +
>>>> +#ifdef CONFIG_MEM_SHARING
>>>> +#include <asm/mem_sharing.h>
>>>> +#endif
>>>> +
>>>>   #include <xsm/xsm.h>
>>>>   #include <public/hvm/params.h>
>>>>
>>>> @@ -394,6 +399,16 @@ static int vm_event_resume(struct domain *d, struct vm_event_domain *ved)
>>>>               if ( rsp.reason == VM_EVENT_REASON_MEM_PAGING )
>>>>                   p2m_mem_paging_resume(d, &rsp);
>>>>   #endif
>>>> +#ifdef CONFIG_MEM_SHARING
>>>> +            if ( mem_sharing_is_fork(d) )
>>>> +            {
>>>> +                bool reset_state = rsp.flags & VM_EVENT_FLAG_RESET_FORK_STATE;
>>>> +                bool reset_mem = rsp.flags & VM_EVENT_FLAG_RESET_FORK_MEMORY;
>>>> +
>>>> +                if ( reset_state || reset_mem )
>>>> +                    ASSERT(!mem_sharing_fork_reset(d, reset_state, reset_mem));
>>>
>>> Might be appropriate to destroy the domain in case fork reset fails?
>>> ASSERT will only help in debug builds.
>>
>> No, I would prefer not destroying the domain here. If it ever becomes
>> necessary the right way would be to introduce a new monitor event to
>> signal an error and let the listener decide what to do. At the moment
>> I don't see that being necessary as there are no known scenarios where
>> we would be able to setup a fork but fail to reset is.
> 
> My concern for raising this was what would happen on non-debug
> builds if mem_sharing_fork_reset() failed, and hence my request to
> crash the domain.  I would have used something like:
> 
> if ( (reset_state || reset_mem) &&
>       mem_sharing_fork_reset(d, reset_state, reset_mem) )
> {
>      ASSERT_UNREACHABLE();
>      domain_crash(d);
>      break;
> }
> 
> But if you and other vm_event maintainers are fine with the current
> approach and don't think it's a problem that's OK with me.

The current approach is actually not correct. On production build, 
ASSERT() will turn to NOP. IOW mem_sharing_fork_reset() *will* not be 
called.

So the call needs to move outside of the ASSERT() and use a construct 
similar to what you suggested:

if ( .... && mem_sharing_fork_reset(...) )
{
   ASSERT_UNREACHABLE();
   break;
}

Cheers,

-- 
Julien Grall

