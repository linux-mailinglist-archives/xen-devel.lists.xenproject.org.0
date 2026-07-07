Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QIJDC5UETWo/tgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 15:52:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7509D71C238
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 15:52:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=mxyMiSvL;
	dmarc=pass (policy=none) header.from=vates.tech;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356238.1610876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh6DG-0000CR-R7; Tue, 07 Jul 2026 13:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356238.1610876; Tue, 07 Jul 2026 13:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh6DG-0000B2-Ns; Tue, 07 Jul 2026 13:51:50 +0000
Received: by outflank-mailman (input) for mailman id 1356238;
 Tue, 07 Jul 2026 13:51:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f3cd94e2d00080a8@swg.vates.tech>)
 id 1wh6DG-0000Aw-20
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 13:51:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh6DE-004yAW-O8
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 15:51:48 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f3cd94e2d00080a8@swg.vates.tech>)
 id 6a4d0472-bab6-0a2a0a5309dd-0a2a450b83cc-10
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 15:51:48 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f3cd94e2d00080a8@swg.vates.tech>)
 id 6a4d0474-ac48-0a2a450b0019-b9ff1c128c3f-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 15:51:48 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f3cd94e2d00080a8.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 07 Jul 2026 13:51:42 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id AB69A81F3D;
 Tue,  7 Jul 2026 15:51:40 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=Bikc+oGbzD6wJLVeV0826zckKsPBVhFcGDPNM64dH8c=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=mxyMiSvLrqfJL/sGMxYundWjkMNK2kOuBAhHGNg6HP7JCrLHNTG61sfSoEurSBvKKF+I8XcW8
 o16tbiZWpLvVvFYvUjwj3YO5m57wgxFtY6/f+UbDQb27813em0ggQjkI6kLr11gHLbSe2qIORaz
 H7YE6lZ2bNaWVBLpLJBY3Kt3oxPF9SU2qxxp2A3cvets51yZ/38Dh5mRFco8gA608EDAMNiW2O8
 bCLu8E+E6iUzCAGOa7k30M9rHYBTzjIjm1tiPsJoQT3UJ6FqQeGTHytL/blj7VEDzm0Cv6UCEHH
 GnUaQsdTuEzRKAwRcE77zZAoKTVOJm0ia+kxiVFN0Bag==
X-Zone-Loop: 5e3fe7671ac580bd10bacd2e2ce877ac2da35a37b44e
x-campaign-type: default
x-transaction-id: a7d7a02b-ccca-48f8-b9fd-c139d26c34ab
x-swg-uid: 01-9c79dd22-ebd5-4fce-9250-3a6f7e796523
X-Mailer: Sweego
Message-ID:
 <1783432302.8631fc262581453bbf619ec5b2062170.19f3cd94e2d00080a8@vates.tech>
x-swg-bid: 1783432302.8631fc262581453bbf619ec5b2062170.19f3cd94e2d00080a8
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 7 Jul 2026 15:51:40 +0200
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260619130501.272832-7-frediano.ziglio@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.36f.25ae320a4161a2c.19f3cd9493f.cacffb04ab93518a=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783432300863
X-purgate-ID: tlsNG-42698a/1783432308-A6324220-13632BC7/0/0
X-purgate-type: clean
X-purgate-size: 6641
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:edwin.torok@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jgross@suse.com,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,vates.tech:from_mime,vates.tech:url,vates.tech:mid,vates.tech:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7509D71C238

---=Part.36f.25ae320a4161a2c.19f3cd9493f.cacffb04ab93518a=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2026 at 02:04:51PM +0100, Frediano Ziglio wrote:
> From: Edwin T=C3=B6r=C3=B6k <edwin=2Etorok@citrix=2Ecom>
>=20
> During migration there are a lot of mmap/munmap calls,
> because `xc_get_pfn_type_batch` exceeds the default hypercall bounce
> buffer cache size, and needs to allocate every time it is called=2E

I think xc_get_pfn_type_batch() would allocate a buffer of 2 page top,
in write_batch(), right ?

>=20
> `munmap` is slow, especially in a PV Dom0 (takes an emulation fault),
> so is best avoided=2E
>=20
> Eventually it'd be good if the memory pool from  xmalloc_tlsf=2Ec
> was reused here, but for now make it handle the commonly encountered
> sizes (so far up to 4 pages)=2E
>=20
> Signed-off-by: Edwin T=C3=B6r=C3=B6k <edwin=2Etorok@citrix=2Ecom>
> Signed-off-by: Frediano Ziglio <frediano=2Eziglio@citrix=2Ecom>
> --
> Changes since v2:
> - change prefix in subject=2E
>=20
> Changes since v4:
> - fix off-by-one bug=2E
>=20
> Changes since v5:
> - avoids potential buffer underflow if nr_pages is 0 calling cache_alloc=
=2E
> ---
>  tools/libs/call/buffer=2Ec  | 31 ++++++++++++++++++++-----------
>  tools/libs/call/core=2Ec    |  3 ++-
>  tools/libs/call/private=2Eh |  8 +++++---
>  3 files changed, 27 insertions(+), 15 deletions(-)
>=20
> diff --git a/tools/libs/call/buffer=2Ec b/tools/libs/call/buffer=2Ec
> index 155e4f9d43=2E=2E2f0515c273 100644
> --- a/tools/libs/call/buffer=2Ec
> +++ b/tools/libs/call/buffer=2Ec
> @@ -49,6 +49,9 @@ static void *cache_alloc(xencall_handle *xcall, size_t=
 nr_pages)
>  {
>      void *p =3D NULL;
> =20
> +    if ( nr_pages =3D=3D 0 )
> +        return NULL;

By doing that check here, we don't update the stat anymore=2E And it's
getting out-of-sync with the updates done in cache_free()=2E

Before, we where returning a cache entry for that, and cache_hit++=2E I
think it's ok to return cache_miss++ instead=2E

>      cache_lock(xcall);
> =20
>      xcall->buffer_total_allocations++;
> @@ -56,13 +59,13 @@ static void *cache_alloc(xencall_handle *xcall, size=
_t nr_pages)
>      if ( xcall->buffer_current_allocations > xcall->buffer_maximum_allo=
cations )
>          xcall->buffer_maximum_allocations =3D xcall->buffer_current_all=
ocations;
> =20
> -    if ( nr_pages > 1 )
> +    if ( nr_pages > ARRAY_SIZE(xcall->buffer_cache) )
>      {
>          xcall->buffer_cache_toobig++;
>      }
> -    else if ( xcall->buffer_cache_nr > 0 )
> +    else if ( xcall->buffer_cache_nr[nr_pages-1] > 0 )
>      {
> -        p =3D xcall->buffer_cache[--xcall->buffer_cache_nr];
> +        p =3D xcall->buffer_cache[nr_pages-1][--xcall->buffer_cache_nr[=
nr_pages-1]];
>          xcall->buffer_cache_hits++;
>      }
>      else
> @@ -84,10 +87,10 @@ static int cache_free(xencall_handle *xcall, void *p=
, size_t nr_pages)
>      xcall->buffer_total_releases++;
>      xcall->buffer_current_allocations--;
> =20
> -    if ( nr_pages =3D=3D 1 &&
> -         xcall->buffer_cache_nr < BUFFER_CACHE_SIZE )
> +    if ( nr_pages && nr_pages <=3D ARRAY_SIZE(xcall->buffer_cache) &&
> +         xcall->buffer_cache_nr[nr_pages-1] < BUFFER_CACHE_SIZE )
>      {
> -        xcall->buffer_cache[xcall->buffer_cache_nr++] =3D p;
> +        xcall->buffer_cache[nr_pages-1][xcall->buffer_cache_nr[nr_pages=
-1]++] =3D p;
>          rc =3D 1;
>      }
> =20
> @@ -108,17 +111,23 @@ void buffer_release_cache(xencall_handle *xcall)
>      DBGPRINTF("current allocations:%d maximum allocations:%d",
>                xcall->buffer_current_allocations,
>                xcall->buffer_maximum_allocations);
> -    DBGPRINTF("cache current size:%d",
> -              xcall->buffer_cache_nr);
> +    for ( unsigned i =3D 0; i < ARRAY_SIZE(xcall->buffer_cache_nr); ++i=
 )
> +    {
> +        DBGPRINTF("cache current size[%u pages]:%d", i+1,
> +                xcall->buffer_cache_nr[i]);
> +    }
>      DBGPRINTF("cache hits:%d misses:%d toobig:%d",
>                xcall->buffer_cache_hits,
>                xcall->buffer_cache_misses,
>                xcall->buffer_cache_toobig);
> =20
> -    while ( xcall->buffer_cache_nr > 0 )
> +    for ( unsigned i =3D 0; i < ARRAY_SIZE(xcall->buffer_cache_nr); ++i=
 )
>      {
> -        p =3D xcall->buffer_cache[--xcall->buffer_cache_nr];
> -        osdep_free_pages(xcall, p, 1);
> +        while ( xcall->buffer_cache_nr[i] > 0 )
> +        {
> +            p =3D xcall->buffer_cache[i][--xcall->buffer_cache_nr[i]];
> +            osdep_free_pages(xcall, p, i + 1);
> +        }
>      }
> =20
>      cache_unlock(xcall);
> diff --git a/tools/libs/call/core=2Ec b/tools/libs/call/core=2Ec
> index 02c4f8e1ae=2E=2Edd8877c1a0 100644
> --- a/tools/libs/call/core=2Ec
> +++ b/tools/libs/call/core=2Ec
> @@ -14,6 +14,7 @@
>   */
> =20
>  #include <stdlib=2Eh>
> +#include <string=2Eh>
> =20
>  #include "private=2Eh"
> =20
> @@ -44,7 +45,7 @@ xencall_handle *xencall_open(xentoollog_logger *logger=
, unsigned open_flags)
>      xentoolcore__register_active_handle(&xcall->tc_ah);
> =20
>      xcall->flags =3D open_flags;
> -    xcall->buffer_cache_nr =3D 0;
> +    memset(xcall->buffer_cache_nr, 0, sizeof(xcall->buffer_cache_nr));
> =20
>      xcall->buffer_total_allocations =3D 0;
>      xcall->buffer_total_releases =3D 0;
> diff --git a/tools/libs/call/private=2Eh b/tools/libs/call/private=2Eh
> index 9c3aa432ef=2E=2E8e6a208975 100644
> --- a/tools/libs/call/private=2Eh
> +++ b/tools/libs/call/private=2Eh
> @@ -31,13 +31,15 @@ struct xencall_handle {
>      Xentoolcore__Active_Handle tc_ah;
> =20
>      /*
> -     * A simple cache of unused, single page, hypercall buffers
> +     * A simple cache of unused, small, hypercall buffers
> +     * buffer_cache[i]'s size is (i+1) pages
>       *
>       * Protected by a global lock=2E
>       */
>  #define BUFFER_CACHE_SIZE 4
> -    int buffer_cache_nr;
> -    void *buffer_cache[BUFFER_CACHE_SIZE];
> +#define BUFFER_CACHE_NRPAGES 4
> +    int buffer_cache_nr[BUFFER_CACHE_NRPAGES];
> +    void *buffer_cache[BUFFER_CACHE_NRPAGES][BUFFER_CACHE_SIZE];
> =20
>      /*
>       * Hypercall buffer statistics=2E All protected by the global
> --=20
> 2=2E43=2E0
>=20
>=20


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.36f.25ae320a4161a2c.19f3cd9493f.cacffb04ab93518a=---

