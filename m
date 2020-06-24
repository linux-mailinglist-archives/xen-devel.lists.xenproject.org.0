Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3DE2073FA
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 15:07:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo57d-0003OB-3M; Wed, 24 Jun 2020 13:07:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hC7e=AF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jo57b-0003O6-PD
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 13:07:23 +0000
X-Inumbo-ID: a451ba14-b61b-11ea-8496-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a451ba14-b61b-11ea-8496-bc764e2007e4;
 Wed, 24 Jun 2020 13:07:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CAA42AEFE;
 Wed, 24 Jun 2020 13:07:21 +0000 (UTC)
Subject: Re: [PATCH for-4.14] mm: fix public declaration of struct
 xen_mem_acquire_resource
To: paul@xen.org
References: <20200623135246.66170-1-roger.pau@citrix.com>
 <044c278b-e0df-e389-b21a-66c7307997c4@suse.com>
 <20200623173150.GV735@Air-de-Roger>
 <3ea0ff91-8e5c-701c-ee31-4140b247f3c9@suse.com>
 <4651b23b-ca82-a478-debd-c20cdcd3facd@xen.org>
 <ccd01544-04f7-8e34-dfdc-ccf373db3996@suse.com>
 <6195142d-6fa3-474d-3070-f43105742e79@xen.org>
 <5193dc6d-0a4c-4e1b-d089-9ba359c19e3e@suse.com>
 <000b01d64a26$7aacb580$70062080$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2bcda30f-fa95-adea-d19a-4d9a4c00d130@suse.com>
Date: Wed, 24 Jun 2020 15:07:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <000b01d64a26$7aacb580$70062080$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.06.2020 14:53, Paul Durrant wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 24 June 2020 13:52
>> To: Julien Grall <julien@xen.org>
>> Cc: Roger Pau Monné <roger.pau@citrix.com>; xen-devel@lists.xenproject.org; paul@xen.org; Andrew
>> Cooper <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>; Ian Jackson
>> <ian.jackson@eu.citrix.com>; Stefano Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>
>> Subject: Re: [PATCH for-4.14] mm: fix public declaration of struct xen_mem_acquire_resource
>>
>> On 24.06.2020 14:47, Julien Grall wrote:
>>> Hi,
>>>
>>> On 24/06/2020 13:08, Jan Beulich wrote:
>>>> On 24.06.2020 12:52, Julien Grall wrote:
>>>>> Hi Jan,
>>>>>
>>>>> On 24/06/2020 11:05, Jan Beulich wrote:
>>>>>> On 23.06.2020 19:32, Roger Pau Monné wrote:
>>>>>>> On Tue, Jun 23, 2020 at 05:04:53PM +0200, Jan Beulich wrote:
>>>>>>>> On 23.06.2020 15:52, Roger Pau Monne wrote:
>>>>>>>>> XENMEM_acquire_resource and it's related structure is currently inside
>>>>>>>>> a __XEN__ or __XEN_TOOLS__ guarded section to limit it's scope to the
>>>>>>>>> hypervisor or the toolstack only. This is wrong as the hypercall is
>>>>>>>>> already being used by the Linux kernel at least, and as such needs to
>>>>>>>>> be public.
>>>>>>>>
>>>>>>>> Actually - how does this work for the Linux kernel, seeing
>>>>>>>>
>>>>>>>>       rc = rcu_lock_remote_domain_by_id(xmar.domid, &d);
>>>>>>>>       if ( rc )
>>>>>>>>           return rc;
>>>>>>>>
>>>>>>>>       rc = xsm_domain_resource_map(XSM_DM_PRIV, d);
>>>>>>>>       if ( rc )
>>>>>>>>           goto out;
>>>>>>>>
>>>>>>>> in the function?
>>>>>>>
>>>>>>> It's my understanding (I haven't tried to use that hypercall yet on
>>>>>>> FreeBSD, so I cannot say I've tested it), that xmar.domid is the
>>>>>>> remote domain, which the functions locks and then uses
>>>>>>> xsm_domain_resource_map to check whether the current domain has
>>>>>>> permissions to do privileged operations against it.
>>>>>>
>>>>>> Yes, but that's a tool stack operation, not something the kernel
>>>>>> would do all by itself. The kernel would only ever pass DOMID_SELF
>>>>>> (or the actual local domain ID), I would think.
>>>>>
>>>>> You can't issue that hypercall directly from userspace because you need
>>>>> to map the page in the physical address space of the toolstack domain.
>>>>>
>>>>> So the kernel has to act as the proxy for the hypercall. This is
>>>>> implemented as mmap() in Linux.
>>>>
>>>> Oh, and there's no generic wrapping available here, unlike for
>>>> dmop.
>>>
>>> It is not clear to me the sort of generic wrapping you are referring to.
>>> Are you referring to a stable interface for an application?
>>>
>>>> Makes me wonder whether, for this purpose, there should
>>>> be (have been) a new dmop with identical functionality, to
>>>> allow such funneling.
>>>
>>> I am not sure how using DMOP will allow us to implement it fully in
>>> userspace. Do you mind expanding it?
>>
>> dmop was designed so that a kernel proxying requests wouldn't need
>> updating for every new request added to the interface. If the
>> request here was made through a new dmop, the kernel would never
>> have had a need to know of an interface structure that's of no
>> interest to it, but only to the tool stack.
> 
> How would the pages get mapped into process address space if the
> kernel doesn't know what's being done?

Urgh, yes, silly me.

Jan

