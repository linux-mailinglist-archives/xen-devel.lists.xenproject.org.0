Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wE33G9YHTWpvtwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 16:06:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE64971C51D
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 16:06:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=KNMAIIcz;
	dmarc=pass (policy=none) header.from=vates.tech;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356267.1610903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh6Qu-0003Eo-Kq; Tue, 07 Jul 2026 14:05:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356267.1610903; Tue, 07 Jul 2026 14:05:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh6Qu-0003DJ-HM; Tue, 07 Jul 2026 14:05:56 +0000
Received: by outflank-mailman (input) for mailman id 1356267;
 Tue, 07 Jul 2026 14:05:54 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f3ce63a3200080a8@swg.vates.tech>)
 id 1wh6Qs-0003D9-M6
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 14:05:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh6Qr-004S0H-8S
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 16:05:53 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f3ce63a3200080a8@swg.vates.tech>)
 id 6a4d07b9-2eae-0a2a0a5409dd-0a2a4505a8dc-28
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 16:05:53 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f3ce63a3200080a8@swg.vates.tech>)
 id 6a4d07c0-3cb2-0a2a45050019-b9ff1c128c73-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 16:05:52 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f3ce63a3200080a8.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 07 Jul 2026 14:05:48 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 0373881DCD;
 Tue,  7 Jul 2026 16:05:47 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=TE9+kYqfCnfOjF1iBFqeztokY3ElWOu01UlcUipL4RE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=KNMAIIczwbLQjCx988Nn9ThRg+VDNiWTkczpT14SnjBZSexnS1liyz+iEtjBMHGiVqKP/UzUH
 UZsmGZVjOzONVK6XiVL+4pzW1x+7j+pYnRGGxjsOBlCaogaU14CX7hNlTIR5Hzl27kFcngpSNkC
 0z5Jlrlvj/+f8ydxAFSAP3/mj988Af6zyfQyFMz4K72DZc8tJxq1yAMYdHJbkM9+qnt1sERUQM3
 RRh6hkeGjsaG7T2m4ItVX1Y/qo6Nocx7igC1msNUudareEFHSWhbkTeFmUlzDm1RgEC0XzC95Kn
 9zdSqSUbP+DIJod1NydU7WRwU2fh7xrjtxDtQn/0vFxA==
X-Zone-Loop: 217fcfdc882b2dffc333b01cef5a3fccbb22ec95630e
x-campaign-type: default
x-transaction-id: f61ae23f-a3cc-4477-afc7-995a38185a4a
x-swg-uid: 01-25d4683c-593d-46a8-a718-a4e4f6f36710
X-Mailer: Sweego
Message-ID:
 <1783433149.8631fc262581453bbf619ec5b2062170.19f3ce63a3200080a8@vates.tech>
x-swg-bid: 1783433149.8631fc262581453bbf619ec5b2062170.19f3ce63a3200080a8
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 7 Jul 2026 16:05:47 +0200
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1783432302.8631fc262581453bbf619ec5b2062170.19f3cd94e2d00080a8@vates.tech>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.372.ce9d67684a397b56.19f3ce63715.b25cd7cf8666027f=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783433148181
X-purgate-ID: tlsNG-c201ff/1783433153-14F072B8-355E867E/0/0
X-purgate-type: clean
X-purgate-size: 2174
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
X-Rspamd-Queue-Id: EE64971C51D

---=Part.372.ce9d67684a397b56.19f3ce63715.b25cd7cf8666027f=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 07, 2026 at 03:51:40PM +0200, Anthony PERARD wrote:
> On Fri, Jun 19, 2026 at 02:04:51PM +0100, Frediano Ziglio wrote:
> > From: Edwin T=C3=B6r=C3=B6k <edwin=2Etorok@citrix=2Ecom>
> >=20
> > During migration there are a lot of mmap/munmap calls,
> > because `xc_get_pfn_type_batch` exceeds the default hypercall bounce
> > buffer cache size, and needs to allocate every time it is called=2E
>=20
> I think xc_get_pfn_type_batch() would allocate a buffer of 2 page top,
> in write_batch(), right ?

(because nr_pfns <=3D MAX_BATCH_SIZE, and we allocate
nr_pfns*sizeof(unsigned  long)

> > `munmap` is slow, especially in a PV Dom0 (takes an emulation fault),
> > so is best avoided=2E
> >=20
> > Eventually it'd be good if the memory pool from  xmalloc_tlsf=2Ec
> > was reused here, but for now make it handle the commonly encountered
> > sizes (so far up to 4 pages)=2E

So do you know what would allocate 4 pages?

In anycase, I guess it's ok to keep an allocation of 160kb
for a short while=2E

> > diff --git a/tools/libs/call/buffer=2Ec b/tools/libs/call/buffer=2Ec
> > index 155e4f9d43=2E=2E2f0515c273 100644
> > --- a/tools/libs/call/buffer=2Ec
> > +++ b/tools/libs/call/buffer=2Ec
> > @@ -49,6 +49,9 @@ static void *cache_alloc(xencall_handle *xcall, size=
_t nr_pages)
> >  {
> >      void *p =3D NULL;
> > =20
> > +    if ( nr_pages =3D=3D 0 )
> > +        return NULL;
>=20
> By doing that check here, we don't update the stat anymore=2E And it's
> getting out-of-sync with the updates done in cache_free()=2E
>=20
> Before, we where returning a cache entry for that, and cache_hit++=2E I
> think it's ok to return cache_miss++ instead=2E
>=20

The rest of the patch looks fine to me, and I guess is ok=2E

(and I send the previous mail a bit too soon)

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.372.ce9d67684a397b56.19f3ce63715.b25cd7cf8666027f=---

