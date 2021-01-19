Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B47D72FB639
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 14:07:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70362.126256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1qid-0006sm-Ia; Tue, 19 Jan 2021 13:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70362.126256; Tue, 19 Jan 2021 13:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1qid-0006sN-FB; Tue, 19 Jan 2021 13:06:47 +0000
Received: by outflank-mailman (input) for mailman id 70362;
 Tue, 19 Jan 2021 13:06:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=amlx=GW=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l1qib-0006sI-QO
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 13:06:45 +0000
Received: from mail-wm1-x336.google.com (unknown [2a00:1450:4864:20::336])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59af163b-f617-48b2-9e2a-2e0c9b91b345;
 Tue, 19 Jan 2021 13:06:44 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id j18so5417454wmi.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Jan 2021 05:06:44 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-242.range86-183.btcentralplus.com.
 [86.183.162.242])
 by smtp.gmail.com with ESMTPSA id b10sm4360782wmj.5.2021.01.19.05.06.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Jan 2021 05:06:43 -0800 (PST)
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
X-Inumbo-ID: 59af163b-f617-48b2-9e2a-2e0c9b91b345
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=dyNrS/jV4q/jGJJivVjRTpWcRU/bP0nF4KV/dqQkb18=;
        b=iaz4+KeFTwVfhpQgaUWIdX2RcuzC/hF1p2fmBC3FAh18wt+IkTxL5XQTpZarXGgho9
         J91HiMuED+MI0fmOLggS7LqomWG/dOmpT1xbT7/7/j2VgenMNzjcCZAUiLCJbGYpB106
         PzdLIa/VCBA+aagHHq2S7OtXgIrwn2jPxgcb+HRgjYognwuV+O0327933Y7W6+NEuztY
         x58QPPi/wfg+Laqi/1IOJ3EiQJgkV2ipqmWlJ8DDH4vBLWqyOPUNG9qgd37Usxy+I+Zh
         +zOWwnPpAvRZxeCrSnynyd0UlEm+sr4ZO1oeISiEh4TSt9EQHnoVtbdO+fphUySRigKP
         WIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=dyNrS/jV4q/jGJJivVjRTpWcRU/bP0nF4KV/dqQkb18=;
        b=j0j3rD+vet61PdqTTsk3FVpZwnwtAHriq3EUC+l3Woq+bFsmR/mDFAURneNOr6UOZS
         N7+joxq0P1ExaVRtt8R00GAexuJM00LFYIboCNlBo5dlvNIdWxNis9lK0Tsvw3gqDXON
         +KbXYGY7tBwKhc1wucUAMmnALwXHvWpRTe+pjz82CAjlrIlOgem5krI86+B3sepH1yjX
         UI2OT4ehqc5bwihOxliunNvFRZrbFCQyzMwT5jpGmMJ8hR16Zn01JK7M4VtXG2mwptas
         be4hdbdTiNXWOZd+pNa8YFixV3eTOkrb8aW5TsTshYU4TisqzuJyzjaXe9VX5wU3dCLb
         H34g==
X-Gm-Message-State: AOAM532SaiDIOabaK89EoW27M1G3AadEJDNCTUg62qZKZMLd5C0OXyZB
	NoK+Un4DI8AWrodHS4vKIsU=
X-Google-Smtp-Source: ABdhPJy3+g/V2XsWQkpRVA+wKAV0qOzfJ2XWHvx4U5N2M6lGofP9DiBemI5NdZDTmhzdjXQV2EW2Ig==
X-Received: by 2002:a1c:ed10:: with SMTP id l16mr2121590wmh.36.1611061603828;
        Tue, 19 Jan 2021 05:06:43 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'Xen-devel'" <xen-devel@lists.xenproject.org>
Cc: "'Jan Beulich'" <JBeulich@suse.com>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Wei Liu'" <wl@xen.org>,
	"'Tamas K Lengyel'" <tamas@tklengyel.com>
References: <20210119094122.23713-1-andrew.cooper3@citrix.com> <20210119130254.27058-1-andrew.cooper3@citrix.com>
In-Reply-To: <20210119130254.27058-1-andrew.cooper3@citrix.com>
Subject: RE: [PATCH v3] x86/mm: Short circuit damage from "fishy" ref/typecount failure
Date: Tue, 19 Jan 2021 13:06:42 -0000
Message-ID: <011d01d6ee63$ef036b40$cd0a41c0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGBGS7bP+6FoZJgIsckysiPtkyajgDI+IugqtRNliA=
Content-Language: en-gb

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 19 January 2021 13:03
> To: Xen-devel <xen-devel@lists.xenproject.org>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Jan Beulich =
<JBeulich@suse.com>; Roger Pau Monn=C3=A9
> <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; Paul Durrant =
<paul@xen.org>; Tamas K Lengyel
> <tamas@tklengyel.com>
> Subject: [PATCH v3] x86/mm: Short circuit damage from "fishy" =
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
> v3:
>  * Actually include the typo corrects to make it compile.

Looks ok now :-)

Reviewed-by: Paul Durrant <paul@xen.org>

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
> index 2d4475ee3d..4120234c15 100644
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
> +    BUG_ON(!get_page_and_type(pg, d, PGT_writable_page));
>=20
>      mfn =3D page_to_mfn(pg);
>      clear_domain_page(mfn);
> diff --git a/xen/arch/x86/mm/mem_paging.c =
b/xen/arch/x86/mm/mem_paging.c
> index 01281f786e..60d667ae94 100644
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
> +        BUG_ON(!get_page(page, d));
> +
>          mfn =3D page_to_mfn(page);
>          page_extant =3D 0;
>=20
> --
> 2.11.0



