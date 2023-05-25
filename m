Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D892B7108A6
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 11:18:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539463.840360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q276s-0002vn-4r; Thu, 25 May 2023 09:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539463.840360; Thu, 25 May 2023 09:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q276s-0002tL-29; Thu, 25 May 2023 09:18:14 +0000
Received: by outflank-mailman (input) for mailman id 539463;
 Thu, 25 May 2023 09:18:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q276q-0002tC-V7
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 09:18:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q276q-00013L-CC; Thu, 25 May 2023 09:18:12 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.31.224]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q276q-0006N7-4N; Thu, 25 May 2023 09:18:12 +0000
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
	bh=Qv55Y6m1lllBaFGCfpqSkg94suT4Na6FI0EpMe1yfok=; b=1JQiFao6+RqeVw4RddjdQ8XVxf
	7SiVRfQLx50szY7gvsCHA8ZYpWPVdDFwkS+mSQcwueqUeJiFURyCVvk3o3aqAWAu/0cClNjP08QPU
	tHiCiq8oeK4BzleMGkknrF6elpwsBWRdQpYjCMGUlQa6U4J4TNiSyMad4rivk+FACEnA=;
Message-ID: <b92aa9fb-440e-d315-92b5-ccc10e1e38f8@xen.org>
Date: Thu, 25 May 2023 10:18:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v7 07/12] xen: enable Dom0 to use SVE feature
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
 <20230523074326.3035745-8-luca.fancellu@arm.com>
 <04D83C51-E734-465D-BC2D-4F0535C91B77@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <04D83C51-E734-465D-BC2D-4F0535C91B77@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/05/2023 11:05, Bertrand Marquis wrote:
> Hi Luca,

Hi,


>> On 23 May 2023, at 09:43, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>>
>> Add a command line parameter to allow Dom0 the use of SVE resources,
>> the command line parameter sve=<integer>, sub argument of dom0=,
>> controls the feature on this domain and sets the maximum SVE vector
>> length for Dom0.
>>
>> Add a new function, parse_signed_integer(), to parse an integer
>> command line argument.
>>
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> with ...
> 
>> ---
>> Changes from v6:
>> - Fixed case for e==NULL in parse_signed_integer, drop parenthesis
>>    from if conditions, delete inline sve_domctl_vl_param and rely on
>>    DCE from the compiler (Jan)
>> - Drop parenthesis from opt_dom0_sve (Julien)
>> - Do not continue if 'sve' is in command line args but
>>    CONFIG_ARM64_SVE is not selected:
>>    https://lore.kernel.org/all/7614AE25-F59D-430A-9C3E-30B1CE0E1580@arm.com/
>> Changes from v5:
>> - stop the domain if VL error occurs (Julien, Bertrand)
>> - update the documentation
>> - Rename sve_sanitize_vl_param to sve_domctl_vl_param to
>>    mark the fact that we are sanitizing a parameter coming from
>>    the user before encoding it into sve_vl in domctl structure.
>>    (suggestion from Bertrand in a separate discussion)
>> - update comment in parse_signed_integer, return boolean in
>>    sve_domctl_vl_param (Jan).
>> Changes from v4:
>> - Negative values as user param means max supported HW VL (Jan)
>> - update documentation, make use of no_config_param(), rename
>>    parse_integer into parse_signed_integer and take long long *,
>>    also put a comment on the -2 return condition, update
>>    declaration comment to reflect the modifications (Jan)
>> Changes from v3:
>> - Don't use fixed len types when not needed (Jan)
>> - renamed domainconfig_encode_vl to sve_encode_vl
>> - Use a sub argument of dom0= to enable the feature (Jan)
>> - Add parse_integer() function
>> Changes from v2:
>> - xen_domctl_createdomain field has changed into sve_vl and its
>>    value now is the VL / 128, create an helper function for that.
>> Changes from v1:
>> - No changes
>> Changes from RFC:
>> - Changed docs to explain that the domain won't be created if the
>>    requested vector length is above the supported one from the
>>    platform.
>> ---
>> docs/misc/xen-command-line.pandoc    | 20 ++++++++++++++++++--
>> xen/arch/arm/arm64/sve.c             | 20 ++++++++++++++++++++
>> xen/arch/arm/domain_build.c          | 26 ++++++++++++++++++++++++++
>> xen/arch/arm/include/asm/arm64/sve.h | 10 ++++++++++
>> xen/common/kernel.c                  | 28 ++++++++++++++++++++++++++++
>> xen/include/xen/lib.h                | 10 ++++++++++
>> 6 files changed, 112 insertions(+), 2 deletions(-)
>>
>> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
>> index e0b89b7d3319..47e5b4eb6199 100644
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -777,9 +777,9 @@ Specify the bit width of the DMA heap.
>>
>> ### dom0
>>      = List of [ pv | pvh, shadow=<bool>, verbose=<bool>,
>> -                cpuid-faulting=<bool>, msr-relaxed=<bool> ]
>> +                cpuid-faulting=<bool>, msr-relaxed=<bool> ] (x86)
>>
>> -    Applicability: x86
>> +    = List of [ sve=<integer> ] (Arm)
>>
>> Controls for how dom0 is constructed on x86 systems.
>>
>> @@ -838,6 +838,22 @@ Controls for how dom0 is constructed on x86 systems.
>>
>>      If using this option is necessary to fix an issue, please report a bug.
>>
>> +Enables features on dom0 on Arm systems.
>> +
>> +*   The `sve` integer parameter enables Arm SVE usage for Dom0 domain and sets

NIT: "Domain" is bit redundant here.

>> +    the maximum SVE vector length, the option is applicable only to AArch64
>> +    guests.
> 
> Here i would just remove "guests", just AArch64 is enough.
> I am ok if you choose to use "AArch64 Dom0 kernels"

So far we have no use of AArch64 in our documentation. We have a few use 
of Arm64 (with various uppercase).

In the code base, we seem to have a mix of AArch64 and Arm64. At the 
moment, I am not going to ask for consistency in the code. But we should 
aim to not introduce inconsistency in the documentation.

I don't have a strong opinion whether we should use aarch64 or arm64. My 
only request is to be consistent.

Cheers,

-- 
Julien Grall

