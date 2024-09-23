Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD25E97E925
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 11:55:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801793.1211794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssfmy-0001N6-Uy; Mon, 23 Sep 2024 09:55:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801793.1211794; Mon, 23 Sep 2024 09:55:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssfmy-0001L1-Rs; Mon, 23 Sep 2024 09:55:28 +0000
Received: by outflank-mailman (input) for mailman id 801793;
 Mon, 23 Sep 2024 09:55:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gqL7=QV=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ssfmw-0001Ku-Na
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 09:55:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4541de2-7991-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 11:55:25 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id DBD514EE0738;
 Mon, 23 Sep 2024 11:55:23 +0200 (CEST)
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
X-Inumbo-ID: f4541de2-7991-11ef-a0b9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1727085324; bh=qN5nHk47RjadYgjwiKW1fAiGjLbGxsdwgR9bbT+GHz8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nidYwDR/w08H3Eqx7qs7xijP1WXmT0RRM/R+suKGH6haMk8MLWw5KDkGI4ASg6VKs
	 +GfTe3GlcAvBamKwjjohizSm9nXSThsVgabr2w99c4n1BJMA5P6wZvD1f9fR6uLjGR
	 SVdg1/uucW5QSJhCI/CxQ/T8VIsRvk7vP7HnO7VnkGPSi1kU0olEGCNanMok4AV9ZT
	 fYHJ9mugKnHFsZf/T0iTzeHnUvda0HgH7V5uAQp9FiUcJwZSjdzHTeY8ZDJYuhq/Kp
	 5F5e+zPWzPHtRQl2jL/ZSfWyyOFUy5u81NO3xHqyqf73LObf0uHDp90oYfDr5vCQyh
	 PhdPy8RfEQTKA==
MIME-Version: 1.0
Date: Mon, 23 Sep 2024 11:55:23 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
 <michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH] ioreq: don't wrongly claim "success" in
 ioreq_send_buffered()
In-Reply-To: <d29f7235-661c-4457-959c-eeb3b553da02@suse.com>
References: <f0cd7c48-6816-4050-a505-693c4a470506@suse.com>
 <c80dd525-7fb6-4e2f-99f2-5d96d3f7ec52@xen.org>
 <d29f7235-661c-4457-959c-eeb3b553da02@suse.com>
Message-ID: <85ef25890dc92f768646ac16031b84ec@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-09-23 11:47, Jan Beulich wrote:
> On 16.09.2024 23:27, Julien Grall wrote:
>> On 11/09/2024 13:19, Jan Beulich wrote:
>>> Returning a literal number is a bad idea anyway when all other 
>>> returns
>>> use IOREQ_STATUS_* values. While that's maybe intended on Arm 
>>> (mapping
>>> to IO_ABORT),
>> 
>> Arm doesn't support buffered ioreq (see ioreq_server_create()) and
>> AFAICT the "0" was already there before the code was moved.
> 
> Indeed, the bad conversion is older than the move.
> 
>>  > mapping to X86EMUL_OKAY is surely wrong on x86.
>> 
>> The code has been for nearly 10 years. So I would like to understand 
>> why
>> the change now. Did you see any issue?
> 
> Well, result of looking at the code. As said - returning success here 
> is
> definitely wrong on x86. The open question is whether IO_ABORT was 
> actually
> meant to be (implicitly) used here for Arm (but see below).
> 
>> The unclear part for me is the behavior change. Below...
>> 
>>> 
>>> Fixes: f6bf39f84f82 ("x86/hvm: add support for broadcast of buffered 
>>> ioreqs...")
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> Judging from history, it may want to be IOREQ_STATUS_UNHANDLED 
>>> instead,
>>> eliminating the need for IOREQ_STATUS_BAD. That'll be a behavioral
>>> change on Arm then too, though.
>> 
>> ... you mention Arm. But not x86. This would imply there are no 
>> behavior
>> change but I don't understand why.
> 
> The way the patch is written it keeps Arm's (perceived; again see 
> below)
> behavior unchanged, but fixes x86. The remark above is suggesting an
> alternative without need for the new IOREQ_STATUS_BAD, yet then also
> leading to a behavioral change on Arm. Hence the question whether the
> present behavior is intended. However, ...
> 
>> For the Arm behavior change, per above, I don't think we can reach the
>> code on Arm so it should not be a problem to change it.
> 
> ... with you pointing out that buffered ioreqs aren't supported on Arm,
> I could indeed change this whichever way suits x86, without affecting
> Arm at all. It would then be only an abstract consideration, for the
> hypothetical case that buffered ioreqs became needed on Arm as well.
> 
> Buffered ioreqs not being supported on Arm of course means the function
> as a whole is unreachable, i.e. in violation of Misra rule 2.1. Which I
> find concerning, as that rule is marked as clean - indicating that
> Eclair isn't smart enough to spot the case here. (Reason for the 
> remark:
> If the function had been marked / excluded accordingly, I would have
> noticed Arm's unaffectedness of whichever way the change is done.)
> 

ECLAIR has been configured to mark unreferenced functions as 
deliberately unreachable and thus hide those reports by default in the 
CI analyses.

-doc_begin="Some functions are intended to be not referenced."
-config=MC3R1.R2.1,+reports={deliberate,"first_area(^.*is never 
referenced$)"}
-doc_end


>>> Shouldn't IOREQ_READ requests also be rejected here, for the result 
>>> of
>>> a read not possibly coming from anywhere, yet a (bogus) caller then
>>> assuming some data was actually returned?
>> 
>> I am not sure. I understand from an hardened PoV. But this would add 
>> an
>> extra check to something the caller should be aware of. This is
>> different from the address check because this is more of an
>> implementation details.
>> 
>> So maybe it should be an ASSERT()?
> 
> That might be an option, yet with the general movement towards also
> providing safety on release builds that would likely end up being
> 
>     if ( dir != IOREQ_WRITE )
>     {
>         ASSERT_UNREACHABLE():
>         return 0;
>     }
> 
> i.e. still an extra check.
> 
> Jan

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

