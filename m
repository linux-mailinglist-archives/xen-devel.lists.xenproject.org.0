Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D19C151999B
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 10:20:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320447.541177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmAF7-00045G-EF; Wed, 04 May 2022 08:20:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320447.541177; Wed, 04 May 2022 08:20:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmAF7-00043R-BE; Wed, 04 May 2022 08:20:17 +0000
Received: by outflank-mailman (input) for mailman id 320447;
 Wed, 04 May 2022 08:20:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nmAF5-00043J-4o
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 08:20:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nmAF4-0008T8-0M; Wed, 04 May 2022 08:20:14 +0000
Received: from [54.239.6.185] (helo=[192.168.21.29])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nmAF3-0001na-QO; Wed, 04 May 2022 08:20:13 +0000
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
	bh=L6RA+6rkBTFITMu+zROdOo2PKLgVUgaxMDHiTm/2MHM=; b=soR/bJenVtXASurPhm0IfIp1dX
	YH2uHiV6D59X+QF8Jn7TcXsASVP73i8ae23sOBwsD+BiVtHMV6PS1bt88elUlxLFwoT0PpzvFhYL5
	bdFMIuDg3qAQWzG9uGeYH6vzdQRj5ts+HriUvZZYeWmoDqJvcFPygMXX70Pt69L9t4s8=;
Message-ID: <f1315848-fe9e-b365-bbf6-a596abc6e0de@xen.org>
Date: Wed, 4 May 2022 09:20:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH 1/3] xen/arm: Sync sysregs and cpuinfo with Linux 5.18-rc3
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1651570561.git.bertrand.marquis@arm.com>
 <832955382caa4ced744ec7894282592b62e8cf61.1651570561.git.bertrand.marquis@arm.com>
 <a05b426c-1800-a365-5b02-f82f0a391306@xen.org>
 <2E66F8B4-4DDA-47E2-B93C-E36FEB70F552@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2E66F8B4-4DDA-47E2-B93C-E36FEB70F552@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/05/2022 08:39, Bertrand Marquis wrote:
> Hi Julien,
Hi,

>> On 3 May 2022, at 19:08, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Bertrand,
>>
>> On 03/05/2022 10:38, Bertrand Marquis wrote:
>>> Sync arm64 sysreg bit shift definitions with status of Linux kernel as
>>> of 5.18-rc3 version (linux commit b2d229d4ddb1).
>>> Sync ID registers sanitization with the status of Linux 5.18-rc3 and add
>>> sanitization of ISAR2 registers.
>> Please outline which specific commits you are actually backported. This would help to know what changed, why and also keep track of the autorships.
>>
>> When possible, the changes should be separated to match each Linux commit we backport.
> 
> As those are exactly identical to the linux tree, one can easily use git blame on the linux source tree to find those information if it is needed

Well... that's possible at the cost of everyone going through Linux to 
understand why the changes were made. This is not very scalable.

> 
> I checked a bit and this is not something that was required before (for example when the cpufeature was introduced).

If we import the full file, then we will generally don't log all the 
commits. However, for smaller changes, we will always mention the commit 
backported. There are several examples on the ML:

  - 0435784cc75d ("xen/arm: smmuv1: Intelligent SMR allocation")
  - 9c432b876bf5 ("x86/mwait-idle: add SPR support")

We also recently introduced a tag "Origin:" to keep track of which 
commit was backported. If you want to understand the rationale, you can 
read this long thread:

https://lore.kernel.org/xen-devel/0ed245fa-58a7-a5f6-b82e-48f9ed0b6970@suse.com/

> 
>>
>>> Complete AA64ISAR2 and AA64MMFR1 with more fields.
>>> While there add a comment for MMFR bitfields as for other registers in
>>> the cpuinfo structure definition.
>>
>> AFAICT, this patch is doing 3 different things that are somewhat related:
>> - Sync cpufeature.c
>> - Update the headers with unused defines
>> - Complete the structure cpufeature.h
>>
>> All those changes seem to be independent, so I think they should be done separately. This would help to keep the authorship right (your code vs Linux code).
> 
> This and the previous request to split using linux commit will actually end up in 10 patches or more.

I think we need to differentiate the two request. The previous request 
is about logging which commits you backported. I would be open to have 
all of them in one patch so long we account the authors/tags properly.

For this request, this is mostly about avoid to mix multiple things 
together. Your commit message describes 3 distinct parts and therefore 
they should be split.

>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>> ---
>>> xen/arch/arm/arm64/cpufeature.c | 18 +++++-
>>> xen/arch/arm/include/asm/arm64/sysregs.h | 76 ++++++++++++++++++++----
>>> xen/arch/arm/include/asm/cpufeature.h | 14 ++++-
>>> 3 files changed, 91 insertions(+), 17 deletions(-)
>>> diff --git a/xen/arch/arm/arm64/cpufeature.c b/xen/arch/arm/arm64/cpufeature.c
>>> index 6e5d30dc7b..d9039d37b2 100644
>>> --- a/xen/arch/arm/arm64/cpufeature.c
>>> +++ b/xen/arch/arm/arm64/cpufeature.c
>>> @@ -143,6 +143,16 @@ static const struct arm64_ftr_bits ftr_id_aa64isar1[] = {
>>> 	ARM64_FTR_END,
>>> };
>>> +static const struct arm64_ftr_bits ftr_id_aa64isar2[] = {
>>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_HIGHER_SAFE, ID_AA64ISAR2_CLEARBHB_SHIFT, 4, 0),
>>> +	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_PTR_AUTH),
>>> +		 FTR_STRICT, FTR_EXACT, ID_AA64ISAR2_APA3_SHIFT, 4, 0),
>>> +	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_PTR_AUTH),
>> So we are using CONFIG_ARM64_PTR_AUTH. But this is not defined in Kconfig. I realize there are more in cpufeature.c (somehow I didn't spot during preview), but I don't think this is right to define CONFIG_* without an associated entry in Kconfig.
>>
>> In one hand, I think it would be odd to add an entry in Kconfig because Xen wouldn't properly work if selected. On the other hand, it is useful if when we will implement pointer authentification.
>>
>> So maybe we should just add the Kconfig entry with a comment explaning why they are not selected. Any thoughts?
> 
> This is really right and a very good catch.
> 
> I think it would make sense to introduce those in Kconfig in order to keep the code equivalent to Linux.
> 
> So I would suggest here to add hidden entries like this:
> 
> ARM64_PTR_AUTH
> 	def_bool n
> 	depends on ARM64
>          help
>            Pointer authentication support.
>            This feature is not supported by Xen.

I am OK with that.

Cheers,

-- 
Julien Grall

