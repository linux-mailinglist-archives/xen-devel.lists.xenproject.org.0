Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EC2192EA8
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 17:50:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH9Bw-0004QW-Ln; Wed, 25 Mar 2020 16:47:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OrPJ=5K=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jH9Bv-0004QR-Lw
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 16:47:43 +0000
X-Inumbo-ID: 586aefbc-6eb8-11ea-a6c1-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 586aefbc-6eb8-11ea-a6c1-bc764e2007e4;
 Wed, 25 Mar 2020 16:47:42 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id b18so3298547edu.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2020 09:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PKCUXdAUiSm9f0g/TOM7YQPe8tnPjmwTGSWg6tkLuMU=;
 b=M8Ulau9xVsmB9p3X6AJoDkmPaeUkJO6pWOvx2j4yDi39mVrhA2kmnOkssz0bsKx+CI
 fqsciGIic7DL+zaCM4czUdpFHn3g7B/phEfwPas20mUf+A3eRoxWutikTPAZ0g79otlb
 Sk7ijsrGP1tGqu22SQlJgsgYZFj7g/VV5e7EwL4c4nD+QVE5HtPNgoh0oPDc+IYEVB1b
 YpKmC1kpzg+1lr2s6+IcbY4UPvt6kqIIEPK4PxN1A78AUzMeFEbgOFttgKsi986sWhEu
 DyHd6ICtNZXktsDFcNJLTXQ2Ge6bi5TfaV1tUuVSM8+avA9/57GxrmWE/7BJO0j1XmEM
 JxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PKCUXdAUiSm9f0g/TOM7YQPe8tnPjmwTGSWg6tkLuMU=;
 b=tQg4qVH1kg1S2geid+FuRAhgEFZue/9nPUsivfeCbwkCu6i05SrXc/XUkGunBIkXB1
 GqK0QSLdq9iB3rWmj0WDMDRvi3UDBkn2+t1hKEhrWFpYNs5NMngi7mzWYW/Qz7QWPPB3
 NVxcB0Jknx+giR/fcQRHcqsVZy2ULRXU5zcFrIbWDivt4ZtUD06WYJmQfrmQJYTS8atb
 f2CPrJOZPqA5me0uAFnOKfcCsOqm7iRKE/h/7cz3AstGDMJpcCvwSBFemTM61JwZvMxq
 bC2pXdOwfCmnGrzsss40pQfnBn2Ii8QEEujWJYsg99NwsKc1wop9bvWRRro1AsnVsTf6
 Otbg==
X-Gm-Message-State: ANhLgQ3WQuotGTnCbvayYtXNMg11MyZl3SVs9A3i/lNOWr9BlivE6fbC
 OTADuJz9Zyky2hhoJjHAmg8KfNbGK5s=
X-Google-Smtp-Source: ADFU+vuTu62B+sc2GDoLhT6rDbxkW0jkoZT7vIg3Mo2nhy1hpNo2uNmjitV8GkAzUWh0t5pbTTw3+w==
X-Received: by 2002:a17:906:8554:: with SMTP id
 h20mr3977096ejy.332.1585154861342; 
 Wed, 25 Mar 2020 09:47:41 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com.
 [209.85.221.47])
 by smtp.gmail.com with ESMTPSA id n62sm497490edc.74.2020.03.25.09.47.39
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2020 09:47:39 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id 65so4070841wrl.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2020 09:47:39 -0700 (PDT)
X-Received: by 2002:a5d:640a:: with SMTP id z10mr4624711wru.301.1585154858912; 
 Wed, 25 Mar 2020 09:47:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1584981438.git.tamas.lengyel@intel.com>
 <a8cf8742054d04760f2f5060cfeef5bef1edbd6f.1584981438.git.tamas.lengyel@intel.com>
 <20200325154702.GD28601@Air-de-Roger>
 <CABfawhnQ_LTG8oses9EWatJ63bEZFctp7uARBjN==twV7c4xqw@mail.gmail.com>
 <ce6b0e2b-b135-8ee6-fc0c-fe190685b237@xen.org>
In-Reply-To: <ce6b0e2b-b135-8ee6-fc0c-fe190685b237@xen.org>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 25 Mar 2020 10:47:02 -0600
X-Gmail-Original-Message-ID: <CABfawhkieTA-480tKbQKdYrEs0QSaSmreC2xD3cngGExG=nj6Q@mail.gmail.com>
Message-ID: <CABfawhkieTA-480tKbQKdYrEs0QSaSmreC2xD3cngGExG=nj6Q@mail.gmail.com>
To: Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH v12 1/3] xen/mem_sharing: VM forking
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Mar 25, 2020 at 10:42 AM Julien Grall <julien@xen.org> wrote:
>
> Hi,
>
> On 25/03/2020 16:34, Tamas K Lengyel wrote:
> >>> diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
> >>> index 9f51370327..1ed7d13084 100644
> >>> --- a/xen/arch/x86/mm/p2m.c
> >>> +++ b/xen/arch/x86/mm/p2m.c
> >>> @@ -509,6 +509,12 @@ mfn_t __get_gfn_type_access(struct p2m_domain *p=
2m, unsigned long gfn_l,
> >>>
> >>>       mfn =3D p2m->get_entry(p2m, gfn, t, a, q, page_order, NULL);
> >>>
> >>> +    /* Check if we need to fork the page */
> >>> +    if ( (q & P2M_ALLOC) && p2m_is_hole(*t) &&
> >>> +         !mem_sharing_fork_page(p2m->domain, gfn, q & P2M_UNSHARE) )
> >>> +        mfn =3D p2m->get_entry(p2m, gfn, t, a, q, page_order, NULL);
> >>> +
> >>> +    /* Check if we need to unshare the page */
> >>>       if ( (q & P2M_UNSHARE) && p2m_is_shared(*t) )
> >>>       {
> >>>           ASSERT(p2m_is_hostp2m(p2m));
> >>> @@ -588,7 +594,8 @@ struct page_info *p2m_get_page_from_gfn(
> >>>               return page;
> >>>
> >>>           /* Error path: not a suitable GFN at all */
> >>> -        if ( !p2m_is_ram(*t) && !p2m_is_paging(*t) && !p2m_is_pod(*t=
) )
> >>> +        if ( !p2m_is_ram(*t) && !p2m_is_paging(*t) && !p2m_is_pod(*t=
) &&
> >>> +             !mem_sharing_is_fork(p2m->domain) )
> >>>               return NULL;
> >>>       }
> >>>
> >>> diff --git a/xen/common/domain.c b/xen/common/domain.c
> >>> index b4eb476a9c..62aed53a16 100644
> >>> --- a/xen/common/domain.c
> >>> +++ b/xen/common/domain.c
> >>> @@ -1270,6 +1270,9 @@ int map_vcpu_info(struct vcpu *v, unsigned long=
 gfn, unsigned offset)
> >>>
> >>>       v->vcpu_info =3D new_info;
> >>>       v->vcpu_info_mfn =3D page_to_mfn(page);
> >>> +#ifdef CONFIG_MEM_SHARING
> >>> +    v->vcpu_info_offset =3D offset;
> >>
> >> There's no need to introduce this field, you can just use v->vcpu_info
> >> & ~PAGE_MASK AFAICT.
> >
> > Just doing what you suggest above results in:
> >
> > mem_sharing.c:1603:55: error: invalid operands to binary & (have
> > =E2=80=98vcpu_info_t * const=E2=80=99 {aka =E2=80=98union <anonymous> *=
 const=E2=80=99} and =E2=80=98long
> > int=E2=80=99)
> >                                       d_vcpu->vcpu_info & ~PAGE_MASK);
> >
> > I can of course cast the vcpu_info pointer to (long int), it's just a
> > bit ugly. Thoughts?
>
> FWIW, I will also need the offset for liveupdate. I have used (unsigned
> long)v->vcpu_info & ~PAGE_MASK so far but this is not really pretty.
>
> So I am all for either a new field or a macro hiding this uglyness.

A macro sounds like a good way to go, no need for an extra field if we
can calculate it based on the currently existing one. How about

#define VCPU_INFO_OFFSET(v) (((unsigned long)v->vcpu_info) & ~PAGE_MASK)

?

Tamas

