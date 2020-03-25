Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA97192D99
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 16:59:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH8NX-0007Xe-3r; Wed, 25 Mar 2020 15:55:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OrPJ=5K=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jH8NV-0007XU-Ji
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 15:55:37 +0000
X-Inumbo-ID: 11314008-6eb1-11ea-bec1-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11314008-6eb1-11ea-bec1-bc764e2007e4;
 Wed, 25 Mar 2020 15:55:37 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id i24so3029636eds.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2020 08:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0t6FiyQ5ezBu/aoWTWdQOAAymfDOafftrsazQVSzYG8=;
 b=HC01FRMt4z675q9+H1Y7JGE3CVyelkgd1AHGa0uYdAp93zUnRUW56KVD82rvDd88Xt
 Sx5KhjaOyYX/ZTsUy76yCgp5zBdIyVoBY1t0qriRn4u+DHnKwn+x0VGXb2nJx9j+ckWh
 WtwO2M9KQIzNtXXRss+EXm6H8QimMrVW2e1n5uBdZTKtUHuoRrwY1gZlolB0E9pyjhOL
 /tdnR6CFx5/womq0Fb+S7fEZcigrgBPcPJ6U3rXq/Kpl6MzEMcHVqsq9DPe6TRaRbIC6
 Wx3xisMLmehFk/SMzjZ5C0MaxzkZK9mqdyVoMyv7MD+bIHmbVv1O284tz9da2FHcAOIS
 YnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0t6FiyQ5ezBu/aoWTWdQOAAymfDOafftrsazQVSzYG8=;
 b=nsmVDYNo8qVkRq23mO8XM45r5Ep1oweQ95uCt8+Rq3LJbOMM0WfruUrNDg0tRMYBXd
 ADe8rFJfSrXeO2KMtTofFDGqkDtMCBxQUwfzPRmhlln8yFJyDBXdu1UGzxUhx82fX3q/
 N91NKcyshMI2yzntr4OvwWcHppgumjfxcj30aHRZyvuEZONpth7Ov/jVqiQbzn2hI45a
 lxAF5dgUr9kmOfSxUx5CntGmitUWDzaBC2V0GF8Vj/DW1FmMRqMchx8szBOaV7PxUgxb
 pwqNAmW5p2Bd7M5qASnwRg7ZaidVnUE/Jw9YlT73gJXf6CmdfAnfUl4Fv2rzHUIA+2IT
 jbcQ==
X-Gm-Message-State: ANhLgQ3fjZoaKTvrSPttNzulRE/ZB29J5iGRoFCTzE0MjZBFuRMQbSYM
 XgnFNYBS+QTkxMlgJZycZ7qyyknFhK4=
X-Google-Smtp-Source: ADFU+vtMDGJFqKhfjjtlXsidX0zll1xMgdfbY+B4rM+IIrOfhS2Ol50uoX0Df6EkdawnQhSgUX8vow==
X-Received: by 2002:aa7:d4c4:: with SMTP id t4mr3523949edr.181.1585151735724; 
 Wed, 25 Mar 2020 08:55:35 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47])
 by smtp.gmail.com with ESMTPSA id a21sm298404edr.22.2020.03.25.08.55.33
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2020 08:55:34 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id c187so3057536wme.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2020 08:55:33 -0700 (PDT)
X-Received: by 2002:a05:600c:2293:: with SMTP id
 19mr3978963wmf.84.1585151733159; 
 Wed, 25 Mar 2020 08:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1584981438.git.tamas.lengyel@intel.com>
 <46457bd6e877abe12a8c005c23f0f1aab13afd24.1584981438.git.tamas.lengyel@intel.com>
 <20200325155247.GE28601@Air-de-Roger>
In-Reply-To: <20200325155247.GE28601@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 25 Mar 2020 09:54:56 -0600
X-Gmail-Original-Message-ID: <CABfawhkxper9QAzKMVHPp-xn-upQzuwK=iMkCAnXEEgeD7aogw@mail.gmail.com>
Message-ID: <CABfawhkxper9QAzKMVHPp-xn-upQzuwK=iMkCAnXEEgeD7aogw@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH v12 2/3] x86/mem_sharing: reset a fork
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Mar 25, 2020 at 9:52 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Mon, Mar 23, 2020 at 10:04:36AM -0700, Tamas K Lengyel wrote:
> > Implement hypercall that allows a fork to shed all memory that got allo=
cated
> > for it during its execution and re-load its vCPU context from the paren=
t VM.
> > This allows the forked VM to reset into the same state the parent VM is=
 in a
> > faster way then creating a new fork would be. Measurements show about a=
 2x
> > speedup during normal fuzzing operations. Performance may vary dependin=
g how
> > much memory got allocated for the forked VM. If it has been completely
> > deduplicated from the parent VM then creating a new fork would likely b=
e more
> > performant.
> >
> > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
>
> LGTM:
>
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>
> One minor nit below.
>
> > ---
> > v12: remove continuation & add comment back
> >      address style issues pointed out by Jan
> > ---
> >  xen/arch/x86/mm/mem_sharing.c | 77 +++++++++++++++++++++++++++++++++++
> >  xen/include/public/memory.h   |  1 +
> >  2 files changed, 78 insertions(+)
> >
> > diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharin=
g.c
> > index 23deeddff2..930a5f58ef 100644
> > --- a/xen/arch/x86/mm/mem_sharing.c
> > +++ b/xen/arch/x86/mm/mem_sharing.c
> > @@ -1775,6 +1775,60 @@ static int fork(struct domain *cd, struct domain=
 *d)
> >      return rc;
> >  }
> >
> > +/*
> > + * The fork reset operation is intended to be used on short-lived fork=
s only.
> > + * There is no hypercall continuation operation implemented for this r=
eason.
> > + * For forks that obtain a larger memory footprint it is likely going =
to be
> > + * more performant to create a new fork instead of resetting an existi=
ng one.
> > + *
> > + * TODO: In case this hypercall would become useful on forks with larg=
er memory
> > + * footprints the hypercall continuation should be implemented (or if =
this
> > + * feature needs to be become "stable").
> > + */
> > +static int mem_sharing_fork_reset(struct domain *d, struct domain *pd)
> > +{
> > +    int rc;
> > +    struct p2m_domain *p2m =3D p2m_get_hostp2m(d);
> > +    struct page_info *page, *tmp;
> > +
> > +    spin_lock(&d->page_alloc_lock);
> > +    domain_pause(d);
> > +
> > +    page_list_for_each_safe(page, tmp, &d->page_list)
> > +    {
> > +        p2m_type_t p2mt;
> > +        p2m_access_t p2ma;
> > +        mfn_t mfn =3D page_to_mfn(page);
> > +        gfn_t gfn =3D mfn_to_gfn(d, mfn);
> > +
> > +        mfn =3D __get_gfn_type_access(p2m, gfn_x(gfn), &p2mt, &p2ma,
> > +                                    0, NULL, false);
> > +
> > +        /* only reset pages that are sharable */
> > +        if ( !p2m_is_sharable(p2mt) )
> > +            continue;
> > +
> > +        /* take an extra reference or just skip if can't for whatever =
reason */
> > +        if ( !get_page(page, d) )
> > +            continue;
>
> You can join both conditions above into a single one, if both just
> need to perform a continue.

We could but I think it's easier to read it this way. So I prefer to
keep it separate.

Thanks for the review!
Tamas

