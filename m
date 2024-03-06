Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9CF87437A
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 00:08:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689558.1074675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ri0Md-0004Ms-7V; Wed, 06 Mar 2024 23:07:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689558.1074675; Wed, 06 Mar 2024 23:07:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ri0Md-0004Jt-4h; Wed, 06 Mar 2024 23:07:55 +0000
Received: by outflank-mailman (input) for mailman id 689558;
 Wed, 06 Mar 2024 23:07:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ri0Mb-0004Jn-LG
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 23:07:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ri0MR-0003qU-PL; Wed, 06 Mar 2024 23:07:43 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ri0MR-0001Gz-Hb; Wed, 06 Mar 2024 23:07:43 +0000
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
	bh=1tzl07rsQIT3k0ieYf2d585TF8knL080efVu/NGTT8c=; b=SIX03T6bVRalSaHZvFXCFdZZSV
	EY4+SZF0+56dGVe9OicLRCTUU/WZVWtlHR4k2/+kpzq6uol0PyyEnXoqOr2nouY2/4aokk0pr9U5E
	hmVL3goLnUIgbDWSrGKajXmrkfFydJ2SMuIkDkPbiPBwqdOzyxp1UFjPlX3ZLFxRlvw8=;
Message-ID: <ab61278a-f3f1-41de-a0b2-eca6f19be103@xen.org>
Date: Wed, 6 Mar 2024 23:07:40 +0000
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <911ec1bb-3733-4f37-839e-673a88e408ff@actia.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi John,

 > Ping on the watchdog discussion bits.

Sorry for the late reply.

On 06/03/2024 13:13, John Ernberg wrote:
> On 2/9/24 14:14, John Ernberg wrote:
>>
>>>     * IMX_SIP_TIMER_*:  This seems to be related to the watchdog.
>>> Shouldn't dom0 rely on the watchdog provided by Xen instead? So those
>>> call will be used by Xen.
>>
>> That is indeed a watchdog SIP, and also for setting the SoC internal RTC
>> if it is being used.
>>
>> I looked around if there was previous discussion and only really found [3].
>> Is the xen/xen/include/watchdog.h header meant to be for this kind of
>> watchdog support or is that more for the VM watchdog? Looking at the x86
>> ACPI NMI watchdog it seems like the former, but I have never worked with
>> x86 nor ACPI.

include/watchdog.h contains helper to configure the watchdog for Xen. We 
also have per-VM watchdog and this is configured by the hypercall 
SCHEDOP_watchdog.

>>
>> Currently forwarding it to Dom0 has not caused any watchdog resets with
>> our watchdog timeout settings, our specific Dom0 setup and VM count.

IIUC, the SMC API for the watchdog would be similar to the ACPI NMI 
watchdog. So I think it would make more sense if this is not exposed to 
dom0 (even if Xen is doing nothing with it).

Can you try to hide the SMCs and check if dom0 still behave properly?

Cheers,

-- 
Julien Grall

