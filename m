Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5880F23DBD8
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 18:34:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3ipj-0000hg-PX; Thu, 06 Aug 2020 16:33:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gxiU=BQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3ipi-0000hb-9U
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 16:33:34 +0000
X-Inumbo-ID: 09ca4436-44b7-4f21-86f9-16f62750f315
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09ca4436-44b7-4f21-86f9-16f62750f315;
 Thu, 06 Aug 2020 16:33:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A055DAC48;
 Thu,  6 Aug 2020 16:33:49 +0000 (UTC)
Subject: Re: [RFC PATCH V1 08/12] xen/arm: Invalidate qemu mapcache on
 XENMEM_decrease_reservation
To: Oleksandr <olekstysh@gmail.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-9-git-send-email-olekstysh@gmail.com>
 <21b7d8ed-f305-8abe-0e4e-174d72d087c8@suse.com>
 <ce4076ae-705d-e24d-831a-6898d93a4040@xen.org>
 <04cfd6e4-1ed0-52c3-a3b0-d555d9dc632b@suse.com>
 <0ff0807f-c5d3-f63c-d54c-860648ef3a13@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <52549e1a-d29b-d2c5-8173-e44dbd67d04f@suse.com>
Date: Thu, 6 Aug 2020 18:33:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <0ff0807f-c5d3-f63c-d54c-860648ef3a13@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06.08.2020 16:28, Oleksandr wrote:
> 
> On 06.08.20 14:50, Jan Beulich wrote:
> 
> Hi Jan
> 
>>>> On 03.08.2020 20:21, Oleksandr Tyshchenko wrote:
>>>>> --- a/xen/common/memory.c
>>>>> +++ b/xen/common/memory.c
>>>>> @@ -1652,6 +1652,12 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>>>            break;
>>>>>        }
>>>>>    
>>>>> +    /* x86 already sets the flag in hvm_memory_op() */
>>>>> +#if defined(CONFIG_ARM64) && defined(CONFIG_IOREQ_SERVER)
>>>>> +    if ( op == XENMEM_decrease_reservation )
>>>>> +        curr_d->arch.hvm.qemu_mapcache_invalidate = true;
>>>>> +#endif
>>>> Doesn't the comment already indicate a route towards an approach
>>>> not requiring to alter common code?
>>> Given that IOREQ is now moved under common/, I think it would make sense
>>> to have this set in common code as well for all the architecture.
>>>
>>> IOW, I would suggest to drop the #ifdef CONFIG_ARM64. In addition, we
>>> may want to introduce an helper to check if a domain is using ioreq.
>> Of course, with the (part of the) conditional dropped and the struct
>> field moved out of the arch sub-struct, this is fine to live here.
> 
> ok.
> 
> 
> I suspect this should *also* live in compat_memory_op(). Please confirm 
> whether my understanding correct.

Doesn't compat_memory_op() simply call here, so will have the flag set
as needed?

Jan

