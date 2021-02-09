Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7198131551F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 18:31:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83360.154934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Wqu-0005Aj-GP; Tue, 09 Feb 2021 17:31:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83360.154934; Tue, 09 Feb 2021 17:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Wqu-0005AJ-BV; Tue, 09 Feb 2021 17:31:04 +0000
Received: by outflank-mailman (input) for mailman id 83360;
 Tue, 09 Feb 2021 17:31:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SKhV=HL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l9Wqt-0005AE-6F
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:31:03 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 284dad74-7b50-4d07-ad37-4336d2027047;
 Tue, 09 Feb 2021 17:31:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D0AA64E9C;
 Tue,  9 Feb 2021 17:31:01 +0000 (UTC)
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
X-Inumbo-ID: 284dad74-7b50-4d07-ad37-4336d2027047
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612891861;
	bh=hq6J9tfSw0+QitLzOO0NVNYl77fkpxulMT4itRqF76I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YjVSlOvxmNRdER0ncyndrl+iC187QTGWt/Vyj2JZI8y5KrW4sYP5n0xxVuPHzGYG1
	 5av8MFKE8ER91TnowTalpQsEcbkO3LLLNFnyxDVT0sZGPup1RY+/30Oj7pbjOrksox
	 7cWBkhNkKrhpaPkPu5kJqDu27qLZ5qKMZGeQZgWf76G9sRwgZ9IWJYjcT/uvlfeVKf
	 CZHb8OeZ3CqEOk3uH6nyWaNTxz8qMkbhD2MtTUyJ9zBtRJsBzbwBlGmxxwMcyl0QRO
	 ergIA6fahhnkI921e8VcVFvgSgw3RExaae7C2qXT/R+OCCRuI8Hjqo8c5N05fJ2jxb
	 eb/PBToLuwDuw==
Date: Tue, 9 Feb 2021 09:31:00 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Ian Jackson <iwj@xenproject.org>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    lucmiccio@gmail.com, xen-devel@lists.xenproject.org, 
    Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com, Rahul.Singh@arm.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    George.Dunlap@citrix.com
Subject: Re: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping
In-Reply-To: <24610.38467.808678.941320@mariner.uk.xensource.com>
Message-ID: <alpine.DEB.2.21.2102090914280.8948@sstabellini-ThinkPad-T480s>
References: <20210208184932.23468-1-sstabellini@kernel.org> <173ed75a-94cf-26a5-9271-a687bf201578@xen.org> <alpine.DEB.2.21.2102081214010.8948@sstabellini-ThinkPad-T480s> <4df687cb-d3bc-ccb8-4e7c-a6429c37574e@suse.com>
 <24610.38467.808678.941320@mariner.uk.xensource.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 9 Feb 2021, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping"):
> > On 08.02.2021 21:24, Stefano Stabellini wrote:
> ...
> > > For these cases, I would just follow a simple rule of thumb:
> > > - is the submitter willing to provide the backport?
> > > - is the backport low-risk?
> > > - is the underlying bug important?
> > > 
> > > If the answer to all is "yes" then I'd go with it.
> > 
> > Personally I disagree, for the very simple reason of the question
> > going to become "Where do we draw the line?" The only non-security
> > backports that I consider acceptable are low-risk changes to allow
> > building with newer tool chains. I know other backports have
> > occurred in the past, and I did voice my disagreement with this
> > having happened.
> 
> I think I take a more relaxed view than Jan, but still a much more
> firm line than Stefano.  My opinion is that we should make exceptions
> for only bugs of exceptional severity.
> 
> I don't think I have seen an argument that this bug is exceptionally
> severe.
> 
> For me the fact that you can only experience this bug if you upgrade
> the hardware or significantly change the configuration, means that
> this isn't so serious a bug.

Yeah, I think that's really the core of this issue. If somebody is
already using 4.12 happily, there is really no reason for them to take
the fix. If somebody is about to use 4.12, then it is a severe issue.

The view of the group is that nobody should be switching to 4.12 now
because there are newer releases out there. I don't know if that is
true.

I didn't realize we had a policy or even a recommendation of always
choosing the latest among the many releases available with
security-support. I went through the website and SUPPORT.md but couldn't
find it spelled out anywhere. See:

https://xenproject.org/downloads/
https://xenproject.org/downloads/xen-project-archives/xen-project-4-12-series/
https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=SUPPORT.md;h=52f25fa85af41fa3b38288ab7e172408b77dc779;hb=97b7b5567fba6918a656ad349051b5343b5dea2e

At most we have:

    Supported-Until: 2020-10-02
    Security-Support-Until: 2022-04-02

Anecdotally, if I go to https://www.kernel.org/ to download a kernel
tarball, I expect all tarballs to have all the major functionalities. I
wouldn't imagine that I cannot get one entire Linux subsystem (e.g.
ethernet or SATA) to work if I don't pick the latest.

Maybe it would make sense to clarify which releases are discouraged from
being used on https://xenproject.org/downloads/ at least?

