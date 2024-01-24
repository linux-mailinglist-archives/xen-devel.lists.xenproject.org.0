Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 983BF83A3FF
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 09:21:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670757.1043735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSYV7-0003vb-3U; Wed, 24 Jan 2024 08:20:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670757.1043735; Wed, 24 Jan 2024 08:20:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSYV7-0003uJ-0e; Wed, 24 Jan 2024 08:20:49 +0000
Received: by outflank-mailman (input) for mailman id 670757;
 Wed, 24 Jan 2024 08:20:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pABP=JC=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rSYV5-0003uB-T8
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 08:20:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79597f0f-ba91-11ee-98f5-6d05b1d4d9a1;
 Wed, 24 Jan 2024 09:20:46 +0100 (CET)
Received: from [192.168.1.15] (host-87-16-84-78.retail.telecomitalia.it
 [87.16.84.78])
 by support.bugseng.com (Postfix) with ESMTPSA id A4CD44EE0746;
 Wed, 24 Jan 2024 09:20:45 +0100 (CET)
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
X-Inumbo-ID: 79597f0f-ba91-11ee-98f5-6d05b1d4d9a1
Message-ID: <11660006-7651-4562-9e14-0d7b22788feb@bugseng.com>
Date: Wed, 24 Jan 2024 09:20:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/3] xen: introduce static_assert_unreachable()
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1705930767.git.federico.serafini@bugseng.com>
 <01c57c7e5131d699cf622be96fea7cd8e03c23f9.1705930767.git.federico.serafini@bugseng.com>
 <d4e5b1c0-bb44-4482-b86f-ff9f0947f338@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <d4e5b1c0-bb44-4482-b86f-ff9f0947f338@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/01/24 15:02, Jan Beulich wrote:
> On 22.01.2024 14:48, Federico Serafini wrote:
>> Introduce macro static_asser_unreachable() to check that a program
>> point is considered unreachable by the static analysis performed by the
>> compiler, even at optimization level -O0.
> 
> Is it really intended to limit use of this macro to cases where even
> at -O0 the compiler would eliminate respective code? Note that right
> now even debug builds are done with some optimization, and some of
> the DCE we're relying depends on that (iirc).

I'll remove this restriction.


> 
>> --- a/xen/include/xen/compiler.h
>> +++ b/xen/include/xen/compiler.h
>> @@ -64,6 +64,14 @@
>>   # define fallthrough        do {} while (0)  /* fallthrough */
>>   #endif
>>   
>> +/*
>> + * Add the following macro to check that a program point is considered
>> + * unreachable by the static analysis performed by the compiler,
>> + * even at optimization level -O0.
>> + */
>> +#define static_assert_unreachable() \
>> +    asm(".error \"unreachable program point reached\"");
> 
> Did you check the diagnostic that results when this check actually
> triggers? I expect it will be not really obvious from the message
> you introduce where the issue actually is. I expect we will want
> to use some of __FILE__ / __LINE__ / __FUNCTION__ to actually
> supply such context.

The assembler error comes with file and line information, for example:

./arch/x86/include/asm/uaccess.h: Assembler messages:
./arch/x86/include/asm/uaccess.h:377: Error: unreachable program point 
reached

At line 377 there is an use of get_unsafe_size() where I passed a wrong
size as argument. Is that clear enough?

What do you think about modifying the message as follows:
"unreachability static assert failed."


> 
> Also: Stray semicolon and (nit) missing blanks.

It is not clear to me where are the missing blanks.


> 
> Finally I wonder about case: We have ASSERT_UNREACHABLE() and it
> may be indicated to use all uppercase her as well.

Ok.


-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

