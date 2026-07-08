Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F1PlLGtOTmoMKgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 15:19:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 127DF726BB6
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 15:19:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=ckth2ac9;
	dmarc=pass (policy=none) header.from=vates.tech;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1357005.1611510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whSBC-0005KN-PE; Wed, 08 Jul 2026 13:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357005.1611510; Wed, 08 Jul 2026 13:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whSBC-0005Ho-MA; Wed, 08 Jul 2026 13:19:10 +0000
Received: by outflank-mailman (input) for mailman id 1357005;
 Wed, 08 Jul 2026 13:19:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f41e1bde500080a8@swg.vates.tech>)
 id 1whSBB-0005Hf-C7
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 13:19:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whSB9-00A3mN-Qc
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 15:19:07 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f41e1bde500080a8@swg.vates.tech>)
 id 6a4e4e38-2eae-0a2a0a5409dd-0a2a45049f7e-20
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 15:19:07 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f41e1bde500080a8@swg.vates.tech>)
 id 6a4e4e4a-a01d-0a2a45040019-b9ff1c238333-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 15:19:06 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f41e1bde500080a8.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jul 2026 13:19:01 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 464D181F10;
 Wed,  8 Jul 2026 15:19:00 +0200 (CEST)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=MLISvK+adpYUUgBFLpBxliisGNttr4y4ZorJVjzejJo=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=ckth2ac9abjBqZS3wl3esG+2wYmonczciDvhdKQjlXYFmPi5IG5Oe/l27IVlbqesvFKVJOsiJ
 DFXCfREAxT+R9OXg6JG02rm56mf5l4+BTFpKq8iF/jkKGrJzl3z8QaI4c25uSBs40DX42L30rYv
 wpBxd8oz40C8kDNcLluS4cZXbFzCx0TtGLDwGkzVxI1pCd5DJcCHDrngS3c7wX4h1fxnysgfvn1
 0h5XlfnJG8OBZKIQx12jJctYwCZmx+hDKADD5DRDNUKaqLCu22WXptHzB9HLX0hIt2pn53mZeBj
 eFOFBBF9g49wmdDSnXEhZ9xVesn61nEGb6ZHofj4KqfA==
X-Zone-Loop: ab08eac72b7d7f195ec93389e7d48f0fddccc7583b57
x-campaign-type: default
x-transaction-id: 89880a45-2d02-4078-abc3-a7f541ba3656
x-swg-uid: 01-49d4ffd3-86a2-46d8-a383-8ee40a1c1e64
X-Mailer: Sweego
Message-ID:
 <1783516741.8631fc262581453bbf619ec5b2062170.19f41e1bde500080a8@vates.tech>
x-swg-bid: 1783516741.8631fc262581453bbf619ec5b2062170.19f41e1bde500080a8
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 8 Jul 2026 15:19:00 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Edwin =?iso-8859-1?B?VPZy9ms=?= <edwin.torok@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: Re: [PATCH v6 06/16] libs/call: cache up to 4 pages in hypercall
 bounce buffers
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-7-frediano.ziglio@citrix.com>
 <1783432302.8631fc262581453bbf619ec5b2062170.19f3cd94e2d00080a8@vates.tech>
 <CAHt6W4cUTUOw=nsQVYnDBuLMZob0mBaWyjxVrggFWB6tY6LKqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHt6W4cUTUOw=nsQVYnDBuLMZob0mBaWyjxVrggFWB6tY6LKqQ@mail.gmail.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.424.e7715ce4dc5fbd2f.19f41e1bb66.59bb630f3221587c=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783516740454
X-purgate-ID: tlsNG-ebf023/1783516746-ACB3B1CC-759642A4/0/0
X-purgate-type: clean
X-purgate-size: 2642
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:edwin.torok@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jgross@suse.com,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 127DF726BB6

---=Part.424.e7715ce4dc5fbd2f.19f41e1bb66.59bb630f3221587c=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 07, 2026 at 03:47:07PM +0100, Frediano Ziglio wrote:
> On Tue, 7 Jul 2026 at 14:51, Anthony PERARD <anthony=2Eperard@vates=2Ete=
ch> wrote:
> > On Fri, Jun 19, 2026 at 02:04:51PM +0100, Frediano Ziglio wrote:
> > > diff --git a/tools/libs/call/buffer=2Ec b/tools/libs/call/buffer=2Ec
> > > index 155e4f9d43=2E=2E2f0515c273 100644
> > > --- a/tools/libs/call/buffer=2Ec
> > > +++ b/tools/libs/call/buffer=2Ec
> > > @@ -49,6 +49,9 @@ static void *cache_alloc(xencall_handle *xcall, si=
ze_t nr_pages)
> > >  {
> > >      void *p =3D NULL;
> > >
> > > +    if ( nr_pages =3D=3D 0 )
> > > +        return NULL;
> >
> > By doing that check here, we don't update the stat anymore=2E And it's
> > getting out-of-sync with the updates done in cache_free()=2E
> >
> > Before, we where returning a cache entry for that, and cache_hit++=2E =
I
> > think it's ok to return cache_miss++ instead=2E
> >
>=20
> Well=2E=2E=2E requesting 0 pages is weird by definition, even malloc(0) =
is
> not well defined=2E

malloc(0) isn't defined as weird, it is defined as
"implementation-defined" ;-)=2E But the pointer that the cache function
handle isn't from malloc()=2E

> In theory in this case returning NULL would cause cache_free to not be
> called as filtered by xencall_free_buffer_pages=2E

Yes, for cases where the allocator returned NULL=2E But I can't find any
guaranty of this=2E So I would prefer to have both cache_alloc() and
cache_free() behave the same way when faced with nr_pages=3D=3D0, without
hindsight into the value of the pointer=2E

>=20
> I think the most symmetric think would be adding a similar test in
> cache_free, like
>=20
> static int cache_free(xencall_handle *xcall, void *p, size_t nr_pages)
> {
>     int rc =3D 0;
>=20
>     if ( nr_pages =3D=3D 0 )
>         return 1;
>=20
>     cache_lock(xcall);
>=20
>=20
> (the return 1 is needed to prevent the attempt to munmap the pointer
> which does not make sense)=2E

If we have a pointer that is not NULL, we must free it=2E Even if you
think it doesn't make sense=2E Also, there's no way to know, here, whether
munmap() or an other function is going to be used=2E So, cache_free() must
not say that it cached the pointer, and let the caller free it=2E

Cheers,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.424.e7715ce4dc5fbd2f.19f41e1bb66.59bb630f3221587c=---

