Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDupCgui2GnegAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 09:08:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F933D330C
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 09:08:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278395.1563250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB5yv-0000x2-2k; Fri, 10 Apr 2026 07:08:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278395.1563250; Fri, 10 Apr 2026 07:08:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB5yv-0000v4-0B; Fri, 10 Apr 2026 07:08:45 +0000
Received: by outflank-mailman (input) for mailman id 1278395;
 Fri, 10 Apr 2026 07:08:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wB5yt-0000uy-Ds
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 07:08:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB5yq-00BR3l-MW
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 09:08:42 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69d8a1f9-e002-0a2a0a5209dd-0a2a450c9a46-8
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 09:08:42 +0200
Received: from [209.85.218.49] (helo=mail-ej1-f49.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69d8a1fa-f40c-0a2a450c0019-d155da31ccca-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 09:08:42 +0200
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b9c62fc8debso274477466b.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 00:08:42 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1775804922; cv=none;
        d=google.com; s=arc-20240605;
        b=GLX5aaP1WFo8LoO0P+KcHXYfTW28nB8B9WjZ05XgWBh2nQbPeQprRG7uhRfmXF9RNC
         GSOemVwoEfGho7DB5REiqSOeHG8DESvxFqANpqGj50VRnPVFLhsrh2/8lWqdJw3Sq+z8
         KErCdyE0w+oMC5acws4jhs/CFdvYKVLyLOIh6DRwu8ZkRIHGogc/q+LiUAXwBDMYQef1
         Ou9oqGS94aG9Yr4dV5F6unSvumk9x/RWExaM8syjAtyHMJXAZjOcw2Pg2LEcq08xbSOs
         93TWLH5/oo2eDFb7FCDCBcsLrgAQtpQ1hAKYytqIoqe8MK4UXB4Fjii9t6uNnBWsEnT4
         RrLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M6SLpcL9nSATLttfuBBvB9XsHkGoI3gr3My4iJ5sRZA=;
        fh=47x2jc0ju9dZ4is7l1lnFZb2fw4roc4n5S8kQOoHr84=;
        b=XFBh9b3Dehnar0HM5f5oJG8ePn+5owlE9AGRYoe/lt3xZ/i4ZVujzRYxW5tEiCeoDK
         VBhoodd2hE+Ve1h1mwkxnWW1Igk1Dbb4HtTf5yJgi9JWC9rhfnT0EeiWczB9VmEkL2dq
         BbzzvxJGoC6kyFzI1az/gc9YNf6zuF1DifYxBxIwUCDVLjR0Ft3vDCyRcBFDi0tRRmd2
         yV0xW+TLxDUscE7UvYnekeJNh1kmgbC7oRlF6FonY6i7N4rOvs9fQNvPXzV3KlkH2nSW
         V74BtI/RY0EWw7ItwK7Orf0XkA2YMjcSPanV8ocO2IpelJKHQs9M5uwh/6yCEv6yIexx
         6f2w==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775804922; x=1776409722; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6SLpcL9nSATLttfuBBvB9XsHkGoI3gr3My4iJ5sRZA=;
        b=WKzQAJTwePy471MLwRcw28OuzrjRXRGx/LA7j3Q7FXA9qRiaWschm56q4clneEs4e1
         AEq4R2zlKZMXfi2Y1jEAaFS4vCQQYdNIs36kQvKsotyuAvvAG4UNuYFaT+83izSfxfCA
         hypx/AV7B3AoscyJGDnVLPFLSkMD+mgRMhbc+32RxnQqOib+ANd0baqnzzaZRTN1RL+B
         ATPs8G2192OH7FytB5iFphukQkgRjtmY6oUyChcyPYtispuLuQxOcmA4CjgkZ9940azH
         evZ2udl1qhkmA0l+3NvexUkqs2/8svr3wq+Kqx5f47XPRfhL4+Tlp4Ezr53STkLuYvem
         0/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775804922; x=1776409722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M6SLpcL9nSATLttfuBBvB9XsHkGoI3gr3My4iJ5sRZA=;
        b=a8Gza+1GRS9BHOXGXMnb/sM6sGoBB5k66wZ5TxylYj3BfMXKJ4xxXz23RJqnZ11krP
         mbSvHs3dEx6xz75PkrtSl+Qaibrqj9ZKq6RkDtkHCqtuWwiqUWcDA7YrWkwin6DoPIH9
         qGdyTyiWzko5gxeNGwQQIk7SAz4eKW+NLmIT5lIPcJ/B8EkkPXQDX6dtms3dKCgsJTcW
         khhslqetr6zT5uIGItYppDk5gsJBmFaiwIHSm5rHthmWQJdn2pBH0LQvHXq+nVWt9y14
         XFGTph6nPcG81syL2J3nkpeBaRh910Rk/nY1dF8DCqBOv+Jp/mfJoajsu4hjMHmIvEQn
         4KNw==
X-Forwarded-Encrypted: i=1; AJvYcCUpflpGX1CEqj5Hj5IsjUFQFg4qpJrdf6P7KF4eDYccGsInJ5HuTeBAMUgboXlwGFF6CuUU00/l7SY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyd6neCqdxda3Pirxtk7GGp/t7O1/BhWt/6hQfduLlGlEX4Auq/
	0nThfFJJF407M7XX5RazPG59czmi9NfrrBaX25hFwxuE1MXnN2N39LWULHuJo99JDF7wQBS+hPz
	4j24th+meSllSAuiCqF5iBC12MWyhR/c=
X-Gm-Gg: AeBDietS94DhLGm7NWAA/ML5KnpzHpFhvUc0Vk/oUad3a0f9bAA/ayVGHlOOmUtdFQt
	iiM8OhZKn2PcAl8Cgunl33vTkbeXnINTKUgFyO4wGHXVZ6WJ4nP7ZQz2zv5FBcMoxOMO8deGCCQ
	PzL0G5D2SiAclPf1eTf45BHlsb/HrSj+sGLPzexKKzg7JCy17P+19kK5cXpMTTpExr8NhcBKvo8
	fm0B/K0aKRRiEVOcJGzIjoXMWWyh02R/nkqPqEZ6GHP2n6ixIw2uCrPZouyNgGDKW+lY7S4MoF3
	N1unDA==
X-Received: by 2002:a17:906:ef06:b0:b9d:3966:bc23 with SMTP id
 a640c23a62f3a-b9d7297dae2mr101466366b.26.1775804921213; Fri, 10 Apr 2026
 00:08:41 -0700 (PDT)
MIME-Version: 1.0
References: <dba15db692025c75f8bd3a2c5dab2654eaa4e896.1775801199.git.mykola_kvach@epam.com>
 <0c68ca5e-51d3-42ee-aa27-301ffafefc5f@suse.com>
In-Reply-To: <0c68ca5e-51d3-42ee-aa27-301ffafefc5f@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 10 Apr 2026 10:08:29 +0300
X-Gm-Features: AQROBzCQk3ZJBZwlQ7lm0717AorYmOiTTOwMXRgYAR6MXQfXuR7vPoG0Twf-Xt4
Message-ID: <CAGeoDV_S=hQwKyc1aa-X_NZbB2n+QzxUfXpNDcvFehPi8h3adA@mail.gmail.com>
Subject: Re: [PATCH] arm/its: Decode BASER cacheability field before comparing
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Mykyta Poturai <mykyta_poturai@epam.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d25034/1775804922-FDF52A3D-C5E95FD2/0/0
X-purgate-type: clean
X-purgate-size: 1313
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,mail.gmail.com:mid];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:mykyta_poturai@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 93F933D330C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jan,

Thank you for the review.

On Fri, Apr 10, 2026 at 9:40=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 10.04.2026 08:09, Mykola Kvach wrote:
> > --- a/xen/arch/arm/gic-v3-its.c
> > +++ b/xen/arch/arm/gic-v3-its.c
> > @@ -496,7 +496,8 @@ retry:
> >          }
> >          attr =3D regc & BASER_ATTR_MASK;
> >      }
> > -    if ( (regc & GITS_BASER_INNER_CACHEABILITY_MASK) <=3D GIC_BASER_CA=
CHE_nC )
> > +    if ( ((regc & GITS_BASER_INNER_CACHEABILITY_MASK) >>
> > +          GITS_BASER_INNER_CACHEABILITY_SHIFT) <=3D GIC_BASER_CACHE_nC=
 )
>
> Are you aware of MASK_EXTR()? This is one of the cases that we have it fo=
r.
> Really all *_SHIFT constants should be purged, as they can be calculated
> from their *_MASK counterparts (leveraging MASK_{EXTR,INSR}() to keep the
> code readable).

I wasn't aware of this macro, thanks. I will take a look.

>
> Further, doesn't gicv3_lpi_set_proptable() have the same issue with
> GICR_PROPBASER_INNER_CACHEABILITY_MASK?

Fortunately, GIC_BASER_NonShareable is equal to zero, so the condition
there is not affected.

We may want to align that condition for consistency, but I would prefer
to keep this patch focused on the actual bug fix and avoid unrelated
changes.


Best regards,
Mykola

>
> Jan

