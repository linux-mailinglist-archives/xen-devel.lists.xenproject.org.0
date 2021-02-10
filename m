Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 165C2315C56
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 02:35:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83466.155419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9ePY-0003e4-4I; Wed, 10 Feb 2021 01:35:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83466.155419; Wed, 10 Feb 2021 01:35:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9ePY-0003di-0A; Wed, 10 Feb 2021 01:35:20 +0000
Received: by outflank-mailman (input) for mailman id 83466;
 Wed, 10 Feb 2021 01:35:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QmaB=HM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l9ePV-0003db-LA
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 01:35:17 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d5438f9-8055-46e4-a32b-c0e81475d5d7;
 Wed, 10 Feb 2021 01:35:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5262464E2A;
 Wed, 10 Feb 2021 01:35:15 +0000 (UTC)
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
X-Inumbo-ID: 4d5438f9-8055-46e4-a32b-c0e81475d5d7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612920915;
	bh=duFbnubRBWp9pCDRE9Yfg3IIB1zSpihTESixzeHBrqo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BWvruVB7h+PLgyKaiBTXSMFzb/5Sv0Xh5g+5tXtCpFDA/93/my6TSKZj5aVYBM3sS
	 JHyaCdD4Bh1Fm695Yp10Twjj21mCZ3AbT/UqYOVfCCSVzOmdBiDbphiPFCnnnDbr7Q
	 0e431xHqkcZC9uQ9V9ChZvFS0/AXb4FHIBgqiEP6ezIF21eabxF5qfJpZyFm03d5i5
	 b/Guzx/1z3DLwAX6LxZx/6t91g4gvD9vbdCeNS4WeJbuebfDCJkvKUC8SUNEFfeNui
	 6J3+Qlc6P3b7fguGJKQMVvc5aTCGKbr/ZpIioLmNrrSCn22fBExcb0o8LzVZnX7jlc
	 lBrd7bgUGVroQ==
Date: Tue, 9 Feb 2021 17:35:14 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall.oss@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
    lucmiccio@gmail.com, xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Rahul Singh <Rahul.Singh@arm.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping
In-Reply-To: <CAJ=z9a0fDYccxTDkpvmG77D-havkySuYOUK4MSYvpZw4EL9oGg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2102091724100.8948@sstabellini-ThinkPad-T480s>
References: <20210208184932.23468-1-sstabellini@kernel.org> <173ed75a-94cf-26a5-9271-a687bf201578@xen.org> <alpine.DEB.2.21.2102081214010.8948@sstabellini-ThinkPad-T480s> <4df687cb-d3bc-ccb8-4e7c-a6429c37574e@suse.com> <24610.38467.808678.941320@mariner.uk.xensource.com>
 <alpine.DEB.2.21.2102090914280.8948@sstabellini-ThinkPad-T480s> <CAJ=z9a0fDYccxTDkpvmG77D-havkySuYOUK4MSYvpZw4EL9oGg@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 9 Feb 2021, Julien Grall wrote:
> On Tue, 9 Feb 2021 at 17:31, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >
> > On Tue, 9 Feb 2021, Ian Jackson wrote:
> > > Jan Beulich writes ("Re: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping"):
> > > > On 08.02.2021 21:24, Stefano Stabellini wrote:
> > > ...
> > > > > For these cases, I would just follow a simple rule of thumb:
> > > > > - is the submitter willing to provide the backport?
> > > > > - is the backport low-risk?
> > > > > - is the underlying bug important?
> > > > >
> > > > > If the answer to all is "yes" then I'd go with it.
> > > >
> > > > Personally I disagree, for the very simple reason of the question
> > > > going to become "Where do we draw the line?" The only non-security
> > > > backports that I consider acceptable are low-risk changes to allow
> > > > building with newer tool chains. I know other backports have
> > > > occurred in the past, and I did voice my disagreement with this
> > > > having happened.
> > >
> > > I think I take a more relaxed view than Jan, but still a much more
> > > firm line than Stefano.  My opinion is that we should make exceptions
> > > for only bugs of exceptional severity.
> > >
> > > I don't think I have seen an argument that this bug is exceptionally
> > > severe.
> > >
> > > For me the fact that you can only experience this bug if you upgrade
> > > the hardware or significantly change the configuration, means that
> > > this isn't so serious a bug.
> >
> > Yeah, I think that's really the core of this issue. If somebody is
> > already using 4.12 happily, there is really no reason for them to take
> > the fix. If somebody is about to use 4.12, then it is a severe issue.
> 
> If somebody is about to use 4.12, then it is most likely going to
> encounter a serious blocker as there is no support for generic SMMU
> bindings. I would be surprised if there are a lot of DT still using
> the old bindings, at which point such users would want to switch to
> 4.15 + your patches to add support.
> 
> >
> > The view of the group is that nobody should be switching to 4.12 now
> > because there are newer releases out there. I don't know if that is
> > true.
> 
> This is mostly based on the definition of supported vs security
> supported. When a tree is only security supported, then there is no
> promise the code will run on any systems.
> 
> >
> > I didn't realize we had a policy or even a recommendation of always
> > choosing the latest among the many releases available with
> > security-support. I went through the website and SUPPORT.md but couldn't
> > find it spelled out anywhere. See:
> 
> May I ask, what sort of users would want to start a
> development/product based on a soon to be abandoned version?
> 
> For any new development, I have always advised to switch to the latest
> Xen (or at least stable) because it will contain the latest fixes,
> features, and better support because the code is still in mind...

I don't have an answer -- I hope nobody.


> > https://xenproject.org/downloads/
> > https://xenproject.org/downloads/xen-project-archives/xen-project-4-12-series/
> > https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=SUPPORT.md;h=52f25fa85af41fa3b38288ab7e172408b77dc779;hb=97b7b5567fba6918a656ad349051b5343b5dea2e
> >
> > At most we have:
> >
> >     Supported-Until: 2020-10-02
> >     Security-Support-Until: 2022-04-02
> >
> > Anecdotally, if I go to https://www.kernel.org/ to download a kernel
> > tarball, I expect all tarballs to have all the major functionalities. I
> > wouldn't imagine that I cannot get one entire Linux subsystem (e.g.
> > ethernet or SATA) to work if I don't pick the latest.
> 
> I think this is an unrealistic expectation... You can't pick any
> version of stable Linux and expect it to work on your shiny HW. There
> might be missing drivers, workaround (including in core subsystems)...

I don't mean to insist as of course I accept the group decision and I
don't care about 4.12 that much (we don't use it as Xilinx). But this is
not about new hardware. This regression affects old hardware too. So yes
if an old Linux version worked on my HW I expect any of the slightly
newer (but still old) tarballs on kernel.org to work on the same HW.
That said I noticed that kernel.org seems to have only supported
releases on https://www.kernel.org/, while we have a mix.


> > Maybe it would make sense to clarify which releases are discouraged from
> > being used on https://xenproject.org/downloads/ at least?
> 
> Feel free to suggest a wording that can be discussed here.

Distinguishing between supported and not supported releases would be a
start. Maybe with a one line statement to recommend people to always use
supported (not just security-supported, fully supported) releases.

