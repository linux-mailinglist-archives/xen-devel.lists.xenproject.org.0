Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD934E3FDB
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 14:54:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293484.498584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWewc-00017j-EX; Tue, 22 Mar 2022 13:53:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293484.498584; Tue, 22 Mar 2022 13:53:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWewc-00015I-Ba; Tue, 22 Mar 2022 13:53:06 +0000
Received: by outflank-mailman (input) for mailman id 293484;
 Tue, 22 Mar 2022 13:53:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nWewb-00015C-7g
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 13:53:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWewX-0006wV-Sw; Tue, 22 Mar 2022 13:53:01 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[192.168.19.186]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWewX-0000EA-MB; Tue, 22 Mar 2022 13:53:01 +0000
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
	bh=y3rgVvHHtQdcNR08rOJgwbYdpB9j31IhmtAa9mFolMA=; b=V8UjSjmo1191K1/aMbQ+ufEtmS
	LQpMbgY+7wyj7b7BwQWY0h/RPl6KZeJnMGf9A70a1H6Czxk2/n9N4xnhO3suFoB3Ye79yBVuQOjzJ
	mpJadeuFcYPwC0SU1qNsL6GjFQEzyrr+izZHWnbcy8tvp6Fppu8EinF/RODe7JsT3jyI=;
Message-ID: <083b288c-77c8-5746-fe49-267bf120a139@xen.org>
Date: Tue, 22 Mar 2022 13:52:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] xen/arm: skip first 32 bytes of zimage32
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220320010509.3605525-1-sstabellini@kernel.org>
 <33f1ea14-4486-be3d-ca9f-a82274078dba@xen.org>
 <1a8ed108-7485-1ed5-3819-fd921164662b@xen.org>
 <alpine.DEB.2.22.394.2203211214030.2910984@ubuntu-linux-20-04-desktop>
 <3d4194b2-b5e8-2fde-6000-9fd4674297ac@xen.org>
 <alpine.DEB.2.22.394.2203211442540.2910984@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2203211442540.2910984@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 21/03/2022 22:07, Stefano Stabellini wrote:
> On Mon, 21 Mar 2022, Julien Grall wrote:
>>> This is the list of kernels that I tried and failed:
>>>
>>> - Debian Buster
>>> - Debian Bullseye
>>> - vanilla 4.9
>>> - vanilla 4.10
>>
>> Does this mean you where using v4.{9,10}.0 rather than the stable branch?
>>
>> Note that AFAICT, 4.10 is not even supported by the kernel communinty (see
>> [1]).
> 
> Yeah... I was trying to bisect the Debian kernel failure. That is how I
> discovered that CONFIG_EFI was causing it. So yes, I only tried the
> vanilla, now unsupported, releases.
> 
> 
>>> The latest Alpine Linux kernel also doesn't boot, but that one doesn't
>>> boot even with the fix for other reason. (More in the other email.)
>>>
>>>
>>>   From a Xen gitlab-ci perspective, we just need a kernel that works.
>>> Ideally, we wouldn't rebuild our own but reuse an existing kernel
>>> because that is one less things to maintain in the gitlab-ci build.
>>>
>>> We have a couple of options to make progress on the QEMU32 gitlab-ci
>>> test:
>>>
>>> 1) use Debian Jessie in gitlab-ci and do not commit the Xen-side fix,
>>>      file a Debian bug and revisit the situation in a couple of months
>>>      (Debian might get the fix in the meantime)
>>
>> Why do we need to use Debian here? Couldn't we use Ubuntu (or any distros that
>> have a newer kernel)?
> 
> We could use something else but see below.
> 
> 
>>> 2) commit the Xen fix and use Debian Bullseye right now
>>>
>>> 3) do not commit the Xen fix and build our own kernel now
>>>
>>>
>>> All of these options work. My preference is 1) or 2).
>>>
>>> Between 1) and 2) I have a slight preference for 2) for this reason: I
>>> know that in Open Source we try to fix bugs wherever they are (kernel
>>> project, QEMU project, Debian project) rather than working around them,
>>> but in this case it looks like there is a significant amount of binaries
>>> out there that require an update before they can boot on Xen.
>>
>> My problem here is the bug is not Xen specific. You would exactly have the
>> same problem if you were booting on baremetal. But as Andre wrote in his
>> commit message, this is only working by luck.
>>
>> So we are setting another bad precendence by preserving the luck.
>>
>> I appreciate we recently agreed to merge the code to emulate ldr/str. But this
>> was based on the fact the Arm Arm doesn't clearly forbid such access. This is
>> quite different here as the instructions are UNDEFINED.
> 
> Yeah, I understand your point and I also kind of agree.
> 
> 
>> So I am not willing to accept a lot of code in Xen just to workaround a
>> software bug (see more below).
>>
>>> I think it
>>> is one of those times where it is worth considering the Xen fix, or
>>> should I say workaround, if it is considered harmless.
>>
>> The problem with your workaround is now the zImage will be loaded in a
>> different aligned. For instance, if the symbol <foo> was 2MB aligned, now, it
>> will be aligned to 2MB - 32. See kernel_zimage_load().
>>
>> The booting protocol (see Documentation/arm/booting.rst). Doesn't look to
>> impose an alignment. But I wouldn't be surprised if there is an assumption
>> here.
>>
>> Furthermore, there are some problem if the kernel is expected to be loaded a
>> specific address.
>>
>> I do expect the code to become more convoluted. This would also have to be
>> duplicated in the tools side. Overall, this will likely be more than I am
>> willing to accept for this issue.
>>
>> Therefore I would like to suggest a more simple workaround. Per the commit
>> message of the Linux bug fix, U-boot and direct loading are not affected
>> because the bit "Z" is set.
>>
>> So how about updating PSR_GUEST32_INIT to set Z?
> 
> That worked! Excellent suggestion and much safer than the 32 byte
> workaround. I tested with the Debian Bullseye kernel.

I would not say it is safer because we will be relying on the processor 
(here QEMU) to check the condition and ignore the UNPREDICTABLE 
behavior. So, in theory, the issue could reappear on a new processor. 
Note that I haven't checked what the Arm Arm says here.

But the workaround is less intrusive. Hence, why I prefer this approach.

> 
> I think you might have a better suggestion for the commit message.
> 
> ---
> xen/arm: set CPSR Z bit when creating aarch32 guests
> 
> The first 32 bytes of zImage32 are NOPs. When CONFIG_EFI is enabled in

The format is zImage not zImage32.

> the kernel, certain versions of Linux have a bug in the way the initial
> NOP instructions gets encoded (invalid encoding), resulting in an
> unbootable kernel.

This paragraph is a bit difficult to understand. I would say "certain 
version of Linux will use a UNPREDICATABLE NOP encoding".

Also, I would suggest make clear that the issue depends on the processor.

  See commit a92882a4d270 in the Linux kernel for all
> the details.
> 
> All kernel releases starting from Linux 4.9 without commit a92882a4d270
> are affected.
> 
> Fortunately there is a simple workaround: setting the "Z" bit in CPSR
> make it so those invalid  NOP instructions are never executed.

I would say that the instruction is conditional (not equal). So, on QEMU 
at least, the instruction will end up to be ignored and not generate an 
UNDEFINED (XXX this needs to be checked).

> Setting
> the "Z" bit makes those kernel versions bootable again and it is
> harmless in the other cases.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index 94b31511dd..309684e946 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -361,6 +361,7 @@ typedef uint64_t xen_callback_t;
>   #define PSR_DBG_MASK    (1<<9)        /* arm64: Debug Exception mask */
>   #define PSR_IT_MASK     (0x0600fc00)  /* Thumb If-Then Mask */
>   #define PSR_JAZELLE     (1<<24)       /* Jazelle Mode */
> +#define PSR_Z           (1<<30)       /* Zero condition flag */
>   
>   /* 32 bit modes */
>   #define PSR_MODE_USR 0x10
> @@ -383,7 +384,7 @@ typedef uint64_t xen_callback_t;
>   #define PSR_MODE_EL1t 0x04
>   #define PSR_MODE_EL0t 0x00
>   
> -#define PSR_GUEST32_INIT  (PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MASK|PSR_MODE_SVC)
> +#define PSR_GUEST32_INIT  (PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MASK|PSR_MODE_SVC|PSR_Z)

The flags are set from the highest to the lowest bit. I would like to 
keep it like that as it helps to match with the Arm Arm. So can you move 
PSR_Z to the beginning?

Also, please add a comment in on top of PSR_GUEST32_INIT explaining why 
we set Z.

>   #define PSR_GUEST64_INIT (PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MASK|PSR_MODE_EL1h)
>   
>   #define SCTLR_GUEST_INIT    xen_mk_ullong(0x00c50078)

Cheers,

-- 
Julien Grall

