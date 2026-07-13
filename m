Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hdpTImADVWqNiwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 17:25:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B90C74D000
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 17:25:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=XS4JiRcG;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1361738.1613851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjIW7-000829-Qo; Mon, 13 Jul 2026 15:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361738.1613851; Mon, 13 Jul 2026 15:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjIW7-00080j-NY; Mon, 13 Jul 2026 15:24:23 +0000
Received: by outflank-mailman (input) for mailman id 1361738;
 Mon, 13 Jul 2026 15:24:22 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f5c143537000edb5@swg.vates.tech>)
 id 1wjIW6-00080d-PI
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 15:24:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjIW5-005PX5-OU
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 17:24:21 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f5c143537000edb5@swg.vates.tech>)
 id 6a550318-e002-0a2a0a5209dd-0a2a4505c3ce-38
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 17:24:21 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f5c143537000edb5@swg.vates.tech>)
 id 6a550325-4f1d-0a2a45050019-b9ff1c22a76d-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 17:24:21 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f5c143537000edb5.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 13 Jul 2026 15:24:16 +0000
Received: from l14 (unknown [82.67.99.167])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 39CAE82179;
 Mon, 13 Jul 2026 17:24:15 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=vZCRAzNqG4Uv3PCX6BtUDcx0os4F2gGe1xO2kWjOb4s=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=XS4JiRcGZI7r+o7b6zgbFMVGfE5c57w1CFJWXTSDTLpWHWSM06Pao78mLufnugGBbS0tq8rvS
 qu9cwyROy1+z6dmIHVTtpeoLbhR/bjMwaSlbMdBVtq9DoxPMrZPl3maLk/6Y3fGsjYmx710sA7w
 zPlYcsoS0Q9ch4hYaso/9GS1uRZ90bu2PYhor9rR7vhiWRaPGFSVxwNE+o7weylYwhmEJY+YY3S
 WEOJ3xvrsuWoTNzc9ZS8fuMbYC68TNW8JKA1CcCOa8wvzr3N9v8VVlEO71lpV3jOV7qGyA1+Fep
 lNaJlVzj5qDTs1Bvmq8azenIXMavdUt8SSs3ADx6kWVA==
X-Zone-Loop: 87fe7bd3cb829a34b8cbef349fc223cc18487910c167
x-campaign-type: default
x-transaction-id: 85532df0-dd08-4d09-b83d-4f66ce7095be
x-swg-uid: 01-df483e30-10ba-4091-bbec-589bb8e5d5c9
X-Mailer: Sweego
Message-ID:
 <1783956256.8631fc262581453bbf619ec5b2062170.19f5c143537000edb5@vates.tech>
x-swg-bid: 1783956256.8631fc262581453bbf619ec5b2062170.19f5c143537000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 13 Jul 2026 17:24:14 +0200
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
Subject: Re: [PATCH v8 3/4] libs/guest: allocate various migration arrays
 just once
References: <20260711212128.505727-1-frediano.ziglio@citrix.com>
 <20260711212128.505727-4-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260711212128.505727-4-frediano.ziglio@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.71c.6fcf65e5c3f8b9cd.19f5c1432e0.4994149425db08cd=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783956255457
X-purgate-ID: tlsNG-c201ff/1783956261-63B4F12E-9E6EF779/0/0
X-purgate-type: clean
X-purgate-size: 1724
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:from_mime,vates.tech:url,vates.tech:mid,vates.tech:dkim,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 1B90C74D000

---=Part.71c.6fcf65e5c3f8b9cd.19f5c1432e0.4994149425db08cd=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 11, 2026 at 10:21:27PM +0100, Frediano Ziglio wrote:
> diff --git a/tools/libs/guest/xg_sr_save=2Ec b/tools/libs/guest/xg_sr_sa=
ve=2Ec
> index e7c22e6500=2E=2E34e41cf410 100644
> --- a/tools/libs/guest/xg_sr_save=2Ec
> +++ b/tools/libs/guest/xg_sr_save=2Ec
> @@ -115,24 +115,18 @@ static int write_batch(struct xc_sr_context *ctx)
>      assert(ctx->save=2Ebuffers);
> =20
>      /* Mfns of the batch pfns=2E */
> -    mfns =3D malloc(nr_pfns * sizeof(*mfns));
> +    mfns =3D ctx->save=2Ebuffers->mfns;

You could have done the same thing you did in the previous patch, and
use const pointer ;-)

>      /* Types of the batch pfns=2E */
> -    types =3D malloc(nr_pfns * sizeof(*types));
> +    types =3D ctx->save=2Ebuffers->types;
>      /* Errors from attempting to map the gfns=2E */
> -    errors =3D malloc(nr_pfns * sizeof(*errors));
> +    errors =3D ctx->save=2Ebuffers->errors;
>      /* Pointers to locally allocated pages=2E  Need freeing=2E */
> -    local_pages =3D calloc(nr_pfns, sizeof(*local_pages));
> +    local_pages =3D ctx->save=2Ebuffers->local_pages;
> +    memset(local_pages, 0, sizeof(*local_pages) * nr_pfns);

This memset() looks unnecessary, the buffer is allocated with calloc()
so the page is already cleared=2E And write_batch() clear the array a
second time at the end=2E Did I miss something?

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.71c.6fcf65e5c3f8b9cd.19f5c1432e0.4994149425db08cd=---

