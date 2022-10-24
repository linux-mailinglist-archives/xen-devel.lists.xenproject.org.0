Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1054E60BC96
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 23:56:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429411.680379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on5QM-0003TX-7i; Mon, 24 Oct 2022 21:55:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429411.680379; Mon, 24 Oct 2022 21:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on5QM-0003Rh-4p; Mon, 24 Oct 2022 21:55:58 +0000
Received: by outflank-mailman (input) for mailman id 429411;
 Mon, 24 Oct 2022 21:55:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vZoK=2Z=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1on5QL-0003Rb-6P
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 21:55:57 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a28dded7-53e6-11ed-91b5-6bf2151ebd3b;
 Mon, 24 Oct 2022 23:55:55 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 06216B80D69;
 Mon, 24 Oct 2022 21:55:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A329EC433D6;
 Mon, 24 Oct 2022 21:55:49 +0000 (UTC)
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
X-Inumbo-ID: a28dded7-53e6-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666648550;
	bh=NYGxCRzxfM+0SHWVqqDieMTwmG9V0rHis3PBlohkpoQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RjgLhq/MjT7ZWgcxGX2JWjjgODDDFXgC1XFWFSv2ObpciwF9WMoHSKfPjI5B/Z3cU
	 vvyJObiI/P2bKW8R1wF95AfG1OhTSzB+DX2Ujfzmo4JkimOt13ILu63Qa/x7keRKND
	 U0u68CsYHE+UvUWl/NC3LRgr0GMgCLN+BZCGQf0klySv+J9a+RYRJ0i5ABNTnILcSV
	 9IIISXp45A/p+06LAldBJztuHADOAha1SMm7cdkvwENa1DdaISJSiblHLK8u4gSzAV
	 aEz+w/6xQm9Vb6ZxRUA2PxmS3Kdf4AqltRjMiTY3M1F3O3JqavhywxMS0UttYAhFIy
	 ipRFps05MHPfg==
Date: Mon, 24 Oct 2022 14:55:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Doug Goldstein <cardoe@cardoe.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [for-4.17] automation: Do not use null scheduler for boot cpupools
 test
In-Reply-To: <76b7f236-f99d-7600-3958-6a92943b564c@amd.com>
Message-ID: <alpine.DEB.2.22.394.2210241455240.1151068@ubuntu-linux-20-04-desktop>
References: <20221021165341.7905-1-michal.orzel@amd.com> <b1f7c77b-6e39-85e9-074e-0e31ed9648db@citrix.com> <alpine.DEB.2.22.394.2210211211090.3873@ubuntu-linux-20-04-desktop> <76b7f236-f99d-7600-3958-6a92943b564c@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Oct 2022, Michal Orzel wrote:
> Replying to all,
> 
> On 21/10/2022 21:36, Stefano Stabellini wrote:
> > 
> > 
> > On Fri, 21 Oct 2022, Andrew Cooper wrote:
> >> On 21/10/2022 17:53, Michal Orzel wrote:
> >>> Null scheduler is not enabled on non-debug Xen builds so the current
> >>> test can lead to a failure on such jobs. We still want to test that we
> >>> can assign the cpupool to a domU with a different scheduler than default
> >>> one (credit2). Switch to credit as it is enabled by default.
> >>>
> >>> Fixes: 36e3f4158778 ("automation: Add a new job for testing boot time cpupools on arm64")
> >>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> >>
> >> /sigh - I'm sure I nacked that stupidity to begin with.  apparently not...
> >>
> >> It is totally bogus for CONFIG_DEBUG to influence logical chunks of
> >> functionality like this.  The CI script is good in its current form.
> >>
> >> RTDS and ARINC should be default n.
> >>
> >> NULL is more tricky.  PV_SHIM is explicitly security supported, and has
> >> been for years, so the "UNSUPPORTED" is bogus, whatever the default is.
> >>
> >> As NULL is explicitly tested in CI, it's clearly supported, and probably
> >> ought to be on default.
> >>
> >>
> >> Please instead fix Kconfig to not be broken.  That will be a far better
> >> fix overall for people.
> >>
> >> As a more general note, tests which are using non-default pieces of
> >> logic ought to activate them explicitly.
> > 
> > 
> > I agree with you, but first let me clarify the word "supported".
> > 
> > 
> > In Xen Project "supported" implies extra efforts to follow the security
> > process and of course the security team should be on board with it. If
> > we say "supported, non security supported" we don't need to follow the
> > security process but still we sign up for backporting fixes to the
> > stable tree. It is less extra effort but still some extra effort is
> > involved.
> > 
> > So, this specific issue aside, I think that as we expand the testing
> > capabilities of gitlab-ci, we'll have tests for things that are not
> > necessarily neither "supported" nor "supported, non security supported".
> > 
> > 
> > For the NULL scheduler, it is clearly important to many users so it
> > would be valuable to move it to "supported, non security supported" and
> > enabling it by default in the build. I don't recall if we still have any
> > known outstanding issues with it. I think we need a separate email
> > thread for that discussion and I would understand if the decision is not
> > to change NULL support status for the 4.17 release (maybe for the 4.18
> > release?).
> > 
> > 
> > In any case, we don't need CONFIG_DEBUG to enable CONFIG_UNSUPPORTED. It
> > is just that UNSUPPORTED and NULL don't get enabled by default in the
> > non-DEBUG build. So to fix gitlab-ci, we can simply enable
> > CONFIG_UNSUPPORTED explicitly for the builds where we need it
> > (alpine-3.12-gcc-arm64-boot-cpupools).
> 
> Given that there are still diverging opinions \wrt making use of DEBUG
> to influence enabling/disabling some functionalities in the code, I would
> opt for modifying the CI job to explicitly specify the required config options,
> just like I did for static-mem test. The necessary options to enable NULL are:
> CONFIG_EXPERT=y
> CONFIG_UNSUPPORTED=y
> CONFIG_SCHED_NULL=y
> 
> This will fix the issue and allow us to continue with 4.17 release.
> Given the outstanding issues reported by Julien, it would be challenging to
> try to mark the NULL scheduler as supported, not security supported for this release.

Yes, sounds good


> Besides that, I think that Andrew still has a valid point. We seem to use DEBUG
> only in Kconfig.debug (obvious choice) and sched/Kconfig. So this is not something
> common to rely on DEBUG to enable logical functionalities (why did we make this exception for schedulers?).
> Having said that, I think the discussion on whether to switch to default n
> instead of default DEBUG or not is still valid and requires more people to give feedback.

Yeah

