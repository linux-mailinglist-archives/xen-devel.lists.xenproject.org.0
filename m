Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6C6A72B98
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 09:37:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928680.1331373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txik0-0006r8-U5; Thu, 27 Mar 2025 08:37:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928680.1331373; Thu, 27 Mar 2025 08:37:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txik0-0006oL-Pr; Thu, 27 Mar 2025 08:37:32 +0000
Received: by outflank-mailman (input) for mailman id 928680;
 Thu, 27 Mar 2025 08:37:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rYrR=WO=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1txijz-0006Fq-9B
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 08:37:31 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5eb39b7-0ae6-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 09:37:26 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 4BF194EF54CA;
 Thu, 27 Mar 2025 09:37:25 +0100 (CET)
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
X-Inumbo-ID: b5eb39b7-0ae6-11f0-9ffa-bf95429c2676
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1743064645;
	b=xX0e6cU5iHCVe549dhhsBjDsnow4Oq5L8hxSug8dbBEjr5nLZ+k5dgF5pZ13FZsQBEwR
	 pXyl7TkN4QJMgGMiIOytZiu1UcLawJuEAl1w3umxzr3WyENYapQ0JVS/kzpLjiOh4KI81
	 fOkR9lIhyPomLjAXaDLngXJCL1WiGyRDOblTpR4MDyzzRGIN7cMhPQxv49kNqkDok4bvZ
	 2rRGl/1kml/4N1qnsEU/g8FKJ3Gh/d1RneC8jICKbxBdpKFWu4F4M/0DyCPn0xmm248AK
	 cft9ehUQlmi2/oxU/Aap1Oosjjq3dQYrEe1pMVwHNYW3d1eAgdQ+Gp8eFZ86/ndCFfPyK
	 L89bdyV36cjzX3dOk3wgB7qlfwlc5hx3hYJP8S/3WV0tS02XNc1r8HIBUHgYayjHt6XQY
	 YCelrbBDdWuomzusD9k4ncQXrCbXPRPVhKLKQ57W84gnG6qISnqBL+KBHOf5rg28Xik2h
	 Eq1Bl5X7UT8m3pX9cl8zVdWSPDRxt++odChU2OhlDkq+TViT/mw7yf3krkrPFS4EUryY2
	 xoUbJA1FH3etFgmVszaszyid5qgUGPg4H0OYW8wKHIeiFAUOziHfGjARvdFicRUTnhC06
	 SG+SYQkOhAzWLDsf6n9Ny3MxSK8jtj+Z3egSowpK8S9/yXq10S9XVMu8+J64P4o=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1743064645;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=inc5xP4R66Z0jvrVKmQ1fBuY3sL4BE1qh+eqZzVwvug=;
	b=n25JP2ZAd5XrrkpNhTOVt/EJVq9a1iH0/Axohnv1c+gh/9VOsSTmdKz3Gm0hMMfLF0pb
	 tucEDnR7w6K341hzGa0daEKAWAnDNDQu4FsNWKrC8nTbtPo0qOGXT8Jl6q27ero4qtRzq
	 lbsBjHuvciLRCuBO0JXR+rw8e55jzD3YdChtcSvNGE/FbTR3nwGt1qCvSKYsYu5k1XfCr
	 c3Bf29KbSYtOJHsVKruIYMGqZ4EAGzYQ7vI1d63+7rTrNcRnaUKoqunfUwc9GWTWJdwOQ
	 AAukgk3rhI7Lmi9zxhmkRoFfJPQJYoxAc45w5UyBTzTo8qWy/CwU2JZOxKauNfGy1vX35
	 IfBPXW0iqcPkfFtIG904mRDopOyAF3fN++cBNX/X71A0pc+bNa/zFz9375X2VS9N2u7lq
	 ZgWNqGlRYlWkJCumva8AM2rEr2h/ParyJBQKRDYWP+n+q1NupKwn+UVQ2zfzQsSkR16ge
	 8KEL8BMT01v2lzRLyEHoMXgi/pF+VS3njvt3N+K36KYQcRYLR0Xe+zJxTcHmStjxNldAT
	 dPbmyJ6Q0HUsPf5jzdB+/kjZuSSIc/BD/8EvhYByoFXpgomkNDUWha0RzT3PY+WcwfGZ5
	 Xl/v2YTMPozWqd26NCcw7IHfWFbF/utPAiQqJxusTyVcolhs1cmzcpwYtWxlDc4=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1743064645; bh=sU0KbHl+7XnUBm5PotWRTYrWHg5o8Urag6YXeOh4w/g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pdye16lzHY0AN9Zb6bQvWdGDpCmgVvlLg36mKoh9S+lEU1vkMkKsZYbjQMxGMKoBV
	 cGnHOFJwRlQ6/6YOqJHssqQwli0xNYupPq59xmqreJV1OqDqA5zhxtl7LZ2+ZRLSFD
	 JUMqG0R+xuqiXD3lcR4BK5kFUFNzRRtkbn7ULLDJdKAtfJM5+Njvx7F1jsgJ8+rrR7
	 QWqZgYXCOeqUmpKpcTxY3RgoD71yugnkmeVWeu2Sd//NBWAmOlTwYKzjZIjl6f7rMD
	 HpjlD7QuyDbIDupth2E9vuByjCxzXVboTeo7+G3nawHcUkwqnqr6kyI2QyEB5IiG6I
	 FKZUegk6KaPxQ==
MIME-Version: 1.0
Date: Thu, 27 Mar 2025 09:37:25 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn?=
 =?UTF-8?Q?=C3=A9?= <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 2/3] xen: x86: irq: initialize irq desc in create_irq()
In-Reply-To: <84903e47-038c-46f5-862a-a0c9623c8125@suse.com>
References: <20250327004044.2014048-1-volodymyr_babchuk@epam.com>
 <20250327004044.2014048-3-volodymyr_babchuk@epam.com>
 <84903e47-038c-46f5-862a-a0c9623c8125@suse.com>
Message-ID: <bab91924eb87a56260d62faee028d5af@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-03-27 09:03, Jan Beulich wrote:
> On 27.03.2025 01:40, Volodymyr Babchuk wrote:
>> While building xen with GCC 14.2.1 with "-fcondition-coverage" option,
>> the compiler produces a false positive warning:
>> 
>>   arch/x86/irq.c: In function ‘create_irq’:
>>   arch/x86/irq.c:281:11: error: ‘desc’ may be used uninitialized 
>> [-Werror=maybe-uninitialized]
>>     281 |     ret = init_one_irq_desc(desc);
>>         |           ^~~~~~~~~~~~~~~~~~~~~~~
>>   arch/x86/irq.c:269:22: note: ‘desc’ was declared here
>>     269 |     struct irq_desc *desc;
>>         |                      ^~~~
>>   cc1: all warnings being treated as errors
>>   make[2]: *** [Rules.mk:252: arch/x86/irq.o] Error 1
>> 
>> While we have signed/unsigned comparison both in "for" loop and in
>> "if" statement, this still can't lead to use of uninitialized "desc",
>> as either loop will be executed at least once, or the function will
>> return early. So this is a clearly false positive warning. Anyways,
>> initialize "desc" with NULL to make GCC happy.
>> 
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> Hmm, this puts us in an interesting conflict, I think. Misra, aiui, 
> will ...
> 
>> --- a/xen/arch/x86/irq.c
>> +++ b/xen/arch/x86/irq.c
>> @@ -265,7 +265,7 @@ void __init clear_irq_vector(int irq)
>>  int create_irq(nodeid_t node, bool grant_access)
>>  {
>>      int irq, ret;
>> -    struct irq_desc *desc;
>> +    struct irq_desc *desc = NULL;
> 
> ... consider such an assignment useless (and hence potentially 
> confusing)
> code. I'm curious what BugsEng folks are going to say here.
> 

It is quite odd to see this only in coverage builds, but the side 
effects of coverage options might trigger some of gcc's internal 
analyzer thresholds. Anyway, since there are no concerns about dead code 
(see 
https://gitlab.com/xen-project/xen/-/blob/staging/docs/misra/deviations.rst: 
R2.2, "There shall be no dead code", is globally deviated) and that this 
might actually be beneficial to remove some caution reports for R9.1 
("The value of an object with automatic storage duration shall not be 
read before it has been set") I think the overall effect is positive.

> Irrespective of that I think such a seemingly unnecessary initializer 
> wants
> to come with a justifying comment, e.g.
> 
>     struct irq_desc *desc = NULL /* gcc14 with -fcondition-coverage */;
> 
> here.
> 
> Finally, did you report this to upstream gcc? It's probably too late to
> fix in gcc15 (if still present), but it would be nice to have it fixed 
> in
> later versions (maybe including a late 14.x).
> 
> Jan

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

