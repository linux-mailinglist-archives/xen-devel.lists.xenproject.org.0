Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F0E1FCFEE
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 16:46:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlZKE-0003yE-I2; Wed, 17 Jun 2020 14:46:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qFwG=76=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jlZKC-0003y2-JI
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 14:46:00 +0000
X-Inumbo-ID: 4213a3f2-b0a9-11ea-bca7-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4213a3f2-b0a9-11ea-bca7-bc764e2007e4;
 Wed, 17 Jun 2020 14:45:59 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id e1so2640870wrt.5
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2020 07:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qaPksoMYV4W5KRf8pWPz0C86FQ7Z7ocvZ0a8hefIads=;
 b=Lr0fiEcFAWI7opZuCHAYoUAPajimerwNLrdBWF7fU/Sv0eeEKNrgmH+hiHNAGLujun
 ggMsdk2wWb0G5iSDoU8cYBMcQs84dhHcZ9FivzK43LRTdRsp5rCWEO24b7HVCeQE5SDu
 EKbyu43eAWU8bpeYcoO1PX12micjYHtQzKELp1wiOkcaQv/8GdbPiibcF8JvV3z8QBxz
 wxwz0MzjTJzXh26zLn4zp3eBDAOX7x+yzX3L/YO0Al4RVyjvhfs+AT+BGbUnRZMPTh7T
 92TghzqpveKK4mHsjagkaSo82my4vCtzNKCwn2995Oc2nRCQDd+jslC4KgBT/E1uirF2
 z7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qaPksoMYV4W5KRf8pWPz0C86FQ7Z7ocvZ0a8hefIads=;
 b=uUwgIPYeokDWhJKMrHo0K19oerBfaEM60D3gn1p2L6viLu+kOIICKu8+R9VoTkZDYw
 SPzCw6GVDMAaE2rySTv56+fUS0tVTMam3cMRVnVrNixLjflyIOMlExQCvogZaFJHcNmc
 20xXGLEyuf7OQiWTDPkv4sjPhkQ0Kea6LmQo9mHa6wRfKRLqS7yJJEquR9u9dZCfeHuv
 Uzugwv3edIvemvwzcfkxtADmBHdJk6R1uuHYsYFMCO8+45Jw+nIiUSYB1Q80TLniHm/b
 AhhrCOvUZVaITAbZYRCqFKy1hPmdNYyYqvzQWqpHu/W1RM8iQ96lQ+Q7Y4zKWc/v4qEw
 E5kw==
X-Gm-Message-State: AOAM531Tte8w7JUoeti7SpPJVnMZovPGTQXHcFobtQHKZUuVUnxNgkhi
 HleegsX/W/NTsDOEBL/t39ubT0oQ43U8eoefH8E=
X-Google-Smtp-Source: ABdhPJxLvRXLnFLTMSNUas6eyQpairvkKT6t09gkCKL+OlEpjDooxRuvD9+O2igNHWjUX3Ltjf6Ojm93yV/6Zj57bi4=
X-Received: by 2002:a5d:490f:: with SMTP id x15mr8713685wrq.259.1592405158815; 
 Wed, 17 Jun 2020 07:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <6a2ae3bae4a4ad32bc7caecd8af2655a76a9fb19.1592335579.git.tamas.lengyel@intel.com>
 <20200617082340.GV735@Air-de-Roger>
 <CABfawh=QbbzJF1X_Ddk_BvJbxCiZ0kVWM4XZ3dGoLhe_ZPh8NQ@mail.gmail.com>
 <20200617142908.GC735@Air-de-Roger>
In-Reply-To: <20200617142908.GC735@Air-de-Roger>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 17 Jun 2020 08:45:22 -0600
Message-ID: <CABfawhkLExfaDUipdJ_sJhUbpNQYLWRKCdOrcLRQx29rJKC7cQ@mail.gmail.com>
Subject: Re: [PATCH for-4.14] x86/hap: use get_gfn_type in
 hap_update_paging_modes
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 17, 2020 at 8:29 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Wed, Jun 17, 2020 at 06:49:16AM -0600, Tamas K Lengyel wrote:
> > On Wed, Jun 17, 2020 at 2:25 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.=
com> wrote:
> > >
> > > On Tue, Jun 16, 2020 at 12:31:06PM -0700, Tamas K Lengyel wrote:
> > > > While forking VMs running a small RTOS systems (Zephyr) a Xen crash=
 has been
> > > > observed due to a mm-lock order violation while copying the HVM CPU=
 context
> > > > from the parent. This issue has been identified to be due to
> > > > hap_update_paging_modes getting a lock on the gfn using get_gfn. Th=
is call also
> > > > creates a shared entry in the fork's memory map for the cr3 gfn. Th=
e function
> > > > later calls hap_update_cr3 while holding the paging_lock, which res=
ults in the
> > > > lock-order violation in vmx_load_pdptrs when it tries to unshare th=
e above entry.
> > > >
> > > > This issue has not affected VMs running other OS's as a call to vmx=
_load_pdptrs
> > > > is benign if PAE is not enabled or if EFER_LMA is set and returns b=
efore
> > > > trying to unshare and map the page.
> > > >
> > > > Using get_gfn_type to get a lock on the gfn avoids this problem as =
we can
> > > > populate the fork's gfn with a copied page instead of a shared entr=
y if its
> > > > needed, thus avoiding the lock order violation while holding paging=
_lock.
> > > >
> > > > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> > > > ---
> > > > The bug seems to have been present since commit 4cb6c4f4941, only d=
iscovered
> > > > now due to the heavy use of mem_sharing with VM forks. As this is a=
 simple
> > > > bug-fix it would be nice to include it in the 4.14 release.
> > >
> > > I agree it seems like a candidate bugfix to be included. I've added
> > > Paul to the Cc so he is aware.
> > >
> > > > ---
> > > >  xen/arch/x86/mm/hap/hap.c | 17 ++++++++++++-----
> > > >  1 file changed, 12 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
> > > > index 7f84d0c6ea..9ae4c3ae6e 100644
> > > > --- a/xen/arch/x86/mm/hap/hap.c
> > > > +++ b/xen/arch/x86/mm/hap/hap.c
> > > > @@ -748,12 +748,19 @@ static void hap_update_paging_modes(struct vc=
pu *v)
> > > >      struct domain *d =3D v->domain;
> > > >      unsigned long cr3_gfn =3D v->arch.hvm.guest_cr[3] >> PAGE_SHIF=
T;
> > > >      p2m_type_t t;
> > > > +    p2m_query_t q =3D P2M_ALLOC;
> > > >
> > > > -    /* We hold onto the cr3 as it may be modified later, and
> > > > -     * we need to respect lock ordering. No need for
> > > > -     * checks here as they are performed by vmx_load_pdptrs
> > > > -     * (the potential user of the cr3) */
> > > > -    (void)get_gfn(d, cr3_gfn, &t);
> > > > +    /*
> > > > +     * We hold onto the cr3 as it may be modified later, and
> > > > +     * we need to respect lock ordering. Unshare here if we have t=
o as to avoid
> > > > +     * a lock-order violation later while we are holding the pagin=
g_lock.
> > > > +     * Further checks are performed by vmx_load_pdptrs (the potent=
ial user of
> > > > +     * the cr3).
> > > > +     */
> > > > +    if ( hvm_pae_enabled(v) && !hvm_long_mode_active(v) )
> > > > +        q |=3D P2M_UNSHARE;
> > > > +
> > > > +    (void)get_gfn_type(d, cr3_gfn, &t, q);
> > >
> > > While there I think you can drop the cast to void.
> >
> > Sure.
> >
> > >
> > > In order for this to be more resilient, maybe it would be better to
> > > just use get_gfn_unshare directly and avoid checking what paging mode
> > > the guest is currently using?
> > >
> > > Or would that be too expensive in terms of performance for the not
> > > affected case?
> >
> > That's what I originally considered sending in but yes, in the fuzzing
> > case it would mean a full-page copy for each iteration even on
> > unaffected cases instead of a one-time shared entry setup. That would
> > be a considerable waste.
>
> Right, I'm afraid I don't really like the implementation details of
> vmx_load_pdptrs leaking into hap_update_paging_modes which is a
> generic function, so IMO a cleaner solution would be to always use
> P2M_UNSHARE.

That's not an acceptable route due to the overhead it brings to
unaffected use-cases. I find this reasoning for a purely style
preference we are willing to sacrifice performance. In that case I'm
going to stop sending fixes upstream and simply carry patches
out-of-tree.

Tamas

