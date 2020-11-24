Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4517A2C217A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 10:39:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35620.67252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khUn9-00022G-Sd; Tue, 24 Nov 2020 09:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35620.67252; Tue, 24 Nov 2020 09:39:19 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khUn9-00021r-Ow; Tue, 24 Nov 2020 09:39:19 +0000
Received: by outflank-mailman (input) for mailman id 35620;
 Tue, 24 Nov 2020 09:39:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khUn8-00021m-Dz
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 09:39:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c92992b-3ab4-475e-8c6b-401f9849d76a;
 Tue, 24 Nov 2020 09:39:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 709B8AC77;
 Tue, 24 Nov 2020 09:39:16 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khUn8-00021m-Dz
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 09:39:18 +0000
X-Inumbo-ID: 9c92992b-3ab4-475e-8c6b-401f9849d76a
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9c92992b-3ab4-475e-8c6b-401f9849d76a;
	Tue, 24 Nov 2020 09:39:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606210756; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=179VxCLqljTPNdqZEibn09l4AdKc1ZBxVDQNvr+r9LE=;
	b=mVLURiFxO9ibNImYaI30HWclEVXRQh+STEcAqMwtRc2sheYwK6eE7bjY0OHLdptYndhsAh
	fpODZUZfJ2bQD0Ztv9n0so5tn8EvNqZ4xolMzfYZpsBxSDBcq1M+c1T15IJgSK2jgE6V/k
	TMFYpsMTTTnwpokHhqYIoc4KlEwklYg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 709B8AC77;
	Tue, 24 Nov 2020 09:39:16 +0000 (UTC)
Subject: Re: [PATCH v2 7/8] lib: move bsearch code
To: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
 <87a20884-5a76-a664-dcc9-bd4becee40b3@suse.com>
 <44ffc041-cacd-468e-a835-f5b2048bb201@xen.org>
 <2cf3a90d-f463-41f8-f861-6ef00279b204@suse.com>
 <2419eccf-c696-6aa1-ada4-0f7bd6bc5657@xen.org>
 <77534dc3-bdd6-f884-99e3-90dc9b02a81f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1d04fce7-beb4-9434-a528-b1cfdd07084b@suse.com>
Date: Tue, 24 Nov 2020 10:39:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <77534dc3-bdd6-f884-99e3-90dc9b02a81f@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 24.11.2020 01:40, Andrew Cooper wrote:
> On 23/11/2020 22:49, Julien Grall wrote:
>> On 19/11/2020 10:27, Jan Beulich wrote:
>>> On 18.11.2020 19:09, Julien Grall wrote:
>>>> On 23/10/2020 11:19, Jan Beulich wrote:
>>>>> --- a/xen/include/xen/compiler.h
>>>>> +++ b/xen/include/xen/compiler.h
>>>>> @@ -12,6 +12,7 @@
>>>>>       #define inline        __inline__
>>>>>    #define always_inline __inline__ __attribute__
>>>>> ((__always_inline__))
>>>>> +#define gnu_inline    __inline__ __attribute__ ((__gnu_inline__))
>>>>
>>>> bsearch() is only used by Arm and I haven't seen anyone so far
>>>> complaining about the perf of I/O emulation.
>>>>
>>>> Therefore, I am not convinced that there is enough justification to
>>>> introduce a GNU attribute just for this patch.
>>>
>>> Please settle this with Andrew: He had asked for the function to
>>> become inline. I don't view making it static inline in the header
>>> as an option here - if the compiler decides to not inline it, we
>>> should not end up with multiple instances in different CUs.
>>
>> That's the cons of static inline... but then why is it suddenly a
>> problem with this helper?
>>
>>> And
>>> without making it static inline the attribute needs adding; at
>>> least I'm unaware of an alternative which works with the various
>>> compiler versions.
>>
>> The question we have to answer is: What is the gain with this approach?
> 
> Substantial.
> 
>>
>> If it is not quantifiable, then introducing compiler specific
>> attribute is not an option.
>>
>> IIRC, there are only two callers (all in Arm code) of this function.
>> Even inlined, I don't believe you would drastically reduce the number
>> of instructions compare to a full blown version. To be generous, I
>> would say you may save ~20 instructions per copy.
>>
>> Therefore, so far, the compiler specific attribute doesn't look
>> justified to me. As usual, I am happy to be proven wrong
> 
> There is a very good reason why this is the classic example used for
> extern inline's in various libc's.
> 
> The gains are from the compiler being able to optimise away the function
> pointer(s) entirely.  Instead of working on opaque objects, it can see
> the accesses directly, implement compares as straight array reads, (for
> sorting, the swap() call turns into memcpy()) and because it can see all
> the memory accesses, doesn't have to assume that every call to cmp()
> modifies arbitrary data in the array (i.e. doesn't have to reload the
> objects from memory every iteration).
> 
> extern inline allows the compiler full flexibility to judge whether
> inlining is a net win, based on optimisation settings and observing what
> the practical memory access pattern would be from not inlining.
> 
> extern inline is the appropriate thing to use here, except for the big
> note in the GCC manual saying "always use gnu_inline in this case" which
> appears to be working around a change in the C99 standard which forces
> any non-static inline to emit a body even when its not called, due to
> rules about global symbols.
> 
> Therefore, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks Andrew.

Julien - please clarify whether you're okay with Andrew's response,
or whether you continue to object the conversion to inline.

> On a totally separate point,  I wonder if we'd be better off compiling
> with -fgnu89-inline because I can't see any case we're we'd want the C99
> inline semantics anywhere in Xen.

I'm not sure about this, i.e. I wouldn't want to exclude such a
case appearing. I think using attributes is better in general, as
it allows fine grained control.

Jan

