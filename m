Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32656AC0BDC
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 14:46:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993860.1376975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI5J4-0006cl-SS; Thu, 22 May 2025 12:45:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993860.1376975; Thu, 22 May 2025 12:45:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI5J4-0006bM-Pa; Thu, 22 May 2025 12:45:54 +0000
Received: by outflank-mailman (input) for mailman id 993860;
 Thu, 22 May 2025 12:45:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eYSi=YG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uI5J2-0006bG-Mw
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 12:45:53 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0fb3357-370a-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 14:45:51 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id DBFC24EE0737;
 Thu, 22 May 2025 14:45:49 +0200 (CEST)
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
X-Inumbo-ID: b0fb3357-370a-11f0-a2fb-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1747917950;
	b=ku5n8v/yax0xZ5Cve20i2DM/J5ihSpqynsFSJrpR3a4Whg+DL4X5b/tjOWBuUcPWmi7k
	 GjLJlNqGtCC42chPPI0aTr98jXbuaSCns1/tsWKUxyRH2V12l63AnQNMmgrI1z5K2pMav
	 WbZhyZ1sb4PgYFvsGvO6UZlAAyfgi0Ur7jygr3115XyF7XoKdWSkqFjcq8E0KSvaemrfQ
	 wPYE4PZ3fJTkK/2missN0vylYny3SCRrb5AWQ2pHac6KQU1fnB7iGKzzG1Q6xyvFshvOf
	 1RkWHVObGxvHNY8pEvn0iLNcJMnyLyM0voWkgJnsgswnJ81yBowOZiHw3KS3nRvVDqP+7
	 k/Rd1+s3x8jS2FngnyIlnZUgNma18FC2CQsOMGxNY/FMEB7zaf+CiVVof3O6NHDYJo2aq
	 1QxavB32ZzfbMrPx/JzAebFgwOhkzTflO8Bq/yQBCM6XsFb4mq3NQ81F50JOvqW3uSysl
	 6HoKasgF9gNrOGlx9h5pWlb1P8hjP2CWjI1RpUAod4nWPSEyRhNdebzU1rMZqYPQAWqgT
	 0PPT4FBQJn3PCeuNhvgpmdf3E7c+V1yLgK2LSpvAjpn7TZmY05Vps1KkmGYYgFUDNsrqM
	 h9JUyH1YAkCwrsKIr2VarvfzAgXamKQNE0J1r8zFsY2jSSHL6SLDzH4iyV89mZc=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1747917950;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=/byCIgRj4kR7pIiwC4BW3reIywL/OWkrGjOXyNmD55k=;
	b=r9RABhdWscKDn1w7fZ6LMKi3emqBlzzusz4sGcViVKOBcWsWmJgXWabo0TNtua0ILtpe
	 WEJKvJB66LONKiMuI7SKZ1xkgWknNsnxfM1tugii+UgSzW1x/gxiyiAnOd/ppqOrWujKJ
	 XC9kxinrGlh6xtWe9SzmkZ1Utx1CPVFzAaWZhXjQ3t90oXu/LjRqTpm5963tTlkV7hOW3
	 hmPECtHKBlA07dQuBgwa+JgDTIm/+Q41pSb2NZZ6YOkr13PdCBNMZin6A87GPsb8R3oGj
	 E2ScTYZMMB9wmYU+VyJkukGmgjehbQkVTTjoIgzFwSbKbhEFfzr42YHLELo7BkECIL5V9
	 i5dxBXJwkYYnkxF4ErcOVNsbQ0xFBESs4xaKGTIEPrzGk/zdNvUJpPa2XoF7JiGhgVvT6
	 Jf+ZKG4+9hLvcSezSZzsEhDTrLedG/K6Nv0p0F+GfekE3hM8OfFoo8Qg7tChyPGTOhIjs
	 VD4Rhzb5f09Ox16YtJjKlD/cRbxTrm+59x/2fmuiRePUSxtPEodXbgkaz3bstfM8bDz69
	 bw/B1GUCSW4+INqkd+HeQGCjRBfkNnrBrUVIYwJ447mpqQZUnmTcrigwnh5j0303Wdh2y
	 d/lW/Ywv+D7kDcclLvQk+2603pSk9So3uAKeiOkNZQjyvspkI4WqP+5xE2GNzyI=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1747917950; bh=bGVo0mC4dfPvIYYkEfT5dmbRsPvlQNOENL1aBSZWmow=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VDyYLLLtnA+Qk7V5AI96a5rFXCSQsgAecgauBAwwWBDMsH1K39MDfgaXX1QCJgUNq
	 yHOKsiOuPR2uWZMfhnK9sx75Ois0HLMswSjRDmEO/xDmTK8+PRnB6X6oXBScQpwDJT
	 nKiVK06p8qAofuTYeVBhnz2jC8L3Jdu4kmK+wTZVpbBjC81OrX92tbtyDRS1wkyl+G
	 BPBhhwjME3pD+gX9W22Ag2nI984svu8PeeJikV6M2RmqA7jcYXlLFWFwH9rUY2Libp
	 t2DYLgEPqt4AWPNMckYOX1c/ckEEE+Q5jbKWGZP8+ASB/oaN9FxlMABJTAgL29d87Z
	 iMDeVR8MwUkiA==
MIME-Version: 1.0
Date: Thu, 22 May 2025 14:45:49 +0200
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
Message-ID: <e25858b4fedaa40d8934e5fe6bc40c01@bugseng.com>
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

That has been fixed upstream. I'll reach out to you when that fix 
trickles down to the runners, so that you're able to test and push that 
change.

Thanks,
  Nicola

> From a qualification point of view, this allows for some extensive
> optimisations dropping emitted code.
> 
> ~Andrew

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

