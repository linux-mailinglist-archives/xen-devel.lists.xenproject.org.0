Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 047242F1E92
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 20:07:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65348.115774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz2XB-0006sh-LG; Mon, 11 Jan 2021 19:07:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65348.115774; Mon, 11 Jan 2021 19:07:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz2XB-0006sK-Hz; Mon, 11 Jan 2021 19:07:21 +0000
Received: by outflank-mailman (input) for mailman id 65348;
 Mon, 11 Jan 2021 19:07:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kz2X9-0006sD-Ch
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 19:07:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kz2X8-00033t-R6; Mon, 11 Jan 2021 19:07:18 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kz2X8-0001tl-Dy; Mon, 11 Jan 2021 19:07:18 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=19eDalrYiK5Flwjvc088mbKfUzGpVUuRKSpwvcgwFjY=; b=zyKRBiBy0Fk7alKlc/uPwVCXXV
	mrHgjbjY0UUeKa+5ph3ssIgVFiY/pDNiVS8sVil4hIlpaF0GuDAalwbjpiw7wTJ4jzSx27Z7xM6Ns
	jPIM/OiBILIMm2q/gD7J6Rjla+nzgFhQAn0ZXAObRZYQkIQXoWKPF5QgrdRXX3IgxC+g=;
Subject: Re: [PATCH v2] xen/arm: do not read MVFR2 when is not defined
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andre Przywara <Andre.Przywara@arm.com>
References: <20210108192243.25889-1-sstabellini@kernel.org>
 <f90e40ee-b042-6cc5-a08d-aef41a279527@suse.com>
 <dce8bed2-db66-b032-06a9-86c8f80d26aa@xen.org>
 <F715A994-7B47-4171-84F8-5BE912985784@arm.com>
 <7311f402-dd5d-7484-345a-ef62071adb58@xen.org>
 <9A54F469-6A90-46C8-8BC4-673F469240E7@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5d38eb31-7fbb-50f8-e8b8-ea9704122b1f@xen.org>
Date: Mon, 11 Jan 2021 19:07:16 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <9A54F469-6A90-46C8-8BC4-673F469240E7@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 11/01/2021 19:02, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

> 
>> On 11 Jan 2021, at 18:50, Julien Grall <julien@xen.org> wrote:
>>
>> On 11/01/2021 18:21, Bertrand Marquis wrote:
>>> Hi Julien,
>>
>> Hi Bertrand,
>>
>>> Sorry for the delay but I was on holiday until today.
>>
>> Welcome back! No worries.
>>
>>>> On 11 Jan 2021, at 10:25, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> Hi Jan,
>>>>
>>>> On 11/01/2021 08:49, Jan Beulich wrote:
>>>>> On 08.01.2021 20:22, Stefano Stabellini wrote:
>>>>>> MVFR2 is not available on ARMv7. It is available on ARMv8 aarch32 and
>>>>>> aarch64. If Xen reads MVFR2 on ARMv7 it could crash.
>>>>>>
>>>>>> Avoid the issue by doing the following:
>>>>>>
>>>>>> - define MVFR2_MAYBE_UNDEFINED on arm32
>>>>>> - if MVFR2_MAYBE_UNDEFINED, do not attempt to read MVFR2 in Xen
>>>>>> - keep the 3rd register_t in struct cpuinfo_arm.mvfr on arm32 so that a
>>>>>>    guest read to the register returns '0' instead of crashing the guest.
>>>>>>
>>>>>> '0' is an appropriate value to return to the guest because it is defined
>>>>>> as "no support for miscellaneous features".
>>>>>>
>>>>>> Aarch64 Xen is not affected by this patch.
>>>>> But it looks to also be affected by ...
>>>>
>>>> AFAICT, the smoke test passed on Laxton0 (AMD Seattle) [1] over the week-end.
>>>>
>>>>>> Fixes: 9cfdb489af81 ("xen/arm: Add ID registers and complete cpuinfo")
>>>>> ... this, faulting (according to osstest logs) early during boot on
>>>>
>>>> The xen-unstable flight [2] ran on Rochester0 (Cavium Thunder-X). So this has something to do with the platform.
>>>>
>>>> The main difference is AMD Seattle supports AArch32 while Cavium Thunder-X doesn't.
>>>>
>>>>> 000000000025D314	mrs	x1, id_pfr2_el1
>>>> This register contains information for the AArch32 state.
>>>>
>>>> AFAICT, the Arm Arm back to at least ARM DDI 0487A.j (published in 2016) described the encoding as Read-Only. So I am not sure why we receive an UNDEF here, the more it looks like ID_PFR{0, 1}_EL1 were correctly accessed.
>>>>
>>>> Andre, Bertrand, do you have any clue?
>>> I will double check this but my understanding when I checked this was that it would be possible to read with an unknown value but should not generate an UNDEF.
>>>>
>>>> However, most of the AArch32 ID registers are UNKNOWN on platform not implementing AArch32. So we may want to conditionally skip the access to AArch32 state.
>>> We could skip aarch32 registers on platforms not supporting aarch32 but we will still have to provide values to a guest trying to access them so might be better to return what is returned by the hardware.
>>
>> Per the Arm Arm, the value of the registers may changed at any time. IOW, two read of the sytem registers may return different values.
>>
>> IIRC, the original intent of the series was to provide sanitized value of the ID registers. So I think it would be unwise to let the guest using the values.
>>
>> Instead, I would suggest to implement them as RAZ.
> 
> Works for me.
> 
>>
>>> Now if some platforms are generating an UNDEF we need to understand in what cases and behave the same way for the guest.
>>
>> I am not entirely sure what you mean by platforms here.
>>
>> If you mean any platform conforming with the Arm Arm, then I agree with your statement.
>>
>> However, if you refer to platform that may not follow the Arm Arm, then I disagree. We should try to expose a sane interface to the guest whenever it is possible.
>>
>> In this case, I would bet the hardware would not even allow us to trap the ID_PFR2. Although, I haven't tried it.
>>
>>> Do i understand it right that on Cavium which has no aarch32 support the access is generating an UNDEF ?
>>
>> Yes. The UNDEF will happen when trying to read ID_PFR2_EL1. Interestingly, it doesn't happen when reading ID_PFR{0, 1}_EL1. So this smells like a silicon bug.
> 
> Sounds like the ifdef ARM64 should be something like if (!cavium)

Hmmm.... Cavium may not the only platform where AArch32 is not supported.
So as the values are actually UNKOWN (or UNDEF or Cavium), then there is 
no point to read them.

Therefore the following pseudo-code should be enough:

if ( aarch32 supported )
   read AArch32 ID registers

This will nicely solve the UNDEF on Cavium without adding more 
workaround in the code :).

Cheers,

-- 
Julien Grall

