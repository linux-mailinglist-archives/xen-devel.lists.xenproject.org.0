Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 597E62B1D13
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 15:24:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26521.54941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kda0M-0000he-CJ; Fri, 13 Nov 2020 14:24:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26521.54941; Fri, 13 Nov 2020 14:24:46 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kda0M-0000hF-96; Fri, 13 Nov 2020 14:24:46 +0000
Received: by outflank-mailman (input) for mailman id 26521;
 Fri, 13 Nov 2020 14:24:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5p9l=ET=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kda0K-0000hA-9g
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 14:24:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d973e31d-b920-49f0-855c-07f7f6ad7c10;
 Fri, 13 Nov 2020 14:24:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 44092AC91;
 Fri, 13 Nov 2020 14:23:42 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5p9l=ET=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kda0K-0000hA-9g
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 14:24:44 +0000
X-Inumbo-ID: d973e31d-b920-49f0-855c-07f7f6ad7c10
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d973e31d-b920-49f0-855c-07f7f6ad7c10;
	Fri, 13 Nov 2020 14:24:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605277422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Yf5p8U/qhB1Unc/et2evPtE34U5QvhfbEqJebhm0P4=;
	b=jy6z/lbLSFycvgGEPdPOvNxwzFidAkD/LBCENIm1d7ruKNDAZjknkErI+qba3JsLfQX/xB
	Mr3DUDJbz439yDwXAF1y0h7P3ytO4+udvWzclcQfXBDKJhz/+wg8zxA823abrEsQNlAAxv
	+yRtdUqK4qMD7vJGHVNLgIMKTgSx/pQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 44092AC91;
	Fri, 13 Nov 2020 14:23:42 +0000 (UTC)
Subject: Re: [PATCH 06/10] vpci: Make every domain handle its own BARs
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: Oleksandr Andrushchenko <andr2000@gmail.com>,
 "Rahul.Singh@arm.com" <Rahul.Singh@arm.com>,
 "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "iwj@xenproject.org" <iwj@xenproject.org>, "wl@xen.org" <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-7-andr2000@gmail.com>
 <20201112094002.bzk6gvp4iy4dgj4s@Air-de-Roger>
 <1b3f11c2-a5a2-da5c-25b3-851ef9465ab9@epam.com>
 <20201112144643.iyy5b34qyz5zi7mc@Air-de-Roger>
 <1fe15b9a-6f5d-1209-8ff5-af7c4fc0d637@epam.com>
 <b4697fbe-6896-ed64-409d-85620c08904a@suse.com>
 <3d6e5aab-ff89-7859-09c6-5ecb0c052511@epam.com>
 <1c88fef1-8558-fde1-02c7-8a68f6ecf312@suse.com>
 <67fd5df7-2ad2-08e5-294e-b769429164f0@epam.com>
 <03e23a66-619f-e846-cf61-a33ca5d9f0b4@suse.com>
 <b151e6d2-5480-d201-432a-bece208a1fd9@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c58c1393-381a-d995-6e41-fa3251f67bd7@suse.com>
Date: Fri, 13 Nov 2020 15:23:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <b151e6d2-5480-d201-432a-bece208a1fd9@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 13.11.2020 13:41, Oleksandr Andrushchenko wrote:
> 
> On 11/13/20 1:35 PM, Jan Beulich wrote:
>> On 13.11.2020 12:02, Oleksandr Andrushchenko wrote:
>>> On 11/13/20 12:50 PM, Jan Beulich wrote:
>>>> On 13.11.2020 11:46, Oleksandr Andrushchenko wrote:
>>>>> On 11/13/20 12:25 PM, Jan Beulich wrote:
>>>>>> On 13.11.2020 07:32, Oleksandr Andrushchenko wrote:
>>>>>>> I'll try to replace is_hardware_domain with something like:
>>>>>>>
>>>>>>> +/*
>>>>>>> + * Detect whether physical PCI devices in this segment belong
>>>>>>> + * to the domain given, e.g. on x86 all PCI devices live in hwdom,
>>>>>>> + * but in case of ARM this might not be the case: those may also
>>>>>>> + * live in driver domains or even Xen itself.
>>>>>>> + */
>>>>>>> +bool pci_is_hardware_domain(struct domain *d, u16 seg)
>>>>>>> +{
>>>>>>> +#ifdef CONFIG_X86
>>>>>>> +    return is_hardware_domain(d);
>>>>>>> +#elif CONFIG_ARM
>>>>>>> +    return pci_is_owner_domain(d, seg);
>>>>>>> +#else
>>>>>>> +#error "Unsupported architecture"
>>>>>>> +#endif
>>>>>>> +}
>>>>>>> +
>>>>>>> +/*
>>>>>>> + * Get domain which owns this segment: for x86 this is always hardware
>>>>>>> + * domain and for ARM this can be different.
>>>>>>> + */
>>>>>>> +struct domain *pci_get_hardware_domain(u16 seg)
>>>>>>> +{
>>>>>>> +#ifdef CONFIG_X86
>>>>>>> +    return hardware_domain;
>>>>>>> +#elif CONFIG_ARM
>>>>>>> +    return pci_get_owner_domain(seg);
>>>>>>> +#else
>>>>>>> +#error "Unsupported architecture"
>>>>>>> +#endif
>>>>>>> +}
>>>>>>>
>>>>>>> This is what I use to properly detect the domain that really owns physical host bridge
>>>>>> I consider this problematic. We should try to not let Arm's and x86'es
>>>>>> PCI implementations diverge too much, i.e. at least the underlying basic
>>>>>> model would better be similar. For example, if entire segments can be
>>>>>> assigned to a driver domain on Arm, why should the same not be possible
>>>>>> on x86?
>>>>> Good question, probably in this case x86 == ARM and I can use
>>>>>
>>>>> pci_is_owner_domain for both architectures instead of using is_hardware_domain for x86
>>>>>
>>>>>> Furthermore I'm suspicious about segments being the right granularity
>>>>>> here. On ia64 multiple host bridges could (and typically would) live
>>>>>> on segment 0. Iirc I had once seen output from an x86 system which was
>>>>>> apparently laid out similarly. Therefore, just like for MCFG, I think
>>>>>> the granularity wants to be bus ranges within a segment.
>>>>> Can you please suggest something we can use as a hint for such a detection logic?
>>>> The underlying information comes from ACPI tables, iirc. I don't
>>>> recall the details, though - sorry.
>>> Ok, so seg + bus should be enough for both ARM and Xen then, right?
>>>
>>> pci_get_hardware_domain(u16 seg, u8 bus)
>> Whether an individual bus number can suitable express things I can't
>> tell; I did say bus range, but of course if you care about just
>> individual devices, then a single bus number will of course do.
> 
> I can implement the lookup whether a PCI host bridge owned by a particular
> 
> domain with something like:
> 
> struct pci_host_bridge *bridge = pci_find_host_bridge(seg, bus);
> 
> return bridge->dt_node->used_by == d->domain_id;
> 
> Could you please give me a hint how this can be done on x86?

Bridges can't be assigned to other than the hardware domain right
now. Earlier on I didn't say you should get this to work, only
that I think the general logic around what you add shouldn't make
things more arch specific than they really should be. That said,
something similar to the above should still be doable on x86,
utilizing struct pci_seg's bus2bridge[]. There ought to be
DEV_TYPE_PCI_HOST_BRIDGE entries there, albeit a number of them
(provided by the CPUs themselves rather than the chipset) aren't
really host bridges for the purposes you're after.

Jan

