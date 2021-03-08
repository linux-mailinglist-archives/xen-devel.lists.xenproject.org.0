Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5433D330BB3
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 11:52:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94777.178477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJDUD-0003FK-Ef; Mon, 08 Mar 2021 10:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94777.178477; Mon, 08 Mar 2021 10:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJDUD-0003Eu-BN; Mon, 08 Mar 2021 10:51:41 +0000
Received: by outflank-mailman (input) for mailman id 94777;
 Mon, 08 Mar 2021 10:51:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lJDUB-0003Ep-Cw
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 10:51:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lJDUA-00029c-2E; Mon, 08 Mar 2021 10:51:38 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lJDU9-0007Au-Mf; Mon, 08 Mar 2021 10:51:37 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=qZeSIqQlVyEh+3fMUUbvh/i1O0jC0h6wAh0YIwvYO5I=; b=PLIsqYR3aonaeoQtu9SMj9t0fw
	IeRUOFjKNFFCBTTBgvCEWX6C1AXYaS+DBlrVe9MA6RSlcvFg4VJPk8R56iJUNWE+ra+FoKGPJ4/yF
	xZCwenDQVEyy9JUFVmsTO7NzA9zoWmO5zbBeHYhMCL+LC7E/V7eUAAZIKocRS8JjwxHk=;
Subject: Re: [PATCH for-4.15] xen: Bump the minimum version of GCC supported
 to 4.9 (5.1 on arm64)
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210306214148.27021-1-julien@xen.org>
 <1897022d-7591-3450-4e57-884a2860b13d@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7fd07dc9-9c03-bb13-3907-c3c268a4e970@xen.org>
Date: Mon, 8 Mar 2021 10:51:34 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1897022d-7591-3450-4e57-884a2860b13d@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 08/03/2021 08:09, Jan Beulich wrote:
> On 06.03.2021 22:41, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Compilers older than 4.8 have known codegen issues which can lead to
>> silent miscompilation:
>>
>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58145
>>
>> Furthermore, pre-4.9 GCC have known bugs (including things like
>> internal compiler errors on Arm) which would require workaround (I
>> haven't checked if we have any in Xen).
>>
>> The minimum version of GCC to build the hypervisor is now raised to 4.9.
>>
>> In addition to that, on arm64, GCC version >= 4.9 and < 5.1 have been
>> shown to emit memory references beyond the stack pointer, resulting in
>> memory corruption if an interrupt is taken after the stack pointer has
>> been adjusted but before the reference has been executed.
>>
>> Therefore, the minimum for arm64 is raised to 5.1.
> 
> I'm sure newer compiler versions also have bugs.

I don't doubt that...

> Therefore I'm not
> convinced using this as the primary reason for a bump is enough.
You also have to take into account the severity of the bug and possible 
workaround. The bug in 5.1 is severe *and* has no easy (to avoid saying 
possible) workaround.

> Plus what if critical to us bugs get found in, say, 5.x? Are we
> going to bump to 6.x then (and so on, until we allow only the most
> recent major version to be used)?

In the current situation we are claiming that all GCC versions from 
~2014 are supported.

However, in reality, there are an high number of chance that some of the 
version will not build Xen or worse miscompile it.

The former kind of bug is not a big deal because the user will notice it 
directly. However, the latter is highly critical because 1) They may 
only happen sporadically 2) compiler related bug is difficult to root cause.

So I think a smaller set of version is going to be better for the users 
and for us long term.

> 
> Additionally - partly related to your own reply regarding the CI
> failures - imo there needs to be an analysis of what older distros
> will no longer build (at all or by default).

Per the CI, this would be Ubuntu Trusty (and older), Centos 7 (and older)

Do you have any other in mind?

> We've been discussing
> to bump minimum tool chain versions for a long time. At least as
> far as I'm concerned, I didn't take on this job precisely because
> the code changes needed are relatively simple, but justification
> can (and apparently will) be rather complicated.
>
> Fundamentally, whatever kind of criteria we use to justify the
> bump now ought to be usable down the road by people justifying
> further bumps.
I see you mentioned about distros. Can you outline other criteria you 
have in mind?

> 
> Also - what about clang? Linux requires 10.0.1 as a minimum.

I don't know and I would rather focus on GCC first so we figure out a 
set of criterias...

> 
>> ---
>>
>> I don't have a strong opinion on the minimum version for GCC on x86.
>> So this is following Andrew's suggestion and the minimum from Linux.
>>
>> This patch is candidate to 4.15 and backport.
> 
> I think such a change needs to be proposed much earlier in a release
> cycle.

Possibly... At the same time, we don't want to release 4.15 and continue 
to say Xen on Arm64 can build fine with 4.9 and 5.0.

> 
>> --- a/README
>> +++ b/README
>> @@ -38,12 +38,15 @@ provided by your OS distributor:
>>       * GNU Make v3.80 or later
>>       * C compiler and linker:
>>         - For x86:
>> -        - GCC 4.1.2_20070115 or later
>> +        - GCC 4.9 or later
>>           - GNU Binutils 2.16.91.0.5 or later
> 
> I don't think it makes much sense to keep the binutils version this
> low, the more that I don't think we can really build (correctly)
> with this old a version anymore. Whatever the gcc version chosen, I
> think we want to pick a binutils version from about the same time
> frame.

Ok. Let's first agree on a GCC version and then we can decide on a 
binutils version.

> 
>> --- a/xen/include/xen/compiler.h
>> +++ b/xen/include/xen/compiler.h
>> @@ -5,6 +5,19 @@
>>   #error Sorry, your compiler is too old/not recognized.
>>   #endif
>>   
>> +#if CONFIG_CC_IS_GCC
>> +# if CONFIG_GCC_VERSION < 40900
>> +/* https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58145 */
> 
> As per the bug report, the issue was determined to not be present
> in e.g. 4.3. Hence while such a bug may influence our choice of
> minimum version, I don't think it can reasonably be named here as
> the apparent only reason for the choice. Personally I don't think
> any justification should be put here.

Ok.

> 
>> +#  error Sorry, your version of GCC is too old - please use 4.9 or newer.
>> +# elif defined(CONFIG_ARM_64) && CONFIG_GCC_VERSION < 50100
>> +/*
>> + * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293
>> + * https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
>> + */
>> +#  error Sorry, your version of GCC is too old - please use 5.1 or newer.
> 
>  From the bug entry the fix looks to have been backported to 4.9,
> or at least some (important?) branches thereof.

It is not clear what's you are trying to point out. Mind clarifying?

> 
>> +# endif
>> +#endif
> 
> Instead of a completely new conditional, I think this wants to be
> combined with the existing one (the tail of which is visible in
> context above).

OK.

Cheers,

-- 
Julien Grall

