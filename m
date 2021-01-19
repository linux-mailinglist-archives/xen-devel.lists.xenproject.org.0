Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAE82FB622
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 13:45:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70347.126214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1qO8-0004er-AN; Tue, 19 Jan 2021 12:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70347.126214; Tue, 19 Jan 2021 12:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1qO8-0004eQ-6y; Tue, 19 Jan 2021 12:45:36 +0000
Received: by outflank-mailman (input) for mailman id 70347;
 Tue, 19 Jan 2021 12:45:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=amlx=GW=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l1qO6-0004eL-Vu
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 12:45:35 +0000
Received: from mail-wr1-x42f.google.com (unknown [2a00:1450:4864:20::42f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e10f23a-a1b5-4543-b2ed-502fe36bc803;
 Tue, 19 Jan 2021 12:45:33 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id d13so19561294wrc.13
 for <xen-devel@lists.xenproject.org>; Tue, 19 Jan 2021 04:45:33 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-242.range86-183.btcentralplus.com.
 [86.183.162.242])
 by smtp.gmail.com with ESMTPSA id x128sm4637293wmb.29.2021.01.19.04.45.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Jan 2021 04:45:32 -0800 (PST)
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
X-Inumbo-ID: 9e10f23a-a1b5-4543-b2ed-502fe36bc803
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=Ua4wIn6UjicH7b6kEbqGScS2U01j/xJHt0R8vSGbkSQ=;
        b=qexrHV60CigLsqvJODRfZG6PrcbTwRuuhDxsbNetZTnvRznTCKnUd/MctfzNbg9p2k
         4X2ArnII13UmDTXSioyTFr7mD8UMOuXRcVwLGgNfoUyYOiURWDn5uKMKCIpXJMfDqZ6F
         KaA86bwqvOa0Grr+mlGTjaudbk7Z0PPzmUZM72EKcntdu+qQkQcv1nu8O6Tw6IaRbGbX
         ewhZPrBNh75KTP51Ci3TFDflpvzbYhHczNeZP12orgLVmVjg77B9NkZBk8Ukd1sgCyXc
         VbZYOuXWgAYOtR9DiilkHmCNMO5gboh0cxrNRlsbolBwk4MOvQgwHuY3e2yRVXHvdB7/
         jQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=Ua4wIn6UjicH7b6kEbqGScS2U01j/xJHt0R8vSGbkSQ=;
        b=SNbwyIKTPlYRCnwbsb36OFzcb7lEObCmfBjsHe2UFvqb3NdKVpOVpDljURA1slzpg+
         bMY+2IGktGDXz+LWEvJPMQ3FuzHVgg/QogV1LcvZidaAADRWzoNISiI5JJ0jRiC+zNUG
         ejOI1JDofw4EvBBDExq+l6EpABU8qYlG8dAZTQm4lEB5Tii0gWMlIixGWS46DTxMvADv
         nzuSzMdclB7nxB7xJJRBmoiter8pd0KB4rQR+vfTfei3hmMIELR1BbQIIXT6sUKSGV4/
         RcUAlGYaTsMb0OgRYvD7lQvRr5YYT8N81eUOQteUqaa0o9SDpuN98pMGjcaetue0WEDA
         zB5w==
X-Gm-Message-State: AOAM5316sWZmmAtB2UAXZftHplN2gIz6FSJ9XC69cz2tBx1i+mBNAJ7S
	9K88dSg2zu0C3Yma02U+Qyk=
X-Google-Smtp-Source: ABdhPJwC55kXx6QMg5U6187pexcfKUtjiiqY7shBGz2yHt2/hLsBT75biW97ybAvpratMPHr+yeo2A==
X-Received: by 2002:a5d:5512:: with SMTP id b18mr4250928wrv.13.1611060332752;
        Tue, 19 Jan 2021 04:45:32 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'Xen-devel'" <xen-devel@lists.xenproject.org>
Cc: "'Jan Beulich'" <JBeulich@suse.com>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Wei Liu'" <wl@xen.org>,
	"'Tamas K Lengyel'" <tamas@tklengyel.com>
References: <20210119094122.23713-1-andrew.cooper3@citrix.com> <20210119122756.27772-1-andrew.cooper3@citrix.com>
In-Reply-To: <20210119122756.27772-1-andrew.cooper3@citrix.com>
Subject: RE: [PATCH v2] x86/mm: Short circuit damage from "fishy" ref/typecount failure
Date: Tue, 19 Jan 2021 12:45:31 -0000
Message-ID: <010d01d6ee60$f958b620$ec0a2260$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGBGS7bP+6FoZJgIsckysiPtkyajgKXs/fwqsXRqBA=
Content-Language: en-gb

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 19 January 2021 12:28
> To: Xen-devel <xen-devel@lists.xenproject.org>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Jan Beulich =
<JBeulich@suse.com>; Roger Pau Monn=C3=A9
> <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; Paul Durrant =
<paul@xen.org>; Tamas K Lengyel
> <tamas@tklengyel.com>
> Subject: [PATCH v2] x86/mm: Short circuit damage from "fishy" =
ref/typecount failure
>=20
> This code has been copied in 3 places, but it is problematic.
>=20
> All cases will hit a BUG() later in domain teardown, when a the =
missing
> type/count reference is underflowed.
>=20
> Don't complicated the logic by leaving a totally unqualified domain =
crash, and
> a timebomb which will be triggered by the toolstack at a slightly =
later, and
> seemingly unrelated, point.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Paul Durrant <paul@xen.org>
> CC: Tamas K Lengyel <tamas@tklengyel.com>
>=20
> v2:
>  * Reword the commit message.
>  * Switch BUG() to BUG_ON() to further reduce code volume.
> ---
>  xen/arch/x86/hvm/ioreq.c     | 11 ++---------
>  xen/arch/x86/hvm/vmx/vmx.c   | 11 ++---------
>  xen/arch/x86/mm/mem_paging.c | 17 ++++-------------
>  3 files changed, 8 insertions(+), 31 deletions(-)
>=20
> diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
> index 1cc27df87f..0c38cfa151 100644
> --- a/xen/arch/x86/hvm/ioreq.c
> +++ b/xen/arch/x86/hvm/ioreq.c
> @@ -366,15 +366,8 @@ static int hvm_alloc_ioreq_mfn(struct =
hvm_ioreq_server *s, bool buf)
>      if ( !page )
>          return -ENOMEM;
>=20
> -    if ( !get_page_and_type(page, s->target, PGT_writable_page) )
> -    {
> -        /*
> -         * The domain can't possibly know about this page yet, so =
failure
> -         * here is a clear indication of something fishy going on.
> -         */
> -        domain_crash(s->emulator);
> -        return -ENODATA;
> -    }
> +    /* Domain can't know about this page yet - something fishy going =
on. */
> +    BUG_ON(!get_page_and_type(page, s->target, PGT_writable_page));
>=20
>      iorp->va =3D __map_domain_page_global(page);
>      if ( !iorp->va )
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 2d4475ee3d..8e438cb781 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -3042,15 +3042,8 @@ static int vmx_alloc_vlapic_mapping(struct =
domain *d)
>      if ( !pg )
>          return -ENOMEM;
>=20
> -    if ( !get_page_and_type(pg, d, PGT_writable_page) )
> -    {
> -        /*
> -         * The domain can't possibly know about this page yet, so =
failure
> -         * here is a clear indication of something fishy going on.
> -         */
> -        domain_crash(d);
> -        return -ENODATA;
> -    }
> +    /* Domain can't know about this page yet - something fishy going =
on. */
> +    BUG_ON(!get_page_and_type(page, s->target, PGT_writable_page));

Does this compile?

s/page/pg
s/s->target/d

...and similar below is needed AFAICT.

  Paul

>=20
>      mfn =3D page_to_mfn(pg);
>      clear_domain_page(mfn);
> diff --git a/xen/arch/x86/mm/mem_paging.c =
b/xen/arch/x86/mm/mem_paging.c
> index 01281f786e..6e90019e76 100644
> --- a/xen/arch/x86/mm/mem_paging.c
> +++ b/xen/arch/x86/mm/mem_paging.c
> @@ -379,19 +379,10 @@ static int prepare(struct domain *d, gfn_t gfn,
>          page =3D alloc_domheap_page(d, 0);
>          if ( unlikely(page =3D=3D NULL) )
>              goto out;
> -        if ( unlikely(!get_page(page, d)) )
> -        {
> -            /*
> -             * The domain can't possibly know about this page yet, so =
failure
> -             * here is a clear indication of something fishy going =
on.
> -             */
> -            gprintk(XENLOG_ERR,
> -                    "%pd: fresh page for GFN %"PRI_gfn" in unexpected =
state\n",
> -                    d, gfn_x(gfn));
> -            domain_crash(d);
> -            page =3D NULL;
> -            goto out;
> -        }
> +
> +        /* Domain can't know about this page yet - something fishy =
going on. */
> +        BUG_ON(!get_page(page, s->target));
> +
>          mfn =3D page_to_mfn(page);
>          page_extant =3D 0;
>=20
> --
> 2.11.0



