Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5591CDBB4
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 15:48:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jY8mw-0005qn-D9; Mon, 11 May 2020 13:48:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4Y5i=6Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jY8mv-0005qi-Tf
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 13:48:09 +0000
X-Inumbo-ID: 0c23108a-938e-11ea-b9cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c23108a-938e-11ea-b9cf-bc764e2007e4;
 Mon, 11 May 2020 13:48:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 57B83AE2D;
 Mon, 11 May 2020 13:46:42 +0000 (UTC)
Subject: Re: [PATCH] x86/PVH: PHYSDEVOP_pci_mmcfg_reserved should not blindly
 register a region
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <2ee1a3cb-3b40-6e6d-5308-1cdf9f6c521e@suse.com>
 <20200508150312.GJ1353@Air-de-Roger>
 <70c8b4f4-b690-c031-3b90-1776d872d171@suse.com>
 <20200508160851.GK1353@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d1248c00-ae0b-e2aa-be41-e27d27dce379@suse.com>
Date: Mon, 11 May 2020 15:46:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200508160851.GK1353@Air-de-Roger>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08.05.2020 18:08, Roger Pau Monné wrote:
> On Fri, May 08, 2020 at 05:11:35PM +0200, Jan Beulich wrote:
>> On 08.05.2020 17:03, Roger Pau Monné wrote:
>>> On Fri, May 08, 2020 at 02:43:38PM +0200, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/hvm/io.c
>>>> +++ b/xen/arch/x86/hvm/io.c
>>>> @@ -558,6 +558,47 @@ int register_vpci_mmcfg_handler(struct d
>>>>      return 0;
>>>>  }
>>>>  
>>>> +int unregister_vpci_mmcfg_handler(struct domain *d, paddr_t addr,
>>>> +                                  unsigned int start_bus, unsigned int end_bus,
>>>> +                                  unsigned int seg)
>>>> +{
>>>> +    struct hvm_mmcfg *mmcfg;
>>>> +    int rc = -ENOENT;
>>>> +
>>>> +    ASSERT(is_hardware_domain(d));
>>>> +
>>>> +    if ( start_bus > end_bus )
>>>> +        return -EINVAL;
>>>> +
>>>> +    write_lock(&d->arch.hvm.mmcfg_lock);
>>>> +
>>>> +    list_for_each_entry ( mmcfg, &d->arch.hvm.mmcfg_regions, next )
>>>> +        if ( mmcfg->addr == addr + (start_bus << 20) &&
>>>> +             mmcfg->segment == seg &&
>>>> +             mmcfg->start_bus == start_bus &&
>>>> +             mmcfg->size == ((end_bus - start_bus + 1) << 20) )
>>>> +        {
>>>> +            list_del(&mmcfg->next);
>>>> +            if ( !list_empty(&d->arch.hvm.mmcfg_regions) )
>>>> +                xfree(mmcfg);
>>>> +            else
>>>> +            {
>>>> +                /*
>>>> +                 * Cannot unregister the MMIO handler - leave a fake entry
>>>> +                 * on the list.
>>>> +                 */
>>>> +                memset(mmcfg, 0, sizeof(*mmcfg));
>>>> +                list_add(&mmcfg->next, &d->arch.hvm.mmcfg_regions);
>>>
>>> Instead of leaving this zombie entry around maybe we could add a
>>> static bool in register_vpci_mmcfg_handler to signal whether the MMIO
>>> intercept has been registered?
>>
>> That was my initial plan indeed, but registration is per-domain.
> 
> Indeed, this would work now because it's only used by the hardware
> domain, but it's not a good move long term.
> 
> What about splitting the registration into a
> register_vpci_mmio_handler and call it from hvm_domain_initialise
> like it's done for register_vpci_portio_handler?

No, the goal is to not register unneeded handlers. But see below -
I'll likely ditch the function anyway.

>>>> --- a/xen/arch/x86/physdev.c
>>>> +++ b/xen/arch/x86/physdev.c
>>>> @@ -559,12 +559,18 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
>>>>          if ( !ret && has_vpci(currd) )
>>>>          {
>>>>              /*
>>>> -             * For HVM (PVH) domains try to add the newly found MMCFG to the
>>>> -             * domain.
>>>> +             * For HVM (PVH) domains try to add/remove the reported MMCFG
>>>> +             * to/from the domain.
>>>>               */
>>>> -            ret = register_vpci_mmcfg_handler(currd, info.address,
>>>> -                                              info.start_bus, info.end_bus,
>>>> -                                              info.segment);
>>>> +            if ( info.flags & XEN_PCI_MMCFG_RESERVED )
>>>
>>> Do you think you could also add a small note in physdev.h regarding
>>> the fact that XEN_PCI_MMCFG_RESERVED is used to register a MMCFG
>>> region, and not setting it would imply an unregister request?
>>>
>>> It's not obvious to me from the name of the flag.
>>
>> The main purpose of the flag is to identify whether a region can be
>> used (because of having been found marked suitably reserved by
>> firmware). The flag not set effectively means "region is not marked
>> reserved".
> 
> Looking at pci_mmcfg_arch_disable, should the region then also be
> removed from mmio_ro_ranges? (kind of tangential to this patch)

If it's truly unregistration - yes. But ...

>> You pointing this out makes me wonder whether instead I
>> should simply expand the if() in context, without making it behave
>> like unregistration. Then again we'd have no way to unregister a
>> region, and hence (ab)using this function for this purpose seems to
>> makes sense (and, afaict, not require any code changes elsewhere).
> 
> Right now the only user I know of PHYSDEVOP_pci_mmcfg_reserved is
> Linux, and AFAICT it always sets the XEN_PCI_MMCFG_RESERVED flag (at
> least upstream).

... I've looked at our forward port, where this was first introduced.
There we made the call in all cases, with the flag indicating what is
wanted. Therefore I don't think we want to assign the flag being
clear the meaning of "unregistration". I'll therefore switch to the
simpler change of just expanding the if().

Jan

