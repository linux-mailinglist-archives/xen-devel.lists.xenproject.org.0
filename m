Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFEA243E4B
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 19:28:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6H1m-0005T1-IC; Thu, 13 Aug 2020 17:28:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6jG6=BX=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k6H1k-0005Sw-Sf
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 17:28:32 +0000
X-Inumbo-ID: a2916247-3088-4053-b6b9-2e54cc5fdd47
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a2916247-3088-4053-b6b9-2e54cc5fdd47;
 Thu, 13 Aug 2020 17:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=LjsujQdk2W39YbdWo/KhJ8c9RfjeQzjlq6kQ4rAaMDw=; b=ovySldfdJmQ25AP57TjliRKy2M
 p6zcrdh1yQwOIvzMBPSqOYR1IKFVB8S+LMt0IfMq5ER+5BTzQccrvF046Dk2kA/+IjUQxDV1Dqcls
 3pf3c1SQ14ksiRDPIjYPfXgs5dx2p2MhzVC1dQiGmeAifEqZ8HGFZK6YcSpq4mC9fdEw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k6H1f-0007FE-Uy; Thu, 13 Aug 2020 17:28:27 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k6H1f-0002sR-Fg; Thu, 13 Aug 2020 17:28:27 +0000
Subject: Re: [PATCH v3] xen/arm: Convert runstate address during hypcall
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <3911d221ce9ed73611b93aa437b9ca227d6aa201.1596099067.git.bertrand.marquis@arm.com>
 <f48f81d5-589e-3f75-1044-583114bf497e@xen.org>
 <DF7D0DF3-F494-4F1B-9877-E7B2A8BAAC3B@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a41e7c14-52e0-d1e4-6ff5-6ca806ff2d03@xen.org>
Date: Thu, 13 Aug 2020 18:28:25 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <DF7D0DF3-F494-4F1B-9877-E7B2A8BAAC3B@arm.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Bertrand,

On 31/07/2020 14:16, Bertrand Marquis wrote:
> 
> 
>> On 30 Jul 2020, at 22:50, Julien Grall <julien@xen.org> wrote:
>> On 30/07/2020 11:24, Bertrand Marquis wrote:
>>> At the moment on Arm, a Linux guest running with KTPI enabled will
>>> cause the following error when a context switch happens in user mode:
>>> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0cd0
>>> The error is caused by the virtual address for the runstate area
>>> registered by the guest only being accessible when the guest is running
>>> in kernel space when KPTI is enabled.
>>> To solve this issue, this patch is doing the translation from virtual
>>> address to physical address during the hypercall and mapping the
>>> required pages using vmap. This is removing the conversion from virtual
>>> to physical address during the context switch which is solving the
>>> problem with KPTI.
>>
>> To echo what Jan said on the previous version, this is a change in a stable ABI and therefore may break existing guest. FAOD, I agree in principle with the idea. However, we want to explain why breaking the ABI is the *only* viable solution.
>>
>>  From my understanding, it is not possible to fix without an ABI breakage because the hypervisor doesn't know when the guest will switch back from userspace to kernel space. The risk is the information provided by the runstate wouldn't contain accurate information and could affect how the guest handle stolen time.
>>
>> Additionally there are a few issues with the current interface:
>>    1) It is assuming the virtual address cannot be re-used by the userspace. Thanksfully Linux have a split address space. But this may change with KPTI in place.
>>    2) When update the page-tables, the guest has to go through an invalid mapping. So the translation may fail at any point.
>>
>> IOW, the existing interface can lead to random memory corruption and inacurracy of the stolen time.
> 
> I agree but i am not sure what you want me to do here.
> Should i add more details in the commit message ?
> 
>>
>>> This is done only on arm architecture, the behaviour on x86 is not
>>> modified by this patch and the address conversion is done as before
>>> during each context switch.
>>> This is introducing several limitations in comparison to the previous
>>> behaviour (on arm only):
>>> - if the guest is remapping the area at a different physical address Xen
>>> will continue to update the area at the previous physical address. As
>>> the area is in kernel space and usually defined as a global variable this
>>> is something which is believed not to happen. If this is required by a
>>> guest, it will have to call the hypercall with the new area (even if it
>>> is at the same virtual address).
>>> - the area needs to be mapped during the hypercall. For the same reasons
>>> as for the previous case, even if the area is registered for a different
>>> vcpu. It is believed that registering an area using a virtual address
>>> unmapped is not something done.
>>
>> This is not clear whether the virtual address refer to the current vCPU or the vCPU you register the runstate for. From the past discussion, I think you refer to the former. It would be good to clarify.
> 
> Ok i will try to clarify.
> 
>>
>> Additionally, all the new restrictions should be documented in the public interface. So an OS developper can find the differences between the architectures.
>>
>> To answer Jan's concern, we certainly don't know all the guest OSes existing, however we also need to balance the benefit for a large majority of the users.
>>
>>  From previous discussion, the current approach was deemed to be acceptable on Arm and, AFAICT, also x86 (see [1]).
>>
>> TBH, I would rather see the approach to be common. For that, we would an agreement from Andrew and Jan in the approach here. Meanwhile, I think this is the best approach to address the concern from Arm users.
> 
>  From this I get that you want me to document the specific behaviour on Arm on the public header describing the hypercall, right ?

Yes please. The public header is usually where an OS developper will 
look for details. Although, at the moment, the documentation is not very 
great as you often have to dig in Xen code to understand how it is meant 
to work :(. But we are trying to improve that.

Cheers,

-- 
Julien Grall

