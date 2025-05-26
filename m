Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9267BAC4476
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 22:32:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997784.1378606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJeV3-0007AR-0V; Mon, 26 May 2025 20:32:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997784.1378606; Mon, 26 May 2025 20:32:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJeV2-00078S-U4; Mon, 26 May 2025 20:32:44 +0000
Received: by outflank-mailman (input) for mailman id 997784;
 Mon, 26 May 2025 20:32:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h+MF=YK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uJeV1-000786-8j
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 20:32:43 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91fd5cff-3a70-11f0-a2fb-13f23c93f187;
 Mon, 26 May 2025 22:32:41 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id C455B4EE8E26;
 Mon, 26 May 2025 22:32:40 +0200 (CEST)
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
X-Inumbo-ID: 91fd5cff-3a70-11f0-a2fb-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1748291560;
	b=Rl6FSbowBz+CBbxdZSW/FKWeAERgigb1sJCek7f5H4pmXVh3IlfomFMWp23lKbEGlcff
	 qBKPra2NqdlEkzGUaMaxj7t853CO7IAEVYFBaLixVcXphN2mB9u+XCAWxSGTkgVg4wZD8
	 IxtzCBWHCuwpZOrYRwZqNIpiVIMHp4OosIdEL7hIYIpJFi22n3vyXqQe86/1TMa5G2Rax
	 1+2EZZvfYZHA/yIIUh94r3eECtdEBd3RKR//8FPm4P7yeVD4csNt1VWXDi1FImTKYUt1B
	 eNOvHfzwklR9i2hp5/aAci9rqEISDC3Jj2PbVi3oAc7xgk0en9sJAiBfHZWKNapLwYHOX
	 sQSuWLydGqUxnB64rjV7KrmR/mZjiXsrOkALdfZYYcYJgrZ8CmBPJ9qQ01WefAU/DHrrb
	 xSJm7PxGMHCXxWNbYR+CFfKpXwY6Fqcfw4uzhT0mxr7zj+DjZnMCLqWedBlvA9Z/lERxu
	 ACgK42uUuwrTPquwDfClYTFnfKz8jmfq0hiugUDoFOvJVoQ7iko+qTfV8gJKLl1kh1Ab5
	 7J1k9UGDo5u/91MNTiFXB2TnC00Wm+Pcqg7qgRzevEHQI0mORth++oj7Zwte6/AlcJShx
	 lO1wqZG2a4GLZHntd+tcoOaLhmYEIknSXEShug4K/7yFc01K85DcQg88ik1QlMo=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1748291560;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=8yUKAiDNYHfFbobrtgzhNXm2dFqyLcF4xxhdylDJrr4=;
	b=rSa4pMdHYhCOuteng9oXdAv8HmbGM9xrYzKqNQCiqw58qF6rgmnUWcchpjC9NXnzwIKB
	 YCfOnfwJTqvN4470zPU11TPfO3WgPWhtF6/uKxVXjbz9Dm22KQAK/EwnxW+evfviUVa/q
	 LHKkjLZ8+0iNYJUjUaRPwvkyrL5xjzOogCi7WKmbbmclmspRU1MZCNh/LnMNQqM4YR5Qe
	 apfZvnM7QNN7BK87loRpRvaIFJ+qviIgtXtmwhki2kR8ytxbo7xC2H6MJDj/bcuq+5YBe
	 oIAC1tk7W7ihZuwYwCCTds23rUo9JHsF2WIeYtkripsfn9Xf8ZhImcCs94WuMSy1OPOyZ
	 Fywbu22JU6fXIQUulr+en5lw1ftPqCSMAufXjTcH0uRXLNloxWT/aLx7U48TGFz2S4yQX
	 9ms9p00F05eC0QOE93bm4l8/Fm14wpHlY3F7pIDrg9hhEw1bX6NMPYhUPntpPTxWWwG9t
	 AVi25XvWZm0BxCe6DNqUhs8qPrptUZJ27X2RALG4LHs761vjrLxHBstp9sQtPC1vEbTlm
	 2AuBlxFmXw/L024w/MN+Xwxq2SWOS0sY1Bpxc+v8RMHWso6wOeme2Sgbm/wQOCkgLD5cb
	 OtzFmy9Sme8I6LBt4bRsvO1evFWpDOuwUAOgauFSXSR2whxaFrNOzJYM0jjHFSo=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1748291560; bh=KLnQtA+kgQvNLbrHD0a5M+wnASmHFfwYRWwS/5XvNNw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vMFCPOjmdE650tiiyMyyQl99f9JuLjbRcvfkKmwpzhgEx7AZXp5a8kh+VRR+4NuXS
	 0RZ1cmXLTK13n46M2qnN5VYDKRbuZBtHt1YPlz6de0O+0CA5odYGiZQrLJbB4r3BVr
	 OUKpE9n496+t5KS7ECK0Bnwb8vB/sdRkuhRcdOm4ReHwT+OgPZxKph1WGj5zOUln0D
	 HEPm9zsKCllDa9dSyylAGiC+AikgwfDzeoOu64wT1gtIBwK20kPSHWbL8JIVYeVt2g
	 9NQzdhgDuRDDHmvoSt53M6odWXlhMi2OyzXyfmsEiIcBGQGV3pxuEDpEIAx7dxKcjj
	 bqnm6x7tl1rCw==
MIME-Version: 1.0
Date: Mon, 26 May 2025 22:32:40 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, consulting@bugseng.com, Stefano Stabellini
 <sstabellini@kernel.org>
Subject: Re: [Eclair false positive] Re: [PATCH] x86/msr: Rework wrmsr_safe()
 using asm goto()
In-Reply-To: <76634ee243f9e51a777428904a8c0d5d@bugseng.com>
References: <20250521143658.312514-1-andrew.cooper3@citrix.com>
 <8504aab1-c48a-4981-a502-93a2fd18880b@citrix.com>
 <e25858b4fedaa40d8934e5fe6bc40c01@bugseng.com>
 <49f092f9-c0fb-4b66-af20-368c736dde91@citrix.com>
 <526fe46bf2e4b5985d1b8cd3361e5730@bugseng.com>
 <a1fe2c69-b10b-41cb-9aaf-c21159248ad5@citrix.com>
 <76634ee243f9e51a777428904a8c0d5d@bugseng.com>
Message-ID: <d60bfd168bee2980070c6072a125ae38@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-05-25 15:36, Nicola Vetrini wrote:
> On 2025-05-25 12:52, Andrew Cooper wrote:
>> On 25/05/2025 8:34 am, Nicola Vetrini wrote:
>>> On 2025-05-22 15:49, Andrew Cooper wrote:
>>>> On 22/05/2025 1:45 pm, Nicola Vetrini wrote:
>>>>> On 2025-05-21 20:00, Andrew Cooper wrote:
>>>>>> On 21/05/2025 3:36 pm, Andrew Cooper wrote:
>>>>>>> diff --git a/xen/arch/x86/include/asm/msr.h
>>>>>>> b/xen/arch/x86/include/asm/msr.h
>>>>>>> index 0d3b1d637488..4c4f18b3a54d 100644
>>>>>>> --- a/xen/arch/x86/include/asm/msr.h
>>>>>>> +++ b/xen/arch/x86/include/asm/msr.h
>>>>>>> @@ -69,20 +69,20 @@ static inline void wrmsr_ns(uint32_t msr,
>>>>>>> uint32_t lo, uint32_t hi)
>>>>>>>  /* wrmsr with exception handling */
>>>>>>>  static inline int wrmsr_safe(unsigned int msr, uint64_t val)
>>>>>>>  {
>>>>>>> -    int rc;
>>>>>>> -    uint32_t lo, hi;
>>>>>>> -    lo = (uint32_t)val;
>>>>>>> -    hi = (uint32_t)(val >> 32);
>>>>>>> -
>>>>>>> -    __asm__ __volatile__(
>>>>>>> -        "1: wrmsr\n2:\n"
>>>>>>> -        ".section .fixup,\"ax\"\n"
>>>>>>> -        "3: movl %5,%0\n; jmp 2b\n"
>>>>>>> -        ".previous\n"
>>>>>>> -        _ASM_EXTABLE(1b, 3b)
>>>>>>> -        : "=&r" (rc)
>>>>>>> -        : "c" (msr), "a" (lo), "d" (hi), "0" (0), "i" 
>>>>>>> (-EFAULT));
>>>>>>> -    return rc;
>>>>>>> +    uint32_t lo = val, hi = val >> 32;
>>>>>>> +
>>>>>>> +    asm_inline goto (
>>>>>>> +        "1: wrmsr\n\t"
>>>>>>> +        _ASM_EXTABLE(1b, %l[fault])
>>>>>>> +        :
>>>>>>> +        : "a" (lo), "c" (msr), "d" (hi)
>>>>>>> +        :
>>>>>>> +        : fault );
>>>>>>> +
>>>>>>> +    return 0;
>>>>>>> +
>>>>>>> + fault:
>>>>>>> +    return -EFAULT;
>>>>>>>  }
>>>>>> 
>>>>>> It turns out this is the first piece of Eclair-scanned code using 
>>>>>> asm
>>>>>> goto.
>>>>>> 
>>>>>> https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/10108558677
>>>>>> (The run also contained an equivalent change to xsetbv())
>>>>>> 
>>>>>> We're getting R1.1 and R2.6 violations.
>>>>>> 
>>>>>> R1.1 complains about [STD.adrslabl] "label address" not being 
>>>>>> valid
>>>>>> C99.
>>>>>> 
>>>>>> R2.6 complains about unused labels.
>>>>>> 
>>>>>> I expect this means that Eclair doesn't know how to interpret asm
>>>>>> goto()
>>>>>> yet.  The labels listed are reachable from inside the asm block.
>>>>>> 
>>>>> 
>>>>> That has been fixed upstream. I'll reach out to you when that fix
>>>>> trickles down to the runners, so that you're able to test and push
>>>>> that change.
>>>> 
>>>> Oh, fantastic thanks.
>>>> 
>>>> I'll hold off pushing until then.
>>>> 
>>>> ~Andrew
>>> 
>>> Hi Andrew,
>>> 
>>> both runners are now updated with the new images, so you can rerun 
>>> the
>>> tests.
>> 
>> Both Eclair runs are unhappy, and not even completing analysis.
>> 
>> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1835567532
>> 
>> This is the same branch as before, plus your config change for R1.1
>> 
>> ~Andrew
> 
> There might be something wrong with the image I used, it's erroring on 
> a speculative call to the compiler. I rolled back to the previous 
> images (without the fix for R2.6). I will investigate tomorrow.

Fixed, I will let you know when runners are updated. It was a change 
unrelated to Rule 2.6.

Thanks,
  Nicola

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

