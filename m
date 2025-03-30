Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 304CDA75CC0
	for <lists+xen-devel@lfdr.de>; Sun, 30 Mar 2025 23:38:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931800.1333987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tz0MH-0005J4-Tq; Sun, 30 Mar 2025 21:38:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931800.1333987; Sun, 30 Mar 2025 21:38:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tz0MH-0005GD-RC; Sun, 30 Mar 2025 21:38:21 +0000
Received: by outflank-mailman (input) for mailman id 931800;
 Sun, 30 Mar 2025 21:38:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tz0MG-0005G7-3D
 for xen-devel@lists.xenproject.org; Sun, 30 Mar 2025 21:38:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tz0MF-000W6M-1g;
 Sun, 30 Mar 2025 21:38:19 +0000
Received: from [2a02:8012:3a1:0:51d5:4bad:16b9:5cff]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tz0MF-00ATV1-18;
 Sun, 30 Mar 2025 21:38:19 +0000
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
	bh=cJyQTLDDdQqqF9KVwvNK4TW/cU9KPxuZA2l1TwsEATU=; b=zaxyHQQM5xPzgeU1jpZaspT0Rh
	JUdmD+exogPXqlipEP/vtc/TmmntSxjvahBk+QWpol2hY7mDiRZtq9dIM7ivgebFREqGxkuffhv5i
	tFm1EthEVSBU0352UZOW7ZYE4fhOgQP9aSAXbmF1NLupV+EOURGaVWpmlRWuqB6U7vSU=;
Message-ID: <504f5df7-4d23-4fbd-a15d-632262f2b685@xen.org>
Date: Sun, 30 Mar 2025 22:38:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] xen/arm: ffa: Enable VM to VM without firmware
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "jens.wiklander@linaro.org" <jens.wiklander@linaro.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1742824138.git.bertrand.marquis@arm.com>
 <0f5cf498c3c511ed192e8b7b7d0f4987e00e5c0d.1742824138.git.bertrand.marquis@arm.com>
 <6727ece4-d589-4ab4-9172-07dd6a7f2b44@xen.org>
 <8742853A-E32D-4BA5-AA4D-C69A2FCAEE85@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8742853A-E32D-4BA5-AA4D-C69A2FCAEE85@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 27/03/2025 08:37, Bertrand Marquis wrote:
>> On 27 Mar 2025, at 00:41, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Bertrand,
>>
>> On 24/03/2025 13:53, Bertrand Marquis wrote:
>>> When VM to VM support is activated and there is no suitable FF-A support
>>> in the firmware, enable FF-A support for VMs to allow using it for VM to
>>> VM communications.
>>
>> tee/ and the callbacks associated are meant to be used for mediatiors. My current interpretation ist this is only meant to interpose between a guest and physical resources. Here you are extending the meaning to "virtual TEE". I am sort of ok with that but ...
> 
> I see what you mean but FF-A will not only be used to communicate with TEE (even if the primary use case right now is this one, including have it in a VM instead of the secure world).
 > >>
>>> If there is OP-TEE running in the secure world and using the non FF-A
>>> communication system, having CONFIG_FFA_VM_TO_VM could be non functional
>>> (if optee is probed first) or OP-TEE could be non functional (if FF-A is
>>> probed first) so it is not recommended to activate the configuration
>>> option for such systems.
>>
>> ... this part is concerning me. You should be able to build with CONFIG_FFA_VM_TO_VM and still boot when OP-TEE is present on the system. This is not too critical now as this is tech preview but this is definitely a blocker for making FFA supported. Can this be mentioned at the top of the ffa.c file (which already contains existing blocker)?
> 
> OP-TEE supports FF-A and in fact should be switched to using it by default as it allows it to run in parallel of other TEEs in the secure world or have FF-A compliant SPs running on top of OP-TEE.
> More and more you will see FF-A popping up as a recommended (or required) part of the firmware features.
> 
> So the only reason to use OP-TEE without FF-A is if you have an old OP-TEE in which case your firmware will not support FF-A and using it between VMs is probably not required.

Thanks for the clarification. I know we only support OP-TEE in Xen 
today, but do you know what will happen for the other TEEs? Will they 
adopt FF-A?

> 
>>
>> Also, given this would expose a fully virtual TEE, we should be able to have a system where you have some VMs talking FFA and some using the physical OPTEE (or another TEE). Whether we want to support it is a different question but this design would prevent it. Is this intended?
> 
> Right now i would say this is definitely not something we need as part of the tech preview as anybody using this feature in Xen would use an OP-TEE with FF-A support.
> But from Xen point of view, we should (if we can) support running on old systems with an existing OP-TEE but still use FF-A between VMs.
> This has some consequences on how the tee mediator and FF-A support is designed and I will definitely give it some thoughts (primary idea would be to decouple FF-A with secure as mediator to FF-A between VMs somehow).

I am not sure we need to decouple anything. Today, we can already 
specify the type of the TEE used by a given VM (see tee_type). But we 
are enforcing the TEE type match the one of the current mediator.

So what if we allow multiple mediator to run and when the domain is 
initialized we select the correct medatior/ops for the VM?

For simplification, we could even hardocode FF-A as the second mediator.

> 
> For the review side of things, am I right to understand from your comments that this ok for now as tech-preview ?

Yes I am happy with the approach for now.

Cheers,

-- 
Julien Grall


