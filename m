Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 078FF9779F8
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 09:43:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798019.1208144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp0xi-0000hV-8t; Fri, 13 Sep 2024 07:43:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798019.1208144; Fri, 13 Sep 2024 07:43:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp0xi-0000fT-5s; Fri, 13 Sep 2024 07:43:26 +0000
Received: by outflank-mailman (input) for mailman id 798019;
 Fri, 13 Sep 2024 07:43:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sp0xg-0000fN-PD
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 07:43:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sp0xe-0000UD-3n; Fri, 13 Sep 2024 07:43:22 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sp0xd-0003ek-Rb; Fri, 13 Sep 2024 07:43:21 +0000
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
	bh=2IaQX5V/hRHtBh+0fD7M8v52PKvziBzfVTSsfoeeeH8=; b=LZZ7j4jWMZm7k2DIr27RJUTIbA
	1VYL9S8n5/DRLiL1nhHC0ogxtCdPb1kD4YMrHR9I3LrwbN1w2Cf0sA+rdEn8tk95PB+Qi41mgYyqi
	KsQLeSrzRmNh8/66+I9qDtvyX0oimuNx8WoKn7mOufbeEJgou+c7Dllr+WjrQ4ja+flU=;
Message-ID: <7da698d1-b4ce-4152-a439-ae755847ed33@xen.org>
Date: Fri, 13 Sep 2024 08:43:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] xen/arm: platforms: Add NXP S32CC platform code
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "S32@nxp.com" <S32@nxp.com>, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240910143411.178704-1-andrei.cherechesu@oss.nxp.com>
 <20240910143411.178704-4-andrei.cherechesu@oss.nxp.com>
 <f08942b8-3a01-4176-8fad-525ad3261083@xen.org>
 <alpine.DEB.2.22.394.2409102210310.611587@ubuntu-linux-20-04-desktop>
 <85acbacc-2557-446c-9025-bdc7eac1cdb1@oss.nxp.com>
 <EA3C41C1-D484-456D-A391-4FB54B51D6CD@arm.com>
 <alpine.DEB.2.22.394.2409121544350.611587@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2409121544350.611587@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 12/09/2024 23:44, Stefano Stabellini wrote:
> On Thu, 12 Sep 2024, Bertrand Marquis wrote:
>> Hi Andrei,
>>
>>> On 11 Sep 2024, at 23:05, Andrei Cherechesu <andrei.cherechesu@oss.nxp.com> wrote:
>>>
>>> Hi Julien, Stefano,
>>> On 11/09/2024 08:19, Stefano Stabellini wrote:
>>>> On Tue, 10 Sep 2024, Julien Grall wrote:
>>>>
>>>>> Hi,
>>>>>
>>>>> On 10/09/2024 15:34, Andrei Cherechesu (OSS) wrote:
>>>>>
>>>>>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>>>>
>>>>>> Added support for NXP S32CC platforms (S32G2, S32G3, S32R45),
>>>>>> which need SCMI over SMC calls forwarded to the firmware
>>>>>> running at EL3 (TF-A). Linux relies on the SCMI Platform
>>>>>> for system services such as clocking, reset, etc.
>>>>>>
>>>>> Is it SMCI as in the Arm spec? If so, this should not be platform specific.
>>> Yes, it is SCMI as defined by Arm. I agree it shouldn't be platform specific.
>>>>
>>>>>
>>>>> Furthermore, I was under the impression that we can't blindly forward
>>>>> everything from a domain to the firmware. While it might be okayish for dom0,
>>>>> you also seem to give access to all the domains on the system is it intended?
>>> In our case, only Dom0 has access to the SCMI mailbox. Hence, the other unprivileged domains are not aware of SCMI and do not make any SCMI requests to FW.
>>>>
>>>>>
>>>>> Anyway, there is a series on the ML to add a mediator for SCMI in Xen (see
>>>>> [1]). I think it would be preferable to focus on getting it merged as it would
>>>>>
>>>>> benefit everyone and increase the security posture (we could restrict access).
>>> I also asked a few months ago on the ML in a virtio related thread if there are any updates regarding
>>> SCMI awareness for Xen and guests, then Stefano CCed Bertrand, but he did not comment [0].
>>> I'm curious why the SCMI mediator patch series did not progress.
>>> [0] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2401111627360.3675@ubuntu-linux-20-04-desktop/
>>
>> Sorry it seems i missed that one.
>>
>> There are several initiatives ongoing to investigate the global problem of clock handling and more specifically
>> SCMI "sharing".
>> The SCMI protocol contains some features to have virtual channels and the question is how to make a transport
>> that is hypervisor agnostic to prevent to require the hypervisors to have to "decode" SCMI messages.
>>
>> Virtio-scmi is not really used for clock management per say at the moment and more specifically I do not
>> think it is a good solution to manage clocks of non virtio devices.
>>
>> In Soafee and in Linaro people are looking at using FF-A as a tansport for SCMI.
>> The idea would be that the hypervisor is configuring the virtual SCMI channels using FF-A as a transport
>> and then VMs are using FF-A to communicate with an SCMI server (probably sitting in secure world, at
>> least as a proxy). This is an investigation for now.
>>
>> Requiring Xen to act as a mediator is also a solution but might require a lot of platform specific code
>> which i think we should prevent.
>>
>> For now having a solution in Xen where SCMI calls through SMC are only allowed by Dom0 is the only
>> short term solution I think.
> 
> +1
I am open to go this way. But I would like the commit message to contain 
some details on whether this will always work fine for dom0 (this would 
tell whether the feature can be supported or needs to be in 
experimental/tech preview).

At least my main concern is anything to do with RAM. On Matrix, Bertrand 
suggested that none of the messages should contain addresses. What about 
the transport? Is it using buffer? If so, are they fixed?

Brief looking at Linux, there are multiple DT compatible. IIUC, we would 
only support "arm,scmi-smc" with the implementation. If so, maybe we 
should check the DT.

Cheers,

-- 
Julien Grall


