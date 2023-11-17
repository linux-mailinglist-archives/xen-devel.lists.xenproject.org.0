Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F6D7EEA27
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 01:06:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634756.990216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3mNf-0004Dp-HJ; Fri, 17 Nov 2023 00:06:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634756.990216; Fri, 17 Nov 2023 00:06:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3mNf-0004Ar-EB; Fri, 17 Nov 2023 00:06:43 +0000
Received: by outflank-mailman (input) for mailman id 634756;
 Fri, 17 Nov 2023 00:06:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r3mNe-0004Al-Kn
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 00:06:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3mNd-0002Be-R4; Fri, 17 Nov 2023 00:06:41 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3mNd-000814-Kn; Fri, 17 Nov 2023 00:06:41 +0000
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
	bh=OOsEuDvQfTxxZrbKKumu5eR8UYP7nSeqrwCEaIjz8Es=; b=yNPL1MHU7UBzeL7NOgWnE1GkWH
	5wx4mKfSTZPteVr+U+CrhvS0y6M7yT1m7acLLlr1v4C2MXgOQwKl4Q4Yaf/txqmUmHYzJuos8NkC2
	m4Qcb9cSF6JLQzJNSh1BcUCXPPz+F41AySy/cqFpkFQi3WCbFfD2NUPGnPjXesg9uw0g=;
Message-ID: <2c358b80-ad87-4e36-84ca-96380a8f39e4@xen.org>
Date: Fri, 17 Nov 2023 00:06:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 13/17] vpci: add initial support for virtual PCI bus
 topology
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
 <20231012220854.2736994-14-volodymyr_babchuk@epam.com>
 <d6a58e73-da51-40f1-a2f7-576274945585@xen.org>
 <alpine.DEB.2.22.394.2311161513210.773207@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2311161513210.773207@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 16/11/2023 23:28, Stefano Stabellini wrote:
> On Thu, 16 Nov 2023, Julien Grall wrote:
>> IIUC, this means that Xen will allocate the BDF. I think this will become a
>> problem quite quickly as some of the PCI may need to be assigned at a specific
>> vBDF (I have the intel graphic card in mind).
>>
>> Also, xl allows you to specificy the slot (e.g. <bdf>@<vslot>) which would not
>> work with this approach.
>>
>> For dom0less passthrough, I feel the virtual BDF should always be specified in
>> device-tree. When a domain is created after boot, then I think you want to
>> support <bdf>@<vslot> where <vslot> is optional.
> 
> Hi Julien,
> 
> I also think there should be a way to specify the virtual BDF, but if
> possible (meaning: it is not super difficult to implement) I think it
> would be very convenient if we could let Xen pick whatever virtual BDF
> Xen wants when the user doesn't specify the virtual BDF. That's
> because it would make it easier to specify the configuration for the
> user. Typically the user doesn't care about the virtual BDF, only to
> expose a specific host device to the VM. There are exceptions of course
> and that's why I think we should also have a way for the user to
> request a specific virtual BDF. One of these exceptions are integrated
> GPUs: the OS drivers used to have hardcoded BDFs. So it wouldn't work if
> the device shows up at a different virtual BDF compared to the host.

If you let Xen allocating the vBDF, then wouldn't you need a way to tell 
the toolstack/Device Models which vBDF was allocated?

> 
> Thinking more about this, one way to simplify the problem would be if we
> always reuse the physical BDF as virtual BDF for passthrough devices. I
> think that would solve the problem and makes it much more unlikely to
> run into drivers bugs.

This works so long you have only one physical segment (i.e. hostbridge). 
If you have multiple one, then you either have to expose multiple 
hostbridge to the guest (which is not great) or need someone to allocate 
the vBDF.

> 
> And we allocate a "special" virtual BDF space for emulated devices, with
> the Root Complex still emulated in Xen. For instance, we could reserve
> ff:xx:xx.
Hmmm... Wouldn't this means reserving ECAM space for 256 buses? 
Obviously, we could use 5 (just as random number). Yet, it still 
requires to reserve more memory than necessary.

 > and in case of clashes we could refuse to continue.

Urgh. And what would be the solution users triggering this clash?

> Or we could
> allocate the first free virtual BDF, after all the pasthrough devices.

This is only works if you don't want to support PCI hotplug. It may not 
be a thing for embedded, but it is used by cloud. So you need a 
mechanism that works with hotplug as well.

> 
> Example:
> - the user wants to assign physical 00:11.5 and b3:00.1 to the guest
> - Xen create virtual BDFs 00:11.5 and b3:00.1 for the passthrough devices
> - Xen allocates the next virtual BDF for emulated devices: b4:xx.x
> - If more virtual BDFs are needed for emulated devices, Xen allocates
>    b5:xx.x >
> I still think, no matter the BDF allocation scheme, that we should try
> to avoid as much as possible to have two different PCI Root Complex
> emulators. Ideally we would have only one PCI Root Complex emulated by
> Xen. Having 2 PCI Root Complexes both of them emulated by Xen would be
> tolerable but not ideal. The worst case I would like to avoid is to have
> two PCI Root Complexes, one emulated by Xen and one emulated by QEMU.

So while I agree that one emulated hostbridge is the best solution, I 
don't think your proposal would work. As I wrote above, you may have a 
system with multiple physical hostbridge. It would not be possible to 
assign two PCI devices with the same BDF but from different segment.

I agree unlikely, but if we can avoid it then it would be best. There 
are one scheme which fits that:
   1. If the vBDF is not specified, then pick a free one.
   2. Otherwise check if the specified vBDF is free. If not return an error.

This scheme should be used for both virtual and physical. This is pretty 
much the algorithm used by QEMU today. It works, so what's would be the 
benefits to do something different?

Cheers,

-- 
Julien Grall

