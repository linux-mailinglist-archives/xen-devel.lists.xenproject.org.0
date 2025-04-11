Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6093AA850EE
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 03:05:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946530.1344391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u32ox-0002bh-F4; Fri, 11 Apr 2025 01:04:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946530.1344391; Fri, 11 Apr 2025 01:04:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u32ox-0002aF-CL; Fri, 11 Apr 2025 01:04:39 +0000
Received: by outflank-mailman (input) for mailman id 946530;
 Fri, 11 Apr 2025 01:04:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eOtD=W5=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1u32ow-0002a9-CV
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 01:04:38 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee74113f-1670-11f0-9ead-5ba50f476ded;
 Fri, 11 Apr 2025 03:04:35 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1744333469385638.7964735969545;
 Thu, 10 Apr 2025 18:04:29 -0700 (PDT)
Received: by mail-oo1-f54.google.com with SMTP id
 006d021491bc7-6040465b9e2so737207eaf.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 18:04:29 -0700 (PDT)
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
X-Inumbo-ID: ee74113f-1670-11f0-9ead-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1744333471; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iXTcrXk885wj3zze+M5BZXFb4LHht6SaOkzV62qw4bWRgVNAIAnlBlY9S/S+YMx6KYUE495aKu6XpiKxctr5SpWAIMJGV/hUFF4UzkCMM1PLryE4goDKB8yQdC7CxSicZffO4PjgB9VpzNA6LYuXupZcdW/HSdXl6fcFGaok7pA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744333471; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=EA8LXa/Kr1rDhgq7fsazy42w7N5pCyv4+5e8QlYl2DQ=; 
	b=fJKknIg+K5CxxdFre0LuscTZUBbnEj7xgCLAfO6UngiZbdS1LumZm+qj51MOY4BW0T/keD5c3tNzfwM/wP4oNGD+G8o9Y6ZXVkZ3Jly28OhsYGc6JQNmmHS30wzGR+CnFy6H5nvxaT6kVnHbbAG67SsK5rvZqcDfW3X8CaucKgg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744333471;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=EA8LXa/Kr1rDhgq7fsazy42w7N5pCyv4+5e8QlYl2DQ=;
	b=GX+ugA4rMWHsGaENSWbnUnkKmMM47UfdFahpvXyVAD1ek4CblzEaoLKxxP9jYa0Y
	H6MXAPwkP8z4Xd/++rjyQMC28D+gUqzeilEBXUhxOstpjYGg6ctVZhcZl2NldDn/wVQ
	rIT+jVUiC1d+UDKc7A5YknMDjIsZ9bPsaZ5kHCaI=
X-Gm-Message-State: AOJu0YwjWjZI6Lj9LMSL7WGCBwHCBDyCvYBfeLw9HZlHS3ub8U+p1cz1
	vOLOaEFabDf+pwcFzgiuaTMmsrJZgEzqXKfeXMK4lolUYNEvUjW0rE64mYGJCNE4LL+1lwMmfqZ
	ys0zNNeBCIROML34diXhftCZaJQU=
X-Google-Smtp-Source: AGHT+IHjwYW8cL5XafIlvrDzPaYvWb1Avh+hLCIRwzt5wbdiDQ3xE5fjLS//zN5sM5mRmtPoCdvMav26Atud1SIO2A4=
X-Received: by 2002:a05:6820:543:b0:602:47ec:3df0 with SMTP id
 006d021491bc7-6046f5941a0mr492446eaf.5.1744333468554; Thu, 10 Apr 2025
 18:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <5a261173-d225-44fc-9078-4030ba11cfd8@suse.com>
In-Reply-To: <5a261173-d225-44fc-9078-4030ba11cfd8@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 10 Apr 2025 21:03:52 -0400
X-Gmail-Original-Message-ID: <CABfawh=2RzTvHfOaSO83b4gW9ZW2P8hXqUZp5HAmCmiEo0Uddg@mail.gmail.com>
X-Gm-Features: ATxdqUEmIGNnNTl9NUSWNOedQ4dqZGhg3OStCLJgGEVRZns_NxfqSmq6v4C-FE4
Message-ID: <CABfawh=2RzTvHfOaSO83b4gW9ZW2P8hXqUZp5HAmCmiEo0Uddg@mail.gmail.com>
Subject: Re: [PATCH] x86/mem-sharing: short-circuit p2m_is_shared() when MEM_SHARING=n
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 4:42=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> Some of the uses of dom_cow aren't easily DCE-able (without extra
> #ifdef-ary), and hence it being constantly NULL when MEM_SHARING=3Dn
> misguides Coverity into thinking that there may be a NULL deref in
>
>         if ( p2m_is_shared(t) )
>             d =3D dom_cow;
>
>         if ( get_page(page, d) )
>             return page;
>
> (in get_page_from_mfn_and_type()). Help the situation by making
> p2m_is_shared() be compile-time false when MEM_SHARING=3Dn, thus also
> permitting the compiler to DCE some other code.
>
> Note that p2m_is_sharable() isn't used outside of mem_sharing.c, and
> hence P2M_SHARABLE_TYPES can simply be left undefined when
> MEM_SHARING=3Dn.
>
> Coverity ID: 1645573
> Fixes: 79d91e178a1a ("dom_cow is needed for mem-sharing only")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Tamas K Lengyel <tamas@tklengyel.com>

> ---
> Might be nice to also eliminate p2m_ram_shared (and for MEM_PAGING=3Dn
> also the three paging types) entirely from such builds, to eliminate the
> risk of accidental use. Yet that would apparently also come at the price
> of more #ifdef-ary. Opinions?

I don't think the risk of accidental use is a concern. I wouldn't
touch them unless they lead to similar confusion with coverity or some
other tool.

Cheers,
Tamas

