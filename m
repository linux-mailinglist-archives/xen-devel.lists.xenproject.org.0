Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE504E31B7
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 21:27:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293203.498015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWOcd-00037c-4G; Mon, 21 Mar 2022 20:27:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293203.498015; Mon, 21 Mar 2022 20:27:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWOcc-00034i-WA; Mon, 21 Mar 2022 20:27:22 +0000
Received: by outflank-mailman (input) for mailman id 293203;
 Mon, 21 Mar 2022 20:27:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nWOcb-00034c-Oe
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 20:27:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWOcY-0006xL-Hs; Mon, 21 Mar 2022 20:27:18 +0000
Received: from [54.239.6.185] (helo=[192.168.25.135])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWOcY-0000lC-BP; Mon, 21 Mar 2022 20:27:18 +0000
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
	bh=8X3s5YKvHfAAuNh3cyTBQ1khdOsGQ1F1LU3U/TNbMtM=; b=3H5HeUxbbv8O7mBWNVqyfVM4vm
	5wyOiIx2mTqFDi8a8Zf9IVYCgu3/VfyBBVE4IQx8VqTXtSco+MoKb5PdTc0AP2iAkh3jZz4S9mIzY
	EaA0e8lik+mrIqElLpymmryMr9/HesuuYFiM0SzYShF8U41XTADy9nh8sNsgebqF1JAU=;
Message-ID: <3d4194b2-b5e8-2fde-6000-9fd4674297ac@xen.org>
Date: Mon, 21 Mar 2022 20:27:16 +0000
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2203211214030.2910984@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 21/03/2022 19:29, Stefano Stabellini wrote:
> On Sun, 20 Mar 2022, Julien Grall wrote:
>> On 20/03/2022 07:47, Julien Grall wrote:
>>> On 20/03/2022 01:05, Stefano Stabellini wrote:
>>>> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>>>
>>>> The first 32 bytes of zImage32 are NOPs, not useful just there for
>>>> compatibility. The reason is that some bootloaders skip the first 32
>>>> bytes when starting the kernel. See the comment in Linux
>>>> arch/arm/boot/compressed/head.S.
>>>
>>> Please mention the Linux verson.
>>>
>>>> Since the introduction of CONFIG_EFI in Linux arm32, those NOPs
>>>> operations have changed implementation from:
>>>>
>>>>       mov r0, r0
>>>>
>>>> to:
>>>>       .inst   MZ_MAGIC | (0x1310 << 16)   @ tstne r0, #0x4d000
>>>
>>> I have duplicated the comment and the instructions below:
>>>
>>>                   @ This is a two-instruction NOP, which happens to bear the
>>>                   @ PE/COFF signature "MZ" in the first two bytes, so the
>>> kernel
>>>                   @ is accepted as an EFI binary. Booting via the UEFI stub
>>>                   @ will not execute those instructions, but the ARM/Linux
>>>                   @ boot protocol does, so we need some NOPs here.
>>>                   .inst   MZ_MAGIC | (0xe225 << 16)       @ eor r5, r5,
>>> 0x4d000
>>>                   eor     r5, r5, 0x4d000                 @ undo previous
>>> insn
>>>
>>>
>>> I read this as they are NOPs and this change should not break the ARM/Linux
>>> boot protocol (we are using it in Xen).
>>>
>>> BTW, the instruction decoding is different compare to me. Which version of
>>> Linux are you using?
>>>
>>>>
>>>> See arch/arm/boot/compressed/efi-header.S.
>>>>
>>>> The new implementation doesn't work on Xen (at least on all versions of
>>>> QEMU I tried).
>>>
>>> As I wrote above, they are NOPs. So why is this breaking?
>>
>> I have tried to boot the latest Linux (commit 14702b3b2438) with CONFIG_EFI=y
>> on QEMU (commit fa435db8ce1d). This booted for me.
>>
>> As I wrote earlier today, the instruction used as NOPs is slightly different.
>> So I had a look at the git history and found the following commit:
>>
>> commit a92882a4d270
>> Author: Andre Przywara <andre.przywara@arm.com>
>> Date:   Mon Nov 22 16:28:43 2021 +0100
>>
>>      ARM: 9159/1: decompressor: Avoid UNPREDICTABLE NOP encoding
>>
>>      In the decompressor's head.S we need to start with an instruction that
>>      is some kind of NOP, but also mimics as the PE/COFF header, when the
>>      kernel is linked as an UEFI application. The clever solution here is
>>      "tstne r0, #0x4d000", which in the worst case just clobbers the
>>      condition flags, and bears the magic "MZ" signature in the lowest 16 bits.
>>
>>      However the encoding used (0x13105a4d) is actually not valid, since bits
>>      [15:12] are supposed to be 0 (written as "(0)" in the ARM ARM).
>>      Violating this is UNPREDICTABLE, and *can* trigger an UNDEFINED
>>      exception. Common Cortex cores seem to ignore those bits, but QEMU
>>      chooses to trap, so the code goes fishing because of a missing exception
>>      handler at this point. We are just saved by the fact that commonly (with
>>      -kernel or when running from U-Boot) the "Z" bit is set, so the
>>      instruction is never executed. See [0] for more details.
>>
>>      To make things more robust and avoid UNPREDICTABLE behaviour in the
>>      kernel code, lets replace this with a "two-instruction NOP":
>>      The first instruction is an exclusive OR, the effect of which the second
>>      instruction reverts. This does not leave any trace, neither in a
>>      register nor in the condition flags. Also it's a perfectly valid
>>      encoding. Kudos to Peter Maydell for coming up with this gem.
>>
>>      [0]
>> https://lore.kernel.org/qemu-devel/YTPIdbUCmwagL5%2FD@os.inf.tu-dresden.de/T/
>>
>>      Link:
>> https://lore.kernel.org/linux-arm-kernel/20210908162617.104962-1-andre.przywara@arm.com/T/
>>
>> So this is a bug in the kernel that has nothing to do with Xen.
>>
>> Therefore, I am not in favor to workaround it in Xen. Where did you get your
>> kernel from? If this from a distro, then please work with them to ingest the
>> above patch.
> 
> Unfortunately all the kernels I tried failed without the Xen fix.
> 
> This is the list of kernels that I tried and failed:
> 
> - Debian Buster
> - Debian Bullseye
> - vanilla 4.9
> - vanilla 4.10

Does this mean you where using v4.{9,10}.0 rather than the stable branch?

Note that AFAICT, 4.10 is not even supported by the kernel communinty 
(see [1]).

> 
> The latest Alpine Linux kernel also doesn't boot, but that one doesn't
> boot even with the fix for other reason. (More in the other email.)
> 
> 
>  From a Xen gitlab-ci perspective, we just need a kernel that works.
> Ideally, we wouldn't rebuild our own but reuse an existing kernel
> because that is one less things to maintain in the gitlab-ci build.
> 
> We have a couple of options to make progress on the QEMU32 gitlab-ci
> test:
> 
> 1) use Debian Jessie in gitlab-ci and do not commit the Xen-side fix,
>     file a Debian bug and revisit the situation in a couple of months
>     (Debian might get the fix in the meantime)

Why do we need to use Debian here? Couldn't we use Ubuntu (or any 
distros that have a newer kernel)?

> 
> 2) commit the Xen fix and use Debian Bullseye right now
> 
> 3) do not commit the Xen fix and build our own kernel now
> 
> 
> All of these options work. My preference is 1) or 2).
> 
> Between 1) and 2) I have a slight preference for 2) for this reason: I
> know that in Open Source we try to fix bugs wherever they are (kernel
> project, QEMU project, Debian project) rather than working around them,
> but in this case it looks like there is a significant amount of binaries
> out there that require an update before they can boot on Xen. 

My problem here is the bug is not Xen specific. You would exactly have 
the same problem if you were booting on baremetal. But as Andre wrote in 
his commit message, this is only working by luck.

So we are setting another bad precendence by preserving the luck.

I appreciate we recently agreed to merge the code to emulate ldr/str. 
But this was based on the fact the Arm Arm doesn't clearly forbid such 
access. This is quite different here as the instructions are UNDEFINED.

So I am not willing to accept a lot of code in Xen just to workaround a 
software bug (see more below).

> I think it
> is one of those times where it is worth considering the Xen fix, or
> should I say workaround, if it is considered harmless.

The problem with your workaround is now the zImage will be loaded in a 
different aligned. For instance, if the symbol <foo> was 2MB aligned, 
now, it will be aligned to 2MB - 32. See kernel_zimage_load().

The booting protocol (see Documentation/arm/booting.rst). Doesn't look 
to impose an alignment. But I wouldn't be surprised if there is an 
assumption here.

Furthermore, there are some problem if the kernel is expected to be 
loaded a specific address.

I do expect the code to become more convoluted. This would also have to 
be duplicated in the tools side. Overall, this will likely be more than 
I am willing to accept for this issue.

Therefore I would like to suggest a more simple workaround. Per the 
commit message of the Linux bug fix, U-boot and direct loading are not 
affected because the bit "Z" is set.

So how about updating PSR_GUEST32_INIT to set Z?

Cheers,

-- 
Julien Grall

