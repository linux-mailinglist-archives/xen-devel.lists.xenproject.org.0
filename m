Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A83213977
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jul 2020 13:40:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrK34-0002kM-B1; Fri, 03 Jul 2020 11:40:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bw0N=AO=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jrK33-0002cF-2T
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 11:40:05 +0000
X-Inumbo-ID: ef762cde-bd21-11ea-8496-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef762cde-bd21-11ea-8496-bc764e2007e4;
 Fri, 03 Jul 2020 11:40:04 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r12so32248965wrj.13
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2020 04:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=ljcIZ6Vuoj5BaNfMxfLHzi0gzvCqFiRu4i4B6UXaF44=;
 b=khNDcJIvTe5mlrs8ldRfBcIoXNzNB9pG9mpWl1pBhlyY4vf3HZMAy9rrF1btR9X40N
 S0o7c3jNQ6wzLKq0fEqrJIpEGYVRY6e4CcQuIeZBdfXb569SVOMyV/yLO0RoPiYnIsU4
 2vtAJIZ6O+5ym1fEBzeGAIFnlq5T43FcX4sYTDgnjXPkPNfBEjdrlWVPnFBNwMWNWuDC
 6H8vSDriNggnuSzDDrq9qPxrIED1lPve3lE4V+xzxMafYcDZzv9dm8uvHpF470YQKFhn
 c1UHjKyQRsJKxDibTW1PsDcVvbIQZ0FS60DmdODMdqtakw0ZF5A1tk+Bf3V9KMY6v0uQ
 rIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=ljcIZ6Vuoj5BaNfMxfLHzi0gzvCqFiRu4i4B6UXaF44=;
 b=fRTVmYlCIqNfOJGNDEKhCMlhg0bEHG0CRgYgQdrUnCZt2mZ0t/GwXGoHbkpXYsGf0J
 fiKJ92hwI3D6ShNdIeXPVA8tfrJ1QhhEJ1juUUCsWy4BbdLuHUBanqvHj+G6QO3+XyU6
 FGw+MP9fVg9hoEGgvNtWXEFLBk8q9rD9dRhGEC9MRGxpPJbmbV9b1oZncauNEnCpUJ/c
 yy5FtTH5Ae7ZXg74NDGwrlVCKYxH6ErwhxXzTcgItZun8PtU0u+1pzyhitheCGv/OReq
 G1ZF6ivuvtTo07mtmuz/ljwztUzVeCr6TIuNQtGtVWj7SRz52c1QLOA2I2qDyAjEdYyT
 yY5Q==
X-Gm-Message-State: AOAM530Gc7v7/TpFP/xHsZxsb1LA0DHx+ynRev5g1CkQ3pgnkuUoUlwI
 8AWzYoXehe4GCh5fWLsBG7M=
X-Google-Smtp-Source: ABdhPJwr9/tovbfxVLzPHiQ876c1htNcIIcr9lKS4drt4oK8MKec9gW77p5JnK73PDcFFQOCclI7zw==
X-Received: by 2002:adf:e482:: with SMTP id i2mr35793062wrm.75.1593776403390; 
 Fri, 03 Jul 2020 04:40:03 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id q7sm14638109wrs.27.2020.07.03.04.40.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 Jul 2020 04:40:02 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
 =?utf-8?Q?'Micha=C5=82_Leszczy=C5=84ski'?= <michal.leszczynski@cert.pl>,
 <xen-devel@lists.xenproject.org>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <a317b169e3710a481bb4be066d9b878f27b3e66c.1593519420.git.michal.leszczynski@cert.pl>
 <5be6cb58-82d0-0a78-a9b2-5c078b5d3587@xen.org>
 <004901d65128$16a6f330$43f4d990$@xen.org>
 <481e8ee7-561a-10d6-4358-7b07a8911ce8@xen.org>
In-Reply-To: <481e8ee7-561a-10d6-4358-7b07a8911ce8@xen.org>
Subject: RE: [PATCH v4 06/10] memory: batch processing in acquire_resource()
Date: Fri, 3 Jul 2020 12:40:01 +0100
Message-ID: <004a01d6512e$b0b5fab0$1221f010$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFzyG1KjeOu8uNiQeFGxRZBsBXsYgGYFxRdAaoW8QMB0iLMpgFYu/uhqYdjH6A=
Content-Language: en-gb
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
Reply-To: paul@xen.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, tamas.lengyel@intel.com,
 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>,
 luwei.kang@intel.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: 03 July 2020 12:18
> To: paul@xen.org; 'Micha=C5=82 Leszczy=C5=84ski' =
<michal.leszczynski@cert.pl>; xen-devel@lists.xenproject.org
> Cc: luwei.kang@intel.com; tamas.lengyel@intel.com; 'Andrew Cooper' =
<andrew.cooper3@citrix.com>;
> 'George Dunlap' <george.dunlap@citrix.com>; 'Ian Jackson' =
<ian.jackson@eu.citrix.com>; 'Jan Beulich'
> <jbeulich@suse.com>; 'Stefano Stabellini' <sstabellini@kernel.org>; =
'Wei Liu' <wl@xen.org>
> Subject: Re: [PATCH v4 06/10] memory: batch processing in =
acquire_resource()
>=20
> Hi,
>=20
> On 03/07/2020 11:52, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Julien Grall <julien@xen.org>
> >> Sent: 03 July 2020 11:36
> >> To: Micha=C5=82 Leszczy=C5=84ski <michal.leszczynski@cert.pl>; =
xen-devel@lists.xenproject.org
> >> Cc: luwei.kang@intel.com; tamas.lengyel@intel.com; Andrew Cooper =
<andrew.cooper3@citrix.com>;
> George
> >> Dunlap <george.dunlap@citrix.com>; Ian Jackson =
<ian.jackson@eu.citrix.com>; Jan Beulich
> >> <jbeulich@suse.com>; Stefano Stabellini <sstabellini@kernel.org>; =
Wei Liu <wl@xen.org>;
> paul@xen.org
> >> Subject: Re: [PATCH v4 06/10] memory: batch processing in =
acquire_resource()
> >>
> >> (+ Paul as the author XENMEM_acquire_resource)
> >>
> >> Hi,
> >>
> >> On 30/06/2020 13:33, Micha=C5=82 Leszczy=C5=84ski wrote:
> >>> From: Michal Leszczynski <michal.leszczynski@cert.pl>
> >>>
> >>> Allow to acquire large resources by allowing acquire_resource()
> >>> to process items in batches, using hypercall continuation.
> >>>
> >>> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> >>> ---
> >>>    xen/common/memory.c | 32 +++++++++++++++++++++++++++++---
> >>>    1 file changed, 29 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/xen/common/memory.c b/xen/common/memory.c
> >>> index 714077c1e5..3ab06581a2 100644
> >>> --- a/xen/common/memory.c
> >>> +++ b/xen/common/memory.c
> >>> @@ -1046,10 +1046,12 @@ static int acquire_grant_table(struct =
domain *d, unsigned int id,
> >>>    }
> >>>
> >>>    static int acquire_resource(
> >>> -    XEN_GUEST_HANDLE_PARAM(xen_mem_acquire_resource_t) arg)
> >>> +    XEN_GUEST_HANDLE_PARAM(xen_mem_acquire_resource_t) arg,
> >>> +    unsigned long *start_extent)
> >>>    {
> >>>        struct domain *d, *currd =3D current->domain;
> >>>        xen_mem_acquire_resource_t xmar;
> >>> +    uint32_t total_frames;
> >>>        /*
> >>>         * The mfn_list and gfn_list (below) arrays are ok on stack =
for the
> >>>         * moment since they are small, but if they need to grow in =
future
> >>> @@ -1077,8 +1079,17 @@ static int acquire_resource(
> >>>            return 0;
> >>>        }
> >>>
> >>> +    total_frames =3D xmar.nr_frames;
> >>
> >> On 32-bit, the start_extent would be 26-bits wide which is not =
enough to
> >> cover all the xmar.nr_frames. Therefore, you want that check that =
it is
> >> possible to encode a continuation. Something like:
> >>
> >> /* Is the size too large for us to encode a continuation? */
> >> if ( unlikely(xmar.nr_frames > (UINT_MAX >> MEMOP_EXTENT_SHIFT)) )
> >>
> >>> +
> >>> +    if ( *start_extent ) > +    {
> >>> +        xmar.frame +=3D *start_extent;
> >>> +        xmar.nr_frames -=3D *start_extent;
> >>
> >> As start_extent is exposed to the guest, you want to check if it is =
not
> >> bigger than xmar.nr_frames.
> >>
> >>> +        guest_handle_add_offset(xmar.frame_list, *start_extent);
> >>> +    }
> >>> +
> >>>        if ( xmar.nr_frames > ARRAY_SIZE(mfn_list) )
> >>> -        return -E2BIG;
> >>> +        xmar.nr_frames =3D ARRAY_SIZE(mfn_list);
> >>
> >> The documentation of the hypercall suggests that if you pass NULL, =
then
> >> it will return the maximum number value for nr_frames supported by =
the
> >> implementation. So technically a domain cannot use more than
> >> ARRAY_SIZE(mfn_list).
> >>
> >> However, you new addition conflict with the documentation. Can you
> >> clarify how a domain will know that it can use more than
> >> ARRAY_SIZE(mfn_list)?
> >
> > The domain should not need to know. It should be told the maximum =
number of frames of the type it
> wants. If we have to carve that up into batches inside Xen then the =
caller should not need to care,
> right?
>=20
> In the current implementation, we tell the guest how many frames it =
can
> request in a batch. This number may be much smaller that the maximum
> number of frames of the type.
>=20
> Furthermore this value is not tie to the xmar.type. Therefore, it is
> valid for a guest to call this hypercall only once at boot to figure =
out
> the maximum batch.
>=20
> So while the change you suggest looks a good idea, I don't think it is
> possible to do that with the current hypercall.
>=20

Oh, I was clearly misremembering what the semantic was; I thought it was =
implementation max for the given type but indeed we do just return the =
array size, so we expect the caller to know the individual resource type =
limitations.
So, as Jan says, passing back UINT_MAX >> MEMOP_EXTENT_SHIFT seems to be =
what we need.

  Paul


