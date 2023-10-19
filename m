Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4977D01B4
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 20:35:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619553.964823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtXrV-0001FS-Kw; Thu, 19 Oct 2023 18:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619553.964823; Thu, 19 Oct 2023 18:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtXrV-0001Ci-IE; Thu, 19 Oct 2023 18:35:13 +0000
Received: by outflank-mailman (input) for mailman id 619553;
 Thu, 19 Oct 2023 18:35:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZCy=GB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qtXrU-0001Ca-6z
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 18:35:12 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b8cf07e-6eae-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 20:35:11 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 678DD60B2D;
 Thu, 19 Oct 2023 18:35:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD9CAC433C8;
 Thu, 19 Oct 2023 18:35:07 +0000 (UTC)
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
X-Inumbo-ID: 3b8cf07e-6eae-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697740509;
	bh=wgzxFF0yD0Toto9DYVX1hvn0/Ak6iljZwsBMYaswPMw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GXM9TyK02QUulbmoHrav9mRj7kYPjysVmMVTN0+pIHB+h/Go9993tlDgSFN9W2KZl
	 BHM4VmGwm5E8WE82C8SmZWajzDalq/e0zpFU9e4sNdUI3DU8fcK9u2SDV7tiann8z/
	 LkJAUawnnYFSbIzfTsPXi4ZCqzOBDLDaFvjjua4jOHKYF/FQehvpnqM51WXazVlkMA
	 yoDuwOL/i016qRiPilK8merrraKpo2ug2uCNKJlZLB1q19bQlrPXE0Y7KfVHGWkpks
	 pnv692JNHE2mito7nD1LP4y2Ja031vAtX3uPFtyCR5URQIEeeY0RZKvTavD5ezwDOs
	 J9ShOsp9nJ+oQ==
Date: Thu, 19 Oct 2023 11:35:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, 
    consulting@bugseng.com, George Dunlap <george.dunlap@citrix.com>, 
    Dario Faggioli <dfaggioli@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 4/4] xen: address violations of MISRA C:2012 Rule
 13.1
In-Reply-To: <fe5084f4-e5f3-4778-87c7-faac2076bde7@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310191134400.2099202@ubuntu-linux-20-04-desktop>
References: <cover.1697638210.git.simone.ballarin@bugseng.com> <1e0f12095bcbc82ae3585c9fcf57bec7e324049c.1697638210.git.simone.ballarin@bugseng.com> <alpine.DEB.2.22.394.2310181803351.965337@ubuntu-linux-20-04-desktop> <78a7b73a-fefb-6884-90c5-abad2860a521@suse.com>
 <27fcfc87-aa8f-4bfb-863a-91a75c763050@bugseng.com> <5c9b851f-6f64-f6bd-970a-63aefdab5b41@suse.com> <fe5084f4-e5f3-4778-87c7-faac2076bde7@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Oct 2023, Simone Ballarin wrote:
> On 19/10/23 13:19, Jan Beulich wrote:
> > On 19.10.2023 13:12, Simone Ballarin wrote:
> > > On 19/10/23 11:35, Jan Beulich wrote:
> > > > On 19.10.2023 03:06, Stefano Stabellini wrote:
> > > > > On Wed, 18 Oct 2023, Simone Ballarin wrote:
> > > > > > --- a/xen/common/sched/core.c
> > > > > > +++ b/xen/common/sched/core.c
> > > > > > @@ -1504,6 +1504,8 @@ long vcpu_yield(void)
> > > > > >    {
> > > > > >        struct vcpu * v=current;
> > > > > >        spinlock_t *lock;
> > > > > > +    domid_t domain_id;
> > > > > > +    int vcpu_id;
> > > > > >           rcu_read_lock(&sched_res_rculock);
> > > > > >    @@ -1515,7 +1517,9 @@ long vcpu_yield(void)
> > > > > >           SCHED_STAT_CRANK(vcpu_yield);
> > > > > >    -    TRACE_2D(TRC_SCHED_YIELD, current->domain->domain_id,
> > > > > > current->vcpu_id);
> > > > > > +    domain_id = current->domain->domain_id;
> > > > > > +    vcpu_id = current->vcpu_id;
> > > > > > +    TRACE_2D(TRC_SCHED_YIELD, domain_id, vcpu_id);
> > > > > 
> > > > > Also here it looks like accessing the current pointer is considered a
> > > > > side effect. Why? This is a just a global variable that is only
> > > > > accessed
> > > > > for reading.
> > > > 
> > > > Not exactly. It's a per-CPU variable access on Arm, but involves a
> > > > function call on x86. Still that function call has no other side
> > > > effects, but I guess Misra wouldn't honor this.
> > > > 
> > > > I'm afraid though that the suggested change violates rule 2.2, as
> > > > the two new assignments are dead code when !CONFIG_TRACEBUFFER.
> > > 
> > > I confirm that there is no problem in X86: I will simply propose a patch
> > > adding __attribute_pure__ to get_cpu_info.
> > 
> > I specifically did not suggest that, because I'm afraid the "pure" attribute
> > may not be used there. Besides this attribute typically being discarded for
> > inline functions in favor of the compiler's own judgement, it would allow
> > the compiler to squash multiple invocations. This might even be desirable in
> > most cases, but would break across a stack pointer change. (In this context
> > you also need to keep in mind late optimizations done by LTO.)
> > 
> > Jan
> > 
> 
> Ok, in this case I will just configure ECLAIR to consider it without effects.

I think that's fine, just remember to either use SAF or document under
docs/misra/deviations.rst

