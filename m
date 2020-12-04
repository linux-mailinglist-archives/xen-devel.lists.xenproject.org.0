Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFB52CE8D6
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 08:53:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44094.79057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl5tz-0007Od-0L; Fri, 04 Dec 2020 07:53:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44094.79057; Fri, 04 Dec 2020 07:53:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl5ty-0007OE-T7; Fri, 04 Dec 2020 07:53:14 +0000
Received: by outflank-mailman (input) for mailman id 44094;
 Fri, 04 Dec 2020 07:53:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c9tS=FI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kl5tx-0007O9-Td
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 07:53:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2c07ca8-e8ea-434a-bda7-31c87cb8ce5f;
 Fri, 04 Dec 2020 07:53:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 98D85AE1C;
 Fri,  4 Dec 2020 07:53:11 +0000 (UTC)
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
X-Inumbo-ID: d2c07ca8-e8ea-434a-bda7-31c87cb8ce5f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607068391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0UW8iom+2AP1E9O/Caq/ferkoW/IBAu+X9ko7/cK4os=;
	b=k3EDvhZXe/BdTl4AirfQnmxtM8qBgvLLwzPHhklFcBKAc4IL/rokXBQHchKYSPrSdALytA
	iGU+Nt5lLJKcByTAkOxeEfXfVB1zq34KgfY9G3xczQCxGjxWdxX+DBELMHUZeLwL96AdQ5
	FeW0QB9uMfdAnU2aEcdtVPKGT5v8OxM=
Subject: Re: [PATCH v5 1/4] domctl: introduce a new domain create flag,
 XEN_DOMCTL_CDF_evtchn_fifo, ...
To: paul@xen.org
Cc: 'Paul Durrant' <pdurrant@amazon.com>,
 'Eslam Elnikety' <elnikety@amazon.com>, 'Ian Jackson' <iwj@xenproject.org>,
 'Wei Liu' <wl@xen.org>, 'Anthony PERARD' <anthony.perard@citrix.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Julien Grall' <julien@xen.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Christian Lindig' <christian.lindig@citrix.com>,
 'David Scott' <dave@recoil.org>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20201203124159.3688-1-paul@xen.org>
 <20201203124159.3688-2-paul@xen.org>
 <fea91a65-1d7c-cd46-81a2-9a6bcb690ed1@suse.com>
 <00ee01d6c98b$507af1c0$f170d540$@xen.org>
 <8a4a2027-0df3-aee2-537a-3d2814b329ec@suse.com>
 <00f601d6c996$ce3908d0$6aab1a70$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <946280c7-c7f7-c760-c0d3-db91e6cde68a@suse.com>
Date: Fri, 4 Dec 2020 08:53:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <00f601d6c996$ce3908d0$6aab1a70$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 03.12.2020 18:07, Paul Durrant wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 03 December 2020 15:57
>>
>> On 03.12.2020 16:45, Paul Durrant wrote:
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: 03 December 2020 15:23
>>>>
>>>> On 03.12.2020 13:41, Paul Durrant wrote:
>>>>> From: Paul Durrant <pdurrant@amazon.com>
>>>>>
>>>>> ...to control the visibility of the FIFO event channel operations
>>>>> (EVTCHNOP_init_control, EVTCHNOP_expand_array, and EVTCHNOP_set_priority) to
>>>>> the guest.
>>>>>
>>>>> These operations were added to the public header in commit d2d50c2f308f
>>>>> ("evtchn: add FIFO-based event channel ABI") and the first implementation
>>>>> appeared in the two subsequent commits: edc8872aeb4a ("evtchn: implement
>>>>> EVTCHNOP_set_priority and add the set_priority hook") and 88910061ec61
>>>>> ("evtchn: add FIFO-based event channel hypercalls and port ops"). Prior to
>>>>> that, a guest issuing those operations would receive a return value of
>>>>> -ENOSYS (not implemented) from Xen. Guests aware of the FIFO operations but
>>>>> running on an older (pre-4.4) Xen would fall back to using the 2-level event
>>>>> channel interface upon seeing this return value.
>>>>>
>>>>> Unfortunately the uncontrolable appearance of these new operations in Xen 4.4
>>>>> onwards has implications for hibernation of some Linux guests. During resume
>>>>> from hibernation, there are two kernels involved: the "boot" kernel and the
>>>>> "resume" kernel. The guest boot kernel may default to use FIFO operations and
>>>>> instruct Xen via EVTCHNOP_init_control to switch from 2-level to FIFO. On the
>>>>> other hand, the resume kernel keeps assuming 2-level, because it was hibernated
>>>>> on a version of Xen that did not support the FIFO operations.
>>>>>
>>>>> To maintain compatibility it is necessary to make Xen behave as it did
>>>>> before the new operations were added and hence the code in this patch ensures
>>>>> that, if XEN_DOMCTL_CDF_evtchn_fifo is not set, the FIFO event channel
>>>>> operations will again result in -ENOSYS being returned to the guest.
>>>>
>>>> I have to admit I'm now even more concerned of the control for such
>>>> going into Xen, the more with the now 2nd use in the subsequent patch.
>>>> The implication of this would seem to be that whenever we add new
>>>> hypercalls or sub-ops, a domain creation control would also need
>>>> adding determining whether that new sub-op is actually okay to use by
>>>> a guest. Or else I'd be keen to up front see criteria at least roughly
>>>> outlined by which it could be established whether such an override
>>>> control is needed.
>>>>
>>>
>>> Ultimately I think any new hypercall (or related set of hypercalls) added to the ABI needs to be
>> opt-in on a per-domain basis, so that we know that from when a domain is first created it will not see
>> a change in its environment unless the VM administrator wants that to happen.
>>
>> A new hypercall appearing is a change to the guest's environment, yes,
>> but a backwards compatible one. I don't see how this would harm a guest.
> 
> Say we have a guest which is aware of the newer Xen and is coded to use the new hypercall *but* we start it on an older Xen where the new hypercall is not implemented. *Then* we migrate it to the newer Xen... the new hypercall suddenly becomes available and changes the guest behaviour. In the worst case, the guest is sufficiently confused that it crashes.

If a guest recognizes a new hypercall is unavailable, why would it ever try
to make use of it again, unless it knows it may appear after having been
migrated (which implies it's prepared for the sudden appearance)? This to
me still looks like an attempt to work around guest bugs. And a halfhearted
one, as you cherry pick just two out of many additions to the original 3.0
ABI.

>> This and ...
>>
>>>> I'm also not convinced such controls really want to be opt-in rather
>>>> than opt-out.
>>>
>>> They really need to be opt-in I think. From a cloud provider PoV it is important that nothing in a
>> customer's environment changes unless we want it to. Otherwise we have no way to deploy an updated
>> hypervisor version without risking crashing their VMs.
>>
>> ... this sound to me more like workarounds for buggy guests than
>> functionality the hypervisor _needs_ to have. (I can appreciate
>> the specific case here for the specific scenario you provide as
>> an exception.)
> 
> If we want to have a hypervisor that can be used in a cloud environment
> then Xen absolutely needs this capability.

As per above you can conclude that I'm still struggling to see the
"why" part here.

>>>>> --- a/xen/arch/arm/domain.c
>>>>> +++ b/xen/arch/arm/domain.c
>>>>> @@ -622,7 +622,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>>>>      unsigned int max_vcpus;
>>>>>
>>>>>      /* HVM and HAP must be set. IOMMU may or may not be */
>>>>> -    if ( (config->flags & ~XEN_DOMCTL_CDF_iommu) !=
>>>>> +    if ( (config->flags &
>>>>> +          ~(XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_evtchn_fifo) !=
>>>>>           (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap) )
>>>>>      {
>>>>>          dprintk(XENLOG_INFO, "Unsupported configuration %#x\n",
>>>>> --- a/xen/arch/arm/domain_build.c
>>>>> +++ b/xen/arch/arm/domain_build.c
>>>>> @@ -2478,7 +2478,8 @@ void __init create_domUs(void)
>>>>>          struct domain *d;
>>>>>          struct xen_domctl_createdomain d_cfg = {
>>>>>              .arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE,
>>>>> -            .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
>>>>> +            .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
>>>>> +                     XEN_DOMCTL_CDF_evtchn_fifo,
>>>>>              .max_evtchn_port = -1,
>>>>>              .max_grant_frames = 64,
>>>>>              .max_maptrack_frames = 1024,
>>>>> --- a/xen/arch/arm/setup.c
>>>>> +++ b/xen/arch/arm/setup.c
>>>>> @@ -805,7 +805,8 @@ void __init start_xen(unsigned long boot_phys_offset,
>>>>>      struct bootmodule *xen_bootmodule;
>>>>>      struct domain *dom0;
>>>>>      struct xen_domctl_createdomain dom0_cfg = {
>>>>> -        .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
>>>>> +        .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
>>>>> +                 XEN_DOMCTL_CDF_evtchn_fifo,
>>>>>          .max_evtchn_port = -1,
>>>>>          .max_grant_frames = gnttab_dom0_frames(),
>>>>>          .max_maptrack_frames = -1,
>>>>> --- a/xen/arch/x86/setup.c
>>>>> +++ b/xen/arch/x86/setup.c
>>>>> @@ -738,7 +738,8 @@ static struct domain *__init create_dom0(const module_t *image,
>>>>>                                           const char *loader)
>>>>>  {
>>>>>      struct xen_domctl_createdomain dom0_cfg = {
>>>>> -        .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
>>>>> +        .flags = XEN_DOMCTL_CDF_evtchn_fifo |
>>>>> +                 (IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0),
>>>>>          .max_evtchn_port = -1,
>>>>>          .max_grant_frames = -1,
>>>>>          .max_maptrack_frames = -1,
>>>>> --- a/xen/common/domain.c
>>>>> +++ b/xen/common/domain.c
>>>>> @@ -307,7 +307,7 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>>>>>           ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
>>>>>             XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
>>>>>             XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
>>>>> -           XEN_DOMCTL_CDF_nested_virt) )
>>>>> +           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_evtchn_fifo) )
>>>>>      {
>>>>>          dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
>>>>>          return -EINVAL;
>>>>
>>>> All of the hunks above point out a scalability issue if we were to
>>>> follow this route for even just a fair part of new sub-ops, and I
>>>> suppose you've noticed this with the next patch presumably touching
>>>> all the same places again.
>>>
>>> Indeed. This solution works for now but is probably not what we want in the long run. Same goes for
>> the current way we control viridian features via an HVM param. It is good enough for now IMO since
>> domctl is not a stable interface. Any ideas about how we might implement a better interface in the
>> longer term?
>>
>> While it has other downsides, Jürgen's proposal doesn't have any
>> similar scalability issue afaics. Another possible model would
>> seem to be to key new hypercalls to hypervisor CPUID leaf bits,
>> and derive their availability from a guest's CPUID policy. Of
>> course this won't work when needing to retrofit guarding like
>> you want to do here.
> 
> Ok, I'll take a look hypfs as an immediate solution, if that's preferred.

Well, as said - there are also downsides with that approach. I'm
not convinced it should be just the three of us to determine which
one is better overall, the more that you don't seem to be convinced
anyway (and I'm not going to claim I am, in either direction). It
is my understanding that based on the claimed need for this (see
above), this may become very widely used functionality, and if so
we want to make sure we won't regret the route we went.

For starters, just to get a better overall picture, besides the two
overrides you add here, do you have any plans to retroactively add
further controls for past ABI additions? I don't suppose you have
plans to consistently do this for all of them? I ask because I
could see us going the route you've chosen for very few retroactive
additions of overrides, but use the CPUID approach (provided
there's a suitable Arm counterpart, and ideally some understanding
whether something similar could also be found for at least the two
planned new ports) for ABI additions going forward.

Jan

