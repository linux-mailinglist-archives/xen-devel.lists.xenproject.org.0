Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4EE5FF976
	for <lists+xen-devel@lfdr.de>; Sat, 15 Oct 2022 11:29:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.423361.670042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojdSu-0006Ox-GX; Sat, 15 Oct 2022 09:28:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 423361.670042; Sat, 15 Oct 2022 09:28:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojdSu-0006Me-DO; Sat, 15 Oct 2022 09:28:20 +0000
Received: by outflank-mailman (input) for mailman id 423361;
 Sat, 15 Oct 2022 09:28:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ojdSs-0006MF-Su
 for xen-devel@lists.xenproject.org; Sat, 15 Oct 2022 09:28:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ojdSo-0006GA-3b; Sat, 15 Oct 2022 09:28:14 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ojdSn-0006y8-Sd; Sat, 15 Oct 2022 09:28:14 +0000
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
	bh=EU66632BftsRItb1s5d2r5oE8T7yAs3KaKi+4rjg774=; b=YsHcfO41OUwjOaFeZuugufad3N
	taM7Uuj9R2huez26eES+WFxkRYXQ4Duh5XEC9Oa7pwLdduYsAyrEeLucwK/CWWfbhwcFvfuDK42QI
	+bA9fgb7W9QKTv4HG5bn9uryTpt93CwOrwtkcjSU1rqCrZLippBShFZtk0UEJNr0e/9A=;
Message-ID: <e5e337cc-9478-e4d5-e7ce-71138817f56e@xen.org>
Date: Sat, 15 Oct 2022 10:28:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
To: Stefano Stabellini <sstabellini@kernel.org>,
 Ayan Kumar Halder <ayankuma@amd.com>
Cc: "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 bertrand Marquis <Bertrand.Marquis@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>, Penny Zheng <Penny.Zheng@arm.com>,
 Jaxson Han <jaxson.han@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e2d041b2-3b38-f19b-2d8e-3a255b0ac07e@amd.com>
 <alpine.DEB.2.22.394.2210141109400.3690179@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
Subject: Re: Need guidance to support reading GICR_TYPER (64 bit register) on
 Aarch32_v8r
In-Reply-To: <alpine.DEB.2.22.394.2210141109400.3690179@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 14/10/2022 19:09, Stefano Stabellini wrote:
> On Thu, 13 Oct 2022, Ayan Kumar Halder wrote:
>> Hi Arm mantainers/Folks,
>>
>> Please refer to the discussion
>> https://github.com/zephyrproject-rtos/zephyr/pull/51163 .
>>
>> We intend to run Zephyr as a domU guest on Xen on Aarch32_v8R fixed virtual
>> platform.
>>
>> Zephyr is trying to read GICR_TYPER which is a 64 bit register using ldrd
>> instruction.
>>
>> As GICR is emulated by Xen, so this instruction gets trapped with HSR =
>> 0x9200000c.
>>
>> As ISV is 0, so Xen cannot emulate this instruction.
>>
>> The proposed solution is to use two sys_read32() on GICR_TYPER to return the
>> lower and upper 32 bits.
>>
>> With this, HSR = 0x9383 000c, ISV=1 so ISS is valid.
> 
> Hi all,
> 
> I wanted to take a step back on this issue before we jump into the
> details.
> 
> 
> Differently from other instructions we discussed in the past, strd and ldrd
> are not deprecated and are not "unusual corner cases". There is no
> statements such as "please don't use this" on the ARM ARM. If I were to
> write an register read/write function in assembly for an RTOS, it would
> be reasonable to use them.

Just to be clear it is fine to use the ldrd/strd for accessing non MMIO 
area. The problem comes with MMIO access because they can be emulated by 
the hypervisor and we don't have the syndrome. At the moment, this is 
only a problem when accessing some of the GICv3 (including ITS) registers.

> 
> So, I struggle to see how we'll be able to deal with all the possible
> RTOSes out there that might have them in the code. We can fix Zephyr,
> but what about FreeRTOS, ThreadX and the proprietary ones (VxWorks,
> etc.)?

This is not an Xen issue but architecture issue. The RTOSes will face 
the exact same issue on any hypervisors unless they decided to decode 
the instruction.

As we discussed before decoding an instruction correctly is quite 
difficult to do (what we have in Xen for pos-increment store/load is 
just a band-aid). So I would expect the other hypervisors to have made 
the decision to not implement it. AFAIK KVM doesn't suppor them,
Note that looking at ID_ISAR2, it seems that ldrd/strd is technically 
optional. Therefore, the RTOS would have to assume it is targeting a 
processor that supports them.

> 
> Unless we can get ARM to issue a clear guidance that strd and ldrd are
> deprecated, 

Arm Arm cannot say that because ldrd/strd are necessary to modify the 
LPAE page-tables atomically. What we need to know is which instructions 
can be allowed on MMIO accesses.

I think I already raised that when Ayan added decoding for 
post-increment instructions. There are plenty of instructions (or 
combinations) that doesn't provide a syndrome and yet the processor 
doesn't prevent anyone to use them on MMIO.

I was worry we are going to have to continue to decode instructions in a 
non-compliant way in Xen just to please a few RTOs that may not even run 
anywhere else.

This would also reduce our leverage to request a change in the RTOes or 
the Arm Arm (maybe there is already a statement I haven't spotted) 
because Xen will already (badly) support the instruction.

> I think it would be better to attempt to decode them rather
> than just fail. I don't like to have this kind of code in Xen, but I
> don't see a way to support R52s without it.
That's not specific to R52. This is anyone using GICv3 on Arm32 core.

> 
> That said, of course if Zephyr was to use two 32-bit reads instead of
> one 64-bit read, it would be better for Xen. And we have more important
> things to deal with right now in terms of R52 support (it is not even
> upstream yet). So it is totally fine to change Zephyr and move forward
> for now.
> 
> But medium term it doesn't seem to me that we can get away without a
> solution in Xen for this (or a change in the ARM ARM).

See above. This is an architecture problem and we should discuss with 
Arm first before continuing to add more decoding in Xen.

Cheers,

-- 
Julien Grall

