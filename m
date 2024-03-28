Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CC088FD69
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 11:50:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698889.1091117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpnKs-0004gI-IE; Thu, 28 Mar 2024 10:50:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698889.1091117; Thu, 28 Mar 2024 10:50:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpnKs-0004eE-FM; Thu, 28 Mar 2024 10:50:18 +0000
Received: by outflank-mailman (input) for mailman id 698889;
 Thu, 28 Mar 2024 10:50:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cj01=LC=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rpnKr-0004e8-Lz
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 10:50:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f66ca5dc-ecf0-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 11:50:16 +0100 (CET)
Received: from [192.168.1.175] (unknown [176.206.12.122])
 by support.bugseng.com (Postfix) with ESMTPSA id EE84C4EE0737;
 Thu, 28 Mar 2024 11:50:15 +0100 (CET)
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
X-Inumbo-ID: f66ca5dc-ecf0-11ee-afe3-a90da7624cb6
Message-ID: <175b2ffe-a75f-4ecd-82e6-8a130a4ec22d@bugseng.com>
Date: Thu, 28 Mar 2024 11:50:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 2/2] MISRA C Rule 20.7 states: "The features of
 `<stdarg.h>' shall not be used"
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1711621080.git.simone.ballarin@bugseng.com>
 <97008d1b28eb922b3c0041830b09e827396aa0ec.1711621080.git.simone.ballarin@bugseng.com>
 <aa78458b-c106-41fd-bb7b-c088e7a74fdf@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <aa78458b-c106-41fd-bb7b-c088e7a74fdf@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/03/24 11:31, Jan Beulich wrote:
> On 28.03.2024 11:29, Simone Ballarin wrote:
>> The Xen community wants to avoid using variadic functions except for
>> specific circumstances where it feels appropriate by strict code review.
> 
> In the title, s/20.7/17.1/ I suppose?
> 
> Jan
> 
>> Functions hypercall_create_continuation and hypercall_xlat_continuation
>> are internal helper functions made to break long running hypercalls into
>> multiple calls. They take a variable number of arguments depending on the
>> original hypercall they are trying to continue.
>>
>> Add SAF deviations for the aforementioned functions.
>>
>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>>
>> ---
>> Changes in v3:
>> - rebase: change SAF-3-safe to SAF-4-safe.
>> Changes in v2:
>> - replaced "special hypercalls" with "internal helper functions".
>> ---
>>   docs/misra/safe.json     | 8 ++++++++
>>   xen/arch/arm/domain.c    | 1 +
>>   xen/arch/x86/hypercall.c | 2 ++
>>   3 files changed, 11 insertions(+)
>>
>> diff --git a/docs/misra/safe.json b/docs/misra/safe.json
>> index d361d0e65c..fe2bc18509 100644
>> --- a/docs/misra/safe.json
>> +++ b/docs/misra/safe.json
>> @@ -36,6 +36,14 @@
>>           },
>>           {
>>               "id": "SAF-4-safe",
>> +            "analyser": {
>> +                "eclair": "MC3R1.R17.1"
>> +            },
>> +            "name": "Rule 17.1: internal helper functions made to break long running hypercalls into multiple calls.",
>> +            "text": "They need to take a variable number of arguments depending on the original hypercall they are trying to continue."
>> +        },
>> +        {
>> +            "id": "SAF-5-safe",
>>               "analyser": {},
>>               "name": "Sentinel",
>>               "text": "Next ID to be used"
>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>> index f38cb5e04c..34cbfe699a 100644
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -382,6 +382,7 @@ unsigned long hypercall_create_continuation(
>>       const char *p = format;
>>       unsigned long arg, rc;
>>       unsigned int i;
>> +    /* SAF-4-safe allowed variadic function */
>>       va_list args;
>>   
>>       current->hcall_preempted = true;
>> diff --git a/xen/arch/x86/hypercall.c b/xen/arch/x86/hypercall.c
>> index 01cd73040d..133e9f221c 100644
>> --- a/xen/arch/x86/hypercall.c
>> +++ b/xen/arch/x86/hypercall.c
>> @@ -31,6 +31,7 @@ unsigned long hypercall_create_continuation(
>>       const char *p = format;
>>       unsigned long arg;
>>       unsigned int i;
>> +    /* SAF-4-safe allowed variadic function */
>>       va_list args;
>>   
>>       curr->hcall_preempted = true;
>> @@ -115,6 +116,7 @@ int hypercall_xlat_continuation(unsigned int *id, unsigned int nr,
>>       struct cpu_user_regs *regs;
>>       unsigned int i, cval = 0;
>>       unsigned long nval = 0;
>> +    /* SAF-4-safe allowed variadic function */
>>       va_list args;
>>   
>>       ASSERT(nr <= ARRAY_SIZE(mcs->call.args));
> 
> 

Yes, sorry.

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


