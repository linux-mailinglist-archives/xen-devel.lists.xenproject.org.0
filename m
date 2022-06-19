Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 969AB550973
	for <lists+xen-devel@lfdr.de>; Sun, 19 Jun 2022 11:05:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352114.578849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2qrf-0004Uy-F5; Sun, 19 Jun 2022 09:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352114.578849; Sun, 19 Jun 2022 09:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2qrf-0004Sv-Bi; Sun, 19 Jun 2022 09:05:03 +0000
Received: by outflank-mailman (input) for mailman id 352114;
 Sun, 19 Jun 2022 09:05:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o2qrd-0004Sa-HQ
 for xen-devel@lists.xenproject.org; Sun, 19 Jun 2022 09:05:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o2qra-00086j-SR; Sun, 19 Jun 2022 09:04:58 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o2qra-0008JO-Me; Sun, 19 Jun 2022 09:04:58 +0000
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
	bh=bxKO7v/a0v8BuF99PzOVIgzMhXyKCZNB86OFyUACDqM=; b=vt82I5gLLmUBOdfZV1uMN9rOCw
	WuP7scAYEcxXkiK/miJtq+gy+JfFxXHzHDjLz63K9+ISoUuvuoGLuJi2HUafUtvMIgTH1ikFcKd/D
	Vqs9Lul2dbP111CIzltpYKARwAu24e2+Zr42aL7EB8o1PouB1+mU/eH8uQgBejLMIsCY=;
Message-ID: <49ace8c9-8fd6-57a2-e0c8-cfba04c9e151@xen.org>
Date: Sun, 19 Jun 2022 10:04:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
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
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen: Don't call panic if ARM TF cpu off returns DENIED
In-Reply-To: <CACM97VUukaWoegmNvF4F+tf2tHCyPcjG41CSjjz72V2+Cte4Ew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 18/06/2022 18:43, Dmytro Semenets wrote:
> пт, 17 июн. 2022 г. в 14:12, Julien Grall <julien@xen.org>:
> Hi Julien,
>>
>> Hi,
>>
>> On 17/06/2022 10:10, Volodymyr Babchuk wrote:
>>> Julien Grall <julien@xen.org> writes:
>>>
>>>> On 16/06/2022 19:40, Volodymyr Babchuk wrote:
>>>>> Hi Julien,
>>>>
>>>> Hi Volodymyr,
>>>>
>>>>> Julien Grall <julien@xen.org> writes:
>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> On 16/06/2022 14:55, dmitry.semenets@gmail.com wrote:
>>>>>>> From: Dmytro Semenets <dmytro_semenets@epam.com>
>>>>>>> According to PSCI specification ARM TF can return DENIED on CPU OFF.
>>>>>>
>>>>>> I am confused. The spec is talking about Trusted OS and not
>>>>>> firmware. The docummentation is also not specific to ARM Trusted
>>>>>> Firmware. So did you mean "Trusted OS"?
>>>>> It should be "firmware", I believe.
>>>>
>>>> Hmmm... I couldn't find a reference in the spec suggesting that
>>>> CPU_OFF could return DENIED because of the firmware. Do you have a
>>>> pointer to the spec?
>>>
>>> Ah, looks like we are talking about different things. Indeed, CPU_OFF
>>> can return DENIED only because of Trusted OS. But entity that *returns*
>>> the error to a caller is a firmware.
>>
>> Right, the interesting part is *why* DENIED is returned not *who*
>> returns it.
> ARM TF returns DENIED *only* for the platform I have.
> We have a dissonance between spec and xen implementation because
> DENIED returned by
> ARM TF or Thrusted OS or whatever is not a reason for panic.

I agree that's not a reason for panic. However, knowing the reason does 
help to figure out the correct approach.

For instance, one could have suggest to migrate the trusted OS to 
another pCPU. But this would not have worked for you because the DENIED 
is not about that.

> And we
> have issues with this.
> If machine_restart() behaviour is more or less correct  (sometimes
> reports about panic but restarts the machine)

Right...

> but machine_halt() doesn't work at al
... this should also be the case here because machine_halt() could also 
be called from cpu0. So I am a bit confused why you are saying it never 
works.

> Transit execution to CPU0 for my understanding is a workaround and
> this approach will fix
> machine_restart() function but will not fix machine_halt().

I would say it is a more specific case of what the spec suggests (see 
below). But it should fix both machine_restart() and machine_halt() 
because the last CPU running will be CPU0. So Xen would call SYSTEM_* 
rather than CPU_OF. So I don't understand why you think it will fix one 
but not the other.

In fact, the idea to always run the request from a given CPU is quite 
similar to what the specification suggests (5.10.3 DEN0022D.b):

"
One way in which cores can be placed into a known state is to use calls 
to CPU_OFF on all online cores
except for the last one, which instead uses SYSTEM_OFF. If a UP Trusted 
OS is present, this method
only works if the core that calls SYSTEM_OFF is the one where the 
Trusted OS is resident, as calls to
CPU_OFF on this core return a DENIED error. Any core can call SYSTEM_OFF.
"

For Xen, we would need to detect if the trusted OS is UP and where it is 
running. Then we could always restart/halt from that CPU or CPU0.

> Approach
> you suggested (spinning all cpus) will work but
> will save less energy.

I am not sure to understand what's the concern about the energy here. 
 From my understanding of the specification, SYSTEM_OFF will take care 
of switching off the power for all the cores. So at worse, the CPUs will 
spin for a few ms. This would like be more efficient than a call to PSCI 
CPU off.

This is different compare just turning off one CPU (i.e. CPU hot-unplug) 
because the CPU will end up to spin for a very long time. And this is 
why I wasn't OK with conditionally avoiding the panic.

Cheers,

-- 
Julien Grall

