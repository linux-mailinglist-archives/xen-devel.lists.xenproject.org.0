Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2072D61DF
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 17:31:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49532.87610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knOq6-0003EP-5y; Thu, 10 Dec 2020 16:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49532.87610; Thu, 10 Dec 2020 16:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knOq6-0003DY-26; Thu, 10 Dec 2020 16:30:46 +0000
Received: by outflank-mailman (input) for mailman id 49532;
 Thu, 10 Dec 2020 16:30:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1knOq5-0003DT-3O
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 16:30:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1knOq3-0003c8-ON; Thu, 10 Dec 2020 16:30:43 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1knOq3-0005qV-CG; Thu, 10 Dec 2020 16:30:43 +0000
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
	bh=npKr7XdwcZ3GccZnUcDMIlTKerkkAejcVfNbm6eTs8s=; b=fo5lNWV9JCN/80ouedDxPk+kOD
	gt8ZDNT0DKU5ZVP2huByoK/RuVD/MNH7rDQkBfbQJNIgx4NLbtgIFnxQOpKKEDkBT6PQsR9gL/HVS
	+sQoBZraFL7TRtTRnXudwdIBP7kd7qE/gbJDHpZow+xUUk3jLurmi8k0zVGChsZzSk0g=;
Subject: Re: [PATCH v3 3/7] xen/arm: create a cpuinfo structure for guest
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1607524536.git.bertrand.marquis@arm.com>
 <33f39e7f521e6f73a0dba57a8be9fb50656e1807.1607524536.git.bertrand.marquis@arm.com>
 <61b2677c-bc0d-af0b-95f8-f8de76a20856@xen.org>
 <BD35BA39-FE40-4752-9B21-CCD0F0D963B0@arm.com>
 <0ad1c0d0-a3f2-da98-0a0f-b90736cc11dc@xen.org>
 <FA121B9D-0B9F-4636-A7FC-0548C05E31F0@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3630cf94-1fb8-a337-dde7-16907da9af3f@xen.org>
Date: Thu, 10 Dec 2020 16:30:41 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <FA121B9D-0B9F-4636-A7FC-0548C05E31F0@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 10/12/2020 16:17, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

>> On 10 Dec 2020, at 16:05, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 10/12/2020 15:48, Bertrand Marquis wrote:
>>> Hi Julien,
>>>> On 9 Dec 2020, at 23:09, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> Hi Bertand,
>>>>
>>>> On 09/12/2020 16:30, Bertrand Marquis wrote:
>>>>> Create a cpuinfo structure for guest and mask into it the features that
>>>>> we do not support in Xen or that we do not want to publish to guests.
>>>>> Modify some values in the cpuinfo structure for guests to mask some
>>>>> features which we do not want to allow to guests (like AMU) or we do not
>>>>> support (like SVE).
>>>>> The code is trying to group together registers modifications for the
>>>>> same feature to be able in the long term to easily enable/disable a
>>>>> feature depending on user parameters or add other registers modification
>>>>> in the same place (like enabling/disabling HCR bits).
>>>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>>> ---
>>>>> Changes in V2: Rebase
>>>>> Changes in V3:
>>>>>    Use current_cpu_data info instead of recalling identify_cpu
>>>>> ---
>>>>>   xen/arch/arm/cpufeature.c        | 51 ++++++++++++++++++++++++++++++++
>>>>>   xen/include/asm-arm/cpufeature.h |  2 ++
>>>>>   2 files changed, 53 insertions(+)
>>>>> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
>>>>> index bc7ee5ac95..7255383504 100644
>>>>> --- a/xen/arch/arm/cpufeature.c
>>>>> +++ b/xen/arch/arm/cpufeature.c
>>>>> @@ -24,6 +24,8 @@
>>>>>     DECLARE_BITMAP(cpu_hwcaps, ARM_NCAPS);
>>>>>   +struct cpuinfo_arm __read_mostly guest_cpuinfo;
>>>>> +
>>>>>   void update_cpu_capabilities(const struct arm_cpu_capabilities *caps,
>>>>>                                const char *info)
>>>>>   {
>>>>> @@ -157,6 +159,55 @@ void identify_cpu(struct cpuinfo_arm *c)
>>>>>   #endif
>>>>>   }
>>>>>   +/*
>>>>> + * This function is creating a cpuinfo structure with values modified to mask
>>>>> + * all cpu features that should not be published to guest.
>>>>> + * The created structure is then used to provide ID registers values to guests.
>>>>> + */
>>>>> +static int __init create_guest_cpuinfo(void)
>>>>> +{
>>>>> +    /*
>>>>> +     * TODO: The code is currently using only the features detected on the boot
>>>>> +     * core. In the long term we should try to compute values containing only
>>>>> +     * features supported by all cores.
>>>>> +     */
>>>>> +    guest_cpuinfo = current_cpu_data;
>>>>
>>>> It would be more logical to use boot_cpu_data as this would be easier to match with your comment.
>>> Agree, I will fix that in V4.
>>>>
>>>>> +
>>>>> +#ifdef CONFIG_ARM_64
>>>>> +    /* Disable MPAM as xen does not support it */
>>>>> +    guest_cpuinfo.pfr64.mpam = 0;
>>>>> +    guest_cpuinfo.pfr64.mpam_frac = 0;
>>>>> +
>>>>> +    /* Disable SVE as Xen does not support it */
>>>>> +    guest_cpuinfo.pfr64.sve = 0;
>>>>> +    guest_cpuinfo.zfr64.bits[0] = 0;
>>>>> +
>>>>> +    /* Disable MTE as Xen does not support it */
>>>>> +    guest_cpuinfo.pfr64.mte = 0;
>>>>> +#endif
>>>>> +
>>>>> +    /* Disable AMU */
>>>>> +#ifdef CONFIG_ARM_64
>>>>> +    guest_cpuinfo.pfr64.amu = 0;
>>>>> +#endif
>>>>> +    guest_cpuinfo.pfr32.amu = 0;
>>>>> +
>>>>> +    /* Disable RAS as Xen does not support it */
>>>>> +#ifdef CONFIG_ARM_64
>>>>> +    guest_cpuinfo.pfr64.ras = 0;
>>>>> +    guest_cpuinfo.pfr64.ras_frac = 0;
>>>>> +#endif
>>>>> +    guest_cpuinfo.pfr32.ras = 0;
>>>>> +    guest_cpuinfo.pfr32.ras_frac = 0;
>>>>
>>>> How about all the fields that are currently marked as RES0/RES1? Shouldn't we make sure they will stay like that even if newer architecture use them?
>>> Definitely we can do more then this here (including allowing to enable some things for dom0 or for test reasons).
>>> This is a first try to solve current issues with MPAM and SVE and I plan to continue to enhance this in the future
>>> to enable more customisation here.
>>> I do think we could do a bit more here to have some features controlled by the user but this will need a bit of
>>> discussion to agree on a strategy.
>>
>> I think you misunderstood my comment. I am not asking whether we want to customize the value per domain. Instead, I am raising questions for the strategy taken in this patch.
>>
>> I am going to leave the safety aside, because I think this is orthogonal to this patch.
>>
>> This patch is introducing a deny list. This means that all the features will be exposed to a domain unless someone determine that this is not
>> supported by Xen.
>>
>> This means we will always try to catch up with what Arm decided to invent and attempt to fix it before the silicon is out.
>>
>> Instead, I think it would be better to use an allow list. We should only expose features to the guest we know works (this could possibly be just the Armv8.0 one).
> 
> I understood that and I fully agree that this is what we should do: only expose what we support and know and let everything else as “disabled”.
> And I definitely want to do that and I think with this serie we have the required support to do that, we will need to rework how we initialise the
> guest_cpuinfo structure.
> 
> I just want to leave this discussion for after so that we can at least right now have a current linux booting without the need to modify the linux
> kernel binary to remove things like SVE.

Ok. So this patch is more to fill the gap rather than the final 
solution. This should be clarified in the commit message.

Although, it is still unclear to me why this can't be an allowlist from 
the start. As you said, the infrastructure is already there. So it would 
be a matter of copying bits we know work with Xen (rather than cloberring).

Cheers,

-- 
Julien Grall

