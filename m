Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C41954F05
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 18:40:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778697.1188715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sezzk-0000QN-A1; Fri, 16 Aug 2024 16:40:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778697.1188715; Fri, 16 Aug 2024 16:40:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sezzk-0000OO-7D; Fri, 16 Aug 2024 16:40:08 +0000
Received: by outflank-mailman (input) for mailman id 778697;
 Fri, 16 Aug 2024 16:40:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sezzj-0000OI-76
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 16:40:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sezzi-0002sS-Jx; Fri, 16 Aug 2024 16:40:06 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sezzi-0001ru-Bt; Fri, 16 Aug 2024 16:40:06 +0000
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
	bh=5MzqIK/eCn4E+CRib19EJGsAPzzCbbeOK8Ip3geiqTQ=; b=q5Os4PCwkWdvYE1htZu0/tC2Eq
	zVP8mWtIT8VRZNWRYqi20Yhec5OV2CgBQq2462k/63xH6noV1cjUuDPF86uHl0IqVfqdszBR5IT9L
	QTIcar1NRWjMdRt9oxPcu0MEqpDB2EmA8EdPjNDXjIEbYDmRcxYlIjcIpL+JSIo8V/YY=;
Message-ID: <9fd1801c-1460-44e5-b066-f6da1167543b@xen.org>
Date: Fri, 16 Aug 2024 17:40:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] xen: make VMAP only support in MMU system
Content-Language: en-GB
To: Ayan Kumar Halder <ayankuma@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, Penny Zheng <penny.zheng@arm.com>,
 Wei Chen <wei.chen@arm.com>, sstabellini@kernel.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com
References: <20240813171356.46760-1-ayan.kumar.halder@amd.com>
 <20240813171356.46760-3-ayan.kumar.halder@amd.com>
 <6d333d94-80ad-485c-b024-a45a388b96a4@suse.com>
 <ef789757-8c03-4f97-9bfb-8ec2fd2f4ca2@amd.com>
 <dad27ab7-3cbd-4a8e-8200-adea52b26e55@suse.com>
 <597b358e-3b45-4fba-922d-31208b55d15a@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <597b358e-3b45-4fba-922d-31208b55d15a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 14/08/2024 13:33, Ayan Kumar Halder wrote:
> Hi Jan,
> 
> On 14/08/2024 12:35, Jan Beulich wrote:
>> On 14.08.2024 12:55, Ayan Kumar Halder wrote:
>>> Hi Jan,
>>>
>>> On 14/08/2024 07:37, Jan Beulich wrote:
>>>> On 13.08.2024 19:13, Ayan Kumar Halder wrote:
>>>>> From: Penny Zheng <penny.zheng@arm.com>
>>>>>
>>>>> Introduced CONFIG_VMAP which is selected by the architectures that use
>>>>> MMU. vm_init() does not do anything if CONFIG_VMAP is not enabled.
>>>>>
>>>>> VMAP is widely used in ALTERNATIVE feature to remap a range of memory
>>>>> with new memory attributes. Since this is highly dependent on virtual
>>>>> address translation, we choose to fold VMAP in MMU system.
>>>>>
>>>>> In this patch, we introduce a new Kconfig CONFIG_HAS_VMAP, and make it
>>>>> only support in MMU system on ARM architecture. And ALTERNATIVE now
>>>>> depends on VMAP.
>>>>>
>>>>> HARDEN_BRANCH_PREDICTOR is now gated on HAS_VMAP as speculative
>>>>> attacks are not possible on non MMU based systems (ie Cortex-R52, 
>>>>> R82).
>>>>> See https://developer.arm.com/Arm%20Security%20Center/ 
>>>>> Speculative%20Processor%20Vulnerability.
>>>> While I'm not an Arm expert and hence I'm likely missing aspects, I 
>>>> question
>>>> the one (Spectre-BHB) vulnerability there to be sufficient to draw a
>>>> conclusion towards the usefulness of branch hardening. I would advise
>>>> against encoding such a connection in the Kconfig dependencies.
>>> AFAIU, to address 'Spectre' like vulnerabilities 'branch hardening' was
>>> added.
>>>
>>> See https://lore.kernel.org/all/E1fNadD-0000fz-9r@rmk- 
>>> PC.armlinux.org.uk/
>>>
>>> And from
>>> https://lists.linaro.org/archives/list/linux-stable- 
>>> mirror@lists.linaro.org/message/F4MGL4WT2R7T54NLRDGKFRQNSXF3DZGD/
>>>
>>> Spectre is valid on MMU based systems.
>> Since then various other issues / flavors were found. I've been focusing
>> on the x86 side of things, but I'd be very surprised if some didn't
>> affect other architectures as well.
> 
> We are talking about Arm here as "HARDEN_BRANCH_PREDICTOR" is specific 
> to Arm.
> 
> https://developer.arm.com/Arm%20Security%20Center/ 
> Speculative%20Processor%20Vulnerability covers all the flavours and it 
> does not include Cortex-R82 or R52.
> 
> It says the following :-
> 
> "Cortex-R cores typically use a closed software stack. In those 
> environments, applications or processes are strictly controlled, and 
> therefore not exploitable"
> 
>> Plus branch hardening can be a pre-
>> cautionary measure, too, I think.
> 
> The first two Arm non MMU cores that we wish to support in the 
> forthcoming series is Cortex-R82 and R52.
> 
> As seen in https://developer.arm.com/documentation/ka005109/latest/, it 
> explicitly states the following about R82
> 
> The Cortex-R82 implements the faulting feature (FEAT_FPAC) but is not 
> vulnerable. The Cortex-R82 behaves differently than vulnerable A-class 
> CPUs when speculatively executing past an instruction that authenticates 
> PAC, and that behavior does not allow the attack software to create the 
> "oracle".

I am confused. This is describing why R82 is not affected by PACMAN. But 
the Kconfig HARDEN_BRANCH_PREDICTOR is not for that (Xen doesn't yet use 
Pointer Authentification Codes). The Kconfig was introduced with XSA-254 
which predates PACMAN by nearly 4 years.

> 
> We can re-enable branch hardening if we know there is a valid non MMU 
> Arm core which is vulnerable.

Re-quoting what you wrote earlier:

"Cortex-R cores typically use a closed software stack. In those
environments, applications or processes are strictly controlled, and
therefore not exploitable"

It is quite subtle. This wording doesn't imply the cores are not 
vulnerable. It says that if they are, then it would be difficult to 
exploit because the software should be tightly controlled.

Now this would be really up to the user to decide whether they want to 
be extra cautious/futureproof or not.

As we are at the beginning of the MPU support, then I don't think we 
need to resolve issue right now. And it would be fine to gate it. But 
maybe ARCH_VMAP was an incorrect suggestion. It might be better to gate 
with the !MMU (IIRC this would imply MPU).

But before the feature can be marked as security support. We will need 
to agree on how the hypervisor is intended to be used on ARMv8-R. Maybe 
it would need a caveat "only trusted software can be run" which means we 
don't have to worry about speculation on Cortex-R. Although, it would be 
nice to have some defense in-depth :).

Cheers,

-- 
Julien Grall


