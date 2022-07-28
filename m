Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 790D0584882
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 01:01:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377203.610294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHCVa-0007GO-Ar; Thu, 28 Jul 2022 23:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377203.610294; Thu, 28 Jul 2022 23:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHCVa-0007DE-7c; Thu, 28 Jul 2022 23:01:34 +0000
Received: by outflank-mailman (input) for mailman id 377203;
 Thu, 28 Jul 2022 23:01:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M61b=YB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oHCVZ-0007D8-9N
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 23:01:33 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 381a149a-0ec9-11ed-924f-1f966e50362f;
 Fri, 29 Jul 2022 01:01:31 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A2EBB61C99;
 Thu, 28 Jul 2022 23:01:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFB0CC433D7;
 Thu, 28 Jul 2022 23:01:29 +0000 (UTC)
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
X-Inumbo-ID: 381a149a-0ec9-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659049290;
	bh=mYIZv7qO/hv0UXAejYw61xs9h5tN2EQOm/GOSS/2XDE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ASycqEolwFbTexjgosQWZkrMZNRt6RVTQnO/aeCCKgVZInAdVD+o7jRdPa7If6EQg
	 bweQboZhKAWCpaCIafM0op9NvebGfPBM6nxS4XqNy6upuNlKIj9yGpwu0LlHaSj5Q3
	 vTPzqqEUZgbUAdKUuDN2uwq7lP7Rp8R3XcJGobDI+/PEij5/6uN4TXdJJUrl9pFygF
	 EY8LxzV1Ik738E5VL76cLq0V/uHQ/ja5YjCUUmHAcRNWdp4frxobf4eaC7JxfSjaxx
	 tskS0dQ/hZLAJochOdKDyzzLIcx09VHJfwhSENR0bjZ6QXex9Nr+uDlnRaBjVt1DOn
	 9e9fQ7vHnOryw==
Date: Thu, 28 Jul 2022 16:01:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Julien Grall <julien@xen.org>, Xenia Ragiadakou <burzalodowa@gmail.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/2] xen/arm: asm/atomic.h: Fix MISRA C 2012 Rule 2.5
 violation
In-Reply-To: <FE2D035F-5EEC-491B-8369-2B327C497482@arm.com>
Message-ID: <alpine.DEB.2.22.394.2207281558450.4648@ubuntu-linux-20-04-desktop>
References: <20220727153254.1143503-1-burzalodowa@gmail.com> <20220727153254.1143503-3-burzalodowa@gmail.com> <d0e8f4b6-a66e-48c3-4f29-728cc7f5fafc@xen.org> <93036B23-69AA-4075-A54F-1EC8CB194928@arm.com> <49ed6d31-76fd-c962-5320-c88726b45987@xen.org>
 <27786AF4-37EA-4C54-9330-1C9B674BAC87@arm.com> <b4187646-875c-644c-937f-a6c0493d8aea@xen.org> <FE2D035F-5EEC-491B-8369-2B327C497482@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 28 Jul 2022, Bertrand Marquis wrote:
> > On 28 Jul 2022, at 11:21, Julien Grall <julien@xen.org> wrote:
> > On 28/07/2022 10:45, Bertrand Marquis wrote:
> >>> On 28 Jul 2022, at 10:35, Julien Grall <julien@xen.org> wrote:
> >>> On 28/07/2022 08:57, Bertrand Marquis wrote:
> >>>> Hi Julien,
> >>> 
> >>> Hi Bertrand,
> >>> 
> >>>>> On 27 Jul 2022, at 16:46, Julien Grall <julien@xen.org> wrote:
> >>>>> 
> >>>>> Hi Xenia,
> >>>>> 
> >>>>> On 27/07/2022 16:32, Xenia Ragiadakou wrote:
> >>>>>> Remove unused macro atomic_xchg().
> >>>>>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> >>>>>> ---
> >>>>>> xen/arch/arm/include/asm/atomic.h | 2 --
> >>>>>> 1 file changed, 2 deletions(-)
> >>>>>> diff --git a/xen/arch/arm/include/asm/atomic.h b/xen/arch/arm/include/asm/atomic.h
> >>>>>> index f5ef744b4b..a2dc125291 100644
> >>>>>> --- a/xen/arch/arm/include/asm/atomic.h
> >>>>>> +++ b/xen/arch/arm/include/asm/atomic.h
> >>>>>> @@ -223,8 +223,6 @@ static inline int atomic_add_unless(atomic_t *v, int a, int u)
> >>>>>> return __atomic_add_unless(v, a, u);
> >>>>>> }
> >>>>>> -#define atomic_xchg(v, new) (xchg(&((v)->counter), new))
> >>>>>> -
> >>>>> 
> >>>>> While I agree this is unused today, the wrapper is quite trivial and part of the generic API (x86 also provides one). So I am not in favor of removing it just to please MISRA.
> >>>>> 
> >>>>> That said, if Bertrand and Stefano agrees with removing it then you should also remove the x86 version to avoid inconsistency.
> >>>> I think we can keep this and maybe add a comment on top to document a known violation:
> >>>> /* TODO: MISRA_VIOLATION 2.5 */
> >>> 
> >>> While I am fine with this goal of the comment (i.e. indicating where Xen is not MISRA compliant), I think this is one place where I would rather not want one because it can get stale if someones decide to use the function.
> >> I think the one doing that will have to update the comment otherwise we will never manage to have an analysis without findings.
> > 
> > I was under the impression that Xen will never officially follow some of the MISRA rules. So I would expect the tools to be able to detect such cases so we don't have to add a comment for every deviation on something we will never support.
> > 
> >> Having those kind of comments in the code for violation also means that they must be updated if the violation is solved.
> > 
> > Right, but for thing like unused function, this is quite easy to miss by both the developer and reviewers. So we are going to end up to comments for nothing.
> > 
> >> Maybe we will need a run ignoring those to identify possible violations which are not violations anymore but this might be hard to do.
> > 
> > TBH, I think it would be best if we can teach the tools to ignore certain rules.
> 
> Definitely it is possible to instruct the tool to ignore this you are right and for 2.5 we should (for some reason I was under the impression that we said we would follow 2.5 but accept deviations).

Absolutely possible, basically we (the community) are the ones providing
the list of rules to the MISRA C checkers.


> @Xenia: please ignore and do not add a comment for this.
> 
> I think we will need to distinguish 2 kind of not following:
> - not following at all (disable in the tools)
> - accepting some deviations (documented in the code)

Yes, exactly right.


> As much as we can, I think we should target the second unless we have a lot of violations.

+1

