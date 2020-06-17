Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 134B71FCDB3
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 14:50:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlXVr-0000x9-8Y; Wed, 17 Jun 2020 12:49:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qFwG=76=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jlXVp-0000wQ-VY
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 12:49:54 +0000
X-Inumbo-ID: 09b17de6-b099-11ea-bca7-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09b17de6-b099-11ea-bca7-bc764e2007e4;
 Wed, 17 Jun 2020 12:49:53 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id u26so4408312wmn.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2020 05:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7yjgcrCzyi5gJKaHwzaM4Sl+1lVQ4RLA2oI/3MRUaQI=;
 b=UA+bl5MGCV7qjwqxH/7WLeT5pC8zCzvqvWJThOz4DKwHONaZKO/Xy0/5sl7DLiPLmQ
 nCf9J7/MOYDyBUcAEeasz/K2pL6c6aw25sApjO/IzWWw6DIbqfVJ5Yv0fRJy/RLq2dLa
 Nb2upJ/0KgWDqUiv7wbbr6KN9pNRhnkC7Hk9e5SyWb3RhVaWSClXwgR9uuQ1xP6mWVWG
 69IEIFw2sPGlKisiqwR9rOkDjuXalNVe9sGkKoB/eaTRMOvtFOSFv+1F1wcGdMYjwW2J
 Pzom5P0XWSGZYRaaFF/Cp/ABPG9Z25NN1FaGInxYBCVQj87wbD6N9A2NY8pA87URwpJm
 vG3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7yjgcrCzyi5gJKaHwzaM4Sl+1lVQ4RLA2oI/3MRUaQI=;
 b=qrCucSnFWYWWxGDpDv7Y7geRtBLUwgSTLMncCvQrTapWi+JdnKgpRxZq1m2khqTbbE
 8cDn58dqm7IQFThkvfK50wfrUYTOQK9vtOfBXfyra/Rm4WXWQYDY5V53w0a+4JNDimM+
 F64t3uMEr/UteVQUUVUiGE0eNnLdwE/XoP8qgeVk81My4v/q3hDT6VpI5oew3XLS/vWa
 58W/otxxGXbQB1JftmL6v17y2XW90vkyujKn2vY6Dry8k0XdnmZGjt1PVlrnrS3qYy7y
 bAvUCX6loMllONmtxOr8At7fa6QX4O7oE2A1XyWX64mzMzMfQoAz82JWa20fKGrWPIRg
 xCHg==
X-Gm-Message-State: AOAM530t34PUDhGOEICDds0uSJ30hxt9Px9JQdhRcJ74jPctilL4205h
 M3KtkDoPUWIWbutBmyRe4iQsKAH1rvk96VlKAjA=
X-Google-Smtp-Source: ABdhPJyo8VEU0hZYeNoBzlg5o9X7hNrIpWgUn44s26PomvPq1vo7caFjbbpTGe55QHPfjjPWMe+OTGUE7mP4E7g1lLg=
X-Received: by 2002:a1c:23d2:: with SMTP id j201mr8403913wmj.186.1592398192304; 
 Wed, 17 Jun 2020 05:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <6a2ae3bae4a4ad32bc7caecd8af2655a76a9fb19.1592335579.git.tamas.lengyel@intel.com>
 <20200617082340.GV735@Air-de-Roger>
In-Reply-To: <20200617082340.GV735@Air-de-Roger>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 17 Jun 2020 06:49:16 -0600
Message-ID: <CABfawh=QbbzJF1X_Ddk_BvJbxCiZ0kVWM4XZ3dGoLhe_ZPh8NQ@mail.gmail.com>
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

On Wed, Jun 17, 2020 at 2:25 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Tue, Jun 16, 2020 at 12:31:06PM -0700, Tamas K Lengyel wrote:
> > While forking VMs running a small RTOS systems (Zephyr) a Xen crash has=
 been
> > observed due to a mm-lock order violation while copying the HVM CPU con=
text
> > from the parent. This issue has been identified to be due to
> > hap_update_paging_modes getting a lock on the gfn using get_gfn. This c=
all also
> > creates a shared entry in the fork's memory map for the cr3 gfn. The fu=
nction
> > later calls hap_update_cr3 while holding the paging_lock, which results=
 in the
> > lock-order violation in vmx_load_pdptrs when it tries to unshare the ab=
ove entry.
> >
> > This issue has not affected VMs running other OS's as a call to vmx_loa=
d_pdptrs
> > is benign if PAE is not enabled or if EFER_LMA is set and returns befor=
e
> > trying to unshare and map the page.
> >
> > Using get_gfn_type to get a lock on the gfn avoids this problem as we c=
an
> > populate the fork's gfn with a copied page instead of a shared entry if=
 its
> > needed, thus avoiding the lock order violation while holding paging_loc=
k.
> >
> > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> > ---
> > The bug seems to have been present since commit 4cb6c4f4941, only disco=
vered
> > now due to the heavy use of mem_sharing with VM forks. As this is a sim=
ple
> > bug-fix it would be nice to include it in the 4.14 release.
>
> I agree it seems like a candidate bugfix to be included. I've added
> Paul to the Cc so he is aware.
>
> > ---
> >  xen/arch/x86/mm/hap/hap.c | 17 ++++++++++++-----
> >  1 file changed, 12 insertions(+), 5 deletions(-)
> >
> > diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
> > index 7f84d0c6ea..9ae4c3ae6e 100644
> > --- a/xen/arch/x86/mm/hap/hap.c
> > +++ b/xen/arch/x86/mm/hap/hap.c
> > @@ -748,12 +748,19 @@ static void hap_update_paging_modes(struct vcpu *=
v)
> >      struct domain *d =3D v->domain;
> >      unsigned long cr3_gfn =3D v->arch.hvm.guest_cr[3] >> PAGE_SHIFT;
> >      p2m_type_t t;
> > +    p2m_query_t q =3D P2M_ALLOC;
> >
> > -    /* We hold onto the cr3 as it may be modified later, and
> > -     * we need to respect lock ordering. No need for
> > -     * checks here as they are performed by vmx_load_pdptrs
> > -     * (the potential user of the cr3) */
> > -    (void)get_gfn(d, cr3_gfn, &t);
> > +    /*
> > +     * We hold onto the cr3 as it may be modified later, and
> > +     * we need to respect lock ordering. Unshare here if we have to as=
 to avoid
> > +     * a lock-order violation later while we are holding the paging_lo=
ck.
> > +     * Further checks are performed by vmx_load_pdptrs (the potential =
user of
> > +     * the cr3).
> > +     */
> > +    if ( hvm_pae_enabled(v) && !hvm_long_mode_active(v) )
> > +        q |=3D P2M_UNSHARE;
> > +
> > +    (void)get_gfn_type(d, cr3_gfn, &t, q);
>
> While there I think you can drop the cast to void.

Sure.

>
> In order for this to be more resilient, maybe it would be better to
> just use get_gfn_unshare directly and avoid checking what paging mode
> the guest is currently using?
>
> Or would that be too expensive in terms of performance for the not
> affected case?

That's what I originally considered sending in but yes, in the fuzzing
case it would mean a full-page copy for each iteration even on
unaffected cases instead of a one-time shared entry setup. That would
be a considerable waste.

>
> I feel like relying on the internals of vmx_load_pdptrs here is
> fragile.

I agree it's not ideal.

Tamas

