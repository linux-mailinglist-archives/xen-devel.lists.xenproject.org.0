Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35193330C1F
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 12:20:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94794.178513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJDvk-0006AT-AE; Mon, 08 Mar 2021 11:20:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94794.178513; Mon, 08 Mar 2021 11:20:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJDvk-0006A7-6m; Mon, 08 Mar 2021 11:20:08 +0000
Received: by outflank-mailman (input) for mailman id 94794;
 Mon, 08 Mar 2021 11:20:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mI6H=IG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJDvi-0006A2-Qa
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 11:20:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21a64be6-7ee9-48aa-a480-f6700f8b75c8;
 Mon, 08 Mar 2021 11:20:05 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BE882AC54;
 Mon,  8 Mar 2021 11:20:04 +0000 (UTC)
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
X-Inumbo-ID: 21a64be6-7ee9-48aa-a480-f6700f8b75c8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615202404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F0CbNfN949etSGrFP7I23PA2Zv6dalfgrEIR5gnIG6w=;
	b=C+6laaMQ30EO5Ncrh3FaPxndK2BISHGd2sZmdlTAlgmyGksf4QMOUHE8NF3t9W8cD1lt0O
	qxLtKeRnTTB3/RvDJxUA4Gj/LgiqS0rAYn6eVtqhVSI6fUiO/cEQjNVxqNWH4zGuPgYIBe
	DaGgPvB+fVsLqNQ43ZuZOXquP1y5bUU=
Subject: Re: [PATCH for-4.15] xen: Bump the minimum version of GCC supported
 to 4.9 (5.1 on arm64)
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210306214148.27021-1-julien@xen.org>
 <1897022d-7591-3450-4e57-884a2860b13d@suse.com>
 <7fd07dc9-9c03-bb13-3907-c3c268a4e970@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2de5160f-8636-5cdf-a20c-acaa2640c893@suse.com>
Date: Mon, 8 Mar 2021 12:20:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <7fd07dc9-9c03-bb13-3907-c3c268a4e970@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.03.2021 11:51, Julien Grall wrote:
> On 08/03/2021 08:09, Jan Beulich wrote:
>> On 06.03.2021 22:41, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> Compilers older than 4.8 have known codegen issues which can lead to
>>> silent miscompilation:
>>>
>>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58145
>>>
>>> Furthermore, pre-4.9 GCC have known bugs (including things like
>>> internal compiler errors on Arm) which would require workaround (I
>>> haven't checked if we have any in Xen).
>>>
>>> The minimum version of GCC to build the hypervisor is now raised to 4.9.
>>>
>>> In addition to that, on arm64, GCC version >= 4.9 and < 5.1 have been
>>> shown to emit memory references beyond the stack pointer, resulting in
>>> memory corruption if an interrupt is taken after the stack pointer has
>>> been adjusted but before the reference has been executed.
>>>
>>> Therefore, the minimum for arm64 is raised to 5.1.
>>
>> I'm sure newer compiler versions also have bugs.
> 
> I don't doubt that...
> 
>> Therefore I'm not
>> convinced using this as the primary reason for a bump is enough.
> You also have to take into account the severity of the bug and possible 
> workaround. The bug in 5.1 is severe *and* has no easy (to avoid saying 
> possible) workaround.
> 
>> Plus what if critical to us bugs get found in, say, 5.x? Are we
>> going to bump to 6.x then (and so on, until we allow only the most
>> recent major version to be used)?
> 
> In the current situation we are claiming that all GCC versions from 
> ~2014 are supported.
> 
> However, in reality, there are an high number of chance that some of the 
> version will not build Xen or worse miscompile it.
> 
> The former kind of bug is not a big deal because the user will notice it 
> directly. However, the latter is highly critical because 1) They may 
> only happen sporadically 2) compiler related bug is difficult to root cause.

Since I realize it may not have been clear from my initial reply:
What you want to do for Arm64 is largely up to you. I agree that
the bug in question is really bad.

I understand it was Andrew who asked you to cover x86 at the same
time, so perhaps it should be more him than you to justify the
choice. Yet you've submitted the patch, so (I'm sorry) there you
go ...

>> Additionally - partly related to your own reply regarding the CI
>> failures - imo there needs to be an analysis of what older distros
>> will no longer build (at all or by default).
> 
> Per the CI, this would be Ubuntu Trusty (and older), Centos 7 (and older)
> 
> Do you have any other in mind?

Our SLE12 (latest service pack is SP5 and still has a while to go
to at least reach LTSS state) comes with gcc 4.8 as the default
compiler.

>>> ---
>>>
>>> I don't have a strong opinion on the minimum version for GCC on x86.
>>> So this is following Andrew's suggestion and the minimum from Linux.
>>>
>>> This patch is candidate to 4.15 and backport.
>>
>> I think such a change needs to be proposed much earlier in a release
>> cycle.
> 
> Possibly... At the same time, we don't want to release 4.15 and continue 
> to say Xen on Arm64 can build fine with 4.9 and 5.0.

4.9 could be excluded if need be. 4.8 is fine? Also I don't think
there's much point thinking about 5.0 - that's where their version
numbering scheme changed and the first released version is 5.1.

>>> --- a/xen/include/xen/compiler.h
>>> +++ b/xen/include/xen/compiler.h
>>> @@ -5,6 +5,19 @@
>>>   #error Sorry, your compiler is too old/not recognized.
>>>   #endif
>>>   
>>> +#if CONFIG_CC_IS_GCC
>>> +# if CONFIG_GCC_VERSION < 40900
>>> +/* https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58145 */
>>
>> As per the bug report, the issue was determined to not be present
>> in e.g. 4.3. Hence while such a bug may influence our choice of
>> minimum version, I don't think it can reasonably be named here as
>> the apparent only reason for the choice. Personally I don't think
>> any justification should be put here.
> 
> Ok.
> 
>>
>>> +#  error Sorry, your version of GCC is too old - please use 4.9 or newer.
>>> +# elif defined(CONFIG_ARM_64) && CONFIG_GCC_VERSION < 50100
>>> +/*
>>> + * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293
>>> + * https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
>>> + */
>>> +#  error Sorry, your version of GCC is too old - please use 5.1 or newer.
>>
>>  From the bug entry the fix looks to have been backported to 4.9,
>> or at least some (important?) branches thereof.
> 
> It is not clear what's you are trying to point out. Mind clarifying?

Some 4.9 compilers (perhaps widely used ones) may not have the bad
issue, which puts under question their ruling out when the main
reason for doing so is that bug.

Jan

