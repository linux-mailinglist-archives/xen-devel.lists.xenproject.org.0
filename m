Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE175A043B
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 00:42:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392974.631641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQz4k-0004Aw-Lk; Wed, 24 Aug 2022 22:42:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392974.631641; Wed, 24 Aug 2022 22:42:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQz4k-00048w-Iw; Wed, 24 Aug 2022 22:42:18 +0000
Received: by outflank-mailman (input) for mailman id 392974;
 Wed, 24 Aug 2022 22:42:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oQz4j-00048q-5w
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 22:42:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oQz4i-0007E6-Ul; Wed, 24 Aug 2022 22:42:16 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oQz4i-0000Hn-PQ; Wed, 24 Aug 2022 22:42:16 +0000
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
	bh=iwClHts53PQAYIIvihr43DMzSNuAgtMMDTVZNPzleEA=; b=mD49E1+c9EEkhB7PBGP0BI7TYL
	JEccHXD2t4lWcJeFRgxPtuI5+HzP0R2PVmTnbuqV4RUGcW3eYDZEcwqFGyK9ATCtVvOyEpsyLM5mX
	+XHXqhzMHAxAdpB7EnqAxk60QYBBXK6XVOg+MK/asYIQQVqGNtVNkcqDH9rHIv7uxctw=;
Message-ID: <da07bb5d-98c3-9c94-a1f0-6021e398f898@xen.org>
Date: Wed, 24 Aug 2022 23:42:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
To: Stefano Stabellini <sstabellini@kernel.org>,
 Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1660902588.git.rahul.singh@arm.com>
 <2fb69ff7cf9a36dd1294da4f9f4b968ff7076d42.1660902588.git.rahul.singh@arm.com>
 <d5ed6097-8a08-eb4d-35a0-ab28f82b881f@xen.org>
 <1E823DBF-8576-4E26-B12D-B69CE581F36F@arm.com>
 <c9330b72-193c-5478-9bad-9593ac7398a9@xen.org>
 <3D33311C-5FBA-4C46-A18F-105DE814C306@arm.com>
 <685e53cc-1b83-8d66-7086-dad4135c0587@xen.org>
 <474E0887-7EFC-4A0C-9815-DFBDAE9A93A9@arm.com>
 <alpine.DEB.2.22.394.2208241439220.15247@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 7/7] xen/arm: introduce new xen,enhanced property value
In-Reply-To: <alpine.DEB.2.22.394.2208241439220.15247@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefano,

On 24/08/2022 22:59, Stefano Stabellini wrote:
> On Wed, 24 Aug 2022, Rahul Singh wrote:
>>> On 24 Aug 2022, at 4:36 pm, Julien Grall <julien@xen.org> wrote:
>>> On 24/08/2022 15:42, Rahul Singh wrote:
>>>>> On 24 Aug 2022, at 1:59 pm, Julien Grall <julien@xen.org> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 24/08/2022 13:15, Rahul Singh wrote:
>>>>>> Hi Julien,
>>>>>
>>>>> Hi Rahul,
>>>>>
>>>>>> Please let me know your view on this.
>>>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>>>>> index bfe7bc6b36..a1e23eee59 100644
>>>>>> --- a/xen/arch/arm/domain_build.c
>>>>>> +++ b/xen/arch/arm/domain_build.c
>>>>>> @@ -3562,12 +3562,7 @@ static int __init construct_domU(struct domain *d,
>>>>>>     if ( rc == -EILSEQ ||
>>>>>>       rc == -ENODATA ||
>>>>>>       (rc == 0 && !strcmp(dom0less_enhanced, “enabled”)) )
>>>>>> -  {
>>>>>> -    if ( hardware_domain )
>>>>>>         kinfo.dom0less_enhanced = true;
>>>>>> -    else
>>>>>> -      panic(“Tried to use xen,enhanced without dom0\n”);
>>>>>> -  }
>>>>>
>>>>> You can't use "xen,enhanced" without dom0. In fact, you will end up to dereference NULL in alloc_xenstore_evtchn(). That's because "xen,enhanced" means the domain will be able to use Xenstored.
>>>>>
>>>>> Now if you want to support your feature without a dom0. Then I think we want to introduce an option which would be the same as "xen,enhanced" but doesn't expose Xenstored.
>>>> If we modify the patch as below we can use the "xen,enhanced" for domUs without dom0.
>>>> I tested the patch and its works fine. Do you see any issue with this approach?
>>>
>>> Yes. For two reasons:
>>> 1) It is muddying the meaning of "xen,enhanced". In particular a user may not realize that Xenstore is not available if dom0 is not present.
>>> 2) It would be more complicated to handle the case where Xenstored lives in a non-dom0 domain. I am not aware of anyone wanting this on Arm yet, but I don't want to close the door.
>>>
>>> So if you want to support create "xen,xen" without all the rest. Then I think we need a different property value. I don't have a good suggestion for the name.
>>
>> Is that okay if we use the earlier approach, when user set  "xen,enhanced = evtchn” we will not call alloc_xenstore_evtchn()
>> but we create hypervisor node with all fields.
> 
> Thinking more about this, today xen,enhanced has the implication that:
> 
> - the guest will get a regular and complete "xen,xen" node in device tree
> - xenstore and PV drivers will be available (full Xen interfaces support)
> 
> We don't necessarely imply that dom0 is required (from a domU point of
> view) but we do imply that xenstore+evtchn+gnttab will be available to
> the domU.
> 
> Now, static event channels are different. They don't require xenstore
> and they don't require gnttab.
> 
> It is as if the current xen,enhanced node actually meant:
> 
>    xen,enhanced = "xenstore,gnttab,evtchn";

Correct.

> 
> and now we are only enabling a subset:
> 
>    xen,enhanced = "evtchn";
> 
> Is that a correct understanding?

Yes with some cavears (see below).

> 
> 
> If so, we can clarify that:
> 
>    xen,enhanced;
> 
> it is a convenient shortend for:
> 
>    xen,enhanced = "xenstore,gnttab,evtchn";
> 
> and that other combinations are also acceptable, e.g.:
> 
>    xen,enhanced = "gnttab";
>    xen,enhanced = "evtchn";
>    xen,enhanced = "evtchn,gnttab";
> 
> It is OK to panic if the user specifies an option that is currently
> unsupported (e.g. "gnttab").

So today, if you create the node "xen,xen", the guest will expect to be 
able to use both grant-table and event channel.

Therefore, in the list above, the only configuration we can sensibly 
support without any major rework is "evtchn,gnttab".

If we want to support "evtchn" or "gnttab" only. Then we likely need to 
define a new binding (or new version) because neither "regs" nor 
"interrupts" are optional (although a guest OS is free to ignore them).

> 
> In practice xenstore requires both gnttab and evtchn, I don't know if we
> want to write that down in the device tree bindings. We could panic if
> the user specifies: xen,enhanced = "xenstore,evtchn";

I think the interface for dom0less domUs is quite messy at the moment. 
Even if we don't advertise the support for event channel and 
grant-table, hypercalls. They are still accessible if the guest wish to 
do so.

If we decide to introduce "evtchn", "gnttab" & co then we should also 
make sure that if "evtchn" is not specified then we are not allowing the 
guest to allocate any event channel (or map the grant-table).

Otherwise, this is pointless if we try to tell the user "evtchn", 
"gnttab"...

And just to be clear, I would be perfectly happy to break anyone trying
to use event channel without "xen,enanced" because we didn't advertise 
the feature. So they should not use it.

Cheers,

-- 
Julien Grall

