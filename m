Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 341868C5CF7
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 23:36:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721801.1125475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6zoU-0000Vh-7s; Tue, 14 May 2024 21:35:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721801.1125475; Tue, 14 May 2024 21:35:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6zoU-0000U7-3k; Tue, 14 May 2024 21:35:58 +0000
Received: by outflank-mailman (input) for mailman id 721801;
 Tue, 14 May 2024 21:35:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o5lq=MR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s6zoS-0000Tx-Qv
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 21:35:56 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id effe0537-1239-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 23:35:53 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 606846135B;
 Tue, 14 May 2024 21:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA839C32786;
 Tue, 14 May 2024 21:35:49 +0000 (UTC)
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
X-Inumbo-ID: effe0537-1239-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715722551;
	bh=gZ6eDocZ0a1RIgFarB/Rv3RWZzU6B+R8pgu9855wUEQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ozo5v5lz+HGp/j1jfmpJVCHUkJu929hCfb7/ThgC/1CJv4Z+zFntMtzRmrJsfMJVt
	 9sJiwY0T5MKswMnE8TVwidhoN/YWGDCs6wNgkBeD24nnTGtKqc5PrQm1qm3owaalL4
	 kC57P6dLQzhah9NH2HOP5cg3qJiGju69TjyGICYDi3Chuwvgp5T/PWWIOFAshBkF67
	 Wdc4WINL3j8SQSw7RlhQPoKcPXRGe1d4lAeL543gw/HADqZ4R9WKa3ZKQYvU6+3vsF
	 hLXEBlJN3M4b2UDoE5MzwXxomUtBEf5VIlWmKKFKRJ08v3Bg2Z7BDRapV2XIMsIVNx
	 ABWRSQ8LXsCQg==
Date: Tue, 14 May 2024 14:35:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <George.Dunlap@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Daniel Smith <dpsmith@apertussolutions.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    "committers@xenproject.org" <committers@xenproject.org>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] Revert "evtchn: refuse EVTCHNOP_status for Xen-bound
 event channels"
In-Reply-To: <9249bc7e-7ca9-4f6e-8f3e-f2962c14e306@xen.org>
Message-ID: <alpine.DEB.2.22.394.2405141411210.2544314@ubuntu-linux-20-04-desktop>
References: <20240402170612.2477791-1-andrew.cooper3@citrix.com> <11957460-0b2b-432d-ad92-38350306c9ff@suse.com> <b14acc58-5d3c-46ed-a300-61f422501d4c@suse.com> <1ba4d87f-48e2-4332-bcd8-ac891cee8917@citrix.com> <ccd70c8f-1381-43f7-8be8-edc1dd505ce2@suse.com>
 <9249bc7e-7ca9-4f6e-8f3e-f2962c14e306@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1627467485-1715721124=:2544314"
Content-ID: <alpine.DEB.2.22.394.2405141412250.2544314@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1627467485-1715721124=:2544314
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2405141412251.2544314@ubuntu-linux-20-04-desktop>

On Tue, 14 May 2024, Julien Grall wrote:
> Hi,
> 
> (+ Oleksii as the release manager)
> 
> Chiming into the discussion as there seems there is disagreement.
> 
> On 14/05/2024 11:03, Jan Beulich wrote:
> > On 14.05.2024 11:51, Andrew Cooper wrote:
> > > On 14/05/2024 10:25 am, Jan Beulich wrote:
> > > > On 03.04.2024 08:16, Jan Beulich wrote:
> > > > > On 02.04.2024 19:06, Andrew Cooper wrote:
> > > > > > The commit makes a claim without any kind of justification.
> > > > > Well, what does "have no business" leave open?
> > > > > 
> > > > > > The claim is false, and the commit broke lsevtchn in dom0.
> > > > > Or alternatively lsevtchn was doing something that was never meant to
> > > > > work
> > > > > (from Xen's perspective).
> > > > > 
> > > > > >   It is also quite
> > > > > > obvious from XSM_TARGET that it has broken device model stubdoms
> > > > > > too.
> > > > > Why would that be "obvious"? What business would a stubdom have to
> > > > > look at
> > > > > Xen's side of an evtchn?
> > > > > 
> > > > > > Whether to return information about a xen-owned evtchn is a matter
> > > > > > of policy,
> > > > > > and it's not acceptable to short circuit the XSM on the matter.
> > > > > I can certainly accept this as one possible view point. As in so many
> > > > > cases
> > > > > I'm afraid I dislike you putting it as if it was the only possible
> > > > > one.
> > > > > 
> > > > > In summary: The supposed justification you claim is missing in the
> > > > > original
> > > > > change is imo also missing here then: What business would any entity
> > > > > in the
> > > > > system have to look at Xen's side of an event channel? Back at the
> > > > > time, 3
> > > > > people agreed that it's "none".
> > > > You've never responded to this reply of mine, or its follow-up. You also
> > > > didn't chime in on the discussion Daniel and I were having. I consider
> > > > my
> > > > objections unaddressed, and in fact I continue to consider the change to
> > > > be wrong. Therefore it was inappropriate for you to commit it; it needs
> > > > reverting asap. If you're not going to do so, I will.
> > > 
> > > You tried defending breaking a utility with "well it shouldn't exist
> > > then".
> > > 
> > > You don't have a leg to stand on, and two maintainers of relevant
> > > subsystems here just got tired of bullshit being presented in place of
> > > any credible argument for having done the change in the way you did.
> > 
> > Please can you finally get into the habit of not sending rude replies?
> > 
> > > The correct response was "Sorry I broke things.  Lets revert this for
> > > now to unbreak, and I'll see about reworking it to not intentionally
> > > subvert Xen's security mechanism".
> > 
> > I'm sorry, but I didn't break things. I made things more consistent with
> > the earlier change, as pointed out before: With your revert,
> > evtchn_status() is now (again) inconsistent with e.g. evtchn_send(). If
> > you were serious about this being something that needs leaving to XSM,
> > you'd have adjusted such further uses of consumer_is_xen() as well. But
> > you aren't. You're merely insisting on lsevtchn needing to continue to
> > work in a way it should never have worked, with a patch to improve the
> > situation already pending.
> > 
> > Just to state a very basic principle here again: Xen-internal event
> > channels ought to either be fully under XSM control when it comes to
> > domains attempting to access them (in whichever way), or they should
> > truly be Xen-internal, with access uniformly prevented. To me the
> > former option simply makes very little sense.
> 
> I agree we need consistency on how we handle security policy event channel.
> Although, I don't have a strong opinion on which way to go.

Same here


> For the commit message, it is not entirely clear what "broke lseventch in
> dom0" really mean. Is it lsevtchn would not stop or it will just not display
> the event channel?
> 
> If the former, isn't a sign that the tool needs to be harden a bit more? If
> the latter, then I would argue that consistency for the XSM policy is more
> important than displaying the event channel for now (the patch was also
> committed 3 years ago...).

I realize 3 years have passed and it is a long time, but many
downstreams (including some which are widely used) don't rebase
regularly and we are still missing lots of tests from gitlab-ci. The
unfortunate result is that it can take years to realize there is a
breakage. We need more gitlab-ci (or OSSTest) tests.


> So I would vote for a revert and, if desired, replacing with a patch that
> would change the XSM policy consistently. Alternatively, the consistency
> should be a blocker for Xen 4.19.

I am convinced by Daniel's argument here:

https://marc.info/?l=xen-devel&m=171215093102694
https://marc.info/?l=xen-devel&m=171215073502479

I would ack Andrew's revert. If we decide to revert Andrew's revert, I
also think that we should make the alternative solution, whatever that
might be, a blocker for Xen 4.19.

My favorite alternative solition is Daniel's suggestion of adding a
check to the dummy XSM policy. I am not sure if this is the same thing
you mean with "change the XSM policy consistently".


> > > As it stands, you're 2-1 outvoted, and wasted any sympathy I may have
> > > had for the principle of the change based on the absurdity of your
> > > arguments.
> > 
> > No, pending objections are pending objections. Daniel's responses didn't
> > eliminate them.
> 
> Indeed, this is rule 4 of the check-in policy:
> 
> 4. There must be no "open" objections.
> 
> I don't view Jan's objections as unreasonable in particular for the
> consistency part.
--8323329-1627467485-1715721124=:2544314--

