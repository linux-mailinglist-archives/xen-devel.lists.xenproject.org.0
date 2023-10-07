Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF727BC350
	for <lists+xen-devel@lfdr.de>; Sat,  7 Oct 2023 02:30:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613872.954711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qovCg-0006GA-E9; Sat, 07 Oct 2023 00:29:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613872.954711; Sat, 07 Oct 2023 00:29:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qovCg-0006ET-9q; Sat, 07 Oct 2023 00:29:58 +0000
Received: by outflank-mailman (input) for mailman id 613872;
 Sat, 07 Oct 2023 00:29:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BHja=FV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qovCe-0006EJ-TL
 for xen-devel@lists.xenproject.org; Sat, 07 Oct 2023 00:29:56 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1b12bad-64a8-11ee-9b0d-b553b5be7939;
 Sat, 07 Oct 2023 02:29:53 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1FCE761426;
 Sat,  7 Oct 2023 00:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3444C433C8;
 Sat,  7 Oct 2023 00:29:49 +0000 (UTC)
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
X-Inumbo-ID: a1b12bad-64a8-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696638591;
	bh=dwXOrNKOJ+GMgIknBjrWkHPk60vQGJkBgxH8d6d3CRs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZBhojBebbtxl753h8mrAG8Qx7Ikh2eYZybbHr4fugMOLYNN6d9a51XYS02Df5Y6Fd
	 ZgmX7bS/HQOrf8HMWPfYnx0xLmafVkhdusNKegGKybTNHpyjxoZfrb5KihbWbnmQSS
	 dKQxKm92JXlx/XFlY5lpMJqnHui4gKkrENoRYHgyIHqO9wRSa0t3TwHpgvXco8kj9+
	 JTrR3y3FKjZbLPb0kI6DpXeBmy8ZlocYDXkWfBY8f7WzkIzf4m2Vp95KjW2qmRQ25h
	 tndukuvElJyVWVHsLXGbTH+N909motfziSrbfw0Fskh3LZghaRQmyHq6+RDvgIXDoc
	 seyh2kFpA9KHQ==
Date: Fri, 6 Oct 2023 17:29:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Julien Grall <julien@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 1/9] xen/include: add macro LOWEST_POW2
In-Reply-To: <alpine.DEB.2.22.394.2310061654470.3431292@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2310061729220.3431292@ubuntu-linux-20-04-desktop>
References: <cover.1696514677.git.nicola.vetrini@bugseng.com> <d27f52eaaa62ec4ebb9ce8b6cf243779d341367d.1696514677.git.nicola.vetrini@bugseng.com> <6102db25-2fd6-49fa-be66-ec2b627b019b@xen.org> <0197ecdcc5869dddecc98907f67ba0f1@bugseng.com>
 <63f172c1-bda5-447b-bc8b-90563f3f3c2a@xen.org> <4ecd59b63bc5b7b8f4c24672432ba027@bugseng.com> <01fd528d-845d-4342-a17a-e080a921273f@xen.org> <alpine.DEB.2.22.394.2310061654470.3431292@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 6 Oct 2023, Stefano Stabellini wrote:
> On Fri, 6 Oct 2023, Julien Grall wrote:
> > Hi Nicola,
> > 
> > On 06/10/2023 11:34, Nicola Vetrini wrote:
> > > On 06/10/2023 12:22, Julien Grall wrote:
> > > > On 06/10/2023 11:02, Nicola Vetrini wrote:
> > > > > On 06/10/2023 11:29, Julien Grall wrote:
> > > > > > Hi,
> > > > > > 
> > > > > > On 06/10/2023 09:26, Nicola Vetrini wrote:
> > > > > > > The purpose of this macro is to encapsulate the well-known
> > > > > > > expression
> > > > > > > 'x & -x', that in 2's complement architectures on unsigned integers
> > > > > > > will
> > > > > > > give 2^ffs(x), where ffs(x) is the position of the lowest set bit in
> > > > > > > x.
> > > > > > > 
> > > > > > > A deviation for ECLAIR is also introduced.
> > > > > > 
> > > > > > Can you explain why this is a deviation in ECLAIR rather than one with
> > > > > > /* SAF-* */ (or whichever name we decide to rename to)? Is this
> > > > > > because the code is correct from MISRA perspective but the tool is
> > > > > > confused?
> > > > > > 
> > > > > 
> > > > > The code does violate Rule 10.1 (a unary minus applied to an unsigned
> > > > > value is
> > > > > deemed inappropriate by MISRA), but rather than changing a whole lot of
> > > > > places where this
> > > > > construct is used (mainly in x86 code), the reasoning is that it makes
> > > > > more sense to isolate
> > > > > it and justify its presence by the fact that on 2's complement
> > > > > architectures the result is
> > > > > indeed correct.
> > > > 
> > > > This is explaining to me why you are adding LOWEST_POW2(). But this
> > > > doesn't explain why you are not using /* SAF-* */ on top of
> > > > LOWEST_POW2().
> > > > 
> > > > To me, we should only use ECLAIR specific deviation when this is a
> > > > shortcoming with the tool.
> > > > 
> > > > Cheers,
> > > 
> > > Because of the way ECLAIR deviation comments work implies that in most cases
> > > the real
> > > place where to put the deviation is the usage site
> > > (the so-called top expansion location of the macro). Now, for widely-used
> > > macros this is
> > > cumbersome and would clutter the code unnecessarily. It's way cleaner imo to
> > > have a single
> > > line in the configuration with a clear justification that is present in the
> > > textual output
> > > of the tool.
> > 
> > Just to clarify, you are saying that the following would not work for Eclair:
> > 
> > /* SAF-XXX */
> > #define LOWEST_POW2()
> > 
> > Instead you would need the following:
> > 
> > void foo()
> > {
> > 	/* SAF-XXX */
> > 	LOWEST()
> > }
> > 
> > Am I correct? If so, would something like below (untested) work?
> > 
> > #define LOWEST_POW2(...) ({ \
> >    /* SAFE-XXX */           \
> >    ...
> >    })
> > 
> > > But then there are tool interoperability considerations, that would call for
> > > standardized
> > > deviation mechanisms, if they do detect this as a violation (which I don't
> > > know).
> > 
> > I don't think we need to know whether a tool detects it. We only need to know
> > whether this is  violation to MISRA. If this is one, then this is a call to
> > have a marker in the code.
> > 
> > If this is a false positive, then adding the deviation in the tool
> > configuration is best (unless there are multiple tools affected).
> > 
> > > 
> > > In the end, it could be done with a textual deviation, if that's preferred,
> > > but keep in mind
> > > that those are more fragile w.r.t. code movement.
> > 
> > If the comment is around the macro there are limited chance that this will be
> > missed. But if you are worried about code movement, you should be worried
> > about macro renaming with your approach (one may not know Eclair has a
> > deviation) and/or function with the same name.
> > 
> > I am curious to know what the other thinks.
> 
> I agree.
> 
> I think that we should use the SAF-x-safe framework as much as possible.
> That is the most flexible and easier to maintain deviation system we
> have. If we can make it work in this specific case with Julien's
> suggestion above, then great.
> 
> But it is becoming clear that the SAF-x-safe framework has limitations,
> for instance  https://marc.info/?l=xen-devel&m=169657904027210
> 
> There are going to be cases where SAF-x-safe won't work. In those cases,
> we will probably end up using an ECLAIR specific configuration. Those
> cases should be hopefully few and should be well documented, also
> outside of the ECLAIR config file, which is very ECLAIR specific and
> optimized to be machine readable. 
> 
> We need another RST document under docs/misra to document any deviations
> that are not dealt by SAF-x-safe comments. Today we are basically using
> the notes section in the docs/misra/rules.rst table but that doesn't
> scale.
> 
> So I think we should:
> - create new RST file like docs/misra/deviations.rst
> - deviations.rst will list any deviation that is not a SAF-x-safe
>   deviation
> - all ECLAIR special deviations in the ECLAIR config file should be
>   documented in deviations.rst
> - in the future special ECLAIR deviations in the config file should
>   come with a new documentation entry in deviations.rst
> 
> 
> This doesn't entirely address Julien's valid concern but at least it
> makes it easier to recognize the problem when it occurs.


We already have docs/misra/documenting-violations.rst, so maybe we could
have one more section at the end of the document with a list of
"special" deviations.

