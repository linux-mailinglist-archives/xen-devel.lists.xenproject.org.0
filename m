Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F3E552F2C
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jun 2022 11:52:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353126.580035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3aXW-0006QG-Sm; Tue, 21 Jun 2022 09:51:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353126.580035; Tue, 21 Jun 2022 09:51:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3aXW-0006Nj-PT; Tue, 21 Jun 2022 09:51:18 +0000
Received: by outflank-mailman (input) for mailman id 353126;
 Tue, 21 Jun 2022 09:51:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o3aXV-0006Nd-DF
 for xen-devel@lists.xenproject.org; Tue, 21 Jun 2022 09:51:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o3aXR-0001Hy-7m; Tue, 21 Jun 2022 09:51:13 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=[192.168.3.84])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o3aXR-0008U4-12; Tue, 21 Jun 2022 09:51:13 +0000
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
	bh=CjE8sTVPolhZGahjszz09Hro69cY6owMRPhzOg4fLb4=; b=l8yXhzdKqhmYJ4X17lTHehi/mW
	xOg6yMRsvmN/ElGmj9d2jSZmP9g84tjis7ZZkqyisMgN/MVUD25o8xD2qfTD5lBGBpX3VlhUbqjto
	vnKROSAnM2uw/72tz8eqRe/d6kEX6+i3p1DZA00yImg0iVcLEWRdzM79qDODqPMiXrRA=;
Message-ID: <371f195b-291e-e5e0-9e1d-1b2d2fa55a7d@xen.org>
Date: Tue, 21 Jun 2022 10:51:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] xen: Don't call panic if ARM TF cpu off returns DENIED
To: Dmytro Semenets <dmitry.semenets@gmail.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Dmytro Semenets <Dmytro_Semenets@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220616135541.3333760-1-dmitry.semenets@gmail.com>
 <cf7660da-0bde-865e-7c22-a2e21e31fae5@xen.org> <87wndgh2og.fsf@epam.com>
 <67f56cdd-531b-72fc-1257-214d078f6bb6@xen.org> <87pmj7hczg.fsf@epam.com>
 <f260703d-4651-f9e9-3713-9e85a51b1d70@xen.org>
 <CACM97VUukaWoegmNvF4F+tf2tHCyPcjG41CSjjz72V2+Cte4Ew@mail.gmail.com>
 <49ace8c9-8fd6-57a2-e0c8-cfba04c9e151@xen.org>
 <CACM97VV5MO0vmqG01pR7dXg1xU3jptOvjt4S+KS27zD+E66fPw@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CACM97VV5MO0vmqG01pR7dXg1xU3jptOvjt4S+KS27zD+E66fPw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/06/2022 09:55, Dmytro Semenets wrote:
> Hi Julien,

Hi Dmytro,

>>>>
>>>> Hi,
>>>>
>>>> On 17/06/2022 10:10, Volodymyr Babchuk wrote:
>>>>> Julien Grall <julien@xen.org> writes:
>>>>>
>>>>>> On 16/06/2022 19:40, Volodymyr Babchuk wrote:
>>>>>>> Hi Julien,
>>>>>>
>>>>>> Hi Volodymyr,
>>>>>>
>>>>>>> Julien Grall <julien@xen.org> writes:
>>>>>>>
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> On 16/06/2022 14:55, dmitry.semenets@gmail.com wrote:
>>>>>>>>> From: Dmytro Semenets <dmytro_semenets@epam.com>
>>>>>>>>> According to PSCI specification ARM TF can return DENIED on CPU OFF.
>>>>>>>>
>>>>>>>> I am confused. The spec is talking about Trusted OS and not
>>>>>>>> firmware. The docummentation is also not specific to ARM Trusted
>>>>>>>> Firmware. So did you mean "Trusted OS"?
>>>>>>> It should be "firmware", I believe.
>>>>>>
>>>>>> Hmmm... I couldn't find a reference in the spec suggesting that
>>>>>> CPU_OFF could return DENIED because of the firmware. Do you have a
>>>>>> pointer to the spec?
>>>>>
>>>>> Ah, looks like we are talking about different things. Indeed, CPU_OFF
>>>>> can return DENIED only because of Trusted OS. But entity that *returns*
>>>>> the error to a caller is a firmware.
>>>>
>>>> Right, the interesting part is *why* DENIED is returned not *who*
>>>> returns it.
>>> ARM TF returns DENIED *only* for the platform I have.
>>> We have a dissonance between spec and xen implementation because
>>> DENIED returned by
>>> ARM TF or Thrusted OS or whatever is not a reason for panic.
>>
>> I agree that's not a reason for panic. However, knowing the reason does
>> help to figure out the correct approach.
>>
>> For instance, one could have suggest to migrate the trusted OS to
>> another pCPU. But this would not have worked for you because the DENIED
>> is not about that.
>>
>>> And we
>>> have issues with this.
>>> If machine_restart() behaviour is more or less correct  (sometimes
>>> reports about panic but restarts the machine)
>>
>> Right...
>>
>>> but machine_halt() doesn't work at al
>> ... this should also be the case here because machine_halt() could also
>> be called from cpu0. So I am a bit confused why you are saying it never
>> works.
> If machine_halt() called on a CPU other than CPU0 it caused panic and reboot.
> If it called on a CPU0 it also caused panic but after system power off
> and reboot
> is not issued. In this state you can still call the xen console. But
> you can't reboot the system.

I am lost. In a previous e-mail you said that PSCI CPU_OFF would return 
DENIED on CPU0. IOW, I understood that for other CPUs, it would succeed.

But here, you are tell me the opposite:

"If it called on a CPU0 it also caused panic but after system power off
  and reboot".

If machine_halt() is called from CPU0, then CPU_OFF should not be called 
on CPU0. So where is that panic coming from?

>>
>>> Transit execution to CPU0 for my understanding is a workaround and
>>> this approach will fix
>>> machine_restart() function but will not fix machine_halt().
>>
>> I would say it is a more specific case of what the spec suggests (see
>> below). But it should fix both machine_restart() and machine_halt()
>> because the last CPU running will be CPU0. So Xen would call SYSTEM_*
>> rather than CPU_OF. So I don't understand why you think it will fix one
>> but not the other.
> Looks like this is specific for my HW case. SYSTEM_OFF doesn't stop
> the whole system.

Hmmm... All the other CPUs should be off (or spinning with interrupt 
disabled), so are you saying that SYSTEM_OFF return?

Cheers,

-- 
Julien Grall

