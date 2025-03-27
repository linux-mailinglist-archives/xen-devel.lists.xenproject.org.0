Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EA0A72BFE
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 10:00:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928738.1331413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txj6C-00076q-E1; Thu, 27 Mar 2025 09:00:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928738.1331413; Thu, 27 Mar 2025 09:00:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txj6C-00074x-BG; Thu, 27 Mar 2025 09:00:28 +0000
Received: by outflank-mailman (input) for mailman id 928738;
 Thu, 27 Mar 2025 09:00:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rYrR=WO=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1txj6A-0006qr-Tj
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 09:00:26 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec635e77-0ae9-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 10:00:26 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 1BCF34EF54CA;
 Thu, 27 Mar 2025 10:00:25 +0100 (CET)
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
X-Inumbo-ID: ec635e77-0ae9-11f0-9ea3-5ba50f476ded
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1743066025;
	b=EcklclTWmgy0gkALuyVF7fd/7VOoInAMOcg48FGcKLV8en5kZzs6Isz6maAo1DBieTMN
	 QUEiysuTP6JTYdL74Xe1OZS+gkfRHNNQ5UVsGzFRXr6bidki8DcPRVlRjHAkN7g3zu3YQ
	 usGEAKlQy0fYaOq5/8g9MPZ0z4tDwDawuoRddOx/NowNrJiUAQzQmQnAevZYtqN0MIPlp
	 lPTctkTnk0JturvZuYtV9RGDQfxjuTbKLKELM26hhlWOZc+wMdCHRCiPm2HkH3BOalMVc
	 RdjGgendqmDGjlyJFQDSSzVsXRpduuegXg9Mwb664WRRqZb30zZlp7OcYSvxaNqaaa3Hh
	 KZeA9YrMQJViu8UcznnO5ojLrEhWjYUiQrFJTp3nhLh/QLfRqGburqggVAGC6R/rciUWA
	 AjxcKvTJP3tIqer2X8ealRyS5JEPmC/WAOZ7vH6/vXlQ5r0tpPPF2IAkpKz+0hL9JVsBS
	 5qbD7oBC5IkwT2mOabs6jmEhAJyv+T38PcfHEY0G2y11IT24APJZrQk8w2bOCGFtv4SR1
	 4x3iGz6ehQjwPSokehcOPEEFo0N3NUTteaPSg2Wj0XlPXyCjoHfioXoGEMEj3ucG2K+uy
	 QuJieRhzNIdLIMjaL92X7fZVogSpVJAtzscWH5bo1KcZIaFuxfFcPtNjEdb9ibY=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1743066025;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=ipOX3+q6V3eF23dtuRMxbx3zMw7Rkxm0jMlQucEVhKM=;
	b=WJrRmotMS8veQ0IenTmzvhI7Mg5FUZkMMNvep5CfxveHbKRM+/NvOMHPra7WaOtOTLa3
	 MnRr/PD0ueBX0xgCnM6Qt2Ffr2lzZog3w+SwSh3+pDDPz1LrX8ccmC8/T1uMokKeYXwJj
	 C/F+Ys0DqyxKtjwe736XRtCrYcPKaNcwTmVQeGMiwJi2UjkJvU2CZdCD5Jr+CkWGxCvZ5
	 ss/uJE+Xe3OODHaLmdL4aHVmlCMCA+DoI/y7XdV1vxPIhfKAxVXkOM2GSNsG7eDeNyBDW
	 +wmhrF2bxL7CMSDvT6XcCHXMhcJTFBA0t1++NBQ3VmSJGqrFFlw1UPBmhSaf+SPpDPtqs
	 byXcDTZC0ZNTtPM39iTaxFpH8UZvliuGV6sTkfKux+YQ0C33fIYiFFWx58sftYa1RFPC6
	 qDofDaeYtcoFd6VtA/IAi3ksVV82SODpqal3zDk33hExRJPsJV7rjWtyTBa3g3+AzQAHc
	 8kFTV4Ias+OXJGVMxTV6+6ANxHHDSWIXuLLA7zvqz/K3hieLB17FEazR3v+kIjVkX2ATi
	 QNQRLReP7fqy4+uhPh2zf7aqHJzPywhogA0rvHQOvcICxaJDesVdfFL3MrFJhlm0n9msi
	 RL/LUO8jEdOK4YATX9fQnkhfVsanIRjTBieb6yxRyRdulFH/h0zXd8t4eHsA3NE=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1743066025; bh=Q+/SHkmUZ+n4LlfSvIvK+N1D0APircbV/qwqLqNDiQk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NqVSg3mNp16yxzilPTRzjwt9zO3KFuLeXnfg/HG18hePf985vt/n1aXsHJrqA5aDN
	 Y5deiZUGDdCR/V/4lwPV0yL9x+R1xyM9Bjtv4dXd8kuvEafkL5qMXf+98dHuJ6SSCf
	 JeIkIc2xasoURB/4njN+Mo4iDNvpfN7M6Aoc/tVDPnR5ZxH5oeRhci/AGVXbTNhyFu
	 cha9VP+6fa4P7jRFhs8JSrCNvpJwoSllmHHS/Q6SGBF5ppRB1KFtNikOdHjV8ythdB
	 hU1NKHsHAMTjwyLEcWe0064SDYqZS22f1gPLCYgXTl28pxZxIx3eml2DKmfMzMNez1
	 ZpMgzXo+rDr+w==
MIME-Version: 1.0
Date: Thu, 27 Mar 2025 10:00:25 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn?=
 =?UTF-8?Q?=C3=A9?= <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 2/3] xen: x86: irq: initialize irq desc in create_irq()
In-Reply-To: <bab91924eb87a56260d62faee028d5af@bugseng.com>
References: <20250327004044.2014048-1-volodymyr_babchuk@epam.com>
 <20250327004044.2014048-3-volodymyr_babchuk@epam.com>
 <84903e47-038c-46f5-862a-a0c9623c8125@suse.com>
 <bab91924eb87a56260d62faee028d5af@bugseng.com>
Message-ID: <2836f7977d3a7061f481c1e83d0b2820@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-03-27 09:37, Nicola Vetrini wrote:
> On 2025-03-27 09:03, Jan Beulich wrote:
>> On 27.03.2025 01:40, Volodymyr Babchuk wrote:
>>> While building xen with GCC 14.2.1 with "-fcondition-coverage" 
>>> option,
>>> the compiler produces a false positive warning:
>>> 
>>>   arch/x86/irq.c: In function ‘create_irq’:
>>>   arch/x86/irq.c:281:11: error: ‘desc’ may be used uninitialized 
>>> [-Werror=maybe-uninitialized]
>>>     281 |     ret = init_one_irq_desc(desc);
>>>         |           ^~~~~~~~~~~~~~~~~~~~~~~
>>>   arch/x86/irq.c:269:22: note: ‘desc’ was declared here
>>>     269 |     struct irq_desc *desc;
>>>         |                      ^~~~
>>>   cc1: all warnings being treated as errors
>>>   make[2]: *** [Rules.mk:252: arch/x86/irq.o] Error 1
>>> 
>>> While we have signed/unsigned comparison both in "for" loop and in
>>> "if" statement, this still can't lead to use of uninitialized "desc",
>>> as either loop will be executed at least once, or the function will
>>> return early. So this is a clearly false positive warning. Anyways,
>>> initialize "desc" with NULL to make GCC happy.
>>> 
>>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>> 
>> Hmm, this puts us in an interesting conflict, I think. Misra, aiui, 
>> will ...
>> 
>>> --- a/xen/arch/x86/irq.c
>>> +++ b/xen/arch/x86/irq.c
>>> @@ -265,7 +265,7 @@ void __init clear_irq_vector(int irq)
>>>  int create_irq(nodeid_t node, bool grant_access)
>>>  {
>>>      int irq, ret;
>>> -    struct irq_desc *desc;
>>> +    struct irq_desc *desc = NULL;
>> 
>> ... consider such an assignment useless (and hence potentially 
>> confusing)
>> code. I'm curious what BugsEng folks are going to say here.
>> 

Just to mention it: having a "do { } while" loop instead of a for (just 
out of context) probably avoid tripping gcc's false positive and also 
help with MISRA Rule 9.1 without needing an explicit initializer.

> 
> It is quite odd to see this only in coverage builds, but the side 
> effects of coverage options might trigger some of gcc's internal 
> analyzer thresholds. Anyway, since there are no concerns about dead 
> code (see 
> https://gitlab.com/xen-project/xen/-/blob/staging/docs/misra/deviations.rst: 
> R2.2, "There shall be no dead code", is globally deviated) and that 
> this might actually be beneficial to remove some caution reports for 
> R9.1 ("The value of an object with automatic storage duration shall not 
> be read before it has been set") I think the overall effect is 
> positive.
> 
>> Irrespective of that I think such a seemingly unnecessary initializer 
>> wants
>> to come with a justifying comment, e.g.
>> 
>>     struct irq_desc *desc = NULL /* gcc14 with -fcondition-coverage 
>> */;
>> 
>> here.
>> 
>> Finally, did you report this to upstream gcc? It's probably too late 
>> to
>> fix in gcc15 (if still present), but it would be nice to have it fixed 
>> in
>> later versions (maybe including a late 14.x).
>> 
>> Jan

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

