Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 407DE29D17F
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 19:37:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13816.34560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXqJ6-0006QC-Rb; Wed, 28 Oct 2020 18:36:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13816.34560; Wed, 28 Oct 2020 18:36:24 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXqJ6-0006Pp-O6; Wed, 28 Oct 2020 18:36:24 +0000
Received: by outflank-mailman (input) for mailman id 13816;
 Wed, 28 Oct 2020 18:36:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HSML=ED=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kXqJ5-0006Pk-3R
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 18:36:23 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 689dee8f-9d11-46cc-ba57-53faf97fa844;
 Wed, 28 Oct 2020 18:36:21 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kXqIz-0000bu-7d; Wed, 28 Oct 2020 18:36:17 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kXqIy-0001QX-W2; Wed, 28 Oct 2020 18:36:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=HSML=ED=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kXqJ5-0006Pk-3R
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 18:36:23 +0000
X-Inumbo-ID: 689dee8f-9d11-46cc-ba57-53faf97fa844
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 689dee8f-9d11-46cc-ba57-53faf97fa844;
	Wed, 28 Oct 2020 18:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=LUrcTcFN0QRq9BA2TyUj84Y4q85VI4gMkfX2e7gxxMA=; b=1dj6Es7iWMVrolp+U2F30eNoTA
	q5K8hhtCUCiMZaDgST+aO/+NLRNRns9Ra8//qgrKuJpbdhMIEl5tRQzRuSWuEt+7TN6sYya5txe63
	qEejtOrXWsotuH1T8QyRcgSPvOt5oDFTn2IAIuOSqTn4or621dJjrO9o+LGaGGC/y8ik=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kXqIz-0000bu-7d; Wed, 28 Oct 2020 18:36:17 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kXqIy-0001QX-W2; Wed, 28 Oct 2020 18:36:17 +0000
Subject: Re: [PATCH v2 3/3] xen/arm: Warn user on cpu errata 832075
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <a6fc6cfd71d6d53cf89bf533a348bda799b25d7d.1603728729.git.bertrand.marquis@arm.com>
 <4d62bc0844576b80e00ea48e318be238a4d73eae.1603728729.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.21.2010271540110.12247@sstabellini-ThinkPad-T480s>
 <759F39C4-F834-4BFC-B897-714612AEACD8@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <50410a64-634a-1445-e16f-468b7d943f9b@xen.org>
Date: Wed, 28 Oct 2020 18:36:14 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <759F39C4-F834-4BFC-B897-714612AEACD8@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 28/10/2020 08:43, Bertrand Marquis wrote:
> 
> 
>> On 27 Oct 2020, at 22:44, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>
>> On Mon, 26 Oct 2020, Bertrand Marquis wrote:
>>> When a Cortex A57 processor is affected by CPU errata 832075, a guest
>>> not implementing the workaround for it could deadlock the system.
>>> Add a warning during boot informing the user that only trusted guests
>>> should be executed on the system.
>>> An equivalent warning is already given to the user by KVM on cores
>>> affected by this errata.
>>>
>>> Also taint the hypervisor as unsecure when this errata applies and
>>> mention Cortex A57 r0p0 - r1p2 as not security supported in SUPPORT.md
>>>
>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>> ---
>>> SUPPORT.md               |  1 +
>>> xen/arch/arm/cpuerrata.c | 13 +++++++++++++
>>> 2 files changed, 14 insertions(+)
>>>
>>> diff --git a/SUPPORT.md b/SUPPORT.md
>>> index 5fbe5fc444..f7a3b046b0 100644
>>> --- a/SUPPORT.md
>>> +++ b/SUPPORT.md
>>> @@ -38,6 +38,7 @@ supported in this document.
>>> ### ARM v8
>>>
>>>      Status: Supported
>>> +    Status, Cortex A57 r0p0 - r1p2, not security supported (Errata 832075)
>>>
>>> ## Host hardware support
>>>
>>> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
>>> index 0430069a84..b35e8cd0b9 100644
>>> --- a/xen/arch/arm/cpuerrata.c
>>> +++ b/xen/arch/arm/cpuerrata.c
>>> @@ -503,6 +503,19 @@ void check_local_cpu_errata(void)
>>> void __init enable_errata_workarounds(void)
>>> {
>>>      enable_cpu_capabilities(arm_errata);
>>> +
>>> +#ifdef CONFIG_ARM64_ERRATUM_832075
>>> +    if ( cpus_have_cap(ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE) )
>>> +    {
>>> +        printk_once("**** This CPU is affected by the errata 832075. ****\n"
>>> +                    "**** Guests without CPU erratum workarounds     ****\n"
>>> +                    "**** can deadlock the system!                   ****\n"
>>> +                    "**** Only trusted guests should be used.        ****\n");
>>
>> These can be on 2 lines, no need to be on 4 lines.
> 
> I can fix that in a v3.
> 
>>
>>
>> I know that Julien wrote about printing the warning from
>> enable_errata_workarounds but to me it looks more natural if we did it
>> from the .enable function specific to ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE.
> 
> I have no preference either here but i kind of like this way because if we had more warnings
> they would allow be at the same place.

So I add this placement in mind because the previous version was using 
warning_add() (It can't be called from non-init helper). As we are using 
printk_once() now, I don't really have a preference.

So I would stick with what you wrote.

Cheers,

-- 
Julien Grall

