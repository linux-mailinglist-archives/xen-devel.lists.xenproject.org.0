Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D66CF203E5F
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 19:50:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnQZN-0000SB-Pt; Mon, 22 Jun 2020 17:49:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O88q=AD=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jnQZM-0000S6-Jz
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 17:49:20 +0000
X-Inumbo-ID: b3131dca-b4b0-11ea-bca7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3131dca-b4b0-11ea-bca7-bc764e2007e4;
 Mon, 22 Jun 2020 17:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9weotV/SNrMZyG1N1H3/PFtyW42B6wbbtW+YFspt8Zk=; b=insdBMx2bfBXoUpm9PYFijyIXm
 eeMtEfWsUy8zv1zWqnXNBM+nAPhn6zlh1v7+XijiV2m8HB5tu+bywNKAUIboHoi65fEbaHo/KmAy3
 CPTkGwr8VwhtQ2OwGAePrcF67+SBn/0qn9elHyV67x0Tt+UqjJcsZSQm/CBjN81Xjczs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jnQZK-0004RH-37; Mon, 22 Jun 2020 17:49:18 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jnQZJ-0003qH-RY; Mon, 22 Jun 2020 17:49:18 +0000
Subject: Re: UEFI support in ARM DomUs
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall.oss@gmail.com>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <DB6PR0402MB276072324DC3E1E9BD9A96BE88890@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <c3856c1f-52bf-92fd-5226-4b09229e2127@epam.com>
 <alpine.DEB.2.21.2006040829390.6774@sstabellini-ThinkPad-T480s>
 <d6b39cd7-eeaa-f82b-df62-051f9f715968@epam.com>
 <54dcfce1-c401-0581-8620-dc8790209a87@xen.org>
 <alpine.DEB.2.21.2006181444460.14005@sstabellini-ThinkPad-T480s>
 <CAJ=z9a1NtCr1MM7oUBUH3hgc8SL_K9jERy+NQ6pLzxNpGPpXzw@mail.gmail.com>
 <alpine.DEB.2.21.2006191020110.12730@sstabellini-ThinkPad-T480s>
 <c5905f40-6d0a-358f-35e4-239e88ace7d8@epam.com>
 <94bfe57c-c1be-62b4-3799-b90415264487@xen.org>
 <4ece84cf-dd68-6eb4-a0e2-e9008d264ba5@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1a44c645-8c9a-93ce-8466-35c87eb4fca5@xen.org>
Date: Mon, 22 Jun 2020 18:49:15 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <4ece84cf-dd68-6eb4-a0e2-e9008d264ba5@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
 Juergen Gross <jgross@suse.com>, Peng Fan <peng.fan@nxp.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 Roman Shaposhnik <roman@zededa.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 22/06/2020 15:33, Oleksandr Andrushchenko wrote:
> 
> On 6/22/20 5:27 PM, Julien Grall wrote:
>> Hi Oleksandr,
>>
>> On 22/06/2020 15:04, Oleksandr Andrushchenko wrote:
>>> On 6/19/20 11:02 PM, Stefano Stabellini wrote:
>>>> On Thu, 18 Jun 2020, Julien Grall wrote:
>>> ifeq ($(CONFIG_XEN),y)
>>> arch-y += -D__XEN_INTERFACE_VERSION__=0x00040d00
>>> endif
>>>
>>> and we also have Xen 4.13 headers in the U-boot tree.
>>
>> Sorry if this was already asked before. Why do you need to specify __XEN_INTERFACE_VERSION__?
> 
> This is because of include/xen/interface/xen-compat.h:
> 
> #if defined(__XEN__) || defined(__XEN_TOOLS__)
> 
> /* Xen is built with matching headers and implements the latest interface. */
> #define __XEN_INTERFACE_VERSION__ __XEN_LATEST_INTERFACE_VERSION__
> #elif !defined(__XEN_INTERFACE_VERSION__)
> /* Guests which do not specify a version get the legacy interface. */
> #define __XEN_INTERFACE_VERSION__ 0x00000000
> #endif

I am afraid this doesn't explain why you need to define it to a specific 
version.

__XEN_INTERFACE_VERSION__ is really mostly here to allow a guest to 
build if they rely on header from xen.git (we may have done some 
renaming). Most (if not all) the interfaces you care ought to be stable.

Older Xen will return -ENOSYS/-EOPNOTSUPP should deny any values they 
don't know.

As you pull the headers in U-boot, you could safely define 
__XEN_INTERFACE_VERSION__ as __XEN_LATEST_INTERFACE_VERSION__. FWIW, 
this is what Linux is doing to some extend.

Note that I haven't suggested to keep __XEN_INTERFACE_VERSION__ as 
0x00000000 because it looks like it is going to do the wrong thing on 
arm32 :(.

I have at least spot one issue with GNTTABOP_setup_table where it will 
use unsigned long (i.e 32-bit) for older interface. But the hypervisor 
will always 64-bits.

This probably going to result to some overwrite. I think we should fix 
the headers to force it to use xen_pfn_t for all Xen on Arm version.

Something like:

#if !(defined(__arch64__) || defined(__arm__)) && 
__XEN_INTERFACE_VERSION__ < 0x00040300
     XEN_GUEST_HANDLE(ulong) frame_list;
#else
     XEN_GUEST_HANDLE(xen_pfn_t) frame_list;
#endif

> 
> So, one needs to specify the version (QEMU does that via its configure script after
> 
> some tests)

Well libxc is definitely not stable, hence why QEMU requires to specify 
the version. But the interface with the guest is always meant to be stable.

>>
>>>
>>> For the first part (__XEN_INTERFACE_VERSION__) I think we can provide it via
>>>
>>> CFLAGS or something. This can also be done for the location of Xen headers.
>>
>> __XEN_INTERFACE_VERSION__ should work through the CFLAGS. An alternative would be to allow the user to specify through the Kconfig.
> 
> You mean specifying via Kconfig something like "0x00040d00"?

Possibly yes.

> 
> And what about the headers? How will we provide their location if we decide not to include those
> 
> in the tree?

I would do through Kconfig as well.

Cheers,

-- 
Julien Grall

