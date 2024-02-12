Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9006B851766
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 15:56:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679619.1057138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZXj9-00078k-1t; Mon, 12 Feb 2024 14:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679619.1057138; Mon, 12 Feb 2024 14:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZXj8-00075Y-Un; Mon, 12 Feb 2024 14:56:10 +0000
Received: by outflank-mailman (input) for mailman id 679619;
 Mon, 12 Feb 2024 14:56:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kTqq=JV=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rZXj6-00075S-Ug
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 14:56:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9b4b0fa-c9b6-11ee-8a4c-1f161083a0e0;
 Mon, 12 Feb 2024 15:56:07 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 9704D4EE0737;
 Mon, 12 Feb 2024 15:56:06 +0100 (CET)
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
X-Inumbo-ID: d9b4b0fa-c9b6-11ee-8a4c-1f161083a0e0
MIME-Version: 1.0
Date: Mon, 12 Feb 2024 15:56:06 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Xen Devel <xen-devel@lists.xenproject.org>,
 Consulting <consulting@bugseng.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Andrew
 Cooper3 <andrew.cooper3@citrix.com>, Roger Pau <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: Return type of clean_and_invalidate_dcache_va_range
In-Reply-To: <02446758-a5a9-4a8a-8ce6-15abdc9ede65@suse.com>
References: <e050b096ff39aa857f9c267a8dbb4ef6@bugseng.com>
 <alpine.DEB.2.22.394.2402091402080.1925432@ubuntu-linux-20-04-desktop>
 <f86baad0-f113-4156-9c10-6910e8c63492@xen.org>
 <02446758-a5a9-4a8a-8ce6-15abdc9ede65@suse.com>
Message-ID: <99faac70440a68824a17fcaaea55ef48@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-02-12 09:26, Jan Beulich wrote:
> On 10.02.2024 11:17, Julien Grall wrote:
>> Hi,
>> 
>> On 09/02/2024 22:02, Stefano Stabellini wrote:
>>> On Fri, 9 Feb 2024, Nicola Vetrini wrote:
>>>> Hi all,
>>>> 
>>>> In the context of violations of MISRA C:2012 Rule 17.7: "The value 
>>>> returned by
>>>> a function having non-void return type shall be used", I was looking 
>>>> at the
>>>> function "clean_and_invalidate_dcache_va_range". It has the 
>>>> following
>>>> signature on both arm and x86:
>>>> 
>>>> static inline int clean_and_invalidate_dcache_va_range
>>>>      (const void *p, unsigned long size)
>>>> 
>>>> The commit that introduced it for Arm ~9 years ago (71d64afe3e12: 
>>>> "arm: return
>>>> int from *_dcache_va_range") [1] mentions that on Arm it can't fail, 
>>>> but
>>>> supposedly it can on x86.
>>>> 
>>>> However, as far as I can tell, for both arch-es the implementation 
>>>> now always
>>>> returns 0 [2][3], so perhaps the mention of -EOPNOTSUPP for x86 is 
>>>> no longer
>>>> true (I wasn't able to reconstruct if there was a time at which this 
>>>> was true,
>>>> even in the same commit that changed the return type to int).
>>>> 
>>>> The question is: should the return type be void, since it appears 
>>>> that every
>>>> user is ignoring the returned value (violating the rule), except the 
>>>> one in
>>>> common/grant_table.c [4]?
>>> 
>>> Looking at the implementation on both ARM and x86, I am in favor of
>>> changing the return type to void
>> I think we need some consistency between all the cache flush helpers
>> (clean_and_invalidate_dcache_va_range, invalidate_dcache_va_range() 
>> and
>> clean_dcache_va_range()). They should all return a values or not 
>> return any.
> 
> +1
> 

I agree. I took this helper as an example, but e.g. 
invalidate_dcache_va_range returns -EOPNOTSUPP on x86 and it's only used 
in common/grant_table.
Perhaps the signatures should remain as is for consistency, especially 
given the remark below about the other architectures, and this would 
entail a deviation.

>> That said, we have two other architectures in development. Are we 
>> saying
>> this helpers will not need to (initially) return -EOPNOTSUPP?
> 
> For "(initially)" that's not an issue - such a stub can as well be 
> filled
> for BUG_ON("unimplemented"). The question there is what the ultimate
> implementations are going to look like.
> 

Should I CC them in this thread?

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

