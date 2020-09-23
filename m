Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAAC275EF9
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 19:46:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL8q4-0000YL-A8; Wed, 23 Sep 2020 17:45:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HDdr=DA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kL8q2-0000YG-Bl
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 17:45:54 +0000
X-Inumbo-ID: cd574f9b-7930-4e6e-aae0-b884c30d6e57
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd574f9b-7930-4e6e-aae0-b884c30d6e57;
 Wed, 23 Sep 2020 17:45:53 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 761DC2067B;
 Wed, 23 Sep 2020 17:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600883153;
 bh=qnmkgR9if/Y+kFF5Yk6ejnXs87IukbqnCTH06fnRAbk=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=SIvBSrv5TaVgpqaCJtAzq0JDK58kHflwCS1/xIzToDeggy8vowi3fvYQ1P3hvUGWf
 KZIRQSK4TD1BpQM7rrEEw3yPidRRykFuV6LN9ZX4t33H19pGRDTZuq1XmoRRTWJHOL
 lvZwlnG4zXbuEKem2/CbKa7tIPJ5xmaqSAqSWA5E=
Date: Wed, 23 Sep 2020 10:45:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Julien Grall <julien@xen.org>, 
 "open list:X86" <xen-devel@lists.xenproject.org>, 
 Julien Grall <jgrall@amazon.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
 George Dunlap <george.dunlap@citrix.com>, 
 Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [RESEND][PATCH] xen/arm: sched: Ensure the vCPU context is seen
 before vcpu_pause() returns
In-Reply-To: <95B9E367-E5DA-4F65-9760-6A2D21E3FB27@arm.com>
Message-ID: <alpine.DEB.2.21.2009231045311.1495@sstabellini-ThinkPad-T480s>
References: <20200922193104.20604-1-julien@xen.org>
 <95B9E367-E5DA-4F65-9760-6A2D21E3FB27@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 23 Sep 2020, Bertrand Marquis wrote:
> Hi,
> 
> > On 22 Sep 2020, at 20:31, Julien Grall <julien@xen.org> wrote:
> > 
> > From: Julien Grall <jgrall@amazon.com>
> > 
> > Some callers of vcpu_pause() will expect to access the latest vcpu
> > context when the function returns (see XENDOMCTL_{set,get}vcpucontext}.
> > 
> > However, the latest vCPU context can only be observed after
> > v->is_running has been observed to be false.
> > 
> > As there is no memory barrier instruction generated, a processor could
> > try to speculatively access the vCPU context before it was observed.
> > 
> > To prevent the corruption of the vCPU context, we need to insert a
> > memory barrier instruction after v->is_running is observed and before
> > the context is accessed. This barrier is added in sync_vcpu_execstate()
> > as it seems to be the place where we expect the synchronization to
> > happen.
> > 
> > Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> > ---
> > 
> > Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> > Cc: Jan Beulich <jbeulich@suse.com>
> > Cc: George Dunlap <george.dunlap@citrix.com>
> > Cc: Dario Faggioli <dfaggioli@suse.com>
> > Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
> > 
> > I am also adding the x86 and scheduler maintainers because I am not sure
> > whether this barrier should be part of the common code instead.
> > ---
> > xen/arch/arm/domain.c | 15 ++++++++++++++-
> > 1 file changed, 14 insertions(+), 1 deletion(-)
> > 
> > diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> > index 9258f6d3faa2..3b37f899b9da 100644
> > --- a/xen/arch/arm/domain.c
> > +++ b/xen/arch/arm/domain.c
> > @@ -371,7 +371,20 @@ void sync_local_execstate(void)
> > 
> > void sync_vcpu_execstate(struct vcpu *v)
> > {
> > -    /* Nothing to do -- no lazy switching */
> > +    /*
> > +     * We don't support lazy switching.
> > +     *
> > +     * However the context may have been saved from a remote pCPU so we
> > +     * need a barrier to ensure it is observed before continuing.
> > +     *
> > +     * Per vcpu_context_saved(), the context can be observed when
> > +     * v->is_running is false (the caller should check it before calling
> > +     * this function).
> > +     *
> > +     * Note this is a full barrier to also prevent update of the context
> > +     * to happen before it was observed.
> > +     */
> > +    smp_mb();
> > }
> > 
> > #define NEXT_ARG(fmt, args)                                                 \
> > -- 
> > 2.17.1
> > 
> 

