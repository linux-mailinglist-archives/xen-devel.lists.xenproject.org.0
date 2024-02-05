Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 948BD849CA9
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 15:11:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676128.1052016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWzgD-0005T6-15; Mon, 05 Feb 2024 14:10:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676128.1052016; Mon, 05 Feb 2024 14:10:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWzgC-0005RH-U2; Mon, 05 Feb 2024 14:10:36 +0000
Received: by outflank-mailman (input) for mailman id 676128;
 Mon, 05 Feb 2024 14:10:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GYrN=JO=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rWzgB-0005RB-7L
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 14:10:35 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52c48451-c430-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 15:10:32 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-55ff5f6a610so3227807a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 06:10:32 -0800 (PST)
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
X-Inumbo-ID: 52c48451-c430-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1707142232; x=1707747032; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=isqSLNsyO1Z/m6NrOhdX+SC2ehMdHYvA5evFUfcg2nc=;
        b=DOWinvSsVWTNshJBqxHfeJGBjeCT+x/gpA4+2uw678bUqfdNY+Pajiq/wuQmc0/7Wl
         +GcvsQghdTSaoFbgx5LI4UGvwACMuOL9gJsKsY2I9UiMXWQx17l2ndw4REidjnekWjb9
         tXGc+qDIhu/splydL5/FECFMan/SOhmn1SQKlUZYv3FN6TWRoCY8b0KiXi0SpKNFyzWD
         PFbUS+A7YpeyUjTu18OJBwcHQUssMu2yR+PH5nA5GZHBVmoFgYQYynUGnKXTWRLlygwH
         1KCyv3/zT1ZqtIoEquWhLfnqQThTTba9DDnXWwvEaNeE+/Hh96O4FD/FEjlJqbIT5jss
         t3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707142232; x=1707747032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=isqSLNsyO1Z/m6NrOhdX+SC2ehMdHYvA5evFUfcg2nc=;
        b=qh4sbmn+fla/3nTzi/qj+sCdtEImOqJ/p02y/t7akiwc8623gD4/fZHHZEejOALak9
         Eo3S4xUh9S2bLFIcC1C4XAenGQ92sx6bVeeNUj4GsquI/h3oUjH75Lq3BJtBIuR5ZEvy
         +SZW71EWj1hY2Y9Gxu0xHGtguxQ/y4DWEQu+eLgFy/tf1YP7p2zMNSjr+tFOpyRcqc68
         yYmqxv5e7V60ErG3u94f8C0/+KIwhTztZUh7hQh0q3Q1VT+CarvD0eNFjDN8cNgBhbt5
         x1v4R8hK/zWXn7tJTLcGWLGFsqwOB3FL4t57JmzQDr2NqcckJ5MQxhPWt1TkMH8G0gzV
         4mzg==
X-Gm-Message-State: AOJu0YziLsZG6Rkfp066sudg8NjcaYDw6ztB6EVS9AQtbwFl17Pc5rhG
	k68eGsEPnVCW+osdpMFzZvOwcpbRHsvKDyn8xXQaXmE2U3DphVAL1SxXZKfJck7y3o7aARklOnn
	K4PnT9opi4p4x/45Xpeb7fO3Kp50HdiFNbv6/KFee7GClhY+t+CIvUg==
X-Google-Smtp-Source: AGHT+IGmrKVliBNlWXLrOIXZoAUW/ldABDPwlMcAPTe6FDs55Rt3TbRi3JGhkbXPAtgwohauXxtMn6hS+iNCVs/XHf4=
X-Received: by 2002:aa7:cf18:0:b0:55f:6b8:b304 with SMTP id
 a24-20020aa7cf18000000b0055f06b8b304mr5457510edy.8.1707142231692; Mon, 05 Feb
 2024 06:10:31 -0800 (PST)
MIME-Version: 1.0
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-11-carlo.nonato@minervasys.tech> <1739dbb4-5d7e-4d84-8d4b-bfb13c4041d8@suse.com>
 <CAG+AhRUJysNCrUXLiu8tvh2d7oL2hNAtkM3A2-Hy73f=+PxkTA@mail.gmail.com> <0ef140da-77d3-411f-8f19-eee0aaf1fa9d@suse.com>
In-Reply-To: <0ef140da-77d3-411f-8f19-eee0aaf1fa9d@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 5 Feb 2024 15:10:20 +0100
Message-ID: <CAG+AhRVTpcEHpWVY1qUNt3Uc-cDPqV2ZRe8rwfvY4YZUPUP7Ew@mail.gmail.com>
Subject: Re: [PATCH v6 10/15] xen: add cache coloring allocator for domains
To: Jan Beulich <jbeulich@suse.com>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Marco Solieri <marco.solieri@minervasys.tech>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Mon, Feb 5, 2024 at 1:38=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 05.02.2024 12:59, Carlo Nonato wrote:
> > On Thu, Feb 1, 2024 at 4:53=E2=80=AFPM Jan Beulich <jbeulich@suse.com> =
wrote:
> >> On 29.01.2024 18:18, Carlo Nonato wrote:
> >>> @@ -157,7 +158,11 @@
> >>>  #define PGC_static 0
> >>>  #endif
> >>>
> >>> -#define PGC_preserved (PGC_extra | PGC_static)
> >>> +#ifndef PGC_colored
> >>> +#define PGC_colored 0
> >>> +#endif
> >>> +
> >>> +#define PGC_preserved (PGC_extra | PGC_static | PGC_colored)
> >>>
> >>>  #ifndef PGT_TYPE_INFO_INITIALIZER
> >>>  #define PGT_TYPE_INFO_INITIALIZER 0
> >>> @@ -1504,6 +1509,7 @@ static void free_heap_pages(
> >>>              if ( !mfn_valid(page_to_mfn(predecessor)) ||
> >>>                   !page_state_is(predecessor, free) ||
> >>>                   (predecessor->count_info & PGC_static) ||
> >>> +                 (predecessor->count_info & PGC_colored) ||
> >>
> >> How about a 2nd #define (e.g. PGC_no_buddy_merge) to use here and ...
> >>
> >>>                   (PFN_ORDER(predecessor) !=3D order) ||
> >>>                   (page_to_nid(predecessor) !=3D node) )
> >>>                  break;
> >>> @@ -1528,6 +1534,7 @@ static void free_heap_pages(
> >>>              if ( !mfn_valid(page_to_mfn(successor)) ||
> >>>                   !page_state_is(successor, free) ||
> >>>                   (successor->count_info & PGC_static) ||
> >>> +                 (successor->count_info & PGC_colored) ||
> >>
> >> ... here? That'll then also avoid me commenting that I don't see why
> >> these two PGC_* checks aren't folded.
> >
> > Yes for me it's ok (I even suggested that in v5). Do you want this chan=
ge to
> > be merged with the previous patch? Or should they all belong to this on=
e?
>
> Or make yet another small prereq patch?

Ok.

> >>> +static void free_color_heap_page(struct page_info *pg, bool need_scr=
ub)
> >>> +{
> >>> +    unsigned int color =3D page_to_llc_color(pg);
> >>> +    struct page_list_head *head =3D color_heap(color);
> >>> +
> >>> +    spin_lock(&heap_lock);
> >>> +
> >>> +    mark_page_free(pg, page_to_mfn(pg));
> >>> +
> >>> +    if ( need_scrub )
> >>> +    {
> >>> +        pg->count_info |=3D PGC_need_scrub;
> >>> +        poison_one_page(pg);
> >>> +    }
> >>> +
> >>> +    pg->count_info |=3D PGC_colored;
> >>
> >> The page transiently losing PGC_colored is not an issue then (presumab=
ly
> >> because of holding the heap lock)? Did you consider having mark_page_f=
ree()
> >> also use PGC_preserved?
> >
> > I did something similar to what it's done in unprepare_staticmem_pages(=
):
> > first mark_page_free() is called and then PGC_static is added to count_=
info.
>
> I had guessed this would have been served as reference, yet by saying wha=
t
> you did you don't really answer my question. (Really I'm not entirely sur=
e
> the similar staticmem behavior is entirely correct.)

I think holding the heap lock allows writing pg->count_info. Anyway, yes, I
can use PGC_preserved in mark_page_free(), but then pages must be correctly
initialized with PGC_colored elsewhere.

> >>> +    if ( !pg )
> >>> +    {
> >>> +        spin_unlock(&heap_lock);
> >>> +        return NULL;
> >>> +    }
> >>> +
> >>> +    pg->count_info =3D PGC_state_inuse | PGC_colored |
> >>> +                     (pg->count_info & PGC_need_scrub);
> >>
> >> Isn't PGC_colored already set on the page?
> >
> > Yes but here I need to make sure that only PGC_state_inuse | PGC_colore=
d are
> > used so an assignment seems legit.
>
> Well, yes, you won't be able to avoid an assignment, but couldn't you
> preserve PGC_colored just like PGC_need_scrub is preserved? Or else
> at least assert the flag is set, to avoid giving the impression that
> right here pages can suddenly become "colored" ones? Then again them
> becoming so _may_ be needed during initialization.

Yeah, now I understood.

>
> >> Together with ...
> >>
> >>> +    free_colored_pages[color]--;
> >>> +    page_list_del(pg, color_heap(color));
> >>> +
> >>> +    if ( !(memflags & MEMF_no_tlbflush) )
> >>> +        accumulate_tlbflush(&need_tlbflush, pg, &tlbflush_timestamp)=
;
> >>> +
> >>> +    init_free_page_fields(pg);
> >>> +
> >>> +    spin_unlock(&heap_lock);
> >>> +
> >>> +    if ( test_and_clear_bit(_PGC_need_scrub, &pg->count_info) && scr=
ub )
> >>
> >> ... this, can't the above be simplified?
> >
> > I tried to replicate what happens in alloc_heap_pages() where:
> >
> >>  /* Preserve PGC_need_scrub so we can check it after lock is dropped. =
*/
> >>  pg[i].count_info =3D PGC_state_inuse | (pg[i].count_info & PGC_need_s=
crub);
> >
> > and then after the unlock the bit is tested.
>
> Again I was indeed assuming that you used existing code as reference.
> Yet again my question was whether that's actually what is needed here
> (which then may or may not mean that it could be done differently
> also there).

Ok. Probably isn't needed since we are referring to a single page. So I can
first test for the bit, save the result in a variable and remove the
preservation, then later use the variable instead of test_and_clear_bit().

> >>> @@ -2458,7 +2626,14 @@ struct page_info *alloc_domheap_pages(
> >>>      if ( memflags & MEMF_no_owner )
> >>>          memflags |=3D MEMF_no_refcount;
> >>>
> >>> -    if ( !dma_bitsize )
> >>> +    /* Only domains are supported for coloring */
> >>> +    if ( d && llc_coloring_enabled )
> >>> +    {
> >>> +        /* Colored allocation must be done on 0 order */
> >>> +        if ( order || (pg =3D alloc_color_heap_page(memflags, d)) =
=3D=3D NULL )
> >>> +            return NULL;
> >>> +    }
> >>
> >> I think I had asked before: What about MEMF_node() or MEMF_bits()
> >> having been used by the caller?
> >
> > MEMF_node() is used for NUMA, right? I think that for the moment, since=
 cache
> > coloring is supported only on arm64 and NUMA is not yet supported, it's=
 safe
> > to ignore it.
>
> NUMA or not, I'm wary of silent ignoring of inputs. I'd rather request
> that, just like with staticmem, precautions are then taken to avoid
> coloring and NUMA to be used together. Recall that much like your work,
> work to support NUMA is also in progress (unless it was canceled, but
> not so announced).

Ok.

> > I'm not sure I understood what MEMF_bits() is for. It restricts the all=
ocator
> > to return pages in some range, right?
>
> Correct.

So I need to think about this, since I see no easy way of supporting such a
thing with the current colored allocator implementation.
Do you have any suggestions?

Thanks.

> Jan

