Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3371786D9B
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 13:20:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589991.922082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ8Nv-0002mm-Ae; Thu, 24 Aug 2023 11:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589991.922082; Thu, 24 Aug 2023 11:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ8Nv-0002jn-79; Thu, 24 Aug 2023 11:20:19 +0000
Received: by outflank-mailman (input) for mailman id 589991;
 Thu, 24 Aug 2023 11:20:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qZ8Nt-0002je-Mn
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 11:20:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qZ8Ns-0002wP-V8; Thu, 24 Aug 2023 11:20:16 +0000
Received: from [15.248.3.1] (helo=[10.24.67.25])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qZ8Ns-0004dT-O1; Thu, 24 Aug 2023 11:20:16 +0000
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
	bh=ZykbmVQszRsygAsCHDc8Vv95XoLP1uzCO001hCtbmv4=; b=qKJu1Jy7OhrujfSKhQTZ5HDgB7
	UAWfogvjSkKUvrglHiOPSUKyzcTXHdWqwlkThUR34s7OEQ80B2TXeIXFuM83UWxu/bQSATAMYouUt
	KwmdfVzMdfg6jn5R5GFZ9gcILWXI8lMTMMr/HFnuDvI2bmy/Y+aoLsIeElwdiSwuO/hM=;
Message-ID: <707b09d3-c69e-4212-be64-7e2bde73d4af@xen.org>
Date: Thu, 24 Aug 2023 12:20:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] arm64/vfp: address MISRA C:2012 Dir 4.3
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <140f450d4f4f88096158e54522fc2734367a90cb.1692807017.git.nicola.vetrini@bugseng.com>
 <941f9188-6d59-12a6-9868-daa39b51687a@amd.com>
 <387d99d2066e1f07b7d5d04ff54a0ac9@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <387d99d2066e1f07b7d5d04ff54a0ac9@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Nicola,

On 24/08/2023 12:11, Nicola Vetrini wrote:
> On 24/08/2023 10:01, Michal Orzel wrote:
>> Hi Nicola,
>>
>> On 24/08/2023 09:37, Nicola Vetrini wrote:
>>>
>>>
>>> Directive 4.3 prescribes the following:
>>> "Assembly language shall be encapsulated and isolated",
>>> on the grounds of improved readability and ease of maintenance.
>>>
>>> A static inline function is the chosen encapsulation mechanism.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> ---
>>> Changes in v2:
>>> - Switched to a static inline function
>>> ---
>>>  xen/arch/arm/arm64/vfp.c | 78 ++++++++++++++++++++++------------------
>>>  1 file changed, 44 insertions(+), 34 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/arm64/vfp.c b/xen/arch/arm/arm64/vfp.c
>>> index 2d0d7c2e6ddb..5c884380ee42 100644
>>> --- a/xen/arch/arm/arm64/vfp.c
>>> +++ b/xen/arch/arm/arm64/vfp.c
>>> @@ -4,6 +4,48 @@
>>>  #include <asm/vfp.h>
>>>  #include <asm/arm64/sve.h>
>>>
>>> +static inline void save_state(uint64_t *fpregs)
>>> +{
>>> +    asm volatile("stp q0, q1, [%1, #16 * 0]\n\t"
>>> +                 "stp q2, q3, [%1, #16 * 2]\n\t"
>>> +                 "stp q4, q5, [%1, #16 * 4]\n\t"
>>> +                 "stp q6, q7, [%1, #16 * 6]\n\t"
>>> +                 "stp q8, q9, [%1, #16 * 8]\n\t"
>>> +                 "stp q10, q11, [%1, #16 * 10]\n\t"
>>> +                 "stp q12, q13, [%1, #16 * 12]\n\t"
>>> +                 "stp q14, q15, [%1, #16 * 14]\n\t"
>>> +                 "stp q16, q17, [%1, #16 * 16]\n\t"
>>> +                 "stp q18, q19, [%1, #16 * 18]\n\t"
>>> +                 "stp q20, q21, [%1, #16 * 20]\n\t"
>>> +                 "stp q22, q23, [%1, #16 * 22]\n\t"
>>> +                 "stp q24, q25, [%1, #16 * 24]\n\t"
>>> +                 "stp q26, q27, [%1, #16 * 26]\n\t"
>>> +                 "stp q28, q29, [%1, #16 * 28]\n\t"
>>> +                 "stp q30, q31, [%1, #16 * 30]\n\t"
>>> +                 : "=Q" (*fpregs) : "r" (fpregs));
>>> +}
>>> +
>>> +static inline void restore_state(uint64_t *fpregs)
>> This can be const as you are loading data from fpregs into registers
>>
> 
> I wonder whether this would make a difference, given that the return 
> type is void.

It is telling the reader that the function is not supposed to modify the 
'fpregs'. A compiler will also be able to throw an error if a developper 
broke this assumption.

I have been pushing quite a lot recently to add 'const' when a pointer 
is not supposed to be modified. And before someone mention it, I know 
that 'const' is not perfect in C as if a field points to another area, 
that area would not be const (unless the definition of the field 
contains const). But that's better than nothing :).

Cheers,

-- 
Julien Grall

