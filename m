Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D77BA2647DC
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 16:19:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGNOk-0002wC-6H; Thu, 10 Sep 2020 14:18:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0EwZ=CT=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kGNOh-0002w7-Tg
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 14:17:59 +0000
X-Inumbo-ID: 31055121-867b-4a60-9615-04483dbf1bf0
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31055121-867b-4a60-9615-04483dbf1bf0;
 Thu, 10 Sep 2020 14:17:58 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id g4so6908458wrs.5
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2020 07:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=GpBsBjg7CDFBoqibynKsLD9TMflGusZlHlcEBxu517s=;
 b=l7QjUkVaG8GF1nRpOaneCmY9ZDGqa6/V2QrFKnjdxqSu7Uj5xFnQYJFh0nYU25MT8C
 a3qahGYZEzZXBUR75FgUZGUgxmqR3/ZkatBoXUs2RRIZZr+E2MrPPULf+Nnl4vyvM/F7
 8aQSRUdswcxYguuBmTJhDJ1dcNAJ3vRzTBL6kG0yIF5mda769DZvJahZ50CKHIWbZuAP
 To78hoMZk9Mkf59PccHFdFm9HbFDasF+TT8cy1Wlad49TPnxlugnPtpkdBvTeDYYAuB7
 ZD4vOArSPBX7WOIVtrDlfG8aqjieNfI/q2dV2ixFHKSbg/YEtoQSIzkscQrgYuo1kU+G
 0JRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=GpBsBjg7CDFBoqibynKsLD9TMflGusZlHlcEBxu517s=;
 b=hFcvTODKS/vnEmYjUUXcz8kYTMxWllVKx6KAfq/WUOHXWNhZby5tCkz8aiEMYAF/nK
 sExpaA1ozcKd8n5n0iUAaRf2KK29dg3+y+Wu63i63KHwNu8TP92zq0Y8F4RpLhR2ANIY
 Q6T9aL4I1uNgTPp2KZWhtn+1oRVLtQAn0JWAgJYxUx2tFnxtrQrKKKII3jL2irgGpOBa
 X+MKbVpqYBZzTUMAPPgCQnKTr5r5KG6rXH4YT8J09CHVodeHJyesMAU1U/ztf84lw4pP
 UN640d4E7fRmji9zC1b1zLf/gg96+kMDtgjm81uD+ly3dGKdiRV9ZZCzvbzEkj3EofKU
 BQ9g==
X-Gm-Message-State: AOAM533yH3FFBaTlxxY5l7x3t/aCaGnr4fD6yKEgUR3ObRv/+MHFrPrt
 xjAYsQmvZpJu9MpHvMwpkmM=
X-Google-Smtp-Source: ABdhPJwnPH3uTfohjYeVt0LsszGiLYcGKRQG7g9T2/jnwoFZtPInrp5ZgHTSF/9RxyNjddOXWT5JHA==
X-Received: by 2002:a5d:49d2:: with SMTP id t18mr8663496wrs.99.1599747478031; 
 Thu, 10 Sep 2020 07:17:58 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id q12sm9081058wrp.17.2020.09.10.07.17.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Sep 2020 07:17:57 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: <xen-devel@lists.xenproject.org>, "'Paul Durrant'" <pdurrant@amazon.com>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'George Dunlap'" <george.dunlap@citrix.com>,
 "'Ian Jackson'" <ian.jackson@eu.citrix.com>,
 "'Julien Grall'" <julien@xen.org>,
 "'Stefano Stabellini'" <sstabellini@kernel.org>, "'Wei Liu'" <wl@xen.org>
References: <20200907074023.1392-1-paul@xen.org>
 <20200907074023.1392-7-paul@xen.org>
 <69b7db3f-2f8d-fa96-f5e9-3cb4e35e9dba@suse.com>
In-Reply-To: <69b7db3f-2f8d-fa96-f5e9-3cb4e35e9dba@suse.com>
Subject: RE: [PATCH v5 6/8] common/grant_table: batch flush I/O TLB
Date: Thu, 10 Sep 2020 15:17:56 +0100
Message-ID: <003101d6877d$2e8a36c0$8b9ea440$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHhwG7ATr0KfpJW6ur2MqQg9p50hwJJLhviAbcz1SGpK3L38A==
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
> Sent: 10 September 2020 14:49
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Paul Durrant =
<pdurrant@amazon.com>; Andrew Cooper
> <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>; =
Ian Jackson
> <ian.jackson@eu.citrix.com>; Julien Grall <julien@xen.org>; Stefano =
Stabellini
> <sstabellini@kernel.org>; Wei Liu <wl@xen.org>
> Subject: Re: [PATCH v5 6/8] common/grant_table: batch flush I/O TLB
>=20
> On 07.09.2020 09:40, Paul Durrant wrote:
> > --- a/xen/common/grant_table.c
> > +++ b/xen/common/grant_table.c
> > @@ -241,7 +241,13 @@ struct gnttab_unmap_common {
> >      grant_ref_t ref;
> >  };
> >
> > -/* Number of unmap operations that are done between each tlb flush =
*/
> > +/* Number of map operations that are done between each pre-emption =
check */
> > +#define GNTTAB_MAP_BATCH_SIZE 32
> > +
> > +/*
> > + * Number of unmap operations that are done between each tlb flush =
and
> > + * pre-emption check.
> > + */
> >  #define GNTTAB_UNMAP_BATCH_SIZE 32
>=20
> Interesting - I don't think I've ever seen preemption spelled like
> this (with a hyphen). In the interest of grep-ability, would you
> mind changing to the more "conventional" spelling? Albeit I now
> notice we have two such spellings in the tree already ...
>=20

Sure, I'll change it.

> > @@ -979,7 +985,7 @@ static unsigned int mapkind(
> >
> >  static void
> >  map_grant_ref(
> > -    struct gnttab_map_grant_ref *op)
> > +    struct gnttab_map_grant_ref *op, bool do_flush, unsigned int =
*flush_flags)
>=20
> Why two parameters? Simply pass NULL for singletons instead? Although,
> you'd need another local variable then, which maybe isn't overly much
> nicer.
>=20

No, I think the extra arg is clearer.

> > @@ -1319,29 +1324,60 @@ static long
> >  gnttab_map_grant_ref(
> >      XEN_GUEST_HANDLE_PARAM(gnttab_map_grant_ref_t) uop, unsigned =
int count)
> >  {
> > -    int i;
> > -    struct gnttab_map_grant_ref op;
> > +    struct domain *currd =3D current->domain;
>=20
> Is this a worthwhile variable to have in this case? It's used
> exactly once, granted in the loop body, but still not the inner
> one.
>=20

I thought it was nicer for consistency with the unmap function (where =
curd is used more than once) but I'll drop it.

> > +    unsigned int done =3D 0;
> > +    int rc =3D 0;
> >
> > -    for ( i =3D 0; i < count; i++ )
> > +    while ( count )
> >      {
> > -        if ( i && hypercall_preempt_check() )
> > -            return i;
> > +        unsigned int i, c =3D min_t(unsigned int, count, =
GNTTAB_MAP_BATCH_SIZE);
> > +        unsigned int flush_flags =3D 0;
> >
> > -        if ( unlikely(__copy_from_guest_offset(&op, uop, i, 1)) )
> > -            return -EFAULT;
> > +        for ( i =3D 0; i < c; i++ )
> > +        {
> > +            struct gnttab_map_grant_ref op;
> >
> > -        map_grant_ref(&op);
> > +            if ( unlikely(__copy_from_guest(&op, uop, 1)) )
> > +            {
> > +                rc =3D -EFAULT;
> > +                break;
> > +            }
> >
> > -        if ( unlikely(__copy_to_guest_offset(uop, i, &op, 1)) )
> > -            return -EFAULT;
> > +            map_grant_ref(&op, c =3D=3D 1, &flush_flags);
> > +
> > +            if ( unlikely(__copy_to_guest(uop, &op, 1)) )
> > +            {
> > +                rc =3D -EFAULT;
> > +                break;
> > +            }
> > +
> > +            guest_handle_add_offset(uop, 1);
> > +        }
> > +
> > +        if ( c > 1 )
> > +        {
> > +            int err =3D iommu_iotlb_flush_all(currd, flush_flags);
>=20
> There's still some double flushing involved in the error case here.
> Trying to eliminate this (by having map_grant_ref() write zero
> into *flush_flags) may not be overly important, but I thought I'd
> still mention it.
>=20

This only kicks in if there's more than one operation and is it safe to =
squash the flush_flags if some ops succeed and others fail? If all ops =
fail then flush_flags should still be zero because the call to =
iommu_map() is the last failure point in map_grant_ref() anyway.

  Paul

> Jan


