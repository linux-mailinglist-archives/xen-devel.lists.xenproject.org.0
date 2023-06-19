Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F21A4735C66
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 18:46:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551234.860662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBHzn-0000dj-VE; Mon, 19 Jun 2023 16:44:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551234.860662; Mon, 19 Jun 2023 16:44:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBHzn-0000bH-S7; Mon, 19 Jun 2023 16:44:51 +0000
Received: by outflank-mailman (input) for mailman id 551234;
 Mon, 19 Jun 2023 16:44:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qBHzn-0000bB-2h
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 16:44:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBHzm-0002KE-DU; Mon, 19 Jun 2023 16:44:50 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.19.123]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBHzm-0001BH-6q; Mon, 19 Jun 2023 16:44:50 +0000
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
	bh=umW3q2seHvBIDkps6QnqeWIitqomkKclRhKgyNkuEqQ=; b=G/H/zAiwJyoBY/g4YsMxbHmsgs
	jPUVj0ltZJTA8QuXwPxVzkpqWC7zgn0bEEUJWzaCVq6FHpkmSmTN4sg6+laBsMGS73RqTs1K88Xz0
	Ii9MStDS5CJXrtkjcvcTEQb6FdUjN7t79Ird9XWPZ+G++Yk/kGX9yrWfLdmexZTGYDyc=;
Message-ID: <059e5cd2-ed7c-769f-5418-e4224e18881c@xen.org>
Date: Mon, 19 Jun 2023 17:44:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 2/4] xen: Add files needed for minimal ppc64le build
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1686936278.git.sanastasio@raptorengineering.com>
 <97a72e26edafb1d7b3a583755f015d04066c1e53.1686936278.git.sanastasio@raptorengineering.com>
 <8383dd1a-064c-17c9-bb7f-4509518b9b42@citrix.com>
 <85e5d7ca-e6e1-3802-22ac-5728a03fd86d@raptorengineering.com>
 <9258a65b-c980-9b0f-e704-c51d83db4ce8@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9258a65b-c980-9b0f-e704-c51d83db4ce8@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 19/06/2023 17:25, Andrew Cooper wrote:
> On 19/06/2023 4:49 pm, Shawn Anastasio wrote:
>> On 6/16/23 3:24 PM, Andrew Cooper wrote:
>>> On 16/06/2023 6:48 pm, Shawn Anastasio wrote:
>>>> Add the build system changes required to build for ppc64le (POWER8+).
>>>> As of now the resulting image simply boots to an infinite loop.
>>>>
>>>> $ make XEN_TARGET_ARCH=ppc64 -C xen openpower_defconfig
>>>> $ make XEN_TARGET_ARCH=ppc64 SUBSYSTEMS=xen -C xen build
>>> I think the first of these isn't needed, given the config ARCH_DEFCONFIG
>>> default.  I'd suggest dropping it.
>> It seems like the build system expects an `$(ARCH)_defconfig` present if
>> you don't manually specify a defconfig target. I see riscv64 has a
>> tiny64_defconfig and a riscv64_defconfig that are idential, probably for
>> this same reason. Would you like me to take the same approach of
>> duplicating openpower_defconfig to ppc64_defconfig?
> 
> Or just rename openpower_defconfig to ppc64_defconfig ?
> 
> Is there any reason to keep openpower differently?
> 
>>> If that's not feasible, then fine, but if it is, it ought to be the
>>> default.  Which might be as simple as saying "or later" somewhere in
>>> this text, or might be a giant can of worms that I shouldn't open...
>> Originally the help text for the two ISA config options ended in a "+"
>> but that was deemed ambiguous. Would adding "or later" to the help text
>> for the two options clarify it sufficiently?
> 
> Yeah, that would definitely help.
> 
>>>> diff --git a/xen/arch/ppc/include/asm/page-bits.h b/xen/arch/ppc/include/asm/page-bits.h
>>>> new file mode 100644
>>>> index 0000000000..4c01bf9716
>>>> --- /dev/null
>>>> +++ b/xen/arch/ppc/include/asm/page-bits.h
>>>> @@ -0,0 +1,7 @@
>>>> +#ifndef __PPC_PAGE_BITS_H__
>>>> +#define __PPC_PAGE_BITS_H__
>>>> +
>>>> +#define PAGE_SHIFT              16 /* 64 KiB Pages */
>>>> +#define PADDR_BITS              48
>>> Is 64k the minimum granularity?  Or is 4k an option?
>> Both 4K and 64K are supported by the hardware.
>>
>>> I ask because Xen has some very short sighted ABIs which we're still
>>> working on removing.  There are still quite a few expectations of
>>> PAGE_SHIFT being 12.
>>>
>>> To be clear, we're looking to fix all of these ABIs, but I suspect it
>>> will be an easier lift to begin with at 4k.  (Or perhaps the right thing
>>> is to double down and just get them fixed.)
>> Interesting. Given this I'm inclined to go with 4k just to reduce pain
>> points during initial bring up, though supporting 64k would definitely
>> be desirable going forward.
> 
> Maybe keep as 64k for now, with 4k as a backup if major problems are
> encountered?
> 
> I honestly don't know how much of Xen's common code is non-4k-clean, and
> this is the best opportunity to find out.

The hypervisor itself is probably alright. For the tools and the kernel, 
we did some work a few years ago so the code don't assume the kernel and 
the hypervisor are using the same page size.

The tools and kernel have hardcoded expectation for the tools. Have a 
look at XC_PAGE_SIZE (tools) and XEN_PAGE_SHIFT (linux).

There was an attempt from Costin Lupu a couple of years ago to clean-up 
the definition (see [1]) but this was never merged. I can't remember why...

Now regarding the default page-size for PPC. At the moment, the 
page-size of the ABI is tie to the hypervisor.

For the ABI, it is best to use the bigger size (i.e. 64KB) because with 
just some rework in the hypervisor, you could run the same guest image 
on both a 4KB and 64KB.

Therefore, I think the 64KB size for the hypervisor is probably the 
better choice for the initial port. This will avoid some external ABI 
issue in the future if you want to support more page-size (we have the 
problem on Arm as we started with 4KB). You would also not rely on a 
newer ABI.

Cheers,

[1] 
https://lore.kernel.org/xen-devel/cover.1628519855.git.costin.lupu@cs.pub.ro/

-- 
Julien Grall

