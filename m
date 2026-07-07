Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C8NJGYkRTWpBugEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 16:47:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B046F71CD2B
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 16:47:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=T8m6nYDW;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1356310.1610948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh750-0002HV-Cl; Tue, 07 Jul 2026 14:47:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356310.1610948; Tue, 07 Jul 2026 14:47:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh750-0002En-9o; Tue, 07 Jul 2026 14:47:22 +0000
Received: by outflank-mailman (input) for mailman id 1356310;
 Tue, 07 Jul 2026 14:47:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wh74y-0002Ea-K5
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 14:47:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh74x-006cG5-LL
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 16:47:19 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4d1168-2eae-0a2a0a5409dd-0a2a450a8026-34
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 16:47:19 +0200
Received: from [74.125.224.51] (helo=mail-yx1-f51.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4d1176-e40e-0a2a450a0019-4a7de033ec4e-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 16:47:19 +0200
Received: by mail-yx1-f51.google.com with SMTP id
 956f58d0204a3-664d7863920so3529272d50.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 07:47:19 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1783435638; cv=none;
        d=google.com; s=arc-20260327;
        b=CgTpvBQ9wgKanytGJwa2TWM8K6fOSUGRYgMsG3Ll3oNyEa47PGiWcHrAi7DBfqL2yS
         MhPmqK7f87f7gYTitDUKYMDf20SQYhZTb+MDC64p9Z9hlSSBWDR9J5QlJbDUraHpXJ0P
         uqq7wZueqntoebmMDH2hpoByH77twt9lcqH5YCd7+3klN0Vf+diAThTbmjsZhKCVsL+g
         XoNXaIcUCtd1DG1eT+A/FIYokkzImaguCr0T9AM0Z9rVnfk+26UAgsBMnK3Yliw9CbnR
         WviHi2fuNLWI8u4AWI0CsBhR1m732z8MwyUfaQ20rpNmX8Qr3JhJ1kJJUEdC1X65zrUg
         tLaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ilRzyAAMmy3o+36yI2ZCcmkogGYNpjjWNytNdaDq+BQ=;
        fh=/xIDEt21AoDgIoFrvXO7IQvdlvHF73QaNWBe25gcoZE=;
        b=qPqTtsz70wzpps4vUrzCSCMSH7oz3PIKvaCFrUA1nru8+3vAYZOxUAGbdd7NnCNwUW
         7/7YPo5t78rDXQceEFQEuic1cB9GGmA+ZAxCYKxzTraFdhrUU2ss1JpndZKLZsLzf6XS
         qpFYmNgqQlQtdoVw9YdEVHcSsD7E3UvqbI/iUffo6i2OEZM7Pf47Q5ySuGi5DpfAMByn
         ZDn2hXrM1ofvzlR5w+FTaDKM2rx9krpkLF26vVXbPby4In8I4oj+kcM450Vz5bW8/2IN
         jIbFcw5Vjzs/hVMX6+XP7sukc6gHpWpHSC3I0dk85VVwW4d+5AIFu0URNOpfkz31Bx5e
         JLiw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783435638; x=1784040438; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ilRzyAAMmy3o+36yI2ZCcmkogGYNpjjWNytNdaDq+BQ=;
        b=T8m6nYDWyerfMwqAGOdshrEw00JTZyh79Wmc7YDMh4zbSsRJb4b7L5VF32hYoKiRRt
         F7sKx4Ic0voCFFHTOqe7OeJiE+plPB+K9dcaV0VsTfWFHVNmY3ePVxBCCWg+StgMQuay
         zaOTPZpPRCo9f76jyu0d4kIJlzd07lRokIoMmAxlPRsGaDdL5u7TlPGTwbVkJhAvfkS4
         tmxYxgsq5qnBwQ59mo6bbD3sohMeMCSTLZO/m1r5vQ0r2S/OG4Y3+YWFgEmxVHavGAZ3
         a1je6VHt2jLQov8XaPNtDCGN1STIngXLVTrLMHxtN1UsMtVk8bv/sOBcnhppcQXvpz6L
         dFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435638; x=1784040438;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ilRzyAAMmy3o+36yI2ZCcmkogGYNpjjWNytNdaDq+BQ=;
        b=qy9aWwdUu31Pc8yLPcbkqDqG7T2dv7VJXTHTIUr0d12l0Jjfp+BP/nbPMCIrfT+3P3
         gOIlJLze0x4Ee3fgCM9E3WOSd7Ll/zQDrN48qDpo9xevRtFKZfKXm/LNuJF1ry8ldYCC
         zKa/KEGkvhN9Rob3XuGngJuh/NGW4VPcs+F1XHL1hKGn6mi6VgzMdYzTR9riff3H7VK9
         IPVM5mb+1mkLizZqAqaTvdS5irf34kP1cIJZ4vW6hGAtXa3dmywSCpDq7aifHBIO6D7B
         nTbxTfhrsCuYArb4IUJh4F9TNQj9+al6VjpYuzhWDKiwbd+kxjlAIJU8MGP2iR0Yatkg
         kvBA==
X-Gm-Message-State: AOJu0YxUG1tOq67A/z/l6ZLCJmPabLXlKNYeWCW9Bw1Hea2BgFj+dyuR
	SEqMKB0NkAyb1Netkt2+bPJtwJ0a666qRddnL96IhdTSGs8DegpbmHGaauRoGnGws++Vtxz1SDM
	V7W+klf1gTs8qD8qaWMoVsRkBrOahCRE=
X-Gm-Gg: AfdE7clieHEm7WRGFTLtJO461fNOo0dfigKCPGrTO5e0+Vo3ulrdm9p9jWfNLqOtfdQ
	4nT7CMsx5fq3H1WI/zNfT0iTIOiKcfKa8NkzlgRUG9IARW9P14XutylvPL+8xM9agTx+fGRcWfS
	Y/DSC0QIddgTkzH6Gd7BwodxGLyD1vSiSWdDC0Brr6eorrVXLKwlLG7xi8qMq2AOH+m+66LQBus
	D2DZoKgOZm/+R4c9KZPLfSMIfxSRsLjjaEGjW4gK1vgrO4F3bTAriaPQeORvVhQeDvrnhaOEAG1
	tAzBQIAw4n3Jo9/gBcZ2FlV6r0Y=
X-Received: by 2002:a53:a084:0:b0:664:ddca:8183 with SMTP id
 956f58d0204a3-6677fc0145fmr2931408d50.52.1783435637625; Tue, 07 Jul 2026
 07:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-7-frediano.ziglio@citrix.com> <1783432302.8631fc262581453bbf619ec5b2062170.19f3cd94e2d00080a8@vates.tech>
In-Reply-To: <1783432302.8631fc262581453bbf619ec5b2062170.19f3cd94e2d00080a8@vates.tech>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Tue, 7 Jul 2026 15:47:07 +0100
X-Gm-Features: AVVi8Ce4khWM0z7xrgffCDQIXwr2uWmcpCB4ZUU9mZfjfV6HN-u9Xu6Krw0ZSFQ
Message-ID: <CAHt6W4cUTUOw=nsQVYnDBuLMZob0mBaWyjxVrggFWB6tY6LKqQ@mail.gmail.com>
Subject: Re: [PATCH v6 06/16] libs/call: cache up to 4 pages in hypercall
 bounce buffers
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Juergen Gross <jgross@suse.com>, 
	Frediano Ziglio <frediano.ziglio@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-4011c0/1783435639-3DA71DDE-A4C76E9E/0/0
X-purgate-type: clean
X-purgate-size: 7298
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20260327:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:edwin.torok@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jgross@suse.com,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B046F71CD2B

On Tue, 7 Jul 2026 at 14:51, Anthony PERARD <anthony.perard@vates.tech> wro=
te:
>
> On Fri, Jun 19, 2026 at 02:04:51PM +0100, Frediano Ziglio wrote:
> > From: Edwin T=C3=B6r=C3=B6k <edwin.torok@citrix.com>
> >
> > During migration there are a lot of mmap/munmap calls,
> > because `xc_get_pfn_type_batch` exceeds the default hypercall bounce
> > buffer cache size, and needs to allocate every time it is called.
>
> I think xc_get_pfn_type_batch() would allocate a buffer of 2 page top,
> in write_batch(), right ?
>

Yes. That however does not contradict the sense of the sentence (or
even the commit message).

> >
> > `munmap` is slow, especially in a PV Dom0 (takes an emulation fault),
> > so is best avoided.
> >
> > Eventually it'd be good if the memory pool from  xmalloc_tlsf.c
> > was reused here, but for now make it handle the commonly encountered
> > sizes (so far up to 4 pages).
> >

If a program uses 3/4 pages it will use the additional cache, if not
there's no much difference.

> > Signed-off-by: Edwin T=C3=B6r=C3=B6k <edwin.torok@citrix.com>
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> > --
> > Changes since v2:
> > - change prefix in subject.
> >
> > Changes since v4:
> > - fix off-by-one bug.
> >
> > Changes since v5:
> > - avoids potential buffer underflow if nr_pages is 0 calling cache_allo=
c.
> > ---
> >  tools/libs/call/buffer.c  | 31 ++++++++++++++++++++-----------
> >  tools/libs/call/core.c    |  3 ++-
> >  tools/libs/call/private.h |  8 +++++---
> >  3 files changed, 27 insertions(+), 15 deletions(-)
> >
> > diff --git a/tools/libs/call/buffer.c b/tools/libs/call/buffer.c
> > index 155e4f9d43..2f0515c273 100644
> > --- a/tools/libs/call/buffer.c
> > +++ b/tools/libs/call/buffer.c
> > @@ -49,6 +49,9 @@ static void *cache_alloc(xencall_handle *xcall, size_=
t nr_pages)
> >  {
> >      void *p =3D NULL;
> >
> > +    if ( nr_pages =3D=3D 0 )
> > +        return NULL;
>
> By doing that check here, we don't update the stat anymore. And it's
> getting out-of-sync with the updates done in cache_free().
>
> Before, we where returning a cache entry for that, and cache_hit++. I
> think it's ok to return cache_miss++ instead.
>

Well... requesting 0 pages is weird by definition, even malloc(0) is
not well defined.
In theory in this case returning NULL would cause cache_free to not be
called as filtered by xencall_free_buffer_pages.

I think the most symmetric think would be adding a similar test in
cache_free, like

static int cache_free(xencall_handle *xcall, void *p, size_t nr_pages)
{
    int rc =3D 0;

    if ( nr_pages =3D=3D 0 )
        return 1;

    cache_lock(xcall);


(the return 1 is needed to prevent the attempt to munmap the pointer
which does not make sense).

> >      cache_lock(xcall);
> >
> >      xcall->buffer_total_allocations++;
> > @@ -56,13 +59,13 @@ static void *cache_alloc(xencall_handle *xcall, siz=
e_t nr_pages)
> >      if ( xcall->buffer_current_allocations > xcall->buffer_maximum_all=
ocations )
> >          xcall->buffer_maximum_allocations =3D xcall->buffer_current_al=
locations;
> >
> > -    if ( nr_pages > 1 )
> > +    if ( nr_pages > ARRAY_SIZE(xcall->buffer_cache) )
> >      {
> >          xcall->buffer_cache_toobig++;
> >      }
> > -    else if ( xcall->buffer_cache_nr > 0 )
> > +    else if ( xcall->buffer_cache_nr[nr_pages-1] > 0 )
> >      {
> > -        p =3D xcall->buffer_cache[--xcall->buffer_cache_nr];
> > +        p =3D xcall->buffer_cache[nr_pages-1][--xcall->buffer_cache_nr=
[nr_pages-1]];
> >          xcall->buffer_cache_hits++;
> >      }
> >      else
> > @@ -84,10 +87,10 @@ static int cache_free(xencall_handle *xcall, void *=
p, size_t nr_pages)
> >      xcall->buffer_total_releases++;
> >      xcall->buffer_current_allocations--;
> >
> > -    if ( nr_pages =3D=3D 1 &&
> > -         xcall->buffer_cache_nr < BUFFER_CACHE_SIZE )
> > +    if ( nr_pages && nr_pages <=3D ARRAY_SIZE(xcall->buffer_cache) &&
> > +         xcall->buffer_cache_nr[nr_pages-1] < BUFFER_CACHE_SIZE )
> >      {
> > -        xcall->buffer_cache[xcall->buffer_cache_nr++] =3D p;
> > +        xcall->buffer_cache[nr_pages-1][xcall->buffer_cache_nr[nr_page=
s-1]++] =3D p;
> >          rc =3D 1;
> >      }
> >
> > @@ -108,17 +111,23 @@ void buffer_release_cache(xencall_handle *xcall)
> >      DBGPRINTF("current allocations:%d maximum allocations:%d",
> >                xcall->buffer_current_allocations,
> >                xcall->buffer_maximum_allocations);
> > -    DBGPRINTF("cache current size:%d",
> > -              xcall->buffer_cache_nr);
> > +    for ( unsigned i =3D 0; i < ARRAY_SIZE(xcall->buffer_cache_nr); ++=
i )
> > +    {
> > +        DBGPRINTF("cache current size[%u pages]:%d", i+1,
> > +                xcall->buffer_cache_nr[i]);
> > +    }
> >      DBGPRINTF("cache hits:%d misses:%d toobig:%d",
> >                xcall->buffer_cache_hits,
> >                xcall->buffer_cache_misses,
> >                xcall->buffer_cache_toobig);
> >
> > -    while ( xcall->buffer_cache_nr > 0 )
> > +    for ( unsigned i =3D 0; i < ARRAY_SIZE(xcall->buffer_cache_nr); ++=
i )
> >      {
> > -        p =3D xcall->buffer_cache[--xcall->buffer_cache_nr];
> > -        osdep_free_pages(xcall, p, 1);
> > +        while ( xcall->buffer_cache_nr[i] > 0 )
> > +        {
> > +            p =3D xcall->buffer_cache[i][--xcall->buffer_cache_nr[i]];
> > +            osdep_free_pages(xcall, p, i + 1);
> > +        }
> >      }
> >
> >      cache_unlock(xcall);
> > diff --git a/tools/libs/call/core.c b/tools/libs/call/core.c
> > index 02c4f8e1ae..dd8877c1a0 100644
> > --- a/tools/libs/call/core.c
> > +++ b/tools/libs/call/core.c
> > @@ -14,6 +14,7 @@
> >   */
> >
> >  #include <stdlib.h>
> > +#include <string.h>
> >
> >  #include "private.h"
> >
> > @@ -44,7 +45,7 @@ xencall_handle *xencall_open(xentoollog_logger *logge=
r, unsigned open_flags)
> >      xentoolcore__register_active_handle(&xcall->tc_ah);
> >
> >      xcall->flags =3D open_flags;
> > -    xcall->buffer_cache_nr =3D 0;
> > +    memset(xcall->buffer_cache_nr, 0, sizeof(xcall->buffer_cache_nr));
> >
> >      xcall->buffer_total_allocations =3D 0;
> >      xcall->buffer_total_releases =3D 0;
> > diff --git a/tools/libs/call/private.h b/tools/libs/call/private.h
> > index 9c3aa432ef..8e6a208975 100644
> > --- a/tools/libs/call/private.h
> > +++ b/tools/libs/call/private.h
> > @@ -31,13 +31,15 @@ struct xencall_handle {
> >      Xentoolcore__Active_Handle tc_ah;
> >
> >      /*
> > -     * A simple cache of unused, single page, hypercall buffers
> > +     * A simple cache of unused, small, hypercall buffers
> > +     * buffer_cache[i]'s size is (i+1) pages
> >       *
> >       * Protected by a global lock.
> >       */
> >  #define BUFFER_CACHE_SIZE 4
> > -    int buffer_cache_nr;
> > -    void *buffer_cache[BUFFER_CACHE_SIZE];
> > +#define BUFFER_CACHE_NRPAGES 4
> > +    int buffer_cache_nr[BUFFER_CACHE_NRPAGES];
> > +    void *buffer_cache[BUFFER_CACHE_NRPAGES][BUFFER_CACHE_SIZE];
> >
> >      /*
> >       * Hypercall buffer statistics. All protected by the global

Frediano

