Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4902DAC32BD
	for <lists+xen-devel@lfdr.de>; Sun, 25 May 2025 09:35:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997060.1378092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJ5s0-00089m-DN; Sun, 25 May 2025 07:34:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997060.1378092; Sun, 25 May 2025 07:34:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJ5s0-00087k-Ad; Sun, 25 May 2025 07:34:08 +0000
Received: by outflank-mailman (input) for mailman id 997060;
 Sun, 25 May 2025 07:34:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0YXF=YJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uJ5rz-00087e-Dy
 for xen-devel@lists.xenproject.org; Sun, 25 May 2025 07:34:07 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2e918b4-393a-11f0-a2fb-13f23c93f187;
 Sun, 25 May 2025 09:34:05 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 6B2134EE99B0;
 Sun, 25 May 2025 09:34:04 +0200 (CEST)
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
X-Inumbo-ID: a2e918b4-393a-11f0-a2fb-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1748158444;
	b=w/Qj20s1bo9x4pawXnuMK7oQoZnzlqlCubC3wwOZQJQRGUl3F03bEI3b4Ej8fzj/IOUz
	 eFZ/FnB5gMx1pt2r81DOs7VuglowOvZwBc/1PUFiZCUKtMNQcLESj0JSndbWpb0GOhMU+
	 nNLxrWrhpSi7tzBYR73bs8KmdKTSudaWhhAAjuWzts4+nQeh+n59fqrDKtdznPKActruK
	 WOje8xKhgtb3BSe/XsnIabRipW5PWfYds4CbdaGwj9NA052+cXemlxXWOr20FD6ooNscb
	 vbD9SLQ7YvHBaG15K9SqySaNtyvSUsddDtLpS/zexNfVZ/4ANHWB8lFP4IE7vAaWiss6W
	 B/EiOIdZaLJ4LAWQ+VwmCPSX/npQ5JOTNWjTu7hxp13Kim6XlX+2i3B7qTpELBTxTaX05
	 6bcgNIfc/tLJPFsh4GFzrm8OrWIz46OvBbY0/Ryy+irhmp4LNeOT3nKqfQjXFTnauOlGk
	 iX2Ve0tHab31SJ6P4sDDzwBL/lpWhN2OCKNkpa7bM/booXCdEUxOcb1xjF7uaoklbHXLD
	 6oNMzZ+UA7heB4y1mTPeofp86i10ub1+BpwDuGHIEneLR83ZMIwfWtAGSovHd8DJFTo5A
	 THxcLF8fNRfcu6absQ913+GlQoMHHNAZwq+aW+xnxtPqzO5CvrkF54eQHFpxSF8=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1748158444;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=faJ8k823wZEhLda1cYFvYfjBkRjovX6qCNGjUUvMt70=;
	b=uUFgBEsU1xvV8NYzFrerulJoQG1wC5dWAdYSZ1D+aEds0wIN/PWgM6J/681I+u4U6SKT
	 fnqhG1a4IpbTDHVW8EzF00yBD0jJJXEmp2oJwnrQb/P0ALHaveVcvsHXC7ybL6IQ43bOW
	 diqkfcCQY0DJr0mCahD62ByS3mbOWBNzYCXUSDiFt3AHdctukfvc306r6cBHTcMUQurmd
	 6MCe43MHuec1DxvKyi9OjBNSl85JL2eEW63BxupYAU3KCkc01jVMfDNz+g4nP6V90cmeR
	 BCY6kvO2xU+vFDp4Z02NMptutvsiwWmWadVXlLvXd4Rttpr58km8g4zOmLECX6kADIj++
	 PUM0z+Ok4QXXLIkfH+nN24TJB4fcrCh0WEbikzzUqOVpH539EAOp2d6aX6xNf7tT3C6h8
	 y/T52rwxJ2eQuqJyYQk0bQlR2DrKa+d8Is3PGQQG2Sk8PainI8SWbjbtXs2IP8vheu9Bn
	 9Wg1Gdw4PzgENX8Tdtd8nWIDASCVMqiumGFd9p3uUS5Z99qhKm9itBOjvYkJ5B51l+r/n
	 DVUBNZGBOmR1We0XS0mtyMM92ZlRHYJwsoaAhj6E1EO4Zpq1H0SA9y1lERA6fri6H+fwV
	 SOOenkEktSWyvhCn5IeDCCug7Ii+D8GhsjHocrz4gscNGm/i+Bu3l3Y7DxPJFRo=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1748158444; bh=7hBZWCNuA0RsOsR4BznSUhPqoXdSeUP+JJwjUVzDVLE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WUTdZfce59sEltHCpgYHMCOx8RA+Nu8beF0RyuxgACh0urKbFw0jyUNh9CGyXh7cA
	 9M2MQzrEFK4kTR/kGkTDDRjnp5IvJZxQ35DcZpOJVaP1eCuUouA2Rd6RsyuJy6aol/
	 iOFzFlbWqwj2QK58WwIQXRhnxPOM0K7BPM3xuIct22FUmTv7avecTdnwNFt9Bcr8h0
	 W15nTijFfyn36SFPDbEfQ/Yo6Kdcd61QZglfrooIgj6ouI669L9HkBX3FP2NTIZsce
	 9YXN3V40c64QjC45/6weDthc9///wrC52UPFtaSXwWISnzw0M4CxssPOydt6pDxZ8a
	 Csl5AU7S3dFrA==
MIME-Version: 1.0
Date: Sun, 25 May 2025 09:34:04 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, consulting@bugseng.com, Stefano Stabellini
 <sstabellini@kernel.org>
Subject: Re: [Eclair false positive] Re: [PATCH] x86/msr: Rework wrmsr_safe()
 using asm goto()
In-Reply-To: <49f092f9-c0fb-4b66-af20-368c736dde91@citrix.com>
References: <20250521143658.312514-1-andrew.cooper3@citrix.com>
 <8504aab1-c48a-4981-a502-93a2fd18880b@citrix.com>
 <e25858b4fedaa40d8934e5fe6bc40c01@bugseng.com>
 <49f092f9-c0fb-4b66-af20-368c736dde91@citrix.com>
Message-ID: <526fe46bf2e4b5985d1b8cd3361e5730@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-05-22 15:49, Andrew Cooper wrote:
> On 22/05/2025 1:45 pm, Nicola Vetrini wrote:
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
>> 
>> That has been fixed upstream. I'll reach out to you when that fix
>> trickles down to the runners, so that you're able to test and push
>> that change.
> 
> Oh, fantastic thanks.
> 
> I'll hold off pushing until then.
> 
> ~Andrew

Hi Andrew,

both runners are now updated with the new images, so you can rerun the 
tests.

Thanks,
  Nicola

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

