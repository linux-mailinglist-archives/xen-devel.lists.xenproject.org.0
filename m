Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA31366D4B
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 15:55:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114518.218254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDK4-0005QM-Ur; Wed, 21 Apr 2021 13:55:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114518.218254; Wed, 21 Apr 2021 13:55:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDK4-0005Q0-Rm; Wed, 21 Apr 2021 13:55:20 +0000
Received: by outflank-mailman (input) for mailman id 114518;
 Wed, 21 Apr 2021 13:55:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZDK3-0005Pu-Fv
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 13:55:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 915d0d01-7089-41ef-97f9-497cfc936569;
 Wed, 21 Apr 2021 13:55:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ECADAAF33;
 Wed, 21 Apr 2021 13:55:16 +0000 (UTC)
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
X-Inumbo-ID: 915d0d01-7089-41ef-97f9-497cfc936569
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619013317; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p0wQZg5fm3uF7HwJ/2XhaGXAZ6eYSQQeATi5bEp8B9Y=;
	b=q+VpGFHYWyI4+rS5DfrWIPlKhy/ZlbYB08Rqw5eQdKzjGiCAdOPIcV8fzw2/mQ78TwSUhD
	EHx/f9sgHDLGjRMDm9wcDvc0CRTjYLiRzK4kdXZTjPK3ftaT9Fn2Qvtj9nyKTiFSYgyZTN
	k+05codGA7TPtBlVgUKWqo3QS2e+Psg=
Subject: Re: x86: memset() / clear_page() / page scrubbing
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0753c049-9572-c12a-c74f-7e2fac3f5a24@suse.com>
 <21c00073-86a8-a040-fa40-e99e2fb434eb@citrix.com>
 <213c3706-5296-4673-dae2-12f9056ed73b@suse.com>
 <843e5c66-65e9-3b0b-8bcb-ad1d7df89d78@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <31487efc-13b4-af7c-5c0e-6bda7ad7a89d@suse.com>
Date: Wed, 21 Apr 2021 15:55:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <843e5c66-65e9-3b0b-8bcb-ad1d7df89d78@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15.04.2021 18:21, Andrew Cooper wrote:
> On 14/04/2021 09:12, Jan Beulich wrote:
>> On 13.04.2021 15:17, Andrew Cooper wrote:
>>> Do you have actual numbers from these experiments?
>> Attached is the collected raw output from a number of systems.
> 
> Wow Tulsa is vintage.  Is that new enough to have nonstop_tsc ?

No.

>>> For memset(), please don't move in the direction of memcpy().  memcpy()
>>> is problematic because the common case is likely to be a multiple of 8
>>> bytes, meaning that we feed 0 into the REP MOVSB, and this a hit wanting
>>> avoiding.
>> And you say this despite me having pointed out that REP STOSL may
>> be faster in a number of cases? Or do you mean to suggest we should
>> branch around the trailing REP {MOV,STO}SB?
>>
>>>   The "Fast Zero length $FOO" bits on future parts indicate
>>> when passing %ecx=0 is likely to be faster than branching around the
>>> invocation.
>> IOW down the road we could use alternatives patching to remove such
>> branches. But this of course is only if we don't end up using
>> exclusively REP MOVSB / REP STOSB there anyway, as you seem to be
>> suggesting ...
>>
>>> With ERMS/etc, our logic should be a REP MOVSB/STOSB only, without any
>>> cleverness about larger word sizes.  The Linux forms do this fairly well
>>> already, and probably better than Xen, although there might be some room
>>> for improvement IMO.
>> ... here.
>>
>> As to the Linux implementations - for memcpy_erms() I don't think
>> I see any room for improvement in the function itself. We could do
>> alternatives patching somewhat differently (and I probably would).
>> For memset_erms() the tiny bit of improvement over Linux'es code
>> that I would see is to avoid the partial register access when
>> loading %al. But to be honest - in both cases I wouldn't have
>> bothered looking at their code anyway, if you hadn't pointed me
>> there.
> 
> Answering multiple of the points together.
> 
> Yes, the partial register access on %al was one thing I spotted, and
> movbzl would be an improvement.  The alternatives are a bit weird, but
> they're best as they are IMO.  It makes a useful enough difference to
> backtraces/etc, and unconditional jmp's are about as close to free as
> you can get these days.
> 
> On an ERMS system, we want to use REP MOVSB unilaterally.  It is my
> understanding that it is faster across the board than any algorithm
> variation trying to use wider accesses.

Not according to the numbers I've collected. There are cases where
clearing a full page via REP STOS{L,Q} is (often just a little)
faster. Whether this also applies to MOVS I can't tell.

>>> It is worth nothing that we have extra variations of memset/memcpy where
>>> __builtin_memcpy() gets expanded inline, and the result is a
>>> compiler-chosen sequence, and doesn't hit any of our optimised
>>> sequences.  I'm not sure what to do about this, because there is surely
>>> a larger win from the cases which can be turned into a single mov, or an
>>> elided store/copy, than using a potentially inefficient sequence in the
>>> rare cases.  Maybe there is room for a fine-tuning option to say "just
>>> call memset() if you're going to expand it inline".
>> You mean "just call memset() instead of expanding it inline"?
> 
> I think want I really mean is "if the result of optimising memset() is
> going to result in a REP instruction, call memset() instead".
> 
> You want the compiler to do conversion to single mov's/etc, but you
> don't want is ...
> 
>> If the inline expansion is merely REP STOS, I'm not sure we'd
>> actually gain anything from keeping the compiler from expanding it
>> inline. But if the inline construct was more complicated (as I
>> observe e.g. in map_vcpu_info() with gcc 10), then it would likely
>> be nice if there was such a control. I'll take note to see if I
>> can find anything.
> 
> ... this.  What GCC currently expands inline is a REP MOVS{L,Q}, with
> the first and final element done manually ahead of the REP, presumably
> for prefetching/pagewalk reasons.

Not sure about the reasons, but the compiler doesn't always do it
like this - there are also cases of plain REP STOSQ. My initial
guess the splitting of the first and last elements was when the
compiler couldn't prove the buffer is 8-byte aligned and a
multiple of 8 bytes in size.

>>> For all set/copy operations, whether you want non-temporal or not
>>> depends on when/where the lines are next going to be consumed.  Page
>>> scrubbing in idle context is the only example I can think of where we
>>> aren't plausibly going to consume the destination imminently.  Even
>>> clear/copy page in a hypercall doesn't want to be non-temporal, because
>>> chances are good that the vcpu is going to touch the page on return.
>> I'm afraid the situation isn't as black-and-white. Take HAP or
>> IOMMU page table allocations, for example: They need to clear the
>> full page, yes. But often this is just to then insert one single
>> entry, i.e. re-use exactly one of the cache lines.
> 
> I consider this an orthogonal problem.  When we're not double-scrubbing
> most memory Xen uses, most of this goes away.
> 
> Even if we do need to scrub a pagetable to use, we're never(?) complete
> at the end of the scrub, and need to make further writes imminently. 

Right, but often to just one of the cache lines.

> These never want non-temporal accesses, because you never want to write
> into recently-evicted line, and there's no plausible way that trying to
> mix and match temporal and non-temporal stores is going to be a
> worthwhile optimisation to try.

Is a singe MOV following (with some distance and with SFENCE in
between) a sequence of MOVNTI going to have an effect worse than
the same MOV trying to store to a cache line that's not in cache?

>> Or take initial
>> population of guest RAM: The larger the guest, the less likely it
>> is for every individual page to get accessed again before its
>> contents get evicted from the caches. Judging from what Ankur said,
>> once we get to around L3 capacity, MOVNT / CLZERO may be preferable
>> there.
> 
> Initial population of guests doesn't matter at all, because nothing
> (outside of the single threaded toolstack process issuing the
> construction hypercalls) is going to touch the pages until the VM is
> unpaused.  The only async accesses I can think of are xenstored and
> xenconsoled starting up, and those are after the RAM is populated.
> 
> In cases like this, current might be a good way of choosing between
> temporal and non-temporal accesses.
> 
> As before, not double scrubbing will further improve things.
> 
>> I think in cases where we don't know how the page is going to be
>> used subsequently, we ought to favor latency over cache pollution
>> avoidance.
> 
> I broadly agree.  I think the cases where its reasonably safe to use the
> pollution-avoidance are fairly obvious, and there is a steep cost to
> wrongly-using non-temporal accesses.
> 
>> But in cases where we know the subsequent usage pattern,
>> we may want to direct scrubbing / zeroing accordingly. Yet of
>> course it's not very helpful that there's no way to avoid
>> polluting caches and still have reasonably low latency, so using
>> some heuristics may be unavoidable.
> 
> I don't think any heuristics beyond current, or possibly
> d->creation_finished are going to be worthwhile, but I think these alone
> can net us a decent win.
> 
>> And of course another goal of mine would be to avoid double zeroing
>> of pages: When scrubbing uses clear_page() anyway, there's no point
>> in the caller then calling clear_page() again. IMO, just like we
>> have xzalloc(), we should also have MEMF_zero. Internally the page
>> allocator can know whether a page was already scrubbed, and it
>> does know for sure whether scrubbing means zeroing.
> 
> I think we've discussed this before.  I'm in favour, but I'm absolutely
> certain that that wants be spelled MEMF_dirty (or equiv), so forgetting
> it fails safe, and code which is using dirty allocations is clearly
> identified and can be audited easily.

Well, there's a difference between scrubbing and zeroing. We already
have MEMF_no_scrub. And we already force callers to think about
whether they want zeroed memory (outside of the page allocator), by
having both xmalloc() and xzalloc() (and their relatives). So while
for scrubbing I could see your point, I'm not sure we should force
everyone who doesn't need zeroed pages to pass MEMF_dirty (or
whatever the name, as I don't particularly like this one). It's quite
the other way around - right now no pages come out of the page
allocator in known state content-wise. Parties presently calling
clear_page() right afterwards could easily, cleanly, and in a risk-
free manner be converted to use MEMF_zero.

Jan

