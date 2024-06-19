Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A87D090F2C9
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 17:47:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743901.1150896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJxW3-0006EH-7c; Wed, 19 Jun 2024 15:46:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743901.1150896; Wed, 19 Jun 2024 15:46:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJxW3-0006CA-3c; Wed, 19 Jun 2024 15:46:31 +0000
Received: by outflank-mailman (input) for mailman id 743901;
 Wed, 19 Jun 2024 15:46:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hkwz=NV=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1sJxW2-0006C4-2U
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 15:46:30 +0000
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [2607:f8b0:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1575b600-2e53-11ef-b4bb-af5377834399;
 Wed, 19 Jun 2024 17:46:25 +0200 (CEST)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3c9cc681ee0so3172472b6e.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2024 08:46:25 -0700 (PDT)
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
X-Inumbo-ID: 1575b600-2e53-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718811984; x=1719416784; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6i79TBptLGYHvgct8a+nK5k8kULH1VcVm+mKgbhLiQ=;
        b=dsIVVhr5xXAdJWm6jefZ+NeYxTqvPcI9p5EsoGpLkmjBhwd+mDJR4aNgsYwabkMD1K
         4TmH2kVFm6zinrUm5vdgDvfabIYp7tWuTlMd+bKaAstJYUf2U8iQTNTlldYS8ztSTYxH
         yCXcZbtSzDjsjUtwCFi1Dqz/yf3Nw2QUmGVQKMu9qVQIdVYgGsbxwYUyLIDID3aOahTd
         Ds87NdQ32yuHrYnvNWslHQRVx+6OD3RGweMOPOJLuisq3I+AT8+IFQ0UZufImlZVJN/u
         VjesL6zGEMMQfM5tw/7/l4DtkMQU+Ju4bEXm9zKKzsr6MHHKlkP6ViktWNq+meRUy4Fw
         T/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718811984; x=1719416784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t6i79TBptLGYHvgct8a+nK5k8kULH1VcVm+mKgbhLiQ=;
        b=SLJhgpFXwZ4Bk07IHT8/CfJz4+ITY3To6wG7SBARk1Yxs3TUb80uXMMJLLMy8jUQoQ
         Er/9M+h04dM9do8L/zXZ1HZzMJ8usY2c+THIXGFUcN3EvBmkUks8cEOyKfUShnC8edzg
         K7lxUT86DejUIf3gZF9BXzQvk1R/P/CHeRmiCjWdMwRYAAcJrg29ZAxEP0xIg/oi3UPJ
         C1kx/2CWs4ttkqsDMmGymRMXj+FklnnTjqKwiWfXHZ8DxCmbT/G2ofRM1YF4uvUdd9LQ
         zjsNzjsz6HYJMeRxcT8hYRlvpMFmXF+g8tatoUpS90R2QLz6crWVNRFN4KeBPQbwqovQ
         lE0w==
X-Forwarded-Encrypted: i=1; AJvYcCWQtSWj7bJhP5HxGCJrOjKAINwikqJPCg9Ba4KvAHhZ7GGcuYlXz06LAJ1Ns9m/cR1eh7O+JU0dJwkQi/coRF1/xeZ9i4QD3dX0rxuelAM=
X-Gm-Message-State: AOJu0YzbHMcUAdZES2tlIBgAQCprgsU/iWLv4qpANQOM6ukbiWXQclVz
	M/sDZ4baCjPh4+wvdG6yDjEwnXPNZ0/Uh6A+ZJHIzku2HaXipucExt5DvDT5KzKxIowKX6SoaQf
	hMdcr+Wi0RGmAIjR0Auag3aUXqIk=
X-Google-Smtp-Source: AGHT+IFduTD6szkPAuGBJD+MLbhP/M27BP//P7PnlUhalJm8qvZOP6Sk+wglvNwj0fEYD3dzIw98+ddByD5L8Ay6nss=
X-Received: by 2002:a05:6870:524f:b0:24f:d3ce:fe92 with SMTP id
 586e51a60fabf-25c94980cc1mr3421271fac.14.1718811984200; Wed, 19 Jun 2024
 08:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1718038855.git.w1benny@gmail.com> <fee20e24a94cb29dea81631a6b775933d1151da4.1718038855.git.w1benny@gmail.com>
 <4a49fe9b-66fd-4a32-ad01-14ed4c5fc34c@suse.com>
In-Reply-To: <4a49fe9b-66fd-4a32-ad01-14ed4c5fc34c@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Wed, 19 Jun 2024 17:46:13 +0200
Message-ID: <CAKBKdXgUKYoJfB1mG+6JSaV=jWpmRmS1UbQ6N4JNZ774rP_PoQ@mail.gmail.com>
Subject: Re: [PATCH for-4.19? v6 6/9] xen: Make the maximum number of altp2m
 views configurable for x86
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 2:03=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
> > @@ -510,13 +526,13 @@ int p2m_change_altp2m_gfn(struct domain *d, unsig=
ned int idx,
> >      mfn_t mfn;
> >      int rc =3D -EINVAL;
> >
> > -    if ( idx >=3D  min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
> > +    if ( idx >=3D d->nr_altp2m ||
> >           d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] =3D=3D
>
> This ends up being suspicious: The range check is against a value differe=
nt
> from what is passed to array_index_nospec(). The two weren't the same
> before either, but there the range check was more strict (which now isn't
> visible anymore, even though I think it would still be true). Imo this
> wants a comment, or an assertion effectively taking the place of a commen=
t.

> Since they're all "is this slot populated" checks, maybe we want
> an is_altp2m_eptp_valid() helper?

Let me see if I understand correctly. You're suggesting the condition
should be replaced with something like this? (Also, I would suggest
altp2m_is_eptp_valid() name, since it's consistent e.g. with
p2m_is_altp2m().)

static inline bool altp2m_is_eptp_valid(const struct domain *d,
                                        unsigned int idx)
{
    /*
     * EPTP index is correlated with altp2m index and should not exceed
     * d->nr_altp2m.
     */
    assert(idx < d->nr_altp2m);

    return idx < MAX_EPTP &&
        d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] !=3D
        mfn_x(INVALID_MFN);
}

Note that in the codebase there are also very similar checks, but
again without array_index_nospec. For instance, in the
p2m_altp2m_propagate_change() function (which is called fairly
frequently):

int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
                                mfn_t mfn, unsigned int page_order,
                                p2m_type_t p2mt, p2m_access_t p2ma)
{
    struct p2m_domain *p2m;
    unsigned int i;
    unsigned int reset_count =3D 0;
    unsigned int last_reset_idx =3D ~0;
    int ret =3D 0;

    if ( !altp2m_active(d) )
        return 0;

    altp2m_list_lock(d);

    for ( i =3D 0; i < d->nr_altp2m; i++ )
    {
        p2m_type_t t;
        p2m_access_t a;

        // XXX this could be replaced with altp2m_is_eptp_valid(), but
based on previous review remarks,
        // it would introduce unnecessary perf. hit. So, should these
occurrences left unchanged?
        if ( d->arch.altp2m_eptp[i] =3D=3D mfn_x(INVALID_MFN) )
            continue;

       ...

There are more instances of this. Which re-opens again the issue from
previous conversation: should I introduce a function which will be
used in some cases (where _nospec is used) and not used elsewhere?

P.

