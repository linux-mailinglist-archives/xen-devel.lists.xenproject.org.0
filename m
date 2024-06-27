Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B485919D12
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 03:55:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749640.1157876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMeKu-0004fI-MG; Thu, 27 Jun 2024 01:54:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749640.1157876; Thu, 27 Jun 2024 01:54:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMeKu-0004do-JN; Thu, 27 Jun 2024 01:54:08 +0000
Received: by outflank-mailman (input) for mailman id 749640;
 Thu, 27 Jun 2024 01:54:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iDhR=N5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sMeKu-0004di-0Q
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 01:54:08 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 207726ae-3428-11ef-b4bb-af5377834399;
 Thu, 27 Jun 2024 03:54:05 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BE24CCE2D55;
 Thu, 27 Jun 2024 01:53:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18AADC32782;
 Thu, 27 Jun 2024 01:53:55 +0000 (UTC)
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
X-Inumbo-ID: 207726ae-3428-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719453237;
	bh=jg2oguDpRhsWorICbOUbrkGWd/WeRDjZ2pRWrSzs1sI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eVjzOjM9O+zYSn/I3RmxfryOHqOSlMfRC/mNxO7ChIE4mZtVsF5BUkfFRYCYAp9iK
	 Vhhqv+re6nw5nJQkpXEGwLDh095rsHqBgp6Xf1lx0R9e3kuFKBolT2OTe/bieDiDng
	 aoe+Xb5g5CliCiv4f4ZhxMTD0NI87XWigRbeOwP7JDnXZJhK9CCjZlp8xXko4bn6jK
	 GFu4Ljd9vpOB7Q9kw7f2Vn8T215BfRu49Vct/UywVNYcJNybFwZw+HxcudRLQPF7vJ
	 YxBzKIQHnKY0VsvUT+5Opo3ARJTmUQ7Iw0Z12tZQSu1zzyCyDa09OxxVgZWlcl2vty
	 Etu7tTz/SRiJA==
Date: Wed, 26 Jun 2024 18:53:54 -0700 (PDT)
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
In-Reply-To: <6441010f-c2f6-4098-bf23-837955dcf803@suse.com>
Message-ID: <alpine.DEB.2.22.394.2406261758390.3635@ubuntu-linux-20-04-desktop>
References: <cover.1719218291.git.federico.serafini@bugseng.com> <4f44a7b021eb4f78ccf1ce69b500b48b75df81c5.1719218291.git.federico.serafini@bugseng.com> <alpine.DEB.2.22.394.2406241753260.3870429@ubuntu-linux-20-04-desktop> <a5b47b7e-9dc0-4108-bd6f-eb34f7cb8c3c@suse.com>
 <alpine.DEB.2.22.394.2406251808040.3635@ubuntu-linux-20-04-desktop> <6441010f-c2f6-4098-bf23-837955dcf803@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Jun 2024, Jan Beulich wrote:
> On 26.06.2024 03:11, Stefano Stabellini wrote:
> > On Tue, 25 Jun 2024, Jan Beulich wrote:
> >> On 25.06.2024 02:54, Stefano Stabellini wrote:
> >>> On Mon, 24 Jun 2024, Federico Serafini wrote:
> >>>> Add break or pseudo keyword fallthrough to address violations of
> >>>> MISRA C Rule 16.3: "An unconditional `break' statement shall terminate
> >>>> every switch-clause".
> >>>>
> >>>> No functional change.
> >>>>
> >>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> >>>> ---
> >>>>  xen/arch/x86/traps.c | 3 +++
> >>>>  1 file changed, 3 insertions(+)
> >>>>
> >>>> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> >>>> index 9906e874d5..cbcec3fafb 100644
> >>>> --- a/xen/arch/x86/traps.c
> >>>> +++ b/xen/arch/x86/traps.c
> >>>> @@ -1186,6 +1186,7 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
> >>>>  
> >>>>      default:
> >>>>          ASSERT_UNREACHABLE();
> >>>> +        break;
> >>>
> >>> Please add ASSERT_UNREACHABLE to the list of "unconditional flow control
> >>> statements" that can terminate a case, in addition to break.
> >>
> >> Why? Exactly the opposite is part of the subject of a recent patch, iirc.
> >> Simply because of the rules needing to cover both debug and release builds.
> > 
> > The reason is that ASSERT_UNREACHABLE() might disappear from the release
> > build but it can still be used as a marker during static analysis. In
> > my view, ASSERT_UNREACHABLE() is equivalent to a noreturn function call
> > which has an empty implementation in release builds.
> > 
> > The only reason I can think of to require a break; after an
> > ASSERT_UNREACHABLE() would be if we think the unreachability only apply
> > to debug build, not release build:
> > 
> > - debug build: it is unreachable
> > - release build: it is reachable
> > 
> > I don't think that is meant to be possible so I think we can use
> > ASSERT_UNREACHABLE() as a marker.
> 
> Well. For one such an assumption takes as a prereq that a debug build will
> be run through full coverage testing, i.e. all reachable paths proven to
> be taken. I understand that this prereq is intended to somehow be met,
> even if I'm having difficulty seeing how such a final proof would look
> like: Full coverage would, to me, mean that _every_ line is reachable. Yet
> clearly any ASSERT_UNREACHABLE() must never be reached.
> 
> And then not covering for such cases takes the further assumption that
> debug and release builds are functionally identical. I'm afraid this would
> be a wrong assumption to make:
> 1) We may screw up somewhere, with code wrongly enabled only in one of the
>    two build modes.
> 2) The compiler may screw up, in particular with optimization.

I think there are two different issues here we are discussing.

One issue, like you said, has to do with coverage. It is important to
mark as "unreachable" any part of the code that is indeed unreachable
so that we can account it properly when we do coverage analysis. At the
moment the only "unreachable" marker that we have is
ASSERT_UNREACHABLE(), and I am hoping we can use it as part of the
coverage analysis we'll do.

However, there is a different separate question about what to do in the
Xen code after an ASSERT_UNREACHABLE(). E.g.:

             default:
                 ASSERT_UNREACHABLE();
                 return -EPERM; /* is it better with or without this? */
             }

Leaving coverage aside, would it be better to be defensive and actually
attempt to report errors back after an ASSERT_UNREACHABLE() like in the
example? Or is it better to assume the code is actually unreachable
hence there is no need to do anything afterwards?

One one hand, being defensive sounds good, on the other hand, any code
we add after ASSERT_UNREACHABLE() is dead code which cannot be tested,
which is also not good. In this example, there is no way to test the
return -EPERM code path. We also need to consider what is the right
thing to do if Xen finds itself in an erroneous situation such as being
in an unreachable code location.

So, after thinking about it and also talking to the safety manager, I
think we should:
- implement ASSERT_UNREACHABLE with a warning in release builds
- have "return -EPERM;" or similar for defensive programming

