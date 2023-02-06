Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF4168C435
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 18:08:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490655.759456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP4yH-0004kK-Oj; Mon, 06 Feb 2023 17:08:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490655.759456; Mon, 06 Feb 2023 17:08:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP4yH-0004ic-LT; Mon, 06 Feb 2023 17:08:01 +0000
Received: by outflank-mailman (input) for mailman id 490655;
 Mon, 06 Feb 2023 17:07:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pP4yF-0004iW-B9
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 17:07:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pP4y8-000620-UD; Mon, 06 Feb 2023 17:07:52 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.13.231]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pP4y8-0000sV-N8; Mon, 06 Feb 2023 17:07:52 +0000
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
	bh=O+IH0CODgK6C59yuZASs+SvNoF6Rdvd/FoLJo7Wq58I=; b=1Vi4O/0dH8sYfZfhiJC6hACKov
	2qC4YbC+SmI1Csh5tGGh/4d7OQ/5JWTge3TVPbOpBatbb3iGp08+t804TLw8Fbv70NQSvyBXysZ2m
	Cnip6SHaOEzI51b4GB23gGozhP89yxIAP1hmh/3sCpofrUOfjv1FhZ17M/Byu77YWtYw=;
Message-ID: <1d685b34-940b-b8ca-e689-b5a42eaccea1@xen.org>
Date: Mon, 6 Feb 2023 17:07:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH] xen/arm64: Default ACPI support enabled
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
References: <202302031801.313I1SdK033264@m5p.com>
 <df51bbdc-ab88-7254-799e-0e2828d3d1a9@suse.com>
 <15b88500-89b0-507a-601c-84a8102bb550@xen.org>
 <Y+EmIHDyvSCHjEo+@mattapan.m5p.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <Y+EmIHDyvSCHjEo+@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Elliott,

On 06/02/2023 16:09, Elliott Mitchell wrote:
> On Mon, Feb 06, 2023 at 10:38:32AM +0000, Julien Grall wrote:
>>
>> On 06/02/2023 07:29, Jan Beulich wrote:
>>> On 22.07.2020 19:43, Elliott Mitchell wrote:
>>>> Unlike other unsupportted options, ACPI support is required to *boot*
>>>> for a number of platforms.  Users on these platforms are unable to use
>>>> distribution builds and must rebuild from source to use Xen.
>>>>
>>>> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
>>>
>>> A general question first: How come this mail dates back to July 2020? I
>>> had almost missed it as "new".
>>
>> I can't even find the Elliott's email in my inbox so reply here. But
>> this sounds like a rehash of [1].
> 
> The date on Git patches is meant as an indicator for author date.  Since
> this is a cherry-pick of a patch which was written >2 years ago
> `git format-patch` indicates when it was written.  This IS how these
> systems work.

Hmmm... I am a bit surprised to what you say. I have sent several 
patches in the past with an old author date and they always showed as 
the date sent in my inbox.

> 
>>   >> Unlike other unsupportted options, ACPI support is required to *boot*
>>   >> for a number of platforms.  Users on these platforms are unable to use
>>   >> distribution builds and must rebuild from source to use Xen.
>>
>> What platforms are you testing on? I know that this is working-ish on
>> RPI4 and QEMU. But this will likely blow up on one of the server we
>> support in OSSTest because we don't have proper support to hide SMMUs in
>> dom0.
> 
> I've been doing RPI4 w/EDK2.  Which works for my purpose, the remaining
> trouble spot for my purpose is needing a final resolution of the EFIFB
> situation.

I have had no feedback from the relevant person on EFIFB patch and I am 
not planning to purse the work in the near future.

> 
>>>> --- a/xen/arch/arm/Kconfig
>>>> +++ b/xen/arch/arm/Kconfig
>>>> @@ -29,13 +29,18 @@ menu "Architecture Features"
>>>>    source "arch/Kconfig"
>>>>    
>>>>    config ACPI
>>>> -	bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPORTED)" if UNSUPPORTED
>>>> +	bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPORTED)"
>>
>> The concerns I raised in [1] still stand. Most of the ACPI platform will
>> also have support for IOMMUs. If we have support for IORT in Xen, then I
>> would be a lot more amenable to remove the "UNSUPPORTED". And without
>> that support we are going to do more harm and than good.
> 
> Okay, this has been a known issue for *years* and yet remains unresolved
> despite being a major issue.

Right, the situation hasn't changed much since you last sent your patch 
to drop EXPERT/UNSUPPORTED.

Unless you fancy working on ACPI, I don't really see the situation 
changing soon.

>  Might be an abomination, but would it work
> to find the string "IORT" and change it to "iort", "RTIO" or "IOXN" to
> prevent Dom0 from finding it?

Unfortunately no because there IORT is used to describing mapping for 
the GICv3 ITS which is currently working when ACPI is enabled in Xen.

> 
> This ends up turning into a question of what are the cases and which are
> more common?
> 
> Case1: DT-only: Unchanged
> 
> Case2: Switchable between DT and ACPI, w/o SMMU: Starts working with ACPI
> 
> Case3: Switchable between DT and ACPI, w/SMMU: Unchanged, ACPI mode still
> doesn't work, but the failure is different.
> 
> Case4: Concurrent DT and ACPI support, w/o SMMU: Unchanged

So Xen would start using ACPI rather than DT.I think we should default 
DT it until we have the ACPI support completed.

> 
> Case5: Concurrent DT and ACPI support, w/SMMU: Breaks if Dom0 tries to
> use ACPI
> 
> Case6: ACPI-only, w/o SMMU: Starts working out-of-box
> 
> Case7: ACPI-only, w/SMMU: Unchanged (still broken)

To clarify, this will boot but then start to break in very subtle way.

> 
> Any other distinct cases of note?

Nothing AFAICT.

> So case 5 is a problem, but cases 2 and 6 are positive.  Does the classic
> workaround of "acpi=off" work for Linux as Dom0?  If that is "yes", then
> publicizing that workaround (should be detectable by Xen) seems a likely
> short-term solution.
> 
> My impression is ACPI is getting increasing support in on ARM.  The
> number of mentions suggests if they keep going it looks likely to win.
> The EDK2 project has been providing an image for RPI4 and the
> functionality is impressive.

AFAIK, the push is drove by Arm Server and Windows on Arm. Does EDK2 on 
RPI4 still provide both DT and ACPI?

> 
> Ultimately this is more a decision for Xen Project management, than the
> technical side.  Are things in shape where they can be rolled out?

No. But as I wrote before, I don't believe the gap is very big.

>  Is
> ACPI support important enough to need rolling out now?
> 
> I'm unsure about the former, but the latter seems a distinct "yes" since
> ACPI appears to be the future.

ACPI is indeed picking up the pace on Arm Server and platform where 
Windows on Arm is supported. But that should not only be the reason to 
remove UNSUPPORTED.

You are right that enabling ACPI by default will draw more users. But I 
also expect those users to be less familiar with Xen and therefore not 
very interested to fix bugs. So removing EXPERT/UNSUPPORTED is probably 
going to still make them unhappy as I don't think the help (including 
writing patch) for ACPI on Arm will change very much in the near future 
(from the community call I was under the impression you could not commit 
time for it).

So I am not convinced this is really making Xen in a better position 
right now.

Cheers,

-- 
Julien Grall

