Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D6C2427B4
	for <lists+xen-devel@lfdr.de>; Wed, 12 Aug 2020 11:37:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5nBx-0007G4-0J; Wed, 12 Aug 2020 09:37:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fTRk=BW=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1k5nBv-0007Fz-Lq
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2020 09:37:03 +0000
X-Inumbo-ID: 5dede812-6c1e-4de2-ba53-5b11ea1eaa96
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5dede812-6c1e-4de2-ba53-5b11ea1eaa96;
 Wed, 12 Aug 2020 09:37:02 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r2so1372545wrs.8
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2020 02:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=u2E6rgHbknxNJ3RvXVF0jrVyxriVGKW63mfbg0Yk8FE=;
 b=HeyxICiRRGR5FgJ2GolXxeF+ZUhDBVEwxCfzO0ie2mppJjmRLP7+/exOy0j2aNFmpP
 AUfikjQwlm1nOy7c+RdtyuVLkOkK0+IVMwo0OGHSoZ7k0viZLbhrXHbOxBGYyrNg3yUh
 xRnLwn9SF6T9124TxR4INuMfWuhJWPHCLRsEupeICxiV1ReEbW76sWfEa2e5e0+JwMEV
 BphUhfUF7rKpRv6SE/64U6VBi+nwes9v9CWYCFZZPW0z3pX/kZCs96A96CkrbzFuMcvc
 Lv8qE1OTs4CVddL2rh5wDTRP42yjdWhC03wNYejqP4t3+Rjqah/FYBXwoXxjBtQ+jgH6
 4lGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=u2E6rgHbknxNJ3RvXVF0jrVyxriVGKW63mfbg0Yk8FE=;
 b=YCEUKs72ENzELI66sr8bhm+HDhHt7fd2+Y/ZEfQm/VVTwTIm5Gj8UNR9K5Yjiww4cF
 I08o7g7xp2YJlvqkoBvIDbMETiqmbgYLoINKYdjenHetrMS1BxDtX0RghNmjOGndzXc4
 UD/1R+pMHVjGeEZAEvlQiu7Q+q6mPGEmDO+/tmz+VDMyDKykeljBf6a2ptc5o9V/1b76
 v0Cc1MmJEgspruGZhRIGMcmHd1e0RZD5HBd7kZ0h9HkOAWcG8vV8s1HqmkVT0hkwUw5j
 IopzGjy9TCByrTAvUu/P3wvE8sns0efjwxWOHN0hC0bR80eMwvjJs4xuYXxeOpbGIg+/
 /u+Q==
X-Gm-Message-State: AOAM530hYAQI9hdjT9AzAnPd4+jz11YaV3QPioXr40ElsemwEjPkPiJF
 x2y/8Io270b9OOqaTXAqi2A=
X-Google-Smtp-Source: ABdhPJwBbbCAvy9cFMhOA+HMFNZfZJBmHPoZ8ka8YBfCokYgR7pGEliphtrRHqdqo6DCQxVADxxf5Q==
X-Received: by 2002:adf:e8ca:: with SMTP id k10mr9656804wrn.110.1597225021323; 
 Wed, 12 Aug 2020 02:37:01 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-143-223-30.range86-143.btcentralplus.com.
 [86.143.223.30])
 by smtp.gmail.com with ESMTPSA id z12sm3199040wrp.20.2020.08.12.02.37.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Aug 2020 02:37:00 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	"'Paul Durrant'" <paul@xen.org>
Cc: <xen-devel@lists.xenproject.org>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>, "'Wei Liu'" <wl@xen.org>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
 "'George Dunlap'" <george.dunlap@citrix.com>,
 "'Ian Jackson'" <ian.jackson@eu.citrix.com>,
 "'Julien Grall'" <julien@xen.org>,
 "'Stefano Stabellini'" <sstabellini@kernel.org>,
 "'Jun Nakajima'" <jun.nakajima@intel.com>,
 "'Kevin Tian'" <kevin.tian@intel.com>
References: <20200804134209.8717-1-paul@xen.org>
 <20200804134209.8717-9-paul@xen.org>
 <9d5a59cd-9e4e-2299-bc1c-af3c00a8719f@suse.com>
In-Reply-To: <9d5a59cd-9e4e-2299-bc1c-af3c00a8719f@suse.com>
Subject: RE: [EXTERNAL] [PATCH v4 08/14] remove remaining uses of
 iommu_legacy_map/unmap
Date: Wed, 12 Aug 2020 10:36:59 +0100
Message-ID: <000001d6708c$20c5e1e0$6251a5a0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGtxlp5X/CuH2IzEhv/FXA8KDRK/wH9EygUAhlxY0epZNY14A==
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 06 August 2020 11:29
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Durrant, Paul =
<pdurrant@amazon.co.uk>; Andrew Cooper
> <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>; Roger Pau =
Monn=C3=A9 <roger.pau@citrix.com>; George
> Dunlap <george.dunlap@citrix.com>; Ian Jackson =
<ian.jackson@eu.citrix.com>; Julien Grall
> <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Jun =
Nakajima <jun.nakajima@intel.com>;
> Kevin Tian <kevin.tian@intel.com>
> Subject: RE: [EXTERNAL] [PATCH v4 08/14] remove remaining uses of =
iommu_legacy_map/unmap
>=20
> CAUTION: This email originated from outside of the organization. Do =
not click links or open
> attachments unless you can confirm the sender and know the content is =
safe.
>=20
>=20
>=20
> On 04.08.2020 15:42, Paul Durrant wrote:
> > The 'legacy' functions do implicit flushing so amend the callers to =
do the
> > appropriate flushing.
> >
> > Unfortunately, because of the structure of the P2M code, we cannot =
remove
> > the per-CPU 'iommu_dont_flush_iotlb' global and the optimization it
> > facilitates. It is now checked directly iommu_iotlb_flush(). Also, =
it is
> > now declared as bool (rather than bool_t) and setting/clearing it =
are no
> > longer pointlessly gated on is_iommu_enabled() returning true. =
(Arguably
> > it is also pointless to gate the call to iommu_iotlb_flush() on that
> > condition - since it is a no-op in that case - but the if clause =
allows
> > the scope of a stack variable to be restricted).
> >
> > NOTE: The code in memory_add() now fails if the number of pages =
passed to
> >       a single call overflows an unsigned int. I don't believe this =
will
> >       ever happen in practice.
>=20
> I.e. you don't think adding 16Tb of memory in one go is possible?
> I wouldn't bet on that ...
>=20

I've re-worked previous patches to use unsigned long so I don't need =
this restriction any more.

> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -2446,10 +2446,16 @@ static int cleanup_page_mappings(struct =
page_info *page)
> >
> >          if ( d && unlikely(need_iommu_pt_sync(d)) && =
is_pv_domain(d) )
> >          {
> > -            int rc2 =3D iommu_legacy_unmap(d, _dfn(mfn), =
PAGE_ORDER_4K);
> > +            unsigned int flush_flags =3D 0;
> > +            int err;
> >
> > +            err =3D iommu_unmap(d, _dfn(mfn), PAGE_ORDER_4K, 1, =
&flush_flags);
> >              if ( !rc )
> > -                rc =3D rc2;
> > +                rc =3D err;
> > +
> > +            err =3D iommu_iotlb_flush(d, _dfn(mfn), PAGE_ORDER_4K, =
1, flush_flags);
> > +            if ( !rc )
> > +                rc =3D err;
> >          }
>=20
> Wasn't the earlier change to add flushing in the error case to
> allow to simplify code like this to
>=20
>         if ( d && unlikely(need_iommu_pt_sync(d)) && is_pv_domain(d) )
>         {
>             unsigned int flush_flags =3D 0;
>             int err;
>=20
>             err =3D iommu_unmap(d, _dfn(mfn), PAGE_ORDER_4K, 1, =
&flush_flags);
>             if ( !err )
>                 err =3D iommu_iotlb_flush(d, _dfn(mfn), PAGE_ORDER_4K, =
1, flush_flags);
>             if ( !rc )
>                 rc =3D err;
>         }
>=20
> ?

Yes.

>=20
> > @@ -1441,9 +1446,16 @@ int clear_identity_p2m_entry(struct domain =
*d, unsigned long gfn_l)
> >
> >      if ( !paging_mode_translate(d) )
> >      {
> > -        if ( !is_iommu_enabled(d) )
> > -            return 0;
> > -        return iommu_legacy_unmap(d, _dfn(gfn_l), PAGE_ORDER_4K);
> > +        unsigned int flush_flags =3D 0;
> > +        int err;
> > +
> > +        ret =3D iommu_unmap(d, _dfn(gfn_l), PAGE_ORDER_4K, 1, =
&flush_flags);
> > +
> > +        err =3D iommu_iotlb_flush(d, _dfn(gfn_l), PAGE_ORDER_4K, 1, =
flush_flags);
> > +        if ( !ret )
> > +            ret =3D err;
> > +
> > +        return ret;
> >      }
>=20
> Similarly here then.
>=20

Yes.

> > --- a/xen/arch/x86/x86_64/mm.c
> > +++ b/xen/arch/x86/x86_64/mm.c
> > @@ -1413,21 +1413,22 @@ int memory_add(unsigned long spfn, unsigned =
long epfn, unsigned int pxm)
> >           !iommu_use_hap_pt(hardware_domain) &&
> >           !need_iommu_pt_sync(hardware_domain) )
> >      {
> > -        for ( i =3D spfn; i < epfn; i++ )
> > -            if ( iommu_legacy_map(hardware_domain, _dfn(i), =
_mfn(i),
> > -                                  PAGE_ORDER_4K,
> > -                                  IOMMUF_readable | =
IOMMUF_writable) )
> > -                break;
> > -        if ( i !=3D epfn )
> > -        {
> > -            while (i-- > old_max)
> > -                /* If statement to satisfy __must_check. */
> > -                if ( iommu_legacy_unmap(hardware_domain, _dfn(i),
> > -                                        PAGE_ORDER_4K) )
> > -                    continue;
> > +        unsigned int flush_flags =3D 0;
> > +        unsigned int n =3D epfn - spfn;
> > +        int rc;
> >
> > +        ret =3D -EOVERFLOW;
> > +        if ( spfn + n !=3D epfn )
> > +            goto destroy_m2p;
> > +
> > +        rc =3D iommu_map(hardware_domain, _dfn(i), _mfn(i),
> > +                       PAGE_ORDER_4K, n, IOMMUF_readable | =
IOMMUF_writable,
> > +                       &flush_flags);
> > +        if ( !rc )
> > +            rc =3D iommu_iotlb_flush(hardware_domain, _dfn(i), =
PAGE_ORDER_4K, n,
> > +                                       flush_flags);
> > +        if ( rc )
> >              goto destroy_m2p;
> > -        }
> >      }
>=20
> Did you mean to use "ret" here instead of introducing "rc"?
>=20

The previous code did not set ret in the case of an iommu op failure but =
that does appear to be a mistake. I will use ret, as you suggest, but I =
will call it out in the commit description too.

> > --- a/xen/common/grant_table.c
> > +++ b/xen/common/grant_table.c
> > @@ -1225,11 +1225,23 @@ map_grant_ref(
> >              kind =3D IOMMUF_readable;
> >          else
> >              kind =3D 0;
> > -        if ( kind && iommu_legacy_map(ld, _dfn(mfn_x(mfn)), mfn, 0, =
kind) )
> > +        if ( kind )
> >          {
> > -            double_gt_unlock(lgt, rgt);
> > -            rc =3D GNTST_general_error;
> > -            goto undo_out;
> > +            dfn_t dfn =3D _dfn(mfn_x(mfn));
> > +            unsigned int flush_flags =3D 0;
> > +            int err;
> > +
> > +            err =3D iommu_map(ld, dfn, mfn, 0, 1, kind, =
&flush_flags);
> > +            if ( !err )
> > +                err =3D iommu_iotlb_flush(ld, dfn, 0, 1, =
flush_flags);
>=20
> Question of 0 vs PAGE_ORDER_4K again.
>=20
> > @@ -1473,21 +1485,25 @@ unmap_common(
> >      if ( rc =3D=3D GNTST_okay && gnttab_need_iommu_mapping(ld) )
> >      {
> >          unsigned int kind;
> > +        dfn_t dfn =3D _dfn(mfn_x(op->mfn));
> > +        unsigned int flush_flags =3D 0;
> >          int err =3D 0;
> >
> >          double_gt_lock(lgt, rgt);
> >
> >          kind =3D mapkind(lgt, rd, op->mfn);
> >          if ( !kind )
> > -            err =3D iommu_legacy_unmap(ld, _dfn(mfn_x(op->mfn)), =
0);
> > +            err =3D iommu_unmap(ld, dfn, 0, 1, &flush_flags);
> >          else if ( !(kind & MAPKIND_WRITE) )
> > -            err =3D iommu_legacy_map(ld, _dfn(mfn_x(op->mfn)), =
op->mfn, 0,
> > -                                   IOMMUF_readable);
> > -
> > -        double_gt_unlock(lgt, rgt);
> > +            err =3D iommu_map(ld, dfn, op->mfn, 0, 1, =
IOMMUF_readable,
> > +                            &flush_flags);
> >
> > +        if ( !err )
> > +            err =3D iommu_iotlb_flush(ld, dfn, 0, 1, flush_flags);
> >          if ( err )
> >              rc =3D GNTST_general_error;
> > +
> > +        double_gt_unlock(lgt, rgt);
> >      }
>=20
> While moving the unlock ahead of the flush would be somewhat =
troublesome
> in the map case, it seems straightforward here. Even if this gets =
further
> adjusted by a later patch, it should imo be done here - the later =
patch
> may also go in much later.
>=20

Ok.

> > --- a/xen/common/memory.c
> > +++ b/xen/common/memory.c
> > @@ -824,8 +824,7 @@ int xenmem_add_to_physmap(struct domain *d, =
struct xen_add_to_physmap *xatp,
> >      xatp->gpfn +=3D start;
> >      xatp->size -=3D start;
> >
> > -    if ( is_iommu_enabled(d) )
> > -       this_cpu(iommu_dont_flush_iotlb) =3D 1;
> > +    this_cpu(iommu_dont_flush_iotlb) =3D true;
>=20
> Just like you replace the original instance here, ...
>=20
> > @@ -845,6 +844,8 @@ int xenmem_add_to_physmap(struct domain *d, =
struct xen_add_to_physmap *xatp,
> >          }
> >      }
> >
> > +    this_cpu(iommu_dont_flush_iotlb) =3D false;
> > +
> >      if ( is_iommu_enabled(d) )
> >      {
> >          int ret;
>=20
> ... I'm sure you meant to also remove the original instance from
> down below here.

I did indeed. Thanks for spotting.

>=20
> > @@ -364,7 +341,7 @@ int iommu_iotlb_flush(struct domain *d, dfn_t =
dfn, unsigned int page_order,
> >      int rc;
> >
> >      if ( !is_iommu_enabled(d) || !hd->platform_ops->iotlb_flush ||
> > -         !page_count || !flush_flags )
> > +         !page_count || !flush_flags || =
this_cpu(iommu_dont_flush_iotlb) )
> >          return 0;
>=20
> The patch description ought to assure the safety of this change: So
> far, despite the flag set callers of iommu_iotlb_flush() (which
> may be unaware of the flag's state) did get what they did ask for.
> The change relies on there not being any such uses.
>=20

Ok, I'll call it out.

> > @@ -370,15 +362,12 @@ void iommu_dev_iotlb_flush_timeout(struct =
domain *d, struct pci_dev *pdev);
> >
> >  /*
> >   * The purpose of the iommu_dont_flush_iotlb optional cpu flag is =
to
> > - * avoid unecessary iotlb_flush in the low level IOMMU code.
> > - *
> > - * iommu_map_page/iommu_unmap_page must flush the iotlb but =
somethimes
> > - * this operation can be really expensive. This flag will be set by =
the
> > - * caller to notify the low level IOMMU code to avoid the iotlb =
flushes.
> > - * iommu_iotlb_flush/iommu_iotlb_flush_all will be explicitly =
called by
> > - * the caller.
> > + * avoid unecessary IOMMU flushing while updating the P2M.
>=20
> Correct the spelling of "unnecessary" at the same time?
>=20

Oh yes. Will do.

  Paul

> Jan


