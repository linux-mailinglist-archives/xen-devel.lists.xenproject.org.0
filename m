Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGp5IIDY2GnHjAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 13:01:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E85243D5EE3
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 13:01:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278758.1563510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB9bn-0002XQ-P5; Fri, 10 Apr 2026 11:01:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278758.1563510; Fri, 10 Apr 2026 11:01:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB9bn-0002Vj-M7; Fri, 10 Apr 2026 11:01:07 +0000
Received: by outflank-mailman (input) for mailman id 1278758;
 Fri, 10 Apr 2026 11:01:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wB9bm-0002Vd-N2
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 11:01:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB9bm-008Z9e-2o
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 13:01:06 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69d8d86f-2eae-0a2a0a5409dd-0a2a45088328-14
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 13:01:06 +0200
Received: from [209.85.208.178] (helo=mail-lj1-f178.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69d8d871-fab6-0a2a45080019-d155d0b2b4c8-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 13:01:06 +0200
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-38a01c80c34so14463321fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 04:01:05 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1775818865; cv=none;
        d=google.com; s=arc-20240605;
        b=ETk4P9Cu8A7OjaM+1y5/p5tz4phqTZPRnB/sZ/U/ZbUA1+9HBctPkbcRFsvJ2+Z7iS
         l8AnuNcO5QBDx3vS/Oy7LxHfW0ucjbahIx/kUYy1+FFE4l94iOIY/zGctswGy4H+zJaa
         UdVI/VUTuXgVmk7VEgrpsD9lzBxKKynpXfSRU4iuW0yTf4gkucFtJiAKt+yQBKn8I3Zp
         MPsygFwfEO5YmzQtdkttQDpsG9FNJi8OUKs38NJEQGvwkxFLIN7NrvRLfa4EsW00ljB5
         N+6D49+BN/3LcaivLmh4I6q6SD14MEw3rgjTdxE0GPeKYs7w22juniOib2I8QwhncXcQ
         rc0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VYleH/6bNS3B7Eb36TZNMHcXFfh57t+k1jDvOHBcA/Y=;
        fh=8fc33Cv1q2KnWLt7grJfC+5AasR3NZBdZsvhe/UQtIM=;
        b=MQ01DX4m+Kjw+82fm2gyZ6s1SXj4nA7NLe5+yX+El2MPxtq3x8Sagb1b8WT1sM8qdj
         Vkw/OLztqhBAOO3Xz2tYRF5kKNq+0NuD5G6DFHVZN24XGNLrE7IsJMTHfyCgVYM3agtj
         mokByVxMfpZD1kmX4Se4V42qK0D0XVJ1hWN8QsWCuYl4yHDmiqPfHz1ltGB5VlI1/oBf
         lAPy9rlkePEUGrtT2XazJHIi/JUNIzw2uxktvTCTf4iM1NKcUqOzxcsDMgCTqoZf61lQ
         MwBVVpWpyOYnjZzpRokA0t8RXrarxN07LB0ODGuDYLiYCUupiPMGKgEujvQ+HDiIS0ey
         yPdQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775818865; x=1776423665; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYleH/6bNS3B7Eb36TZNMHcXFfh57t+k1jDvOHBcA/Y=;
        b=cD/uoPLdWg3qHi46aJxGZYmQiigIvxlmQ6L7M2WP4hNWd+WVjvngXW9W7Jg2lxmK/H
         NfVW2oT8ppRGyACy3s1I33Fd/frLm/TEuCzFDbJanRE1anNoGMtmi7tsYmDF+9b5O4Bo
         R4thmo+ltbTZaMLzj3B+rLxjyEGibDH4OM/FB1EoPNAzIC5GXVko1EgHDGMau5VZrj+w
         oJibaBtM1jT/JpJ0CBb5jBtYTmeZ9/wHxHQbUt/67Wk7l5YNz/OTJmqmlBrEa/H0qOsu
         dF2Wh7K5X90P6akCGP5vT5pluY1LrLW7cz4GeSfdhA5eUVnnln2N3eKpZHChRSQNwRJE
         0n5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775818865; x=1776423665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VYleH/6bNS3B7Eb36TZNMHcXFfh57t+k1jDvOHBcA/Y=;
        b=jGelZl5T+1573wNFR3hLTnJt7Sg4ijOqBXEPfcbQGlLnWa/iGCT+KHSNni7k4ypEBA
         +FwCwWNpBWq/4IqnK7Cc/0iEZQvBOTuiBdtFIP7MjF8b9h4M2rNfNNk+QT8/XEVnVzaq
         8LeMUAO52+N6Lq25r8ZFL5+3HLTO10N2c3yHa/ovyRsopHji8PwzwsvvX+uMXkPKP7W+
         Dy6JiFDCw8NG4sSKLY5QPRmbilKHQEUmGh8pyCgIHlYX8N0DPOgwIaeQ+buBoDjLTE0J
         +73ElW6N1D/OC/XFQErL/+tPzw0JhdSaFfjDDuvu3Lxc0p4q8eR11qoAu4B+Hw/Q9s7m
         iYzg==
X-Forwarded-Encrypted: i=1; AJvYcCXjeceSSbyNdtDj1hDIesCFh0PNDJZUNbDwo0qC43c2jnYo/DNTt08Lg4hy40Mts1IVwY4n8YkGVnA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyg3d1/dA1x58rRrM8t8glVI5jUBn2Cu/aYXM8nsOIyBIaY8PUX
	odBj4ewUXSBcLPmOj/rABLrxWm724crpBcEX42TKihxgEBLwfH4yzKLgqo9aNkvjyTM1Axl0KOJ
	QNAcoON8Wz9jc2mkpjpduLMpj1CbUlL8=
X-Gm-Gg: AeBDievxXEaIy1JDwuuaDapm6cr5u58ZRvWwl7mvupBjbvQab5IYQdeLK7q77LKROcf
	r9UOGHT+TWKpFlVLJTfKpDmrBzG7Tyv0OrHDDy1iU6z3zKqT/W1txEIkqZy4OraWHyvPswIEKPA
	+Itnsboxxoh6kLLHOkdigCBD3DRbTsBY3KHPt4f3YPDVQQzIoIPU9hGcijxp9lnkpbspXGh3DHv
	Vt6Ww4Pe9AgxWy3JCXjqMugIZQ4Zy03a4KCLraN/kshJpUbGUl8UzLQyevD8Tbjk0Rezkm37Ikn
	v/tt7g==
X-Received: by 2002:a05:651c:503:b0:38c:374f:420d with SMTP id
 38308e7fff4ca-38e4bbf4306mr7718891fa.2.1775818864548; Fri, 10 Apr 2026
 04:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <dba15db692025c75f8bd3a2c5dab2654eaa4e896.1775801199.git.mykola_kvach@epam.com>
 <0c68ca5e-51d3-42ee-aa27-301ffafefc5f@suse.com> <CAGeoDV_S=hQwKyc1aa-X_NZbB2n+QzxUfXpNDcvFehPi8h3adA@mail.gmail.com>
 <1546f5c9-e270-465d-aa0b-4c4c0ec87c8a@suse.com>
In-Reply-To: <1546f5c9-e270-465d-aa0b-4c4c0ec87c8a@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 10 Apr 2026 14:00:52 +0300
X-Gm-Features: AQROBzAKTKxMpShjUBMlXhoA5Zo2soLNnoZXW038yMahzFVpBODqR0SvXpxsQwQ
Message-ID: <CAGeoDV8jUo7mamPbuDPMRrouG85aEAm4PNoOwoXZPeEe+Fmdrw@mail.gmail.com>
Subject: Re: [PATCH] arm/its: Decode BASER cacheability field before comparing
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Mykyta Poturai <mykyta_poturai@epam.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1775818866-76B4C497-A20A4A98/0/0
X-purgate-type: clean
X-purgate-size: 1769
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mail.gmail.com:mid,suse.com:email];
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
X-Rspamd-Queue-Id: E85243D5EE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 1:45=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 10.04.2026 09:08, Mykola Kvach wrote:
> > On Fri, Apr 10, 2026 at 9:40=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >> On 10.04.2026 08:09, Mykola Kvach wrote:
> >>> --- a/xen/arch/arm/gic-v3-its.c
> >>> +++ b/xen/arch/arm/gic-v3-its.c
> >>> @@ -496,7 +496,8 @@ retry:
> >>>          }
> >>>          attr =3D regc & BASER_ATTR_MASK;
> >>>      }
> >>> -    if ( (regc & GITS_BASER_INNER_CACHEABILITY_MASK) <=3D GIC_BASER_=
CACHE_nC )
> >>> +    if ( ((regc & GITS_BASER_INNER_CACHEABILITY_MASK) >>
> >>> +          GITS_BASER_INNER_CACHEABILITY_SHIFT) <=3D GIC_BASER_CACHE_=
nC )
> >>
> >> Are you aware of MASK_EXTR()? This is one of the cases that we have it=
 for.
> >> Really all *_SHIFT constants should be purged, as they can be calculat=
ed
> >> from their *_MASK counterparts (leveraging MASK_{EXTR,INSR}() to keep =
the
> >> code readable).
> >
> > I wasn't aware of this macro, thanks. I will take a look.
> >
> >> Further, doesn't gicv3_lpi_set_proptable() have the same issue with
> >> GICR_PROPBASER_INNER_CACHEABILITY_MASK?
> >
> > Fortunately, GIC_BASER_NonShareable is equal to zero, so the condition
> > there is not affected.
>
> I fear I don't follow. In
>
>     if ( (reg & GICR_PROPBASER_INNER_CACHEABILITY_MASK) <=3D GIC_BASER_CA=
CHE_nC )
>
> where does GIC_BASER_NonShareable come into play?

Sorry, I missed that part of your comment; clearly, I haven't had enough
coffee yet.

You are right: gicv3_lpi_set_proptable() has the exact same issue and
needs fixing too. Thanks for catching that.

It is interesting that we did not hit this during GICv4 testing.


Best regards,
Mykola

>
> Jan

