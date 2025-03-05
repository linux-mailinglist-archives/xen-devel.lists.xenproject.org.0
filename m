Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EBEA502D1
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 15:55:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902406.1310374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpq9b-0005RM-NG; Wed, 05 Mar 2025 14:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902406.1310374; Wed, 05 Mar 2025 14:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpq9b-0005PA-Ii; Wed, 05 Mar 2025 14:55:23 +0000
Received: by outflank-mailman (input) for mailman id 902406;
 Wed, 05 Mar 2025 14:55:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4HJ/=VY=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tpq9a-0004vg-GX
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 14:55:22 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbf4e03d-f9d1-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 15:55:20 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4398ec2abc2so61657065e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 06:55:20 -0800 (PST)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e485e13fsm21038964f8f.100.2025.03.05.06.55.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 06:55:18 -0800 (PST)
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
X-Inumbo-ID: dbf4e03d-f9d1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741186520; x=1741791320; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JeJp7PNGj3PTSByjNRhWi6B3e4Yw3Mgr8V+GQ5vcDn8=;
        b=Ahwxe1cfdlks/45EQHEZsXv/c3VRtmdYUjQaHJ3Wz+6NpWFVQ5Yp54o7RYvOy+2Oo+
         5MGwwboxND7QOGHoAwl4yuPrRs4ZWZ0rOKMou9oJVuAddqITBh6DT1Px0pCFTXfSWjph
         qTXfW5zOWR1IKPJ3sivey06QeHf16AnUL3Ggk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741186520; x=1741791320;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JeJp7PNGj3PTSByjNRhWi6B3e4Yw3Mgr8V+GQ5vcDn8=;
        b=iw44CoBtnDlRyxJpee628YPvfqJ7fNXDkfG8DBluLhRRX+DjA6/42Ng/lV7rg671sg
         10kngXIb2m5CuVlpUPlTOwTr0jfY3fKiDLSDUxqEzB9M1kKVNqQaxeyUXrMldRcqq1Jp
         Uho2DpJccmCfW7uobWg5ME4cWNBHXouprtREUiMbTKjeVDDDL+I51MvUhaTLmnCd+uWA
         jEWMBqKJePtPMrww45prSlk2U+BCJaHKTCIDaoFEWD17Y1fbTQox43LvRudX9I0DlYh5
         Kd9AjK+sUtzuQNJx1RXIm+AHJQgmHavCLB6YIF1qwsWvlBWBemtvLus+FFI7kEIJRyIJ
         kBbA==
X-Forwarded-Encrypted: i=1; AJvYcCWFtUkyAsX8d7HJqQ+gUUTm0XpVT9ScQj3+nBGeRmldoS2xWPVCBrYxDlbqfKFQSDw2uCSUm1ODyV8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywk5ljmZfuJxnHMH+ayHNP4dSHr4zhuVYG6GpZxwytqyo2SujFP
	ikviVU4RjUoe/NMpDrFurRHcaWXVdkSpJe8IYCjh363dqZyge7DI9LVI2Y9ZAFc=
X-Gm-Gg: ASbGncumXb8MdZcLgf+juPjqqjidWu0YR7fMVjObW48kA96LLl6gwMGxbX2IoPMinOy
	Wtaf6hWwcqizVh6/0EBwF7VamqHWevkZLwJ2oZOUMCS66r2ZUe8oDefPJmTLLi6GZ9LKrCZ0szn
	i1ZjDmjuzDAx/EP1SLDN+i+jbRCVVdm/wQiHwCSKUsYzB0C0os3t0fbTR/UxQzBoUWEse2K44xJ
	3a4vH0OQAdgg8jFPZLnLCUdOHMIVqGIt93Nt/mWk47Lf7BORnhyv7KODtsc6DFWai3enO57OZ0r
	xKE/UgKk4+I1iX5d0DAOfs/qnKgBSL6tRGo7JcHhUDB3HxUG5bnnoxOcXIu6o14OtMcAPIb8+sw
	=
X-Google-Smtp-Source: AGHT+IExiyIcGfObRXeFi9SVwwkN5CstKutiokwjhu6TowkHMzoM0sOfc7MRqxrc5BnCVhEXKAyhuA==
X-Received: by 2002:a5d:64c5:0:b0:38d:d371:e04d with SMTP id ffacd0b85a97d-3911f7bbb52mr2766444f8f.34.1741186518564;
        Wed, 05 Mar 2025 06:55:18 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Mar 2025 14:55:16 +0000
Message-Id: <D88F3V276W5M.WVP7OIPMJMSD@cloud.com>
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD"
 <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/page_alloc: Simplify domain_adjust_tot_pages
X-Mailer: aerc 0.18.2
References: <20250224132724.9074-1-alejandro.vallejo@cloud.com>
 <D80RCS1Y7AKH.373ULA2LO3MND@cloud.com>
 <4af0077c-c933-4894-bfad-2adda7afbbf7@suse.com>
 <D83AY7ZBKC81.3NBCLVK3DX833@cloud.com>
 <f50d8ee7-a00f-4f4f-99f6-4313af7a4fdc@suse.com>
 <D88D5732H4EQ.3770M7EIO3TW1@cloud.com>
 <6070a7b3-4d1d-4db9-a812-5887de129aa1@suse.com>
In-Reply-To: <6070a7b3-4d1d-4db9-a812-5887de129aa1@suse.com>

On Wed Mar 5, 2025 at 1:39 PM GMT, Jan Beulich wrote:
> On 05.03.2025 14:22, Alejandro Vallejo wrote:
> > On Wed Mar 5, 2025 at 10:49 AM GMT, Jan Beulich wrote:
> >> On 27.02.2025 15:36, Alejandro Vallejo wrote:
> >>> On Wed Feb 26, 2025 at 2:05 PM GMT, Jan Beulich wrote:
> >>>> On 24.02.2025 15:49, Alejandro Vallejo wrote:
> >>>>> Open question to whoever reviews this...
> >>>>>
> >>>>> On Mon Feb 24, 2025 at 1:27 PM GMT, Alejandro Vallejo wrote:
> >>>>>>      spin_lock(&heap_lock);
> >>>>>> -    /* adjust domain outstanding pages; may not go negative */
> >>>>>> -    dom_before =3D d->outstanding_pages;
> >>>>>> -    dom_after =3D dom_before - pages;
> >>>>>> -    BUG_ON(dom_before < 0);
> >>>>>> -    dom_claimed =3D dom_after < 0 ? 0 : dom_after;
> >>>>>> -    d->outstanding_pages =3D dom_claimed;
> >>>>>> -    /* flag accounting bug if system outstanding_claims would go =
negative */
> >>>>>> -    sys_before =3D outstanding_claims;
> >>>>>> -    sys_after =3D sys_before - (dom_before - dom_claimed);
> >>>>>> -    BUG_ON(sys_after < 0);
> >>>>>> -    outstanding_claims =3D sys_after;
> >>>>>> +    BUG_ON(outstanding_claims < d->outstanding_pages);
> >>>>>> +    if ( pages > 0 && d->outstanding_pages < pages )
> >>>>>> +    {
> >>>>>> +        /* `pages` exceeds the domain's outstanding count. Zero i=
t out. */
> >>>>>> +        outstanding_claims -=3D d->outstanding_pages;
> >>>>>> +        d->outstanding_pages =3D 0;
> >>>>>
> >>>>> While this matches the previous behaviour, do we _really_ want it? =
It's weird,
> >>>>> quirky, and it hard to extend to NUMA-aware claims (which is someth=
ing in
> >>>>> midway through).
> >>>>>
> >>>>> Wouldn't it make sense to fail the allocation (earlier) if the clai=
m has run
> >>>>> out? Do we even expect this to ever happen this late in the allocat=
ion call
> >>>>> chain?
> >>>>
> >>>> This goes back to what a "claim" means. Even without any claim, a do=
main may
> >>>> allocate memory. So a claim having run out doesn't imply allocation =
has to
> >>>> fail.
> >>>
> >>> Hmmm... but that violates the purpose of the claim infra as far as I =
understand
> >>> it. If a domain may overallocate by (e.g) ballooning in memory it can=
 distort the
> >>> ability of another domain to start up, even if it succeeded in its ow=
n claim.
> >>
> >> Why would that be? As long as we hold back enough memory to cover the =
claim, it
> >> shouldn't matter what kind of allocation we want to process. I'd say t=
hat a PV
> >> guest starting ballooned ought to be able to deflate its balloon as fa=
r as
> >> there was a claim established for it up front.
> >=20
> > The fact a domain allocated something does not mean it had it claimed b=
efore. A
> > claim is a restriction to others' ability to allocate/claim, not to the=
 domain
> > that made the claim.
>
> Yes and no. No in so far as the target's "ability to allocate" may or may=
 not
> be meant to extend beyond domain creation.
>
> > e.g:
> >=20
> >   0. host is idle. No domU.
> >   1. dom1 is created with a claim to 10% of host memory and max_mem of =
80% of
> >      host meomory.
> >   2. dom1 balloons in 70% of host memory.
> >   3. dom1 ballons out 70% of host memory.
> >   4. dom1 now holds a a claim to 80% of host memory.
>
> Sure, this shouldn't be the result. Yet that may merely be an effect of c=
laim
> accounting being insufficient.
>
> > It's all quite perverse. Fortunately, looking at adjacent claims-relate=
d code
> > xl seems to default to making a claim prior to populating the physmap a=
nd
> > cancelling the claim at the end of the meminit() hook so this is never =
a real
> > problem.
> >=20
> > This tells me that the logic intent is to force early failure of
> > populate_physmap and nothing else. It's never active by the time balloo=
ning or
> > memory exchange matter at all.
>
> Ah yes, this I find more convincing. (Oddly enough this is all x86-only c=
ode.)

(about claims being an x86-ism in toolstack). Yeah, that's weird. It's shou=
ld
be moved in time to a common area of xg. I guess no other arch has cared ab=
out
bootstorms or massive VMs just yet.

>
> > Xen ought to cancel the claim by itself though, toolstack should not NE=
ED to do
> > it.
>
> Fundamentally yes. Except that the toolstack can do it earlier than Xen c=
ould.
>
> Jan

Yes, in the sense that it can do it just after it's done populating the
physmap, but Xen should still zero it at the end in case toolstack hasn't d=
one
so. Nothing good can come out of that counter going up and down in such a
dubious fashion.

Cheers,
Alejandro

