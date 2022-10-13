Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B97B05FDC9E
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 16:47:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422247.668138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oizUq-000432-8z; Thu, 13 Oct 2022 14:47:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422247.668138; Thu, 13 Oct 2022 14:47:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oizUq-00040y-5m; Thu, 13 Oct 2022 14:47:40 +0000
Received: by outflank-mailman (input) for mailman id 422247;
 Thu, 13 Oct 2022 14:47:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oizUp-00040s-2G
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 14:47:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oizUn-0001Cc-G4; Thu, 13 Oct 2022 14:47:37 +0000
Received: from [15.248.2.148] (helo=[10.24.69.5])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oizUn-0004HY-8g; Thu, 13 Oct 2022 14:47:37 +0000
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
	bh=q95swCBT6GFOa+kBpbLAK6KslQnkO34Keu6rVj3fYlc=; b=kaQ15lYWcZPKpijC85xJyRkr9K
	0ZFKaUAZhGTraZG0+HVag/ikqNh83hhZ4Ddry8ZqACjBp9NSvt564cQU/W5MUHt0PmSwfyjSalKRh
	djCCnjrqMqNcoqbmo0finOTzag3IUEFRfqljcJueDIyf3LZmbRYZEPZMOGHyy12ox/Os=;
Message-ID: <96f989d9-4d55-acc9-a0f7-cbb1212480ad@xen.org>
Date: Thu, 13 Oct 2022 15:47:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.1
Subject: Re: Need guidance to support reading GICR_TYPER (64 bit register) on
 Aarch32_v8r
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 bertrand Marquis <Bertrand.Marquis@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>, Penny Zheng <Penny.Zheng@arm.com>
Cc: Jaxson Han <jaxson.han@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e2d041b2-3b38-f19b-2d8e-3a255b0ac07e@amd.com>
 <9b4a9bbf-eb5c-3d13-f796-c6bf5704d85b@xen.org>
 <e94b7c65-1c38-024f-6a91-16098045574a@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e94b7c65-1c38-024f-6a91-16098045574a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 13/10/2022 15:30, Ayan Kumar Halder wrote:
> 
> On 13/10/2022 14:20, Julien Grall wrote:
>> On 13/10/2022 12:47, Ayan Kumar Halder wrote:
>>> Hi Arm mantainers/Folks,
>>
>> Hello,
> 
> Hi Julien,
> 
> Appreciate your help as always. :)
> 
>>
>>> Please refer to the discussion 
>>> https://github.com/zephyrproject-rtos/zephyr/pull/51163 .
>>>
>>> We intend to run Zephyr as a domU guest on Xen on Aarch32_v8R fixed 
>>> virtual platform.
>>>
>>> Zephyr is trying to read GICR_TYPER which is a 64 bit register using 
>>> ldrd instruction.
>>>
>>> As GICR is emulated by Xen, so this instruction gets trapped with HSR 
>>> = 0x9200000c.
>>>
>>> As ISV is 0, so Xen cannot emulate this instruction.
>>>
>>> The proposed solution is to use two sys_read32() on GICR_TYPER to 
>>> return the lower and upper 32 bits.
>>>
>>> With this, HSR = 0x9383 000c, ISV=1 so ISS is valid.
>>>
>>> Now, for Xen to emulate this read, I have proposed the modifications 
>>> (in my last comment).
>>
>> I am confused. Looking at the emulation of GICR_TYPER in Xen 
>> (arch/arm/vgic-v3.c), the code should already be able to handle 32-bit 
>> access.
> 
> When I compile Xen for arm32, vreg_reg64_extract() definitions do not 
> exist.

Ah. You are building Xen for arm32... This is unsupported by Xen at the 
moment.

> 
> The reason being 
> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/include/asm/vreg.h;h=f26a70d024e2d1f933ea66793ea6e42f81c7a8cf;hb=9029bc265cdf2bd63376dde9fdd91db4ce9c0586#l189 , BITS_PER_LONG is 32 (Refer xen/arch/arm/include/asm/config.h).

Right, so that's not an architecture issue (like 'ldrd') but just Xen 
not providing the helper.

As I wrote above, Xen doesn't yet support GICv3 on arm32. I expect that 
implementing vreg_reg64_extract() will be one of the step.

> 
> .Thus, the guest need to invoke sys_read32() twice (GICR_TYPER and 
> GICR_TYPER+4).

I don't understand how you came to this conclusion with what you wrote. 
If we had implemented vreg_reg64_extract(), then Zephyr would still need 
to issue two 32-bit read because Xen doesn't emulate 'ldrd'.

Cheers,

-- 
Julien Grall

