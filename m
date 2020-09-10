Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B05862647EF
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 16:24:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGNUC-0003qa-4n; Thu, 10 Sep 2020 14:23:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0EwZ=CT=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kGNUB-0003qU-8F
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 14:23:39 +0000
X-Inumbo-ID: 60cf4e93-503f-49ee-b7d6-e648116f6188
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60cf4e93-503f-49ee-b7d6-e648116f6188;
 Thu, 10 Sep 2020 14:23:38 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z1so6932907wrt.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2020 07:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=E5QufOZ0fQ+V21nEP506OFw6lmzb1xrH7oeDLO1xCvw=;
 b=Ebl2lDJmzawQ5DheRxJk/xMIr+Qz8BmC3DKyIk34XmwJhzYs9DtUd0wA259wV5HQza
 UJHy6TWfDXzZn5Q0DxqPxkI8WSJyebXX0dP4eZv15KLxgZJn5Hm2tXxPfArxQ2sDJBXT
 p0IDIxXWdGrqdOcXYnE0/r2UurRbxtR72276M5ru822/yTmIhuaUnsDuo/pgJ2+e9snx
 cafM+D3d57+zVZmxYtMd4gzWZF8eR3s2Lu6H3dCjfffcwcC3tL4GUfkZXTvexHgpj0lq
 DX1kuCa9N/AM0+vcCCURWujJWVm8Xru2/edijiJQUwZctGxQ4GsHiUHvbJDknJFZuJu1
 DapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=E5QufOZ0fQ+V21nEP506OFw6lmzb1xrH7oeDLO1xCvw=;
 b=CqjlfgP1mTyZvPY5dMgSmbLTkWTtkxuVtgfZgGOgcJXwIp6RKQqtey8qbrsJhwSr0V
 DIoD4xFtn/s/jDkJAYeR2a3Q75o1WEob3pLRUcgC/BSOIfe0KWrG88P0BAz0z96KOBSv
 MooLD7saR+ax/CQoPps3kR3yruuQb4X+f/JyPuyxWp+EFCKqS/e0d6oMu71GKfgOawcj
 DpXzX7uYBXLowYkGleFWnXY+ASsu2uAi05SPGwn71bEJdfHAPai3/iUM4jnLru+bLLUs
 zDRy4vjbCs0uAJDNCGEgNvnZM349GfC06TOK9AWJgy+jcr4IdF78vBZincuvi0pYadkj
 FngA==
X-Gm-Message-State: AOAM531S2fzT56Ug5qDmGctUk9dMb2fnXir7RAEvyqh6OyIem08b3m7I
 xMPbOy4rCcswcX8c6JhU00w=
X-Google-Smtp-Source: ABdhPJzAqtHEPnSQhEq5OyX0w195hCszT5Y/sG8BrMG6QadhOXui7kTcqq2o4KEAAB4OUNdb4h70dQ==
X-Received: by 2002:a5d:4910:: with SMTP id x16mr10233760wrq.204.1599747817458; 
 Thu, 10 Sep 2020 07:23:37 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id s5sm9516601wrm.33.2020.09.10.07.23.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Sep 2020 07:23:37 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Roger Pau Monne'" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Cc: "'Jan Beulich'" <jbeulich@suse.com>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>, "'Wei Liu'" <wl@xen.org>
References: <20200910133514.82155-1-roger.pau@citrix.com>
In-Reply-To: <20200910133514.82155-1-roger.pau@citrix.com>
Subject: RE: [PATCH] x86/mm: do not mark IO regions as Xen heap
Date: Thu, 10 Sep 2020 15:23:36 +0100
Message-ID: <003201d6877d$f8e07650$eaa162f0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIAf0eTjeMNipPhIAgkagC3BDyTm6kN/Mrg
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
> From: Roger Pau Monne <roger.pau@citrix.com>
> Sent: 10 September 2020 14:35
> To: xen-devel@lists.xenproject.org
> Cc: Roger Pau Monne <roger.pau@citrix.com>; Jan Beulich =
<jbeulich@suse.com>; Andrew Cooper
> <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>; Paul Durrant =
<paul@xen.org>
> Subject: [PATCH] x86/mm: do not mark IO regions as Xen heap
>=20
> arch_init_memory will treat all the gaps on the physical memory map
> between RAM regions as MMIO and use share_xen_page_with_guest in order
> to assign them to dom_io. This has the side effect of setting the Xen
> heap flag on such pages, and thus is_special_page would then return
> true which is an issue in epte_get_entry_emt because such pages will
> be forced to use write-back cache attributes.
>=20
> Fix this by introducing a new helper to assign the MMIO regions to
> dom_io without setting the Xen heap flag on the pages, so that
> is_special_page will return false and the pages won't be forced to use
> write-back cache attributes.
>=20
> Fixes: 81fd0d3ca4b2cd ('x86/hvm: simplify 'mmio_direct' check in =
epte_get_entry_emt()')
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Cc: Paul Durrant <paul@xen.org>
> ---
>  xen/arch/x86/mm.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index 35ec0e11f6..4daf4e038a 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -271,6 +271,18 @@ static l4_pgentry_t __read_mostly split_l4e;
>  #define root_pgt_pv_xen_slots ROOT_PAGETABLE_PV_XEN_SLOTS
>  #endif
>=20
> +static void __init assign_io_page(struct page_info *page)
> +{
> +    set_gpfn_from_mfn(mfn_x(page_to_mfn(page)), INVALID_M2P_ENTRY);
> +
> +    /* The incremented type count pins as writable. */
> +    page->u.inuse.type_info =3D PGT_writable_page | PGT_validated | =
1;
> +
> +    page_set_owner(page, dom_io);
> +
> +    page->count_info |=3D PGC_allocated | 1;
> +}
> +
>  void __init arch_init_memory(void)
>  {
>      unsigned long i, pfn, rstart_pfn, rend_pfn, iostart_pfn, =
ioend_pfn;
> @@ -291,7 +303,7 @@ void __init arch_init_memory(void)
>       */
>      BUG_ON(pvh_boot && trampoline_phys !=3D 0x1000);
>      for ( i =3D 0; i < 0x100; i++ )
> -        share_xen_page_with_guest(mfn_to_page(_mfn(i)), dom_io, =
SHARE_rw);
> +        assign_io_page(mfn_to_page(_mfn(i)));
>=20
>      /* Any areas not specified as RAM by the e820 map are considered =
I/O. */
>      for ( i =3D 0, pfn =3D 0; pfn < max_page; i++ )
> @@ -332,7 +344,7 @@ void __init arch_init_memory(void)
>              if ( !mfn_valid(_mfn(pfn)) )
>                  continue;
>=20
> -            share_xen_page_with_guest(mfn_to_page(_mfn(pfn)), dom_io, =
SHARE_rw);
> +            assign_io_page(mfn_to_page(_mfn(pfn)));

Now these calls to share_xen_page_with_guest() are gone, can we change =
share_xen_page_with_guest() to ASSERT that PGC_xen_heap is already set, =
and avoid (needlessly) ORing it in?

  Paul


>          }
>=20
>          /* Skip the RAM region. */
> --
> 2.28.0



