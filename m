Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 969221A0DDA
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 14:39:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLnVV-0008Hs-GK; Tue, 07 Apr 2020 12:39:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xamf=5X=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jLnVT-0008Hn-9Q
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 12:39:07 +0000
X-Inumbo-ID: c4c3cf12-78cc-11ea-b58d-bc764e2007e4
Received: from mail-ed1-x536.google.com (unknown [2a00:1450:4864:20::536])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c4c3cf12-78cc-11ea-b58d-bc764e2007e4;
 Tue, 07 Apr 2020 12:39:06 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id a43so3845561edf.6
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2020 05:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=kvGztbBbTNmcvaXcaGHJxX88VkfFCPsYdD8uwpJUUkc=;
 b=N4uhEcMHIqmAIJCZcTrGRsc4OhkMUIeoD0d8DNT51CVJVNqso91uePRAARNfQXwKGo
 fo3hUyEJ5+WIkok2e3LEdnMeUqJqU5sUip/X1+cCkhLY4UgZKDvjva+tInd2ISFm7ERk
 YnjHg1mavBqW63pPLAFjzIXhM8D5CgTgEXng5gReV2GXaLJC6/2MHHyKfze4YCZQeN0e
 xrl8nQWwCewf01e6rVIKZ/sGr+WFnacxnW/0djm5z7/YII0D5UnaExi7j7bx48SSB4dM
 SLnvTgCaOdkAdekZ/TCIpZbWOmoYdpFX7cn2Fyx3oNsp8klY4gfw5bvE2hVm4Ly7VH3O
 rsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=kvGztbBbTNmcvaXcaGHJxX88VkfFCPsYdD8uwpJUUkc=;
 b=J6Ij0EYkVRj1ZQZMDtA6PR71aBIlOmOTqHwS7SKryxRVeFVhoUWNvZUKbBfs23/fKc
 P6R1orPMCx1HCaQqw60ppWDmm1kN+wWjoM5AUN7dbttezCQy1cgaA+t31eyg0Lad4s7W
 KAEMgfCM1gzvzR5ula/rBvi0GMLf4D1wRSL9kD7RsqAt1BZ7HmTEeFwkRZNFbe7RlDqx
 bcydEPjFSwnEj+4pE9aP4H2HmmmjiHKrwgdYfu68fdN/qwBuDNuypLcNGlKk59xpsu0L
 8HxYf3jzOKZFQj5jy7cNa1HLfzxpk4JuOZnM/9RuwaFMkyFP/pary4lvKjbel0qloRUZ
 Icgg==
X-Gm-Message-State: AGi0PuY1Lk/DhegRllzFOWzUeF9oTuJxUEC5UaE4yrIM3kppFEvCUXxX
 4CNwBW3wJMUx0hOZCywEsVc=
X-Google-Smtp-Source: APiQypINmbTIxfSwodacflcNMQCPdJWUnDRo+xzCHTbZ2UeihRO9Xowxdm3DJi7bkWNMcbZB0jIXrA==
X-Received: by 2002:a17:906:848d:: with SMTP id
 m13mr1919740ejx.348.1586263145457; 
 Tue, 07 Apr 2020 05:39:05 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id h14sm3251288ejt.1.2020.04.07.05.39.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Apr 2020 05:39:04 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <5da96b29-7f80-4bfd-eb30-5547f415d2b8@suse.com>
In-Reply-To: <5da96b29-7f80-4bfd-eb30-5547f415d2b8@suse.com>
Subject: RE: [PATCH] x86/PoD: correct ordering of checks in
 p2m_pod_zero_check()
Date: Tue, 7 Apr 2020 13:39:03 +0100
Message-ID: <002401d60cd9$85f54a90$91dfdfb0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIwdhvhy/cDqSF8hSPabZmm4ojCOKe4xjog
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 07 April 2020 12:08
> To: xen-devel@lists.xenproject.org
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com>; Wei Liu
> <wl@xen.org>; Paul Durrant <paul@xen.org>
> Subject: [PATCH] x86/PoD: correct ordering of checks in =
p2m_pod_zero_check()
>=20
> Commit 0537d246f8db ("mm: add 'is_special_page' inline function...")
> moved the is_special_page() checks first in its respective changes to
> PoD code. While this is fine for p2m_pod_zero_check_superpage(), the
> validity of the MFN is inferred in both cases from the p2m_is_ram()
> check, which therefore also needs to come first in this 2nd instance.
>=20
> Take the opportunity and address latent UB here as well - transform
> the MFN into struct page_info * only after having established that
> this is a valid page.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>

...with a suggestion below

> ---
> I will admit that this was build tested only. I did observe the crash
> late yesterday while in the office, but got around to analyzing it =
only
> today, where I'm again restricted in what I can reasonably test.
>=20
> --- a/xen/arch/x86/mm/p2m-pod.c
> +++ b/xen/arch/x86/mm/p2m-pod.c
> @@ -877,23 +877,25 @@ p2m_pod_zero_check(struct p2m_domain *p2
>      for ( i =3D 0; i < count; i++ )
>      {
>          p2m_access_t a;
> -        struct page_info *pg;
>=20
>          mfns[i] =3D p2m->get_entry(p2m, gfns[i], types + i, &a,
>                                   0, NULL, NULL);
> -        pg =3D mfn_to_page(mfns[i]);
>=20
>          /*
>           * If this is ram, and not a pagetable or a special page, and
>           * probably not mapped elsewhere, map it; otherwise, skip.
>           */
> -        if ( !is_special_page(pg) && p2m_is_ram(types[i]) &&
> -             (pg->count_info & PGC_allocated) &&
> -             !(pg->count_info & PGC_page_table) &&
> -             ((pg->count_info & PGC_count_mask) <=3D max_ref) )
> -            map[i] =3D map_domain_page(mfns[i]);
> -        else
> -            map[i] =3D NULL;
> +        map[i] =3D NULL;
> +        if ( p2m_is_ram(types[i]) )
> +        {
> +            const struct page_info *pg =3D mfn_to_page(mfns[i]);

Perhaps have local scope stack variable for count_info too?

> +
> +            if ( !is_special_page(pg) &&
> +                 (pg->count_info & PGC_allocated) &&
> +                 !(pg->count_info & PGC_page_table) &&
> +                 ((pg->count_info & PGC_count_mask) <=3D max_ref) )
> +                map[i] =3D map_domain_page(mfns[i]);
> +        }
>      }
>=20
>      /*


