Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F2968C974
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 23:33:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490740.759567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPA2K-0001Mn-6f; Mon, 06 Feb 2023 22:32:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490740.759567; Mon, 06 Feb 2023 22:32:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPA2K-0001LB-3m; Mon, 06 Feb 2023 22:32:32 +0000
Received: by outflank-mailman (input) for mailman id 490740;
 Mon, 06 Feb 2023 22:32:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pPA2I-0001L5-DQ
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 22:32:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pPA2C-0005Ty-HV; Mon, 06 Feb 2023 22:32:24 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pPA2C-0006Qy-Af; Mon, 06 Feb 2023 22:32:24 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=g2znekQW63nAZ8k2hF8K09p6l4jUYK6Zf2PQwsS7lfc=; b=Jd8wCoUHRyk8dfHuaHAf4NFKN4
	gY5fd1cx8IkemMkEsRNhuvKcyvaOGJpjnVXmtjDVIfvaDgroyEQx+auQSiPrG51RDL6rnvf1W0i1Z
	Nv2k2dQIoda8HRMe5VMA/lDyBsne14OiFgqSy4zbSNv96+t/B/j26hyKNRS4Y2be5vug=;
Message-ID: <3b2f49cd-195c-f69b-b5d4-681a7cad58d5@xen.org>
Date: Mon, 6 Feb 2023 22:32:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
References: <202302031801.313I1SdK033264@m5p.com>
 <df51bbdc-ab88-7254-799e-0e2828d3d1a9@suse.com>
 <15b88500-89b0-507a-601c-84a8102bb550@xen.org>
 <Y+EmIHDyvSCHjEo+@mattapan.m5p.com>
 <1d685b34-940b-b8ca-e689-b5a42eaccea1@xen.org>
 <Y+FjUTXdcoy3W9th@mattapan.m5p.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/arm64: Default ACPI support enabled
In-Reply-To: <Y+FjUTXdcoy3W9th@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06/02/2023 20:30, Elliott Mitchell wrote:
> On Mon, Feb 06, 2023 at 05:07:50PM +0000, Julien Grall wrote:
>>
>> On 06/02/2023 16:09, Elliott Mitchell wrote:
>>> On Mon, Feb 06, 2023 at 10:38:32AM +0000, Julien Grall wrote:
>>>>
>>>> On 06/02/2023 07:29, Jan Beulich wrote:
>>>>> On 22.07.2020 19:43, Elliott Mitchell wrote:
>>>>>> Unlike other unsupportted options, ACPI support is required to *boot*
>>>>>> for a number of platforms.  Users on these platforms are unable to use
>>>>>> distribution builds and must rebuild from source to use Xen.
>>>>>>
>>>>>> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
>>>>>
>>>>> A general question first: How come this mail dates back to July 2020? I
>>>>> had almost missed it as "new".
>>>>
>>>> I can't even find the Elliott's email in my inbox so reply here. But
>>>> this sounds like a rehash of [1].
>>>
>>> The date on Git patches is meant as an indicator for author date.  Since
>>> this is a cherry-pick of a patch which was written >2 years ago
>>> `git format-patch` indicates when it was written.  This IS how these
>>> systems work.
>>
>> Hmmm... I am a bit surprised to what you say. I have sent several
>> patches in the past with an old author date and they always showed as
>> the date sent in my inbox.
> 
> Dunno, but it was straight out of `git format-patch`.  I'm not using
> `git send-email` though (that requires a setup distinct from what I'm
> aiming for).

That's probably why.


>>>>    >> Unlike other unsupportted options, ACPI support is required to *boot*
>>>>    >> for a number of platforms.  Users on these platforms are unable to use
>>>>    >> distribution builds and must rebuild from source to use Xen.
>>>>
>>>> What platforms are you testing on? I know that this is working-ish on
>>>> RPI4 and QEMU. But this will likely blow up on one of the server we
>>>> support in OSSTest because we don't have proper support to hide SMMUs in
>>>> dom0.
>>>
>>> I've been doing RPI4 w/EDK2.  Which works for my purpose, the remaining
>>> trouble spot for my purpose is needing a final resolution of the EFIFB
>>> situation.
>>
>> I have had no feedback from the relevant person on EFIFB patch and I am
>> not planning to purse the work in the near future.
> 
> Okay, thanks for the news.  Hopefully efifb on Xen support gets into
> kernels closer to the Linux HEAD.
> 
> 
>>>>>> --- a/xen/arch/arm/Kconfig
>>>>>> +++ b/xen/arch/arm/Kconfig
>>>>>> @@ -29,13 +29,18 @@ menu "Architecture Features"
>>>>>>     source "arch/Kconfig"
>>>>>>     
>>>>>>     config ACPI
>>>>>> -	bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPORTED)" if UNSUPPORTED
>>>>>> +	bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPORTED)"
>>>>
>>>> The concerns I raised in [1] still stand. Most of the ACPI platform will
>>>> also have support for IOMMUs. If we have support for IORT in Xen, then I
>>>> would be a lot more amenable to remove the "UNSUPPORTED". And without
>>>> that support we are going to do more harm and than good.
>>>
>>> Okay, this has been a known issue for *years* and yet remains unresolved
>>> despite being a major issue.
>>
>> Right, the situation hasn't changed much since you last sent your patch
>> to drop EXPERT/UNSUPPORTED.
>>
>> Unless you fancy working on ACPI, I don't really see the situation
>> changing soon.
> 
> The situation is changing in large entities are pushing ACPI for ARM.  If
> they succeed (likely) then it will be a case of Xen/ARM MUST support
> ACPI, or else the project will die. 

This is quite a bold statement... I can see this ACPI to overtake in 
server world where ACPI is sort of the de-facto default firmware table. 
However, in embedded this is probably going to be more mixed because 
Device-Tree is a lot simpler to use (think of safety certified environment).

>>>   Might be an abomination, but would it work
>>> to find the string "IORT" and change it to "iort", "RTIO" or "IOXN" to
>>> prevent Dom0 from finding it?
>>
>> Unfortunately no because there IORT is used to describing mapping for
>> the GICv3 ITS which is currently working when ACPI is enabled in Xen.
> 
> The original advantage of Xen was paravirtualization.  Might this
> be a case where it is better to have Domain 0 compensate and know the
> SMMU is unusable with current versions of Xen?

I believe it would make more difficult to add support for Stage-1 SMMU 
in dom0. So this would be a short-sighted decision.

> 
>>> This ends up turning into a question of what are the cases and which are
>>> more common?
>>>
>>> Case1: DT-only: Unchanged
>>>
>>> Case2: Switchable between DT and ACPI, w/o SMMU: Starts working with ACPI
>>>
>>> Case3: Switchable between DT and ACPI, w/SMMU: Unchanged, ACPI mode still
>>> doesn't work, but the failure is different.
>>>
>>> Case4: Concurrent DT and ACPI support, w/o SMMU: Unchanged
>>
>> So Xen would start using ACPI rather than DT.I think we should default
>> DT it until we have the ACPI support completed.
> 
> Isn't this precisely what the proposed change does?  Are you suggesting,
> if both DT and ACPI are present, prevent Dom0 from seeing ACPI?

In the current model Xen and dom0 have to be using the same kind of 
firmware table. IOW if Xen is using the Device-Tree then dom0 has to.

We never investigated whether it would be feasible for Dom0 to use ACPI 
but not Xen.

>  If
> you're suggesting doing futher masking, perhaps only if SMMU is present?

Even if we remove the dependencies on UNSUPPORTED, ACPI will still be in 
a unsupported state by Xen Project (at least until the missing feature 
are present).

This means, if both Device-Tree and ACPI are present then we should boot 
using Device-Tree so the user is using a supported configuration. If 
they wish to use ACPI, then they will need to pass "acpi=on" on the Xen 
command line.

> 
>>> Case5: Concurrent DT and ACPI support, w/SMMU: Breaks if Dom0 tries to
>>> use ACPI
>>>
>>> Case6: ACPI-only, w/o SMMU: Starts working out-of-box
>>>
>>> Case7: ACPI-only, w/SMMU: Unchanged (still broken)
>>
>> To clarify, this will boot but then start to break in very subtle way.
> 
> Which suggests a need to provide warnings the situation is known to be
> broken.

Right. If that's the decision, then this would need to be part of this 
patch (or a new one patch).

>>> Ultimately this is more a decision for Xen Project management, than the
>>> technical side.  Are things in shape where they can be rolled out?
>>
>> No. But as I wrote before, I don't believe the gap is very big.
>>
>>>   Is
>>> ACPI support important enough to need rolling out now?
>>>
>>> I'm unsure about the former, but the latter seems a distinct "yes" since
>>> ACPI appears to be the future.
>>
>> ACPI is indeed picking up the pace on Arm Server and platform where
>> Windows on Arm is supported. But that should not only be the reason to
>> remove UNSUPPORTED.
> 
> Well good news is I'm not proposing removing the unsupported marking.
> I'm proposing to enable ACPI by default.  I think it is reasonable to
> add more warnings at runtime of the setup not being supported.
 From my experience warnings tend to be ignore/forgotten. So this could 
lead to poorer experience when issues are subbtle (think memory corruption).

> 
>> You are right that enabling ACPI by default will draw more users. But I
>> also expect those users to be less familiar with Xen and therefore not
>> very interested to fix bugs. So removing EXPERT/UNSUPPORTED is probably
>> going to still make them unhappy as I don't think the help (including
>> writing patch) for ACPI on Arm will change very much in the near future
>> (from the community call I was under the impression you could not commit
>> time for it).
> 
> The average level of technical competence may be lower, but the larger
> pool of people should yield enough to get additional problems fixed. >
>> So I am not convinced this is really making Xen in a better position
>> right now.
> 
> Right now the present situation is *actively* pushing people who want to
> use Xen on ACPI-only ARM boards away.
That's interesting because I haven't encountered that many ACPI-only 
platform outside of the server world.

But, honestly, I think you are blaming a bit too much 
EXPERT/UNSUPPORTED. Such issue would be really a problem with single 
contributor. For companies they usually care less and will pick whatever 
suit them (even it is behind a Kconfig).

> If virtualization is important for
> them, they are likely to instead opt for KVM, VMWare, Hyper-V, or Bhyve.
> Suppressing mindshare will destroy the future of Xen on ARM.

Another bold statement?

Anyway, I will wait for input from Bertand and Stefano.

Cheers,

-- 
Julien Grall

