Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC461315861
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 22:15:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83438.155306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9aLO-0002dT-Vg; Tue, 09 Feb 2021 21:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83438.155306; Tue, 09 Feb 2021 21:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9aLO-0002d4-S5; Tue, 09 Feb 2021 21:14:46 +0000
Received: by outflank-mailman (input) for mailman id 83438;
 Tue, 09 Feb 2021 21:14:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4M0B=HL=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1l9aLM-0002cz-K1
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 21:14:44 +0000
Received: from mail-ej1-x629.google.com (unknown [2a00:1450:4864:20::629])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8760d633-fe97-461d-bdb0-4c6e907c504a;
 Tue, 09 Feb 2021 21:14:43 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id p20so34211467ejb.6
 for <xen-devel@lists.xenproject.org>; Tue, 09 Feb 2021 13:14:43 -0800 (PST)
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
X-Inumbo-ID: 8760d633-fe97-461d-bdb0-4c6e907c504a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UxYIthWvsnz3bn3mTcJ1XLDF5SIGF/4rISVDwpXXG10=;
        b=ghnuU4TVsMS5N0k0aQH9BtI+q2/o/TX6KIh0aTPA80VoduLACMh4UMAXVU2uXnrxJG
         RgppA1ZqXsE8sShAQbt/ijh1A92D6O1jwOiSu4zHccSCVmxUPXlB2p+E9CHIKUvcvg+m
         Pxg4vOZESO1T8DHGmiHqK7BSoGre9/Y7O4s5YONXC8pRbleIu+wBz2tzzq5/w/eZ2KNH
         rX/ahHgeHG9071YawIuuQmKf0SoM5Co5F/7oVul3GMc8saMLaghRhHGQyD/FN3eCwARn
         NIX8LxIEEssw7n+itYRn1Q1Qar3EIMxfQnsFaaC5HipPZNQgotWidRSqFfbw1jH2EEVZ
         TLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UxYIthWvsnz3bn3mTcJ1XLDF5SIGF/4rISVDwpXXG10=;
        b=bgwBnhg8r+uPtwOPOAX3ToD2JxgBGUQRyL96vFR3KFngzZrh44s3UviPquVCsq7Dtv
         xy3ic4BYxubk6MbWyFnE9x/RO8jhEaMRneFAplbazVEy9khN0nQ1NuAfcsVZi3gQpxts
         N4LMfDp6v3jEg/gaAotCtD0i8i3Zq+PKLr+IYcX9K/60l3CSzEqDa8WVfDc6QOqcD+3a
         Zg0h+OrSCxY8DgxgUxl+Nv+/LmnkUhrrUtghD710owcg60dWi/ug3pJQUKrdeLKV3Ur3
         58t98LPFASRdhbZ8W0tYKyK3+X5TRfeIoE/ukzr7Q9Pky807nudRsFw7KsjFKLjB6gaR
         5FnQ==
X-Gm-Message-State: AOAM530bTFnkpIF9coM3TNwWbiHUKh806Edgfy/MB344DQiWjgSXev5f
	JGcm/rAJUut5luqi1aoauTAbd9TwttUuzBU0kY8=
X-Google-Smtp-Source: ABdhPJzXPHoNgJdVMGpTD39cX60XZyKAR7/6Bu7mttA7mFKalBKSQEQRIaARLdQQvUKBP/rij+YhPOWBGWr5M9JZSb8=
X-Received: by 2002:a17:906:2f07:: with SMTP id v7mr24223984eji.343.1612905282942;
 Tue, 09 Feb 2021 13:14:42 -0800 (PST)
MIME-Version: 1.0
References: <20210209152816.15792-1-julien@xen.org> <20210209152816.15792-4-julien@xen.org>
 <04f601d6ff22$1f52cf60$5df86e20$@xen.org>
In-Reply-To: <04f601d6ff22$1f52cf60$5df86e20$@xen.org>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Tue, 9 Feb 2021 21:14:32 +0000
Message-ID: <CAJ=z9a18XxQLrUanxg_E7Vups7aRee93_vFhqxu1=yq+VdXH-w@mail.gmail.com>
Subject: Re: [for-4.15][PATCH v2 3/5] xen/iommu: iommu_map: Don't crash the
 domain if it is dying
To: Paul Durrant <paul@xen.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, hongyxia@amazon.co.uk, 
	Ian Jackson <iwj@xenproject.org>, Julien Grall <jgrall@amazon.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Feb 2021 at 20:28, Paul Durrant <xadimgnik@gmail.com> wrote:
>
> > -----Original Message-----
> > From: Julien Grall <julien@xen.org>
> > Sent: 09 February 2021 15:28
> > To: xen-devel@lists.xenproject.org
> > Cc: hongyxia@amazon.co.uk; iwj@xenproject.org; Julien Grall <jgrall@amazon.com>; Jan Beulich
> > <jbeulich@suse.com>; Paul Durrant <paul@xen.org>
> > Subject: [for-4.15][PATCH v2 3/5] xen/iommu: iommu_map: Don't crash the domain if it is dying
> >
> > From: Julien Grall <jgrall@amazon.com>
> >
> > It is a bit pointless to crash a domain that is already dying. This will
> > become more an annoyance with a follow-up change where page-table
> > allocation will be forbidden when the domain is dying.
> >
> > Security wise, there is no change as the devices would still have access
> > to the IOMMU page-tables even if the domain has crashed until Xen
> > start to relinquish the resources.
> >
> > For x86, we rely on dom_iommu(d)->arch.mapping.lock to ensure
> > d->is_dying is correctly observed (a follow-up patch will held it in the
>
> s/held/hold
>
> > relinquish path).
> >
> > For Arm, there is still a small race possible. But there is so far no
> > failure specific to a domain dying.
> >
> > Signed-off-by: Julien Grall <jgrall@amazon.com>
> >
> > ---
> >
> > This was spotted when trying to destroy IOREQ servers while the domain
> > is dying. The code will try to add the entry back in the P2M and
> > therefore update the P2M (see arch_ioreq_server_disable() ->
> > hvm_add_ioreq_gfn()).
> >
> > It should be possible to skip the mappin in hvm_add_ioreq_gfn(), however
>
> s/mappin/mapping
>
> > I didn't try a patch yet because checking d->is_dying can be racy (I
> > can't find a proper lock).
> >
> > Changes in v2:
> >     - Patch added
> > ---
> >  xen/drivers/passthrough/iommu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
> > index 879d238bcd31..75419f20f76d 100644
> > --- a/xen/drivers/passthrough/iommu.c
> > +++ b/xen/drivers/passthrough/iommu.c
> > @@ -272,7 +272,7 @@ int iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
> >                              flush_flags) )
> >                  continue;
> >
> > -        if ( !is_hardware_domain(d) )
> > +        if ( !is_hardware_domain(d) && !d->is_dying )
> >              domain_crash(d);
>
> Would it make more sense to check is_dying inside domain_crash() (and turn it into a no-op in that case)?

Jan also suggested moving the check in domain_crash(). However, I felt
it is potentially a too risky change for 4.15 as there are quite a few
callers.

Cheers,

