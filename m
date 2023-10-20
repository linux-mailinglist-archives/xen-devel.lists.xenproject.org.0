Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AA07D0F91
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 14:21:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619765.965370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtoUi-0004oK-KR; Fri, 20 Oct 2023 12:20:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619765.965370; Fri, 20 Oct 2023 12:20:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtoUi-0004ll-Hi; Fri, 20 Oct 2023 12:20:48 +0000
Received: by outflank-mailman (input) for mailman id 619765;
 Fri, 20 Oct 2023 12:20:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G6J+=GC=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1qtoUg-0004lf-KX
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 12:20:46 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16cb126c-6f43-11ee-98d5-6d05b1d4d9a1;
 Fri, 20 Oct 2023 14:20:45 +0200 (CEST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172]) by mx.zohomail.com
 with SMTPS id 1697804418701308.6957844333948;
 Fri, 20 Oct 2023 05:20:18 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-d77ad095f13so713901276.2
 for <xen-devel@lists.xenproject.org>; Fri, 20 Oct 2023 05:20:18 -0700 (PDT)
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
X-Inumbo-ID: 16cb126c-6f43-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; t=1697804419; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Jf9DXYPiMT1lKWd/PRevnRpk5Tv1irRDRNNBls3hXTIJqZJ3uZ+XPlbutXdYKBTjWR4W8QOVw3PUQrJmEZ15PeZ8PivRml40AVp/3Z/sEVYlx4q+dWgUtO2mBuf7G+u8r5xOio9Ju08FPqNLOM2jGGH0aVCo1iaga0hfkdPMSsA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1697804419; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Pvnpw8d2bEUZD+p1LK2EHGE40ro7es6rYeZB/3Oq2jk=; 
	b=PzlltwDmSoLVH1JAAJCLJnYRC4zAHX0YPM4UXRH6LQbvnXQVthAqt1nHFTRy02H+hiNOGDWbyf07rvl6Ubf7OrX7wHMPf+UVedIouoDh1Vq+Oz/l/dGLJTpe1YSe457dpOyo4UQe3z4R/MUv7TjxpIPijh8+LKlq8Dt56jrhKPY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1697804419;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Pvnpw8d2bEUZD+p1LK2EHGE40ro7es6rYeZB/3Oq2jk=;
	b=g2e2985/yIXnZw9k+5r58QhBF1DxSrOoF2YX7bZo7+2fDmq5bo9OsoUUEPcMNx+7
	W2t836RckoXtIHte3JJzg0czgGiKAVB6MzZyGly/gdjBXAFEx6avLFmEuIsAMqgPPaM
	XfjRX7IBK102bu0nHsDz2txA3tfT5XFzgQtOF/zw=
X-Gm-Message-State: AOJu0YyQdAHlwGShEsf2j6a+SHTJw+YgVVFzsD3Z6RsyS5gjC1iBAW6p
	uzrPkOVtgBmrrmoWcvHmhNzSFV7/2hUjBXmgaF8=
X-Google-Smtp-Source: AGHT+IHkHue2FIe99cFJU05iJHKw+6U9TvvMlaOXqBjEffh6NH4eqxdcfnhN/Pmtox96dRe5hlaN35lTCuXafrtvrVE=
X-Received: by 2002:a25:ef48:0:b0:d9a:4163:7b6d with SMTP id
 w8-20020a25ef48000000b00d9a41637b6dmr1550208ybm.59.1697804417743; Fri, 20 Oct
 2023 05:20:17 -0700 (PDT)
MIME-Version: 1.0
References: <20231018080242.1213-1-tamas@tklengyel.com> <cc20f0f7-0216-4755-a9ef-ad5fa60982f6@citrix.com>
 <7399BA16-EAC9-4AB9-8A31-6D5F34BCB376@arm.com> <376519cb-b7fa-4332-91d8-96c3e8714c57@citrix.com>
In-Reply-To: <376519cb-b7fa-4332-91d8-96c3e8714c57@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 20 Oct 2023 08:19:41 -0400
X-Gmail-Original-Message-ID: <CABfawh=pkCaEuizXe8YTVRtRwtoMvkz54w6nB5v=_EkHKvfuSA@mail.gmail.com>
Message-ID: <CABfawh=pkCaEuizXe8YTVRtRwtoMvkz54w6nB5v=_EkHKvfuSA@mail.gmail.com>
Subject: Re: [PATCH for-4.18] x86/mem_sharing: add missing m2p entry when
 mapping shared_info page
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Henry Wang <Henry.Wang@arm.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	George Dunlap <george.dunlap@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 20, 2023 at 6:57=E2=80=AFAM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 20/10/2023 2:14 am, Henry Wang wrote:
> > Hi all,
> >
> >> On Oct 20, 2023, at 07:48, Andrew Cooper <andrew.cooper3@citrix.com> w=
rote:
> >>
> >> On 18/10/2023 9:02 am, Tamas K Lengyel wrote:
> >>> When mapping in the shared_info page to a fork the m2p entry wasn't s=
et
> >>> resulting in the shared_info being reset even when the fork reset was=
 called
> >>> with only reset_state and not reset_memory. This results in an extra
> >>> unnecessary TLB flush.
> >>>
> >>> Fixes: 1a0000ac775 ("mem_sharing: map shared_info page to same gfn du=
ring fork")
> >>> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> >>> ---
> >>> xen/arch/x86/mm/mem_sharing.c | 2 ++
> >>> 1 file changed, 2 insertions(+)
> >>>
> >>> diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_shar=
ing.c
> >>> index 94b6b782ef..142258f16a 100644
> >>> --- a/xen/arch/x86/mm/mem_sharing.c
> >>> +++ b/xen/arch/x86/mm/mem_sharing.c
> >>> @@ -1847,6 +1847,8 @@ static int copy_special_pages(struct domain *cd=
, struct domain *d)
> >>>                                 p2m_ram_rw, p2m->default_access, -1);
> >>>             if ( rc )
> >>>                 return rc;
> >>> +
> >>> +            set_gpfn_from_mfn(mfn_x(new_mfn), gfn_x(old_gfn));
> >>>         }
> >>>     }
> >>>
> >> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>
> >> CC Henry.  This needs a view about a release ack.
> >>
> >> Cons: it's been broken since Xen 4.14 and we're very deep into the 4.1=
8
> >> code freeze.
> >>
> >> Pros: it's a bug and would clearly qualify for backport, and is in a
> >> niche feature so isn't plausibly going to adversely affect other users=
.
> > Given the fact that it will be backported anyway, I had the same discus=
sion with Juergen
> > in his thread [1]. So if we can bear the risk of delaying merging this =
patch for a week,
> > would it be ok to wait for the release and backport this patch to the s=
table tree? Thanks!
> >
> > [1] https://lore.kernel.org/xen-devel/83E6DCF6-926C-43A6-94D2-EB3B2C444=
309@arm.com/
> >
> > Kind regards,
> > Henry
>
> That's fine.  I'll pull this into my next branch for when the 4.19 tree
> opens.

Thanks, I agree that backporting is perfectly fine for this one.

Tamas

