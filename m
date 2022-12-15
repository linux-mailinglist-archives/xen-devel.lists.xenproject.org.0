Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2F764E197
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 20:09:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463729.721975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5tbD-0002OF-FE; Thu, 15 Dec 2022 19:08:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463729.721975; Thu, 15 Dec 2022 19:08:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5tbD-0002Kq-CK; Thu, 15 Dec 2022 19:08:55 +0000
Received: by outflank-mailman (input) for mailman id 463729;
 Thu, 15 Dec 2022 19:08:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+fpb=4N=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p5tbB-0002Kk-ES
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 19:08:53 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e88df649-7cab-11ed-91b6-6bf2151ebd3b;
 Thu, 15 Dec 2022 20:08:51 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 8CF7FCE1CB3;
 Thu, 15 Dec 2022 19:08:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C8BFC433EF;
 Thu, 15 Dec 2022 19:08:44 +0000 (UTC)
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
X-Inumbo-ID: e88df649-7cab-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671131324;
	bh=SbnKf379X6hx4c3Xe//u1cqWgsCG/AuWvbEOTKyfyt0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Pcz9HiQswhbnMOAMUxPtC7mFtmE31Y0w9eQcl9rG4yEtrXL4yEEdJRPR4Ym9widV1
	 dwOkSAdc1iSO4RCLgNx3x6onv/G6YJQaXf8ccCuwKTLUbVl7sDtkfkM4B4dYhUWdct
	 78yjt4yk8XpkN5Y9sqPt/yjWsiDW2kJT5fyqXFcr/HqjCbzDEDptSleUvnJat1fxfy
	 PwyZTQlJlyhfQzDoUzqHg5vOj1WruiA3TRBhzfP8hGY5wfh6Mw6iBfQty/7gFYLPoH
	 +Q6vwJWKJRF/aEZQoyAUY2K5FKngxZHt5ssloO905oVUA+SlAF49IVjSvvDj4WNNtK
	 Z/oG+GNpLloOg==
Date: Thu, 15 Dec 2022 11:08:42 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Michal Orzel <michal.orzel@amd.com>, sstabellini@kernel.org, 
    xen-devel@lists.xenproject.org
Subject: Re: [XTF-ARM] tests: Hypercall xen_version testing
In-Reply-To: <58a87888-e839-8a5d-0e7f-7520e5e2c78a@suse.com>
Message-ID: <alpine.DEB.2.22.394.2212151106030.315094@ubuntu-linux-20-04-desktop>
References: <20221215152511.10194-1-michal.orzel@amd.com> <58a87888-e839-8a5d-0e7f-7520e5e2c78a@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 15 Dec 2022, Jan Beulich wrote:
> On 15.12.2022 16:25, Michal Orzel wrote:
> > Add a new test hyp-xen-version to perform functional testing of
> > xen_version hypercall. Check the following commands (more can be added
> > later on):
> >  - XENVER_version,
> >  - XENVER_extraversion,
> >  - XENVER_compile_info,
> >  - XENVER_changeset
> >  - XENVER_get_features,
> >  - passing invalid command.
> > 
> > For now, enable this test only for arm64.
> 
> What's wrong with exposing this uniformly?

Actually the tests are not arm64 specific. Michal, I think you should
remove the comment above from the commit message. (What/if/when gets
enabled as a test in gitlab-ci is a different matter.)


> > --- /dev/null
> > +++ b/tests/hyp-xen-version/main.c
> > @@ -0,0 +1,105 @@
> > +/**
> > + * @file tests/hyp-xen-version/main.c
> > + * @ref test-hyp-xen-version
> > + *
> > + * @page test-hyp-xen-version Hypercall xen_version
> > + *
> > + * Functional testing of xen_version hypercall.
> > + *
> > + * @see tests/hyp-xen-version/main.c
> > + */
> > +#include <xtf.h>
> > +
> > +const char test_title[] = "Hypercall xen_version testing";
> > +
> > +#define INVALID_CMD -1
> > +
> > +void test_main(void)
> > +{
> > +    int ret;
> > +
> > +    printk("Checking XENVER_version:\n");
> > +    {
> > +        /*
> > +        * Version is returned directly in format: ((major << 16) | minor),
> > +        * so no need to check the return value for an error.
> > +        */
> > +        ret = hypercall_xen_version(XENVER_version, NULL);
> > +        printk(" version: %u.%u\n", ret >> 16, ret & 0xFFFF);
> > +    }
> > +
> > +    printk("Checking XENVER_extraversion:\n");
> > +    {
> > +        xen_extraversion_t xen_ev;
> > +        memset(&xen_ev, 0, sizeof(xen_ev));
> > +
> > +        ret = hypercall_xen_version(XENVER_extraversion, xen_ev);
> > +        if ( ret < 0 )
> > +            return xtf_error("Error %d\n", ret);
> 
> This, ...
> 
> > +        printk(" extraversion: %s\n", xen_ev);
> > +    }
> > +
> > +    printk("Checking XENVER_compile_info:\n");
> > +    {
> > +        xen_compile_info_t xen_ci;
> > +        memset(&xen_ci, 0, sizeof(xen_ci));
> > +
> > +        ret = hypercall_xen_version(XENVER_compile_info, &xen_ci);
> > +        if ( ret < 0 )
> > +            return xtf_error("Error %d\n", ret);
> 
> ... this, and ...
> 
> > +        printk(" compiler:       %s\n", xen_ci.compiler);
> > +        printk(" compile_by:     %s\n", xen_ci.compile_by);
> > +        printk(" compile_domain: %s\n", xen_ci.compile_domain);
> > +        printk(" compile_date:   %s\n", xen_ci.compile_date);
> > +    }
> > +
> > +    printk("Checking XENVER_changeset:\n");
> > +    {
> > +        xen_changeset_info_t xen_cs;
> > +        memset(&xen_cs, 0, sizeof(xen_cs));
> > +
> > +        ret = hypercall_xen_version(XENVER_changeset, &xen_cs);
> > +        if ( ret < 0 )
> > +            return xtf_error("Error %d\n", ret);
> 
> ... this can fail because of XSM denying access. (Others can of course
> also fail for this reason, but here possible failure is kind of
> "intended" - see the dummy xsm_xen_version() handling.) Therefore I
> would like to suggest that you also special case getting back -EPERM,
> resulting in e.g. just a warning instead of an error.
> 
> Jan
> 

