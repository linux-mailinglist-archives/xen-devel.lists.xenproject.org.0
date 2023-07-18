Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 013F575881C
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 00:04:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565520.883727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLsnT-0001gY-RO; Tue, 18 Jul 2023 22:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565520.883727; Tue, 18 Jul 2023 22:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLsnT-0001eL-N3; Tue, 18 Jul 2023 22:03:55 +0000
Received: by outflank-mailman (input) for mailman id 565520;
 Tue, 18 Jul 2023 22:03:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qLsnR-0001eE-Nr
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 22:03:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLsnR-0006Cj-Js; Tue, 18 Jul 2023 22:03:53 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLsnR-0001MN-F1; Tue, 18 Jul 2023 22:03:53 +0000
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
	bh=tYj57VRNKW4aJQspe4wERb/q2tgkX1f0EjgA2qD+dAk=; b=fRIpBjBd1ZIJiATwowrF4wlZmp
	ps/l/TBcxBj9K6iIls600VUZaaxlEBlWwOrW9rNFU4As+VkPdxvZVEM94WM7yaLOZ5KKSkKYksfQ1
	RdTCc7oM4ndEv8f6qIlYzczkNMmNSiw+s/t/iIwci8V1NJDe2d5O7FeibYxNy9OBIDyk=;
Message-ID: <67bcdc0c-ad4f-43f7-d9ab-f11f937bfe87@xen.org>
Date: Tue, 18 Jul 2023 23:03:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
To: Ayan Kumar Halder <ayankuma@amd.com>, Michal Simek
 <michal.simek@amd.com>, "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Michal Orzel <michal.orzel@amd.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "Garhwal, Vikram" <vikram.garhwal@amd.com>, Xenia.Ragiadakou@amd.com
References: <8929cafc-ea9c-35c9-e4a4-3c7ad2d1acc1@amd.com>
 <b60f4cb0-2a82-4227-de23-c59436cb47ef@amd.com>
 <9dd7e04e-92d9-bd90-dd66-0f8eefefc4a8@amd.com>
From: Julien Grall <julien@xen.org>
Subject: Re: U-Boot on XEN - dcache off
In-Reply-To: <9dd7e04e-92d9-bd90-dd66-0f8eefefc4a8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 17/07/2023 16:31, Ayan Kumar Halder wrote:
> + xen-devel (Since the question is related to Xen on Arm in general).
> On 14/07/2023 15:14, Michal Simek wrote:
>> +xen
>>
>> On 7/14/23 16:11, Michal Simek wrote:
>>> Hi Stefano,
>>>
>>> I am playing with running u-boot on the top of xen 
>>> (xenguest_arm64_defconfig) based on ask from Kris to run QNX on the 
>>> top of it.
>>> In past we found that QNX requires to have DCACHE off before it's start.
>>> Chris found in past that dcache off is not working and he passed this 
>>> to us to take look at it more.

Xen will not prevent the guest to turn off D-cache. BTW, on Armv8, the 
cache is never really off, it is just by-passed. So a guest running with 
MMU/D-Cache off has to be a lot more careful when writing/reading data.

>>>
>>> That's why I enabled cache commands to be able to run dcache off and 
>>> see the hang as Kris.

Can you provide more details on the hang? What is QNX trying to do? 
What's the instruction it is blocked on?

Also, which version of Xen are you using?

>>> I found one interesting commit created by Marc for Android which were 
>>> taken back to u-boot upstream. It is talking about KVM and I barely 
>>> understand what he is talking about.
>>> I of course enabled this option to try it and behavior is the same.
>>> That's why my question is what Xen is doing in connection to dcache 
>>> operations.
> 
> WRT cache operations, Refer 
> https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=53b705d02cec03861044e673536586bd1b2443bd
> 
> When the data abort is caused due to cache maintenance for an address,
> there are three scenarios:-

I might be missing some context. From my understanding, Michal is 
referring an hang. This may or may not be a data abort. Do you have more 
details you could share?

[...]

>>>
>>>
>>> commit 46dc54287031759c03c68902283d92076938305c
>>> Author:     Marc Zyngier <maz@kernel.org>
>>> AuthorDate: Thu Feb 9 04:54:27 2023 +0800
>>> Commit:     Tom Rini <trini@konsulko.com>
>>> CommitDate: Mon Mar 6 17:03:55 2023 -0500
>>>
>>>      arm: cpu: Add optional CMOs by VA
>>>
>>>      Exposing set/way cache maintenance to a virtual machine is 
>>> unsafe, not
>>>      least because the instructions are not permission-checked but also
>>>      because they are not broadcast between CPUs. Consequently, KVM 
>>> traps and
>>>      emulates such maintenance in the host kernel using by-VA operations 
> 
> I am not sure if Xen behave in same way (ie traps and emulates *all* 
> cache maintenance instructions).
> 
> @Julien, Stefano, Bertrand - Do you know more about this ?

Xen will emulate set/way instructions only when the P2M is not shared 
with the IOMMU (i.e there is no device passthrough for Arm). Otherwise, 
a fault will be injected to the domain. Even when emulating, the 
performance will be quite bad, so it is best to avoid them all together.

By any chance, are you passthrough-ing a device and QNX is using set/way?

> 
>>> and
>>>      looping over the stage-2 page-tables. However, when running under
>>>      protected KVM, these instructions are not able to be emulated 
>>> and will
>>>      instead result in an exception being delivered to the guest.
>>>
>>>      Introduce CONFIG_CMO_BY_VA_ONLY so that virtual platforms can 
>>> select
>>>      this option and perform by-VA cache maintenance instead of using 
>>> the
>>>      set/way instructions.
>>>
>>>      Signed-off-by: Marc Zyngier <maz@kernel.org>
>>>      Signed-off-by: Will Deacon <willdeacon@google.com>
>>>      Signed-off-by: Pierre-Clément Tosi <ptosi@google.com>
>>>      [ Paul: pick from the Android tree. Fixup Pierre's commit. And 
>>> fix some
>>>        checkpatch warnings. Rebased to upstream. ]
>>>      Signed-off-by: Ying-Chun Liu (PaulLiu) <paul.liu@linaro.org>
>>>      Cc: Tom Rini <trini@konsulko.com>
>>>      Link: 
>>> https://android.googlesource.com/platform/external/u-boot/+/db5507f47f4f57f766d52f753ff2cc761afc213b
>>>      Link: 
>>> https://android.googlesource.com/platform/external/u-boot/+/2baf54e743380a1e4a6bc2dbdde020a2e783ff67
>>>
>>>
>>> Code ends when it tries to call
>>> set_sctlr(sctlr & ~(CR_C|CR_M));
>>>
>>> Here is implementation. I confirm EL level which is obviously EL1.
>>>
>>> 180 static inline void set_sctlr(unsigned long val)
>>> 181 {
>>> 182         unsigned int el;
>>> 183
>>> 184         el = current_el();
>>> 185         if (el == 1)
>>> 186                 asm volatile("msr sctlr_el1, %0" : : "r" (val) : 
>>> "cc");
>>> 187         else if (el == 2)
>>> 188                 asm volatile("msr sctlr_el2, %0" : : "r" (val) : 
>>> "cc");
>>> 189         else
>>> 190                 asm volatile("msr sctlr_el3, %0" : : "r" (val) : 
>>> "cc");
>>> 191
>>> 192         asm volatile("isb");
>>> 193 }
>>>
>>> Is there any reason why it is not possible to clear to sctlr_el1 
>>> CR_C/CR_M - cache disabling, MMU disabling?

I am not sure I understand the question. The code '& ~(CR_C|CR_M)' which 
means all the bits but C/M will be cleared. IOW, the cache will be 
disabled and the MMU disabled as well.

IIUC, above you said, this is what QNX requires.

Cheers,

-- 
Julien Grall

