Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3300E74B8AB
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 23:29:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560620.876677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHt0n-0005kq-JR; Fri, 07 Jul 2023 21:29:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560620.876677; Fri, 07 Jul 2023 21:29:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHt0n-0005iY-Fm; Fri, 07 Jul 2023 21:29:09 +0000
Received: by outflank-mailman (input) for mailman id 560620;
 Fri, 07 Jul 2023 21:29:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RURV=CZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qHt0l-0005iS-Vy
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 21:29:07 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bfe0948-1d0d-11ee-8611-37d641c3527e;
 Fri, 07 Jul 2023 23:29:05 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AF01061A6A;
 Fri,  7 Jul 2023 21:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA6AC433C7;
 Fri,  7 Jul 2023 21:29:00 +0000 (UTC)
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
X-Inumbo-ID: 4bfe0948-1d0d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688765343;
	bh=d5NOVVaDpDJCqUoxq7NTfcFqX3hnalLCUq9tajdQa5w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZCY7Eb8AAccCy4pQGfOqTN/Yl0n7Sw099sJOWjHAz9eaMlF1V9rU5spkWj7SJ1i0f
	 9N3joq9l5Tb7sdkl0t9QaSZHg6x/hcpfaz+U13hvAkQ3lDdjgWnlBc4/I0Wr5iTJED
	 hSC6LEoVJjQdzkr6xz2sw7PptAeJD12mZD9H9+UVw69JYNPp/hCdAQDbRh81KwjNVT
	 jiZlFok/wJkGLjIrADC6IDOyX7iUrcBjNZ1s5VkJE8Z3RsLhIP6cnGHM/OUc0gIe6u
	 Ga84HJMhlQOyXNqg6EJO+eIRn51uyMUUcRD2j969xFE8RUT2tUlXBLT7xgCOkIk2OT
	 0+75S3dJAfwcA==
Date: Fri, 7 Jul 2023 14:28:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Federico Serafini <federico.serafini@bugseng.com>, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, 
    Tamas K Lengyel <tamas@tklengyel.com>, 
    Alexandru Isaila <aisaila@bitdefender.com>, 
    Petre Pircalabu <ppircalabu@bitdefender.com>, 
    Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2] x86: make function declarations consistent with
 definitions
In-Reply-To: <e6fb3b99-d59a-eceb-024a-8b791ef20129@suse.com>
Message-ID: <alpine.DEB.2.22.394.2307071425040.761183@ubuntu-linux-20-04-desktop>
References: <1b2d5be30c0e4f335e59dce6e7c001cb0805d702.1688465215.git.federico.serafini@bugseng.com> <a16cdb60-1307-636e-1473-e5388e8f79d9@suse.com> <alpine.DEB.2.22.394.2307051604380.761183@ubuntu-linux-20-04-desktop> <2c7d71cb-067d-8dac-3ee4-3af42b2756f3@suse.com>
 <alpine.DEB.2.22.394.2307061506560.761183@ubuntu-linux-20-04-desktop> <e6fb3b99-d59a-eceb-024a-8b791ef20129@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 7 Jul 2023, Jan Beulich wrote:
> On 07.07.2023 00:29, Stefano Stabellini wrote:
> > On Thu, 6 Jul 2023, Jan Beulich wrote:
> >> On 06.07.2023 01:22, Stefano Stabellini wrote:
> >>> On Tue, 4 Jul 2023, Jan Beulich wrote:
> >>>> On 04.07.2023 12:23, Federico Serafini wrote:
> >>>>> Change mechanically the parameter names and types of function
> >>>>> declarations to be consistent with the ones used in the corresponding
> >>>>> definitions so as to fix violations of MISRA C:2012 Rule 8.3 ("All
> >>>>> declarations of an object or function shall use the same names and type
> >>>>> qualifiers") and MISRA C:2012 Rule 8.2 ("Function types shall be in
> >>>>> prototype form with named parameters").
> >>>>>
> >>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> >>>>
> >>>> On top of my earlier remark (when this was part of a series):
> >>>
> >>> I am not addressing specifically this comment. I am trying to build a
> >>> common understanding on how to do things so that we can go faster in the
> >>> future.
> >>>
> >>> In general, as discussed at Xen Summit, in order to successfully merge
> >>> large numbers of changes in the coming weeks we should try to keep
> >>> mechanical changes mechanical. Separate non-mechanical changes into
> >>> different patches.
> >>>
> >>> This patch is large but mechanical. If I understand you correctly, you
> >>> are asking:
> >>> 1) to split the patch into smaller patches
> >>> 2) make a couple of non-mechanical changes described below
> >>>
> >>>
> >>> For 1), in my opinion it is not necessary as long as all changes remain
> >>> mechanical. If some changes are not mechanical they should be split out.
> >>> So if you are asking non-mechanical changes in 2), then 2) should be
> >>> split out but everything else could stay in the same patch.
> >>>
> >>> If you'd still like the patch to be split, OK but then you might want to
> >>> suggest exactly how it should be split because it is not obvious: all
> >>> changes are similar, local, and mechanical. I for one wouldn't know how
> >>> you would like this patch to be split.
> >>
> >> So I gave a clear reason and guideline how to split: To reduce the Cc
> >> list of (because of requiring fewer acks for) individual patches, and
> >> to separate (possibly) controversial from non-controversial changes.
> >> This then allows "easy" changes to go in quickly.
> >>
> >> I realize that what may be controversial may not always be obvious,
> >> but if in doubt this can be addressed in a v2 by simply omitting such
> >> changes after a respective comment was given (see also below).
> > 
> > So the guideline is to separate by maintainership, e.g.
> > x86/arm/common/vpci
> > 
> > Also separate out anything controversial and/or that receives feedback
> > so it is not mechanical/straightforward anymore.
> > 
> > 
> >>> For 2), I would encourage you to consider the advantage of keeping the
> >>> changes as-is in this patch, then send out a patch on top the way you
> >>> prefer. That is because it costs you more time to describe how you
> >>> would like these lines to be changed in English and review the full
> >>> patch a second time, than change them yourself and anyone could ack them
> >>> (feel free to CC me).
> >>>
> >>> For clarity: I think it is totally fine that you have better suggestions
> >>> on parameter names. I am only pointing out that providing those
> >>> suggestions as feedback in an email reply is not a very efficient way to
> >>> get it done.
> >>
> >> What you suggest results in the same code being touched twice to
> >> achieve the overall goal (satisfy Misra while at the same time not
> >> making the code any worse than it already is). I'd like to avoid this
> >> whenever possible, so my preference would be that if the English
> >> description isn't clear, then the respective change would best be
> >> omitted (and left to be addressed separately).
> > 
> > Yes, I think that would work. Basically the process could look like
> > this:
> > 
> > - contributor sends out a patch with a number of mechanical changes
> > - reviewer spots a couple of things better done differently
> > - reviewer replies with "drop this change, I'll do it" no further
> >   explanation required
> > - in parallel: contributor sends out v2 without those changes for the
> >   reviewer to ack
> > - in parallel: reviewer sends out his favorite version of the changes
> >   for anyone to ack (assuming he is the maintainer)
> 
> For this last point, I don't see it needing to happen in parallel.
> Reviewers may be busy with other things, and making less mechanical
> changes can easily be done a little later. The overall count of
> violations is still going to decrease.

OK. Another suggestion along these lines is that if a revision of a
patch is OK except for 2 changes, those 2 changes could be removed on
commit to avoid another re-submit and re-review.

E.g. a patch has 50 fixes. 2 of these fixes are wrong, the rest are OK.
The maintainer/committer commits the patch with 48 fixes, removing the 2
unwanted fixes.

Keep in mind that resubmissions of these MISRA C patches also cause more
work for the reviewers/maintainers. I think we should try to find ways
to decrease the overall workload of everyone involved.

