Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5B62C2D8E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 17:57:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36599.68565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khbcu-0004FE-M2; Tue, 24 Nov 2020 16:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36599.68565; Tue, 24 Nov 2020 16:57:12 +0000
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
	id 1khbcu-0004Er-Ii; Tue, 24 Nov 2020 16:57:12 +0000
Received: by outflank-mailman (input) for mailman id 36599;
 Tue, 24 Nov 2020 16:57:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1khbct-0004Ek-W3
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 16:57:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1khbcs-00014C-RW; Tue, 24 Nov 2020 16:57:10 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1khbcs-0007kY-G8; Tue, 24 Nov 2020 16:57:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khbct-0004Ek-W3
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 16:57:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=vaVujtI/I43ocpPCF1dct3D70cWbZhxiq3sAoJ2Hees=; b=DISi9+vzLnrb2T5GJYCIYGYls1
	dQmbeMeRRUvfAdaOacHzirQ8CH/vN12Jpi5UKDuDYgYurXPSBMucvgW4vbrgSjB7CMhRUnPWSoGPt
	2413o4Y/EAP2mpu1pYJ5s5kE+wWM+AdCYvqc/+glU1DglR2FGYoFF83R7bxTXcc0HoV8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khbcs-00014C-RW; Tue, 24 Nov 2020 16:57:10 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khbcs-0007kY-G8; Tue, 24 Nov 2020 16:57:10 +0000
Subject: Re: [PATCH v2 7/8] lib: move bsearch code
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
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
From: Julien Grall <julien@xen.org>
Message-ID: <59a4e1c1-ea39-1846-92ae-92560db4b1fb@xen.org>
Date: Tue, 24 Nov 2020 16:57:08 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <77534dc3-bdd6-f884-99e3-90dc9b02a81f@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Andrew,

Thank you for the detailed explanation :).

On 24/11/2020 00:40, Andrew Cooper wrote:
> On 23/11/2020 22:49, Julien Grall wrote:
>> Hi Jan,
>>
>> On 19/11/2020 10:27, Jan Beulich wrote:
>>> On 18.11.2020 19:09, Julien Grall wrote:
>>>> On 23/10/2020 11:19, Jan Beulich wrote:
>>>>> --- a/xen/include/xen/compiler.h
>>>>> +++ b/xen/include/xen/compiler.h
>>>>> @@ -12,6 +12,7 @@
>>>>>        #define inline        __inline__
>>>>>     #define always_inline __inline__ __attribute__
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
> 
> Some further observations:
> 
> For arch/arm/io.c, the handlers are sorted, so find_mmio_handler() will
> be O(lg n), but it will surely be faster with the inlined version, and
> this is the fastpath.
> 
> register_mmio_handler() OTOH is massively expensive, because sort()
> turns the array into a heap and back into an array on every insertion,
> just to insert an entry into an already sorted array.  It would be more
> efficient to library-fy the work I did for VT-x MSR load/save lists
> (again, extern inline) and reuse
> "insert_$FOO_into_sorted_list_of_FOOs()" which is a search, single
> memmove() to make a gap, and a memcpy() into place.
> 
> When you compile io.c with this patch in place, the delta is:
> 
> add/remove: 0/1 grow/shrink: 1/0 up/down: 92/-164 (-72)
> Function                                     old     new   delta
> try_handle_mmio                              720     812     +92
> bsearch                                      164       -    -164
> Total: Before=992489, After=992417, chg -0.01%
> 
> The reason cmp_mmio_handler (140 bytes) doesn't drop out is because it
> is referenced by register_mmio_hanlder()'s call to sort().  All in all,
> the inlined version is less than 1/3 the size of the out-of-lined
> version, but I haven't characterised it further than that.
> 
> 
> On a totally separate point,  I wonder if we'd be better off compiling
> with -fgnu89-inline because I can't see any case we're we'd want the C99
> inline semantics anywhere in Xen.

This was one of my point above. It feels that if we want to use the 
behavior in Xen, then it should be everywhere rather than just this helper.

Cheers,

-- 
Julien Grall

