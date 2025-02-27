Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2C8A48181
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 15:36:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898153.1306732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnf06-00065T-R5; Thu, 27 Feb 2025 14:36:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898153.1306732; Thu, 27 Feb 2025 14:36:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnf06-00062N-OG; Thu, 27 Feb 2025 14:36:34 +0000
Received: by outflank-mailman (input) for mailman id 898153;
 Thu, 27 Feb 2025 14:36:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VKwg=VS=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tnf06-00062H-2a
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 14:36:34 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cc52a1a-f518-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 15:36:32 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5e4ad1d67bdso1412220a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Feb 2025 06:36:32 -0800 (PST)
Received: from localhost ([46.149.103.11]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e4c3b6ccecsm1184876a12.21.2025.02.27.06.36.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2025 06:36:31 -0800 (PST)
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
X-Inumbo-ID: 3cc52a1a-f518-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1740666991; x=1741271791; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4qt8CZK/qRiFpeCQdC2CTaTRGL9JP9NvWs8OP/oh4cI=;
        b=CMDYjPEa/G6ddiHM5tJ4J3+A7dtgN98xTjnPoRmglvh9WOnl8s87cHIm2CezeRGySI
         ycO4uWvdYunjrFRcCDDVGhCRAOfgldtDN9+JnTW2hnf0QQWnUF6U+/MECK+IY+gt4M2N
         0uMLib6nhfG6KQcY/y8S+p6iZizxPeDW0ebC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740666991; x=1741271791;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4qt8CZK/qRiFpeCQdC2CTaTRGL9JP9NvWs8OP/oh4cI=;
        b=Ppg6hJmMfNCdvbsnDPd+JfgDmpKtPPQu8eajGW0NwwMPIdRCm8phspxZJBzyCQHzAz
         j5aqo4APTEr1kbZ5ZnRg316Vo1PEeeotDGi90JQumjLmKEq1JxfVtAxEmd67edhkuWZ5
         Pf66khW25Jy0axSEfKgfoPOhdbOkXZTYiRiFW9zfOCXgYF/U8ALKJiBQxPbwQ3b5FN2z
         CXtoVc5Bnwfyw6pHDK1FpwgVEJ4K8TuyXXmhOrPp2nC4XwZ+ChZywOrgy4IZY7AVzWEj
         enpPGyqsUhwqFNUxCmzWonQRte7XVupwEPfGtKx2iZX2/o/7dy7Ma8lYJOYbB5Ku/VtL
         gPEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhNUQ4B3Zop0+GF2I8R2h4H8SX5yyC2CUlTdHfsGYTToaIHMCHf78KMTbG84bfLaMYGVfrNqqDE/4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz1kODIscvNXB4msRRglx6/G0WjFOFz7jReQYVMkcGsnD+8PEJb
	5NucnzKrsTmz1FGThA/gGzBkhgK7kRByUZ0ylyb/yghXptxH0NW6+1CgdqjsxSM=
X-Gm-Gg: ASbGnctGlx4/9Fblb32CK8pIiEpMJsCDKz5bWhET19zVcYGoe6lzhp1lU2lRGQXYTs1
	kZGfj/sY5wIIBRi2OLRfzJisx6lI1mgP2R6kvs3Xu2/UxB6gX0Jc1mUgQ+yB5oENWxVvBWy7iry
	syMiZdT/OGGqCFJwzlijppNFlTTEA+vej3YtvdrTTKrElQMbrgYlZvLCg+fRThABeOjXqHtsC4R
	V7Mkkd6Zq7jXzfWnROhldZzqFO2GNJPS+1TO4nXxQ/6AvbtINfUHaGyjBx6N82xOkmQm+Hwmvjk
	Tf3Ji+/8+pUTV4/BoFEOwQhDCrKMUrnE
X-Google-Smtp-Source: AGHT+IELuXXNU40WzGOunVC2/PrNse5XRQ5xy4rp2PbdIN8+Fg6hb7CxYQs6PyPNap/WCT8NqSwUzg==
X-Received: by 2002:a05:6402:2548:b0:5e0:34b5:13c0 with SMTP id 4fb4d7f45d1cf-5e4a0d890a4mr10382583a12.19.1740666991402;
        Thu, 27 Feb 2025 06:36:31 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Feb 2025 14:36:30 +0000
Message-Id: <D83AY7ZBKC81.3NBCLVK3DX833@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD"
 <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/page_alloc: Simplify domain_adjust_tot_pages
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20250224132724.9074-1-alejandro.vallejo@cloud.com>
 <D80RCS1Y7AKH.373ULA2LO3MND@cloud.com>
 <4af0077c-c933-4894-bfad-2adda7afbbf7@suse.com>
In-Reply-To: <4af0077c-c933-4894-bfad-2adda7afbbf7@suse.com>

On Wed Feb 26, 2025 at 2:05 PM GMT, Jan Beulich wrote:
> On 24.02.2025 15:49, Alejandro Vallejo wrote:
> > Open question to whoever reviews this...
> >=20
> > On Mon Feb 24, 2025 at 1:27 PM GMT, Alejandro Vallejo wrote:
> >>      spin_lock(&heap_lock);
> >> -    /* adjust domain outstanding pages; may not go negative */
> >> -    dom_before =3D d->outstanding_pages;
> >> -    dom_after =3D dom_before - pages;
> >> -    BUG_ON(dom_before < 0);
> >> -    dom_claimed =3D dom_after < 0 ? 0 : dom_after;
> >> -    d->outstanding_pages =3D dom_claimed;
> >> -    /* flag accounting bug if system outstanding_claims would go nega=
tive */
> >> -    sys_before =3D outstanding_claims;
> >> -    sys_after =3D sys_before - (dom_before - dom_claimed);
> >> -    BUG_ON(sys_after < 0);
> >> -    outstanding_claims =3D sys_after;
> >> +    BUG_ON(outstanding_claims < d->outstanding_pages);
> >> +    if ( pages > 0 && d->outstanding_pages < pages )
> >> +    {
> >> +        /* `pages` exceeds the domain's outstanding count. Zero it ou=
t. */
> >> +        outstanding_claims -=3D d->outstanding_pages;
> >> +        d->outstanding_pages =3D 0;
> >=20
> > While this matches the previous behaviour, do we _really_ want it? It's=
 weird,
> > quirky, and it hard to extend to NUMA-aware claims (which is something =
in
> > midway through).
> >=20
> > Wouldn't it make sense to fail the allocation (earlier) if the claim ha=
s run
> > out? Do we even expect this to ever happen this late in the allocation =
call
> > chain?
>
> This goes back to what a "claim" means. Even without any claim, a domain =
may
> allocate memory. So a claim having run out doesn't imply allocation has t=
o
> fail.

Hmmm... but that violates the purpose of the claim infra as far as I unders=
tand
it. If a domain may overallocate by (e.g) ballooning in memory it can disto=
rt the
ability of another domain to start up, even if it succeeded in its own clai=
m.

We might also break the invariant that total claims are strictly >=3D
total_avail_pages.

I'm somewhat puzzled at the "why" of having separate concepts for max_mem a=
nd
claims. I guess it simply grew the way it did. Reinstating sanity would
probably involve making max_mem effectively the claim, but that's a ton of
work I really would rather not do for now.

>
> NUMA-aware claims require more than an adjustment just here, I expect. Tr=
acking
> of claims (certainly the global, maybe also the per-domain value) would l=
ikely
> need to become per-node, for example.

A fair amount more, yes. I'm preparing a series on the side to address per-=
node
claims and it's far more invasive on page_alloc.c. This function was just
sufficiently impossible to read that I felt the urge to send it ahead of ti=
me
for my own mental health.

>
> Jan

Cheers,
Alejandro

