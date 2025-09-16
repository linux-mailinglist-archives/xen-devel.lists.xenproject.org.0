Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED45BB59F06
	for <lists+xen-devel@lfdr.de>; Tue, 16 Sep 2025 19:14:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124750.1466973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyZGE-0002X3-NI; Tue, 16 Sep 2025 17:14:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124750.1466973; Tue, 16 Sep 2025 17:14:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyZGE-0002VZ-K3; Tue, 16 Sep 2025 17:14:34 +0000
Received: by outflank-mailman (input) for mailman id 1124750;
 Tue, 16 Sep 2025 17:14:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew@xen.org>) id 1uyZGD-0002VT-Om
 for xen-devel@lists.xenproject.org; Tue, 16 Sep 2025 17:14:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrew@xen.org>) id 1uyZGA-00Ct9c-0X;
 Tue, 16 Sep 2025 17:14:30 +0000
Received: from [149.199.65.200] (helo=[10.10.151.52])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <andrew@xen.org>) id 1uyZGA-00CzYu-0u;
 Tue, 16 Sep 2025 17:14:30 +0000
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
	bh=EOMrII1z1zQLRHCl1sFMtAmD+D/WioEXgF5lO/GymEY=; b=wcsUuFAEycHnTVEzJBexSJV0HW
	GW4wjy/rEzIXnXs+mJRZ/aw3j7Ht/yxW9dV76O7ZlvyPmPYmjuBNkVsrX4QQh1SQbt4gTH8L+Qtit
	XxK1l/6Kglqw8F7ZDYgi13qB8o30tZnWZjJ8q3Zc3SOevd4VPhNRpK3PzaUR7pEWBv1g=;
Message-ID: <88cc4cf1-3bc9-47f5-b8f7-e04f01b027ee@xen.org>
Date: Tue, 16 Sep 2025 10:14:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 1/2] x86: hvm: vmx: fix runtime vmx presence check
 for !CONFIG_INTEL_VMX case
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250916103251.2144449-1-grygorii_strashko@epam.com>
 <3baf457c-d32b-4965-96bb-022a2f92bb9d@suse.com>
 <bcd7a98b-5827-4b4d-baa6-52fe24339faa@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew@xen.org>
In-Reply-To: <bcd7a98b-5827-4b4d-baa6-52fe24339faa@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/09/2025 9:57 am, Grygorii Strashko wrote:
> Hi Jan,
>
> On 16.09.25 17:34, Jan Beulich wrote:
>> On 16.09.2025 12:32, Grygorii Strashko wrote:
>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>
>>> Since commit b99227347230 ("x86: Fix AMD_SVM and INTEL_VMX
>>> dependency") the
>>> HVM Intel VT-x support can be gracefully disabled, but it still
>>> keeps VMX
>>> code partially built-in, because HVM code uses mix of:
>>>
>>>   - "cpu_has_vmx" macro, which doesn't account for CONFIG_INTEL_VMX cfg
>>>   - "using_vmx()" function, which accounts for CONFIG_INTEL_VMX cfg
>>>
>>> for runtime VMX availability checking. As result compiler DCE can't
>>> remove
>>> all, unreachable VMX code.
>>>
>>> Fix it by sticking to "cpu_has_vmx" macro usage only which is
>>> updated to
>>> account CONFIG_INTEL_VMX cfg.
>>>
>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>> ---
>>> Hi
>>>
>>> It could be good to have it in 4.21, so vmx/svm disabling
>>> option will be in complete state within 4.21 version.
>>
>> Imo this isn't release critical and has come too late. It's of course
>> Oleksii's call in the end.
>>
>>> --- a/xen/arch/x86/include/asm/cpufeature.h
>>> +++ b/xen/arch/x86/include/asm/cpufeature.h
>>> @@ -136,7 +136,8 @@ static inline bool boot_cpu_has(unsigned int feat)
>>>   #define cpu_has_sse3            boot_cpu_has(X86_FEATURE_SSE3)
>>>   #define cpu_has_pclmulqdq       boot_cpu_has(X86_FEATURE_PCLMULQDQ)
>>>   #define cpu_has_monitor         boot_cpu_has(X86_FEATURE_MONITOR)
>>> -#define cpu_has_vmx             boot_cpu_has(X86_FEATURE_VMX)
>>> +#define cpu_has_vmx             (IS_ENABLED(CONFIG_INTEL_VMX) && \
>>> +                                 boot_cpu_has(X86_FEATURE_VMX))
>>
>> I'm pretty sure using_vmx() was introduced precisely to avoid the use of
>> IS_ENABLED() here. What is completely missing from the description is a
>> discussion of the effect of this change on pre-existing uses of the
>> macro. ISTR there being at least one instance which would break with
>> that change. And no, I'm not looking forward to digging that out again,
>> when I already did at the time the using_vmx() was suggested and then
>> implemented. (I can't exclude it was the SVM counterpart; we want to
>> keep both in sync in any event, imo.)
>
> Thank you for your comments and sorry for not digging into the history of
> the related patches.
>
> All, please ignore these patches as existing places. where
> cpu_has_vmx/smv
> are still used, need to be revised one by one.
>

Off the top of my head, fixups to MSR_FEATURE_CONTROL, and AMD SKINIT
need cpu_has_vmx/svm not guarded by Kconfig like this.

~Andrew


