Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0270CA096E7
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 17:13:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869844.1281299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWHd1-0007DQ-6k; Fri, 10 Jan 2025 16:12:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869844.1281299; Fri, 10 Jan 2025 16:12:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWHd1-0007BD-3d; Fri, 10 Jan 2025 16:12:55 +0000
Received: by outflank-mailman (input) for mailman id 869844;
 Fri, 10 Jan 2025 16:12:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmVM=UC=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tWHcz-0007B7-KA
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 16:12:53 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be5cc168-cf6d-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 17:12:52 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-385ddcfc97bso1945289f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 08:12:52 -0800 (PST)
Received: from localhost ([66.81.170.107]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e89df1sm90048765e9.27.2025.01.10.08.12.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jan 2025 08:12:51 -0800 (PST)
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
X-Inumbo-ID: be5cc168-cf6d-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736525572; x=1737130372; darn=lists.xenproject.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OMbCry0cF+4t0wc4UfHC0OgU/oMWHaSyqCM3/836NGo=;
        b=UdfFQvP/veL21sXyp5u15pimSF6jFhO/n9kkPNLdPZ5ibM54S27GG9pe4JxTgx4LiZ
         f6VX4Tn1885M5XkUYu8RrrTZPBXwHmeolG98YxVwbR65+/9nvSVtKJ+95sP4jV1fnB4m
         s+sthCqOgBcZE3fJ9YAJVCK1mHfN8Z25RFHKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736525572; x=1737130372;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OMbCry0cF+4t0wc4UfHC0OgU/oMWHaSyqCM3/836NGo=;
        b=cQX3ZUXZkR9Esp9TeJ6GNMMyW39YLEkty/Nv9JjdtNjYyegKav5hHHiE/JPBuo+RXD
         byrboMIPvRxeTRS8CgMqvUZgnHv1Mb61OqpF07qqN2xHRg+dpKM7dXfHvGRe0gS6yG6c
         BzphcvYLav7ioGX4+EZAvzzdFLWpeJ7UAx+x8unR7pyI76sY4MsU96Vkjg70EppgQdMb
         7FU3mbinYxCKCpbdB+rKde5+gmaSicS6DRF3AFmOJxVjz8l1kR+JyJOxi807lEu3+fBG
         nWJqICdznoeXPpg1QwZipE/tZpjxk4WnCN/+ht8AdepKVfTxaPkkmuad3E8Ebgkycz9U
         oYXQ==
X-Gm-Message-State: AOJu0YzDMVagkLPkE9MsqG4U4wMwfJc2GBSJZKB5ndqMxgur8plHGelA
	p+lxl5It+BTR/oVzTGsuqEU97mqzYTLMZVB+Qp3MP2WBoQ7Iub181834lekCFas=
X-Gm-Gg: ASbGncuwUl6dPSTwZmF3Rbd9y8cidqDteia00xYxDDFDy9Y3WHmxelrzEFRceYl/IOZ
	c/W+y7LqqaKvoi7o1b+fwQvcBlDXFaB47Coypa15wNTztBopd0ZS6FX5afw4LgUyP3r5sBRPmkE
	/juy5Y/zFg/7ogtiLm/dRnbdF0hMpFTNI4ifYDvRPd/1YfUwTRM1oR1DuPpm2Nj/juv+iuAB+M7
	pKPhBcqRa/sxz3zR/sifBwWXjbLloIWb5XHLXWpNSofvGEbeecEOpYJrD1fSQE=
X-Google-Smtp-Source: AGHT+IEf423ZUfWznIkb2tTcPFSSgD9lw+ElDdU4hnIPpjIogre/Qgkx7Yw/WKCojGIUd5GchXnzIg==
X-Received: by 2002:adf:9bc6:0:b0:38a:888c:a727 with SMTP id ffacd0b85a97d-38a888caa54mr8045828f8f.25.1736525571968;
        Fri, 10 Jan 2025 08:12:51 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jan 2025 16:12:41 +0000
Message-Id: <D6YIXQ2RO454.RX5K5X216R2D@cloud.com>
Subject: Re: [PATCH v2 15/18] x86/mm: introduce a per-vCPU mapcache when
 using ASI
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, "Jan Beulich" <jbeulich@suse.com>,
 "Andrew Cooper" <andrew.cooper3@citrix.com>
X-Mailer: aerc 0.18.2
References: <20250108142659.99490-1-roger.pau@citrix.com>
 <20250108142659.99490-16-roger.pau@citrix.com>
 <D6XMXUBHE5UI.16YI6AVTYXNUM@cloud.com> <Z4E2nhxxIKO8sWoz@macbook.local>
In-Reply-To: <Z4E2nhxxIKO8sWoz@macbook.local>

On Fri Jan 10, 2025 at 3:02 PM GMT, Roger Pau Monn=C3=A9 wrote:
> On Thu, Jan 09, 2025 at 03:08:15PM +0000, Alejandro Vallejo wrote:
> > On Wed Jan 8, 2025 at 2:26 PM GMT, Roger Pau Monne wrote:
> > > When using a unique per-vCPU root page table the per-domain region be=
comes
> > > per-vCPU, and hence the mapcache is no longer shared between all vCPU=
s of a
> > > domain.  Introduce per-vCPU mapcache structures, and modify map_domai=
n_page()
> > > to create per-vCPU mappings when possible.  Note the lock is also not=
 needed
> > > with using per-vCPU map caches, as the structure is no longer shared.
> > >
> > > This introduces some duplication in the domain and vcpu structures, a=
s both
> > > contain a mapcache field to support running with and without per-vCPU
> > > page-tables.
> > >
> > > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > > ---
> > >  xen/arch/x86/domain_page.c        | 90 ++++++++++++++++++++---------=
--
> > >  xen/arch/x86/include/asm/domain.h | 20 ++++---
> > >  2 files changed, 71 insertions(+), 39 deletions(-)
> > >
> > > diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
> > > index 1372be20224e..65900d6218f8 100644
> > > --- a/xen/arch/x86/domain_page.c
> > > +++ b/xen/arch/x86/domain_page.c
> > > @@ -74,7 +74,9 @@ void *map_domain_page(mfn_t mfn)
> > >      struct vcpu *v;
> > >      struct mapcache_domain *dcache;
> > >      struct mapcache_vcpu *vcache;
> > > +    struct mapcache *cache;
> > >      struct vcpu_maphash_entry *hashent;
> > > +    struct domain *d;
> > > =20
> > >  #ifdef NDEBUG
> > >      if ( mfn_x(mfn) <=3D PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
> > > @@ -85,9 +87,12 @@ void *map_domain_page(mfn_t mfn)
> > >      if ( !v || !is_pv_vcpu(v) )
> > >          return mfn_to_virt(mfn_x(mfn));
> > > =20
> > > -    dcache =3D &v->domain->arch.pv.mapcache;
> > > +    d =3D v->domain;
> > > +    dcache =3D &d->arch.pv.mapcache;
> > >      vcache =3D &v->arch.pv.mapcache;
> > > -    if ( !dcache->inuse )
> > > +    cache =3D d->arch.vcpu_pt ? &v->arch.pv.mapcache.cache
> > > +                            : &d->arch.pv.mapcache.cache;
> > > +    if ( !cache->inuse )
> > >          return mfn_to_virt(mfn_x(mfn));
> > > =20
> > >      perfc_incr(map_domain_page_count);
> > > @@ -98,17 +103,18 @@ void *map_domain_page(mfn_t mfn)
> > >      if ( hashent->mfn =3D=3D mfn_x(mfn) )
> > >      {
> > >          idx =3D hashent->idx;
> > > -        ASSERT(idx < dcache->entries);
> > > +        ASSERT(idx < cache->entries);
> > >          hashent->refcnt++;
> > >          ASSERT(hashent->refcnt);
> > >          ASSERT(mfn_eq(l1e_get_mfn(MAPCACHE_L1ENT(idx)), mfn));
> > >          goto out;
> > >      }
> > > =20
> > > -    spin_lock(&dcache->lock);
> > > +    if ( !d->arch.vcpu_pt )
> > > +        spin_lock(&dcache->lock);
> >=20
> > Hmmm. I wonder whether we might not want a nospec here...
>
> Not sure TBH, we have other instances of conditional locking that
> doesn't use nospec().  That said I'm not claiming those are correct.
> Shouldn't people that care about this kind of speculation into
> critical regions just use CONFIG_SPECULATIVE_HARDEN_LOCK?

Do people that care have a choice though? CONFIG_SPECULATIVE_HARDEN_LOCK on=
ly
blocks speculation in the taken branch here, so the critical region isn't
hardened when the relaxed branch is followed.

I suspect nospec in the condition would be fine perf-wise because the CPU c=
an
still do straight-line-speculation on the underlying function call when
CONFIG_SPECULATIVE_HARDEN_LOCK is not defined.

It's not the end of the world either way.

>
> Thanks, Roger.

Cheers,
Alejandro

