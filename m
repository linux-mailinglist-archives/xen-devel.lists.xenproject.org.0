Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D767A5005E
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 14:23:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902263.1310212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpoiJ-0007TP-Rv; Wed, 05 Mar 2025 13:23:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902263.1310212; Wed, 05 Mar 2025 13:23:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpoiJ-0007Rx-P8; Wed, 05 Mar 2025 13:23:07 +0000
Received: by outflank-mailman (input) for mailman id 902263;
 Wed, 05 Mar 2025 13:23:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4HJ/=VY=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tpoiI-0007Rr-Rv
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 13:23:06 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6689420-f9c4-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 14:23:01 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-abec8b750ebso1176396666b.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 05:23:01 -0800 (PST)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac1e382a04bsm387908366b.163.2025.03.05.05.23.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 05:23:00 -0800 (PST)
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
X-Inumbo-ID: f6689420-f9c4-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741180981; x=1741785781; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wkESYSyUuD0YEz+TUV/Lx0vdZAF33mta7PSqeuTzt4=;
        b=YzxLk40YJtJ1Jha+gaFREL7M9R2kH/neStHr/pDVwMrO352/VOM5hA7EgXZ/oI7pjH
         f1N3HlIhQbPp7W+ZbQONvVcySWRXDD/J4xQnOKEImWBCeN5FxO3v1J4M17jIbcpEH6OC
         f1TweP68ahxelBFROy3K70QuDXr9FP6SmILD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741180981; x=1741785781;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5wkESYSyUuD0YEz+TUV/Lx0vdZAF33mta7PSqeuTzt4=;
        b=aVlbm3/IC2uQOhekxOIUYGRZIAr8Ygwr3FaojXJZAnzPCOW6pXgIHAM+zV6Mtjou8t
         XCSUJwxUY2OQ5izN9mXIvxTZjqtQuoSn3uT1HdtVmvm+nHQ0hZ2OsGRPvlc1VTODaySi
         NhJQXENcibguLnsn3J1CVtP9kyLKt0weOHoWob/tt9cUpJBEZ+GIleUHHlPfVEv1Ka08
         zvJhj/wi8qKzHLGqDQZU3+JYaFuWiPR358r1DamfG3ZQoiWATahkNyfLaPBroLadfe9W
         BeeZbqyp6Oyf7UfPyB6pPCGUNaNNRo7a6hEVehZ8TgKDG4DA231litlDKDYsHWrcEJ0t
         1fHg==
X-Forwarded-Encrypted: i=1; AJvYcCUCduHj44vJWr1udBCQ5qgmWsMAs3PWlbL1aOZz+AdgPBBqMsHXVJrfrrP1khDHK7VBZaTjmV3FbuI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxW1VtLV73V52dccHO7HEsli8+TIP+6dNmCiWPGvM+wMRT5sMSk
	lrLkGSO7I4iRSsZnn1HRUN6zD4KFfh6mL7pVTYz+EFBqPBF1Mi1vLZmRAPimgOw=
X-Gm-Gg: ASbGnctzmt17MKuC3oiboKLGRT0X+UL+TxZbVIagnMacTCz3aJKdH1Xwz3MINVNfVGf
	+RSUQQ52/2GD9ny2GMn9w3rIuae8Am0Ds1RxLdz/A1qRVy4jCLRgQNKBzi4Ej4kC63UjGk3uwaP
	zoiwviy/VSBrDo63vptVmszuRe28KrB8/99oePtBqrHweFAbqk5v3nyRiavAVem4MBHKAQHvXfc
	skzPB5WkrNff4xkPXYfW+UGwWBUr/m5BXqLiPLuTMCzbsox4ylVDB7p8nMioFPvYjgTM4UTrkXZ
	A9BZlnU3G1rglTuPl8gGOtfr4KuH+64b8n5iqioplXzcVoC4YDdtF9xOryONy2Fcmb4zdnOojHw
	=
X-Google-Smtp-Source: AGHT+IHgy3LlBrf6t2zjO88+G7Rl5lEpsz3WcqpIXMPvPwGHplfWYYnRjdGe7NF4LQl6yAXllgzZmg==
X-Received: by 2002:a17:907:7f89:b0:ac1:db49:99b7 with SMTP id a640c23a62f3a-ac20e42964amr320431366b.51.1741180981021;
        Wed, 05 Mar 2025 05:23:01 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Mar 2025 13:22:58 +0000
Message-Id: <D88D5732H4EQ.3770M7EIO3TW1@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD"
 <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/page_alloc: Simplify domain_adjust_tot_pages
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20250224132724.9074-1-alejandro.vallejo@cloud.com>
 <D80RCS1Y7AKH.373ULA2LO3MND@cloud.com>
 <4af0077c-c933-4894-bfad-2adda7afbbf7@suse.com>
 <D83AY7ZBKC81.3NBCLVK3DX833@cloud.com>
 <f50d8ee7-a00f-4f4f-99f6-4313af7a4fdc@suse.com>
In-Reply-To: <f50d8ee7-a00f-4f4f-99f6-4313af7a4fdc@suse.com>

On Wed Mar 5, 2025 at 10:49 AM GMT, Jan Beulich wrote:
> On 27.02.2025 15:36, Alejandro Vallejo wrote:
> > On Wed Feb 26, 2025 at 2:05 PM GMT, Jan Beulich wrote:
> >> On 24.02.2025 15:49, Alejandro Vallejo wrote:
> >>> Open question to whoever reviews this...
> >>>
> >>> On Mon Feb 24, 2025 at 1:27 PM GMT, Alejandro Vallejo wrote:
> >>>>      spin_lock(&heap_lock);
> >>>> -    /* adjust domain outstanding pages; may not go negative */
> >>>> -    dom_before =3D d->outstanding_pages;
> >>>> -    dom_after =3D dom_before - pages;
> >>>> -    BUG_ON(dom_before < 0);
> >>>> -    dom_claimed =3D dom_after < 0 ? 0 : dom_after;
> >>>> -    d->outstanding_pages =3D dom_claimed;
> >>>> -    /* flag accounting bug if system outstanding_claims would go ne=
gative */
> >>>> -    sys_before =3D outstanding_claims;
> >>>> -    sys_after =3D sys_before - (dom_before - dom_claimed);
> >>>> -    BUG_ON(sys_after < 0);
> >>>> -    outstanding_claims =3D sys_after;
> >>>> +    BUG_ON(outstanding_claims < d->outstanding_pages);
> >>>> +    if ( pages > 0 && d->outstanding_pages < pages )
> >>>> +    {
> >>>> +        /* `pages` exceeds the domain's outstanding count. Zero it =
out. */
> >>>> +        outstanding_claims -=3D d->outstanding_pages;
> >>>> +        d->outstanding_pages =3D 0;
> >>>
> >>> While this matches the previous behaviour, do we _really_ want it? It=
's weird,
> >>> quirky, and it hard to extend to NUMA-aware claims (which is somethin=
g in
> >>> midway through).
> >>>
> >>> Wouldn't it make sense to fail the allocation (earlier) if the claim =
has run
> >>> out? Do we even expect this to ever happen this late in the allocatio=
n call
> >>> chain?
> >>
> >> This goes back to what a "claim" means. Even without any claim, a doma=
in may
> >> allocate memory. So a claim having run out doesn't imply allocation ha=
s to
> >> fail.
> >=20
> > Hmmm... but that violates the purpose of the claim infra as far as I un=
derstand
> > it. If a domain may overallocate by (e.g) ballooning in memory it can d=
istort the
> > ability of another domain to start up, even if it succeeded in its own =
claim.
>
> Why would that be? As long as we hold back enough memory to cover the cla=
im, it
> shouldn't matter what kind of allocation we want to process. I'd say that=
 a PV
> guest starting ballooned ought to be able to deflate its balloon as far a=
s
> there was a claim established for it up front.

The fact a domain allocated something does not mean it had it claimed befor=
e. A
claim is a restriction to others' ability to allocate/claim, not to the dom=
ain
that made the claim. e.g:

  0. host is idle. No domU.
  1. dom1 is created with a claim to 10% of host memory and max_mem of 80% =
of
     host meomory.
  2. dom1 balloons in 70% of host memory.
  3. dom1 ballons out 70% of host memory.
  4. dom1 now holds a a claim to 80% of host memory.

It's all quite perverse. Fortunately, looking at adjacent claims-related co=
de
xl seems to default to making a claim prior to populating the physmap and
cancelling the claim at the end of the meminit() hook so this is never a re=
al
problem.

This tells me that the logic intent is to force early failure of
populate_physmap and nothing else. It's never active by the time ballooning=
 or
memory exchange matter at all.

Xen ought to cancel the claim by itself though, toolstack should not NEED t=
o do
it.

And furthermore, the fact that the claim goes up and down interacts really
poorly with the per-node claims I want to implement, because it's just
impossible to know if a freed page actually comes from a prior decrease of =
a
claim or not.

>
> > We might also break the invariant that total claims are strictly >=3D
> > total_avail_pages.
>
> Same here - I don't see why this would happen as long as all accounting i=
s
> working correctly.

See previous example.

>
> > I'm somewhat puzzled at the "why" of having separate concepts for max_m=
em and
> > claims. I guess it simply grew the way it did. Reinstating sanity would
> > probably involve making max_mem effectively the claim, but that's a ton=
 of
> > work I really would rather not do for now.
>
> To me the two are different (beyond claim being global while max-mem is p=
er-
> domain). max-mem is a hard boundary (beyond which allocations _will_ fail=
),
> whereas a claim is a softer one, beyond which allocations _may_ fail.
>
> Jan

What I meant is that I'd rather have a non-oversubscribed memory model by w=
hich
I can statically partition my memory and make 100% sure the sum of all max_=
mem
of every existing domain never exceeds host capacity. But this is neither t=
he
intent of the existing claim infra nor what I'm after right now. I was just
thinking out loud in text form. :)

Cheers,
Alejandro

