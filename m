Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9E5ABFD8E
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 21:49:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992491.1376203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHpQm-0001Xp-50; Wed, 21 May 2025 19:48:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992491.1376203; Wed, 21 May 2025 19:48:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHpQm-0001Vw-2B; Wed, 21 May 2025 19:48:48 +0000
Received: by outflank-mailman (input) for mailman id 992491;
 Wed, 21 May 2025 19:48:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9FE4=YF=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uHpQl-0001Vq-JL
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 19:48:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b045d15-367c-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 21:48:45 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 90E964EE8F3B;
 Wed, 21 May 2025 21:48:44 +0200 (CEST)
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
X-Inumbo-ID: 9b045d15-367c-11f0-b892-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1747856924;
	b=lJONIE43XycHjKY1L4OAKMDD7FrzZnEcIHFKjrg5sfYXfqbp2tqlWm2j5zFX9rlL+3Eb
	 tI55SDr8ww7SHTqtzWjBmLgzmM98K3oEnkfyFx4EeKN9rVDoDdu8K8yk8RKo8Hk5NzHdu
	 uqVsGGMAR2DzWG8oJ/il0JrNvbUoKv3Tjh5btW4PMnHJuVvcN8wGS7SjqST5NR8fbWdzY
	 q6BYV2BC0qNdqz01iRIAGh5yFCoG1+nsrLwZNNA6lt/Ib1wTRA04SgQp1SDnp7992q+hh
	 WApBJC8cs8EmGq8/KGv7lN79wq4f5ZpFH3R/4IFnThxg4w0cMs8XGwNBpsKgQIgJVPDdP
	 g8U49FSvIor8VYiVDfvboO5XWZcA4DCqv9DLZLMPgK9u7SVcUGZdpWZ7h6VOuHqN759V0
	 2XcV4G7EagPCoqMiNMUSnBykfHnRyjkSNk8SFnKRcp/u+U8npN9vZkb596jE203AgoXhJ
	 1y085C89rG8fZVeVLWOSnxamNjygSX7lMy7c1hSAOJgyGQ69SfakaM/VZuQkAQ3ycxkYZ
	 1LZUmWfo6sLpgdntNtd5Ek7cjzHSD76TQymc3342SRWV5T2ThJNMBBJmNDqEk8b/R0aL9
	 BV5kz43qMCINQEthwvbUhqCJAyr10ENgHckyr7xGgxjE3ogc/sMb9CFqKSAvvGg=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1747856924;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=LTxE9Yb2r8dLahvXU0v8CIBcEw3dxDbuyQCr6UuSSA0=;
	b=yY4/V8KHay4grV7R/UI53wvHh3OilW4Mc4Naac9F7lyS7LBfnPVvSiXO/PdzU6IIQFK4
	 aw3C0mMK1998S3cgriqGXEowsN7NlzgcmyFe0kA6aL4i55zrEGWffSprBtnABqC0P/E1s
	 YSyhwaLivjgCA8tB2QGnhfl1B3f3oqaRU9ySMmUwoJ3VTUhE25lUHmsgFIrnV5oDBwVTs
	 lpbwCEXZ7SqO4XQ2I1lB9x/aEDCzBbLl0wVdRy3ZolFmGIK5sZNw7d+b2mLT3tMwgHXFM
	 CsVqfhZyHftURuKGyWutJg8Lxu+lfxe5YblW/cTssbRZsRs0OTdPOIpwFDLY8d9oSxTyz
	 GDIdVvu/IPzhWA15ROxU2d6sWQvHcA3wjzPZQRKMrZaFRX2I1wCTY5od3r0W9neykAJXf
	 XjOyC6VT+xsLXWELEU+TqUFPUrJg30MzeAp7GOmNlSwTNn/jNA9WiqVijudynkcVC0A3P
	 9DBhknp6Qv8weYn3tkj3YLr6xQN+DwCEEk5niza2Z3Ex4755ljWcJ+R21E6vpcf0O5E7u
	 yOQllHj5/+8xPixcgxaEt0oGsSdJUtMWU6Zt8skf9v0uHmDrcYpTWYoJe30RmptTWYOYo
	 jBQEPuwQbLOVI6OM/EsSSZhGcNw0GWg/a8SrokseXS9wKwYH6ttV0vv73W76M8E=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1747856924; bh=liPU9YORblEFjB8Li3//3zilGtMryo3pmHS0W7XpouM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fkdZjDrSDF6V/8sQWxvh9EurFj1HHxZ2/l5EzgZ/fu4E42tlCTWcfo0NuZH28nHhY
	 za75pZ6MSnOnCszub8mwHSjobLz8by45mzmdBeDdFMDe/oIS5kN5I6LFymQ85dIRx4
	 M8UdMdvXPSI36WOiEYM1ZHagUyBq6AhCX2ooUMPdqa8LoHXbslh1E4AvS1wux4xdHM
	 KUPg8Upnvps/lIacruHWQPHKGSZkd6Z6XS1/0bU2VXbXamYswKvXBZgGT5d5ZNdeL2
	 duVqHp6nbQr5WulBXeKDuZ8XcW+NKG2Aj8/xSJ0KhXtJ3yRm75NCfkhHK74DkiYuZD
	 HMsctUDURvrkw==
MIME-Version: 1.0
Date: Wed, 21 May 2025 21:48:44 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, consulting@bugseng.com, Stefano Stabellini
 <sstabellini@kernel.org>
Subject: Re: [Eclair false positive] Re: [PATCH] x86/msr: Rework wrmsr_safe()
 using asm goto()
In-Reply-To: <5eda4958-0eb8-4b52-8ae4-297206c29803@citrix.com>
References: <20250521143658.312514-1-andrew.cooper3@citrix.com>
 <8504aab1-c48a-4981-a502-93a2fd18880b@citrix.com>
 <70f8e278921685e39eec6656a529b31b@bugseng.com>
 <5eda4958-0eb8-4b52-8ae4-297206c29803@citrix.com>
Message-ID: <a5b12ada8bb70e5abc876d289e965b88@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-05-21 21:43, Andrew Cooper wrote:
> On 21/05/2025 8:21 pm, Nicola Vetrini wrote:
>> On 2025-05-21 20:00, Andrew Cooper wrote:
>>> On 21/05/2025 3:36 pm, Andrew Cooper wrote:
>>>> diff --git a/xen/arch/x86/include/asm/msr.h
>>>> b/xen/arch/x86/include/asm/msr.h
>>>> index 0d3b1d637488..4c4f18b3a54d 100644
>>>> --- a/xen/arch/x86/include/asm/msr.h
>>>> +++ b/xen/arch/x86/include/asm/msr.h
>>>> @@ -69,20 +69,20 @@ static inline void wrmsr_ns(uint32_t msr,
>>>> uint32_t lo, uint32_t hi)
>>>>  /* wrmsr with exception handling */
>>>>  static inline int wrmsr_safe(unsigned int msr, uint64_t val)
>>>>  {
>>>> -    int rc;
>>>> -    uint32_t lo, hi;
>>>> -    lo = (uint32_t)val;
>>>> -    hi = (uint32_t)(val >> 32);
>>>> -
>>>> -    __asm__ __volatile__(
>>>> -        "1: wrmsr\n2:\n"
>>>> -        ".section .fixup,\"ax\"\n"
>>>> -        "3: movl %5,%0\n; jmp 2b\n"
>>>> -        ".previous\n"
>>>> -        _ASM_EXTABLE(1b, 3b)
>>>> -        : "=&r" (rc)
>>>> -        : "c" (msr), "a" (lo), "d" (hi), "0" (0), "i" (-EFAULT));
>>>> -    return rc;
>>>> +    uint32_t lo = val, hi = val >> 32;
>>>> +
>>>> +    asm_inline goto (
>>>> +        "1: wrmsr\n\t"
>>>> +        _ASM_EXTABLE(1b, %l[fault])
>>>> +        :
>>>> +        : "a" (lo), "c" (msr), "d" (hi)
>>>> +        :
>>>> +        : fault );
>>>> +
>>>> +    return 0;
>>>> +
>>>> + fault:
>>>> +    return -EFAULT;
>>>>  }
>>> 
>>> It turns out this is the first piece of Eclair-scanned code using asm
>>> goto.
>>> 
>>> https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/10108558677
>>> (The run also contained an equivalent change to xsetbv())
>>> 
>>> We're getting R1.1 and R2.6 violations.
>>> 
>>> R1.1 complains about [STD.adrslabl] "label address" not being valid 
>>> C99.
>>> 
>>> R2.6 complains about unused labels.
>>> 
>>> I expect this means that Eclair doesn't know how to interpret asm 
>>> goto()
>>> yet.  The labels listed are reachable from inside the asm block.
>>> 
>>> From a qualification point of view, this allows for some extensive
>>> optimisations dropping emitted code.
>>> 
>> 
>> Hi Andrew,
>> 
>> R1.1 is easy to fix, I'll send a patch myself. On R2.6 you are
>> probably right. I suggest marking the rule not clean to unblock while
>> we investigate. It should not be hard to fix this FP.
> 
> I've not committed the patch yet, so staging is still green.
> 
> But, it occurs to me that this is not the first asm goto() to be 
> scanned
> by Eclair.  There's wrmsr_amd_safe() in amd.c (c/s b3d8b3e3f3aa from 
> ~6w
> ago) using exactly the same pattern, which has been passing just fine.
> 
> Clearly something else is relevant in terms of triggering violations.
> 
> ~Andrew

I think the reason it's simply that file being out of scope due to being 
imported from Linux (whether that is still true I don't know), which is 
unfortunate. We ought to revise that list 
(docs/misra/exclude-list.json).

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

