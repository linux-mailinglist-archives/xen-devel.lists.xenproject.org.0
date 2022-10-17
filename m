Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92666600AA4
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 11:27:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424249.671536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okMP1-0007Xe-Ca; Mon, 17 Oct 2022 09:27:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424249.671536; Mon, 17 Oct 2022 09:27:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okMP1-0007UE-9W; Mon, 17 Oct 2022 09:27:19 +0000
Received: by outflank-mailman (input) for mailman id 424249;
 Mon, 17 Oct 2022 09:27:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1okMP0-0007U8-GF
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 09:27:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1okMOx-0003SR-EV; Mon, 17 Oct 2022 09:27:15 +0000
Received: from [15.248.2.148] (helo=[10.24.69.10])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1okMOx-0004hZ-97; Mon, 17 Oct 2022 09:27:15 +0000
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
	bh=YOZZRABNYOgULx6i2hitNWcfVDjms9ZvYk61U1py+PY=; b=SvRnTl7DUqgq+IES8vmwhG2/Dj
	kZ4H+h++mS2pTfcfhcCIIe7Eu1cUfZpCxD+IJJudjPPWMnTxi/Q41aiiar56X+iWnSI3eBdBlxHtf
	4j1KGuEixwsK+4Wy5Rq/RlNifSlmwS9YPqMh6MNYcYRTforAsYIUVCRkyMbiDXepQRCw=;
Message-ID: <746da4d0-36c9-55e0-ecb6-185ba0a60ef3@xen.org>
Date: Mon, 17 Oct 2022 10:27:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: Need guidance to support reading GICR_TYPER (64 bit register) on
 Aarch32_v8r
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Ayan Kumar Halder <ayankuma@amd.com>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>, Penny Zheng <Penny.Zheng@arm.com>,
 Jaxson Han <Jaxson.Han@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e2d041b2-3b38-f19b-2d8e-3a255b0ac07e@amd.com>
 <alpine.DEB.2.22.394.2210141109400.3690179@ubuntu-linux-20-04-desktop>
 <e5e337cc-9478-e4d5-e7ce-71138817f56e@xen.org>
 <2FED929A-C718-468B-B385-5C80CEED0664@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2FED929A-C718-468B-B385-5C80CEED0664@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17/10/2022 10:17, Bertrand Marquis wrote:
> Hi,

Hi,

>> On 15 Oct 2022, at 10:28, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Stefano,
>>
>> On 14/10/2022 19:09, Stefano Stabellini wrote:
>>> On Thu, 13 Oct 2022, Ayan Kumar Halder wrote:
>>>> Hi Arm mantainers/Folks,
>>>>
>>>> Please refer to the discussion
>>>> https://github.com/zephyrproject-rtos/zephyr/pull/51163 .
>>>>
>>>> We intend to run Zephyr as a domU guest on Xen on Aarch32_v8R fixed virtual
>>>> platform.
>>>>
>>>> Zephyr is trying to read GICR_TYPER which is a 64 bit register using ldrd
>>>> instruction.
>>>>
>>>> As GICR is emulated by Xen, so this instruction gets trapped with HSR =
>>>> 0x9200000c.
>>>>
>>>> As ISV is 0, so Xen cannot emulate this instruction.
>>>>
>>>> The proposed solution is to use two sys_read32() on GICR_TYPER to return the
>>>> lower and upper 32 bits.
>>>>
>>>> With this, HSR = 0x9383 000c, ISV=1 so ISS is valid.
>>> Hi all,
>>> I wanted to take a step back on this issue before we jump into the
>>> details.
>>> Differently from other instructions we discussed in the past, strd and ldrd
>>> are not deprecated and are not "unusual corner cases". There is no
>>> statements such as "please don't use this" on the ARM ARM. If I were to
>>> write an register read/write function in assembly for an RTOS, it would
>>> be reasonable to use them.
>>
>> Just to be clear it is fine to use the ldrd/strd for accessing non MMIO area. The problem comes with MMIO access because they can be emulated by the hypervisor and we don't have the syndrome. At the moment, this is only a problem when accessing some of the GICv3 (including ITS) registers.
>>
>>> So, I struggle to see how we'll be able to deal with all the possible
>>> RTOSes out there that might have them in the code. We can fix Zephyr,
>>> but what about FreeRTOS, ThreadX and the proprietary ones (VxWorks,
>>> etc.)?
>>
>> This is not an Xen issue but architecture issue. The RTOSes will face the exact same issue on any hypervisors unless they decided to decode the instruction.
>>
>> As we discussed before decoding an instruction correctly is quite difficult to do (what we have in Xen for pos-increment store/load is just a band-aid). So I would expect the other hypervisors to have made the decision to not implement it. AFAIK KVM doesn't suppor them,
>> Note that looking at ID_ISAR2, it seems that ldrd/strd is technically optional. Therefore, the RTOS would have to assume it is targeting a processor that supports them.
>>
>>> Unless we can get ARM to issue a clear guidance that strd and ldrd are
>>> deprecated,
>>
>> Arm Arm cannot say that because ldrd/strd are necessary to modify the LPAE page-tables atomically. What we need to know is which instructions can be allowed on MMIO accesses.
> 
> Definitely this is something that arm arm cannot fully answer as it is also down to the full platform. MMIO accesses are going out of the CPU and hence wether or not 64bit MMIO accesses can be properly done might also depend on the bus or the IP on the other side (some peripherals might just refuse 64bit accesses or some bus might only be 32bit so the operations would need to be divided).
> 
>>
>> I think I already raised that when Ayan added decoding for post-increment instructions. There are plenty of instructions (or combinations) that doesn't provide a syndrome and yet the processor doesn't prevent anyone to use them on MMIO.
>>
>> I was worry we are going to have to continue to decode instructions in a non-compliant way in Xen just to please a few RTOs that may not even run anywhere else.
>>
>> This would also reduce our leverage to request a change in the RTOes or the Arm Arm (maybe there is already a statement I haven't spotted) because Xen will already (badly) support the instruction.
> 
> Going back on the ID_ISAR2, if Xen is properly setting the value seen by the guests, there is not reason for us to actually emulate those instructions.
> The emulation code inside Xen cost a lot in matter of lines of code and would need a lot of testing (which is missing at the moment).
> So as we have a standard way to inform the guest that this is not supported, we should stick to that.

Thanks for the feedback. AFAIU, the bit in ID_ISAR2 indicates whether 
ldrd/strd is present. If we decide to clear the bit, then it would mean 
the guest should not use them even when modifying LPAE page-tables.

This could be a problem because AFAIK those instructions are necessary 
to modify the page-tables atomically. Therefore, I don't Xen should 
clear the bit.

Cheers,

-- 
Julien Grall

