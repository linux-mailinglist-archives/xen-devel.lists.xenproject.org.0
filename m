Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F9D91B269
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2024 01:00:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750358.1158532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMy5N-00025x-OR; Thu, 27 Jun 2024 22:59:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750358.1158532; Thu, 27 Jun 2024 22:59:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMy5N-00023p-LJ; Thu, 27 Jun 2024 22:59:25 +0000
Received: by outflank-mailman (input) for mailman id 750358;
 Thu, 27 Jun 2024 22:59:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iDhR=N5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sMy5M-00023j-0B
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 22:59:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2dc9cae-34d8-11ef-b4bb-af5377834399;
 Fri, 28 Jun 2024 00:59:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1544C62015;
 Thu, 27 Jun 2024 22:59:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC0DC2BBFC;
 Thu, 27 Jun 2024 22:59:17 +0000 (UTC)
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
X-Inumbo-ID: e2dc9cae-34d8-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719529158;
	bh=GnS2fyzkpU1GbG4BllMF9tQOXyG+fdLkzeXmsq+0XnQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UjR+4LYXsj+bRx4kX4F/s6lB2abZhCw0PPqDqN8GEzxAjn/WEALeypYQQG9+44zAE
	 eC3eR0mK17F/vomD6aDlPeRg9yq3AHs3OXcNMaGk4Gy+/TNm1mDTrJ4R67mg2Zepzi
	 8ljBUpvYiH6zmJHwgKsp50q53b2WQB8Xcbv+oDeTHBSsryR30+yCqLmYMMN07EDN9Y
	 D0Z4Sn5K1nGTztJ2MjHbdu+m+WuHdre21F1sJfFpNux1oz2WvX5tIx/MlxJwXeP+Yl
	 g9Y8KEXnEdntD2P3299RW25svR0qUzjH+VA3RAfCyW5e6rVRY7zn1fhcOi/EApIut7
	 qba0H4vwi6S0g==
Date: Thu, 27 Jun 2024 15:59:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Federico Serafini <federico.serafini@bugseng.com>
Subject: Re: [XEN PATCH v2 05/13] x86/traps: address violations of MISRA C
 Rule 16.3
In-Reply-To: <84eb22c8-7737-4e6b-8194-724c792c2d92@suse.com>
Message-ID: <alpine.DEB.2.22.394.2406271545210.3635@ubuntu-linux-20-04-desktop>
References: <cover.1719218291.git.federico.serafini@bugseng.com> <4f44a7b021eb4f78ccf1ce69b500b48b75df81c5.1719218291.git.federico.serafini@bugseng.com> <alpine.DEB.2.22.394.2406241753260.3870429@ubuntu-linux-20-04-desktop> <a5b47b7e-9dc0-4108-bd6f-eb34f7cb8c3c@suse.com>
 <alpine.DEB.2.22.394.2406251808040.3635@ubuntu-linux-20-04-desktop> <6441010f-c2f6-4098-bf23-837955dcf803@suse.com> <alpine.DEB.2.22.394.2406261758390.3635@ubuntu-linux-20-04-desktop> <84eb22c8-7737-4e6b-8194-724c792c2d92@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 27 Jun 2024, Jan Beulich wrote:
> On 27.06.2024 03:53, Stefano Stabellini wrote:
> > On Wed, 26 Jun 2024, Jan Beulich wrote:
> >> On 26.06.2024 03:11, Stefano Stabellini wrote:
> >>> On Tue, 25 Jun 2024, Jan Beulich wrote:
> >>>> On 25.06.2024 02:54, Stefano Stabellini wrote:
> >>>>> On Mon, 24 Jun 2024, Federico Serafini wrote:
> >>>>>> Add break or pseudo keyword fallthrough to address violations of
> >>>>>> MISRA C Rule 16.3: "An unconditional `break' statement shall terminate
> >>>>>> every switch-clause".
> >>>>>>
> >>>>>> No functional change.
> >>>>>>
> >>>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> >>>>>> ---
> >>>>>>  xen/arch/x86/traps.c | 3 +++
> >>>>>>  1 file changed, 3 insertions(+)
> >>>>>>
> >>>>>> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> >>>>>> index 9906e874d5..cbcec3fafb 100644
> >>>>>> --- a/xen/arch/x86/traps.c
> >>>>>> +++ b/xen/arch/x86/traps.c
> >>>>>> @@ -1186,6 +1186,7 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
> >>>>>>  
> >>>>>>      default:
> >>>>>>          ASSERT_UNREACHABLE();
> >>>>>> +        break;
> >>>>>
> >>>>> Please add ASSERT_UNREACHABLE to the list of "unconditional flow control
> >>>>> statements" that can terminate a case, in addition to break.
> >>>>
> >>>> Why? Exactly the opposite is part of the subject of a recent patch, iirc.
> >>>> Simply because of the rules needing to cover both debug and release builds.
> >>>
> >>> The reason is that ASSERT_UNREACHABLE() might disappear from the release
> >>> build but it can still be used as a marker during static analysis. In
> >>> my view, ASSERT_UNREACHABLE() is equivalent to a noreturn function call
> >>> which has an empty implementation in release builds.
> >>>
> >>> The only reason I can think of to require a break; after an
> >>> ASSERT_UNREACHABLE() would be if we think the unreachability only apply
> >>> to debug build, not release build:
> >>>
> >>> - debug build: it is unreachable
> >>> - release build: it is reachable
> >>>
> >>> I don't think that is meant to be possible so I think we can use
> >>> ASSERT_UNREACHABLE() as a marker.
> >>
> >> Well. For one such an assumption takes as a prereq that a debug build will
> >> be run through full coverage testing, i.e. all reachable paths proven to
> >> be taken. I understand that this prereq is intended to somehow be met,
> >> even if I'm having difficulty seeing how such a final proof would look
> >> like: Full coverage would, to me, mean that _every_ line is reachable. Yet
> >> clearly any ASSERT_UNREACHABLE() must never be reached.
> >>
> >> And then not covering for such cases takes the further assumption that
> >> debug and release builds are functionally identical. I'm afraid this would
> >> be a wrong assumption to make:
> >> 1) We may screw up somewhere, with code wrongly enabled only in one of the
> >>    two build modes.
> >> 2) The compiler may screw up, in particular with optimization.
> > 
> > I think there are two different issues here we are discussing.
> > 
> > One issue, like you said, has to do with coverage. It is important to
> > mark as "unreachable" any part of the code that is indeed unreachable
> > so that we can account it properly when we do coverage analysis. At the
> > moment the only "unreachable" marker that we have is
> > ASSERT_UNREACHABLE(), and I am hoping we can use it as part of the
> > coverage analysis we'll do.
> > 
> > However, there is a different separate question about what to do in the
> > Xen code after an ASSERT_UNREACHABLE(). E.g.:
> > 
> >              default:
> >                  ASSERT_UNREACHABLE();
> >                  return -EPERM; /* is it better with or without this? */
> >              }
> > 
> > Leaving coverage aside, would it be better to be defensive and actually
> > attempt to report errors back after an ASSERT_UNREACHABLE() like in the
> > example? Or is it better to assume the code is actually unreachable
> > hence there is no need to do anything afterwards?
> > 
> > One one hand, being defensive sounds good, on the other hand, any code
> > we add after ASSERT_UNREACHABLE() is dead code which cannot be tested,
> > which is also not good. In this example, there is no way to test the
> > return -EPERM code path. We also need to consider what is the right
> > thing to do if Xen finds itself in an erroneous situation such as being
> > in an unreachable code location.
> > 
> > So, after thinking about it and also talking to the safety manager, I
> > think we should:
> > - implement ASSERT_UNREACHABLE with a warning in release builds
> 
> If at all, then controlled by a default-off Kconfig setting. This would,
> after all, raise the question of how ASSERT() should behave then. Imo
> the two should be consistent in this regard, and NDEBUG clearly results
> in the expectation that ASSERT() expands to nothing. Perhaps this is
> finally the time where we need to separate NDEBUG from CONFIG_DEBUG; we
> did discuss doing so before. Then in your release builds, you could
> actually leave assertions active.
 
Yes, a kconfig to define the behavior of ASSERT_UNREACHABLE in release
builds is fine. And you are right that we should consider doing
something similar for ASSERT too.

I think that in any environment where safety (i.e. correctness of
behavior) is a primary concern, attempting to continue without doing
anything after reaching a point that is supposed to be unreachable is
not a good idea.

I think Xen should do something in response to reaching a point it is
not supposed to reach. I don't know yet what is the best course of
action but printing a warning seems to be the bare minimum.

Crashing the system is not a good idea as it could potentially be
exploited by malicious guests (security might not be the primary concern
but still.)


> > - have "return -EPERM;" or similar for defensive programming
> 
> You don't say how you'd deal with the not-reachable aspect then.

We'll have to find a way to account for all the code that cannot be
tested. We would have a problem anyway due to the ASSERT_UNREACHABLE
checks, but the addition of "return -EPERM;" will make things slightly
worse.

I have been told to prioritize safety of the code and defensive
programming over coverage calculations.

