Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 751BB845744
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 13:20:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674393.1049260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVW3E-0002s9-AY; Thu, 01 Feb 2024 12:20:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674393.1049260; Thu, 01 Feb 2024 12:20:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVW3E-0002qY-6p; Thu, 01 Feb 2024 12:20:16 +0000
Received: by outflank-mailman (input) for mailman id 674393;
 Thu, 01 Feb 2024 12:20:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rVW3D-0002p3-BB
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 12:20:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rVW37-0008HE-Be; Thu, 01 Feb 2024 12:20:09 +0000
Received: from [15.248.2.31] (helo=[10.24.67.35])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rVW37-0002Mi-4i; Thu, 01 Feb 2024 12:20:09 +0000
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
	bh=fRFuwtEwNy6+DYwm/cJrzgMhWIr5XdvdCViTG3PTGDQ=; b=Pd84zAaBe96ZSB1Tx8w5uTdpal
	d/+vtBbEiDAl+GCFp8KKrPijfZJNf92UADMXvu2iPLbabj5SgGwZxpCtWI0vIR/uRog3qRYC6x865
	Rs9yYtxAUi1N6J+TdBtGaBWC8y3shLasWSNt5oWaSuRgHDPjh5RpkuW053pUeaqneVSw=;
Message-ID: <167f0c7a-e037-446c-82f8-2584e35a7af1@xen.org>
Date: Thu, 1 Feb 2024 12:20:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
Content-Language: en-GB
To: John Ernberg <john.ernberg@actia.se>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Peng Fan <peng.fan@nxp.com>
Cc: Jonas Blixt <jonas.blixt@actia.se>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240131114952.305805-1-john.ernberg@actia.se>
 <20240131114952.305805-2-john.ernberg@actia.se>
 <a2f726f5-df4c-4d15-90af-7d59c0f1f513@xen.org>
 <494d4961-ad8a-4d1d-aaa6-d1bfb9d6a137@actia.se>
From: Julien Grall <julien@xen.org>
In-Reply-To: <494d4961-ad8a-4d1d-aaa6-d1bfb9d6a137@actia.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 31/01/2024 15:32, John Ernberg wrote:
> Hi Julien,

Hi John,

> On 1/31/24 13:22, Julien Grall wrote:
>> Hi,
>>
>> On 31/01/2024 11:50, John Ernberg wrote:
>>> When using Linux for dom0 there are a bunch of drivers that need to do
>>> SMC
>>> SIP calls into the PSCI provider to enable certain hardware bits like the
>>> watchdog.
>>
>> Do you know which protocol this is under the hood. Is this SCMI?
> 
> I think I confused myself here when I wrote the commit log.
> 
> The EL3 code in our case is ATF, and it does not appear to be SCMI, nor
> PSCI. The register usage of these SMC SIP calls are as follows:
> a0 - service
> a1 - function
> a2-a7 - args
> 
> In ATF the handler is declared as a runtime service.
> 
> Would the appropriate commmit message here be something along the lines
> of below?
> """
> When using Linux for dom0 there are a bunch of drivers that need to do   SMC
> SIP calls into the firmware to enable certain hardware bits like the
> watchdog.
> """

It reads better thanks.

[...]

>> But even if we restrict to dom0, have you checked that none of the SMCs
>> use buffers?
> I haven't found any such instances in the Linux kernel where a buffer is
> used. Adding a call filtering like suggested below additions of such
> functions can be discovered and adapted for if they would show up later.
>>
>> Rather than providing a blanket forward, to me it sounds more like you
>> want to provide an allowlist of the SMCs. This is more futureproof and
>> avoid the risk to expose unsafe SMCs to any domain.
>>
>> For an example, you can have a look at the EEMI mediator for Xilinx.
> 
> Ack. Do you prefer to see only on SMCCC service level or also on
> function level? (a1 register, per description earlier)

I am not sure. It will depend on whether it is correct to expose *all* 
the functions within a service level and they have the same format.

If you can't guarantee that, then you will most likely need to allowlist 
at the function level.

Also, do you have a spec in hand that would help to understand which 
service/function is implemented via those SMCs?

Cheers,

-- 
Julien Grall

