Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A5FAC34FA
	for <lists+xen-devel@lfdr.de>; Sun, 25 May 2025 15:37:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997139.1378112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJBWk-00080G-Na; Sun, 25 May 2025 13:36:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997139.1378112; Sun, 25 May 2025 13:36:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJBWk-0007y3-Kg; Sun, 25 May 2025 13:36:34 +0000
Received: by outflank-mailman (input) for mailman id 997139;
 Sun, 25 May 2025 13:36:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0YXF=YJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uJBWi-0007xx-MR
 for xen-devel@lists.xenproject.org; Sun, 25 May 2025 13:36:33 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41e3fc24-396d-11f0-b893-0df219b8e170;
 Sun, 25 May 2025 15:36:27 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 565FC4EE99B0;
 Sun, 25 May 2025 15:36:26 +0200 (CEST)
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
X-Inumbo-ID: 41e3fc24-396d-11f0-b893-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1748180186;
	b=FyFe0LrcXEByIHSS5dxJkfpx3NkNww43cGXQ6itQAn49tJavluplxggfDfDpSiGmuKaF
	 J1CNza8Zhe9ctTovr6GGHFG3/O8mGSql0OFZ35drnUk45ps4fjJkRZI7b3Kr3V/SgQDs1
	 W1Fl79T4kzOyrX8vbZ7GjpbmqHG/0t2IQIW0KCI9DNVPyQJYxIokH7F7zxRrjilhl7gcP
	 2E4QWTKmhrrLPrb43/Wgb8S4rI4RHJQ/DYgNYEXcEmXpnOBL7+RSZ5rOZUCcWUb4ys2S0
	 /AKgjF4UhC5VpGUh8rttswriuUJKFxGYNicYSx9Ng3dVKbVgKGgl/uoZ8PD5d4h2UnE7H
	 PTuc4wHDjAruxuTwQ0t250dRVrSl0l3cedl+90s6V/8UavLHs/wy9hkc6qWXElq3rei3v
	 UaJEKOS1PKYKf22vm3MZ3gFq+BXIJIEeoqhVsSwioywCNGkYtF219Fxlv/1Se5Lb1JNj2
	 TgVoq2/oMsTaQ+XYS4tq4Qe4iLXs/qSmWyJRAZd7YEbxP5JEvNig5FQPH1iewQMEc1tjh
	 Yjk+pHhyfE/3HvM16vZBswIRry1mxxCNJRSaJgx3K4tdIlV3xS3qtvTTArLQt6BHNgvn4
	 FbcluZTmrOvSP5GuuooW+w7ZDtqmfuUB/hJ/c/DHkfGbIvVWi+tdwRd4qkewOMc=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1748180186;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=D6qxs26nemEEsj9jWOSkfznRuu1jVd0UrUKVudtJrpU=;
	b=AuRg+fQmQiU2HzDuS9ct90irQtI3J04N1A6ljbH9eFHwfjsnYom8M4lbp6wdV/lQvIcL
	 d31pvrykQS1mzP6B/fWNc8wTgGuEJ3uVnH70CREn9nbPQ5z7iOeJc7frmkm7vDr79dZQA
	 YytXq0em1ZsGs2ds1iBwHqueDpbmHjMqDgXckoUzcX051JmxwFj3pB8W5xhftkvW/bQS7
	 W8DTB6rdtH6d3WKw+wnuWTZ40PsVmae4K9d9xQJIya2xcM/6aU22bVis12cAqbIswi+Ao
	 EKxfoyXSzerkx1gHyclr3Iq1779HrgPH+3Y7P650jAU/E7ZSF7AQc8mdjftPaf1Y+b1ys
	 8jDvmY1TIEk6tMPEWKb848DVDcyQdUbDcGGUSoH0CWyY7KMKHOUcS13KAO/MJfDPvEG54
	 tBcfvRHhu41rLOdnhpdx8Jphaooi7AuUyedO72ULoEM2KrSb5/GcfgY8pJNyxDlhFvWxF
	 rWS6qQajs3gc/eaL9Fn2Lndqi6oPgPfoZjqWfVOfXNZTHwPQQLRFMWeJLxh5k8h1ho49P
	 LfKn0ozwZLMOLj6cp3HIf3YG05FGUAJ2+pXNe4lsXO59ZJQIry0AN4YM4PMVH8WTcgdw3
	 o8VJ4zlKwi10geXf84M8ulZJRujdG6l1vxVE2Nnn4LdGRVL132HSEAsKszR3Ycw=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1748180186; bh=+A0zv/q17hU1roItLIJ0qAHpk6xGREPt5/UYEvvFxlU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=yVVD66pnPfi57zcNskvCPS2XJ9sG2MM44JzNDCTRleXwpNOEX6myKKtYwBGR3yA9W
	 IogXlIN3mVLENYCVGS7NPf5gjNfSN3vhtkazsLA3iczpZiK8BCXfB0YxzpUMNdRZPG
	 CVy50xdhNAUj2rvCgSVzetT93HFGsV4o1wQqWAGTCoDuVEFe35+PAk0q/gwVa/Cfe7
	 860GCHWUSj+JyjGmxWLxhxADR1kEWKCY5pauNBuUMG6xzgIEkjxUrIiSVQ1pYT1yi9
	 zLG2pOMZegTvc+071asZF3saI7fYVVbDa/dwJmcHWZ8F3KlIqwd8qxQLik4RIngxp3
	 WaHsEnSl5RPYw==
MIME-Version: 1.0
Date: Sun, 25 May 2025 15:36:26 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, consulting@bugseng.com, Stefano Stabellini
 <sstabellini@kernel.org>
Subject: Re: [Eclair false positive] Re: [PATCH] x86/msr: Rework wrmsr_safe()
 using asm goto()
In-Reply-To: <a1fe2c69-b10b-41cb-9aaf-c21159248ad5@citrix.com>
References: <20250521143658.312514-1-andrew.cooper3@citrix.com>
 <8504aab1-c48a-4981-a502-93a2fd18880b@citrix.com>
 <e25858b4fedaa40d8934e5fe6bc40c01@bugseng.com>
 <49f092f9-c0fb-4b66-af20-368c736dde91@citrix.com>
 <526fe46bf2e4b5985d1b8cd3361e5730@bugseng.com>
 <a1fe2c69-b10b-41cb-9aaf-c21159248ad5@citrix.com>
Message-ID: <76634ee243f9e51a777428904a8c0d5d@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-05-25 12:52, Andrew Cooper wrote:
> On 25/05/2025 8:34 am, Nicola Vetrini wrote:
>> On 2025-05-22 15:49, Andrew Cooper wrote:
>>> On 22/05/2025 1:45 pm, Nicola Vetrini wrote:
>>>> On 2025-05-21 20:00, Andrew Cooper wrote:
>>>>> On 21/05/2025 3:36 pm, Andrew Cooper wrote:
>>>>>> diff --git a/xen/arch/x86/include/asm/msr.h
>>>>>> b/xen/arch/x86/include/asm/msr.h
>>>>>> index 0d3b1d637488..4c4f18b3a54d 100644
>>>>>> --- a/xen/arch/x86/include/asm/msr.h
>>>>>> +++ b/xen/arch/x86/include/asm/msr.h
>>>>>> @@ -69,20 +69,20 @@ static inline void wrmsr_ns(uint32_t msr,
>>>>>> uint32_t lo, uint32_t hi)
>>>>>>  /* wrmsr with exception handling */
>>>>>>  static inline int wrmsr_safe(unsigned int msr, uint64_t val)
>>>>>>  {
>>>>>> -    int rc;
>>>>>> -    uint32_t lo, hi;
>>>>>> -    lo = (uint32_t)val;
>>>>>> -    hi = (uint32_t)(val >> 32);
>>>>>> -
>>>>>> -    __asm__ __volatile__(
>>>>>> -        "1: wrmsr\n2:\n"
>>>>>> -        ".section .fixup,\"ax\"\n"
>>>>>> -        "3: movl %5,%0\n; jmp 2b\n"
>>>>>> -        ".previous\n"
>>>>>> -        _ASM_EXTABLE(1b, 3b)
>>>>>> -        : "=&r" (rc)
>>>>>> -        : "c" (msr), "a" (lo), "d" (hi), "0" (0), "i" (-EFAULT));
>>>>>> -    return rc;
>>>>>> +    uint32_t lo = val, hi = val >> 32;
>>>>>> +
>>>>>> +    asm_inline goto (
>>>>>> +        "1: wrmsr\n\t"
>>>>>> +        _ASM_EXTABLE(1b, %l[fault])
>>>>>> +        :
>>>>>> +        : "a" (lo), "c" (msr), "d" (hi)
>>>>>> +        :
>>>>>> +        : fault );
>>>>>> +
>>>>>> +    return 0;
>>>>>> +
>>>>>> + fault:
>>>>>> +    return -EFAULT;
>>>>>>  }
>>>>> 
>>>>> It turns out this is the first piece of Eclair-scanned code using 
>>>>> asm
>>>>> goto.
>>>>> 
>>>>> https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/10108558677
>>>>> (The run also contained an equivalent change to xsetbv())
>>>>> 
>>>>> We're getting R1.1 and R2.6 violations.
>>>>> 
>>>>> R1.1 complains about [STD.adrslabl] "label address" not being valid
>>>>> C99.
>>>>> 
>>>>> R2.6 complains about unused labels.
>>>>> 
>>>>> I expect this means that Eclair doesn't know how to interpret asm
>>>>> goto()
>>>>> yet.  The labels listed are reachable from inside the asm block.
>>>>> 
>>>> 
>>>> That has been fixed upstream. I'll reach out to you when that fix
>>>> trickles down to the runners, so that you're able to test and push
>>>> that change.
>>> 
>>> Oh, fantastic thanks.
>>> 
>>> I'll hold off pushing until then.
>>> 
>>> ~Andrew
>> 
>> Hi Andrew,
>> 
>> both runners are now updated with the new images, so you can rerun the
>> tests.
> 
> Both Eclair runs are unhappy, and not even completing analysis.
> 
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1835567532
> 
> This is the same branch as before, plus your config change for R1.1
> 
> ~Andrew

There might be something wrong with the image I used, it's erroring on a 
speculative call to the compiler. I rolled back to the previous images 
(without the fix for R2.6). I will investigate tomorrow.

Thanks,
  Nicola

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

