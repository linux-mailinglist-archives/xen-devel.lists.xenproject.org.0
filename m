Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A556AF723
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 22:03:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507901.782081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZeS5-0005Xi-Ri; Tue, 07 Mar 2023 21:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507901.782081; Tue, 07 Mar 2023 21:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZeS5-0005Ux-P7; Tue, 07 Mar 2023 21:02:29 +0000
Received: by outflank-mailman (input) for mailman id 507901;
 Tue, 07 Mar 2023 21:02:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YLjA=67=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pZeS4-0005Ur-Do
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 21:02:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bc7dbc8-bd2b-11ed-87f5-c1b5be75604c;
 Tue, 07 Mar 2023 22:02:26 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 477A36153C;
 Tue,  7 Mar 2023 21:02:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDD10C433D2;
 Tue,  7 Mar 2023 21:02:21 +0000 (UTC)
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
X-Inumbo-ID: 5bc7dbc8-bd2b-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678222942;
	bh=qxE5sHUKfGVd/qIxDUtt3kzOpaqZNxI1zAzEa/0oLSQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ai62tdksuV8lZzRph5Uwgmhw8S3F4M5TL8PPC5uzVTvKSVmw6g43JrPMTSJxnd5P/
	 PBVsu6aExzM9O7jvRqRQ16B0doMCD1zXkElXeRfrBLxf2aASyqIHVAaAF2mPdk1Ilv
	 hhZ+RWpM0UhAC8s0O+55GK3a8NGzXnUy1aB7sZC7fR0z6wUmMM1iIZ1BuKs2mSxq9Q
	 iGi1WzsB2nti8wmNVq8LM8u2ln+O+hTE4JEcf9rs0TSL30ntgdEh8XvIt9zfGcAfmU
	 2xp75malDVxgL56Stbqy4h+U2aBxqvip+vsRx5CbWE22i39qp7nlpVIjKFAzlBtb//
	 5mXwZeJtwM1nA==
Date: Tue, 7 Mar 2023 13:02:20 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Andrei Cherechesu <andrei.cherechesu@nxp.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 2/2] arch/arm: time: Add support for parsing interrupts
 by names
In-Reply-To: <370745D6-D6AF-43D0-8E9F-2DB160BE0E07@arm.com>
Message-ID: <alpine.DEB.2.22.394.2303071301300.863724@ubuntu-linux-20-04-desktop>
References: <20230307100949.9231-1-andrei.cherechesu@oss.nxp.com> <20230307100949.9231-3-andrei.cherechesu@oss.nxp.com> <370745D6-D6AF-43D0-8E9F-2DB160BE0E07@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 Mar 2023, Bertrand Marquis wrote:
> > On 7 Mar 2023, at 11:09, Andrei Cherechesu (OSS) <andrei.cherechesu@oss.nxp.com> wrote:
> > 
> > From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> > 
> > Added support for parsing the ARM generic timer interrupts DT
> > node by the "interrupt-names" property, if it is available.
> > 
> > If not available, the usual parsing based on the expected
> > IRQ order is performed.
> > 
> > Also added the "hyp-virt" PPI to the timer PPI list, even
> > though it's currently not in use. If the "hyp-virt" PPI is
> > not found, the hypervisor won't panic.
> > 
> > Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> > ---
> > xen/arch/arm/include/asm/time.h |  3 ++-
> > xen/arch/arm/time.c             | 26 ++++++++++++++++++++++----
> > 2 files changed, 24 insertions(+), 5 deletions(-)
> > 
> > diff --git a/xen/arch/arm/include/asm/time.h b/xen/arch/arm/include/asm/time.h
> > index 4b401c1110..49ad8c1a6d 100644
> > --- a/xen/arch/arm/include/asm/time.h
> > +++ b/xen/arch/arm/include/asm/time.h
> > @@ -82,7 +82,8 @@ enum timer_ppi
> >     TIMER_PHYS_NONSECURE_PPI = 1,
> >     TIMER_VIRT_PPI = 2,
> >     TIMER_HYP_PPI = 3,
> > -    MAX_TIMER_PPI = 4,
> > +    TIMER_HYP_VIRT_PPI = 4,
> > +    MAX_TIMER_PPI = 5,
> > };
> > 
> > /*
> > diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
> > index 433d7be909..794da646d6 100644
> > --- a/xen/arch/arm/time.c
> > +++ b/xen/arch/arm/time.c
> > @@ -38,6 +38,14 @@ uint32_t __read_mostly timer_dt_clock_frequency;
> > 
> > static unsigned int timer_irq[MAX_TIMER_PPI];
> > 
> > +static const char *timer_irq_names[MAX_TIMER_PPI] = {
> > +    [TIMER_PHYS_SECURE_PPI] = "sec-phys",
> > +    [TIMER_PHYS_NONSECURE_PPI] = "phys",
> > +    [TIMER_VIRT_PPI] = "virt",
> > +    [TIMER_HYP_PPI] = "hyp-phys",
> > +    [TIMER_HYP_VIRT_PPI] = "hyp-virt",
> > +};
> > +
> 
> I would need some reference or a pointer to some doc to check those.
> 
> > unsigned int timer_get_irq(enum timer_ppi ppi)
> > {
> >     ASSERT(ppi >= TIMER_PHYS_SECURE_PPI && ppi < MAX_TIMER_PPI);
> > @@ -149,15 +157,25 @@ static void __init init_dt_xen_time(void)
> > {
> >     int res;
> >     unsigned int i;
> > +    bool has_names;
> > +
> > +    has_names = dt_property_read_bool(timer, "interrupt-names");
> > 
> >     /* Retrieve all IRQs for the timer */
> >     for ( i = TIMER_PHYS_SECURE_PPI; i < MAX_TIMER_PPI; i++ )
> >     {
> > -        res = platform_get_irq(timer, i);
> > -
> > -        if ( res < 0 )
> > +        if ( has_names )
> > +            res = platform_get_irq_byname(timer, timer_irq_names[i]);
> > +        else
> > +            res = platform_get_irq(timer, i);
> > +
> > +        if ( res > 0 )
> 
> The behaviour of the code is changed here compared to the current
> version as res = 0 will now generate a panic.
> 
> Some device tree might not specify an interrupt number and just put
> 0 and Xen will now panic on those systems.
> As I have no idea if such systems exists and the behaviour is modified
> you should justify this and mention it in the commit message or keep
> the old behaviour and let 0 go through without a panic.
> 
> @stefano, julien any idea here ? should just keep the old behaviour ?

platform_get_irq returns 0 if the irq is 0. The irq cannot be 0 because
0 is reserved for SGIs, not PPIs. So I think it is OK to consider 0 an
error.

