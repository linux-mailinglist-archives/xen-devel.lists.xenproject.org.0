Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC5C2D0BFA
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 09:48:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45960.81528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmCBk-0002Fv-OB; Mon, 07 Dec 2020 08:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45960.81528; Mon, 07 Dec 2020 08:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmCBk-0002FW-KX; Mon, 07 Dec 2020 08:48:08 +0000
Received: by outflank-mailman (input) for mailman id 45960;
 Mon, 07 Dec 2020 08:48:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmCBj-0002FR-Jf
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 08:48:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9cf900e1-133f-41d3-847c-319d3e60ce58;
 Mon, 07 Dec 2020 08:48:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 80C01AC9A;
 Mon,  7 Dec 2020 08:48:05 +0000 (UTC)
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
X-Inumbo-ID: 9cf900e1-133f-41d3-847c-319d3e60ce58
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607330885; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9i5hyFbGoKgt4swjGhuceObUoLO22/nwdsHt75xqA1Q=;
	b=dls3yzcTFjPcRxsHJzdqqDI7k1j3Ksvx8y4Dm38bqY2r7piR2AbFGppzVdmlOhThSVgZ+K
	sq9ZNrmXs8puIayi5oMXq+GQ9EhEjZaM+2DYA7s8+ivan/2vPXHfN9wD00bqqsINysALln
	9Wh2yQmeGsFgII3O2pkpFw0SjnI427s=
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
 <c58c1393-381a-d995-6e41-fa3251f67bd7@suse.com>
 <8fc22774-7380-2de1-9c30-6649a79fdfe1@epam.com>
 <46c75ee1-758c-8a42-d8d3-8d42cce3240a@suse.com>
 <66cb04c5-5e98-6a4d-da88-230b2dbc3d98@epam.com>
 <04059ce3-7009-9e1e-8ba2-398cc993d81b@suse.com>
 <802e20d8-82b6-5755-e6e5-aadb07585a32@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b631c122-554c-e26e-4fa9-56809dd5569a@suse.com>
Date: Mon, 7 Dec 2020 09:48:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <802e20d8-82b6-5755-e6e5-aadb07585a32@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04.12.2020 15:38, Oleksandr Andrushchenko wrote:
> On 11/13/20 4:51 PM, Jan Beulich wrote:
>> On 13.11.2020 15:44, Oleksandr Andrushchenko wrote:
>>> On 11/13/20 4:38 PM, Jan Beulich wrote:
>>>> On 13.11.2020 15:32, Oleksandr Andrushchenko wrote:
>>>>> On 11/13/20 4:23 PM, Jan Beulich wrote:
>>>>>>     Earlier on I didn't say you should get this to work, only
>>>>>> that I think the general logic around what you add shouldn't make
>>>>>> things more arch specific than they really should be. That said,
>>>>>> something similar to the above should still be doable on x86,
>>>>>> utilizing struct pci_seg's bus2bridge[]. There ought to be
>>>>>> DEV_TYPE_PCI_HOST_BRIDGE entries there, albeit a number of them
>>>>>> (provided by the CPUs themselves rather than the chipset) aren't
>>>>>> really host bridges for the purposes you're after.
>>>>> You mean I can still use DEV_TYPE_PCI_HOST_BRIDGE as a marker
>>>>>
>>>>> while trying to detect what I need?
>>>> I'm afraid I don't understand what marker you're thinking about
>>>> here.
>>> I mean that when I go over bus2bridge entries, should I only work with
>>>
>>> those who have DEV_TYPE_PCI_HOST_BRIDGE?
>> Well, if you're after host bridges - yes.
>>
>> Jan
> 
> So, I started looking at the bus2bridge and if it can be used for both x86 (and possible ARM) and I have an
> 
> impression that the original purpose of this was to identify the devices which x86 IOMMU should
> 
> cover: e.g. I am looking at the find_upstream_bridge users and they are x86 IOMMU and VGA driver.
> 
> I tried to play with this on ARM, and for the HW platform I have and QEMU I got 0 entries in bus2bridge...
> 
> This is because of how xen/drivers/passthrough/pci.c:alloc_pdev is implemented (which lives in the
> 
> common code BTW, but seems to be x86 specific): so, it skips setting up bus2bridge entries for the bridges I have.

I'm curious to learn what's x86-specific here. I also can't deduce
why bus2bridge setup would be skipped.

> These are DEV_TYPE_PCIe_BRIDGE and DEV_TYPE_PCI_HOST_BRIDGE. So, the assumption I've made before
> 
> that I can go over bus2bridge and filter out the "owner" or parent bridge for a given seg:bus doesn't
> 
> seem to be possible now.
> 
> Even if I find the parent bridge with xen/drivers/passthrough/pci.c:find_upstream_bridge I am not sure
> 
> I can get any further in detecting which x86 domain owns this bridge: the whole idea in the x86 code is
> 
> that Domain-0 is the only possible one here (you mentioned that).

Right - your attempt to find the owner should _right now_ result in
getting back Dom0, on x86. But there shouldn't be any such assumption
in the new consumer of this data that you mean to introduce. I.e. I
only did suggest this to avoid ...

> So, I doubt if we can still live with
> 
> is_hardware_domain for now for x86?

... hard-coding information which can be properly established /
retrieved.

Jan

