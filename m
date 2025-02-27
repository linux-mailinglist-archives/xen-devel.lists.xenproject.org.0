Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B490A481A8
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 15:40:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898162.1306742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnf3I-0006ec-80; Thu, 27 Feb 2025 14:39:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898162.1306742; Thu, 27 Feb 2025 14:39:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnf3I-0006ce-39; Thu, 27 Feb 2025 14:39:52 +0000
Received: by outflank-mailman (input) for mailman id 898162;
 Thu, 27 Feb 2025 14:39:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VKwg=VS=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tnf3G-0006cY-NR
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 14:39:50 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b28f379d-f518-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 15:39:49 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aaf0f1adef8so187535166b.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Feb 2025 06:39:49 -0800 (PST)
Received: from localhost ([46.149.103.10]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c0dbc58sm132769366b.54.2025.02.27.06.39.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2025 06:39:48 -0800 (PST)
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
X-Inumbo-ID: b28f379d-f518-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1740667189; x=1741271989; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Qev3uV0BLx4dA+7+r95qLtorfP7vhozdsK3Zy2rJHk=;
        b=Jr1T0h/CtclMFdhQi+gcl2xBaAmiWs+t57Vo95WMiuGhIoCRsiV8QSnVEoQsJARPkA
         Wh89LpvCkB+mRGR02Qo8CchE64GJxdoVzsubhNMuc52giY6xo66l+3qyXeIDkAEkG9rL
         raLBMQtnYlSLmA948XdIAboEfndcwT8B26jHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740667189; x=1741271989;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9Qev3uV0BLx4dA+7+r95qLtorfP7vhozdsK3Zy2rJHk=;
        b=AP/6R9lDADe66p+FdEDFdCcpeUX89Caux3DnVUwviDP36N7XahbNaHazZC5Uj5cHvx
         ahuuCgavdrN2cocG8Uk0nzRfAQigEPZ66cJEdn9DbETgfb36MyKvgJK0nDGBgpuYYIWf
         wB0KtonmmT14lsIUkx1Syl4XdpMIpjAIJOije9aQVdL0Oz43Xx5on9pal7MlRANah+b/
         wuxZZNnbr7cwh306i3tJnO83vMB8fP3VWmvUByNrzbWTf2qsdq1bLEyahs/fH/H6rUbM
         Eg02M9HWk/8vV6GIsnyMRREcGvzg1MaWoS3ZROhxQv49c2fpGix04PtRROTH4r/8CNCR
         vg6A==
X-Gm-Message-State: AOJu0YwiOJ4/cIiFTd4jni/1V6/x4ZXiwddKKqs6eSF2VgMtwXYyXx87
	m6Zf1tBK2HANdAdGcLhEZnR36vcCYXvcNp1Bs8w6wmxofjpifLWvEHoFOhkwAjU=
X-Gm-Gg: ASbGncvMOc4sWNbjHWuylJtTVBnxGBB8LDi8TtPAud504jXyLxNOT1ICaC4dOF2ZZGM
	aPPegcpAaJN2LXk/FQMGhUgQuF4bsqlI+26EUeR0/KfGkFOwes0fztITAApFzGEoZzK0ww0ayA0
	l769GCAeCLImcF2ZedensJipV4lZUf+GQm3+ak/9f1bjZIU9e0dCDpHb2sCr/cemumNr96mRFJa
	71/0uX9sQtZiSSkJSZ1MJMwoC2YnT/xysR0WnbJlqz8DyzbTL6NTt72feLOdhvIff+9+7Eq9M+b
	XXKi5rQ5wuYoLnif8MpZiaQiSM28nGva
X-Google-Smtp-Source: AGHT+IHrO3MyN9zW+tYn6oEuv86rGk4RXHIPYHA8AWnRiMB8hrfDSufK4O1I3bkZfXDlTk9FdgcbtA==
X-Received: by 2002:a17:907:7d93:b0:ab3:60eb:f8b6 with SMTP id a640c23a62f3a-abeeef8c479mr965070066b.56.1740667188995;
        Thu, 27 Feb 2025 06:39:48 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Feb 2025 14:39:47 +0000
Message-Id: <D83B0QPWLN57.2MVDIUO8O3U3@cloud.com>
Cc: <xen-devel@lists.xenproject.org>, "Anthony PERARD"
 <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] xen/page_alloc: Simplify domain_adjust_tot_pages
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich"
 <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20250224132724.9074-1-alejandro.vallejo@cloud.com>
 <Z78djoAU7vjGepjr@macbook.local>
 <a9d4384c-770b-4947-b099-cf4bba1583a5@suse.com>
 <Z78lJfzqH9btDMrM@macbook.local>
 <292f8373-705a-4405-bbdb-af750eb5f0ac@suse.com>
 <Z787fHY6L0ssFDjG@macbook.local>
 <f30a8fcf-5bb2-41ff-bc9f-25e421665ab2@suse.com>
 <52adb963-9501-4d6b-a2cc-ec0e461baaf0@citrix.com>
 <4a5e8c55-4f90-4ff4-a643-cfa90203801e@suse.com>
 <c3f14dfb-65c4-47f8-ab81-8477da9b11c2@citrix.com>
In-Reply-To: <c3f14dfb-65c4-47f8-ab81-8477da9b11c2@citrix.com>

On Wed Feb 26, 2025 at 4:51 PM GMT, Andrew Cooper wrote:
> On 26/02/2025 4:42 pm, Jan Beulich wrote:
> > On 26.02.2025 17:34, Andrew Cooper wrote:
> >> On 26/02/2025 4:06 pm, Jan Beulich wrote:
> >>> On 26.02.2025 17:04, Roger Pau Monn=C3=A9 wrote:
> >>>> On Wed, Feb 26, 2025 at 03:36:33PM +0100, Jan Beulich wrote:
> >>>>> On 26.02.2025 15:28, Roger Pau Monn=C3=A9 wrote:
> >>>>>> On Wed, Feb 26, 2025 at 03:08:33PM +0100, Jan Beulich wrote:
> >>>>>>> On 26.02.2025 14:56, Roger Pau Monn=C3=A9 wrote:
> >>>>>>>> On Mon, Feb 24, 2025 at 01:27:24PM +0000, Alejandro Vallejo wrot=
e:
> >>>>>>>>> --- a/xen/common/page_alloc.c
> >>>>>>>>> +++ b/xen/common/page_alloc.c
> >>>>>>>>> @@ -490,13 +490,11 @@ static long outstanding_claims; /* total =
outstanding claims by all domains */
> >>>>>>>>> =20
> >>>>>>>>>  unsigned long domain_adjust_tot_pages(struct domain *d, long p=
ages)
> >>>>>>>>>  {
> >>>>>>>>> -    long dom_before, dom_after, dom_claimed, sys_before, sys_a=
fter;
> >>>>>>>>> -
> >>>>>>>>>      ASSERT(rspin_is_locked(&d->page_alloc_lock));
> >>>>>>>>>      d->tot_pages +=3D pages;
> >>>>>>>>> =20
> >>>>>>>>>      /*
> >>>>>>>>> -     * can test d->claimed_pages race-free because it can only=
 change
> >>>>>>>>> +     * can test d->outstanding_pages race-free because it can =
only change
> >>>>>>>>>       * if d->page_alloc_lock and heap_lock are both held, see =
also
> >>>>>>>>>       * domain_set_outstanding_pages below
> >>>>>>>>>       */
> >>>>>>>>> @@ -504,17 +502,16 @@ unsigned long domain_adjust_tot_pages(str=
uct domain *d, long pages)
> >>>>>>>>>          goto out;
> >>>>>>>> I think you can probably short-circuit the logic below if pages =
=3D=3D 0?
> >>>>>>>> (and avoid taking the heap_lock)
> >>>>>>> Are there callers passing in 0?
> >>>>>> Not sure, but if there are no callers expected we might add an ASS=
ERT
> >>>>>> to that effect then.
> >>>>>>
> >>>>>>>>>      spin_lock(&heap_lock);
> >>>>>>>>> -    /* adjust domain outstanding pages; may not go negative */
> >>>>>>>>> -    dom_before =3D d->outstanding_pages;
> >>>>>>>>> -    dom_after =3D dom_before - pages;
> >>>>>>>>> -    BUG_ON(dom_before < 0);
> >>>>>>>>> -    dom_claimed =3D dom_after < 0 ? 0 : dom_after;
> >>>>>>>>> -    d->outstanding_pages =3D dom_claimed;
> >>>>>>>>> -    /* flag accounting bug if system outstanding_claims would =
go negative */
> >>>>>>>>> -    sys_before =3D outstanding_claims;
> >>>>>>>>> -    sys_after =3D sys_before - (dom_before - dom_claimed);
> >>>>>>>>> -    BUG_ON(sys_after < 0);
> >>>>>>>>> -    outstanding_claims =3D sys_after;
> >>>>>>>>> +    BUG_ON(outstanding_claims < d->outstanding_pages);
> >>>>>>>>> +    if ( pages > 0 && d->outstanding_pages < pages )
> >>>>>>>>> +    {
> >>>>>>>>> +        /* `pages` exceeds the domain's outstanding count. Zer=
o it out. */
> >>>>>>>>> +        outstanding_claims -=3D d->outstanding_pages;
> >>>>>>>>> +        d->outstanding_pages =3D 0;
> >>>>>>>>> +    } else {
> >>>>>>>>> +        outstanding_claims -=3D pages;
> >>>>>>>>> +        d->outstanding_pages -=3D pages;
> >>>>>>>> I wonder if it's intentional for a pages < 0 value to modify
> >>>>>>>> outstanding_claims and d->outstanding_pages, I think those value=
s
> >>>>>>>> should only be set from domain_set_outstanding_pages().
> >>>>>>>> domain_adjust_tot_pages() should only decrease the value, but ne=
ver
> >>>>>>>> increase either outstanding_claims or d->outstanding_pages.
> >>>>>>>>
> >>>>>>>> At best the behavior is inconsistent, because once
> >>>>>>>> d->outstanding_pages reaches 0 there will be no further modifica=
tion
> >>>>>>>> from domain_adjust_tot_pages().
> >>>>>>> Right, at that point the claim has run out. While freeing pages w=
ith an
> >>>>>>> active claim means that the claim gets bigger (which naturally ne=
eds
> >>>>>>> reflecting in the global).
> >>>>>> domain_adjust_tot_pages() is not exclusively called when freeing
> >>>>>> pages, see steal_page() for example.
> >>>>> Or also when pages were allocated. steal_page() ...
> >>>>>
> >>>>>> When called from steal_page() it's wrong to increase the claim, as
> >>>>>> it assumes that the page removed from d->tot_pages is freed, but
> >>>>>> that's not the case.  The domain might end up in a situation where
> >>>>>> the claim is bigger than the available amount of memory.
> >>>>> ... is a case that likely wasn't considered when the feature was ad=
ded.
> >>>>>
> >>>>> I never really liked this; I'd be quite happy to see it ripped out,=
 as
> >>>>> long as we'd be reasonably certain it isn't in active use by people=
.
> >>>> What do you mean with 'it' in the above sentence, the whole claim
> >>>> stuff?
> >>> Yes.
> >>>
> >>>>  Or just getting rid of allowing the claim to increase as a
> >>>> result of pages being removed from a domain?
> >>> No.
> >> Alejandro and I discussed this earlier in the week.
> >>
> >> The claim infrastructure stuff is critical for a toolstack capable of
> >> doing things in parallel.
> >>
> >> However, it is also nonsensical for there to be a remaining claim by t=
he
> >> time domain construction is done.
> > I'm not entirely sure about this. Iirc it was the tmem work where this =
was
> > added, and then pretty certainly it was needed also for already running
> > domains.
>
> It wasn't TMEM.=C2=A0 It was generally large-memory VMs.
>
> The problem is if you've got 2x 2T VMs booting on a 3T system.
>
> Previously, you'd start building both of them, and minutes later they
> both fail because Xen was fully out of memory.
>
> Claim was introduced to atomically reserve the memory you were intending
> to build a domain with.
>
> For XenServer, we're working on NUMA fixes, and something that's
> important there is to be able to reserve memory on a specific NUMA node
> (hence why this is all getting looked at).
> >> If creation_finished were a concrete thing, rather than a bodge hacked
> >> into domain_unpause_by_systemcontroller(), it ought to be made to fail
> >> if there were an outstanding claim.=C2=A0 I suggested that we follow t=
hrough
> >> on a previous suggestion of making it a real hypercall (which is neede=
d
> >> by the encrypted VM crowd too).
> > Rather than failing we could simply zap the leftover?
>
> Hmm.=C2=A0 Perhaps.
>
> I'd be slightly wary about zapping a claim, but there should only be an
> outstanding claim if the toolstack did something wrong.
>
> OTOH, we absolutely definitely do need a real hypercall here at some
> point soon.
>
> ~Andrew

It should probably be removed at the end. Otherwise we're effectively leaki=
ng
all claimed but non-used memory for the lifetime of the domain.

Cheers,
Alejandro

