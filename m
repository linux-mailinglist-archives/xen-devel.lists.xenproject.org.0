Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4F419A322
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 03:00:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJRh8-0001ob-FG; Wed, 01 Apr 2020 00:57:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wqBo=5R=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jJRh7-0001oW-QS
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 00:57:25 +0000
X-Inumbo-ID: c02b8422-73b3-11ea-b58d-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c02b8422-73b3-11ea-b58d-bc764e2007e4;
 Wed, 01 Apr 2020 00:57:25 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5F76F20842;
 Wed,  1 Apr 2020 00:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585702644;
 bh=vbWTEqDv5fC5IeCUzoVOK86jHDSpaBBrd2Gc3H8oz2Y=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=jkJmyL/kl8+SS1X31LEWEZ6odIUYT9bmKLwq5VVlgmqAMftfWdRdzmp+P6G+NtQ9I
 29HR/iXsAcLMq3eD9NdScZIHgnAqScqqgUyVLeAhnscWs1jxllNPGAdIXWEgyaLnhn
 Pm1BS9XHJdBZthwSGqlkbQ8s3DkcBQefVYOG10ck=
Date: Tue, 31 Mar 2020 17:57:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
In-Reply-To: <5deb3992-3cf5-2b00-8cef-af75ed83a1fd@xen.org>
Message-ID: <alpine.DEB.2.21.2003311121120.4572@sstabellini-ThinkPad-T480s>
References: <20200327023451.20271-1-sstabellini@kernel.org>
 <38f56c3e-8f7d-7aee-8216-73398f4543bb@xen.org>
 <alpine.DEB.2.21.2003300932430.4572@sstabellini-ThinkPad-T480s>
 <5deb3992-3cf5-2b00-8cef-af75ed83a1fd@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Peng Fan <peng.fan@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Wei Xu <xuwei5@hisilicon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, 30 Mar 2020, Julien Grall wrote:
> Hi Stefano,
> 
> On 30/03/2020 17:35, Stefano Stabellini wrote:
> > On Sat, 28 Mar 2020, Julien Grall wrote:
> > > qHi Stefano,
> > > 
> > > On 27/03/2020 02:34, Stefano Stabellini wrote:
> > > > This is a simple implementation of GICD_ICACTIVER / GICD_ISACTIVER
> > > > reads. It doesn't take into account the latest state of interrupts on
> > > > other vCPUs. Only the current vCPU is up-to-date. A full solution is
> > > > not possible because it would require synchronization among all vCPUs,
> > > > which would be very expensive in terms or latency.
> > > 
> > > Your sentence suggests you have number showing that correctly emulating
> > > the
> > > registers would be too slow. Mind sharing them?
> > 
> > No, I don't have any numbers. Would you prefer a different wording or a
> > better explanation? I also realized there is a typo in there (or/of).
> Let me start with I think correctness is more important than speed.
> So I would have expected your commit message to contain some fact why
> synchronization is going to be slow and why this is a problem.
> 
> To give you a concrete example, the implementation of set/way instructions are
> really slow (it could take a few seconds depending on the setup). However,
> this was fine because not implementing them correctly would have a greater
> impact on the guest (corruption) and they are not used often.
> 
> I don't think the performance in our case will be in same order magnitude. It
> is most likely to be in the range of milliseconds (if not less) which I think
> is acceptable for emulation (particularly for the vGIC) and the current uses.

Writing on the mailing list some of our discussions today.

Correctness is not just in terms of compliance to a specification but it
is also about not breaking guests. Introducing latency in the range of
milliseconds, or hundreds of microseconds, would break any latency
sensitive workloads. We don't have numbers so we don't know for certain
the effect that your suggestion would have.

It would be interesting to have those numbers, and I'll add to my TODO
list to run the experiments you suggested, but I'll put it on the
back-burner (from a Xilinx perspective it is low priority as no
customers are affected.)


> So lets take a step back and look how we could implement ISACTIVER/ICACTIVER
> correctly.
> 
> The only thing we need is a snapshot of the interrupts state a given point. I
> originally thought it would be necessary to use domain_pause() which is quite
> heavy, but I think we only need the vCPU to enter in Xen and sync the states
> of the LRs.
> 
> Roughly the code would look like (This is not optimized):
> 
>     for_each_vcpu(d, v)
>     {
>        if ( v->is_running )
>          smp_call_function(do_nothing(), v->cpu);
>     }
> 
>     /* Read the state */
> 
> A few remarks:
>    * The function do_nothing() is basically a NOP.
>    * I am suggesting to use smp_call_function() rather
> smp_send_event_check_cpu() is because we need to know when the vCPU has
> synchronized the LRs. As the function do_nothing() will be call afterwards,
> then we know the the snapshot of the LRs has been done
>    * It would be possible to everything in one vCPU.
>    * We can possibly optimize it for the SGIs/PPIs case
> 
> This is still not perfect, but I don't think the performance would be that
> bad.

