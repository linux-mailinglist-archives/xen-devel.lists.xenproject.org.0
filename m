Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5FE99587E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 22:32:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813533.1226513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syGs3-0001QY-Ur; Tue, 08 Oct 2024 20:31:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813533.1226513; Tue, 08 Oct 2024 20:31:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syGs3-0001O7-RT; Tue, 08 Oct 2024 20:31:51 +0000
Received: by outflank-mailman (input) for mailman id 813533;
 Tue, 08 Oct 2024 20:31:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1syGs1-0001Nv-RK
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 20:31:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1syGs0-0001hZ-V0; Tue, 08 Oct 2024 20:31:48 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1syGs0-0000DA-O6; Tue, 08 Oct 2024 20:31:48 +0000
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
	bh=uXjA5NYn5SalPiKV3aG7Ti5nzksIfO3TYPWZtziyO8o=; b=f0PsnuJq61sJdSvhYLDLJ3H7rH
	UCOsTVypj7AszpkblEh6sgN+FIwFBDN3FLbSMgS6zkzo8MQ+EysnYBlVXgku18oCWYSIbImrnmQPA
	d6NfGXdhsXGWY7/19vSTytVgYqfKQyn0Jcx4rGzbEREB+4u4DxkDRLSq3HFvBOkZHnD0=;
Message-ID: <e2acb3bc-85ef-4d46-b392-5f1dad013226@xen.org>
Date: Tue, 8 Oct 2024 21:31:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] xen/arm: platforms: Add NXP S32CC platform code
Content-Language: en-GB
To: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
 <20240930114715.642978-6-andrei.cherechesu@oss.nxp.com>
 <94dc1668-5215-424c-9dcb-1e343451d464@xen.org>
 <b8419295-cc63-41b3-9f2d-277d81e5f85a@oss.nxp.com>
 <a24807bd-5224-4110-bc0e-946287f5c90e@xen.org>
 <1de8ea10-f801-45b9-ab6a-25465ecd6b76@oss.nxp.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1de8ea10-f801-45b9-ab6a-25465ecd6b76@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 08/10/2024 20:01, Andrei Cherechesu wrote:
> Hi Julien,
> 
> On 04/10/2024 19:24, Julien Grall wrote:
>>
>>
>> On 04/10/2024 16:37, Andrei Cherechesu wrote:
>>> Hi Julien, Stefano,
>>
>> Hi Andrei,
>>
>>>
>>> On 01/10/2024 13:01, Julien Grall wrote:
>>>> Hi Andrei,
>>>>
>>>> On 30/09/2024 12:47, Andrei Cherechesu (OSS) wrote:
>>>>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>>>
>>>>> Add code for NXP S32CC platforms (S32G2, S32G3, S32R45).
>>>>>
>>>>> S32CC platforms use the NXP LINFlexD UART driver for
>>>>> console by default, and rely on Dom0 having access to
>>>>> SCMI services for system-level resources from firmware
>>>>> at EL3.
>>>>>
>>>>> Platform-related quirks will be addressed in following
>>>>> commits.
>>>>
>>>> I don't see any specific quirks in the series. Are you intended to send follow-up?
>>>>
>>>> [...]
>>>
>>> Well, we could use an opinion on some SoC erratum implementation
>>> and if it would be acceptable for you or not, from any of
>>> the ARM maintainers.
>>>
>>> The erratum is about some TLB Invalidate (tlbi) instruction
>>> variants (by Virtual Address) which are handled incorrectly
>>> in some cases (for some VAs), and that need to be replaced
>>> with broader versions.
>>
>> Can you provide more details:
>>    1. Is this a processor issue?
>>    2. Which VAs are affected?
>>    3. What is the impact if the erratum is hit?
>>    3. Do we need to do anything on the behalf of the guests?
> 
> Sure:
> 1. This is an SoC issue, present in a subset of the S32CC processors family.
> 2. VAs whose bits [48:41] are not all zero.
> 3. Well, TLB corruption.

Can you provide a bit more details? Is it a corruption within the same 
stage/ASID/VMID? IOW if a guest corrupt the TLB, does this mean only the 
stage-1?

Also, if a guest manage to corrupt its TLB, does this mean it could end 
up to access host physical address it should not?

BTW, do you have any more documentation about the erratum?

> 4. There are instructions affected at both levels 1 and 2 of translation.
> The guest will have to work its own way around it.
> 
> In Xen, just `tlbi vae2is` (only used in flush_xen_tlb_range_va()) seems to
> be affected, and if we go with the 2nd approach from the ones proposed,
> it should not be very ugly to implement. I am of course open to any of your
> suggestions.
> 
>>
>>
>>> It doesn't apply for all S32CC platforms, but we can use the
>>> Host DT compatible to identify this. My idea is that we define
>>> a platform quirk for this and check for it using
>>> platform_has_quirk().
>>> Then, we either:>      - modify the definition for the affected 'tlbi' variant
>>>       in arm64/flushtlb.h to actually execute the broader one
>>>       if needed
>>> or:
>>>       - define a new wrapper for the tlbi variant we want to
>>>       replace the affected one with
>>>       - check for this quirk before its usage and call the
>>>       more potent version if needed (there's only one
>>>       occurrence of usage for the affected version).
>>>
>>> Number 2 seems better to me, it's more customizable and
>>> it's similar to the existing handling for
>>> PLATFORM_QUIRK_GIC_64K_STRIDE for some other Arm platform.
>>
>> I need a bit more details first (see my questions above). But if there are not many VAs affected, then we may be able to re-order the Xen memory layout to avoid the VAs. So we wouldn't need any specific change in the TLB flush operations.
> 
> I'm not sure what to say here, we would need to have the layout
> limited under the mentioned VA range in our case, right?

Correct. Is your SoC going to ever have more than a couple of TBs of memory?

> What
> about the GVA layout?

That's control by the guest. We could potentially tell the guest less VA 
is supported, but it is free to ignore.

Can you clarify why we would need to care about the GVA layout?

Cheers,

-- 
Julien Grall

