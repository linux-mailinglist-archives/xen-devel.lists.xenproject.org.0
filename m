Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC78B2F17C
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 10:25:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087976.1445844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up0c9-0008Kv-6B; Thu, 21 Aug 2025 08:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087976.1445844; Thu, 21 Aug 2025 08:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up0c9-0008JJ-3F; Thu, 21 Aug 2025 08:25:41 +0000
Received: by outflank-mailman (input) for mailman id 1087976;
 Thu, 21 Aug 2025 08:25:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uBnp=3B=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1up0c7-0008J8-4s
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 08:25:40 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69626cf0-7e68-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 10:25:36 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id C7D114EE3C0D;
 Thu, 21 Aug 2025 10:25:34 +0200 (CEST)
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
X-Inumbo-ID: 69626cf0-7e68-11f0-a32b-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1755764734;
	b=z0ScJLQ2rorO/RMlHDUb5gkNN3yY0byb2HbylteeoO6j5vF5eMXUI9RpyRCiQT8XBOgz
	 He2j/2fqu7qvo4tmDYd765apobjmKSXeYViXmX8OYgnjx2AYZlx69oGlNFDzWdehIQy1o
	 iUZ2vLhGvy5BStYLiCpd7WFy1AYMIwmT4LLqQezie/n2xx1vwhwg5heAVJBALRapWXCpu
	 OZ+nhWz6gU40+KcQb3Mqsf2Nv9aymK2l4gt8tVVo4VEooX4iIWZzVD6C011PnX5ToA4J5
	 34sFLWOertOy4DLAgLjBX/1HIVwPjQJfCmR0ZIXxFkMEaPgcUDJ1y2Z1UCBm30PlzpxTg
	 vs4lm0uPqiPjrGNK6IlcKG9+2uHJdXIJO0lQaJ58JgTwZ7PlvAZRAP2+q3NRntcNdn2Vh
	 JM8PIZMsyE4Z23GgcX8YLyzoNwuauRRCtlbzY2om92a27uEJjDXWqEKbvMgg2OJrf6san
	 6PFWc6xqlo8vCwRX0OXU787tjPqTbG3faL0kXfBfduhWizwpPFXbcZeApg4Qo/PKpz7Rv
	 C1XHSGTu2LtfvDOvVQTJyQS040LKik1WPDd5zK3aF6YZnKKOaonQZsRY8pMh1WaGQ6hrl
	 a87fcEzebFN7g4D1FOuzlhwiPnPpoVzxtpsPih297pDLfYQNeLHO5/qQuHAQE5Q=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1755764734;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=iHzFbEZvEeJsSvh3JJ41FaQH9+W0dmD64PMJY0k9kDY=;
	b=qQlmvJvYCmXb9XDvfQro/xlDYzBXoYrEV9ADEqQT+HbE00EyTcIQuRR/PHZl3y3bHsY5
	 LTfwfdM3eTQfo8lMMoTvVivoAxhrO7QL9KWGtnWgTfc5V3j3zzg3D3a12vwVd2bgaUlVG
	 TqdfsKuQWH05JtpbIEVvexVXoSx0XKt+JxlNKAneBIgHnF1QoBG5YtrJ517XkPUrLb7Hq
	 ZLeiqtzLyTfg5zfBDXF3ktnYt7PINFE9kODl4M7vTjb4gwDT5sZ5YGDvVHyPqTFjicjWy
	 SGmUQIEo8O/pH4KIleiFidRadnyZVeJT6B4z2+I5FWRMgW4V7v3JhzLp56G2OGQlkB05L
	 F51VyZPku5sGtL0RFK8nHy+mlOzh5/J4IMLt10hpI/v63C4/FkzbHi5Sg9saYwOdKoSna
	 mzl8gfWJl+FUwuj9F78bIpIWOQQw+HjbZ6Oa+Vi5Uj5icqzSv9jqvNYYVLHs7YHpoZpDO
	 gndbPw7NPpTqBVVsf4VabbTSPmVHnrE5kUeJM7JisnqBamywenLp5336HmYgESfUof6t6
	 SIhF61K+kVfhFAYqM2iH/RscDzqHeTdb17YsPVKBPSedMe3nt5+xxUNKHY1hFc+goxNDR
	 OimKi7U5S+LK7g9eyskWwWkzZBTpLF+fL6ZEcsL9p9934HbEdhzK03QNDYGUZDs=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1755764734; bh=T+Hk05tWBBg2F9Gq0ArWKo5vC+FV4QP+5pzigD/+Sqo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vKrKJDtyW0S2Ke4q5leIY7BvQHzpGb5Bd+3tBbGJL5al5QOymHlAvLcZ9WZRVjcko
	 Ezh2r3/JUp4a82r6VUzYfL4/YoegR88N4HlDP/6mDC2YwkxECYJ5wIetV4NHRHyfCZ
	 oBPTjparqPxJRNrXmwZF1bFjLLkFEUnidgw8fDbwII78m3AOFLY1brxOOygY/vGwG1
	 ZYqWiL+bvF1KjwSbwlIqmcGlWi+9jwJcpciMZutZHRlJmRXxg7nH2EQzj/sZk2F9LO
	 mIwKauFDyIUMdM7JoP0iMyUnKbdpoAeFUZheHH8x3WjnUsWuh3mL3w5zRi6QFUdtsV
	 WgXQZwmO/Q1Bw==
MIME-Version: 1.0
Date: Thu, 21 Aug 2025 10:25:34 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Doug Goldstein
 <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] misra: consider conversion from UL or (void*) to function
 pointer as safe
In-Reply-To: <90fb95a3-4b32-4785-a77c-373e5b9da6ed@suse.com>
References: <9e5e4ff2c7ba0a90a6ac403e2de9318e18949274.1755628705.git.dmytro_prokopchuk1@epam.com>
 <90fb95a3-4b32-4785-a77c-373e5b9da6ed@suse.com>
Message-ID: <e1e2abdf0ef8708097aa78440eeb7147@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-08-21 10:01, Jan Beulich wrote:
> On 19.08.2025 20:55, Dmytro Prokopchuk1 wrote:
>> Rule 11.1 states as following: "Conversions shall not be performed
>> between a pointer to a function and any other type."
>> 
>> The conversion from unsigned long or (void *) to a function pointer
>> is safe in Xen because the architectures it supports (e.g., x86 and
>> ARM) guarantee compatible representations between these types.
> 
> I think we need to be as precise as possible here. The architectures
> guarantee nothing, they only offer necessary fundamentals. In the
> Windows x86 ABI, for example, you can't convert pointers to/from longs
> without losing data. What we build upon is what respective ABIs say,
> possibly in combination of implementation specifics left to compilers.
> 

+1, a mention of the compilers and targets this deviation relies upon is 
needed.

>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -370,6 +370,16 @@ Deviations related to MISRA C:2012 Rules:
>>         to store it.
>>       - Tagged as `safe` for ECLAIR.
>> 
>> +   * - R11.1
>> +     - The conversion from unsigned long or (void \*) to a function 
>> pointer does
>> +       not lose any information or violate type safety assumptions if 
>> unsigned
>> +       long or (void \*) type is guaranteed to be the same bit size 
>> as a
>> +       function pointer. This ensures that the function pointer can 
>> be fully
>> +       represented without truncation or corruption. The macro 
>> BUILD_BUG_ON is
>> +       integrated into xen/common/version.c to confirm conversion 
>> compatibility
>> +       across all target platforms.
>> +     - Tagged as `safe` for ECLAIR.
> 
> Why the escaping of * here, when ...
> 
>> --- a/docs/misra/rules.rst
>> +++ b/docs/misra/rules.rst
>> @@ -431,7 +431,13 @@ maintainers if you want to suggest a change.
>>       - All conversions to integer types are permitted if the 
>> destination
>>         type has enough bits to hold the entire value. Conversions to 
>> bool
>>         and void* are permitted. Conversions from 'void noreturn 
>> (*)(...)'
>> -       to 'void (*)(...)' are permitted.
>> +       to 'void (*)(...)' are permitted. Conversions from unsigned 
>> long or
>> +       (void \*) to a function pointer are permitted if the source 
>> type has
>> +       enough bits to restore function pointer without truncation or 
>> corruption.
>> +       Example::
>> +
>> +           unsigned long func_addr = (unsigned long)&some_function;
>> +           void (*restored_func)(void) = (void (*)(void))func_addr;
> 
> ... context here suggests they work fine un-escaped, and you even add 
> some un-
> escaped instances as well. Perhaps I'm simply unaware of some 
> peculiarity?
> 

This is a literal rst block, while the other is not (* acts as a bullet 
point in rst iirc)

> Jan

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

