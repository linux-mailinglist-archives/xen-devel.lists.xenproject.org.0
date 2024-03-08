Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 194408765F5
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 15:05:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690313.1076200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riaqW-0001C1-Gp; Fri, 08 Mar 2024 14:05:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690313.1076200; Fri, 08 Mar 2024 14:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riaqW-0001A8-E5; Fri, 08 Mar 2024 14:05:12 +0000
Received: by outflank-mailman (input) for mailman id 690313;
 Fri, 08 Mar 2024 14:05:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1riaqV-0001A1-NT
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 14:05:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1riaqL-0001wf-T1; Fri, 08 Mar 2024 14:05:01 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1riaqL-0003Ob-Lc; Fri, 08 Mar 2024 14:05:01 +0000
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
	bh=+SP+fyHAEWzq/M9ruBj6he5Ab9v6PnVgoi6FmrbjuH8=; b=F69wLXlKNMmzvtSgu5CconVXuL
	uIa3jelVf3MjrIMdv68+mBi35IBhgjFf/Hz58+IbLSssAduHCIpRMJEh4sh2iQ2GTFLor76IA6FZ2
	scJtRYVmRUS61L9/pYQFek3KjDhQh/BNP/kfmoPt2Uv8m71RBmXvIZ6P7MV9NfbwrILk=;
Message-ID: <48038c7f-d7cd-4100-a41b-8042bcb93208@xen.org>
Date: Fri, 8 Mar 2024 14:04:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
Content-Language: en-GB
To: John Ernberg <john.ernberg@actia.se>, Peng Fan <peng.fan@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Jonas Blixt <jonas.blixt@actia.se>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240131114952.305805-1-john.ernberg@actia.se>
 <20240131114952.305805-2-john.ernberg@actia.se>
 <a2f726f5-df4c-4d15-90af-7d59c0f1f513@xen.org>
 <494d4961-ad8a-4d1d-aaa6-d1bfb9d6a137@actia.se>
 <167f0c7a-e037-446c-82f8-2584e35a7af1@xen.org>
 <a265ea2d-9b5f-4726-9395-448b1b669839@actia.se>
 <012b5f83-2f9b-4477-965e-07b8506c0052@xen.org>
 <DU0PR04MB94170CB1F77E3D594A6D0E9488402@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <5a0c8f09-4f01-45e9-892c-86342c0d0ec5@xen.org>
 <08ae764c-3490-4dd1-ab70-7a855a98d16d@actia.se>
 <911ec1bb-3733-4f37-839e-673a88e408ff@actia.se>
 <ab61278a-f3f1-41de-a0b2-eca6f19be103@xen.org>
 <848794f3-a337-49d9-84db-a969970f071b@actia.se>
From: Julien Grall <julien@xen.org>
In-Reply-To: <848794f3-a337-49d9-84db-a969970f071b@actia.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi John,

Thank you for the reply.

On 08/03/2024 13:40, John Ernberg wrote:
> On 3/7/24 00:07, Julien Grall wrote:
>>   > Ping on the watchdog discussion bits.
>>
>> Sorry for the late reply.
>>
>> On 06/03/2024 13:13, John Ernberg wrote:
>>> On 2/9/24 14:14, John Ernberg wrote:
>>>>
>>>>>      * IMX_SIP_TIMER_*:  This seems to be related to the watchdog.
>>>>> Shouldn't dom0 rely on the watchdog provided by Xen instead? So those
>>>>> call will be used by Xen.
>>>>
>>>> That is indeed a watchdog SIP, and also for setting the SoC internal RTC
>>>> if it is being used.
>>>>
>>>> I looked around if there was previous discussion and only really
>>>> found [3].
>>>> Is the xen/xen/include/watchdog.h header meant to be for this kind of
>>>> watchdog support or is that more for the VM watchdog? Looking at the x86
>>>> ACPI NMI watchdog it seems like the former, but I have never worked with
>>>> x86 nor ACPI.
>>
>> include/watchdog.h contains helper to configure the watchdog for Xen. We
>> also have per-VM watchdog and this is configured by the hypercall
>> SCHEDOP_watchdog.
>>
>>>>
>>>> Currently forwarding it to Dom0 has not caused any watchdog resets with
>>>> our watchdog timeout settings, our specific Dom0 setup and VM count.
>>
>> IIUC, the SMC API for the watchdog would be similar to the ACPI NMI
>> watchdog. So I think it would make more sense if this is not exposed to
>> dom0 (even if Xen is doing nothing with it).
>>
>> Can you try to hide the SMCs and check if dom0 still behave properly?
>>
>> Cheers,
>>
> 
> This SMC manages a hardware watchdog, if it's not pinged within a
> specific interval the entire board resets.

Do you know what's the default interval? Is it large enough so Xen + 
dom0 can boot (at least up to when the watchdog driver is initialized)?

> 
> If I block the SMCs the watchdog driver in Dom0 will fail to ping the
> watchdog, triggering a board reset because the system looks to have
> become unresponsive. The reason this patch set started is because we
> couldn't ping the watchdog when running with Xen.
> 
> In our specific system the bootloader enables the watchdog as early as
> possible so that we can get watchdog protection for as much of the boot
> as we possibly can.
> 
> So, if we are to block the SMC from Dom0, then Xen needs to take over
> the pinging. It could be implemented similarly to the NMI watchdog,
> except that the system will reset if the ping is missed rather than
> backtrace.
> It would also mean that Xen will get a whole watchdog driver-category
> due to the watchdog being vendor and sometimes even SoC specific when it
> comes to Arm.
> 
> My understanding of the domain watchdog code is that today the domain
> needs to call SCHEDOP_watchdog at least once to start the watchdog
> timer. Since watchdog protection through the whole boot process is
> desirable we'd need some core changes, such as an option to start the
> domain watchdog on init. >
> It's quite a big change to make

For clarification, above you seem to mention two changes:

  1) Allow Xen to use the HW watchdog
  2) Allow the domain to use the watchdog early

I am assuming by big change, you are referring to 2?

, while I am not against doing it if it
> makes sense, I now wonder if Xen should manage hardware watchdogs.
> Looking at the domain watchdog code it looks like if a domain does not
> get enough execution time, the watchdog will not be pinged enough and
> the guest will be reset. So either watchdog approach requires Dom0 to
> get execution time. Dom0 also needs to service all the PV backends it's
> responsible for. I'm not sure it's valuable to add another layer of
> watchdog for this scenario as the end result (checking that the entire
> system works) is achieved without it as well.
> 
> So, before I try to find the time to make a proposal for moving the
> hardware watchdog bit to Xen, do we really want it?

Thanks for the details. Given that the watchdog is enabled by the 
bootloader, I think we want Xen to drive the watchdog for two reasons:
  1) In true dom0less environment, dom0 would not exist
  2) You are relying on Xen + Dom0 to boot (or at least enough to get 
the watchdog working) within the watchdog interval.

Let see what the other Arm maintainer thinks.

-- 
Julien Grall

