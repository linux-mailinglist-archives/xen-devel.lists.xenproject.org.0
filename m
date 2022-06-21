Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D22552FF9
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jun 2022 12:45:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353187.580105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3bNa-0006E6-J6; Tue, 21 Jun 2022 10:45:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353187.580105; Tue, 21 Jun 2022 10:45:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3bNa-0006BE-FD; Tue, 21 Jun 2022 10:45:06 +0000
Received: by outflank-mailman (input) for mailman id 353187;
 Tue, 21 Jun 2022 10:45:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o3bNZ-0006B6-CS
 for xen-devel@lists.xenproject.org; Tue, 21 Jun 2022 10:45:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o3bNW-0002HP-VX; Tue, 21 Jun 2022 10:45:02 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=[192.168.3.84])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o3bNW-0002x7-Oz; Tue, 21 Jun 2022 10:45:02 +0000
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
	bh=s6rh5/3M6+HuWHGc4V6AxQf0zOOLdSD0Xh/ho6qppvA=; b=6NSa/5DBTnZflvSa8A4B3iHErx
	r/r6UKZ3YEqXbbyuF7/JTfMbGt5uIvhhuMEkSHIgIvLsglQN0YDFqXT+TRXORmO7ubz/6SBGEKjpF
	/KZD0j0faW0fdjH5tucRXRXX6rP2WUoUQRh/cX3rkwsxki/EAk2tSDebwroNobvJJIcY=;
Message-ID: <b8c18f8b-7401-bb67-0436-9bd8a03e3652@xen.org>
Date: Tue, 21 Jun 2022 11:45:00 +0100
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
 <371f195b-291e-e5e0-9e1d-1b2d2fa55a7d@xen.org>
 <CACM97VXqAh4ApnkC_1wuDx38njbNxRwGrrfJhHqKV2x3R1svmA@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CACM97VXqAh4ApnkC_1wuDx38njbNxRwGrrfJhHqKV2x3R1svmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 21/06/2022 11:05, Dmytro Semenets wrote:
>>>>> but machine_halt() doesn't work at al
>>>> ... this should also be the case here because machine_halt() could also
>>>> be called from cpu0. So I am a bit confused why you are saying it never
>>>> works.
>>> If machine_halt() called on a CPU other than CPU0 it caused panic and reboot.
>>> If it called on a CPU0 it also caused panic but after system power off
>>> and reboot
>>> is not issued. In this state you can still call the xen console. But
>>> you can't reboot the system.
>>
>> I am lost. In a previous e-mail you said that PSCI CPU_OFF would return
>> DENIED on CPU0. IOW, I understood that for other CPUs, it would succeed.
> I'm sorry I confused You.
> Yes it causes panic and prints it will be rebooted but actual reboot
> doesn't happen.

Ok. That's most likely because of the call to smp_call_function() in 
machine_restart(). It is using cpu_online_map to decide which CPUs to 
send the IPI.

This will block because some of the CPUs are already off. So they will 
never acknowledge the IPI.

> 
>>
>> But here, you are tell me the opposite:
>>
>> "If it called on a CPU0 it also caused panic but after system power off
>>    and reboot".
>>
>> If machine_halt() is called from CPU0, then CPU_OFF should not be called
>> on CPU0. So where is that panic coming from?
>>
>>>>
>>>>> Transit execution to CPU0 for my understanding is a workaround and
>>>>> this approach will fix
>>>>> machine_restart() function but will not fix machine_halt().
>>>>
>>>> I would say it is a more specific case of what the spec suggests (see
>>>> below). But it should fix both machine_restart() and machine_halt()
>>>> because the last CPU running will be CPU0. So Xen would call SYSTEM_*
>>>> rather than CPU_OF. So I don't understand why you think it will fix one
>>>> but not the other.
>>> Looks like this is specific for my HW case. SYSTEM_OFF doesn't stop
>>> the whole system.
>>
>> Hmmm... All the other CPUs should be off (or spinning with interrupt
>> disabled), so are you saying that SYSTEM_OFF return?
> Yes. SYSTEM_OFF returns on my HW.

Hmmm... This is not compliant with the specification. Could you check 
why PSCI SYSTEM_OFF is returning?

> This is reason when CPU_OFF for CPU0 happens.

Right, machine_halt() will call halt_this_cpu() that in turn will call 
PSCI CPU_OFF.

If you modify halt_this_cpu() to avoid calling PSCI CPU_OFF (as I 
suggested before) then the panic() will never happen. Instead, the CPU 
will execute "wfi" in a loop with interrupt disabled.

To summarize there are two parts to resolve:
   1) Understand why PSCI SYSTEM_OFF returns on your platform
   2) Modify stop_cpu() to not call PSCI CPU_OFF

Cheers,

-- 
Julien Grall

