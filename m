Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3119D348B29
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 09:07:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101287.193615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPL1P-0007pZ-1b; Thu, 25 Mar 2021 08:07:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101287.193615; Thu, 25 Mar 2021 08:07:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPL1O-0007pA-Uf; Thu, 25 Mar 2021 08:07:14 +0000
Received: by outflank-mailman (input) for mailman id 101287;
 Thu, 25 Mar 2021 08:07:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zQ/e=IX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lPL1M-0007p5-Tl
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 08:07:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9cb0106b-2e42-48f2-be2b-26a8878af4d2;
 Thu, 25 Mar 2021 08:07:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 33231AA55;
 Thu, 25 Mar 2021 08:07:11 +0000 (UTC)
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
X-Inumbo-ID: 9cb0106b-2e42-48f2-be2b-26a8878af4d2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616659631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7PHw/ZB/kcPNh6PaDs7Hs8y5n3CUjfPt512+DzawP/A=;
	b=HZllZWmDQ53qe9RXUbkmgChqthOlEucpN/cVVrecv5UIMRU+VbeJ9WCND+epP58dEd5amP
	Q6ShK7QfPLZ5x0kV0T9fOiB3fZdp3kGT3O38GZjmYVZ/ba+OFxJ35F3wsLeHDL3wD3+7E6
	+AvCMIwbHemL/I5BmOb2BgX9D7NaC5I=
Subject: Re: [PATCH 1/2] docs/designs/launch: hyperlaunch design document
To: Stefano Stabellini <sstabellini@kernel.org>,
 Christopher Clark <christopher.w.clark@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Julien Grall <jgrall@amazon.com>, Julien Grall <Julien.grall.oss@gmail.com>,
 iwj@xenproject.org, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Rich Persaud <persaur@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, luca.fancellu@arm.com,
 paul@xen.org, Adam Schwalm <adam.schwalm@starlab.io>
References: <20210316031814.10311-1-dpsmith@apertussolutions.com>
 <20210316031814.10311-2-dpsmith@apertussolutions.com>
 <YFODOnQRAntdETY7@Air-de-Roger>
 <CACMJ4GaWtSWAyqbgqDa-DuLy1bYCBx8E6PucxtGfVeiraAy5cA@mail.gmail.com>
 <YFrxznV1kXeXsRCa@Air-de-Roger>
 <CACMJ4GZMNfbCjTKR5ngQBMwwAfUnSOptP+UJV8BcNqKAUy9Row@mail.gmail.com>
 <alpine.DEB.2.21.2103241206430.439@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <95447252-c50e-9521-4c0d-b5297b22367d@suse.com>
Date: Thu, 25 Mar 2021 09:07:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2103241206430.439@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24.03.2021 20:10, Stefano Stabellini wrote:
> On Wed, 24 Mar 2021, Christopher Clark wrote:
>>>>> I'm also not sure how you are going to handle things like SR-IOV
>>>>> devices. Right now SR-IOV capability is setup and initialized by the
>>>>> hardware domain, and the new virtual devices are notified to Xen once
>>>>> setup is done. Do you plan to move those bits into Xen, so that it can
>>>>> setup and initialize the SR-IOV capability?
>>>>
>>>> While you could do it with the vPCI, as you point out this will not work
>>>> for SR-IOV. With hyperlaunch, these cases will require the use of a boot
>>>> domain, which is for all intents and purposes, a lightweight/restricted
>>>> toolstack domain.
>>>>
>>>> The boot domain will have to do the necessary operations to ensure that
>>>> when startup is finished, PCI passthrough will be successfully setup.
>>>> Note, this may have to include the boot domain unpausing the hardware
>>>> domain to help complete the setup before the boot domain can exit and
>>>> allow the remaining domains to come online.
>>>
>>> OK, I was expecting hyperlaunch to do all domain creation in the
>>> hypervisor.
>>
>> That is my expectation too. It is what we've been planning for in our
>> work so far but we can work on explaining the steps involved in
>> constructing the domains more clearly.
>>
>>> If you offload domain creation of guests with
>>> pci-passthrough devices to a control domain and/or hardware domain,
>>> I'm not sure I see the difference from normal domain creation, ie:
>>> it's no longer something specific to hyperlaunch, as I could achieve
>>> the same by using the existing xendomains init script.
>>
>> So that's not what we've proposed, and hopefully not what we'll need to do.
>>
>> Do you know if there is a need to perform work to support the
>> assignment of PCI devices at the point of domain creation (ie. in
>> domain_create), rather than handling it in a later step of domain
>> configuration, prior to the domain being started?
> 
> Let's leave SR-IOV aside for a moment that can be a bit strange (if I
> recall correctly sometimes VFs can only appear after the PF driver has
> been loaded).

Yes, and iirc beyond that the number of VFs can (in Linux at least)
also be controlled (read: changed) when the driver is already
loaded, via sysfs. I think such flexibility is desirable, as a
device's resources may get partitioned differently depending on the
number of VFs, and hence the number of VFs may affect individual
VFs' (and maybe also the PF's) performance. Otoh if the system as
a whole gets statically partitioned, one-time setup of VFs will of
course do.

I don't think though that SR-IOV can be left aside - whatever is to
be done here needs to take it into consideration from the very
beginning.

Jan

