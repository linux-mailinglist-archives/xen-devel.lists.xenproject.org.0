Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08914805370
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 12:49:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647684.1011193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATvf-0002DL-Jy; Tue, 05 Dec 2023 11:49:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647684.1011193; Tue, 05 Dec 2023 11:49:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATvf-0002BS-Gw; Tue, 05 Dec 2023 11:49:31 +0000
Received: by outflank-mailman (input) for mailman id 647684;
 Tue, 05 Dec 2023 11:49:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6bfq=HQ=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1rATve-0002B3-2w
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 11:49:30 +0000
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [2607:f8b0:4864:20::72c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57b3bc0e-9364-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 12:49:27 +0100 (CET)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-77d6b28aa9aso377361785a.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 03:49:27 -0800 (PST)
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
X-Inumbo-ID: 57b3bc0e-9364-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701776967; x=1702381767; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TwCFPVCbDa50OL/ChB5rqB+T/HQ9KdESV0FYZgKnLz8=;
        b=gN50E7ToYmdWWmXaHxhbM8Za1647qQHaDD2oW5n04lr31TjWCI7KQ94eMlxriiid2n
         FsDIPPLE8LLcovjZ8aYkU8Krdmgo+Ar6MouN9/mAcnrhGg3gC/8TUkzSK3bVX0IeBhp1
         17UohrgWhgRkMhGUxgX5xA/45uBZChyerFVQJlKHdCQcQp0dOMU41DR8d7sh9yp/8/tF
         WtZ8PnM78AsNsv3OZ2zCrOJ7/aTzUEB8VD6k0aXIPtSA2dJYo9sfUG0vec02jDcBIlzE
         8Ackh4DWhCw/rZIYXSsWc/WNFbiPZzgXl7p+HvHLfe1GHWYMt7c7ouuserP6QP7esy8/
         eS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701776967; x=1702381767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TwCFPVCbDa50OL/ChB5rqB+T/HQ9KdESV0FYZgKnLz8=;
        b=i+SWvudqraa5uexzowk552S8ZNMXva4wNVdRBW0W7zcN7RSdR8bFu456VuT0Lcm2gu
         PHO8VETuBpzPBRz+pxMS6EtGIoWRqPMbMmbKfJytfNNAjhd/FTqe5M4GGlbqkG/IpnCj
         GPH9z3P6SgDEGvH9jrhUzZVwmg4BNbRyy8kK82xLEE5978v2AesPuCrIvWzRhkTEiMGn
         w7MNTC74Ap5bXe36luXmCHUm6q8VLQ3v9ORowRHETcLiJrkZaRzGFEmgh7H3j9Hzvyog
         UWo+QHndvn21tzr/7QXPkvIkHgr96e6a+u4SD9SDX560lMyBT05TpBZYrmH13LX0eJrf
         Q7+A==
X-Gm-Message-State: AOJu0YyXUHlot/AlhWZvRuMGU3IlUrayWAqpy4UtS7LQLMg46IwY7e09
	MofDczTYNb8bNOxxU9Fq3YezFgdHg+DvuDnCD2zl7JoVPP0jYByD
X-Google-Smtp-Source: AGHT+IG2o4jiH5bSl5VNvxrNDC2PyfRcl0d4pga4m+fmo3ob7nhujhmfEJM2EXFV6uDeXdNRGnkWdJkWtdlmFEn0ew0=
X-Received: by 2002:a0c:d7cb:0:b0:67a:a721:b1a0 with SMTP id
 g11-20020a0cd7cb000000b0067aa721b1a0mr1101637qvj.91.1701776966791; Tue, 05
 Dec 2023 03:49:26 -0800 (PST)
MIME-Version: 1.0
References: <20231204075552.3585875-1-jens.wiklander@linaro.org>
 <232c2496-77d6-4e37-a400-dbefd135ef3c@xen.org> <0B35D609-5378-4180-B79E-0CAE69D42165@arm.com>
 <6aaeea8c-cba9-4d3b-85a8-905dfee69e6f@citrix.com>
In-Reply-To: <6aaeea8c-cba9-4d3b-85a8-905dfee69e6f@citrix.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 5 Dec 2023 12:49:15 +0100
Message-ID: <CAHUa44HKVT9-DozjsKs+bZBE573BBh=e-h5qGhW3xeCsajuo4g@mail.gmail.com>
Subject: Re: [RFC XEN PATCH] xen/arm: ffa: reclaim shared memory on guest destroy
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "patches@linaro.org" <patches@linaro.org>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Tue, Dec 5, 2023 at 11:53=E2=80=AFAM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 05/12/2023 8:14 am, Bertrand Marquis wrote:
> > Hi Julien,
> >
> > Thanks a lot for your review and comment, this is very helpful.
> >
> >> On 4 Dec 2023, at 20:24, Julien Grall <julien@xen.org> wrote:
> >>
> >> Hi Jens,
> >>
> >> On 04/12/2023 07:55, Jens Wiklander wrote:
> >>>        if ( ctx->rx )
> >>>          rxtx_unmap(ctx);
> >>>  +
> >>> +    list_for_each_entry_safe(shm, tmp, &ctx->shm_list, list)
> >>> +    {
> >>> +        register_t handle_hi;
> >>> +        register_t handle_lo;
> >>> +
> >>> +        uint64_to_regpair(&handle_hi, &handle_lo, shm->handle);
> >>> +        res =3D ffa_mem_reclaim(handle_lo, handle_hi, 0);
> >> Is this call expensive? If so, we may need to handle continuation here=
.
> > This call should not be expensive in the normal case as memory is recla=
imable
> > so there is no processing required in the SP and all is done in the SPM=
C which
> > should basically just return a yes or no depending on a state for the h=
andle.
> >
> > So I think this is the best trade.
> >
> > @Jens: One thing to consider is that a Destroy might get a retry or bus=
y answer and we
> > will have to issue it again and this is not considered in the current i=
mplementation.
> >
> > After discussing the subject internally we could in fact consider that =
if an SP cannot release
> > some memory shared with the VM destroyed, it should tell it by returnin=
g "retry" to the message.
> > Here that could simplify things by doing a strategy where:
> > - we retry on the VM_DESTROY message if required
> > - if some memory is not reclaimable we check if we could park it and ma=
ke the VM a zombie.
> > What do you think ?
>
> This is the cleanup issue discussed at XenSummit, isn't it?
>
> You cannot feasibly implement this cleanup by having
> ffa_domain_teardown() return -ERESTART.
>
> Yes, it will probably function - but now you're now bouncing in/out of
> Xen as fast as the CPU will allow, rechecking a condition which will
> take an unbounded quantity of time.  Meanwhile, you've tied up a
> userspace thread (the invocation of `xl destroy`) to do so, and one of
> dom0's vCPU for however long the scheduler is willing to schedule the
> destroy invocation, which will be 100% of the time as it's always busy
> in the hypervisor.
>
> The teardown/kill infrastructure is intended and expected to always make
> forward progress.
>

OK

>
> The closest thing to this patch which will work sanely is this:
>
> Hold a single domain reference for any non-zero amount of magic memory
> held.  See domain_adjust_tot_pages() and how it interacts with
> {get,put}_domain(), and copy it.  Importantly, this prevents the domain
> being freed until the final piece of magic memory has been released.
>
> Have some way (can be early on the teardown/kill path, or a separate
> hypercall - assuming the VM can't ever be scheduled again) to kick Xen
> into being responsible for trying to reclaim the memory.  (Start a
> timer, or reclaim in the idle loop, whatever.)
>
> This way, you can `xl destroy` a VM in an arbitrary state, *and* the
> invocation will terminate when Xen has nothing deterministic left to do,
> *and* in the case that the secure world or Xen has an issue, the VM will
> stay around as a zombie holding minimal resources.

Thanks for the pointers, very helpful, and now I at least know where
to start looking.

Cheers,
Jens

>
> ~Andrew

