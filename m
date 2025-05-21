Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D06DDABFD44
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 21:22:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992464.1376182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHp0H-0006Xj-RQ; Wed, 21 May 2025 19:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992464.1376182; Wed, 21 May 2025 19:21:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHp0H-0006VO-OC; Wed, 21 May 2025 19:21:25 +0000
Received: by outflank-mailman (input) for mailman id 992464;
 Wed, 21 May 2025 19:21:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9FE4=YF=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uHp0F-0006V2-IE
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 19:21:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5e409cd-3678-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 21:21:19 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 5A33D4EE8F37;
 Wed, 21 May 2025 21:21:18 +0200 (CEST)
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
X-Inumbo-ID: c5e409cd-3678-11f0-b892-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1747855278;
	b=LUctiTTGH2+3XzTGk9rizEELeyVu/FbqqsAG2V+413ub7cezO1DS8WAfpQpOefHxykfl
	 md8fJhP0+v+APOuo6aAgUBf6MBlYe5QZhhkSqxblgXR2diFmHip/9j1VJMVMcT3KWtsDZ
	 ht6WMv/nHsUDJcRtpaPoyGa3dYOS16Q7NY3Yyv1jUNvLMuSPJZILMyCmWSD57CDdxr6eW
	 WQ/DDZAN2PJqzL1nszxNfnwO9YrxaRxiyUkes/qvg6ee4PbnEYQt4NEWupSNRznx7poFX
	 c+yDS9BoKVOl62iW+oYXnTpBrWNU+oXk/hRDhKjsIlNORBPrBJkIAg8gXJbzWfXmwEbH5
	 c7xqHxLXg56cj0MKmDyBSb7P8Hbj02U4KWHurKV6FZXHlgnTClegvPcHarp8C8xSx0Q9N
	 Cf8i4/zmKloB/nkLMAD4QouGqnSbfyhcJKl2y/GrFvOeg6dIKZLh10rd5C+BcsU2E913c
	 mf1CZ3y7mRo7/143PXMal3CMEYoeeqduXJoDmputG6nMDa1X41qtji/cra/SYREIQjsbT
	 n589xsPYDx0I0VhvDOYBEa6jx31CMPl6mxQqQbXh6PiNbxkidzbTM67izpaDyTTeXuJUt
	 gecOChMTdr5lBX4LQJKNv/CEOTPtxPu0ehejQpLvgOwv0BohLaBmImHtOp/tZAg=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1747855278;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZraXWh/iQ3lNhXXC1xKcadFz6sINU0JgNn4VFrkMYL8=;
	b=ZJgQQL20o1vedpFCeFzvk27UBS5LjBtYDfA3kk3WFEsrrFS+6eoGvvou/2S1l8rLsV2T
	 DZQKimTxIXWV6B8evj6EjscXwNKJ+KCvxvHv/bb2CatMcWlzhDSpRpUA4/LVyGxgWXuW3
	 1L7fCh+ffybfQ21ZbS+8ujMOkl39r5WDeNBFx+dVIoyrf5ypiU8R2pI476IkCbLpH5JxC
	 sbTaApjaM1/BU2rXsSXsV/Mvn4oXqDqFRbnyLkB+OVLX5mQA0ahEHFzO5L+4tDOQ+/Day
	 /JE3N0krhDjAoagYRUVCg2IeyVLOQxSkNU4S/N2UMpSqhHHOpBhvXvbI1IMC9wRcXjF6W
	 NmewFTanGj7Oy8me3q6nQUk8s42Sk9PxsCRJVhHpLpnzK6yxxJFHN71MoGEBP1ao5jZ2I
	 WS2NstnBlVTqFdNiy9Fs9XQ9gW5t8s/4eDuyLbL3fFrVOIpy1gDm3b0er4FuZyR5AKGRh
	 uQM637gEg0bdpPXkxc4fk5A/10w16xEmFhatzc7jwiDluffeYDxHHGpEsu4GwyOqo3UMz
	 Tl8hv/Lzk3NhE6BLFTve3TyddrV8pVFDZSnz3DSRfPwg9g9ONuv24+iC3DYPLKyzRKjrm
	 4z1UOzVVLVbrR+HZPjNYpTs1psyBKyJqCpLL8iOaacz2YiomTHY5musfyuKa4IU=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1747855278; bh=6L4iSTlNiFXCb09zXDURe3Zac62HlWYwaIgEpnrWWuM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CuBhcUgKqnawtWZgmQdLprk+2Z4J5J1zRPc/8DpFLnIll2gte2X/DlzXLFNrMoVRd
	 UadnR78nnpDhFPSURuqKkDkB6zJWb0wzokZgKo8w93AjUuISbgujA2iIf9tWTNBkc+
	 LGmhboDM98FwCq/8Y2xUQelrKQEOwEMnUY8bkAW8CE2153ZXnz3QCEen3k0SiVL0A0
	 Zp0JnD8NaM4VpNnWa10j418xkLvD/5e0lyb5O6TKXFuu0LTsKp8EEI1Dkuf4cRhvK3
	 PV0UzeDDB+fAw/7fHH6TekAA6d5waidvTBh67yBsw4aq5Ifk8lP6Zlf+a/y492lN06
	 IRJZbhY7mvTJg==
MIME-Version: 1.0
Date: Wed, 21 May 2025 21:21:18 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, consulting@bugseng.com, Stefano Stabellini
 <sstabellini@kernel.org>
Subject: Re: [Eclair false positive] Re: [PATCH] x86/msr: Rework wrmsr_safe()
 using asm goto()
In-Reply-To: <8504aab1-c48a-4981-a502-93a2fd18880b@citrix.com>
References: <20250521143658.312514-1-andrew.cooper3@citrix.com>
 <8504aab1-c48a-4981-a502-93a2fd18880b@citrix.com>
Message-ID: <70f8e278921685e39eec6656a529b31b@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-05-21 20:00, Andrew Cooper wrote:
> On 21/05/2025 3:36 pm, Andrew Cooper wrote:
>> diff --git a/xen/arch/x86/include/asm/msr.h 
>> b/xen/arch/x86/include/asm/msr.h
>> index 0d3b1d637488..4c4f18b3a54d 100644
>> --- a/xen/arch/x86/include/asm/msr.h
>> +++ b/xen/arch/x86/include/asm/msr.h
>> @@ -69,20 +69,20 @@ static inline void wrmsr_ns(uint32_t msr, uint32_t 
>> lo, uint32_t hi)
>>  /* wrmsr with exception handling */
>>  static inline int wrmsr_safe(unsigned int msr, uint64_t val)
>>  {
>> -    int rc;
>> -    uint32_t lo, hi;
>> -    lo = (uint32_t)val;
>> -    hi = (uint32_t)(val >> 32);
>> -
>> -    __asm__ __volatile__(
>> -        "1: wrmsr\n2:\n"
>> -        ".section .fixup,\"ax\"\n"
>> -        "3: movl %5,%0\n; jmp 2b\n"
>> -        ".previous\n"
>> -        _ASM_EXTABLE(1b, 3b)
>> -        : "=&r" (rc)
>> -        : "c" (msr), "a" (lo), "d" (hi), "0" (0), "i" (-EFAULT));
>> -    return rc;
>> +    uint32_t lo = val, hi = val >> 32;
>> +
>> +    asm_inline goto (
>> +        "1: wrmsr\n\t"
>> +        _ASM_EXTABLE(1b, %l[fault])
>> +        :
>> +        : "a" (lo), "c" (msr), "d" (hi)
>> +        :
>> +        : fault );
>> +
>> +    return 0;
>> +
>> + fault:
>> +    return -EFAULT;
>>  }
> 
> It turns out this is the first piece of Eclair-scanned code using asm 
> goto.
> 
> https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/10108558677
> (The run also contained an equivalent change to xsetbv())
> 
> We're getting R1.1 and R2.6 violations.
> 
> R1.1 complains about [STD.adrslabl] "label address" not being valid 
> C99.
> 
> R2.6 complains about unused labels.
> 
> I expect this means that Eclair doesn't know how to interpret asm 
> goto()
> yet.  The labels listed are reachable from inside the asm block.
> 
> From a qualification point of view, this allows for some extensive
> optimisations dropping emitted code.
> 

Hi Andrew,

R1.1 is easy to fix, I'll send a patch myself. On R2.6 you are probably 
right. I suggest marking the rule not clean to unblock while we 
investigate. It should not be hard to fix this FP.

Thanks,
  Nicola
> ~Andrew

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

