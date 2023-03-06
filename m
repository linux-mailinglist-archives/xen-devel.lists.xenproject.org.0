Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B83C26AD27F
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 00:04:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507144.780363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZJrA-0001Hh-77; Mon, 06 Mar 2023 23:03:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507144.780363; Mon, 06 Mar 2023 23:03:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZJrA-0001Fv-3u; Mon, 06 Mar 2023 23:03:00 +0000
Received: by outflank-mailman (input) for mailman id 507144;
 Mon, 06 Mar 2023 23:02:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xk/k=66=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pZJr8-0001Fp-IU
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 23:02:58 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07e339a1-bc73-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 00:02:56 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 42419B81154;
 Mon,  6 Mar 2023 23:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18799C433EF;
 Mon,  6 Mar 2023 23:02:52 +0000 (UTC)
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
X-Inumbo-ID: 07e339a1-bc73-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678143773;
	bh=vy3V0D7o7wM6521UIemzfQvh1AgtozXFDqA/cvx/wv0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZheD85apitOFWjvrelm/LL6hEIIVi+8acz8dQjw+frVtH2ZxcilfPfBWeiCC0g7bu
	 8P14GCcPYY95ZWEIFMorjUsQ9torMbx4m+ABXMuY4RYG1lx7BLTHH515H1+GnVqXqm
	 0O677rOOj0i+Z9ZS7hwcRPiapGlJ66QA79W+hxBPQqgovqPKowW0ozFxlAoM24gctK
	 84vt8QzbXtMX+29vViWWrZpX4A7aU5X0X2ZhIbnFPcW3czzkhq1Jw+zQhe9lkqPdjU
	 zVOIk2ayqByb47WpRPVzaagkIgQzA1KzCvXsE4eoDM3JPt/D883XXu5NVsIckxmhqM
	 7PPM8FLD2HLCg==
Date: Mon, 6 Mar 2023 15:02:51 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, cardoe@cardoe.com, michal.orzel@amd.com, 
    Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH v2 2/2] automation: introduce a dom0less test run on
 Xilinx hardware
In-Reply-To: <290dec66-c5a5-0609-f95f-7e3bcfd3fc94@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2303061450530.863724@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2303031554080.863724@ubuntu-linux-20-04-desktop> <20230303235719.1181690-2-sstabellini@kernel.org> <290dec66-c5a5-0609-f95f-7e3bcfd3fc94@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 6 Mar 2023, Andrew Cooper wrote:
> On 03/03/2023 11:57 pm, Stefano Stabellini wrote:
> > +  only:
> > +    variables:
> > +      - $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
> 
> We don't want to protect every branch of a tree that only a select
> number of people can push to,

Actually this is useful, more on this below


> nor (for this, or others configured with
> the runner), want to impose branching conventions on them.
> 
> In all anticipated cases, those able to push would also be able to
> reconfigure the protected-ness of branches, so this doesn't gain us any
> security I don't think, but it certainly puts more hoops in the way to
> be jumped through.

It is true that it adds a small inconvenience to the user, but I think
the benefits outweigh the inconvenience at the moment (that could change
though.)

With this, I can register the gitlab runner with a specific gitlab
project (for instance
https://gitlab.com/xen-project/people/sstabellini/xen) then I can mark
all branches as "protected" and select very specific access permissions,
e.g. I can give individual access to Julien, Bertrand, Michal, anyone,
to specific branches, which is great to allow them to run individual
pre-commit tests permanently or temporarily.

I couldn't find another way to do it at the moment, as non-protected
branches don't come with detailed access permissions. But it is possible
that as we setup a new sub-group under https://gitlab.com/xen-project
for people with access to the runner, then we might be able to remove
this restriction because it becomes unnecessary. We can remove the
protected check at that point.

