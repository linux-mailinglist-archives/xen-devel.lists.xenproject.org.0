Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD31558ACE
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 23:35:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355194.582725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4UTK-0003aU-Q4; Thu, 23 Jun 2022 21:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355194.582725; Thu, 23 Jun 2022 21:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4UTK-0003X2-MF; Thu, 23 Jun 2022 21:34:42 +0000
Received: by outflank-mailman (input) for mailman id 355194;
 Thu, 23 Jun 2022 21:34:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VLWc=W6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o4UTJ-0003Ww-5N
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 21:34:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48cd06fc-f33c-11ec-b725-ed86ccbb4733;
 Thu, 23 Jun 2022 23:34:39 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 43DE661E7C;
 Thu, 23 Jun 2022 21:34:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30591C341C0;
 Thu, 23 Jun 2022 21:34:37 +0000 (UTC)
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
X-Inumbo-ID: 48cd06fc-f33c-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656020077;
	bh=bUiq+qmbQ/hVPGovzl9M2oLefdg+JaPzX1MK6dK8zeI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HZqYaCgYUg9XUGiq5ubv2P3PI2PQ1TWmaleMvIBCZRlWRry27MAVqgnwhzHpsnaix
	 n7uSvCQOWqUKKgpvnq00moPHZOcx+I5s5b3YZ3ipANYMXTTCimA2UHyuLbBFw6hB4r
	 87i9tsfjGhSS1Am/e0bnpltVO5RBw4ezUoSVkRJ4SPAhy2UqupC8Vssd7pTyyTBMcR
	 wnyhBfdrUKikVQeulNeXz5uHTvZy6f6jbV4sNOpEU6wvW0L+3kQ2VWUCyRfrMOsXE1
	 ROwPooPAUKNbHAk7jCNszCKDb50WDh5M8MV+zjfkTdLcQi7DCSicN1j9vBYWh6yvZe
	 4KbQCPwv2cKpw==
Date: Thu, 23 Jun 2022 14:34:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    Julien Grall <jgrall@amazon.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: irq: Initialize the per-CPU IRQs while preparing
 the CPU
In-Reply-To: <87b7646c-dbc0-f503-131a-a51aa3bd517f@xen.org>
Message-ID: <alpine.DEB.2.22.394.2206231434150.2410338@ubuntu-linux-20-04-desktop>
References: <20220614094157.95631-1-julien@xen.org> <alpine.DEB.2.22.394.2206141731320.1837490@ubuntu-linux-20-04-desktop> <87b7646c-dbc0-f503-131a-a51aa3bd517f@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Jun 2022, Julien Grall wrote:
> On 15/06/2022 01:32, Stefano Stabellini wrote:
> > On Tue, 14 Jun 2022, Julien Grall wrote:
> > > From: Julien Grall <jgrall@amazon.com>
> > > 
> > > Commit 5047cd1d5dea "xen/common: Use enhanced ASSERT_ALLOC_CONTEXT in
> > > xmalloc()" extended the checks in _xmalloc() to catch any use of the
> > > helpers from context with interrupts disabled.
> > > 
> > > Unfortunately, the rule is not followed when initializing the per-CPU
> > > IRQs:
> > > 
> > > (XEN) Xen call trace:
> > > (XEN)    [<002389f4>] _xmalloc+0xfc/0x314 (PC)
> > > (XEN)    [<00000000>] 00000000 (LR)
> > > (XEN)    [<0021a7c4>] init_one_irq_desc+0x48/0xd0
> > > (XEN)    [<002807a8>] irq.c#init_local_irq_data+0x48/0xa4
> > > (XEN)    [<00280834>] init_secondary_IRQ+0x10/0x2c
> > > (XEN)    [<00288fa4>] start_secondary+0x194/0x274
> > > (XEN)    [<40010170>] 40010170
> > > (XEN)
> > > (XEN)
> > > (XEN) ****************************************
> > > (XEN) Panic on CPU 2:
> > > (XEN) Assertion '!in_irq() && (local_irq_is_enabled() || num_online_cpus()
> > > <= 1)' failed at common/xmalloc_tlsf.c:601
> > > (XEN) ****************************************
> > > 
> > > This is happening because zalloc_cpumask_var() may allocate memory
> > > if NR_CPUS is > 2 * sizeof(unsigned long).
> > > 
> > > Avoid the problem by allocate the per-CPU IRQs while preparing the
> > > CPU.
> > > 
> > > This also has the benefit to remove a BUG_ON() in the secondary CPU
> > > code.
> > > 
> > > Signed-off-by: Julien Grall <jgrall@amazon.com>
> > > ---
> > >   xen/arch/arm/include/asm/irq.h |  1 -
> > >   xen/arch/arm/irq.c             | 35 +++++++++++++++++++++++++++-------
> > >   xen/arch/arm/smpboot.c         |  2 --
> > >   3 files changed, 28 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/xen/arch/arm/include/asm/irq.h
> > > b/xen/arch/arm/include/asm/irq.h
> > > index e45d57459899..245f49dcbac5 100644
> > > --- a/xen/arch/arm/include/asm/irq.h
> > > +++ b/xen/arch/arm/include/asm/irq.h
> > > @@ -73,7 +73,6 @@ static inline bool is_lpi(unsigned int irq)
> > >   bool is_assignable_irq(unsigned int irq);
> > >     void init_IRQ(void);
> > > -void init_secondary_IRQ(void);
> > >     int route_irq_to_guest(struct domain *d, unsigned int virq,
> > >                          unsigned int irq, const char *devname);
> > > diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> > > index b761d90c4063..56bdcb95335d 100644
> > > --- a/xen/arch/arm/irq.c
> > > +++ b/xen/arch/arm/irq.c
> > > @@ -17,6 +17,7 @@
> > >    * GNU General Public License for more details.
> > >    */
> > >   +#include <xen/cpu.h>
> > >   #include <xen/lib.h>
> > >   #include <xen/spinlock.h>
> > >   #include <xen/irq.h>
> > > @@ -100,7 +101,7 @@ static int __init init_irq_data(void)
> > >       return 0;
> > >   }
> > >   -static int init_local_irq_data(void)
> > > +static int init_local_irq_data(unsigned int cpu)
> > >   {
> > >       int irq;
> > >   @@ -108,7 +109,7 @@ static int init_local_irq_data(void)
> > >         for ( irq = 0; irq < NR_LOCAL_IRQS; irq++ )
> > >       {
> > > -        struct irq_desc *desc = irq_to_desc(irq);
> > > +        struct irq_desc *desc = &per_cpu(local_irq_desc, cpu)[irq];
> > >           int rc = init_one_irq_desc(desc);
> > >             if ( rc )
> > > @@ -131,6 +132,29 @@ static int init_local_irq_data(void)
> > >       return 0;
> > >   }
> > >   +static int cpu_callback(struct notifier_block *nfb, unsigned long
> > > action,
> > > +                        void *hcpu)
> > > +{
> > > +    unsigned long cpu = (unsigned long)hcpu;
> > 
> > unsigned int cpu ?
> 
> Hmmm... We seem to have a mix in the code base. I am OK to switch to unsigned
> int.
> 
> > 
> > The rest looks good
> Can this be converted to an ack or review tag?

Yes, add my reviewed-by

