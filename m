Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 956F677E9A8
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 21:28:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584907.915800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWMBx-00056i-Ne; Wed, 16 Aug 2023 19:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584907.915800; Wed, 16 Aug 2023 19:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWMBx-00054j-KA; Wed, 16 Aug 2023 19:28:29 +0000
Received: by outflank-mailman (input) for mailman id 584907;
 Wed, 16 Aug 2023 19:28:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8vYs=EB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qWMBw-00054a-3z
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 19:28:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 120667b7-3c6b-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 21:28:26 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DDCA461648;
 Wed, 16 Aug 2023 19:28:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B31C433C8;
 Wed, 16 Aug 2023 19:28:22 +0000 (UTC)
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
X-Inumbo-ID: 120667b7-3c6b-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692214104;
	bh=95jWPGayTyKUnKaEAt6wzPHH99lXuTxO85EdvXTTLDg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=g7Wy+ZIkq2cV4lLdM6PgtFSmo65XQq8Ya1Q4W3SIm9CdXERCtAP5NVyV2m2zGmQ8L
	 7KQX3LvQPHaeJ/jpb2MSzeDswRth8A2BqVMBSAjWmDid4TFTnI/HgrQwvILa+g+lHZ
	 2PalIrkFw1IKXNsVaMmZVFghb15Vofh9EMpKiM9M3GH2UsnDPz448TgrY4VxJejGkZ
	 DUvwyfe3pna6kiqDk9ONPWEmIevrTJDhs+RjqgZCxWRpmlIpWC0vOd5YTmLa7iIsUp
	 vyMGA0xYakBvh6unylLC77hTDwhbnk4illSMMi0ojJ4Qtyu4h1lBIesO2Jp3q9+k1r
	 RF1DlKEf/DMwA==
Date: Wed, 16 Aug 2023 12:28:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 07/11] xen: address MISRA C:2012 Rule 2.1
In-Reply-To: <e7e2eef0-5f88-e10e-81e3-57931f22f76a@suse.com>
Message-ID: <alpine.DEB.2.22.394.2308161221580.6458@ubuntu-linux-20-04-desktop>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com> <7f8cbd8c8ad64cd3a0d099f31cb4d3fad48aa63b.1690985045.git.nicola.vetrini@bugseng.com> <e2d71138-e714-3c19-d5b9-94b322a47191@suse.com> <alpine.DEB.2.22.394.2308031648340.2127516@ubuntu-linux-20-04-desktop>
 <3a6ab847-fd31-60e4-2558-feed71d670dd@suse.com> <b0581f49ac01c923809c0e15c1a1dfed@bugseng.com> <6e1dbf093687e5fa66295621ce67e4dc@bugseng.com> <2b26baf0-6a82-0bff-99b5-ade067e0d74d@suse.com> <c9197dca7802b08765c0b2b6800e548c@bugseng.com>
 <e7e2eef0-5f88-e10e-81e3-57931f22f76a@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Aug 2023, Jan Beulich wrote:
> On 16.08.2023 12:47, Nicola Vetrini wrote:
> > On 16/08/2023 12:31, Jan Beulich wrote:
> >> On 16.08.2023 12:01, Nicola Vetrini wrote:
> >>> On 08/08/2023 11:03, Nicola Vetrini wrote:
> >>>> On 04/08/2023 08:42, Jan Beulich wrote:
> >>>>> On 04.08.2023 01:50, Stefano Stabellini wrote:
> >>>>>> On Thu, 3 Aug 2023, Jan Beulich wrote:
> >>>>>>> On 02.08.2023 16:38, Nicola Vetrini wrote:
> >>>>>>>> Rule 2.1 states: "A project shall not contain unreachable code".
> >>>>>>>>
> >>>>>>>> The functions
> >>>>>>>> - machine_halt
> >>>>>>>> - maybe_reboot
> >>>>>>>> - machine_restart
> >>>>>>>> are not supposed to return, hence the following break statement
> >>>>>>>> is marked as intentionally unreachable with the
> >>>>>>>> ASSERT_UNREACHABLE()
> >>>>>>>> macro to justify the violation of the rule.
> >>>>>>>
> >>>>>>> During the discussion it was mentioned that this won't help with
> >>>>>>> release builds, where right now ASSERT_UNREACHABLE() expands to
> >>>>>>> effectively nothing. You want to clarify here how release builds
> >>>>>>> are to be taken care of, as those are what eventual certification
> >>>>>>> will be run against.
> >>>>>>
> >>>>>> Something along these lines:
> >>>>>>
> >>>>>> ASSERT_UNREACHABLE(), not only is used in non-release builds to
> >>>>>> actually
> >>>>>> assert and detect errors, but it is also used as a marker to tag
> >>>>>> unreachable code. In release builds ASSERT_UNREACHABLE() doesn't
> >>>>>> resolve
> >>>>>> into an assert, but retains its role of a code marker.
> >>>>>>
> >>>>>> Does it work?
> >>>>>
> >>>>> Well, it states what is happening, but I'm not convinced it 
> >>>>> satisfies
> >>>>> rule 2.1. There's then still code there which isn't reachable, and
> >>>>> which a scanner will spot and report.
> >>>>
> >>>> It's not clear to me whether you dislike the patch itself or the 
> >>>> commit
> >>>> message. If it's the latter, how about:
> >>>> "ASSERT_UNREACHABLE() is used as a marker for intentionally
> >>>> unreachable code, which
> >>>> constitutes a motivated deviation from Rule 2.1. Additionally, in
> >>>> non-release
> >>>> builds, this macro performs a failing assertion to detect errors."
> >>>
> >>> Any feedback on this (with one edit: s/a failing assertion/an
> >>> assertion/)
> >>
> >> The patch here is kind of okay, but I'm afraid I view my earlier 
> >> question
> >> as not addressed: How will the proposed change prevent the scanner from
> >> spotting issues here in release builds? Just stating in the description
> >> that there's a deviation is not going to help that.
> > 
> > There is a deviation already in place. At the moment it just ignores 
> > anything below an unreachable ASSERT_UNREACHABLE(), no matter what that 
> > macro will expand to.
> 
> What do you mean by "in place"? docs/misra/ has nothing, afaics. And
> automation/eclair_analysis/ECLAIR/deviations.ecl is merely filtering
> things out of reports, aiui. (Plus of course there should be a single
> central place where all deviations are recorded, imo.)

Jan has a point: I think we should record all our deviations and unique
ways to interpret the rules under docs/misra. And the Eclair
configuration should reflect that. It is not a good idea to only keep
the information in the Eclair config because, even if it is now upstream
in xen.git, it is still a tool-specific configuration file -- it is not
a proper document. MISRA C and its interpretation is important enough
that we should have a plain English document to cover it (which now is
docs/misra/rules.rst).

Nicola, I volunteer to send patches to make any necessary updates to
docs/misra/rules.rst and other docs. Please send out to me a list of
deviations/configurations and I'll make sure to reflect them under
docs/misra so that they are in sync.

Cheers,

Stefano

