Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2092C42AE13
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 22:43:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207641.363524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maOba-0008TN-67; Tue, 12 Oct 2021 20:42:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207641.363524; Tue, 12 Oct 2021 20:42:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maOba-0008QF-26; Tue, 12 Oct 2021 20:42:34 +0000
Received: by outflank-mailman (input) for mailman id 207641;
 Tue, 12 Oct 2021 20:42:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SIAI=PA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1maObY-0008Q9-VI
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 20:42:33 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb9d4350-2b9c-11ec-8151-12813bfff9fa;
 Tue, 12 Oct 2021 20:42:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id ED49B60E0C;
 Tue, 12 Oct 2021 20:42:29 +0000 (UTC)
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
X-Inumbo-ID: eb9d4350-2b9c-11ec-8151-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634071350;
	bh=bfRCIu6SeVZsFtzUcyP2gwhu7cAa5z6kDeSJeg7yVHw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Bm1qheDirlh5KoNcdvI8srwjFRuQKnO/7WhdifTvgrhM22rdbRKthmrHH5r0tFVBr
	 fuzXrNCcIEImQtbJOXDUpjjifwzQP3ILqHdeJ/iKfqdLku3SW71VeCLYHyr4rR/NML
	 8RRQNhBJUbetY3sTl92sbWfDBz43ZSITBKsM26McDrtCSVc2E1N5iHQcTRcRgCc9to
	 EV+VFvpBx7l9y/0Hzw3mcJGk3uEBwTA7LUqJolWjoozJbf9nMq+ZUpPd9TXM+Pf52K
	 0bd4nhGMs+Mh15SRciuwWtQ6xOx5CWzUVdzmHZP/7obDzMZChVeqvZzXf1B4jvXppR
	 FqzDXSRlUFODw==
Date: Tue, 12 Oct 2021 13:42:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Ian Jackson <iwj@xenproject.org>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    Rahul Singh <Rahul.Singh@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andre  Przywara <Andre.Przywara@arm.com>, Wei Liu <wl@xen.org>, 
    Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
In-Reply-To: <24933.47094.43672.782143@mariner.uk.xensource.com>
Message-ID: <alpine.DEB.2.21.2110121319150.9408@sstabellini-ThinkPad-T480s>
References: <cover.1633540842.git.rahul.singh@arm.com> <d292392268df2c74c4103a82ef917072643407a8.1633540842.git.rahul.singh@arm.com> <YWQkblfNMYEs6jI9@MacBook-Air-de-Roger.local> <77CF7FA5-C566-469E-B4A8-0400789890BB@arm.com> <YWQ6Nk3Jk+BqgkwZ@MacBook-Air-de-Roger.local>
 <53AE6E2A-01D7-41EC-9B2C-C0D596EB8D4D@arm.com> <YWRCxXGQIyTOAepC@MacBook-Air-de-Roger.local> <FEF0B03A-5AC8-4F8D-B821-191AC2EF8295@arm.com> <ac6d4785-ac9a-4491-26bb-c66ffe82c55b@suse.com> <ED8FC92F-B5EF-4473-B4A9-641C7D44859F@arm.com>
 <0744b957-1832-dff2-9ae2-b8e8534f501b@suse.com> <c3952fd5-b893-4cb6-a9bc-325a89e859db@epam.com> <c125b447-53e8-7d13-3b08-af62fd3a9140@suse.com> <c6b6c22f-fb8a-f2d9-7735-f1ebc9809908@epam.com> <09656882-b297-7144-c291-1ee997edb119@suse.com>
 <69A83587-B7E0-4653-AF8C-AEE802922CE5@arm.com> <24933.41349.893363.203683@mariner.uk.xensource.com> <AB6D62B6-2ED2-4957-A933-08EC77A4DFD6@arm.com> <24933.47094.43672.782143@mariner.uk.xensource.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Oct 2021, Ian Jackson wrote:
> Bertrand Marquis writes ("Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not supported on ARM."):
> > I can add something in the commit message about the fact that we improve
> > performance and prevent to do a call that is and will not be supported in Xen.
> 
> Thanks but I'm afraid I don't think that is a correct summary of the
> thread.  Nor would it be an adequate justification for the change.  At
> least, not unless you plan to write something considerably longer (and
> more precise).
> 
> Firstly, I'm not convinced this change would be justified by the
> performance impact.  This is a small number of hypercalls during
> domain startup.  Usually none, I think ?  If someone wants to optimise
> domain startup speed then I am very open to that but I think this
> change will make negligible change in practice.  Unless someone wants
> to tell me I'm wrong about that ?  And if I am wrong about that then
> an explanation of why my suppositions are wrong ought to go in the
> commit message.
> 
> Secondly, there is no justification there for the change in error
> status.
> 
> Why is this change needed ?  (What goes wrong if it is omitted ?)
> That is what the commit message ought to answer.
> 
> Plus, given that it stubs out a function to make it into a no-op, that
> itself requires an explanation.  Why is it OK for this function which
> is supposed to do a thing, to in fact not do anything at all and
> return successfully saying "yes I did that" ?
> 
> I think (having read the thread) that I know the answers to these
> questions but it needs to be clearly and explicitly written down.
> 
> > I saw your change in CODING_STYLE and I understand the request.
> > I will try to see if we can handle this change before the feature freeze.
> 
> Thanks.  I doubt that this will be hard.  I am more worried about the
> commit message.
> 
> Indeed, since we haven't had the rationale for this change explicitly
> written down, there is a risk that when we do so, we will discover
> some problem with the approach that we had previously overlooked.
> 
> Discovering that kind of thing is one reason to explicitly write down
> why we are doing what we are doing, but this situation does mean we
> shouldn't feel we've yet achieved confidence that this patch is right.


I don't think it is about performance. From a performance point of view,
we could make as many (unneeded) hypercalls as required. It is mostly
about minimizing unwanted changes to common libxl code. Let me explain.


IO ports on ARM don't exist so all IO ports related hypercalls are going
to fail. This is expected. Today, a failure of
xc_domain_ioport_permission would turn into a critical failure at domain
creation. We need to avoid this outcome; instead we want to continue
with domain creation as normal even if xc_domain_ioport_permission
fails. (FYI the underlying hypercall XEN_DOMCTL_ioport_permission is not
implemented on ARM so it would return -ENOSYS.)


We have a few options to achieve this goal:


1) No xc_domain_ioport_permission calls on ARM

   Use #ifdefs or similar checks in libxl_pci.c to avoid calling
   xc_domain_ioport_permission on ARM. This could be best but it would
   cause some churn in arch-neutral libxl code.


2) Handle xc_domain_ioport_permission errors in libxl

   Introduce checks on the return value of xc_domain_ioport_permission
   and ignore specific errors on ARM in libxl_pci.c.
   For instance: if (ARM && rc == -ENOSYS) continue.

   This might cause less churn than 1) but still requires a few changes
   in arch-neutral libxl code.


3) Force XEN_DOMCTL_ioport_permission to return zero on ARM

   Force the hypercall to return success even if it did nothing.
   Currently it returns -ENOSYS.

   This is possible but it wasn't chosen for the implementation as we
   felt that the hypercall should reflect what was actually done
   (nothing) and it should be userspace to handle the error. I guess
   this could be argued either way.


4) Force xc_domain_ioport_permission to return zero on ARM

   Force xc_domain_ioport_permission to return success even if the
   hypercall would return -ENOSYS. This way there are no changes to
   libxl.
   
   This is what the patch currently implements by using  #ifdef in
   xc_domain_ioport_permission. It could also have achieved the same
   goal by making the implementation of xc_domain_ioport_permission
   arch-specific, and in the ARM implementation returning 0.


All options above achieve the goal of a successful domain creation with
PCI device assigned on ARM. You might be able to think of other options
as well. I think noone here is really set on using one option over the
other -- as long as xc_domain_ioport_permission failures don't turn into
domain creation failures on ARM we are good.

Let us know what you think.

