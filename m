Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5507D01B5
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 20:35:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619555.964833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtXrv-00025f-Sr; Thu, 19 Oct 2023 18:35:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619555.964833; Thu, 19 Oct 2023 18:35:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtXrv-000243-Pi; Thu, 19 Oct 2023 18:35:39 +0000
Received: by outflank-mailman (input) for mailman id 619555;
 Thu, 19 Oct 2023 18:35:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZCy=GB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qtXrt-00023U-UN
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 18:35:37 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b27ca1b-6eae-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 20:35:36 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 8A02EB82C73;
 Thu, 19 Oct 2023 18:35:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CAC9C433C8;
 Thu, 19 Oct 2023 18:35:33 +0000 (UTC)
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
X-Inumbo-ID: 4b27ca1b-6eae-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697740534;
	bh=vfFrlqoMFq2H1cHsnTO5TfocJZfWKV9VCBMwxgluEbk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WklyIdVufIRSfpRMgHcSrG7JFD49ahgro/YqGtO1nZ5AO23/D/mbFQy+mrPHurhad
	 7t+Y9dQq0ycpA5vr3drRH4H9+us3od7h5I31GiHEnQYrQRXqa/fR51tuillXUsDqwe
	 0ioMnrogjeos3WnusOTv6C17gdirQlDiN+N0k5v96tmWmOyGMoiGbrDVF3m+rNHTz8
	 Nl93noSf/ZW6mjvhst6JPqCJe25Sfe5xxnmwGA/KVKIVWowxDEphSC4JaUXl1RXLCZ
	 qSRLS5/MYZFnm1CM+5bDfl3YHA2Wr208ateCyFC+PkB2RKffGMHOhKNvjW4fCQsIY2
	 IJqJRNqxS0XNA==
Date: Thu, 19 Oct 2023 11:35:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    George Dunlap <george.dunlap@citrix.com>, 
    Dario Faggioli <dfaggioli@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 4/4] xen: address violations of MISRA C:2012 Rule
 13.1
In-Reply-To: <66049700-c16b-4086-b14f-154285f3ebf0@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310191135160.2099202@ubuntu-linux-20-04-desktop>
References: <cover.1697638210.git.simone.ballarin@bugseng.com> <1e0f12095bcbc82ae3585c9fcf57bec7e324049c.1697638210.git.simone.ballarin@bugseng.com> <alpine.DEB.2.22.394.2310181803351.965337@ubuntu-linux-20-04-desktop>
 <66049700-c16b-4086-b14f-154285f3ebf0@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Oct 2023, Simone Ballarin wrote:
> On 19/10/23 03:06, Stefano Stabellini wrote:
> > On Wed, 18 Oct 2023, Simone Ballarin wrote:
> > > Rule 13.1: Initializer lists shall not contain persistent side effects
> > > 
> > > This patch moves expressions with side-effects outside the initializer
> > > lists.
> > > 
> > > No functional changes.
> > > 
> > > Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> > > ---
> > >   xen/common/sched/core.c    | 16 ++++++++++++----
> > >   xen/drivers/char/ns16550.c |  4 +++-
> > >   2 files changed, 15 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> > > index 12deefa745..519884f989 100644
> > > --- a/xen/common/sched/core.c
> > > +++ b/xen/common/sched/core.c
> > > @@ -1504,6 +1504,8 @@ long vcpu_yield(void)
> > >   {
> > >       struct vcpu * v=current;
> > >       spinlock_t *lock;
> > > +    domid_t domain_id;
> > > +    int vcpu_id;
> > >         rcu_read_lock(&sched_res_rculock);
> > >   @@ -1515,7 +1517,9 @@ long vcpu_yield(void)
> > >         SCHED_STAT_CRANK(vcpu_yield);
> > >   -    TRACE_2D(TRC_SCHED_YIELD, current->domain->domain_id,
> > > current->vcpu_id);
> > > +    domain_id = current->domain->domain_id;
> > > +    vcpu_id = current->vcpu_id;
> > > +    TRACE_2D(TRC_SCHED_YIELD, domain_id, vcpu_id);
> > 
> > Also here it looks like accessing the current pointer is considered a
> > side effect. Why? This is a just a global variable that is only accessed
> > for reading.
> > 
> > 
> > >       raise_softirq(SCHEDULE_SOFTIRQ);
> > >       return 0;
> > >   }
> > > @@ -1888,14 +1892,17 @@ ret_t do_sched_op(int cmd,
> > > XEN_GUEST_HANDLE_PARAM(void) arg)
> > >       case SCHEDOP_shutdown:
> > >       {
> > >           struct sched_shutdown sched_shutdown;
> > > +        domid_t domain_id;
> > > +        int vcpu_id;
> > >             ret = -EFAULT;
> > >           if ( copy_from_guest(&sched_shutdown, arg, 1) )
> > >               break;
> > >   +        domain_id = current->domain->domain_id;
> > > +        vcpu_id = current->vcpu_id;
> > >           TRACE_3D(TRC_SCHED_SHUTDOWN,
> > > -                 current->domain->domain_id, current->vcpu_id,
> > > -                 sched_shutdown.reason);
> > > +                 domain_id, vcpu_id, sched_shutdown.reason);
> > >           ret = domain_shutdown(current->domain,
> > > (u8)sched_shutdown.reason);
> > >             break;
> > > @@ -1905,13 +1912,14 @@ ret_t do_sched_op(int cmd,
> > > XEN_GUEST_HANDLE_PARAM(void) arg)
> > >       {
> > >           struct sched_shutdown sched_shutdown;
> > >           struct domain *d = current->domain;
> > > +        int vcpu_id = current->vcpu_id;
> > >             ret = -EFAULT;
> > >           if ( copy_from_guest(&sched_shutdown, arg, 1) )
> > >               break;
> > >             TRACE_3D(TRC_SCHED_SHUTDOWN_CODE,
> > > -                 d->domain_id, current->vcpu_id, sched_shutdown.reason);
> > > +                 d->domain_id, vcpu_id, sched_shutdown.reason);
> > >             spin_lock(&d->shutdown_lock);
> > >           if ( d->shutdown_code == SHUTDOWN_CODE_INVALID )
> > > diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> > > index 28ddedd50d..0b3d8b2a30 100644
> > > --- a/xen/drivers/char/ns16550.c
> > > +++ b/xen/drivers/char/ns16550.c
> > > @@ -445,10 +445,12 @@ static void __init cf_check
> > > ns16550_init_postirq(struct serial_port *port)
> > >               struct msi_info msi = {
> > >                   .sbdf = PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
> > >                                    uart->ps_bdf[2]),
> > > -                .irq = rc = uart->irq,
> > > +                .irq = uart->irq,
> > >                   .entry_nr = 1
> > >               };
> > >   +            rc = uart->irq;
> > 
> > What's the side effect here? If the side effect is rc = uart->irq, why
> > is it considered a side effect?
> > 
> 
> Yes, rc = uart->irq is the side-effect: it writes a variable
> declared outside the context of the expression.
> 
> Consider the following example:
> 
> int rc;
> 
> struct S s = {
>   .x = rc = 2,
>   .y = rc = 3
> };
> 
> What's the value of rc?

OK thanks for the explanation.

