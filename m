Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8092CA09711
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 17:19:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869856.1281309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWHj6-0008Jz-UD; Fri, 10 Jan 2025 16:19:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869856.1281309; Fri, 10 Jan 2025 16:19:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWHj6-0008Ha-RS; Fri, 10 Jan 2025 16:19:12 +0000
Received: by outflank-mailman (input) for mailman id 869856;
 Fri, 10 Jan 2025 16:19:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmVM=UC=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tWHj5-0008HU-BA
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 16:19:11 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f048a32-cf6e-11ef-99a4-01e77a169b0f;
 Fri, 10 Jan 2025 17:19:09 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-436ce2ab251so17072105e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 08:19:09 -0800 (PST)
Received: from localhost ([66.81.170.107]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e37d7fsm56305855e9.32.2025.01.10.08.19.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jan 2025 08:19:08 -0800 (PST)
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
X-Inumbo-ID: 9f048a32-cf6e-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736525949; x=1737130749; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3lv/NArzrRA7WULk4MemEkjgKybl1dEMHzMPjgZfgY=;
        b=dqSW7X804Cx/Z2w4u8UEfTw04TPFQ/5sATPq/8r2UifMUvvBAisZOK9i3/nUgq1Yr2
         pJG1U2e3A+TaF0dbwCzqQj4Cb0DXFh3j/0rO45yNggPJ7hu33kcRSIq5r7iwr8G701Zp
         ocJ+XBWqQ8UWvRrVDxWzz3yLmYFhEKH7bwPRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736525949; x=1737130749;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N3lv/NArzrRA7WULk4MemEkjgKybl1dEMHzMPjgZfgY=;
        b=HdKOGBgfGpV+oZjPYttcWt6/uKIuNDFefhfcy8Ikx0UgaKkeAEAcBUlJMRUQ7UZgb7
         kc5sqWHVr96nCFLKhXSNIrZRwD9KjEsrqoo8ARc9tizrSk+m6QMBCB4QdgcOL6fB6foX
         UYnB34pYttLNEhY+zRif+f8mREX0R9QeTZQdpmJKu7+R4F+6WnNzHXqNdCBWvuMhO7LV
         VHDuMhzi7Vrj0oe6xQuVANgVUAiukFFZ6riVAQOZNZFSe2acEhAG9SrnLt/BD/42Tl2w
         QX619/EPn6dsKO2AJtzr0m/KS5/QfObj4KXCOHvyhJztgKZvZDjQolN0pBZ105Nn6eLc
         ChRg==
X-Gm-Message-State: AOJu0YzTM1GqJiHliGuVe0arxrY9sdRccOWzJN3ToGquGxXAq9lWNtca
	6z1VlnLiLTJKttOwSAwPEvmBgKhv1og0P8fDgLYlPpxrBZ0xk3xmwpcW5o4No7s=
X-Gm-Gg: ASbGncs6vW/MU0/u/NkJjFAxPrgkl8AYaKIDMgIILFNE+pHVKQ8mgeja5vul5MSR1Nn
	Wc2W3mEq4uqmdqL4JrPVPKX3acJgh+4eiMKY7ZwWaegbf3tbrlpnvClhWUvTps9Bszx5ds9gpBD
	pARHb3aVZYos2dSBSMfdlcDE1qx3dlajhi2gAP2GLYXDGxfEk5bEzqr0FnVIzAiM9pnr5mZfdP4
	y8lkeB5RKf7LtgnRKhq5dLH2RfC2713tFljaEAVEv8rl2obzgYvwEsfwbqUNnA=
X-Google-Smtp-Source: AGHT+IFCthcT27edbPU/MEm5ZqnDHi6DgoObRUGwD4EsKTVPYbuQu5jZnCJ9rs9X4ifQc6LVMKBPEQ==
X-Received: by 2002:a05:600c:19ce:b0:42c:bb96:340e with SMTP id 5b1f17b1804b1-436e26f857fmr112068085e9.31.1736525948757;
        Fri, 10 Jan 2025 08:19:08 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jan 2025 16:19:03 +0000
Message-Id: <D6YJ2L9AFQOQ.2ZZ5H8O4SK9J4@cloud.com>
Cc: <xen-devel@lists.xenproject.org>, "Jan Beulich" <jbeulich@suse.com>,
 "Andrew Cooper" <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 15/18] x86/mm: introduce a per-vCPU mapcache when
 using ASI
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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
>
> Thanks, Roger.

Actually, to avoid the double lfence, I think this would work too while
avoiding the lfence unconditionally when CONFIG_SPECULATIVE_HARDEN_LOCK is =
not
set.

    if ( !d->arch.vcpu_pt )
        spin_lock(&dcache->lock);
    else
        block_lock_speculation();

Cheers,
Alejandro

