Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9564C8860D8
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 20:05:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696581.1087634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnNhp-0007ym-Rp; Thu, 21 Mar 2024 19:04:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696581.1087634; Thu, 21 Mar 2024 19:04:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnNhp-0007vy-PG; Thu, 21 Mar 2024 19:04:01 +0000
Received: by outflank-mailman (input) for mailman id 696581;
 Thu, 21 Mar 2024 19:04:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gBWc=K3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rnNho-0007vs-OD
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 19:04:00 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3b8499b-e7b5-11ee-a1ee-f123f15fe8a2;
 Thu, 21 Mar 2024 20:03:57 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8D2B7CE106A;
 Thu, 21 Mar 2024 19:03:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A9E2C433F1;
 Thu, 21 Mar 2024 19:03:49 +0000 (UTC)
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
X-Inumbo-ID: c3b8499b-e7b5-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711047830;
	bh=jmL5Y8dodgZCqk/gHCWpvwkkoZDvOziKdczegnst7wc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZF3VF09A9utMu+igH1EGSXTs/nE3efMLKLwk4YYfj7nTzfI2p7L6hPccJlQmKv3q+
	 a8J7VmL8sVlVG+WMTxGKdiFYhNQniPHittOq0gpLn24NuL+t0NZZyQHOkgcYgWiDus
	 HOW0Z6yMQMJG0PxMnVFMi0NIBk/nchx8vvjcM0DSp48kfshlVY9AwE9AKqPXm1bV8X
	 EeXpCzMMcrNF5sjM1eAZFAQ8NzA7s6hfQwZCuLr/GeCvo9k+Cjfk+jI12uaKVSPXFX
	 YhTxr56/SwIKc0GBJj3PiFi/kwc8t+VkGoBhwzP2PF9gakCK5sqBt5TailJ5drQ+yt
	 7jiAdQr5m1Rfg==
Date: Thu, 21 Mar 2024 12:03:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    bertrand.marquis@arm.com, george.dunlap@citrix.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] docs/misra: document the expected sizes of integer
 types
In-Reply-To: <198bade8-c6fc-4ae0-b721-3a9e2bd8acbe@suse.com>
Message-ID: <alpine.DEB.2.22.394.2403211140540.1569010@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2403141516550.853156@ubuntu-linux-20-04-desktop> <6a76723e-ba47-40b3-8f33-d68030b14299@suse.com> <alpine.DEB.2.22.394.2403151658530.853156@ubuntu-linux-20-04-desktop> <7ab73379-b057-4568-9869-141cef185752@suse.com>
 <alpine.DEB.2.22.394.2403181735410.853156@ubuntu-linux-20-04-desktop> <fadd30c9-440d-401d-bd05-7e1d965bbefe@suse.com> <alpine.DEB.2.22.394.2403190815220.853156@ubuntu-linux-20-04-desktop> <87234837-9fb3-40a9-849d-8b8574f2661c@suse.com>
 <alpine.DEB.2.22.394.2403201812380.1569010@ubuntu-linux-20-04-desktop> <198bade8-c6fc-4ae0-b721-3a9e2bd8acbe@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 21 Mar 2024, Jan Beulich wrote:
> On 21.03.2024 02:46, Stefano Stabellini wrote:
> > On Wed, 20 Mar 2024, Jan Beulich wrote:
> >>> - the public interface is described in a C header so it makes sense for
> >>>   the corresponding implementation to be in C
> >>>
> >>> - the C entry point is often both the entry point in C and also common
> >>>   code
> >>>
> >>> - depending on the architecture, there is typically always some minimal
> >>>   assembly entry code to prepare the environment before we can jump into
> >>>   C-land; still one wouldn't consider those minimal and routine assembly
> >>>   operations to be a meaningful hypercall entry point corresponding to
> >>>   the C declaration in the public headers
> >>>
> >>> - as per MISRA and also general good practice, we need the declaration
> >>>   in the public header files to match the definition in C
> >>
> >> Throughout, but especially with this last point, I feel there's confusion
> >> (not sure on which side): There are no declarations of hypercall functions
> >> in the public headers. Adding declarations there for the C entry points in
> >> Xen would actually be wrong, as we don't provide such functions anywhere
> >> (to consumers of the ABI).
> > 
> > I am copy/pasting text from sched.h:
> > 
> >  * The prototype for this hypercall is:
> >  * ` long HYPERVISOR_sched_op(enum sched_op cmd, void *arg, ...)
> >  *
> >  * @cmd == SCHEDOP_??? (scheduler operation).
> >  * @arg == Operation-specific extra argument(s), as described below.
> >  * ...  == Additional Operation-specific extra arguments, described below.
> >  *
> > 
> > from event_channel.h:
> > 
> >  * ` enum neg_errnoval
> >  * ` HYPERVISOR_event_channel_op(enum event_channel_op cmd, void *args)
> >  * `
> >  * @cmd  == EVTCHNOP_* (event-channel operation).
> >  * @args == struct evtchn_* Operation-specific extra arguments (NULL if none).
> > 
> > These are the hypercall declarations in public headers. Although they
> > are comments, they are the only description of the ABI that we have (as
> > far as I know). They are in C and use C types. 
> 
> >From their use of enum alone they don't qualify as declarations. They're
> imo merely meant to provide minimal guidelines.

Even if we call them "minimal guidelines", my opinion is unchanged:
- they need to use fixed-width types
- they should match the C hypercall entry point types


> >>>>>>> We have two options:
> >>>>>>>
> >>>>>>> 1) we go with this document, and we clarify that even if we specify
> >>>>>>>   "unsigned int", we actually mean a 32-bit integer
> >>>>>>>
> >>>>>>> 2) we change all our public ABIs and C hypercall entry points to use
> >>>>>>>    fixed-size types (e.g. s/unsigned int/uint32_t/g)
> >>>>>>>
> >>>>>>> 2) is preferred because it is clearer but it is more work. So I went
> >>>>>>> with 1). I also thought you would like 1) more.
> >>>>>>
> >>>>>> For ABIs (i.e. structures) we ought to be making that change anyway.
> >>>>>> Leaving basic types in there is latently buggy.
> >>>>>
> >>>>> I am glad we agree :-)
> >>>>>
> >>>>> It is just that I also consinder the C hypercall entry points as part of
> >>>>> the ABI
> >>>>>
> >>>>>
> >>>>>> I'm happy to see a document like this added, for the purpose described
> >>>>>> above. But to me 1) and 2) and largely independent of one another.
> >>>>>
> >>>>> Good that you are also happy with a document like this.
> >>>>>
> >>>>> The remaining question is: what about the rest of the C functions in Xen
> >>>>> that are certainly not part of an ABI?
> >>>>
> >>>> As per above - anything internal isn't part of the ABI, C entry points
> >>>> for hypercall handlers included. All we need to ensure is that we consume
> >>>> the data according to what the ABI sets forth.
> >>>
> >>> It doesn't look like we'll convince one another on this point. But let
> >>> me try another way.
> >>>
> >>> In my view, having mismatched types between declaration and definition
> >>> and having non-fixed-width types in C hypercall entry points is really
> >>> bad for a number of reasons, among them:
> >>> - correctness
> >>> - risk of ABI breakage
> >>> - mismatch of declaration and definition
> >>
> >> What mismatches are you talking about? There's nothing mismatched now,
> >> and there cannot be any mismatch, because the consumers of the ABI don't
> >> call Xen functions directly.
> > 
> > Let me make an example:
> > 
> > - public header saying enum event_channel_op cmd
> > - <assembly>
> > - do_event_channel_op(int cmd, ...)
> > 
> > Do you think this is all good?
> > 
> > There are two pretty serious problems here:
> > - enum and int are not the same type
> 
> See above. The issue I have with this is use of plain "int". Technically
> that's not a problem either, but aiui we're aiming to use "unsigned int"
> when negative values aren't possible.

Yeah that is also a problem


> And note that it was in 2012 when "int" there was changed to "enum", in an
> effort to document things better.
> 
> > - enum and int are not fixed-width
> 
> Which I don't view as a problem, thanks to the assembly sitting in between.

I disagree. I view this as risky and error prone. We worked for hours
and hours on security issues and MISRA improvements. All this experience
is also meant to teach us what good code looks like, code that is
resilient to attacks, poses fewer safety issues, and it is clearer for
others to read and modify. After all of the above, I am surprised we are
not aligned on this issue.

I understand your point of view, as I think you understand mine. We are
not going to be able to convince each other. Having explored the
technical aspects in all their details, I think we need more opinions
from others to move forward.

I'll conclude with this. One doesn't have to agree with me to agree
that the suggestions I am making are to make the code and public
interfaces, clearer, more consistent, less error prone. Your suggestions
are to make the code follow CODING_STYLE? I made it clear the value
proposition of what I am suggesting and I fail to see yours.


> > Don't you think it should be:
> > 
> > - public header saying uint32_t cmd in a comment
> > - <assembly>
> > - do_something_op(uint32_t cmd, ...)
> 
> The public header should say whatever is best suited to not misguide
> people writing actual prototypes for their functions. I wouldn't mind
> uint32_t being stated there. That has no influence whatsoever on
> do_<something>_op(), though.

I understand what you are saying but I disagree. It is risky and error
prone. As above, I think we understand each other's points of view but
we won't be able to convince each other.


> > Or possibly unsigned long depending on the parameter.
> 
> You're contradicting yourself: You mean to advocate for fixed-width types,
> yet then you suggest "unsigned long".

No. I explained it in another thread a couple of days ago. There are
cases where we have fixed-width types but the type changes by
architecture: 32-bit for 32-bit archs and 64-bit for 64-bit archs.
Rather than having #ifdefs, which is also an option, that is the one
case where using "unsigned long" could be a decent compromise. In this
context "unsigned long" means register size (on ARM we even have
register_t). Once you pick an architecture, the size is actually meant
to be fixed. In fact, it is specified in this document. Which is one of
the reasons why we have to use == in this document and not >=. In
general, fixed-width types like uint32_t are better because they are
clearer and unambiguous. When possible I think they should be our first
choice in ABIs.

