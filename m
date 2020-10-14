Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DA828E543
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 19:22:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6924.18111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSkTX-0002bl-W6; Wed, 14 Oct 2020 17:22:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6924.18111; Wed, 14 Oct 2020 17:22:07 +0000
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
	id 1kSkTX-0002bM-SS; Wed, 14 Oct 2020 17:22:07 +0000
Received: by outflank-mailman (input) for mailman id 6924;
 Wed, 14 Oct 2020 17:22:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MeL6=DV=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kSkTV-0002bH-LQ
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 17:22:05 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e728d711-da15-491b-a4b6-78a60af0244c;
 Wed, 14 Oct 2020 17:22:04 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kSkTT-0002OD-03; Wed, 14 Oct 2020 17:22:03 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kSkTS-0000P2-D1; Wed, 14 Oct 2020 17:22:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MeL6=DV=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kSkTV-0002bH-LQ
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 17:22:05 +0000
X-Inumbo-ID: e728d711-da15-491b-a4b6-78a60af0244c
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e728d711-da15-491b-a4b6-78a60af0244c;
	Wed, 14 Oct 2020 17:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Ls+4YOC0fgeNVpTgUvXE65IuxrYXZDVstu0AYEnVfF0=; b=ZbU1VXKisMiRO8vgo8EC94RDNf
	XR7mEVLyxNlf7otUSxSrYikcbKAGGRweqXJZYloI7Crhuvc0326Csqzzq7ekhvOHxrydNo4rsWN4o
	1vtREzWVOc9JAWcMOa3xmm9EbPBzhl97vlVLKW+A0dj0pk0Y21lVNvM3BWnUfTJ3Di+M=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kSkTT-0002OD-03; Wed, 14 Oct 2020 17:22:03 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kSkTS-0000P2-D1; Wed, 14 Oct 2020 17:22:02 +0000
Subject: Re: [PATCH] xen/arm: Warn user on cpu errata 832075
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <f11fe960a111530501fd0c20893bec4e32edf3cb.1602671985.git.bertrand.marquis@arm.com>
 <26742825-25fc-0f82-2b20-d536e8380b2a@citrix.com>
 <90BC5355-EB52-469F-B0A6-ACAAB9AD9EF5@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f49d478f-4efe-955e-c378-f2fa5fbc6a71@xen.org>
Date: Wed, 14 Oct 2020 18:22:00 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <90BC5355-EB52-469F-B0A6-ACAAB9AD9EF5@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 14/10/2020 17:03, Bertrand Marquis wrote:
> 
> 
>> On 14 Oct 2020, at 12:35, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> On 14/10/2020 11:41, Bertrand Marquis wrote:
>>> When a Cortex A57 processor is affected by CPU errata 832075, a guest
>>> not implementing the workaround for it could deadlock the system.
>>> Add a warning during boot informing the user that only trusted guests
>>> should be executed on the system.
>>> An equivalent warning is already given to the user by KVM on cores
>>> affected by this errata.
>>>
>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>> ---
>>> xen/arch/arm/cpuerrata.c | 21 +++++++++++++++++++++
>>> 1 file changed, 21 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
>>> index 6c09017515..8f9ab6dde1 100644
>>> --- a/xen/arch/arm/cpuerrata.c
>>> +++ b/xen/arch/arm/cpuerrata.c
>>> @@ -240,6 +240,26 @@ static int enable_ic_inv_hardening(void *data)
>>>
>>> #endif
>>>
>>> +#ifdef CONFIG_ARM64_ERRATUM_832075
>>> +
>>> +static int warn_device_load_acquire_errata(void *data)
>>> +{
>>> +    static bool warned = false;
>>> +
>>> +    if ( !warned )
>>> +    {
>>> +        warning_add("This CPU is affected by the errata 832075.\n"
>>> +                    "Guests without required CPU erratum workarounds\n"
>>> +                    "can deadlock the system!\n"
>>> +                    "Only trusted guests should be used on this system.\n");
>>> +        warned = true;
>>
>> This is an antipattern, which probably wants fixing elsewhere as well.
>>
>> warning_add() is __init.  It's not legitimate to call from a non-init
>> function, and a less useless build system would have modpost to object.
>>
>> The ARM_SMCCC_ARCH_WORKAROUND_1 instance asserts based on system state,
>> but this provides no safety at all.
>>
>>
>> What warning_add() actually does is queue messages for some point near
>> the end of boot.  It's not clear that this is even a clever thing to do.
>>
>> I'm very tempted to suggest a blanket change to printk_once().
> 
> If this is needed then this could be done in an other serie ?

The callback ->enable() will be called when a CPU is onlined/offlined. 
So this is going to require if you plan to support CPU hotplugs or 
suspend resume.

> Would be good to keep this patch as purely handling the errata.

In the case of this patch, how about moving the warning_add() in 
enable_errata_workarounds()?

By then we should now all the errata present on your platform. All CPUs 
onlined afterwards (i.e. runtime) should always abide to the set 
discover during boot.

Cheers,

-- 
Julien Grall

